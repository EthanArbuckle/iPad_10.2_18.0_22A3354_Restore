@implementation BPSSetupPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BPSSetupPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupPageViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupPageViewController"), CFSTR("updateTitleLabel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BPSSetupPageViewController"), CFSTR("_titleLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  -[BPSSetupPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[BPSSetupPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  -[BPSSetupPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityServesAsFirstElement:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  -[BPSSetupPageViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BPSSetupPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)updateTitleLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  -[BPSSetupPageViewControllerAccessibility updateTitleLabel](&v3, sel_updateTitleLabel);
  -[BPSSetupPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
