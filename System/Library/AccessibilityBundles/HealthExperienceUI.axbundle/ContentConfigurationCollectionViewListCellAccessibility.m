@implementation ContentConfigurationCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.ContentConfigurationCollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HealthExperienceUI.ContentConfigurationCollectionViewListCell"), CFSTR("UIView"));
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  -[ContentConfigurationCollectionViewListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userInteractionEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BEBB120];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

@end
