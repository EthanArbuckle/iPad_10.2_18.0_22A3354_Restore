@implementation UIStatusBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIWindow");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIStatusBarWindow"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_wantsFocusEngine"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)accessibilityElementsHidden
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  if ((_UIApplicationIsExtension() & 1) != 0)
    return 1;
  v2 = (id)-[UIStatusBarWindowAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v5 = v2 == 0;

  if (v5)
    return 0;
  v4 = (id)-[UIStatusBarWindowAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v3;
  SEL v4;
  UIStatusBarWindowAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((AXProcessIsSpringBoard() & 1) == 0 || (AXDeviceHasJindo() & 1) == 0 || AXRequestingClient() != 3)
    return 0x7FFFFFFFLL;
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBarWindowAccessibility;
  return -[UIStatusBarWindowAccessibility _accessibilitySortPriority](&v3, sel__accessibilitySortPriority);
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  objc_super v3;
  SEL v4;
  UIStatusBarWindowAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[UIStatusBarWindowAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBarWindowAccessibility;
  return -[UIStatusBarWindowAccessibility _wantsFocusEngine](&v3, sel__wantsFocusEngine);
}

@end
