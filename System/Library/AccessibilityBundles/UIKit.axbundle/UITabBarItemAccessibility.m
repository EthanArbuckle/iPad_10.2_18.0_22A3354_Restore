@implementation UITabBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBarItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UITabBarItem");
  v3 = "UIImage";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBarItem"), CFSTR("_selectedImage"), "UIImage");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBarItem"), CFSTR("_unselectedImage"), "UIImage");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITabBarItem"), CFSTR("view"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_createViewForTabBar: asProxyView:"), v5, "B", 0);
  objc_storeStrong(v7, v6);
}

- (id)selectedImage
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v12;
  id v13;
  BOOL v14;
  SEL v15;
  UITabBarItemAccessibility *v16;

  v16 = self;
  v15 = a2;
  v2 = (id)-[UITabBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedImage"));
  v11 = v2 == 0;

  v14 = v11;
  v12.receiver = v16;
  v12.super_class = (Class)UITabBarItemAccessibility;
  v13 = -[UITabBarItemAccessibility selectedImage](&v12, sel_selectedImage);
  if (v14)
  {
    v5 = v13;
    v7 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:");
    v6 = (id)objc_msgSend(v7, "accessibilityIdentification");
    objc_msgSend(v5, "accessibilitySetIdentification:");

    v8 = v13;
    v10 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_templateImage"));
    v9 = (id)objc_msgSend(v10, "accessibilityIdentifier");
    objc_msgSend(v8, "setAccessibilityIdentifier:");

  }
  v4 = v13;
  objc_storeStrong(&v13, 0);
  return v4;
}

- (id)unselectedImage
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v12;
  id v13;
  BOOL v14;
  SEL v15;
  UITabBarItemAccessibility *v16;

  v16 = self;
  v15 = a2;
  v2 = (id)-[UITabBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unselectedImage"));
  v11 = v2 == 0;

  v14 = v11;
  v12.receiver = v16;
  v12.super_class = (Class)UITabBarItemAccessibility;
  v13 = -[UITabBarItemAccessibility unselectedImage](&v12, sel_unselectedImage);
  if (v14)
  {
    v5 = v13;
    v7 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:");
    v6 = (id)objc_msgSend(v7, "accessibilityIdentification");
    objc_msgSend(v5, "accessibilitySetIdentification:");

    v8 = v13;
    v10 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_templateImage"));
    v9 = (id)objc_msgSend(v10, "accessibilityIdentifier");
    objc_msgSend(v8, "setAccessibilityIdentifier:");

  }
  v4 = v13;
  objc_storeStrong(&v13, 0);
  return v4;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityLabel:](&v4, sel_setAccessibilityLabel_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityLabel:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityAttributedLabel:](&v4, sel_setAccessibilityAttributedLabel_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityAttributedLabel:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)accessibilityLocalizedStringKey
{
  return (id)-[UITabBarItemAccessibility _accessibilityRetrieveLocalizedStringKey](self, "_accessibilityRetrieveLocalizedStringKey", a2, self);
}

- (id)accessibilityLocalizationBundleID
{
  return (id)-[UITabBarItemAccessibility _accessibilityRetrieveLocalizationBundleID](self, "_accessibilityRetrieveLocalizationBundleID", a2, self);
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)-[UITabBarItemAccessibility _accessibilityRetrieveLocalizationBundlePath](self, "_accessibilityRetrieveLocalizationBundlePath", a2, self);
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)-[UITabBarItemAccessibility _accessibilityRetrieveLocalizedStringTableName](self, "_accessibilityRetrieveLocalizedStringTableName", a2, self);
}

- (void)setAccessibilityValue:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityValue:](&v4, sel_setAccessibilityValue_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityValue:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedValue:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityAttributedValue:](&v4, sel_setAccessibilityAttributedValue_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityAttributedValue:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityHint:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityHint:](&v4, sel_setAccessibilityHint_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityHint:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITabBarItemAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  -[UITabBarItemAccessibility setAccessibilityAttributedHint:](&v4, sel_setAccessibilityAttributedHint_, location[0]);
  v3 = (id)-[UITabBarItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityAttributedHint:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4
{
  id v6;
  objc_super v7;
  id v8;
  BOOL v9;
  id location[2];
  UITabBarItemAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v7.receiver = v11;
  v7.super_class = (Class)UITabBarItemAccessibility;
  v8 = -[UITabBarItemAccessibility _createViewForTabBar:asProxyView:](&v7, sel__createViewForTabBar_asProxyView_, location[0], a4);
  AXApplyTabBarItemPropertiesToView(v11, v8);
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

@end
