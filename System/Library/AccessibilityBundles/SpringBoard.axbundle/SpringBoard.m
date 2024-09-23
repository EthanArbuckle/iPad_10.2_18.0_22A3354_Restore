id accessibilityLocalizedString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  if (accessibilityBundle_axBundle)
  {
    v2 = (id)accessibilityBundle_axBundle;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    MEMORY[0x23491F3D8]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("SpringBoard.axbundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)accessibilityBundle_axBundle;
    accessibilityBundle_axBundle = v6;

    v2 = (id)accessibilityBundle_axBundle;
    if (!v2)
    {
      v8 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25036C388, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v8;
}

id AXSwitcherController(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a1;
  v4 = a2;
  AXWindowScene(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v8 = v4;
  v9 = v5;
  AXPerformSafeBlock();
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_232A0DE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXWindowScene(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("windowSceneManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AXSBMainSwitcherControllerCoordinatorSharedInstance()
{
  uint64_t v0;
  void *v1;

  if (!AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance
    && NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;
    AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance = v0;

  }
  return (id)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;
}

void sub_232A0E664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232A0E724(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t _appTransitionOccurred()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void sub_232A0EA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_232A0EC54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t ___appTransitionOccurred_block_invoke()
{
  uint64_t result;

  if (__axClient)
    return +[AXSpringBoardGlue toggleVoiceOverInfoPanel](AXSpringBoardGlue, "toggleVoiceOverInfoPanel");
  return result;
}

void sub_232A0F2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v13 - 184));
  _Unwind_Resume(a1);
}

void sub_232A0F41C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A0F524(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A0F62C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A0F734(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A0FBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _frontBoardCategoriesDidInstall()
{
  void *v0;
  __CFNotificationCenter *LocalCenter;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_945, CFSTR("SB - SpringBoardAccessibility"), CFSTR("SB - SpringBoardAccessibility"), 0.0);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, 0, (CFNotificationName)*MEMORY[0x24BDFE630], 0);
}

uint64_t _StackshotTaken()
{
  uint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  result = UIAccessibilityIsVoiceOverRunning();
  if ((_DWORD)result)
  {
    if (_StackshotTaken_onceToken != -1)
      dispatch_once(&_StackshotTaken_onceToken, &__block_literal_global_952);
    v1 = *MEMORY[0x24BDB6D30];
    v2[0] = &unk_2503817B0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
    return AudioServicesPlaySystemSoundWithOptions();
  }
  return result;
}

uint64_t AXSpringBoardGlueSBLockScreenControllerInstance()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    v0 = NSClassFromString(CFSTR("SBLockScreenManager"));
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v0;
  }
  return -[objc_class safeValueForKey:](v0, "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
}

uint64_t AXSpringBoardFrameworkGlueSBLockScreenControllerInstance()
{
  if (AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_onceToken != -1)
    dispatch_once(&AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_onceToken, &__block_literal_global_916);
  return objc_msgSend((id)AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_SBLockScreenManagerClass, "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
}

uint64_t AXSpringBoardIsAssistantVisible()
{
  return -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeBoolForKey:", CFSTR("isVisible"));
}

Class AXSpringBoardGlueSBTelephonyManagerClass()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBTelephonyManagerClass_class;
  if (!AXSpringBoardGlueSBTelephonyManagerClass_class)
  {
    v0 = NSClassFromString(CFSTR("SBTelephonyManager"));
    AXSpringBoardGlueSBTelephonyManagerClass_class = (uint64_t)v0;
  }
  return v0;
}

Class AXSpringBoardGlueSBUIControllerClass()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBUIControllerClass_class;
  if (!AXSpringBoardGlueSBUIControllerClass_class)
  {
    v0 = NSClassFromString(CFSTR("SBUIController"));
    AXSpringBoardGlueSBUIControllerClass_class = (uint64_t)v0;
  }
  return v0;
}

id AXSBUIControllerSharedInstance()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  if (!AXSBUIControllerSharedInstance_SharedInstance)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBUIController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
    AXSBUIControllerSharedInstance_SharedInstance = v1;

    v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  }
  return v0;
}

