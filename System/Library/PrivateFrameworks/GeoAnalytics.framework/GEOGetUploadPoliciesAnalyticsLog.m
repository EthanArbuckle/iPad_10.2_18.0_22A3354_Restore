@implementation GEOGetUploadPoliciesAnalyticsLog

void __GEOGetUploadPoliciesAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoAnalytics", "UploadPolicies");
  v1 = (void *)qword_254316D00;
  qword_254316D00 = (uint64_t)v0;

}

@end
