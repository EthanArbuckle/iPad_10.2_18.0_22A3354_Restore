@implementation MKGetTransitItemUpdaterLog

void __MKGetTransitItemUpdaterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "TransitItemUpdater");
  v1 = (void *)MKGetTransitItemUpdaterLog_log;
  MKGetTransitItemUpdaterLog_log = (uint64_t)v0;

}

@end
