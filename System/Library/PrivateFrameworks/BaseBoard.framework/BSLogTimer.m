@implementation BSLogTimer

void __BSLogTimer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "Timer");
  v1 = (void *)BSLogTimer___logObj;
  BSLogTimer___logObj = (uint64_t)v0;

}

@end
