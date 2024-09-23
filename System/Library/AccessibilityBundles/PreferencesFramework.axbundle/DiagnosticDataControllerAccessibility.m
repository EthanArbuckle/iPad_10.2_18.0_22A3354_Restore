@implementation DiagnosticDataControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DiagnosticDataController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DiagnosticDataController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DiagnosticDataController"), CFSTR("UINavigationController"));

}

- (void)viewDidLoad
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DiagnosticDataControllerAccessibility;
  -[DiagnosticDataControllerAccessibility viewDidLoad](&v4, sel_viewDidLoad);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
