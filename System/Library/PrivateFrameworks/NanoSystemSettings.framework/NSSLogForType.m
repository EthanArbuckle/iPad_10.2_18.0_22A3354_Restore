@implementation NSSLogForType

void __NSSLogForType_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.NanoSystemSettings", "Framework");
  v1 = (void *)NSSLogForType_framework_log;
  NSSLogForType_framework_log = (uint64_t)v0;

  v2 = os_log_create("com.apple.NanoSystemSettings", "Daemon");
  v3 = (void *)NSSLogForType_daemon_log;
  NSSLogForType_daemon_log = (uint64_t)v2;

}

@end
