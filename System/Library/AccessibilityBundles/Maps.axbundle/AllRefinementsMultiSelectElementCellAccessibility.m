@implementation AllRefinementsMultiSelectElementCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Maps.AllRefinementsMultiSelectElementCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("Maps.AllRefinementsMultiSelectElementCell"), CFSTR("UICollectionViewCell"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AllRefinementsMultiSelectElementCellAccessibility _axRefinementMultiSelectButton](self, "_axRefinementMultiSelectButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[AllRefinementsMultiSelectElementCellAccessibility _axRefinementMultiSelectButton](self, "_axRefinementMultiSelectButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)_axRefinementMultiSelectButton
{
  return (id)-[AllRefinementsMultiSelectElementCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_0);
}

uint64_t __83__AllRefinementsMultiSelectElementCellAccessibility__axRefinementMultiSelectButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int isKindOfClass;
  void *v4;

  v2 = a2;
  MEMORY[0x2349135AC](CFSTR("SwiftUI.AccessibilityNode"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v2, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("RefinementMultiSelectButton"));
  return isKindOfClass & v2;
}

@end
