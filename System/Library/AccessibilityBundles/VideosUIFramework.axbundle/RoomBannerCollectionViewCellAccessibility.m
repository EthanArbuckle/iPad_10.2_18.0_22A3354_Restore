@implementation RoomBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.RoomBannerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.RoomBannerCollectionViewCell"), CFSTR("bannerImage"), "Optional<VideosUICore.ImageView>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosUI.RoomBannerCollectionViewCell"), CFSTR("_imageView"), "UIImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoomBannerCollectionViewCellAccessibility;
  -[RoomBannerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[RoomBannerCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("bannerImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
  objc_msgSend(v4, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_2503DE1B0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoomBannerCollectionViewCellAccessibility;
  -[RoomBannerCollectionViewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[RoomBannerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
