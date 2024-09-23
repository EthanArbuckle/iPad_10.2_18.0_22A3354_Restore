@implementation CRKCardSectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CRKCardSectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRKCardSectionViewController"), CFSTR("_setupCardSectionButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRKCardSectionViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CRKCardSectionViewController"), CFSTR("_overlayButton"), "CRKOverlayButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CRKCardSectionViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  -[CRKCardSectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[CRKCardSectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_overlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CRKCardSectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_overlayButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "_accessibilityViewIsVisible");

  -[CRKCardSectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    v7 = *MEMORY[0x24BDF73B0];
  else
    v7 = 0;
  objc_msgSend(v5, "setAccessibilityTraits:", v7);

}

- (void)_setupCardSectionButtons
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  -[CRKCardSectionViewControllerAccessibility _setupCardSectionButtons](&v3, sel__setupCardSectionButtons);
  -[CRKCardSectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  -[CRKCardSectionViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CRKCardSectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
