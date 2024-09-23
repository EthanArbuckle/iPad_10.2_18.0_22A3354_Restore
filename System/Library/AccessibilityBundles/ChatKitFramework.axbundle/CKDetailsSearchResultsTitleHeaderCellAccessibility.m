@implementation CKDetailsSearchResultsTitleHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsSearchResultsTitleHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKDetailsSearchResultsTitleHeaderCell"), CFSTR("CKSearchResultsTitleHeaderCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchResultsTitleHeaderCell"), CFSTR("sectionTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchResultsTitleHeaderCell"), CFSTR("showAllButton"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKDetailsSearchResultsTitleHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showAllButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[CKDetailsSearchResultsTitleHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sectionTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0] | objc_msgSend(v5, "accessibilityTraits"));
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
