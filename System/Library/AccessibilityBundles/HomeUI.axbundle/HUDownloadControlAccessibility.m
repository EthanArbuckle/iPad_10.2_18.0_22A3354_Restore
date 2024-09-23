@implementation HUDownloadControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDownloadControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUDownloadControl"), CFSTR("_controlTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUDownloadControl"), CFSTR("_downloadProgressView"), "HUDownloadProgressView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[HUDownloadControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_controlTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControlAccessibility;
  -[HUDownloadControlAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[HUDownloadControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_downloadProgressView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControlAccessibility;
  -[HUDownloadControlAccessibility accessibilityValue](&v8, sel_accessibilityValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDownloadControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUDownloadControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
