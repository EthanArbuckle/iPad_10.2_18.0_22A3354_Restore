@implementation FeaturedMusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.FeaturedMusicVideoVerticalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedMusicVideoVerticalCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedMusicVideoVerticalCell"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedMusicVideoVerticalCell"), CFSTR("accessibilityDateReleasedText"), "@", 0);

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
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[FeaturedMusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[FeaturedMusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[FeaturedMusicVideoVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDateReleasedText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FeaturedMusicVideoVerticalCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FeaturedMusicVideoVerticalCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
