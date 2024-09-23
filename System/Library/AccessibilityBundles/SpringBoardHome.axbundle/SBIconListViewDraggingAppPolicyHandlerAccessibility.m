@implementation SBIconListViewDraggingAppPolicyHandlerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconListViewDraggingAppPolicyHandler");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingAppPolicyHandler"), CFSTR("draggingDestinationDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingDestinationDelegate"), CFSTR("iconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingAppPolicyHandler"), CFSTR("handleSpringLoadOnIconView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingDestinationDelegate"), CFSTR("targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:"), "@", "@", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingAppPolicyHandler"), CFSTR("dropInteraction:sessionDidEnd:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewDraggingAppPolicyHandler"), CFSTR("dropInteraction:performDrop:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconView"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("defaultIconImageSize"), "{CGSize=dd}", 0);

}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend((id)SBAXIconFolderOpeningTimer, "invalidate");
    objc_initWeak(&location, v4);
    v5 = (void *)MEMORY[0x24BDBCF40];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__SBIconListViewDraggingAppPolicyHandlerAccessibility_handleSpringLoadOnIconView___block_invoke;
    v9[3] = &unk_250383E80;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 3.0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)SBAXIconFolderOpeningTimer;
    SBAXIconFolderOpeningTimer = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
    -[SBIconListViewDraggingAppPolicyHandlerAccessibility handleSpringLoadOnIconView:](&v8, sel_handleSpringLoadOnIconView_, v4);
  }

}

void __82__SBIconListViewDraggingAppPolicyHandlerAccessibility_handleSpringLoadOnIconView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  objc_super v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3.receiver = *(id *)(a1 + 32);
    v3.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
    objc_msgSendSuper2(&v3, sel_handleSpringLoadOnIconView_, WeakRetained);
  }

}

- (id)_axCurrentIconListView
{
  void *v2;
  void *v3;

  -[SBIconListViewDraggingAppPolicyHandlerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("draggingDestinationDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("iconListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityFindIconIntersectingDraggedIconForDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[SBIconListViewDraggingAppPolicyHandlerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("draggingDestinationDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewDraggingAppPolicyHandlerAccessibility _axCurrentIconListView](self, "_axCurrentIconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = v5;
  v12 = v6;
  v13 = v4;
  AXPerformSafeBlock();
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("icon"), v10, 3221225472, __115__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityFindIconIntersectingDraggedIconForDropSession___block_invoke, &unk_250383EA8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __115__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityFindIconIntersectingDraggedIconForDropSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
  -[SBIconListViewDraggingAppPolicyHandlerAccessibility dropInteraction:sessionDidEnd:](&v4, sel_dropInteraction_sessionDidEnd_, a3, a4);
  SBAXPerformingAXDrag = 0;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
  -[SBIconListViewDraggingAppPolicyHandlerAccessibility dropInteraction:performDrop:](&v4, sel_dropInteraction_performDrop_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (Class)_accessibilityIconViewclass
{
  if (_accessibilityIconViewclass_onceToken != -1)
    dispatch_once(&_accessibilityIconViewclass_onceToken, &__block_literal_global_5);
  return (Class)(id)_accessibilityIconViewclass_sSBIconViewClass;
}

Class __82__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityIconViewclass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBIconView"));
  _accessibilityIconViewclass_sSBIconViewClass = (uint64_t)result;
  return result;
}

@end
