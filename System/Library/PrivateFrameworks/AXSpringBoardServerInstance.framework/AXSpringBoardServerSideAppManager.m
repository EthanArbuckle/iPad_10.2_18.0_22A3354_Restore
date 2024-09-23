@implementation AXSpringBoardServerSideAppManager

- (BOOL)_isDockIconView:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  char v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_iconLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (id *)getSBIconLocationDockSymbolLoc_ptr;
  v15 = getSBIconLocationDockSymbolLoc_ptr;
  if (!getSBIconLocationDockSymbolLoc_ptr)
  {
    v6 = (void *)SpringBoardHomeLibrary();
    v5 = (id *)dlsym(v6, "SBIconLocationDock");
    v13[3] = (uint64_t)v5;
    getSBIconLocationDockSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
    -[AXSpringBoardServerSideAppManager _isDockIconView:].cold.1();
  v7 = *v5;
  if ((objc_msgSend(v4, "isEqual:", v7, v12) & 1) != 0)
    goto LABEL_9;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v8 = (_QWORD *)getSBIconLocationFloatingDockSymbolLoc_ptr;
  v15 = getSBIconLocationFloatingDockSymbolLoc_ptr;
  if (!getSBIconLocationFloatingDockSymbolLoc_ptr)
  {
    v9 = (void *)SpringBoardHomeLibrary();
    v8 = dlsym(v9, "SBIconLocationFloatingDock");
    v13[3] = (uint64_t)v8;
    getSBIconLocationFloatingDockSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
    -[AXSpringBoardServerSideAppManager _isDockIconView:].cold.2();
  if ((objc_msgSend(v4, "isEqualToString:", *v8, v12) & 1) != 0)
LABEL_9:
    v10 = 1;
  else
    v10 = objc_msgSend(v4, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions"));

  return v10;
}

+ (AXSpringBoardServerSideAppManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AXSpringBoardServerSideAppManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (AXSpringBoardServerSideAppManager *)(id)sharedInstance_SharedInstance;
}

- (void)setDockIconActivationMode:(unint64_t)a3
{
  if (self->_dockIconActivationMode != a3)
  {
    self->_dockIconActivationMode = a3;
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__endDockIconActivationModeAfterTimeout, 0);
    if (a3)
      -[AXSpringBoardServerSideAppManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endDockIconActivationModeAfterTimeout, 0, 15.0);
  }
}

- (unint64_t)dockIconActivationMode
{
  return self->_dockIconActivationMode;
}

- (id)_appWithIdentifier:(id)a3
{
  return AXSBApplicationWithIdentifier(a3);
}

- (id)_bundleIdentifierForIconView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("applicationBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__AXSpringBoardServerSideAppManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_SharedInstance;
  sharedInstance_SharedInstance = (uint64_t)v1;

}

- (AXSpringBoardServerSideAppManager)init
{
  AXSpringBoardServerSideAppManager *v2;
  AXSpringBoardServerSideAppManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSpringBoardServerSideAppManager;
  v2 = -[AXSpringBoardServerSideAppManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXSpringBoardServerSideAppManager _performValidation](v2, "_performValidation");
  return v3;
}

- (void)_performValidation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_3, &__block_literal_global_351, 0, &__block_literal_global_355);

}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SBPlatformController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("medusaCapabilities"), "q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("mainDisplaySceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("externalForegroundApplicationSceneHandles"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainDisplaySceneManager"));
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("SBMainDisplaySceneManager"), CFSTR("currentLayoutState"), "@");
  objc_msgSend(v2, "validateClass:", CFSTR("SBSceneManager"));
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("SBSceneManager"), CFSTR("SBApplicationSceneHandleProviding"));
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("SBSceneManager"), CFSTR("SBApplicationSceneIdentityProviding"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("newSceneIdentityForApplication:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("fetchOrCreateApplicationSceneHandleForRequest:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationSceneHandleRequest"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBApplicationSceneHandleRequest"), CFSTR("defaultRequestForApplication:sceneIdentity:displayIdentity:"), "@", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("elementWithRole:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("spaceConfiguration"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("floatingConfiguration"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainSwitcherControllerCoordinator"));
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_appLayouts"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentFloatingAppLayout"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_configureRequest:forSwitcherTransitionRequest:withEventLabel:"), "v", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBSwitcherTransitionRequest"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSwitcherTransitionRequest"), CFSTR("requestForActivatingAppLayout:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBFluidSwitcherViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_toggleFloatingAppVisibility"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBWorkspace"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBWorkspace"), CFSTR("mainWorkspace"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainWorkspace"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("requestTransitionWithOptions:builder:validator:"), "B", "Q", "@?", "@?", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBWorkspaceTransitionRequest"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceTransitionRequest"), CFSTR("modifyApplicationContext:"), "v", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspaceTransitionRequest"), CFSTR("setSource:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("setEntity:forLayoutRole:"), "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("setRequestedSpaceConfiguration:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("setRequestedFloatingConfiguration:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("applicationSceneEntityForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBWorkspaceEntity"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBEmptyWorkspaceEntity"), CFSTR("SBWorkspaceEntity"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBPreviousWorkspaceEntity"), CFSTR("SBWorkspaceEntity"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBWorkspaceEntity"), CFSTR("entity"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPreviousWorkspaceEntity"), CFSTR("entityWithPreviousLayoutRole:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceEntity"), CFSTR("applicationSceneEntity"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationSceneEntity"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneEntity"), CFSTR("application"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("isMedusaCapable"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("info"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBDeviceApplicationSceneEntity"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneEntity"), CFSTR("initWithApplicationForMainDisplay:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneEntity"), CFSTR("initWithApplicationSceneHandle:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("FBSApplicationInfo"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSApplicationInfo"), CFSTR("supportsMultiwindow"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBLayoutElement"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutElement"), CFSTR("layoutAttributes"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutElement"), CFSTR("workspaceEntity"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("mainDisplaySceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_activeDisplaySwitcherController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("layoutState"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("isFloatingSwitcherVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_iconLocation"), "NSString");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager:launchIconForIconView:withActions:modifierFlags:"), "v", "@", "@", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("applicationBundleID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("environment"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("type"), "q", 0);

  return 1;
}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AXSpringBoardServerHelperSideAppManager"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AXSpringBoardServerHelperSideAppManager"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBIconControllerSafeCategory"), 1);
}

- (id)allowedMedusaGestures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AXDeviceSupportsSideApp() & 1) != 0)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("GAXSpringboard")), "safeValueForKey:", CFSTR("sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4
      && (objc_msgSend(v4, "safeValueForKey:", CFSTR("shouldAllowMedusaGestures")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "BOOLValue"),
          v6,
          (v7 & 1) == 0))
    {
      v19 = v3;
    }
    else
    {
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_contentViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("_activeDisplaySwitcherController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("layoutState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "safeBoolForKey:", CFSTR("isFloatingSwitcherVisible"));
      objc_msgSend(v10, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isHidden");

      if ((v16 & 1) == 0 && (v13 & 1) == 0)
        -[AXSpringBoardServerSideAppManager _addFloatingApplicationGesturesIfAllowed:](self, "_addFloatingApplicationGesturesIfAllowed:", v3);
      if (-[AXSpringBoardServerSideAppManager _hasPinnedApp](self, "_hasPinnedApp"))
        -[AXSpringBoardServerSideAppManager _addResizeGestureRecognizerGesturesIfAllowed:](self, "_addResizeGestureRecognizerGesturesIfAllowed:", v3);
      v17 = v3;

    }
  }
  else
  {
    v18 = v3;
  }

  return v3;
}

