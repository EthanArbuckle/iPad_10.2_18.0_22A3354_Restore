@implementation GKDashboardSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKDashboardSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardSectionHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardSectionHeaderView"), CFSTR("awakeFromNib"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSectionHeaderViewAccessibility;
  -[GKDashboardSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[GKDashboardSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_6);

}

uint64_t __87__GKDashboardSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardSectionHeaderViewAccessibility;
  -[GKDashboardSectionHeaderViewAccessibility awakeFromNib](&v3, sel_awakeFromNib);
  -[GKDashboardSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
