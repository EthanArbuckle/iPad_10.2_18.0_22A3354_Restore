@implementation HUBannerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUBannerTableViewCell");
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

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[HUBannerTableViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerTableViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.descriptionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  v7.super_class = (Class)HUBannerTableViewCellAccessibility;
  -[HUBannerTableViewCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[HUBannerTableViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bannerView.footerViewLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
