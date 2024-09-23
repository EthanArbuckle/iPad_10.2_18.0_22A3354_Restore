@implementation PUPickerOnboardingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPickerOnboardingHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PUPickerOnboardingHeaderView"), CFSTR("title"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PUPickerOnboardingHeaderView"), CFSTR("subtitle"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PUPickerOnboardingHeaderView"), CFSTR("closeButton"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PUPickerOnboardingHeaderView"), CFSTR("learnMoreButton"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[PUPickerOnboardingHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v12.receiver = self;
  v12.super_class = (Class)PUPickerOnboardingHeaderViewAccessibility;
  -[PUPickerOnboardingHeaderViewAccessibility _accessibilitySupplementaryFooterViews](&v12, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[PUPickerOnboardingHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("closeButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
    objc_msgSend(v8, "axSafelyAddObject:", v9);
  -[PUPickerOnboardingHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("learnMoreButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
    objc_msgSend(v8, "axSafelyAddObject:", v10);

  return v8;
}

@end
