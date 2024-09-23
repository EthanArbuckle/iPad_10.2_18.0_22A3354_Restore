@implementation ChromeHostViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.ChromeHostViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("OBContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("HKColoredButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("HealthExperienceUI.MultilineButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("HealthExperienceUI.DismissibleTileHeaderView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[ChromeHostViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __57__ChromeHostViewCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x234910658](CFSTR("HealthExperienceUI.DismissibleTileHeaderView"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
