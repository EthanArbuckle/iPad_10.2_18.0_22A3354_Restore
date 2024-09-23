@implementation UIWindowAccessibility

- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7
{
  id v7;
  id v8;
  id v9;
  id v11;
  uint64_t v12;
  objc_super v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  id location;
  double v25;
  int64_t v26;
  SEL v27;
  UIWindowAccessibility *v28;
  CGPoint v29;

  v29 = a4;
  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v23 = 0;
  objc_storeStrong(&v23, a7);
  v22 = 0;
  v21 = 0;
  v20 = 0;
  objc_opt_class();
  v19 = (id)__UIAccessibilityCastAsClass();
  v18 = v19;
  objc_storeStrong(&v19, 0);
  v12 = objc_msgSend(v18, "_hidEvent");

  v21 = v12;
  if (v12 && IOHIDEventGetSenderID() == 0x8000000817319380)
  {
    v17 = 0;
    objc_opt_class();
    v16 = (id)__UIAccessibilityCastAsClass();
    v15 = v16;
    objc_storeStrong(&v16, 0);
    v7 = v22;
    v22 = v15;

  }
  if (!v22)
  {
    v14.receiver = v28;
    v14.super_class = (Class)UIWindowAccessibility;
    v8 = -[UIWindowAccessibility _targetWindowForPathIndex:atPoint:scenePointZ:forEvent:windowServerHitTestWindow:](&v14, sel__targetWindowForPathIndex_atPoint_scenePointZ_forEvent_windowServerHitTestWindow_, v26, location, v23, v29.x, v29.y, v25);
    v9 = v22;
    v22 = v8;

  }
  v11 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;
  double x;
  double y;
  objc_super v7;
  SEL v8;
  UIWindowAccessibility *v9;
  CGPoint v10;
  CGPoint v11;
  CGPoint result;

  v10 = a3;
  v9 = self;
  v8 = a2;
  if ((axShouldDisableHitpointWarping() & 1) != 0)
  {
    v11 = v10;
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)UIWindowAccessibility;
    -[UIWindowAccessibility warpPoint:](&v7, sel_warpPoint_, v10);
    v11.x = v3;
    v11.y = v4;
  }
  y = v11.y;
  x = v11.x;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_orderFrontWithoutMakingKey
{
  UIWindowAccessibility *v2;
  id v3;
  BOOL v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  UIWindowAccessibility *v8;

  v8 = self;
  v7 = a2;
  v3 = (id)-[UIWindowAccessibility windowScene](self, "windowScene");
  v2 = (UIWindowAccessibility *)(id)objc_msgSend(v3, "keyWindow");
  v4 = v2 == v8;

  v6 = v4;
  v5.receiver = v8;
  v5.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility _orderFrontWithoutMakingKey](&v5, sel__orderFrontWithoutMakingKey);
  if (-[UIWindowAccessibility _axShouldPostScreenChangeOnOrderFront:](v8, "_axShouldPostScreenChangeOnOrderFront:", v6))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)_axShouldPostScreenChangeOnOrderFront:(BOOL)a3
{
  double v3;
  char isKindOfClass;
  BOOL v6;

  v6 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
    return 0;
  -[UIWindowAccessibility windowLevel](self, "windowLevel");
  isKindOfClass = 1;
  if (v3 != 15000001.0)
  {
    NSClassFromString(CFSTR("_UISnapshotWindow"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((isKindOfClass & 1) != 0)
    return 0;
  if (v6)
    return 0;
  if ((-[UIWindowAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")) & 1) == 0)
    return 0;
  NSClassFromString(CFSTR("SBHUDWindow"));
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (void)makeKeyAndVisible
{
  id v2;
  id v3;
  char v4;
  id v5;
  id v6;
  char v7;
  id v8;
  objc_super v10;
  SEL v11;
  UIWindowAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility makeKeyAndVisible](&v10, sel_makeKeyAndVisible);
  v3 = (id)objc_opt_new();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  if ((v4 & 1) != 0)
  {
    if (NSClassFromString(CFSTR("SRSecureWindow")))
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = 0;
        objc_opt_class();
        v6 = (id)__UIAccessibilityCastAsClass();
        v5 = v6;
        objc_storeStrong(&v6, 0);
        v8 = v5;
        v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        objc_msgSend(v5, "setBackgroundColor:");

        objc_storeStrong(&v8, 0);
      }
    }
  }
}

- (void)_setFirstResponder:(id)a3
{
  id v3;
  id v4;
  id v5;
  UIWindowAccessibility *v6;
  id v7;
  id v8;
  BOOL v9;
  NSObject *log;
  os_log_type_t type;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *);
  void *v16;
  id v17;
  int v18;
  id v19;
  char v20;
  id v21;
  objc_super v22;
  id location[2];
  UIWindowAccessibility *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22.receiver = v24;
  v22.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility _setFirstResponder:](&v22, sel__setFirstResponder_, location[0]);
  if ((objc_msgSend(location[0], "accessibilityElementsHidden") & 1) != 0)
  {
    v21 = (id)AXLogCommon();
    v20 = 1;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
      log = v21;
      type = v20;
      v19 = (id)objc_opt_class();
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v19);
      _os_log_impl(&dword_230C4A000, log, type, "Accessibility ignoring responder change for hidden element: %@", v25, 0xCu);
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    v18 = 1;
  }
  else
  {
    if (location[0])
    {
      v3 = -[UIWindowAccessibility _accessibilityFirstResponderCoalesceTimer](v24);
      v9 = v3 != 0;

      if (!v9)
      {
        v6 = v24;
        v5 = objc_alloc(MEMORY[0x24BDFE490]);
        v8 = MEMORY[0x24BDAC9B8];
        v7 = (id)objc_msgSend(v5, "initWithTargetSerialQueue:");
        -[UIWindowAccessibility _accessibilitySetFirstResponderCoalesceTimer:]((uint64_t)v6, v7);

      }
      v4 = -[UIWindowAccessibility _accessibilityFirstResponderCoalesceTimer](v24);
      v12 = MEMORY[0x24BDAC760];
      v13 = -1073741824;
      v14 = 0;
      v15 = __44__UIWindowAccessibility__setFirstResponder___block_invoke;
      v16 = &unk_24FF3DA40;
      v17 = location[0];
      objc_msgSend(v4, "afterDelay:processBlock:", &v12, 0.1);

      objc_storeStrong(&v17, 0);
    }
    v18 = 0;
  }
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityAllRemoteElements
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIWindow___accessibilityAllRemoteElements);
  else
    return 0;
}

