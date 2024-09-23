@implementation SKUIOnboardingAffiliationCirclesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIOnboardingAffiliationCirclesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIOnboardingAffiliationCirclesViewController"), CFSTR("instructionsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIOnboardingInstructionsView"), CFSTR("explanationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIOnboardingInstructionsView"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIOnboardingAffiliationCirclesViewControllerAccessibility;
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("instructionsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIOnboardingAffiliationCirclesViewControllerAccessibility;
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIOnboardingAffiliationCirclesViewControllerAccessibility;
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (UIAccessibilityIsSwitchControlRunning())
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axHandleLayoutChangedTimerFired_, 0, 1, 2.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXLayoutChangedTimerKey"));

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXLayoutChangedTimerKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXLayoutChangedTimerKey"));
  v6.receiver = self;
  v6.super_class = (Class)SKUIOnboardingAffiliationCirclesViewControllerAccessibility;
  -[SKUIOnboardingAffiliationCirclesViewControllerAccessibility viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);

}

- (void)_axHandleLayoutChangedTimerFired:(id)a3
{
  if (UIAccessibilityIsSwitchControlRunning())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
