@implementation UIStatusBar_ModernAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBar_Modern");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBar"), CFSTR("UIView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBar_Modern"), CFSTR("statusBar"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_accessibilityViewIsVisible
{
  id v3;
  int v4;

  v3 = (id)-[UIStatusBar_ModernAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("statusBar"));
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  return v4 & 1;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v3;
  SEL v4;
  UIStatusBar_ModernAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((AXProcessIsSpringBoard() & 1) == 0 || (AXDeviceHasJindo() & 1) == 0 || AXRequestingClient() != 3)
    return 0x7FFFFFFFLL;
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBar_ModernAccessibility;
  return -[UIStatusBar_ModernAccessibility _accessibilitySortPriority](&v3, sel__accessibilitySortPriority);
}

@end
