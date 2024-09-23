@implementation ATXFeatureFlags

+ (BOOL)isContextualEngineEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isZKWHideContextsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTimelineEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSportsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFocusUserSetupPredictionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDigitalBalanceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNotificationCategorizationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBreakthroughDataCollectionEnabled
{
  return _os_feature_enabled_impl();
}

@end