- (id)appForLayoutRole:(int64_t)a3
{
  void *v5;
  void *v6;

  -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpringBoardServerSideAppManager _appForLayoutRole:layoutState:](self, "_appForLayoutRole:layoutState:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appForLayoutRole:(int64_t)a3 layoutState:(id)a4
{
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v6 = a4;
  AXPerformSafeBlock();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__AXSpringBoardServerSideAppManager__appForLayoutRole_layoutState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("workspaceEntity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("applicationSceneEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("application"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_enumerateAppsAndLayoutRoles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(void *, uint64_t);
  _QWORD aBlock[5];
  id v10;
  id v11;

  v4 = a3;
  -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSpringBoardServerSideAppManager__enumerateAppsAndLayoutRoles___block_invoke;
  aBlock[3] = &unk_24DDE69A0;
  aBlock[4] = self;
  v10 = v5;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v8[2](v8, 1);
  v8[2](v8, 2);
  if (-[AXSpringBoardServerSideAppManager _currentFloatingConfiguration](self, "_currentFloatingConfiguration") != 3
    && -[AXSpringBoardServerSideAppManager _currentFloatingConfiguration](self, "_currentFloatingConfiguration") != 4)
  {
    v8[2](v8, 3);
  }

}

void __66__AXSpringBoardServerSideAppManager__enumerateAppsAndLayoutRoles___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_appForLayoutRole:layoutState:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v4;
  }

}

- (BOOL)isDisplayingApp
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_opt_class();
  -[AXSpringBoardServerSideAppManager _mainDisplaySceneManager](self, "_mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("externalForegroundApplicationSceneHandles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count") != 0;
  return v6;
}

- (id)medusaApps
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__AXSpringBoardServerSideAppManager_medusaApps__block_invoke;
  v6[3] = &unk_24DDE69C8;
  v4 = v3;
  v7 = v4;
  -[AXSpringBoardServerSideAppManager _enumerateAppsAndLayoutRoles:](self, "_enumerateAppsAndLayoutRoles:", v6);

  return v4;
}

