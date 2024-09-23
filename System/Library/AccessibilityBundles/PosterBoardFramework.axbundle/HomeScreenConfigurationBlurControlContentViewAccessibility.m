@implementation HomeScreenConfigurationBlurControlContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.HomeScreenConfigurationBlurControlContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.HomeScreenConfigurationBlurControlContentView"), CFSTR("isSelected"), "Bool");
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if ((-[HomeScreenConfigurationBlurControlContentViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isSelected")) & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)HomeScreenConfigurationBlurControlContentViewAccessibility;
    -[HomeScreenConfigurationBlurControlContentViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("home.configuration.blur.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
