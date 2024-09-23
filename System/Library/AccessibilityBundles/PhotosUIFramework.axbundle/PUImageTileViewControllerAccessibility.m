@implementation PUImageTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUImageTileViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PHLivePhotoView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PUIrisImageTileViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUImageTileViewController"), CFSTR("assetDidChange"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUImageTileViewController"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUImageTileViewController"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIrisImageTileViewController"), CFSTR("_livePhotoView"), "@", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;

  -[PUImageTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __49__PUImageTileViewControllerAccessibility_dealloc__block_invoke;
    v8 = &unk_24FF15180;
    v9 = v3;
    AXPerformSafeBlock();

  }
  v4.receiver = self;
  v4.super_class = (Class)PUImageTileViewControllerAccessibility;
  -[PUImageTileViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

uint64_t __49__PUImageTileViewControllerAccessibility_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityApplyValueBlock:", 0);
}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 1;
}

- (void)_axApplyAssetToView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[PUImageTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(CFSTR("PHLivePhotoView"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
          v11 = v10;

          v4 = v11;
          goto LABEL_13;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXPHImageAsset"));
  }
  objc_msgSend(v4, "setIsAccessibilityElement:", v3 != 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerAccessibility;
  -[PUImageTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PUImageTileViewControllerAccessibility _axApplyAssetToView](self, "_axApplyAssetToView");
}

- (void)assetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerAccessibility;
  -[PUImageTileViewControllerAccessibility assetDidChange](&v3, sel_assetDidChange);
  -[PUImageTileViewControllerAccessibility _axApplyAssetToView](self, "_axApplyAssetToView");
}

- (id)_axMainImageView
{
  NSClassFromString(CFSTR("PUIrisImageTileViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PUImageTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_livePhotoView"));
  else
    -[PUImageTileViewControllerAccessibility _axImageView](self, "_axImageView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_axApplyCustomAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PUImageTileViewControllerAccessibility _axMainImageView](self, "_axMainImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityCustomActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "name", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {

          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "addObject:", v4);
  objc_msgSend(v5, "setAccessibilityCustomActions:", v8);
LABEL_13:

}

- (id)_axGetFaces
{
  JUMPOUT(0x2348C1CECLL);
}

- (void)_setAXFaces:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axImageView
{
  void *v3;
  void *v4;
  void *v5;

  NSClassFromString(CFSTR("PUIrisImageTileViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUImageTileViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_livePhotoView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PUImageTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t __54__PUImageTileViewControllerAccessibility__axImageView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("UIImageView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
