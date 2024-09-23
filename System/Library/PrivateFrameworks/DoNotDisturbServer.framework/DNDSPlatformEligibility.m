@implementation DNDSPlatformEligibility

+ (BOOL)isIntelligenceAvailable
{
  return sub_1CB94206C() & 1;
}

- (DNDSPlatformEligibility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DNDSPlatformEligibility;
  return -[DNDSPlatformEligibility init](&v3, sel_init);
}

@end
