@implementation iOSSetupStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("iOSSetupStartViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("iOSSetupStartViewController"), CFSTR("_dismissButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("iOSSetupStartViewController"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("iOSSetupStartViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)iOSSetupStartViewControllerAccessibility;
  -[iOSSetupStartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[iOSSetupStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[iOSSetupStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetUserTestingIsCancelButton:", 1);

  -[iOSSetupStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iOSSetupStartViewControllerAccessibility;
  -[iOSSetupStartViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[iOSSetupStartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
