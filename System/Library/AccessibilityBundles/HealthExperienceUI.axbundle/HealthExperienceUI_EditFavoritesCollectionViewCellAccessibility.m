@implementation HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.EditFavoritesCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExperienceUI.EditFavoritesCollectionViewCell"), CFSTR("axItemIsFavorited"), "B", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("axItemIsFavorited"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

@end
