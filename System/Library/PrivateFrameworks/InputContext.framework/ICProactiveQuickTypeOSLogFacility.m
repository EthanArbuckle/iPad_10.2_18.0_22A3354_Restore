@implementation ICProactiveQuickTypeOSLogFacility

void ___ICProactiveQuickTypeOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InputContext", "ProactiveQuickType");
  v1 = (void *)_ICProactiveQuickTypeOSLogFacility_logFacility;
  _ICProactiveQuickTypeOSLogFacility_logFacility = (uint64_t)v0;

}

@end
