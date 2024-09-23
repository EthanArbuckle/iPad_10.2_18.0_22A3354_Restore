@implementation AAFLogSystemAnalytics

void ___AAFLogSystemAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.aaafoundation.analytics", "analytics");
  v1 = (void *)_AAFLogSystemAnalytics_log;
  _AAFLogSystemAnalytics_log = (uint64_t)v0;

}

@end