id AXSBLockScreenViewController()
{
  void *v0;
  void *v1;

  AXSBLockScreenEnvironment();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("rootViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

BOOL AXSpringBoardIsReadyToBeProbed()
{
  void *v0;
  _BOOL8 v1;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

Class AXSpringBoardGlueSBPlatformController()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBPlatformController_class;
  if (!AXSpringBoardGlueSBPlatformController_class)
  {
    v0 = NSClassFromString(CFSTR("SBPlatformController"));
    AXSpringBoardGlueSBPlatformController_class = (uint64_t)v0;
  }
  return v0;
}

uint64_t ___frontBoardCategoriesDidInstall_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SpringBoardAccessibility"), 1);
}

id AXSBFloatingDockControllerFromActiveDisplayWindowScene()
{
  void *v0;
  void *v1;

  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("floatingDockController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

Class AXSpringBoardGlueSBIconControllerClass()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBIconControllerClass_class;
  if (!AXSpringBoardGlueSBIconControllerClass_class)
  {
    v0 = NSClassFromString(CFSTR("SBIconController"));
    AXSpringBoardGlueSBIconControllerClass_class = (uint64_t)v0;
  }
  return v0;
}

id AXSBHIconManagerFromSharedIconController()
{
  void *v0;
  void *v1;

  AXSBIconControllerSharedInstance();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("iconManager"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSBIconControllerSharedInstance()
{
  uint64_t v0;
  void *v1;

  if (!AXSBIconControllerSharedInstance_SharedInstance && NSClassFromString(CFSTR("SBIconController")))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)AXSBIconControllerSharedInstance_SharedInstance;
    AXSBIconControllerSharedInstance_SharedInstance = v0;

  }
  return (id)AXSBIconControllerSharedInstance_SharedInstance;
}

id AXSBAssistantControllerSharedInstance()
{
  uint64_t v0;
  void *v1;

  if (!AXSBAssistantControllerSharedInstance_SharedInstance && NSClassFromString(CFSTR("SBAssistantController")))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)AXSBAssistantControllerSharedInstance_SharedInstance;
    AXSBAssistantControllerSharedInstance_SharedInstance = v0;

  }
  return (id)AXSBAssistantControllerSharedInstance_SharedInstance;
}

id AXSBApplicationControllerSharedInstance()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
  if (!AXSBApplicationControllerSharedInstance_SharedInstance)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
    AXSBApplicationControllerSharedInstance_SharedInstance = v1;

    v0 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
  }
  return v0;
}

