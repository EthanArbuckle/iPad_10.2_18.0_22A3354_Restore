@implementation FBLogCommon

void __FBLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "Common");
  v1 = (void *)FBLogCommon___logObj;
  FBLogCommon___logObj = (uint64_t)v0;

}

@end
