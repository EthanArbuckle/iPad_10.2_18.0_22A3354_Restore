@implementation _TVProductStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVProductStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVProductStackView"), CFSTR("setTitleView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVProductStackView"), CFSTR("titleView"), "@", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVProductStackViewAccessibility;
  -[_TVProductStackViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[_TVProductStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);

}

- (void)setTitleView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVProductStackViewAccessibility;
  -[_TVProductStackViewAccessibility setTitleView:](&v4, sel_setTitleView_, a3);
  -[_TVProductStackViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
