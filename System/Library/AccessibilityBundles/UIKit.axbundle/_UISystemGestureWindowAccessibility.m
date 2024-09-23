@implementation _UISystemGestureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISystemGestureWindow");
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
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISystemGestureWindow"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isEligibleForFocusInteraction"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_isEligibleForFocusInteraction
{
  objc_super v3;
  char v4;
  SEL v5;
  _UISystemGestureWindowAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISystemGestureWindowAccessibility;
  v4 = -[_UISystemGestureWindowAccessibility _isEligibleForFocusInteraction](&v3, sel__isEligibleForFocusInteraction);
  if ((-[_UISystemGestureWindowAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v4 = 0;
  return v4 & 1;
}

@end
