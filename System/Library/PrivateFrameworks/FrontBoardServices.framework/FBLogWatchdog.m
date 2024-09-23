@implementation FBLogWatchdog

void __FBLogWatchdog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "Watchdog");
  v1 = (void *)FBLogWatchdog___logObj;
  FBLogWatchdog___logObj = (uint64_t)v0;

}

@end
