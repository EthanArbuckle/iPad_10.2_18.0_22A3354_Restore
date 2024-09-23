@implementation VideosExtrasCarouselCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosExtrasCarouselCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosExtrasCarouselCollectionViewCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosExtrasCarouselCollectionViewCell"), CFSTR("_thumbnailImageContainerView"), "VideosExtrasConstrainedArtworkContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosExtrasConstrainedArtworkContainerView"), CFSTR("artworkView"), "@", 0);

}

- (void)_accessibilityButtonifyArtworkView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[VideosExtrasCarouselCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_thumbnailImageContainerView.artworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_opt_class();
  -[VideosExtrasCarouselCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("play.extra.format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("play.extra.fallback"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setAccessibilityLabel:", v9);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewCellAccessibility;
  -[VideosExtrasCarouselCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VideosExtrasCarouselCollectionViewCellAccessibility _accessibilityButtonifyArtworkView](self, "_accessibilityButtonifyArtworkView");
}

@end
