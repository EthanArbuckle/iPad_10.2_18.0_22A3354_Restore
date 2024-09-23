@implementation _UIFindNavigatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFindNavigatorView");
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
  v3 = CFSTR("_UIFindNavigatorView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFindNavigatorView"), CFSTR("settingsButton"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("replaceTextField"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("previousResultButton"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("nextResultButton"), v4, 0);
  objc_storeStrong(v6, obj);
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
  id v11;
  char v12;
  id v13;
  objc_super v14;
  SEL v15;
  _UIFindNavigatorViewAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)_UIFindNavigatorViewAccessibility;
  -[_UIFindNavigatorViewAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  v8 = (id)-[_UIFindNavigatorViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("settingsButton"));
  v7 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v8, "setAccessibilityLabel:");

  v12 = 0;
  objc_opt_class();
  v9 = (id)-[_UIFindNavigatorViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("replaceTextField"));
  v11 = (id)__UIAccessibilityCastAsClass();

  v10 = v11;
  objc_storeStrong(&v11, 0);
  v13 = v10;
  v2 = (id)objc_msgSend(v10, "leftView");
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);

  v4 = (id)-[_UIFindNavigatorViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("previousResultButton"));
  v3 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v4, "setAccessibilityLabel:");

  v6 = (id)-[_UIFindNavigatorViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("nextResultButton"));
  v5 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v6, "setAccessibilityLabel:");

  objc_storeStrong(&v13, 0);
}

@end
