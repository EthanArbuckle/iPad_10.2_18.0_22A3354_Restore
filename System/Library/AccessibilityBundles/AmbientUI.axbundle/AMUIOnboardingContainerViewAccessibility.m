@implementation AMUIOnboardingContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMUIOnboardingContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIInfographViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AMUIDataLayerViewController"), CFSTR("AMUIInfographViewControllerDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIDataLayerViewController"), CFSTR("createUnlockRequestForViewController:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIDataLayerViewController"), CFSTR("requestUnlockForViewController:withRequest:completion:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AMUIConcreteUnlockRequest"), CFSTR("AMUnlockRequest"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AMUIConcreteUnlockRequest"), CFSTR("unlockDestination"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIOnboardingContainerView"), CFSTR("onboardingViewRequestsDismissal:"), "v", "@", 0);

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)onboardingViewRequestsDismissal:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingContainerViewAccessibility;
  -[AMUIOnboardingContainerViewAccessibility onboardingViewRequestsDismissal:](&v3, sel_onboardingViewRequestsDismissal_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
