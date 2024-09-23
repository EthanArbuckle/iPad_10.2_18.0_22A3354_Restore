@implementation UIInterfaceActionRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInterfaceActionRepresentationView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInterfaceActionRepresentationView"), CFSTR("_showsFocusForFocusedView:"), "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_showsFocusForFocusedView:(id)a3
{
  char v4;
  objc_super v5;
  char v6;
  id location[2];
  UIInterfaceActionRepresentationViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIInterfaceActionRepresentationViewAccessibility;
  v6 = -[UIInterfaceActionRepresentationViewAccessibility _showsFocusForFocusedView:](&v5, sel__showsFocusForFocusedView_, location[0]);
  if ((-[UIInterfaceActionRepresentationViewAccessibility _accessibilityIsFKARunningForFocusItem](v8, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v6 = 0;
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
