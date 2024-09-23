@implementation ArtworkWithPlaybackStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ArtworkWithPlaybackStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ArtworkWithPlaybackStatusView"), CFSTR("accessibilityProgress"), "f", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("artwork.view"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("playback.progress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ArtworkWithPlaybackStatusViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilityProgress"));
  AXFormatFloatWithPercentage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
