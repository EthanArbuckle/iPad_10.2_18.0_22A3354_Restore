@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.AccountButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.AccountButton"), CFSTR("accountButton"), "UIButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("account"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("Music.AccountButton");
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_opt_class();
  -[AccountButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("accountButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  if (objc_msgSend(v4, "isEnabled"))
    v6 = v5 & ~*MEMORY[0x24BDF73E8];
  else
    v6 = *MEMORY[0x24BDF73E8] | v5;

  return v6;
}

@end
