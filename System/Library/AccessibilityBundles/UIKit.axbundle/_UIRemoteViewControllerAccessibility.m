@implementation _UIRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIRemoteViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMachPortRetrievalTimer
{
  return objc_getAssociatedObject(self, &___UIRemoteViewControllerAccessibility___axMachPortRetrievalTimer);
}

- (void)_axSetMachPortRetrievalTimer:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_axGetWasFocusEnabled
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetWasFocusEnabled:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const char *v7;
  const __CFString *v8;
  const char *v9;
  id v10;
  id *v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIRemoteViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "_UITextEffectsRemoteView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIRemoteViewController"), CFSTR("_textEffectsAboveStatusBarRemoteView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIRemoteViewController"), CFSTR("_fullScreenTextEffectsRemoteView"), "_UITextEffectsRemoteView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIRemoteViewController"), CFSTR("_remoteKeyboardRemoteView"), "_UITextEffectsRemoteView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIRemoteViewController"), CFSTR("_sizeTrackingView"), "_UISizeTrackingView");
  v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteViewController"), CFSTR("_initializeAccessibilityPortInformation"), 0);
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("__setViewServiceIsDisplayingPopover:"), v9, "B", 0);
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("__handleFocusMovementAction:"), v9, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setWantsKeyboardEnvironmentEventDeferring:"), v9, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("disconnect"), v6, 0);
  v5 = CFSTR("UIViewController");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v6, v6, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v4, v5);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("navigationController"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteViewAccessibility"), CFSTR("_accessibilityUnregisterRemoteView"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_focusSystem"), v6, 0);
  v8 = CFSTR("UIFocusSystem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_setEnabled:"), v9, v7, 0);
  objc_storeStrong(v11, v10);
}

- (id)_accessibilityResponderElement
{
  id v2;
  id v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id obj;
  uint64_t v16;
  objc_super v17;
  id v18;
  int v19;
  id location;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24[2];
  _UIRemoteViewControllerAccessibility *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  v24[1] = (id)a2;
  v24[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_sizeTrackingView"));
  v10 = (id)objc_msgSend(v11, "subviews");
  objc_msgSend(v24[0], "axSafelyAddObjectsFromArray:");

  v12 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_remoteKeyboardRemoteView"));
  objc_msgSend(v24[0], "axSafelyAddObject:");

  v13 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_fullScreenTextEffectsRemoteView"));
  objc_msgSend(v24[0], "axSafelyAddObject:");

  v14 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_textEffectsAboveStatusBarRemoteView"));
  objc_msgSend(v24[0], "axSafelyAddObject:");

  v23 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v24[0];
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v16)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v16;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v22 = *(id *)(__b[1] + 8 * v8);
      location = (id)objc_msgSend(v22, "_accessibilityResponderElement");
      if (location)
      {
        v26 = location;
        v19 = 1;
      }
      else
      {
        if ((-[_UIRemoteViewControllerAccessibility isFirstResponder](v25, "isFirstResponder") & 1) != 0 && !v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = (id)objc_msgSend(v22, "accessibilityElements");
            v2 = (id)objc_msgSend(v5, "firstObject");
            v3 = v23;
            v23 = v2;

          }
        }
        v19 = 0;
      }
      objc_storeStrong(&location, 0);
      if (v19)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v9)
          goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v19 = 0;
  }

  if (!v19)
  {
    v17.receiver = v25;
    v17.super_class = (Class)_UIRemoteViewControllerAccessibility;
    v18 = -[_UIRemoteViewControllerAccessibility _accessibilityResponderElement](&v17, sel__accessibilityResponderElement);
    if (v18)
      v26 = v18;
    else
      v26 = v23;
    v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
  return v26;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIRemoteViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIRemoteViewControllerAccessibility;
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v4, 0);
}

- (void)_accessibilityLoadAccessibilityInformation:(void *)a1
{
  if (a1)
    -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:retryTime:](a1, a2 & 1, 0.1);
}

