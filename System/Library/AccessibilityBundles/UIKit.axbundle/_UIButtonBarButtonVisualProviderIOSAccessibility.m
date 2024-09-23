@implementation _UIButtonBarButtonVisualProviderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarButtonVisualProviderIOS");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButtonVisualProviderIOS"), CFSTR("configureButton:fromBarButtonItem:"), "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  id v5;
  id v6;
  char v7;
  objc_super v8;
  id v9;
  id location[2];
  _UIButtonBarButtonVisualProviderIOSAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)_UIButtonBarButtonVisualProviderIOSAccessibility;
  -[_UIButtonBarButtonVisualProviderIOSAccessibility configureButton:fromBarButtonItem:](&v8, sel_configureButton_fromBarButtonItem_, location[0], v9);
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsSafeCategory();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end