void __47__AXSpringBoardServerSideAppManager_medusaApps__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("displayName"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (id)medusaAppBundleIdsToLayoutRoles
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerSideAppManager_medusaAppBundleIdsToLayoutRoles__block_invoke;
  v6[3] = &unk_24DDE69C8;
  v4 = v3;
  v7 = v4;
  -[AXSpringBoardServerSideAppManager _enumerateAppsAndLayoutRoles:](self, "_enumerateAppsAndLayoutRoles:", v6);

  return v4;
}

void __68__AXSpringBoardServerSideAppManager_medusaAppBundleIdsToLayoutRoles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (BOOL)performMedusaGesture:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[AXSpringBoardServerSideAppManager allowedMedusaGestures](self, "allowedMedusaGestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    if (a3 >= 0x10)
    {
      if (a3 == 16)
        -[AXSpringBoardServerSideAppManager _performSwipeOnFloatingAppSwitcher:](self, "_performSwipeOnFloatingAppSwitcher:", 16);
    }
    else
    {
      -[AXSpringBoardServerSideAppManager _performMedusaGesture:](self, "_performMedusaGesture:", a3);
    }
  }
  else
  {
    _AXLogWithFacility();
  }

  return v7;
}

- (BOOL)hasMultipleApps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE38060], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (unint64_t)objc_msgSend(v4, "count") > 1;
  return v11;
}

