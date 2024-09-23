@implementation BFFProximityVisualPairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BFFProximityVisualPairingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BFFProximityVisualPairingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BFFProximityVisualPairingViewController"), CFSTR("visualPairingView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BFFProximityVisualPairingViewControllerAccessibility;
  -[BFFProximityVisualPairingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[BFFProximityVisualPairingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("visualPairingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("pairing.video.description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFProximityVisualPairingViewControllerAccessibility;
  -[BFFProximityVisualPairingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BFFProximityVisualPairingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
