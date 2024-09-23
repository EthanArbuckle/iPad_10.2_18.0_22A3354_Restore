@implementation _UIKeyShortcutHUDShortcutInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDShortcutInputView");
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
  v3 = CFSTR("_UIKeyShortcutHUDShortcutInputView");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("inputLabel"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  _UIKeyShortcutHUDShortcutInputViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDShortcutInputViewAccessibility;
  -[_UIKeyShortcutHUDShortcutInputViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[_UIKeyShortcutHUDShortcutInputViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("modifiersLabel"));
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  v2 = (id)-[_UIKeyShortcutHUDShortcutInputViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("inputLabel"));
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
}

@end
