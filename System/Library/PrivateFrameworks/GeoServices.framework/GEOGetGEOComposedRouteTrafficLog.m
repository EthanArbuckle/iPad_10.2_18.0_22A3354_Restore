@implementation GEOGetGEOComposedRouteTrafficLog

void __GEOGetGEOComposedRouteTrafficLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOComposedRouteTraffic");
  v1 = (void *)_MergedGlobals_276;
  _MergedGlobals_276 = (uint64_t)v0;

}

@end
