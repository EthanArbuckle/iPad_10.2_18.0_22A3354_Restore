@implementation FeaturedRadioShowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.FeaturedRadioShowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedRadioShowCell"), CFSTR("headline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedRadioShowCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedRadioShowCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedRadioShowCell"), CFSTR("accessibilityIsExplicit"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if (-[FeaturedRadioShowCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")))
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[FeaturedRadioShowCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headline"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FeaturedRadioShowCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FeaturedRadioShowCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FeaturedRadioShowCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FeaturedRadioShowCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
