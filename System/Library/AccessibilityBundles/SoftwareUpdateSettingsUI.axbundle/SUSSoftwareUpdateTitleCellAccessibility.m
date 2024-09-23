@implementation SUSSoftwareUpdateTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUSSoftwareUpdateTitleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUSSoftwareUpdateTitleCell"), CFSTR("newProgressBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUSSoftwareUpdateTitleCell"), CFSTR("_progressBar"), "UIProgressView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUSSoftwareUpdateTitleCell"), CFSTR("updateStatusLabel"), "@", 0);

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  -[SUSSoftwareUpdateTitleCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSSoftwareUpdateTitleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("updateStatusLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_axApplyProgressViewLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  accessibilityLocalizedString(CFSTR("download.progress"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  -[SUSSoftwareUpdateTitleCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SUSSoftwareUpdateTitleCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSSoftwareUpdateTitleCellAccessibility _axApplyProgressViewLabel:](self, "_axApplyProgressViewLabel:", v3);

}

- (id)newProgressBar
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  v3 = -[SUSSoftwareUpdateTitleCellAccessibility newProgressBar](&v5, sel_newProgressBar);
  -[SUSSoftwareUpdateTitleCellAccessibility _axApplyProgressViewLabel:](self, "_axApplyProgressViewLabel:", v3);
  return v3;
}

@end
