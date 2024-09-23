@implementation AXMediaLogSettings

void __AXMediaLogSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaSettings");
  v1 = (void *)AXMediaLogSettings___logObj;
  AXMediaLogSettings___logObj = (uint64_t)v0;

}

@end
