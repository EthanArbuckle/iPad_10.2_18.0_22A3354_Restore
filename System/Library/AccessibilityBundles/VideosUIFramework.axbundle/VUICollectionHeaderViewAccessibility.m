@implementation VUICollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUICollectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUICollectionHeaderView"), CFSTR("titleTextView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUICollectionHeaderViewAccessibility;
  -[VUICollectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VUICollectionHeaderViewAccessibility _accessibilityMarkupSubviews](self, "_accessibilityMarkupSubviews");
}

- (void)_accessibilityMarkupSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  -[VUICollectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);

}

@end
