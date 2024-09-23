@implementation ABSLogCoreAnalytics

void __ABSLogCoreAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BusinessServices", "CoreAnalytics");
  v1 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = (uint64_t)v0;

}

@end
