@implementation ZoomServicesUI

+ (void)enableZoomServices
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsAXUIServer(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 82, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (ZoomServicesUI)init
{
  ZoomServicesUI *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ZoomServicesUI;
  v2 = -[ZoomServicesUI init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleZoomEnabledStatusDidChangeNotification_, *MEMORY[0x24BED29C0], 0);

    -[ZoomServicesUI _updateForCurrentZoomStatus](v2, "_updateForCurrentZoomStatus");
  }
  return v2;
}

- (void)setRegisteredForAppNotifications:(BOOL)a3
{
  self->_registeredForAppNotifications = a3;
}

- (void)_updateForCurrentZoomStatus
{
  if (_AXSZoomTouchEnabled())
  {
    -[ZoomServicesUI _installZoomUISafeCategoriesIfNeeded](self, "_installZoomUISafeCategoriesIfNeeded");
    -[ZoomServicesUI _registerForAppNotifications](self, "_registerForAppNotifications");
  }
  else
  {
    -[ZoomServicesUI _unregisterForAppNotifications](self, "_unregisterForAppNotifications");
  }
}

- (void)_unregisterForAppNotifications
{
  void *v3;
  const __CFString *v4;

  if (-[ZoomServicesUI isRegisteredForAppNotifications](self, "isRegisteredForAppNotifications"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF71C8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF71C0], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B80], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B78], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ZoomUIAleartWillAppearNotification"), 0);
    if (soft_AXProcessIsSpringBoard())
    {
      objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBLockButtonPressedNotification"), 0);
      v4 = CFSTR("SBUIAppSwitcherRevealedNotification");
    }
    else
    {
      objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);
      v4 = (const __CFString *)*MEMORY[0x24BDF7528];
    }
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  }
  -[ZoomServicesUI setRegisteredForAppNotifications:](self, "setRegisteredForAppNotifications:", 0);
}

- (BOOL)isRegisteredForAppNotifications
{
  return self->_registeredForAppNotifications;
}

+ (void)disableZoomServices
{
  void *v2;

  v2 = (void *)_SharedZoomServicesUI;
  _SharedZoomServicesUI = 0;

}

+ (CGPoint)_unMappedZoomPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGPoint v22;

  y = a3.y;
  x = a3.x;
  if (CGRectIsEmpty(*(CGRect *)zoomFrame))
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomFrameOnDisplay:", objc_msgSend(v7, "displayID"));
    *(_QWORD *)zoomFrame = v8;
    *(_QWORD *)&zoomFrame[8] = v9;
    *(_QWORD *)&zoomFrame[16] = v10;
    *(_QWORD *)&zoomFrame[24] = v11;

  }
  v22.x = x;
  v22.y = y;
  if (CGRectContainsPoint(*(CGRect *)zoomFrame, v22))
  {
    v12 = (x - *(double *)zoomFrame) / *(double *)&zoomFrame[16];
    v13 = (y - *(double *)&zoomFrame[8]) / *(double *)&zoomFrame[24];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    x = v12 * v16;
    y = v13 * v18;
  }
  v19 = x;
  v20 = y;
  result.y = v20;
  result.x = v19;
  return result;
}

+ (BOOL)_deviceIsPortrait
{
  return (unint64_t)(objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation") - 1) < 2;
}

+ (BOOL)_shouldUnmapPointsForFluidGestures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  if (_AXSZoomTouchEnabled())
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeZoomModeOnDisplay:", objc_msgSend(v4, "displayID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE00490])
      && (!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad()))
    {
      v6 = !UIAccessibilityIsReduceMotionEnabled();
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ZoomServicesUI _unregisterForAppNotifications](self, "_unregisterForAppNotifications");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ZoomServicesUI;
  -[ZoomServicesUI dealloc](&v4, sel_dealloc);
}

