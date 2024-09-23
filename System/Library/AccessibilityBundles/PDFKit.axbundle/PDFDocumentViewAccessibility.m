@implementation PDFDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFDocumentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPageViews
{
  JUMPOUT(0x2349187C4);
}

- (void)_axSetPageViews:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFDocumentView"), CFSTR("_private"), "PDFDocumentViewPrivate");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFDocumentViewPrivate"), CFSTR("pdfView"), "PDFView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("extensionViewZoomScale"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("extensionViewBoundsInDocument"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("renderingProperties"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFRenderingProperties"), CFSTR("isUsingPDFExtensionView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFDocumentView"), CFSTR("updateVisibility"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFDocumentView"), CFSTR("layoutDocumentView"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[PDFDocumentViewAccessibility _axIsUsingPDFExtensionView](self, "_axIsUsingPDFExtensionView"))
  {
    -[PDFDocumentViewAccessibility _axGetPDFView](self, "_axGetPDFView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeCGFloatForKey:", CFSTR("extensionViewZoomScale"));
    v10 = v9;
    objc_msgSend(v8, "safeCGRectForKey:", CFSTR("extensionViewBoundsInDocument"));
    v12 = v11;
    v14 = v13;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = y / v10;
    v17 = x / v10 + v12;
    v18 = v16 + v14;
    objc_msgSend(v15, "subviews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v23, "convertPoint:fromView:", self, v17, v18);
          if (objc_msgSend(v23, "pointInside:withEvent:", v7))
          {
            v20 = v23;
            goto LABEL_13;
          }
        }
        v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_13:

    objc_msgSend(v20, "_accessibilityHitTest:withEvent:", v7, v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PDFDocumentViewAccessibility;
    -[PDFDocumentViewAccessibility _accessibilityHitTest:withEvent:](&v30, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)_axGetPDFView
{
  void *v2;
  void *v3;

  -[PDFDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_private"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("pdfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsUsingPDFExtensionView
{
  void *v2;
  void *v3;
  char v4;

  -[PDFDocumentViewAccessibility _axGetPDFView](self, "_axGetPDFView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("renderingProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isUsingPDFExtensionView"));

  return v4;
}

- (void)updateVisibility
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFDocumentViewAccessibility;
  -[PDFDocumentViewAccessibility updateVisibility](&v3, sel_updateVisibility);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", AXPDFVisibiltyUpdatedNotification, 0, 0);

}

- (void)layoutDocumentView
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFDocumentViewAccessibility;
  -[PDFDocumentViewAccessibility layoutDocumentView](&v3, sel_layoutDocumentView);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", AXPDFVisibiltyUpdatedNotification, 0, 0);

}

@end
