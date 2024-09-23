@implementation BKLogAlternateSystemApp

void __BKLogAlternateSystemApp_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "AlternateSystemApp");
  v1 = (void *)BKLogAlternateSystemApp___logObj;
  BKLogAlternateSystemApp___logObj = (uint64_t)v0;

}

@end
