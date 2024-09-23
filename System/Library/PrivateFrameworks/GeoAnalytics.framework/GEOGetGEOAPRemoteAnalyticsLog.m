@implementation GEOGetGEOAPRemoteAnalyticsLog

void __GEOGetGEOAPRemoteAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "GEOAPRemote");
  v1 = (void *)qword_254316CC0;
  qword_254316CC0 = (uint64_t)v0;

}

@end
