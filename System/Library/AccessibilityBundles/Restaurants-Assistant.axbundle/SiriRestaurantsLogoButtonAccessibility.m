@implementation SiriRestaurantsLogoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriRestaurantsLogoButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsLogoButton"), CFSTR("punchOut"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIAppPunchOut"), CFSTR("appDisplayName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriRestaurantsLogoButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("punchOut"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("appDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
