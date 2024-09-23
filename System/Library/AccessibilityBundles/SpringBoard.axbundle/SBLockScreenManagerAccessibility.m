@implementation SBLockScreenManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBLockScreenManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int)_axLastLockSource
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetLastLockSource:(int)a3
{
  __UIAccessibilitySetAssociatedInt();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("lockUIFromSource: withOptions: completion:"), "v", "i", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("_finishUIUnlockFromSource: withOptions:"), "B", "i", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("biometricAuthenticationCoordinator: requestsUnlockWithIntent:"), "B", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isUILocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("_handleAuthenticationFeedback:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("handleKeyHIDEvent:"), "B", "^{__IOHIDEvent=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAuthenticationFeedback"), CFSTR("jiggleLock"), "B", 0);

}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  objc_super v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  -[SBLockScreenManagerAccessibility _axSetLastLockSource:](self, "_axSetLastLockSource:", v6);
  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenManagerAccessibility;
  -[SBLockScreenManagerAccessibility lockUIFromSource:withOptions:completion:](&v10, sel_lockUIFromSource_withOptions_completion_, v6, v9, v8);

}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLockScreenManagerAccessibility;
  v4 = -[SBLockScreenManagerAccessibility _finishUIUnlockFromSource:withOptions:](&v6, sel__finishUIUnlockFromSource_withOptions_, *(_QWORD *)&a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
  return v4;
}

void __74__SBLockScreenManagerAccessibility__finishUIUnlockFromSource_withOptions___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_setUILocked:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((-[SBLockScreenManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUILocked")) & 1) == 0)
    +[AXSpringBoardGlue toggleVoiceOverInfoPanel](AXSpringBoardGlue, "toggleVoiceOverInfoPanel");
  v5.receiver = self;
  v5.super_class = (Class)SBLockScreenManagerAccessibility;
  -[SBLockScreenManagerAccessibility _setUILocked:](&v5, sel__setUILocked_, v3);
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLockScreenManagerAccessibility;
  v5 = -[SBLockScreenManagerAccessibility biometricAuthenticationCoordinator:requestsUnlockWithIntent:](&v7, sel_biometricAuthenticationCoordinator_requestsUnlockWithIntent_, a3);
  if (UIAccessibilityIsVoiceOverRunning() && a4 == 2 && v5)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE18]);
  return v5;
}

- (void)_handleAuthenticationFeedback:(id)a3
{
  id v4;
  UIAccessibilityNotifications v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenManagerAccessibility;
  -[SBLockScreenManagerAccessibility _handleAuthenticationFeedback:](&v9, sel__handleAuthenticationFeedback_, v4);
  if (UIAccessibilityIsVoiceOverRunning() && objc_msgSend(v4, "safeBoolForKey:", CFSTR("jiggleLock")))
  {
    v5 = *MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE10]);
    v6 = (void *)MEMORY[0x24BDFEA60];
    accessibilityLocalizedString(CFSTR("touch.id.try.again"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAttribute:forKey:", &unk_2503817F8, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(v5, v8);

  }
}

- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (_AXSFullKeyboardAccessEnabled() || UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BE00630], "representationWithHIDEvent:hidStreamIdentifier:", a3, CFSTR("AXFKA_SBLockScreenManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "translateKeycode");
      if (objc_msgSend(v7, "gsModifierState")
        || objc_msgSend(v7, "keyCode") == 79
        || objc_msgSend(v7, "keyCode") == 80
        || objc_msgSend(v7, "keyCode") == 82
        || objc_msgSend(v7, "keyCode") == 81)
      {

        return 0;
      }
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenManagerAccessibility;
  return -[SBLockScreenManagerAccessibility handleKeyHIDEvent:](&v9, sel_handleKeyHIDEvent_, a3);
}

@end