- (void)_accessibilitySetAllRemoteElements:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  const __CFString *v10;
  const char *v11;
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
  v9 = CFSTR("UIWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v12 = "@";
  v11 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_initWithFrame: debugName: scene: attached:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("initWithWindowScene:"), v12, 0);
  v3 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_windowInterfaceOrientation"), 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UISnapshotWindow"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_shouldCreateContextAsSecure"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_isTransparentFocusRegion"), v11, 0);
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_setBoundContext:"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_targetWindowForPathIndex:atPoint:scenePointZ:forEvent:windowServerHitTestWindow:"), v3, "{CGPoint=dd}", "d", v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_isSecure"), v11, 0);
  v4 = CFSTR("RBSProcessIdentity");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("identityOfCurrentProcess"), v12, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIKeyboardWindowScene"));
  v7 = CFSTR("UIScene");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIWindowScene"));
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v7, CFSTR("_scenesIncludingInternal:"), v12, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_FBSScene"), v12, 0);
  v5 = CFSTR("FBSScene");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("identifier"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSProcess"), CFSTR("pid"), "i", 0);
  v6 = CFSTR("UILayoutContainerView");
  v10 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISplitViewControllerPanelImplView"), v6);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_focusSystemSceneComponent"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_sceneComponentForKey:"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSystemSceneComponent"), CFSTR("_focusBehaviorDidChange:"), v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("FBSSceneDefinition"), CFSTR("identity"), v12);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("FBSSceneIdentity"), CFSTR("workspaceIdentifier"), v12);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("makeKeyAndVisible"), v8, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v9, v10);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_isEligibleForFocusInteraction"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_isEligibleForFocusOcclusion"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_prefersFocusContainment"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplicationAccessibility"), CFSTR("_accessibilityUIAppFocusedOnContinuityDisplay"), v12, 0);
  objc_storeStrong(v14, v13);
}

- (unint64_t)_accessibilityAutomationType
{
  return 2;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (UIWindowAccessibility)initWithWindowScene:(id)a3
{
  UIWindowAccessibility *v3;
  UIWindowAccessibility *v5;
  objc_super v6;
  UIWindowAccessibility *v7;
  id location[2];
  UIWindowAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)UIWindowAccessibility;
  v9 = -[UIWindowAccessibility initWithWindowScene:](&v6, sel_initWithWindowScene_, location[0]);
  v7 = v9;
  -[UIWindowAccessibility _axListenForRemoteElement](v9);
  v5 = v7;
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)_axListenForRemoteElement
{
  id v1;
  id location;
  id v3;

  v3 = a1;
  if (a1)
  {
    location = CFSTR("_axRegisteredForRemoteElement");
    if ((objc_msgSend(v3, "_accessibilityBoolValueForKey:", location) & 1) == 0)
    {
      objc_msgSend(v3, "_axCheckForExistingRemoteElements");
      v1 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v1, "addObserver:selector:name:object:", v3, sel__axRemoteElementRegistered_, CFSTR("ax_remote_element_registered"), 0);

      objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, location);
    }
    objc_storeStrong(&location, 0);
  }
}

