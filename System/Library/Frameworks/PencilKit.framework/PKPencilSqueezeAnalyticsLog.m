@implementation PKPencilSqueezeAnalyticsLog

void __PKPencilSqueezeAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PencilKit", "PencilSqueezeAnalytics");
  v1 = (void *)PKPencilSqueezeAnalyticsLog_log;
  PKPencilSqueezeAnalyticsLog_log = (uint64_t)v0;

}

@end
