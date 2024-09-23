@implementation CKPhotoSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPhotoSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetContact:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axDescription
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axImageURL
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetImageURL:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKPhotoSearchResultCell"), CFSTR("CKEditableSearchResultCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPhotoSearchResultCell"), CFSTR("isLivePhoto"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEditableSearchResultCell"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPhotoSearchResultCell"), CFSTR("isVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPhotoSearchResultCell"), CFSTR("durationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPhotoSearchResultCell"), CFSTR("prepareForReuse"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPhotoSearchResultCell"), CFSTR("configureWithQueryResult:searchText:mode:"), "v", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKSpotlightQueryResult"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSpotlightQueryResult"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CSSearchableItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSSearchableItem"), CFSTR("attributeSet"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CSSearchableItemAttributeSet"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSSearchableItemAttributeSet"), CFSTR("contentURL"), "@", 0);

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
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;

  -[CKPhotoSearchResultCellAccessibility _axContact](self, "_axContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCKLocalizedFromStringWithContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKPhotoSearchResultCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVideo")))
  {
    accessibilityLocalizedString(CFSTR("video.attachment"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPhotoSearchResultCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("durationLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLocalizeDurationTime();
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    v10 = (void *)v8;
    goto LABEL_16;
  }
  if (-[CKPhotoSearchResultCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isLivePhoto")))v9 = CFSTR("live.photo");
  else
    v9 = CFSTR("photo.attachment");
  accessibilityLocalizedString(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCellAccessibility _axDescription](self, "_axDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCellAccessibility _axImageURL](self, "_axImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length") && v6)
  {
    UIAccessibilityPhotoCreationDate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityEmojiDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      accessibilityUIKitLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v7;
      v16 = v11;
      __UIAXStringForVariables();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      UIAccessibilityMetadataDescriptionForImage();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (UIAccessibilityIsImageScreenshot())
      {
        accessibilityUIKitLocalizedString();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v17 = v7;
      v16 = v12;
      __UIAXStringForVariables();
      v8 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }

    -[CKPhotoSearchResultCellAccessibility _axSetDescription:](self, "_axSetDescription:", v8, v16, v17, CFSTR("__AXStringForVariablesSentinel"));
    goto LABEL_15;
  }
LABEL_16:

  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73C8];
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKPhotoSearchResultCellAccessibility;
  v8 = a3;
  -[CKPhotoSearchResultCellAccessibility configureWithQueryResult:searchText:mode:](&v10, sel_configureWithQueryResult_searchText_mode_, v8, a4, a5);
  objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("item.attributeSet.contentURL"), v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPhotoSearchResultCellAccessibility _axSetImageURL:](self, "_axSetImageURL:", v9);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPhotoSearchResultCellAccessibility;
  -[CKPhotoSearchResultCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[CKPhotoSearchResultCellAccessibility _axSetDescription:](self, "_axSetDescription:", 0);
  -[CKPhotoSearchResultCellAccessibility _axSetContact:](self, "_axSetContact:", 0);
  -[CKPhotoSearchResultCellAccessibility _axSetImageURL:](self, "_axSetImageURL:", 0);
}

@end
