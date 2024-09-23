@implementation MusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.MusicVideoVerticalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoVerticalCell"), CFSTR("headline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoVerticalCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoVerticalCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoVerticalCell"), CFSTR("accessibilityIsExplicit"), "B", 0);

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

  -[MusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MusicVideoVerticalCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")) & 1) != 0)
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilityRoleDescription
{
  return accessibilityMusicLocalizedString(CFSTR("media.music.video"));
}

@end
