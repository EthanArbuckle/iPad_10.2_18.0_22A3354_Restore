@implementation _UIDatePickerCalendarTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerCalendarTimeView");
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
  v4 = CFSTR("_UIDatePickerCalendarTimeView");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("timeTextField"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setupViewHierarchy"), "v", 0);
  objc_storeStrong(v6, obj);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("compact.picker.time"));
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  char v4;

  v3 = (id)-[_UIDatePickerCalendarTimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeTextField"));
  v4 = objc_msgSend(v3, "resignFirstResponder");

  return v4 & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIDatePickerCalendarTimeViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeViewAccessibility;
  -[_UIDatePickerCalendarTimeViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIDatePickerCalendarTimeViewAccessibility _axHideTimeLabel](v4);
}

- (void)_axHideTimeLabel
{
  id v1;

  if (a1)
  {
    v1 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("timeLabel"));
    objc_msgSend(v1, "setIsAccessibilityElement:", 0);

  }
}

- (void)_setupViewHierarchy
{
  objc_super v2;
  SEL v3;
  _UIDatePickerCalendarTimeViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeViewAccessibility;
  -[_UIDatePickerCalendarTimeViewAccessibility _setupViewHierarchy](&v2, sel__setupViewHierarchy);
  -[_UIDatePickerCalendarTimeViewAccessibility _axHideTimeLabel](v4);
}

@end
