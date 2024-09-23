@implementation MCDMusicGeneralLogging

void __MCDMusicGeneralLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MusicCarPlay", "General");
  v1 = (void *)MCDMusicGeneralLogging_facility;
  MCDMusicGeneralLogging_facility = (uint64_t)v0;

}

@end
