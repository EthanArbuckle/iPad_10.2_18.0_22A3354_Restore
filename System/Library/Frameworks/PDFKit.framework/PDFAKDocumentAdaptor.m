@implementation PDFAKDocumentAdaptor

- (PDFAKDocumentAdaptor)initWithPDFDocument:(id)a3 andView:(id)a4
{
  id v6;
  id v7;
  PDFAKDocumentAdaptor *v8;
  id *p_isa;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PDFAKDocumentAdaptor *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (GetDefaultsWriteAKEnabled())
  {
    v21.receiver = self;
    v21.super_class = (Class)PDFAKDocumentAdaptor;
    v8 = -[PDFAKDocumentAdaptor init](&v21, sel_init);
    p_isa = (id *)&v8->super.isa;
    if (v8)
    {
      v8->_modelBaseScaleFactor = 9.22337204e18;
      objc_storeWeak((id *)&v8->_pdfDocument, v6);
      objc_storeWeak(p_isa + 3, v7);
      objc_msgSend(AKControllerClass(), "controllerWithDelegate:", p_isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 4, v10);
      objc_msgSend(p_isa[4], "setRulerHostingDelegate:", p_isa);
      objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", p_isa, CFSTR("prefersPencilOnlyDrawing"), 0, 0);
      objc_msgSend(p_isa, "_resetAnimationProperties");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", p_isa, sel_adjustScrollViewForKeyboardNotification_, *MEMORY[0x24BDF7B80], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AKDidEndEditingTextAnnotationNotificationString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", p_isa, sel_annotationDidEndEditing_, v13, 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AKWillBeginEditingTextAnnotationNotificationString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", p_isa, sel_annotationWillBeginEditing_, v15, 0);

      objc_storeWeak(p_isa + 5, 0);
      objc_msgSend(v10, "setAnnotationEditingEnabled:", 0);
      if (objc_msgSend(v6, "isLocked") && !objc_msgSend(v6, "pageCount"))
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:selector:name:object:", p_isa, sel__pdfDocumentDidUnlock_, CFSTR("PDFDocumentDidUnlock"), v6);

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", p_isa, sel__pdfViewDidLayout_, CFSTR("PDFViewDidLayoutDocumentView"), v7);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", p_isa, sel__pdfViewDidChangeScale_, CFSTR("PDFViewScaleChanged"), v7);

    }
    self = p_isa;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_isTornDown)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      -[PDFAKDocumentAdaptor _teardown](self, "_teardown");
    else
      NSLog(CFSTR("%s: Called from a background thread, and we aren't torn down yet!"), "-[PDFAKDocumentAdaptor dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKDocumentAdaptor;
  -[PDFAKDocumentAdaptor dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFAKDocumentAdaptor _teardown](self, "_teardown");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__PDFAKDocumentAdaptor_teardown__block_invoke;
    block[3] = &unk_24C25C350;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __32__PDFAKDocumentAdaptor_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardown");
}

- (void)_teardown
{
  void *v3;
  AKController *akController;

  if (!self->_isTornDown)
  {
    self->_isTornDown = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:", self, CFSTR("prefersPencilOnlyDrawing"));
    -[AKController teardown](self->_akController, "teardown");
    akController = self->_akController;
    self->_akController = 0;

    objc_storeWeak((id *)&self->_pdfAKControllerDelegate, 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("prefersPencilOnlyDrawing")))
  {
    -[PDFAKDocumentAdaptor _updatePDFScrollViewMinimumNumberOfTouches](self, "_updatePDFScrollViewMinimumNumberOfTouches");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PDFAKDocumentAdaptor;
    -[PDFAKDocumentAdaptor observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (PDFView)pdfView
{
  return (PDFView *)objc_loadWeakRetained((id *)&self->_pdfView);
}

- (void)setPdfView:(id)a3
{
  objc_storeWeak((id *)&self->_pdfView, a3);
}

- (PDFDocument)pdfDocument
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_pdfDocument);
}

- (AKController)akMainController
{
  return self->_akController;
}

- (AKModelController)akDocumentModelController
{
  return (AKModelController *)-[AKController modelController](self->_akController, "modelController");
}

- (UIView)akToolbarView
{
  AKToolbarView *akToolbarView;
  void *v4;
  AKToolbarView *v5;

  akToolbarView = self->_akToolbarView;
  if (!akToolbarView)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)AKToolbarViewClass()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v4, "setShareButtonHidden:", 1);
    v5 = self->_akToolbarView;
    self->_akToolbarView = (AKToolbarView *)v4;

    akToolbarView = self->_akToolbarView;
  }
  -[AKToolbarView setAnnotationController:](akToolbarView, "setAnnotationController:", self->_akController);
  return (UIView *)self->_akToolbarView;
}

