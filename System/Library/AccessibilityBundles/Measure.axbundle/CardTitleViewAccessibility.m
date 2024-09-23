@implementation CardTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.CardTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CardTitleView"), CFSTR("title"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CardTitleViewAccessibility;
  -[CardTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CardTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
