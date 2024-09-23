@implementation ETPaletteCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETPaletteCircleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETPaletteCircleView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETPaletteCircleView"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETPaletteCircleView"), CFSTR("UIView"));

}

- (unint64_t)accessibilityTraits
{
  int v2;
  uint64_t v3;

  v2 = -[ETPaletteCircleViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v3 = *MEMORY[0x24BDF7400];
  if (!v2)
    v3 = 0;
  return *MEMORY[0x24BDF73B0] | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ETPaletteCircleViewAccessibility backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_accessibilityColorDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETPaletteCircleViewAccessibility;
  -[ETPaletteCircleViewAccessibility accessibilityHint](&v8, sel_accessibilityHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)ETPaletteCircleViewAccessibility;
    -[ETPaletteCircleViewAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("pallete.circle.hint"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (CGRect)_accessibilityBounds
{
  objc_super v2;
  CGRect v3;

  v2.receiver = self;
  v2.super_class = (Class)ETPaletteCircleViewAccessibility;
  -[ETPaletteCircleViewAccessibility _accessibilityBounds](&v2, sel__accessibilityBounds);
  return CGRectInset(v3, -3.0, -3.0);
}

@end
