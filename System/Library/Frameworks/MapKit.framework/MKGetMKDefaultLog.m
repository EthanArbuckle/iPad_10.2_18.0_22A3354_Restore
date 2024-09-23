@implementation MKGetMKDefaultLog

void __MKGetMKDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKDefault");
  v1 = (void *)MKGetMKDefaultLog_log;
  MKGetMKDefaultLog_log = (uint64_t)v0;

}

@end
