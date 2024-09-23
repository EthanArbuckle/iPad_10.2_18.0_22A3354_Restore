@implementation BKLogCommon

void __BKLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "Common");
  v1 = (void *)BKLogCommon___logObj;
  BKLogCommon___logObj = (uint64_t)v0;

}

@end
