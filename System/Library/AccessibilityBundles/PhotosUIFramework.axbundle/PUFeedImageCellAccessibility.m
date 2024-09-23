@implementation PUFeedImageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedImageCell");
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
  return (id)-[PUFeedImageCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
}

- (id)_axMainAssetURL
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("mainFileURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  return 1;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
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
  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
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
  void *v7;

  -[PUFeedImageCellAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityiCloudPhotoLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[PUFeedImageCellAccessibility _axMainAssetURL](self, "_axMainAssetURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityMetadataDescriptionForImage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = v7;
    else
      v5 = &stru_24FF166E0;

  }
  return v5;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PUFeedImageCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PUFeedImageCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

@end
