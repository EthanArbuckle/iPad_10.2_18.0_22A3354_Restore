@implementation UIApplicationAccessibility

- (void)sendEvent:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  uint8_t v15[7];
  os_log_type_t v16;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t v19;
  _QWORD __b[8];
  id v21;
  char v22;
  os_log_type_t type;
  os_log_t oslog;
  objc_super v25;
  id location[2];
  UIApplicationAccessibility *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t v30[16];
  _BYTE v31[128];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25.receiver = v27;
  v25.super_class = (Class)UIApplicationAccessibility;
  -[UIApplicationAccessibility sendEvent:](&v25, sel_sendEvent_, location[0]);
  if (_AXSAutomationEnabled())
  {
    if (objc_msgSend(location[0], "type"))
    {
      if (objc_msgSend(location[0], "type") == 7)
      {
        v28[0] = CFSTR("event");
        v29[0] = CFSTR("ScrollEventCompleted");
        v28[1] = CFSTR("Timestamp");
        v3 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(location[0], "timestamp");
        v5 = (id)objc_msgSend(v3, "numberWithDouble:");
        v29[1] = v5;
        v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        UIAccessibilityPostNotification(0xFA2u, v4);

      }
    }
    else
    {
      oslog = (os_log_t)(id)AXLogUIA();
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)location[0]);
        _os_log_impl(&dword_230C4A000, oslog, type, "UIA: incoming touch %@", v32, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v22 = 1;
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(location[0], "allTouches");
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
      if (v14)
      {
        v10 = *(_QWORD *)__b[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)__b[2] != v10)
            objc_enumerationMutation(obj);
          v21 = *(id *)(__b[1] + 8 * v11);
          v19 = (os_log_t)(id)AXLogUIA();
          v18 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v8 = v19;
            __os_log_helper_16_0_1_4_0((uint64_t)v30, objc_msgSend(v21, "phase"));
            _os_log_impl(&dword_230C4A000, v8, v18, "UIA: touch handled: %d", v30, 8u);
          }
          objc_storeStrong((id *)&v19, 0);
          if (objc_msgSend(v21, "phase") != 3 && objc_msgSend(v21, "phase") != 4)
            v22 = 0;
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
            if (!v12)
              break;
          }
        }
      }

      if ((v22 & 1) != 0)
      {
        v17 = (os_log_t)(id)AXLogUIA();
        v16 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v6 = v17;
          v7 = v16;
          __os_log_helper_16_0_0(v15);
          _os_log_impl(&dword_230C4A000, v6, v7, "UIA: touches are complete", v15, 2u);
        }
        objc_storeStrong((id *)&v17, 0);
        UIAccessibilityPostNotification(0xFA2u, &unk_24FF85DE8);
      }
    }
  }
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  const __CFString *v17;
  const __CFString *v18;
  const char *v19;
  const __CFString *v20;
  const __CFString *v21;
  const char *v22;
  id v23;
  id *v24;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v24 = location;
  v23 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = "@";
  v19 = "B";
  v21 = CFSTR("UIApplication");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "Q", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("_UIViewServiceSessionManager"), CFSTR("hasActiveSessions"), v19, 0);
  v3 = CFSTR("UIDictationController");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("isListening"), v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("dictationIsFunctional"), v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("fetchCurrentInputModeSupportsDictation"), v19, 0);
  v13 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("startDictation"), 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("activeInstance"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIPhysicalKeyboardEvent"), CFSTR("_eventWithInput: inputFlags:"), v22, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDimmingView"), CFSTR("delegate"), v22, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIFormSheetPresentationController"));
  v8 = CFSTR("UIKeyboardImpl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextReplacement"), CFSTR("replacementText"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("textInteractionAssistant"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextInteractionAssistant"), CFSTR("_selectionView"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextSelectionView"), CFSTR("selectionChanged"), v13, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v21, CFSTR("_systemNavigationAction"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarWindow"), CFSTR("_statusBar"), "UIStatusBar");
  v4 = CFSTR("_UIPopoverView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("standardChromeView"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v21, CFSTR("_isActivating"), v19, 0);
  v5 = CFSTR("UIKeyShortcutHUDService");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("sharedHUDService"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("dropShadowView"), v22, 0);
  v6 = CFSTR("UICompatibilityInputViewController");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("inputController"), v22, 0);
  v7 = CFSTR("UIKeyboardInputModeController");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v7, CFSTR("sharedInputModeController"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("switchToDictationInputMode"), v13, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("currentInputMode"), v22, 0);
  v9 = CFSTR("UIScreen");
  v16 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("candidateController"), v22, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIWheelEvent"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_isMainScreen"), v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v9, CFSTR("_enumerateScreensWithBlock:"), v13, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_preferredFocusedWindow"), v22, 0);
  v15 = CFSTR("UIFocusSystem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v22, v19, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_updateFocusWithContext:report:"), v19, v22, v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_setEnabled:"), v13, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_isEnabled"), v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIFocusUpdateContext"), CFSTR("_request"), "<_UIFocusUpdateRequesting>");
  v14 = CFSTR("_UIFocusSystemSceneComponent");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("_UIFocusUpdateRequesting"), CFSTR("focusSystem"), 1, 1);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v14, CFSTR("sceneComponentForFocusSystem:"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("activeViews"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v21, CFSTR("_isSystemUIService"), v19, 0);
  v10 = CFSTR("UITextEffectsWindow");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v10, CFSTR("_editingOverlayViewController"), "UIEditingOverlayViewController");
  v11 = CFSTR("UIEditingOverlayViewController");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("undoInteraction"), v22, 0);
  v12 = CFSTR("UIUndoGestureInteraction");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("setUndoInteractiveHUDVisibility:"), v13, v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v14, CFSTR("needsFocusSystem"), v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_preferredFirstResponder"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityGetContextID"), "I", 0);
  v17 = CFSTR("UIWindowScene");
  v18 = CFSTR("UIScene");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_referenceBoundsForOrientation:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("keyWindow"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v18, CFSTR("_scenesIncludingInternal:"), v22, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v18, CFSTR("_FBSScene"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSScene"), CFSTR("identifier"), v22, 0);
  v20 = CFSTR("UIWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v20, CFSTR("_focusResponder"), v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardSceneDelegate"), CFSTR("_systemInputAssistantViewController"), "UISystemInputAssistantViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISystemInputAssistantViewController"), CFSTR("emojiSearchViewController"), v22, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIFindNavigatorSearchTextField"), CFSTR("UITextField"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v21, CFSTR("connectedScenes"), v22);
  objc_storeStrong(v24, v23);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double height;
  double width;
  double y;
  double x;
  id v26;
  id v27;
  CGRect v28;
  id v29;
  CGRect v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id obj;
  uint64_t v41;
  CGRect v42;
  id v43;
  CGRect v44;
  id v45;
  id v46;
  char v47;
  id v48;
  CGRect v49;
  CGRect r2;
  char v51;
  id v52;
  id v53;
  id v54;
  char v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  int v60;
  int v61;
  void (*v62)(uint64_t);
  void *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  int v67;
  int v68;
  void (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  id v72;
  char v73;
  _QWORD __b[9];
  int v75;
  id v76;
  id v77[2];
  UIApplicationAccessibility *v78;
  CGRect v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect result;

  v81 = *MEMORY[0x24BDAC8D0];
  v78 = self;
  v77[1] = (id)a2;
  if (AXRequestingClient() == 3)
  {
    v43 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    objc_msgSend(v43, "accessibilityFrame");
    v44.origin.x = v2;
    v44.origin.y = v3;
    v44.size.width = v4;
    v44.size.height = v5;
    v79 = v44;

  }
  else
  {
    v77[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AXAppFrame-%p"), v78);
    v76 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v77[0]);
    if (v76)
    {
      objc_msgSend(v76, "rectValue");
      v42.origin.x = v6;
      v42.origin.y = v7;
      v42.size.width = v8;
      v42.size.height = v9;
      v79 = v42;
      v75 = 1;
    }
    else
    {
      memset(&v79, 0, sizeof(v79));
      v79 = *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
      memset(__b, 0, 0x40uLL);
      v73 = 0;
      objc_opt_class();
      v65 = 0;
      v66 = &v65;
      v67 = 838860800;
      v68 = 48;
      v69 = __Block_byref_object_copy__5;
      v70 = __Block_byref_object_dispose__5;
      v71 = 0;
      v59 = MEMORY[0x24BDAC760];
      v60 = -1073741824;
      v61 = 0;
      v62 = __48__UIApplicationAccessibility_accessibilityFrame__block_invoke;
      v63 = &unk_24FF3DC50;
      v64 = &v65;
      AXPerformSafeBlock();
      v58 = (id)v66[5];
      _Block_object_dispose(&v65, 8);
      objc_storeStrong(&v71, 0);
      v72 = (id)__UIAccessibilityCastAsClass();

      if ((v73 & 1) != 0)
        abort();
      v57 = v72;
      objc_storeStrong(&v72, 0);
      obj = v57;
      v41 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", __b, v80, 16);
      if (v41)
      {
        v37 = *(_QWORD *)__b[2];
        v38 = 0;
        v39 = v41;
        while (1)
        {
          v36 = v38;
          if (*(_QWORD *)__b[2] != v37)
            objc_enumerationMutation(obj);
          __b[8] = *(_QWORD *)(__b[1] + 8 * v38);
          v55 = 0;
          objc_opt_class();
          v54 = (id)__UIAccessibilityCastAsClass();
          if ((v55 & 1) != 0)
            abort();
          v53 = v54;
          objc_storeStrong(&v54, 0);
          v56 = v53;
          v35 = (id)objc_msgSend(v53, "screen");
          v51 = 0;
          v34 = 0;
          if ((objc_msgSend(v35, "safeBoolForKey:", CFSTR("_isMainScreen")) & 1) != 0)
          {
            v52 = (id)objc_msgSend(v56, "windows");
            v51 = 1;
            v34 = objc_msgSend(v52, "count") != 0;
          }
          if ((v51 & 1) != 0)

          if (v34)
          {
            v33 = (id)objc_msgSend(v56, "keyWindow");
            objc_msgSend(v33, "accessibilityFrame");
            r2.origin.x = v10;
            r2.origin.y = v11;
            r2.size.width = v12;
            r2.size.height = v13;

            v49 = CGRectUnion(v79, r2);
            v79 = v49;
          }
          objc_storeStrong(&v56, 0);
          ++v38;
          if (v36 + 1 >= v39)
          {
            v38 = 0;
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v80, 16);
            if (!v39)
              break;
          }
        }
      }

      if (CGRectIsEmpty(v79))
      {
        v47 = 0;
        v32 = (id)-[UIApplicationAccessibility safeValueForKey:](v78, "safeValueForKey:", CFSTR("_mainScene"));
        v31 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("settings"));
        v46 = (id)__UIAccessibilitySafeClass();

        v45 = v46;
        objc_storeStrong(&v46, 0);
        v48 = v45;
        v29 = (id)objc_msgSend(v45, "displayConfiguration");
        objc_msgSend(v29, "bounds");
        v30.origin.x = v14;
        v30.origin.y = v15;
        v30.size.width = v16;
        v30.size.height = v17;
        v79 = v30;

        objc_storeStrong(&v48, 0);
      }
      if (CGRectIsEmpty(v79))
      {
        v27 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        objc_msgSend(v27, "bounds");
        v28.origin.x = v18;
        v28.origin.y = v19;
        v28.size.width = v20;
        v28.size.height = v21;
        v79 = v28;

      }
      v26 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", *(_OWORD *)&v79.origin, *(_OWORD *)&v79.size);
      objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:");

      v75 = 1;
    }
    objc_storeStrong(&v76, 0);
    objc_storeStrong(v77, 0);
  }
  height = v79.size.height;
  width = v79.size.width;
  y = v79.origin.y;
  x = v79.origin.x;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

void __48__UIApplicationAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF7000], "_scenesIncludingInternal:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)result
{
  return result;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return UIAccessibilityIsWidgetExtension() & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UIApplicationAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIApplicationAccessibility;
  -[UIApplicationAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)_accessibilityKeyboardDidHide:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE08]);
  UIAccessibilityPostNotification(0x407u, &unk_24FF85D70);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityKeyboardDidShow:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  CGRect rect2;
  CGRect v17;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = (id)objc_msgSend(location[0], "userInfo");
  v13 = (id)objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDF7A18]);
  objc_msgSend(v13, "CGRectValue");
  v17.origin.x = v3;
  v17.origin.y = v4;
  v17.size.width = v5;
  v17.size.height = v6;
  v12 = (id)objc_msgSend(location[0], "userInfo");
  v11 = (id)objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDF7A20]);
  objc_msgSend(v11, "CGRectValue");
  rect2.origin.x = v7;
  rect2.origin.y = v8;
  rect2.size.width = v9;
  rect2.size.height = v10;
  v15 = CGRectEqualToRect(v17, rect2);

  if (!v15)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE00]);
    UIAccessibilityPostNotification(0x407u, &unk_24FF85D98);
  }
  objc_storeStrong(location, 0);
}

- (unsigned)_accessibilityMachPort
{
  return _AXUIElementRemoteBridgeMachPortForAXServer();
}

- (BOOL)_accessibilityOverrideStartStopExtraExtras
{
  return 0;
}

- (void)setContextKitSearchEnabled:(BOOL)a3
{
  -[UIApplicationAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("ProcessingContextKitSearch"));
}

- (BOOL)contextKitSearchEnabled
{
  return -[UIApplicationAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("ProcessingContextKitSearch"), a2, self) & 1;
}

- (BOOL)accessibilityStartStopToggle
{
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  char v8;
  os_log_t oslog;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  os_log_type_t v14;
  id location;
  id v16;
  id v17;
  os_log_type_t v18;
  id v19[2];
  UIApplicationAccessibility *v20;
  char v21;
  uint8_t v22[16];
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19[1] = (id)a2;
  if (-[UIApplicationAccessibility _accessibilityOverrideStartStopExtraExtras](self, "_accessibilityOverrideStartStopExtraExtras"))
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
    v8 = objc_msgSend(v7, "ignoreLogging");

    if ((v8 & 1) == 0)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
      v19[0] = (id)AXLoggerForFacility();

      v18 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled((os_log_t)v19[0], v18))
      {
        v17 = (id)AXColorizeFormatLog();
        v16 = (id)_AXStringForArgs();
        location = v19[0];
        v14 = v18;
        if (os_log_type_enabled((os_log_t)location, v18))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v16);
          _os_log_impl(&dword_230C4A000, (os_log_t)location, v14, "%{public}@", v23, 0xCu);
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong(v19, 0);
    }
    v21 = 1;
  }
  else if ((-[UIApplicationAccessibility _accessibilityStartStopDictation](v20) & 1) != 0)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
    v5 = objc_msgSend(v4, "ignoreLogging");

    if ((v5 & 1) == 0)
    {
      v3 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
      v13 = (id)AXLoggerForFacility();

      v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled((os_log_t)v13, v12))
      {
        v11 = (id)AXColorizeFormatLog();
        v10 = (id)_AXStringForArgs();
        oslog = (os_log_t)v13;
        if (os_log_type_enabled(oslog, v12))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v22, (uint64_t)v10);
          _os_log_impl(&dword_230C4A000, oslog, v12, "%{public}@", v22, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v13, 0);
    }
    v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  return v21 & 1;
}

- (uint64_t)_accessibilityStartStopDictation
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  id v28;
  id v29;
  char v30;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  char v36;
  os_log_t v37;
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  os_log_type_t v43;
  os_log_t v44;
  id v45;
  id v46;
  os_log_type_t v47;
  os_log_t v48;
  id v49;
  os_log_type_t v50;
  os_log_t oslog;
  id v52;
  id v53;
  os_log_type_t v54;
  id v55;
  os_log_type_t v56;
  id v57;
  id v58;
  id v59;
  os_log_type_t v60;
  id v61;
  int v62;
  os_log_type_t v63;
  id v64;
  id v65;
  id v66;
  os_log_type_t v67;
  id v68;
  os_log_type_t v69;
  id v70;
  id v71;
  id v72;
  os_log_type_t v73;
  id v74;
  id v75;
  id v76;
  os_log_type_t v77;
  id location;
  id v79;
  id v80;
  os_log_type_t v81;
  id v82;
  id v83;
  id v84;
  char v85;
  uint8_t v86[16];
  uint8_t v87[16];
  uint8_t v88[16];
  uint8_t v89[16];
  uint8_t v90[16];
  uint8_t v91[16];
  uint8_t v92[24];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v84 = a1;
  if (a1)
  {
    v83 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeValueForKey:", CFSTR("activeInstance"));
    if ((-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeBoolForKey:", CFSTR("isListening")) & 1) != 0)
    {
      v35 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
      v36 = objc_msgSend(v35, "ignoreLogging");

      if ((v36 & 1) == 0)
      {
        v34 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
        v82 = (id)AXLoggerForFacility();

        v81 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v82, v81))
        {
          v80 = (id)AXColorizeFormatLog();
          v79 = (id)_AXStringForArgs();
          location = v82;
          v77 = v81;
          if (os_log_type_enabled((os_log_t)location, v81))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v92, (uint64_t)v79);
            _os_log_impl(&dword_230C4A000, (os_log_t)location, v77, "%{public}@", v92, 0xCu);
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v79, 0);
          objc_storeStrong(&v80, 0);
        }
        objc_storeStrong(&v82, 0);
      }
      v76 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyboardDictationMenu")), "safeValueForKey:", CFSTR("activeInstance"));
      if (v76)
      {
        v75 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKBDictationActivatorView")), "safeValueForKey:", CFSTR("sharedInstance"));
        objc_msgSend(v75, "setUserInteractionEnabled:", 0);
        v1 = (id)objc_msgSend(v76, "safeValueForKey:", CFSTR("fade"));
        v32 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v33 = objc_msgSend(v32, "ignoreLogging");

        if ((v33 & 1) == 0)
        {
          v31 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
          v74 = (id)AXLoggerForFacility();

          v73 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled((os_log_t)v74, v73))
          {
            v72 = (id)AXColorizeFormatLog();
            v71 = (id)_AXStringForArgs();
            v70 = v74;
            v69 = v73;
            if (os_log_type_enabled((os_log_t)v70, v73))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v91, (uint64_t)v71);
              _os_log_impl(&dword_230C4A000, (os_log_t)v70, v69, "%{public}@", v91, 0xCu);
            }
            objc_storeStrong(&v70, 0);
            objc_storeStrong(&v71, 0);
            objc_storeStrong(&v72, 0);
          }
          objc_storeStrong(&v74, 0);
        }
        objc_storeStrong(&v75, 0);
      }
      else
      {
        v2 = (id)objc_msgSend(v83, "safeValueForKey:", CFSTR("stopDictation"));
        v29 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v30 = objc_msgSend(v29, "ignoreLogging");

        if ((v30 & 1) == 0)
        {
          v28 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
          v68 = (id)AXLoggerForFacility();

          v67 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled((os_log_t)v68, v67))
          {
            v66 = (id)AXColorizeFormatLog();
            v65 = (id)_AXStringForArgs();
            v64 = v68;
            v63 = v67;
            if (os_log_type_enabled((os_log_t)v64, v67))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v90, (uint64_t)v65);
              _os_log_impl(&dword_230C4A000, (os_log_t)v64, v63, "%{public}@", v90, 0xCu);
            }
            objc_storeStrong(&v64, 0);
            objc_storeStrong(&v65, 0);
            objc_storeStrong(&v66, 0);
          }
          objc_storeStrong(&v68, 0);
        }
        v3 = (id)objc_msgSend(v83, "safeValueForKey:", CFSTR("keyboardInputModeToReturn"));
        v27 = v3 == 0;

        if (!v27)
        {
          v24 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
          v23 = (id)objc_msgSend(v24, "safeValueForKey:", CFSTR("textInteractionAssistant"));
          v22 = (id)objc_msgSend(v23, "safeValueForKey:", CFSTR("_selectionView"));
          v4 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("selectionChanged"));

          v26 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
          v25 = (id)objc_msgSend(v83, "safeValueForKey:");
          objc_msgSend(v26, "setKeyboardInputMode:userInitiated:");

          objc_msgSend(v83, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("keyboardInputModeToReturn"));
        }
      }
      v20 = v84;
      v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      objc_msgSend(v20, "_accessibilitySetRetainedValue:forKey:");

      v85 = 1;
      v62 = 1;
      objc_storeStrong(&v76, 0);
    }
    else if ((objc_msgSend((id)_lastActiveDictationController, "accessibilityPerformMagicTap") & 1) != 0)
    {
      v18 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
      v19 = objc_msgSend(v18, "ignoreLogging");

      if ((v19 & 1) == 0)
      {
        v17 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
        v61 = (id)AXLoggerForFacility();

        v60 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v61, v60))
        {
          v59 = (id)AXColorizeFormatLog();
          v58 = (id)_AXStringForArgs();
          v57 = v61;
          v56 = v60;
          if (os_log_type_enabled((os_log_t)v57, v60))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v89, (uint64_t)v58);
            _os_log_impl(&dword_230C4A000, (os_log_t)v57, v56, "%{public}@", v89, 0xCu);
          }
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v61, 0);
      }
      v85 = 1;
      v62 = 1;
    }
    else
    {
      if ((objc_msgSend(v84, "_accessibilitySoftwareKeyboardActive") & 1) == 0)
        goto LABEL_62;
      v15 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
      v16 = objc_msgSend(v15, "ignoreLogging");

      if ((v16 & 1) == 0)
      {
        v14 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
        v55 = (id)AXLoggerForFacility();

        v54 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v55, v54))
        {
          v53 = (id)AXColorizeFormatLog();
          v52 = (id)_AXStringForArgs();
          oslog = (os_log_t)v55;
          v50 = v54;
          if (os_log_type_enabled(oslog, v54))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v88, (uint64_t)v52);
            _os_log_impl(&dword_230C4A000, oslog, v50, "%{public}@", v88, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          objc_storeStrong(&v52, 0);
          objc_storeStrong(&v53, 0);
        }
        objc_storeStrong(&v55, 0);
      }
      v49 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x24BDF72D8]);
      if ((objc_msgSend(v49, "accessibilityPerformMagicTap") & 1) != 0)
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v13 = objc_msgSend(v12, "ignoreLogging");

        if ((v13 & 1) == 0)
        {
          v11 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
          v48 = (os_log_t)(id)AXLoggerForFacility();

          v47 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v48, v47))
          {
            v46 = (id)AXColorizeFormatLog();
            v45 = (id)_AXStringForArgs();
            v44 = v48;
            v43 = v47;
            if (os_log_type_enabled(v44, v47))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v87, (uint64_t)v45);
              _os_log_impl(&dword_230C4A000, v44, v43, "%{public}@", v87, 0xCu);
            }
            objc_storeStrong((id *)&v44, 0);
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
          }
          objc_storeStrong((id *)&v48, 0);
        }
        v85 = 1;
        v62 = 1;
      }
      else
      {
        v42 = NSClassFromString(CFSTR("UIDictationController"));
        if ((objc_msgSend(v42, "safeBoolForKey:", CFSTR("dictationIsFunctional")) & 1) != 0
          && (objc_msgSend(v42, "safeBoolForKey:", CFSTR("fetchCurrentInputModeSupportsDictation")) & 1) != 0)
        {
          v8 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyboardInputModeController")), "safeValueForKey:", CFSTR("sharedInputModeController"));
          v5 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("switchToDictationInputMode"));

          v9 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
          v10 = objc_msgSend(v9, "ignoreLogging");

          if ((v10 & 1) == 0)
          {
            v7 = (id)objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
            v41 = (os_log_t)(id)AXLoggerForFacility();

            v40 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v41, v40))
            {
              v39 = (id)AXColorizeFormatLog();
              v38 = (id)_AXStringForArgs();
              v37 = v41;
              if (os_log_type_enabled(v37, v40))
              {
                __os_log_helper_16_2_1_8_66((uint64_t)v86, (uint64_t)v38);
                _os_log_impl(&dword_230C4A000, v37, v40, "%{public}@", v86, 0xCu);
              }
              objc_storeStrong((id *)&v37, 0);
              objc_storeStrong(&v38, 0);
              objc_storeStrong(&v39, 0);
            }
            objc_storeStrong((id *)&v41, 0);
          }
          v85 = 1;
          v62 = 1;
        }
        else
        {
          v62 = 0;
        }
        objc_storeStrong(&v42, 0);
      }
      objc_storeStrong(&v49, 0);
      if (!v62)
      {
LABEL_62:
        v85 = 0;
        v62 = 1;
      }
    }
    objc_storeStrong(&v83, 0);
  }
  else
  {
    v85 = 0;
  }
  return v85 & 1;
}

