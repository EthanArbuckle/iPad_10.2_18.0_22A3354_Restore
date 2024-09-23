@implementation _UIDatePickerLinkedLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerLinkedLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIDatePickerLinkedLabel"), CFSTR("_renderingLabel"), "UILabel");
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[_UIDatePickerLinkedLabelAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_renderingLabel"));
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
