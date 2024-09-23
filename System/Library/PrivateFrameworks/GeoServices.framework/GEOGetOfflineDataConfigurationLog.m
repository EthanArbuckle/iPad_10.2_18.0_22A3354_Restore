@implementation GEOGetOfflineDataConfigurationLog

void __GEOGetOfflineDataConfigurationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "OfflineDataConfiguration");
  v1 = (void *)_MergedGlobals_289;
  _MergedGlobals_289 = (uint64_t)v0;

}

@end
