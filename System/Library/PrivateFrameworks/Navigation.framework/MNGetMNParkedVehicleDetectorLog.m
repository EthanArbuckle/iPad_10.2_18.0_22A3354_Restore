@implementation MNGetMNParkedVehicleDetectorLog

void __MNGetMNParkedVehicleDetectorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNParkedVehicleDetector");
  v1 = (void *)MNGetMNParkedVehicleDetectorLog_log;
  MNGetMNParkedVehicleDetectorLog_log = (uint64_t)v0;

}

@end
