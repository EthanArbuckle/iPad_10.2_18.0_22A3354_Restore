@implementation LargeTextLargeMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeTextLargeMonthWeekView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  id v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)LargeTextLargeMonthWeekViewAccessibility;
  -[LargeTextLargeMonthWeekViewAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityVisibleFrame");
  if (CGRectIsEmpty(v8))
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

@end
