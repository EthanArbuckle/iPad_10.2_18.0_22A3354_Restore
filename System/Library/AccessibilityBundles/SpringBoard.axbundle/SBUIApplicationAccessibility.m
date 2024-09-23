@implementation SBUIApplicationAccessibility

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
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_accessibilitySpeakThisViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_accessibilityTitleBarElement"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_rootFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("homeScreenOverlayController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBRootFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isLeadingCustomViewVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("todayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBLockScreenManager"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("coverSheetViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CSCoverSheetViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("isShowingTodayView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_indexOfTodayPage"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("pageViewControllerAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("overlayController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSpotlightMultiplexingViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBSpotlightMultiplexingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSpotlightMultiplexingViewController"), CFSTR("sharedRemoteSearchViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("mainPageContentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSMainPageContentViewController"), CFSTR("combinedListViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCombinedListViewController"), CFSTR("_structuredListViewController"), "NCNotificationStructuredListViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("overlayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("isPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayViewController"), CFSTR("leadingSidebarViewController"), "@", 0);

}

- (unint64_t)_accessibilityAutomationType
{
  return 1;
}

- (id)_accessibilitySpeakThisViewController
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!-[SBUIApplicationAccessibility _accessibilityOverlayTodayViewIsVisible](self, "_accessibilityOverlayTodayViewIsVisible"))
  {
    if (-[SBUIApplicationAccessibility _accessibilityLeftOfHomeTodayViewIsVisible](self, "_accessibilityLeftOfHomeTodayViewIsVisible"))
    {
      -[SBUIApplicationAccessibility _accessibilityRootFolderController](self, "_accessibilityRootFolderController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = 0;
      objc_opt_class();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("todayViewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (-[SBUIApplicationAccessibility _accessibilityLeftOfLockTodayViewIsVisible](self, "_accessibilityLeftOfLockTodayViewIsVisible"))
    {
      -[SBUIApplicationAccessibility _accessibilityCoverSheetViewController](self, "_accessibilityCoverSheetViewController");
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__9;
      v13 = __Block_byref_object_dispose__9;
      v14 = 0;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      v4 = (id)v10[5];

      _Block_object_dispose(&v9, 8);
    }
    else
    {
      if (-[SBUIApplicationAccessibility _accessibilitySpotlightIsVisible](self, "_accessibilitySpotlightIsVisible"))
      {
        LOBYTE(v9) = 0;
        objc_opt_class();
        -[SBUIApplicationAccessibility _accessibilitySpotlightMultiplexingViewController](self, "_accessibilitySpotlightMultiplexingViewController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "safeValueForKey:", CFSTR("sharedRemoteSearchViewController"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_3;
      }
      -[SBUIApplicationAccessibility _accessibilityCoverSheetViewController](self, "_accessibilityCoverSheetViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("mainPageContentViewController.combinedListViewController._structuredListViewController"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return v4;
  }
  LOBYTE(v9) = 0;
  objc_opt_class();
  -[SBUIApplicationAccessibility _accessibilityTodayOverlayController](self, "_accessibilityTodayOverlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:

  return v4;
}

void __69__SBUIApplicationAccessibility__accessibilitySpeakThisViewController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "pageViewControllerAtIndex:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", CFSTR("_indexOfTodayPage")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("overlayController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("overlayViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("leadingSidebarViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("application.name"));
}

- (id)_accessibilityTitleBarElement
{
  objc_super v4;

  if (-[SBUIApplicationAccessibility _accessibilityLeftOfHomeTodayViewIsVisible](self, "_accessibilityLeftOfHomeTodayViewIsVisible")|| -[SBUIApplicationAccessibility _accessibilityLeftOfLockTodayViewIsVisible](self, "_accessibilityLeftOfLockTodayViewIsVisible"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBUIApplicationAccessibility;
  -[SBUIApplicationAccessibility _accessibilityTitleBarElement](&v4, sel__accessibilityTitleBarElement);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilitySpotlightIsVisible
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_opt_class();
  -[SBUIApplicationAccessibility _accessibilitySpotlightMultiplexingViewController](self, "_accessibilitySpotlightMultiplexingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "_appearState") == 2;
  return v5;
}

- (BOOL)_accessibilityOverlayTodayViewIsVisible
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("homeScreenOverlayController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresented"));

  return v4;
}

- (id)_accessibilityTodayOverlayController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("homeScreenOverlayController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("overlayViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("leadingSidebarViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_accessibilityLeftOfHomeTodayViewIsVisible
{
  void *v2;
  char v3;

  -[SBUIApplicationAccessibility _accessibilityRootFolderViewController](self, "_accessibilityRootFolderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isLeadingCustomViewVisible"));

  return v3;
}

- (BOOL)_accessibilityLeftOfLockTodayViewIsVisible
{
  void *v2;
  char v3;

  -[SBUIApplicationAccessibility _accessibilityCoverSheetViewController](self, "_accessibilityCoverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isShowingTodayView"));

  return v3;
}

- (id)_accessibilitySpotlightMultiplexingViewController
{
  return (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSpotlightMultiplexingViewController")), "safeValueForKey:", CFSTR("sharedRemoteSearchViewController"));
}

- (id)_accessibilityRootFolderController
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_rootFolderController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityRootFolderViewController
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_rootFolderController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityCoverSheetViewController
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("coverSheetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
