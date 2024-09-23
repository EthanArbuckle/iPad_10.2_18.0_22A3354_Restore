@implementation BKUICurvesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUICurvesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUICurvesView"), CFSTR("_progress"), "f");
}

- (BOOL)isAccessibilityElement
{
  void *v4;
  void *v5;
  char v6;

  if ((-[BKUICurvesViewAccessibility isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[BKUICurvesViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[BKUICurvesViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("fingerprint.image"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("fingerprint.status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUICurvesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
