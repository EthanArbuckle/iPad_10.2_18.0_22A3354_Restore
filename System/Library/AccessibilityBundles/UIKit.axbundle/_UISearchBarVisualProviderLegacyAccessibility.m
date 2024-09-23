@implementation _UISearchBarVisualProviderLegacyAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchBarVisualProviderLegacy");
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
  v3 = CFSTR("_UISearchBarVisualProviderLegacy");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("scopeBar"), "@", 0);
  objc_storeStrong(v5, obj);
}

- (void)setUpScopeBar
{
  id v2;
  objc_super v3;
  SEL v4;
  _UISearchBarVisualProviderLegacyAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarVisualProviderLegacyAccessibility;
  -[_UISearchBarVisualProviderLegacyAccessibility setUpScopeBar](&v3, sel_setUpScopeBar);
  v2 = (id)-[_UISearchBarVisualProviderLegacyAccessibility safeValueForKey:](v5, "safeValueForKey:");
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("scopeBar"));

}

@end
