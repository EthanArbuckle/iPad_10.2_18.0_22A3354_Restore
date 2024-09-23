@implementation UGCGlyphButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCGlyphButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCGlyphButtonView"), CFSTR("isSelected"), "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCGlyphButtonViewAccessibility;
  -[UGCGlyphButtonViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__UGCGlyphButtonViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v3[3] = &unk_250258ED0;
  objc_copyWeak(&v4, &location);
  -[UGCGlyphButtonViewAccessibility _setAccessibilityAdditionalTraitsBlock:](self, "_setAccessibilityAdditionalTraitsBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __77__UGCGlyphButtonViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *MEMORY[0x24BDF73E0];
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  v5 = v4 | v2;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
