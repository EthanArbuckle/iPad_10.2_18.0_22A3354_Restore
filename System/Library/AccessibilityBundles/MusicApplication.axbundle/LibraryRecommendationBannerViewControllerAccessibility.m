@implementation LibraryRecommendationBannerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.LibraryRecommendationBannerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityBannerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityHeadlineText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityTitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilitySubtitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityIsExplicit"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityUpdateBannerDisplay"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  LibraryRecommendationBannerViewControllerAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  objc_super v18;

  v2 = self;
  v18.receiver = self;
  v18.super_class = (Class)LibraryRecommendationBannerViewControllerAccessibility;
  -[LibraryRecommendationBannerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  -[LibraryRecommendationBannerViewControllerAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("accessibilityBannerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityIdentifierBlock:", &__block_literal_global_6);
  -[LibraryRecommendationBannerViewControllerAccessibility safeStringForKey:](v2, "safeStringForKey:", CFSTR("accessibilityHeadlineText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryRecommendationBannerViewControllerAccessibility safeStringForKey:](v2, "safeStringForKey:", CFSTR("accessibilityTitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryRecommendationBannerViewControllerAccessibility safeStringForKey:](v2, "safeStringForKey:", CFSTR("accessibilitySubtitleText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[LibraryRecommendationBannerViewControllerAccessibility safeBoolForKey:](v2, "safeBoolForKey:", CFSTR("accessibilityIsExplicit"));
  accessibilityMusicLocalizedString(CFSTR("apple.music"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v12[3] = &unk_2502C9270;
  v13 = v7;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = (char)v2;
  v8 = v6;
  v9 = v5;
  v10 = v4;
  v11 = v7;
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v12);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", &__block_literal_global_206);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_208);

}

const __CFString *__100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return CFSTR("AXRecommendationBannerView");
}

id __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v3;

  if (*(_BYTE *)(a1 + 64))
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return 1;
}

uint64_t __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return *MEMORY[0x24BDF73B0];
}

- (void)accessibilityUpdateBannerDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LibraryRecommendationBannerViewControllerAccessibility;
  -[LibraryRecommendationBannerViewControllerAccessibility accessibilityUpdateBannerDisplay](&v3, sel_accessibilityUpdateBannerDisplay);
  -[LibraryRecommendationBannerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
