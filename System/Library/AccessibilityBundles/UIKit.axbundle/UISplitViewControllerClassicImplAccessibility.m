@implementation UISplitViewControllerClassicImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISplitViewControllerClassicImpl");
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
  v4 = CFSTR("UISplitViewControllerClassicImpl");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_updateDisplayModeButtonItem"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_displayModeButtonItem"), "UISplitViewControllerDisplayModeBarButtonItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_effectiveTargetDisplayMode"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_loadNewSubviews:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_svc"), "UISplitViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("viewControllers"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_loadNewSubviews:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UISplitViewControllerClassicImplAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  -[UISplitViewControllerClassicImplAccessibility _loadNewSubviews:](&v5, sel__loadNewSubviews_, location[0]);
  objc_opt_class();
  v3 = (id)-[UISplitViewControllerClassicImplAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_svc"));
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (id)displayModeButtonItem
{
  id v3;
  objc_super v4;
  id v5[2];
  UISplitViewControllerClassicImplAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  v5[0] = -[UISplitViewControllerClassicImplAccessibility displayModeButtonItem](&v4, sel_displayModeButtonItem);
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v6);
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)_axApplyDisplayModeLabel
{
  id v1;
  id v2;
  uint64_t v3;
  id location;
  id v5;

  v5 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_displayModeButtonItem"));
    if (location)
    {
      v2 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_effectiveTargetDisplayMode"));
      v3 = objc_msgSend(v2, "integerValue");

      if (v3 == 1)
      {
        v1 = (id)accessibilityUIKitLocalizedString();
        objc_msgSend(location, "setAccessibilityLabel:");

        objc_msgSend(location, "accessibilitySetIdentification:", CFSTR("DisplayMode"));
        objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
      }
      else
      {
        objc_msgSend(location, "setAccessibilityLabel:");
        objc_msgSend(location, "accessibilitySetIdentification:", 0);
        objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB100]);
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_updateDisplayModeButtonItem
{
  objc_super v2;
  SEL v3;
  UISplitViewControllerClassicImplAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  -[UISplitViewControllerClassicImplAccessibility _updateDisplayModeButtonItem](&v2, sel__updateDisplayModeButtonItem);
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v4);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UISplitViewControllerClassicImplAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  -[UISplitViewControllerClassicImplAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v4);
}

- (id)_accessibilitySpeakThisViewController
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10[3];

  v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  v9 = (id)-[UISplitViewControllerClassicImplAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("viewControllers"));
  if ((unint64_t)objc_msgSend(v9, "count") > 2)
    _AXAssert();
  if (objc_msgSend(v9, "count") == 2)
    v2 = (id)objc_msgSend(v9, "objectAtIndex:", 1);
  else
    v2 = (id)objc_msgSend(v9, "firstObject");
  v3 = v10[0];
  v10[0] = v2;

  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsSafeCategory();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v5 = (id)objc_msgSend(v6, "_accessibilitySpeakThisViewController");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  return v5;
}

@end
