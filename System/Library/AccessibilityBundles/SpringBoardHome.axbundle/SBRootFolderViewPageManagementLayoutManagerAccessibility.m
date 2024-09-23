@implementation SBRootFolderViewPageManagementLayoutManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRootFolderViewPageManagementLayoutManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderViewPageManagementLayoutManager"), CFSTR("transitionToActive:inFolderView:usingAnimator:"), "v", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderViewPageManagementLayoutManager"), CFSTR("focusModeSymbolView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DNDStateService"), CFSTR("queryCurrentStateWithError:"), "@", "^@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DNDState"), CFSTR("activeModeConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DNDModeConfiguration"), CFSTR("mode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DNDMode"), CFSTR("name"), "@", 0);

}

- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBRootFolderViewPageManagementLayoutManagerAccessibility;
  -[SBRootFolderViewPageManagementLayoutManagerAccessibility transitionToActive:inFolderView:usingAnimator:](&v19, sel_transitionToActive_inFolderView_usingAnimator_, v6, v8, v9);
  -[SBRootFolderViewPageManagementLayoutManagerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("focusModeSymbolView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 && v10)
  {
    objc_initWeak(&location, v10);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke;
    v16 = &unk_250383AE0;
    objc_copyWeak(&v17, &location);
    dispatch_async(v12, &v13);

    objc_msgSend(v11, "setIsAccessibilityElement:", 1, v13, v14, v15, v16);
    objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v11);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[1] = (id)MEMORY[0x24BDAC760];
  v4[2] = (id)3221225472;
  v4[3] = __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_205;
  v4[4] = &unk_250383A90;
  v4[5] = &v5;
  AXPerformSafeBlock();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  v3 = v2;
  objc_copyWeak(v4, (id *)(a1 + 32));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v4);

}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_205(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  AXSBIconControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("dndStateService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryCurrentStateWithError:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("focus.on"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKeyPath:", CFSTR("activeModeConfiguration.mode.name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAccessibilityLabel:", v6);

}

@end
