@implementation BSServiceInjectionLog

void __BSServiceInjectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BoardServices", "Injection");
  v1 = (void *)BSServiceInjectionLog___logObj;
  BSServiceInjectionLog___logObj = (uint64_t)v0;

}

@end
