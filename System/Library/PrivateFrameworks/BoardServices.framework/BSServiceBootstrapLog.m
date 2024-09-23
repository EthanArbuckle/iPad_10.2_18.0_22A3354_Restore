@implementation BSServiceBootstrapLog

void __BSServiceBootstrapLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BoardServices", "Bootstrap");
  v1 = (void *)BSServiceBootstrapLog___logObj;
  BSServiceBootstrapLog___logObj = (uint64_t)v0;

}

@end
