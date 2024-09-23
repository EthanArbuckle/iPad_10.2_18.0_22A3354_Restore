@implementation WAAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WAAttributionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("WAAttributionView"), CFSTR("_attributionButton"), "UIButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[WAAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributionButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("attribution.label"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("wolfram.hint"));
}

@end
