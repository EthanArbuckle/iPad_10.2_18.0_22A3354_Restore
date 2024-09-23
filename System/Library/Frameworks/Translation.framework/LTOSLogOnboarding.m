@implementation LTOSLogOnboarding

void ___LTOSLogOnboarding_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Onboarding");
  v1 = (void *)_LTOSLogOnboarding_log;
  _LTOSLogOnboarding_log = (uint64_t)v0;

}

@end
