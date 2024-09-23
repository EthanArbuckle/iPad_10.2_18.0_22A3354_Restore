@implementation HomeScreenPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.HomeScreenPosterCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("home.screen.poster.cell.customize.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXLayoutMode(v2) == 3;

  return v3;
}

@end
