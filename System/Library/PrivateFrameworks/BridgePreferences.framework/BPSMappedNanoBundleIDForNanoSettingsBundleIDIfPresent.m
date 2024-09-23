@implementation BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent

void ___BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[27];
  _QWORD v3[28];

  v3[27] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.NanoMapsBridgeSettings");
  v2[1] = CFSTR("com.apple.NanoMusicBridgeSettings");
  v3[0] = CFSTR("com.apple.NanoMaps");
  v3[1] = CFSTR("com.apple.NanoMusic");
  v2[2] = CFSTR("com.apple.NanoMailBridgeSettings");
  v2[3] = CFSTR("com.apple.NanoPassbookBridgeSettings");
  v3[2] = CFSTR("com.apple.NanoMail");
  v3[3] = CFSTR("com.apple.NanoPassbook");
  v2[4] = CFSTR("com.apple.NanoPhotosBridgeSettings");
  v2[5] = CFSTR("com.apple.NanoContactsBridgeSettingsPaired");
  v3[4] = CFSTR("com.apple.NanoPhotos");
  v3[5] = CFSTR("com.apple.MobileAddressBook");
  v2[6] = CFSTR("com.apple.NanoContactsBridgeSettingsTinker");
  v2[7] = CFSTR("com.apple.NanoBedtimeBridgeSettings");
  v3[6] = CFSTR("com.apple.MobileAddressBook");
  v3[7] = CFSTR("com.apple.NanoSleep.watchkitapp");
  v2[8] = CFSTR("com.apple.MessagesBridgeSettings");
  v2[9] = CFSTR("com.apple.NanoClockBridgeSettings");
  v3[8] = CFSTR("com.apple.MobileSMS");
  v3[9] = CFSTR("com.apple.NanoAlarm");
  v2[10] = CFSTR("com.apple.PhoneBridgeSettings");
  v2[11] = CFSTR("com.apple.NanoCalendarBridgeSettings");
  v3[10] = CFSTR("com.apple.NanoPhone");
  v3[11] = CFSTR("com.apple.NanoCalendar");
  v2[12] = CFSTR("com.apple.weatherbridgesettings");
  v2[13] = CFSTR("com.apple.StocksBridgeSettings");
  v3[12] = CFSTR("com.apple.weather.watchapp");
  v3[13] = CFSTR("com.apple.stocks.watchapp");
  v2[14] = CFSTR("com.apple.HealthAppsSettings");
  v2[15] = CFSTR("com.apple.SessionTrackerAppSettings");
  v3[14] = CFSTR("com.apple.ActivityMonitorApp");
  v3[15] = CFSTR("com.apple.SessionTrackerApp");
  v2[16] = CFSTR("com.apple.DeepBreathingSettings");
  v2[17] = CFSTR("com.apple.HeartRateSettings");
  v3[16] = CFSTR("com.apple.DeepBreathing");
  v3[17] = CFSTR("com.apple.HeartRate");
  v2[18] = CFSTR("com.apple.tincan.settings");
  v2[19] = CFSTR("com.apple.Noise.settings");
  v3[18] = CFSTR("com.apple.tincan");
  v3[19] = CFSTR("com.apple.Noise");
  v2[20] = CFSTR("com.apple.NanoBooks.BridgeSettings");
  v2[21] = CFSTR("com.apple.private.PodcastsBridgeSettings");
  v3[20] = CFSTR("com.apple.NanoBooks");
  v3[21] = CFSTR("com.apple.podcasts");
  v2[22] = CFSTR("com.apple.OxygenSaturationSettings");
  v2[23] = CFSTR("com.apple.MindSettings");
  v3[22] = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
  v3[23] = CFSTR("com.apple.Mind");
  v2[24] = CFSTR("com.apple.NanoTipsBridgeSettings");
  v2[25] = CFSTR("com.apple.NanoMenstrualCyclesCompanionSettings");
  v3[24] = CFSTR("com.apple.NanoTips");
  v3[25] = CFSTR("com.apple.NanoMenstrualCycles");
  v2[26] = CFSTR("com.apple.DepthCompanionSettings");
  v3[26] = CFSTR("com.apple.Depth");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 27);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_mapping;
  _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_mapping = v0;

}

@end
