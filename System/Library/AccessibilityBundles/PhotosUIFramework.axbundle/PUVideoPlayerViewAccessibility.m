@implementation PUVideoPlayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUVideoPlayerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUVideoPlayerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mainFileURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isVideo"), "B", 0);

}

- (id)_axPHAsset
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[PUVideoPlayerViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;

  -[PUVideoPlayerViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PUVideoPlayerViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("mainFileURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUVideoPlayerViewAccessibility;
    -[PUVideoPlayerViewAccessibility accessibilityURL](&v8, sel_accessibilityURL);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityiCloudPhotoLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isVideo"));

    if (v6)
    {
      -[PUVideoPlayerViewAccessibility accessibilityURL](self, "accessibilityURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityMetadataDescriptionForVideo();
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
  }
  return v4;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilitySavePhotoLabel:", v4);

  return v6;
}

@end
