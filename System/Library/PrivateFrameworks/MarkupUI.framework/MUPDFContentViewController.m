@implementation MUPDFContentViewController

- (MUPDFContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  MUPDFContentViewController *v9;

  v6 = (objc_class *)MEMORY[0x24BDE30F0];
  v7 = a5;
  v8 = objc_alloc_init(v6);
  v9 = -[MUPDFContentViewController initWithPDFDocument:delegate:](self, "initWithPDFDocument:delegate:", v8, v7);

  return v9;
}

- (MUPDFContentViewController)initWithPDFDocument:(id)a3 delegate:(id)a4
{
  id v7;
  MUPDFContentViewController *v8;
  MUPDFContentViewController *v9;
  id *p_pdfDocument;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MUPDFContentViewController;
  v8 = -[MUContentViewController initWithNibName:bundle:delegate:](&v12, sel_initWithNibName_bundle_delegate_, 0, 0, a4);
  v9 = v8;
  if (v8)
  {
    p_pdfDocument = (id *)&v8->_pdfDocument;
    objc_storeStrong((id *)&v8->_pdfDocument, a3);
    objc_msgSend(*p_pdfDocument, "setDelegate:", v9);
    objc_msgSend(*p_pdfDocument, "setPDFAKControllerDelegate:", v9);
    v9->_thumbnailViewStyle = 0;
    -[MUPDFContentViewController setInkStyle:](v9, "setInkStyle:", 1);
  }

  return v9;
}

- (BOOL)allowsThumbnailViewPageReordering
{
  void *v2;
  void *v3;
  char v4;

  -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "allowsPageReordering");
  else
    v4 = 0;

  return v4;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_allowsThumbnailViewPageReordering = a3;
  -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsPageReordering:", v3);

}

- (void)setInkStyle:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  self->_inkStyle = a3;
  v3 = a3 == 0;
  -[MUContentViewController annotationController](self, "annotationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseHighVisibilityDefaultInks:", v3);

}

- (void)dealloc
{
  objc_super v3;

  -[MUPDFContentViewController teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  if (!-[MUPDFContentViewController viewIsTransitioningBetweenSizes](self, "viewIsTransitioningBetweenSizes"))
  {
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autoScales");

    -[MUPDFContentViewController pdfView](self, "pdfView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scaleFactor");
    v7 = v6;
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoScaleFactor");
    v10 = vabdd_f64(v7, v9);

    -[MUPDFContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor");
    if (v10 < 0.0005)
    {
      -[MUPDFContentViewController pdfView](self, "pdfView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController pdfView](self, "pdfView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "autoScaleFactor");
      objc_msgSend(v11, "setScaleFactor:");

    }
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "autoScales");

    if ((_DWORD)v4 != v14)
    {
      -[MUPDFContentViewController pdfView](self, "pdfView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAutoScales:", v4);

    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
}

- (void)setup
{
  NSLog(CFSTR("%s"), a2, "-[MUPDFContentViewController setup]");
  -[MUPDFContentViewController setDidSetup:](self, "setDidSetup:", 1);
}

- (void)teardown
{
  void *v3;

  NSLog(CFSTR("%s"), a2, "-[MUPDFContentViewController teardown]");
  -[MUPDFContentViewController _teardownPDFViewIfNecessary](self, "_teardownPDFViewIfNecessary");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (-[MUPDFContentViewController didSetup](self, "didSetup"))
    -[MUPDFContentViewController setDidSetup:](self, "setDidSetup:", 0);
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v4 = (void *)MEMORY[0x2207DC428](objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1));
  -[MUPDFContentViewController _createPDFView](self, "_createPDFView");
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  CGSize result;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaleFactor");
  v5 = v4;
  v6 = objc_msgSend(v3, "autoScales");
  objc_msgSend(v3, "setAutoScales:", 0);
  objc_msgSend(v3, "setScaleFactor:", 1.0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__MUPDFContentViewController_contentSize__block_invoke;
  v14[3] = &unk_24E5D48A8;
  v15 = v3;
  v7 = v3;
  -[MUPDFContentViewController _medianSizeForCurrentDocumentInPDFViewWithGetter:](self, "_medianSizeForCurrentDocumentInPDFViewWithGetter:", v14);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "setScaleFactor:", v5);
  objc_msgSend(v7, "setAutoScales:", v6);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

uint64_t __41__MUPDFContentViewController_contentSize__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rowSizeForPage:", a2);
}

- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double v5;
  double v6;
  void *v7;
  int v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  char v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[4];
  id v28;
  CGSize result;

  v5 = a3.width - a4.width;
  v6 = a3.height - a4.height;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autoScales");
  objc_msgSend(v7, "setScaleFactor:", 1.0);
  objc_msgSend(v7, "setAutoScales:", 0);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __81__MUPDFContentViewController_idealContentSizeForScreenSize_windowDecorationSize___block_invoke;
  v27[3] = &unk_24E5D48A8;
  v9 = v7;
  v28 = v9;
  -[MUPDFContentViewController _medianSizeForCurrentDocumentInPDFViewWithGetter:](self, "_medianSizeForCurrentDocumentInPDFViewWithGetter:", v27);
  v11 = v10;
  v13 = v12;
  if ((objc_msgSend(v9, "displayMode") & 1) != 0)
  {
    objc_msgSend(v9, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pageCount");

    if (v15 > 1)
      v13 = 1.79769313e308;
  }
  v16 = objc_msgSend(v9, "displayMode");
  v17 = v6 / v13;
  if (v5 / v11 < v6 / v13)
    v17 = v5 / v11;
  if ((v16 & 1) != 0)
    v17 = v5 / v11;
  v18 = fmin(v17, 1.0);
  objc_msgSend(v9, "setScaleFactor:", v18);
  objc_msgSend(v9, "setAutoScales:", 0);
  v19 = v13 * v18;
  if ((objc_msgSend(v9, "displayMode") & 1) != 0)
  {
    objc_msgSend(v9, "document");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "pageCount");

    if (v21 > 1)
      v19 = 1.79769313e308;
  }
  if (v8)
    objc_msgSend(v9, "setAutoScales:", 1);
  v22 = v11 * v18;
  if (v19 >= v6)
    v23 = v6;
  else
    v23 = v19;
  if (v22 >= v5)
    v24 = v5;
  else
    v24 = v22;

  v25 = v24;
  v26 = v23;
  result.height = v26;
  result.width = v25;
  return result;
}

uint64_t __81__MUPDFContentViewController_idealContentSizeForScreenSize_windowDecorationSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rowSizeForPage:", a2);
}

- (int64_t)defaultToolTag
{
  return 764017;
}

