@implementation CAFNowPlayingLogging

void __CAFNowPlayingLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "NowPlaying");
  v1 = (void *)CAFNowPlayingLogging_facility;
  CAFNowPlayingLogging_facility = (uint64_t)v0;

}

@end
