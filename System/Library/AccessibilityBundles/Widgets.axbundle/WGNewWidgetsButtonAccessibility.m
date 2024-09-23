@implementation WGNewWidgetsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGNewWidgetsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGNewWidgetsButton"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WGNewWidgetsButton"), CFSTR("_overlayButton"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[WGNewWidgetsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  char v3;

  -[WGNewWidgetsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_overlayButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityActivate");

  return v3;
}

@end
