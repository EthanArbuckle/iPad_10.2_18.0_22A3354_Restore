@implementation AEFeatureFlagsProvider

- (id)makeFeatureFlags
{
  return (id)objc_opt_new();
}

@end
