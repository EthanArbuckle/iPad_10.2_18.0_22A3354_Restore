@implementation SpeakTypingManager

void __42__SpeakTypingManager_initializeMonitoring__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_registerForLetterFeedbackAXSettingsUpdate");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateForCurrentTypingFeedbackStatus");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_registerForPhoneticFeedbackAXSettingsUpdate");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateForCurrentTypingFeedbackStatus");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_registerForQuickTypePredictionFeedbackAXSettingsUpdate");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForCurrentQuickTypeFeedbackStatus");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_registerForWordFeedbackAXSettingsUpdate");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForCurrentWordFeedbackStatus");

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_notifyToInitializeServerConnection");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance_SharedInstance_0;
}

- (void)updateForCurrentTypingFeedbackStatus
{
  if (_AXSPhoneticFeedbackEnabled() || _AXSLetterFeedbackEnabled())
    -[SpeakTypingManager _installSpeakTypingSafeCategoriesIfNeeded](self, "_installSpeakTypingSafeCategoriesIfNeeded");
}

- (void)updateForCurrentWordFeedbackStatus
{
  if (_AXSWordFeedbackEnabled())
    -[SpeakTypingManager _installSpeakTypingSafeCategoriesIfNeeded](self, "_installSpeakTypingSafeCategoriesIfNeeded");
}

- (void)updateForCurrentQuickTypeFeedbackStatus
{
  if (_AXSQuickTypePredictionFeedbackEnabled())
    -[SpeakTypingManager _installSpeakTypingSafeCategoriesIfNeeded](self, "_installSpeakTypingSafeCategoriesIfNeeded");
}

- (void)_registerForWordFeedbackAXSettingsUpdate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)wordFeedback, (CFStringRef)*MEMORY[0x24BED29A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForQuickTypePredictionFeedbackAXSettingsUpdate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)quickTypePredictionFeedback, (CFStringRef)*MEMORY[0x24BED28D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForPhoneticFeedbackAXSettingsUpdate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)typingFeedback, (CFStringRef)*MEMORY[0x24BED28C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForLetterFeedbackAXSettingsUpdate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)typingFeedback, (CFStringRef)*MEMORY[0x24BED2878], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_notifyToInitializeServerConnection
{
  void *v2;
  int v3;
  id v4;

  if (_AXSPhoneticFeedbackEnabled()
    || _AXSLetterFeedbackEnabled()
    || _AXSWordFeedbackEnabled()
    || (objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "speakCorrectionsEnabled"),
        v2,
        v3))
  {
    objc_msgSend(getSpeakTypingServicesClass_0(), "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notifySpeakServicesToInitializeServerConnection");

  }
}

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken_1 != -1)
    dispatch_once(&initializeMonitoring_onceToken_1, &__block_literal_global_176);
}

void __36__SpeakTypingManager_sharedInstance__block_invoke()
{
  SpeakTypingManager *v0;
  void *v1;

  v0 = objc_alloc_init(SpeakTypingManager);
  v1 = (void *)sharedInstance_SharedInstance_0;
  sharedInstance_SharedInstance_0 = (uint64_t)v0;

}

- (void)speakTypingLoadAccessibilityForExistingPredictions
{
  soft_AXPerformSafeBlock_0(&__block_literal_global_178);
}

void __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v0 = getAXUIApplicationWindowsSymbolLoc_ptr;
  v13 = getAXUIApplicationWindowsSymbolLoc_ptr;
  if (!getAXUIApplicationWindowsSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUIUtilitiesLibrary_1();
    v0 = dlsym(v1, "AXUIApplicationWindows");
    v11[3] = (uint64_t)v0;
    getAXUIApplicationWindowsSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v10, 8);
  if (!v0)
    __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_cold_1();
  ((void (*)(uint64_t))v0)(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityUIFindSubviewDescendant:", &__block_literal_global_180);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v6 = getAXUIKeyboardWindowSymbolLoc_ptr_0;
    v13 = getAXUIKeyboardWindowSymbolLoc_ptr_0;
    if (!getAXUIKeyboardWindowSymbolLoc_ptr_0)
    {
      v7 = (void *)AccessibilityUIUtilitiesLibrary_1();
      v6 = dlsym(v7, "AXUIKeyboardWindow");
      v11[3] = (uint64_t)v6;
      getAXUIKeyboardWindowSymbolLoc_ptr_0 = v6;
    }
    _Block_object_dispose(&v10, 8);
    if (!v6)
      soft_AXUIKeyboardWindow_cold_1();
    ((void (*)(uint64_t))v6)(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilityUIFindSubviewDescendant:", &__block_literal_global_183, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "speakTypingLoadAccessibilityInformation");

}

uint64_t __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TUIPredictionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TUIPredictionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_installSpeakTypingSafeCategoriesIfNeeded
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsSafari(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 63, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(getAXValidationManagerClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_188_1, &__block_literal_global_205_0, &__block_literal_global_209, &__block_literal_global_211_0);

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v1 = (void *)getAXBinaryMonitorClass_softClass_0;
  v8 = getAXBinaryMonitorClass_softClass_0;
  if (!getAXBinaryMonitorClass_softClass_0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getAXBinaryMonitorClass_block_invoke_0;
    v4[3] = &unk_24FED6130;
    v4[4] = &v5;
    __getAXBinaryMonitorClass_block_invoke_0((uint64_t)v4);
    v1 = (void *)v6[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v2, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addHandler:forFramework:", &__block_literal_global_214, CFSTR("TextInputUI"));

}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("UIKeyboardImpl"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("inputDelegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("textInputTraits"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UITextInputTraits"), CFSTR("secureTextEntry"), "BOOL");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIMorphingLabel"), CFSTR("text"), "@", 0);

  return 1;
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Speak Typing"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Speak Typing"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return soft_AXPerformValidationChecks();
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIKeyboardImpl_TFExtras"), 1);
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_6()
{
  id v0;

  objc_msgSend(getAXValidationManagerClass(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_215, &__block_literal_global_243, 0, &__block_literal_global_246);

}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("_predictionCellIndexAtLocation:"), "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("setSelectedIndex:"), "v", "q", 0);
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("TUIPredictionViewDelegate"), CFSTR("predictionView:didSelectCandidate:"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("selectedIndex"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionViewCell"), CFSTR("candidate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionViewCell"), CFSTR("morphingLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIMorphingLabel"), CFSTR("text"), "@", 0);

  return 1;
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Speak Typing (TextInputUI)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Speak Typing (TextInputUI)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return soft_AXPerformValidationChecks();
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TUIPredictionView_TFExtras"), 1);
  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakTypingLoadAccessibilityForExistingPredictions");

}

- (BOOL)isRegisteredForAppNotifications
{
  return self->_registeredForAppNotifications;
}

- (void)setRegisteredForAppNotifications:(BOOL)a3
{
  self->_registeredForAppNotifications = a3;
}

void __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray *soft_AXUIApplicationWindows(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
