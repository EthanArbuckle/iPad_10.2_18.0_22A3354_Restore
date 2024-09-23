@implementation HUBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUBannerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUBannerCollectionViewCell"), CFSTR("bannerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUBannerView"), CFSTR("footerViewLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUBannerView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUBannerView"), CFSTR("descriptionLabel"), "@", 0);

}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  -[HUBannerCollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[HUBannerCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.footerViewLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  v7.receiver = self;
  v7.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | -[HUBannerCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits));
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
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
  void *v8;

  -[HUBannerCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.descriptionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUBannerCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
