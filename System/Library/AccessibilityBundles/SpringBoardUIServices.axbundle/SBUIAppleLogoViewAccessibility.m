@implementation SBUIAppleLogoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIAppleLogoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIAppleLogoView"), CFSTR("_progressWindow"), "PUIProgressWindow");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIAppleLogoView"), CFSTR("_progress"), "f");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUIProgressWindow"), CFSTR("_showsProgressBar"), "B");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v8;

  accessibilitySBLocalizedString(CFSTR("apple.logo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIAppleLogoViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("_showsProgressBar"));

  if (v5)
  {
    accessibilitySBLocalizedString(CFSTR("progress.bar.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;

  -[SBUIAppleLogoViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_showsProgressBar"));

  if (v4)
  {
    -[SBUIAppleLogoViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("_progress"));
    AXFormatFloatWithPercentage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

@end
