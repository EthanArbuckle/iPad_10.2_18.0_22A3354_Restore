@implementation AXMediaLogHaptics

void __AXMediaLogHaptics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaHaptics");
  v1 = (void *)AXMediaLogHaptics___logObj;
  AXMediaLogHaptics___logObj = (uint64_t)v0;

}

@end