- (PDFAKControllerDelegateProtocol)PDFAKControllerDelegate
{
  return (PDFAKControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
}

- (void)setPDFAKControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pdfAKControllerDelegate, a3);
}

- (void)pdfDocument:(id)a3 didInsertPage:(id)a4 atIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a4, "akPageAdaptor", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "akPageModelController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFAKDocumentAdaptor akDocumentModelController](self, "akDocumentModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "insertObject:atIndex:", v13, a5);
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentPageIndex");

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentPageIndex:", a5);

  }
}

- (void)pdfDocument:(id)a3 didRemovePage:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  id v7;

  -[PDFAKDocumentAdaptor akDocumentModelController](self, "akDocumentModelController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectAtIndex:", a5);
}

- (void)pdfDocumentDidRemoveAllPagesOrPlaceholders:(id)a3
{
  void *v3;
  id v4;

  -[PDFAKDocumentAdaptor akDocumentModelController](self, "akDocumentModelController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeAllObjects");
}

- (void)pdfDocument:(id)a3 didExchangePage:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6 atIndex:(unint64_t)a7
{
  void *v9;
  id v10;

  -[PDFAKDocumentAdaptor akDocumentModelController](self, "akDocumentModelController", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "exchangeObjectAtIndex:withObjectAtIndex:", a5, a7);
}

- (void)pdfDocument:(id)a3 didReplacePagePlaceholder:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a6, "akPageAdaptor", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "akPageModelController");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFAKDocumentAdaptor akDocumentModelController](self, "akDocumentModelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") <= a5)
  {
    objc_msgSend(v10, "insertObject:atIndex:", v15, a5);
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v15)
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v15, a5);
  }
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "currentPageIndex");

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentPageIndex:", a5);

  }
}

- (id)rulerHostingView
{
  return objc_loadWeakRetained((id *)&self->_pdfView);
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "undoManagerForAnnotationController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_pdfView);
    objc_msgSend(v7, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "overlayViewAtIndex:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PDFPointFromCGPoint(x, y);
  v13 = v12;
  -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pageAtIndex:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromPage:", v15, v11, v13);
  v17 = v16;
  v19 = v18;

  objc_msgSend(v10, "convertPoint:toView:", v9, v17, v19);
  v22 = PDFPointToCGPoint(v20, v21);
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "overlayViewAtIndex:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", v9, PDFPointFromCGPoint(x, y));
  v12 = v11;
  v14 = v13;
  -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pageAtIndex:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toPage:", v16, v12, v14);
  v19 = PDFPointToCGPoint(v17, v18);
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  CGRect result;

  -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundsForBox:", 1);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFData *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGContext *v36;
  CGContext *v37;
  id v38;
  CGFloat v39;
  CGFloat MinY;
  _BOOL8 v41;
  __CFData *Mutable;
  __CFData *v43;
  CGDataConsumer *v44;
  CGDataConsumer *v45;
  CGContext *v46;
  CGContext *v47;
  CGAffineTransform v49;
  CGRect mediaBox;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController", a3, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = 0;
  if (v16 && v17)
  {
    objc_msgSend(v15, "overlayViewAtIndex:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pageAtIndex:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "displaysAnnotations");
    objc_msgSend(v21, "setDisplaysAnnotations:", v13);
    objc_msgSend(v16, "convertRect:fromView:", v20, x, y, width, height);
    objc_msgSend(v16, "convertRect:toPage:", v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29 - PDFRectToCGRect(objc_msgSend(v21, "boundsForBox:", 1));
    v32 = v24 - v31;
    v51.origin.x = v30;
    v51.origin.y = v32;
    v51.size.width = v26;
    v51.size.height = v28;
    v33 = CGRectGetWidth(v51);
    v52.origin.x = v30;
    v52.origin.y = v32;
    v52.size.width = v26;
    v52.size.height = v28;
    mediaBox.origin.x = 0.0;
    mediaBox.origin.y = 0.0;
    v34 = v33 * a4;
    v35 = CGRectGetHeight(v52) * a4;
    mediaBox.size.width = v34;
    mediaBox.size.height = v35;
    if (CGDisplayListCreateWithRect())
    {
      CGDisplayListSetBoundingBox();
      v36 = (CGContext *)CGDisplayListContextCreate();
      if (v36)
      {
        v37 = v36;
        CGContextSaveGState(v36);
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v37, (CGColorRef)objc_msgSend(v38, "CGColor"));

        v53.origin.x = 0.0;
        v53.origin.y = 0.0;
        v53.size.width = v34;
        v53.size.height = v35;
        CGContextFillRect(v37, v53);
        CGContextScaleCTM(v37, a4, a4);
        v54.origin.x = v30;
        v54.origin.y = v32;
        v54.size.width = v26;
        v54.size.height = v28;
        v39 = -CGRectGetMinX(v54);
        v55.origin.x = v30;
        v55.origin.y = v32;
        v55.size.width = v26;
        v55.size.height = v28;
        MinY = CGRectGetMinY(v55);
        CGContextTranslateCTM(v37, v39, -MinY);
        -[PDFAKDocumentAdaptor _compensatingAffineTransformForPage:](self, "_compensatingAffineTransformForPage:", v21);
        CGContextConcatCTM(v37, &v49);
        v41 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread](PDFPage, "isExcludingAKAnnotationRenderingForThisThread");
        +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", 1);
        objc_msgSend(v21, "drawWithBox:toContext:", 1, v37);
        +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", v41);
        CGContextRestoreGState(v37);
        CGContextRelease(v37);
        Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        v43 = Mutable;
        if (Mutable)
        {
          v44 = CGDataConsumerCreateWithCFData(Mutable);
          if (v44)
          {
            v45 = v44;
            v46 = CGPDFContextCreate(v44, &mediaBox, 0);
            if (v46)
            {
              v47 = v46;
              CGPDFContextBeginPage(v46, 0);
              CGContextSaveGState(v47);
              CGDisplayListDrawInContext();
              CGContextRestoreGState(v47);
              CGPDFContextEndPage(v47);
              CGPDFContextClose(v47);
              CGContextRelease(v47);
            }
            CGDataConsumerRelease(v45);
          }
        }
      }
      else
      {
        v43 = 0;
      }
      CGDisplayListRelease();
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v21, "setDisplaysAnnotations:", v22);
    v19 = v43;

  }
  return v19;
}

- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3
{
  id v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  CGFloat v14;
  CGFloat v15;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v5 = a4;
  v6 = objc_msgSend(v5, "rotation");
  v7 = PDFDegToRad((double)v6);
  objc_msgSend(v5, "boundsForBox:", 1);

  PDFRectToCGRect(v8);
  v10 = v9;
  v12 = v11;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeRotation(&v20, v7);
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v19.c = v13;
  *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  switch(v6)
  {
    case 270:
      v15 = 0.0;
LABEL_7:
      v14 = v12;
      goto LABEL_8;
    case 180:
      v15 = v10;
      goto LABEL_7;
    case 90:
      v14 = 0.0;
      v15 = v10;
LABEL_8:
      CGAffineTransformMakeTranslation(&v19, v15, v14);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v20;
  v17 = v19;
  return CGAffineTransformConcat(retstr, &t1, &v17);
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "popoverPresentingViewControllerForAnnotationController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "addGestureRecognizer:", v9);

}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", v6);

  if (!v7)
    NSLog(CFSTR("%s: Called when pdfView was nil. This isn't expected."), "-[PDFAKDocumentAdaptor uninstallDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:]");

}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  unint64_t v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[7];

  v7 = a5;
  v71[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v46 = a4;
    v47 = v7;
    v49 = v12;
    objc_msgSend(v11, "doubleTapGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tapGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v15;
    v71[1] = v14;
    objc_msgSend(v11, "pressGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v16;
    objc_msgSend(v11, "panGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v17;
    v50 = v11;
    objc_msgSend(v11, "rotationGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_opt_new();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v48 = v13;
    objc_msgSend(v13, "gestureRecognizers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v20, "addObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v23);
    }

    -[PDFAKDocumentAdaptor _scrollViewRecognizersForPageAtIndex:](self, "_scrollViewRecognizersForPageAtIndex:", v46);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v27);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minusSet:", v28);

    objc_msgSend(v20, "removeObject:", v10);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v29 = v19;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v60 != v32)
            objc_enumerationMutation(v29);
          if (*(void **)(*((_QWORD *)&v59 + 1) + 8 * j) != v14)
            objc_msgSend(v10, "requireGestureRecognizerToFail:");
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v31);
    }

    if (v47)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v34 = v20;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v56 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
            objc_msgSend(v10, "removeFailureRequirement:", v39);
            objc_msgSend(v39, "requireGestureRecognizerToFail:", v10);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        }
        while (v36);
      }
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v40 = v20;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v42; ++m)
          {
            if (*(_QWORD *)v52 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
            objc_msgSend(v45, "removeFailureRequirement:", v10);
            objc_msgSend(v10, "requireGestureRecognizerToFail:", v45);
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        }
        while (v42);
      }
    }

    v12 = v49;
    v11 = v50;
    v13 = v48;
  }

}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v6;
  id WeakRetained;
  double v8;
  double modelBaseScaleFactor;
  void *v10;
  double v11;
  double v12;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "modelBaseScaleFactorOfPageAtIndex:forAnnotationController:", a3, v6);
    modelBaseScaleFactor = v8;
  }
  else
  {
    modelBaseScaleFactor = self->_modelBaseScaleFactor;
    if (modelBaseScaleFactor == 9.22337204e18)
    {
      -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scaleFactor");
      v12 = v11;

      modelBaseScaleFactor = 1.0 / v12;
      self->_modelBaseScaleFactor = modelBaseScaleFactor;
    }
  }

  return modelBaseScaleFactor;
}

