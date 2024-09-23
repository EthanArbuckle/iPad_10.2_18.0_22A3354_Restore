@implementation SmallPlayerCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.SmallPlayerCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SmallPlayerCardView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SmallPlayerCardView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SmallPlayerCardView"), CFSTR("accessibilityInviteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SmallPlayerCardView"), CFSTR("accessibilityCloseButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SmallPlayerCardViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SmallPlayerCardViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SmallPlayerCardViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SmallPlayerCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityInviteButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SmallPlayerCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v6);

  objc_msgSend(v3, "axSafelyAddObject:", v4);
  -[SmallPlayerCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCloseButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXGameCenterUIFrameworkLocString(CFSTR("CLOSE_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  objc_msgSend(v5, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityValue:", v9);

  objc_msgSend(v3, "axSafelyAddObject:", v7);
  return v3;
}

@end
