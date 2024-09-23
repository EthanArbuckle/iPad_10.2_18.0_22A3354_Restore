@implementation LCSLogCommon

void __LCSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LockedContentServices", "Common");
  v1 = (void *)LCSLogCommon___logObj;
  LCSLogCommon___logObj = (uint64_t)v0;

}

@end
