@implementation ZOOMLogCommon

void __ZOOMLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "ZOOMCommon");
  v1 = (void *)ZOOMLogCommon___logObj;
  ZOOMLogCommon___logObj = (uint64_t)v0;

}

@end
