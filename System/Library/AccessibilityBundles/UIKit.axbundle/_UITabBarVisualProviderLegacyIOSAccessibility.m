@implementation _UITabBarVisualProviderLegacyIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITabBarVisualProviderLegacyIOS");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITabBarVisualProviderLegacyIOS"), CFSTR("createViewForTabBarItem:"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)createViewForTabBarItem:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  _UITabBarVisualProviderLegacyIOSAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UITabBarVisualProviderLegacyIOSAccessibility;
  v6 = -[_UITabBarVisualProviderLegacyIOSAccessibility createViewForTabBarItem:](&v5, sel_createViewForTabBarItem_, location[0]);
  AXApplyTabBarItemPropertiesToView(location[0], v6);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
