@implementation ServiceLog

void __ServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "Service");
  v1 = (void *)ServiceLog_log;
  ServiceLog_log = (uint64_t)v0;

}

@end