- (BOOL)controllerShouldDetectFormElements:(id)a3
{
  return 0;
}

- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "overlayViewAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "pageForPoint:nearest:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v9, "convertPoint:toPage:", v14, v11, v13);
    objc_msgSend(v14, "annotationAtPoint:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Widget")) ^ 1;

    }
    else
    {
      LOBYTE(v18) = 1;
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MidX;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t i;
  void *v34;
  void *v35;
  int v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a5, "overlayViewAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", v10, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v10, "frame");
  MidX = CGRectGetMidX(v58);
  objc_msgSend(v10, "frame");
  v49 = v10;
  objc_msgSend(v11, "convertPoint:fromView:", v10, MidX, CGRectGetMidY(v59));
  objc_msgSend(v11, "pageForPoint:nearest:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v11;
  objc_msgSend(v11, "convertRect:toPage:", v21, v13, v15, v17, v19);
  v61 = CGRectInset(v60, 4.0, 0.0);
  v22 = v61.origin.x;
  v23 = v61.origin.y;
  v24 = v61.size.width;
  v25 = v61.size.height;
  v26 = CGRectGetWidth(v61);
  v62.origin.x = v22;
  v62.origin.y = v23;
  v62.size.width = v24;
  v62.size.height = v25;
  v27 = CGRectGetHeight(v62);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = v21;
  objc_msgSend(v21, "annotations");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v29)
  {
    v30 = v29;
    v50 = v26 * 0.25 * v27;
    v31 = *(_QWORD *)v53;
    v32 = 1;
    v51 = v25;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v34, "valueForAnnotationKey:", CFSTR("/Subtype"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("/Widget"));

        if (v36)
        {
          objc_msgSend(v34, "bounds");
          v67.origin.x = v22;
          v67.origin.y = v23;
          v67.size.width = v24;
          v67.size.height = v25;
          v64 = CGRectIntersection(v63, v67);
          v37 = v64.origin.x;
          v38 = v64.origin.y;
          v39 = v64.size.width;
          v40 = v64.size.height;
          if (!CGRectIsEmpty(v64))
          {
            v65.origin.x = v37;
            v65.origin.y = v38;
            v65.size.width = v39;
            v65.size.height = v40;
            v41 = v24;
            v42 = v23;
            v43 = v22;
            v44 = CGRectGetWidth(v65);
            v66.origin.x = v37;
            v66.origin.y = v38;
            v66.size.width = v39;
            v66.size.height = v40;
            v45 = v44 * CGRectGetHeight(v66);
            v22 = v43;
            v23 = v42;
            v24 = v41;
            v25 = v51;
            v32 &= v45 <= v50;
          }
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v30);
  }
  else
  {
    v32 = 1;
  }

  return v32 & 1;
}

- (CGRect)positioningRectForCandidatePicker
{
  id WeakRetained;
  double v3;
  double v4;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "positioningRectForCandidatePicker");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "editCheckpointReachedForAnnotationController:", v5);

}

