@implementation WeekTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeekTimeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (WeekTimeViewAccessibility)initWithFrame:(CGRect)a3
{
  WeekTimeViewAccessibility *v3;
  WeekTimeViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WeekTimeViewAccessibility;
  v3 = -[WeekTimeViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[WeekTimeViewAccessibility setAccessibilityElementsHidden:](v3, "setAccessibilityElementsHidden:", 1);
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeekTimeViewAccessibility;
  -[WeekTimeViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WeekTimeViewAccessibility setAccessibilityElementsHidden:](self, "setAccessibilityElementsHidden:", 1);
}

@end
