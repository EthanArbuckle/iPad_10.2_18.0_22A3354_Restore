@implementation GEOGetNetworkRequestLog

void __GEOGetNetworkRequestLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "NetworkRequest");
  v1 = (void *)_MergedGlobals_182;
  _MergedGlobals_182 = (uint64_t)v0;

}

@end
