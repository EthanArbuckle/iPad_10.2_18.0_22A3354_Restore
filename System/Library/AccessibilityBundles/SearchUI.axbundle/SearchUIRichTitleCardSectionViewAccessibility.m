@implementation SearchUIRichTitleCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIRichTitleCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TLKHeaderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIButtonItemView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRichTitleCardSectionView"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKHeaderView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKHeaderView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKHeaderView"), CFSTR("trailingText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKHeaderView"), CFSTR("footnote"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKHeaderView"), CFSTR("roundedBorderText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[SearchUIRichTitleCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("trailingText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("footnote"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeStringForKey:", CFSTR("footnote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeStringForKey:", CFSTR("roundedBorderText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUIRichTitleCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_9);
}

uint64_t __87__SearchUIRichTitleCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUIButtonItemView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
