@implementation PHLivePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHLivePhotoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHLivePhotoView"), CFSTR("livePhoto"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHLivePhoto"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHLivePhoto"), CFSTR("imageURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mainFileURL"), "@", 0);

}

- (id)_axPHAsset
{
  void *v3;
  void *v4;
  void *v5;

  -[PHLivePhotoViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPHImageAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PHLivePhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("livePhoto"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("asset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;

  -[PHLivePhotoViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PHLivePhotoViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PHLivePhotoViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHLivePhotoViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHLivePhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("livePhoto"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("imageURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilityMetadataDescriptionForImage();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v7;
  }
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return *MEMORY[0x24BDF73C8];
  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");

  return v5;
}

- (id)accessibilityURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
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
    v8.super_class = (Class)PHLivePhotoViewAccessibility;
    -[PHLivePhotoViewAccessibility accessibilityURL](&v8, sel_accessibilityURL);
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

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
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
  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilitySavePhotoLabel:", v4);

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v2;
  void *v3;

  -[PHLivePhotoViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_accessibilityiCloudPhotoLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
