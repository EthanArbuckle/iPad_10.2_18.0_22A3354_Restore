@implementation UILayoutContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILayoutContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  objc_super v3;
  SEL v4;
  UILayoutContainerViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerViewAccessibility;
  return -[UILayoutContainerViewAccessibility shouldGroupAccessibilityChildren](&v3, sel_shouldGroupAccessibilityChildren);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  objc_super v9;
  SEL v10;
  UILayoutContainerViewAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UILayoutContainerViewAccessibility;
  -[UILayoutContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  v8 = (id)-[UILayoutContainerViewAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("delegate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(v8, "view");
    objc_msgSend(v2, "_accessibilitySetIsSortPriorityContainer:", 1);

    v7 = 0;
    if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isNavigationBarHidden")) & 1) == 0)
    {
      v6 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("navigationBar"));
      objc_msgSend(v6, "_accessibilitySetSortPriority:", 1000);
      v7 = 1;
      objc_storeStrong(&v6, 0);
    }
    v5 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_topPalette"));
    if (v5
      && (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isAttached")) & 1) != 0
      && (objc_msgSend(v5, "safeBoolForKey:", CFSTR("paletteIsHidden")) & 1) == 0)
    {
      objc_msgSend(v5, "_accessibilitySetSortPriority:", 999);
      v7 = 1;
    }
    if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isToolbarHidden")) & 1) == 0)
    {
      v4 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("toolbar"));
      objc_msgSend(v4, "_accessibilitySetSortPriority:", 997);
      v7 = 1;
      objc_storeStrong(&v4, 0);
    }
    if ((v7 & 1) != 0)
    {
      v3 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("navigationTransitionView"));
      objc_msgSend(v3, "_accessibilitySetSortPriority:", 998);
      objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 1);
      objc_storeStrong(&v3, 0);
    }
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v8, 0);
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v12;
  char v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  UILayoutContainerViewAccessibility *v19;
  int64_t v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = (id)objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v19);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v15 = (id)objc_msgSend(v16, "viewControllers");
  v5 = location[0];
  v7 = (id)objc_msgSend(v15, "firstObject");
  v6 = (id)objc_msgSend(v7, "view");
  v14 = objc_msgSend(v5, "_accessibilityIsDescendantOfElement:") & 1;

  v8 = v17;
  v10 = (id)objc_msgSend(v15, "firstObject");
  v9 = (id)objc_msgSend(v10, "view");
  v13 = objc_msgSend(v8, "_accessibilityIsDescendantOfElement:") & 1;

  if ((v14 & 1) == 0 || (v13 & 1) != 0)
  {
    if ((v14 & 1) != 0 || (v13 & 1) == 0)
    {
      v12 = 0;
    }
    else
    {
      v20 = 1;
      v12 = 1;
    }
  }
  else
  {
    v20 = -1;
    v12 = 1;
  }
  objc_storeStrong(&v15, 0);
  if (!v12)
LABEL_10:
    v20 = 0;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)layoutSubviews
{
  objc_super v2;
  SEL v3;
  UILayoutContainerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UILayoutContainerViewAccessibility;
  -[UILayoutContainerViewAccessibility layoutSubviews](&v2, sel_layoutSubviews);
  -[UILayoutContainerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

@end
