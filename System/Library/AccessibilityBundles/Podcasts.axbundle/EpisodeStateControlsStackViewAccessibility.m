@implementation EpisodeStateControlsStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.EpisodeStateControlsStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeStateControlsStackView"), CFSTR("accessibilityBookmarkBadge"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeStateControlsStackView"), CFSTR("accessibilityDownloadBadge"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EpisodeStateControlsStackViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[EpisodeStateControlsStackViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[EpisodeStateControlsStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityBookmarkBadge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    accessibilityLocalizedString(CFSTR("saved"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[EpisodeStateControlsStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDownloadBadge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    accessibilityLocalizedString(CFSTR("downloaded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
