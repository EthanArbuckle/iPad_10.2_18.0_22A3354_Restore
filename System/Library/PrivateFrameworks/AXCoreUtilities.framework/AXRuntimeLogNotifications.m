@implementation AXRuntimeLogNotifications

void __AXRuntimeLogNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXRuntimeNotifications");
  v1 = (void *)AXRuntimeLogNotifications___logObj;
  AXRuntimeLogNotifications___logObj = (uint64_t)v0;

}

@end
