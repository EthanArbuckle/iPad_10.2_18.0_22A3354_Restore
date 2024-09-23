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
  objc_msgSend(a3, "validateClass:", CFSTR("AppInstallExtension.CarouselItemLockupCollectionView"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t *v3;

  -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905BBC](CFSTR("AppInstallExtension.CarouselItemLockupCollectionView"), a2));
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
    -[ArtworkViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234905BBC](CFSTR("AppInstallExtension.CarouselItemLockupCollectionView")));
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