- (void)_axRemoteViewLoadRequest:(id)a3
{
  os_log_t oslog;
  id location[2];
  _UIRemoteViewControllerAccessibility *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)AXLogRemoteElement();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)v5);
    _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "%@: will load remote view on request", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation:(double)a3 retryTime:
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id obj;
  id v11;
  id v12;
  int v13;
  double v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD __b[8];
  uint64_t v30;
  os_log_type_t v31;
  os_log_t v32[2];
  int v33;
  int v34;
  void (*v35)(_xpc_connection_s *);
  void *v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  int v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44[2];
  _QWORD v45[2];
  int v46;
  int v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  id v61[2];
  os_log_type_t v62;
  os_log_t v63[2];
  unsigned int v64;
  os_log_type_t type;
  os_log_t oslog;
  double v67;
  char v68;
  id v69;
  _BYTE v70[128];
  uint8_t v71[32];
  uint8_t v72[32];
  uint8_t v73[24];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v69 = a1;
  v68 = a2 & 1;
  v67 = a3;
  if (a1)
  {
    if ((objc_msgSend(v69, "_accessibilityBoolValueForKey:", CFSTR("AXDidListenForRemoteViewLoad")) & 1) == 0)
    {
      v25 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v25, "addObserver:selector:name:object:", v69, sel__axRemoteViewLoadRequest_, CFSTR("AXRequestRemoteViewLoad"), 0);

      objc_msgSend(v69, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXDidListenForRemoteViewLoad"));
    }
    if (_AXSApplicationAccessibilityEnabled())
    {
      v23 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_serviceAccessibilityServerPort"));
      v24 = objc_msgSend(v23, "intValue");

      v64 = v24;
      if (v24)
      {
        v51 = 0;
        v52 = &v51;
        v53 = 0x20000000;
        v54 = 32;
        v55 = 0;
        v12 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("serviceProcessIdentifier"));
        v13 = objc_msgSend(v12, "intValue");

        v55 = v13;
        if (!*((_DWORD *)v52 + 6))
        {
          v45[0] = 0;
          v45[1] = v45;
          v46 = 838860800;
          v47 = 48;
          v48 = __Block_byref_object_copy__17;
          v49 = __Block_byref_object_dispose__17;
          v50 = 0;
          v39 = MEMORY[0x24BDAC760];
          v40 = -1073741824;
          v41 = 0;
          v42 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_261;
          v43 = &unk_24FF3DE88;
          v44[1] = v45;
          v44[0] = v69;
          AXPerformSafeBlock();
          v32[1] = (os_log_t)MEMORY[0x24BDAC760];
          v33 = -1073741824;
          v34 = 0;
          v35 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_2;
          v36 = &unk_24FF3F168;
          v37 = v45;
          v38 = &v51;
          AXPerformSafeBlock();
          objc_storeStrong(v44, 0);
          _Block_object_dispose(v45, 8);
          objc_storeStrong(&v50, 0);
        }
        v32[0] = (os_log_t)(id)AXLogRemoteElement();
        v31 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v32[0], OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_3_8_64_4_0_4_0((uint64_t)v71, (uint64_t)v69, v64, *((_DWORD *)v52 + 6));
          _os_log_impl(&dword_230C4A000, v32[0], v31, "%@: loading ax info - mach port %d, remote pid %d", v71, 0x18u);
        }
        objc_storeStrong((id *)v32, 0);
        memset(__b, 0, sizeof(__b));
        v11 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_sizeTrackingView"));
        obj = (id)objc_msgSend(v11, "subviews");

        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
        if (v9)
        {
          v6 = *(_QWORD *)__b[2];
          v7 = 0;
          v8 = v9;
          while (1)
          {
            v5 = v7;
            if (*(_QWORD *)__b[2] != v6)
              objc_enumerationMutation(obj);
            v30 = *(_QWORD *)(__b[1] + 8 * v7);
            objc_msgSend(v69, "_accessibilityRemoteView:pid:machPort:", v30, *((unsigned int *)v52 + 6), v64);
            ++v7;
            if (v5 + 1 >= v8)
            {
              v7 = 0;
              v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
              if (!v8)
                break;
            }
          }
        }

        v28 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_remoteKeyboardRemoteView"));
        objc_msgSend(v69, "_accessibilityRemoteView:pid:machPort:", v28, *((unsigned int *)v52 + 6), v64);
        v27 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_fullScreenTextEffectsRemoteView"));
        objc_msgSend(v69, "_accessibilityRemoteView:pid:machPort:", v27, *((unsigned int *)v52 + 6), v64);
        v26 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_textEffectsAboveStatusBarRemoteView"));
        objc_msgSend(v69, "_accessibilityRemoteView:pid:machPort:", v26, *((unsigned int *)v52 + 6), v64);
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        _Block_object_dispose(&v51, 8);
      }
      else
      {
        v3 = (id)objc_msgSend(v69, "safeValueForKey:", CFSTR("_initializeAccessibilityPortInformation"));
        v4 = (id)objc_msgSend(v69, "_axMachPortRetrievalTimer");
        v22 = v4 != 0;

        if (!v22)
        {
          v21 = objc_alloc(MEMORY[0x24BDFE490]);
          v19 = MEMORY[0x24BDAC9B8];
          v20 = (id)objc_msgSend(v21, "initWithTargetSerialQueue:");
          objc_msgSend(v69, "_axSetMachPortRetrievalTimer:", v20);

          v18 = (id)objc_msgSend(v69, "_axMachPortRetrievalTimer");
          objc_msgSend(v18, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);

        }
        v63[1] = COERCE_OS_LOG_T(5.0);
        v16 = (id)objc_msgSend(v69, "_axMachPortRetrievalTimer");
        v17 = objc_msgSend(v16, "isPending");

        if ((v17 & 1) == 0)
        {
          v63[0] = (os_log_t)(id)AXLogRemoteElement();
          v62 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v63[0], OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_2_8_64_8_0((uint64_t)v72, (uint64_t)v69, *(uint64_t *)&v67);
            _os_log_impl(&dword_230C4A000, v63[0], v62, "%@: could not get mach_port - will try again in %f", v72, 0x16u);
          }
          objc_storeStrong((id *)v63, 0);
          v15 = (id)objc_msgSend(v69, "_axMachPortRetrievalTimer");
          v14 = v67;
          v56 = MEMORY[0x24BDAC760];
          v57 = -1073741824;
          v58 = 0;
          v59 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke;
          v60 = &unk_24FF3D7E0;
          v61[0] = v69;
          v61[1] = *(id *)&v67;
          objc_msgSend(v15, "afterDelay:processBlock:", &v56, v14);

          objc_storeStrong(v61, 0);
        }
      }
    }
    else
    {
      oslog = (os_log_t)(id)AXLogRemoteElement();
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v69);
        _os_log_impl(&dword_230C4A000, oslog, type, "%@: not processing because AX is off", v73, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)_accessibilityRemoteView:(id)a3 pid:(int)a4 machPort:(unsigned int)a5
{
  id v5;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v5 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteMachPort:]((uint64_t)v5);

    objc_opt_class();
    v6 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteViewPid:]((uint64_t)v6);

    objc_opt_class();
    v7 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v7);

  }
  objc_storeStrong(location, 0);
}

