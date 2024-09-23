@implementation AXLogAudioRouting

void __AXLogAudioRouting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAudioRouting");
  v1 = (void *)AXLogAudioRouting___logObj;
  AXLogAudioRouting___logObj = (uint64_t)v0;

}

@end
