@implementation VUIFavoriteBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIFavoriteBannerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFavoriteBannerCollectionViewCell"), CFSTR("bannerView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFavoriteBannerView"), CFSTR("titleLabel"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[VUIFavoriteBannerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bannerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIFavoriteBannerCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIFavoriteBannerCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("sports.button.favorites.hint"));
}

@end
