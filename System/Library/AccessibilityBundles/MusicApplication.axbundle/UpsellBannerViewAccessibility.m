@implementation UpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.UpsellBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.UpsellBannerView"), CFSTR("showsAppleMusicLogo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.UpsellBannerView"), CFSTR("regularText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[UpsellBannerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsAppleMusicLogo"));
  objc_opt_class();
  -[UpsellBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("regularText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    accessibilityMusicLocalizedString(CFSTR("apple.music"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

@end