id AXSBScrollDescriptionForCurrentPage(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("_accessibilityIconListCount"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("springboard.page.status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a1, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXSBFolderControllerIsRootFolder())
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentFolderController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("firstIconPageIndex"));
    if (v9 - objc_msgSend(v8, "safeIntegerForKey:", CFSTR("minimumPageIndex")) == a1)
    {
      v10 = CFSTR("home");
    }
    else
    {
      v11 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("leadingCustomViewPageIndex"));
      if (v11 - objc_msgSend(v8, "safeIntegerForKey:", CFSTR("minimumPageIndex")) != a1)
      {
LABEL_7:

        goto LABEL_8;
      }
      v10 = CFSTR("today.visible.key");
    }
    accessibilityLocalizedString(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

BOOL AXSBFolderControllerIsRootFolder()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  AXSBIconControllerSharedInstance();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("_currentFolderController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeUnsignedIntegerForKey:", CFSTR("_depth")) == 0;

  return v2;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id AXSwitcherViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a1;
  v4 = a2;
  AXSwitcherController(v3, v4);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_232A15654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXLibraryViewController(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("overlayLibraryViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXSBIconControllerSharedInstance();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isModalAppLibrarySupported"));

  if (v5)
  {
    AXWindowScene(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("modalLibraryController.libraryViewController"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

id AXControlCenterPageStatus(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("favorite")) & 1) != 0)
  {
    v6 = CFSTR("favorites");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("nowPlaying")) & 1) != 0)
  {
    v6 = CFSTR("now.playing");
  }
  else
  {
    v6 = CFSTR("home");
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("home")) & 1) == 0)
    {
      v6 = CFSTR("connectivity");
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("connectivity")) & 1) == 0)
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("tvRemote")))
        {
          v7 = 0;
          goto LABEL_10;
        }
        v6 = CFSTR("tv.remote");
      }
    }
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("springboard.page.status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, a1 + 1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_232A16504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_232A172A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_232A17824(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A17950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A17C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A18C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A19F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A1B0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_232A1C500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_232A1D1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_232A20758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A20A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_232A20CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A21070(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_232A21138(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A21294(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232A2165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A22098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A222BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

void sub_232A22484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A2357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A23F50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_232A244F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232A24A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A25490(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

int *OUTLINED_FUNCTION_3()
{
  return __error();
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

void sub_232A2CB8C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_232A2D350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A2D624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_232A2DBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_232A2E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _SERVER_SBVOTMIGRegisterSpringBoardVoiceOver(mach_port_t a1, _DWORD *a2)
{
  ipc_space_t *v4;
  uint64_t v5;
  void *v6;
  int v8;
  mach_port_name_t name[2];

  *(_QWORD *)name = 0;
  v4 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v5 = *MEMORY[0x24BDAEC58];
  v8 = 1;
  mach_port_allocate(v5, 1u, &name[1]);
  mach_port_insert_right(v5, name[1], name[1], 0x14u);
  MEMORY[0x23491F930](v5, name[1], 1, &v8, 4);
  mach_port_request_notification(*v4, name[1], 72, 0, a1, 0x15u, name);
  +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_registerVOTConnectionWithPort:", name[1]);

  *a2 = name[1];
  return 0;
}

uint64_t _SERVER_SBVOTMIGPostSpringBoardVoiceOverData(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, unsigned int a6)
{
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  if (!_SBVOTPort)
    return 5;
  AXUnserializeWrapper();
  if (a2 > 1520)
  {
    if (a2 == 1521)
    {
      +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_programmaticAppSwitch:", objc_msgSend(0, "BOOLValue"));
    }
    else
    {
      if (a2 != 1524)
        goto LABEL_19;
      v15 = objc_msgSend(0, "BOOLValue");
      +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInVoiceOverPassthroughMode:", v15);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (a2 == 1512)
  {
    +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScreenCurtainEnabled:", objc_msgSend(0, "BOOLValue"));
    goto LABEL_18;
  }
  if (a2 == 1519)
  {
    +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isUILocked") & 1) == 0)
    {
      v10 = +[AXSpringBoardGlue isBuddyRunning](AXSpringBoardGlue, "isBuddyRunning");

      if (v10)
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(0, "count"))
        goto LABEL_19;
      objc_msgSend(0, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      v9 = 0;
      if (objc_msgSend(0, "count") == 2)
      {
        objc_msgSend(0, "objectAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLabelElementPanelVisible:initialValue:", v12, v9);

    }
    goto LABEL_18;
  }
LABEL_19:
  if (a5)
  {
    if (a6)
      munmap(a5, a6);
  }
  return 0;
}

void _voiceOverTouchDied()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x23491F978]();
  LOBYTE(v2) = 1;
  _AXLogWithFacility();
  +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection", v2, CFSTR("VoiceOverTouch died..."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tearDownVoiceOverTouchConnection");

  objc_autoreleasePoolPop(v0);
}

void sub_232A313AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232A31C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_232A34D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A354E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_232A35CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A3658C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232A3692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXSpringBoardScreenCurtainEnabled()
{
  return _SBAXScreenCurtainEnabled;
}

uint64_t AXSpringBoardSetScreenCurtainIsBeingEnabled(uint64_t result)
{
  _IsScreenCurtainBeingEnabled = result;
  return result;
}

uint64_t AXSpringBoardScreenCurtainIsBeingEnabled()
{
  return _IsScreenCurtainBeingEnabled;
}

uint64_t AXSpringBoardSetScreenCurtainEnabled(uint64_t result)
{
  char v1;
  void *v2;
  int v3;

  if (_SBAXScreenCurtainEnabled != (_DWORD)result)
  {
    v1 = result;
    _IsScreenCurtainBeingEnabled = 1;
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isScreenLockedWithPasscode:", 0);

    if (v3)
      AXPerformSafeBlock();
    _SBAXScreenCurtainEnabled = v1;
    result = AXPerformSafeBlock();
    _IsScreenCurtainBeingEnabled = 0;
  }
  return result;
}

id accessibilityBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)accessibilityBundle_axBundle_0;
  if (!accessibilityBundle_axBundle_0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)accessibilityBundle_axBundle_0;
    accessibilityBundle_axBundle_0 = v1;

    v0 = (void *)accessibilityBundle_axBundle_0;
  }
  return v0;
}

