@implementation PKPaletteAdditionalOptionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteAdditionalOptionsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteAdditionalOptionsView"), CFSTR("plusButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteAdditionalOptionsView"), CFSTR("ellipsisButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaletteAdditionalOptionsViewAccessibility;
  -[PKPaletteAdditionalOptionsViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaletteAdditionalOptionsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("plusButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAdditionalOptionsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ellipsisButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityPencilKitLocalizedString(CFSTR("add.annotations.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  v6 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v3, "setAccessibilityTraits:", objc_msgSend(v3, "accessibilityTraits") | *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityPencilKitLocalizedString(CFSTR("more.options.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

  objc_msgSend(v4, "setAccessibilityTraits:", objc_msgSend(v4, "accessibilityTraits") | v6);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteAdditionalOptionsViewAccessibility;
  -[PKPaletteAdditionalOptionsViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaletteAdditionalOptionsViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
