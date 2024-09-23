@implementation AXPDFNodeElement

- (AXPDFNodeElement)initWithAccessibilityContainer:(id)a3 withPage:(id)a4
{
  id v5;
  AXPDFNodeElement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXPDFNodeElement;
  v5 = a4;
  v6 = -[AXPDFNodeElement initWithAccessibilityContainer:](&v8, sel_initWithAccessibilityContainer_, a3);
  -[AXPDFNodeElement setPage:](v6, "setPage:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (id)pdfView
{
  PDFView **p_pdfView;
  id WeakRetained;
  void *v5;
  void *v6;

  p_pdfView = &self->_pdfView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[AXPDFNodeElement _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234918584](CFSTR("PDFView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_pdfView, v6);

  }
  return objc_loadWeakRetained((id *)p_pdfView);
}

- (BOOL)isLastNodeInPage
{
  void *v3;
  BOOL isLastNodeInPage;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AXPDFNodeElement *v10;

  -[AXPDFNodeElement pdfView](self, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !-[AXPDFNodeElement isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  if (-[AXPDFNodeElement didDetermineLastNodeStatus](self, "didDetermineLastNodeStatus"))
    return self->_isLastNodeInPage;
  if (-[AXPDFNodeElement isGatheringLeafDescendents](self, "isGatheringLeafDescendents"))
    return 0;
  -[AXPDFNodeElement accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v6, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(v6, "_accessibilityValueForKey:", CFSTR("AXValidElements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[AXPDFNodeElement setIsGatheringLeafDescendents:](self, "setIsGatheringLeafDescendents:", 1);
    objc_msgSend(MEMORY[0x24BEBADC8], "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityLeafDescendantsWithOptions:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXPDFNodeElement setIsGatheringLeafDescendents:](self, "setIsGatheringLeafDescendents:", 0);
    objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("AXValidElements"));
  }
  objc_msgSend(v8, "lastObject");
  v10 = (AXPDFNodeElement *)objc_claimAutoreleasedReturnValue();
  self->_isLastNodeInPage = v10 == self;

  -[AXPDFNodeElement setDidDetermineLastNodeStatus:](self, "setDidDetermineLastNodeStatus:", 1);
  isLastNodeInPage = self->_isLastNodeInPage;

  return isLastNodeInPage;
}

- (BOOL)pdfViewRequiresPageTurning
{
  void *v2;
  BOOL v3;

  -[AXPDFNodeElement pdfView](self, "pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "isUsingPageViewController") & 1) != 0
    || objc_msgSend(v2, "displayMode") == 2
    || objc_msgSend(v2, "displayMode") == 0;

  return v3;
}

- (CGRect)axConvertBoundsFromPageToScreenCoordinates:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  CGRect v15;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_232882249;
  v15 = a3;
  AXPerformSafeBlock();
  v3 = v12[4];
  v4 = v12[5];
  v5 = v12[6];
  v6 = v12[7];
  _Block_object_dispose(&v11, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

void __63__AXPDFNodeElement_axConvertBoundsFromPageToScreenCoordinates___block_invoke(uint64_t a1)
{
  void *v2;
  double *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGRect *v10;
  UIView *v11;

  objc_msgSend(*(id *)(a1 + 32), "pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:fromPage:", v4, v3[4], v3[5], v3[6], v3[7]);
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;

  v10 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "pdfView");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = UIAccessibilityConvertFrameToScreenCoordinates(v10[1], v11);

}

- (BOOL)didDetermineLastNodeStatus
{
  return self->_didDetermineLastNodeStatus;
}

- (void)setDidDetermineLastNodeStatus:(BOOL)a3
{
  self->_didDetermineLastNodeStatus = a3;
}

- (BOOL)isGatheringLeafDescendents
{
  return self->_isGatheringLeafDescendents;
}

- (void)setIsGatheringLeafDescendents:(BOOL)a3
{
  self->_isGatheringLeafDescendents = a3;
}

- (void)setIsLastNodeInPage:(BOOL)a3
{
  self->_isLastNodeInPage = a3;
}

- (PDFPage)page
{
  return (PDFPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
  objc_destroyWeak((id *)&self->_pdfView);
}

@end
