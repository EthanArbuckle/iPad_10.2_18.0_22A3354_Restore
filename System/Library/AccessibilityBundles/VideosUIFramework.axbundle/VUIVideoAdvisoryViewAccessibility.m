@implementation VUIVideoAdvisoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIVideoAdvisoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIVideoAdvisoryView"), CFSTR("legendViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIVideoAdvisoryView"), CFSTR("_configureSubviewsWithDictionary:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIVideoAdvisoryView"), CFSTR("showAnimated:platterView:completion:"), "v", "B", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIVideoAdvisoryView"), CFSTR("hideAnimated:platterView:completion:"), "v", "B", "@", "@?", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("advisories.title"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[VUIVideoAdvisoryViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("legendViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
