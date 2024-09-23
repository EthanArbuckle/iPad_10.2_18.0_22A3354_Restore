@implementation UIInputSwitcherTableCellSegmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcherTableCellSegmentView");
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
  v3 = CFSTR("UIInputSwitcherTableCellSegmentView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("label"), "@", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  objc_super v4;
  int v5;
  id v6;
  id v7;
  char v8;
  id v9[2];
  UIInputSwitcherTableCellSegmentViewAccessibility *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v3 = (id)-[UIInputSwitcherTableCellSegmentViewAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("label"));
  v7 = (id)__UIAccessibilityCastAsClass();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = (id)objc_msgSend(v6, "text");

  if (objc_msgSend(v9[0], "length"))
  {
    v11 = v9[0];
  }
  else
  {
    v4.receiver = v10;
    v4.super_class = (Class)UIInputSwitcherTableCellSegmentViewAccessibility;
    v11 = -[UIInputSwitcherTableCellSegmentViewAccessibility accessibilityLabel](&v4, sel_accessibilityLabel);
  }
  v5 = 1;
  objc_storeStrong(v9, 0);
  return v11;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  unint64_t v4;
  objc_super v5;
  char v6;
  SEL v7;
  UIInputSwitcherTableCellSegmentViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = -[UIInputSwitcherTableCellSegmentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")) & 1;
  v5.receiver = v8;
  v5.super_class = (Class)UIInputSwitcherTableCellSegmentViewAccessibility;
  v4 = -[UIInputSwitcherTableCellSegmentViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
  if ((v6 & 1) != 0)
    v3 = *MEMORY[0x24BDF7400];
  else
    v3 = 0;
  return v4 | v3;
}

@end
