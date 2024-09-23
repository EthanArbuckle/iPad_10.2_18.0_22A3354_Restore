@implementation SBElasticHUDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBElasticHUDViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SBElasticHUDViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBElasticHUDViewControllerAccessibility;
  -[SBElasticHUDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBElasticHUDViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityElementsHiddenBlock:", &__block_literal_global_17);

}

BOOL __85__SBElasticHUDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBElasticHUDViewControllerAccessibility;
  -[SBElasticHUDViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBElasticHUDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
