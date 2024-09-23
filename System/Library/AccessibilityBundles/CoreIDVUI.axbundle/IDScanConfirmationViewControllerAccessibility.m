@implementation IDScanConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVUI.IDScanConfirmationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CoreIDVUI.IdentityProofingViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDScanConfirmationViewControllerAccessibility;
  -[IDScanConfirmationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[IDScanConfirmationViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
  objc_msgSend(v3, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_2501ECD10);
  accessibilityLocalizedString(CFSTR("id.card.scanned.photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDScanConfirmationViewControllerAccessibility;
  -[IDScanConfirmationViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[IDScanConfirmationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
