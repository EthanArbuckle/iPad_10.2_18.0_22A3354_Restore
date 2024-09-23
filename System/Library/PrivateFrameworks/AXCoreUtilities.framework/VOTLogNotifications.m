@implementation VOTLogNotifications

void __VOTLogNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTNotifications");
  v1 = (void *)VOTLogNotifications___logObj;
  VOTLogNotifications___logObj = (uint64_t)v0;

}

@end
