@implementation SBHomeScreenWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeScreenWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityScrollLeftPage:"), "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityScrollRightPage:"), "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_currentFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenWindow"), CFSTR("homeScreenViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenViewController"), CFSTR("iconController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_rootFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRootFolderController"), CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("firstIconPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isDisplayingWidgetIntroductionOnPage:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoardAccessibility"), CFSTR("_accessibilityIsShowingLongLookNotification"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("stackConfigurationViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("rootViewController"), "@", 0);

}

- (BOOL)_accessibilityIsIsolatedWindow
{
  void *v2;
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[SBHomeScreenWindowAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("homeScreenViewController.iconController._rootFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeIntegerForKey:", CFSTR("firstIconPageIndex"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = v2;
  AXPerformSafeBlock();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBHomeScreenWindowAccessibility__accessibilityIsIsolatedWindow__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDisplayingWidgetIntroductionOnPage:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  char v3;
  void *v4;
  void *v5;

  if (-[SBHomeScreenWindowAccessibility _accessibilityCanAccessHomeScreenDuringOneness](self, "_accessibilityCanAccessHomeScreenDuringOneness")|| -[SBHomeScreenWindowAccessibility _accessibilityAppleIntelligenceSiriRequestsPresenting](self, "_accessibilityAppleIntelligenceSiriRequestsPresenting"))
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isShowingHomescreen"))
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isControlCenterVisible") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeBoolForKey:", CFSTR("_accessibilityIsShowingLongLookNotification"));

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)_accessibilityWindowVisible
{
  void *v4;
  char v5;

  if (-[SBHomeScreenWindowAccessibility _accessibilityCanAccessHomeScreenDuringOneness](self, "_accessibilityCanAccessHomeScreenDuringOneness")|| -[SBHomeScreenWindowAccessibility _accessibilityAppleIntelligenceSiriRequestsPresenting](self, "_accessibilityAppleIntelligenceSiriRequestsPresenting"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingHomescreen");

  return v5;
}

- (BOOL)_accessibilityCanAccessHomeScreenDuringOneness
{
  BOOL v2;
  void *v3;
  BOOL v4;

  v2 = AXRequestingClient() != 16 && AXRequestingClient() != 2;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuitySessionActive") & v2;

  return v4;
}

- (BOOL)_accessibilityAppleIntelligenceSiriRequestsPresenting
{
  void *v2;
  void *v3;
  BOOL v4;

  AXSBAssistantControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  void *v3;
  char v4;
  objc_super v6;

  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenWindowAccessibility;
  return -[SBHomeScreenWindowAccessibility _accessibilityIgnoresStatusBarFrame](&v6, sel__accessibilityIgnoresStatusBarFrame);
}

- (id)_accessibilityKeyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenWindowAccessibility;
  -[SBHomeScreenWindowAccessibility _accessibilityKeyCommands](&v8, sel__accessibilityKeyCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A0], 0x100000, sel__axLeftArrowPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A8], 0x100000, sel__axRightArrowPressed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)_axRightArrowPressed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AXSBIconControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_iconListViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityScrollLeftPage:", 0);

}

- (void)_axLeftArrowPressed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AXSBIconControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_iconListViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityScrollRightPage:", 0);

}

- (BOOL)_accessibilityIsInWidgetStack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_opt_class();
  -[SBHomeScreenWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SBHomeScreenViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("iconController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_rootFolderController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("stackConfigurationViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
