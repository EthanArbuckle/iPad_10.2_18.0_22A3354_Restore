@implementation FeaturedPlaylistCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.FeaturedPlaylistCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedPlaylistCell"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedPlaylistCell"), CFSTR("descriptionText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[FeaturedPlaylistCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FeaturedPlaylistCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FeaturedPlaylistCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FeaturedPlaylistCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
