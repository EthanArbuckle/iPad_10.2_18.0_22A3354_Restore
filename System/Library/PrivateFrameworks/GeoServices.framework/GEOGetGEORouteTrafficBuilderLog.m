@implementation GEOGetGEORouteTrafficBuilderLog

void __GEOGetGEORouteTrafficBuilderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEORouteTrafficBuilder");
  v1 = (void *)_MergedGlobals_278;
  _MergedGlobals_278 = (uint64_t)v0;

}

@end
