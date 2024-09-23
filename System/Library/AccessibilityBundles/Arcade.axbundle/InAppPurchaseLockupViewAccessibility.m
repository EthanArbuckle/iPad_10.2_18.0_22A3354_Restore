@implementation InAppPurchaseLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.InAppPurchaseLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[InAppPurchaseLockupViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel, descriptionLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)InAppPurchaseLockupViewAccessibility;
  -[InAppPurchaseLockupViewAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[InAppPurchaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

@end
