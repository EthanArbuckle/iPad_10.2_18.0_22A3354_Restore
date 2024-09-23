@implementation GEOGetSystemMonitorLog

void __GEOGetSystemMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "SystemMonitor");
  v1 = (void *)qword_1ECDBCC58;
  qword_1ECDBCC58 = (uint64_t)v0;

}

@end
