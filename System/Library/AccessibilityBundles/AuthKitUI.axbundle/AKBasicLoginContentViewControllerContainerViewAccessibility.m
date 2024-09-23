@implementation AKBasicLoginContentViewControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKBasicLoginContentViewControllerContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKBasicLoginContentViewControllerContainerView"), CFSTR("_bannerView"), "UIImageView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewControllerContainerViewAccessibility;
  -[AKBasicLoginContentViewControllerContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AKBasicLoginContentViewControllerContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bannerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("appleid.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
}

- (AKBasicLoginContentViewControllerContainerViewAccessibility)initWithFrame:(CGRect)a3
{
  AKBasicLoginContentViewControllerContainerViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewControllerContainerViewAccessibility;
  v3 = -[AKBasicLoginContentViewControllerContainerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AKBasicLoginContentViewControllerContainerViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