- (void)_accessibilityAVCaptureStarted:(id)a3
{
  id location[2];
  UIApplicationAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIApplicationAccessibility _accessibilitySetCameraIrisOpen:](v4, "_accessibilitySetCameraIrisOpen:", 1);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityAVCaptureStopped:(id)a3
{
  id location[2];
  UIApplicationAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIApplicationAccessibility _accessibilitySetCameraIrisOpen:](v4, "_accessibilitySetCameraIrisOpen:", 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusDidUpdate:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  UIView *v7;
  id v8;
  id v9;
  CGRect frame;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (id)objc_msgSend(location[0], "userInfo");
  v29 = (id)objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDF7730]);

  v28 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusPreferredElement");
  v27 = (id)objc_msgSend(v29, "safeValueForKeyPath:", CFSTR("_request.focusSystem"));
  if (v27)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 838860800;
    v22 = 48;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    v25 = 0;
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __59__UIApplicationAccessibility__accessibilityFocusDidUpdate___block_invoke;
    v17 = &unk_24FF3DE88;
    v18[1] = &v19;
    v18[0] = v27;
    AXPerformSafeBlock();
    v12 = (id)v20[5];
    objc_storeStrong(v18, 0);
    _Block_object_dispose(&v19, 8);
    objc_storeStrong(&v25, 0);
    v26 = v12;
    v11 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("_windowScene"));
    if ((objc_msgSend(v11, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB040], v28);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v26, 0);
  }
  v8 = (id)objc_msgSend(v29, "nextFocusedView");
  objc_msgSend(v8, "bounds");
  frame.origin.x = v3;
  frame.origin.y = v4;
  frame.size.width = v5;
  frame.size.height = v6;
  v7 = (UIView *)(id)objc_msgSend(v29, "nextFocusedView");
  UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)5, frame, v7);

  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

void __59__UIApplicationAccessibility__accessibilityFocusDidUpdate___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF70C8], "sceneComponentForFocusSystem:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (void)_loadAllAccessibilityInformation
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  _AXAssert();

  v3 = (id)objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance", v2);
  objc_msgSend(v3, "setNeedsLoadAccessibilityInformation");

}

- (void)_accessibilityInitialize
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  BOOL v6;
  id v7[2];
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  SEL v15;
  UIApplicationAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14 = _AXSApplicationAccessibilityEnabled() != 0;
  v13 = 0;
  v6 = 0;
  if ((_UIAccessibilityStartedWithInitialization() & 1) == 0)
  {
    v6 = 0;
    if ((_AXStatusEnabled & 1) == 0)
      v6 = v14;
  }
  v13 = v6;
  if ((_AXStatusEnabled & 1) == 0)
    _AXStatusEnabled = v14;
  _AXAddToElementCache();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "performSelector:", sel_accessibilityInitialize);
  v7[1] = (id)MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke;
  v11 = &__block_descriptor_33_e5_v8__0l;
  v12 = v13;
  AXPerformBlockOnMainThreadAfterDelay();
  if ((_accessibilityInitialize_DidRegister & 1) == 0)
  {
    v7[0] = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityAVCaptureStarted_, CFSTR("AVCaptureSessionDidStartRunningNotification"));
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityAVCaptureStopped_, CFSTR("AVCaptureSessionDidStopRunningNotification"), 0);
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityFocusDidUpdate_, *MEMORY[0x24BDF7728], 0);
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityKeyboardDidHide_, *MEMORY[0x24BDF79F8], 0);
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityKeyboardDidShow_, *MEMORY[0x24BDF7A00], 0);
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = *MEMORY[0x24BEB50F8];
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v2 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v3, 0);

    _accessibilityInitialize_DidRegister = 1;
    objc_storeStrong(v7, 0);
  }
}

void __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v4;
  char v5;

  v4 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v2 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
    objc_msgSend(v2, "performSelector:", sel_accessibilityInitialize);

  }
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
    objc_msgSend(v1, "setNeedsLoadAccessibilityInformation");

  }
}

void __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke_2(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  ForceKeyboardRebuild = 1;
  objc_storeStrong(location, 0);
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  __GSKeyboard *v7;
  NSObject *log;
  os_log_type_t type;
  objc_super v13;
  uint8_t v14[15];
  os_log_type_t v15;
  id v16;
  BOOL v17;
  BOOL v18;
  unint64_t v19;
  id location[2];
  UIApplicationAccessibility *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v18 = a5;
  v17 = a6;
  if ((ForceKeyboardRebuild & 1) != 0 && v19 == 0x8000000817319373)
  {
    v18 = 1;
    ForceKeyboardRebuild = 0;
    v16 = (id)AXLogCommon();
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      log = v16;
      type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_230C4A000, log, type, "Force rebuilding keyboard because TextInput changed observed and VO SenderID causes too much caching", v14, 2u);
    }
    objc_storeStrong(&v16, 0);
  }
  v13.receiver = v21;
  v13.super_class = (Class)UIApplicationAccessibility;
  v7 = -[UIApplicationAccessibility GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:](&v13, sel_GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded_, location[0], v19, v18, v17);
  objc_storeStrong(location, 0);
  return v7;
}

- (void)dealloc
{
  objc_super v2;
  id v3[2];
  UIApplicationAccessibility *v4;

  v4 = self;
  v3[1] = (id)a2;
  v3[0] = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, *MEMORY[0x24BDF79F8]);
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, *MEMORY[0x24BDF7A00], 0);
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, *MEMORY[0x24BDF7728], 0);
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, CFSTR("AVCaptureSessionDidStartRunningNotification"), 0);
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, CFSTR("AVCaptureSessionDidStopRunningNotification"), 0);
  -[UIApplicationAccessibility _accessibilityUnregister](v4, "_accessibilityUnregister");
  objc_storeStrong(v3, 0);
  v2.receiver = v4;
  v2.super_class = (Class)UIApplicationAccessibility;
  -[UIApplicationAccessibility dealloc](&v2, sel_dealloc);
}

- (id)_accessibilityResponderElementForFocus
{
  return -[UIApplicationAccessibility _accessibilityResponderElement:](self, "_accessibilityResponderElement:", 1, a2, self);
}

- (id)_accessibilityResponderElement
{
  return -[UIApplicationAccessibility _accessibilityResponderElement:](self, "_accessibilityResponderElement:", 0, a2, self);
}

- (BOOL)_accessibilityResetAndClearNativeFocusSystem
{
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  id v11;
  os_log_type_t type;
  os_log_t oslog[2];
  int v14;
  int v15;
  void (*v16)(_QWORD *);
  void *v17;
  id v18[2];
  _QWORD __b[8];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  char v25;
  SEL v26;
  UIApplicationAccessibility *v27;
  uint8_t v28[24];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x20000000;
  v24 = 32;
  v25 = 0;
  memset(__b, 0, sizeof(__b));
  obj = -[UIApplicationAccessibility _accessibilityFocusableScenes](v27, "_accessibilityFocusableScenes");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v20 = *(id *)(__b[1] + 8 * v7);
      oslog[1] = (os_log_t)MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __74__UIApplicationAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke;
      v17 = &unk_24FF3E2A8;
      v18[0] = v20;
      v18[1] = &v21;
      AXPerformSafeBlock();
      objc_storeStrong(v18, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v8)
          break;
      }
    }
  }

  oslog[0] = (os_log_t)(id)AXLogFocusEngine();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v4 = (id)NSStringFromBOOL();
    v11 = v4;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, (uint64_t)v11, (uint64_t)v27);
    _os_log_debug_impl(&dword_230C4A000, oslog[0], type, "reset and clear focus system: %@, app: %@", v28, 0x16u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  v3 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return v3 & 1;
}

void __74__UIApplicationAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke(_QWORD *a1)
{
  BOOL v1;
  id v3;
  id v4;
  char v5;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v5 = 0;
  objc_opt_class();
  v4 = (id)__UIAccessibilityCastAsSafeCategory();
  v3 = v4;
  objc_storeStrong(&v4, 0);
  v6[0] = v3;
  v1 = 1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) & 1) == 0)
    v1 = -[UIWindowSceneAccessibility _accessibilityResetAndClearNativeFocusSystem](v6[0]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v1;
  objc_storeStrong(v6, 0);
}

- (BOOL)_accessibilityUpdateNativeFocusImmediately
{
  char v3;
  id v4;
  id v5;
  UIApplicationAccessibility *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  id v14;
  os_log_type_t type;
  os_log_t oslog[2];
  int v17;
  int v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21[2];
  _QWORD __b[8];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  char v28;
  SEL v29;
  UIApplicationAccessibility *v30;
  uint8_t v31[40];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30 = self;
  v29 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x20000000;
  v27 = 32;
  v28 = 0;
  memset(__b, 0, sizeof(__b));
  obj = -[UIApplicationAccessibility _accessibilityFocusableScenes](v30, "_accessibilityFocusableScenes");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v23 = *(id *)(__b[1] + 8 * v9);
      oslog[1] = (os_log_t)MEMORY[0x24BDAC760];
      v17 = -1073741824;
      v18 = 0;
      v19 = __72__UIApplicationAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke;
      v20 = &unk_24FF3E2A8;
      v21[0] = v23;
      v21[1] = &v24;
      AXPerformSafeBlock();
      objc_storeStrong(v21, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
        if (!v10)
          break;
      }
    }
  }

  oslog[0] = (os_log_t)(id)AXLogFocusEngine();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v5 = (id)NSStringFromBOOL();
    v14 = v5;
    v6 = v30;
    v4 = -[UIApplicationAccessibility _accessibilityNativeFocusElement](v30, "_accessibilityNativeFocusElement");
    v13 = v4;
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v31, (uint64_t)v14, (uint64_t)v6, (uint64_t)v13);
    _os_log_debug_impl(&dword_230C4A000, oslog[0], type, "did update native focus system: %@, app: %@, newElement: %@", v31, 0x20u);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  v3 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v3 & 1;
}

void __72__UIApplicationAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke(_QWORD *a1)
{
  char updated;
  id v3;
  id v4;
  char v5;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v5 = 0;
  objc_opt_class();
  v4 = (id)__UIAccessibilityCastAsSafeCategory();
  v3 = v4;
  objc_storeStrong(&v4, 0);
  v6[0] = v3;
  updated = 1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) & 1) == 0)
    updated = -[UIWindowSceneAccessibility _accessibilityUpdateNativeFocusImmediately](v6[0]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = updated & 1;
  objc_storeStrong(v6, 0);
}

- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  os_log_type_t v8;
  id location;
  BOOL v10;
  SEL v11;
  UIApplicationAccessibility *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11 = a2;
  v10 = a3;
  location = (id)AXLogFocusEngine();
  v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v4, (uint64_t)v12);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, v8, "Setting focus %@ in application %@", v13, 0x16u);

  }
  objc_storeStrong(&location, 0);
  v3 = -[UIApplicationAccessibility _accessibilityFocusedScreen](v12, "_accessibilityFocusedScreen");
  v7 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("_preferredFocusedWindow"));

  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_255EAA568) & 1) != 0)
  {
    v5 = v7;
    v6 = v10;
    AXPerformSafeBlock();
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v7, 0);
}

void __73__UIApplicationAccessibility__accessibilitySetFocusEnabledInApplication___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "_setEnabled:", *(_BYTE *)(a1 + 40) & 1);

}

- (id)_axActiveEmojiSearchField
{
  id v2;
  id v3;
  id v4;
  id v5;
  id location[2];
  id v7;

  location[1] = a1;
  if (a1)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6B60], "activeKeyboardSceneDelegate");
    v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_systemInputAssistantViewController"));
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("emojiSearchViewController"));
    v2 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("emojiSearchView"));
    location[0] = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("searchTextField"));

    if ((objc_msgSend(location[0], "safeBoolForKey:", CFSTR("isActive")) & 1) == 0)
      objc_storeStrong(location, 0);
    v7 = location[0];
    objc_storeStrong(location, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_accessibilityResponderElement:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  int v18;
  char v19;
  int v20;
  CFTypeID TypeID;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  os_log_t oslog;
  id v33;
  uint64_t v34;
  int v35;
  int v36;
  void (*v37)(_QWORD *, void *, unint64_t, _BYTE *);
  void *v38;
  id v39[4];
  uint64_t v40;
  uint64_t *v41;
  int v42;
  int v43;
  char v44;
  id v45;
  void *v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v51;
  id v52[3];
  uint64_t v53;
  uint64_t *v54;
  int v55;
  int v56;
  char v57;
  id v58;
  char v59;
  id v60;
  id v61;
  id v62;
  char v63;
  id v64;
  uint64_t v65;
  id *v66;
  int v67;
  int v68;
  void (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD __b[8];
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  int v77;
  int v78;
  BOOL (*v79)(id *, void *);
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  os_log_type_t type;
  id location;
  id v87;
  id v88;
  int v89;
  id v90;
  BOOL v91;
  SEL v92;
  UIApplicationAccessibility *v93;
  id v94;
  uint8_t v95[16];
  _BYTE v96[128];
  uint8_t v97[24];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v93 = self;
  v92 = a2;
  v91 = a3;
  v90 = -[UIApplicationAccessibility _axActiveEmojiSearchField](self);
  if (!v90)
  {
    v88 = -[UIApplicationAccessibility _accessibilityMainWindow](v93, "_accessibilityMainWindow");
    v87 = (id)objc_msgSend(v88, "safeValueForKey:", CFSTR("firstResponder"));
    location = (id)AXLogAppAccessibility();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v97, (uint64_t)v87);
      _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, type, "First responder: %@", v97, 0xCu);
    }
    objc_storeStrong(&location, 0);
    if (!v87 && (objc_msgSend(v88, "accessibilityViewIsModal") & 1) == 0)
    {
      v31 = (id)-[UIApplicationAccessibility safeValueForKey:](v93, "safeValueForKey:", CFSTR("keyWindow"));
      v3 = (id)objc_msgSend(v31, "safeValueForKey:", CFSTR("firstResponder"));
      v4 = v87;
      v87 = v3;

    }
    if (v91)
    {
      v30 = (id)objc_msgSend(v87, "_accessibilityWindow");
      v29 = (id)objc_msgSend(v30, "rootViewController");
      v84 = (id)objc_msgSend(v29, "presentedViewController");

      objc_opt_class();
      v83 = (id)__UIAccessibilityCastAsClass();
      if (!v83 && v84)
      {
        v5 = (id)objc_msgSend(v84, "presentedViewController");
        v6 = v84;
        v84 = v5;

        objc_opt_class();
        v7 = (id)__UIAccessibilityCastAsClass();
        v8 = v83;
        v83 = v7;

      }
      v28 = v87;
      v76 = MEMORY[0x24BDAC760];
      v77 = -1073741824;
      v78 = 0;
      v79 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke;
      v80 = &unk_24FF3E2D0;
      v81 = v83;
      v82 = (id)objc_msgSend(v28, "_accessibilityFindAncestor:startWithSelf:", &v76, 1);
      if (!v83 || v82)
      {
        v89 = 0;
      }
      else
      {
        v94 = 0;
        v89 = 1;
      }
      objc_storeStrong(&v82, 0);
      objc_storeStrong(&v81, 0);
      objc_storeStrong(&v83, 0);
      objc_storeStrong(&v84, 0);
      if (v89)
        goto LABEL_89;
    }
    if (!v87 && (AXProcessIsInCallService() & 1) == 0)
    {
      v75 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
      objc_msgSend(v75, "setSorted:", 0);
      v74 = (id)-[UIApplicationAccessibility _accessibilityViewChildrenWithOptions:](v93, "_accessibilityViewChildrenWithOptions:", v75);
      memset(__b, 0, sizeof(__b));
      obj = v74;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
      if (v27)
      {
        v23 = *(_QWORD *)__b[2];
        v24 = 0;
        v25 = v27;
        while (1)
        {
          v22 = v24;
          if (*(_QWORD *)__b[2] != v23)
            objc_enumerationMutation(obj);
          v73 = *(id *)(__b[1] + 8 * v24);
          if ((objc_msgSend(v73, "_accessibilityServesAsFirstResponder") & 1) != 0
            && (id)*MEMORY[0x24BEBB2A0] != v73
            && (objc_msgSend((id)*MEMORY[0x24BEBB2A0], "_accessibilityIsDescendantOfElement:", v73) & 1) == 0)
          {
            break;
          }
          ++v24;
          if (v22 + 1 >= v25)
          {
            v24 = 0;
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
            if (!v25)
              goto LABEL_29;
          }
        }
        objc_storeStrong(&v87, v73);
        v89 = 2;
      }
      else
      {
LABEL_29:
        v89 = 0;
      }

      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
    }
    v65 = 0;
    v66 = (id *)&v65;
    v67 = 838860800;
    v68 = 48;
    v69 = __Block_byref_object_copy__5;
    v70 = __Block_byref_object_dispose__5;
    v71 = 0;
    v64 = (id)objc_msgSend(v87, "_accessibilityResponderElement");
    if (v64)
    {
      TypeID = AXUIElementGetTypeID();
      if (TypeID == CFGetTypeID(v64))
      {
        v94 = v64;
        v89 = 1;
LABEL_88:
        objc_storeStrong(&v64, 0);
        _Block_object_dispose(&v65, 8);
        objc_storeStrong(&v71, 0);
LABEL_89:
        objc_storeStrong(&v87, 0);
        objc_storeStrong(&v88, 0);
        goto LABEL_90;
      }
      v63 = 0;
      objc_opt_class();
      LOBYTE(v20) = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = objc_msgSend(v64, "_accessibilityViewIsVisible") ^ 1;
      v63 = v20 & 1;
      v19 = 1;
      if ((v20 & 1) == 0)
        v19 = objc_msgSend(v64, "accessibilityElementsHidden");
      v63 = v19 & 1;
      if (((objc_msgSend(v64, "isAccessibilityElement") & 1) != 0
         || (objc_msgSend(v64, "_accessibilityIsRemoteElement") & 1) != 0)
        && (v63 & 1) == 0)
      {
        objc_storeStrong(v66 + 5, v64);
        v94 = -[UIApplicationAccessibility _accessibilityValidatedResponderForExistingGoodResponder:forFocus:](v93, v66[5], v91);
        v89 = 1;
        goto LABEL_88;
      }
    }
    while (1)
    {
      LOBYTE(v18) = 0;
      if (v87)
      {
        objc_opt_class();
        v18 = objc_opt_isKindOfClass() ^ 1;
      }
      if ((v18 & 1) == 0)
        break;
      v9 = (id)objc_msgSend(v87, "nextResponder");
      v10 = v87;
      v87 = v9;

    }
    if (v87)
    {
      v62 = v87;
      v61 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong(&v61, v87);
      while (v61)
      {
        if ((objc_msgSend(v61, "_accessibilityIsFrameOutOfBounds") & 1) == 0
          && (objc_msgSend(v61, "_accessibilityViewIsVisible") & 1) != 0)
        {
          if ((objc_msgSend(v61, "isAccessibilityElement") & 1) != 0
            || (objc_msgSend(v61, "_accessibilityCanBeFirstResponderWhenNotAnElement") & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v60 = (id)objc_msgSend(v61, "safeValueForKey:", CFSTR("_accessibilityMockParent"));
              if (v60 && (objc_msgSend(v60, "isAccessibilityElement") & 1) != 0)
              {
                objc_storeStrong(v66 + 5, v60);
                v89 = 7;
              }
              else
              {
                v89 = 0;
              }
              objc_storeStrong(&v60, 0);
              if (v89)
                break;
            }
            objc_storeStrong(v66 + 5, v61);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            v59 = 0;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v58 = (id)objc_msgSend(v61, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
              if (!v58 || (objc_msgSend(v58, "_accessibilityHasOrderedChildren") & 1) == 0)
                goto LABEL_70;
              v59 = 1;
              v53 = 0;
              v54 = &v53;
              v55 = 0x20000000;
              v56 = 32;
              v57 = 0;
              v17 = v58;
              v47 = MEMORY[0x24BDAC760];
              v48 = -1073741824;
              v49 = 0;
              v50 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_2;
              v51 = &unk_24FF3E2F8;
              v52[0] = v61;
              v52[1] = &v65;
              v52[2] = &v53;
              objc_msgSend(v17, "accessibilityEnumerateContainerElementsUsingBlock:", &v47);
              if ((v54[3] & 1) != 0)
              {
                v89 = 0;
              }
              else
              {
                AXPerformBlockOnMainThreadAfterDelay();
                objc_storeStrong(v66 + 5, 0);
                v89 = 7;
              }
              objc_storeStrong(v52, 0);
              _Block_object_dispose(&v53, 8);
              if (!v89)
LABEL_70:
                v89 = 0;
              objc_storeStrong(&v58, 0);
              if (v89)
                break;
            }
            v46 = 0;
            v46 = (void *)objc_msgSend(v61, "accessibilityElementCount");
            if ((uint64_t)v46 > 0 && v46 != (void *)0x7FFFFFFFFFFFFFFFLL)
            {
              v45 = v61;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (v59 & 1) != 0)
              {
                v40 = 0;
                v41 = &v40;
                v42 = 0x20000000;
                v43 = 32;
                v44 = 0;
                v16 = v66[5];
                v34 = MEMORY[0x24BDAC760];
                v35 = -1073741824;
                v36 = 0;
                v37 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_4;
                v38 = &unk_24FF3E340;
                v39[3] = v46;
                v39[0] = v62;
                v39[1] = &v65;
                v39[2] = &v40;
                objc_msgSend(v16, "accessibilityEnumerateContainerElementsUsingBlock:", &v34);
                v89 = (v41[3] & 1) != 0 ? 7 : 0;
                objc_storeStrong(v39, 0);
                _Block_object_dispose(&v40, 8);
              }
              else
              {
                v11 = (id)objc_msgSend(v45, "accessibilityElementAtIndex:", 0);
                v12 = v66[5];
                v66[5] = v11;

                v89 = 7;
              }
              objc_storeStrong(&v45, 0);
              if (v89)
                break;
            }
          }
        }
        v13 = (id)objc_msgSend(v61, "superview");
        v14 = v61;
        v61 = v13;

      }
      if ((objc_msgSend(v66[5], "_accessibilityIsWebDocumentView") & 1) != 0)
        objc_storeStrong(v66 + 5, 0);
      v33 = -[UIApplicationAccessibility _accessibilityValidatedResponderForExistingGoodResponder:forFocus:](v93, v66[5], v91);
      oslog = (os_log_t)(id)AXLogCommon();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_3_1_8_69((uint64_t)v95, (uint64_t)v33);
        _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "Validated first responder: %{sensitive}@", v95, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v94 = v33;
      v89 = 1;
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v61, 0);
      objc_storeStrong(&v62, 0);
    }
    else
    {
      v94 = 0;
      v89 = 1;
    }
    goto LABEL_88;
  }
  v94 = v90;
  v89 = 1;
LABEL_90:
  objc_storeStrong(&v90, 0);
  return v94;
}

