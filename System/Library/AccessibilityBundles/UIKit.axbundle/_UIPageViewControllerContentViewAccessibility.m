@implementation _UIPageViewControllerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPageViewControllerContentView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPageViewControllerContentView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  _UIPageViewControllerContentViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIPageViewControllerContentViewAccessibility;
  v4 = -[_UIPageViewControllerContentViewAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[_UIPageViewControllerContentViewAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  else
    return v4 & 1;
}

@end
