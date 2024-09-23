@implementation CHFeatureFlags

- (BOOL)increaseCallHistoryEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)callHistorySearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)protectedAppsEnabled
{
  return _os_feature_enabled_impl();
}

@end
