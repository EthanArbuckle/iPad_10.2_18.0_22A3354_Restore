@implementation PDFThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFThumbnailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFThumbnailView"), CFSTR("_iconsView"), "UIView<PDFThumbnailCollectionViewInterface>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PDFIconsView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFIconsView"), CFSTR("_activeIcon"), "PDFPageIconLayer");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PDFPageIconLayer"), CFSTR("CALayer"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFIconsView"), CFSTR("_icons"), "NSMutableArray");

}

- (id)_axThumbnailSelf
{
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_axPageNumberForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PDFView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && v7)
    v8 = objc_msgSend(v7, "indexForPage:", v4);

  return v8;
}

- (int64_t)_axCurrentPageNumber
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PDFView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PDFThumbnailViewAccessibility _axPageNumberForPage:](self, "_axPageNumberForPage:", v5);
  return v6;
}

- (id)_axPageDescriptionForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PDFView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PDFThumbnailViewAccessibility _axPageNumberForPage:](self, "_axPageNumberForPage:", v4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = v8 + 1;
    v11 = objc_msgSend(v7, "pageCount");
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("page.x.of.y"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_axMoveOnePage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PDFView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (-[PDFThumbnailViewAccessibility _axCurrentPageNumber](self, "_axCurrentPageNumber") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
    {
      if (objc_msgSend(v6, "canGoToNextPage"))
        objc_msgSend(v6, "goToNextPage:", self);
    }
    else if (objc_msgSend(v6, "canGoToPreviousPage"))
    {
      objc_msgSend(v6, "goToPreviousPage:", self);
    }
  }

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PDFView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  objc_super v14;

  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PDFView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PDFView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 && v8)
    v9 = (unint64_t)objc_msgSend(v5, "pageCount") > 1;
  v14.receiver = self;
  v14.super_class = (Class)PDFThumbnailViewAccessibility;
  v10 = -[PDFThumbnailViewAccessibility accessibilityTraits](&v14, sel_accessibilityTraits);
  v11 = *MEMORY[0x24BDF73A0];
  if (!v9)
    v11 = 0;
  v12 = v11 | v10;

  return v12;
}

- (id)accessibilityValue
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PDFThumbnailViewAccessibility;
  -[PDFThumbnailViewAccessibility accessibilityValue](&v10, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)PDFThumbnailViewAccessibility;
    -[PDFThumbnailViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDFThumbnailViewAccessibility _axThumbnailSelf](self, "_axThumbnailSelf");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PDFView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PDFThumbnailViewAccessibility _axPageDescriptionForPage:](self, "_axPageDescriptionForPage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (void)accessibilityIncrement
{
  -[PDFThumbnailViewAccessibility _axMoveOnePage:](self, "_axMoveOnePage:", 1);
}

- (void)accessibilityDecrement
{
  -[PDFThumbnailViewAccessibility _axMoveOnePage:](self, "_axMoveOnePage:", 0);
}

- (id)_axIconsView
{
  return (id)-[PDFThumbnailViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconsView"));
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  char v13;
  CGPoint result;

  v13 = 0;
  -[PDFThumbnailViewAccessibility _axIconsView](self, "_axIconsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_activeIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "accessibilityFrame");
    AX_CGRectGetCenter();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PDFThumbnailViewAccessibility;
    -[PDFThumbnailViewAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[PDFThumbnailViewAccessibility _axIconsView](self, "_axIconsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PDFThumbnailViewAccessibility;
    -[PDFThumbnailViewAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PDFThumbnailViewAccessibility;
  -[PDFThumbnailViewAccessibility automationElements](&v13, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PDFThumbnailViewAccessibility _axIconsView](self, "_axIconsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("_icons"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v11);
  }

  return v7;
}

@end
