@implementation MNGetMNVehicleMonitorLog

void __MNGetMNVehicleMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNVehicleMonitor");
  v1 = (void *)MNGetMNVehicleMonitorLog_log;
  MNGetMNVehicleMonitorLog_log = (uint64_t)v0;

}

@end
