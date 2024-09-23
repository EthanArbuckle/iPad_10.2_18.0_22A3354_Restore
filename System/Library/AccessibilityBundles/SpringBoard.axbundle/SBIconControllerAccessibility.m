@implementation SBIconControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_currentFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("presentLibraryForIconManager:windowScene:animated:"), "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("presentTodayOverlayForIconManager:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("dismissTodayOverlay"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("dismissHomeScreenOverlaysAnimated:completion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("todayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("overlayLibraryViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("isMainDisplayLibraryViewVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("isTodayOverlayPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBTodayViewController"), CFSTR("SBHTodayViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHTodayViewController"), CFSTR("listView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryViewController"), CFSTR("containerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibrarySearchController"), CFSTR("searchBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHSearchBar"), CFSTR("searchTextField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("currentPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("minimumPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isFolderIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("isFull"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isLeafIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("nodeIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("openedFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("closeFolderAnimated:withCompletion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderIcon"), CFSTR("_folder"), "SBFolder");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("homeScreenViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenViewController"), CFSTR("iconContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconDragManager"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconDragManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("performSpringLoadedInteractionForIconDragOnIconView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("containsNodeIdentifier:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderController"), CFSTR("_contentView"), "SBFolderView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("setCurrentPageIndex:animated:"), "B", "q", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderView"), CFSTR("_pageControl"), "SBIconListPageControl");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_rootFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("rootFolderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("_overscrollScrollPanGestureRecognizerDidUpdate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenDefaults"), CFSTR("isSidebarPinned"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("_captureInitialSearchScrollTrackingState"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("_cleanUpAfterScrolling"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("dndStateService"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("isModalAppLibrarySupported"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("modalLibraryController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBModalLibraryController"), CFSTR("libraryViewController"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("SBDefaults"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBDefaults"), CFSTR("localDefaults"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLocalDefaults"), CFSTR("homeScreenDefaults"), "@", 0);

}

- (SBIconControllerAccessibility)init
{
  SBIconControllerAccessibility *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBIconControllerAccessibility;
  v2 = -[SBIconControllerAccessibility init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilityVoiceOverStatusChanged, *MEMORY[0x24BDF7458], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__accessibilitySwitchControlStatusChanged, *MEMORY[0x24BDF7380], 0);

  }
  return v2;
}

- (void)_accessibilitySwitchControlStatusChanged
{
  if (!UIAccessibilityIsSwitchControlRunning())
    -[SBIconControllerAccessibility _accessibilityStatusChanged](self, "_accessibilityStatusChanged");
}

- (void)_accessibilityVoiceOverStatusChanged
{
  if (!UIAccessibilityIsVoiceOverRunning())
    -[SBIconControllerAccessibility _accessibilityStatusChanged](self, "_accessibilityStatusChanged");
}

- (id)_axLabelForIcons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v11;
  const __CFString *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_25036C388;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "accessibilityLabel", v11, v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v5);
  }
  else
  {
    v7 = &stru_25036C388;
  }

  return v7;
}

- (void)_accessibilityMarkIconAsAnimating:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
  v7 = v3;
  if (!SBAXDroppedIconsAnimatingIntoPlace)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
    SBAXDroppedIconsAnimatingIntoPlace = (uint64_t)v5;

    v3 = v7;
    v4 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
  }
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) == 0)
    objc_msgSend((id)SBAXDroppedIconsAnimatingIntoPlace, "axSafelyAddObject:", v7);

}

- (BOOL)_accessibilityCloseOpenFolder
{
  AXPerformSafeBlock();
  return 1;
}

void __62__SBIconControllerAccessibility__accessibilityCloseOpenFolder__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("iconManager"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "closeFolderAnimated:withCompletion:", 1, 0);

}

- (int64_t)_accessibilityIconListIndex
{
  void *v2;
  int64_t v3;

  -[SBIconControllerAccessibility _axCurrentPageControl](self, "_axCurrentPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentPage");

  return v3;
}

