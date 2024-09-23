@implementation UINavigationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UINavigationItem");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setTitleView:"), "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("hidesSearchBarWhenScrolling"), "B", 0);
  objc_storeStrong(v6, obj);
}

- (uint64_t)_axSetOriginalHidesSearchBarWhenScrolling:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (uint64_t)_axDidOverrideHidesSearchBarWhenScrolling
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetDidOverrideHidesSearchBarWhenScrolling:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (uint64_t)_axShouldHideSearchBarWhenScrolling
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetShouldHideSearchBarWhenScrolling:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (void)setTitleView:(id)a3
{
  id *v3;
  id v4;
  objc_super v5;
  id location[2];
  UINavigationItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[UINavigationItemAccessibility _accessibilityBoolValueForKey:](v7, "_accessibilityBoolValueForKey:", setTitleView__AXIsAccessingTitleView) & 1) == 0)
  {
    -[UINavigationItemAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 1, setTitleView__AXIsAccessingTitleView);
    v4 = (id)-[UINavigationItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("titleView"));
    objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 0, kUIAccessibilityStorageKeyIsTitleElement);

    -[UINavigationItemAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 0, setTitleView__AXIsAccessingTitleView);
  }
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationItemAccessibility;
  -[UINavigationItemAccessibility setTitleView:](&v5, sel_setTitleView_, location[0], location);
  objc_msgSend(location[0], "_accessibilitySetBoolValue:forKey:", 1, kUIAccessibilityStorageKeyIsTitleElement);
  objc_storeStrong(v3, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  UINavigationItemAccessibility *v4;
  id v5;
  id v6;
  char v7;
  id v8;
  objc_super v9;
  SEL v10;
  UINavigationItemAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationItemAccessibility;
  -[UINavigationItemAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8 = v5;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    if ((-[UINavigationItemAccessibility _axDidOverrideHidesSearchBarWhenScrolling]((uint64_t)v11) & 1) == 0)
    {
      -[UINavigationItemAccessibility _axSetDidOverrideHidesSearchBarWhenScrolling:]((uint64_t)v11);
      v4 = v11;
      objc_msgSend(v8, "hidesSearchBarWhenScrolling");
      -[UINavigationItemAccessibility _axSetOriginalHidesSearchBarWhenScrolling:]((uint64_t)v4);
    }
    objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);
  }
  else if ((-[UINavigationItemAccessibility _axDidOverrideHidesSearchBarWhenScrolling]((uint64_t)v11) & 1) != 0)
  {
    -[UINavigationItemAccessibility _axSetDidOverrideHidesSearchBarWhenScrolling:]((uint64_t)v11);
  }
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "addObserver:selector:name:object:", v11, sel__voiceOverStatusChanged, *MEMORY[0x24BDF7458]);

  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", v11, sel__switchControlStatusChanged, *MEMORY[0x24BDF7380], 0);

  objc_storeStrong(&v8, 0);
}

- (void)setHidesSearchBarWhenScrolling:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UINavigationItemAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UINavigationItemAccessibility;
  -[UINavigationItemAccessibility setHidesSearchBarWhenScrolling:](&v3, sel_setHidesSearchBarWhenScrolling_, a3);
  if (v4)
    -[UINavigationItemAccessibility _axSetShouldHideSearchBarWhenScrolling:]((uint64_t)v6);
}

- (BOOL)hidesSearchBarWhenScrolling
{
  objc_super v3;
  SEL v4;
  UINavigationItemAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    return 0;
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationItemAccessibility;
  return -[UINavigationItemAccessibility hidesSearchBarWhenScrolling](&v3, sel_hidesSearchBarWhenScrolling);
}

- (void)_voiceOverStatusChanged
{
  id v2;
  id v3;
  char v4;
  id v5[2];
  UINavigationItemAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v4 = 0;
    objc_opt_class();
    v3 = (id)__UIAccessibilityCastAsClass();
    v2 = v3;
    objc_storeStrong(&v3, 0);
    v5[0] = v2;
    objc_msgSend(v2, "setHidesSearchBarWhenScrolling:", -[UINavigationItemAccessibility _axShouldHideSearchBarWhenScrolling]((uint64_t)v6) & 1);
    objc_storeStrong(v5, 0);
  }
}

- (void)_switchControlStatusChanged
{
  id v2;
  id v3;
  char v4;
  id v5[2];
  UINavigationItemAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  if (!UIAccessibilityIsSwitchControlRunning())
  {
    v4 = 0;
    objc_opt_class();
    v3 = (id)__UIAccessibilityCastAsClass();
    v2 = v3;
    objc_storeStrong(&v3, 0);
    v5[0] = v2;
    objc_msgSend(v2, "setHidesSearchBarWhenScrolling:", -[UINavigationItemAccessibility _axShouldHideSearchBarWhenScrolling]((uint64_t)v6) & 1);
    objc_storeStrong(v5, 0);
  }
}

@end
