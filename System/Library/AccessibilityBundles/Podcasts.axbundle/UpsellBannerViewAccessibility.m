@implementation UpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.UpsellBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.UpsellBannerView"), CFSTR("subscriptionNameAreaView"), "SubscriptionNameAreaView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.SubscriptionNameAreaView"), CFSTR("model"), "Optional<UpsellBanner>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKit.UpsellBanner"), CFSTR("subscriptionTitle"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.SubscriptionNameAreaView"), CFSTR("accessibilityChannelLinkButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ChevronButton"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.UpsellBannerView"), CFSTR("shortTitleLabel"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.UpsellBannerView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.UpsellBannerView"), CFSTR("accessibilityBenefitButton"), "@", 0);

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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  -[UpsellBannerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subscriptionNameAreaView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftStringForKey:", CFSTR("subscriptionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityChannelLinkButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("accessibilityTitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[UpsellBannerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("shortTitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[UpsellBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UpsellBannerViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UpsellBannerViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UpsellBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityBenefitButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

@end
