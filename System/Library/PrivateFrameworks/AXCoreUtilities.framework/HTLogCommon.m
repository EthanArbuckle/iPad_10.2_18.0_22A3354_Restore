@implementation HTLogCommon

void __HTLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "HTCommon");
  v1 = (void *)HTLogCommon___logObj;
  HTLogCommon___logObj = (uint64_t)v0;

}

@end
