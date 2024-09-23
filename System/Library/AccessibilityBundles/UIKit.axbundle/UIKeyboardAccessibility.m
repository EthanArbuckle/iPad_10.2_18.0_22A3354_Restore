@implementation UIKeyboardAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  const __CFString *v10;
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
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:", CFSTR("UITextInput_Internal"), CFSTR("_deleteByWord"));
  v9 = "B";
  v7 = CFSTR("UIKeyboardImpl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  v8 = CFSTR("UIKeyboardLayoutStar");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v12 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBKeyplaneView"), CFSTR("viewForKey:"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBRecentInputsView"), CFSTR("collectionView"), v12, 0);
  v3 = CFSTR("UIKeyboard");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIKBLinearCandidateView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("candidateController"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("activeViews"), v12, 0);
  v4 = CFSTR("_UIRemoteKeyboards");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("usesInputSystemUI"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("sharedRemoteKeyboards"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("enabled"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("keyboardWindow"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("keyboardVisible"), v9, 0);
  v6 = CFSTR("UIInputWindowController");
  v5 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("visibleInputViewFrame"), v5, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIRemoteKeyboardWindow"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("inputViewSet"), v12, 0);
  v10 = CFSTR("UIInputViewSet");
  v11 = CFSTR("inputView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v7, CFSTR("m_layout"), "UIKeyboardLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v8, CFSTR("_typingStyleEstimator"), "UIKeyboardTypingStyleEstimator");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_allowContinuousPathUI"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardSceneDelegate"), CFSTR("inputViews"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("isInputViewPlaceholder"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, v11, v12, 0);
  objc_storeStrong(v14, v13);
}

- (BOOL)_accessibilityKeyboardIsContinuousPathTracking
{
  id v3;
  id v4;
  id v5;
  char v6;

  v5 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("m_layout"));
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_typingStyleEstimator"));
  v6 = objc_msgSend(v3, "_accessibilityKeyboardIsContinuousPathTracking");

  return v6 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 19;
}

- (BOOL)_accessibilityKeyboardIsContinuousPathAvailable
{
  id v3;
  id v4;
  char v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("m_layout"));
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_allowContinuousPathUI"));

  return v5 & 1;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  unint64_t v7;
  objc_super v8;
  int v9;
  unsigned int v10;
  id location;
  unsigned int v12;
  SEL v13;
  UIKeyboardAccessibility *v14;
  char v15;

  v14 = self;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v10 = a5;
  v7 = v12 - 2600;
  if (v7 <= 0xB)
    __asm { BR              X8 }
  v8.receiver = v14;
  v8.super_class = (Class)UIKeyboardAccessibility;
  v15 = -[UIKeyboardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v8, sel__iosAccessibilityPerformAction_withValue_fencePort_, v12, location, v10);
  v9 = 1;
  objc_storeStrong(&location, 0);
  return v15 & 1;
}

- (uint64_t)_axDeleteByCharacter
{
  id v2;
  id v3[2];
  char v4;

  v3[1] = a1;
  if (a1)
  {
    v3[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v2 = v3[0];
    AXPerformSafeBlock();
    v4 = 1;
    objc_storeStrong(&v2, 0);
    objc_storeStrong(v3, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_axDeleteByWord
{
  id v1;
  id v3;
  id v4[2];
  char v5;

  v4[1] = a1;
  if (a1)
  {
    v4[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v3 = (id)objc_msgSend(v4[0], "inputDelegate");
    v1 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("_deleteByWord"));

    v5 = 1;
    objc_storeStrong(v4, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)_axAdvanceKeyboardPlane:(uint64_t)a1
{
  return a1 != 0;
}

- (BOOL)_axCommitWord
{
  return a1 != 0;
}

- (uint64_t)_axEnterTextValue:(uint64_t)a1
{
  id v3;
  int v4;
  id location;
  uint64_t v6;
  char v7;

  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
      objc_msgSend(v3, "addInputString:", location);
      v7 = 1;
      v4 = 1;
      objc_storeStrong(&v3, 0);
    }
    else
    {
      v7 = 0;
      v4 = 1;
    }
  }
  else
  {
    v7 = 0;
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
  return v7 & 1;
}

- (BOOL)_axAdvanceKeyboardSuggestion:(uint64_t)a1
{
  return a1 != 0;
}

- (BOOL)_axAdvanceInternationalKeyboard:(uint64_t)a1
{
  return a1 != 0;
}

- (uint64_t)_axShift
{
  id v2[2];
  char v3;

  v2[1] = a1;
  if (a1)
  {
    v2[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    objc_msgSend(v2[0], "setShift:", (objc_msgSend(v2[0], "isShifted") ^ 1) & 1);
    v3 = 1;
    objc_storeStrong(v2, 0);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_axShiftLock
{
  id v2[2];
  char v3;

  v2[1] = a1;
  if (a1)
  {
    v2[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    objc_msgSend(v2[0], "setShiftLocked:", (objc_msgSend(v2[0], "isShiftLocked") ^ 1) & 1);
    v3 = 1;
    objc_storeStrong(v2, 0);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilitySwitchToGestureMode:(void *)a1
{
  id v2;
  char v4;

  if (a1)
  {
    if ((objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("VORegistered")) & 1) == 0)
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__voiceOverStatus_, *MEMORY[0x24BDF7458], 0);

      objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("VORegistered"));
    }
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

uint64_t __47__UIKeyboardAccessibility__axDeleteByCharacter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackwardAndNotify:", 1, a1, a1);
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  UIKeyboardAccessibility *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v5, *MEMORY[0x24BDF7458], 0);

  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardAccessibility;
  -[UIKeyboardAccessibility dealloc](&v3, sel_dealloc);
}

- (void)deactivate
{
  objc_super v2;
  SEL v3;
  UIKeyboardAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardAccessibility;
  -[UIKeyboardAccessibility deactivate](&v2, sel_deactivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)activate
{
  objc_super v2;
  SEL v3;
  UIKeyboardAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardAccessibility;
  -[UIKeyboardAccessibility activate](&v2, sel_activate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  return 1;
}

- (BOOL)_accessibilityTriggerDictationFromPath:(id)a3
{
  char v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id location[2];
  UIKeyboardAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v9 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  if (v9)
  {
    objc_msgSend(v9, "setDelegate:", v12);
    v5 = (id)objc_msgSend(v9, "currentInputMode");
    v8 = (id)objc_msgSend(v5, "primaryLanguage");

    v6 = v9;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", location[0], 0);
    objc_msgSend(v6, "startDictationConnectionForFileAtURL:forInputModeIdentifier:");

    v10 = 1;
    objc_storeStrong(&v8, 0);
  }
  v4 = v10;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)insertDictationResult:(id)a3
{
  id v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  objc_msgSend(v3, "setDelegate:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAF90], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

- (void)dictationRecognitionFailed
{
  UIAccessibilityNotifications notification;
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  objc_msgSend(v4[0], "setDelegate:");
  notification = *MEMORY[0x24BEBAF90];
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  UIAccessibilityPostNotification(notification, v3);

  objc_storeStrong(v4, 0);
}

- (CGRect)accessibilityFrame
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  BOOL v28;
  id v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  int v36;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  char v46;
  id v47;
  id location;
  id v49;
  id v50;
  char v51;
  char v52;
  char v53;
  SEL v54;
  UIKeyboardAccessibility *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGRect result;

  v55 = self;
  v54 = a2;
  v30 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v29 = (id)objc_msgSend(v30, "currentInputMode");
  v31 = objc_msgSend(v29, "isExtensionInputMode");

  v53 = v31 & 1;
  v52 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeBoolForKey:", CFSTR("enabled")) & 1;
  v51 = 1;
  v34 = (id)objc_msgSend(MEMORY[0x24BDF6C50], "sharedInstance");
  v33 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("containerRootController"));
  v32 = (id)objc_msgSend(v33, "safeValueForKey:", CFSTR("inputViewSet"));
  v50 = (id)objc_msgSend(v32, "safeUIViewForKey:", CFSTR("inputView"));

  if ((v52 & 1) == 0
    || (NSClassFromString(CFSTR("_UIRemoteKeyboardPlaceholderView")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!v50)
      v51 = 0;
    goto LABEL_17;
  }
  v49 = (id)objc_msgSend(v50, "safeUIViewForKey:", CFSTR("placeheldView"));
  NSClassFromString(CFSTR("_UIKBCompatInputView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    location = (id)objc_msgSend(v49, "safeUIViewForKey:", CFSTR("touchableView"));
    v27 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v46 = 0;
    v28 = 1;
    if (location == v27)
    {
      v47 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
      v46 = 1;
      v28 = v47 == 0;
    }
    v51 = v28;
    if ((v46 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  objc_msgSend(v50, "frame");
  v42 = v3;
  v43 = v4;
  v44 = v2;
  v45 = v5;
  v6 = v2;
  if (v2 > 1.0 && (objc_msgSend(v50, "frame", v2), v38 = v7, v39 = v8, v40 = v9, v41 = v10, v6 = v10, v10 > 1.0))
  {
    v36 = 0;
  }
  else
  {
    v37.receiver = v55;
    v37.super_class = (Class)UIKeyboardAccessibility;
    -[UIKeyboardAccessibility accessibilityFrame](&v37, sel_accessibilityFrame, v6);
    v56 = v11;
    v57 = v12;
    v58 = v13;
    v59 = v14;
    v36 = 1;
  }
  objc_storeStrong(&v49, 0);
  if (!v36)
  {
LABEL_17:
    if ((v53 & 1) != 0 || (v52 & 1) != 0 && (v51 & 1) != 0)
    {
      AXUIKeyboardScreenFrame();
      v56 = v15;
      v57 = v16;
      v58 = v17;
      v59 = v18;
      v36 = 1;
    }
    else
    {
      v35.receiver = v55;
      v35.super_class = (Class)UIKeyboardAccessibility;
      -[UIKeyboardAccessibility accessibilityFrame](&v35, sel_accessibilityFrame);
      v56 = v19;
      v57 = v20;
      v58 = v21;
      v59 = v22;
      v36 = 1;
    }
  }
  objc_storeStrong(&v50, 0);
  v23 = v56;
  v24 = v57;
  v25 = v58;
  v26 = v59;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)_accessibilityDirectInteractionFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v11 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v10 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("m_layout"));
  objc_msgSend(v10, "accessibilityFrame");
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;

  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_voiceOverStatus:(id)a3
{
  id location[2];
  UIKeyboardAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!UIAccessibilityIsVoiceOverRunning())
    -[UIKeyboardAccessibility _accessibilitySwitchToGestureMode:](v4);
  objc_storeStrong(location, 0);
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  SEL v4;
  UIKeyboardAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[UIKeyboardAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardAccessibility;
  return -[UIKeyboardAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
}

- (id)_accessibilityNativeFocusPreferredElement
{
  objc_super v3;
  SEL v4;
  UIKeyboardAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardAccessibility;
  return -[UIKeyboardAccessibility _accessibilityNativeFocusPreferredElement](&v3, sel__accessibilityNativeFocusPreferredElement);
}

@end
