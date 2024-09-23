@implementation RoutePlanningRefinementBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RoutePlanningRefinementBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RoutePlanningRefinementBarButton"), CFSTR("textLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[RoutePlanningRefinementBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
