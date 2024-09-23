@implementation NUNowPlayingLog

void __NUNowPlayingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "NowPlaying");
  v1 = (void *)NUNowPlayingLog_result;
  NUNowPlayingLog_result = (uint64_t)v0;

}

@end
