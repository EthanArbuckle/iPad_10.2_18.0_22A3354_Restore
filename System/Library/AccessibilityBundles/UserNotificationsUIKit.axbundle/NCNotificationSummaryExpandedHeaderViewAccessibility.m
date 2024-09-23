@implementation NCNotificationSummaryExpandedHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationSummaryExpandedHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSummaryExpandedHeaderView"), CFSTR("_collapseControl"), "PLGlyphControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSummaryExpandedHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSummaryExpandedHeaderView"), CFSTR("_configureControlsViewIfNecessary"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryExpandedHeaderViewAccessibility;
  -[NCNotificationSummaryExpandedHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[NCNotificationSummaryExpandedHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collapseControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("collapse.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[NCNotificationSummaryExpandedHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)_configureControlsViewIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderViewAccessibility;
  -[NCNotificationSummaryExpandedHeaderViewAccessibility _configureControlsViewIfNecessary](&v3, sel__configureControlsViewIfNecessary);
  -[NCNotificationSummaryExpandedHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