- (void)editDetectedForAnnotationController:(id)a3
{
  id v4;
  id WeakRetained;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  PDFAKDocumentAdaptor *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  id v34;
  id from;
  id to;
  id location;

  v4 = a3;
  if (!+[PDFAKDocumentAdaptor isHandlingEditDetected](PDFAKDocumentAdaptor, "isHandlingEditDetected"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
    v6 = objc_msgSend(WeakRetained, "permissionsStatus") != 0;
    -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v7);

    objc_copyWeak(&to, (id *)&self->_pdfAKControllerDelegate);
    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "currentPage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "akPageAdaptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "akPageModelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v11);

    v12 = objc_loadWeakRetained(&from);
    objc_msgSend(v12, "selectedAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v8, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstResponder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&v34, v16);

    objc_msgSend(v8, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __60__PDFAKDocumentAdaptor_editDetectedForAnnotationController___block_invoke;
    v25 = &unk_24C25D3A0;
    v26 = self;
    v27 = v4;
    objc_copyWeak(&v29, &location);
    v33 = v6;
    objc_copyWeak(&v30, &from);
    v18 = v14;
    v28 = v18;
    objc_copyWeak(&v31, &v34);
    objc_copyWeak(&v32, &to);
    v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](&v22);
    v20 = GetDefaultsWriteAKEnabled();
    if (v8)
      v21 = v20;
    else
      v21 = 0;
    if ((v21 & 1) != 0)
      objc_msgSend(WeakRetained, "requirePasswordsIfNeededUsingPresentingViewController:completion:", v17, v19, v22, v23, v24, v25, v26, v27, v28);
    else
      v19[2](v19, 2);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);

    objc_destroyWeak(&to);
    objc_destroyWeak(&location);

  }
}

void __60__PDFAKDocumentAdaptor_editDetectedForAnnotationController___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "undoManagerForAnnotationController:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
  +[PDFAKDocumentAdaptor setIsHandlingEditDetected:](PDFAKDocumentAdaptor, "setIsHandlingEditDetected:", 1);
  if (!a2)
  {
    if (*(_BYTE *)(a1 + 88) && objc_msgSend(v4, "canUndo"))
    {
      objc_msgSend(v4, "undoNestedGroup");
      objc_msgSend(v4, "redo");
    }
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "annotations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 48);

        if (v11)
        {
          v12 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v9, "annotations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setWithArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "intersectSet:", v14);
          objc_msgSend(v9, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSet:", *(_QWORD *)(a1 + 48));

        }
      }
    }
    v16 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v16, "becomeFirstResponder");

    if (a2 == 1)
      goto LABEL_30;
    goto LABEL_15;
  }
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      if (objc_msgSend(v4, "canUndo"))
        objc_msgSend(v4, "undoNestedGroup");
      v6 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v6, "activeAnnotation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeControlForAnnotation:", v7);

    }
    goto LABEL_10;
  }
LABEL_15:
  v17 = objc_loadWeakRetained((id *)(a1 + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[PDFAnnotation PDFKitAnnotationUndoManagerDisplayNames](PDFAnnotation, "PDFKitAnnotationUndoManagerDisplayNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      v28 = 1;
LABEL_18:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22);
        objc_msgSend(v4, "undoActionName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsString:", v23);

        objc_msgSend(v4, "redoActionName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "containsString:", v23);

        if ((v25 & 1) != 0 || (v27 & 1) != 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v20)
            goto LABEL_18;
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      v28 = 0;
    }

    objc_msgSend(v17, "annotationController:detectedEditOfType:", *(_QWORD *)(a1 + 40), v28);
    v5 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "editDetectedForAnnotationController:", *(_QWORD *)(a1 + 40));
  }

LABEL_30:
  objc_msgSend(v5 + 324, "setIsHandlingEditDetected:", 0);

}

+ (void)setIsHandlingEditDetected:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFKitIsHandlingEditDetected"));

}

+ (BOOL)isHandlingEditDetected
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFKitIsHandlingEditDetected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "penStrokeCompletedForAnnotationController:", v5);

}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillShowSignatureCaptureView:", v5);

}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillDismissSignatureCaptureView:", v5);

}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillShowSignatureManagerView:", v5);

}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillDismissSignatureManagerView:", v5);

}

- (void)controllerWillEnterToolMode:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillEnterToolMode:", v6);

}

- (void)controllerDidEnterToolMode:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKDocumentAdaptor", (uint64_t)"Did enter Markup editing mode for PDFView: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  if (v4)
  {
    -[PDFAKDocumentAdaptor _updatePDFScrollViewMinimumNumberOfTouches](self, "_updatePDFScrollViewMinimumNumberOfTouches");
    objc_msgSend(v4, "clearSelection");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerDidEnterToolMode:", v11);

}

- (void)controllerWillExitToolMode:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerWillExitToolMode:", v5);

}

- (void)controllerDidExitToolMode:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKDocumentAdaptor", (uint64_t)"Did exit Markup editing mode for PDFView: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  if (v4)
    -[PDFAKDocumentAdaptor _updatePDFScrollViewMinimumNumberOfTouches](self, "_updatePDFScrollViewMinimumNumberOfTouches");
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "controllerDidExitToolMode:", v11);

}

