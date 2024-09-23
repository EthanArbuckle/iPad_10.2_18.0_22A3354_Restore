@implementation _UIStatusBarStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarStringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBarStringView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;
  id v11;
  int v12;
  objc_super v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18[2];
  _UIStatusBarStringViewAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v17 = 0;
  objc_opt_class();
  v16 = (id)__UIAccessibilityCastAsClass();
  v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  v8 = (void *)MEMORY[0x24BDFEA60];
  v9 = (id)objc_msgSend(v15, "text");
  v14 = (id)objc_msgSend(v8, "axAttributedStringWithString:");

  if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsTime")) & 1) != 0|| (-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDFEA60];
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (id)AXDateStringForFormat();
    v2 = (id)objc_msgSend(v5, "axAttributedStringWithString:");
    v3 = v14;
    v14 = v2;

    objc_msgSend(v14, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00]);
  }
  if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsDate")) & 1) != 0)objc_msgSend(v14, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB10]);
  if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsBreadcrumb")) & 1) != 0)
  {
    v13.receiver = v19;
    v13.super_class = (Class)_UIStatusBarStringViewAccessibility;
    v20 = -[_UIStatusBarStringViewAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
    v12 = 1;
  }
  else if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsDataNetwork")) & 1) == 0|| ((v10.receiver = v19, v10.super_class = (Class)_UIStatusBarStringViewAccessibility, (v11 = -[_UIStatusBarStringViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel)) == 0)? (v12 = 0): (v20 = v11, v12 = 1), objc_storeStrong(&v11, 0), !v12))
  {
    v20 = v14;
    v12 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v18, 0);
  return v20;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  _UIStatusBarStringViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarStringViewAccessibility;
  v4 = -[_UIStatusBarStringViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
  if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v6, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsTime")) & 1) != 0|| (-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v6, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")) & 1) != 0)
  {
    v4 |= *MEMORY[0x24BDF7430];
  }
  return v4;
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (BOOL)canBecomeFocused
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  objc_super v9;
  char v10;
  SEL v11;
  _UIStatusBarStringViewAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarStringViewAccessibility;
  v10 = -[_UIStatusBarStringViewAccessibility canBecomeFocused](&v9, sel_canBecomeFocused);
  v8 = 0;
  v7 = 0;
  v6 = (id)__UIAccessibilitySafeClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v8 = v4;
  if (v4 != 3 && v8 != 2)
    v10 = -[_UIStatusBarStringViewAccessibility accessibilityRespondsToUserInteraction](v12, "accessibilityRespondsToUserInteraction") & 1;
  return v10 & 1;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v3;
  SEL v4;
  _UIStatusBarStringViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")) & 1) != 0)return 0;
  v3.receiver = v5;
  v3.super_class = (Class)_UIStatusBarStringViewAccessibility;
  return -[_UIStatusBarStringViewAccessibility isAccessibilityElement](&v3, sel_isAccessibilityElement);
}

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

@end
