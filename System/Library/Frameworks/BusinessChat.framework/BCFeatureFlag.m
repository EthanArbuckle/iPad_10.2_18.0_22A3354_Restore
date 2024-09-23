@implementation BCFeatureFlag

+ (BOOL)isFeatureEnabledForFeature:(int64_t)a3
{
  if (a3 == 1)
    return _os_feature_enabled_impl();
  else
    return 0;
}

@end
