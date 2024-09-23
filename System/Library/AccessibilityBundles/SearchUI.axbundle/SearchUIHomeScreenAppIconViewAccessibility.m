@implementation SearchUIHomeScreenAppIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIHomeScreenAppIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIHomeScreenAppIconView"), CFSTR("rowModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRowModel"), CFSTR("identifyingResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFSearchResult"), CFSTR("title"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUIHomeScreenAppIconViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("rowModel.identifyingResult.title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
