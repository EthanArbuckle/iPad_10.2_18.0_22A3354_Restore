@implementation SearchUILargeTitleDetailedRowCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUILargeTitleDetailedRowCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUILargeTitleDetailedRowCardSectionView"), CFSTR("titleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUILargeTitleDetailedRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUILargeTitleDetailedRowCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_2);
}

uint64_t __99__SearchUILargeTitleDetailedRowCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

@end
