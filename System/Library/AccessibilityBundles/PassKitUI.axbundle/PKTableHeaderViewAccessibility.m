@implementation PKTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKTableHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTableHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTableHeaderView"), CFSTR("layoutSubviews"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTableHeaderViewAccessibility;
  -[PKTableHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PKTableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderViewAccessibility;
  -[PKTableHeaderViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PKTableHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