- (UIScrollView)contentViewScrollView
{
  void *v2;
  void *v3;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (BOOL)PDFView:(id)a3 shouldHandleLink:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MUContentViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "contentViewController:shouldHandleURL:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (BOOL)shouldShowAnnotationsOfType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MUCGPDFAnnotationAdaptor supportedAnnotationTypes](MUCGPDFAnnotationAdaptor, "supportedAnnotationTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

- (BOOL)documentCanBeEdited:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  _BOOL4 v9;

  v4 = a3;
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {
    v9 = -[MUPDFContentViewController canEditContent](self, "canEditContent");

    if (!v9)
    {
      v7 = 0;
      goto LABEL_5;
    }
    -[MUContentViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "allowsEditing");
      goto LABEL_4;
    }
  }
  else
  {
    v6 = (void *)v5;
  }
  v7 = 0;
LABEL_4:

LABEL_5:
  return v7;
}

- (id)menuElementsForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "getMenuElementsForPage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canShowPageViewLabel
{
  void *v3;
  int v4;
  void *v5;

  -[MUContentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v4) = objc_msgSend(v3, "canShowPageViewLabel");
  }
  else
  {
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isLocked") ^ 1;

  }
  return v4;
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  -[MUContentViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "annotationControllerOfContentViewController:willSetToolbarItems:", self, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "positionSketchOverlay:forContentViewController:", v6, self);

}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "annotationController:detectedEditOfType:", v6, a4);

}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editCheckpointReachedForAnnotationController:", v4);

}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "penStrokeCompletedForAnnotationController:", v4);

}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillShowSignatureCaptureView:", v4);

}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillDismissSignatureCaptureView:", v4);

}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillShowSignatureManagerView:", v4);

}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillDismissSignatureManagerView:", v4);

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = self->_edgeInsets.left;
  v25 = self->_edgeInsets.top;
  v10 = self->_edgeInsets.bottom;
  v9 = self->_edgeInsets.right;
  self->_edgeInsets = a3;
  v11 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
  v12 = 0.0;
  if (v11)
    v13 = 0.0;
  else
    v13 = top;
  if (v13 > 0.0)
  {
    if (v11)
      v14 = left;
    else
      v14 = 0.0;
    if (v11)
      v15 = 0.0;
    else
      v15 = bottom;
    v23 = v15;
    v24 = v14;
    if (v11)
      v12 = right;
    -[MUPDFContentViewController thumbnailView](self, "thumbnailView", *(_QWORD *)&v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentInset:", v13, v24, v23, v22);

  }
  if (v8 != left || v25 != top || v9 != right || v10 != bottom)
  {
    -[MUContentViewController annotationController](self, "annotationController", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "currentPageIndex");

    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      -[MUPDFContentViewController _updatePageNumberOverlayToPage:animate:](self, "_updatePageNumberOverlayToPage:animate:", v21, 0);
  }
  if (!-[MUPDFContentViewController viewIsTransitioningBetweenSizes](self, "viewIsTransitioningBetweenSizes"))
    -[MUPDFContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor");
}

- (unint64_t)pageCount
{
  void *v2;
  unint64_t v3;

  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pageCount");

  return v3;
}

- (void)setFixedThumbnailView:(BOOL)a3
{
  if (self->_fixedThumbnailView != a3)
  {
    self->_fixedThumbnailView = a3;
    -[MUPDFContentViewController removeThumbnailViewHolderConstraints](self, "removeThumbnailViewHolderConstraints");
    -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
  }
}

- (void)setShowsThumbnailView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD);
  void *v32;
  void *v33;
  _QWORD v34[6];
  BOOL v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  if (self->_showsThumbnailView == a3)
    return;
  v3 = a3;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    self->_showsThumbnailView = v3;
    return;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "animationDuration");
  v7 = v6;
  if ((objc_msgSend(MEMORY[0x24BDE57D8], "disableActions") & 1) != 0
    || -[MUPDFContentViewController fixedThumbnailView](self, "fixedThumbnailView"))
  {
    v7 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if (v7 <= 0.0)
  {
    self->_showsThumbnailView = v3;
    if (-[MUPDFContentViewController fixedThumbnailView](self, "fixedThumbnailView"))
    {
      if (v3)
        v8 = 1.0;
      else
        v8 = 0.0;
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", v8);

    }
    -[MUPDFContentViewController _updateThumbnailViewHolderVisibility](self, "_updateThumbnailViewHolderVisibility");
    if (!v3)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v3)
  {
LABEL_16:
    -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3108]), "initWithFrame:style:", self->_thumbnailViewStyle, 0.0, 0.0, 100.0, 100.0);
      objc_msgSend(v11, "setThumbnailContextMenuDelegate:", self);
      objc_msgSend(v11, "setAllowsPageReordering:", self->_allowsThumbnailViewPageReordering);
      -[MUPDFContentViewController setThumbnailView:](self, "setThumbnailView:", v11);
      -[MUPDFContentViewController pdfView](self, "pdfView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPDFView:", v12);

      -[MUPDFContentViewController _updateThumbnailViewAppearance](self, "_updateThumbnailViewAppearance");
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v11);

      _NSDictionaryOfVariableBindings(CFSTR("thumbnailView"), v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[thumbnailView]-0@999-|"), 0, 0, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addConstraints:", v16);

      -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController setThumbnailViewLeadingConstraint:](self, "setThumbnailViewLeadingConstraint:", v21);

      -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v27) = 1148829696;
      objc_msgSend(v26, "setPriority:", v27);
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewLeadingConstraint](self, "thumbnailViewLeadingConstraint");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v29;
      v36[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addConstraints:", v30);

      -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
      -[MUPDFContentViewController setEdgeInsets:](self, "setEdgeInsets:", self->_edgeInsets.top, self->_edgeInsets.left, self->_edgeInsets.bottom, self->_edgeInsets.right);

LABEL_20:
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      if (v7 <= 0.0)
        return;
      goto LABEL_21;
    }
LABEL_17:
    -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
LABEL_21:
  self->_showsThumbnailView = v3;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke;
  v34[3] = &unk_24E5D48F8;
  v35 = v3;
  v34[4] = self;
  v34[5] = 0x3FC999999999999ALL;
  v31 = (void (**)(_QWORD))MEMORY[0x2207DC5F0](v34);
  -[MUPDFContentViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    v31[2](v31);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v31);

}

