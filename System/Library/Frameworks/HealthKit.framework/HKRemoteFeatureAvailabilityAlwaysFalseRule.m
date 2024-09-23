@implementation HKRemoteFeatureAvailabilityAlwaysFalseRule

+ (id)ruleIdentifier
{
  return CFSTR("AlwaysFalse");
}

- (HKRemoteFeatureAvailabilityAlwaysFalseRule)initWithRawValue:(id)a3 dataSource:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKRemoteFeatureAvailabilityAlwaysFalseRule;
  return -[HKRemoteFeatureAvailabilityAlwaysFalseRule init](&v5, sel_init, a3, a4);
}

- (BOOL)evaluate
{
  return 0;
}

@end
