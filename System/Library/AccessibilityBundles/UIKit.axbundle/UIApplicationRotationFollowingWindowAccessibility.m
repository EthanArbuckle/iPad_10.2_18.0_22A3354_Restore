@implementation UIApplicationRotationFollowingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplicationRotationFollowingWindow");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIApplicationRotationFollowingWindow"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_wantsFocusEngine"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_wantsFocusEngine
{
  objc_super v3;
  SEL v4;
  UIApplicationRotationFollowingWindowAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[UIApplicationRotationFollowingWindowAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v3.receiver = v5;
  v3.super_class = (Class)UIApplicationRotationFollowingWindowAccessibility;
  return -[UIApplicationRotationFollowingWindowAccessibility _wantsFocusEngine](&v3, sel__wantsFocusEngine);
}

@end
