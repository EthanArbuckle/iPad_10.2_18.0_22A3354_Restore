@implementation LA

void __LA_LOG_LACUIPackagedViewPlatformStateController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LACUIPackagedViewPlatformStateController");
  v1 = (void *)LA_LOG_LACUIPackagedViewPlatformStateController_log;
  LA_LOG_LACUIPackagedViewPlatformStateController_log = (uint64_t)v0;

}

void __LA_LOG_LACUIPackagedViewStateController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LACUIPackagedViewStateController");
  v1 = (void *)LA_LOG_LACUIPackagedViewStateController_log;
  LA_LOG_LACUIPackagedViewStateController_log = (uint64_t)v0;

}

void __LA_LOG_LACUIPackagedView_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LACUIPackagedView");
  v1 = (void *)LA_LOG_LACUIPackagedView_log;
  LA_LOG_LACUIPackagedView_log = (uint64_t)v0;

}

@end
