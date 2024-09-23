@implementation _UINavigationBarVisualProviderModernIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UINavigationBarVisualProviderModernIOS");
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
  v3 = CFSTR("_UINavigationBarVisualProviderModernIOS");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = CFSTR("_UINavigationBarVisualProvider");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3, v4);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationBarAccessibility"), CFSTR("_accessibilityNavBarElements"), "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  BOOL v4;
  id v5;
  id v6;
  objc_super v7;
  id v8;
  int v9;
  objc_super v10;
  id v11[2];
  _UINavigationBarVisualProviderModernIOSAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)-[_UINavigationBarVisualProviderModernIOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_navigationBar"));
  v2 = (id)objc_msgSend(v11[0], "safeArrayForKey:", CFSTR("_accessibilityNavBarElements"));
  v4 = v2 != 0;

  if (v4)
  {
    v3 = (id)objc_msgSend(v11[0], "accessibilityElements");
    v8 = (id)objc_msgSend(v3, "copy");

    v7.receiver = v12;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOSAccessibility;
    -[_UINavigationBarVisualProviderModernIOSAccessibility layoutSubviews](&v7, sel_layoutSubviews);
    v5 = v11[0];
    v6 = v8;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v8, 0);
    v9 = 0;
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)_UINavigationBarVisualProviderModernIOSAccessibility;
    -[_UINavigationBarVisualProviderModernIOSAccessibility layoutSubviews](&v10, sel_layoutSubviews);
    v9 = 1;
  }
  objc_storeStrong(v11, 0);
}

@end
