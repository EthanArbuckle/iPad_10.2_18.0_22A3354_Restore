@implementation PXTilingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXTilingController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXTileStatePool"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXAssetUIImageViewTile"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXFocusableUIImageView"));
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXTilingController"), CFSTR("_needsUpdateFlags"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXAssetUIImageViewTile"), CFSTR("_imageView"), "PXFocusableUIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTilingController"), CFSTR("_tileStates"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTilingController"), CFSTR("_updateTilesIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTilingController"), CFSTR("_invalidateTiles"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTileStatePool"), CFSTR("enumerateStatesUsingBlock:"), "v", "@?", 0);

}

- (void)_axUpdateImageViewTile:(id)a3 withIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  _OWORD v7[2];

  objc_msgSend(a3, "safeValueForKey:", CFSTR("_imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXFocusableUIImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_OWORD *)&a4->item;
    v7[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v7[1] = v6;
    objc_msgSend(v5, "_axSetIndexPath:", v7);
  }

}

- (void)_updateTilesIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  PXTilingControllerAccessibility *v14;
  objc_super v15;
  _QWORD v16[2];

  objc_opt_class();
  -[PXTilingControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_needsUpdateFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_DWORD *)((char *)v16 + 7) = 0;
  v16[0] = 0;
  v5 = objc_retainAutorelease(v4);
  if (!strcmp((const char *)objc_msgSend(v5, "objCType"), "{?=BBBBBBBBBBB}"))
  {
    objc_msgSend(v5, "getValue:", v16);
    v6 = HIBYTE(v16[0]);
    v15.receiver = self;
    v15.super_class = (Class)PXTilingControllerAccessibility;
    -[PXTilingControllerAccessibility _updateTilesIfNeeded](&v15, sel__updateTilesIfNeeded);
    if (v6)
    {
      -[PXTilingControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tileStates"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x2348C1678](CFSTR("PXTileStatePool"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = MEMORY[0x24BDAC760];
        v10 = 3221225472;
        v11 = __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke;
        v12 = &unk_24FF06E70;
        v13 = v7;
        v14 = self;
        AXPerformSafeBlock();

      }
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXTilingControllerAccessibility;
    -[PXTilingControllerAccessibility _updateTilesIfNeeded](&v8, sel__updateTilesIfNeeded);
  }

}

uint64_t __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke_2;
  v3[3] = &unk_24FF06E48;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateStatesUsingBlock:", v3);
}

void __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  __int128 v7;
  _OWORD v8[2];

  v5 = *(id *)(a3 + 696);
  MEMORY[0x2348C1678](CFSTR("PXAssetUIImageViewTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_OWORD *)(a3 + 128);
    v8[0] = *(_OWORD *)(a3 + 112);
    v8[1] = v7;
    objc_msgSend(v6, "_axUpdateImageViewTile:withIndexPath:", v5, v8);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTilingControllerAccessibility;
  -[PXTilingControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PXTilingControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tileStates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __77__PXTilingControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateStatesUsingBlock:", &__block_literal_global_5);
}

void __77__PXTilingControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = *(id *)(a3 + 696);
  MEMORY[0x2348C1678](CFSTR("PXAssetUIImageViewTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
