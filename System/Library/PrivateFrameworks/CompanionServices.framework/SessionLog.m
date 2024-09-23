@implementation SessionLog

void __SessionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "Session");
  v1 = (void *)SessionLog_log;
  SessionLog_log = (uint64_t)v0;

}

@end
