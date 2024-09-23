@implementation _UIStatusBarTimeItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarTimeItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarTimeItem");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("pillTimeView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("shortTimeView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("dateView"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  _UIStatusBarTimeItemAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarTimeItemAccessibility;
  -[_UIStatusBarTimeItemAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v5 = (id)-[_UIStatusBarTimeItemAccessibility safeUIViewForKey:](v8, "safeUIViewForKey:", CFSTR("timeView"));
  objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 1);
  v4 = (id)-[_UIStatusBarTimeItemAccessibility safeUIViewForKey:](v8, "safeUIViewForKey:", CFSTR("shortTimeView"));
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsTime"));
  v3 = (id)-[_UIStatusBarTimeItemAccessibility safeUIViewForKey:](v8, "safeUIViewForKey:", CFSTR("pillTimeView"));
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsPillTime"));
  v2 = (id)-[_UIStatusBarTimeItemAccessibility safeUIViewForKey:](v8, "safeUIViewForKey:", CFSTR("dateView"));
  objc_msgSend(v2, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsDate"));
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
}

- (_UIStatusBarTimeItemAccessibility)init
{
  _UIStatusBarTimeItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarTimeItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarTimeItemAccessibility;
  v6 = -[_UIStatusBarTimeItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarTimeItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end
