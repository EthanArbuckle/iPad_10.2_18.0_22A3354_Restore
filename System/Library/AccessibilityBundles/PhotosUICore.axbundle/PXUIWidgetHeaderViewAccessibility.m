@implementation PXUIWidgetHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXUIWidgetHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIWidgetHeaderView"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIWidgetHeaderView"), CFSTR("_titleLabelCreateIfNeeded:"), "@", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUIWidgetHeaderViewAccessibility;
  -[PXUIWidgetHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PXUIWidgetHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);

}

- (id)_titleLabelCreateIfNeeded:(BOOL)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXUIWidgetHeaderViewAccessibility;
  -[PXUIWidgetHeaderViewAccessibility _titleLabelCreateIfNeeded:](&v6, sel__titleLabelCreateIfNeeded_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIWidgetHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
