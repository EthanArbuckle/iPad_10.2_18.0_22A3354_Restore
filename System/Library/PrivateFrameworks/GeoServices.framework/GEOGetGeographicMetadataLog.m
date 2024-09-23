@implementation GEOGetGeographicMetadataLog

void __GEOGetGeographicMetadataLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GeographicMetadata");
  v1 = (void *)_MergedGlobals_311;
  _MergedGlobals_311 = (uint64_t)v0;

}

@end