uint64_t __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke(uint64_t a1)
{
  char v2;
  double v3;
  _QWORD v5[5];
  char v6;
  _QWORD v7[4];
  uint64_t v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "_updateCachedThumbnailViewInsetsDidChangeLeftOrRight");
  objc_msgSend(*(id *)(a1 + 32), "_updateThumbnailViewHolderConstraints");
  v2 = *(_BYTE *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateThumbnailViewHolderVisibility");
    v2 = *(_BYTE *)(a1 + 48);
  }
  v3 = *(double *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_2;
  v7[3] = &unk_24E5D43B8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_3;
  v5[3] = &unk_24E5D48D0;
  v6 = v2;
  v5[4] = v8;
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v7, v5, v3);
}

void __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  if (objc_msgSend(*(id *)(a1 + 32), "fixedThumbnailView"))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = 1.0;
    else
      v3 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "thumbnailViewHolder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", v3);

  }
}

uint64_t __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_updateThumbnailViewHolderVisibility");
  return result;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  if (self->_navigationModeHorizontal != a3)
  {
    self->_navigationModeHorizontal = a3;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[MUPDFContentViewController _updateThumbnailViewAppearance](self, "_updateThumbnailViewAppearance");
    -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
    -[MUPDFContentViewController _updatePDFViewDisplayMode](self, "_updatePDFViewDisplayMode");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  id v4;

  if (self->_forcesPDFViewTopAlignment != a3)
  {
    self->_forcesPDFViewTopAlignment = a3;
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForcesTopAlignment:", self->_forcesPDFViewTopAlignment);

  }
}

- (void)_updatePDFViewDisplayMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal") ^ 1;
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayMode:", v4);

    -[MUPDFContentViewController pdfView](self, "pdfView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayBox:", 1);

  }
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentScrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6
    && !a4
    && -[MUPDFContentViewController _updateCachedThumbnailViewInsetsDidChangeLeftOrRight](self, "_updateCachedThumbnailViewInsetsDidChangeLeftOrRight"))
  {
    if (-[MUPDFContentViewController showsThumbnailView](self, "showsThumbnailView"))
      -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
  }
}

- (double)_thumbnailViewWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->_thumbnailViewStyle != 1)
    return 61.0;
  objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v4, 81.0);
  v6 = v5;

  return (v6 + -81.0) * 0.5 + 81.0;
}

- (CGSize)_thumbnailViewCellSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (-[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal"))
  {
    v3 = 22.0;
    v4 = 18.0;
  }
  else if (self->_thumbnailViewStyle == 1)
  {
    -[MUPDFContentViewController _thumbnailViewWidth](self, "_thumbnailViewWidth");
    v6 = 47.0;
    if (v5 <= 47.0)
      v6 = v5;
    v4 = v5 + -12.0;
    if (v4 < v6)
      v4 = v6;
    v3 = v4;
  }
  else
  {
    v4 = 31.0;
    v3 = 41.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (BOOL)_updateCachedThumbnailViewInsetsDidChangeLeftOrRight
{
  void *v3;
  _BOOL8 v4;
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
  BOOL v16;
  double v17;
  double v21;
  double v22;

  -[MUPDFContentViewController contentViewScrollView](self, "contentViewScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_thumbnailViewStyle != 1;
  -[MUPDFContentViewController _thumbnailViewWidth](self, "_thumbnailViewWidth");
  objc_msgSend(v3, "_baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:", v4, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MUPDFContentViewController cachedThumnailViewInsets](self, "cachedThumnailViewInsets");
  v16 = 0;
  if (v17 != v8 || v13 != v6 || v15 != v12 || v14 != v10)
  {
    -[MUPDFContentViewController cachedThumnailViewInsets](self, "cachedThumnailViewInsets");
    v16 = 1;
    if (v21 == v12)
    {
      -[MUPDFContentViewController cachedThumnailViewInsets](self, "cachedThumnailViewInsets");
      if (v22 == v8)
        v16 = 0;
    }
    -[MUPDFContentViewController setCachedThumnailViewInsets:](self, "setCachedThumnailViewInsets:", v6, v8, v10, v12);
  }

  return v16;
}

- (void)_updateThumbnailViewHolderBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_thumbnailViewStyle == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[MUPDFContentViewController scrollerBackgroundView](self, "scrollerBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v6);
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      _NSDictionaryOfVariableBindings(CFSTR("backgroundView"), v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[backgroundView]-0-|"), 0, 0, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addConstraints:", v11);

      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[backgroundView]-0-|"), 0, 0, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addConstraints:", v13);

      -[MUPDFContentViewController setScrollerBackgroundView:](self, "setScrollerBackgroundView:", v7);
    }
    v14 = !self->_showsThumbnailView;
    -[MUPDFContentViewController scrollerBackgroundView](self, "scrollerBackgroundView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.301960784, 0.2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[MUPDFContentViewController scrollerBackgroundView](self, "scrollerBackgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");

    -[MUPDFContentViewController setScrollerBackgroundView:](self, "setScrollerBackgroundView:", 0);
  }
}

- (void)_updateThumbnailViewHolderVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = !self->_showsThumbnailView;
  -[MUPDFContentViewController scrollerBackgroundView](self, "scrollerBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (void)removeThumbnailViewHolderConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[MUPDFContentViewController thumbnailViewHolderConstraints](self, "thumbnailViewHolderConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPDFContentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewController thumbnailViewHolderConstraints](self, "thumbnailViewHolderConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[MUPDFContentViewController setThumbnailViewHolderWidthConstraint:](self, "setThumbnailViewHolderWidthConstraint:", 0);
    -[MUPDFContentViewController setThumbnailViewHolderConstraints:](self, "setThumbnailViewHolderConstraints:", 0);
    -[MUPDFContentViewController setThumbnailViewHolderRevealConstraint:](self, "setThumbnailViewHolderRevealConstraint:", 0);
  }
}

- (void)_updateThumbnailViewHolderConstraints
{
  void *v3;
  void *v4;
  BOOL v5;
  char v6;
  int64_t thumbnailViewStyle;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  int v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[3];

  v64[2] = *MEMORY[0x24BDAC8D0];
  -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPDFContentViewController thumbnailViewHolderConstraints](self, "thumbnailViewHolderConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
      v6 = v5 ^ -[MUPDFContentViewController constraintsAreHorizontal](self, "constraintsAreHorizontal");
    }
    else
    {
      v6 = 1;
    }

    thumbnailViewStyle = self->_thumbnailViewStyle;
    if (thumbnailViewStyle == 1)
    {
      -[MUPDFContentViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeAreaInsets");
      v9 = v13;
      v11 = v14;

    }
    else
    {
      -[MUPDFContentViewController cachedThumnailViewInsets](self, "cachedThumnailViewInsets");
      v9 = v8;
      v11 = v10;
    }
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection"))
      v9 = v11;

    if (-[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal"))
    {
      v16 = 40.0;
    }
    else
    {
      -[MUPDFContentViewController _thumbnailViewWidth](self, "_thumbnailViewWidth");
      v16 = v17;
    }
    v18 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
    v19 = thumbnailViewStyle != 1 || v18;
    v20 = -0.0;
    if (!v19)
      v20 = v9;
    v21 = v16 + v20;
    if (-[MUPDFContentViewController showsThumbnailView](self, "showsThumbnailView"))
      v22 = 1.0;
    else
      v22 = v21 + 1.0;
    if (-[MUPDFContentViewController showsThumbnailView](self, "showsThumbnailView"))
    {
      v23 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
      v24 = 0.0;
      if (thumbnailViewStyle != 1)
        v24 = v11;
      v25 = v22 - v24;
      if (!v23)
        v22 = v25;
    }
    if ((v6 & 1) != 0)
    {
      -[MUPDFContentViewController removeThumbnailViewHolderConstraints](self, "removeThumbnailViewHolderConstraints");
      v26 = (void *)objc_opt_new();
      -[MUPDFContentViewController setThumbnailViewHolderConstraints:](self, "setThumbnailViewHolderConstraints:", v26);
      -[MUPDFContentViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _NSDictionaryOfVariableBindings(CFSTR("holderView"), v28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = CFSTR("WIDTH");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = CFSTR("OFFSET");
      v64[0] = v30;
      if (thumbnailViewStyle == 1)
        v31 = -v22;
      else
        v31 = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0x24BDD1000uLL;
      if (-[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal"))
      {
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[holderView(WIDTH)]"), 0, v33, v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObjectsFromArray:", v35);

        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 4, 0, v27, 4, 1.0, v22);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPDFContentViewController setThumbnailViewHolderRevealConstraint:](self, "setThumbnailViewHolderRevealConstraint:", v36);

        v37 = CFSTR("H:|-(-1)-[holderView]-(-1)-|");
      }
      else
      {
        objc_msgSend(v28, "widthAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "constraintEqualToConstant:", v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPDFContentViewController setThumbnailViewHolderWidthConstraint:](self, "setThumbnailViewHolderWidthConstraint:", v42);

        -[MUPDFContentViewController thumbnailViewHolderWidthConstraint](self, "thumbnailViewHolderWidthConstraint");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v43);

        if (thumbnailViewStyle == 1)
        {
          -[MUPDFContentViewController thumbnailViewLeadingConstraint](self, "thumbnailViewLeadingConstraint");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setConstant:", v9);

          v46 = -[MUPDFContentViewController fixedThumbnailView](self, "fixedThumbnailView");
          -[MUPDFContentViewController pdfViewLeadingConstraint](self, "pdfViewLeadingConstraint");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v46)
          {
            objc_msgSend(v47, "setActive:", 0);

            objc_msgSend(v28, "leadingAnchor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "leadingAnchor");
            v62 = v27;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "constraintEqualToAnchor:", v50);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "trailingAnchor");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPDFContentViewController pdfView](self, "pdfView");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "leadingAnchor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "constraintEqualToAnchor:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = 0x24BDD1000;
            v27 = v62;

            objc_msgSend(v26, "addObject:", v44);
            objc_msgSend(v26, "addObject:", v54);
          }
          else
          {
            objc_msgSend(v47, "setActive:", 1);

            objc_msgSend(v28, "leadingAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "leadingAnchor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "constraintEqualToAnchor:constant:", v54, -v22);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPDFContentViewController setThumbnailViewHolderRevealConstraint:](self, "setThumbnailViewHolderRevealConstraint:", v55);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 2, 0, v27, 2, 1.0, v22);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPDFContentViewController setThumbnailViewHolderRevealConstraint:](self, "setThumbnailViewHolderRevealConstraint:", v44);
        }

        -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = CFSTR("V:|-(-1)-[holderView]-(-1)-|");
        if (!v56)
          goto LABEL_45;
      }
      -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v57);

