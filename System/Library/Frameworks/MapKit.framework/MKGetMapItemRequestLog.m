@implementation MKGetMapItemRequestLog

void __MKGetMapItemRequestLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MapItemRequest");
  v1 = (void *)MKGetMapItemRequestLog_log;
  MKGetMapItemRequestLog_log = (uint64_t)v0;

}

@end
