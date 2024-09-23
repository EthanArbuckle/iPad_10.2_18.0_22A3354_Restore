@implementation RankedMusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.RankedMusicVideoVerticalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RankedMusicVideoVerticalCell"), CFSTR("accessibilityRankString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RankedMusicVideoVerticalCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RankedMusicVideoVerticalCell"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RankedMusicVideoVerticalCell"), CFSTR("accessibilityIsExplicit"), "B", 0);

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

  if (-[RankedMusicVideoVerticalCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")))
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[RankedMusicVideoVerticalCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityRankString, title, artistName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RankedMusicVideoVerticalCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[RankedMusicVideoVerticalCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