BOOL __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke(id *a1, void *a2)
{
  id v2;
  id v5;
  BOOL v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = location[0];
  v2 = (id)objc_msgSend(a1[4], "view");
  v6 = v5 == v2;

  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilityValidatedResponderForExistingGoodResponder:(char)a3 forFocus:
{
  id v3;
  id v4;
  id location;
  void *v8;
  id v9;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    if ((a3 & 1) != 0)
    {
      v3 = -[UIApplicationAccessibility _accessibilityValidateResponderForFocus:](v8, location);
      v4 = location;
      location = v3;

    }
    v9 = location;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(&location, 0);
  return v9;
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  id v5;
  id v9[2];
  _BYTE *v10;
  uint64_t v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = a3;
  v10 = a4;
  v9[1] = a1;
  v9[0] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_msgSend(location[0], "realTableViewCell");
    v5 = v9[0];
    v9[0] = v4;

  }
  if ((objc_msgSend(v9[0], "isEqual:", a1[4]) & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), location[0]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *v10 = 1;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_3()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB8], 0);
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_4(_QWORD *a1, void *a2, unint64_t a3, _BYTE *a4)
{
  BOOL v4;
  char v5;
  char v9;
  id v10;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a3 < a1[7])
  {
    v9 = 0;
    v5 = 1;
    if (location[0] != (id)a1[4])
    {
      objc_opt_class();
      v4 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
        v9 = 1;
        v4 = v10 == (id)a1[4];
      }
      v5 = v4;
    }
    if ((v9 & 1) != 0)

    if ((v5 & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), location[0]);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityValidateResponderForFocus:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  int v25;
  id v26;
  int v27;
  int v28;
  uint64_t v29;
  char isKindOfClass;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id obj;
  uint64_t v43;
  _QWORD v44[8];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[8];
  id v50;
  char v51;
  id v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  char v60;
  id v61;
  char v62;
  id v63;
  char v64;
  char v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t (*v69)(void *, void *);
  void *v70;
  Class v71;
  char v72;
  id v73;
  uint64_t v74;
  int v75;
  int v76;
  uint64_t (*v77)(void *, void *);
  void *v78;
  Class v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t (*v83)(void *, void *);
  void *v84;
  Class v85;
  _QWORD v86[8];
  id v87;
  _QWORD __b[8];
  id v89;
  id v90;
  Class v91;
  Class v92;
  Class v93;
  Class v94;
  id v95;
  id v96;
  int v97;
  id location;
  id v99;
  id v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v99 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v99)
  {
    v96 = 0;
    v95 = 0;
    v94 = 0;
    v94 = NSClassFromString(CFSTR("_UIPopoverView"));
    v93 = 0;
    v93 = NSClassFromString(CFSTR("UITransitionView"));
    v92 = 0;
    v92 = NSClassFromString(CFSTR("UIDimmingView"));
    v91 = 0;
    v91 = NSClassFromString(CFSTR("_UIFormSheetPresentationController"));
    v90 = (id)objc_msgSend(v99, "_accessibilityWindows");
    memset(__b, 0, sizeof(__b));
    obj = v90;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v104, 16);
    if (v43)
    {
      v39 = *(_QWORD *)__b[2];
      v40 = 0;
      v41 = v43;
      while (1)
      {
        v38 = v40;
        if (*(_QWORD *)__b[2] != v39)
          objc_enumerationMutation(obj);
        v89 = *(id *)(__b[1] + 8 * v40);
        memset(v86, 0, sizeof(v86));
        v35 = (id)objc_msgSend(v89, "subviews");
        v36 = (id)objc_msgSend(v35, "reverseObjectEnumerator");

        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v86, v103, 16);
        if (v37)
        {
          v32 = *(_QWORD *)v86[2];
          v33 = 0;
          v34 = v37;
          while (1)
          {
            v31 = v33;
            if (*(_QWORD *)v86[2] != v32)
              objc_enumerationMutation(v36);
            v87 = *(id *)(v86[1] + 8 * v33);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_storeStrong(&v96, v87);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = MEMORY[0x24BDAC760];
              v80 = MEMORY[0x24BDAC760];
              v81 = -1073741824;
              v82 = 0;
              v83 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke;
              v84 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              v85 = v92;
              v2 = (id)objc_msgSend(v87, "_accessibilityFindSubviewDescendant:", &v80);
              v3 = v95;
              v95 = v2;

              v74 = v29;
              v75 = -1073741824;
              v76 = 0;
              v77 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_2;
              v78 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              v79 = v94;
              v4 = (id)objc_msgSend(v87, "_accessibilityFindSubviewDescendant:", &v74);
              v5 = v96;
              v96 = v4;

              v72 = 0;
              isKindOfClass = 1;
              if (!v96)
              {
                v73 = (id)objc_msgSend(v95, "safeValueForKey:", CFSTR("delegate"));
                v72 = 1;
                isKindOfClass = objc_opt_isKindOfClass();
              }
              if ((v72 & 1) != 0)

              if ((isKindOfClass & 1) != 0)
              {
                v97 = 4;
                goto LABEL_26;
              }
            }
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_storeStrong(&v95, v87);
              v66 = MEMORY[0x24BDAC760];
              v67 = -1073741824;
              v68 = 0;
              v69 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_3;
              v70 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              v71 = v94;
              v6 = (id)objc_msgSend(v95, "_accessibilityFindSubviewDescendant:", &v66);
              v7 = v96;
              v96 = v6;

              if (v96)
                break;
            }
            ++v33;
            if (v31 + 1 >= v34)
            {
              v33 = 0;
              v34 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v86, v103, 16);
              if (!v34)
                goto LABEL_25;
            }
          }
          v97 = 4;
        }
        else
        {
LABEL_25:
          v97 = 0;
        }
LABEL_26:

        ++v40;
        if (v38 + 1 >= v41)
        {
          v40 = 0;
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v104, 16);
          if (!v41)
            break;
        }
      }
    }

    v65 = 0;
    LOBYTE(v28) = 0;
    if (v96)
    {
      LOBYTE(v28) = 0;
      if ((objc_msgSend(v96, "isHidden") & 1) == 0)
        v28 = objc_msgSend(location, "_accessibilityIsDescendantOfElement:", v96) ^ 1;
    }
    v65 = v28 & 1;
    v64 = 0;
    v62 = 0;
    v60 = 0;
    v58 = 0;
    LOBYTE(v27) = 0;
    if (v95)
    {
      LOBYTE(v27) = 0;
      if ((objc_msgSend(v95, "isHidden") & 1) == 0)
      {
        v63 = (id)objc_msgSend(v95, "safeValueForKey:", CFSTR("delegate"));
        v62 = 1;
        LOBYTE(v27) = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = location;
          v61 = (id)objc_msgSend(v95, "safeValueForKey:", CFSTR("delegate"));
          v60 = 1;
          v59 = (id)objc_msgSend(v61, "safeValueForKey:", CFSTR("dropShadowView"));
          v58 = 1;
          v27 = objc_msgSend(v26, "_accessibilityIsDescendantOfElement:") ^ 1;
        }
      }
    }
    if ((v58 & 1) != 0)

    if ((v60 & 1) != 0)
    if ((v62 & 1) != 0)

    v64 = v27 & 1;
    v56 = 0;
    if ((v65 & 1) != 0 || (LOBYTE(v25) = 0, (v64 & 1) != 0))
    {
      v57 = (id)objc_msgSend(location, "_accessibilityWindow");
      v56 = 1;
      objc_opt_class();
      v25 = objc_opt_isKindOfClass() ^ 1;
    }
    if ((v56 & 1) != 0)

    if ((v25 & 1) != 0)
    {
      v55 = (id)objc_msgSend(v95, "_accessibilityObscuredScreenAllowedViews");
      v54 = 0;
      v8 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive");
      v51 = 0;
      if ((v8 & 1) != 0)
      {
        v52 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
        v51 = 1;
        v9 = v52;
      }
      else
      {
        v9 = 0;
      }
      v53 = v9;
      if ((v51 & 1) != 0)

      memset(v49, 0, sizeof(v49));
      v23 = v55;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v49, v102, 16);
      if (v24)
      {
        v20 = *(_QWORD *)v49[2];
        v21 = 0;
        v22 = v24;
        while (1)
        {
          v19 = v21;
          if (*(_QWORD *)v49[2] != v20)
            objc_enumerationMutation(v23);
          v50 = *(id *)(v49[1] + 8 * v21);
          if ((objc_msgSend(location, "_accessibilityIsDescendantOfElement:", v50) & 1) != 0 || v50 == v53)
            break;
          ++v21;
          if (v19 + 1 >= v22)
          {
            v21 = 0;
            v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v49, v102, 16);
            if (!v22)
              goto LABEL_61;
          }
        }
        v54 = 1;
        v97 = 6;
      }
      else
      {
LABEL_61:
        v97 = 0;
      }

      if ((v54 & 1) == 0)
        objc_storeStrong(&location, 0);
      objc_storeStrong(&v53, 0);
      objc_storeStrong(&v55, 0);
    }
    v48 = (id)objc_msgSend(location, "accessibilityContainer");
    v47 = location;
    while (v48)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v46 = (id)objc_msgSend(v48, "subviews");
        if ((unint64_t)objc_msgSend(v46, "count") > 1)
        {
          memset(v44, 0, sizeof(v44));
          v17 = v46;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v44, v101, 16);
          if (v18)
          {
            v14 = *(_QWORD *)v44[2];
            v15 = 0;
            v16 = v18;
            while (1)
            {
              v13 = v15;
              if (*(_QWORD *)v44[2] != v14)
                objc_enumerationMutation(v17);
              v45 = *(id *)(v44[1] + 8 * v15);
              if (v45 != v47 && (objc_msgSend(v45, "accessibilityViewIsModal") & 1) != 0)
                break;
              ++v15;
              if (v13 + 1 >= v16)
              {
                v15 = 0;
                v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v44, v101, 16);
                if (!v16)
                  goto LABEL_78;
              }
            }
            objc_storeStrong(&location, 0);
            v97 = 10;
          }
          else
          {
LABEL_78:
            v97 = 0;
          }

        }
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v47, v48);
      v10 = (id)objc_msgSend(v48, "accessibilityContainer");
      v11 = v48;
      v48 = v10;

    }
    v100 = location;
    v97 = 1;
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v96, 0);
  }
  else
  {
    v100 = 0;
    v97 = 1;
  }
  objc_storeStrong(&location, 0);
  return v100;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_3(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilityMainWindow
{
  id v4;
  id v5;

  v4 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v5 = -[UIApplicationAccessibility _accessibilityMainWindowInWindows:](self, "_accessibilityMainWindowInWindows:");

  return v5;
}

- (id)_accessibilityMainWindowInWindows:(id)a3
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v15;
  UIApplicationAccessibility *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id obj;
  uint64_t v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  id v39;
  int v40;
  id v41;
  _QWORD v42[8];
  id v43;
  id v44;
  id v45;
  Class v46;
  _QWORD __b[8];
  NSString *aClassName;
  id v49;
  id location[2];
  UIApplicationAccessibility *v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!_accessibilityMainWindowInWindows__AlertWindows)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF0]), "init");
    v4 = (void *)_accessibilityMainWindowInWindows__AlertWindows;
    _accessibilityMainWindowInWindows__AlertWindows = v3;

    v49 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("SBTransientOverlayWindow"), CFSTR("SBBannerWindow"), CFSTR("SBAlertItemWindow"), 0);
    memset(__b, 0, sizeof(__b));
    obj = v49;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
    if (v33)
    {
      v29 = *(_QWORD *)__b[2];
      v30 = 0;
      v31 = v33;
      while (1)
      {
        v28 = v30;
        if (*(_QWORD *)__b[2] != v29)
          objc_enumerationMutation(obj);
        aClassName = *(NSString **)(__b[1] + 8 * v30);
        v46 = NSClassFromString(aClassName);
        objc_msgSend((id)_accessibilityMainWindowInWindows__AlertWindows, "axSafelyAddObject:", v46);
        ++v30;
        if (v28 + 1 >= v31)
        {
          v30 = 0;
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
          if (!v31)
            break;
        }
      }
    }

    objc_storeStrong(&v49, 0);
  }
  v45 = 0;
  v44 = 0;
  memset(v42, 0, sizeof(v42));
  v26 = (id)objc_msgSend(location[0], "reverseObjectEnumerator");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v42, v53, 16);
  if (v27)
  {
    v23 = *(_QWORD *)v42[2];
    v24 = 0;
    v25 = v27;
    while (1)
    {
      v22 = v24;
      if (*(_QWORD *)v42[2] != v23)
        objc_enumerationMutation(v26);
      v43 = *(id *)(v42[1] + 8 * v24);
      if (!-[UIViewAccessibility _accessibilityViewIsActive](v43)
        && ((objc_msgSend(v43, "isHidden") & 1) != 0
         || (objc_msgSend(v43, "isOpaque") & 1) != 0
         || (objc_msgSend((id)_accessibilityMainWindowInWindows__AlertWindows, "containsObject:", objc_opt_class()) & 1) == 0))
      {
        goto LABEL_37;
      }
      v41 = (id)objc_msgSend(v43, "windowScene");
      if (v41 && objc_msgSend(v41, "activationState") == 1)
      {
        v40 = 5;
      }
      else
      {
        v20 = (id)objc_msgSend(v43, "screen");
        v19 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v21 = (objc_msgSend(v20, "isEqual:") & 1) != 0;

        if (v21)
        {
          if ((objc_msgSend(v43, "accessibilityElementsHidden") & 1) != 0)
          {
            v40 = 5;
          }
          else if ((objc_msgSend(v43, "_accessibilityIsMainWindow") & 1) != 0)
          {
            v52 = v43;
            v40 = 1;
          }
          else
          {
            if ((objc_msgSend((id)_accessibilityMainWindowInWindows__AlertWindows, "containsObject:", objc_opt_class()) & 1) == 0)
            {
              if ((objc_msgSend(v43, "_accessibilityCanBeConsideredAsMainWindow") & 1) == 0)
              {
                v40 = 5;
                goto LABEL_35;
              }
              if (!v44)
                objc_storeStrong(&v44, v43);
              if ((objc_msgSend(v43, "accessibilityViewIsModal") & 1) == 0)
              {
                v40 = 0;
                goto LABEL_35;
              }
            }
            objc_storeStrong(&v45, v43);
            v40 = 4;
          }
        }
        else
        {
          v40 = 5;
        }
      }
LABEL_35:
      objc_storeStrong(&v41, 0);
      if (v40 && v40 != 5)
        goto LABEL_40;
LABEL_37:
      ++v24;
      if (v22 + 1 >= v25)
      {
        v24 = 0;
        v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v42, v53, 16);
        if (!v25)
          break;
      }
    }
  }
  v40 = 0;
LABEL_40:

  if (!v40 || v40 == 4)
  {
    if (!v45)
    {
      v39 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
      if ((objc_msgSend(location[0], "containsObject:", v39) & 1) != 0)
        v18 = v39;
      else
        v18 = v45;
      objc_storeStrong(&v45, v18);
      objc_storeStrong(&v39, 0);
    }
    if (v44)
    {
      if ((objc_msgSend(v44, "accessibilityElementsHidden") & 1) == 0)
      {
        objc_msgSend(v44, "windowLevel");
        v17 = v5;
        objc_msgSend(v45, "windowLevel");
        if (v17 > v6
          || (objc_msgSend(v45, "alpha", v17), v7 == 0.0)
          || (objc_msgSend(v45, "_accessibilityCanBeConsideredAsMainWindow") & 1) == 0)
        {
          objc_storeStrong(&v45, v44);
        }
      }
    }
    if (!v45)
    {
      AXDeviceGetMainScreenPixelBounds();
      v36 = v8;
      v37 = v9;
      *(_QWORD *)&v38 = v10;
      *((_QWORD *)&v38 + 1) = v11;
      v35 = v38;
      v16 = v51;
      CGPointMake_2();
      v34 = -[UIApplicationAccessibility _accessibilityUIWindowFindWithGlobalPoint:](v16, v12, v13);
      if ((objc_msgSend(location[0], "containsObject:", v34) & 1) != 0)
        v15 = v34;
      else
        v15 = v45;
      objc_storeStrong(&v45, v15);
      objc_storeStrong(&v34, 0);
    }
    if (!v45 || (objc_msgSend(v45, "accessibilityElementsHidden") & 1) != 0)
      objc_storeStrong(&v45, v44);
    v52 = v45;
    v40 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v52;
}

- (id)_accessibilityUIWindowFindWithGlobalPoint:(double)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  float v7;
  CGFloat v8;
  CGFloat v9;
  float v10;
  double v11;
  double v12;
  float v13;
  id v15;
  int v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id obj;
  uint64_t v24;
  void *context;
  char v26;
  id v27;
  id v28;
  CGPoint point;
  char v30;
  id v31;
  CGRect rect;
  id v33;
  _QWORD __b[8];
  id v35;
  id location;
  float v37;
  id v38[2];
  double v39;
  double v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v39 = a2;
  v40 = a3;
  v38[1] = a1;
  if (a1)
  {
    context = (void *)MEMORY[0x2348C3C98]();
    if (!_accessibilityUIWindowFindWithGlobalPoint__UIWindowClass)
    {
      _accessibilityUIWindowFindWithGlobalPoint__UIWindowClass = objc_opt_class();
      _accessibilityUIWindowFindWithGlobalPoint__FBRootWindowClass = (uint64_t)NSClassFromString(CFSTR("FBRootWindow"));
    }
    v38[0] = (id)objc_msgSend(MEMORY[0x24BDE5658], "allContexts");
    v37 = -3.4028e38;
    location = 0;
    memset(__b, 0, sizeof(__b));
    obj = v38[0];
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v24)
    {
      v20 = *(_QWORD *)__b[2];
      v21 = 0;
      v22 = v24;
      while (1)
      {
        v19 = v21;
        if (*(_QWORD *)__b[2] != v20)
          objc_enumerationMutation(obj);
        v35 = *(id *)(__b[1] + 8 * v21);
        v33 = (id)objc_msgSend(v35, "layer", v15);
        memset(&rect, 0, sizeof(rect));
        objc_msgSend(v33, "bounds");
        rect.origin.x = v3;
        rect.origin.y = v4;
        rect.size.width = v5;
        rect.size.height = v6;
        v30 = 0;
        v18 = 0;
        if (v33)
        {
          v18 = 0;
          if ((objc_msgSend(v33, "isHidden") & 1) == 0)
          {
            objc_msgSend(v33, "opacity");
            v18 = 0;
            if (v7 > 0.05)
            {
              v31 = (id)objc_msgSend(v33, "delegate");
              v30 = 1;
              v18 = 0;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v33, "convertPoint:fromLayer:", 0, v39, v40);
                point.x = v8;
                point.y = v9;
                v18 = 0;
                if (CGRectContainsPoint(rect, point))
                {
                  v17 = 0;
                  if (rect.size.width > 1.0)
                    v17 = rect.size.height > 1.0;
                  v18 = v17;
                }
              }
            }
          }
        }
        if ((v30 & 1) != 0)

        if (v18)
        {
          v28 = (id)objc_msgSend(v33, "delegate");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v35, "level");
            v26 = 0;
            LOBYTE(v16) = 0;
            if (v10 > v37)
            {
              LOBYTE(v16) = 0;
              if ((objc_msgSend(v28, "isUserInteractionEnabled") & 1) != 0)
              {
                objc_msgSend(v28, "bounds");
                LOBYTE(v16) = 0;
                if (v11 > 1.0)
                {
                  objc_msgSend(v28, "bounds", v11);
                  LOBYTE(v16) = 0;
                  if (v12 > 1.0)
                  {
                    v27 = (id)objc_msgSend(v28, "hitTest:withEvent:", 0, v39, v40);
                    v26 = 1;
                    LOBYTE(v16) = 0;
                    if (v27)
                      v16 = objc_opt_isKindOfClass() ^ 1;
                  }
                }
              }
            }
            if ((v26 & 1) != 0)

            if ((v16 & 1) != 0)
            {
              objc_storeStrong(&location, v28);
              objc_msgSend(v35, "level");
              v37 = v13;
            }
          }
          else
          {
            v15 = v28;
            _AXAssert();
          }
          objc_storeStrong(&v28, 0);
        }
        objc_storeStrong(&v33, 0);
        ++v21;
        if (v19 + 1 >= v22)
        {
          v21 = 0;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
          if (!v22)
            break;
        }
      }
    }

    v41 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(v38, 0);
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v41 = 0;
  }
  return v41;
}

- (id)_accessibilityAllWindowsOnlyVisibleWindows:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, a3);
}

- (id)_accessibilityElementsForSearchParameter:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(_QWORD *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL (*v20)(_QWORD *, void *, void *);
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id location[2];
  UIApplicationAccessibility *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("searchText"));
  v6 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("resultLimit"));
  v7 = objc_msgSend(v6, "integerValue");

  v24 = v7;
  if (!v7)
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = MEMORY[0x24BDAC760];
  v17 = MEMORY[0x24BDAC760];
  v18 = -1073741824;
  v19 = 0;
  v20 = __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke;
  v21 = &unk_24FF3E388;
  v22 = v25;
  v23 = (id)MEMORY[0x2348C3D88](&v17);
  v16 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v9 = v4;
  v10 = -1073741824;
  v11 = 0;
  v12 = __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke_2;
  v13 = &unk_24FF3E3B0;
  v15 = v23;
  v14 = v25;
  objc_msgSend(v16, "setLeafNodePredicate:", &v9);
  v8 = (id)-[UIApplicationAccessibility _accessibilityLeafDescendantsWithCount:options:](v27, "_accessibilityLeafDescendantsWithCount:options:", v24 + 1, v16);
  v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v5;
}

BOOL __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6[2];
  id v7;
  id location[2];
  BOOL v9;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  v6[0] = (id)objc_msgSend(location[0], "_accessibilityAXAttributedLabel");
  if (objc_msgSend(v6[0], "length"))
    v9 = objc_msgSend(v6[0], "rangeOfString:options:", a1[4], 1) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = 0;
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

uint64_t __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke_2(_QWORD *a1, void *a2)
{
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = 0;
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) != 0)
    v4 = (*(uint64_t (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)automationElements
{
  return -[UIApplicationAccessibility _accessibilityWindows](self, "_accessibilityWindows", a2, self);
}

- (id)_accessibilityWindowsIgnoringWindowsWithHiddenElements:(BOOL)a3
{
  id v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  BOOL v14;
  SEL v15;
  UIApplicationAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 838860800;
  v10 = 48;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  AXPerformSafeBlock();
  if (v14)
  {
    v3 = (id)objc_msgSend((id)v8[5], "ax_filteredArrayUsingBlock:", &__block_literal_global_597);
    v4 = (void *)v8[5];
    v8[5] = (uint64_t)v3;

  }
  v6 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  objc_storeStrong(&v13, 0);
  return v6;
}

void __85__UIApplicationAccessibility__accessibilityWindowsIgnoringWindowsWithHiddenElements___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

uint64_t __85__UIApplicationAccessibility__accessibilityWindowsIgnoringWindowsWithHiddenElements___block_invoke_2(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "accessibilityElementsHidden") ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityWindows
{
  return -[UIApplicationAccessibility _accessibilityWindowsIgnoringWindowsWithHiddenElements:](self, "_accessibilityWindowsIgnoringWindowsWithHiddenElements:", 1, a2, self);
}

- (id)_accessibilityFindContainerAccessibleElement:(char)a3 first:(char)a4 focus:(char)a5 allowScrolling:
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  int v9;
  char v10;
  id v11;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  id v21[2];
  char v22;
  char v23;
  char v24;
  os_log_type_t v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  id *v34;
  int v35;
  int v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  int v40;
  char v41;
  char v42;
  char v43;
  id location;
  id v45;
  id v46;
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v45 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v43 = a3 & 1;
  v42 = a4 & 1;
  v41 = a5 & 1;
  if (v45)
  {
    v33 = 0;
    v34 = (id *)&v33;
    v35 = 838860800;
    v36 = 48;
    v37 = __Block_byref_object_copy__5;
    v38 = __Block_byref_object_dispose__5;
    v39 = 0;
    if ((objc_msgSend(location, "isAccessibilityOpaqueElementProvider") & 1) != 0
      && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0)
    {
      if ((v41 & 1) == 0)
        objc_msgSend(location, "_accessibilitySetShouldPreventOpaqueScrolling:", 1);
      v31 = 0;
      v29 = 0;
      v27 = 0;
      if ((v42 & 1) != 0)
      {
        v32 = (id)objc_msgSend(location, "_accessibilityFirstOpaqueElementForFocus");
        v31 = 1;
        objc_storeStrong(v34 + 5, v32);
      }
      else
      {
        if ((v43 & 1) != 0)
        {
          v30 = (id)objc_msgSend(location, "_accessibilityFirstOpaqueElement");
          v29 = 1;
          v11 = v30;
        }
        else
        {
          v28 = (id)objc_msgSend(location, "_accessibilityLastOpaqueElement");
          v27 = 1;
          v11 = v28;
        }
        objc_storeStrong(v34 + 5, v11);
      }
      if ((v27 & 1) != 0)

      if ((v29 & 1) != 0)
      if ((v31 & 1) != 0)

      objc_msgSend(location, "_accessibilitySetShouldPreventOpaqueScrolling:", 0);
      v26 = (id)AXLogFirstElement();
      v25 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
      {
        v9 = objc_msgSend(v34[5], "isAccessibilityElement") & 1;
        v10 = objc_msgSend(v34[5], "_accessibilityHasOrderedChildren");
        __os_log_helper_16_3_3_4_0_4_0_8_65((uint64_t)v47, v9, v10 & 1, (uint64_t)v34[5]);
        _os_log_debug_impl(&dword_230C4A000, (os_log_t)v26, v25, "Opaque element (is element %i is container %i): %{private}@", v47, 0x18u);
      }
      objc_storeStrong(&v26, 0);
    }
    else
    {
      v8 = location;
      v5 = 0;
      if ((v43 & 1) == 0)
        v5 = 2;
      v7 = v5;
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __102__UIApplicationAccessibility__accessibilityFindContainerAccessibleElement_first_focus_allowScrolling___block_invoke;
      v19 = &unk_24FF3E418;
      v21[1] = &v33;
      v20 = location;
      v21[0] = v45;
      v22 = v43 & 1;
      v23 = v42 & 1;
      v24 = v41 & 1;
      objc_msgSend(v8, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", v7, &v15);
      objc_storeStrong(v21, 0);
      objc_storeStrong(&v20, 0);
    }
    v46 = v34[5];
    v40 = 1;
    _Block_object_dispose(&v33, 8);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v46 = 0;
    v40 = 1;
  }
  objc_storeStrong(&location, 0);
  return v46;
}

void __102__UIApplicationAccessibility__accessibilityFindContainerAccessibleElement_first_focus_allowScrolling___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD __b[8];
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  id location[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v36 = a3;
  v35 = a4;
  v34 = a1;
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) == 0
    || (v4 = objc_msgSend(location[0], "accessibilityTraits"), (v4 & *MEMORY[0x24BEBB178]) != 0)
    || (objc_msgSend(location[0], "_accessibilityIsNotFirstElement") & 1) != 0)
  {
    if (location[0] == *(id *)(a1 + 32))
    {
      _AXAssert();
      *v35 = 1;
    }
    else if ((objc_msgSend(location[0], "isAccessibilityOpaqueElementProvider") & 1) != 0
           && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0
           || objc_msgSend(location[0], "accessibilityElementCount") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = (id)-[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](*(_QWORD *)(a1 + 40), location[0], *(_BYTE *)(a1 + 56) & 1, *(_BYTE *)(a1 + 57) & 1, *(_BYTE *)(a1 + 58) & 1);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        *v35 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (id)*MEMORY[0x24BEBB2A0] == location[0]
        || (objc_msgSend((id)*MEMORY[0x24BEBB2A0], "_accessibilityIsDescendantOfElement:", location[0]) & 1) != 0)
      {
        objc_opt_class();
        v27 = 0;
        v25 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = location[0];
          v28 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
          v27 = 1;
          v26 = (id)objc_msgSend(v19, "_accessibilityViewChildrenWithOptions:");
          v25 = 1;
          v9 = v26;
        }
        else
        {
          v9 = 0;
        }
        v29 = v9;
        if ((v25 & 1) != 0)

        if ((v27 & 1) != 0)
        memset(__b, 0, sizeof(__b));
        v17 = v29;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (v18)
        {
          v14 = *(_QWORD *)__b[2];
          v15 = 0;
          v16 = v18;
          while (1)
          {
            v13 = v15;
            if (*(_QWORD *)__b[2] != v14)
              objc_enumerationMutation(v17);
            v24 = *(id *)(__b[1] + 8 * v15);
            if ((objc_msgSend(v24, "isAccessibilityElement") & 1) != 0)
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v24);
            }
            else
            {
              v10 = (id)-[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](*(_QWORD *)(a1 + 40), v24, *(_BYTE *)(a1 + 56) & 1, *(_BYTE *)(a1 + 57) & 1, *(_BYTE *)(a1 + 58) & 1);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v12 = *(void **)(v11 + 40);
              *(_QWORD *)(v11 + 40) = v10;

            }
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
              break;
            ++v15;
            if (v13 + 1 >= v16)
            {
              v15 = 0;
              v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
              if (!v16)
                goto LABEL_44;
            }
          }
          *v35 = 1;
        }
