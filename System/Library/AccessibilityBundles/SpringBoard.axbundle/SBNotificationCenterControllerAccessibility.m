@implementation SBNotificationCenterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBNotificationCenterController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationCenterController"), CFSTR("dismissAnimated: fromCurrentState: withStepper: completion:"), "v", "B", "B", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationCenterController"), CFSTR("_handleShowNotificationCenterGesture:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBNotificationCenterController"), CFSTR("sharedInstance"), "@", 0);

}

- (void)dismissAnimated:(BOOL)a3 fromCurrentState:(BOOL)a4 withStepper:(id)a5 completion:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBNotificationCenterControllerAccessibility;
  -[SBNotificationCenterControllerAccessibility dismissAnimated:fromCurrentState:withStepper:completion:](&v6, sel_dismissAnimated_fromCurrentState_withStepper_completion_, a3, a4, a5, a6);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_cleanupAfterTransition:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBNotificationCenterControllerAccessibility;
  -[SBNotificationCenterControllerAccessibility _cleanupAfterTransition:](&v3, sel__cleanupAfterTransition_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)_accessibilityNotificationGestureInProgress
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetNotificationGestureInProgress:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_handleShowNotificationCenterGesture:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBNotificationCenterControllerAccessibility;
  v4 = a3;
  -[SBNotificationCenterControllerAccessibility _handleShowNotificationCenterGesture:](&v6, sel__handleShowNotificationCenterGesture_, v4);
  v5 = objc_msgSend(v4, "state", v6.receiver, v6.super_class);

  -[SBNotificationCenterControllerAccessibility _accessibilitySetNotificationGestureInProgress:](self, "_accessibilitySetNotificationGestureInProgress:", v5 == 1);
}

@end
