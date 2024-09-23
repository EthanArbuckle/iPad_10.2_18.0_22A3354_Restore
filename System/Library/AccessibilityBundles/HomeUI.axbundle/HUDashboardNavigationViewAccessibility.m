@implementation HUDashboardNavigationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDashboardNavigationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardNavigationView"), CFSTR("_rotateChevronButtonToAngle:"), "v", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_rotateChevronButtonToAngle:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDashboardNavigationViewAccessibility;
  -[HUDashboardNavigationViewAccessibility _rotateChevronButtonToAngle:](&v3, sel__rotateChevronButtonToAngle_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
