@implementation MKGetMKLocationManagerLog

void __MKGetMKLocationManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKLocationManager");
  v1 = (void *)qword_1ECE2D8C8;
  qword_1ECE2D8C8 = (uint64_t)v0;

}

@end
