@implementation CDPLogSystemAnalytics

void ___CDPLogSystemAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cdp", "analytics");
  v1 = (void *)_CDPLogSystemAnalytics_log;
  _CDPLogSystemAnalytics_log = (uint64_t)v0;

}

@end
