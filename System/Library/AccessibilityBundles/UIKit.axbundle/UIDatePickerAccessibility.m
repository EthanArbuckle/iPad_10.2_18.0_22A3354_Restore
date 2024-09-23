@implementation UIDatePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDatePicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
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
  v4 = CFSTR("UIDatePicker");
  v3 = CFSTR("UIControl");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_pickerView"), "UIView<_UIDatePickerViewComponent>");
  objc_storeStrong(v6, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 51;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UIDatePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pickerView"));
  v3 = objc_msgSend(v4[0], "accessibilityPerformEscape");
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (int64_t)accessibilityContainerType
{
  id v3;
  BOOL v4;

  v3 = (id)-[UIDatePickerAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") == 0;

  if (v4)
    return 0;
  else
    return 4;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  UIDatePickerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIDatePickerAccessibility;
  v4 = -[UIDatePickerAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[UIDatePickerAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v4 = 0;
  return v4 & 1;
}

@end
