@implementation CKImageAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKImageAttachmentItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKAttachmentItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentItem"), CFSTR("isIrisAsset"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKImageAttachmentItem"), CFSTR("CKAttachmentItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKImageAttachmentItem"), CFSTR("imageData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKImageData"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMovieAttachmentItem"), CFSTR("CKAttachmentItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentItem"), CFSTR("fileURL"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[CKImageAttachmentItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isIrisAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("live.photo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXAttributedStringForBetterPronuciation();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("photo.attachment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKImageAttachmentItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fileURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityMetadataDescriptionForImage();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPhotoCreationDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
