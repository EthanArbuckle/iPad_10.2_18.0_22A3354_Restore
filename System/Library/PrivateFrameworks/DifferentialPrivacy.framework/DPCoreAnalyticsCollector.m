@implementation DPCoreAnalyticsCollector

void __43___DPCoreAnalyticsCollector_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_reporter;
  sharedInstance_reporter = v0;

}

@end
