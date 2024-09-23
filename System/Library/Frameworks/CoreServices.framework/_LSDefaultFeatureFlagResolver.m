@implementation _LSDefaultFeatureFlagResolver

+ (id)sharedInstance
{
  if (+[_LSDefaultFeatureFlagResolver sharedInstance]::onceToken != -1)
    dispatch_once(&+[_LSDefaultFeatureFlagResolver sharedInstance]::onceToken, &__block_literal_global_45);
  return (id)+[_LSDefaultFeatureFlagResolver sharedInstance]::resolver;
}

- (BOOL)isFeature:(const char *)a3 enabledInDomain:(const char *)a4
{
  return _os_feature_enabled_impl();
}

@end
