@implementation SFDownloadsBarButtonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFDownloadsBarButtonItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDownloadsBarButtonItemView"), CFSTR("_progress"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDownloadsBarButtonItemView"), CFSTR("_progressView"), "UIProgressView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(CFSTR("downloads.button"));
}

- (id)accessibilityValue
{
  void *v3;
  char v4;
  void *v5;

  -[SFDownloadsBarButtonItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SFDownloadsBarButtonItemViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("_progress"));
    AXFormatFloatWithPercentage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
