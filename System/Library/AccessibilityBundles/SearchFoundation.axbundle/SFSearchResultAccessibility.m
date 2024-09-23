@implementation SFSearchResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFSearchResult");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFSearchResult"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFText"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFText"), CFSTR("text"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SFSearchResultAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
