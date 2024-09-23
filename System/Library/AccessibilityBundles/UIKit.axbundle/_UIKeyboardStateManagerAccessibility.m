@implementation _UIKeyboardStateManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyboardStateManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsHandwritingEnabled
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsHandwritingEnabled:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)_axIsObservingAppLifecycleNotifications
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetIsObservingAppLifecycleNotifications:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (BOOL)_axIsObservingVoiceOverNotifications
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  const char *v10;
  const __CFString *v11;
  const char *v12;
  id v13;
  id *v14;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v14 = location;
  v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = CFSTR("_UIKeyboardStateManager");
  v10 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v12 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:"), v10, "B", "B", 0);
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("handleKeyboardInput: executionContext:"), v10, v10, 0);
  v5 = "@?";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardTaskQueue"), CFSTR("addDeferredTask:"), v8, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardTaskExecutionContext"), CFSTR("returnExecutionToParent"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("deleteBackwardAndNotify:"), v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v9, CFSTR("m_keyboardState"), "TIKeyboardState");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("unmarkText:"), v8, v10, 0);
  v3 = "I";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_setAttributedMarkedText: selectedRange: inputString: lastInputString: searchString: compareAttributes:"), v10, "{_NSRange=QQ}", v10, v10, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("textDidChange:"), v8, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("completeDeleteFromInput"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("taskQueue"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("completeHandleKeyEvent:"), v8, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("setInputModeToNextInPreferredListWithExecutionContext:"), v8, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("clearInputWithCandidatesCleared:"), v8, v12, 0);
  v4 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("acceptWord: firstDelete: forInput:"), v12, v10, "Q", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("setInputMode: userInitiated:"), v8, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("acceptCandidate:"), v8, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("completeDeleteOnceFromInputWithCharacterBefore:"), v8, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("callShouldDeleteWithWordCountForRapidDelete:characterCountForRapidDelete:"), v12, "i", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("touchUpdateLastUsedInputModeAction"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("callShouldInsertText:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("autocorrectSpellingEnabled"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("setAutocorrectSpellingEnabled:"), v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("autocorrectionPreference"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("autocorrectionPreferenceForTraits"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("isShifted"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:"), v8, v5, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:"), v8, v12, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("isMinimized"), v12, 0);
  v6 = CFSTR("UIPhysicalKeyboardEvent");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_unmodifiedInput"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_modifierFlags"), "q", 0);
  v7 = CFSTR("TIKeyboardState");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("setAutocorrectionEnabled:"), v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIKeyboard"), CFSTR("presentsInlineTextCompletionAsMarkedText"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("presentTextCompletionAsMarkedText:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("inlineCompletionAsMarkedText"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("inputDelegateManager"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBInputDelegateManager"), CFSTR("keyInputDelegate"), v10, 0);
  v11 = CFSTR("UIDictationController");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v11, CFSTR("isRunning"), v12, 0);
  objc_storeStrong(v14, v13);
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4
{
  NSObject *log;
  os_log_type_t type;
  objc_super v7;
  int v8;
  uint8_t v9[7];
  os_log_type_t v10;
  id v11;
  BOOL v12;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  if ((AXSelectionModeVoiceOverSelectionMovement() & 1) != 0)
  {
    v11 = (id)VOTLogCommon();
    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      log = v11;
      type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_impl(&dword_230C4A000, log, type, "Not accepting autocorrection because VoiceOver is moving the cursor.", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
    v8 = 1;
  }
  else
  {
    v7.receiver = v14;
    v7.super_class = (Class)_UIKeyboardStateManagerAccessibility;
    -[_UIKeyboardStateManagerAccessibility acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:](&v7, sel_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination_, location[0], v12);
    v8 = 0;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5
{
  id v5;
  _UIKeyboardStateManagerAccessibility *v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;
  _BOOL4 v14;
  _UIKeyboardStateManagerAccessibility *v15;
  id v16;
  int v17;
  BOOL v18;
  objc_super v19;
  char v20;
  BOOL v21;
  BOOL v22;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v24;
  char v25;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = a5;
  v20 = 0;
  v19.receiver = v24;
  v19.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v20 = -[_UIKeyboardStateManagerAccessibility performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:](&v19, sel_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource_, location[0], a4, a5);
  v18 = 0;
  LOBYTE(v14) = 0;
  if (_AXSAutomationEnabled())
    v14 = !UIAccessibilityIsVoiceOverRunning();
  v18 = v14;
  if (v21 && !v18 && (objc_msgSend(MEMORY[0x24BDF6B18], "isKeyboardProcess") & 1) != 0)
  {
    v25 = v20 & 1;
    v17 = 1;
  }
  else
  {
    v11 = (id)objc_msgSend(location[0], "insertionText");
    if (objc_msgSend(v11, "length")
      || (v10 = 1, !objc_msgSend(location[0], "deletionCount"))
      && (v10 = 1, !objc_msgSend(location[0], "forwardDeletionCount")))
    {
      v10 = -[_UIKeyboardStateManagerAccessibility _axIsLastKeyBackspace](v24, "_axIsLastKeyBackspace");
    }

    if ((v10 & 1) != 0)
    {
      -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v24, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0D8]);
    }
    else
    {
      v5 = (id)objc_msgSend(location[0], "insertionText");
      v9 = v5 == 0;

      if (!v9)
      {
        v16 = (id)-[_UIKeyboardStateManagerAccessibility safeValueForKeyPath:](v24, "safeValueForKeyPath:", CFSTR("inputDelegateManager.keyInputDelegate"));
        v7 = v24;
        v8 = (id)objc_msgSend(location[0], "insertionText");
        -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithInsertedText:keyInputDelegate:](v7, "_accessibilityPostValueChangedNotificationWithInsertedText:keyInputDelegate:");

        objc_storeStrong(&v16, 0);
      }
    }
    v15 = v24;
    AXPerformBlockAsynchronouslyOnMainThread();
    v25 = v20 & 1;
    v17 = 1;
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(location, 0);
  return v25 & 1;
}

- (BOOL)_axIsLastKeyBackspace
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsLastKeyBackspace:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4
{
  id v4;
  _UIKeyboardStateManagerAccessibility *v6;
  objc_super v7;
  os_log_type_t v8;
  id v9;
  id v10;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = (id)AXLogUIA();
  v8 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_3_2_8_69_8_64((uint64_t)v13, (uint64_t)location[0], (uint64_t)v10);
    _os_log_impl(&dword_230C4A000, (os_log_t)v9, v8, "Starting keyboard task, blocking notifications: %{sensitive}@ - %@", v13, 0x16u);
  }
  objc_storeStrong(&v9, 0);
  _UIAccessibilityBlockPostingOfAllNotifications();
  -[_UIKeyboardStateManagerAccessibility _axSetIsLastKeyBackspace:](v12, "_axSetIsLastKeyBackspace:", objc_msgSend(location[0], "isBackspace") & 1);
  v7.receiver = v12;
  v7.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility handleKeyboardInput:executionContext:](&v7, sel_handleKeyboardInput_executionContext_, location[0], v10);
  v6 = v12;
  AXPerformSafeBlock();
  v4 = (id)AXUIKeyboardEntryNotificationBlockTimer();
  objc_msgSend(v4, "afterDelay:processBlock:", &__block_literal_global_2, 1.0);

  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)deleteBackwardAndNotify:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  _UIKeyboardStateManagerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility deleteBackwardAndNotify:](&v3, sel_deleteBackwardAndNotify_, a3);
  if (v4)
    -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v6, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0D8]);
}

