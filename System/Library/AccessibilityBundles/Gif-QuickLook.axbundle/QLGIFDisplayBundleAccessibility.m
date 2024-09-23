@implementation QLGIFDisplayBundleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLGIFDisplayBundle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLGIFDisplayBundle"), CFSTR("_imageView"), "UIImageView");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("QLSwippableItemProtocol"), CFSTR("previewItem"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("QLPreviewItem"), CFSTR("previewItemURL"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLGIFDisplayBundleAccessibility;
  -[QLGIFDisplayBundleAccessibility viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[QLGIFDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);

  -[QLGIFDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("previewItemURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLGIFDisplayBundleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityEmojiDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

@end
