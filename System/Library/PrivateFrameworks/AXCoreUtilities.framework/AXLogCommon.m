@implementation AXLogCommon

void __AXLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXCommon");
  v1 = (void *)AXLogCommon___logObj;
  AXLogCommon___logObj = (uint64_t)v0;

}

@end
