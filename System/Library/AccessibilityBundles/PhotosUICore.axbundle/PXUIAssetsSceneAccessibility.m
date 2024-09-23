@implementation PXUIAssetsSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXUIAssetsScene");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXAssetUIImageViewTile"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXFocusableUIImageView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXUIAssetsScene"), CFSTR("PXAssetsScene"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXAssetUIImageViewTile"), CFSTR("_imageView"), "PXFocusableUIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetsScene"), CFSTR("selectionManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIAssetsScene"), CFSTR("checkOutTileForIdentifier:layout:"), "^v", "{PXTileIdentifier=Q[10Q]}", "@", 0);

}

- (void)_axApplyAssetsToImageViewTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v6 = a3;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_imageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXFocusableUIImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = a4->var1[1];
    v10 = a4->var1[2];
    v11 = a4->var1[3];
    v12 = a4->var1[4];
    objc_opt_class();
    -[PXUIAssetsSceneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectionManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v9;
    v15[1] = v10;
    v15[2] = v11;
    v15[3] = v12;
    objc_msgSend(v8, "_axSetIndexPath:", v15);
    objc_msgSend(v8, "_axSetSelectionManager:", v14);

  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  __int128 v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXUIAssetsSceneAccessibility;
  v6 = *(_OWORD *)&a3->var1[5];
  v14 = *(_OWORD *)&a3->var1[3];
  v15 = v6;
  v16 = *(_OWORD *)&a3->var1[7];
  v17 = a3->var1[9];
  v7 = *(_OWORD *)&a3->var1[1];
  v12 = *(_OWORD *)&a3->var0;
  v13 = v7;
  v8 = -[PXUIAssetsSceneAccessibility checkOutTileForIdentifier:layout:](&v18, sel_checkOutTileForIdentifier_layout_, &v12, a4);
  MEMORY[0x2348C1678](CFSTR("PXAssetUIImageViewTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = *(_OWORD *)&a3->var1[5];
    v14 = *(_OWORD *)&a3->var1[3];
    v15 = v9;
    v16 = *(_OWORD *)&a3->var1[7];
    v17 = a3->var1[9];
    v10 = *(_OWORD *)&a3->var1[1];
    v12 = *(_OWORD *)&a3->var0;
    v13 = v10;
    -[PXUIAssetsSceneAccessibility _axApplyAssetsToImageViewTile:withIdentifier:](self, "_axApplyAssetsToImageViewTile:withIdentifier:", v8, &v12);
  }

  return v8;
}

@end
