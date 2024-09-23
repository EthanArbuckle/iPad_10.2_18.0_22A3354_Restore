@implementation CCUIDisplayBackgroundViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIDisplayBackgroundViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIDisplayBackgroundViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIDisplayBackgroundViewController"), CFSTR("nightShiftButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIDisplayBackgroundViewController"), CFSTR("trueToneButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  -[CCUIDisplayBackgroundViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIDisplayBackgroundViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nightShiftButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

  -[CCUIDisplayBackgroundViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trueToneButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  -[CCUIDisplayBackgroundViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIDisplayBackgroundViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  -[CCUIDisplayBackgroundViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIDisplayBackgroundViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
