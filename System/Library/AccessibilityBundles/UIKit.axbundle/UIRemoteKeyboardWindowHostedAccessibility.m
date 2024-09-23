@implementation UIRemoteKeyboardWindowHostedAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIRemoteKeyboardWindowHosted");
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

- (BOOL)_accessibilityWindowVisible
{
  unsigned int v3;
  id v4;
  id v5;
  objc_super v6;
  id v7;
  id v8;
  char v9;
  SEL v10;
  UIRemoteKeyboardWindowHostedAccessibility *v11;

  v11 = self;
  v10 = a2;
  v5 = (id)AXUIKeyboardWindow();
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v4 = v7;
  if (v5 == v7 && (AXUIKeyboardIsOnScreen() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v6.receiver = v11;
    v6.super_class = (Class)UIRemoteKeyboardWindowHostedAccessibility;
    v3 = -[UIRemoteKeyboardWindowHostedAccessibility _accessibilityWindowVisible](&v6, sel__accessibilityWindowVisible);
  }

  return v3 != 0;
}

@end
