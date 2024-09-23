@implementation AXLogSettings

void __AXLogSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSettings");
  v1 = (void *)AXLogSettings___logObj;
  AXLogSettings___logObj = (uint64_t)v0;

}

@end
