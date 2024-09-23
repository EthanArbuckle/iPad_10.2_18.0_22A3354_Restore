@implementation AKPageControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKPageController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("_popoverPresentingViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("openPopoverForHighlightAnnotation:"), "v", "@", 0);

}

- (void)openPopoverForHighlightAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKPageControllerAccessibility;
  -[AKPageControllerAccessibility openPopoverForHighlightAnnotation:](&v8, sel_openPopoverForHighlightAnnotation_, v4);
  -[AKPageControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_popoverPresentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490590C](CFSTR("MUPDFContentViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[AKPageControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("highlightColorEditorController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_axHighlightPopoverPresentedForAnnotation:withHighlightController:pullFocus:", v4, v7, 1);

  }
}

@end
