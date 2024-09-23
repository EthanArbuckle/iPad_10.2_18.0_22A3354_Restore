@implementation InfoCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("InfoCardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("InfoCardViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfoCardViewController"), CFSTR("titleHeaderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Maps.InfoCardHeaderView"), CFSTR("titleLabel"), "UILabel");

}

- (void)_axAnnotateTitle
{
  void *v2;
  uint64_t v3;
  id v4;

  -[InfoCardViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleHeaderView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v3);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InfoCardViewControllerAccessibility;
  -[InfoCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[InfoCardViewControllerAccessibility _axAnnotateTitle](self, "_axAnnotateTitle");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InfoCardViewControllerAccessibility;
  -[InfoCardViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[InfoCardViewControllerAccessibility _axAnnotateTitle](self, "_axAnnotateTitle");
}

@end
