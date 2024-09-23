@implementation AXLogSpeakSelection

void __AXLogSpeakSelection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeakSelection");
  v1 = (void *)AXLogSpeakSelection___logObj;
  AXLogSpeakSelection___logObj = (uint64_t)v0;

}

@end
