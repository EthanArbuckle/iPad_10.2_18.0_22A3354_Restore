@implementation HomeScreenConfigurationPosterControlContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.HomeScreenConfigurationPosterControlContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.HomeScreenConfigurationPosterControlContentView"), CFSTR("primaryImageView"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;

  objc_opt_class();
  -[HomeScreenConfigurationPosterControlContentViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("primaryImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("photo.on.rectangle"));

  if (v7)
    v8 = CFSTR("home.configuration.select.photo.value");
  else
    v8 = CFSTR("home.configuration.lock.screen.poster.value");
  accessibilityLocalizedString(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