double SBMainScreenSize()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  if ((SBMainScreenSize_DidInit & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bounds");
    SBMainScreenSize_ScreenSize_0 = v1;
    SBMainScreenSize_ScreenSize_1 = v2;

    SBMainScreenSize_DidInit = 1;
  }
  return *(double *)&SBMainScreenSize_ScreenSize_0;
}

id AXSBLayoutState()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDFF2A0], "sharedServerHelper");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sceneLayoutState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardFloatingAppLabel()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("displayName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardAppForLayoutRole(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDFF2A0], "sharedServerHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appForLayoutRole:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXSpringBoardSideAppLabel()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("displayName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardPrimaryAppLabel()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("displayName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardFloatingBundleID()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardSideAppBundleID()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXSpringBoardPrimaryBundleID()
{
  void *v0;
  void *v1;

  AXSpringBoardAppForLayoutRole(1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

Class __getFCActivityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!FocusLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250368998;
    v5 = 0;
    FocusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FocusLibraryCore_frameworkLibrary)
    __getFCActivityManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FCActivityManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFCActivityManagerClass_block_invoke_cold_2();
  getFCActivityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_232A38ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_232A3A644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t (*SBVOTDefs_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 6738136) >= 0xFFFFFFFE)
    return _SERVER_SBVOTMIGSBVOTDefs_subsystem[5 * (v1 - 6738134) + 5];
  else
    return 0;
}

_DWORD *_XRegisterSpringBoardVoiceOver(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_QWORD *)(a2 + 32) = 0x10000000000000;
  result = (_DWORD *)_SERVER_SBVOTMIGRegisterSpringBoardVoiceOver(result[3], (_DWORD *)(a2 + 28));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 40;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XPostSpringBoardVoiceOverData(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(_DWORD *)(result + 4);
  if (v4 < 0x40 || v4 > 0x1040)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_15;
  v6 = *(unsigned int *)(result + 56);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  v3 = -304;
  if (v4 - 64 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 64)
    goto LABEL_3;
  v8 = *(_DWORD *)(result + 40);
  if (v8 != *(_DWORD *)(result + v7 + 60))
  {
LABEL_15:
    v3 = -300;
    goto LABEL_3;
  }
  result = _SERVER_SBVOTMIGPostSpringBoardVoiceOverData(*(unsigned int *)(result + 12), *(_DWORD *)(result + 52), result + 60, v6, *(void **)(result + 28), v8);
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

uint64_t SBVOTDefs_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 6738136) >= 0xFFFFFFFE
    && (v5 = (void (*)(void))_SERVER_SBVOTMIGSBVOTDefs_subsystem[5 * (v4 - 6738134) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void __getFCActivityManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FocusLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SpringBoardAccessibility.m"), 46, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFCActivityManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFCActivityManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SpringBoardAccessibility.m"), 47, CFSTR("Unable to find class %s"), "FCActivityManager");

  __break(1u);
  AXCFormattedString();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFDF80]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXCurrentProcessExistsInLoginSessionSBOnly()
{
  return MEMORY[0x24BDFDFA0]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x24BDFFF60]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x24BDFDFC8]();
}

