@implementation _TVCollectionWrappingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCollectionWrappingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCollectionWrappingView"), CFSTR("headerView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionWrappingViewAccessibility;
  -[_TVCollectionWrappingViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[_TVCollectionWrappingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isAccessibilityElement"))
  {
    v5 = objc_msgSend(v4, "accessibilityTraits");
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);
  }

}

- (void)setHeaderView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionWrappingViewAccessibility;
  -[_TVCollectionWrappingViewAccessibility setHeaderView:](&v4, sel_setHeaderView_, a3);
  -[_TVCollectionWrappingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
