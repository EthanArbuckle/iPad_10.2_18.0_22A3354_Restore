@implementation LUIPaneHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIPaneHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("LUIPaneHeaderView"), CFSTR("mTitleLabel"), "UILabel");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIPaneHeaderViewAccessibility;
  -[LUIPaneHeaderViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[LUIPaneHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIPaneHeaderViewAccessibility;
  -[LUIPaneHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[LUIPaneHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);

}

@end