- (BOOL)canActivateMedusaForDock
{
  void *v2;
  BOOL v3;

  -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode")) == 3;

  return v3;
}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  BOOL v8;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (-[AXSpringBoardServerSideAppManager canLaunchAsFloatingApplicationForIconView:](self, "canLaunchAsFloatingApplicationForIconView:", v4))
  {
    -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    v10 = MEMORY[0x24BDAC760];
    v11 = v5;
    AXPerformSafeBlock();
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("layoutAttributes"), v10, 3221225472, __77__AXSpringBoardServerSideAppManager_canLaunchAsPinnedApplicationForIconView___block_invoke, &unk_24DDE57E0);

    v8 = v7 & 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __77__AXSpringBoardServerSideAppManager_canLaunchAsPinnedApplicationForIconView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("icon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXSpringBoardServerSideAppManager canActivateMedusaForDock](self, "canActivateMedusaForDock")
    && -[AXSpringBoardServerSideAppManager _isDockIconView:](self, "_isDockIconView:", v4))
  {
    v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("supportsMultiwindow"));
    -[AXSpringBoardServerSideAppManager _bundleIdentifierForIconView:](self, "_bundleIdentifierForIconView:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerSideAppManager _appWithIdentifier:](self, "_appWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isMedusaCapable")) | v8;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_endDockIconActivationModeAfterTimeout
{
  void *v3;

  if (!-[AXSpringBoardServerSideAppManager dockIconActivationMode](self, "dockIconActivationMode"))
    _AXAssert();
  if (-[AXSpringBoardServerSideAppManager dockIconActivationMode](self, "dockIconActivationMode") == 3)
  {
    -[AXSpringBoardServerSideAppManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didFailToFloatAppForSideAppManager:", self);
LABEL_8:

    goto LABEL_9;
  }
  if (-[AXSpringBoardServerSideAppManager dockIconActivationMode](self, "dockIconActivationMode") == 1
    || -[AXSpringBoardServerSideAppManager dockIconActivationMode](self, "dockIconActivationMode") == 2)
  {
    -[AXSpringBoardServerSideAppManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didFailToPinAppForSideAppManager:", self);
    goto LABEL_8;
  }
LABEL_9:
  -[AXSpringBoardServerSideAppManager setDockIconActivationMode:](self, "setDockIconActivationMode:", 0);
}

- (id)_applicationController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_applicationController_AX_SBApplicationController;
  if (!_applicationController_AX_SBApplicationController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_applicationController_AX_SBApplicationController;
    _applicationController_AX_SBApplicationController = v3;

    v2 = (void *)_applicationController_AX_SBApplicationController;
  }
  return v2;
}

- (BOOL)_hasFloatingApp
{
  return (unint64_t)(-[AXSpringBoardServerSideAppManager _currentFloatingConfiguration](self, "_currentFloatingConfiguration")- 1) < 2;
}

- (BOOL)_hasPinnedApp
{
  int64_t v2;

  v2 = -[AXSpringBoardServerSideAppManager _currentSpaceConfiguration](self, "_currentSpaceConfiguration");
  return v2 == 4 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_addFloatingApplicationGesturesIfAllowed:(id)a3
{
  id v4;
  id v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v13 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v5 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  v6 = objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("layoutAttributes"), v13, 3221225472, __78__AXSpringBoardServerSideAppManager__addFloatingApplicationGesturesIfAllowed___block_invoke, &unk_24DDE57E0, self, &v14);
  v7 = -[AXSpringBoardServerSideAppManager _currentFloatingConfiguration](self, "_currentFloatingConfiguration");
  if ((unint64_t)(v7 - 3) < 2)
  {
    v9 = &unk_24DDF51F8;
LABEL_11:
    objc_msgSend(v4, "addObject:", v9);
    goto LABEL_12;
  }
  if (v7 == 1)
  {
    objc_msgSend(v4, "addObject:", &unk_24DDF5150);
    if ((v6 & 1) != 0)
    {
      v8 = &unk_24DDF5168;
      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(v4, "addObject:", &unk_24DDF5180);
    objc_msgSend(v4, "addObject:", &unk_24DDF5198);
    v9 = &unk_24DDF51B0;
    goto LABEL_11;
  }
  if (v7 == 2)
  {
    objc_msgSend(v4, "addObject:", &unk_24DDF51C8);
    if ((v6 & 1) != 0)
    {
      v8 = &unk_24DDF51E0;
LABEL_9:
      objc_msgSend(v4, "addObject:", v8);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_12:
  -[AXSpringBoardServerSideAppManager _firstFloatingAppLayout](self, "_firstFloatingAppLayout");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_msgSend(v4, "containsObject:", &unk_24DDF51F8);

    if ((v12 & 1) == 0)
      objc_msgSend(v4, "addObject:", &unk_24DDF51F8);
  }

}

void __78__AXSpringBoardServerSideAppManager__addFloatingApplicationGesturesIfAllowed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sceneLayoutState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementWithRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_addResizeGestureRecognizerGesturesIfAllowed:(id)a3
{
  int64_t v4;
  uint64_t v5;
  BOOL v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[AXSpringBoardServerSideAppManager _currentSpaceConfiguration](self, "_currentSpaceConfiguration");
  v5 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "activeInterfaceOrientation");
  if (v4 == 3 || (unint64_t)(v5 - 3) > 1)
  {
    v7 = v4 == 3 && (unint64_t)(v5 - 5) < 0xFFFFFFFFFFFFFFFELL;
    if (v4 == 4 || v7)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(v9, "addObject:", &unk_24DDF5210);
    if (v4 == 4)
      goto LABEL_14;
  }
  objc_msgSend(v9, "addObject:", &unk_24DDF5228);
  objc_msgSend(v9, "addObject:", &unk_24DDF5240);
  v8 = v9;
  if (v4 != 2)
  {
LABEL_14:
    objc_msgSend(v9, "addObject:", &unk_24DDF5258);
    objc_msgSend(v9, "addObject:", &unk_24DDF5270);
    v8 = v9;
  }
  objc_msgSend(v8, "addObject:", &unk_24DDF5288);
  objc_msgSend(v9, "addObject:", &unk_24DDF52A0);
  objc_msgSend(v9, "addObject:", &unk_24DDF52B8);
  objc_msgSend(v9, "addObject:", &unk_24DDF52D0);

}

- (void)_performMedusaGesture:(unint64_t)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  -[AXSpringBoardServerSideAppManager _currentSpaceConfiguration](self, "_currentSpaceConfiguration");
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  if (*((_BYTE *)v5 + 24))
    -[AXSpringBoardServerSideAppManager _requestFloatingAppSwitcherVisible](self, "_requestFloatingAppSwitcherVisible");
  else
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v21[5], v15[5], v9[5], v31[3], v27[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;

  v1 = (uint64_t *)(a1 + 88);
  switch(*(_QWORD *)(a1 + 88))
  {
    case 0:
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v5 = 3;
      goto LABEL_18;
    case 1:
    case 4:
      v3 = *(_QWORD *)(a1 + 72);
      goto LABEL_12;
    case 2:
    case 3:
      goto LABEL_16;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entityWithPreviousLayoutRole:", 3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entityWithPreviousLayoutRole:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v5 = *(_QWORD *)(a1 + 96);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v5 != 1)
        goto LABEL_18;
      goto LABEL_13;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "entityWithPreviousLayoutRole:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entityWithPreviousLayoutRole:", 3);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      v5 = *(_QWORD *)(a1 + 96);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v5 != 1)
        goto LABEL_18;
      goto LABEL_17;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "entityWithPreviousLayoutRole:", 2);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      v37 = 1;
      v38 = 1;
      goto LABEL_10;
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "entityWithPreviousLayoutRole:", 1);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v42 = *(void **)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v40;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v45 = *(void **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = v43;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      v37 = 2;
      v38 = 2;
LABEL_10:
      objc_msgSend(v35, "entityWithPreviousLayoutRole:", v38);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v48 = *(void **)(v47 + 40);
      *(_QWORD *)(v47 + 40) = v46;

      v49 = *(_QWORD *)(a1 + 64);
      goto LABEL_20;
    case 9:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v3 = *(_QWORD *)(a1 + 64);
LABEL_12:
      v4 = *(_QWORD *)(v3 + 8);
LABEL_13:
      v5 = 2;
      goto LABEL_18;
    case 0xALL:
      v5 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      goto LABEL_18;
    case 0xBLL:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "entityWithPreviousLayoutRole:", 2);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v53 = *(void **)(v52 + 40);
      *(_QWORD *)(v52 + 40) = v51;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v56 = *(void **)(v55 + 40);
      *(_QWORD *)(v55 + 40) = v54;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousEntity");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v59 = *(void **)(v58 + 40);
      *(_QWORD *)(v58 + 40) = v57;

LABEL_16:
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
LABEL_17:
      v5 = 4;
LABEL_18:
      *(_QWORD *)(v4 + 24) = v5;
      break;
    case 0xCLL:
      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 1;
      objc_msgSend(v60, "entityWithPreviousLayoutRole:", 1);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v63 = *(void **)(v62 + 40);
      *(_QWORD *)(v62 + 40) = v61;

      objc_msgSend(*(id *)(a1 + 32), "_sbEmptyEntity");
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v66 = *(void **)(v65 + 40);
      *(_QWORD *)(v65 + 40) = v64;

      objc_msgSend(*(id *)(a1 + 32), "_sbPreviousEntity");
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v69 = *(void **)(v68 + 40);
      *(_QWORD *)(v68 + 40) = v67;

      v49 = *(_QWORD *)(a1 + 72);
LABEL_20:
      *(_QWORD *)(*(_QWORD *)(v49 + 8) + 24) = v37;
      break;
    case 0xDLL:
    case 0xELL:
      AXPerformSafeBlock();
      break;
    case 0xFLL:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      break;
    case 0x10:
      AXLogSpringboardServer();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_cold_1(v1, v70);

      break;
    default:
      return;
  }
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_floatingAppRootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_toggleFloatingAppVisibility");

}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_floatingAppRootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_toggleFloatingAppVisibility");

}

