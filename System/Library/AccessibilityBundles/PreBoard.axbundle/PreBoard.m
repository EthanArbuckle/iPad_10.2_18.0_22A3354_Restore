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
    MEMORY[0x23491A6B4]();
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2503118B8, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v8;
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

void sub_23290617C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_2329062E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_232906A9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x24BE00420]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

