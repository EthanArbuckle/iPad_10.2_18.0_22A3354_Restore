@implementation CKHandwritingPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKHandwritingPresentationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsHandwritingEnabled
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsHandwritingEnabled:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsObservingVoiceOverNotifications
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKHandwritingPresentationController"), CFSTR("init"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKHandwritingPresentationController"), CFSTR("requestedVisibility"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKHandwritingPresentationController"), CFSTR("_updateVisibilityState"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  -[CKHandwritingPresentationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKHandwritingPresentationControllerAccessibility _axSubscribeToVoiceOverNotifications](self, "_axSubscribeToVoiceOverNotifications");
}

- (CKHandwritingPresentationControllerAccessibility)init
{
  CKHandwritingPresentationControllerAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  v2 = -[CKHandwritingPresentationControllerAccessibility init](&v4, sel_init);
  -[CKHandwritingPresentationControllerAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CKHandwritingPresentationControllerAccessibility _axUnsubscribeFromVoiceOverNotifications](self, "_axUnsubscribeFromVoiceOverNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  -[CKHandwritingPresentationControllerAccessibility dealloc](&v3, sel_dealloc);
}

- (void)_updateVisibilityState
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("AXUIKitGlue")), "safeValueForKey:", CFSTR("sharedGlueObjectIfAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isVoiceOverHandwritingEnabled")) & 1) == 0)
  {
    v4 = -[CKHandwritingPresentationControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("requestedVisibility"));
    v7.receiver = self;
    v7.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
    -[CKHandwritingPresentationControllerAccessibility _updateVisibilityState](&v7, sel__updateVisibilityState);
    if (AXDeviceIsPhoneIdiom())
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "orientation");

      }
      else
      {
        v6 = 0;
      }
      objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetApplicationOrientation:", v6);
    }
  }

}

- (void)_axSubscribeToVoiceOverNotifications
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2324ED000, log, OS_LOG_TYPE_DEBUG, "Registering UIKeyboard for handwriting notifications", v1, 2u);
}

- (void)_axUnsubscribeFromVoiceOverNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  if (-[CKHandwritingPresentationControllerAccessibility _axIsObservingVoiceOverNotifications](self, "_axIsObservingVoiceOverNotifications"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE00468], 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BE00460], 0);
    -[CKHandwritingPresentationControllerAccessibility _axSetIsObservingVoiceOverNotifications:](self, "_axSetIsObservingVoiceOverNotifications:", 0);
  }
}

@end
