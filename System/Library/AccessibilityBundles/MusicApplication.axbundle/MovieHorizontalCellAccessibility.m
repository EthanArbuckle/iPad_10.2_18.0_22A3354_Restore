@implementation MovieHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.MovieHorizontalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MovieHorizontalCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MovieHorizontalCell"), CFSTR("releaseDate"), "@", 0);

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

  objc_opt_class();
  -[MovieHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("releaseDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXDateStringForFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MovieHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MovieHorizontalCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MovieHorizontalCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
