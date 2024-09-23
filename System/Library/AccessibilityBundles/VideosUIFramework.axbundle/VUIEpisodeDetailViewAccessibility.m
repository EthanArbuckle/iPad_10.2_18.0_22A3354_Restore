@implementation VUIEpisodeDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIEpisodeDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("seasonNumberLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("episodeNumberLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("episodeTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("mediaBadgeTagsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("contentDescriptionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("releaseDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("mediaItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIEpisodeDetailView"), CFSTR("imageFrameView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeFrameView"), CFSTR("playButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeFrameView"), CFSTR("progressView"), "@", 0);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIEpisodeDetailViewAccessibility;
  -[VUIEpisodeDetailViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[VUIEpisodeDetailViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VUIEpisodeDetailViewAccessibility;
  -[VUIEpisodeDetailViewAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageFrameView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeValueForKey:", CFSTR("playButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("play"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v18, "safeValueForKey:", CFSTR("progressView"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE30];
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("seasonNumberLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("episodeNumberLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v9);
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("episodeTitleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accessibilityTraits");
  objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v12);
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("releaseDateLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaBadgeTagsView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentDescriptionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 7, v3, v5, v10, v11, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailViewAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v17);

}

@end
