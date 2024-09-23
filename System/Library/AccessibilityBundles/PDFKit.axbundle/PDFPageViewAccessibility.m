@implementation PDFPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFPageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPageViewElements
{
  JUMPOUT(0x2349187C4);
}

- (void)_axSetPageViewElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axAllNodeElements
{
  JUMPOUT(0x2349187C4);
}

- (void)_axSetAllNodeElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("convertPoint: toPage:"), "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("convertRect: fromPage:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFPageView"), CFSTR("setNeedsTilesUpdate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFPageView"), CFSTR("page"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFPage"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFAnnotation"), CFSTR("control"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFPageView"), CFSTR("removeControlForAnnotation:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFPageView"), CFSTR("resetAccessibilityTree"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGPDFPage)_axPageRef
{
  void *v2;
  void *v3;
  CGPDFPage *v4;

  -[PDFPageViewAccessibility _axGetPage](self, "_axGetPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (CGPDFPage *)objc_msgSend(v3, "pageRef");
  return v4;
}

- (id)_axGetPage
{
  return (id)-[PDFPageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("page"));
}

- (id)_axGetPDFView
{
  void *v2;
  void *v3;

  -[PDFPageViewAccessibility _axGetPage](self, "_axGetPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsUsingPDFExtensionView
{
  void *v2;
  void *v3;
  char v4;

  -[PDFPageViewAccessibility _axGetPDFView](self, "_axGetPDFView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("renderingProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isUsingPDFExtensionView"));

  return v4;
}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  objc_super v4;

  if (-[PDFPageViewAccessibility _axIsUsingPDFExtensionView](self, "_axIsUsingPDFExtensionView"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAccessibility;
  return -[PDFPageViewAccessibility _accessibilityIsFrameOutOfBounds](&v4, sel__accessibilityIsFrameOutOfBounds);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[PDFPageViewAccessibility _axIsUsingPDFExtensionView](self, "_axIsUsingPDFExtensionView"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PDFPageViewAccessibility _axAllElements](self, "_axAllElements", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "accessibilityFrame");
          v23.x = x;
          v23.y = y;
          if (CGRectContainsPoint(v24, v23))
          {
            v14 = v13;

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PDFPageViewAccessibility;
    -[PDFPageViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v14;
}

- (id)_axAllElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[PDFPageViewAccessibility _axAllNodeElements](self, "_axAllNodeElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageViewAccessibility accessibilityElements](self, "accessibilityElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);
    while (1)
    {

      if (!objc_msgSend(v4, "count"))
        break;
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectAtIndex:", 0);
      if (objc_msgSend(v5, "isAccessibilityElement"))
      {
        objc_msgSend(v3, "addObject:", v5);
      }
      else
      {
        objc_msgSend(v5, "accessibilityElements");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          objc_msgSend(v5, "accessibilityElements");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v8);

        }
      }
    }
    -[PDFPageViewAccessibility _axSetAllNodeElements:](self, "_axSetAllNodeElements:", v3);

  }
  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  uint64_t v4;
  UICGPDFNodeAccessibilityElement *v5;
  void *v6;
  UICGPDFNodeAccessibilityElement *v7;

  -[PDFPageViewAccessibility _axPageViewElements](self, "_axPageViewElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageViewAccessibility _axPageRef](self, "_axPageRef");
    v4 = CGPDFPageCopyRootTaggedNode();
    v5 = [UICGPDFNodeAccessibilityElement alloc];
    -[PDFPageViewAccessibility _axGetPage](self, "_axGetPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UICGPDFNodeAccessibilityElement initWithAccessibilityContainer:pdfNodeRef:withPage:](v5, "initWithAccessibilityContainer:pdfNodeRef:withPage:", self, v4, v6);

    objc_msgSend(v3, "axSafelyAddObject:", v7);
    +[UICGPDFNodeAccessibilityElement buildPDFAnnotationNodes:](UICGPDFNodeAccessibilityElement, "buildPDFAnnotationNodes:", v7);
    -[PDFPageViewAccessibility _axSetPageViewElements:](self, "_axSetPageViewElements:", v3);
    CGPDFTaggedNodeRelease();

  }
  return v3;
}

- (void)resetAccessibilityTree
{
  -[PDFPageViewAccessibility _axSetPageViewElements:](self, "_axSetPageViewElements:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_axLineSelections
{
  void *v3;
  const void *v4;
  void *SelectionsByLine;

  -[PDFPageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("lineSelections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PDFPageViewAccessibility _axPageRef](self, "_axPageRef");
    v4 = (const void *)CGPDFSelectionCreateForEntirePage();
    SelectionsByLine = (void *)CGPDFSelectionCreateSelectionsByLine();
    -[PDFPageViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", SelectionsByLine, CFSTR("lineSelections"));

    if (v4)
      CFRelease(v4);
  }
  return v3;
}

- (CGPDFSelection)_lineSelectionForSelection:(CGPDFSelection *)a3
{
  uint64_t TextRange;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGPDFSelection *v12;
  uint64_t v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  TextRange = CGPDFSelectionGetTextRange();
  v6 = v5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PDFPageViewAccessibility _axLineSelections](self, "_axLineSelections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(CGPDFSelection **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if (CGPDFSelectionGetTextRange() == TextRange && v13 == v6)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (void)removeControlForAnnotation:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAccessibility;
  -[PDFPageViewAccessibility removeControlForAnnotation:](&v4, sel_removeControlForAnnotation_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", AXPDFRemoveFromSuperviewNotification, 0, 0);

}

@end
