@implementation LargeYearMonthViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeYearMonthView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[LargeYearMonthViewAccessibility _accessibilityVisibleFrame](self, "_accessibilityVisibleFrame");
  if (CGRectIsEmpty(v11))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LargeYearMonthViewAccessibility;
    -[LargeYearMonthViewAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
