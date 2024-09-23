@implementation VUIDownloadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIDownloadButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadButton"), CFSTR("viewModel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadButtonViewModel"), CFSTR("downloadProgress"), "d");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadButtonViewModel"), CFSTR("downloadState"), "Q");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityDownloadState
{
  void *v2;
  unint64_t v3;

  -[VUIDownloadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("downloadState"));

  return v3;
}

- (id)accessibilityLabel
{
  unint64_t v2;

  v2 = -[VUIDownloadButtonAccessibility _accessibilityDownloadState](self, "_accessibilityDownloadState") - 1;
  if (v2 > 3)
    return accessibilityLocalizedString(CFSTR("download.button.download"));
  else
    return accessibilityLocalizedString(off_2503D2810[v2]);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIDownloadButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[VUIDownloadButtonAccessibility _accessibilityDownloadState](self, "_accessibilityDownloadState") == 2)
  {
    -[VUIDownloadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeCGFloatForKey:", CFSTR("downloadProgress"));

    AXFormatFloatWithPercentage();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIDownloadButtonAccessibility;
    -[VUIDownloadButtonAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityHint
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  v3 = -[VUIDownloadButtonAccessibility _accessibilityDownloadState](self, "_accessibilityDownloadState");
  if (v3 == 4)
  {
    v4 = CFSTR("download.button.remove.hint");
  }
  else
  {
    if (v3 != 2)
    {
      v7.receiver = self;
      v7.super_class = (Class)VUIDownloadButtonAccessibility;
      -[VUIDownloadButtonAccessibility accessibilityHint](&v7, sel_accessibilityHint);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v4 = CFSTR("download.button.cancel.hint");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
