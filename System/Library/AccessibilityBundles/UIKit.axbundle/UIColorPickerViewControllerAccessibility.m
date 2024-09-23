@implementation UIColorPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIColorPickerViewController");
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
  v3 = CFSTR("UITransitionView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UITransitionView"), CFSTR("UIView"));
  v4 = CFSTR("UIColorPickerViewController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIColorPickerViewController"), CFSTR("viewWillLayoutSubviews"), "v", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  Class v4;
  objc_super v5;
  SEL v6;
  UIColorPickerViewControllerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIColorPickerViewControllerAccessibility;
  -[UIColorPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v4 = NSClassFromString(CFSTR("UITransitionView"));
  v2 = (id)-[UIColorPickerViewControllerAccessibility safeUIViewForKey:](v7, "safeUIViewForKey:", CFSTR("view"));
  v3 = (id)objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", v4);

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("UIColorPickerView"));
  objc_storeStrong(&v3, 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;
  SEL v3;
  UIColorPickerViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIColorPickerViewControllerAccessibility;
  -[UIColorPickerViewControllerAccessibility viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
  -[UIColorPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

@end
