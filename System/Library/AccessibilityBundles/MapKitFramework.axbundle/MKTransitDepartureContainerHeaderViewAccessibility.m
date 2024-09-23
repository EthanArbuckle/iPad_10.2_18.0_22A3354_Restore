@implementation MKTransitDepartureContainerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKTransitDepartureContainerHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MKTransitDepartureContainerHeaderView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDepartureContainerHeaderView"), CFSTR("_containerTitleLabel"), "_MKUILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MKTransitDepartureContainerHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_containerTitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)automationElements
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
