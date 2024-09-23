@implementation AXTTSLogCommon

void __AXTTSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTTSCommon");
  v1 = (void *)AXTTSLogCommon___logObj;
  AXTTSLogCommon___logObj = (uint64_t)v0;

}

@end
