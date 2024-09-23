@implementation BFFPaneHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BFFPaneHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BFFPaneHeaderView"), CFSTR("_textLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BFFPaneHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFPaneHeaderViewAccessibility;
  -[BFFPaneHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[BFFPaneHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);

}

- (BFFPaneHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  BFFPaneHeaderViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BFFPaneHeaderViewAccessibility;
  v3 = -[BFFPaneHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BFFPaneHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
