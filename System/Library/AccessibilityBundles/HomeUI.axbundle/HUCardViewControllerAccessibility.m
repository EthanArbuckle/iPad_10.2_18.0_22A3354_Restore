@implementation HUCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCardViewController"), CFSTR("disablePullToUnlockSettings"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCardViewController"), CFSTR("forceUnlockSettings"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCardViewController"), CFSTR("_nudgeScrollViewToPoint:"), "v", "{CGPoint=dd}", 0);

}

- (BOOL)_accessibilityIgnoreSettingsDetailScrollLockIn
{
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    return 1;
  else
    return _UIAccessibilityFullKeyboardAccessEnabled();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCardViewControllerAccessibility;
  -[HUCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  if (-[HUCardViewControllerAccessibility _accessibilityIgnoreSettingsDetailScrollLockIn](self, "_accessibilityIgnoreSettingsDetailScrollLockIn"))
  {
    v3 = (id)-[HUCardViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("forceUnlockSettings"));
  }
}

- (void)_nudgeScrollViewToPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[HUCardViewControllerAccessibility _accessibilityIgnoreSettingsDetailScrollLockIn](self, "_accessibilityIgnoreSettingsDetailScrollLockIn"))
  {
    v6.receiver = self;
    v6.super_class = (Class)HUCardViewControllerAccessibility;
    -[HUCardViewControllerAccessibility _nudgeScrollViewToPoint:](&v6, sel__nudgeScrollViewToPoint_, x, y);
  }
}

- (BOOL)disablePullToUnlockSettings
{
  objc_super v4;

  if (-[HUCardViewControllerAccessibility _accessibilityIgnoreSettingsDetailScrollLockIn](self, "_accessibilityIgnoreSettingsDetailScrollLockIn"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HUCardViewControllerAccessibility;
  return -[HUCardViewControllerAccessibility disablePullToUnlockSettings](&v4, sel_disablePullToUnlockSettings);
}

@end
