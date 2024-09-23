@implementation HKECGAvailabilityResult

+ (id)resultWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAdvertiseDirectOnboarding:advertiseDirectOnboardingSecondary:advertiseUpgrade:advertiseUpgradeSecondary:advertiseUpgradeBackgroundDelivered:", a3, a4, a5, a6, a7);
}

+ (id)resultWithNoAdvertisements
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAdvertiseDirectOnboarding:advertiseDirectOnboardingSecondary:advertiseUpgrade:advertiseUpgradeSecondary:advertiseUpgradeBackgroundDelivered:", 0, 0, 0, 0, 0);
}

- (HKECGAvailabilityResult)initWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7
{
  HKECGAvailabilityResult *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKECGAvailabilityResult;
  result = -[HKECGAvailabilityResult init](&v13, sel_init);
  if (result)
  {
    result->_advertiseDirectOnboarding = a3;
    result->_advertiseDirectOnboardingEscapeHatch = a4;
    result->_advertiseUpgrade = a5;
    result->_advertiseUpgradeEscapeHatch = a6;
    result->_advertiseUpgradeBackgroundDelivered = a7;
  }
  return result;
}

- (BOOL)advertiseDirectOnboarding
{
  return self->_advertiseDirectOnboarding;
}

- (BOOL)advertiseDirectOnboardingEscapeHatch
{
  return self->_advertiseDirectOnboardingEscapeHatch;
}

- (BOOL)advertiseUpgrade
{
  return self->_advertiseUpgrade;
}

- (BOOL)advertiseUpgradeEscapeHatch
{
  return self->_advertiseUpgradeEscapeHatch;
}

- (BOOL)advertiseUpgradeBackgroundDelivered
{
  return self->_advertiseUpgradeBackgroundDelivered;
}

@end
