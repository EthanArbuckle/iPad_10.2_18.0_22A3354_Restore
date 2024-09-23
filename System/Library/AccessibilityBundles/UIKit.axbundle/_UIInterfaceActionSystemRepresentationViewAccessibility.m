@implementation _UIInterfaceActionSystemRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIInterfaceActionSystemRepresentationView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIInterfaceActionSystemRepresentationView"), CFSTR("_labelsView"), "_UIInterfaceActionLabelsPropertyView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIInterfaceActionLabelsPropertyView"), CFSTR("_classificationLabel"), "UILabel");
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location;
  id v9[2];
  _UIInterfaceActionSystemRepresentationViewAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v6 = (id)-[_UIInterfaceActionSystemRepresentationViewAccessibility safeValueForKey:](self, "safeValueForKey:");
  v9[0] = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_titleLabel"));

  v7 = (id)-[_UIInterfaceActionSystemRepresentationViewAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("_labelsView"));
  location = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_classificationLabel"));

  if ((objc_msgSend(location, "_accessibilityViewIsVisible") & 1) == 0)
    objc_storeStrong(&location, 0);
  v4 = (id)objc_msgSend(v9[0], "accessibilityLabel");
  v3 = (id)objc_msgSend(location, "accessibilityLabel");
  v5 = (id)__UIAXStringForVariables();

  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
  return v5;
}

@end
