@implementation UIWindowSceneAccessibility

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  SEL v10;
  UIWindowSceneAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8 = 0;
  v7 = (id)__UIAccessibilitySafeClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v3 = (id)objc_msgSend(v6, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v9 = v4;
  v5 = 0;
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v5 = 0;
    if (v9 != 3)
      return v9 != 2;
  }
  return v5;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWindowScene");
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
  const char *v9;
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
  v12 = "@";
  v3 = CFSTR("UIWindowScene");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_invalidate"), 0);
  v4 = CFSTR("UIWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_installFocusEventRecognizer"), v9, 0);
  v5 = CFSTR("_UIFocusEventRecognizer");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("owningView"), v12, 0);
  v10 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_didRecognizeFocusMovementRequest:"), v12, 0);
  v6 = CFSTR("_UIFocusSearchInfo");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("initWithFocusEvaluator:"), v12, "@?", 0);
  v8 = CFSTR("_UIFocusMovementRequest");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("initWithFocusSystem:"), v12, 0);
  v7 = CFSTR("UIFocusSystem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_enableWithoutFocusRestoration"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_updateFocusImmediatelyToEnvironment:"), v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("setMovementInfo:"), v9, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("setSearchInfo:"), v9, v12, 0);
  v11 = CFSTR("_UIFocusMovementInfo");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:"), v12, "Q", "Q", v10, v10, v10, "q", 0);
  objc_storeStrong(v14, v13);
}

- (id)_accessibilityFocusSystem
{
  id v3;
  id v4;

  v3 = (id)-[UIWindowSceneAccessibility _focusSystemSceneComponent](self, "_focusSystemSceneComponent");
  v4 = (id)objc_msgSend(v3, "focusSystem");

  return v4;
}

- (id)_accessibilityNativeFocusElement
{
  id v3;
  id v4;

  v3 = -[UIWindowSceneAccessibility _accessibilityFocusSystem](self, "_accessibilityFocusSystem");
  v4 = (id)objc_msgSend(v3, "focusedItem");

  return v4;
}

- (unsigned)_accessibilityContextId
{
  id v3;
  unsigned int v4;

  v3 = (id)-[UIWindowSceneAccessibility keyWindow](self, "keyWindow");
  v4 = objc_msgSend(v3, "_accessibilityContextId");

  return v4;
}

- (id)_accessibilityWindowScene
{
  return self;
}

- (id)accessibilityIdentifier
{
  return -[UIWindowSceneAccessibility _accessibilityWindowSceneIdentifier](self, "_accessibilityWindowSceneIdentifier", a2, self);
}

- (id)_accessibilityWindowSceneIdentifier
{
  return (id)-[UIWindowSceneAccessibility _sceneIdentifier](self, "_sceneIdentifier", a2, self);
}

- (id)_accessibilityFBSceneIdentifier
{
  id v3;
  id v4;

  v3 = (id)-[UIWindowSceneAccessibility _FBSScene](self, "_FBSScene");
  v4 = (id)objc_msgSend(v3, "identifier");

  return v4;
}

- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3
{
  id v3;
  UIWindowSceneAccessibility *v4;
  BOOL v5;
  os_log_type_t v6;
  id location;
  BOOL v8;
  SEL v9;
  UIWindowSceneAccessibility *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = a3;
  location = (id)AXLogFocusEngine();
  v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)v3, (uint64_t)v10);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, v6, "Setting focus %@ in scene %@", v11, 0x16u);

  }
  objc_storeStrong(&location, 0);
  v4 = v10;
  v5 = v8;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v4, 0);
}

void __73__UIWindowSceneAccessibility__accessibilitySetFocusEnabledInApplication___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  objc_msgSend(v2, "_setEnabled:", *(_BYTE *)(a1 + 40) & 1);

}