LABEL_44:

        objc_storeStrong(&v29, 0);
      }
      else
      {
        v8 = *(_BYTE *)(a1 + 56);
        v32 = 0;
        v30 = 0;
        if ((v8 & 1) != 0)
        {
          v33 = (id)objc_msgSend(location[0], "_accessibilityFirstElement");
          v32 = 1;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v33);
        }
        else
        {
          v31 = (id)objc_msgSend(location[0], "_accessibilityLastElement");
          v30 = 1;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v31);
        }
        if ((v30 & 1) != 0)

        if ((v32 & 1) != 0)
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          *v35 = 1;
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), location[0]);
    *v35 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetAllowsNotificationsDuringSuspension:(BOOL)a3
{
  -[UIApplicationAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXAppAllowsNotifications"));
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  id v2;
  BOOL v4;
  int v5;
  id location[2];
  UIApplicationAccessibility *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  v2 = (id)-[UIApplicationAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAppAllowsNotifications"));
  v4 = v2 == 0;

  if (v4)
  {
    if ((-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("_UIViewServiceSessionManager")), "safeBoolForKey:", CFSTR("hasActiveSessions")) & 1) == 0|| ((location[0] = -[UIApplicationAccessibility _accessibilityMainWindow](v7, "_accessibilityMainWindow"), (objc_msgSend(location[0], "isHidden") & 1) != 0)|| (NSClassFromString(CFSTR("_UIHostedWindow")), (objc_opt_isKindOfClass() & 1) == 0)&& (objc_msgSend(location[0], "safeBoolForKey:", CFSTR("_isHostedInAnotherProcess")) & 1) == 0? (v5 = 0): (v8 = 1, v5 = 1), objc_storeStrong(location, 0), !v5))
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = -[UIApplicationAccessibility _accessibilityBoolValueForKey:](v7, "_accessibilityBoolValueForKey:", CFSTR("AXAppAllowsNotifications")) & 1;
  }
  return v8 & 1;
}

- (id)_accessibilityCellWithRowIndex:(int64_t)a3 column:(int64_t)a4 containingView:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v12;
  _QWORD __b[8];
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  int64_t v26;
  int64_t v27;
  SEL v28;
  UIApplicationAccessibility *v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  v28 = a2;
  v27 = a3;
  v26 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v24 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v23 = (id)objc_msgSend(v24, "leafNodePredicate");
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __83__UIApplicationAccessibility__accessibilityCellWithRowIndex_column_containingView___block_invoke;
  v20 = &unk_24FF3E440;
  v21 = v23;
  v22 = (id)MEMORY[0x2348C3D88](&v16);
  objc_msgSend(v24, "setLeafNodePredicate:", v22);
  v15 = (id)-[UIApplicationAccessibility _accessibilityLeafDescendantsWithOptions:](v29, "_accessibilityLeafDescendantsWithOptions:", v24);
  memset(__b, 0, sizeof(__b));
  obj = v15;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v14 == location)
          break;
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (!v9)
          goto LABEL_11;
      }
    }
    v30 = (id)objc_msgSend(v14, "accessibilityElementForRow:andColumn:", v27, v26);
    v12 = 1;
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  if (!v12)
    v30 = 0;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
  return v30;
}

uint64_t __83__UIApplicationAccessibility__accessibilityCellWithRowIndex_column_containingView___block_invoke(_QWORD *a1, void *a2)
{
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = 1;
  if ((objc_msgSend(location[0], "isAccessibilityOpaqueElementProvider") & 1) == 0)
    v4 = (*(uint64_t (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6
{
  id v7;
  id location;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  UIApplicationAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v7 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:allowScrolling:parameters:](v13, "_accessibilityElementFirst:last:forFocus:allowScrolling:parameters:", v11, v10, v9, 0, location);
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 parameters:(id)a7
{
  id v8;
  id v9;
  char v10;
  UIApplicationAccessibility *v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  char v16;
  id v17;
  char v18;
  id v19;
  id location;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  SEL v25;
  UIApplicationAccessibility *v26;
  id v27;

  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  location = 0;
  objc_storeStrong(&location, a7);
  v9 = (id)objc_msgSend(location, "objectForKey:", *MEMORY[0x24BDFE978]);
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v26;
  v12 = v24;
  v13 = v23;
  v14 = v22;
  v15 = v21;
  v18 = 0;
  v16 = 0;
  if ((v10 & 1) != 0)
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptionsHonoringGroups");
    v18 = 1;
    v8 = v19;
  }
  else
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v16 = 1;
    v8 = v17;
  }
  v27 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:](v11, "_accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:", v12, v13, v14, v15, v8);
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  objc_storeStrong(&location, 0);
  return v27;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  char v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  NSObject *v33;
  os_log_type_t v34;
  NSObject *v35;
  os_log_type_t v36;
  NSObject *v37;
  os_log_type_t v38;
  CFTypeID v39;
  NSObject *v40;
  os_log_type_t v41;
  char v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  id obj;
  uint64_t v57;
  os_log_t v58;
  os_log_type_t v59;
  os_log_t v60;
  char v61;
  id v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t (*v66)(void *, void *);
  void *v67;
  Class v68;
  os_log_type_t v69;
  os_log_t oslog;
  char v71;
  id v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t (*v76)(void *, void *);
  void *v77;
  Class v78;
  uint8_t v79[15];
  os_log_type_t v80;
  id v81;
  os_log_type_t v82;
  id v83;
  char v84;
  BOOL v85;
  os_log_type_t v86;
  id v87;
  char v88;
  id v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t (*v93)(void *, void *);
  void *v94;
  Class v95;
  os_log_type_t v96;
  id v97;
  os_log_type_t v98;
  id v99;
  os_log_type_t v100;
  id v101;
  os_log_type_t v102;
  id v103;
  id v104;
  char v105;
  int v106;
  os_log_type_t v107;
  id v108;
  uint64_t v109;
  int v110;
  int v111;
  BOOL (*v112)(void *, void *);
  void *v113;
  Class v114;
  id v115;
  _QWORD v116[8];
  id v117;
  id v118;
  char v119;
  Class v120;
  Class v121;
  id v122;
  os_log_type_t v123;
  id v124;
  _QWORD __b[8];
  uint64_t v126;
  id v127;
  os_log_type_t type;
  id v129;
  id location;
  BOOL v131;
  BOOL v132;
  BOOL v133;
  BOOL v134;
  SEL v135;
  UIApplicationAccessibility *v136;
  uint8_t v137[16];
  uint8_t v138[16];
  uint8_t v139[16];
  uint8_t v140[16];
  uint8_t v141[16];
  uint8_t v142[16];
  uint8_t v143[16];
  uint8_t v144[16];
  uint8_t v145[16];
  uint8_t v146[16];
  _BYTE v147[128];
  uint8_t v148[16];
  _BYTE v149[128];
  uint8_t v150[40];
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v136 = self;
  v135 = a2;
  v134 = a3;
  v133 = a4;
  v132 = a5;
  v131 = a6;
  location = 0;
  objc_storeStrong(&location, a7);
  v129 = (id)AXLogFirstElement();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v129, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v150, v134, v133, v132, v131);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)v129, type, "Getting first: %i last: %i forFocus: %i allowScrolling: %i", v150, 0x1Au);
  }
  objc_storeStrong(&v129, 0);
  v127 = (id)-[UIApplicationAccessibility _accessibilityViewChildrenWithOptions:](v136, "_accessibilityViewChildrenWithOptions:", location);
  memset(__b, 0, sizeof(__b));
  obj = v127;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v149, 16);
  if (v57)
  {
    v53 = *(_QWORD *)__b[2];
    v54 = 0;
    v55 = v57;
    while (1)
    {
      v52 = v54;
      if (*(_QWORD *)__b[2] != v53)
        objc_enumerationMutation(obj);
      v126 = *(_QWORD *)(__b[1] + 8 * v54);
      v124 = (id)AXLogFirstElement();
      v123 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_DEBUG))
      {
        v51 = v124;
        __os_log_helper_16_3_1_8_65((uint64_t)v148, v126);
        _os_log_debug_impl(&dword_230C4A000, v51, v123, "Element: %{private}@", v148, 0xCu);
      }
      objc_storeStrong(&v124, 0);
      ++v54;
      if (v52 + 1 >= v55)
      {
        v54 = 0;
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v149, 16);
        if (!v55)
          break;
      }
    }
  }

  v122 = (id)objc_msgSend(v127, "objectEnumerator");
  if (v133)
  {
    v7 = (id)objc_msgSend(v127, "reverseObjectEnumerator");
    v8 = v122;
    v122 = v7;

  }
  v121 = 0;
  v121 = NSClassFromString(CFSTR("UIDimmingView"));
  v120 = 0;
  v120 = NSClassFromString(CFSTR("_UIPopoverView"));
  v119 = 0;
  v118 = 0;
  memset(v116, 0, sizeof(v116));
  v49 = v122;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", v116, v147, 16);
  if (v50)
  {
    v46 = *(_QWORD *)v116[2];
    v47 = 0;
    v48 = v50;
    while (1)
    {
      v45 = v47;
      if (*(_QWORD *)v116[2] != v46)
        objc_enumerationMutation(v49);
      v117 = *(id *)(v116[1] + 8 * v47);
      v109 = MEMORY[0x24BDAC760];
      v110 = -1073741824;
      v111 = 0;
      v112 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke;
      v113 = &__block_descriptor_40_e8_B16__0_8lu32l8;
      v114 = v120;
      v115 = (id)objc_msgSend(v117, "_accessibilityFindAncestor:startWithSelf:", &v109, 0);
      if (v115)
      {
        if ((objc_msgSend(v117, "isAccessibilityElement") & 1) != 0)
        {
          objc_storeStrong(&v118, v117);
        }
        else
        {
          v9 = -[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](v136, v117, v134, v132, v131);
          v10 = v118;
          v118 = v9;

        }
        if (v118)
        {
          v108 = (id)AXLogFirstElement();
          v107 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_DEBUG))
          {
            v43 = v108;
            v44 = v107;
            __os_log_helper_16_3_1_8_65((uint64_t)v146, (uint64_t)v118);
            _os_log_debug_impl(&dword_230C4A000, v43, v44, "Got element from popover view: %{private}@", v146, 0xCu);
          }
          objc_storeStrong(&v108, 0);
          v106 = 4;
          goto LABEL_111;
        }
      }
      v105 = 0;
      v42 = 0;
      if ((objc_msgSend(location, "honorsElementGrouping") & 1) != 0)
        v42 = objc_msgSend(v117, "_accessibilityIsGroupedParent");
      v105 = v42 & 1;
      if ((objc_msgSend(v117, "isAccessibilityElement") & 1) == 0 && (v105 & 1) == 0)
        break;
      v85 = 0;
      v17 = objc_msgSend(v117, "accessibilityTraits");
      v85 = (v17 & *MEMORY[0x24BEBB178]) == *MEMORY[0x24BEBB178];
      v84 = 0;
      v29 = 0;
      if (v134)
        v29 = objc_msgSend(v117, "_accessibilityServesAsFirstElement");
      v84 = v29 & 1;
      if (v85 || v118 && (v84 & 1) == 0 || v134 && (objc_msgSend(v117, "_accessibilityIsNotFirstElement") & 1) != 0)
        goto LABEL_90;
      objc_storeStrong(&v118, v117);
      v83 = (id)AXLogFirstElement();
      v82 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEBUG))
      {
        v27 = v83;
        v28 = v82;
        __os_log_helper_16_3_1_8_65((uint64_t)v140, (uint64_t)v118);
        _os_log_debug_impl(&dword_230C4A000, v27, v28, "Got first element: %{private}@", v140, 0xCu);
      }
      objc_storeStrong(&v83, 0);
      if ((v84 & 1) == 0)
      {
LABEL_90:
        v71 = 0;
        LOBYTE(v24) = 0;
        if (v134)
        {
          LOBYTE(v24) = 0;
          if ((v119 & 1) == 0)
          {
            v73 = MEMORY[0x24BDAC760];
            v74 = -1073741824;
            v75 = 0;
            v76 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_607;
            v77 = &__block_descriptor_40_e8_B16__0_8lu32l8;
            v78 = v121;
            v72 = (id)objc_msgSend(v117, "_accessibilityFindAncestor:startWithSelf:", &v73, 0);
            v71 = 1;
            LOBYTE(v24) = 0;
            if (v72)
              v24 = objc_msgSend(v117, "_accessibilityIsNotFirstElement") ^ 1;
          }
        }
        if ((v71 & 1) != 0)

        if ((v24 & 1) != 0)
        {
          objc_storeStrong(&v118, v117);
          oslog = (os_log_t)(id)AXLogFirstElement();
          v69 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            v22 = oslog;
            v23 = v69;
            __os_log_helper_16_3_1_8_65((uint64_t)v139, (uint64_t)v118);
            _os_log_debug_impl(&dword_230C4A000, v22, v23, "Got dimming view element: %{private}@", v139, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v119 = 1;
        }
LABEL_100:
        v61 = 0;
        LOBYTE(v21) = 0;
        if (v134)
        {
          LOBYTE(v21) = 0;
          if ((v119 & 1) == 0)
          {
            v63 = MEMORY[0x24BDAC760];
            v64 = -1073741824;
            v65 = 0;
            v66 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_608;
            v67 = &__block_descriptor_40_e8_B16__0_8lu32l8;
            v68 = v121;
            v62 = (id)objc_msgSend(v117, "_accessibilityFindAncestor:startWithSelf:", &v63, 0);
            v61 = 1;
            LOBYTE(v21) = 0;
            if (v62)
              v21 = objc_msgSend(v117, "_accessibilityIsNotFirstElement") ^ 1;
          }
        }
        if ((v61 & 1) != 0)

        if ((v21 & 1) != 0)
        {
          v119 = 1;
          objc_storeStrong(&v118, v117);
          v60 = (os_log_t)(id)AXLogFirstElement();
          v59 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            v20 = v60;
            __os_log_helper_16_3_1_8_65((uint64_t)v138, (uint64_t)v118);
            _os_log_debug_impl(&dword_230C4A000, v20, v59, "Got dimming view element: %{private}@", v138, 0xCu);
          }
          objc_storeStrong((id *)&v60, 0);
        }
        v106 = 0;
        goto LABEL_111;
      }
      v81 = (id)AXLogFirstElement();
      v80 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_DEBUG))
      {
        v25 = v81;
        v26 = v80;
        __os_log_helper_16_0_0(v79);
        _os_log_debug_impl(&dword_230C4A000, v25, v26, "Ending now because element serves as first element", v79, 2u);
      }
      objc_storeStrong(&v81, 0);
      v106 = 4;
LABEL_111:
      objc_storeStrong(&v115, 0);
      if (!v106)
        v106 = 0;
      objc_storeStrong(&v117, 0);
      if (v106)
        goto LABEL_117;
      ++v47;
      if (v45 + 1 >= v48)
      {
        v47 = 0;
        v48 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", v116, v147, 16);
        if (!v48)
          goto LABEL_116;
      }
    }
    v104 = -[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](v136, v117, v134, v132, v131);
    v103 = (id)AXLogFirstElement();
    v102 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v103, OS_LOG_TYPE_DEBUG))
    {
      v40 = v103;
      v41 = v102;
      __os_log_helper_16_3_1_8_65((uint64_t)v145, (uint64_t)v104);
      _os_log_debug_impl(&dword_230C4A000, v40, v41, "Container accessible element: %{private}@", v145, 0xCu);
    }
    objc_storeStrong(&v103, 0);
    if (v104)
    {
      v39 = CFGetTypeID(v104);
      if (v39 == AXUIElementGetTypeID()
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_msgSend(v104, "_accessibilityIsNotFirstElement") & 1) == 0)
      {
        if (!v118)
        {
          objc_storeStrong(&v118, v104);
          v101 = (id)AXLogFirstElement();
          v100 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_DEBUG))
          {
            v37 = v101;
            v38 = v100;
            __os_log_helper_16_3_1_8_65((uint64_t)v144, (uint64_t)v118);
            _os_log_debug_impl(&dword_230C4A000, v37, v38, "Got remote element: %{private}@", v144, 0xCu);
          }
          objc_storeStrong(&v101, 0);
          v106 = 4;
          goto LABEL_75;
        }
      }
      else if ((!v118
              || v134
              && ((objc_msgSend(v104, "_accessibilityServesAsFirstElement") & 1) != 0
               || (objc_msgSend(v117, "_accessibilityServesAsFirstElement") & 1) != 0))
             && (!v134 || (objc_msgSend(v104, "_accessibilityIsNotFirstElement") & 1) == 0))
      {
        if ((objc_msgSend(v104, "isAccessibilityElement") & 1) == 0)
        {
          v11 = (id)objc_msgSend(v104, "_accessibilityUnignoredDescendant");
          v12 = v104;
          v104 = v11;

        }
        objc_storeStrong(&v118, v104);
        v99 = (id)AXLogFirstElement();
        v98 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v99, OS_LOG_TYPE_DEBUG))
        {
          v35 = v99;
          v36 = v98;
          __os_log_helper_16_3_1_8_65((uint64_t)v143, (uint64_t)v118);
          _os_log_debug_impl(&dword_230C4A000, v35, v36, "Got element that serves as first element: %{private}@", v143, 0xCu);
        }
        objc_storeStrong(&v99, 0);
      }
    }
    if (v134 && (objc_msgSend(v117, "_accessibilityServesAsFirstElement") & 1) != 0
      || v132 && (objc_msgSend(v117, "_accessibilityIsFirstElementForFocus") & 1) != 0)
    {
      if ((objc_msgSend(v117, "_accessibilityHasOrderedChildren") & 1) != 0
        || (objc_msgSend(v117, "isAccessibilityElement") & 1) == 0)
      {
        v13 = (id)objc_msgSend(v117, "_accessibilityUnignoredDescendant");
        v14 = v117;
        v117 = v13;

      }
      if (v117)
      {
        objc_storeStrong(&v118, v117);
        v97 = (id)AXLogFirstElement();
        v96 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_DEBUG))
        {
          v33 = v97;
          v34 = v96;
          __os_log_helper_16_3_1_8_65((uint64_t)v142, (uint64_t)v118);
          _os_log_debug_impl(&dword_230C4A000, v33, v34, "Got element that serves as first element or is first element for focus: %{private}@", v142, 0xCu);
        }
        objc_storeStrong(&v97, 0);
        v106 = 4;
LABEL_75:
        objc_storeStrong(&v104, 0);
        if (v106)
          goto LABEL_111;
        goto LABEL_100;
      }
    }
    else
    {
      v88 = 0;
      v32 = 0;
      if (v134)
      {
        v32 = 0;
        if ((v119 & 1) == 0)
        {
          v90 = MEMORY[0x24BDAC760];
          v91 = -1073741824;
          v92 = 0;
          v93 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_606;
          v94 = &__block_descriptor_40_e8_B16__0_8lu32l8;
          v95 = v121;
          v89 = (id)objc_msgSend(v117, "_accessibilityFindAncestor:startWithSelf:", &v90, 0);
          v88 = 1;
          v32 = v89 != 0;
        }
      }
      if ((v88 & 1) != 0)

      if (v32)
      {
        objc_storeStrong(&v118, v117);
        v87 = (id)AXLogFirstElement();
        v86 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v87, OS_LOG_TYPE_DEBUG))
        {
          v30 = v87;
          v31 = v86;
          __os_log_helper_16_3_1_8_65((uint64_t)v141, (uint64_t)v118);
          _os_log_debug_impl(&dword_230C4A000, v30, v31, "Got dimming view element: %{private}@", v141, 0xCu);
        }
        objc_storeStrong(&v87, 0);
        if ((objc_msgSend(v118, "isAccessibilityElement") & 1) == 0)
        {
          v15 = (id)objc_msgSend(v118, "_accessibilityUnignoredDescendant");
          v16 = v118;
          v118 = v15;

        }
        v119 = 1;
      }
    }
    v106 = 0;
    goto LABEL_75;
  }
LABEL_116:
  v106 = 0;
LABEL_117:

  v58 = (os_log_t)(id)AXLogFirstElement();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_3_1_8_65((uint64_t)v137, (uint64_t)v118);
    _os_log_debug_impl(&dword_230C4A000, v58, OS_LOG_TYPE_DEBUG, "Returning %{private}@", v137, 0xCu);
  }
  objc_storeStrong((id *)&v58, 0);
  v19 = v118;
  v106 = 1;
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v127, 0);
  objc_storeStrong(&location, 0);
  return v19;
}

BOOL __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke(void *a1, void *a2)
{
  BOOL v3;
  char v4;
  id v5;
  id location[2];
  BOOL v7;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("standardChromeView")), v4 = 1, v3 = 1, !v5))
  {
    v3 = objc_msgSend(location[0], "accessibilityContainerType") == 10;
  }
  v7 = v3;
  if ((v4 & 1) != 0)

  objc_storeStrong(location, 0);
  return v7;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_606(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_607(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_608(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilityLastElement
{
  return -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](self, "_accessibilityElementFirst:last:forFocus:parameters:", 0, 1, 0, 0, a2, self);
}

- (id)_accessibilityFirstElementForFocusWithOptions:(id)a3
{
  id v4;
  id location[2];
  UIApplicationAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:](v6, "_accessibilityElementFirst:last:forFocus:allowScrolling:traversalOptions:", 1, 0, 1, 0, location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityFirstElement
{
  return -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](self, "_accessibilityElementFirst:last:forFocus:parameters:", 1, 0, 0, 0, a2, self);
}

- (id)_accessibilityTitleBarElement
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(void *, void *);
  void *v14;
  Class v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(void *, void *);
  void *v21;
  Class v22;
  id v23;
  Class v24;
  id v25;
  int v26;
  _QWORD __b[8];
  id v28;
  id v29;
  id v30;
  id location[2];
  UIApplicationAccessibility *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v30 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  objc_msgSend(v30, "setSorted:", 0);
  v29 = (id)-[UIApplicationAccessibility _accessibilityViewChildrenWithOptions:](v32, "_accessibilityViewChildrenWithOptions:", v30);
  memset(__b, 0, sizeof(__b));
  obj = v29;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v28 = *(id *)(__b[1] + 8 * v6);
      if ((objc_msgSend(v28, "_accessibilityIsTitleElement") & 1) != 0
        || (objc_msgSend(v28, "_accessibilityBoolValueForKey:", kUIAccessibilityStorageKeyIsTitleElement) & 1) != 0)
      {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (!v7)
          goto LABEL_10;
      }
    }
    objc_storeStrong(location, v28);
    v26 = 2;
  }
  else
  {
LABEL_10:
    v26 = 0;
  }

  if (location[0])
  {
    v25 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:allowScrolling:parameters:](v32, "_accessibilityElementFirst:last:forFocus:allowScrolling:parameters:", 1, 0, 1, 0, 0);
    v24 = NSClassFromString(CFSTR("_UIPopoverView"));
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke;
    v21 = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v22 = v24;
    v23 = (id)objc_msgSend(v25, "_accessibilityFindAncestor:startWithSelf:", &v17, 0);
    if (v23)
    {
      v10 = MEMORY[0x24BDAC760];
      v11 = -1073741824;
      v12 = 0;
      v13 = __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke_2;
      v14 = &__block_descriptor_40_e8_B16__0_8lu32l8;
      v15 = v24;
      v16 = (id)objc_msgSend(location[0], "_accessibilityFindAncestor:startWithSelf:", &v10, 0);
      if (v23 != v16)
        objc_storeStrong(location, 0);
      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v25, 0);
  }
  v3 = location[0];
  v26 = 1;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v3;
}

