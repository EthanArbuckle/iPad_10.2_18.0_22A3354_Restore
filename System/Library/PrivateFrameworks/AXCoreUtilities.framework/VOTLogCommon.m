@implementation VOTLogCommon

void __VOTLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTCommon");
  v1 = (void *)VOTLogCommon___logObj;
  VOTLogCommon___logObj = (uint64_t)v0;

}

@end
