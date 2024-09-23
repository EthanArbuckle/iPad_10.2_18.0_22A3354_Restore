@implementation QLImageDisplayBundleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLImageDisplayBundle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLImageDisplayBundle"), CFSTR("loadWithHints:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLImageDisplayBundle"), CFSTR("_previewItem"), "id<QLPreviewItem>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLImageDisplayBundle"), CFSTR("_imageView"), "UIImageView");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("QLPreviewItem"), CFSTR("previewItemURL"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("QLPreviewItem"), CFSTR("previewItemTitle"));

}

- (void)loadWithHints:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLImageDisplayBundleAccessibility;
  -[QLImageDisplayBundleAccessibility loadWithHints:](&v8, sel_loadWithHints_, a3);
  -[QLImageDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageDisplayBundleAccessibility _axPhotoDescriptionFromItem:](self, "_axPhotoDescriptionFromItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLImageDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);

  -[QLImageDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v5);

}

- (id)_axPhotoDescriptionFromItem:(id)a3
{
  id v3;
  const __CFURL *v4;
  void *v5;
  CGImageSource *v6;
  CGImageRef ImageAtIndex;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("previewItemURL"));
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("previewItemTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CGImageSourceCreateWithURL(v4, 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  UIAccessibilityMetadataDescriptionForImage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXPhotoDescriptionString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (ImageAtIndex)
    CFRelease(ImageAtIndex);
  if (v6)
    CFRelease(v6);
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
