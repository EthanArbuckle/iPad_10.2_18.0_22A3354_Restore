@implementation RouteStepManeuverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RouteStepManeuverView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteStepManeuverView"), CFSTR("primaryTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteStepManeuverView"), CFSTR("secondaryTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteStepManeuverView"), CFSTR("tertiaryTextLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
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

  -[RouteStepManeuverViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("primaryTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RouteStepManeuverViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("secondaryTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RouteStepManeuverViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("tertiaryTextLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
