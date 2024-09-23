@implementation BSLogCommon

void __BSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "Common");
  v1 = (void *)BSLogCommon___logObj;
  BSLogCommon___logObj = (uint64_t)v0;

}

@end
