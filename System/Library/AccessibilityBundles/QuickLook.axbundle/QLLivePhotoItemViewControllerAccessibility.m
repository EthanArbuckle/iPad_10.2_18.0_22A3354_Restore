@implementation QLLivePhotoItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLLivePhotoItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLLivePhotoItemViewController"), CFSTR("loadPreviewControllerWithContents:context:completionHandler:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLLivePhotoItemViewController"), CFSTR("previewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLLivePhotoItemViewController"), CFSTR("_livePhotoView"), "PHLivePhotoView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLLivePhotoItemViewController"), CFSTR("QLItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItemViewController"), CFSTR("context"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewContext"), CFSTR("previewTitle"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  -[QLLivePhotoItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[QLLivePhotoItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLivePhotoItemViewControllerAccessibility _axPhotoDescriptionFromContext:](self, "_axPhotoDescriptionFromContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLivePhotoItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_livePhotoView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  -[QLLivePhotoItemViewControllerAccessibility loadPreviewControllerWithContents:context:completionHandler:](&v6, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, a4, a5);
  -[QLLivePhotoItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  -[QLLivePhotoItemViewControllerAccessibility previewDidAppear:](&v4, sel_previewDidAppear_, a3);
  -[QLLivePhotoItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axPhotoDescriptionFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("previewTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  accessibilityLocalizedString(CFSTR("ql.live.photo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