LABEL_45:
      objc_msgSend(*(id *)(v34 + 1576), "constraintsWithVisualFormat:options:metrics:views:", v37, 0, v33, v29);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v58);

      -[MUPDFContentViewController setConstraintsAreHorizontal:](self, "setConstraintsAreHorizontal:", -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal"));
      -[MUPDFContentViewController view](self, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addConstraints:", v26);

      -[MUPDFContentViewController view](self, "view");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setNeedsLayout");

      return;
    }
    if (thumbnailViewStyle == 1)
      v22 = -v22;
    -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setConstant:", v22);

    v39 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
    if (thumbnailViewStyle == 1 && !v39)
    {
      -[MUPDFContentViewController thumbnailViewHolderWidthConstraint](self, "thumbnailViewHolderWidthConstraint");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setConstant:", v21);

      -[MUPDFContentViewController thumbnailViewLeadingConstraint](self, "thumbnailViewLeadingConstraint");
      v61 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setConstant:", v9);

    }
  }
}

- (void)_updateThumbnailViewAppearance
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    if (-[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal"))
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v4);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.274509804, 1.0);
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = objc_msgSend(v5, "CGColor");
      objc_msgSend(v16, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBorderColor:", v6);

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nativeScale");
      v10 = 1.0 / v9;
      objc_msgSend(v16, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBorderWidth:", v10);

      v12 = 1;
    }
    else
    {
      objc_msgSend(v16, "setBackgroundColor:", 0);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.0);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "CGColor");
      objc_msgSend(v16, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBorderColor:", v14);

      objc_msgSend(v16, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderWidth:", 0.0);
      v12 = 0;
    }

    objc_msgSend(v16, "setLayoutMode:", v12);
    -[MUPDFContentViewController _thumbnailViewCellSize](self, "_thumbnailViewCellSize");
    objc_msgSend(v16, "setThumbnailSize:");
    v3 = v16;
  }

}

