@implementation _SFFindOnPageInputBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFFindOnPageInputBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFFindOnPageInputBar"), CFSTR("UISearchBar"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchBar"), CFSTR("_visualProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISearchBarVisualProviderBase"), CFSTR("searchField"), "@", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFFindOnPageInputBarAccessibility;
  -[_SFFindOnPageInputBarAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_SFFindOnPageInputBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageInputBarAccessibility;
  -[_SFFindOnPageInputBarAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[_SFFindOnPageInputBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visualProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("searchField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SFFindOnPageBarIdentifier"));

}

@end
