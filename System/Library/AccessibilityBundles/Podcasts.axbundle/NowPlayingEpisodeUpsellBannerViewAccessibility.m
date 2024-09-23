@implementation NowPlayingEpisodeUpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.NowPlayingEpisodeUpsellBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NowPlayingUI.NowPlayingEpisodeUpsellBannerView"), CFSTR("PodcastsUI.EpisodeUpsellBannerView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PodcastsUI.EpisodeUpsellBannerView"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PodcastsUI.EpisodeUpsellBannerView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PodcastsUI.EpisodeUpsellBannerView"), CFSTR("closeButtonTapped"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[NowPlayingEpisodeUpsellBannerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NowPlayingEpisodeUpsellBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_2502FD000;
  v8[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v8);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeButtonTapped");
}

@end
