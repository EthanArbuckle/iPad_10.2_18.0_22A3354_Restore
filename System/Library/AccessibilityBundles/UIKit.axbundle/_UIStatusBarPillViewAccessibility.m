@implementation _UIStatusBarPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarPillView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarPillView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIStatusBarPillViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIStatusBarPillViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  char v4;
  id v5;
  objc_super v6;
  SEL v7;
  _UIStatusBarPillViewAccessibility *v8;
  BOOL v9;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarPillViewAccessibility;
  v4 = 0;
  v3 = 1;
  if (!-[_UIStatusBarPillViewAccessibility canBecomeFocused](&v6, sel_canBecomeFocused))
  {
    v5 = (id)-[_UIStatusBarPillViewAccessibility accessibilityLabel](v8, "accessibilityLabel");
    v4 = 1;
    v3 = objc_msgSend(v5, "length") != 0;
  }
  v9 = v3;
  if ((v4 & 1) != 0)

  return v9;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)accessibilityElements
{
  if (-[_UIStatusBarPillViewAccessibility isAccessibilityElement](self, "isAccessibilityElement", a2, self))
    return 0;
  else
    return MEMORY[0x24BDBD1A8];
}

- (id)accessibilityHint
{
  id v3;
  id v4;
  id v5;

  v4 = accessibilityLocalizedString(CFSTR("status.backgroundactivity.hint"));
  v3 = AXStatusBarItemHint(self);
  v5 = (id)__UIAXStringForVariables();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  BOOL v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  _UIStatusBarPillViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarPillViewAccessibility;
  v6 = -[_UIStatusBarPillViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BDF73B0];
  v2 = AXStatusBarPillTimeView(v8);
  v4 = v2 == 0;

  if (!v4)
    v6 |= *MEMORY[0x24BDF7430] | *MEMORY[0x24BEBB0F8];
  return v6;
}

@end
