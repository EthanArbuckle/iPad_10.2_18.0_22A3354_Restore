@implementation _HRAtrialFibrillationOnboardingNavigationController

- (HRAtrialFibrillationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingManager, 0);
}

@end
