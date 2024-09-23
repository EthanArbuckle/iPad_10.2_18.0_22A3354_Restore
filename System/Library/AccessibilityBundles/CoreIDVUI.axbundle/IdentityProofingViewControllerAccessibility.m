@implementation IdentityProofingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVUI.IdentityProofingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CoreIDVUI.IdentityProofingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVUI.IdentityProofingViewController"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IdentityProofingViewControllerAccessibility;
  -[IdentityProofingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[IdentityProofingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IdentityProofingViewControllerAccessibility;
  -[IdentityProofingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[IdentityProofingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)IdentityProofingViewControllerAccessibility;
  -[IdentityProofingViewControllerAccessibility viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[IdentityProofingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  v10 = *MEMORY[0x24BDF7348];
  v11[0] = *MEMORY[0x24BDF7300];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);
}

@end