- (NSString)documentUnlockedWithPassword
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEncrypted");

  if (v4)
  {
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passwordUsedForUnlocking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)_createPDFView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MUPDFPageLabelView *v39;
  MUPDFPageLabelView *pageLabelView;
  UITapGestureRecognizer *v41;
  UITapGestureRecognizer *pageLabelViewTapGestureRecognizer;
  void *v43;
  uint64_t v44;
  UIScreenEdgePanGestureRecognizer *v45;
  UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  MUPDFView *firstValue;

  -[MUPDFContentViewController _teardownPDFViewIfNecessary](self, "_teardownPDFViewIfNecessary");
  firstValue = -[MUPDFView initWithFrame:]([MUPDFView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[MUPDFView setForcesTopAlignment:](firstValue, "setForcesTopAlignment:", -[MUPDFContentViewController forcesPDFViewTopAlignment](self, "forcesPDFViewTopAlignment"));
  -[MUPDFContentViewController setPdfView:](self, "setPdfView:", firstValue);
  -[MUPDFView setDelegate:](firstValue, "setDelegate:", self);
  -[MUPDFContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", firstValue);

  -[MUPDFView setTranslatesAutoresizingMaskIntoConstraints:](firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPDFView leadingAnchor](firstValue, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPDFView trailingAnchor](firstValue, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = 1148829696;
  objc_msgSend(v11, "setPriority:", v12);
  -[MUPDFContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v7);

  -[MUPDFContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraint:", v11);

  -[MUPDFContentViewController setPdfViewLeadingConstraint:](self, "setPdfViewLeadingConstraint:", v7);
  _NSDictionaryOfVariableBindings(CFSTR("pdfView"), firstValue, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[pdfView]-0@999-|"), 0, 0, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraints:", v17);

  -[MUPDFContentViewController _updatePDFViewDisplayMode](self, "_updatePDFViewDisplayMode");
  v18 = objc_alloc(MEMORY[0x24BDF6F90]);
  v19 = *MEMORY[0x24BDBF090];
  v20 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v21 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v23 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], v20, v21, v22);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.301960784, 0.2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  -[MUPDFContentViewController setThumbnailViewHolder:](self, "setThumbnailViewHolder:", v23);
  -[MUPDFContentViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "insertSubview:above:", v23, firstValue);

  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isLocked");

  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDE31E0];
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_pdfDocumentDidUnlock_, v29, v30);

  }
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFView setDocument:waitDuration:](firstValue, "setDocument:waitDuration:", v31, 0.25);

  -[MUPDFView setAutoScales:](firstValue, "setAutoScales:", 1);
  v32 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
  v33 = -[MUPDFContentViewController showsThumbnailView](self, "showsThumbnailView");
  self->_navigationModeHorizontal = !v32;
  self->_showsThumbnailView = !v33;
  -[MUPDFContentViewController setNavigationModeHorizontal:](self, "setNavigationModeHorizontal:", v32);
  -[MUPDFContentViewController setShowsThumbnailView:](self, "setShowsThumbnailView:", v33);
  if (v33)
  {
    -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPDFView:", firstValue);

  }
  -[MUPDFView documentScrollView](firstValue, "documentScrollView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDecelerationRate:", *MEMORY[0x24BDF7D80]);
  objc_msgSend(v35, "setMaximumZoomScale:", 10.0);
  objc_msgSend(v35, "setMinimumZoomScale:", 0.1);
  objc_msgSend(v35, "_addBoundingPathChangeObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", self, sel__userChangedScrollViewMagnificationNotification_, CFSTR("UITextSelectionDidZoom"), v35);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_pdfViewDidChangeCurrentPage_, *MEMORY[0x24BDE3208], firstValue);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObserver:selector:name:object:", self, sel_pdfScrollViewWillBeginDragging_, *MEMORY[0x24BDE31F8], 0);

  if (self->_pageLabelView
    || (v39 = -[MUPDFPageLabelView initWithFrame:]([MUPDFPageLabelView alloc], "initWithFrame:", v19, v20, v21, v22), pageLabelView = self->_pageLabelView, self->_pageLabelView = v39, pageLabelView, -[MUPDFPageLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_pageLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0), self->_pageLabelView))
  {
    if (!self->_pageLabelViewTapGestureRecognizer)
    {
      v41 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_pageLabelViewTapped_);
      pageLabelViewTapGestureRecognizer = self->_pageLabelViewTapGestureRecognizer;
      self->_pageLabelViewTapGestureRecognizer = v41;

      -[MUPDFPageLabelView addGestureRecognizer:](self->_pageLabelView, "addGestureRecognizer:", self->_pageLabelViewTapGestureRecognizer);
    }
  }
  if (!self->_edgePanGestureRecognizer)
  {
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "effectiveUserInterfaceLayoutDirection");

    v45 = (UIScreenEdgePanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D40]), "initWithTarget:action:", self, sel_edgeSwipeGestureRecognized_);
    edgePanGestureRecognizer = self->_edgePanGestureRecognizer;
    self->_edgePanGestureRecognizer = v45;

    if (v44 == 1)
      v47 = 8;
    else
      v47 = 2;
    -[UIScreenEdgePanGestureRecognizer setEdges:](self->_edgePanGestureRecognizer, "setEdges:", v47);
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addGestureRecognizer:", self->_edgePanGestureRecognizer);

  }
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "akController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUContentViewController setAnnotationController:](self, "setAnnotationController:", v50);

}

- (void)_teardownPDFViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removeBoundingPathChangeObserver:", self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UITextSelectionDidZoom"), v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDE3208], v13);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDE31E0];
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

    -[MUPDFContentViewController removeThumbnailViewHolderConstraints](self, "removeThumbnailViewHolderConstraints");
    -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPDFView:", 0);

    -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[MUPDFContentViewController setThumbnailView:](self, "setThumbnailView:", 0);
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[MUPDFContentViewController setThumbnailViewHolder:](self, "setThumbnailViewHolder:", 0);
    -[PDFDocument setDelegate:](self->_pdfDocument, "setDelegate:", 0);
    -[PDFDocument setPDFAKControllerDelegate:](self->_pdfDocument, "setPDFAKControllerDelegate:", 0);
    objc_msgSend(v13, "setDelegate:", 0);
    objc_msgSend(v13, "removeFromSuperview");
    objc_msgSend(v13, "setDocument:", 0);
    -[MUPDFContentViewController setPdfView:](self, "setPdfView:", 0);

  }
}

- (void)pdfViewDidChangeCurrentPage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v5 == v11)
  {
    objc_msgSend(v11, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPage");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        v10 = objc_msgSend(v7, "indexForPage:", v8);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          -[MUPDFContentViewController _updatePageNumberOverlayToPage:animate:](self, "_updatePageNumberOverlayToPage:animate:", v10, 1);
      }
    }

    v6 = v11;
  }

}

- (void)pdfScrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MUPDFContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!v7 || objc_msgSend(v6, "isDescendantOfView:", v7))
    && self->_shouldShowThumbnailView
    && -[MUPDFContentViewController thumbnailViewStyle](self, "thumbnailViewStyle") == 1)
  {
    self->_shouldShowThumbnailView = 0;
    -[MUPDFContentViewController _updateThumbnailView](self, "_updateThumbnailView");
  }

}

