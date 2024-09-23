@implementation STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _accessibilityMultitaskingButtonContainer](self, "_accessibilityMultitaskingButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("dotsView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccessibilityContainer:", self);
  }

}

- (id)_accessibilityMultitaskingButtonContainer
{
  void *v2;
  void *v3;
  void *v4;

  -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _accessibilityWindow](self, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](&v13, sel__updateDisplayedItemsWithData_styleAttributes_extraAnimations_, v8, a4, a5);
  if (!_updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor)
  {
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("backgroundActivityEntry"), CFSTR("backNavigationEntry"), CFSTR("forwardNavigationEntry"), 0);
    v10 = (void *)_updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor;
    _updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor = v9;

  }
  if (v8)
  {
    objc_msgSend(v8, "safeSetForKey:", CFSTR("existingEntryKeys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intersectsSet:", _updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor);

    if (v12)
      AXPerformBlockOnMainThreadAfterDelay();
  }

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("recordingIndicatorManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRecordingIndicatorManager"), CFSTR("_recordingIndicatorWindow"), "UIWindow");
  if (NSClassFromString(CFSTR("STUIStatusBarAccessibility")))
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarAccessibility"), CFSTR("_axElementWithinFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTopAffordanceViewController"), CFSTR("dotsView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBar"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBTopAffordanceViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("_updateDisplayedItemsWithData:styleAttributes:extraAnimations:"), "v", "@", "@", "@", 0);

}

- (id)accessibilityElements
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  if (AXProcessIsSpringBoard() && AXDeviceIsD7x() && UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityStatusBarElements:sorted:", 1, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
    -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI accessibilityElements](&v14, sel_accessibilityElements);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axSafelyAddObjectsFromArray:", v5);

    if (!objc_msgSend(v4, "count"))
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axSafelyAddObjectsFromArray:", v7);

    }
    if (objc_msgSend(v4, "count"))
    {
      AXWindowScene(CFSTR("activeDisplayWindowScene"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("recordingIndicatorManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("_recordingIndicatorWindow"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axSafelyAddObject:", v10);

      -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _accessibilityMultitaskingButtonContainer](self, "_accessibilityMultitaskingButtonContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axSafelyAddObject:", v11);

    }
    if (objc_msgSend(v4, "count"))
      v12 = v4;
    else
      v12 = 0;
    v13 = v12;

    return v13;
  }
}

- (BOOL)_axElementWithinFocused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _accessibilityMultitaskingButtonContainer](self, "_accessibilityMultitaskingButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("dotsView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    _UIAccessibilityFocusedElements();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if (*(void **)(*((_QWORD *)&v15 + 1) + 8 * i) == v6)
          {

            v12 = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  v12 = -[STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI _axElementWithinFocused](&v14, sel__axElementWithinFocused);
LABEL_13:

  return v12;
}

@end