uint64_t __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilitySummaryElement
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  _QWORD __b[8];
  id v11;
  id location;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  if (a1)
  {
    v15 = (id)objc_msgSend(v16, "_accessibilityMainWindow");
    v14 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    objc_msgSend(v14, "setSorted:", 0);
    v9 = (id)objc_msgSend(v16, "_accessibilityViewChildrenWithOptions:", v14);
    v13 = (id)objc_msgSend(v9, "mutableCopyWithZone:", 0);

    if (v15)
      objc_msgSend(v13, "insertObject:atIndex:", v15, 0);
    location = 0;
    memset(__b, 0, sizeof(__b));
    obj = v13;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
    if (v8)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v11 = *(id *)(__b[1] + 8 * v5);
        v1 = objc_msgSend(v11, "accessibilityTraits");
        if ((v1 & *MEMORY[0x24BDF7418]) == *MEMORY[0x24BDF7418])
          objc_storeStrong(&location, v11);
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
          if (!v6)
            break;
        }
      }
    }

    v17 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)_accessibilityWindowSections
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL (*v16)(id *, void *);
  void *v17;
  id v18;
  _QWORD __b[8];
  id v20;
  id v21[2];
  UIApplicationAccessibility *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = -[UIApplicationAccessibility _accessibilityWindows](v22, "_accessibilityWindows");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v20 = *(id *)(__b[1] + 8 * v9);
      v4 = v21[0];
      v6 = (id)objc_msgSend(v20, "_accessibilityWindowSections");
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __58__UIApplicationAccessibility__accessibilityWindowSections__block_invoke;
      v17 = &unk_24FF3E468;
      v18 = v20;
      v5 = (id)objc_msgSend(v6, "axFilterObjectsUsingBlock:", &v13);
      objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v18, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v10)
          break;
      }
    }
  }

  v3 = v21[0];
  objc_storeStrong(v21, 0);
  return v3;
}

BOOL __58__UIApplicationAccessibility__accessibilityWindowSections__block_invoke(id *a1, void *a2)
{
  id v2;
  BOOL v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(location[0], "_accessibilityWindow");
  v5 = v2 == a1[4];

  objc_storeStrong(location, 0);
  return v5;
}

- (id)_axAllSubviews
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10;
  id v11[3];

  v11[2] = self;
  v11[1] = (id)a2;
  v11[0] = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (id)AXUIApplicationWindows();
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __44__UIApplicationAccessibility__axAllSubviews__block_invoke;
  v9 = &unk_24FF3E490;
  v10 = v11[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __44__UIApplicationAccessibility__axAllSubviews__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (void *)a1[4];
  v4 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_axSubviews"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

  objc_storeStrong(location, 0);
}

- (id)_accessibilityTextReplacementCandidates
{
  id v1;
  id v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  uint64_t v19;
  id location;
  _QWORD v21[8];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD __b[8];
  id v28;
  id v29;
  id v30[2];
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v30[1] = a1;
  if (a1)
  {
    v30[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v29 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v30[0], "safeArrayForKey:", CFSTR("replacementsFromSelectedText"));
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
    if (v19)
    {
      v15 = *(_QWORD *)__b[2];
      v16 = 0;
      v17 = v19;
      while (1)
      {
        v14 = v16;
        if (*(_QWORD *)__b[2] != v15)
          objc_enumerationMutation(obj);
        v28 = *(id *)(__b[1] + 8 * v16);
        v12 = v29;
        v13 = (id)objc_msgSend(v28, "safeStringForKey:", CFSTR("replacementText"));
        objc_msgSend(v12, "axSafelyAddObject:");

        ++v16;
        if (v14 + 1 >= v17)
        {
          v16 = 0;
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
          if (!v17)
            break;
        }
      }
    }

    if (!objc_msgSend(v29, "count"))
    {
      v26 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityFirstResponderForKeyWindow");
      if (!v26)
      {
        v26 = (id)_UIAccessibilityFocusedElementForAssistiveTech();

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = (id)objc_msgSend(v26, "safeStringForKey:", CFSTR("selectedText"));
        if (objc_msgSend(v25, "length"))
        {
          v10 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v1 = (id)objc_msgSend(v25, "stringByTrimmingCharactersInSet:");
          v2 = v25;
          v25 = v1;

          v11 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
          v24 = (id)objc_msgSend(v11, "generateAutocorrectionReplacements:", v25);

          if (v24)
          {
            v23 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v24);
            memset(v21, 0, sizeof(v21));
            v8 = v23;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v21, v32, 16);
            if (v9)
            {
              v5 = *(_QWORD *)v21[2];
              v6 = 0;
              v7 = v9;
              while (1)
              {
                v4 = v6;
                if (*(_QWORD *)v21[2] != v5)
                  objc_enumerationMutation(v8);
                v22 = *(id *)(v21[1] + 8 * v6);
                location = (id)objc_msgSend(v22, "label");
                if ((objc_msgSend(location, "isEqualToString:", v25) & 1) == 0)
                  objc_msgSend(v29, "axSafelyAddObject:", location);
                objc_storeStrong(&location, 0);
                ++v6;
                if (v4 + 1 >= v7)
                {
                  v6 = 0;
                  v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v21, v32, 16);
                  if (!v7)
                    break;
                }
              }
            }

            objc_storeStrong(&v23, 0);
          }
          objc_storeStrong(&v24, 0);
        }
        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
    v31 = v29;
    objc_storeStrong(&v29, 0);
    objc_storeStrong(v30, 0);
  }
  else
  {
    v31 = 0;
  }
  return v31;
}

- (id)_accessibilityTypingCandidates
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location;
  id v16;
  id v17[2];
  id v18;

  v17[1] = a1;
  if (a1)
  {
    v17[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    location = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("m_autocorrectPrompt"));
    if (location)
    {
      if ((UIKeyboardPredictionEnabledForCurrentInputMode() & 1) != 0
        && (NSClassFromString(CFSTR("UIAutocorrectInlinePrompt")), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_storeStrong(&location, 0);
      }
      else
      {
        objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BEBB170]);
        v7 = accessibilityLocalizedString(CFSTR("typing.correction.view.hint"));
        objc_msgSend(location, "setAccessibilityHint:");

        objc_msgSend(v17[0], "addObject:", location);
      }
    }
    if (!objc_msgSend(v17[0], "count"))
    {
      v14 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("candidateController"));
      v13 = (id)objc_msgSend(v14, "safeArrayForKey:", CFSTR("activeViews"));
      v5 = (id)objc_msgSend(v13, "firstObject");
      v12 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("primaryGrid"));

      v10 = 0;
      objc_opt_class();
      v6 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("collectionView"));
      v9 = (id)__UIAccessibilityCastAsClass();

      v8 = v9;
      objc_storeStrong(&v9, 0);
      v11 = v8;
      v2 = v17[0];
      v4 = (id)objc_msgSend(v8, "visibleCells");
      v3 = (id)objc_msgSend(v4, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
      objc_msgSend(v2, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    v18 = v17[0];
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)_firstStatusBarElement
{
  return 0;
}

- (id)_lastStatusBarElement
{
  return 0;
}

- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4
{
  return 0;
}

- (BOOL)_accessibilitySoftwareKeyboardCoversElement:(id)a3
{
  double v3;
  double v4;
  double v6;
  BOOL v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id location[2];
  UIApplicationAccessibility *v19;
  BOOL v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v10 = 0;
  v8 = 0;
  v7 = 0;
  if (-[UIApplicationAccessibility _accessibilitySoftwareKeyboardActive](v19, "_accessibilitySoftwareKeyboardActive"))
  {
    v7 = 0;
    if (!-[UIApplicationAccessibility _accessibilityElementBelongsToKeyboardWindow:](v19, "_accessibilityElementBelongsToKeyboardWindow:", location[0]))
    {
      v17 = (id)objc_msgSend(location[0], "_accessibilityParentView");
      v16 = 1;
      v15 = (id)objc_msgSend(v17, "window");
      v14 = 1;
      v7 = 0;
      if (v15)
      {
        v13 = (id)objc_msgSend(location[0], "_accessibilityParentView");
        v12 = 1;
        v11 = (id)objc_msgSend(v13, "window");
        v10 = 1;
        objc_msgSend(v11, "windowLevel");
        v6 = v3;
        v9 = (id)AXUIKeyboardWindow();
        v8 = 1;
        objc_msgSend(v9, "windowLevel");
        v7 = v6 <= v4;
      }
    }
  }
  v20 = v7;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if ((v16 & 1) != 0)

  objc_storeStrong(location, 0);
  return v20;
}

- (CGRect)_accessibilitySoftwareKeyboardAccessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10[3];
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  objc_msgSend(v10[0], "accessibilityFrame");
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  objc_storeStrong(v10, 0);
  v6 = v11;
  v7 = v12;
  v8 = v13;
  v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_accessibilityElementBelongsToKeyboardWindow:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)AXUIAllKeyboardWindows();
  v4 = (id)objc_msgSend(location[0], "_accessibilityParentView");
  v6 = (id)objc_msgSend(v4, "window");

  v5 = objc_msgSend(v7, "containsObject:", v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilitySoftwareKeyboardActive
{
  if ((-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeBoolForKey:", CFSTR("isRunning")) & 1) != 0)return 1;
  else
    return UIAXKeyboardIsOnScreen() & 1;
}

- (BOOL)_accessibilityHardwareKeyboardActive
{
  id v3;
  char v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v4 = objc_msgSend(v3, "isInHardwareKeyboardMode");

  return v4 & 1;
}

- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  objc_super v3;
  __IOHIDEvent *v4;
  SEL v5;
  UIApplicationAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationAccessibility;
  -[UIApplicationAccessibility handleKeyHIDEvent:](&v3, sel_handleKeyHIDEvent_, a3);
  _UIAXSetLastKeyboardUsed();
}

- (void)_accessibilityRegisterForDictationLifecycleNotifications
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v3;
  id location[2];
  UIApplicationAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = CFSTR("_axRegisteredForRemoteElement");
  if ((-[UIApplicationAccessibility _accessibilityBoolValueForKey:](v5, "_accessibilityBoolValueForKey:", location[0]) & 1) == 0)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_accessibilityReceiveDictationLifecycleNotfication, (CFStringRef)*MEMORY[0x24BDFE8D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v3 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v3, v5, (CFNotificationCallback)_accessibilityReceiveDictationLifecycleNotfication, (CFStringRef)*MEMORY[0x24BDFE8D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[UIApplicationAccessibility _accessibilitySetBoolValue:forKey:](v5, "_accessibilitySetBoolValue:forKey:", 1, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (double)_accessibilityLastDictationMagicTapTime
{
  double v1;
  id v3;
  double v4;

  if (!a1)
    return 0.0;
  v3 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", kAXLastDictationMagicTapTime);
  objc_msgSend(v3, "doubleValue");
  v4 = v1;

  return v4;
}

- (uint64_t)_accessibilityDictationIsListening
{
  id v2;
  char v3;
  id location;
  id v5;
  char v6;

  v5 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v5, "_accessibilityValueForKey:", CFSTR("_accessibilityIsDictationListeningOverride"));
    if (location)
    {
      v6 = objc_msgSend(location, "BOOLValue") & 1;
    }
    else if ((objc_msgSend((id)_lastActiveDictationController, "safeBoolForKey:", CFSTR("_accessibilityIsDictating")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v2 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeValueForKey:", CFSTR("isRunning"));
      v3 = objc_msgSend(v2, "BOOLValue");

      if ((v3 & 1) != 0)
        v6 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeBoolForKey:", CFSTR("isListening")) & 1;
      else
        v6 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (uint64_t)_accessibilityDictationIsAvailable
{
  int v2;
  id location;
  id v4;
  char v5;

  v4 = a1;
  if (a1)
  {
    if ((objc_msgSend(v4, "_accessibilitySoftwareKeyboardActive") & 1) == 0
      || ((location = NSClassFromString(CFSTR("UIDictationController")),
           (objc_msgSend(location, "safeBoolForKey:", CFSTR("dictationIsFunctional")) & 1) == 0)
       || (objc_msgSend(location, "safeBoolForKey:", CFSTR("fetchCurrentInputModeSupportsDictation")) & 1) == 0
        ? (v2 = 0)
        : (v5 = 1, v2 = 1),
          objc_storeStrong(&location, 0),
          !v2))
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (id)_accessibilityCurrentSoftwareLanguage
{
  id v2;
  id v3[2];
  id v4;

  v3[1] = a1;
  if (a1)
  {
    v3[0] = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v2 = (id)objc_msgSend(v3[0], "currentInputMode");
    v4 = (id)objc_msgSend(v2, "primaryLanguage");
    objc_storeStrong(&v2, 0);
    objc_storeStrong(v3, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CFString)_accessibilityCurrentSoftwareKeyboardLayout
{
  id v1;
  __CFString *v2;
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  BOOL v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id location;
  _QWORD __b[8];
  id v20;
  int v21;
  id v22;
  id v23;
  id v24[2];
  __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24[1] = a1;
  if (a1)
  {
    v24[0] = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v23 = (id)objc_msgSend(v24[0], "activeInputModes");
    v22 = (id)objc_msgSend(v24[0], "currentInputMode");
    v1 = (id)objc_msgSend(v22, "softwareLayout");
    v13 = v1 == 0;

    if (v13)
    {
      memset(__b, 0, sizeof(__b));
      obj = v23;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
      if (v12)
      {
        v8 = *(_QWORD *)__b[2];
        v9 = 0;
        v10 = v12;
        while (1)
        {
          v7 = v9;
          if (*(_QWORD *)__b[2] != v8)
            objc_enumerationMutation(obj);
          v20 = *(id *)(__b[1] + 8 * v9);
          location = (id)objc_msgSend(v20, "softwareLayout");
          v4 = (id)objc_msgSend(v20, "primaryLanguage");
          v5 = (id)objc_msgSend(v22, "primaryLanguage");
          v6 = 0;
          if ((objc_msgSend(v4, "isEqualToString:") & 1) != 0)
            v6 = location != 0;

          if (v6)
          {
            v25 = (__CFString *)location;
            v21 = 1;
          }
          else
          {
            v21 = 0;
          }
          objc_storeStrong(&location, 0);
          if (v21)
            break;
          ++v9;
          if (v7 + 1 >= v10)
          {
            v9 = 0;
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
            if (!v10)
              goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        v21 = 0;
      }

      if (!v21)
      {
        v16 = 0;
        v14 = 0;
        if (objc_msgSend(v23, "count"))
        {
          v17 = (id)objc_msgSend(v23, "objectAtIndex:", 0);
          v16 = 1;
          v15 = (id)objc_msgSend(v17, "softwareLayout");
          v14 = 1;
          v2 = (__CFString *)v15;
        }
        else
        {
          v2 = CFSTR("US");
        }
        v25 = v2;
        if ((v14 & 1) != 0)

        if ((v16 & 1) != 0)
        v21 = 1;
      }
    }
    else
    {
      v25 = (__CFString *)(id)objc_msgSend(v22, "softwareLayout");
      v21 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(v24, 0);
  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (__CFString)_accessibilityCurrentHardwareKeyboardLayout
{
  __CFString *v1;
  id v3;
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  char v12;
  id v13;
  char v14;
  id v15;
  int v16;
  id location;
  _QWORD __b[8];
  id v19;
  id v20;
  id v21;
  id v22[2];
  __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22[1] = a1;
  if (a1)
  {
    v22[0] = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v21 = (id)objc_msgSend(v22[0], "activeInputModes");
    v20 = (id)objc_msgSend(v22[0], "currentInputMode");
    memset(__b, 0, sizeof(__b));
    obj = v21;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
    if (v11)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v11;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(obj);
        v19 = *(id *)(__b[1] + 8 * v8);
        location = (id)objc_msgSend(v19, "hardwareLayout");
        v3 = (id)objc_msgSend(v19, "primaryLanguage");
        v4 = (id)objc_msgSend(v20, "primaryLanguage");
        v5 = 0;
        if ((objc_msgSend(v3, "isEqualToString:") & 1) != 0)
          v5 = location != 0;

        if (v5)
        {
          v23 = (__CFString *)location;
          v16 = 1;
        }
        else
        {
          v16 = 0;
        }
        objc_storeStrong(&location, 0);
        if (v16)
          break;
        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
          if (!v9)
            goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v16 = 0;
    }

    if (!v16)
    {
      v14 = 0;
      v12 = 0;
      if (objc_msgSend(v21, "count"))
      {
        v15 = (id)objc_msgSend(v21, "objectAtIndex:", 0);
        v14 = 1;
        v13 = (id)objc_msgSend(v15, "hardwareLayout");
        v12 = 1;
        v1 = (__CFString *)v13;
      }
      else
      {
        v1 = CFSTR("US");
      }
      v23 = v1;
      if ((v12 & 1) != 0)

      if ((v14 & 1) != 0)
    }
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(v22, 0);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (id)_axSubviews
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  _QWORD __b[8];
  id v13;
  id v14[3];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v13 = *(id *)(__b[1] + 8 * v8);
      v4 = v14[0];
      v5 = (id)objc_msgSend(v13, "_axSubviews");
      objc_msgSend(v4, "appendFormat:", CFSTR("%@\n\n"), v5);

      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v9)
          break;
      }
    }
  }

  v3 = v14[0];
  objc_storeStrong(v14, 0);
  return v3;
}

- (BOOL)_accessibilityDispatchKeyboardAction:(id)a3
{
  id v3;
  id v5;
  uint64_t (**v6)(id, id);
  BOOL v7;
  id v8;
  id v9;
  id v10[2];
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23[2];
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;
  id v32;
  int v33;
  id location[2];
  UIApplicationAccessibility *v35;
  char v36;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "accessibilityKeyboardKeyDispatchOverride");
  v7 = v3 == 0;

  if (v7)
  {
    v5 = (id)objc_msgSend(location[0], "keyInfo");
    v32 = (id)objc_msgSend(v5, "unmodifiedInput");

    v24 = 0;
    v25 = &v24;
    v26 = 838860800;
    v27 = 48;
    v28 = __Block_byref_object_copy__5;
    v29 = __Block_byref_object_dispose__5;
    v30 = 0;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke;
    v22 = &unk_24FF3DE88;
    v23[1] = &v24;
    v23[0] = v32;
    AXPerformSafeBlock();
    v17 = (id)v25[5];
    objc_storeStrong(v23, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    v31 = v17;
    v10[1] = (id)MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_2;
    v14 = &unk_24FF3E050;
    v15 = location[0];
    v16 = v31;
    AXPerformSafeBlock();
    v8 = location[0];
    v9 = v31;
    v10[0] = v35;
    AXPerformSafeBlock();
    v36 = 1;
    v33 = 1;
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    v6 = (uint64_t (**)(id, id))(id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "accessibilityKeyboardKeyDispatchOverride");
    v36 = v6[2](v6, location[0]) & 1;

    v33 = 1;
  }
  objc_storeStrong(location, 0);
  return v36 & 1;
}

void __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)-[objc_class _eventWithInput:inputFlags:](NSClassFromString(CFSTR("UIPhysicalKeyboardEvent")), "_eventWithInput:inputFlags:", *(_QWORD *)(a1 + 32), 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

uint64_t __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_2(uint64_t a1)
{
  CFTypeRef cf;

  cf = (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "newHIDEventRef");
  objc_msgSend(*(id *)(a1 + 40), "_setHIDEvent:", cf);
  if (cf)
    CFRelease(cf);
  return objc_msgSend(*(id *)(a1 + 40), "_setTimestamp:", (double)(unint64_t)GSCurrentEventTimestamp());
}

void __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_3(uint64_t a1)
{
  id v1;
  char v3;

  v3 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 4500
    || objc_msgSend(*(id *)(a1 + 32), "type") == 4501)
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v3 = objc_msgSend(v1, "handleKeyCommand:repeatOkay:beforePublicKeyCommands:", *(_QWORD *)(a1 + 40), 0, 1) & 1;

  }
  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "handleKeyUIEvent:", *(_QWORD *)(a1 + 40));
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  double v4;
  double v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  int v13;
  double v14;
  double v15;
  id location;
  int64_t v17;
  SEL v18;
  UIApplicationAccessibility *v19;
  id v20;

  v19 = self;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v17 == 91506)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v9 = (void *)MEMORY[0x24BDF6FF8];
    objc_msgSend(location, "pointValue");
    v14 = v4;
    v15 = v5;
    v11 = (id)objc_msgSend(v9, "_findWithDisplayPoint:", v4, v5);
    v20 = (id)objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "_accessibilityContextId"));

    v13 = 1;
  }
  else if (v17 == 91509)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(location, "unsignedIntValue");
    v8 = (id)UIAccessibilityWindowForContextId();
    v20 = (id)objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "_accessibilityDisplayId"));

    v13 = 1;
  }
  else if (v17 == 95253)
  {
    v20 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](v19, "_accessibilityElementFirst:last:forFocus:parameters:", 1, 0, 0, location);
    v13 = 1;
  }
  else if (v17 == 95254)
  {
    v20 = -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](v19, "_accessibilityElementFirst:last:forFocus:parameters:", 0, 1, 0, location);
    v13 = 1;
  }
  else if (v17 == 95256)
  {
    v20 = -[UIApplicationAccessibility _accessibilityWindowSceneForSceneID:](v19, "_accessibilityWindowSceneForSceneID:", location);
    v13 = 1;
  }
  else
  {
    if (v17 == 95257)
    {
      v20 = -[UIApplicationAccessibility _accessibilityFocusableScenesDictionary](v19, "_accessibilityFocusableScenesDictionary");
    }
    else
    {
      v12.receiver = v19;
      v12.super_class = (Class)UIApplicationAccessibility;
      v20 = -[UIApplicationAccessibility _iosAccessibilityAttributeValue:forParameter:](&v12, sel__iosAccessibilityAttributeValue_forParameter_, v17, location);
    }
    v13 = 1;
  }
  objc_storeStrong(&location, 0);
  return v20;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  int64_t v8;
  SEL v9;
  UIApplicationAccessibility *v10;
  __CFString *v11;

  v10 = self;
  v9 = a2;
  v8 = a3;
  switch(a3)
  {
    case 1514:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilityApplicationIsModal](v10, "_accessibilityApplicationIsModal"));
      break;
    case 3001:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilitySummaryElement](v10);
      break;
    case 3002:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityResponderElement](v10, "_accessibilityResponderElement");
      break;
    case 3003:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityBundleIdentifier](v10, "_accessibilityBundleIdentifier");
      break;
    case 3004:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityTypingCandidates](v10);
      break;
    case 3005:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilitySoftwareKeyboardActive](v10, "_accessibilitySoftwareKeyboardActive"));
      break;
    case 3006:
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = -[UIApplicationAccessibility _accessibilityTitleBarElement](v10, "_accessibilityTitleBarElement");
      v11 = (__CFString *)(id)objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);

      break;
    case 3007:
      v11 = (__CFString *)(id)_UIAXLastKeyboardUsed();
      break;
    case 3010:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilityDictationIsListening](v10) & 1);
      break;
    case 3011:
      v11 = (__CFString *)-[UIApplicationAccessibility _firstStatusBarElement](v10, "_firstStatusBarElement");
      break;
    case 3012:
      v11 = (__CFString *)-[UIApplicationAccessibility _lastStatusBarElement](v10, "_lastStatusBarElement");
      break;
    case 3013:
      v11 = -[UIApplicationAccessibility _accessibilityCurrentHardwareKeyboardLayout](v10);
      break;
    case 3016:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityLastElement](v10, "_accessibilityLastElement");
      break;
    case 3018:
      v11 = -[UIApplicationAccessibility _accessibilityCurrentSoftwareKeyboardLayout](v10);
      break;
    case 3019:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityCurrentSoftwareLanguage](v10);
      break;
    case 3023:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityResponderElementForFocus](v10, "_accessibilityResponderElementForFocus");
      break;
    case 3024:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityNativeFocusElement](v10, "_accessibilityNativeFocusElement");
      break;
    case 3027:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityNativeFocusPreferredElement](v10, "_accessibilityNativeFocusPreferredElement");
      break;
    case 3034:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilityDictationIsAvailable](v10) & 1);
      break;
    case 3035:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UIApplicationAccessibility _accessibilityApplicationInterfaceOrientation](v10));
      break;
    case 3036:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilityIsTappingMediaLegibilityEvents]((uint64_t)v10) & 1);
      break;
    case 3037:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityRealtimeElements](v10);
      break;
    case 3040:
      v11 = (__CFString *)(id)-[UIApplicationAccessibility _accessibilityApplicationWindowContextIDs](v10, "_accessibilityApplicationWindowContextIDs");
      break;
    case 3043:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityTextReplacementCandidates](v10);
      break;
    case 3045:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UIApplicationAccessibility _accessibilityIsInitialBundleLoadFinished]((uint64_t)v10) & 1);
      break;
    case 3046:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityFirstElementsForSpeakThis](v10, "_accessibilityFirstElementsForSpeakThis");
      break;
    case 3047:
      v11 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _UIApplicationIsExtension() & 1);
      break;
    case 3050:
      v11 = (__CFString *)(id)-[UIApplicationAccessibility _accessibilityFirstElementForReadFromTop](v10, "_accessibilityFirstElementForReadFromTop");
      break;
    case 3051:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityMLProxiedElements](v10);
      break;
    case 3052:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityApplicationWindowFramesAndIds](v10);
      break;
    case 3054:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityStatusBarElements:sorted:](v10, "_accessibilityStatusBarElements:sorted:", 1, 1);
      break;
    case 3060:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityGetSpeakThisRootElementAccessibilityIdentifier](v10, "_accessibilityGetSpeakThisRootElementAccessibilityIdentifier");
      break;
    case 3061:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession](v10, "_accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession");
      break;
    case 3062:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityFocusContainer](v10, "_accessibilityFocusContainer");
      break;
    case 3069:
      v4 = -[UIApplicationAccessibility _accessibilityFocusedScene](v10, "_accessibilityFocusedScene");
      v11 = (__CFString *)(id)objc_msgSend(v4, "_sceneIdentifier");

      break;
    case 5044:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityPreviewWindow](v10);
      break;
    case 13001:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilitySemanticContext](v10, "_accessibilitySemanticContext");
      break;
    case 14000:
      v11 = (__CFString *)-[UIApplicationAccessibility _accessibilityIsolatedWindows](v10, "_accessibilityIsolatedWindows");
      break;
    default:
      v7.receiver = v10;
      v7.super_class = (Class)UIApplicationAccessibility;
      v11 = (__CFString *)-[UIApplicationAccessibility _iosAccessibilityAttributeValue:](&v7, sel__iosAccessibilityAttributeValue_, v8);
      break;
  }
  return v11;
}

