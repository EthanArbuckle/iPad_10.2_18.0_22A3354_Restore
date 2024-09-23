@implementation SBCloseBoxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCloseBoxView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SBCloseBoxView"));
}

- (CGPoint)_accessibilityVisiblePoint
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  v5.receiver = self;
  v5.super_class = (Class)SBCloseBoxViewAccessibility;
  -[SBCloseBoxViewAccessibility _accessibilityVisiblePoint](&v5, sel__accessibilityVisiblePoint);
  v4 = fmax(v3, 0.0);
  result.y = v2;
  result.x = v4;
  return result;
}

@end
