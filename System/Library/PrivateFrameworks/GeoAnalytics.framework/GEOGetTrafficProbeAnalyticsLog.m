@implementation GEOGetTrafficProbeAnalyticsLog

void __GEOGetTrafficProbeAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "TrafficProbe");
  v1 = (void *)qword_254316C80;
  qword_254316C80 = (uint64_t)v0;

}

@end
