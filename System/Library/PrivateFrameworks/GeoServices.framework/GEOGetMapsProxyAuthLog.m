@implementation GEOGetMapsProxyAuthLog

void __GEOGetMapsProxyAuthLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "MapsProxyAuth");
  v1 = (void *)_MergedGlobals_341;
  _MergedGlobals_341 = (uint64_t)v0;

}

@end
