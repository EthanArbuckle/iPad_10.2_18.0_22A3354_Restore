@implementation SHSHeadphoneLevelLimitSliderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SHSHeadphoneLevelLimitSliderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SHSHeadphoneLevelLimitSliderCell"), CFSTR("PSControlTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSControlTableCell"), CFSTR("controlValue"), "@", 0);

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SHSHeadphoneLevelLimitSliderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("decibel.value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("decibel.label"));
}

@end
