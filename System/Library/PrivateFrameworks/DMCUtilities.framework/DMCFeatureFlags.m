@implementation DMCFeatureFlags

+ (BOOL)isAppDistributionPVEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDEPPushEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHRNEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMDACoResidencyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMDAMDMManagedEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVisionMDMEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVisionProfileEnrollEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui();
}

+ (BOOL)hasT2
{
  return 1;
}

@end
