@implementation AlbumCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.AlbumCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.AlbumCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.AlbumCell"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.AlbumCell"), CFSTR("accessibilityIsExplicit"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.AlbumCell"), CFSTR("accessibilityRankString"), "@", 0);

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

  -[AlbumCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRankString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlbumCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlbumCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AlbumCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")) & 1) != 0)
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

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AlbumCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlbumCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AlbumCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AlbumCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
