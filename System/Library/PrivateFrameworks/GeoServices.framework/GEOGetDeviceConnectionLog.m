@implementation GEOGetDeviceConnectionLog

void __GEOGetDeviceConnectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "DeviceConnection");
  v1 = (void *)qword_1ECDBC468;
  qword_1ECDBC468 = (uint64_t)v0;

}

@end
