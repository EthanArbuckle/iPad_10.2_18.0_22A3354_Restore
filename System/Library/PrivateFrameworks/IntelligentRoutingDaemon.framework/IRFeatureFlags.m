@implementation IRFeatureFlags

+ (id)sharedFeatureFlags
{
  if (sharedFeatureFlags_onceToken != -1)
    dispatch_once(&sharedFeatureFlags_onceToken, &__block_literal_global_20);
  return (id)sharedFeatureFlags_featureFlags;
}

void __36__IRFeatureFlags_sharedFeatureFlags__block_invoke()
{
  IRFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(IRFeatureFlags);
  v1 = (void *)sharedFeatureFlags_featureFlags;
  sharedFeatureFlags_featureFlags = (uint64_t)v0;

}

- (void)_checkForUnitTestingWithFeatureName:(id)a3
{
  +[IRPlatformInfo isRunningInUnitTesting](IRPlatformInfo, "isRunningInUnitTesting", a3);
}

- (BOOL)isServiceFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("service"));
  if (isServiceFeatureEnabled_onceToken != -1)
    dispatch_once(&isServiceFeatureEnabled_onceToken, &__block_literal_global_3);
  return isServiceFeatureEnabled_enabled;
}

void __41__IRFeatureFlags_isServiceFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isServiceFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isServiceFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] service: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isPickerPrioritizationFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("pickerPrioritization"));
  if (isPickerPrioritizationFeatureEnabled_onceToken != -1)
    dispatch_once(&isPickerPrioritizationFeatureEnabled_onceToken, &__block_literal_global_12_0);
  return isPickerPrioritizationFeatureEnabled_enabled;
}

void __54__IRFeatureFlags_isPickerPrioritizationFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isPickerPrioritizationFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isPickerPrioritizationFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] pickerPrioritization: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isSuggestedRoutingFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("suggestedRouting"));
  if (isSuggestedRoutingFeatureEnabled_onceToken != -1)
    dispatch_once(&isSuggestedRoutingFeatureEnabled_onceToken, &__block_literal_global_16);
  return isSuggestedRoutingFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isSuggestedRoutingFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isSuggestedRoutingFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isSuggestedRoutingFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] suggestedRouting: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAutomaticRoutingFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("automaticRouting"));
  if (isAutomaticRoutingFeatureEnabled_onceToken != -1)
    dispatch_once(&isAutomaticRoutingFeatureEnabled_onceToken, &__block_literal_global_20);
  return isAutomaticRoutingFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isAutomaticRoutingFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isAutomaticRoutingFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isAutomaticRoutingFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] automaticRouting: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isSuggestedControlFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("suggestedControl"));
  if (isSuggestedControlFeatureEnabled_onceToken != -1)
    dispatch_once(&isSuggestedControlFeatureEnabled_onceToken, &__block_literal_global_24);
  return isSuggestedControlFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isSuggestedControlFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isSuggestedControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isSuggestedControlFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] suggestedControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAutomaticControlFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("automaticControl"));
  if (isAutomaticControlFeatureEnabled_onceToken != -1)
    dispatch_once(&isAutomaticControlFeatureEnabled_onceToken, &__block_literal_global_28);
  return isAutomaticControlFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isAutomaticControlFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isAutomaticControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isAutomaticControlFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] automaticControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isTVRemoteControlFeatureEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("tvRemoteControl"));
  if (isTVRemoteControlFeatureEnabled_onceToken != -1)
    dispatch_once(&isTVRemoteControlFeatureEnabled_onceToken, &__block_literal_global_32_0);
  return isTVRemoteControlFeatureEnabled_enabled;
}

void __49__IRFeatureFlags_isTVRemoteControlFeatureEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isTVRemoteControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isTVRemoteControlFeatureEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] tvRemoteControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAggressiveFilteringEnabled
{
  -[IRFeatureFlags _checkForUnitTestingWithFeatureName:](self, "_checkForUnitTestingWithFeatureName:", CFSTR("cilantro_show_less"));
  if (isAggressiveFilteringEnabled_onceToken != -1)
    dispatch_once(&isAggressiveFilteringEnabled_onceToken, &__block_literal_global_36);
  return isAggressiveFilteringEnabled_enabled;
}

void __46__IRFeatureFlags_isAggressiveFilteringEnabled__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  isAggressiveFilteringEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isAggressiveFilteringEnabled_enabled)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] cilantro_show_less: %@", (uint8_t *)&v2, 0xCu);
  }
}

@end
