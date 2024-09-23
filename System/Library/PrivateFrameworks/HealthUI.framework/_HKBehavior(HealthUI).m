@implementation _HKBehavior(HealthUI)

- (uint64_t)hkui_isRunningInHealthApp
{
  if (hkui_isRunningInHealthApp_onceToken != -1)
    dispatch_once(&hkui_isRunningInHealthApp_onceToken, &__block_literal_global_85);
  return hkui_isRunningInHealthApp_isRunningInHealthApp;
}

- (uint64_t)hkui_isRunningInPreferencesApp
{
  if (hkui_isRunningInPreferencesApp_onceToken != -1)
    dispatch_once(&hkui_isRunningInPreferencesApp_onceToken, &__block_literal_global_184_1);
  return hkui_isRunningInPreferencesApp_isRunningInPreferencesApp;
}

- (uint64_t)hkui_isRunningInApp
{
  if (hkui_isRunningInApp_onceToken != -1)
    dispatch_once(&hkui_isRunningInApp_onceToken, &__block_literal_global_187);
  return hkui_isRunningInApp_isRunningInApp;
}

@end
