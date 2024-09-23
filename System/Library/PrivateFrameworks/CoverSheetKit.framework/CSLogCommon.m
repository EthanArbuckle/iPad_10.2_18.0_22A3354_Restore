@implementation CSLogCommon

void __CSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CoverSheetKit", "Common");
  v1 = (void *)CSLogCommon___logObj;
  CSLogCommon___logObj = (uint64_t)v0;

}

@end
