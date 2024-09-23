@implementation HUAccessoryTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAccessoryTileCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUAccessoryTileCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAccessoryTileCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUAccessoryTileCell"), CFSTR("HUTileCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTileCell"), CFSTR("tappableAreaForPoint:"), "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTileCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUDashboardViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardViewController"), CFSTR("presentationCoordinator:didRecognizeTapForItem:tappedArea:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardViewController"), CFSTR("quickControlPresentationContextForItem:atIndexPath:point:"), "@", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HomeUI.TileCellContentView"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("setPresentationContext:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUEmbeddedTriggerActionGridViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUContainedAccessoryElementsGridViewController"), CFSTR("UICollectionViewController"));

}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityActivationPoint");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15[7];
  id location;
  id *p_location;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUAccessoryTileCellAccessibility;
  -[HUAccessoryTileCellAccessibility accessibilityCustomActions](&v22, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  location = 0;
  p_location = &location;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v8 = MEMORY[0x24BDAC760];
  v15[1] = (id)MEMORY[0x24BDAC760];
  v15[2] = (id)3221225472;
  v15[3] = __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke;
  v15[4] = &unk_250234870;
  v15[5] = self;
  v15[6] = &location;
  AXPerformSafeBlock();
  v9 = p_location[5];
  _Block_object_dispose(&location, 8);

  if (v9 == (id)*MEMORY[0x24BE4F400] || v9 == (id)*MEMORY[0x24BE4F3F8])
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityHomeUILocalizedString(CFSTR("accessory.settings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v14[3] = &unk_2502348E0;
    objc_copyWeak(v15, &location);
    v12 = (void *)objc_msgSend(v10, "initWithName:actionHandler:", v11, v14);

    objc_msgSend(v7, "addObject:", v12);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessibilityActivationPoint");
  objc_msgSend(v2, "convertPoint:fromView:", 0);
  objc_msgSend(v2, "tappableAreaForPoint:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(WeakRetained, "accessibilityContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(WeakRetained, "_accessibilityIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("quickControlPresentationCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("item"));
  v12 = v6;
  v13 = v2;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  v7 = v5;
  v8 = v14;
  v9 = v2;
  v10 = v6;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "quickControlPresentationContextForItem:atIndexPath:point:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentationContext:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "presentationCoordinator:didRecognizeTapForItem:tappedArea:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *MEMORY[0x24BE4F3F8]);
}

@end
