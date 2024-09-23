@implementation COSFeatureHighlightRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSFeatureHighlightRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSFeatureHighlightRowView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSFeatureHighlightRowView"), CFSTR("body"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[COSFeatureHighlightRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSFeatureHighlightRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("body"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
