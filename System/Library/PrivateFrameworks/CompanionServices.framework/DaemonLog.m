@implementation DaemonLog

void __DaemonLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "Daemon");
  v1 = (void *)DaemonLog_log;
  DaemonLog_log = (uint64_t)v0;

}

@end
