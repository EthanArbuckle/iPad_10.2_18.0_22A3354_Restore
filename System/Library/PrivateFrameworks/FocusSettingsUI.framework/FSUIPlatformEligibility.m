@implementation FSUIPlatformEligibility

+ (BOOL)isIntelligenceAvailable
{
  return sub_2155125AC() & 1;
}

- (FSUIPlatformEligibility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSUIPlatformEligibility;
  return -[FSUIPlatformEligibility init](&v3, sel_init);
}

@end
