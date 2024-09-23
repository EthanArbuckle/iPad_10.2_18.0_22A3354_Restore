@implementation SBDragAndDropWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDragAndDropWorkspaceTransaction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationForDisplayItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDragAndDropWorkspaceTransaction"), CFSTR("_currentSwitcherDropRegionContext"), "SBSwitcherDropRegionContext");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherDropRegionContext"), CFSTR("intersectingAppLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDragAndDropWorkspaceTransaction"), CFSTR("_didComplete"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherDropRegionContext"), CFSTR("currentDropRegion"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("allItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("itemForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDragAndDropWorkspaceTransaction"), CFSTR("_currentLayoutState"), "SBMainDisplayLayoutState");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDragAndDropWorkspaceTransaction"), CFSTR("_currentDropAction"), "NSInteger");

}

- (void)_updateCurrentDropActionForSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  objc_super v9;

  v4 = a3;
  -[SBDragAndDropWorkspaceTransactionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentLayoutState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode"));

  v7 = -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropAction](self, "accessibilityCurrentDropAction");
  v8 = -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropRegion](self, "accessibilityCurrentDropRegion");
  v9.receiver = self;
  v9.super_class = (Class)SBDragAndDropWorkspaceTransactionAccessibility;
  -[SBDragAndDropWorkspaceTransactionAccessibility _updateCurrentDropActionForSession:](&v9, sel__updateCurrentDropActionForSession_, v4);

  if (v6 == 2)
  {
    -[SBDragAndDropWorkspaceTransactionAccessibility _accessibilityUpdateDropActionForRegion:](self, "_accessibilityUpdateDropActionForRegion:", v8);
  }
  else if (v6 == 3)
  {
    -[SBDragAndDropWorkspaceTransactionAccessibility _accessibilityUpdateDropActionForAction:](self, "_accessibilityUpdateDropActionForAction:", v7);
  }
}

- (void)_didComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityIntersectingDisplayName](self, "accessibilityIntersectingDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("app.switcher.creating.split.view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransactionAccessibility;
  -[SBDragAndDropWorkspaceTransactionAccessibility _didComplete](&v7, sel__didComplete);

}

- (void)_accessibilityUpdateDropActionForRegion:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropRegion](self, "accessibilityCurrentDropRegion");
  if (v5 != a3)
  {
    v6 = v5;
    if (v5 | a3)
    {
      -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityIntersectingDisplayName](self, "accessibilityIntersectingDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v12 = v7;
        if (v6 == 5)
        {
          v8 = (void *)MEMORY[0x24BDD17C8];
          v9 = CFSTR("app.switcher.create.split.view.right");
LABEL_9:
          accessibilityLocalizedString(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", v10, v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v12;
          if (v11)
          {
            UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v11);

            v7 = v12;
          }
          goto LABEL_11;
        }
        if (v6 == 4)
        {
          v8 = (void *)MEMORY[0x24BDD17C8];
          v9 = CFSTR("app.switcher.create.split.view.left");
          goto LABEL_9;
        }
      }
LABEL_11:

    }
  }
}

- (void)_accessibilityUpdateDropActionForAction:(int64_t)a3
{
  int64_t v4;
  __CFString *v5;
  id v6;

  v4 = -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropAction](self, "accessibilityCurrentDropAction");
  if (v4 != a3)
  {
    if ((unint64_t)(v4 - 1) > 9)
      v5 = CFSTR("drop.action.cancel.drop.announcement");
    else
      v5 = off_250368570[v4 - 1];
    accessibilityLocalizedString(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);

  }
}

- (int64_t)accessibilityCurrentDropAction
{
  return -[SBDragAndDropWorkspaceTransactionAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_currentDropAction"));
}

- (unint64_t)accessibilityCurrentDropRegion
{
  void *v2;
  unint64_t v3;

  -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropRegionContext](self, "accessibilityCurrentDropRegionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("currentDropRegion"));

  return v3;
}

- (id)accessibilityCurrentDropRegionContext
{
  return (id)-[SBDragAndDropWorkspaceTransactionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentSwitcherDropRegionContext"));
}

- (id)accessibilityIntersectingDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropRegionContext](self, "accessibilityCurrentDropRegionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("intersectingAppLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDragAndDropWorkspaceTransactionAccessibility accessibilityCurrentDropRegion](self, "accessibilityCurrentDropRegion");
  if (v4)
  {
    objc_msgSend(v4, "safeArrayForKey:", CFSTR("allItems"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      if (objc_msgSend(v5, "count") == 1)
      {
        objc_msgSend(v5, "firstObject");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__7;
      v16 = __Block_byref_object_dispose__7;
      v17 = 0;
      v11 = v4;
      AXPerformSafeBlock();
      v6 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__7;
    v16 = __Block_byref_object_dispose__7;
    v17 = 0;
    v10 = v6;
    AXPerformSafeBlock();
    v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    objc_msgSend(v8, "safeStringForKey:", CFSTR("displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __86__SBDragAndDropWorkspaceTransactionAccessibility_accessibilityIntersectingDisplayName__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)a1[4];
  if (a1[6] == 4)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v2, "itemForLayoutRole:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __86__SBDragAndDropWorkspaceTransactionAccessibility_accessibilityIntersectingDisplayName__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  AXSBApplicationControllerSharedInstance();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationForDisplayItem:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
