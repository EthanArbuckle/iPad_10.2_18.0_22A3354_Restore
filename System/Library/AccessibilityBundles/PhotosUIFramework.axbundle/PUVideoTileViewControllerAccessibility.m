@implementation PUVideoTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUVideoTileViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoTileViewController"), CFSTR("videoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoTileViewController"), CFSTR("setAssetViewModel:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoTileViewController"), CFSTR("_updateImage"), "v", 0);

}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 1;
}

- (void)_updateImage
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUVideoTileViewControllerAccessibility;
  -[PUVideoTileViewControllerAccessibility _updateImage](&v2, sel__updateImage);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setAssetViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUVideoTileViewControllerAccessibility;
  v4 = a3;
  -[PUVideoTileViewControllerAccessibility setAssetViewModel:](&v7, sel_setAssetViewModel_, v4);
  -[PUVideoTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoView"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXAsset"));
}

- (id)_axMainImageView
{
  return (id)-[PUVideoTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoView"));
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
  -[PUVideoTileViewControllerAccessibility _axMainImageView](self, "_axMainImageView");
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

@end