- (uint64_t)_accessibilityApplicationInterfaceOrientation
{
  id v2;
  id v3[2];
  unsigned int v4;

  v3[1] = a1;
  if (a1)
  {
    v3[0] = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v2 = (id)objc_msgSend(v3[0], "safeValueForKey:", CFSTR("_interfaceOrientation"));
    v4 = objc_msgSend(v2, "integerValue");

    objc_storeStrong(v3, 0);
  }
  else
  {
    return 0;
  }
  return v4;
}

- (uint64_t)_accessibilityIsTappingMediaLegibilityEvents
{
  id v2;
  char v3;

  if (a1)
  {
    v2 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("AXAVFoundationMediaDescriptionManager")), "safeValueForKey:", CFSTR("sharedManagerIfExists"));
    v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isTappingMediaDescriptions")) & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (id)_accessibilityPreviewWindow
{
  id v2;
  id v3;
  id v4;
  id v5;

  v4 = a1;
  if (a1)
  {
    v2 = (id)objc_msgSend(v4, "_accessibilityMainWindow");
    v3 = (id)objc_msgSend(v2, "_accessibilityFindDescendant:", &__block_literal_global_712);

    v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_accessibilityApplicationWindowFramesAndIds
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  BOOL v16;
  AXValueRef cf;
  __int128 v18;
  __int128 v19;
  id location;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = a1;
  if (a1)
  {
    v26 = (id)objc_msgSend(v27, "_accessibilityApplicationWindowContextIDs");
    v25 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = (id)objc_msgSend(v27, "_accessibilityMainWindow");
    v23 = (id)AXUIKeyboardWindow();
    memset(__b, 0, sizeof(__b));
    obj = v26;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
    if (v15)
    {
      v11 = *(_QWORD *)__b[2];
      v12 = 0;
      v13 = v15;
      while (1)
      {
        v10 = v12;
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(obj);
        v22 = *(id *)(__b[1] + 8 * v12);
        location = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_windowWithContextId:", objc_msgSend(v22, "unsignedIntValue"));
        if (location)
        {
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(location, "accessibilityFrame");
          *(_QWORD *)&v18 = v1;
          *((_QWORD *)&v18 + 1) = v2;
          *(_QWORD *)&v19 = v3;
          *((_QWORD *)&v19 + 1) = v4;
          cf = AXValueCreate(kAXValueTypeCGRect, &v18);
          v16 = location == v23;
          v6 = v25;
          v29[0] = CFSTR("contextId");
          v30[0] = v22;
          v29[1] = CFSTR("frame");
          v30[1] = cf;
          v29[2] = CFSTR("isMainWindow");
          v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v24 == location);
          v30[2] = v9;
          v29[3] = CFSTR("isKeyboardWindow");
          v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
          v30[3] = v8;
          v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
          objc_msgSend(v6, "addObject:");

          if (cf)
            CFRelease(cf);
        }
        objc_storeStrong(&location, 0);
        ++v12;
        if (v10 + 1 >= v13)
        {
          v12 = 0;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
          if (!v13)
            break;
        }
      }
    }

    v28 = v25;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v28 = 0;
  }
  return v28;
}

- (id)_accessibilityRealtimeElements
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  _QWORD __b[8];
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  if (a1)
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v13, "_accessibilityWindows");
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    if (v8)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v11 = *(id *)(__b[1] + 8 * v5);
        v9 = (id)objc_msgSend(v11, "_accessibilityFindUnsortedDescendantsPassingTest:", &__block_literal_global_716);
        objc_msgSend(v12, "addObjectsFromArray:", v9);
        objc_storeStrong(&v9, 0);
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
          if (!v6)
            break;
        }
      }
    }

    v2 = (id)objc_msgSend(v12, "reverseObjectEnumerator");
    v14 = (id)objc_msgSend(v2, "allObjects");

    objc_storeStrong(&v12, 0);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (uint64_t)_accessibilityIsInitialBundleLoadFinished
{
  id v2;
  char v3;

  if (a1)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDFE488], "defaultLoader");
    v3 = objc_msgSend(v2, "isInitialLoadFinished") & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (id)_accessibilityMLProxiedElements
{
  id v1;
  id v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v8 = a1;
  if (a1)
  {
    v7 = 0;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v6 = (id)objc_msgSend(v8, "_accessibilityMainWindow");
    v5 = -[UIWindowAccessibility _accessibilityMLRemoteElement](v6);
    v1 = (id)objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 1, v5);
    v2 = v7;
    v7 = v1;

    v9 = v7;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4
{
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  char v7;
  id v8;
  char v9;
  NSObject *v10;
  os_log_type_t v11;
  UIApplicationAccessibility *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  UIApplicationAccessibility *v18;
  id v19;
  id v20;
  uint8_t v22[15];
  char v23;
  id v24;
  id v25;
  uint8_t v26[15];
  char v27;
  id v28;
  os_log_type_t v29;
  id v30;
  id v31;
  uint8_t v32[15];
  char v33;
  id v34;
  os_log_type_t v35;
  id v36;
  id v37[2];
  id location[2];
  UIApplicationAccessibility *v39;
  uint8_t v40[16];
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37[1] = (id)a4;
  switch(a4)
  {
    case 2603:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = location[0];
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetRetainedValue:forKey:", v25, CFSTR("AXShowOnscreenKeyboardWithBraille"));
        if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
        {
          v8 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
          v9 = objc_msgSend(v8, "isMinimized");

          if ((v9 & 1) != 0)
            AXPerformSafeBlock();
        }
        else
        {
          v6 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
          v7 = objc_msgSend(v6, "isMinimized");

          if ((v7 & 1) == 0)
            AXPerformSafeBlock();
        }
        objc_storeStrong(&v25, 0);
      }
      else
      {
        v24 = (id)AXLogBrailleHW();
        v23 = 2;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
        {
          v4 = v24;
          v5 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_debug_impl(&dword_230C4A000, v4, v5, "AXShowOnscreenKeyboardWithBraille set to nil", v22, 2u);
        }
        objc_storeStrong(&v24, 0);
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXShowOnscreenKeyboardWithBraille"));
        AXPerformSafeBlock();
      }
      break;
    case 3060:
      v20 = (id)objc_msgSend(location[0], "stringValue");

      if (v20)
      {
        v37[0] = (id)objc_msgSend(location[0], "stringValue");
        v36 = (id)AXLogSpeakScreen();
        v35 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v37[0]);
          _os_log_debug_impl(&dword_230C4A000, (os_log_t)v36, v35, "kAXSpeakThisRootElementAccessibilityIdentifierParameterizedAttribute %@", v41, 0xCu);
        }
        objc_storeStrong(&v36, 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisRootElementAccessibilityIdentifier:](v39, "_accessibilitySetSpeakThisRootElementAccessibilityIdentifier:", v37[0]);
        v18 = v39;
        v19 = (id)-[UIApplicationAccessibility _accessibilitySpeakThisElementWithIdentifier:](v39, "_accessibilitySpeakThisElementWithIdentifier:", v37[0]);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisRootElement:](v18, "_accessibilitySetSpeakThisRootElement:");

        objc_storeStrong(v37, 0);
      }
      else
      {
        v34 = (id)AXLogSpeakScreen();
        v33 = 2;
        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEBUG))
        {
          v16 = v34;
          v17 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_debug_impl(&dword_230C4A000, v16, v17, "kAXSpeakThisRootElementAccessibilityIdentifierParameterizedAttribute set to nil", v32, 2u);
        }
        objc_storeStrong(&v34, 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisRootElementAccessibilityIdentifier:](v39, "_accessibilitySetSpeakThisRootElementAccessibilityIdentifier:", 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisRootElement:](v39, "_accessibilitySetSpeakThisRootElement:", 0);
      }
      break;
    case 3061:
      v15 = (id)objc_msgSend(location[0], "stringValue");

      if (v15)
      {
        v31 = (id)objc_msgSend(location[0], "stringValue");
        v30 = (id)AXLogSpeakScreen();
        v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v31);
          _os_log_debug_impl(&dword_230C4A000, (os_log_t)v30, v29, "kAXSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSessionAttribute %@", v40, 0xCu);
        }
        objc_storeStrong(&v30, 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:](v39, "_accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:", v31);
        v12 = v39;
        v14 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v13 = (id)objc_msgSend(v14, "_accessibilitySpeakThisViewsFromSceneWithSceneIdentifier:", v31);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:](v12, "_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:");

        objc_storeStrong(&v31, 0);
      }
      else
      {
        v28 = (id)AXLogSpeakScreen();
        v27 = 2;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
        {
          v10 = v28;
          v11 = v27;
          __os_log_helper_16_0_0(v26);
          _os_log_debug_impl(&dword_230C4A000, v10, v11, "kAXSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSessionAttribute set to nil", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:](v39, "_accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:", 0);
        -[UIApplicationAccessibility _accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:](v39, "_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:", 0);
      }
      break;
    case 3071:
      if (location[0])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[UIApplicationAccessibility _accessibilitySetUIAppFocusedOnContinuityDisplay:](v39, "_accessibilitySetUIAppFocusedOnContinuityDisplay:", location[0]);
      }
      break;
  }
  objc_storeStrong(location, 0);
}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  objc_msgSend(v0, "showKeyboardWithoutSuppressionPolicy");

}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke_2()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  objc_msgSend(v0, "hideKeyboard");

}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke_686()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  objc_msgSend(v0, "showKeyboardIfNeeded");

}

- (BOOL)openURL:(id)a3
{
  char v4;
  objc_super v5;
  char v6;
  id location[2];
  UIApplicationAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIApplicationAccessibility;
  v6 = -[UIApplicationAccessibility openURL:](&v5, sel_openURL_, location[0]);
  if (v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityBundleIdentifier
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (id)objc_msgSend(v3, "bundleIdentifier");

  return v4;
}

- (id)_accessibilityElementCommunityIdentifier
{
  return -[UIApplicationAccessibility _accessibilityBundleIdentifier](self, "_accessibilityBundleIdentifier", a2, self);
}

- (id)_accessibilityIsolatedWindows
{
  return 0;
}

uint64_t __57__UIApplicationAccessibility__accessibilityPreviewWindow__block_invoke(void *a1, void *a2)
{
  id v3;
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "accessibilityIdentifier");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PreviewContainerElement"));

  objc_storeStrong(location, 0);
  return v4 & 1;
}

uint64_t __60__UIApplicationAccessibility__accessibilityRealtimeElements__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityIsRealtimeElement");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id *location;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  id v19[2];
  UIApplicationAccessibility *v20;
  id v21;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)-[UIApplicationAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v19[0])
  {
    v21 = v19[0];
    v18 = 1;
  }
  else
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (id)objc_msgSend(v17, "localizedInfoDictionary");
    v16 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("CFBundleSpokenName"));

    if (!objc_msgSend(v16, "length"))
    {
      v14 = (id)objc_msgSend(v17, "infoDictionary");
      v2 = (id)objc_msgSend(v14, "objectForKey:", CFSTR("CFBundleSpokenName"));
      v3 = v16;
      v16 = v2;

    }
    if (!objc_msgSend(v16, "length"))
    {
      v4 = (id)objc_msgSend(v17, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1D0]);
      v5 = v16;
      v16 = v4;

    }
    if (!objc_msgSend(v16, "length"))
    {
      v6 = (id)objc_msgSend(v17, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD298]);
      v7 = v16;
      v16 = v6;

    }
    if (!objc_msgSend(v16, "length"))
    {
      v8 = (id)objc_msgSend(v17, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD280]);
      v9 = v16;
      v16 = v8;

    }
    if (!objc_msgSend(v16, "length"))
    {
      v10 = -[UIApplicationAccessibility _accessibilityBundleIdentifier](v20, "_accessibilityBundleIdentifier");
      v11 = v16;
      v16 = v10;

    }
    -[UIApplicationAccessibility setAccessibilityLabel:](v20, "setAccessibilityLabel:", v16, &v16);
    v21 = v16;
    v18 = 1;
    objc_storeStrong(location, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(v19, 0);
  return v21;
}

- (id)_accessibilityElementsWithSemanticContext:(id)a3
{
  objc_class *v3;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(IMP *, void *);
  void *v11;
  IMP v12;
  IMP Implementation;
  Method InstanceMethod;
  id v15;
  char v16;
  id v17;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  if (location[0])
  {
    objc_storeStrong(location, location[0]);
  }
  else
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v16 = 1;
    objc_storeStrong(location, v17);
  }
  if ((v16 & 1) != 0)

  v15 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, sel__accessibilitySemanticContextForElement_);
  Implementation = method_getImplementation(InstanceMethod);
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __72__UIApplicationAccessibility__accessibilityElementsWithSemanticContext___block_invoke;
  v11 = &__block_descriptor_40_e8_B16__0_8l;
  v12 = Implementation;
  objc_msgSend(v15, "setLeafNodePredicate:", &v7);
  v6 = (id)objc_msgSend(location[0], "_accessibilityLeafDescendantsWithOptions:", v15);
  v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __72__UIApplicationAccessibility__accessibilityElementsWithSemanticContext___block_invoke(IMP *a1, void *a2)
{
  objc_class *v2;
  objc_method *m;
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = objc_msgSend(location[0], "_accessibilitySupportsSemanticContext") & 1;
  if (v6)
  {
    v2 = (objc_class *)objc_opt_class();
    m = class_getInstanceMethod(v2, sel__accessibilitySemanticContextForElement_);
    v6 = method_getImplementation(m) != a1[4];
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (uint64_t)_accessibilityActionIsPhysicalButton:(_QWORD *)a3 nativeUIKitTypeRef:
{
  unint64_t v4;

  if (a1)
  {
    v4 = (a2 - 4000);
    if (v4 <= 0x12)
      __asm { BR              X8 }
    if (a3)
      *a3 = -1;
  }
  return 0;
}

- (id)_accessibilityMakeUIPressInfoWithType:(uint64_t)a3 phase:(int)a4 timestamp:(double)a5 contextID:
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v14 = a5;
  v13 = a4;
  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 838860800;
    v9 = 48;
    v10 = __Block_byref_object_copy__5;
    v11 = __Block_byref_object_dispose__5;
    v12 = 0;
    AXPerformSafeBlock();
    v18 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

uint64_t __94__UIApplicationAccessibility__accessibilityMakeUIPressInfoWithType_phase_timestamp_contextID___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  double v6;

  v6 = 1.0;
  if (*(_QWORD *)(a1 + 40) == 3 || *(_QWORD *)(a1 + 40) == 4)
    v6 = 0.0;
  v1 = objc_alloc_init(NSClassFromString(CFSTR("UIPressInfo")));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPhase:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setTimestamp:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setForce:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setContextID:", *(unsigned int *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setSource:", 3);
}

- (BOOL)_accessibilityDispatchScrollWithAmount:(int64_t)a3
{
  dispatch_time_t when;
  NSObject *queue;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(id *);
  void *v15;
  id v16[3];
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  int64_t v29;
  SEL v30;
  UIApplicationAccessibility *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = a3 >= 0;
  v27 = 0;
  v26 = 0.0;
  while (1)
  {
    v25 = v27;
    v10 = v27 >= 0 ? v25 : -v25;
    v24 = v10;
    v23 = v29;
    v9 = v29 >= 0 ? v23 : -v23;
    v22 = v9;
    if (v10 >= v9)
      break;
    v26 = v26 + 0.02;
    v21 = 5;
    v20 = 0;
    v19 = v29;
    if (v29 >= 0)
      v8 = v19;
    else
      v8 = -v19;
    v18 = v8;
    v17 = v27;
    if (v27 >= 0)
      v7 = v17;
    else
      v7 = -v17;
    v16[2] = (id)v7;
    v20 = v8 - v7;
    if (v8 - v7 < v21)
      v21 = v20;
    if (v28)
      v6 = v21;
    else
      v6 = -v21;
    v21 = v6;
    when = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    queue = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke;
    v15 = &unk_24FF3D7E0;
    v16[1] = (id)v21;
    v16[0] = v31;
    dispatch_after(when, queue, &v11);

    v27 += v21;
    objc_storeStrong(v16, 0);
  }
  return 1;
}

void __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke(id *a1)
{
  CFTypeRef cf;
  id v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  v4 = 0;
  v5 = &v4;
  v6 = 838860800;
  v7 = 48;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  AXPerformSafeBlock();
  v3 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  objc_storeStrong(&v10, 0);
  v11[0] = v3;
  mach_absolute_time();
  cf = (CFTypeRef)IOHIDEventCreateScrollEvent();
  objc_msgSend(v11[0], "_setHIDEvent:", cf);
  if (cf)
    CFRelease(cf);
  objc_msgSend(a1[4], "sendEvent:", v11[0]);
  objc_storeStrong(v11, 0);
}

void __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc_init(NSClassFromString(CFSTR("UIWheelEvent")));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  void *v5;
  id v7;
  void *v8;
  id v9;
  objc_super v11;
  id v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t *);
  void *v18;
  id v19[2];
  id v20[2];
  void *v21;
  unsigned int v22;
  id location;
  unsigned int v24;
  SEL v25;
  UIApplicationAccessibility *v26;
  char v27;

  v26 = self;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = a5;
  v21 = 0;
  if ((-[UIApplicationAccessibility _accessibilityActionIsPhysicalButton:nativeUIKitTypeRef:]((uint64_t)v26, v24, &v21) & 1) != 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    objc_msgSend(v7, "timeIntervalSinceNow");
    v8 = v5;

    v20[1] = v8;
    v20[0] = -[UIApplicationAccessibility _accessibilityMakeUIPressInfoWithType:phase:timestamp:contextID:]((uint64_t)v26, (uint64_t)v21, 0, -[UIApplicationAccessibility _accessibilityGetContextID](v26, "_accessibilityGetContextID"), *(double *)&v8);
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    objc_msgSend(v9, "_sendButtonEventWithPressInfo:", v20[0]);

    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __81__UIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke;
    v18 = &unk_24FF3D7E0;
    v19[0] = v26;
    v19[1] = v21;
    AXPerformBlockOnMainThreadAfterDelay();
    v27 = 1;
    v13 = 1;
    objc_storeStrong(v19, 0);
    objc_storeStrong(v20, 0);
  }
  else if (v24 == 5016)
  {
    -[UIApplicationAccessibility _accessibilityShowKeyboardHints]((uint64_t)v26);
    v27 = 1;
    v13 = 1;
  }
  else if (v24 == 2049)
  {
    -[UIApplicationAccessibility _accessibilityStartStopDictation](v26);
    v27 = 1;
    v13 = 1;
  }
  else if (v24 != 5021
         || ((v12 = location, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
           ? (v13 = 0)
           : (v27 = -[UIApplicationAccessibility _accessibilityDispatchScrollWithAmount:](v26, "_accessibilityDispatchScrollWithAmount:", objc_msgSend(v12, "integerValue")), v13 = 1), objc_storeStrong(&v12, 0), !v13))
  {
    if ((-[UIApplicationAccessibility _accessibilityHandleFullKeyboardAccessAction:value:](v26, v24, location) & 1) != 0)
    {
      v27 = 1;
      v13 = 1;
    }
    else if (v24 - 4100 <= 3)
    {
      v27 = -[UIApplicationAccessibility _accessibilityApplicationHandleButtonAction:](v26, "_accessibilityApplicationHandleButtonAction:", v24) & 1;
      v13 = 1;
    }
    else if (v24 == 5200)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaPlay](v26) & 1;
      v13 = 1;
    }
    else if (v24 == 5201)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaPause](v26) & 1;
      v13 = 1;
    }
    else if (v24 == 5202)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaPlayPause](v26) & 1;
      v13 = 1;
    }
    else if (v24 == 5203)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaNextTrack](v26) & 1;
      v13 = 1;
    }
    else if (v24 == 5204)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaPreviousTrack](v26) & 1;
      v13 = 1;
    }
    else if (v24 == 5205)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaSkipDuration:](v26, location) & 1;
      v13 = 1;
    }
    else if (v24 == 5207)
    {
      v27 = -[UIApplicationAccessibility _accessibilityMediaRewind](v26) & 1;
      v13 = 1;
    }
    else
    {
      if (v24 == 5208)
      {
        v27 = -[UIApplicationAccessibility _accessibilityMediaFastForward](v26) & 1;
      }
      else
      {
        v11.receiver = v26;
        v11.super_class = (Class)UIApplicationAccessibility;
        v27 = -[UIApplicationAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v11, sel__iosAccessibilityPerformAction_withValue_fencePort_, v24, location, v22);
      }
      v13 = 1;
    }
  }
  objc_storeStrong(&location, 0);
  return v27 & 1;
}

void __81__UIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v5;
  id v6[4];

  v6[3] = a1;
  v6[2] = a1;
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  objc_msgSend(v2, "timeIntervalSinceNow");
  v3 = v1;

  v6[1] = v3;
  v6[0] = -[UIApplicationAccessibility _accessibilityMakeUIPressInfoWithType:phase:timestamp:contextID:](a1[4], a1[5], 3, objc_msgSend((id)a1[4], "_accessibilityGetContextID"), *(double *)&v3);
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_msgSend(v5, "_sendButtonEventWithPressInfo:", v6[0]);

  objc_storeStrong(v6, 0);
}

- (uint64_t)_accessibilityShowKeyboardHints
{
  if (result)
    return AXPerformSafeBlock();
  return result;
}

