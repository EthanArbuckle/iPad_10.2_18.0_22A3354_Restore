@implementation _UIScenePresentationViewAccessibility

- (void)_accessibilityResetRemoteElementArray
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id obj;
  uint64_t v6;
  id v7;
  id location;
  _QWORD __b[8];
  id v10;
  void *v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    obj = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v11);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
    if (v6)
    {
      v2 = *(_QWORD *)__b[2];
      v3 = 0;
      v4 = v6;
      while (1)
      {
        v1 = v3;
        if (*(_QWORD *)__b[2] != v2)
          objc_enumerationMutation(obj);
        v10 = *(id *)(__b[1] + 8 * v3);
        objc_msgSend(v10, "unregister");
        ++v3;
        if (v1 + 1 >= v4)
        {
          v3 = 0;
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
          if (!v4)
            break;
        }
      }
    }

    -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v11, 0);
    objc_initWeak(&location, v11);
    objc_copyWeak(&v7, &location);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_accessibilitySetRemoteElementArray:(uint64_t)a1
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

- (void)_accessibilitySetRemoteElementIfNecessary
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id obj;
  uint64_t v12;
  id v13;
  char RemoteViewForIdentityAndSceneIdentifier;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  NSObject *log;
  os_log_type_t type;
  id v23;
  id v24;
  id v25;
  unsigned int v26;
  _QWORD __b[8];
  id v28;
  unsigned int v29;
  id v30;
  int v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  id v38;
  uint8_t v39[7];
  char v40;
  id location;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v42 = a1;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    {
      location = (id)AXLogAppAccessibility();
      v40 = 17;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
      {
        log = location;
        type = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_fault_impl(&dword_230C4A000, log, type, "Should always update remote view AX properties on the main thread", v39, 2u);
      }
      objc_storeStrong(&location, 0);
    }
    v1 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v42);
    v20 = v1 != 0;

    if (!v20)
    {
      v37 = 0;
      objc_opt_class();
      v19 = (id)objc_msgSend(v42, "safeValueForKey:", CFSTR("_scene"));
      v36 = (id)__UIAccessibilityCastAsClass();

      v35 = v36;
      objc_storeStrong(&v36, 0);
      v38 = v35;
      v16 = (id)objc_msgSend(v35, "clientHandle");
      v15 = (id)objc_msgSend(v16, "identity");
      v34 = (id)objc_msgSend(v15, "processIdentity");

      v17 = (id)objc_msgSend(v38, "clientHandle");
      v33 = (id)objc_msgSend(v17, "processHandle");

      v18 = (id)objc_msgSend(v38, "identity");
      v32 = (id)objc_msgSend(v18, "workspaceIdentifier");

      if ((objc_msgSend(v42, "_axIsPosterLockViewWithScene:", v38) & 1) != 0)
      {
        v31 = 1;
      }
      else
      {
        v13 = (id)objc_msgSend(v38, "identifier");
        RemoteViewForIdentityAndSceneIdentifier = AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(v34, v13, v32);

        if ((RemoteViewForIdentityAndSceneIdentifier & 1) != 0)
        {
          v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v29 = objc_msgSend(v33, "safeIntForKey:", CFSTR("pid"));
          if (v29 != getpid())
          {
            if ((AXShouldCreateRemoteViewForEachLayer(v32) & 1) != 0)
            {
              memset(__b, 0, sizeof(__b));
              v10 = (id)objc_msgSend(v38, "layerManager");
              obj = (id)objc_msgSend(v10, "layers");

              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
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
                  v28 = *(id *)(__b[1] + 8 * v8);
                  v26 = 0;
                  v26 = objc_msgSend(v28, "contextID");
                  v5 = (id)objc_msgSend(v38, "identifier");
                  v25 = (id)AXRemoteElementConcatSceneUUIDAndContextId();

                  v2 = objc_alloc(MEMORY[0x24BDFEA78]);
                  v24 = (id)objc_msgSend(v2, "initWithUUID:andRemotePid:andContextId:", v25, v29, v26);
                  objc_msgSend(v24, "setOnClientSide:", 1);
                  objc_msgSend(v24, "setAccessibilityContainer:", v42);
                  objc_msgSend(v30, "addObject:", v24);
                  objc_storeStrong(&v24, 0);
                  objc_storeStrong(&v25, 0);
                  ++v8;
                  if (v6 + 1 >= v9)
                  {
                    v8 = 0;
                    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
                    if (!v9)
                      break;
                  }
                }
              }

            }
            else
            {
              v3 = objc_alloc(MEMORY[0x24BDFEA78]);
              v4 = (id)objc_msgSend(v38, "identifier");
              v23 = (id)objc_msgSend(v3, "initWithUUID:andRemotePid:andContextId:");

              objc_msgSend(v23, "setOnClientSide:", 1);
              objc_msgSend(v23, "setAccessibilityContainer:", v42);
              objc_msgSend(v30, "addObject:", v23);
              objc_storeStrong(&v23, 0);
            }
          }
          if (objc_msgSend(v30, "count"))
            -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v42, v30);
          objc_storeStrong(&v30, 0);
        }
        else
        {
          -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v42, MEMORY[0x24BDBD1A8]);
        }
        v31 = 0;
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v38, 0);
    }
  }
}