- (void)unmarkText:(id)a3
{
  objc_super v3;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility unmarkText:](&v3, sel_unmarkText_, location[0]);
  objc_storeStrong(location, 0);
}

- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8
{
  unsigned int v12;
  objc_super v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v20;
  _NSRange v21;

  v21 = a4;
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = 0;
  objc_storeStrong(&v16, a7);
  v15 = a8;
  v14 = 0;
  -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v20, "_accessibilityPostValueChangedNotificationWithChangeType:", 0);
  v13.receiver = v20;
  v13.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v12 = -[_UIKeyboardStateManagerAccessibility _setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:](&v13, sel__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes_, location[0], v21.location, v21.length, v18, v17, v16, a8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)textDidChange:(id)a3
{
  objc_super v3;
  uint64_t v4;
  char v5;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeBoolForKey:", CFSTR("isRunning")) & 1;
  v4 = 0;
  if (v5)
  {
    v4 = *MEMORY[0x24BDFF0E0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(location[0], "accessibilityValueChangesAreReplacements") & 1) != 0)
    {
      v4 = *MEMORY[0x24BDFF100];
    }
  }
  -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v7, "_accessibilityPostValueChangedNotificationWithChangeType:", v4);
  v3.receiver = v7;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility textDidChange:](&v3, sel_textDidChange_, location[0]);
  objc_storeStrong(location, 0);
}

