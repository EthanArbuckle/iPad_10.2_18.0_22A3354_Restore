@implementation HUNaturalLightColorSwatchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUNaturalLightColorSwatchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNaturalLightColorSwatchView"), CFSTR("selectionState"), "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  double MidX;
  double MidY;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[HUNaturalLightColorSwatchViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v6 = (void *)MEMORY[0x24BDF6870];
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, CGRectGetWidth(v12) * 0.5, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[HUNaturalLightColorSwatchViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectionState"));
  v4 = *MEMORY[0x24BDF7400];
  if (v3 != 2)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(CFSTR("natural.color"));
}

@end
