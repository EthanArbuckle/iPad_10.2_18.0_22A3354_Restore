@implementation _UIFocusSystemKeyboardSceneComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusSystemKeyboardSceneComponent");
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
  v3 = CFSTR("_UIFocusSystemSceneComponent");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIFocusSystemKeyboardSceneComponent"));
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSystemSceneComponent"), CFSTR("focusSystem"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_windowScene"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_preferredFocusedWindowScene"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)focusSystem
{
  id obj;
  id v4;
  objc_super v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12[2];
  _UIFocusSystemKeyboardSceneComponentAccessibility *v13;
  id v14;

  v13 = self;
  v12[1] = (id)a2;
  if ((-[_UIFocusSystemKeyboardSceneComponentAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)goto LABEL_6;
  v11 = 0;
  objc_opt_class();
  v4 = (id)-[_UIFocusSystemKeyboardSceneComponentAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("_windowScene"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  v8 = (id)objc_msgSend(v9, "screen");
  v7 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_preferredFocusedWindowScene"));
  if (v7 == v12[0])
  {
    v6 = 0;
  }
  else
  {
    v14 = (id)objc_msgSend(v7, "focusSystem");
    v6 = 1;
  }
  obj = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v12, 0);
  if (!v6)
  {
LABEL_6:
    v5.receiver = v13;
    v5.super_class = (Class)_UIFocusSystemKeyboardSceneComponentAccessibility;
    v14 = -[_UIFocusSystemKeyboardSceneComponentAccessibility focusSystem](&v5, sel_focusSystem, obj);
  }
  return v14;
}

@end
