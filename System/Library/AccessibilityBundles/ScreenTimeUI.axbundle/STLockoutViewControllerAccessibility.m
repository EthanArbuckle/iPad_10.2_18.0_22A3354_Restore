@implementation STLockoutViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STLockoutViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STLockoutViewController"), CFSTR("titleLabel"), "@", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewControllerAccessibility;
  -[STLockoutViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[STLockoutViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STLockoutViewControllerAccessibility;
  -[STLockoutViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[STLockoutViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

@end
