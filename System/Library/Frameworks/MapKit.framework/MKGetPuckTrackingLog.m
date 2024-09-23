@implementation MKGetPuckTrackingLog

void __MKGetPuckTrackingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "PuckTracking");
  v1 = (void *)MKGetPuckTrackingLog_log;
  MKGetPuckTrackingLog_log = (uint64_t)v0;

}

@end
