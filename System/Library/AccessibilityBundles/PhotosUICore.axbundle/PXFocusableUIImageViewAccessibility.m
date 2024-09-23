@implementation PXFocusableUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXFocusableUIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axIndexPathHolder
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXIndexPathHolder:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axSetIndexPath:(PXSimpleIndexPath *)a3
{
  AXPXSimpleIndexPathHolder *v5;
  __int128 v6;
  AXPXSimpleIndexPathHolder *v7;
  _OWORD v8[2];

  v5 = [AXPXSimpleIndexPathHolder alloc];
  v6 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v6;
  v7 = -[AXPXSimpleIndexPathHolder initWithIndexPath:](v5, "initWithIndexPath:", v8);
  -[PXFocusableUIImageViewAccessibility _setAXIndexPathHolder:](self, "_setAXIndexPathHolder:", v7);

}

- (id)_axSelectionManager
{
  return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
}

- (void)_setAXSelectionManager:(id)a3
{
  __UIAccessibilitySetAssociatedNonRetainedObject();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityURL
{
  void *v2;
  void *v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PXFocusableUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXMemoryTileImageView")))
  {

  }
  else
  {
    -[PXFocusableUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXMemoryTileSlideshowView"));

    if (!v5)
    {
      -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  -[PXFocusableUIImageViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)accessibilityIdentifier
{
  return 0;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXFocusableUIImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPhotoAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[PXFocusableUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXMemoryTileSlideshowView"));

  if (v4)
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("memory.slideshow.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXFocusableUIImageViewAccessibility;
    -[PXFocusableUIImageViewAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXFocusableUIImageViewAccessibility;
  v3 = -[PXFocusableUIImageViewAccessibility accessibilityTraits](&v17, sel_accessibilityTraits);
  -[PXFocusableUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AXMemoryTileImageView")))
  {

  }
  else
  {
    -[PXFocusableUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AXMemoryTileSlideshowView"));

    if (!v6)
      goto LABEL_5;
  }
  v3 = *MEMORY[0x24BDF73B0];
LABEL_5:
  -[PXFocusableUIImageViewAccessibility _axSelectionManager](self, "_axSelectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXFocusableUIImageViewAccessibility _axIndexPathHolder](self, "_axIndexPathHolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v15 = 0u;
    v16 = 0u;
    if (v8)
      objc_msgSend(v8, "indexPath");
    objc_msgSend(v7, "selectionSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v15;
    v14[1] = v16;
    v11 = objc_msgSend(v10, "isIndexPathSelected:", v14);

    v12 = *MEMORY[0x24BDF7400];
    if (!v11)
      v12 = 0;
    v3 |= v12;

  }
  return v3;
}

@end
