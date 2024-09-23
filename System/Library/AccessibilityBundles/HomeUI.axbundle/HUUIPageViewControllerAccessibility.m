@implementation HUUIPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UINavigationBar"), CFSTR("_visualProvider"), "_UINavigationBarVisualProvider");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UINavigationBarVisualProviderModernIOS"), CFSTR("_UINavigationBarVisualProvider"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UINavigationBarVisualProviderModernIOS"), CFSTR("_largeTitleView"), "_UINavigationBarLargeTitleView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UINavigationBarLargeTitleView"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UINavigationBarLargeTitleViewLayout"), CFSTR("titleLabel"), "@", 0);

}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  char v13;

  v13 = 0;
  objc_opt_class();
  -[HUUIPageViewControllerAccessibility viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("_visualProvider._largeTitleView.layout.titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "accessibilityLabel");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUUIPageViewControllerAccessibility;
    -[HUUIPageViewControllerAccessibility _accessibilityScrollStatus](&v12, sel__accessibilityScrollStatus);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

@end
