@implementation SearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SearchResultCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SearchResultCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SearchResultCell"), CFSTR("additionalDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SearchResultCell"), CFSTR("accessibilityIsExplicit"), "B", 0);

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

  -[SearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("additionalDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SearchResultCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")) & 1) != 0)
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchResultCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