- (UIWindowAccessibility)initWithFrame:(CGRect)a3
{
  UIWindowAccessibility *v4;
  objc_super v5;
  id v6[2];
  UIWindowAccessibility *v7;
  CGRect v8;

  v8 = a3;
  v6[1] = (id)a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIWindowAccessibility;
  v7 = -[UIWindowAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  -[UIWindowAccessibility _axListenForRemoteElement](v7);
  v4 = (UIWindowAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  double v5;
  double v6;
  BOOL v8;
  BOOL v9;
  objc_super v10;
  CGPoint v11;
  int v12;
  id v13;
  id *v14;
  char v15;
  uint64_t v16;
  int v17;
  int v18;
  BOOL (*v19)(uint64_t);
  void *v20;
  UIWindowAccessibility *v21;
  char v22;
  id location[2];
  UIWindowAccessibility *v24;
  CGPoint v25;
  id v26;

  v25 = a3;
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v22 = -[UIWindowAccessibility _accessibilityBoolValueForKey:](v24, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v15 = 0;
  v9 = 0;
  if (!v22)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v20 = &unk_24FF3E0C0;
    v21 = v24;
    v15 = 1;
    v14 = (id *)&v21;
    v9 = v19((uint64_t)&v16);
  }
  if (v9)
  {
    -[UIWindowAccessibility _accessibilitySetBoolValue:forKey:](v24, "_accessibilitySetBoolValue:forKey:", 1);
    v13 = (id)-[UIWindowAccessibility accessibilityHitTest:withEvent:](v24, "accessibilityHitTest:withEvent:", location[0], v25);
    -[UIWindowAccessibility _accessibilitySetBoolValue:forKey:](v24, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v26 = v13;
    v12 = 1;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v12 = 0;
  }
  if ((v15 & 1) != 0)
    objc_storeStrong(v14, 0);
  if (!v12)
  {
    v4 = (id)-[UIWindowAccessibility windowScene](v24, "windowScene");
    v8 = v4 != 0;

    if (v8)
    {
      -[UIWindowAccessibility warpPoint:](v24, "warpPoint:", v25);
      v11.x = v5;
      v11.y = v6;
      v25 = v11;
      v10.receiver = v24;
      v10.super_class = (Class)UIWindowAccessibility;
      v26 = -[UIWindowAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, location[0], v5, v6);
    }
    else
    {
      v26 = 0;
    }
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v26;
}

BOOL __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kAXWindowFocusSystemSceneComponentKey_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_52);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kAXWindowFocusSystemSceneComponentKey_block_invoke_BaseImplementation;
}

void __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    kAXWindowFocusSystemSceneComponentKey_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityRemoteElement
{
  id v2;
  char v4;
  id v5;
  char v6;
  id v7;
  void *v9;

  v6 = 0;
  v4 = 0;
  if ((-[UIWindowAccessibility _accessibilityShouldUseRemoteElement](self) & 1) != 0)
  {
    v7 = -[UIWindowAccessibility _accessibilityAllRemoteElements](self);
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "lastObject");
    v4 = 1;
    v2 = v5;
  }
  else
  {
    v2 = 0;
  }
  v9 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  return v9;
}

- (uint64_t)_accessibilityShouldUseRemoteElement
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  v10 = a1;
  if (a1)
  {
    v9 = v10;
    v8 = (id)objc_msgSend(v9, "windowScene");
    v6 = 0;
    objc_opt_class();
    v2 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_FBSScene"));
    v5 = (id)__UIAccessibilityCastAsClass();

    v4 = v5;
    objc_storeStrong(&v5, 0);
    v7 = v4;
    v3 = (id)objc_msgSend(v4, "safeStringForKey:", CFSTR("identifier"));
    if ((objc_msgSend(v3, "containsString:", *MEMORY[0x24BDFE078]) & 1) != 0)
      v11 = objc_msgSend(v7, "accessibilitySceneIsCallServiceBanner") & 1;
    else
      v11 = 1;
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (id)_accessibilityUserTestingParent
{
  id v2;
  BOOL v4;

  v2 = -[UIWindowAccessibility _accessibilityRemoteElement](self, "_accessibilityRemoteElement");
  v4 = v2 == 0;

  if (v4)
    return (id)*MEMORY[0x24BDF74F8];
  else
    return -[UIWindowAccessibility _accessibilityRemoteElement](self, "_accessibilityRemoteElement");
}

- (id)accessibilityContainer
{
  objc_super v3;
  int v4;
  id location[2];
  UIWindowAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UIWindowAccessibility _accessibilityRemoteElement](self, "_accessibilityRemoteElement");
  if (location[0])
  {
    v7 = location[0];
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UIWindowAccessibility;
    v7 = -[UIWindowAccessibility accessibilityContainer](&v3, sel_accessibilityContainer);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityWindowSections
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(id *, void *);
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;
  id v43;
  uint64_t v44;
  int v45;
  int v46;
  void (*v47)(id *, void *);
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  id v63;
  uint64_t v64;
  int v65;
  int v66;
  void (*v67)(id *, void *);
  void *v68;
  id v69;
  id v70;
  id v71;
  char v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  char v79;
  id v80[2];
  UIWindowAccessibility *v81;

  v81 = self;
  v80[1] = (id)a2;
  v79 = 0;
  objc_opt_class();
  v31 = (id)-[UIWindowAccessibility safeValueForKey:](v81, "safeValueForKey:", CFSTR("rootViewController"));
  v78 = (id)__UIAccessibilityCastAsClass();

  v77 = v78;
  objc_storeStrong(&v78, 0);
  v80[0] = v77;
  v76 = (id)objc_opt_new();
  v75 = (id)objc_opt_new();
  objc_msgSend(v75, "axSafelyAddObject:", v80[0]);
  while (objc_msgSend(v75, "count"))
  {
    v74 = (id)objc_msgSend(v75, "ax_dequeueObject");
    v2 = (id)objc_msgSend(v74, "presentedViewController");
    v30 = v2 == 0;

    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = 0;
        objc_opt_class();
        v71 = (id)__UIAccessibilityCastAsClass();
        if ((v72 & 1) != 0)
          abort();
        v70 = v71;
        objc_storeStrong(&v71, 0);
        v73 = v70;
        v27 = (id)objc_msgSend(v70, "viewControllers");
        v64 = MEMORY[0x24BDAC760];
        v65 = -1073741824;
        v66 = 0;
        v67 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke;
        v68 = &unk_24FF40068;
        v69 = v75;
        objc_msgSend(v27, "enumerateObjectsUsingBlock:", &v64);

        objc_storeStrong(&v69, 0);
        objc_storeStrong(&v73, 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = 0;
          objc_opt_class();
          v61 = (id)__UIAccessibilityCastAsClass();
          if ((v62 & 1) != 0)
            abort();
          v60 = v61;
          objc_storeStrong(&v61, 0);
          v63 = v60;
          v25 = (id)objc_msgSend(v60, "toolbar");
          v26 = objc_msgSend(v25, "_accessibilityViewIsVisible");

          if ((v26 & 1) != 0)
          {
            v23 = v76;
            v24 = (id)objc_msgSend(v63, "toolbar");
            objc_msgSend(v23, "axSafelyAddObject:");

          }
          v21 = (id)objc_msgSend(v63, "navigationBar");
          v22 = objc_msgSend(v21, "_accessibilityViewIsVisible");

          if ((v22 & 1) != 0)
          {
            v59 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptionsHonoringGroups");
            v58 = (id)objc_msgSend(v59, "leafNodePredicate");
            v19 = MEMORY[0x24BDAC760];
            v51 = MEMORY[0x24BDAC760];
            v52 = -1073741824;
            v53 = 0;
            v54 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_2;
            v55 = &unk_24FF40090;
            v56 = v63;
            v57 = v58;
            objc_msgSend(v59, "setLeafNodePredicate:", &v51);
            v18 = (id)objc_msgSend(v63, "navigationBar");
            v50 = (id)objc_msgSend(v18, "_accessibilityLeafDescendantsWithOptions:", v59);

            v20 = v50;
            v44 = v19;
            v45 = -1073741824;
            v46 = 0;
            v47 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_3;
            v48 = &unk_24FF3E490;
            v49 = v76;
            objc_msgSend(v20, "enumerateObjectsWithOptions:usingBlock:", 2, &v44);
            objc_storeStrong(&v49, 0);
            objc_storeStrong(&v50, 0);
            objc_storeStrong(&v57, 0);
            objc_storeStrong(&v56, 0);
            objc_storeStrong(&v58, 0);
            objc_storeStrong(&v59, 0);
          }
          v16 = v75;
          v17 = (id)objc_msgSend(v63, "topViewController");
          objc_msgSend(v16, "ax_enqueueObject:");

          objc_storeStrong(&v63, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = 0;
            objc_opt_class();
            v41 = (id)__UIAccessibilityCastAsClass();
            if ((v42 & 1) != 0)
              abort();
            v40 = v41;
            objc_storeStrong(&v41, 0);
            v43 = v40;
            v14 = (id)objc_msgSend(v40, "tabBar");
            v15 = objc_msgSend(v14, "_accessibilityViewIsVisible");

            if ((v15 & 1) != 0)
            {
              v12 = v76;
              v13 = (id)objc_msgSend(v43, "tabBar");
              objc_msgSend(v12, "axSafelyAddObject:");

            }
            v10 = v75;
            v11 = (id)objc_msgSend(v43, "selectedViewController");
            objc_msgSend(v10, "ax_enqueueObject:");

            objc_storeStrong(&v43, 0);
          }
          else
          {
            v39 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
            objc_msgSend(v39, "setLeafNodePredicate:", &__block_literal_global_295_0);
            v8 = (id)objc_msgSend(v74, "view");
            v38 = (id)objc_msgSend(v8, "_accessibilityLeafDescendantsWithOptions:", v39);

            v3 = (id)objc_msgSend(v38, "ax_filteredArrayUsingBlock:", &__block_literal_global_297);
            v4 = v38;
            v38 = v3;

            v9 = v38;
            v32 = MEMORY[0x24BDAC760];
            v33 = -1073741824;
            v34 = 0;
            v35 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_6;
            v36 = &unk_24FF3E490;
            v37 = v76;
            objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v32);
            objc_storeStrong(&v37, 0);
            objc_storeStrong(&v38, 0);
            objc_storeStrong(&v39, 0);
          }
        }
      }
    }
    else
    {
      v28 = v75;
      v29 = (id)objc_msgSend(v74, "presentedViewController");
      objc_msgSend(v28, "ax_enqueueObject:");

    }
    objc_storeStrong(&v74, 0);
  }
  v6 = (id)objc_msgSend(v76, "reverseObjectEnumerator");
  v7 = (id)objc_msgSend(v6, "allObjects");

  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(v80, 0);
  return v7;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "ax_enqueueObject:", location[0]);
  objc_storeStrong(location, 0);
}

