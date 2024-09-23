@implementation PULivePhotoVideoOverlayTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PULivePhotoVideoOverlayTileViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PULivePhotoVideoOverlayTileViewController"), CFSTR("mergedVideo"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PULivePhotoVideoOverlayTileViewController"), CFSTR("PUTileViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTileViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUMergedLivePhotosVideo"), CFSTR("assets"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PULivePhotoVideoOverlayTileViewController"), CFSTR("viewModel:didChange:"), "v", "@", "@", 0);

}

- (void)_axApplyAssetToView
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
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PULivePhotoVideoOverlayTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mergedVideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("assets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVideoOverlayTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "subviews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(CFSTR("PHLivePhotoView"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
          v13 = v12;

          v6 = v13;
          goto LABEL_13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXPHImageAsset"));
  objc_msgSend(v6, "setIsAccessibilityElement:", v5 != 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewControllerAccessibility;
  -[PULivePhotoVideoOverlayTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PULivePhotoVideoOverlayTileViewControllerAccessibility _axApplyAssetToView](self, "_axApplyAssetToView");
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PULivePhotoVideoOverlayTileViewControllerAccessibility;
  v6 = a4;
  -[PULivePhotoVideoOverlayTileViewControllerAccessibility viewModel:didChange:](&v7, sel_viewModel_didChange_, a3, v6);
  LODWORD(a3) = objc_msgSend(v6, "safeBoolForKey:", CFSTR("currentAssetDidChange"), v7.receiver, v7.super_class);

  if ((_DWORD)a3)
    -[PULivePhotoVideoOverlayTileViewControllerAccessibility _axApplyAssetToView](self, "_axApplyAssetToView");
}

@end
