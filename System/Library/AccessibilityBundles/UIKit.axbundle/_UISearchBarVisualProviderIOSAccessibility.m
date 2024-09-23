@implementation _UISearchBarVisualProviderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchBarVisualProviderIOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UISearchBarVisualProviderIOS");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("scopeBar"), "@", 0);
  objc_storeStrong(v5, obj);
}

- (void)setUpScopeBar
{
  id v2;
  objc_super v3;
  SEL v4;
  _UISearchBarVisualProviderIOSAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarVisualProviderIOSAccessibility;
  -[_UISearchBarVisualProviderIOSAccessibility setUpScopeBar](&v3, sel_setUpScopeBar);
  v2 = (id)-[_UISearchBarVisualProviderIOSAccessibility safeValueForKey:](v5, "safeValueForKey:");
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("scopeBar"));

}

@end
