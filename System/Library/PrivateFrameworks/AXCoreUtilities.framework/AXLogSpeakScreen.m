@implementation AXLogSpeakScreen

void __AXLogSpeakScreen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeakScreen");
  v1 = (void *)AXLogSpeakScreen___logObj;
  AXLogSpeakScreen___logObj = (uint64_t)v0;

}

@end
