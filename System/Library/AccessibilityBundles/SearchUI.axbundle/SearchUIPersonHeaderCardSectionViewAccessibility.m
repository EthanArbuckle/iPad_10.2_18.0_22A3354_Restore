@implementation SearchUIPersonHeaderCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIPersonHeaderCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SearchUIPersonHeaderCardSectionView"), CFSTR("section"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPersonHeaderCardSection"), CFSTR("person"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPerson"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIPersonHeaderCardSectionView"), CFSTR("viewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIPersonHeaderViewController"), CFSTR("userIsUnavailable"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIPersonHeaderCardSectionViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[SearchUIPersonHeaderCardSectionViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[SearchUIPersonHeaderCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("person"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIPersonHeaderCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewController"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  LODWORD(v3) = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  if ((_DWORD)v3)
  {
    accessibilityLocalizedString(CFSTR("user.unavailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

uint64_t __70__SearchUIPersonHeaderCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "userIsUnavailable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("suggestion.contacts.header.hint"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUIPersonHeaderCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_5);
}

uint64_t __90__SearchUIPersonHeaderCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("CNActionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

@end
