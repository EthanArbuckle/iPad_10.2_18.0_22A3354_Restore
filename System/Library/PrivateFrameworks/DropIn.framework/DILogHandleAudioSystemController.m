@implementation DILogHandleAudioSystemController

void __DILogHandleAudioSystemController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "AudioSystemController");
  v1 = (void *)DILogHandleAudioSystemController_logger;
  DILogHandleAudioSystemController_logger = (uint64_t)v0;

}

@end