- (void)_accessibilityDidFocusOnApplication
{
  NSObject *log;
  os_log_type_t type;
  UIWindowSceneAccessibility *v4;
  uint8_t v5[15];
  char v6;
  id location;
  id v8[2];
  UIWindowSceneAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[UIWindowSceneAccessibility _accessibilityNativeFocusElement](self, "_accessibilityNativeFocusElement");
  if (!v8[0])
  {
    location = (id)FKALogCommon();
    v6 = 1;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      log = location;
      type = v6;
      __os_log_helper_16_0_0(v5);
      _os_log_impl(&dword_230C4A000, log, type, "Manually poking focus system in AssistiveTouch because no focused item was found.", v5, 2u);
    }
    objc_storeStrong(&location, 0);
    v4 = v9;
    AXPerformSafeBlock();
    -[UIWindowSceneAccessibility _accessibilityMoveFocusWithHeading:](v9, "_accessibilityMoveFocusWithHeading:", 16);
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(v8, 0);
}

void __65__UIWindowSceneAccessibility__accessibilityDidFocusOnApplication__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  objc_msgSend(v1, "_enableWithoutFocusRestoration");

}

- (BOOL)_accessibilitySafeMoveInDirection:(unint64_t)a3 byGroup:(BOOL)a4 withSearchInfo:(id)a5
{
  char v6;
  UIWindowSceneAccessibility *v7;
  id v8[3];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  char v14;
  id location;
  BOOL v16;
  void *v17;
  SEL v18;
  UIWindowSceneAccessibility *v19;

  v19 = self;
  v18 = a2;
  v17 = (void *)a3;
  v16 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v10 = 0;
  v11 = &v10;
  v12 = 0x20000000;
  v13 = 32;
  v14 = 0;
  v7 = v19;
  v9 = v16;
  v8[2] = v17;
  v8[0] = location;
  v8[1] = &v10;
  AXPerformSafeBlock();
  v6 = *((_BYTE *)v11 + 24);
  objc_storeStrong(v8, 0);
  objc_storeStrong((id *)&v7, 0);
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

void __87__UIWindowSceneAccessibility__accessibilitySafeMoveInDirection_byGroup_withSearchInfo___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  id v23[3];

  v23[2] = (id)a1;
  v23[1] = (id)a1;
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "keyWindow");
  v21 = 0;
  v19 = 0;
  if (v10)
  {
    v1 = v10;
  }
  else
  {
    v8 = (void *)*MEMORY[0x24BDF74F8];
    v22 = (id)objc_msgSend(*(id *)(a1 + 32), "screen");
    v21 = 1;
    v20 = (id)objc_msgSend(v8, "_keyWindowForScreen:");
    v19 = 1;
    v1 = v20;
  }
  v23[0] = v1;
  if ((v19 & 1) != 0)

  if ((v21 & 1) != 0)
  v18 = (id)objc_msgSend(v23[0], "safeValueForKey:", CFSTR("_focusEventRecognizer"));
  v17 = 0;
  v2 = 2;
  if ((*(_BYTE *)(a1 + 64) & 1) == 0)
    v2 = 0;
  v17 = v2;
  v16 = 0;
  v16 = (*(_BYTE *)(a1 + 64) ^ 1) & 1;
  v14 = 0;
  objc_opt_class();
  v7 = (id)objc_msgSend(v18, "safeValueForKey:", CFSTR("_focusMovementSystem"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = v12;
  v3 = objc_alloc(NSClassFromString(CFSTR("_UIFocusMovementRequest")));
  v11 = (id)objc_msgSend(v3, "initWithFocusSystem:", v15);
  v5 = v11;
  v4 = objc_alloc(NSClassFromString(CFSTR("_UIFocusMovementInfo")));
  v6 = (id)objc_msgSend(v4, "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:", *(_QWORD *)(a1 + 56), 0, 1, v16 & 1, 0, v17);
  objc_msgSend(v5, "setMovementInfo:");

  objc_msgSend(v11, "setSearchInfo:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v18, "_didRecognizeFocusMovementRequest:", v11) & 1;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v23, 0);
}

- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  BOOL v5;
  UIWindowSceneAccessibility *v6;
  BOOL v7;
  unint64_t v8;
  SEL v9;
  UIWindowSceneAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = self;
  AXPerformSafeBlock();
  v5 = -[UIWindowSceneAccessibility _accessibilityMoveFocusWithHeading:byGroup:](v10, "_accessibilityMoveFocusWithHeading:byGroup:", v8, v7);
  objc_storeStrong((id *)&v6, 0);
  return v5;
}

void __87__UIWindowSceneAccessibility__accessibilityFocusContainerMoveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  objc_msgSend(v1, "_enableWithoutFocusRestoration");

}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  char v5;
  char v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18;
  BOOL v19;
  char v20;
  id v21;
  os_log_type_t v22;
  id location;
  BOOL v24;
  unint64_t v25;
  SEL v26;
  UIWindowSceneAccessibility *v27;
  uint8_t v28[40];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  location = (id)AXLogFocusEngine();
  v22 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v28, (uint64_t)v8, (uint64_t)v7, (uint64_t)v27);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, v22, "Moving focus with heading: %@, byGroup: %@, in scene: %@", v28, 0x20u);

  }
  objc_storeStrong(&location, 0);
  v21 = -[UIWindowSceneAccessibility _accessibilityNativeFocusElement](v27, "_accessibilityNativeFocusElement");
  v20 = objc_msgSend(v21, "_accessibilityMoveFocusWithHeading:", v25) & 1;
  if (!v20)
  {
    v19 = (v25 & 0x300) != 0;
    v11 = 0;
    v12 = &v11;
    v13 = 838860800;
    v14 = 48;
    v15 = __Block_byref_object_copy__2;
    v16 = __Block_byref_object_dispose__2;
    v17 = 0;
    AXPerformSafeBlock();
    v10 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
    objc_storeStrong(&v17, 0);
    v18 = v10;
    v9 = (v25 & 0xF) != 0;
    objc_msgSend(v10, "setForceFocusToLeaveContainer:", (v25 & 0xF) == 0);
    v6 = 1;
    if (!v9)
      v6 = v19;
    objc_msgSend(v18, "setTreatFocusableItemAsLeaf:", v6 & 1);
    v20 = -[UIWindowSceneAccessibility _accessibilitySafeMoveInDirection:byGroup:withSearchInfo:](v27, "_accessibilitySafeMoveInDirection:byGroup:withSearchInfo:", v25, v24, v18);
    objc_storeStrong(&v18, 0);
  }
  v5 = v20;
  objc_storeStrong(&v21, 0);
  return v5 & 1;
}

