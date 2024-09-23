@implementation UIMultiColumnViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIMultiColumnViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
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
  v6 = "@";
  v5 = CFSTR("UIMultiColumnViewController");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("setNavControllers:"), v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("navControllers"), v6, 0);
  v4 = "UIBarButtonItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_hideSecondColumnBarButtonItem"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_showSecondColumnBarButtonItem"), v4);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v5, CFSTR("UIViewController"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_secondColumnBarButtonItem:createIfNecessary:"), v6, "q", "B", 0);
  objc_storeStrong(v8, v7);
}

- (void)_axModalizeViewControllerViews
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;
  _QWORD __b[9];
  id v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = a1;
  if (a1)
  {
    v16 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("navControllers"));
    memset(__b, 0, 0x40uLL);
    obj = v16;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
    if (v7)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v7;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        __b[8] = *(_QWORD *)(__b[1] + 8 * v4);
        v13 = 0;
        v12 = (id)__UIAccessibilitySafeClass();
        if ((v13 & 1) != 0)
          abort();
        v11 = v12;
        objc_storeStrong(&v12, 0);
        v14 = (id)objc_msgSend(v11, "view");

        objc_msgSend(v14, "setShouldGroupAccessibilityChildren:", 1);
        objc_storeStrong(&v14, 0);
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
          if (!v5)
            break;
        }
      }
    }

    v10 = 0;
    objc_opt_class();
    v9 = (id)__UIAccessibilityCastAsClass();
    v8 = v9;
    objc_storeStrong(&v9, 0);
    v1 = (id)objc_msgSend(v8, "view");
    objc_msgSend(v1, "_accessibilitySetSortPriority:", 1);

    objc_storeStrong(&v16, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UIMultiColumnViewControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  -[UIMultiColumnViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v6);
}

- (void)setViewControllers:(id)a3
{
  objc_super v3;
  id location[2];
  UIMultiColumnViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  -[UIMultiColumnViewControllerAccessibility setViewControllers:](&v3, sel_setViewControllers_, location[0]);
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (void)setNavControllers:(id)a3
{
  objc_super v3;
  id location[2];
  UIMultiColumnViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  -[UIMultiColumnViewControllerAccessibility setViewControllers:](&v3, sel_setViewControllers_, location[0]);
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  id v5;
  objc_super v6;
  id v7;
  BOOL v8;
  int64_t v9;
  SEL v10;
  UIMultiColumnViewControllerAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v6.receiver = self;
  v6.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  v7 = -[UIMultiColumnViewControllerAccessibility _secondColumnBarButtonItem:createIfNecessary:](&v6, sel__secondColumnBarButtonItem_createIfNecessary_, a3, a4);
  -[UIMultiColumnViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v11, "_accessibilityLoadAccessibilityInformation");
  v5 = v7;
  objc_storeStrong(&v7, 0);
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  UIMultiColumnViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  -[UIMultiColumnViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[UIMultiColumnViewControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_hideSecondColumnBarButtonItem"));
  v2 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v3, "setAccessibilityLabel:");

  v5 = (id)-[UIMultiColumnViewControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_showSecondColumnBarButtonItem"));
  v4 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v5, "setAccessibilityLabel:");

  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v8);
}

@end
