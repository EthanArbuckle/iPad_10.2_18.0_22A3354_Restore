@implementation SearchUITrailersCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUITrailersCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TLKLabel"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TLKLabel"), CFSTR("multilineText"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("TLKMultilineText"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKMultilineText"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUITrailersCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_14);
}

uint64_t __86__SearchUITrailersCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUITrailerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUITrailersCardSectionViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_193);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("multilineText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __66__SearchUITrailersCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TLKLabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