- (Class)_accessibilityBundlePrincipalClass
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  AXSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/AccessibilityBundles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("UIKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("axbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "principalClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (void)_registerForAppNotifications
{
  void *v3;
  char *v4;
  const __CFString *v5;

  if (!-[ZoomServicesUI isRegisteredForAppNotifications](self, "isRegisteredForAppNotifications"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleRegisterZoomConflictNotification_, *MEMORY[0x24BDF71C8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleZoomFocusDidChangeNotification_, *MEMORY[0x24BDF71C0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleFirstResponderDidChangeNotification_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyboardWillShowNotification_, *MEMORY[0x24BDF7B80], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyboardWillHideNotification_, *MEMORY[0x24BDF7B78], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyboardDidHideNotification_, *MEMORY[0x24BDF79F8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAlertWillAppearNotification_, CFSTR("ZoomUIAleartWillAppearNotification"), 0);
    if (soft_AXProcessIsSpringBoard())
    {
      objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLockButtonWasPressedNotification_, CFSTR("SBLockButtonPressedNotification"), 0);
      v4 = sel__handleAppSwitcherWillBeginRevealNotification_;
      v5 = CFSTR("SBUIAppSwitcherRevealedNotification");
    }
    else
    {
      objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAppDidBecomeActiveNotification_, *MEMORY[0x24BDF7510], 0);
      v4 = sel__handleAppDidEnterBackgroundNotification_;
      v5 = (const __CFString *)*MEMORY[0x24BDF7528];
    }
    objc_msgSend(v3, "addObserver:selector:name:object:", self, v4, v5, 0);

  }
  -[ZoomServicesUI setRegisteredForAppNotifications:](self, "setRegisteredForAppNotifications:", 1);
}

- (void)_installZoomUISafeCategoriesIfNeeded
{
  if (_installZoomUISafeCategoriesIfNeeded_onceToken != -1)
    dispatch_once(&_installZoomUISafeCategoriesIfNeeded_onceToken, &__block_literal_global);
}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAXValidationManagerClass_softClass;
  v7 = getAXValidationManagerClass_softClass;
  if (!getAXValidationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXValidationManagerClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXValidationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_223, &__block_literal_global_351, &__block_literal_global_355, &__block_literal_global_357);

}

uint64_t __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("UIAlertController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerPhoneTVMacView"), CFSTR("_contentView"), "UIView");
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIKeyShortcutHUDService"), CFSTR("sharedHUDService"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyShortcutHUDService"), CFSTR("dismissOrCancelHUDPresentationIfNeeded"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyShortcutHUDService"), CFSTR("_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDragInteraction"), CFSTR("_sessionHandedOffDragImage:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDragInteraction"), CFSTR("_sessionWillEnd:withOperation:"), "v", "@", "Q", 0);
  if (soft_AXProcessIsSpringBoard())
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardLockScreenEnvironment"), CFSTR("finishUIUnlockFromSource:"), "v", "i", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityActivationAnimationStartDelay"), "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityActivationAnimationWillBegin"), "v", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityDeactivationAnimationStartDelay"), "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityDeactivationAnimationWillBegin"), "v", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilitySettings"), CFSTR("yOffsetFactor"), "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilitySettings"), CFSTR("homeGestureSwipeDownHeight"), "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("_undimFromSource:"), "v", "q", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPanGestureRecognizer"), CFSTR("translationInView:"), "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPanGestureRecognizer"), CFSTR("locationInView:"), "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPanGestureRecognizer"), CFSTR("setTranslation:inView:"), "v", "{CGPoint=dd}", "@", 0);
    v3 = objc_opt_class();
    objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIPanGestureRecognizer"), CFSTR("_lastSceneReferenceLocation"), soft___ax_verbose_encode_with_type_encoding_group_class(v3));
    v4 = objc_opt_class();
    objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIPanGestureRecognizer"), CFSTR("_firstSceneReferenceLocation"), soft___ax_verbose_encode_with_type_encoding_group_class(v4));
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBFluidSwitcherScreenEdgePanGestureRecognizer"), CFSTR("UIPanGestureRecognizer"));
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherGestureManager"), CFSTR("gestureRecognizer:shouldReceiveTouch:"), "B", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherGestureManager"), CFSTR("activateReachabilityGestureRecognizer"), "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherGestureManager"), CFSTR("reachabilitySettings"), "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherGestureManager"), CFSTR("switcherContentController"), "@", 0);
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("UIScreenEdgePanGestureRecognizer"), CFSTR("UIPanGestureRecognizer"));
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBHomeGesturePanGestureRecognizer"), CFSTR("UIScreenEdgePanGestureRecognizer"));
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("handleFluidSwitcherGestureManager:didBeginGesture:"), "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("handleFluidSwitcherGestureManager:didEndGesture:"), "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBChainableModifier"), CFSTR("enumerateChildModifiersWithBlock:"), "v", "@?", 0);
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBHomeGestureSwitcherModifier"), CFSTR("SBChainableModifier"));
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBHomeGestureRootSwitcherModifier"), CFSTR("SBChainableModifier"));
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBFluidSwitcherRootSwitcherModifier"), CFSTR("SBChainableModifier"));
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBSwitcherModifier"), CFSTR("SBChainableModifier"));
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeGestureSwitcherModifier"), CFSTR("currentFinalDestination"), "q", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeGestureDockSwitcherModifier"), CFSTR("_shouldPresentDockForFinalDestination:"), "B", "q", 0);
    objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHomeGestureSwitcherModifier"), CFSTR("_dockModifier"), "SBHomeGestureDockSwitcherModifier");
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITouch"), CFSTR("locationInView:"), "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIGestureRecognizer"), CFSTR("touchesBegan:withEvent:"), "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIGestureRecognizer"), CFSTR("touchesEnded:withEvent:"), "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBReachabilityGestureRecognizer"), CFSTR("UIGestureRecognizer"));
  }
  else if (soft_AXProcessIsInCallService())
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("presentMedicalID"), "v", 0);
  }

  return 1;
}

