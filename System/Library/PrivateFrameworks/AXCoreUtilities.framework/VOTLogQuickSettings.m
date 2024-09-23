@implementation VOTLogQuickSettings

void __VOTLogQuickSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTQuickSettings");
  v1 = (void *)VOTLogQuickSettings___logObj;
  VOTLogQuickSettings___logObj = (uint64_t)v0;

}

@end
