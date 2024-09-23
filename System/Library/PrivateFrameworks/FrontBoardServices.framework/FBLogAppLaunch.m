@implementation FBLogAppLaunch

void __FBLogAppLaunch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "AppLaunch");
  v1 = (void *)FBLogAppLaunch___logObj;
  FBLogAppLaunch___logObj = (uint64_t)v0;

}

@end
