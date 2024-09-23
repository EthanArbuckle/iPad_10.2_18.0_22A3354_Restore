@implementation SearchUICombinedCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUICombinedCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICircleButtonItemView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  -[SearchUICombinedCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    UIAXStringForAllChildren();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICombinedCollectionViewCellAccessibility;
    -[SearchUICombinedCollectionViewCellAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICombinedCollectionViewCellAccessibility;
  v3 = -[SearchUICombinedCollectionViewCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[SearchUICombinedCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v4 = ~*MEMORY[0x24BDF7400];
  else
    v4 = -1;
  return v4 & v3;
}

- (id)accessibilityElements
{
  return (id)-[SearchUICombinedCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_3);
}

uint64_t __72__SearchUICombinedCollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUICardSectionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUICombinedCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_192);
}

uint64_t __89__SearchUICombinedCollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUICircleButtonItemView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
