@implementation ANLogHandleAudioProcessor

void __ANLogHandleAudioProcessor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AudioProcessor");
  v1 = (void *)ANLogHandleAudioProcessor_logger;
  ANLogHandleAudioProcessor_logger = (uint64_t)v0;

}

@end
