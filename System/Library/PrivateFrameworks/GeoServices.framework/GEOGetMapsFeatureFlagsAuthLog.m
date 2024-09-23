@implementation GEOGetMapsFeatureFlagsAuthLog

void __GEOGetMapsFeatureFlagsAuthLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "MapsFeatureFlagsAuth");
  v1 = (void *)_MergedGlobals_193;
  _MergedGlobals_193 = (uint64_t)v0;

}

@end
