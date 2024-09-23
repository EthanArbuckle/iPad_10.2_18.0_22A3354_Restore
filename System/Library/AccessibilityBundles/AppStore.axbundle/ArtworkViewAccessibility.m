@implementation ArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStoreKit.ArtworkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.BrandedAppTodayCardCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.ArcadeFooterCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.ArtworkSectionBackgroundView"));
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.CarouselItemLockupCollectionView"));

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905FEC](CFSTR("AppStore.BrandedAppTodayCardCollectionViewCell"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905FEC](CFSTR("AppStore.ArcadeFooterCollectionViewCell")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905FEC](CFSTR("AppStore.ArtworkSectionBackgroundView")));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t *v3;

  -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905FEC](CFSTR("AppStore.CarouselItemLockupCollectionView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (unint64_t *)MEMORY[0x24BDF73C8];
  if (v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  return *v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  objc_super v7;

  if (AXRequestingClient() == 15)
  {
    v7.receiver = self;
    v7.super_class = (Class)ArtworkViewAccessibility;
    -[ArtworkViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905FEC](CFSTR("AppStore.CarouselItemLockupCollectionView")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = CFSTR("app.suggestion");
    else
      v5 = CFSTR("artwork.view");
    accessibilityAppStoreLocalizedString(v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
