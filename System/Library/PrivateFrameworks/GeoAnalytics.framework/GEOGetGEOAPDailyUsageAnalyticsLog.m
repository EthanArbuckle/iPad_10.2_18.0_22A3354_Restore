@implementation GEOGetGEOAPDailyUsageAnalyticsLog

void __GEOGetGEOAPDailyUsageAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "GEOAPDailyUsage");
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;

}

@end
