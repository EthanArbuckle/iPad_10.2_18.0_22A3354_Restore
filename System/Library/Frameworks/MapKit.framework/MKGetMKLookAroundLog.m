@implementation MKGetMKLookAroundLog

void __MKGetMKLookAroundLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKLookAround");
  v1 = (void *)MKGetMKLookAroundLog_log;
  MKGetMKLookAroundLog_log = (uint64_t)v0;

}

@end
