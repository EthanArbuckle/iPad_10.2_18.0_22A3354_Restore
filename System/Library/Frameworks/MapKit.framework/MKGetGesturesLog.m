@implementation MKGetGesturesLog

void __MKGetGesturesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "Gestures");
  v1 = (void *)MKGetGesturesLog_log;
  MKGetGesturesLog_log = (uint64_t)v0;

}

@end
