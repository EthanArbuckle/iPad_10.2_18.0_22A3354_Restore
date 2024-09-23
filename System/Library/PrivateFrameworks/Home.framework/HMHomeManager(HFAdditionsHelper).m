@implementation HMHomeManager(HFAdditionsHelper)

- (id)_cached_lastOnboardingNewFeaturesVersionSeenNumber
{
  return objc_getAssociatedObject(a1, sel__cached_lastOnboardingNewFeaturesVersionSeenNumber);
}

- (id)_cached_hasSeenOnboardingWelcomeViewNumber
{
  return objc_getAssociatedObject(a1, sel__cached_hasSeenOnboardingWelcomeViewNumber);
}

- (void)set_cached_hasSeenOnboardingWelcomeViewNumber:()HFAdditionsHelper
{
  objc_setAssociatedObject(a1, sel__cached_hasSeenOnboardingWelcomeViewNumber, a3, (void *)0x301);
}

- (void)set_cached_lastOnboardingNewFeaturesVersionSeenNumber:()HFAdditionsHelper
{
  objc_setAssociatedObject(a1, sel__cached_lastOnboardingNewFeaturesVersionSeenNumber, a3, (void *)0x301);
}

@end
