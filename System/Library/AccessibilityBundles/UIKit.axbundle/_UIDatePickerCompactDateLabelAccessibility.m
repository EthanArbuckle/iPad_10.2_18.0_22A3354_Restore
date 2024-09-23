@implementation _UIDatePickerCompactDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerCompactDateLabel");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCompactDateLabel"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIDatePickerIOSCompactView"), CFSTR("_presentation"), "_UIDatePickerOverlayPresentation");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerOverlayPresentation"), CFSTR("activeMode"), "q", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  id v3;
  BOOL v4;
  id location[3];
  int64_t v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCompactDateLabelAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerIOSCompactView")));
  v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_presentation"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("activeMode")) != 2;

  if (v4)
    v6 = 2;
  else
    v6 = 1;
  objc_storeStrong(location, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[_UIDatePickerCompactDateLabelAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textLabel"));
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

@end
