@implementation NANowPlayingLog

void __NANowPlayingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "NowPlaying");
  v1 = (void *)NANowPlayingLog_result;
  NANowPlayingLog_result = (uint64_t)v0;

}

@end
