@implementation CSLUILayoutIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLUILayoutIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("hint.app.moving"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  UIBezierPath *v5;
  void *v6;

  -[CSLUILayoutIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bounds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");

  v4 = (void *)MEMORY[0x24BDF6870];
  AX_CGRectGetCenter();
  objc_msgSend(v4, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  v5 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v5, (UIView *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
