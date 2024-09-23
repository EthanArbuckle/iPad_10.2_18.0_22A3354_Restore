@implementation GEOGetGEOPOIEventLog

void __GEOGetGEOPOIEventLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOPOIEvent");
  v1 = (void *)_MergedGlobals_284;
  _MergedGlobals_284 = (uint64_t)v0;

}

@end
