@implementation NCNotificationSummaryPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationSummaryPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSummaryPlatterView"), CFSTR("_summaryContentView"), "NCNotificationSummaryContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSummaryContentView"), CFSTR("_summaryDateLabel"), "UILabel<BSUIDateLabel>");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[NCNotificationSummaryPlatterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("summaryTitle, summary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryPlatterViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_summaryContentView._summaryDateLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("notification.cell.collapsed.hint"));
}

@end
