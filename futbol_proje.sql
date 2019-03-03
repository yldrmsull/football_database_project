-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Dec 07, 2018 at 07:39 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `futbol_proje`
--

-- --------------------------------------------------------

--
-- Table structure for table `detay_gol`
--

CREATE TABLE `detay_gol` (
  `mac_no` int(11) NOT NULL,
  `oyuncu_id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `gol_yari` int(11) NOT NULL,
  `gol_tipi` varchar(1) NOT NULL,
  `gol_süre` int(11) NOT NULL,
  `gol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detay_gol`
--

INSERT INTO `detay_gol` (`mac_no`, `oyuncu_id`, `takim_id`, `gol_yari`, `gol_tipi`, `gol_süre`, `gol_id`) VALUES
(3, 4, 2, 1, 'P', 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `futbol_takimi`
--

CREATE TABLE `futbol_takimi` (
  `takim_id` int(11) NOT NULL,
  `Takim_adi` varchar(30) NOT NULL,
  `lig_id` int(11) NOT NULL,
  `oynadigi_mac` int(11) NOT NULL,
  `galibiyet` int(11) NOT NULL,
  `beraberlik` int(11) NOT NULL,
  `maglubiyet` int(11) NOT NULL,
  `attigi_gol` int(11) NOT NULL,
  `yedigi_gol` int(11) NOT NULL,
  `averaj` int(11) NOT NULL,
  `puan` int(11) NOT NULL,
  `lig_siralamasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `futbol_takimi`
--

INSERT INTO `futbol_takimi` (`takim_id`, `Takim_adi`, `lig_id`, `oynadigi_mac`, `galibiyet`, `beraberlik`, `maglubiyet`, `attigi_gol`, `yedigi_gol`, `averaj`, `puan`, `lig_siralamasi`) VALUES
(2, 'FENERBAHÇE SK.', 1, 36, 35, 1, 0, 105, 1, 104, 106, 1),
(3, 'Paris Saint-Germain', 2, 36, 36, 0, 0, 150, 1, 149, 108, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hakem`
--

CREATE TABLE `hakem` (
  `hakem_id` int(11) NOT NULL,
  `hakem_adi` varchar(30) NOT NULL,
  `ülke_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hakem`
--

INSERT INTO `hakem` (`hakem_id`, `hakem_adi`, `ülke_id`) VALUES
(1, 'Cüneyt Cakir', 1),
(2, 'Henry Cavill', 3);

-- --------------------------------------------------------

--
-- Table structure for table `lig`
--

CREATE TABLE `lig` (
  `lig_id` int(11) NOT NULL,
  `lig_adi` varchar(30) NOT NULL,
  `ülke_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lig`
--

INSERT INTO `lig` (`lig_id`, `lig_adi`, `ülke_id`) VALUES
(1, 'Türkiye Süper Lig', 1),
(2, 'Fransa Ligi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mac`
--

CREATE TABLE `mac` (
  `mac_no` int(11) NOT NULL,
  `mac_tarih` date NOT NULL,
  `hakem_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `sonuc` varchar(20) NOT NULL,
  `ilkyari_uzatma` int(11) NOT NULL,
  `ikinciyari_uzatma` int(11) NOT NULL,
  `macin_adami` int(11) NOT NULL,
  `seyirci_sayisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mac`
--

INSERT INTO `mac` (`mac_no`, `mac_tarih`, `hakem_id`, `stat_id`, `sonuc`, `ilkyari_uzatma`, `ikinciyari_uzatma`, `macin_adami`, `seyirci_sayisi`) VALUES
(2, '2018-12-03', 1, 1, '5-1', 3, 2, 4, 53000),
(3, '2018-12-06', 2, 2, '1-3', 1, 5, 2, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `mac_detay`
--

CREATE TABLE `mac_detay` (
  `mac_no` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `oyuncu_id` int(11) NOT NULL,
  `yardimci_hakem_id` int(11) NOT NULL,
  `galibiyet_maglubiyet` varchar(1) NOT NULL,
  `skor` int(11) NOT NULL,
  `penalti_skor` int(11) NOT NULL,
  `normal_uzatma_zaman` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mac_detay`
--

INSERT INTO `mac_detay` (`mac_no`, `takim_id`, `oyuncu_id`, `yardimci_hakem_id`, `galibiyet_maglubiyet`, `skor`, `penalti_skor`, `normal_uzatma_zaman`) VALUES
(3, 2, 4, 1, 'G', 2, 1, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `mac_kaptani`
--

CREATE TABLE `mac_kaptani` (
  `kaptan_id` int(11) NOT NULL,
  `mac_no` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oyuncu`
--

CREATE TABLE `oyuncu` (
  `oyuncu_id` int(11) NOT NULL,
  `oyuncu_adi` varchar(30) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `pozisyon_id` int(11) NOT NULL,
  `forma_numarasi` int(11) NOT NULL,
  `oyuncu_dogum_tarihi` date NOT NULL,
  `yas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oyuncu`
--

INSERT INTO `oyuncu` (`oyuncu_id`, `oyuncu_adi`, `takim_id`, `pozisyon_id`, `forma_numarasi`, `oyuncu_dogum_tarihi`, `yas`) VALUES
(2, 'VOLKAN DEMIREL', 2, 1, 1, '1980-12-09', 38),
(3, 'Verratti', 3, 6, 6, '1992-05-11', 26),
(4, 'Alex De Souza', 2, 10, 10, '1979-09-10', 39);

-- --------------------------------------------------------

--
-- Table structure for table `oyuncu_degisiklik`
--

CREATE TABLE `oyuncu_degisiklik` (
  `mac_no` int(11) NOT NULL,
  `oyuncu_id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `oyuna_katilim_türü` varchar(1) NOT NULL,
  `oynadigi_yari` int(11) NOT NULL,
  `degisiklik_süre` int(11) NOT NULL,
  `degisiklik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oyuncu_pozisyon`
--

CREATE TABLE `oyuncu_pozisyon` (
  `pozisyon_id` int(11) NOT NULL,
  `pozisyon_adi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oyuncu_pozisyon`
--

INSERT INTO `oyuncu_pozisyon` (`pozisyon_id`, `pozisyon_adi`) VALUES
(1, 'Kaleci'),
(2, 'Stoper'),
(4, 'Sag Bek'),
(5, 'Sol Bek'),
(6, 'Orta Saha'),
(7, 'Sag Kanat'),
(8, 'Sol Kanat'),
(9, 'Ofansif Orta Saha'),
(10, 'Forvet');

-- --------------------------------------------------------

--
-- Table structure for table `oyuncu_süre`
--

CREATE TABLE `oyuncu_süre` (
  `oyuncu_id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `mac_no` int(11) NOT NULL,
  `aldigi_kart` varchar(1) NOT NULL,
  `oyuna_katilim_türü` varchar(1) NOT NULL,
  `aldigi_süre` int(11) NOT NULL,
  `oynadigi_yari` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penalti`
--

CREATE TABLE `penalti` (
  `vurus_id` int(11) NOT NULL,
  `mac_no` int(11) NOT NULL,
  `gol_durumu` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL,
  `oyuncu_id` int(11) NOT NULL,
  `vurus_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stat`
--

CREATE TABLE `stat` (
  `stat_adi` varchar(30) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `sehir_id` int(11) NOT NULL,
  `stat_kapasite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stat`
--

INSERT INTO `stat` (`stat_adi`, `stat_id`, `sehir_id`, `stat_kapasite`) VALUES
('Sükrü Saracoglu', 1, 1, 55000),
('Parc des Princes', 2, 2, 45893);

-- --------------------------------------------------------

--
-- Table structure for table `takim_sehri`
--

CREATE TABLE `takim_sehri` (
  `sehir` varchar(30) NOT NULL,
  `sehir_id` int(11) NOT NULL,
  `ülke_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takim_sehri`
--

INSERT INTO `takim_sehri` (`sehir`, `sehir_id`, `ülke_id`) VALUES
('Istanbul', 1, 1),
('Paris', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `takim_teknik_direktör`
--

CREATE TABLE `takim_teknik_direktör` (
  `teknik_direktör_id` int(11) NOT NULL,
  `takim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takim_teknik_direktör`
--

INSERT INTO `takim_teknik_direktör` (`teknik_direktör_id`, `takim_id`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `takim_ülke`
--

CREATE TABLE `takim_ülke` (
  `ülke_id` int(11) NOT NULL,
  `ülke_siralama` int(11) NOT NULL,
  `ülke_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takim_ülke`
--

INSERT INTO `takim_ülke` (`ülke_id`, `ülke_siralama`, `ülke_name`) VALUES
(1, 1, 'Türkiye'),
(2, 2, 'Ingiltere'),
(3, 3, 'Fransa');

-- --------------------------------------------------------

--
-- Table structure for table `teknik_direktör`
--

CREATE TABLE `teknik_direktör` (
  `teknik_direktör_id` int(11) NOT NULL,
  `teknik_direktör_adi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teknik_direktör`
--

INSERT INTO `teknik_direktör` (`teknik_direktör_id`, `teknik_direktör_adi`) VALUES
(1, 'Aykut Kocaman'),
(2, 'Thomas Tuchel');

-- --------------------------------------------------------

--
-- Table structure for table `yardimci_hakem`
--

CREATE TABLE `yardimci_hakem` (
  `yardimci_hakem_id` int(11) NOT NULL,
  `yardimci_hakem_adi` varchar(30) NOT NULL,
  `ulke_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yardimci_hakem`
--

INSERT INTO `yardimci_hakem` (`yardimci_hakem_id`, `yardimci_hakem_adi`, `ulke_id`) VALUES
(1, 'Ali Palabiyik', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detay_gol`
--
ALTER TABLE `detay_gol`
  ADD UNIQUE KEY `gol_id` (`gol_id`),
  ADD KEY `mac_no1` (`mac_no`),
  ADD KEY `takim_id2` (`takim_id`),
  ADD KEY `oyuncu_id3` (`oyuncu_id`);

--
-- Indexes for table `futbol_takimi`
--
ALTER TABLE `futbol_takimi`
  ADD PRIMARY KEY (`takim_id`),
  ADD KEY `lig_id12` (`lig_id`);

--
-- Indexes for table `hakem`
--
ALTER TABLE `hakem`
  ADD UNIQUE KEY `hakem_id` (`hakem_id`),
  ADD KEY `ülke_id6` (`ülke_id`);

--
-- Indexes for table `lig`
--
ALTER TABLE `lig`
  ADD PRIMARY KEY (`lig_id`),
  ADD KEY `ülke_id33` (`ülke_id`);

--
-- Indexes for table `mac`
--
ALTER TABLE `mac`
  ADD UNIQUE KEY `mac_no` (`mac_no`),
  ADD KEY `stat_id` (`stat_id`),
  ADD KEY `hakem_id11` (`hakem_id`),
  ADD KEY `macinadami` (`macin_adami`);

--
-- Indexes for table `mac_detay`
--
ALTER TABLE `mac_detay`
  ADD KEY `yardimci_hakem` (`yardimci_hakem_id`),
  ADD KEY `mac_no5` (`mac_no`),
  ADD KEY `takim_id6` (`takim_id`),
  ADD KEY `oyuncununidsi` (`oyuncu_id`);

--
-- Indexes for table `mac_kaptani`
--
ALTER TABLE `mac_kaptani`
  ADD KEY `takim_id4` (`takim_id`),
  ADD KEY `kaptan` (`mac_no`);

--
-- Indexes for table `oyuncu`
--
ALTER TABLE `oyuncu`
  ADD UNIQUE KEY `oyuncu_id` (`oyuncu_id`),
  ADD KEY `pozisyon_id` (`pozisyon_id`),
  ADD KEY `takim_id` (`takim_id`);

--
-- Indexes for table `oyuncu_degisiklik`
--
ALTER TABLE `oyuncu_degisiklik`
  ADD KEY `takim_id` (`takim_id`),
  ADD KEY `mac_no` (`mac_no`),
  ADD KEY `oyuncu_id2` (`oyuncu_id`);

--
-- Indexes for table `oyuncu_pozisyon`
--
ALTER TABLE `oyuncu_pozisyon`
  ADD PRIMARY KEY (`pozisyon_id`);

--
-- Indexes for table `oyuncu_süre`
--
ALTER TABLE `oyuncu_süre`
  ADD KEY `oyuncu_id11` (`oyuncu_id`),
  ADD KEY `takim_id11` (`takim_id`),
  ADD KEY `mac_no123` (`mac_no`);

--
-- Indexes for table `penalti`
--
ALTER TABLE `penalti`
  ADD UNIQUE KEY `vurus_id` (`vurus_id`),
  ADD KEY `takim_id12` (`takim_id`),
  ADD KEY `oyuncu_id12` (`oyuncu_id`),
  ADD KEY `mac_no12` (`mac_no`);

--
-- Indexes for table `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`stat_id`),
  ADD UNIQUE KEY `stat_adi` (`stat_adi`),
  ADD KEY `sehir_id` (`sehir_id`);

--
-- Indexes for table `takim_sehri`
--
ALTER TABLE `takim_sehri`
  ADD UNIQUE KEY `sehir_id` (`sehir_id`),
  ADD KEY `ülke_id11` (`ülke_id`);

--
-- Indexes for table `takim_teknik_direktör`
--
ALTER TABLE `takim_teknik_direktör`
  ADD KEY `takim_id3` (`takim_id`),
  ADD KEY `teknik_direktör_id1` (`teknik_direktör_id`);

--
-- Indexes for table `takim_ülke`
--
ALTER TABLE `takim_ülke`
  ADD PRIMARY KEY (`ülke_id`);

--
-- Indexes for table `teknik_direktör`
--
ALTER TABLE `teknik_direktör`
  ADD UNIQUE KEY `teknik_direktör_id` (`teknik_direktör_id`);

--
-- Indexes for table `yardimci_hakem`
--
ALTER TABLE `yardimci_hakem`
  ADD UNIQUE KEY `yardimci_hakem_id` (`yardimci_hakem_id`),
  ADD KEY `ulke_id` (`ulke_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detay_gol`
--
ALTER TABLE `detay_gol`
  MODIFY `gol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `futbol_takimi`
--
ALTER TABLE `futbol_takimi`
  MODIFY `takim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hakem`
--
ALTER TABLE `hakem`
  MODIFY `hakem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lig`
--
ALTER TABLE `lig`
  MODIFY `lig_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mac`
--
ALTER TABLE `mac`
  MODIFY `mac_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oyuncu`
--
ALTER TABLE `oyuncu`
  MODIFY `oyuncu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oyuncu_pozisyon`
--
ALTER TABLE `oyuncu_pozisyon`
  MODIFY `pozisyon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `penalti`
--
ALTER TABLE `penalti`
  MODIFY `vurus_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stat`
--
ALTER TABLE `stat`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `takim_sehri`
--
ALTER TABLE `takim_sehri`
  MODIFY `sehir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `takim_ülke`
--
ALTER TABLE `takim_ülke`
  MODIFY `ülke_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `teknik_direktör`
--
ALTER TABLE `teknik_direktör`
  MODIFY `teknik_direktör_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `yardimci_hakem`
--
ALTER TABLE `yardimci_hakem`
  MODIFY `yardimci_hakem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detay_gol`
--
ALTER TABLE `detay_gol`
  ADD CONSTRAINT `mac_no1` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id3` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id2` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE;

--
-- Constraints for table `futbol_takimi`
--
ALTER TABLE `futbol_takimi`
  ADD CONSTRAINT `lig_id12` FOREIGN KEY (`lig_id`) REFERENCES `lig` (`lig_id`) ON DELETE CASCADE;

--
-- Constraints for table `hakem`
--
ALTER TABLE `hakem`
  ADD CONSTRAINT `ülke_id6` FOREIGN KEY (`ülke_id`) REFERENCES `takim_ülke` (`ülke_id`) ON DELETE CASCADE;

--
-- Constraints for table `lig`
--
ALTER TABLE `lig`
  ADD CONSTRAINT `ülke_id33` FOREIGN KEY (`ülke_id`) REFERENCES `takim_ülke` (`ülke_id`) ON DELETE CASCADE;

--
-- Constraints for table `mac`
--
ALTER TABLE `mac`
  ADD CONSTRAINT `hakem_id11` FOREIGN KEY (`hakem_id`) REFERENCES `hakem` (`hakem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `macinadami` FOREIGN KEY (`macin_adami`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stat_id` FOREIGN KEY (`stat_id`) REFERENCES `stat` (`stat_id`) ON DELETE CASCADE;

--
-- Constraints for table `mac_detay`
--
ALTER TABLE `mac_detay`
  ADD CONSTRAINT `mac_no5` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncununidsi` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id6` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `yardimci_hakem` FOREIGN KEY (`yardimci_hakem_id`) REFERENCES `yardimci_hakem` (`yardimci_hakem_id`) ON DELETE CASCADE;

--
-- Constraints for table `mac_kaptani`
--
ALTER TABLE `mac_kaptani`
  ADD CONSTRAINT `kaptan` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id4` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE;

--
-- Constraints for table `oyuncu`
--
ALTER TABLE `oyuncu`
  ADD CONSTRAINT `oyuncu_ibfk_1` FOREIGN KEY (`pozisyon_id`) REFERENCES `oyuncu_pozisyon` (`pozisyon_id`),
  ADD CONSTRAINT `oyuncu_ibfk_2` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`);

--
-- Constraints for table `oyuncu_degisiklik`
--
ALTER TABLE `oyuncu_degisiklik`
  ADD CONSTRAINT `mac_no` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id2` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE;

--
-- Constraints for table `oyuncu_süre`
--
ALTER TABLE `oyuncu_süre`
  ADD CONSTRAINT `mac_no123` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id1` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id11` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id11` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE;

--
-- Constraints for table `penalti`
--
ALTER TABLE `penalti`
  ADD CONSTRAINT `mac_no12` FOREIGN KEY (`mac_no`) REFERENCES `mac` (`mac_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `oyuncu_id12` FOREIGN KEY (`oyuncu_id`) REFERENCES `oyuncu` (`oyuncu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takim_id12` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE;

--
-- Constraints for table `stat`
--
ALTER TABLE `stat`
  ADD CONSTRAINT `sehir_id` FOREIGN KEY (`sehir_id`) REFERENCES `takim_sehri` (`sehir_id`) ON DELETE CASCADE;

--
-- Constraints for table `takim_sehri`
--
ALTER TABLE `takim_sehri`
  ADD CONSTRAINT `ülke_id11` FOREIGN KEY (`ülke_id`) REFERENCES `takim_ülke` (`ülke_id`) ON DELETE CASCADE;

--
-- Constraints for table `takim_teknik_direktör`
--
ALTER TABLE `takim_teknik_direktör`
  ADD CONSTRAINT `takim_id3` FOREIGN KEY (`takim_id`) REFERENCES `futbol_takimi` (`takim_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teknik_direktör_id` FOREIGN KEY (`teknik_direktör_id`) REFERENCES `teknik_direktör` (`teknik_direktör_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teknik_direktör_id1` FOREIGN KEY (`teknik_direktör_id`) REFERENCES `teknik_direktör` (`teknik_direktör_id`) ON DELETE CASCADE;

--
-- Constraints for table `yardimci_hakem`
--
ALTER TABLE `yardimci_hakem`
  ADD CONSTRAINT `ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `takim_ülke` (`ülke_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
