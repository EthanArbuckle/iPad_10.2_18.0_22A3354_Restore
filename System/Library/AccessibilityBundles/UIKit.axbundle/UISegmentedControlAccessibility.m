@implementation UISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISegmentedControl");
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
  v3 = CFSTR("UISegmentedControl");
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("canBecomeFocused"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (int64_t)accessibilityContainerType
{
  return 11;
}

- (unint64_t)_accessibilityAutomationType
{
  return 37;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (BOOL)accessibilityElementsHidden
{
  id v3;
  char v4;
  objc_super v5;
  int v6;
  id location[2];
  UISegmentedControlAccessibility *v8;
  char v9;

  v8 = self;
  location[1] = (id)a2;
  v3 = (id)-[UISegmentedControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scopeBar"));

  if ((v4 & 1) == 0
    || ((location[0] = (id)-[UISegmentedControlAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("superview")), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (objc_msgSend(location[0], "showsScopeBar") & 1) != 0? (v6 = 0): (v9 = 1, v6 = 1), objc_storeStrong(location, 0), !v6))
  {
    v5.receiver = v8;
    v5.super_class = (Class)UISegmentedControlAccessibility;
    v9 = -[UISegmentedControlAccessibility accessibilityElementsHidden](&v5, sel_accessibilityElementsHidden);
  }
  return v9 & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UISegmentedControlAccessibility storedShouldGroupAccessibilityChildren](self, "storedShouldGroupAccessibilityChildren");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UISegmentedControlAccessibility storedShouldGroupAccessibilityChildren](self, "storedShouldGroupAccessibilityChildren");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8[2];
  UISegmentedControlAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[UISegmentedControlAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_segments"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  if ((-[UISegmentedControlAccessibility _accessibilityIsRTL](v9, "_accessibilityIsRTL") & 1) != 0)
  {
    v3 = (id)objc_msgSend(v8[0], "reverseObjectEnumerator");
    v10 = (id)objc_msgSend(v3, "allObjects");

  }
  else
  {
    v10 = v8[0];
  }
  objc_storeStrong(v8, 0);
  return v10;
}

- (BOOL)_accessibilityHasNativeFocus
{
  BOOL v3;
  char v4;
  id v5;
  objc_super v6;
  char v7;
  SEL v8;
  UISegmentedControlAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControlAccessibility;
  v7 = -[UISegmentedControlAccessibility _accessibilityHasNativeFocus](&v6, sel__accessibilityHasNativeFocus);
  v4 = 0;
  v3 = 0;
  if (v7)
  {
    v5 = -[UISegmentedControlAccessibility _accessibilityNativeFocusPreferredElement](v9, "_accessibilityNativeFocusPreferredElement");
    v4 = 1;
    v3 = v5 != 0;
  }
  if ((v4 & 1) != 0)

  if (v3)
    v7 = 0;
  return v7 & 1;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  unint64_t v3;
  uint64_t v4;
  objc_super v5;
  int v6;
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  SEL v12;
  UISegmentedControlAccessibility *v13;
  id v14;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v4 = objc_msgSend(v8, "selectedSegmentIndex");

  v11 = v4;
  v7 = (id)-[UISegmentedControlAccessibility safeArrayForKey:](v13, "safeArrayForKey:", CFSTR("_segments"));
  if (v11 < 0 || (v3 = v11, v3 >= objc_msgSend(v7, "count")))
  {
    v5.receiver = v13;
    v5.super_class = (Class)UISegmentedControlAccessibility;
    v14 = -[UISegmentedControlAccessibility _accessibilityNativeFocusPreferredElement](&v5, sel__accessibilityNativeFocusPreferredElement);
    v6 = 1;
  }
  else
  {
    v14 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
    v6 = 1;
  }
  objc_storeStrong(&v7, 0);
  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  UISegmentedControlAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlAccessibility;
  -[UISegmentedControlAccessibility sendActionsForControlEvents:](&v3, sel_sendActionsForControlEvents_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  BOOL v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = location[0] == (id)*MEMORY[0x24BDF76A0];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  UISegmentedControlAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlAccessibility;
  v4 = -[UISegmentedControlAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[UISegmentedControlAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return -[UISegmentedControlAccessibility safeBoolForKey:](v6, "safeBoolForKey:", CFSTR("_hasEnabledSegment")) & 1;
  else
    return v4 & 1;
}

@end