- (void)pdfDocumentDidUnlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v7 = -[MUPDFContentViewController navigationModeHorizontal](self, "navigationModeHorizontal");
    v8 = -[MUPDFContentViewController showsThumbnailView](self, "showsThumbnailView");
    self->_navigationModeHorizontal = !v7;
    self->_showsThumbnailView = !v8;
    -[MUPDFContentViewController setNavigationModeHorizontal:](self, "setNavigationModeHorizontal:", v7);
    -[MUPDFContentViewController setShowsThumbnailView:](self, "setShowsThumbnailView:", v8);
    -[MUContentViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "contentControllerDidUnlockDocument:", self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDE31E0];
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, v11, v12);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__MUPDFContentViewController_pdfDocumentDidUnlock___block_invoke;
    block[3] = &unk_24E5D4068;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s notification document %@ not equal to current pdf document %@"), "-[MUPDFContentViewController pdfDocumentDidUnlock:]", v4, v6);

  }
}

uint64_t __51__MUPDFContentViewController_pdfDocumentDidUnlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateThumbnailView");
}

- (void)_updateThumbnailView
{
  id v2;

  -[MUContentViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "updateThumbnailView");

}

- (void)pageLabelViewTapped:(id)a3
{
  if (-[MUPDFContentViewController thumbnailViewStyle](self, "thumbnailViewStyle", a3) == 1)
  {
    self->_shouldShowThumbnailView ^= 1u;
    -[MUPDFContentViewController _updateThumbnailView](self, "_updateThumbnailView");
    -[MUPDFPageLabelView resetFadeOutTimer](self->_pageLabelView, "resetFadeOutTimer");
  }
}

- (void)edgeSwipeGestureRecognized:(id)a3
{
  if (-[MUPDFContentViewController thumbnailViewStyle](self, "thumbnailViewStyle", a3) == 1
    && !self->_shouldShowThumbnailView)
  {
    self->_shouldShowThumbnailView = 1;
    -[MUPDFContentViewController _updateThumbnailView](self, "_updateThumbnailView");
  }
}

- (void)_removePageLabelViewConstraints
{
  NSLayoutConstraint *v3;
  NSLayoutConstraint *pageLabelViewTopConstraint;
  NSLayoutConstraint *pageLabelViewSideConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;

  v3 = self->pageLabelViewTopConstraint;
  v8 = v3;
  if (v3)
  {
    -[NSLayoutConstraint setActive:](v3, "setActive:", 0);
    pageLabelViewTopConstraint = self->pageLabelViewTopConstraint;
    self->pageLabelViewTopConstraint = 0;

    v3 = v8;
  }
  pageLabelViewSideConstraint = self->pageLabelViewSideConstraint;
  if (pageLabelViewSideConstraint)
  {
    v6 = pageLabelViewSideConstraint;
    -[NSLayoutConstraint setActive:](v6, "setActive:", 0);
    v7 = self->pageLabelViewSideConstraint;
    self->pageLabelViewSideConstraint = 0;

    v3 = v8;
  }

}