uint64_t __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Zoom UI"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Zoom UI"));
  objc_msgSend(v2, "setDebugBuild:", 0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = getAXPerformValidationChecksSymbolLoc_ptr;
  v11 = getAXPerformValidationChecksSymbolLoc_ptr;
  if (!getAXPerformValidationChecksSymbolLoc_ptr)
  {
    v4 = (void *)AccessibilityUtilitiesLibrary();
    v3 = dlsym(v4, "AXPerformValidationChecks");
    v9[3] = (uint64_t)v3;
    getAXPerformValidationChecksSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1();
  v6 = ((uint64_t (*)(uint64_t))v3)(v5);

  return v6;
}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_UIAlertControllerOverride"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_UIKeyShortcutHUDServiceOverride"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_UIDragInteraction"), 1);
  if (soft_AXProcessIsSpringBoard())
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerInterestInZoomAttributes");

    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SpringBoardOverride"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBDashBoardLockScreenEnvironmentOverride"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBReachabilitySettingsOverride"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBBacklightController"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBFluidSwitcherViewController"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBFluidSwitcherGestureManager"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBHomeGesturePanGestureRecognizer"), 1);
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ZoomUI_SBReachabilityGestureRecognizer"), 1);
    v3 = CFSTR("ZoomUI_UITouchReachabilityOverride");
LABEL_5:
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", v3, 1);
    goto LABEL_6;
  }
  if (soft_AXProcessIsInCallService())
  {
    v3 = CFSTR("ZoomUI_PHSOSViewController");
    goto LABEL_5;
  }
LABEL_6:

}

- (CGRect)_keyboardFrameInScreenCoordinates
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  if (soft_AXUIKeyboardIsOnScreen())
  {
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    soft_AXUIKeyboardWindow();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_convertRectToSceneReferenceSpace:", v3, v5, v7, v9);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v12 = *MEMORY[0x24BDBF070];
    v14 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_handleFirstResponderDidChangeNotification:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  dispatch_time_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255EA92A0);
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke;
    v13[3] = &unk_24FED5FB0;
    v15 = v5;
    v14 = v4;
    v7 = (void *)MEMORY[0x2348BF4D0](v13);
    if (v5)
      v8 = 200000000;
    else
      v8 = 0;
    v9 = dispatch_time(0, v8);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke_2;
    block[3] = &unk_24FED5FD8;
    v12 = v7;
    v10 = v7;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

  }
}

void __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  CGRect v74;

  if (soft_AXUIKeyboardIsOnScreen())
  {
    v2 = *MEMORY[0x24BDBF090];
    v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
    if (*(_BYTE *)(a1 + 40))
    {
      v6 = *(id *)(a1 + 32);
      objc_msgSend(v6, "endOfDocument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "caretRectForPosition:", v7);
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(*(id *)(a1 + 32), "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "convertRect:fromView:", *(_QWORD *)(a1 + 32), v9, v11, v13, v15);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        objc_msgSend(*(id *)(a1 + 32), "window");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "convertRect:toWindow:", 0, v18, v20, v22, v24);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        objc_msgSend(*(id *)(a1 + 32), "window");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = soft_AXUIConvertRectFromScreenToContextSpace(v34, v27, v29, v31, v33);
        v3 = v35;
        v4 = v36;
        v5 = v37;

      }
    }
    v74.origin.x = v2;
    v74.origin.y = v3;
    v74.size.width = v4;
    v74.size.height = v5;
    if (CGRectIsEmpty(v74))
    {
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(*(id *)(a1 + 32), "window");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "convertRect:fromView:", *(_QWORD *)(a1 + 32), v39, v41, v43, v45);
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;

      objc_msgSend(*(id *)(a1 + 32), "window");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "convertRect:toWindow:", 0, v48, v50, v52, v54);
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;

      objc_msgSend(*(id *)(a1 + 32), "window");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = soft_AXUIConvertRectFromScreenToContextSpace(v64, v57, v59, v61, v63);
      v3 = v65;
      v4 = v66;
      v5 = v67;

    }
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v73 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "window");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "_contextId");
    objc_msgSend(*(id *)(a1 + 32), "window");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "screen");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "displayIdentity");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 6, v69, objc_msgSend(v72, "displayID"), v2, v3, v4, v5);

  }
}

