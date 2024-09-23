@implementation TVImageProxyAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVImageProxy");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVImageProxy"), CFSTR("object"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TVImageProxyAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("object"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityRetrieveLabelForSource(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