- (void)completeDeleteFromInput
{
  objc_super v2;
  SEL v3;
  _UIKeyboardStateManagerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility completeDeleteFromInput](&v2, sel_completeDeleteFromInput);
  -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v4, "_accessibilityPostValueChangedNotificationWithChangeType:", 0);
}

- (void)completeHandleKeyEvent:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  objc_super v12;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v14;
  v12.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility completeHandleKeyEvent:](&v12, sel_completeHandleKeyEvent_, location[0]);
  if (_AXSAutomationEnabled())
  {
    v8 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_modifiedInput"));
    if (v8)
      v3 = (__CFString *)v8;
    else
      v3 = &stru_24FF484E0;
    v11 = v3;

    v7 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_unmodifiedInput"));
    if (v7)
      v4 = (__CFString *)v7;
    else
      v4 = &stru_24FF484E0;
    v10 = v4;

    v6 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_modifierFlags"));
    if (v6)
      v5 = v6;
    else
      v5 = &unk_24FF859E8;
    v9 = v5;

    AXUIAutomationHandleKeyComplete();
    objc_storeStrong(&v9, 0);
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3
{
  objc_super v3;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility setInputModeToNextInPreferredListWithExecutionContext:](&v3, sel_setInputModeToNextInPreferredListWithExecutionContext_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5
{
  char v6;
  id v7;
  UIAccessibilityNotifications v10;
  objc_super v11;
  char v12;
  id v13;
  unint64_t v14;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = 0;
  v11.receiver = v16;
  v11.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v12 = -[_UIKeyboardStateManagerAccessibility acceptWord:firstDelete:forInput:](&v11, sel_acceptWord_firstDelete_forInput_, location[0], v14, v13);
  if (v12)
  {
    v10 = *MEMORY[0x24BDF71E8];
    if ((objc_msgSend(location[0], "isAutocorrection") & 1) != 0)
      v10 = *MEMORY[0x24BEBAEC0];
    v7 = (id)objc_msgSend(location[0], "candidate");
    UIAccessibilityPostNotification(v10, v7);

  }
  v6 = v12;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4
{
  objc_super v5;
  BOOL v6;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  MEMORY[0x2348C39BC](*MEMORY[0x24BEBB0B0]);
  v5.receiver = v8;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility setInputMode:userInitiated:](&v5, sel_setInputMode_userInitiated_, location[0], a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB000], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4
{
  int v4;
  objc_super v5;
  char v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  _UIKeyboardStateManagerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = -[_UIKeyboardStateManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:") & 1;
  v5.receiver = v10;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility setShift:autoshift:](&v5, sel_setShift_autoshift_, v8, v7);
  v4 = v6 & 1;
  if (v4 != (-[_UIKeyboardStateManagerAccessibility safeBoolForKey:](v10, "safeBoolForKey:", CFSTR("isShifted")) & 1))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)acceptCandidate:(id)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility acceptCandidate:](&v5, sel_acceptCandidate_, location[0]);
  notification = *MEMORY[0x24BDF71E8];
  v4 = (id)objc_msgSend(location[0], "candidate");
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (BOOL)presentTextCompletionAsMarkedText:(id)a3
{
  char v4;
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  id v10;
  id v11;
  id v12;
  char v13;
  char v14;
  id v15;
  uint64_t v16;
  objc_super v17;
  char v18;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v17.receiver = v20;
  v17.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v18 = -[_UIKeyboardStateManagerAccessibility presentTextCompletionAsMarkedText:](&v17, sel_presentTextCompletionAsMarkedText_, location[0]);
  v6 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = objc_msgSend(v6, "voiceOverInlineTextCompletionAppearanceFeedback");

  v16 = v7;
  v14 = 0;
  v9 = 0;
  v8 = 0;
  if (v7 != 1)
  {
    v8 = 0;
    if ((v18 & 1) != 0)
    {
      v15 = (id)objc_msgSend(location[0], "displayString");
      v14 = 1;
      v8 = 0;
      if (objc_msgSend(v15, "length"))
      {
        v8 = 0;
        if ((objc_msgSend(MEMORY[0x24BDF6B18], "safeBoolForKey:", CFSTR("presentsInlineTextCompletionAsMarkedText")) & 1) != 0)
        {
          v13 = 0;
          objc_opt_class();
          v5 = (id)-[_UIKeyboardStateManagerAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("inlineCompletionAsMarkedText"));
          v12 = (id)__UIAccessibilityCastAsClass();

          v11 = v12;
          objc_storeStrong(&v12, 0);
          v10 = v11;
          v9 = 1;
          v8 = objc_msgSend(v11, "length") != 0;
        }
      }
    }
  }
  if ((v9 & 1) != 0)

  if ((v14 & 1) != 0)
  if (v8 && (v16 & 4) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  v4 = v18;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5
{
  objc_super v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  _UIKeyboardStateManagerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = a5;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:](&v5, sel_setInHardwareKeyboardMode_forceRebuild_shouldMoveKeyboard_, a3, a4, a5);
  if (-[_UIKeyboardStateManagerAccessibility _axShouldShowKeyboard]((uint64_t)v10))
    -[_UIKeyboardStateManagerAccessibility _axShowKeyboardIfHidden](v10);
}

- (BOOL)_axShouldShowKeyboard
{
  return a1 && UIAccessibilityIsSwitchControlRunning();
}

- (void)_axShowKeyboardIfHidden
{
  id v1;
  id v2;

  v2 = a1;
  if (a1)
  {
    if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isMinimized")) & 1) != 0)
    {
      v1 = v2;
      AXPerformSafeBlock();
      objc_storeStrong(&v1, 0);
    }
  }
}

- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4
{
  objc_super v5;
  char v6;
  int v7;
  int v8;
  SEL v9;
  _UIKeyboardStateManagerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v6 = -[_UIKeyboardStateManagerAccessibility callShouldDeleteWithWordCountForRapidDelete:characterCountForRapidDelete:](&v5, sel_callShouldDeleteWithWordCountForRapidDelete_characterCountForRapidDelete_, a3, a4);
  if (v6)
    -[_UIKeyboardStateManagerAccessibility _axResetFKAFocusToFirstResponderOnDelegate](v10);
  return v6 & 1;
}

- (void)_axResetFKAFocusToFirstResponderOnDelegate
{
  id v1;
  id v2;

  v2 = a1;
  if (a1)
  {
    v1 = v2;
    AXPerformSafeBlock();
    objc_storeStrong(&v1, 0);
  }
}

- (id)_accessibilityKeyboardInputDelegate
{
  if (a1)
    return (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("inputDelegate"));
  else
    return 0;
}

- (void)touchUpdateLastUsedInputModeAction
{
  objc_super v2;
  SEL v3;
  _UIKeyboardStateManagerAccessibility *v4;

  v4 = self;
  v3 = a2;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v2.receiver = v4;
    v2.super_class = (Class)_UIKeyboardStateManagerAccessibility;
    -[_UIKeyboardStateManagerAccessibility touchUpdateLastUsedInputModeAction](&v2, sel_touchUpdateLastUsedInputModeAction);
  }
}

- (BOOL)callShouldInsertText:(id)a3
{
  char v4;
  objc_super v5;
  char v6;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  v6 = -[_UIKeyboardStateManagerAccessibility callShouldInsertText:](&v5, sel_callShouldInsertText_, location[0]);
  if (v6)
    -[_UIKeyboardStateManagerAccessibility _axResetFKAFocusToFirstResponderOnDelegate](v8);
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)autocorrectSpellingEnabled
{
  objc_super v3;
  SEL v5;
  _UIKeyboardStateManagerAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (-[_UIKeyboardStateManagerAccessibility _axIsHandwritingEnabled](v6, "_axIsHandwritingEnabled"))
      return 0;
  }
  v3.receiver = v6;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  return -[_UIKeyboardStateManagerAccessibility autocorrectSpellingEnabled](&v3, sel_autocorrectSpellingEnabled);
}

- (BOOL)autocorrectionPreference
{
  objc_super v3;
  SEL v5;
  _UIKeyboardStateManagerAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (-[_UIKeyboardStateManagerAccessibility _axIsHandwritingEnabled](v6, "_axIsHandwritingEnabled"))
      return 0;
  }
  v3.receiver = v6;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  return -[_UIKeyboardStateManagerAccessibility autocorrectionPreference](&v3, sel_autocorrectionPreference);
}

