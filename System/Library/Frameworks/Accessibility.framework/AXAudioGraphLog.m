@implementation AXAudioGraphLog

void __AXAudioGraphLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AudioGraph");
  v1 = (void *)AXAudioGraphLog_Log;
  AXAudioGraphLog_Log = (uint64_t)v0;

}

@end