- (void)_awakeWithConnectionInfo:(id)a3
{
  objc_super v3;
  id location[2];
  _UIRemoteViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIRemoteViewControllerAccessibility;
  -[_UIRemoteViewControllerAccessibility _awakeWithConnectionInfo:](&v3, sel__awakeWithConnectionInfo_, location[0]);
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v5, 1);
  objc_storeStrong(location, 0);
}

- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  _UIRemoteViewControllerAccessibility *v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  _UIRemoteViewControllerAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewControllerAccessibility;
  -[_UIRemoteViewControllerAccessibility __setViewServiceIsDisplayingPopover:](&v9, sel___setViewServiceIsDisplayingPopover_, a3);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __76___UIRemoteViewControllerAccessibility___setViewServiceIsDisplayingPopover___block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

- (id)disconnect
{
  id v3;
  objc_super v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[2];
  _UIRemoteViewControllerAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __50___UIRemoteViewControllerAccessibility_disconnect__block_invoke;
  v9 = &unk_24FF3DA40;
  v10[0] = self;
  AXPerformSafeBlock();
  v4.receiver = v11;
  v4.super_class = (Class)_UIRemoteViewControllerAccessibility;
  v3 = -[_UIRemoteViewControllerAccessibility disconnect](&v4, sel_disconnect);
  objc_storeStrong(v10, 0);
  return v3;
}

