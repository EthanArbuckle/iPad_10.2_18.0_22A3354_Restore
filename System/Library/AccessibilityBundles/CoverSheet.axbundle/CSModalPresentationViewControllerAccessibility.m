@implementation CSModalPresentationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSModalPresentationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CSModalPresentationViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSModalPresentationViewControllerAccessibility;
  -[CSModalPresentationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CSModalPresentationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityViewIsModalBlock:", &__block_literal_global_269);

}

uint64_t __92__CSModalPresentationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSModalPresentationViewControllerAccessibility;
  -[CSModalPresentationViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CSModalPresentationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
