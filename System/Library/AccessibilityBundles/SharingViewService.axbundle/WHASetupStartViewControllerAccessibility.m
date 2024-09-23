@implementation WHASetupStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WHASetupStartViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WHASetupStartViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RepairStartViewController"), CFSTR("_dismissButton"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WHASetupStartViewControllerAccessibility;
  -[WHASetupStartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WHASetupStartViewControllerAccessibility _axLabelDismissButton](self, "_axLabelDismissButton");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WHASetupStartViewControllerAccessibility;
  -[WHASetupStartViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WHASetupStartViewControllerAccessibility _axLabelDismissButton](self, "_axLabelDismissButton");
}

- (void)_axLabelDismissButton
{
  void *v3;
  void *v4;
  id v5;

  -[WHASetupStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[WHASetupStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetUserTestingIsCancelButton:", 1);

}

@end
