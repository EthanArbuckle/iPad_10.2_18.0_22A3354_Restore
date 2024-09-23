@implementation QLMarkupItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLMarkupItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMarkupItemViewController"), CFSTR("loadPreviewControllerWithContents:context:completionHandler:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMarkupItemViewController"), CFSTR("previewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLMarkupItemViewController"), CFSTR("QLItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItemViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItemViewController"), CFSTR("context"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewContext"), CFSTR("previewTitle"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  -[QLMarkupItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[QLMarkupItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLMarkupItemViewControllerAccessibility _axPhotoDescriptionFromContext:](self, "_axPhotoDescriptionFromContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLMarkupItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityLabel:", v4);

}

uint64_t __85__QLMarkupItemViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  -[QLMarkupItemViewControllerAccessibility loadPreviewControllerWithContents:context:completionHandler:](&v6, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, a4, a5);
  -[QLMarkupItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  -[QLMarkupItemViewControllerAccessibility viewDidLoad](&v4, sel_viewDidLoad);
  -[QLMarkupItemViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  -[QLMarkupItemViewControllerAccessibility previewDidAppear:](&v4, sel_previewDidAppear_, a3);
  -[QLMarkupItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axPhotoDescriptionFromContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("previewTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
