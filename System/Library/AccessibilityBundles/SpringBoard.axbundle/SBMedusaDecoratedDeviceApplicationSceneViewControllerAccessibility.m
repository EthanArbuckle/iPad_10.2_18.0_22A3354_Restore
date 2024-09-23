@implementation SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("_deviceApplicationSceneHandle"), "SBDeviceApplicationSceneHandle");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("initWithDeviceApplicationSceneHandle:layoutRole:"), "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("_topAffordanceViewController"), "SBTopAffordanceViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTopAffordanceViewController"), CFSTR("dotsView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBDeviceApplicationSceneHandle"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeviceApplicationSceneHandle"), CFSTR("SBApplicationSceneHandle"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneHandle"), CFSTR("application"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);

}

- (SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4
{
  SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility;
  v4 = -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility initWithDeviceApplicationSceneHandle:layoutRole:](&v6, sel_initWithDeviceApplicationSceneHandle_layoutRole_, a3, a4);
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility;
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility;
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility _axSetUpAffordanceViewController](self, "_axSetUpAffordanceViewController");
}

- (void)_axSetUpAffordanceViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topAffordanceViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("dotsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_deviceApplicationSceneHandle.application"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axSetApplicationDisplayName:", v7);

  }
}

@end