- (id)_accessibilityGetRemoteElementArray
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIScenePresentationViewAccessibility___accessibilityGetRemoteElementArray);
  else
    return 0;
}

- (BOOL)_axIsPosterLockViewWithScene:(id)a3
{
  id v4;
  id v5;
  char v6;
  char v7;
  id v8;
  id location[2];
  _UIScenePresentationViewAccessibility *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "identity");
  v5 = (id)objc_msgSend(v4, "workspaceIdentifier");
  v7 = 0;
  v6 = 0;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PosterKit")) & 1) != 0)
  {
    v8 = (id)-[_UIScenePresentationViewAccessibility safeStringForKey:](v10, "safeStringForKey:", CFSTR("identifier"));
    v7 = 1;
    v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("PBUIPosterLockViewController"));
  }
  v11 = v6 & 1;
  if ((v7 & 1) != 0)

  objc_storeStrong(location, 0);
  return v11 & 1;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIScenePresentationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIScenePresentationView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RBSProcessHandle"), CFSTR("pid"), "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("identifier"), "@", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (id)_accessibilityResponderElement
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  v4 = (id)objc_msgSend(v5[0], "lastObject");
  v3 = (id)objc_msgSend(v4, "_accessibilityResponderElement");
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
  return v3;
}

- (id)accessibilityElements
{
  id v3;
  char v4;
  id v5[2];
  _UIScenePresentationViewAccessibility *v6;
  id v7;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  if (!v5[0])
  {
    -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementIfNecessary](v6);
    v5[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v6);

  }
  v4 = -[_UIScenePresentationViewAccessibility _accessibilityShouldUseRemoteElement](v6) & 1;
  if (v5[0] && (v4 & 1) != 0)
  {
    v7 = v5[0];
  }
  else
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v6);
    v7 = (id)objc_msgSend(v3, "accessibilityElements");
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(v5, 0);
  return v7;
}

- (uint64_t)_accessibilityShouldUseRemoteElement
{
  id v2;
  char v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  char v10;

  v9 = a1;
  if (a1)
  {
    v7 = 0;
    objc_opt_class();
    v4 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("_scene"));
    v6 = (id)__UIAccessibilityCastAsClass();

    v5 = v6;
    objc_storeStrong(&v6, 0);
    v8 = v5;
    v2 = (id)objc_msgSend(v5, "identifier");
    v3 = objc_msgSend(v2, "containsString:", *MEMORY[0x24BDFE078]);

    if ((v3 & 1) != 0)
      v10 = objc_msgSend(v8, "accessibilitySceneIsCallServiceBanner") & 1;
    else
      v10 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIScenePresentationViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v2 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_unregister);

  v3.receiver = v5;
  v3.super_class = (Class)_UIScenePresentationViewAccessibility;
  -[_UIScenePresentationViewAccessibility dealloc](&v3, sel_dealloc);
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (id)_axRemoteChild
{
  id v2;
  id v3;

  if (!a1)
    return 0;
  v2 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](a1);
  v3 = (id)objc_msgSend(v2, "firstObject");

  return v3;
}

- (int)_accessibilityRemotePid
{
  int v3;
  id v4;
  char v5;
  id v6;

  v4 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  v5 = 0;
  if ((objc_msgSend(v4, "onClientSide") & 1) != 0)
  {
    v6 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
    v5 = 1;
    v3 = objc_msgSend(v6, "remotePid");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (id)_accessibilityRemoteSceneID
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8[2];
  _UIScenePresentationViewAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[_UIScenePresentationViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_scene"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  v3 = (id)objc_msgSend(v5, "identifier");
  objc_storeStrong(v8, 0);
  return v3;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  id v3;
  char v4;

  v3 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  v4 = objc_msgSend(v3, "onClientSide");

  return v4 & 1;
}

- (BOOL)canBecomeFocused
{
  id v3;
  char v4;

  v3 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  v4 = objc_msgSend(v3, "onClientSide");

  return v4 & 1;
}

@end
