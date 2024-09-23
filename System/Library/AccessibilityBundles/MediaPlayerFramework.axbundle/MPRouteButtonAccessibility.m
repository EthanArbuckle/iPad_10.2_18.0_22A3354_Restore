@implementation MPRouteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPRouteButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPRouteButton"), CFSTR("_routeLabel"), "MPRouteLabel");
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("audio.route.button"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MPRouteButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_routeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPRouteButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MPRouteButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
