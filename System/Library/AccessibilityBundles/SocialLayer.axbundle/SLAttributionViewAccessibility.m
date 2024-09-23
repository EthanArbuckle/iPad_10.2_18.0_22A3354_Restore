@implementation SLAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLAttributionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLAttributionView"), CFSTR("pillView"), "@", 0);
}

- (id)_accessibilityAXAttributedLabel
{
  void *v2;
  void *v3;

  -[SLAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pillView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAXAttributedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
