@implementation GEOGetGEOAPShowEvalHandlerAnalyticsLog

void __GEOGetGEOAPShowEvalHandlerAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "GEOAPShowEvalHandler");
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = (uint64_t)v0;

}

@end
