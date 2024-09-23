@implementation _UIAlertControllerTextFieldViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIAlertControllerTextFieldViewController");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIAlertControllerTextFieldViewController"), CFSTR("UICollectionViewController"));
  objc_storeStrong(location, 0);
}

- (void)_axModalizeViewControllerViews
{
  id v2;
  id v3;
  id v4;
  char v5;
  SEL v6;
  _UIAlertControllerTextFieldViewControllerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  objc_opt_class();
  v4 = (id)__UIAccessibilityCastAsClass();
  v3 = v4;
  objc_storeStrong(&v4, 0);
  v2 = (id)objc_msgSend(v3, "collectionView");
  objc_msgSend(v2, "setAccessibilityContainerType:", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIAlertControllerTextFieldViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerTextFieldViewControllerAccessibility;
  -[_UIAlertControllerTextFieldViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIAlertControllerTextFieldViewControllerAccessibility _axModalizeViewControllerViews](v4, "_axModalizeViewControllerViews");
}

@end
