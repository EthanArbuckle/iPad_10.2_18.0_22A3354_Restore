@implementation ArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStoreKit.ArtworkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (AXRequestingClient() == 15)
  {
    v5.receiver = self;
    v5.super_class = (Class)ArtworkViewAccessibility;
    -[ArtworkViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityAppStoreLocalizedString(CFSTR("artwork.view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
