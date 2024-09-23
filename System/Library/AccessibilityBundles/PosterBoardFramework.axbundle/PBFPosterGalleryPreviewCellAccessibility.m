@implementation PBFPosterGalleryPreviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBFPosterGalleryPreviewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PBFPosterGalleryPreviewCell"), CFSTR("PBFPosterGalleryCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PBFPosterGalleryPreviewCell"), CFSTR("posterTitle"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFPosterGalleryPreviewCell"), CFSTR("posterPreviewView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBFPosterGalleryPreviewView"), CFSTR("_posterPreviewContentView"), "PBFPosterGalleryPreviewContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBFPosterGalleryPreviewContentView"), CFSTR("_index"), "NSUInteger");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  -[PBFPosterGalleryPreviewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("posterPreviewView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMappedLabelOrValueForPosterPreview(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    AXPreviewIdentifier(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsString:", CFSTR("Gradient")))
    {
      accessibilityLocalizedString(CFSTR("color.poster.label"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PBFPosterGalleryPreviewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("posterTitle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

      }
      else
      {
        -[PBFPosterGalleryPreviewCellAccessibility accessibilityValue](self, "accessibilityValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_posterPreviewContentView"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          accessibilityLocalizedString(CFSTR("poster.gallery.preview.cell.default.label"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safeUnsignedIntegerForKey:", CFSTR("_index"));
          AXCFormattedString();
          v6 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        }
      }
      -[PBFPosterGalleryPreviewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("posterTitle"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v8;
LABEL_10:

    goto LABEL_11;
  }
  v6 = v4;
LABEL_11:

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[PBFPosterGalleryPreviewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("posterPreviewView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMappedLabelOrValueForPosterPreview(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PBFPosterGalleryPreviewCellAccessibility;
    -[PBFPosterGalleryPreviewCellAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("poster.gallery.preview.cell.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
