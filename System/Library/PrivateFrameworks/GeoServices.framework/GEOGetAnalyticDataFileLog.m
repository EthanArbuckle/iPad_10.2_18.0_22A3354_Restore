@implementation GEOGetAnalyticDataFileLog

void __GEOGetAnalyticDataFileLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "AnalyticDataFile");
  v1 = (void *)_MergedGlobals_267;
  _MergedGlobals_267 = (uint64_t)v0;

}

@end
