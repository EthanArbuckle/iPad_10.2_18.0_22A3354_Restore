@implementation _CKNanoMediaImagePresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CKNanoMediaImagePresenter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CKNanoMediaImagePresenter"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CKNanoMediaImagePresenter"), CFSTR("_imageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoMediaPresenter"), CFSTR("mediaObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObject"), CFSTR("fileURL"), "@", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CKNanoMediaImagePresenterAccessibility;
  -[_CKNanoMediaImagePresenterAccessibility viewDidLoad](&v17, sel_viewDidLoad);
  -[_CKNanoMediaImagePresenterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    -[_CKNanoMediaImagePresenterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("fileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityMetadataDescriptionForImage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityEmojiDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      UIAccessibilityPhotoCreationDate();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("photo.attachment"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      v16 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v9, "length", v14, v16))
    {
      accessibilityUIKitLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9;
    }
    else
    {
      if (UIAccessibilityIsImageScreenshot())
      {
        accessibilityUIKitLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      v15 = v8;
    }
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v13, v15, CFSTR("__AXStringForVariablesSentinel"));

  }
}

@end
