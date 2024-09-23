@implementation _UIFloatingTabBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFloatingTabBar");
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
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("_UIFloatingTabBar");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("sidebarButton"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("collectionView"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("pinnedItemsView"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("rightArrowButton"), v3, 0);
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("showsSidebarButton"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_updateSelectionViewVisibilityAnimated:"), "v", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFloatingTabBarPageButton"), CFSTR("contentOpacity"), "d", 0);
  objc_storeStrong(v7, v6);
}

- (id)accessibilityElements
{
  double v2;
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19[2];
  _UIFloatingTabBarAccessibility *v20;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)objc_opt_new();
  v18 = (id)-[_UIFloatingTabBarAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("leftArrowButton"));
  objc_msgSend(v18, "safeCGFloatForKey:", CFSTR("contentOpacity"));
  if (v2 > 0.0)
    objc_msgSend(v19[0], "axSafelyAddObject:", v18);
  if ((-[_UIFloatingTabBarAccessibility safeBoolForKey:](v20, "safeBoolForKey:", CFSTR("showsSidebarButton")) & 1) != 0)
  {
    v12 = (id)-[_UIFloatingTabBarAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("sidebarButton"));
    objc_msgSend(v19[0], "axSafelyAddObject:");

  }
  v16 = 0;
  objc_opt_class();
  v11 = (id)-[_UIFloatingTabBarAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("collectionView"));
  v15 = (id)__UIAccessibilityCastAsClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17 = v14;
  v6 = v19[0];
  v7 = (id)objc_msgSend(v14, "_accessibilitySortedElementsWithin");
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

  v8 = v19[0];
  v10 = (id)-[_UIFloatingTabBarAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("pinnedItemsView"));
  v9 = (id)objc_msgSend(v10, "subviews");
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

  v13 = (id)-[_UIFloatingTabBarAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("rightArrowButton"));
  objc_msgSend(v13, "safeCGFloatForKey:", CFSTR("contentOpacity"));
  if (v3 > 0.0)
    objc_msgSend(v19[0], "axSafelyAddObject:", v13);
  v5 = v19[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
  return v5;
}

- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  _UIFloatingTabBarAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarAccessibility;
  -[_UIFloatingTabBarAccessibility _updateSelectionViewVisibilityAnimated:](&v3, sel__updateSelectionViewVisibilityAnimated_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
