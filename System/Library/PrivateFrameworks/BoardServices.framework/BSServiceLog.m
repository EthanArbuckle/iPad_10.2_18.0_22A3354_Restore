@implementation BSServiceLog

void __BSServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BoardServices", "Common");
  v1 = (void *)BSServiceLog___logObj;
  BSServiceLog___logObj = (uint64_t)v0;

}

@end