- (BOOL)shouldAddTabControlsToTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "modelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageModelControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __94__PDFAKDocumentAdaptor_shouldAddTabControlsToTextEditorForAnnotation_forAnnotationController___block_invoke;
  v19 = &unk_24C25D3C8;
  v10 = v6;
  v20 = v10;
  v21 = &v22;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v16);

  if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument", v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pageAtIndex:", v23[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "detectedForm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v14, "count") > 1;

  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

uint64_t __94__PDFAKDocumentAdaptor_shouldAddTabControlsToTextEditorForAnnotation_forAnnotationController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsAnnotation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)handleTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  void *v4;
  char v5;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handleTabInDetectedFormField");

  return v5;
}

- (BOOL)handleBackTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  void *v4;
  char v5;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handleBackTabInDetectedFormField");

  return v5;
}

- (void)handleTextSuggestion:(id)a3 forAnnotationController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleTextSuggestion:completionHandler:", v8, v7);

}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsNull;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  id v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v58 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "positionSketchOverlay:forAnnotationController:", v58, v6);
  }
  else
  {
    -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toolbarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v8, "documentScrollView");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "contentInset");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = v12 + v23;
    v29 = v14 + v21;
    v30 = v16 - (v23 + v27);
    v31 = v18 - (v21 + v25);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "convertRect:toCoordinateSpace:", v10);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v40, "isLocked");

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v8, "pageViewForPageAtIndex:", objc_msgSend(v6, "currentPageIndex"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        objc_msgSend(v41, "bounds");
        objc_msgSend(v42, "convertRect:toCoordinateSpace:", v10);
        v33 = v43;
        v35 = v44;
        v37 = v45;
        v39 = v46;
      }

    }
    v59.origin.x = v28;
    v59.origin.y = v29;
    v59.size.width = v30;
    v59.size.height = v31;
    v63.origin.x = v33;
    v63.origin.y = v35;
    v63.size.width = v37;
    v63.size.height = v39;
    v60 = CGRectIntersection(v59, v63);
    x = v60.origin.x;
    y = v60.origin.y;
    width = v60.size.width;
    height = v60.size.height;
    IsNull = CGRectIsNull(v60);
    if (IsNull)
      v52 = v28;
    else
      v52 = x;
    if (IsNull)
      v53 = v29;
    else
      v53 = y;
    if (IsNull)
      v54 = v30;
    else
      v54 = width;
    if (IsNull)
      v55 = v31;
    else
      v55 = height;
    objc_msgSend(v10, "convertRect:toView:", 0, v52, v53, v54, v55);
    v62 = CGRectIntegral(v61);
    objc_msgSend(v10, "convertRect:fromView:", 0, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    objc_msgSend(v58, "setFrame:");
    objc_msgSend(v58, "superview");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56 != v10)
    {
      objc_msgSend(v58, "setAutoresizingMask:", 18);
      objc_msgSend(v9, "superview");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addSubview:", v58);

    }
  }

}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "controller:willSetToolbarItems:", v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (BOOL)hasHighlightableSelectionForAnnotationController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

- (void)rotateRight:(id)a3
{
  void *v3;
  id v4;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRotation:", objc_msgSend(v4, "rotation") + 90);
}

- (void)rotateLeft:(id)a3
{
  void *v3;
  id v4;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRotation:", objc_msgSend(v4, "rotation") - 90);
}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageViewForPageAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "sublayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v13;

    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  NSLog(CFSTR("%s: Couldn't find PDF page layer. This probably means this is broken now."), "-[PDFAKDocumentAdaptor layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:forAnnotationController:]");
  v14 = v7;
LABEL_12:

  return v14;
}

- (void)_pdfDocumentDidUnlock:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  if (WeakRetained)
  {
    if (v9 == WeakRetained)
    {
      -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "currentPageIndex");

      if (v6 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "pageCount"))
      {
        -[PDFAKDocumentAdaptor akMainController](self, "akMainController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCurrentPageIndex:", 0);

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidUnlock"), v9);

    }
    else
    {
      NSLog(CFSTR("%s notification document %@ not equal to current pdf document %@"), "-[PDFAKDocumentAdaptor _pdfDocumentDidUnlock:]", v9, WeakRetained);
    }
  }

}

- (void)_scheduleDelayedModelBaseScaleFactorCalculation
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedModelBaseScaleFactorCalculation, 0);
  -[PDFAKDocumentAdaptor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedModelBaseScaleFactorCalculation, 0, 0.25);
}