- (uint64_t)_accessibilityHandleFullKeyboardAccessAction:(id)obj value:
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obja;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  char v34;
  _QWORD __b[9];
  id v36;
  char v37;
  int v38;
  id location;
  int v40;
  id v41;
  char v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v41 = a1;
  v40 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v41)
  {
    v37 = 0;
    switch(v40)
    {
      case 5310:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = 0;
          memset(__b, 0, 0x40uLL);
          v34 = 0;
          objc_opt_class();
          v26 = 0;
          v27 = &v26;
          v28 = 838860800;
          v29 = 48;
          v30 = __Block_byref_object_copy__5;
          v31 = __Block_byref_object_dispose__5;
          v32 = 0;
          v20 = MEMORY[0x24BDAC760];
          v21 = -1073741824;
          v22 = 0;
          v23 = __81__UIApplicationAccessibility__accessibilityHandleFullKeyboardAccessAction_value___block_invoke;
          v24 = &unk_24FF3DC50;
          v25 = &v26;
          AXPerformSafeBlock();
          v19 = (id)v27[5];
          _Block_object_dispose(&v26, 8);
          objc_storeStrong(&v32, 0);
          v33 = (id)__UIAccessibilityCastAsClass();

          if ((v34 & 1) != 0)
            abort();
          v18 = v33;
          objc_storeStrong(&v33, 0);
          obja = v18;
          v13 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
          if (v13)
          {
            v9 = *(_QWORD *)__b[2];
            v10 = 0;
            v11 = v13;
            while (1)
            {
              v8 = v10;
              if (*(_QWORD *)__b[2] != v9)
                objc_enumerationMutation(obja);
              __b[8] = *(_QWORD *)(__b[1] + 8 * v10);
              v16 = 0;
              objc_opt_class();
              v15 = (id)__UIAccessibilityCastAsClass();
              if ((v16 & 1) != 0)
                abort();
              v14 = v15;
              objc_storeStrong(&v15, 0);
              v17 = v14;
              v7 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("_FBSScene"));
              v5 = (id)objc_msgSend(v7, "safeStringForKey:", CFSTR("identifier"));
              v6 = objc_msgSend(v5, "isEqualToString:", location);

              if ((v6 & 1) != 0)
              {
                objc_storeStrong(&v36, v17);
                v38 = 3;
              }
              else
              {
                v38 = 0;
              }
              objc_storeStrong(&v17, 0);
              if (v38)
                break;
              ++v10;
              if (v8 + 1 >= v11)
              {
                v10 = 0;
                v11 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
                if (!v11)
                  goto LABEL_22;
              }
            }
          }
          else
          {
LABEL_22:
            v38 = 0;
          }

          v4 = (id)objc_msgSend(v36, "keyWindow");
          objc_msgSend(v4, "makeKeyWindow");

          v37 = 1;
          objc_storeStrong(&v36, 0);
        }
        break;
      case 5311:
        v37 = objc_msgSend(v41, "_accessibilityResetAndClearNativeFocusSystem") & 1;
        break;
      case 5313:
        v37 = objc_msgSend(v41, "_accessibilityUpdateNativeFocusImmediately") & 1;
        break;
    }
    v42 = v37 & 1;
    v38 = 1;
  }
  else
  {
    v42 = 0;
    v38 = 1;
  }
  objc_storeStrong(&location, 0);
  return v42 & 1;
}

- (uint64_t)_accessibilityMediaPlay
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:");
    MRMediaRemoteSendCommand();
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPause
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:", 1);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPlayPause
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:");
    MRMediaRemoteSendCommand();
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaNextTrack
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:", 4);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPreviousTrack
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:", 5);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaSkipDuration:(void *)a1
{
  double v2;
  int v3;
  id v5;
  unsigned int v6;
  id location;
  void *v8;
  char v9;
  double v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](v8);
    objc_msgSend(location, "doubleValue");
    if (v2 <= 0.0)
      v3 = 18;
    else
      v3 = 17;
    v6 = v3;
    v10 = v2;
    v11 = *MEMORY[0x24BE659C0];
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fabs(v2));
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    MRMediaRemoteSendCommand();

    objc_msgSend(v8, "_accessibilitySetLastMediaRemoteCommand:", v6);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(&location, 0);
  return v9 & 1;
}

- (uint64_t)_accessibilityMediaRewind
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:", 10);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaFastForward
{
  char v3;

  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:", 8);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void __61__UIApplicationAccessibility__accessibilityShowKeyboardHints__block_invoke(void *a1)
{
  id v1[3];

  v1[2] = a1;
  v1[1] = a1;
  v1[0] = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyShortcutHUDService")), "safeValueForKey:", CFSTR("sharedHUDService"));
  objc_msgSend(v1[0], "scheduleHUDPresentation");
  objc_storeStrong(v1, 0);
}

void __81__UIApplicationAccessibility__accessibilityHandleFullKeyboardAccessAction_value___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF7000], "_scenesIncludingInternal:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityFocusableScenesDictionary
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *);
  void *v9;
  id v10;
  id v11;
  id v12[2];
  UIApplicationAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = -[UIApplicationAccessibility _accessibilityFocusableScenes](v13, "_accessibilityFocusableScenes");
  v3 = v11;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __69__UIApplicationAccessibility__accessibilityFocusableScenesDictionary__block_invoke;
  v9 = &unk_24FF3E490;
  v10 = v12[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  v4 = v12[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v4;
}

void __69__UIApplicationAccessibility__accessibilityFocusableScenesDictionary__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v18[3] = a3;
  v18[2] = a4;
  v18[1] = a1;
  v11 = (void *)MEMORY[0x24BDD16E0];
  v17 = 0;
  objc_opt_class();
  v16 = (id)__UIAccessibilityCastAsClass();
  v15 = v16;
  objc_storeStrong(&v16, 0);
  v7 = (id)objc_msgSend(v15, "screen");
  v6 = (id)objc_msgSend(v7, "displayIdentity");
  v18[0] = (id)objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v6, "displayID"));

  if (v18[0])
  {
    v5 = (id)objc_msgSend(a1[4], "objectForKeyedSubscript:", v18[0]);
    v12 = 0;
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = 1;
      v4 = v13;
    }
    v14 = v4;
    if ((v12 & 1) != 0)

    objc_msgSend(v14, "addObject:", location[0]);
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v14, v18[0]);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityFocusableScenes
{
  id v3;
  id v4;

  v3 = -[UIApplicationAccessibility _accessibilityActiveScenes](self, "_accessibilityActiveScenes");
  v4 = (id)objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_730);

  return v4;
}

uint64_t __59__UIApplicationAccessibility__accessibilityFocusableScenes__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v4;
  char v5;
  id v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = a3;
  v11 = a1;
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v4 = (id)objc_msgSend(v8, "_focusSystemSceneComponent");
  v5 = objc_msgSend((id)objc_opt_class(), "safeBoolForKey:", CFSTR("needsFocusSystem"));

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_accessibilityActiveScenes
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13;
  char v14;
  SEL v15;
  UIApplicationAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14 = 0;
  objc_opt_class();
  v6 = 0;
  v7 = &v6;
  v8 = 838860800;
  v9 = 48;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  AXPerformSafeBlock();
  v5 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  v13 = (id)__UIAccessibilityCastAsClass();

  if ((v14 & 1) != 0)
    abort();
  v4 = v13;
  objc_storeStrong(&v13, 0);
  v3 = (id)objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_731);

  return v3;
}

void __56__UIApplicationAccessibility__accessibilityActiveScenes__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF7000], "_scenesIncludingInternal:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

BOOL __56__UIApplicationAccessibility__accessibilityActiveScenes__block_invoke_2(void *a1, void *a2, void *a3)
{
  BOOL v4;
  id v7;
  id v8;
  char v9;
  id v10[3];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[2] = a3;
  v10[1] = a1;
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v4 = objc_msgSend(v7, "activationState") == 0;
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityWindowSceneForSceneID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  id location[2];
  UIApplicationAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[UIApplicationAccessibility _accessibilityActiveScenes](v14, "_accessibilityActiveScenes");
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __66__UIApplicationAccessibility__accessibilityWindowSceneForSceneID___block_invoke;
  v11 = &unk_24FF3E640;
  v12 = location[0];
  v4 = (id)objc_msgSend(v5, "ax_filteredArrayUsingBlock:");
  v6 = (id)objc_msgSend(v4, "firstObject");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

uint64_t __66__UIApplicationAccessibility__accessibilityWindowSceneForSceneID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char v6;
  id v10;
  id v11;
  char v12;
  _QWORD *v13;
  _BYTE *v14;
  uint64_t v15;
  id location[2];
  char v17;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15 = a3;
  v14 = a4;
  v13 = a1;
  v12 = 0;
  objc_opt_class();
  v11 = (id)__UIAccessibilityCastAsClass();
  v10 = v11;
  objc_storeStrong(&v11, 0);
  v5 = (id)objc_msgSend(v10, "_sceneIdentifier");
  v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

  if ((v6 & 1) != 0)
  {
    *v14 = 1;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (id)_accessibilityFocusContainer
{
  id v3;
  id v4;

  v3 = -[UIApplicationAccessibility _accessibilityPreferredFocusedWindow](self, "_accessibilityPreferredFocusedWindow");
  v4 = (id)objc_msgSend(v3, "_accessibilityFocusContainer");

  return v4;
}

- (id)_accessibilityFocusedScene
{
  id v3;
  id v4;

  v3 = -[UIApplicationAccessibility _accessibilityPreferredFocusedWindow](self, "_accessibilityPreferredFocusedWindow");
  v4 = (id)objc_msgSend(v3, "windowScene");

  return v4;
}

- (id)_accessibilityPreferredFocusedWindow
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  SEL v8;
  UIApplicationAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  objc_opt_class();
  v4 = -[UIApplicationAccessibility _accessibilityFocusedScreen](v9, "_accessibilityFocusedScreen");
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_preferredFocusedWindow"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  return v5;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  id v5;
  char v6;
  BOOL v7;

  v7 = a4;
  v5 = -[UIApplicationAccessibility _accessibilityFocusContainer](self, "_accessibilityFocusContainer");
  v6 = objc_msgSend(v5, "_accessibilityMoveFocusWithHeading:byGroup:", a3, v7);

  return v6 & 1;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v5;
  id v6;
  char v7;
  id location;
  unint64_t v9;
  SEL v10;
  UIApplicationAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v6 = -[UIApplicationAccessibility _accessibilityPreferredFocusedWindow](v11, "_accessibilityPreferredFocusedWindow");
  v5 = (id)objc_msgSend(v6, "windowScene");
  v7 = objc_msgSend(v5, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", v9, location);

  objc_storeStrong(&location, 0);
  return v7 & 1;
}

- (void)_accessibilityDidFocusOnApplication
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[UIApplicationAccessibility _accessibilityNativeFocusElement](self, "_accessibilityNativeFocusElement");
  if ((objc_msgSend(location[0], "_accessibilityHandlesRemoteFocusMovement") & 1) != 0)
    objc_msgSend(location[0], "_accessibilitySetFocusOnElement:", 1);
  objc_storeStrong(location, 0);
}

- (id)_responderForKeyEvents
{
  id v3;
  id v4;
  id v5;
  objc_super v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationAccessibility;
  location[0] = -[UIApplicationAccessibility _responderForKeyEvents](&v6, sel__responderForKeyEvents);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && !_AXSFullKeyboardAccessPassthroughModeEnabled())
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    v5 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_focusResponder"));
    if (v5)
      objc_storeStrong(location, v5);
    else
      objc_storeStrong(location, location[0]);

  }
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_targetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v4;
  id v5;
  id v7;
  int v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  objc_super v14;
  id v15;
  id location;
  SEL v17;
  SEL v18;
  UIApplicationAccessibility *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v14.receiver = v19;
  v14.super_class = (Class)UIApplicationAccessibility;
  v15 = -[UIApplicationAccessibility _targetInChainForAction:sender:](&v14, sel__targetInChainForAction_sender_, v17, location);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v12 = 0;
    objc_opt_class();
    v9 = (id)-[UIApplicationAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("_responderForKeyEvents"));
    v11 = (id)__UIAccessibilityCastAsClass();

    v10 = v11;
    objc_storeStrong(&v11, 0);
    v13 = v10;
    while (1)
    {
      LOBYTE(v8) = 0;
      if (v13)
        v8 = objc_msgSend(v13, "canPerformAction:withSender:", v17, location) ^ 1;
      if ((v8 & 1) == 0)
        break;
      v4 = (id)objc_msgSend(v13, "nextResponder");
      v5 = v13;
      v13 = v4;

    }
    if (v13)
      objc_storeStrong(&v15, v13);
    else
      objc_storeStrong(&v15, v15);
    objc_storeStrong(&v13, 0);
  }
  v7 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_axAuditCheckDynamicTextSupport:(char)a3 andClippingIssues:(char)a4 spinRunloop:
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  id v68;
  id v70;
  id v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  id v80;
  BOOL v81;
  id v82;
  id v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  void *v124;
  id v125;
  id obj;
  uint64_t v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  id v155;
  id v156;
  _QWORD v157[8];
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;
  uint64_t v174;
  __int128 v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  id v179;
  id v180;
  id v181;
  uint64_t v182;
  id v183;
  id v184;
  _QWORD v185[8];
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  _QWORD v192[8];
  uint64_t v193;
  _QWORD v194[8];
  uint64_t v195;
  _QWORD v196[8];
  uint64_t v197;
  id location;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  _QWORD __b[8];
  uint64_t v205;
  id v206;
  id v207;
  char v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  char v216;
  char v217;
  char v218;
  id v219;
  id v220;
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  uint64_t v227;

  v227 = *MEMORY[0x24BDAC8D0];
  v219 = a1;
  v218 = a2 & 1;
  v217 = a3 & 1;
  v216 = a4 & 1;
  if (a1)
  {
    v215 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v214 = (id)objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v213 = (id)objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v212 = 0;
    v211 = (id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v128 = (void *)MEMORY[0x24BEBAE08];
    v131 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v130 = (id)objc_msgSend(v131, "_accessibilityMainWindow");
    v129 = (id)objc_msgSend(v130, "rootViewController");
    v210 = (id)objc_msgSend(v128, "_axAuditFindFrontmostViewControllerForHierarchy:");

    v132 = (void *)MEMORY[0x24BEBAE08];
    v133 = (id)objc_msgSend(v210, "view");
    objc_msgSend(v132, "_axAuditCaptureReferenceToCellsForViewHierarchy:");

    v134 = (id)objc_msgSend(MEMORY[0x24BDF6968], "system");
    v209 = (id)objc_msgSend(v134, "preferredContentSizeCategory");

    v208 = objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditSwizzleAwayContentSize:", 1) & 1;
    if ((v208 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditSwizzleAwayContentSize:", 0);
LABEL_74:
      v220 = v215;
      v178 = 1;
      objc_storeStrong(&v209, 0);
      objc_storeStrong(&v210, 0);
      objc_storeStrong(&v211, 0);
      objc_storeStrong(&v212, 0);
      objc_storeStrong(&v213, 0);
      objc_storeStrong(&v214, 0);
      objc_storeStrong(&v215, 0);
      return v220;
    }
    v207 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetAllFontSizes");
    v124 = (void *)MEMORY[0x24BEBAE08];
    v125 = (id)objc_msgSend(v210, "view");
    v206 = (id)objc_msgSend(v124, "_accessibilityGetAllSwiftUISubviews:withFiltering:");

    memset(__b, 0, sizeof(__b));
    obj = v207;
    v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v226, 16);
    if (v127)
    {
      v121 = *(_QWORD *)__b[2];
      v122 = 0;
      v123 = v127;
      while (1)
      {
        v120 = v122;
        if (*(_QWORD *)__b[2] != v121)
          objc_enumerationMutation(obj);
        v205 = *(_QWORD *)(__b[1] + 8 * v122);
        objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditUIKitShouldReportFontSize:", v205);
        if ((v216 & 1) != 0)
          objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditSpinRunloopForDuration:", 0.1);
        v111 = (id)objc_msgSend(v210, "view");
        objc_msgSend(v111, "setNeedsLayout");

        v112 = (id)objc_msgSend(v210, "view");
        objc_msgSend(v112, "layoutIfNeeded");

        v113 = (void *)MEMORY[0x24BEBAE08];
        v114 = (id)objc_msgSend(v210, "view");
        v203 = (id)objc_msgSend(v113, "_accessibilityGetAllSubviews:withFiltering:");

        v115 = (void *)MEMORY[0x24BEBAE08];
        v117 = (id)objc_msgSend(v210, "view");
        v116 = (id)objc_msgSend(v115, "_accessibilityGetAllSubviews:withFiltering:");
        v202 = (id)objc_msgSend(v116, "mutableCopy");

        v201 = (id)objc_msgSend(v202, "mutableCopy");
        objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:", v203);
        v200 = (id)MEMORY[0x2348C3D88](&__block_literal_global_744);
        v199 = (id)MEMORY[0x2348C3D88](&__block_literal_global_748);
        objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditRemoveUIViewsFromArray:usingFilter:", v202, v200);
        objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditRemoveUIViewsFromArray:usingFilter:", v201, v199);
        location = (id)objc_msgSend(v210, "view");
        objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditUpdateReferenceOfCellsForViewHierarchy:forFontSize:", location, v205);
        memset(v196, 0, sizeof(v196));
        v118 = v202;
        v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", v196, v225, 16);
        if (v119)
        {
          v108 = *(_QWORD *)v196[2];
          v109 = 0;
          v110 = v119;
          while (1)
          {
            v107 = v109;
            if (*(_QWORD *)v196[2] != v108)
              objc_enumerationMutation(v118);
            v197 = *(_QWORD *)(v196[1] + 8 * v109);
            objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditStoreFontForElement:intoDictionary:forCurrentFont:", v197, v214, v205);
            ++v109;
            if (v107 + 1 >= v110)
            {
              v109 = 0;
              v110 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", v196, v225, 16);
              if (!v110)
                break;
            }
          }
        }

        memset(v194, 0, sizeof(v194));
        v105 = v206;
        v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", v194, v224, 16);
        if (v106)
        {
          v102 = *(_QWORD *)v194[2];
          v103 = 0;
          v104 = v106;
          while (1)
          {
            v101 = v103;
            if (*(_QWORD *)v194[2] != v102)
              objc_enumerationMutation(v105);
            v195 = *(_QWORD *)(v194[1] + 8 * v103);
            objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditStoreFontForSwiftUIView:intoDictionary:forCurrentFont:", v195, v213, v205);
            objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditCheckSwiftUIViewForClipping:storeIntoSet:", v195, v211);
            ++v103;
            if (v101 + 1 >= v104)
            {
              v103 = 0;
              v104 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", v194, v224, 16);
              if (!v104)
                break;
            }
          }
        }

        memset(v192, 0, sizeof(v192));
        v99 = v201;
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", v192, v223, 16);
        if (v100)
        {
          v96 = *(_QWORD *)v192[2];
          v97 = 0;
          v98 = v100;
          while (1)
          {
            v95 = v97;
            if (*(_QWORD *)v192[2] != v96)
              objc_enumerationMutation(v99);
            v193 = *(_QWORD *)(v192[1] + 8 * v97);
            objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditCheckElementForClipping:storeIntoSet:", v193, v211);
            ++v97;
            if (v95 + 1 >= v98)
            {
              v97 = 0;
              v98 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", v192, v223, 16);
              if (!v98)
                break;
            }
          }
        }

        objc_storeStrong(&location, 0);
        objc_storeStrong(&v199, 0);
        objc_storeStrong(&v200, 0);
        objc_storeStrong(&v201, 0);
        objc_storeStrong(&v202, 0);
        objc_storeStrong(&v203, 0);
        ++v122;
        if (v120 + 1 >= v123)
        {
          v122 = 0;
          v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v226, 16);
          if (!v123)
            break;
        }
      }
    }

    objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditUIKitShouldReportFontSize:", v209);
    objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditSwizzleAwayContentSize:", 0);
    objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditSpinRunloopForDuration:", 0.1);
    v91 = (id)objc_msgSend(v210, "view");
    v4 = (id)objc_msgSend(v91, "accessibilityElements");

    v92 = (void *)MEMORY[0x24BEBAE08];
    v94 = (id)objc_msgSend(v210, "view");
    v93 = (id)objc_msgSend(v92, "_accessibilityGetAllSubviews:withFiltering:");
    objc_msgSend(v92, "_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:");

    v191 = (id)objc_msgSend(v210, "view");
    v190 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditDereferenceCellsForViewHierarchy:", v191);
    v189 = (id)objc_msgSend(v190, "objectForKey:", CFSTR("Font Info for Cells"));
    v188 = (id)objc_msgSend(v190, "objectForKey:", CFSTR("Clipping Info for Cells"));
    objc_msgSend(v219, "_addEntriesToMapTable:fromMapTable:", v214, v189);
    objc_msgSend(v211, "unionHashTable:", v188);
    objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditRemoveUnsupportedCategories:", v214);
    v5 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditFindElementsNotSupportingDynamicText:", v214);
    v6 = v212;
    v212 = v5;

    v187 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditFindElementsNotSupportingDynamicText:", v213);
    objc_msgSend(v219, "_addEntriesToMapTable:fromMapTable:", v212, v187);
    if ((v218 & 1) != 0)
    {
      memset(v185, 0, sizeof(v185));
      v89 = v212;
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", v185, v222, 16);
      if (v90)
      {
        v86 = *(_QWORD *)v185[2];
        v87 = 0;
        v88 = v90;
        while (1)
        {
          v85 = v87;
          if (*(_QWORD *)v185[2] != v86)
            objc_enumerationMutation(v89);
          v186 = *(id *)(v185[1] + 8 * v87);
          v184 = (id)objc_msgSend(v212, "objectForKey:", v186);
          v183 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v184, CFSTR("AuditIssueUnsupportedFontSizes"));
          v182 = 3002;
          v83 = (id)objc_msgSend(v184, "sortedArrayUsingSelector:", 0x1F35C1AB2uLL);
          v82 = (id)objc_msgSend(v207, "sortedArrayUsingSelector:", 0x1F35C1AB2uLL);
          v84 = objc_msgSend(v83, "isEqualToArray:");

          if ((v84 & 1) != 0)
          {
            v182 = 3001;
            objc_storeStrong(&v183, 0);
          }
          v181 = 0;
          v180 = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v179 = v186;
            if ((objc_msgSend(v179, "_accessibilityViewIsVisible") & 1) != 0)
            {
              v7 = (id)objc_msgSend(v179, "window");
              v81 = v7 == 0;

              if (!v81)
              {
                v176 = 0;
                v177 = 0;
                v80 = (id)objc_msgSend(v179, "superview");
                objc_msgSend(v179, "frame");
                *(double *)&v172 = v8;
                *((double *)&v172 + 1) = v9;
                v173 = v10;
                v174 = v11;
                v175 = v172;
                objc_msgSend(v80, "convertPoint:toView:", 0, v8, v9);
                v176 = v12;
                v177 = v13;

                v170 = 0u;
                v171 = 0u;
                objc_msgSend(v179, "bounds");
                v166 = v14;
                v167 = v15;
                v168 = v16;
                v169 = v17;
                objc_msgSend(v179, "bounds");
                v162 = v18;
                v163 = v19;
                v164 = v20;
                v165 = v21;
                CGRectMake_0();
                *(double *)&v170 = v22;
                *((double *)&v170 + 1) = v23;
                *(double *)&v171 = v24;
                *((double *)&v171 + 1) = v25;
                v26 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v22, v23, v24, v25);
                v27 = v181;
                v181 = v26;

              }
              v28 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetTextFromObject:", v179);
              v29 = v180;
              v180 = v28;

              v178 = 0;
            }
            else
            {
              v178 = 11;
            }
            objc_storeStrong(&v179, 0);
            if (v178)
              goto LABEL_50;
          }
          else if ((objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditViewIsSwiftUI:", v186) & 1) != 0)
          {
            v79 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetAttrLabelFromSwiftUIView:", v186);
            v30 = (id)objc_msgSend(v79, "string");
            v31 = v180;
            v180 = v30;

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v160 = 0u;
              v161 = 0u;
              objc_msgSend(v186, "accessibilityFrame");
              *(double *)&v160 = v32;
              *((double *)&v160 + 1) = v33;
              *(double *)&v161 = v34;
              *((double *)&v161 + 1) = v35;
              v36 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v32, v33, v34, v35);
              v37 = v181;
              v181 = v36;

            }
          }
          v159 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", v182, v186, v183, 0, 0, 0, v181, v180);
          objc_msgSend(v215, "addObject:", v159);
          objc_storeStrong(&v159, 0);
          v178 = 0;
LABEL_50:
          objc_storeStrong(&v180, 0);
          objc_storeStrong(&v181, 0);
          objc_storeStrong(&v183, 0);
          objc_storeStrong(&v184, 0);
          ++v87;
          if (v85 + 1 >= v88)
          {
            v87 = 0;
            v88 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", v185, v222, 16);
            if (!v88)
              break;
          }
        }
      }

    }
    if ((v217 & 1) != 0)
    {
      memset(v157, 0, sizeof(v157));
      v77 = v211;
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", v157, v221, 16);
      if (v78)
      {
        v74 = *(_QWORD *)v157[2];
        v75 = 0;
        v76 = v78;
        while (1)
        {
          v73 = v75;
          if (*(_QWORD *)v157[2] != v74)
            objc_enumerationMutation(v77);
          v158 = *(id *)(v157[1] + 8 * v75);
          v156 = 0;
          v155 = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v154 = v158;
            if ((objc_msgSend(v154, "_accessibilityViewIsVisible") & 1) != 0)
            {
              v38 = (id)objc_msgSend(v154, "window");
              v72 = v38 == 0;

              if (!v72)
              {
                v152 = 0;
                v153 = 0;
                v71 = (id)objc_msgSend(v154, "superview");
                objc_msgSend(v154, "frame");
                *(double *)&v148 = v39;
                *((double *)&v148 + 1) = v40;
                v149 = v41;
                v150 = v42;
                v151 = v148;
                objc_msgSend(v71, "convertPoint:toView:", 0, v39, v40);
                v152 = v43;
                v153 = v44;

                v146 = 0u;
                v147 = 0u;
                objc_msgSend(v154, "bounds");
                v142 = v45;
                v143 = v46;
                v144 = v47;
                v145 = v48;
                objc_msgSend(v154, "bounds");
                v138 = v49;
                v139 = v50;
                v140 = v51;
                v141 = v52;
                CGRectMake_0();
                *(double *)&v146 = v53;
                *((double *)&v146 + 1) = v54;
                *(double *)&v147 = v55;
                *((double *)&v147 + 1) = v56;
                v57 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v53, v54, v55, v56);
                v58 = v156;
                v156 = v57;

              }
              v59 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetTextFromObject:", v154);
              v60 = v155;
              v155 = v59;

              v178 = 0;
            }
            else
            {
              v178 = 13;
            }
            objc_storeStrong(&v154, 0);
            if (v178)
              goto LABEL_70;
          }
          else if ((objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditViewIsSwiftUI:", v158) & 1) != 0)
          {
            v70 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetAttrLabelFromSwiftUIView:", v158);
            v61 = (id)objc_msgSend(v70, "string");
            v62 = v155;
            v155 = v61;

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v136 = 0u;
              v137 = 0u;
              objc_msgSend(v158, "accessibilityFrame");
              *(double *)&v136 = v63;
              *((double *)&v136 + 1) = v64;
              *(double *)&v137 = v65;
              *((double *)&v137 + 1) = v66;
              v67 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v63, v64, v65, v66);
              v68 = v156;
              v156 = v67;

            }
          }
          v135 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 3003, v158, 0, 0, 0, 0, v156, v155);
          objc_msgSend(v215, "addObject:", v135);
          objc_storeStrong(&v135, 0);
          v178 = 0;
