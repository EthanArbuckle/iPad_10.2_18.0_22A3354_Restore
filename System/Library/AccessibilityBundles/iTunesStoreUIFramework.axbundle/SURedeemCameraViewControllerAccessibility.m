@implementation SURedeemCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SURedeemCameraViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SURedeemCameraViewController"), CFSTR("toggleCameraBarButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SURedeemCameraViewController"), CFSTR("_setupNavigationItem"), "v", 0);

}

- (void)_setupNavigationItem
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SURedeemCameraViewControllerAccessibility;
  -[SURedeemCameraViewControllerAccessibility _setupNavigationItem](&v3, sel__setupNavigationItem);
  -[SURedeemCameraViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SURedeemCameraViewControllerAccessibility;
  -[SURedeemCameraViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SURedeemCameraViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggleCameraBarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("flip.camera.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
