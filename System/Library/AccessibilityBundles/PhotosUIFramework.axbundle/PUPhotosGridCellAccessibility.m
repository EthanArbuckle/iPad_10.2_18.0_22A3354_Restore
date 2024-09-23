@implementation PUPhotosGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotosGridCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isPhoto"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("photoCollectionAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("assetsInAssetCollection:"), "@", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[PUPhotosGridCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotosGridCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v4;
    return v7;
  }
  -[PUPhotosGridCellAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AddPhotoPlaceholder"));

  if (v6)
  {
    accessibilityPULocalizedString(CFSTR("add.photo.placeholder"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("PXTextBannerView")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "safeValueForKey:", CFSTR("_textLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    __AXStringForVariables();
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
  }

  return v7;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *MEMORY[0x24BDF73E0];
  v4 = -[PUPhotosGridCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelectionBadgeVisible"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (!_AXSAutomationEnabled())
  {
    v7 = *MEMORY[0x24BDF73C8];
    -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 |= v7 | objc_msgSend(v8, "accessibilityTraits");

  }
  return v6;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  return 1;
}

- (id)_axPHAsset
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;

  -[PUPhotosGridCellAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AddPhotoPlaceholder"));

  if ((v4 & 1) != 0)
    return 0;
  -[PUPhotosGridCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityIndexPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__6;
  v25[4] = __Block_byref_object_dispose__6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v17 = v8;
  v18 = v9;
  AXPerformSafeBlock();
  v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  v26 = v10;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v11 = v17;
  AXPerformSafeBlock();
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v13 = v12;
  v14 = v18;
  AXPerformSafeBlock();
  v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  __UIAccessibilitySafeClass();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v25, 8);
  return v16;
}

void __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "photoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "assetsInAssetCollection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axMainAssetURL
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("mainFileURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoDescription
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilitySavePhotoLabel:", v4);

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  __CFString *v12;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityiCloudPhotoLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isPhoto"));

    if (v7)
    {
      -[PUPhotosGridCellAccessibility _axMainAssetURL](self, "_axMainAssetURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityMetadataDescriptionForImage();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isVideo"));

      if (!v11)
      {
        v5 = &stru_24FF166E0;
        goto LABEL_11;
      }
      -[PUPhotosGridCellAccessibility _axMainAssetURL](self, "_axMainAssetURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityMetadataDescriptionForVideo();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (__CFString *)v9;

    if (v12)
      v5 = v12;
    else
      v5 = &stru_24FF166E0;
  }
LABEL_11:

  return v5;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PUPhotosGridCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