LABEL_70:
          objc_storeStrong(&v155, 0);
          objc_storeStrong(&v156, 0);
          ++v75;
          if (v73 + 1 >= v76)
          {
            v75 = 0;
            v76 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", v157, v221, 16);
            if (!v76)
              break;
          }
        }
      }

    }
    objc_storeStrong(&v187, 0);
    objc_storeStrong(&v188, 0);
    objc_storeStrong(&v189, 0);
    objc_storeStrong(&v190, 0);
    objc_storeStrong(&v191, 0);
    objc_storeStrong(&v206, 0);
    objc_storeStrong(&v207, 0);
    goto LABEL_74;
  }
  v220 = 0;
  return v220;
}

uint64_t __92__UIApplicationAccessibility__axAuditCheckDynamicTextSupport_andClippingIssues_spinRunloop___block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 1;
        if ((objc_msgSend(location[0], "isHidden") & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __92__UIApplicationAccessibility__axAuditCheckDynamicTextSupport_andClippingIssues_spinRunloop___block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  isKindOfClass = 1;
  if ((objc_msgSend(location[0], "isHidden") & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)_addEntriesToMapTable:(id)a3 fromMapTable:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  id v14;
  id location[3];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  memset(__b, 0, sizeof(__b));
  v9 = (id)objc_msgSend(v14, "keyEnumerator");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(v9);
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v11 = (id)objc_msgSend(v14, "objectForKey:", v13);
      objc_msgSend(location[0], "setObject:forKey:", v11, v13);
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id obj;
  uint64_t v31;
  id v32;
  _QWORD v33[8];
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD __b[8];
  id v54;
  id v55;
  unsigned __int8 v56;
  objc_super v57;
  id v58;
  id location[2];
  UIApplicationAccessibility *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57.receiver = v60;
  v57.super_class = (Class)UIApplicationAccessibility;
  v58 = -[UIApplicationAccessibility _accessibilityAuditIssuesWithOptions:](&v57, sel__accessibilityAuditIssuesWithOptions_, location[0]);
  if (!v58)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = v58;
    v58 = v3;

  }
  v56 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", CFSTR("AXAuditShouldHonorGroupsOption"), location[0]) & 1;
  v55 = (id)-[UIApplicationAccessibility _accessibilityAuditVisibleElementsHonoringGroups:](v60, "_accessibilityAuditVisibleElementsHonoringGroups:", v56);
  memset(__b, 0, sizeof(__b));
  obj = v55;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
  if (v31)
  {
    v27 = *(_QWORD *)__b[2];
    v28 = 0;
    v29 = v31;
    while (1)
    {
      v26 = v28;
      if (*(_QWORD *)__b[2] != v27)
        objc_enumerationMutation(obj);
      v54 = *(id *)(__b[1] + 8 * v28);
      v52 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditUnlabeledIssueDictForElement:honorsGroups:", v54, v56 & 1);
      if (v52)
        objc_msgSend(v58, "addObject:", v52);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v51 = (id)objc_msgSend(v54, "_accessibilityAuditIssuesWithOptions:", location[0]);
        objc_msgSend(v58, "axSafelyAddObjectsFromArray:", v51);
        objc_storeStrong(&v51, 0);
      }
      objc_storeStrong(&v52, 0);
      ++v28;
      if (v26 + 1 >= v29)
      {
        v28 = 0;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
        if (!v29)
          break;
      }
    }
  }

  v50 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE860], location[0]);
  v49 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE850], location[0]);
  v48 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE870], location[0]);
  v47 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE858], location[0]);
  v46 = 0;
  v25 = (_QWORD *)MEMORY[0x24BDFE8B0];
  v46 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *MEMORY[0x24BDFE8B0], v50) & 1;
  v45 = 0;
  v45 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *v25, v49) & 1;
  v44 = 0;
  v44 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *v25, v48) & 1;
  v43 = 0;
  v43 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *MEMORY[0x24BDFE8B8], v50) & 1;
  v42 = 0;
  v42 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *v25, v47) & 1;
  v41 = 0;
  v40 = 0;
  v39 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if ((v46 & 1) != 0 || (v45 & 1) != 0)
  {
    v5 = -[UIApplicationAccessibility _axAuditCheckDynamicTextSupport:andClippingIssues:spinRunloop:](v60, v46 & 1, v45 & 1, v43 & 1);
    v6 = v41;
    v41 = v5;

  }
  if ((v44 & 1) != 0)
  {
    v22 = (void *)MEMORY[0x24BEBAE08];
    v24 = -[UIApplicationAccessibility _accessibilityMainWindow](v60, "_accessibilityMainWindow");
    v23 = (id)objc_msgSend(v24, "rootViewController");
    v38 = (id)objc_msgSend(v22, "_axAuditFindFrontmostViewControllerForHierarchy:");

    v37 = (id)objc_msgSend(v38, "view");
    v7 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditFindDescendantInaccessibleElements:honorsGroups:", v37, v56 & 1);
    v8 = v40;
    v40 = v7;

    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  if ((v42 & 1) != 0)
  {
    v15 = (void *)MEMORY[0x24BEBAE08];
    v19 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v18 = (id)objc_msgSend(v19, "_accessibilityMainWindow");
    v17 = (id)objc_msgSend(v18, "rootViewController");
    v16 = (id)objc_msgSend(v15, "_axAuditFindFrontmostViewControllerForHierarchy:");
    v36 = (id)objc_msgSend(v16, "view");

    v35 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_accessibilityGetAllSwiftUISubviews:withFiltering:", v36, 1);
    memset(v33, 0, sizeof(v33));
    v20 = v35;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v33, v61, 16);
    if (v21)
    {
      v12 = *(_QWORD *)v33[2];
      v13 = 0;
      v14 = v21;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)v33[2] != v12)
          objc_enumerationMutation(v20);
        v34 = *(_QWORD *)(v33[1] + 8 * v13);
        v32 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditContrastDetectionForSwiftUIView:", v34);
        objc_msgSend(v39, "addObjectsFromArray:", v32);
        objc_storeStrong(&v32, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v33, v61, 16);
          if (!v14)
            break;
        }
      }
    }

    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  if (v41)
    objc_msgSend(v58, "addObjectsFromArray:", v41);
  if (v40)
    objc_msgSend(v58, "addObjectsFromArray:", v40);
  if (v39)
    objc_msgSend(v58, "addObjectsFromArray:", v39);
  v10 = v58;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_accessibilitySemanticContext
{
  id v3;
  id v4;
  id location;
  id v6;
  id v7[2];
  UIApplicationAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v6 = -[UIApplicationAccessibility _accessibilityMainWindow](self, "_accessibilityMainWindow");
  location = (id)objc_msgSend(v6, "rootViewController");
  v7[0] = -[UIApplicationAccessibility _accessibilityApplicationSemanticContextWithViewController:]((uint64_t)v8, location);

  if (!v7[0])
  {
    v7[0] = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityApplicationSemanticContext");

    if (!v7[0])
    {
      v4 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
      v7[0] = (id)objc_msgSend(v4, "_accessibilityApplicationSemanticContext");

    }
  }
  v3 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v3;
}

- (id)_accessibilityApplicationSemanticContextWithViewController:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  int v18;
  id location;
  uint64_t v20;
  id v21;

  v20 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v20)
  {
    v17 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = location;
      v15 = (id)objc_msgSend(v16, "visibleViewController");
      v2 = (id)objc_msgSend(v15, "_accessibilityApplicationSemanticContext");
      v3 = v17;
      v17 = v2;

      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    if (!v17)
    {
      v4 = (id)objc_msgSend(location, "_accessibilityApplicationSemanticContext");
      v5 = v17;
      v17 = v4;

    }
    if (!v17)
    {
      v10 = (id)objc_msgSend(location, "childViewControllers");
      v11 = objc_msgSend(v10, "count");

      v14 = v11;
      for (i = v11 - 1; i >= 0; --i)
      {
        v9 = (id)objc_msgSend(location, "childViewControllers");
        v12 = (id)objc_msgSend(v9, "objectAtIndex:", i);

        v6 = (id)-[UIApplicationAccessibility _accessibilityApplicationSemanticContextWithViewController:](v20, v12);
        v7 = v17;
        v17 = v6;

        v18 = v17 ? 2 : 0;
        objc_storeStrong(&v12, 0);
        if (v18)
          break;
      }
    }
    v21 = v17;
    v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v21 = 0;
    v18 = 1;
  }
  objc_storeStrong(&location, 0);
  return v21;
}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v3 = (id)objc_msgSend(v4, "rootViewController");
  v5 = (id)objc_msgSend(v3, "_accessibilitySpeakThisViewController");

  return v5;
}

- (id)_accessibilityFirstElementsForSpeakThis
{
  objc_class *v2;
  id v4;
  id v5;
  id v6;
  int v7;
  id v8;
  Method InstanceMethod;
  os_log_type_t v10;
  id v11;
  id v12[2];
  UIApplicationAccessibility *v13;
  id v14;
  id location;
  dispatch_once_t *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12[1] = (id)a2;
  v16 = (dispatch_once_t *)&_accessibilityFirstElementsForSpeakThis_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_765);
  if (*v16 != -1)
    dispatch_once(v16, location);
  objc_storeStrong(&location, 0);
  v12[0] = -[UIApplicationAccessibility _accessibilitySpeakThisViewController](v13, "_accessibilitySpeakThisViewController");
  v11 = (id)AXLogSpeakScreen();
  v10 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v17, (uint64_t)v12[0]);
    _os_log_impl(&dword_230C4A000, (os_log_t)v11, v10, "Speak This view controller was %{public}@", v17, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  v2 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings);
  if (InstanceMethod == (Method)_accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod)
  {
    v4 = (id)objc_msgSend(v12[0], "_accessibilitySpeakThisViews");
    v6 = (id)objc_msgSend(v4, "firstObject");

    v14 = (id)objc_msgSend(v6, "_accessibilityFirstElementsForSpeakThis");
    v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v5 = (id)objc_msgSend(v12[0], "_accessibilitySpeakThisElementsAndStrings");
    v8 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v8, "addObject:", CFSTR("SpeakThis-LegacyMethodWasUsed"));
    v14 = v8;
    v7 = 1;
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v12, 0);
  return v14;
}

Method __69__UIApplicationAccessibility__accessibilityFirstElementsForSpeakThis__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetSpeakThisRootElement
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisRootElement);
}

- (void)_accessibilitySetSpeakThisRootElement:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisRootElementAccessibilityIdentifier
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisRootElementAccessibilityIdentifier);
}

- (void)_accessibilitySetSpeakThisRootElementAccessibilityIdentifier:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession);
}

- (void)_accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession);
}

- (void)_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySpeakThisRootElement
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UIApplicationAccessibility _accessibilityGetSpeakThisRootElement](self, "_accessibilityGetSpeakThisRootElement");
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return -[UIApplicationAccessibility _accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession](self, "_accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession", a2, self);
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  id v3;
  os_log_t oslog;
  id v5[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[UIApplicationAccessibility _accessibilitySpeakThisViewController](self, "_accessibilitySpeakThisViewController");
  oslog = (os_log_t)(id)AXLogSpeakScreen();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v6, (uint64_t)v5[0]);
    _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "Speak This view controller was %{public}@", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = (id)objc_msgSend(v5[0], "_accessibilitySpeakThisElementsAndStrings");
  objc_storeStrong(v5, 0);
  return v3;
}

- (id)_accessibilityUIAppFocusedOnContinuityDisplay
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityUIAppFocusedOnContinuityDisplay);
}

- (void)_accessibilitySetUIAppFocusedOnContinuityDisplay:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityBeginMonitoringIdleRunLoop
{
  __CFRunLoop *Current;

  if (!_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver)
  {
    _accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver = (uint64_t)CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, &__block_literal_global_772);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  }
  return 1;
}

void __70__UIApplicationAccessibility__accessibilityBeginMonitoringIdleRunLoop__block_invoke()
{
  CFTypeRef cf;

  UIAccessibilityPostNotification(0xFA2u, &unk_24FF85DC0);
  cf = (CFTypeRef)_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver;
  _accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver = 0;
  CFRelease(cf);
}

- (void)_finishButtonEvent:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  id v6;
  os_log_t oslog;
  os_log_type_t v8;
  id v9;
  objc_super v10;
  id location[2];
  UIApplicationAccessibility *v12;
  uint8_t v13[16];
  uint8_t v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)UIApplicationAccessibility;
  -[UIApplicationAccessibility _finishButtonEvent:](&v10, sel__finishButtonEvent_, location[0]);
  v9 = (id)AXLogUIA();
  v8 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    v6 = (id)objc_msgSend(location[0], "allPresses");
    __os_log_helper_16_0_1_4_0((uint64_t)v14, objc_msgSend(v6, "count"));
    _os_log_impl(&dword_230C4A000, (os_log_t)v9, v8, "Received button event (%d)", v14, 8u);

  }
  objc_storeStrong(&v9, 0);
  if (_AXSAutomationEnabled())
  {
    oslog = (os_log_t)(id)AXLogUIA();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v5 = (id)objc_msgSend(location[0], "allPresses");
      __os_log_helper_16_0_1_4_0((uint64_t)v13, objc_msgSend(v5, "count"));
      _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "Processed button event (%d)", v13, 8u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v3 = (id)objc_msgSend(location[0], "allPresses");
    v4 = objc_msgSend(v3, "count") != 0;

    if (!v4)
      UIAccessibilityPostNotification(0xFA2u, &unk_24FF85E10);
  }
  objc_storeStrong(location, 0);
}

- (unsigned)_accessibilityGetLastMediaRemoteCommand
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_accessibilitySetLastMediaRemoteCommand:(unsigned int)a3
{
  __UIAccessibilitySetAssociatedInt();
}

- (uint64_t)_accessibilityCancelRewindOrFastForward
{
  int v2;
  char v3;
  char v4;

  if (a1)
  {
    v3 = 0;
    v2 = objc_msgSend(a1, "_accessibilityGetLastMediaRemoteCommand");
    if (v2 == 10 || v2 == 8)
    {
      MRMediaRemoteSendCommand();
      v3 = 1;
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityNativeFocusElement
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v6 = -[UIApplicationAccessibility _accessibilityFocusedScreen](self, "_accessibilityFocusedScreen");
  v7[0] = (id)objc_msgSend(v6, "_accessibilityNativeFocusElement");

  if (!v7[0])
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    v4 = (id)objc_msgSend(v5, "windowScene");
    v7[0] = (id)objc_msgSend(v4, "_accessibilityNativeFocusElement");

  }
  v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (id)_accessibilityFocusedScreen
{
  id v2;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13[3];
  id v14;

  v13[2] = self;
  v13[1] = (id)a2;
  v7 = 0;
  v8 = &v7;
  v9 = 838860800;
  v10 = 48;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13[0] = 0;
  AXPerformSafeBlock();
  v4 = (void *)v8[5];
  v5 = 0;
  if (v4)
  {
    v2 = v4;
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = 1;
    v2 = v6;
  }
  v14 = v2;
  if ((v5 & 1) != 0)

  _Block_object_dispose(&v7, 8);
  objc_storeStrong(v13, 0);
  return v14;
}

uint64_t __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(_QWORD *, void *, _BYTE *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a1;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke_2;
  v6 = &unk_24FF3E708;
  v7 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6D38], "_enumerateScreensWithBlock:", &v2);
}

void __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  _BYTE *v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = a3;
  v10[1] = a1;
  v9 = 0;
  objc_opt_class();
  v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_preferredFocusedWindow"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  if (v7)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v10[0]);
    if ((objc_msgSend(v6, "safeBoolForKey:", CFSTR("_isEnabled")) & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), location[0]);
      *v11 = 1;
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v3;
  id obj;
  id location[2];
  UIApplicationAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UIApplicationAccessibility _accessibilityNativeFocusElement](self, "_accessibilityNativeFocusElement");
  if (location[0] != v6)
  {
    obj = (id)objc_msgSend(location[0], "_accessibilityNativeFocusPreferredElement");
    if (obj)
      objc_storeStrong(location, obj);
    objc_storeStrong(&obj, 0);
  }
  if ((objc_msgSend(location[0], "_accessibilityNativeFocusPreferredElementIsValid") & 1) == 0)
    objc_storeStrong(location, 0);
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilityExplorerElements
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8[2];
  UIApplicationAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  objc_msgSend(v8[0], "setLeafNodePredicate:", &__block_literal_global_799);
  v7 = (id)-[UIApplicationAccessibility _accessibilityLeafDescendantsWithOptions:](v9, "_accessibilityLeafDescendantsWithOptions:", v8[0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v7);
    v2 = (id)objc_msgSend(v6, "array");
    v3 = v7;
    v7 = v2;

    objc_storeStrong(&v6, 0);
  }
  v5 = (id)-[UIApplicationAccessibility _accessibilitySortExplorerElements:](v9, "_accessibilitySortExplorerElements:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v5;
}

uint64_t __60__UIApplicationAccessibility__accessibilityExplorerElements__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_isAccessibilityExplorerElement");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityNativeFocusableElements:(id)a3
{
  id v4;
  id location[2];
  UIApplicationAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UIApplicationAccessibility _accessibilityNativeFocusableElements:matchingBlock:](v6, "_accessibilityNativeFocusableElements:matchingBlock:", location[0], 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4
{
  id v6;
  UIApplicationAccessibility *v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(id *, void *);
  void *v13;
  id v14;
  id v15;
  id location[2];
  UIApplicationAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v7 = v17;
  v6 = location[0];
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __84__UIApplicationAccessibility__accessibilityNativeFocusableElements_withQueryString___block_invoke;
  v13 = &unk_24FF3E2D0;
  v14 = v15;
  v8 = -[UIApplicationAccessibility _accessibilityNativeFocusableElements:matchingBlock:](v7, "_accessibilityNativeFocusableElements:matchingBlock:", v6);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v8;
}

uint64_t __84__UIApplicationAccessibility__accessibilityNativeFocusableElements_withQueryString___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v13;
  _QWORD __b[8];
  id v15;
  id *v16;
  id location[2];
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16 = a1;
  if (objc_msgSend(a1[4], "length"))
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location[0], "_accessibilityAXAttributedUserInputLabelsIncludingFallbacks");
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    if (v11)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v11;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(obj);
        v15 = *(id *)(__b[1] + 8 * v8);
        v4 = (id)objc_msgSend(v15, "localizedLowercaseString");
        v3 = (id)objc_msgSend(a1[4], "localizedLowercaseString");
        v5 = objc_msgSend(v4, "containsString:");

        if ((v5 & 1) != 0)
          break;
        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
          if (!v9)
            goto LABEL_10;
        }
      }
      v18 = 1;
      v13 = 1;
    }
    else
    {
LABEL_10:
      v13 = 0;
    }

    if (!v13)
      v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4
{
  id v6;
  id v7;
  id location[2];
  UIApplicationAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[UIApplicationAccessibility _accessibilityNativeFocusableElements:matchingBlock:forExistenceCheckOnly:](v9, "_accessibilityNativeFocusableElements:matchingBlock:forExistenceCheckOnly:", location[0], v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4 forExistenceCheckOnly:(BOOL)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(_QWORD *, void *);
  void *v17;
  id v18;
  id v19;
  char v20;
  id v21;
  BOOL v22;
  id v23;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = a5;
  v20 = 0;
  if (location[0])
  {
    objc_storeStrong(location, location[0]);
  }
  else
  {
    v21 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v20 = 1;
    objc_storeStrong(location, v21);
  }
  if ((v20 & 1) != 0)

  v19 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultFullKeyboardAccessOptions");
  v9 = v19;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __104__UIApplicationAccessibility__accessibilityNativeFocusableElements_matchingBlock_forExistenceCheckOnly___block_invoke;
  v17 = &unk_24FF3E440;
  v18 = v23;
  objc_msgSend(v9, "setLeafNodePredicate:", &v13);
  v12 = 0;
  if (v22)
    v5 = (id)objc_msgSend(location[0], "_accessibilityLeafDescendantsWithCount:options:", 1, v19);
  else
    v5 = (id)objc_msgSend(location[0], "_accessibilityLeafDescendantsWithOptions:", v19);
  v6 = v12;
  v12 = v5;

  v8 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v8;
}

uint64_t __104__UIApplicationAccessibility__accessibilityNativeFocusableElements_matchingBlock_forExistenceCheckOnly___block_invoke(_QWORD *a1, void *a2)
{
  char v3;
  id location[2];
  char v6;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "_accessibilityCanBecomeNativeFocused") & 1) != 0)
  {
    v3 = 1;
    if (a1[4])
      v3 = (*(uint64_t (**)(void))(a1[4] + 16))();
    v6 = v3 & 1;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilityShowEditingHUD
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  if ((AXDeviceIsPad() & 1) != 0)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v2 = (id)objc_msgSend(v3, "_accessibilityMainWindow");
    v8[0] = (id)objc_msgSend(v2, "windowScene");

    v7 = (id)objc_msgSend(MEMORY[0x24BDF6EA0], "activeTextEffectsWindowForWindowScene:", v8[0]);
    v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_editingOverlayViewController"));
    v5 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("undoInteraction"));
    v4 = v5;
    AXPerformSafeBlock();
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(v8, 0);
  }
}

uint64_t __58__UIApplicationAccessibility__accessibilityShowEditingHUD__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoInteractiveHUDVisibility:", 1, a1, a1);
}

- (BOOL)_accessibilityApplicationIsModal
{
  return 0;
}

- (id)accessibilityElements
{
  objc_super v3;
  SEL v4;
  UIApplicationAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationAccessibility;
  return -[UIApplicationAccessibility accessibilityElements](&v3, sel_accessibilityElements);
}

@end
