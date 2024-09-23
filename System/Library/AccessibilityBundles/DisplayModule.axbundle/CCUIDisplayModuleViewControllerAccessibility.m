@implementation CCUIDisplayModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIDisplayModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIDisplayModuleViewController"), CFSTR("sliderView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayModuleViewControllerAccessibility;
  -[CCUIDisplayModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIDisplayModuleViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("sliderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("brightness.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7430] | v5);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayModuleViewControllerAccessibility;
  -[CCUIDisplayModuleViewControllerAccessibility loadView](&v3, sel_loadView);
  -[CCUIDisplayModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
