@implementation VideosUI_CanonicalBannerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.CanonicalBannerViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityTitleImageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityContentTitleView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityContentSubtitleView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityButtonViews"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityEpisodeInfoTextView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityDescriptionTextView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityPromoTextView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityTagsView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityRolesSummaryView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityAvailabilityTextView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityAvailabilityImageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalBannerViewCell"), CFSTR("accessibilityDisclaimerTextView"), "@");

}

- (id)accessibilityElements
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
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContentTitleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContentSubtitleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButtonViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityEpisodeInfoTextView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionTextView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v9);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPromoTextView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v10);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTagsView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v11);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRolesSummaryView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v12);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAvailabilityTextView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v13);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAvailabilityImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v14);

  -[VideosUI_CanonicalBannerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDisclaimerTextView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v15);

  return v3;
}

- (id)accessibilityHeaderElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[VideosUI_CanonicalBannerViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityTitleImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CanonicalBannerViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityContentTitleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CanonicalBannerViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityContentSubtitleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
