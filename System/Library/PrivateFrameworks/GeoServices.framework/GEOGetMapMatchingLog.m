@implementation GEOGetMapMatchingLog

void __GEOGetMapMatchingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "MapMatching");
  v1 = (void *)_MergedGlobals_247;
  _MergedGlobals_247 = (uint64_t)v0;

}

@end
