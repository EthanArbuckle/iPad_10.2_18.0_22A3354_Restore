@implementation NPSLoggingDaemonObjectInit

void __NPSLoggingDaemonObjectInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPreferencesSync", "Daemon");
  v1 = (void *)nps_daemon_log;
  nps_daemon_log = (uint64_t)v0;

}

@end
