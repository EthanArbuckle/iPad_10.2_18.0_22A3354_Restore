@implementation SBControlCenterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBControlCenterController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBControlCenterController"), CFSTR("_viewController"), "UIViewController<CCUIMainViewController>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("_willBeginTransition"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("_didEndTransition"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("AXSBHearingAidDeviceController"), CFSTR("sharedController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AXSBHearingAidDeviceController"), CFSTR("showHearingAidControl:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  -[SBControlCenterControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBControlCenterControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

- (void)_willBeginTransition
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  -[SBControlCenterControllerAccessibility _willBeginTransition](&v4, sel__willBeginTransition);
  -[SBControlCenterControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

  AXPerformSafeBlock();
}

void __62__SBControlCenterControllerAccessibility__willBeginTransition__block_invoke()
{
  id v0;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("AXSBHearingAidDeviceController")), "safeValueForKey:", CFSTR("sharedController"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "showHearingAidControl:", 0);

}

- (void)_didEndTransition
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  -[SBControlCenterControllerAccessibility _didEndTransition](&v4, sel__didEndTransition);
  -[SBControlCenterControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 0);

}

@end
