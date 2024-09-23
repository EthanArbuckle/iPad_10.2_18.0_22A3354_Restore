@implementation UIDocumentInteractionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDocumentInteractionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDocumentInteractionController"), CFSTR("presentPreviewAnimated:"), "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDocumentInteractionController"), CFSTR("previewsPresentWithMarkup"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDocumentInteractionController"), CFSTR("previewController"), "@", 0);

}

- (BOOL)presentPreviewAnimated:(BOOL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIDocumentInteractionControllerAccessibility;
  v4 = -[UIDocumentInteractionControllerAccessibility presentPreviewAnimated:](&v11, sel_presentPreviewAnimated_, a3);
  if (-[UIDocumentInteractionControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("previewsPresentWithMarkup")))
  {
    objc_opt_class();
    -[UIDocumentInteractionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("additionalRightBarButtonItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("sharing.markup.button.label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

  }
  return v4;
}

@end
