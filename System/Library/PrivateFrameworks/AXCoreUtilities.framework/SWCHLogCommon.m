@implementation SWCHLogCommon

void __SWCHLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "SWCHCommon");
  v1 = (void *)SWCHLogCommon___logObj;
  SWCHLogCommon___logObj = (uint64_t)v0;

}

@end
