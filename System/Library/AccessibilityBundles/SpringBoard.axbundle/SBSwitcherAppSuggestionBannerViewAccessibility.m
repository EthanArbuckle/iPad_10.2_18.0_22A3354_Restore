@implementation SBSwitcherAppSuggestionBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitcherAppSuggestionBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherAppSuggestionBannerView"), CFSTR("_appLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherAppSuggestionBannerView"), CFSTR("_descriptionLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  objc_opt_class();
  -[SBSwitcherAppSuggestionBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SBSwitcherAppSuggestionBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_descriptionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("use.continuity.app"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
