@implementation PXVideoSessionUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXVideoSessionUIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axPHAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXVideoSessionUIViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXVideoAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXVideoSessionUIViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_accessoryVisibilityInteractionController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentAssetViewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("asset"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __47__PXVideoSessionUIViewAccessibility__axPHAsset__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PUOneUpViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (id)accessibilityURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  -[PXVideoSessionUIViewAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityURL");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXVideoSessionUIViewAccessibility;
    -[PXVideoSessionUIViewAccessibility accessibilityURL](&v8, sel_accessibilityURL);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("mainFileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

@end
