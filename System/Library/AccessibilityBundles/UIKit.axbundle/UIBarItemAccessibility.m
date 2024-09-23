@implementation UIBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIBarItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("title"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  objc_super v6;
  id v7[2];
  UIBarItemAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIBarItemAccessibility;
  v7[0] = -[UIBarItemAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  if (!v7[0])
  {
    v2 = (id)-[UIBarItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("title"));
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

- (id)accessibilityLocalizedStringKey
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (id)objc_msgSend(v6[0], "_accessibilityAttributedLocalizedString");
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringKey"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (id)objc_msgSend(v6[0], "_accessibilityAttributedLocalizedString");
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringBundleID"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityLocalizationBundlePath
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (id)objc_msgSend(v6[0], "_accessibilityAttributedLocalizedString");
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("UIAccessibilityTokenLocalizationBundlePath"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityLocalizedStringTableName
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIBarItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (id)objc_msgSend(v6[0], "_accessibilityAttributedLocalizedString");
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringTableName"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

@end
