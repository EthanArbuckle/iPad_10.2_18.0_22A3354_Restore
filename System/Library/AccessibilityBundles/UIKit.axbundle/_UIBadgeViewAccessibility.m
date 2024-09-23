@implementation _UIBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBadgeView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIBadgeView"), CFSTR("_label"), "UILabel");
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[_UIBadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (id)objc_msgSend(v4[0], "accessibilityLabel");
  objc_storeStrong(v4, 0);
  return v3;
}

@end
