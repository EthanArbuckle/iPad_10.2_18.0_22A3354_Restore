@implementation _UIFocusSystemSceneComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusSystemSceneComponent");
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
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("focusItemsInRect:"), v4, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3;
  char v4;

  v3 = (id)-[_UIFocusSystemSceneComponentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_windowScene"));
  v4 = objc_msgSend(v3, "_accessibilityIsFKARunningForFocusItem");

  return v4 & 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  objc_super v22;
  SEL v23;
  _UIFocusSystemSceneComponentAccessibility *v24;
  CGRect v25;
  id v26;

  v25 = a3;
  v24 = self;
  v23 = a2;
  if (-[_UIFocusSystemSceneComponentAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    v20 = 0;
    objc_opt_class();
    v10 = (id)-[_UIFocusSystemSceneComponentAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("_windowScene"));
    v19 = (id)__UIAccessibilityCastAsClass();

    v18 = v19;
    objc_storeStrong(&v19, 0);
    v21 = v18;
    v7 = (id)objc_msgSend(v18, "_accessibilityTraversalWindows");
    v6 = (id)objc_msgSend(v7, "reverseObjectEnumerator");
    v17 = (id)objc_msgSend(v6, "allObjects");

    v8 = (id)objc_msgSend(v21, "_sceneForKeyboardDisplay");
    v16 = (id)objc_msgSend(v8, "_focusSystemSceneComponent");

    v14 = 0;
    objc_opt_class();
    v9 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_windowScene"));
    v13 = (id)__UIAccessibilityCastAsClass();

    v12 = v13;
    objc_storeStrong(&v13, 0);
    v15 = v12;
    v5 = (id)objc_msgSend(v12, "_accessibilityTraversalWindows");
    v4 = (id)objc_msgSend(v5, "reverseObjectEnumerator");
    v11 = (id)objc_msgSend(v4, "allObjects");

    v26 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayWithPossiblyNilArrays:", 2, v17, v11);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v22.receiver = v24;
    v22.super_class = (Class)_UIFocusSystemSceneComponentAccessibility;
    v26 = -[_UIFocusSystemSceneComponentAccessibility focusItemsInRect:](&v22, sel_focusItemsInRect_, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  }
  return v26;
}

@end