- (void)_delayedModelBaseScaleFactorCalculation
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_isTornDown && self->_modelBaseScaleFactor == 9.22337204e18)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
    v4 = objc_msgSend(WeakRetained, "isLocked");

    if ((v4 & 1) == 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
      if (!v7 || (objc_opt_respondsToSelector() & 1) == 0)
        -[PDFAKDocumentAdaptor modelBaseScaleFactorOfPageAtIndex:forAnnotationController:](self, "modelBaseScaleFactorOfPageAtIndex:forAnnotationController:", 0, self->_akController);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFViewDidLayoutDocumentView"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PDFViewScaleChanged"), 0);

    }
  }
}

- (void)_updatePDFScrollViewMinimumNumberOfTouches
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollViewMinimumNumberOfTouches");
  if (objc_msgSend(v2, "isUsingPageViewController"))
  {
    objc_msgSend(v2, "documentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumNumberOfTouches:", v3);

    objc_msgSend(v4, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "scrollView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "panGestureRecognizer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setMinimumNumberOfTouches:", v3);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(v2, "documentScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumNumberOfTouches:", v3);
  }

  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKOverlayAdaptor", (uint64_t)"Number of touches required to scroll is %lu for PDFView: %@", v14, v15, v16, v17, v18, v3);
}

- (id)_scrollViewRecognizersForPageAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_opt_new();
  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isUsingPageViewController"))
    {
      objc_msgSend(v7, "documentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "panGestureRecognizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(v10, "pinchGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);
      }
      else
      {
        v12 = 0;
      }
      if (a3 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "findPageViewControllerForPageIndex:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scrollView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "panGestureRecognizer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v5, "addObject:", v18);
          objc_msgSend(v17, "pinchGestureRecognizer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v5, "addObject:", v12);
        }

      }
    }
    else
    {
      objc_msgSend(v7, "documentScrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      if (v13)
      {
        objc_msgSend(v13, "panGestureRecognizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v5, "addObject:", v14);
        objc_msgSend(v8, "pinchGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);
      }
      else
      {
        v12 = 0;
      }
    }

  }
  objc_msgSend(v5, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_resetAnimationProperties
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_animationProperties.visibleTextViewRectInScrollView.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_animationProperties.visibleTextViewRectInScrollView.size = v2;
  self->_animationProperties.animationDuration = 0.0;
  self->_animationProperties.originDelta = 0.0;
}

- (void)annotationWillBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  AKRectAnnotation *v6;
  AKRectAnnotation *editingAnnotaiton;
  AKRectAnnotation *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AKEditingTextAnnotationKeyString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (AKRectAnnotation *)objc_claimAutoreleasedReturnValue();

  editingAnnotaiton = self->_editingAnnotaiton;
  self->_editingAnnotaiton = v6;
  v8 = v6;

  +[PDFAKAnnotationAdaptor getPDFAnnotationAssociatedWith:](PDFAKAnnotationAdaptor, "getPDFAnnotationAssociatedWith:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interactWithAnnotation:", v11);

}

- (void)annotationDidEndEditing:(id)a3
{
  double v4;
  CGSize size;
  AKRectAnnotation *editingAnnotaiton;
  void *v7;
  void *v8;
  _OWORD v9[3];

  v4 = -self->_animationProperties.originDelta;
  size = self->_animationProperties.visibleTextViewRectInScrollView.size;
  v9[0] = self->_animationProperties.visibleTextViewRectInScrollView.origin;
  v9[1] = size;
  v9[2] = *(_OWORD *)&self->_animationProperties.animationDuration;
  -[PDFAKDocumentAdaptor _adjustScrollViewWithAnimationProperties:delta:](self, "_adjustScrollViewWithAnimationProperties:delta:", v9, v4);
  -[PDFAKDocumentAdaptor _resetAnimationProperties](self, "_resetAnimationProperties");
  editingAnnotaiton = self->_editingAnnotaiton;
  self->_editingAnnotaiton = 0;

  -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveAnnotation:", 0);

}

- (unint64_t)pageIndexForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  -[PDFAKDocumentAdaptor pdfDocument](self, "pdfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "akDocumentAdaptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "akMainController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageModelControllerForAnnotation:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "modelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pageModelControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v9);

  return v12;
}

