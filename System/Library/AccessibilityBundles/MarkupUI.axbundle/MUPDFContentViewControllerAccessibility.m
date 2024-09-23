@implementation MUPDFContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPDFContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AKOverlayView"));
  objc_msgSend(v3, "validateClass:", CFSTR("AKHighlightColorEditorController"));
  objc_msgSend(v3, "validateClass:", CFSTR("AKAnnotationLayer"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MUPDFContentViewController"), CFSTR("MUContentViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKHighlightColorEditorController"), CFSTR("AKAnnotationPopoverViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPDFContentViewController"), CFSTR("pdfView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUContentViewController"), CFSTR("annotationController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKController"), CFSTR("pageControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKController"), CFSTR("currentPageIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("overlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKOverlayView"), CFSTR("pageController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("highlightColorEditorController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKHighlightColorEditorController"), CFSTR("calloutBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationLayer"), CFSTR("annotation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKAnnotationPopoverViewController"), CFSTR("mAnnotation"), "AKAnnotation");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPDFContentViewController"), CFSTR("loadContentWithCompletionBlock:"), "v", "@?", 0);

}

- (id)_axAKOverlayView
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  -[MUPDFContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("pageControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("currentPageIndex"));
  if (v5 >= objc_msgSend(v4, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("overlayView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPDFContentViewControllerAccessibility;
  -[MUPDFContentViewControllerAccessibility loadContentWithCompletionBlock:](&v4, sel_loadContentWithCompletionBlock_, a3);
  -[MUPDFContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPDFContentViewControllerAccessibility;
  -[MUPDFContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MUPDFContentViewControllerAccessibility _axAKOverlayView](self, "_axAKOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234913B5C](CFSTR("AKOverlayView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("pageController.highlightColorEditorController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("mAnnotation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewControllerAccessibility _axHighlightPopoverPresentedForAnnotation:withHighlightController:pullFocus:](self, "_axHighlightPopoverPresentedForAnnotation:withHighlightController:pullFocus:", v5, v4, 0);

  }
}

- (void)_axHighlightPopoverPresentedForAnnotation:(id)a3 withHighlightController:(id)a4 pullFocus:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  MUPDFContentViewControllerAccessibility *v22;
  _BOOL4 v23;
  void *v24;
  id argument;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MUPDFContentViewControllerAccessibility _axAKOverlayView](self, "_axAKOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234913B5C](CFSTR("AKOverlayView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    MEMORY[0x234913B5C](CFSTR("AKHighlightColorEditorController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "safeValueForKey:", CFSTR("calloutBar"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        v24 = v9;
        argument = (id)v11;
        v22 = self;
        v23 = v5;
        objc_msgSend(v10, "accessibilityElements");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              MEMORY[0x234913B5C](CFSTR("AKAnnotationLayer"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v20, "safeValueForKey:", CFSTR("annotation"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "isEqual:", v8))
                {
                  objc_msgSend(v15, "insertObject:atIndex:", argument, objc_msgSend(v15, "indexOfObject:", v20));

                  goto LABEL_16;
                }

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_16:

        objc_msgSend(v10, "setAccessibilityElements:", v15);
        v9 = v24;
        objc_msgSend(v24, "_accessibilitySetAssignedValue:forKey:", v22, CFSTR("AXCalloutBarDelegate"));
        v12 = argument;
        if (v23)
          UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);

      }
    }
  }

}

- (void)_axHighlightPopoverDismissed
{
  void *v2;

  -[MUPDFContentViewControllerAccessibility _axAKOverlayView](self, "_axAKOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXAKRetainedElements"));

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
