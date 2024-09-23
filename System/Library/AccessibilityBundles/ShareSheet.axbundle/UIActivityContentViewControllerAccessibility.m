@implementation UIActivityContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIActivityContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityContentViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIActivityContentViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityContentViewController"), CFSTR("headerLinkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityContentViewController"), CFSTR("_configureHeaderViewIfNeeded"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIActivityContentViewControllerAccessibility;
  -[UIActivityContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[UIActivityContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("sharing.close"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[UIActivityContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerLinkView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityContentViewControllerAccessibility;
  -[UIActivityContentViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[UIActivityContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_configureHeaderViewIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityContentViewControllerAccessibility;
  -[UIActivityContentViewControllerAccessibility _configureHeaderViewIfNeeded](&v3, sel__configureHeaderViewIfNeeded);
  -[UIActivityContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
