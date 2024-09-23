@implementation AccountStatusSummaryTileFeedItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthRecordsUI.AccountStatusSummaryTileFeedItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthRecordsUI.AccountStatusSummaryTileFeedItemView"), CFSTR("accessibilityActionLabel"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AccountStatusSummaryTileFeedItemViewAccessibility;
  -[AccountStatusSummaryTileFeedItemViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[AccountStatusSummaryTileFeedItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityActionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

@end