uint64_t __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  char v6;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0];
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v6 = 0;
  if (v4 != v5)
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_3(id *a1, void *a2)
{
  uint64_t v2;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = objc_msgSend(location[0], "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BDF73C0]) == 0)
    objc_msgSend(a1[4], "axSafelyAddObject:", location[0]);
  objc_storeStrong(location, 0);
}

BOOL __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_4(void *a1, void *a2)
{
  BOOL v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "accessibilityContainerType") == 4;
  objc_storeStrong(location, 0);
  return v3;
}

uint64_t __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_5(void *a1, void *a2)
{
  id v3;
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "_accessibilityParentView");
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_6(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "axSafelyAddObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (int)_accessibilityRemotePid
{
  id v3;
  int v4;

  v3 = -[UIWindowAccessibility accessibilityContainer](self, "accessibilityContainer");
  v4 = objc_msgSend(v3, "remotePid");

  return v4;
}

- (id)_accessibilityFirstElement
{
  return (id)-[UIWindowAccessibility _accessibilityFirstDescendant](self, "_accessibilityFirstDescendant", a2, self);
}

- (void)dealloc
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  objc_super v9;
  _QWORD __b[8];
  id v11;
  SEL v12;
  UIWindowAccessibility *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[UIWindowAccessibility _accessibilityAllRemoteElements](v13);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
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
      objc_msgSend(v11, "setRemoteChildrenDelegate:", 0);
      objc_msgSend(v11, "unregister");
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v6)
          break;
      }
    }
  }

  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v13, CFSTR("ax_remote_element_registered"), 0);

  v9.receiver = v13;
  v9.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility dealloc](&v9, sel_dealloc);
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  char v22;
  _QWORD __b[9];
  id v24;
  id v25;
  int v26;
  id location[2];
  UIWindowAccessibility *v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UIWindowAccessibility accessibilityElementsHidden](v28, "accessibilityElementsHidden")
    || (int)objc_msgSend(location[0], "remotePid") < 0)
  {
    v29 = MEMORY[0x24BDBD1A8];
    v26 = 1;
  }
  else
  {
    v25 = 0;
    if ((objc_msgSend(location[0], "isAccessibilityOpaqueElementProvider") & 1) != 0
      && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0)
    {
      v5 = (id)-[UIWindowAccessibility _accessibilitySortedElementsWithin](v28, "_accessibilitySortedElementsWithin");
      v6 = v25;
      v25 = v5;

    }
    else
    {
      v3 = (id)-[UIWindowAccessibility subviews](v28, "subviews");
      v4 = v25;
      v25 = v3;

    }
    if (-[UIWindowAccessibility _accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren](v28, "_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren"))
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BDF7000], "_scenesIncludingInternal:", 1);
      memset(__b, 0, 0x40uLL);
      obj = v24;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
      if (v18)
      {
        v14 = *(_QWORD *)__b[2];
        v15 = 0;
        v16 = v18;
        while (1)
        {
          v13 = v15;
          if (*(_QWORD *)__b[2] != v14)
            objc_enumerationMutation(obj);
          __b[8] = *(_QWORD *)(__b[1] + 8 * v15);
          NSClassFromString(CFSTR("_UIKeyboardWindowScene"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (void *)MEMORY[0x24BDBCE30];
            v22 = 0;
            objc_opt_class();
            v21 = (id)__UIAccessibilityCastAsClass();
            if ((v22 & 1) != 0)
              abort();
            v20 = v21;
            objc_storeStrong(&v21, 0);
            v11 = (id)objc_msgSend(v20, "windows");
            v7 = (id)objc_msgSend(v12, "axArrayWithPossiblyNilArrays:", 2, v11, v25);
            v8 = v25;
            v25 = v7;

          }
          ++v15;
          if (v13 + 1 >= v16)
          {
            v15 = 0;
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
            if (!v16)
              break;
          }
        }
      }

      objc_storeStrong(&v24, 0);
    }
    v10 = (id)objc_msgSend(v25, "reverseObjectEnumerator");
    v19 = (id)objc_msgSend(v10, "allObjects");

    v29 = (id)objc_msgSend(MEMORY[0x24BDF6F90], "_subviewsReplacedByModalViewSubviewsIfNecessary:", v19);
    v26 = 1;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(location, 0);
  return v29;
}

- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  return AXRequestingClient() == 3;
}

- (void)_axRemoteElementRegistered:(id)a3
{
  int v3;
  UIWindowAccessibility *v4;
  id v5;
  os_log_t oslog;
  int v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id location[2];
  UIWindowAccessibility *v13;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_opt_class();
  v5 = (id)objc_msgSend(location[0], "userInfo");
  v9 = (id)__UIAccessibilityCastAsClass();

  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11 = (id)objc_msgSend(v8, "objectForKey:", CFSTR("element"));

  if (!v11)
    _AXAssert();
  v7 = objc_msgSend(v11, "contextId");
  if (v11 && v7 == -[UIWindowAccessibility _accessibilityContextId](v13, "_accessibilityContextId") && v7)
  {
    -[UIWindowAccessibility _axUpdateForRemoteElement:](v13, v11);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogRemoteElement();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v4 = v13;
      v3 = -[UIWindowAccessibility _accessibilityContextId](v13, "_accessibilityContextId");
      __os_log_helper_16_2_3_8_64_4_0_8_64((uint64_t)v14, (uint64_t)v4, v3, (uint64_t)v11);
      _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "This remote element does not belong to me: %@ (contextId: %u). Remote element: %@ ", v14, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)_axUpdateForRemoteElement:(void *)a1
{
  os_log_t oslog;
  id v3;
  int v4;
  id location;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    v3 = -[UIWindowAccessibility _accessibilityAllRemoteElements](v6);
    if (!v3)
    {
      v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");

      objc_msgSend(v6, "_accessibilitySetAllRemoteElements:", v3);
    }
    if ((objc_msgSend(v3, "containsObject:", location) & 1) == 0)
    {
      objc_msgSend(location, "setRemoteChildrenDelegate:", v6);
      objc_msgSend(v3, "addObject:", location);
      oslog = (os_log_t)(id)AXLogRemoteElement();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, (uint64_t)v6, (uint64_t)location);
        _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "Added remote element to me: %@, remoteElement: %@", v7, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v3, 0);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_axCheckForExistingRemoteElements
{
  id v2;
  char isKindOfClass;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  void *v11;
  unsigned int v12;
  SEL v13;
  UIWindowAccessibility *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13 = a2;
  v12 = -[UIWindowAccessibility _accessibilityContextId](self, "_accessibilityContextId");
  if (v12)
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(MEMORY[0x24BDFEA78], "remoteElementsForContextId:", v12);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
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
        v11 = *(void **)(__b[1] + 8 * v6);
        v2 = (id)objc_msgSend(v11, "accessibilityContainer");
        NSClassFromString(CFSTR("WKContentView"));
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          -[UIWindowAccessibility _axUpdateForRemoteElement:](v14, v11);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
          if (!v7)
            break;
        }
      }
    }

  }
}

