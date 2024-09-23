@implementation CondensedEditorialSearchResultContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.CondensedEditorialSearchResultContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CondensedEditorialSearchResultContentView"), CFSTR("accessibilityHeaderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CondensedEditorialSearchResultContentView"), CFSTR("accessibilityTitleLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityAppStoreLocalizedString(CFSTR("view.developer.hint"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[CondensedEditorialSearchResultContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeaderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CondensedEditorialSearchResultContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CondensedEditorialSearchResultContentViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CondensedEditorialSearchResultContentViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
