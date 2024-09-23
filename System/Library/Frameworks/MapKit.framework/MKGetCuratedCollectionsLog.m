@implementation MKGetCuratedCollectionsLog

void __MKGetCuratedCollectionsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "CuratedCollections");
  v1 = (void *)MKGetCuratedCollectionsLog_log;
  MKGetCuratedCollectionsLog_log = (uint64_t)v0;

}

@end
