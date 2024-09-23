@implementation GEOGetGEOAPSequenceStateAnalyticsLog

void __GEOGetGEOAPSequenceStateAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "GEOAPSequenceState");
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v0;

}

@end
