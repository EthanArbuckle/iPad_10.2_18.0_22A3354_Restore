@implementation MKGetApplicationStateMonitorLog

void __MKGetApplicationStateMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "ApplicationStateMonitor");
  v1 = (void *)qword_1ECE2DD48;
  qword_1ECE2DD48 = (uint64_t)v0;

}

@end
