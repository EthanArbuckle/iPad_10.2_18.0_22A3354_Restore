@implementation ANLogHandleAudioSession

void __ANLogHandleAudioSession_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AudioSession");
  v1 = (void *)ANLogHandleAudioSession_logger;
  ANLogHandleAudioSession_logger = (uint64_t)v0;

}

@end