- (void)adjustScrollViewForKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  AKRectAnnotation *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double x;
  double y;
  CGFloat width;
  double height;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  float v55;
  CGSize size;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _OWORD v66[3];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v4 = a3;
  v5 = v4;
  if (self->_editingAnnotaiton)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BDF7A18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x24BDF7A20]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = self->_editingAnnotaiton;
    v27 = -[PDFAKDocumentAdaptor pageIndexForAnnotation:](self, "pageIndexForAnnotation:", v26);
    if (v26)
    {
      v28 = v27;
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PDFAKDocumentAdaptor pdfView](self, "pdfView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "documentScrollView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "document");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pageAtIndex:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[AKRectAnnotation rectangle](v26, "rectangle");
        objc_msgSend(v29, "convertRect:fromPage:", v32);
        objc_msgSend(v29, "convertRect:toView:", 0);
        v63 = v34;
        v64 = v33;
        v61 = v36;
        v62 = v35;
        objc_msgSend(v30, "window");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "convertRect:fromView:", v37, v9, v11, v13, v15);
        v39 = v38;

        objc_msgSend(v30, "window");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "convertRect:fromView:", v40, v19, v21, v23, v25);
        v42 = v41;

        v43 = 0.0;
        if (v39 - v42 >= 0.0)
          v43 = v39 - v42;
        v65 = v43;
        self->_animationProperties.originDelta = self->_animationProperties.originDelta + v43;
        objc_msgSend(v30, "bounds");
        objc_msgSend(v30, "convertRect:toView:", 0);
        x = v67.origin.x;
        y = v67.origin.y;
        width = v67.size.width;
        height = v67.size.height;
        v71.origin.x = v19;
        v71.origin.y = v21;
        v71.size.width = v23;
        v71.size.height = v25;
        if (CGRectIntersectsRect(v67, v71))
        {
          v68.origin.x = x;
          v68.origin.y = y;
          v68.size.width = width;
          v68.size.height = height;
          v72.origin.x = v19;
          v72.origin.y = v21;
          v72.size.width = v23;
          v72.size.height = v25;
          v69 = CGRectIntersection(v68, v72);
          v48 = height - (CGRectGetHeight(v69) + 0.0);
          objc_msgSend(v30, "convertRect:fromView:", 0, v64, v63, v62, v61);
          v59 = v50;
          v60 = v49;
          v57 = v52;
          v58 = v51;
          v70.origin.x = x + 0.0;
          v70.origin.y = y + 0.0;
          v70.size.width = width;
          v70.size.height = v48;
          v73.origin.x = v64;
          v73.origin.y = v63;
          v73.size.width = v62;
          v73.size.height = v61;
          if (!CGRectContainsRect(v70, v73))
          {
            self->_animationProperties.visibleTextViewRectInScrollView.origin.x = v60;
            self->_animationProperties.visibleTextViewRectInScrollView.origin.y = v59;
            self->_animationProperties.visibleTextViewRectInScrollView.size.width = v58;
            self->_animationProperties.visibleTextViewRectInScrollView.size.height = v57;
          }
        }
        objc_msgSend(v5, "userInfo");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "valueForKey:", *MEMORY[0x24BDF79C0]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "floatValue");
        self->_animationProperties.animationDuration = v55;

        size = self->_animationProperties.visibleTextViewRectInScrollView.size;
        v66[0] = self->_animationProperties.visibleTextViewRectInScrollView.origin;
        v66[1] = size;
        v66[2] = *(_OWORD *)&self->_animationProperties.animationDuration;
        -[PDFAKDocumentAdaptor _adjustScrollViewWithAnimationProperties:delta:](self, "_adjustScrollViewWithAnimationProperties:delta:", v66, v65);

      }
    }

  }
}

- (void)_adjustScrollViewWithAnimationProperties:(TextAnnotationAnimationProperties *)a3 delta:(double)a4
{
  void *v7;
  double animationDuration;
  CGSize size;
  _QWORD v10[6];
  CGPoint origin;
  CGSize v12;
  __int128 v13;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginIgnoringInteractionEvents");

  animationDuration = a3->animationDuration;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke;
  v10[3] = &unk_24C25D3F0;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  size = a3->visibleTextViewRectInScrollView.size;
  origin = a3->visibleTextViewRectInScrollView.origin;
  v12 = size;
  v13 = *(_OWORD *)&a3->animationDuration;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v10, &__block_literal_global_9, animationDuration);
}

void __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentScrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contentInset");
  objc_msgSend(v3, "setContentInset:");
  if (!CGRectIsNull(*(CGRect *)(a1 + 48)))
    objc_msgSend(v3, "scrollRectToVisible:animated:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endIgnoringInteractionEvents");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingAnnotaiton, 0);
  objc_storeStrong((id *)&self->_akToolbarView, 0);
  objc_destroyWeak((id *)&self->_pdfAKControllerDelegate);
  objc_storeStrong((id *)&self->_akController, 0);
  objc_destroyWeak((id *)&self->_pdfView);
  objc_destroyWeak((id *)&self->_pdfDocument);
}

@end
