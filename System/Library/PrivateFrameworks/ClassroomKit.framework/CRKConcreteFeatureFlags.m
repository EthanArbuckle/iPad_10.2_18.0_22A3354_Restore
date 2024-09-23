@implementation CRKConcreteFeatureFlags

- (BOOL)isDataSeparationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isASMUserCachingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSettingsEnhancedSearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isZeroKeywordSearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)areAppGroupsEnabled
{
  return _os_feature_enabled_impl();
}

@end