- (void)_performSwipeOnFloatingAppSwitcher:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_appLayouts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_398);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController._currentFloatingAppLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && a3 == 16)
  {
    v10 = v8;
    if (v8 >= objc_msgSend(v6, "count") - 1)
    {
      v12 = 0;
    }
    else
    {
      v11 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", ++v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v12;
      }
      while (v10 < objc_msgSend(v6, "count") - 1);
    }
    v14 = v4;
    v13 = v12;
    AXPerformSafeBlock();

  }
}

BOOL __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeIntegerForKey:", CFSTR("environment")) == 2;
}

void __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_sbWorkspaceMainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_3;
  v8 = &unk_24DDE6A58;
  v3 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v4 = _Block_copy(&v5);
  objc_msgSend(v2, "requestTransitionWithOptions:builder:validator:", 0, v4, 0, v5, v6, v7, v8, v9);

}

void __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sbSwitcherTransitionRequestClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestForActivatingAppLayout:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v4, v6, *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setSource:", 18);

}

- (void)_requestTransactionWithPrimaryEntity:(id)a3 sideEntity:(id)a4 floatingEntity:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_4;
LABEL_7:
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!v12)
    goto LABEL_7;
LABEL_4:
  v16 = v10;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  AXPerformSafeBlock();

}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD aBlock[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "_sbWorkspaceMainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_2;
  aBlock[3] = &unk_24DDE6AD0;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 64);
  v3 = _Block_copy(aBlock);
  objc_msgSend(v2, "requestTransitionWithOptions:builder:validator:", 0, v3, 0);

}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_3;
  v5[3] = &unk_24DDE6AA8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "modifyApplicationContext:", v5);
  objc_msgSend(v4, "setSource:", 18);

}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setEntity:forLayoutRole:", v3, 1);
  objc_msgSend(v4, "setEntity:forLayoutRole:", a1[5], 2);
  objc_msgSend(v4, "setEntity:forLayoutRole:", a1[6], 3);
  objc_msgSend(v4, "setRequestedSpaceConfiguration:", a1[7]);
  objc_msgSend(v4, "setRequestedFloatingConfiguration:", a1[8]);

}

