@implementation PXPhotosDetailsAssetsWidgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosDetailsAssetsWidget");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXUIPlayButtonTile"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXSelectionSnapshot"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXHighFidelityVideoOverlayButton"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIPlayButtonTile"), CFSTR("_playButtonView"), "UIView<PXVideoOverlayButton>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsAssetsWidget"), CFSTR("_assetsScene"), "@", 0);

}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[5];
  unint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPhotosDetailsAssetsWidgetAccessibility;
  v4 = *(_OWORD *)&a3->var1[5];
  v10[2] = *(_OWORD *)&a3->var1[3];
  v10[3] = v4;
  v10[4] = *(_OWORD *)&a3->var1[7];
  v11 = a3->var1[9];
  v5 = *(_OWORD *)&a3->var1[1];
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v5;
  v6 = -[PXPhotosDetailsAssetsWidgetAccessibility checkOutTileForIdentifier:layout:](&v12, sel_checkOutTileForIdentifier_layout_, v10, a4);
  MEMORY[0x2348C1678](CFSTR("PXUIPlayButtonTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("playButtonView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_button"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsAccessibilityElement:", 0);

  }
  return v6;
}

@end
