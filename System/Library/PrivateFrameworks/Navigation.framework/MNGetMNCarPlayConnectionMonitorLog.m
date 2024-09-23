@implementation MNGetMNCarPlayConnectionMonitorLog

void __MNGetMNCarPlayConnectionMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNCarPlayConnectionMonitor");
  v1 = (void *)MNGetMNCarPlayConnectionMonitorLog_log;
  MNGetMNCarPlayConnectionMonitorLog_log = (uint64_t)v0;

}

@end