uint64_t __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleZoomFocusDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("frame"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSRectFromString(v9);

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = *MEMORY[0x24BDBF070];
      v13 = *(double *)(MEMORY[0x24BDBF070] + 8);
      v14 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v15 = *(double *)(MEMORY[0x24BDBF070] + 24);
    }
    else
    {
      -[ZoomServicesUI _keyboardFrameInScreenCoordinates](self, "_keyboardFrameInScreenCoordinates");
      v12 = v16;
      v13 = v17;
      v14 = v18;
      v15 = v19;
    }
    v20 = v4;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v21 = getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr;
    v37 = getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr;
    if (!getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr)
    {
      v22 = (void *)AccessibilityUIUtilitiesLibrary();
      v21 = dlsym(v22, "AXUIRectForZoomFocusChangeNotification");
      v35[3] = (uint64_t)v21;
      getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr = v21;
    }
    _Block_object_dispose(&v34, 8);
    if (!v21)
      -[ZoomServicesUI _handleZoomFocusDidChangeNotification:].cold.1();
    v23 = ((double (*)(id))v21)(v20);
    v25 = v24;
    v27 = v26;
    v29 = v28;

    objc_msgSend(getZoomServicesClass(), "sharedInstance", v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v11, "_contextId");
    objc_msgSend(v11, "screen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "notifyZoomFocusDidChangeWithType:rect:contextId:keyboardFrame:displayId:", v7, v31, objc_msgSend(v33, "displayID"), v23, v25, v27, v29, v12, v13, v14, v15);

  }
}

- (void)_handleRegisterZoomConflictNotification:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAXBackBoardServerClass(), "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerGestureConflictWithZoom:", v5);

  objc_msgSend(getAXBackBoardServerClass(), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerGestureConflictWithZoom:", v5);

}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

void __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  if ((soft_AXUIKeyboardIsOnScreen() & 1) != 0)
  {
    soft_AXUIKeyboardWindow();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    objc_msgSend(v0, "_convertRectToSceneReferenceSpace:");
    v2 = v1;
    v4 = v3;
    v6 = v5;
    v8 = v7;

    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    soft_AXUIKeyboardWindow();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "notifyZoomKeyboardWillBecomeVisibleWithFrame:inAppWithBundleID:displayID:", v10, objc_msgSend(v13, "displayID"), v2, v4, v6, v8);

  }
  else
  {
    ZOOMLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke_cold_1(v14);

  }
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notifyZoomKeyboardWillHideInAppWithBundleID:displayID:", v5, objc_msgSend(v9, "displayID"));

  }
  else
  {
    ZOOMLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ZoomServicesUI _handleKeyboardWillHideNotification:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)_handleKeyboardDidHideNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notifyZoomKeyboardDidHideInAppWithBundleID:displayID:", v5, objc_msgSend(v9, "displayID"));

  }
  else
  {
    ZOOMLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ZoomServicesUI _handleKeyboardDidHideNotification:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)_handleAlertWillAppearNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("frame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", CFSTR("contextId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 7, v16, 0, v7, v9, v11, v13);

}

- (void)_handleLockButtonWasPressedNotification:(id)a3
{
  id v3;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyZoomLockButtonWasPressed");

}

- (void)_handleAppSwitcherWillBeginRevealNotification:(id)a3
{
  id v3;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyZoomAppSwitcherRevealAnimationWillBegin");

}

- (void)_handleAppDidBecomeActiveNotification:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

void __56__ZoomServicesUI__handleAppDidBecomeActiveNotification___block_invoke()
{
  double v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  if (soft_AXUIKeyboardIsOnScreen())
  {
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    v1 = v0;
    v3 = v2;
    v5 = v4;
    v7 = v6;
    soft_AXUIKeyboardWindow();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_convertRectToSceneReferenceSpace:", v1, v3, v5, v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v10 = *MEMORY[0x24BDBF070];
    v12 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "notifyZoomAppDidBecomeActive:keyboardFrameIfVisible:", v18, v10, v12, v14, v16);

}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyZoomAppDidEnterBackground:", v4);

}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXPerformValidationChecks(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 71, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_handleZoomFocusDidChangeNotification:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRect soft_AXUIRectForZoomFocusChangeNotification(NSNotification *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B0B000, log, OS_LOG_TYPE_DEBUG, "Got a keyboard will show notification, but keyboard was not on screen.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleKeyboardWillHideNotification:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_230B0B000, a1, a3, "Got a keyboard will hide notification, but keyboard was not even present.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_handleKeyboardDidHideNotification:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_230B0B000, a1, a3, "Got a keyboard did hide notification, but keyboard was not even present.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