void __73__UIWindowSceneAccessibility__accessibilityMoveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("_UIFocusSearchInfo"))), "initWithFocusEvaluator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  BOOL v5;
  UIWindowSceneAccessibility *v6;
  id location;
  unint64_t v8;
  SEL v9;
  UIWindowSceneAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v6 = v10;
  AXPerformSafeBlock();
  v5 = -[UIWindowSceneAccessibility _accessibilityMoveFocusWithHeading:toElementMatchingQuery:](v10, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", v8, location);
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

void __102__UIWindowSceneAccessibility__accessibilityFocusContainerMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  objc_msgSend(v1, "_enableWithoutFocusRestoration");

}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v5;
  char v6;
  char v7;
  UIWindowSceneAccessibility *v8;
  id location;
  unint64_t v10;
  SEL v11;
  UIWindowSceneAccessibility *v12;
  char v13;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v8 = v12;
  AXPerformSafeBlock();
  if ((v10 & 0x300) == 0 || -[UIWindowSceneAccessibility _accessibilityResetAndClearNativeFocusSystem](v12))
  {
    v5 = -[UIWindowSceneAccessibility _accessibilityNativeFocusElement](v12, "_accessibilityNativeFocusElement");
    v6 = objc_msgSend(v5, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", v10, location);

    v7 = v6 & 1;
    if ((v6 & 1) == 0)
      v7 = -[UIWindowSceneAccessibility _accessibilityMoveAppFocusForElementMatchingQuery:heading:](v12, "_accessibilityMoveAppFocusForElementMatchingQuery:heading:", location, v10);
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(&location, 0);
  return v13 & 1;
}

void __88__UIWindowSceneAccessibility__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  objc_msgSend(v1, "_enableWithoutFocusRestoration");

}

