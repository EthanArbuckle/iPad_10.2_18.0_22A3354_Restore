@implementation PXForYouSuggestionGadgetContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXForYouSuggestionGadgetContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXForYouSuggestionGadgetContentView"), CFSTR("keyAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXForYouSuggestionGadgetContentView"), CFSTR("badgeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXForYouSuggestionGadgetContentView"), CFSTR("caption"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXForYouSuggestionGadgetContentView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXForYouSuggestionGadgetContentView"), CFSTR("subtitleLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXForYouSuggestionGadgetContentViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXForYouSuggestionGadgetContentViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axKeyAsset
{
  return (id)-[PXForYouSuggestionGadgetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("keyAsset"));
}

- (id)accessibilityLabel
{
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

  -[PXForYouSuggestionGadgetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("badgeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("caption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentViewAccessibility _axKeyAsset](self, "_axKeyAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