- (void)_updatePageNumberOverlayToPage:(unint64_t)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MUPDFPageLabelView *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *pageLabelViewTopConstraint;
  void *v22;
  double v23;
  NSLayoutConstraint *pageLabelViewSideConstraint;
  int64_t thumbnailViewStyle;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  void *v32;
  _QWORD v33[5];

  v4 = a4;
  if (-[MUPDFContentViewController canShowPageViewLabel](self, "canShowPageViewLabel"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%lu of %lu"), &stru_24E5D4C60, CFSTR("MUPDFContentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, a3 + 1, objc_msgSend(v10, "pageCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPDFContentViewController pdfView](self, "pdfView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_pageLabelView;
    -[MUPDFPageLabelView superview](v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[MUPDFContentViewController _removePageLabelViewConstraints](self, "_removePageLabelViewConstraints");
    -[MUPDFPageLabelView showNowInSuperView:withText:](v13, "showNowInSuperView:withText:", v12, v11);
    -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (self->pageLabelViewTopConstraint || !v15)
    {
      -[MUPDFContentViewController edgeInsets](self, "edgeInsets");
      -[NSLayoutConstraint setConstant:](self->pageLabelViewTopConstraint, "setConstant:", v23 + 20.0);
    }
    else
    {
      -[MUPDFPageLabelView topAnchor](v13, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController edgeInsets](self, "edgeInsets");
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v19 + 20.0);
      v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      pageLabelViewTopConstraint = self->pageLabelViewTopConstraint;
      self->pageLabelViewTopConstraint = v20;

      -[NSLayoutConstraint setActive:](self->pageLabelViewTopConstraint, "setActive:", 1);
      -[MUPDFContentViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNeedsUpdateConstraints");

    }
    pageLabelViewSideConstraint = self->pageLabelViewSideConstraint;
    if (pageLabelViewSideConstraint)
    {
      -[NSLayoutConstraint setConstant:](pageLabelViewSideConstraint, "setConstant:", 20.0);
      if (v4)
      {
LABEL_10:
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __69__MUPDFContentViewController__updatePageNumberOverlayToPage_animate___block_invoke;
        v33[3] = &unk_24E5D4068;
        v33[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v33, 0.3);
LABEL_16:

        return;
      }
    }
    else
    {
      thumbnailViewStyle = self->_thumbnailViewStyle;
      -[MUPDFPageLabelView leadingAnchor](v13, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (thumbnailViewStyle == 1)
      {
        objc_msgSend(v16, "trailingAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 20.0);
        v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v29 = self->pageLabelViewSideConstraint;
        self->pageLabelViewSideConstraint = v28;
      }
      else
      {
        -[MUPDFContentViewController view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "leadingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29, 20.0);
        v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v31 = self->pageLabelViewSideConstraint;
        self->pageLabelViewSideConstraint = v30;

      }
      -[NSLayoutConstraint setActive:](self->pageLabelViewSideConstraint, "setActive:", 1);
      if (v4)
        goto LABEL_10;
    }
    -[MUPDFContentViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "updateConstraints");

    goto LABEL_16;
  }
}

void __69__MUPDFContentViewController__updatePageNumberOverlayToPage_animate___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateConstraints");

}

- (UIView)pageLabelView
{
  return 0;
}

- (BOOL)canEditContent
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;

  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "allowsDocumentAssembly");
    v5 = objc_msgSend(v3, "allowsDocumentChanges");
    v6 = v5 & (objc_msgSend(v3, "isLocked") ^ 1);
    if (v4)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[MUPDFContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (-[MUPDFContentViewController _pageLabelExistAtPoint:](self, "_pageLabelExistAtPoint:", v7, v9)
    || -[MUPDFContentViewController _thumbnailViewExistAtPoint:](self, "_thumbnailViewExistAtPoint:", v7, v9))
  {
    v10 = 1;
  }
  else
  {
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v10 = v11 && (objc_msgSend(v11, "shouldAcceptTouch:ofGestureRecognizer:", v4, 0) & 1) != 0;

  }
  return v10;
}

- (BOOL)_pageLabelExistAtPoint:(CGPoint)a3
{
  MUPDFPageLabelView *pageLabelView;
  double y;
  double x;
  MUPDFPageLabelView *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGPoint v23;
  CGRect v24;

  pageLabelView = self->_pageLabelView;
  if (!pageLabelView)
    return 0;
  y = a3.y;
  x = a3.x;
  v7 = pageLabelView;
  -[MUPDFContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFPageLabelView superview](v7, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[MUPDFPageLabelView frame](v7, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  v23.x = v11;
  v23.y = v13;
  return CGRectContainsPoint(v24, v23);
}

- (BOOL)_thumbnailViewExistAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  BOOL v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v9.x = x;
    v9.y = y;
    v7 = CGRectContainsPoint(v10, v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)thumbnailViewStyle
{
  return self->_thumbnailViewStyle;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;

  if (self->_thumbnailViewStyle != a3)
  {
    self->_thumbnailViewStyle = a3;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[MUPDFContentViewController removeThumbnailViewHolderConstraints](self, "removeThumbnailViewHolderConstraints");
    -[MUPDFContentViewController _updateThumbnailViewHolderBackgroundColor](self, "_updateThumbnailViewHolderBackgroundColor");
    -[MUPDFContentViewController _removePageLabelViewConstraints](self, "_removePageLabelViewConstraints");
    if (a3 == 1)
    {
      -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
      -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "secondItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
      {
        -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        v13 = v12;
        v15 = v14;
        v17 = v16;

        -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "effectiveUserInterfaceLayoutDirection");

        if (v19)
        {
          -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "superview");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bounds");
          v23 = v22;
          -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "constant");
          v26 = v23 - v25;

        }
        else
        {
          -[MUPDFContentViewController thumbnailViewHolderRevealConstraint](self, "thumbnailViewHolderRevealConstraint");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "constant");
          v26 = v27;
        }

        -[MUPDFContentViewController thumbnailViewHolder](self, "thumbnailViewHolder");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFrame:", v26, v13, v15, v17);

      }
    }
  }
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  v4 = a3;
  -[MUPDFContentViewController thumbnailView](self, "thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "locationInView:", v6);
    v19.x = v15;
    v19.y = v16;
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    v17 = CGRectContainsPoint(v20, v19);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CGRect)visibleContentRect
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
  CGRect result;

  -[MUPDFContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController visibleContentRectInCoordinateSpace:](self, "visibleContentRectInCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)visibleContentRectInCoordinateSpace:(id)a3
{
  id v4;
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
  void *v15;
  char v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v4 = a3;
  -[MUContentViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toCoordinateSpace:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isLocked");

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v6, "pageViewForPageAtIndex:", objc_msgSend(v5, "currentPageIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "bounds");
      objc_msgSend(v18, "convertRect:toCoordinateSpace:", v4);
      v8 = v19;
      v10 = v20;
      v12 = v21;
      v14 = v22;
    }

  }
  v23 = v8;
  v24 = v10;
  v25 = v12;
  v26 = v14;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)contentSnapshot
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MUContentViewController annotationController](self, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocked");

  if ((v5 & 1) != 0)
  {
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v3, "currentPageIndex");
    -[MUPDFContentViewController pdfView](self, "pdfView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewForPageAtIndex:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "isOverlayViewLoadedAtIndex:", v7))
    {
      objc_msgSend(v3, "overlayViewAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v9 = 0;
LABEL_6:
  objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "snapshotViewAfterScreenUpdates:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    objc_msgSend(v10, "addSubview:", v11);

  }
  return v10;
}

- (void)highlight:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDF6880]);
  objc_msgSend(v5, "setTag:", 764050);
  -[MUContentViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performActionForSender:", v5);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  unsigned __int8 v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {

  }
  else
  {
    v8 = (void *)v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v10 = -[MUPDFContentViewController canPerformAction:withSender:](&v15, sel_canPerformAction_withSender_, a3, v6, self, MUPDFContentViewController, v16.receiver, v16.super_class);
      goto LABEL_7;
    }
  }
  if (sel_highlight_ == a3)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDF6880]);
    objc_msgSend(v12, "setTag:", 764050);
    -[MUContentViewController annotationController](self, "annotationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "validateSender:", v12);

    goto LABEL_9;
  }
  v10 = -[MUPDFContentViewController canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6, v15.receiver, v15.super_class, self, MUPDFContentViewController);
LABEL_7:
  v11 = v10;
LABEL_9:

  return v11;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[MUPDFContentViewController setViewIsTransitioningBetweenSizes:](self, "setViewIsTransitioningBetweenSizes:", 1);
  -[MUPDFContentViewController _prepareToRotate](self, "_prepareToRotate");
  v9[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_24E5D4920;
  v10[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_24E5D4920;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);
  v8.receiver = self;
  v8.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverFromRotation");
}

uint64_t __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewIsTransitioningBetweenSizes:", 0);
}

- (void)_prepareToRotate
{
  id v2;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginPDFViewRotation");

}

