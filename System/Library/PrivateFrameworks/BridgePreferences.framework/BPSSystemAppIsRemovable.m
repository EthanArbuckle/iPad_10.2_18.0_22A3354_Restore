@implementation BPSSystemAppIsRemovable

void __BPSSystemAppIsRemovable_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.NanoBooks.BridgeSettings"), CFSTR("com.apple.DeepBreathingSettings"), CFSTR("com.apple.NanoCalendarBridgeSettings"), CFSTR("com.apple.Noise.settings"), CFSTR("com.apple.NanoMailBridgeSettings"), CFSTR("com.apple.NanoMapsBridgeSettings"), CFSTR("com.apple.NanoMusicBridgeSettings"), CFSTR("com.apple.private.PodcastsBridgeSettings"), CFSTR("com.apple.NanoBedtimeBridgeSettings"), CFSTR("com.apple.StocksBridgeSettings"), CFSTR("com.apple.tincan.settings"), CFSTR("com.apple.weatherbridgesettings"), CFSTR("com.apple.NanoPassbookBridgeSettings"), CFSTR("com.apple.OxygenSaturationSettings"), CFSTR("com.apple.NanoTipsBridgeSettings"), CFSTR("com.apple.MindSettings"), CFSTR("com.apple.NanoMenstrualCyclesCompanionSettings"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BPSSystemAppIsRemovable_removableSystemAppBundles;
  BPSSystemAppIsRemovable_removableSystemAppBundles = v0;

}

@end
