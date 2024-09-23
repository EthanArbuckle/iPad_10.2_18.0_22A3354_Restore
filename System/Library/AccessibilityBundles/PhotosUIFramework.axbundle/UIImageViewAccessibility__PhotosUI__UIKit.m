@implementation UIImageViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUUserTransformView"), CFSTR("_setEnabledInteractions:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUUserTransformView"), CFSTR("setDesiredZoomScale:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUUserTransformView"), CFSTR("_performZoomAndScrollChanges:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUUserTransformView"), CFSTR("_scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mainFileURL"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PUTilingView"));
  objc_msgSend(v3, "validateClass:", CFSTR("VKCImageSubjectHighlightView"));

}

- (id)_axPHAsset
{
  return (id)-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPHImageAsset"));
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    v4 = -[UIImageViewAccessibility__PhotosUI__UIKit _accessibilitySkipImageTraitDescription](&v6, sel__accessibilitySkipImageTraitDescription);
  }

  return v4;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
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

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityiCloudPhotoLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isPhoto"));

    if (v7)
    {
      -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityURL](self, "accessibilityURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityMetadataDescriptionForImage();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isVideo"));

      if (!v11)
      {
        v5 = &stru_24FF166E0;
        goto LABEL_11;
      }
      -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityURL](self, "accessibilityURL");
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

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
  v3 = -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityTraits](&v8, sel_accessibilityTraits);
  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDFEFE8];
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;

  return v6;
}

- (BOOL)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PUTilingView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityFindDescendant:", &__block_literal_global_14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    AXPerformSafeBlock();

  }
  return v5 != 0;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v6 = 1;
  if (!-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    return -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityZoomInAtPoint:](&v8, sel_accessibilityZoomInAtPoint_, x, y);
  }
  return v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  if (-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 0))
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
  return -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityZoomInAtPoint:](&v7, sel_accessibilityZoomInAtPoint_, x, y);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_super v10;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageViewAccessibility__PhotosUI__UIKit _liftableSubjectView](self, "_liftableSubjectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityValue](&v10, sel_accessibilityValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[UIImageViewAccessibility__PhotosUI__UIKit _liftableSubjectView](self, "_liftableSubjectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityDragSourceDescriptors");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityDragSourceDescriptors](&v8, sel_accessibilityDragSourceDescriptors);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_liftableSubjectView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("PUTilingView"))), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_251);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityPhotoDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilityPhotoDescription");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    -[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityPhotoDescription](&v8, sel__accessibilityPhotoDescription);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
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
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityURL](&v8, sel_accessibilityURL);
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

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[UIImageViewAccessibility__PhotosUI__UIKit _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  void *v3;
  id v4;
  objc_super v6;

  -[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PUTilingView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)0x8000000000000000;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    v4 = -[UIImageViewAccessibility__PhotosUI__UIKit _accessibilitySortPriority](&v6, sel__accessibilitySortPriority);
  }

  return (int64_t)v4;
}

@end
