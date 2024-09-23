@implementation GEOGetDataSessionURLLog

void __GEOGetDataSessionURLLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "DataSessionURL");
  v1 = (void *)_MergedGlobals_233;
  _MergedGlobals_233 = (uint64_t)v0;

}

@end