- (void)_axUpdateAutocorrectionSettings
{
  id v1;
  id v2;
  id v3;
  BOOL v4;
  os_log_type_t v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  BOOL v11;
  id v12;
  uint8_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  if (a1)
  {
    v11 = objc_msgSend(v12, "safeUnsignedIntegerForKey:", CFSTR("autocorrectionPreferenceForTraits")) != 0;
    v9 = 0;
    objc_opt_class();
    v1 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("m_keyboardState"));
    v8 = (id)__UIAccessibilityCastAsClass();

    v7 = v8;
    objc_storeStrong(&v8, 0);
    v10 = v7;
    v6 = (id)VOTLogHandwriting();
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, v11);
      _os_log_impl(&dword_230C4A000, (os_log_t)v6, v5, "Handwriting status changed, updating settings. autocorrect: %d", v13, 8u);
    }
    objc_storeStrong(&v6, 0);
    v2 = v10;
    v4 = v11;
    v3 = v12;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v2, 0);
    objc_storeStrong(&v10, 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  BOOL v3;
  id location;
  objc_super v5;
  SEL v6;
  _UIKeyboardStateManagerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  location = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  if ((-[_UIKeyboardStateManagerAccessibility _axIsObservingAppLifecycleNotifications]((uint64_t)v7) & 1) == 0)
  {
    objc_msgSend(location, "addObserver:selector:name:object:", v7, sel__axUnregisterForVoiceOverNotifications_, *MEMORY[0x24BDF75D8]);
    objc_msgSend(location, "addObserver:selector:name:object:", v7, sel__axRegisterForVoiceOverNotifications_, *MEMORY[0x24BDF7510], 0);
    objc_msgSend(location, "addObserver:selector:name:object:", v7, sel__axHandleVoiceOverStatusChanged_, *MEMORY[0x24BDF7458], 0);
    -[_UIKeyboardStateManagerAccessibility _axSetIsObservingAppLifecycleNotifications:]((uint64_t)v7);
  }
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = objc_msgSend(v2, "applicationState") != 0;

  if (!v3)
    -[_UIKeyboardStateManagerAccessibility _axRegisterForVoiceOverNotifications:](v7, "_axRegisterForVoiceOverNotifications:", 0);
  objc_storeStrong(&location, 0);
}