- (void)_recoverFromRotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endPDFViewRotation");
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visiblePages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPDFContentViewController pdfDocument](self, "pdfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocked");

  if ((v7 & 1) == 0)
  {
    -[MUContentViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          -[MUPDFContentViewController pdfDocument](self, "pdfDocument", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "indexForPage:", v14);

          objc_msgSend(v8, "updateOverlayViewAtIndex:", v16);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit", (_QWORD)v17);

}

- (CGSize)_medianSizeForCurrentDocumentInPDFViewWithGetter:(id)a3
{
  double (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  _QWORD v19[64];
  _QWORD v20[65];
  CGSize result;

  v20[64] = *MEMORY[0x24BDAC8D0];
  v4 = (double (**)(id, void *))a3;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 792.0;
  v9 = 612.0;
  if (v5 && v6 && objc_msgSend(v6, "pageCount"))
  {
    v10 = objc_msgSend(v7, "pageCount");
    if (v10 >= 2)
      v11 = 2;
    else
      v11 = v10;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(v7, "pageAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v4[2](v4, v13);
        v16 = v15;

        *(double *)&v20[i] = v14;
        v19[i] = v16;
      }
    }
    v9 = akMedian((uint64_t)v20, v11);
    v8 = akMedian((uint64_t)v19, v11);
  }

  v17 = v9;
  v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_updateMinMaxZoomFactor
{
  void *v2;
  double v3;
  id v4;

  -[MUPDFContentViewController pdfView](self, "pdfView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimumZoomScale:", 0.1);
  objc_msgSend(v4, "autoScaleFactor");
  objc_msgSend(v2, "setMinimumZoomScale:", fmin(v3, 10.0));
  objc_msgSend(v2, "setMaximumZoomScale:", 10.0);

}

- (void)_userChangedScrollViewMagnificationNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  void *v13;

  v4 = a3;
  -[MUPDFContentViewController pdfView](self, "pdfView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "documentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v5 == v6)
  {
    objc_msgSend(v13, "scaleFactor");
    v9 = v8;
    objc_msgSend(v13, "autoScaleFactor");
    v11 = v10 + 0.005;
    v12 = objc_msgSend(v13, "autoScales");
    if (v9 < v11)
    {
      v7 = v13;
      if ((v12 & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    v7 = v13;
    if (v12)
    {
LABEL_6:
      objc_msgSend(v7, "setAutoScales:", v9 < v11);
      v7 = v13;
    }
  }
LABEL_7:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUPDFContentViewController;
  v4 = a3;
  -[MUPDFContentViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPDFContentViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[MUPDFContentViewController _updateThumbnailViewAppearance](self, "_updateThumbnailViewAppearance");
    -[MUPDFContentViewController removeThumbnailViewHolderConstraints](self, "removeThumbnailViewHolderConstraints");
    -[MUPDFContentViewController _updateThumbnailViewHolderConstraints](self, "_updateThumbnailViewHolderConstraints");
  }
}

- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v5 = a4;
  v6 = objc_msgSend(v5, "rotation");
  objc_msgSend(v5, "boundsForBox:", 1);
  v8 = v7;
  v10 = v9;

  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeRotation(&v18, (double)v6 * 3.14159265 / 180.0);
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  switch(v6)
  {
    case 270:
      v13 = 0.0;
LABEL_7:
      v12 = v10;
      goto LABEL_8;
    case 180:
      v13 = v8;
      goto LABEL_7;
    case 90:
      v12 = 0.0;
      v13 = v8;
LABEL_8:
      CGAffineTransformMakeTranslation(&v17, v13, v12);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v18;
  v15 = v17;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (void)find:(id)a3
{
  void *v3;
  id v4;

  -[MUPDFContentViewController pdfView](self, "pdfView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentFindNavigatorShowingReplace:", 0);

}

- (void)findNext:(id)a3
{
  void *v3;
  id v4;

  -[MUPDFContentViewController pdfView](self, "pdfView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findNext");

}

- (void)findPrevious:(id)a3
{
  void *v3;
  id v4;

  -[MUPDFContentViewController pdfView](self, "pdfView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findPrevious");

}

- (PDFDocument)pdfDocument
{
  return (PDFDocument *)objc_getProperty(self, a2, 984, 1);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)sourceContentReplacedAnnotationMaps
{
  return (NSArray *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setSourceContentReplacedAnnotationMaps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (BOOL)showsThumbnailView
{
  return self->_showsThumbnailView;
}

- (BOOL)fixedThumbnailView
{
  return self->_fixedThumbnailView;
}

- (BOOL)navigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (PDFView)pdfView
{
  return (PDFView *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setPdfView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (PDFThumbnailView)thumbnailView
{
  return (PDFThumbnailView *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setThumbnailView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (BOOL)shouldShowThumbnailView
{
  return self->_shouldShowThumbnailView;
}

- (void)setShouldShowThumbnailView:(BOOL)a3
{
  self->_shouldShowThumbnailView = a3;
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (UIView)thumbnailViewHolder
{
  return (UIView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setThumbnailViewHolder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (UIView)scrollerBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setScrollerBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (BOOL)constraintsAreHorizontal
{
  return self->_constraintsAreHorizontal;
}

- (void)setConstraintsAreHorizontal:(BOOL)a3
{
  self->_constraintsAreHorizontal = a3;
}

- (NSArray)thumbnailViewHolderConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setThumbnailViewHolderConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSLayoutConstraint)pdfViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setPdfViewLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (NSLayoutConstraint)thumbnailViewHolderWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setThumbnailViewHolderWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (NSLayoutConstraint)thumbnailViewHolderRevealConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setThumbnailViewHolderRevealConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSLayoutConstraint)thumbnailViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setThumbnailViewLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (BOOL)viewIsTransitioningBetweenSizes
{
  return self->_viewIsTransitioningBetweenSizes;
}

- (void)setViewIsTransitioningBetweenSizes:(BOOL)a3
{
  self->_viewIsTransitioningBetweenSizes = a3;
}

- (PDFPage)viewTransitionPageToCenter
{
  return (PDFPage *)objc_loadWeakRetained((id *)&self->_viewTransitionPageToCenter);
}

- (void)setViewTransitionPageToCenter:(id)a3
{
  objc_storeWeak((id *)&self->_viewTransitionPageToCenter, a3);
}

- (CGPoint)viewTransitionPointOnPageToCenter
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_viewTransitionPointOnPageToCenter, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setViewTransitionPointOnPageToCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_viewTransitionPointOnPageToCenter, &v3, 16, 1, 0);
}

- (double)viewTransitionPreviousScale
{
  return self->_viewTransitionPreviousScale;
}

- (void)setViewTransitionPreviousScale:(double)a3
{
  self->_viewTransitionPreviousScale = a3;
}

- (BOOL)viewTransitionPreviousAutoscalingState
{
  return self->_viewTransitionPreviousAutoscalingState;
}

- (void)setViewTransitionPreviousAutoscalingState:(BOOL)a3
{
  self->_viewTransitionPreviousAutoscalingState = a3;
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (UIEdgeInsets)cachedThumnailViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cachedThumnailViewInsets.top;
  left = self->_cachedThumnailViewInsets.left;
  bottom = self->_cachedThumnailViewInsets.bottom;
  right = self->_cachedThumnailViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCachedThumnailViewInsets:(UIEdgeInsets)a3
{
  self->_cachedThumnailViewInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewTransitionPageToCenter);
  objc_storeStrong((id *)&self->_thumbnailViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderRevealConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pdfViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderConstraints, 0);
  objc_storeStrong((id *)&self->_scrollerBackgroundView, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolder, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
  objc_storeStrong((id *)&self->_sourceContentReplacedAnnotationMaps, 0);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageLabelViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->pageLabelViewSideConstraint, 0);
  objc_storeStrong((id *)&self->pageLabelViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageLabelView, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
}

@end