- (void)__handleFocusMovementAction:(id)a3
{
  void *v3;
  id v4;
  _UIRemoteViewControllerAccessibility *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  objc_super v15;
  id location[2];
  _UIRemoteViewControllerAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15.receiver = v17;
  v15.super_class = (Class)_UIRemoteViewControllerAccessibility;
  -[_UIRemoteViewControllerAccessibility __handleFocusMovementAction:](&v15, sel___handleFocusMovementAction_, location[0]);
  v13 = 0;
  objc_opt_class();
  v12 = (id)__UIAccessibilityCastAsClass();
  v11 = v12;
  objc_storeStrong(&v12, 0);
  v14 = v11;
  v7 = (id)objc_msgSend(v11, "view");
  v8 = objc_msgSend(v7, "_accessibilityIsFKARunningForFocusItem");

  if ((v8 & 1) != 0 && location[0] && -[_UIRemoteViewControllerAccessibility _axShouldTakeBackFocus](v17))
  {
    v3 = (void *)MEMORY[0x24BDF6A68];
    v4 = (id)objc_msgSend(v14, "view");
    v10 = (id)objc_msgSend(v3, "focusSystemForEnvironment:");

    -[_UIRemoteViewControllerAccessibility _axSetWasFocusEnabled:](v17, "_axSetWasFocusEnabled:", objc_msgSend(v10, "safeBoolForKey:", CFSTR("_isEnabled")) & 1);
    v9 = v10;
    AXPerformSafeBlock();
    v5 = v17;
    v6 = (id)objc_msgSend(location[0], "focusMovementInfo");
    -[_UIRemoteViewControllerAccessibility _axTakeBakeFocusWithHeading:](v5, "_axTakeBakeFocusWithHeading:");

    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_axShouldTakeBackFocus
{
  id v2;
  void *v3;
  id v4;
  BOOL v5;
  char v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  BOOL v13;

  v12 = a1;
  if (a1)
  {
    v10 = 0;
    objc_opt_class();
    v9 = (id)__UIAccessibilityCastAsClass();
    v8 = v9;
    objc_storeStrong(&v9, 0);
    v11 = (id)objc_msgSend(v8, "view");

    v3 = (void *)MEMORY[0x24BDF6F98];
    v2 = v11;
    v4 = (id)objc_msgSend(v11, "window");
    v6 = 0;
    v5 = 1;
    if ((objc_msgSend(v3, "_isViewSizeFullScreen:inWindow:", v2) & 1) != 0)
    {
      v7 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("navigationController"));
      v6 = 1;
      v5 = v7 != 0;
    }
    v13 = v5;
    if ((v6 & 1) != 0)

    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (void)_axTakeBakeFocusWithHeading:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11[2];
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[2];
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21[2];
  uint64_t v22;
  id v23;
  id v24;
  char v25;
  id v26[2];
  int v27;
  int v28;
  void (*v29)(uint64_t);
  void *v30;
  _UIRemoteViewControllerAccessibility *v31;
  id v32;
  id location[2];
  _UIRemoteViewControllerAccessibility *v34;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("_sizeTrackingView"));
  _UIAXAssignFocusToItem();

  v26[1] = (id)MEMORY[0x24BDAC760];
  v27 = -1073741824;
  v28 = 0;
  v29 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke;
  v30 = &unk_24FF3E050;
  v31 = v34;
  v32 = location[0];
  AXPerformSafeBlock();
  v25 = 0;
  objc_opt_class();
  v24 = (id)__UIAccessibilityCastAsClass();
  v23 = v24;
  objc_storeStrong(&v24, 0);
  v26[0] = v23;
  v8 = (id)objc_msgSend(v23, "view");
  v7 = (id)objc_msgSend(v8, "window");
  v6 = (id)objc_msgSend(v7, "windowScene");
  v5 = (id)objc_msgSend(v6, "focusSystem");
  v4 = (id)objc_msgSend(v5, "focusedItem");
  v3 = (id)-[_UIRemoteViewControllerAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("_sizeTrackingView"));
  v9 = v4 != v3;

  if (v9)
  {
    v11[0] = v34;
    AXPerformSafeBlock();
    objc_storeStrong(v11, 0);
  }
  else
  {
    v22 = 0;
    if (objc_msgSend(location[0], "heading") == 16)
    {
      v22 = 256;
    }
    else if (objc_msgSend(location[0], "heading") == 32)
    {
      v22 = 512;
    }
    if (v22)
    {
      v16[1] = (id)MEMORY[0x24BDAC760];
      v17 = -1073741824;
      v18 = 0;
      v19 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_2;
      v20 = &unk_24FF3D7E0;
      v21[0] = location[0];
      v21[1] = (id)v22;
      AXPerformSafeBlock();
      -[_UIRemoteViewControllerAccessibility _axTakeBakeFocusWithHeading:](v34, "_axTakeBakeFocusWithHeading:", location[0]);
      objc_storeStrong(v21, 0);
    }
    else if (!-[_UIRemoteViewControllerAccessibility _axGetWasFocusEnabled](v34, "_axGetWasFocusEnabled"))
    {
      v11[1] = (id)MEMORY[0x24BDAC760];
      v12 = -1073741824;
      v13 = 0;
      v14 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_3;
      v15 = &unk_24FF3DA40;
      v16[0] = v26[0];
      AXPerformSafeBlock();
      objc_storeStrong(v16, 0);
    }
  }
  objc_storeStrong(v26, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(location, 0);
}

@end