- (void)_axRegisterForVoiceOverNotifications:(id)a3
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(id *);
  void *v7;
  _UIKeyboardStateManagerAccessibility *v8;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __77___UIKeyboardStateManagerAccessibility__axRegisterForVoiceOverNotifications___block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v10;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_axUnregisterForVoiceOverNotifications:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  NSObject *log;
  os_log_type_t type;
  uint8_t v7[7];
  char v8;
  id v9;
  int v10;
  id location[2];
  _UIKeyboardStateManagerAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[_UIKeyboardStateManagerAccessibility _axIsObservingVoiceOverNotifications](v12, "_axIsObservingVoiceOverNotifications"))
  {
    v9 = (id)VOTLogHandwriting();
    v8 = 2;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_230C4A000, log, type, "Unregistering UIKeyboard from handwriting notifications", v7, 2u);
    }
    objc_storeStrong(&v9, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v12, (CFNotificationName)*MEMORY[0x24BE00468], 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, v12, (CFNotificationName)*MEMORY[0x24BE00460], 0);
    -[_UIKeyboardStateManagerAccessibility _axSetIsObservingVoiceOverNotifications:](v12, "_axSetIsObservingVoiceOverNotifications:", 0);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_axHandleVoiceOverStatusChanged:(id)a3
{
  id location[2];
  _UIKeyboardStateManagerAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v4);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  _UIKeyboardStateManagerAccessibility *v7;

  v7 = self;
  v6 = a2;
  -[_UIKeyboardStateManagerAccessibility _axUnregisterForVoiceOverNotifications:](self, "_axUnregisterForVoiceOverNotifications:");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v7, *MEMORY[0x24BDF75D8], 0);

  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", v7, *MEMORY[0x24BDF7510], 0);

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", v7, *MEMORY[0x24BDF7458], 0);

  -[_UIKeyboardStateManagerAccessibility _axSetIsObservingAppLifecycleNotifications:]((uint64_t)v7);
  v5.receiver = v7;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  -[_UIKeyboardStateManagerAccessibility dealloc](&v5, sel_dealloc);
}

@end