- (void)_requestFloatingAppSwitcherVisible
{
  AXPerformSafeBlock();
}

void __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_sbWorkspaceMainWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestTransitionWithOptions:builder:validator:", 0, &__block_literal_global_405, 0);

}

void __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "modifyApplicationContext:", &__block_literal_global_406);
  objc_msgSend(v2, "setSource:", 18);

}

uint64_t __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedFloatingSwitcherVisible:", 1);
}

- (void)launchApplication:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  NSClassFromString(CFSTR("SBApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__3;
    v12 = __Block_byref_object_dispose__3;
    v13 = 0;
    v6 = MEMORY[0x24BDAC760];
    v7 = v4;
    AXPerformSafeBlock();
    v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v5, 0, 0, 1, 0, v6, 3221225472, __55__AXSpringBoardServerSideAppManager_launchApplication___block_invoke, &unk_24DDE57E0);

  }
}

void __55__AXSpringBoardServerSideAppManager_launchApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SBDeviceApplicationSceneEntity"))), "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)launchApplicationWithFullConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  NSClassFromString(CFSTR("SBApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__3;
    v14 = __Block_byref_object_dispose__3;
    v15 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = v4;
    AXPerformSafeBlock();
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    -[AXSpringBoardServerSideAppManager _sbEmptyEntity](self, "_sbEmptyEntity", v8, 3221225472, __76__AXSpringBoardServerSideAppManager_launchApplicationWithFullConfiguration___block_invoke, &unk_24DDE57E0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v5, v6, v7, 1, 3);

  }
}

