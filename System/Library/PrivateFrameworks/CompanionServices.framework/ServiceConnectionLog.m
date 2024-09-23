@implementation ServiceConnectionLog

void __ServiceConnectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "ServiceConnection");
  v1 = (void *)ServiceConnectionLog_log;
  ServiceConnectionLog_log = (uint64_t)v0;

}

@end
