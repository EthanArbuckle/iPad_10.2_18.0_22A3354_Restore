@implementation AXMediaLogCommon

void __AXMediaLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaCommon");
  v1 = (void *)AXMediaLogCommon___logObj;
  AXMediaLogCommon___logObj = (uint64_t)v0;

}

@end
