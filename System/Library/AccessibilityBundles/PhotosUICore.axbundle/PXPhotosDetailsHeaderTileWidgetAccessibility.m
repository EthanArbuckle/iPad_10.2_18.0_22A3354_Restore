@implementation PXPhotosDetailsHeaderTileWidgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosDetailsHeaderTileWidget");
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
  objc_msgSend(v3, "validateClass:", CFSTR("PXTitleSubtitleUILabelTile"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXTitleSubtitleUILabel"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PXUIViewBasicTile"), CFSTR("view"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIPlayButtonTile"), CFSTR("_hifiPlayButtonView"), "UIView<PXVideoOverlayButton>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXTitleSubtitleUILabelTile"), CFSTR("_label"), "PXTitleSubtitleUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXImageUIView"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsHeaderTileWidget"), CFSTR("checkOutTileForIdentifier: layout:"), "^v", "{PXTileIdentifier=Q[10Q]}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsHeaderTileWidget"), CFSTR("_title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsHeaderTileWidget"), CFSTR("_subtitle"), "@", 0);

}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[5];
  unint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsHeaderTileWidgetAccessibility;
  v4 = *(_OWORD *)&a3->var1[5];
  v9[2] = *(_OWORD *)&a3->var1[3];
  v9[3] = v4;
  v9[4] = *(_OWORD *)&a3->var1[7];
  v10 = a3->var1[9];
  v5 = *(_OWORD *)&a3->var1[1];
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  v6 = -[PXPhotosDetailsHeaderTileWidgetAccessibility checkOutTileForIdentifier:layout:](&v11, sel_checkOutTileForIdentifier_layout_, v9, a4);
  MEMORY[0x2348C1678](CFSTR("PXUIPlayButtonTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_hifiPlayButtonView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsAccessibilityElement:", 0);
LABEL_6:

    goto LABEL_7;
  }
  MEMORY[0x2348C1678](CFSTR("PXTitleSubtitleUILabelTile"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348C1678](CFSTR("PXTitleSubtitleUILabel"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "accessibilitySetIdentification:", CFSTR("AXMemoryTileHeadingLabel"));
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

@end
