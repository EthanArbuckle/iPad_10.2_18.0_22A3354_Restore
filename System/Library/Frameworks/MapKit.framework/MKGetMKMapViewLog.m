@implementation MKGetMKMapViewLog

void __MKGetMKMapViewLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKMapView");
  v1 = (void *)qword_1EDFB79E8;
  qword_1EDFB79E8 = (uint64_t)v0;

}

@end
