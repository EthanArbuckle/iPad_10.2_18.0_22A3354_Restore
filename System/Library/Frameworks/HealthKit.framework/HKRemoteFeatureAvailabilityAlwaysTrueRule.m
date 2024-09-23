@implementation HKRemoteFeatureAvailabilityAlwaysTrueRule

+ (id)ruleIdentifier
{
  return CFSTR("AlwaysTrue");
}

- (HKRemoteFeatureAvailabilityAlwaysTrueRule)initWithRawValue:(id)a3 dataSource:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKRemoteFeatureAvailabilityAlwaysTrueRule;
  return -[HKRemoteFeatureAvailabilityAlwaysTrueRule init](&v5, sel_init, a3, a4);
}

- (BOOL)evaluate
{
  return 1;
}

@end
