@implementation GEOGetGEONavdCachePersistenceManagerLog

void __GEOGetGEONavdCachePersistenceManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEONavdCachePersistenceManager");
  v1 = (void *)_MergedGlobals_186;
  _MergedGlobals_186 = (uint64_t)v0;

}

@end
