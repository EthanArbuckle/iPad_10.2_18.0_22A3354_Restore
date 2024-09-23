@implementation UITabBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBarController");
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
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  SEL v8;
  UITabBarControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[UITabBarControllerAccessibility selectedViewController](v9, "selectedViewController");
  v6 = (id)__UIAccessibilityCastAsSafeCategory();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "_accessibilitySpeakThisViewController");

  return v3;
}

@end
