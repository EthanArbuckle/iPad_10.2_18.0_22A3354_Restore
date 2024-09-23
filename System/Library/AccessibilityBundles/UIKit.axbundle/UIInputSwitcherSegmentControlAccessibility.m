@implementation UIInputSwitcherSegmentControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcherSegmentControl");
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
  v4 = CFSTR("UIInputSwitcherSegmentControl");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherSegmentControl"), CFSTR("stackView"), 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setSegmentImages:"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setSegmentTitles:"), v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (void)didMoveToWindow
{
  objc_super v2;
  SEL v3;
  UIInputSwitcherSegmentControlAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UIInputSwitcherSegmentControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v2.receiver = v4;
  v2.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  -[UIInputSwitcherSegmentControlAccessibility didMoveToWindow](&v2, sel_didMoveToWindow);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  BOOL v3;
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
  BOOL v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  objc_super v22;
  SEL v23;
  UIInputSwitcherSegmentControlAccessibility *v24;

  v24 = self;
  v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  -[UIInputSwitcherSegmentControlAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  v20 = 0;
  objc_opt_class();
  v15 = (id)-[UIInputSwitcherSegmentControlAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("stackView"));
  v19 = (id)__UIAccessibilityCastAsClass();

  v18 = v19;
  objc_storeStrong(&v19, 0);
  v21 = v18;
  v13 = (id)objc_msgSend(v18, "arrangedSubviews");
  v14 = objc_msgSend(v13, "count") != 3;

  if (v14)
  {
    v16 = 0;
    v3 = 0;
    if (v21)
    {
      v17 = (id)objc_msgSend(v21, "arrangedSubviews");
      v16 = 1;
      v3 = objc_msgSend(v17, "count") != 0;
    }
    if ((v16 & 1) != 0)

    if (v3)
    {
      v2 = (id)objc_msgSend(v21, "arrangedSubviews");
      objc_msgSend(v2, "count");
      _AXAssert();

    }
  }
  else
  {
    v6 = (id)UIKitAccessibilityLocalizedString();
    v5 = (id)objc_msgSend(v21, "arrangedSubviews");
    v4 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

    v9 = (id)UIKitAccessibilityLocalizedString();
    v8 = (id)objc_msgSend(v21, "arrangedSubviews");
    v7 = (id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    objc_msgSend(v7, "setAccessibilityLabel:", v9);

    v12 = (id)UIKitAccessibilityLocalizedString();
    v11 = (id)objc_msgSend(v21, "arrangedSubviews");
    v10 = (id)objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    objc_msgSend(v10, "setAccessibilityLabel:", v12);

  }
  objc_storeStrong(&v21, 0);
}

- (void)setSegmentImages:(id)a3
{
  objc_super v3;
  id location[2];
  UIInputSwitcherSegmentControlAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  -[UIInputSwitcherSegmentControlAccessibility setSegmentImages:](&v3, sel_setSegmentImages_, location[0]);
  -[UIInputSwitcherSegmentControlAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

- (void)setSegmentTitles:(id)a3
{
  objc_super v3;
  id location[2];
  UIInputSwitcherSegmentControlAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  -[UIInputSwitcherSegmentControlAccessibility setSegmentTitles:](&v3, sel_setSegmentTitles_, location[0]);
  -[UIInputSwitcherSegmentControlAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

@end
