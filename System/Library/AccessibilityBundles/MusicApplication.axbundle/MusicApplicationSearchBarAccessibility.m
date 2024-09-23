@implementation MusicApplicationSearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TtCC16MusicApplication6Search3Bar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("_TtCC16MusicApplication6Search3Bar"), CFSTR("scopeBarContentView"), "ScopeBarContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TtCC16MusicApplication6Search3Bar"), CFSTR("textFieldDidBeginEditing:"), "v", "{UITextField=#}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TtCC16MusicApplication6Search3Bar"), CFSTR("setShowsScopeBar:animated:"), "v", "B", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicApplicationSearchBarAccessibility;
  -[MusicApplicationSearchBarAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MusicApplicationSearchBarAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("scopeBarContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityElements:", v5);
}

uint64_t __84__MusicApplicationSearchBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityViewIsVisible");
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicApplicationSearchBarAccessibility;
  -[MusicApplicationSearchBarAccessibility setShowsScopeBar:animated:](&v5, sel_setShowsScopeBar_animated_, a3, a4);
  -[MusicApplicationSearchBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicApplicationSearchBarAccessibility;
  -[MusicApplicationSearchBarAccessibility textFieldDidBeginEditing:](&v4, sel_textFieldDidBeginEditing_, a3);
  -[MusicApplicationSearchBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