- (BOOL)_accessibilityIsInCarPlay
{
  id v3;
  BOOL v4;

  v3 = (id)-[UIWindowAccessibility traitCollection](self, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 3;

  return v4;
}

- (BOOL)_accessibilityIsInJindo
{
  return 0;
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return -[UIWindowAccessibility _windowInterfaceOrientation](self, "_windowInterfaceOrientation", a2, self);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UIWindowAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UIWindowAccessibility _axListenForRemoteElement](v4);
  -[UIWindowAccessibility _accessibilityRegisterRemoteElement:](v4, "_accessibilityRegisterRemoteElement:", 1);
}

- (id)_accessibilityFirstResponderCoalesceTimer
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIWindow___accessibilityFirstResponderCoalesceTimer);
  else
    return 0;
}

- (void)_accessibilitySetFirstResponderCoalesceTimer:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

void __44__UIWindowAccessibility__setFirstResponder___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = a1[4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong(location, 0);
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB8], 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (BOOL)accessibilityIsWindow
{
  return 1;
}

- (unsigned)_accessibilityContextId
{
  unsigned int v3;
  id v4;
  id v5;
  char v6;
  SEL v7;
  UIWindowAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = objc_msgSend(v4, "_contextId");

  return v3;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = self;
  v3 = objc_msgSend(v4[0], "isUserInteractionEnabled");
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  BOOL v3;
  os_log_t v4;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v7;
  char v8;
  objc_super v9;
  char v10;
  SEL v11;
  UIWindowAccessibility *v12;
  uint8_t v13[16];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11 = a2;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowAccessibility;
  v10 = -[UIWindowAccessibility accessibilityElementsHidden](&v9, sel_accessibilityElementsHidden);
  if (!v10)
  {
    v8 = _isDevicePasscodeLocked() & 1;
    v7 = 0;
    v3 = 1;
    if (AXRequestingClient() != 16)
      v3 = AXDoesRequestingClientDeserveAutomation() != 0;
    v7 = v3;
    if ((v8 & 1) != 0
      && v7
      && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeBoolForKey:", CFSTR("_accessibilityUIAppFocusedOnContinuityDisplay")) & 1) != 0)
    {
      oslog = (os_log_t)(id)AXLogCommon();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v12);
        _os_log_impl(&dword_230C4A000, oslog, type, "App is active in Oneness session, not hiding window : %@", v14, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v8 = 0;
    }
    if (-[UIWindowAccessibility _accessibilityIsInCarPlay](v12, "_accessibilityIsInCarPlay"))
      v8 = 0;
    if ((v8 & 1) != 0
      && (-[UIWindowAccessibility safeBoolForKey:](v12, "safeBoolForKey:", CFSTR("_shouldCreateContextAsSecure")) & 1) == 0)
    {
      v4 = (os_log_t)(id)AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v12);
        _os_log_impl(&dword_230C4A000, v4, OS_LOG_TYPE_DEFAULT, "Hiding this window since not secure: %@", v13, 0xCu);
      }
      objc_storeStrong((id *)&v4, 0);
      v10 = 1;
    }
  }
  return v10 & 1;
}

