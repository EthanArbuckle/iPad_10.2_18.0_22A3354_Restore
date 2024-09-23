@implementation ANLogHandlePlaybackManager

void __ANLogHandlePlaybackManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "PlaybackManager");
  v1 = (void *)ANLogHandlePlaybackManager_logger;
  ANLogHandlePlaybackManager_logger = (uint64_t)v0;

}

@end
