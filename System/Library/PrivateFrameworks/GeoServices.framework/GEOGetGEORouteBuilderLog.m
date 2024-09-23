@implementation GEOGetGEORouteBuilderLog

void __GEOGetGEORouteBuilderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEORouteBuilder");
  v1 = (void *)_MergedGlobals_254;
  _MergedGlobals_254 = (uint64_t)v0;

}

@end
