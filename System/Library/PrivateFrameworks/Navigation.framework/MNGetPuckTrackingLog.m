@implementation MNGetPuckTrackingLog

void __MNGetPuckTrackingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "PuckTracking");
  v1 = (void *)MNGetPuckTrackingLog_log;
  MNGetPuckTrackingLog_log = (uint64_t)v0;

}

@end