- (BOOL)_accessibilitySceneContainsOnlySecureWindows
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  id v11;
  id location;
  id v13;
  char v14;
  SEL v15;
  UIWindowAccessibility *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = 1;
  v13 = self;
  location = (id)objc_msgSend(v13, "windowScene");
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(location, "windows");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
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
      v11 = *(id *)(__b[1] + 8 * v6);
      if ((objc_msgSend(v11, "isHidden") & 1) == 0 && (objc_msgSend(v11, "_accessibilityIsSecure") & 1) == 0)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v7)
          goto LABEL_10;
      }
    }
    v14 = 0;
  }
LABEL_10:

  v3 = v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v3 & 1;
}

- (BOOL)_accessibilityIsSecure
{
  char v3;
  id location[2];
  UIWindowAccessibility *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIWindowAccessibility _windowHostingScene](self, "_windowHostingScene");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
    if ((-[UIWindowAccessibility safeBoolForKey:](v5, "safeBoolForKey:", CFSTR("_isSecure")) & 1) == 0)
      v3 = objc_msgSend(location[0], "_accessibilityIsSecure");
    v6 = v3 & 1;
  }
  else
  {
    v6 = -[UIWindowAccessibility safeBoolForKey:](v5, "safeBoolForKey:", CFSTR("_isSecure")) & 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityGetRemoteElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIWindowAccessibility___accessibilityGetRemoteElement);
  else
    return 0;
}

