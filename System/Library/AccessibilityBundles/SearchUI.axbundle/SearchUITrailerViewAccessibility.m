@implementation SearchUITrailerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUITrailerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITrailerView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITrailerView"), CFSTR("playButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITrailerView"), CFSTR("initWithMediaItem: cardSectionView:"), "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUITrailerViewAccessibility;
  -[SearchUITrailerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SearchUITrailerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[SearchUITrailerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUITrailerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("movie.trailer.play.hint"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUITrailerViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchUITrailerViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (SearchUITrailerViewAccessibility)initWithMediaItem:(id)a3 cardSectionView:(id)a4
{
  SearchUITrailerViewAccessibility *v4;
  SearchUITrailerViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUITrailerViewAccessibility;
  v4 = -[SearchUITrailerViewAccessibility initWithMediaItem:cardSectionView:](&v7, sel_initWithMediaItem_cardSectionView_, a3, a4);
  v5 = v4;
  if (v4)
    -[SearchUITrailerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

@end