uint64_t AXDeviceIsD7x()
{
  return MEMORY[0x24BDFDFE8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x24BDFE010]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
}

uint64_t AXFrontBoardFocusedAppProcesses()
{
  return MEMORY[0x24BDFE668]();
}

uint64_t AXFrontBoardRunningAppProcesses()
{
  return MEMORY[0x24BDFE6C0]();
}

uint64_t AXFrontBoardSystemAppProcess()
{
  return MEMORY[0x24BDFE6E0]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x24BDFE070]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x24BDFE138]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x24BDFE188]();
}

uint64_t AXLogSpringboardServer()
{
  return MEMORY[0x24BDFE1A0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXMediaLogCommon()
{
  return MEMORY[0x24BDFE228]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x24BED1FE8]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BDFE238]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE268]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXProcessIsCarPlay()
{
  return MEMORY[0x24BDFE2A0]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BDFE2E0]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSBApplicationWithIdentifier()
{
  return MEMORY[0x24BDFF290]();
}

uint64_t AXSBLockScreenEnvironment()
{
  return MEMORY[0x24BDFF298]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXSetPipPid()
{
  return MEMORY[0x24BDFE958]();
}

uint64_t AXSpokenNameLabelForBundleURL()
{
  return MEMORY[0x24BDFE6F0]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x24BDFE3B0]();
}

uint64_t AXTentativePidSuspend()
{
  return MEMORY[0x24BDFE960]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x24BDFFA00]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x24BDFFA18]();
}

uint64_t AXUnserializeWrapper()
{
  return MEMORY[0x24BDFEA20]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x24BDB6960](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x24BDB6990]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x24BE0B4F8]();
}

uint64_t BKSHIDEventGetSourceFromKeyboardEvent()
{
  return MEMORY[0x24BE0B558]();
}

uint64_t BKSHIDServicesSetBacklightFactorPending()
{
  return MEMORY[0x24BE0B608]();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration()
{
  return MEMORY[0x24BE0B610]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFC8](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x24BDBBFE0](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t FKALogCommon()
{
  return MEMORY[0x24BDFE450]();
}

uint64_t MSHCreateMIGServerSource()
{
  return MEMORY[0x24BDFEA48]();
}

uint64_t MSHGetMachPortFromSource()
{
  return MEMORY[0x24BDFEA58]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SBProgrammaticSwitchAppGestureMoveToLeft()
{
  return MEMORY[0x24BEB0BB0]();
}

uint64_t SBProgrammaticSwitchAppGestureMoveToRight()
{
  return MEMORY[0x24BEB0BB8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return MEMORY[0x24BEBAE30]();
}

uint64_t UIAXPrivateLocalizedString()
{
  return MEMORY[0x24BEBAE70]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDF7218](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x24BDF7220](path, view);
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x24BDF7240](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x24BDF72A0]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x24BDF7CE8]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x24BDFE508]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSAccessibilityGetBooleaniTunesPreference()
{
  return MEMORY[0x24BED2008]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSAssistiveTouchHardwareEnabled()
{
  return MEMORY[0x24BED2058]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSForcePreferenceUpdate()
{
  return MEMORY[0x24BED21E8]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXSHearingAidsPaired()
{
  return MEMORY[0x24BED2270]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x24BED2518]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x24BEBB290]();
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BDF8058]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x24BDF8090]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BDFE560]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BDFE570]();
}

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x24BDFE588]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

uint64_t __UIAccessibilitySetAssociatedCopiedObject()
{
  return MEMORY[0x24BDFE5E0]();
}

uint64_t __UIAccessibilitySetAssociatedInt()
{
  return MEMORY[0x24BDFE5E8]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x24BDAD300]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x24BDADC38](dirp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