- (void)_accessibilitySetRemoteElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityMLRemoteElement
{
  void *v1;
  id v2;
  CFAllocatorRef *v4;
  id location;
  CFUUIDRef uuid;
  id v7;
  void *v8;
  id v9;
  __CFString *v10;

  v8 = a1;
  if (a1)
  {
    v7 = -[UIWindowAccessibility _accessibilityGetRemoteElement](v8);
    if (!v7)
    {
      uuid = 0;
      v4 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
      uuid = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
      v10 = (__CFString *)CFUUIDCreateString(*v4, uuid);
      location = v10;
      if (uuid)
      {
        CFRelease(uuid);
        uuid = 0;
      }
      v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA80]), "initWithUUID:andContextId:", location, 0);
      v2 = v7;
      v7 = v1;

      if (v7)
      {
        objc_msgSend(v7, "setOnClientSide:", 1);
        objc_msgSend(v7, "setRemoteChildrenDelegate:", v8);
        objc_msgSend(v7, "setAccessibilityContainer:", v8);
      }
      -[UIWindowAccessibility _accessibilitySetRemoteElement:]((uint64_t)v8, v7);
      objc_storeStrong(&location, 0);
    }
    v9 = v7;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_setBoundContext:(id)a3
{
  objc_super v3;
  id location[2];
  UIWindowAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIWindowAccessibility _accessibilityRegisterRemoteElement:](v5, "_accessibilityRegisterRemoteElement:", 0);
  v3.receiver = v5;
  v3.super_class = (Class)UIWindowAccessibility;
  -[UIWindowAccessibility _setBoundContext:](&v3, sel__setBoundContext_, location[0]);
  -[UIWindowAccessibility _accessibilityRegisterRemoteElement:](v5, "_accessibilityRegisterRemoteElement:", 1);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityRegisterRemoteElement:(BOOL)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  id v11;
  char RemoteViewForIdentityAndSceneIdentifier;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(_QWORD *, void *);
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id location;
  id v26;
  id v27;
  unsigned int v28;
  id v29;
  BOOL v30;
  SEL v31;
  UIWindowAccessibility *v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31 = a2;
  v30 = a3;
  if ((AXProcessIsSystemApplication() & 1) == 0)
  {
    v29 = v32;
    v28 = objc_msgSend(v29, "_contextId");
    if (v28)
    {
      v27 = (id)objc_msgSend(v29, "windowScene");
      v26 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("_FBSScene"));
      location = (id)objc_msgSend(v26, "safeStringForKey:", CFSTR("identifier"));
      v11 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("identity"));
      v24 = (id)objc_msgSend(v11, "safeStringForKey:", CFSTR("workspaceIdentifier"));

      v23 = 0;
      v21 = 0;
      RemoteViewForIdentityAndSceneIdentifier = 0;
      if ((AXShouldCreateRemoteViewForEachLayer(v24) & 1) != 0)
      {
        v22 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("RBSProcessIdentity")), "safeValueForKey:", CFSTR("identityOfCurrentProcess"));
        v21 = 1;
        RemoteViewForIdentityAndSceneIdentifier = AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(v22, location, v24);
      }
      if ((v21 & 1) != 0)

      v23 = RemoteViewForIdentityAndSceneIdentifier & 1;
      NSClassFromString(CFSTR("_UIKeyboardWindowScene"));
      if ((objc_opt_isKindOfClass() & 1) == 0 && (v23 & 1) != 0)
      {
        v9 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("hostProcess"));
        v10 = objc_msgSend(v9, "safeIntForKey:", CFSTR("pid"));

        v20 = v10;
        if (!location)
          objc_storeStrong(&location, &stru_24FF484E0);
        v19 = (id)AXRemoteElementConcatSceneUUIDAndContextId();
        v4 = (void *)MEMORY[0x24BDFEA78];
        v33[0] = CFSTR("ax-pid");
        v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
        v34[0] = v8;
        v33[1] = CFSTR("ax-context");
        v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28);
        v34[1] = v7;
        v33[2] = CFSTR("ax-uuid");
        v34[2] = v19;
        v33[3] = CFSTR("ax-register");
        v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
        v34[3] = v6;
        v5 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
        objc_msgSend(v4, "registerRemoteElement:remotePort:");

        if (!v30)
        {
          v3 = -[UIWindowAccessibility _accessibilityAllRemoteElements](v32);
          v13 = MEMORY[0x24BDAC760];
          v14 = -1073741824;
          v15 = 0;
          v16 = __61__UIWindowAccessibility__accessibilityRegisterRemoteElement___block_invoke;
          v17 = &unk_24FF400D8;
          v18 = v19;
          objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", &v13);

          objc_storeStrong(&v18, 0);
        }
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v29, 0);
  }
}

uint64_t __61__UIWindowAccessibility__accessibilityRegisterRemoteElement___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  char v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "uuid");
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_prefersFocusContainment
{
  char v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  UIWindowAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIWindowAccessibility;
  v5 = -[UIWindowAccessibility _prefersFocusContainment](&v4, sel__prefersFocusContainment);
  if (v5)
    return v5;
  v3 = 1;
  if ((-[UIWindowAccessibility _accessibilityIsTouchContainer](v7, "_accessibilityIsTouchContainer") & 1) == 0)
    v3 = -[UIWindowAccessibility shouldGroupAccessibilityChildren](v7, "shouldGroupAccessibilityChildren");
  return v3 & 1;
}

@end
