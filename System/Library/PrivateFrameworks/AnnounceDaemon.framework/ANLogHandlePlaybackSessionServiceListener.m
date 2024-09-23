@implementation ANLogHandlePlaybackSessionServiceListener

void __ANLogHandlePlaybackSessionServiceListener_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "PlaybackSessionServiceListener");
  v1 = (void *)ANLogHandlePlaybackSessionServiceListener_logger;
  ANLogHandlePlaybackSessionServiceListener_logger = (uint64_t)v0;

}

@end