- (int64_t)_accessibilityIconListCount
{
  void *v2;
  int64_t v3;

  -[SBIconControllerAccessibility _axCurrentPageControl](self, "_axCurrentPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfPages");

  return v3;
}

- (id)_axCurrentPageControl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBIconControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_pageControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axDragManager
{
  return (id)-[SBIconControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconDragManager"));
}

- (id)_axIconScrollView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBIconControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("homeScreenViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("iconContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("SBIconScrollView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_axShowTodayView
{
  void *v3;

  if (-[SBIconControllerAccessibility _axIsShowingAppLibrary](self, "_axIsShowingAppLibrary"))
    -[SBIconControllerAccessibility _axHideAppLibrary](self, "_axHideAppLibrary");
  AXPerformSafeBlock();
  accessibilityLocalizedString(CFSTR("did.show.today.view.announcement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

void __49__SBIconControllerAccessibility__axShowTodayView__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  AXSBHIconManagerFromSharedIconController();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentTodayOverlayForIconManager:", v2);

}

- (void)_axHideTodayView
{
  int64_t v3;
  unsigned int IsPad;
  void *v5;

  if (-[SBIconControllerAccessibility _axIsShowingHomeScreenTodayView](self, "_axIsShowingHomeScreenTodayView"))
  {
    AXPerformSafeBlock();
    v3 = -[SBIconControllerAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex");
    IsPad = AXDeviceIsPad();
    AXSBScrollDescriptionForCurrentPage(v3 + IsPad);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

uint64_t __49__SBIconControllerAccessibility__axHideTodayView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissTodayOverlay");
}

- (void)_axShowAppLibrary
{
  void *v2;
  void *v3;
  void *v4;

  AXPerformSafeBlock();
  AXLibraryViewController(CFSTR("activeDisplayWindowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("containerViewController.searchBar.searchTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("did.show.app.library.announcement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v3);
}

void __50__SBIconControllerAccessibility__axShowAppLibrary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  AXSBHIconManagerFromSharedIconController();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentLibraryForIconManager:windowScene:animated:", v3, v2, 1);

}

- (void)_axHideAppLibrary
{
  if (-[SBIconControllerAccessibility _axIsShowingAppLibrary](self, "_axIsShowingAppLibrary"))
    AXPerformSafeBlock();
}

uint64_t __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke_2;
  v3[3] = &unk_250367C40;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissHomeScreenOverlaysAnimated:completion:", 1, v3);
}

void __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  unsigned int IsPad;
  id v3;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityCurrentPageIndex");
  IsPad = AXDeviceIsPad();
  AXSBScrollDescriptionForCurrentPage(v1 + IsPad);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (BOOL)_axIsShowingAppLibrary
{
  void *v2;
  char v3;

  AXSBHIconManagerFromSharedIconController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isMainDisplayLibraryViewVisible"));

  return v3;
}

- (BOOL)_axIsShowingHomeScreenTodayView
{
  return -[SBIconControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTodayOverlayPresented"));
}

- (BOOL)_axIsSidebarPinned
{
  void *v2;
  char v3;

  -[objc_class safeValueForKeyPath:](NSClassFromString(CFSTR("SBDefaults")), "safeValueForKeyPath:", CFSTR("localDefaults.homeScreenDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSidebarPinned"));

  return v3;
}

- (BOOL)_axNeedsToDismissHomeScreenTodayView
{
  return !-[SBIconControllerAccessibility _axIsSidebarPinned](self, "_axIsSidebarPinned")
      && -[SBIconControllerAccessibility _axIsShowingHomeScreenTodayView](self, "_axIsShowingHomeScreenTodayView");
}

- (int64_t)_accessibilityCurrentPageIndex
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[SBIconControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("currentPageIndex"));
  v4 = v3 - objc_msgSend(v2, "safeIntegerForKey:", CFSTR("minimumPageIndex"));

  return v4;
}

@end
