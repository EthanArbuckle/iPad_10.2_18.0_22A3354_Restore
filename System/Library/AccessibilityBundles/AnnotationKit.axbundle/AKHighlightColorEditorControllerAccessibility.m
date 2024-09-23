@implementation AKHighlightColorEditorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKHighlightColorEditorController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AKHighlightAnnotation"));
  objc_msgSend(v3, "validateClass:", CFSTR("AKAnnotationTheme"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKHighlightColorEditorController"), CFSTR("AKAnnotationPopoverViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationPopoverViewController"), CFSTR("annotation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationPopoverViewController"), CFSTR("annotationTheme"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightAnnotation"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightAnnotation"), CFSTR("style"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationTheme"), CFSTR("pageTheme"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightColorEditorController"), CFSTR("presentFromRect: view:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightColorEditorController"), CFSTR("p_setStyle: forAnnotation:"), "v", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightColorEditorController"), CFSTR("p_updateAppearance"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightColorEditorController"), CFSTR("p_colorForTag: pageTheme:"), "@", "q", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationPopoverViewController"), CFSTR("didHide"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  char v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  -[AKHighlightColorEditorControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[AKHighlightColorEditorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490590C](CFSTR("AKHighlightAnnotation"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("style")) != 2)
    {
      -[AKHighlightColorEditorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotationTheme"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x23490590C](CFSTR("AKAnnotationTheme"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("pageTheme"));
        objc_msgSend(v3, "safeValueForKey:", CFSTR("color"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 1; i != 7; ++i)
        {
          -[AKHighlightColorEditorControllerAccessibility p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", i, v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = UIAccessibilityColorEqualToColor();

          if ((v9 & 1) != 0)
            break;
        }

      }
    }
    v10 = v3;
    AXPerformSafeBlock();

  }
}

uint64_t __91__AKHighlightColorEditorControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "p_setStyle:forAnnotation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "p_updateAppearance");
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  -[AKHighlightColorEditorControllerAccessibility presentFromRect:view:](&v5, sel_presentFromRect_view_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AKHighlightColorEditorControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)didHide
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  -[AKHighlightColorEditorControllerAccessibility didHide](&v4, sel_didHide);
  -[AKHighlightColorEditorControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCalloutBarDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490590C](CFSTR("MUPDFContentViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_axHighlightPopoverDismissed");

}

@end
