@implementation AXMediaLogTracking

void __AXMediaLogTracking_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaTracking");
  v1 = (void *)AXMediaLogTracking___logObj;
  AXMediaLogTracking___logObj = (uint64_t)v0;

}

@end
