@implementation SetupDebugUserDefaults

uint64_t ____SetupDebugUserDefaults_block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(21, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.appstored.defaultschange", (int *)&__SetupDebugUserDefaults_sToken, v0, &__block_literal_global_43);

  return __ReloadDebugUserDefaults();
}

uint64_t ____SetupDebugUserDefaults_block_invoke_2()
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.appstored"));
  return __ReloadDebugUserDefaults();
}

@end