- (BOOL)_accessibilityResetAndClearNativeFocusSystem
{
  BOOL v2;
  id v3;
  char v4;
  id v5;
  id location;
  os_log_type_t type;
  os_log_t oslog[4];
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = a1;
  if (a1)
  {
    v19 = (id)objc_msgSend(v20, "_accessibilityFocusSystem");
    v14 = 0;
    v15 = &v14;
    v16 = 0x20000000;
    v17 = 32;
    v18 = 0;
    oslog[3] = (os_log_t)MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __74__UIWindowSceneAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke;
    v12 = &unk_24FF3DE88;
    v13[1] = &v14;
    v13[0] = v19;
    AXPerformSafeBlock();
    oslog[0] = (os_log_t)(id)AXLogFocusEngine();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      v3 = (id)NSStringFromBOOL();
      location = v3;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)location, (uint64_t)v20);
      _os_log_debug_impl(&dword_230C4A000, oslog[0], type, "reset and clear focus system: %@ windowScene: %@", v22, 0x16u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    v4 = 0;
    v2 = 1;
    if ((v15[3] & 1) == 0)
    {
      v5 = (id)objc_msgSend(v19, "focusedItem");
      v4 = 1;
      v2 = v5 == 0;
    }
    v21 = v2;
    if ((v4 & 1) != 0)

    objc_storeStrong(v13, 0);
    _Block_object_dispose(&v14, 8);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    return 0;
  }
  return v21;
}

- (BOOL)_accessibilityMoveAppFocusForElementMatchingQuery:(id)a3 heading:(unint64_t)a4
{
  BOOL v5;
  id v7;
  id v8[2];
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id v16;
  unint64_t v17;
  id location[2];
  UIWindowSceneAccessibility *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 838860800;
  v12 = 48;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v8[1] = &v9;
  v8[0] = location[0];
  AXPerformSafeBlock();
  v7 = (id)v10[5];
  objc_storeStrong(v8, 0);
  _Block_object_dispose(&v9, 8);
  objc_storeStrong(&v15, 0);
  v16 = v7;
  objc_msgSend(v7, "setForceFocusToLeaveContainer:", 1);
  objc_msgSend(v16, "setTreatFocusableItemAsLeaf:", 0);
  v5 = -[UIWindowSceneAccessibility _accessibilitySafeMoveInDirection:byGroup:withSearchInfo:](v19, "_accessibilitySafeMoveInDirection:byGroup:withSearchInfo:", v17, 0, v16);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v5;
}

void __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(id *, void *);
  void *v10;
  id v11[3];

  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v4 = objc_alloc(NSClassFromString(CFSTR("_UIFocusSearchInfo")));
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke_2;
  v10 = &unk_24FF3DE60;
  v11[0] = *(id *)(a1 + 32);
  v1 = objc_msgSend(v4, "initWithFocusEvaluator:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  objc_storeStrong(v11, 0);
}

uint64_t __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v12;
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
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(location[0], "_accessibilityAXAttributedUserInputLabelsIncludingFallbacks");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v12)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v12;
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
          goto LABEL_9;
      }
    }
    v18 = 1;
    v13 = 1;
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  if (!v13)
    v18 = 0;
  objc_storeStrong(location, 0);
  return v18 & 1;
}

void __74__UIWindowSceneAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(v1, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v1, "_updateFocusWithContext:report:") & 1;

}

- (uint64_t)_accessibilityUpdateNativeFocusImmediately
{
  id v2;
  id location;
  os_log_type_t type;
  os_log_t oslog[4];
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  id v16;
  char v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x20000000;
    v14 = 32;
    v15 = 0;
    oslog[3] = (os_log_t)MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __72__UIWindowSceneAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke;
    v9 = &unk_24FF3DE88;
    v10[1] = &v11;
    v10[0] = v16;
    AXPerformSafeBlock();
    oslog[0] = (os_log_t)(id)AXLogFocusEngine();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      v2 = (id)NSStringFromBOOL();
      location = v2;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v18, (uint64_t)location, (uint64_t)v16);
      _os_log_debug_impl(&dword_230C4A000, oslog[0], type, "did update native focus system: %@ windowScene: %@", v18, 0x16u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    v17 = v12[3] & 1;
    objc_storeStrong(v10, 0);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

void __72__UIWindowSceneAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusSystem");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_updateFocusImmediatelyToEnvironment:", 0) & 1;

}

- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4
{
  id v6;
  id v7;
  id location[2];
  UIWindowSceneAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusableElements:withQueryString:", v9, v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)_accessibilityIsSecure
{
  return 0;
}

@end
