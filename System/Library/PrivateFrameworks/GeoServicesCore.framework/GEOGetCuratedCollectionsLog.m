@implementation GEOGetCuratedCollectionsLog

void __GEOGetCuratedCollectionsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "CuratedCollections");
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)v0;

}

@end
