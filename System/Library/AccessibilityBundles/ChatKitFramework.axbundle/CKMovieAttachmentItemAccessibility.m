@implementation CKMovieAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMovieAttachmentItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMovieAttachmentItem"), CFSTR("CKAttachmentItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentItem"), CFSTR("fileURL"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  accessibilityLocalizedString(CFSTR("video.attachment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMovieAttachmentItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fileURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityMetadataDescriptionForVideo();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