void __76__AXSpringBoardServerSideAppManager_launchApplicationWithFullConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SBDeviceApplicationSceneEntity"))), "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a4;
  v6 = a3;
  NSClassFromString(CFSTR("SBApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[AXSpringBoardServerSideAppManager _currentSpaceConfiguration](self, "_currentSpaceConfiguration");
    v8 = v7;
    if (v7 != 4 && v7 != 2)
    {
      if (v4)
        v8 = 2;
      else
        v8 = 4;
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    AXPerformSafeBlock();
    v23 = (id)v30[5];
    _Block_object_dispose(&v29, 8);

    -[AXSpringBoardServerSideAppManager _mainDisplaySceneManager](self, "_mainDisplaySceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v27 = v9;
    v28 = v6;
    AXPerformSafeBlock();
    v22 = v8;
    v10 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v24 = v28;
    v25 = v10;
    v26 = v27;
    AXPerformSafeBlock();
    v11 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v12 = v26;
    v13 = v11;
    AXPerformSafeBlock();
    v14 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v15 = v14;
    AXPerformSafeBlock();
    v16 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    if (v4)
      v17 = v16;
    else
      v17 = v23;
    if (v4)
      v18 = v23;
    else
      v18 = v16;
    v19 = v18;
    v20 = v17;
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v20, v19, v21, v22, 0);

  }
}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_sbPreviousWorkspaceEntityClass");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityWithPreviousLayoutRole:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newSceneIdentityForApplication:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_3(uint64_t a1)
{
  Class v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = NSClassFromString(CFSTR("SBApplicationSceneHandleRequest"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("displayIdentity"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[objc_class defaultRequestForApplication:sceneIdentity:displayIdentity:](v2, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v3, v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchOrCreateApplicationSceneHandleForRequest:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SBDeviceApplicationSceneEntity"))), "initWithApplicationSceneHandle:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)launchFloatingApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  NSClassFromString(CFSTR("SBApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerSideAppManager _sbPreviousEntity](self, "_sbPreviousEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__3;
    v14 = __Block_byref_object_dispose__3;
    v15 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = v4;
    AXPerformSafeBlock();
    v7 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v5, v6, v7, 0, 2, v8, 3221225472, __63__AXSpringBoardServerSideAppManager_launchFloatingApplication___block_invoke, &unk_24DDE57E0);

  }
}

void __63__AXSpringBoardServerSideAppManager_launchFloatingApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SBDeviceApplicationSceneEntity"))), "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_activeApplicationBundleIdentifiers
{
  id v2;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  AXPerformSafeBlock();
  v2 = v4;

  return v2;
}

uint64_t __72__AXSpringBoardServerSideAppManager__activeApplicationBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(&unk_24DDF54B8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&unk_24DDF54B8);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "integerValue");
        objc_msgSend(*(id *)(a1 + 32), "appForLayoutRole:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safeStringForKey:", CFSTR("bundleIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6 == 3)
        {
          objc_msgSend(*(id *)(a1 + 32), "sceneLayoutState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)(objc_msgSend(v9, "safeIntegerForKey:", CFSTR("floatingConfiguration")) - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {

            v8 = 0;
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:", v8);

        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(&unk_24DDF54B8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (id)_sbPreviousEntity
{
  void *v2;
  void *v3;

  -[AXSpringBoardServerSideAppManager _sbPreviousWorkspaceEntityClass](self, "_sbPreviousWorkspaceEntityClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("entity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sbEmptyEntity
{
  if (_sbEmptyEntity_onceToken != -1)
    dispatch_once(&_sbEmptyEntity_onceToken, &__block_literal_global_412);
  return (id)objc_msgSend((id)_sbEmptyEntity__sbPreviousWorkspaceClass, "safeValueForKey:", CFSTR("entity"));
}

Class __51__AXSpringBoardServerSideAppManager__sbEmptyEntity__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBEmptyWorkspaceEntity"));
  _sbEmptyEntity__sbPreviousWorkspaceClass = (uint64_t)result;
  return result;
}

- (id)_sbPreviousWorkspaceEntityClass
{
  if (_sbPreviousWorkspaceEntityClass_onceToken != -1)
    dispatch_once(&_sbPreviousWorkspaceEntityClass_onceToken, &__block_literal_global_413);
  return (id)_sbPreviousWorkspaceEntityClass__sbPreviousWorkspaceClass;
}

Class __68__AXSpringBoardServerSideAppManager__sbPreviousWorkspaceEntityClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBPreviousWorkspaceEntity"));
  _sbPreviousWorkspaceEntityClass__sbPreviousWorkspaceClass = (uint64_t)result;
  return result;
}

- (id)_sbSwitcherTransitionRequestClass
{
  if (_sbSwitcherTransitionRequestClass_onceToken != -1)
    dispatch_once(&_sbSwitcherTransitionRequestClass_onceToken, &__block_literal_global_414);
  return (id)_sbSwitcherTransitionRequestClass__sbSwitcherTransitionRequestClass;
}

Class __70__AXSpringBoardServerSideAppManager__sbSwitcherTransitionRequestClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBSwitcherTransitionRequest"));
  _sbSwitcherTransitionRequestClass__sbSwitcherTransitionRequestClass = (uint64_t)result;
  return result;
}

- (id)_sbWorkspaceMainWorkspace
{
  if (_sbWorkspaceMainWorkspace_onceToken != -1)
    dispatch_once(&_sbWorkspaceMainWorkspace_onceToken, &__block_literal_global_415);
  return (id)objc_msgSend((id)_sbWorkspaceMainWorkspace__sbWorkSpaceClass, "safeValueForKey:", CFSTR("mainWorkspace"));
}

Class __62__AXSpringBoardServerSideAppManager__sbWorkspaceMainWorkspace__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBWorkspace"));
  _sbWorkspaceMainWorkspace__sbWorkSpaceClass = (uint64_t)result;
  return result;
}

- (int64_t)_currentFloatingConfiguration
{
  void *v2;
  int64_t v3;

  -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("floatingConfiguration"));

  return v3;
}

- (int64_t)_currentSpaceConfiguration
{
  void *v2;
  int64_t v3;

  -[AXSpringBoardServerSideAppManager sceneLayoutState](self, "sceneLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("spaceConfiguration"));

  return v3;
}

- (id)sceneLayoutState
{
  void *v2;
  void *v3;

  -[AXSpringBoardServerSideAppManager _mainDisplaySceneManager](self, "_mainDisplaySceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("currentLayoutState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_floatingAppRootViewController
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_firstFloatingAppLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AXSpringBoardServerSideAppManager _floatingAppRootViewController](self, "_floatingAppRootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("appLayouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_416);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __60__AXSpringBoardServerSideAppManager__firstFloatingAppLayout__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeIntegerForKey:", CFSTR("environment")) == 2;
}

- (id)_mainDisplaySceneManager
{
  return (id)objc_msgSend((id)objc_opt_class(), "_mainDisplaySceneManager");
}

+ (id)_mainDisplaySceneManager
{
  void *v2;

  if (AXSpringBoardIsReadyToBeProbed())
  {
    if (_mainDisplaySceneManager_onceToken != -1)
      dispatch_once(&_mainDisplaySceneManager_onceToken, &__block_literal_global_417);
    objc_msgSend((id)_mainDisplaySceneManager__axSBSceneManagerCoordinatorClass, "safeValueForKey:", CFSTR("mainDisplaySceneManager"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

Class __61__AXSpringBoardServerSideAppManager__mainDisplaySceneManager__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBSceneManagerCoordinator"));
  _mainDisplaySceneManager__axSBSceneManagerCoordinatorClass = (uint64_t)result;
  return result;
}

- (AXSpringBoardServerSideAppManagerDelegate)delegate
{
  return (AXSpringBoardServerSideAppManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_21AC77000, a2, OS_LOG_TYPE_ERROR, "Attempting to perform invalid gesture: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)_isDockIconView:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationDock(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerSideAppManager.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_isDockIconView:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationFloatingDock(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerSideAppManager.m"), 21, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
