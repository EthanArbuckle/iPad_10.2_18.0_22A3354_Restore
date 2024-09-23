@implementation _UINavigationBarTitleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UINavigationBarTitleControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("_UINavigationBarTitleControl");
  v3 = CFSTR("UIControl");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("canBecomeFocused"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("isInteractive"), v4, 0);
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("titleLabel"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("titleView"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  objc_super v13;
  SEL v14;
  _UINavigationBarTitleControlAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTitleControlAccessibility;
  -[_UINavigationBarTitleControlAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  v11 = 0;
  objc_opt_class();
  v8 = (id)-[_UINavigationBarTitleControlAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("titleLabel"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = v9;
  objc_msgSend(v9, "setIsAccessibilityElement:", 1);
  if (v12)
  {
    if ((-[_UINavigationBarTitleControlAccessibility safeBoolForKey:](v15, "safeBoolForKey:", CFSTR("isInteractive")) & 1) != 0)
    {
      objc_msgSend(v12, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
      v4 = v12;
      v7 = (id)objc_msgSend(v12, "text");
      v6 = (id)UIKitAccessibilityLocalizedString();
      v5 = (id)__UIAXStringForVariables();
      objc_msgSend(v4, "setAccessibilityLabel:", v6, CFSTR("__AXStringForVariablesSentinel"));

    }
    else
    {
      objc_msgSend(v12, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
      v2 = v12;
      v3 = (id)objc_msgSend(v12, "text");
      objc_msgSend(v2, "setAccessibilityLabel:");

    }
  }
  objc_storeStrong(&v12, 0);
}

- (BOOL)canBecomeFocused
{
  id v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  _UINavigationBarTitleControlAccessibility *v8;
  BOOL v9;

  v8 = self;
  v7[1] = (id)a2;
  v6 = 0;
  objc_opt_class();
  v3 = (id)-[_UINavigationBarTitleControlAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("titleLabel"));
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  v9 = v4
    && (-[_UINavigationBarTitleControlAccessibility _accessibilityIsFKARunningForFocusItem](v8, "_accessibilityIsFKARunningForFocusItem") & 1) != 0&& (-[_UINavigationBarTitleControlAccessibility safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("isInteractive")) & 1) != 0;
  objc_storeStrong(v7, 0);
  return v9;
}

@end
