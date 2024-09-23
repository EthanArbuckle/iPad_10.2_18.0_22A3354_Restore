@implementation PUOneUpViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOneUpViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUImageTileViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PUOneUpBarsController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUOneUpViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_tilingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUImageTileViewController"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("ppt_barsController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_barsController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("actionsController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpDefaultActionsController"), CFSTR("togglePlayback"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_needsUpdateBarsController"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_accessoryVisibilityInteractionController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_options"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("contentOffset"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_isAccessoryVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("viewModel:didChange:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_updateBarsControllerIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_setAccessoryVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_accessoryContentKindForCurrentAsset"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAccessoryVisibilityInteractionController"), CFSTR("_currentAssetViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("asset"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PUOneUpViewControllerAccessibility _axApplyCustomActionsToTileControllers](self, "_axApplyCustomActionsToTileControllers");
  -[PUOneUpViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUOneUpBarsController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUOneUpViewControllerAccessibility _axApplyCustomActionsToTileControllers](self, "_axApplyCustomActionsToTileControllers");
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility viewModel:didChange:](&v5, sel_viewModel_didChange_, a3, a4);
  -[PUOneUpViewControllerAccessibility _axApplyCustomActionsToTileControllers](self, "_axApplyCustomActionsToTileControllers");
}

- (void)_updateBarsControllerIfNeeded
{
  int v3;
  objc_super v4;

  v3 = -[PUOneUpViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_needsUpdateBarsController"));
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility _updateBarsControllerIfNeeded](&v4, sel__updateBarsControllerIfNeeded);
  if (v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_setAccessoryVisible:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility _setAccessoryVisible:](&v7, sel__setAccessoryVisible_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__PUOneUpViewControllerAccessibility__setAccessoryVisible___block_invoke;
  v5[3] = &__block_descriptor_33_e62_v16__0__PUTileController_AXFullScreenTileControllerDelegate__8l;
  v6 = a3;
  -[PUOneUpViewControllerAccessibility _axExecuteBlockOnTileViewControllers:](self, "_axExecuteBlockOnTileViewControllers:", v5);
}

void __59__PUOneUpViewControllerAccessibility__setAccessoryVisible___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "_axMainImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setIsAccessibilityElement:", *(_BYTE *)(a1 + 32) == 0);
    v3 = v4;
  }

}

- (void)_axShowAccessory
{
  -[PUOneUpViewControllerAccessibility _setAccessoryVisible:](self, "_setAccessoryVisible:", 1);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  double v10;

  v5 = -[PUOneUpViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isAccessoryVisible"));
  if (a3 != 4 || (v5 & 1) != 0)
  {
    if (a3 == 3)
      v7 = v5;
    else
      v7 = 0;
    if (v7 == 1)
    {
      -[PUOneUpViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryVisibilityInteractionController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_currentAssetViewModel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeCGPointForKey:", CFSTR("contentOffset"));
      v6 = v10 <= 0.0;
      if (v10 <= 0.0)
        -[PUOneUpViewControllerAccessibility _setAccessoryVisible:](self, "_setAccessoryVisible:", 0);

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v6 = 1;
    -[PUOneUpViewControllerAccessibility _setAccessoryVisible:](self, "_setAccessoryVisible:", 1);
  }
  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __64__PUOneUpViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("_isAccessoryVisible"));
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_setAccessoryVisible:", 0);
  else
    return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)accessibilityPerformMagicTap
{
  AXPerformSafeBlock();
  return 1;
}

void __66__PUOneUpViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("actionsController"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("togglePlayback"));

}

- (void)_axApplyCustomActionsToTileControllers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__PUOneUpViewControllerAccessibility__axApplyCustomActionsToTileControllers__block_invoke;
  v2[3] = &unk_24FF15438;
  v2[4] = self;
  -[PUOneUpViewControllerAccessibility _axExecuteBlockOnTileViewControllers:](self, "_axExecuteBlockOnTileViewControllers:", v2);
}

void __76__PUOneUpViewControllerAccessibility__axApplyCustomActionsToTileControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", CFSTR("_options")) & 0x40) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("_accessoryContentKindForCurrentAsset"));
    if (v3 == 2)
    {
      v4 = objc_alloc(MEMORY[0x24BDF6788]);
      v5 = CFSTR("accessory.comments.show");
    }
    else
    {
      if (v3 != 1)
        goto LABEL_8;
      v4 = objc_alloc(MEMORY[0x24BDF6788]);
      v5 = CFSTR("accessory.details.show");
    }
    accessibilityPULocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v6, *(_QWORD *)(a1 + 32), sel__axShowAccessory);

    if (v7)
    {
      objc_msgSend(v8, "_axApplyCustomAction:", v7);

    }
  }
LABEL_8:

}

- (void)_axExecuteBlockOnTileViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v4 = a3;
  v10 = 0;
  objc_opt_class();
  -[PUOneUpViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tilingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__PUOneUpViewControllerAccessibility__axExecuteBlockOnTileViewControllers___block_invoke;
  v8[3] = &unk_24FF15460;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateAllTileControllersUsingBlock:", v8);

}

void __75__PUOneUpViewControllerAccessibility__axExecuteBlockOnTileViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_axConformsToFullScreenTileControllerDelegate"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
