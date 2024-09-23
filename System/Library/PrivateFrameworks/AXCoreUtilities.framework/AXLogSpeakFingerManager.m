@implementation AXLogSpeakFingerManager

void __AXLogSpeakFingerManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeakFingerManager");
  v1 = (void *)AXLogSpeakFingerManager___logObj;
  AXLogSpeakFingerManager___logObj = (uint64_t)v0;

}

@end
