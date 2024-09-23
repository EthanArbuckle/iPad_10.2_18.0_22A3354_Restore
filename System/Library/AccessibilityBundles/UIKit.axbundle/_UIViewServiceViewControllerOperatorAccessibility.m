@implementation _UIViewServiceViewControllerOperatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIViewServiceViewControllerOperator");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIViewServiceViewControllerOperator"), CFSTR("_localViewController"), "UIViewController");
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  id v6;
  objc_super v7;
  int v8;
  id v9;
  id v10;
  char v11;
  id v12;
  BOOL v13;
  id location[2];
  _UIViewServiceViewControllerOperatorAccessibility *v15;
  char v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v11 = 0;
  objc_opt_class();
  v6 = (id)-[_UIViewServiceViewControllerOperatorAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("_localViewController"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = v9;
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(v12, "accessibilityPostScreenChangedForChildViewController:isAddition:", location[0], v13) & 1;
    v8 = 1;
  }
  else
  {
    v7.receiver = v15;
    v7.super_class = (Class)_UIViewServiceViewControllerOperatorAccessibility;
    v16 = -[_UIViewServiceViewControllerOperatorAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](&v7, sel_accessibilityPostScreenChangedForChildViewController_isAddition_, location[0], v13);
    v8 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v16 & 1;
}

@end
