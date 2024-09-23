@implementation SSSScreenshotView

- (SSSScreenshotView)initWithFrame:(CGRect)a3
{
  SSSScreenshotView *v3;
  SSSScreenshotBorderView *v4;
  SSSScreenshotBorderView *borderView;
  _SSSScreenshotImageView *v6;
  _SSSScreenshotImageView *screenshotImageView;
  _SSSScreenshotPDFView *v8;
  _SSSScreenshotPDFView *screenshotPDFView;
  void *v10;
  void *v11;
  SSSCropController *v12;
  SSSCropController *imageCropController;
  void *v14;
  void *v15;
  SSSCropController *v16;
  SSSCropController *pdfCropController;
  void *v18;
  void *v19;
  UITapGestureRecognizer *v20;
  UITapGestureRecognizer *tapGesture;
  CGSize size;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SSSScreenshotView;
  v3 = -[SSSScreenshotView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSScreenshotView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  v4 = objc_alloc_init(SSSScreenshotBorderView);
  borderView = v3->_borderView;
  v3->_borderView = v4;

  -[SSSScreenshotView addSubview:](v3, "addSubview:", v3->_borderView);
  v6 = objc_alloc_init(_SSSScreenshotImageView);
  screenshotImageView = v3->_screenshotImageView;
  v3->_screenshotImageView = v6;

  -[_SSSScreenshotImageView setDelegate:](v3->_screenshotImageView, "setDelegate:", v3);
  -[_SSSScreenshotImageView setAccessibilityIdentifier:](v3->_screenshotImageView, "setAccessibilityIdentifier:", CFSTR("Screenshots-Image-View"));
  v8 = objc_alloc_init(_SSSScreenshotPDFView);
  screenshotPDFView = v3->_screenshotPDFView;
  v3->_screenshotPDFView = v8;

  -[_SSSScreenshotPDFView setAccessibilityIdentifier:](v3->_screenshotPDFView, "setAccessibilityIdentifier:", CFSTR("Screenshots-PDF-View"));
  -[_SSSScreenshotPDFView setDelegate:](v3->_screenshotPDFView, "setDelegate:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](v3->_screenshotImageView, "overlayController"));
  objc_msgSend(v10, "setDelegate:", v3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](v3->_screenshotPDFView, "overlayController"));
  objc_msgSend(v11, "setDelegate:", v3);

  v12 = objc_alloc_init(SSSCropController);
  imageCropController = v3->_imageCropController;
  v3->_imageCropController = v12;

  -[SSSCropController setNumberOfTouchesRequiredForPanningCrop:](v3->_imageCropController, "setNumberOfTouchesRequiredForPanningCrop:", 2);
  -[SSSCropController setDelegate:](v3->_imageCropController, "setDelegate:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](v3->_imageCropController, "cropView"));
  objc_msgSend(v14, "setHidden:", v3->_editMode != 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](v3->_imageCropController, "cropView"));
  -[SSSScreenshotView addSubview:](v3, "addSubview:", v15);

  v16 = objc_alloc_init(SSSCropController);
  pdfCropController = v3->_pdfCropController;
  v3->_pdfCropController = v16;

  -[SSSCropController setNumberOfTouchesRequiredForPanningCrop:](v3->_pdfCropController, "setNumberOfTouchesRequiredForPanningCrop:", 2);
  -[SSSCropController setDelegate:](v3->_pdfCropController, "setDelegate:", v3);
  -[SSSCropController setEditMode:](v3->_pdfCropController, "setEditMode:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](v3->_pdfCropController, "cropView"));
  objc_msgSend(v18, "setHidden:", v3->_editMode == 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](v3->_pdfCropController, "cropView"));
  -[SSSScreenshotView addSubview:](v3, "addSubview:", v19);

  v20 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_handleTap");
  tapGesture = v3->_tapGesture;
  v3->_tapGesture = v20;

  -[SSSScreenshotView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGesture);
  size = CGRectNull.size;
  v3->_lastScreenshotImageViewFrameInScreen.origin = CGRectNull.origin;
  v3->_lastScreenshotImageViewFrameInScreen.size = size;
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView undoManager](self, "undoManager"));
  objc_msgSend(v3, "removeAllActions");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotImageView, "overlayController"));
  objc_msgSend(v5, "logDidEndEditingWithOverlay");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotPDFView, "overlayController"));
  objc_msgSend(v6, "logDidEndEditingWithOverlay");

  v7.receiver = self;
  v7.super_class = (Class)SSSScreenshotView;
  -[SSSScreenshotView dealloc](&v7, "dealloc");
}

- (void)setBorderStyle:(int64_t)a3
{
  if (-[SSSScreenshotView borderStyle](self, "borderStyle") != a3)
    -[SSSScreenshotBorderView setBorderStyle:](self->_borderView, "setBorderStyle:", a3);
}

- (int64_t)borderStyle
{
  return -[SSSScreenshotBorderView borderStyle](self->_borderView, "borderStyle");
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setScreenshot:(id)a3
{
  SSSScreenshot *v4;
  SSSScreenshot *screenshot;
  SSSScreenshot *v6;

  v4 = (SSSScreenshot *)a3;
  -[SSSScreenshot setRepresentation:](self->_screenshot, "setRepresentation:", 0);
  screenshot = self->_screenshot;
  self->_screenshot = v4;
  v6 = v4;

  -[SSSScreenshot setRepresentation:](self->_screenshot, "setRepresentation:", self);
  -[_SSSScreenshotImageView setScreenshot:](self->_screenshotImageView, "setScreenshot:", v6);
  -[_SSSScreenshotPDFView setScreenshot:](self->_screenshotPDFView, "setScreenshot:", v6);
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
  -[SSSScreenshotView layoutIfNeeded](self, "layoutIfNeeded");
  -[SSSCropController setViewToCrop:](self->_imageCropController, "setViewToCrop:", self->_screenshotImageView);
  -[SSSCropController setViewToCrop:](self->_pdfCropController, "setViewToCrop:", self->_screenshotPDFView);

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setInteractionMode:(unint64_t)a3
{
  -[_SSSScreenshotImageView setInteractionMode:](self->_screenshotImageView, "setInteractionMode:", a3);
}

- (unint64_t)interactionMode
{
  return -[_SSSScreenshotImageView interactionMode](self->_screenshotImageView, "interactionMode");
}

- (void)setImageAnalyzer:(id)a3
{
  -[_SSSScreenshotImageView setImageAnalyzer:](self->_screenshotImageView, "setImageAnalyzer:", a3);
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return -[_SSSScreenshotImageView imageAnalyzer](self->_screenshotImageView, "imageAnalyzer");
}

- (id)undoManager
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoManagerForEditMode:", -[SSSScreenshotView _viewState](self, "_viewState")));

  return v4;
}

- (void)screenshotDidHaveUndoStackChanged:(id)a3
{
  void *v4;
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
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  -[_SSSScreenshotImageView clearImageAnalysisTextSelection](self->_screenshotImageView, "clearImageAnalysisTextSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v4, "screenshotViewUndoStackChanged:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  objc_msgSend(v5, "updateUndoState");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView modelModificationInfo](self, "modelModificationInfo"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "cropInfo");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
  }
  v8 = sub_100049018((double *)&v23);
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  v16 = objc_msgSend(v15, "cropRect");
  v21 = SSRectEqualToRect(v16, v8, v10, v12, v14, v17, v18, v19, v20, *(double *)&v23, *((double *)&v23 + 1), *(double *)&v24, *((double *)&v24 + 1), *(double *)&v25, *((double *)&v25 + 1));

  if ((v21 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
    objc_msgSend(v22, "setCropRect:", v8, v10, v12, v14);

  }
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)screenshotShouldJumpToPDFPageIndex:(int64_t)a3
{
  -[SSSScreenshotView _goToPDFPage:rect:force:](self, "_goToPDFPage:rect:force:", a3, 1, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)screenshotDidRevert:(id)a3
{
  void *v4;

  -[SSSScreenshotView screenshotDidHaveUndoStackChanged:](self, "screenshotDidHaveUndoStackChanged:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v4, "screenshotViewUndoStackChanged:", self);

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)screenshot:(id)a3 didHaveChangeOnPage:(unint64_t)a4
{
  id v5;

  -[SSSScreenshotView _goToPDFPage:rect:force:](self, "_goToPDFPage:rect:force:", a4, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v5, "screenshotViewUndoStackChanged:", self);

}

- (void)screenshotDidMakeAnnotationEditOnImage
{
  -[_SSSScreenshotImageView setHasOutstandingEdits:](self->_screenshotImageView, "setHasOutstandingEdits:", 1);
}

- (void)_goToPDFPage:(unint64_t)a3 rect:(CGRect)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  _BYTE *v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  id v49;
  CGRect v50;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v49 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "document"));
  if (objc_msgSend(v12, "pageCount"))
  {
    v13 = (_BYTE *)fmin(fmax((double)a3, 0.0), (double)((unint64_t)objc_msgSend(v12, "pageCount") - 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "currentPage"));
    v15 = objc_msgSend(v12, "indexForPage:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pageAtIndex:", v13));
    objc_msgSend(v49, "layoutDocumentView");
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    if (CGRectIsEmpty(v50))
    {
      if (!v5 || v13 && (char *)objc_msgSend(v12, "pageCount") - 1 != v13)
      {
        if (v15 != v13)
        {
          objc_msgSend(v49, "goToPage:", v16);
          -[_SSSScreenshotPDFView updateViewState](self->_screenshotPDFView, "updateViewState");
        }
        goto LABEL_11;
      }
      objc_msgSend(v16, "boundsForBox:", 1);
      objc_msgSend(v49, "convertRect:fromPage:", v16);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "documentView"));
      objc_msgSend(v49, "convertRect:toView:", v25, v18, v20, v22, v24);
      v27 = v26;
      v29 = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "documentScrollView"));
      objc_msgSend(v30, "contentInset");
      v32 = v31;
      objc_msgSend(v49, "pageBreakMargins");
      v34 = v29 - (v32 + v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "documentScrollView"));
      objc_msgSend(v35, "contentSize");
      v37 = v36;
      objc_msgSend(v35, "bounds");
      objc_msgSend(v35, "setContentOffset:animated:", 1, v27, fmin(v34, v37 - v38));
      -[_SSSScreenshotPDFView updateViewState](self->_screenshotPDFView, "updateViewState");
    }
    else
    {
      objc_msgSend(v49, "convertRect:fromPage:", v16, x, y, width, height);
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = (void *)objc_opt_class(self, v47);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "documentScrollView"));
      objc_msgSend(v48, "_zoomToRectWithinContentInsetBounds:scrollView:animated:", v35, 0, v40, v42, v44, v46);
    }

LABEL_11:
  }

}

- (void)setUsesOriginalImageAspectRatio:(BOOL)a3
{
  self->_usesOriginalImageAspectRatio = a3;
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)screenshotDidReceivePDFData
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView window](self, "window"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstResponder"));

  -[_SSSScreenshotPDFView setupPDFData](self->_screenshotPDFView, "setupPDFData");
  if ((id)-[SSSScreenshotView editMode](self, "editMode") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
    objc_msgSend(v4, "setOverlayControllerActive:", 1);

  }
  if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0)
    objc_msgSend(v5, "becomeFirstResponder");
  -[SSSScreenshotView adjustPDFPositioningToMatchImageIfNecessary](self, "adjustPDFPositioningToMatchImageIfNecessary");

}

- (id)screenshotRepresentationAKControllerForPDF
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "akController"));

  return v4;
}

- (int64_t)screenshotPDFPageIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _internalPDFView](self, "_internalPDFView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "document"));
  v7 = objc_msgSend(v6, "indexForPage:", v4);

  return (int64_t)v7;
}

- (void)screenshotDeletePDFPage:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _internalPDFView](self, "_internalPDFView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "document"));
  objc_msgSend(v4, "removePageAtIndex:", a3);

}

- (void)screenshotInsertPDFPage:(id)a3 pageIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _internalPDFView](self, "_internalPDFView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "document"));
  objc_msgSend(v7, "insertPage:atIndex:", v6, a4);

}

- (void)_layoutUpdateCropControllers
{
  uint64_t v3;
  SSSCropController **p_imageCropController;
  SSSCropController **p_pdfCropController;
  SSSCropController *pdfCropController;
  _BOOL8 v7;
  int64_t editMode;
  void *v9;
  void *v10;
  _BOOL4 v11;
  SSSCropController **v12;
  void *v13;
  SSSCropController *v14;
  void *v15;
  void *v16;
  SSSCropController *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  if (-[SSSScreenshotView gesturesEnabled](self, "gesturesEnabled"))
    v3 = -[SSSScreenshotView cropHandlesFadedOut](self, "cropHandlesFadedOut") ^ 1;
  else
    v3 = 0;
  p_imageCropController = &self->_imageCropController;
  -[SSSCropController setCropEnabled:](self->_imageCropController, "setCropEnabled:", v3);
  p_pdfCropController = &self->_pdfCropController;
  pdfCropController = self->_pdfCropController;
  if ((_DWORD)v3)
    v7 = (id)-[SSSScreenshotView editMode](self, "editMode") == (id)2;
  else
    v7 = 0;
  -[SSSCropController setCropEnabled:](pdfCropController, "setCropEnabled:", v7);
  editMode = self->_editMode;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](*p_imageCropController, "cropView"));
  objc_msgSend(v9, "setHidden:", editMode != 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](*p_pdfCropController, "cropView"));
  objc_msgSend(v10, "setHidden:", editMode == 0);

  v11 = (id)-[SSSScreenshotView interactionMode](self, "interactionMode") != (id)2
     && (id)-[SSSScreenshotView interactionMode](self, "interactionMode") != (id)3;
  -[SSSCropController setCropEnabled:](*p_imageCropController, "setCropEnabled:", v3 & v11);
  if (editMode)
    v12 = &self->_pdfCropController;
  else
    v12 = &self->_imageCropController;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](*v12, "cropView"));
  -[SSSScreenshotView bounds](self, "bounds");
  objc_msgSend(v13, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");

  v14 = *p_imageCropController;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "snapUnitRects"));
  -[SSSCropController setSnapRects:](v14, "setSnapRects:", v16);

  v17 = *p_pdfCropController;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "snapUnitRects"));
  -[SSSCropController setSnapRects:](v17, "setSnapRects:", v19);

  if ((id)-[SSSScreenshotView state](self, "state") == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView akController](self, "akController"));
    if (objc_msgSend(v20, "onlyDrawWithApplePencil"))
      v21 = 1;
    else
      v21 = 2;

    -[SSSCropController setNumberOfTouchesRequiredForPanningCrop:](*p_imageCropController, "setNumberOfTouchesRequiredForPanningCrop:", v21);
    -[SSSCropController setNumberOfTouchesRequiredForPanningCrop:](*p_pdfCropController, "setNumberOfTouchesRequiredForPanningCrop:", v21);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _SSSScreenshotImageView *screenshotImageView;
  void *v15;
  _SSSScreenshotPDFView *screenshotPDFView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  UIView *flashView;
  double v37;
  double v38;
  CGRect *p_lastScreenshotImageViewFrameInScreen;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  _OWORD v55[3];
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  CGRect v59;
  CGRect v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));

  if (v3)
  {
    -[SSSScreenshotView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView traitCollection](self, "traitCollection"));
    sub_10000FFDC(v12, (uint64_t)&v56);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[SSSScreenshotView setInteractionTintColor:](self, "setInteractionTintColor:", v13);

    -[SSSScreenshotView _layoutUpdateCropControllers](self, "_layoutUpdateCropControllers");
    if (!self->_hasPreparedForFullscreenExperience)
    {
      -[_SSSScreenshotImageView setFrame:](self->_screenshotImageView, "setFrame:", v5, v7, v9, v11);
      -[_SSSScreenshotPDFView setFrame:](self->_screenshotPDFView, "setFrame:", v5, v7, v9, v11);
    }
    -[_SSSScreenshotImageView setUseTrilinearMinificationFilter:](self->_screenshotImageView, "setUseTrilinearMinificationFilter:", -[SSSScreenshotView useTrilinearMinificationFilter](self, "useTrilinearMinificationFilter"));
    screenshotImageView = self->_screenshotImageView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView viewModificationInfo](self, "viewModificationInfo"));
    objc_msgSend(v15, "vellumOpacity");
    -[_SSSScreenshotImageView setVellumOpacity:](screenshotImageView, "setVellumOpacity:");

    screenshotPDFView = self->_screenshotPDFView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView viewModificationInfo](self, "viewModificationInfo"));
    objc_msgSend(v17, "vellumOpacity");
    -[_SSSScreenshotPDFView setVellumOpacity:](screenshotPDFView, "setVellumOpacity:");

    v18 = 0.0;
    if (-[SSSScreenshotView state](self, "state"))
      v19 = 0.0;
    else
      v19 = *((double *)&v57 + 1);
    -[SSSScreenshotView geometryMultiplier](self, "geometryMultiplier");
    v21 = v19 * v20;
    if (self->_hasPreparedForFullscreenExperience)
      v22 = 0.0;
    else
      v22 = v19 * v20;
    if (self->_hasPreparedForFullscreenExperience)
      v23 = v21;
    else
      v23 = 0.0;
    -[_SSSScreenshotAnnotationView setCornerRadius:](self->_screenshotImageView, "setCornerRadius:", v22);
    -[SSSCropController setCornerRadius:](self->_imageCropController, "setCornerRadius:", v23);
    -[SSSCropController setCornerRadius:](self->_pdfCropController, "setCornerRadius:", v23);
    -[SSSScreenshotBorderView setFrame:](self->_borderView, "setFrame:", v5, v7, v9, v11);
    v54 = v11;
    if ((id)-[SSSScreenshotView state](self, "state") == (id)1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView modelModificationInfo](self, "modelModificationInfo"));
      v25 = v24;
      v26 = v7;
      v27 = v5;
      if (v24)
        objc_msgSend(v24, "cropInfo");
      else
        memset(v55, 0, sizeof(v55));
      v29 = sub_100049018((double *)v55);
      v30 = v32;
      v28 = v33;
      v31 = v34;

    }
    else
    {
      v26 = v7;
      v27 = v5;
      v28 = 1.0;
      v29 = 0.0;
      v30 = 0.0;
      v31 = 1.0;
    }
    -[SSSScreenshotBorderView setUnitRectForContent:](self->_borderView, "setUnitRectForContent:", v29, v30, v28, v31);
    UIRectInset(-[SSSScreenshotView _updateGestures](self, "_updateGestures"), v27, v26, v9, v54, -3.0, -3.0, -3.0, -3.0);
    -[UIView setFrame:](self->_flashView, "setFrame:");
    v35 = -[SSSScreenshotView state](self, "state");
    flashView = self->_flashView;
    if (!v35)
    {
      v37 = *(double *)&v57;
      -[SSSScreenshotView geometryMultiplier](self, "geometryMultiplier");
      v18 = v37 * v38;
    }
    -[UIView _setCornerRadius:](flashView, "_setCornerRadius:", v18);
    if (!self->_editMode)
    {
      if (!self->_hasCroppedImageView)
      {
        -[SSSCropController cropRect](self->_imageCropController, "cropRect");
        v60.origin.x = 0.0;
        v60.origin.y = 0.0;
        v60.size.width = 1.0;
        v60.size.height = 1.0;
        self->_hasCroppedImageView = !CGRectEqualToRect(v59, v60);
      }
      p_lastScreenshotImageViewFrameInScreen = &self->_lastScreenshotImageViewFrameInScreen;
      if (CGRectIsEmpty(self->_lastScreenshotImageViewFrameInScreen) || !self->_hasCroppedImageView)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView window](self, "window"));
        -[_SSSScreenshotImageView bounds](self->_screenshotImageView, "bounds");
        objc_msgSend(v40, "convertRect:fromView:", self->_screenshotImageView);
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView window](self, "window"));
        objc_msgSend(v49, "convertRect:toWindow:", 0, v42, v44, v46, v48);
        p_lastScreenshotImageViewFrameInScreen->origin.x = v50;
        p_lastScreenshotImageViewFrameInScreen->origin.y = v51;
        p_lastScreenshotImageViewFrameInScreen->size.width = v52;
        p_lastScreenshotImageViewFrameInScreen->size.height = v53;

      }
    }
  }
}

- (void)_updateGestures
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController gestureRecognizers](self->_imageCropController, "gestureRecognizers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7), "setAllowedTouchTypes:", &off_100095DF0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController gestureRecognizers](self->_pdfCropController, "gestureRecognizers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), "setAllowedTouchTypes:", &off_100095DF0);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", -[SSSScreenshotView gesturesEnabled](self, "gesturesEnabled"));
  if (-[SSSScreenshotView annotationsEnabled](self, "annotationsEnabled"))
    v13 = (id)-[SSSScreenshotView editMode](self, "editMode") == (id)1;
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotPDFView, "overlayController"));
  objc_msgSend(v14, "setGesturesEnabled:", v13);

  v15 = -[SSSScreenshotView annotationsEnabled](self, "annotationsEnabled")
     && !-[SSSScreenshotView editMode](self, "editMode")
     && -[SSSScreenshotView interactionMode](self, "interactionMode") == 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotImageView, "overlayController"));
  objc_msgSend(v16, "setGesturesEnabled:", v15);

}

- (void)updateForFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!self->_hasCroppedImageView)
  {
    -[SSSScreenshotView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[_SSSScreenshotImageView setFrame:](self->_screenshotImageView, "setFrame:");
    -[_SSSScreenshotPDFView setFrame:](self->_screenshotPDFView, "setFrame:", v5, v7, v9, v11);
  }
}

- (BOOL)_layoutPDFViewVerticalContentInsetToMatchImageView
{
  CGRect *p_lastScreenshotImageViewFrameInScreen;
  BOOL IsEmpty;
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
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MinY;
  double v34;
  double MaxY;
  CGFloat rect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  p_lastScreenshotImageViewFrameInScreen = &self->_lastScreenshotImageViewFrameInScreen;
  IsEmpty = CGRectIsEmpty(self->_lastScreenshotImageViewFrameInScreen);
  if (!IsEmpty)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentScrollView"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView window](self, "window"));
    objc_msgSend(v7, "convertRect:fromWindow:", 0, p_lastScreenshotImageViewFrameInScreen->origin.x, p_lastScreenshotImageViewFrameInScreen->origin.y, p_lastScreenshotImageViewFrameInScreen->size.width, p_lastScreenshotImageViewFrameInScreen->size.height);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView window](self, "window"));
    objc_msgSend(v16, "convertRect:toView:", v6, v9, v11, v13, v15);
    v18 = v17;
    rect = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[SSSScreenshotView bounds](self, "bounds");
    -[SSSScreenshotView convertRect:toView:](self, "convertRect:toView:", v6);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v38.origin.x = v18;
    v38.origin.y = v20;
    v38.size.width = v22;
    v38.size.height = v24;
    MinY = CGRectGetMinY(v38);
    v39.origin.x = v26;
    v39.origin.y = v28;
    v39.size.width = v30;
    v39.size.height = v32;
    v34 = MinY - CGRectGetMinY(v39);
    v40.origin.x = v26;
    v40.origin.y = v28;
    v40.size.width = v30;
    v40.size.height = v32;
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = rect;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    objc_msgSend(v6, "setContentInset:", v34, 0.0, MaxY - CGRectGetMaxY(v41), 0.0);

  }
  return !IsEmpty;
}

- (void)_layoutPDFViewToMatchImageViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGRect v32;
  CGRect v33;

  if (!self->_hasPositionedPDFViewToMatchImageView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pdfData"));

    if (v4)
    {
      if (-[SSSScreenshotView _layoutPDFViewVerticalContentInsetToMatchImageView](self, "_layoutPDFViewVerticalContentInsetToMatchImageView"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
        v6 = objc_msgSend(v5, "visiblePDFPageWhenScreenshotted");

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
        objc_msgSend(v7, "visiblePDFRectWhenScreenshotted");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        v33.origin.x = CGRectZero.origin.x;
        v33.origin.y = CGRectZero.origin.y;
        v33.size.width = CGRectZero.size.width;
        v33.size.height = CGRectZero.size.height;
        v32.origin.x = v9;
        v32.origin.y = v11;
        v32.size.width = v13;
        v32.size.height = v15;
        if (CGRectEqualToRect(v32, v33))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
          objc_msgSend(v16, "layoutDocumentView");
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "document"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pageAtIndex:", v6));

          objc_msgSend(v18, "boundsForBox:", 0);
          objc_msgSend(v16, "convertRect:fromPage:", v18);
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = (void *)objc_opt_class(self, v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "documentScrollView"));
          objc_msgSend(v28, "_zoomToRectWithinContentInsetBounds:scrollView:animated:", v29, 0, v20, v22, v24, v26);

        }
        else
        {
          -[SSSScreenshotView _goToPDFPage:rect:force:](self, "_goToPDFPage:rect:force:", v6, 0, v9, v11, v13, v15);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _internalPDFView](self, "_internalPDFView"));
        objc_msgSend(v30, "addObserver:selector:name:object:", self, "pageChanged:", PDFViewPageChangedNotification, v31);

        self->_hasPositionedPDFViewToMatchImageView = 1;
      }
    }
  }
}

- (void)setRulerHostingView:(id)a3
{
  _SSSScreenshotPDFView *screenshotPDFView;
  id v5;

  screenshotPDFView = self->_screenshotPDFView;
  v5 = a3;
  -[_SSSScreenshotPDFView setRulerHostView:](screenshotPDFView, "setRulerHostView:", v5);
  -[_SSSScreenshotImageView setRulerHostView:](self->_screenshotImageView, "setRulerHostView:", v5);

}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotView;
  -[SSSScreenshotView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)extent
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SSSScreenshotBorderView extent](self->_borderView, "extent");
  -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", self->_borderView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setGeometryMultiplier:(double)a3
{
  -[SSSScreenshotBorderView setGeometryMultiplier:](self->_borderView, "setGeometryMultiplier:", a3);
}

- (double)geometryMultiplier
{
  double result;

  -[SSSScreenshotBorderView geometryMultiplier](self->_borderView, "geometryMultiplier");
  return result;
}

+ (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v13;
  double v14;
  double MinX;
  double MinY;
  CGAffineTransform *result;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat height;
  CGFloat rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  rect = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v8 = a4.size.height;
  v9 = a4.size.width;
  v10 = a4.origin.y;
  v11 = a4.origin.x;
  v13 = CGRectGetWidth(a5);
  v24.origin.x = v11;
  v24.origin.y = v10;
  v24.size.width = v9;
  v24.size.height = v8;
  v20 = v13 / CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = rect;
  v14 = CGRectGetHeight(v25);
  v26.origin.x = v11;
  v26.origin.y = v10;
  v26.size.width = v9;
  v26.size.height = height;
  v21 = v14 / CGRectGetHeight(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = rect;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v11;
  v28.origin.y = v10;
  v28.size.width = v9;
  v28.size.height = height;
  v19 = MinX - v20 * CGRectGetMinX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = rect;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = v11;
  v30.origin.y = v10;
  v30.size.width = v9;
  v30.size.height = height;
  v18 = CGRectGetMinY(v30);
  retstr->a = v20;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v21;
  retstr->tx = v19;
  retstr->ty = MinY - v21 * v18;
  return result;
}

+ (CGRect)_scaledAndCenteredRect:(CGRect)a3 withinRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Center;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v24 = a3.origin.y;
  v11 = a3.origin.x;
  v28 = a4.size.width;
  v29 = a4.origin.x;
  v27 = a4.size.height;
  v25 = CGRectGetWidth(a4);
  v31.origin.x = v11;
  v31.origin.y = v10;
  v31.size.width = v9;
  v31.size.height = v8;
  v26 = v25 / CGRectGetWidth(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v12 = CGRectGetHeight(v32);
  v33.origin.x = v11;
  v33.origin.y = v24;
  v33.size.width = v9;
  v33.size.height = v8;
  v13 = fmin(v26, v12 / CGRectGetHeight(v33));
  CGAffineTransformMakeScale(&v30, v13, v13);
  v34.origin.x = v11;
  v34.origin.y = v24;
  v34.size.width = v9;
  v34.size.height = v8;
  v35 = CGRectApplyAffineTransform(v34, &v30);
  v14 = v35.origin.x;
  v15 = v35.origin.y;
  v16 = v35.size.width;
  v17 = v35.size.height;
  Center = UIRectGetCenter(v29, y, v28, v27);
  UIRectCenteredAboutPoint(v14, v15, v16, v17, Center, v19);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (void)_zoomToRectWithinContentInsetBounds:(CGRect)a3 scrollView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGAffineTransform v24[2];
  CGRect v25;
  CGRect v26;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "contentInset");
  objc_msgSend(a1, "_scaledAndCenteredRect:withinRect:", x, y, width, height, v13 + v20, v15 + v21, v17 - (v20 + v22), v19 - (v21 + v23));
  memset(&v24[1], 0, sizeof(CGAffineTransform));
  objc_msgSend(a1, "_transformToConvertFromRect:toRect:");
  objc_msgSend(v11, "frame");
  v24[0] = v24[1];
  v26 = CGRectApplyAffineTransform(v25, v24);
  objc_msgSend(v11, "zoomToRect:animated:", v5, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

}

- (void)setState:(unint64_t)a3
{
  if (-[SSSScreenshotView state](self, "state") != a3)
  {
    self->_state = a3;
    -[SSSScreenshotView _stopFlash](self, "_stopFlash");
    -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)cropController:(id)a3 changedToCropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[_SSSScreenshotImageView clearImageAnalysisTextSelection](self->_screenshotImageView, "clearImageAnalysisTextSelection", a3);
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView modelModificationInfo](self, "modelModificationInfo"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "cropInfo");
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
  }

  *(double *)&v22 = x * *(double *)&v21;
  *((double *)&v22 + 1) = y * *((double *)&v21 + 1);
  *(double *)&v23 = width * *(double *)&v21;
  *((double *)&v23 + 1) = height * *((double *)&v21 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "environmentDescription"));
  objc_msgSend(v12, "imageScale");
  v14 = v13;

  *(_QWORD *)&v22 = SSRoundRectToScale(*(double *)&v22, *((double *)&v22 + 1), *(double *)&v23, *((double *)&v23 + 1), v14);
  *((_QWORD *)&v22 + 1) = v15;
  *(_QWORD *)&v23 = v16;
  *((_QWORD *)&v23 + 1) = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView viewModificationInfo](self, "viewModificationInfo"));
  v20[0] = v21;
  v20[1] = v22;
  v20[2] = v23;
  objc_msgSend(v18, "setCropInfo:", v20);

  -[SSSScreenshotView promoteViewValueToModelValueForKey:](self, "promoteViewValueToModelValueForKey:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
  objc_msgSend(v19, "fullscreenExperienceHadCropEvent");

}

- (void)cropControllerDidBeginCropping:(id)a3
{
  -[_SSSScreenshotImageView clearImageAnalysisTextSelection](self->_screenshotImageView, "clearImageAnalysisTextSelection", a3);
}

- (void)cropControllerCropRectDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;

  v4 = os_log_create("com.apple.screenshotservices", "Editing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView modelModificationInfo](self, "modelModificationInfo"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "cropInfo");
      v8 = v15;
      v7 = v14;
      v10 = v17;
      v9 = v16;
    }
    else
    {
      v10 = 0;
      v9 = 0;
      v8 = 0;
      v7 = 0;
    }
    v11 = NSStringFromCGRect(*(CGRect *)&v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User did crop to %@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v13, "screenshotViewCropDidChange:", self);

  -[_SSSScreenshotImageView reanalyzeImage](self->_screenshotImageView, "reanalyzeImage");
}

- (double)cornerGrabberAlpha
{
  double result;

  -[SSSCropController cornerGrabberAlpha](self->_imageCropController, "cornerGrabberAlpha");
  return result;
}

- (double)lineAlpha
{
  double result;

  -[SSSCropController lineAlpha](self->_imageCropController, "lineAlpha");
  return result;
}

- (double)lineGrabberAlpha
{
  double result;

  -[SSSCropController lineGrabberAlpha](self->_imageCropController, "lineGrabberAlpha");
  return result;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  -[SSSCropController setCornerGrabberAlpha:](self->_imageCropController, "setCornerGrabberAlpha:", a3);
}

- (void)setLineAlpha:(double)a3
{
  -[SSSCropController setLineAlpha:](self->_imageCropController, "setLineAlpha:", a3);
}

- (void)setLineGrabberAlpha:(double)a3
{
  -[SSSCropController setLineGrabberAlpha:](self->_imageCropController, "setLineGrabberAlpha:", a3);
}

- (void)commitInflightEdits
{
  id v3;

  -[SSSScreenshotView _commitCropControllerInflightEdits](self, "_commitCropControllerInflightEdits");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView akController](self, "akController"));
  objc_msgSend(v3, "commitEditing");

}

- (void)_commitCropControllerInflightEdits
{
  int64_t editMode;

  editMode = self->_editMode;
  if (!editMode)
  {
    -[SSSCropController commitInflightEdits](self->_imageCropController, "commitInflightEdits");
    editMode = self->_editMode;
  }
  if (editMode == 2)
  {
    -[SSSCropController commitInflightEdits](self->_pdfCropController, "commitInflightEdits");
    -[SSSScreenshotView doneCrop](self, "doneCrop");
  }
}

- (void)_handleTap
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v3, "screenshotViewTapped:", self);

}

- (void)prepareForFullscreenExperience
{
  _SSSScreenshotPDFView *screenshotPDFView;
  void *v4;
  _SSSScreenshotImageView *screenshotImageView;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_hasPreparedForFullscreenExperience)
  {
    self->_hasPreparedForFullscreenExperience = 1;
    screenshotPDFView = self->_screenshotPDFView;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    -[_SSSScreenshotPDFView setScreenshot:](screenshotPDFView, "setScreenshot:", v4);

    screenshotImageView = self->_screenshotImageView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    -[_SSSScreenshotImageView setScreenshot:](screenshotImageView, "setScreenshot:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotPDFView, "overlayController"));
    -[SSSScreenshotView _prepareGesturesForOverlayController:](self, "_prepareGesturesForOverlayController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self->_screenshotImageView, "overlayController"));
    -[SSSScreenshotView _prepareGesturesForOverlayController:](self, "_prepareGesturesForOverlayController:", v8);

    -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
    -[SSSCropController prepareForFullscreenExperience:](self->_imageCropController, "prepareForFullscreenExperience:", 1);
  }
}

- (void)finishPreparingForFullscreenExperience
{
  id v3;

  if (!self->_hasFinishedPreparingForFullscreenExperience)
  {
    self->_hasFinishedPreparingForFullscreenExperience = 1;
    -[_SSSScreenshotAnnotationView setOverlayControllerActive:](self->_screenshotPDFView, "setOverlayControllerActive:", 0);
    -[_SSSScreenshotAnnotationView setOverlayControllerActive:](self->_screenshotImageView, "setOverlayControllerActive:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
    objc_msgSend(v3, "screenshotView:requestsUpdateToInteractionMode:", self, -[SSSScreenshotView interactionMode](self, "interactionMode"));

  }
}

- (void)deselectAllAnnotations
{
  void *v3;
  void *v4;
  id v5;

  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) != 0
    || _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
    objc_msgSend(v3, "deselectAllAnnotations");

  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView akController](self, "akController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelController"));
  objc_msgSend(v4, "deselectAllAnnotations");

}

- (void)imageViewDidUpdateInteraction:(id)a3 withAnalysis:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v8, "screenshotView:didUpdateInteraction:withAnalysis:", self, v7, v6);

}

- (void)imageView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate", a3));
  objc_msgSend(v6, "screenshotView:requestsUpdateToInteractionMode:", self, a4);

}

- (void)imageViewDidLoadImage:(id)a3
{
  void *v4;
  id v5;

  -[_SSSScreenshotImageView setInhibitImageAnalysis:](self->_screenshotImageView, "setInhibitImageAnalysis:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView drawingGestureRecognizer](self->_screenshotImageView, "drawingGestureRecognizer"));
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
    objc_msgSend(v4, "screenshotView:hasHighPriorityGesture:", self, v5);

  }
}

- (void)imageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v6, "screenshotView:startEditingOpacityInAccessoryView:", self, v5);

}

- (void)pdfView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v6, "screenshotView:startEditingOpacityInAccessoryView:", self, v5);

}

- (void)setCropHandlesFadedOut:(BOOL)a3
{
  self->_cropHandlesFadedOut = a3;
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)flash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  SSSPortalView *v8;
  UIView *flashView;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  dispatch_time_t v16;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  UIView *v22;
  UIView *v23;
  UIView *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD block[5];

  -[SSSScreenshotView _stopFlash](self, "_stopFlash");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescription"));

  if (objc_msgSend(v4, "presentationMode") == (id)2)
  {
    v5 = objc_msgSend(v4, "externalFlashLayerRenderID");
    v6 = objc_msgSend(v4, "externalFlashLayerContextID");
    if (v5)
    {
      v7 = v6;
      if ((_DWORD)v6)
      {
        v8 = objc_alloc_init(SSSPortalView);
        flashView = self->_flashView;
        self->_flashView = &v8->super;

        -[UIView setSourceLayerRenderId:](self->_flashView, "setSourceLayerRenderId:", v5);
        -[UIView setSourceContextId:](self->_flashView, "setSourceContextId:", v7);
        -[UIView setHidesSourceView:](self->_flashView, "setHidesSourceView:", 1);
        -[UIView setMatchesAlpha:](self->_flashView, "setMatchesAlpha:", 1);
        -[UIView setMatchesPosition:](self->_flashView, "setMatchesPosition:", 1);
        -[UIView setMatchesTransform:](self->_flashView, "setMatchesTransform:", 1);
        -[SSSScreenshotView addSubview:](self, "addSubview:", self->_flashView);
        -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
        -[SSSScreenshotView layoutIfNeeded](self, "layoutIfNeeded");
        +[SSFlashView expectedAnimationDurationForStyle:](SSFlashView, "expectedAnimationDurationForStyle:", 2);
        v11 = v10;
        v12 = v10 + -0.75;
        v13 = v12 * 1000000000.0;
        v14 = v12 <= 0.0;
        v15 = 0.0;
        if (!v14)
          v15 = v13;
        v16 = dispatch_time(0, (uint64_t)v15);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000A320;
        block[3] = &unk_100091920;
        block[4] = self;
        dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
        v17 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10000A338;
        v26[3] = &unk_100091920;
        v26[4] = self;
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v26);

      }
    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "environmentDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serviceOptions"));
    v21 = objc_msgSend(v20, "flashStyle");

    v22 = (UIView *)objc_claimAutoreleasedReturnValue(+[SSFlashView flashViewForStyle:](SSFlashView, "flashViewForStyle:", v21 != 0));
    v23 = self->_flashView;
    self->_flashView = v22;

    -[SSSScreenshotView addSubview:](self, "addSubview:", self->_flashView);
    -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotView layoutIfNeeded](self, "layoutIfNeeded");
    v24 = self->_flashView;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000A340;
    v25[3] = &unk_100091920;
    v25[4] = self;
    -[UIView flashWithCompletion:](v24, "flashWithCompletion:", v25);
  }

}

- (BOOL)shouldFlash
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environmentDescription"));

  if (objc_msgSend(v3, "presentationMode") == (id)2)
    v4 = objc_msgSend(v3, "externalFlashLayerRenderID") && objc_msgSend(v3, "externalFlashLayerContextID");
  else
    v4 = objc_msgSend(v3, "presentationMode") == 0;

  return v4;
}

- (void)_stopFlash
{
  UIView *flashView;

  -[UIView removeFromSuperview](self->_flashView, "removeFromSuperview");
  flashView = self->_flashView;
  self->_flashView = 0;

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3 inTransition:(BOOL)a4 currentScreenshot:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (!-[SSSScreenshotView screenshotEditsSnapshotted](self, "screenshotEditsSnapshotted")
    && v7
    && !-[SSSScreenshotView isBeingRemoved](self, "isBeingRemoved"))
  {
    -[SSSScreenshotView _logEditsInScreenshotForAnalytics](self, "_logEditsInScreenshotForAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    objc_msgSend(v9, "saveEditsToScreenshotIfNecessary:inTransition:", v10, v6);

  }
  v11 = -[_SSSScreenshotAnnotationView screenshotEditsSnapshotted](self->_screenshotImageView, "screenshotEditsSnapshotted");
  if ((!v6 || v5) && v11 != v7)
  {
    -[_SSSScreenshotAnnotationView setScreenshotEditsSnapshotted:](self->_screenshotImageView, "setScreenshotEditsSnapshotted:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pdfData"));

    if (v13)
      -[_SSSScreenshotAnnotationView setScreenshotEditsSnapshotted:](self->_screenshotPDFView, "setScreenshotEditsSnapshotted:", v7);
  }
}

- (void)_logEditsInScreenshotForAnalytics
{
  int64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  int64_t v17;

  v3 = -[SSSScreenshotView _numberOfDrawingStrokesInScreenshot](self, "_numberOfDrawingStrokesInScreenshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  if (objc_msgSend(v4, "hasEverBeenEditedForMode:", 0)
    && -[_SSSScreenshotAnnotationView didDrawPenStroke](self->_screenshotImageView, "didDrawPenStroke"))
  {

    if (!v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v5, "didAccidentallyDraw");

      v6 = os_log_create("com.apple.screenshotservices", "Editing");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User did make drawing mark and undid or erased all changes", (uint8_t *)&v16, 2u);
      }

      goto LABEL_13;
    }
  }
  else
  {

  }
  v7 = (os_log_t)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  if (-[NSObject hasEverBeenEditedForMode:](v7, "hasEverBeenEditedForMode:", 0))
  {
    v8 = -[_SSSScreenshotAnnotationView didDrawPenStroke](self->_screenshotImageView, "didDrawPenStroke");

    if (!v8)
      goto LABEL_13;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v9, "drewStrokes:", v3);

    v7 = os_log_create("com.apple.screenshotservices", "Editing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User drew %lu strokes", (uint8_t *)&v16, 0xCu);
    }
  }

LABEL_13:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelModificationInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotations"));
  v13 = objc_msgSend(v12, "count");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
  objc_msgSend(v14, "logTotalAnnotations:", v13);

  v15 = os_log_create("com.apple.screenshotservices", "Editing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = (int64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User added %lu annotations", (uint8_t *)&v16, 0xCu);
  }

}

- (int64_t)_numberOfDrawingStrokesInScreenshot
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "modelModificationInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "annotations"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "modelModificationInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotations"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v24 = 0;
          v25 = &v24;
          v26 = 0x2050000000;
          v11 = (void *)qword_1000AD700;
          v27 = qword_1000AD700;
          if (!qword_1000AD700)
          {
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_10000BF94;
            v23[3] = &unk_100091848;
            v23[4] = &v24;
            sub_10000BF94((uint64_t)v23);
            v11 = (void *)v25[3];
          }
          v12 = objc_retainAutorelease(v11);
          _Block_object_dispose(&v24, 8);
          v14 = objc_opt_class(v12, v13);
          if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "drawing"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "strokes"));
            v7 = objc_msgSend(v16, "count");

            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return (int64_t)v7;
}

- (BOOL)screenshotEditsSnapshotted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  v3 = objc_msgSend(v2, "screenshotEditsSnapshotted");

  return v3;
}

- (AKController)akController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _currentOverlayController](self, "_currentOverlayController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "annotationKitController"));

  return (AKController *)v3;
}

- (id)_findTextViewFirstResponderUnderView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (-[SSSScreenshotView _isAncestorOfFirstResponder](self, "_isAncestorOfFirstResponder", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView firstResponder](self, "firstResponder"));
    v6 = objc_opt_class(UITextView, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      v7 = v4;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CGRect)rectToCenterAboveKeyboard
{
  void *v3;
  double v4;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _currentOverlayController](self, "_currentOverlayController"));
  objc_msgSend(v3, "rectToCenterAboveKeyboard");
  x = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v30.origin.x = x;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  v33.origin.x = CGRectNull.origin.x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (!CGRectEqualToRect(v30, v33))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
    -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", v15, x, v7, v9, v11);
    x = v16;
    v7 = v17;
    v9 = v18;
    v11 = v19;

  }
  v31.origin.x = x;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  if (CGRectIsNull(v31)
    && ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) != 0
     || _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages")))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView _findTextViewFirstResponderUnderView:](self, "_findTextViewFirstResponderUnderView:", self));
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "bounds");
      -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", v21);
      x = v22;
      v7 = v23;
      v9 = v24;
      v11 = v25;
    }

  }
  if ((-[SSSScreenshotView _isAncestorOfFirstResponder](self, "_isAncestorOfFirstResponder") & 1) == 0)
  {
    v11 = height;
    v9 = width;
    v7 = y;
    x = CGRectNull.origin.x;
  }
  v26 = x;
  v27 = v7;
  v28 = v9;
  v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_prepareGesturesForOverlayController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureRecognizers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[SSSScreenshotView addGestureRecognizer:](self, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "panGestureRecognizer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rotationGestureRecognizer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController panGestureRecognizer](self->_imageCropController, "panGestureRecognizer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController pinchGestureRecognizer](self->_imageCropController, "pinchGestureRecognizer"));
  if (v10)
  {
    objc_msgSend(v12, "requireGestureRecognizerToFail:", v10);
    objc_msgSend(v13, "requireGestureRecognizerToFail:", v10);
  }
  if (v11)
  {
    objc_msgSend(v12, "requireGestureRecognizerToFail:", v11);
    objc_msgSend(v13, "requireGestureRecognizerToFail:", v11);
  }

}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  self->_annotationsEnabled = a3;
  -[_SSSScreenshotImageView setAnnotationsEnabled:](self->_screenshotImageView, "setAnnotationsEnabled:");
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_currentOverlayController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overlayController"));

  return v3;
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  objc_msgSend(v4, "updatePaletteVisibilityIfNecessary:", v3);

}

- (UIView)viewContainingScreenshotContents
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewWithScreenshotImage"));

  return (UIView *)v3;
}

- (UIViewController)viewControllerForOverlayPresentations
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForPresentationsFromScreenshotView:", self));

  return (UIViewController *)v4;
}

- (UIView)contentSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelModificationInfo"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cropInfo");
    v6 = v14;
    v7 = v13;
    v8 = v16;
    v9 = v15;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v7, v6, v9, v8, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));

  return (UIView *)v11;
}

- (void)uninstallInterstitialGesture:(id)a3
{
  -[SSSScreenshotView removeGestureRecognizer:](self, "removeGestureRecognizer:", a3);
}

- (void)requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v5, "screenshotView:hasHighPriorityGesture:", self, v4);

}

- (void)requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView delegate](self, "delegate"));
  objc_msgSend(v5, "screenshotView:noLongerHasHighPriorityGesture:", self, v4);

}

- (void)setGesturesEnabled:(BOOL)a3
{
  self->_gesturesEnabled = a3;
  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unsigned int v14;
  int64_t v15;
  int *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  objc_super v21;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
  v14 = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  v15 = -[SSSScreenshotView editMode](self, "editMode");
  v16 = &OBJC_IVAR___SSSScreenshotView__pdfCropController;
  if (!v15)
    v16 = &OBJC_IVAR___SSSScreenshotView__imageCropController;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v16), "cropView"));
  objc_msgSend(v17, "convertPoint:fromView:", self, x, y);
  v18 = objc_msgSend(v17, "pointInside:withEvent:", v7);
  v21.receiver = self;
  v21.super_class = (Class)SSSScreenshotView;
  v19 = v14 & -[SSSScreenshotView pointInside:withEvent:](&v21, "pointInside:withEvent:", v7, x, y) | v18;

  return v19;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  SSSScreenshotView *v14;
  id v15;
  SSSScreenshotView *v16;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((id)-[SSSScreenshotView state](self, "state") == (id)1
    && (id)-[SSSScreenshotView editMode](self, "editMode") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
    -[SSSScreenshotView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
    v14 = (SSSScreenshotView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12));

  }
  else
  {
    if (-[SSSScreenshotView state](self, "state"))
    {
      v18.receiver = self;
      v18.super_class = (Class)SSSScreenshotView;
      v15 = -[SSSScreenshotView hitTest:withEvent:](&v18, "hitTest:withEvent:", v7, x, y);
      v16 = (SSSScreenshotView *)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v16 = self;
    }
    v14 = v16;
  }

  return v14;
}

- (void)setEditMode:(int64_t)a3
{
  id *p_screenshotImageView;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_editMode != a3)
  {
    self->_editMode = a3;
    p_screenshotImageView = (id *)&self->_screenshotImageView;
    -[_SSSScreenshotImageView clearImageAnalysisTextSelection](self->_screenshotImageView, "clearImageAnalysisTextSelection");
    -[SSSCropController setEditMode:](self->_pdfCropController, "setEditMode:", a3);
    if (a3 == 2)
    {
      self->_hasEnteredFullPageCropBefore = 1;
    }
    else if (a3 == 1 && self->_hasEnteredFullPageCropBefore)
    {
      -[SSSScreenshotView _layoutPDFViewVerticalContentInsetToMatchImageView](self, "_layoutPDFViewVerticalContentInsetToMatchImageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentScrollView"));

      objc_msgSend(v7, "contentInset");
      objc_msgSend(v7, "setContentInset:", fmax(v8, 118.0));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](self->_imageCropController, "cropView"));
    objc_msgSend(v9, "setHidden:", self->_editMode != 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController cropView](self->_pdfCropController, "cropView"));
    objc_msgSend(v10, "setHidden:", self->_editMode == 0);

    if (!self->_editMode)
      p_screenshotImageView = (id *)&self->_screenshotPDFView;
    objc_msgSend(*p_screenshotImageView, "setOverlayControllerActive:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentView](self, "currentView"));
    objc_msgSend(v11, "setOverlayControllerActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
    objc_msgSend(v12, "setLastViewEditMode:", a3);

    -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)adjustPDFPositioningToMatchImageIfNecessary
{
  if ((id)-[SSSScreenshotView editMode](self, "editMode") == (id)1)
    -[SSSScreenshotView _layoutPDFViewToMatchImageViewIfNeeded](self, "_layoutPDFViewToMatchImageViewIfNeeded");
}

- (void)enterCrop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  objc_msgSend(v3, "enterCrop");

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)resetCrop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  objc_msgSend(v3, "resetCrop");

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)doneCrop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  objc_msgSend(v3, "doneCrop");

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)cancelCrop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  objc_msgSend(v3, "cancelCrop");

  -[SSSScreenshotView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isCropped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView currentCropController](self, "currentCropController"));
  v3 = objc_msgSend(v2, "isCropped");

  return v3;
}

- (id)_internalPDFView
{
  return -[_SSSScreenshotPDFView _pdfView](self->_screenshotPDFView, "_pdfView");
}

- (id)_imageAnalysisAaButtonIfExists
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_editMode)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analysisButton"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
  objc_msgSend(v5, "setAnalysisButtonPrefersDarkGlyphWhenSelected:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setTintColor:", v6);

  return v3;
}

- (id)_imageAnalysisAaBarButtonItemIfExists
{
  void *v2;
  void *v3;

  if (self->_editMode)
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "analysisBarButtonItem"));

  }
  return v2;
}

- (id)_visualSearchCornerViewIfExists
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (_SSQuickActionsEnabled() && v4 || self->_editMode)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visualSearchCornerView"));

  }
  return v5;
}

- (id)_actionInfoViewIfExists
{
  void *v3;
  void *v4;
  void *v5;

  if (_SSQuickActionsEnabled(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
    v4 = v3;
    if (self->_editMode)
    {
      v5 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customLayoutActionInfoView"));
      if (v5)
      {
        objc_msgSend(v4, "setActionInfoEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
        objc_msgSend(v4, "setPreferredQuickActionButtonHeight:", 35.0);
        objc_msgSend(v4, "setActionInfoLiveTextButtonDisabled:", 1);
        objc_msgSend(v4, "setActionInfoVisualSearchCornerViewDisabled:", 1);
      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)currentPDFPage
{
  if (self->_editMode)
    return -[_SSSScreenshotPDFView currentPDFPage](self->_screenshotPDFView, "currentPDFPage");
  else
    return 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_viewState
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = -[SSSScreenshotView editMode](self, "editMode");
  v4 = -[SSSScreenshotView currentPDFPage](self, "currentPDFPage");
  v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (void)pageChanged:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _OWORD v16[3];

  v4 = -[SSSScreenshotView editMode](self, "editMode", a3);
  v5 = -[_SSSScreenshotPDFView currentPDFPage](self->_screenshotPDFView, "currentPDFPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelModificationInfoForState:", v4, v5));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "cropInfo");
  else
    memset(v16, 0, sizeof(v16));
  v9 = sub_100049018((double *)v16);
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SSSCropController setPageCropRect:](self->_pdfCropController, "setPageCropRect:", v9, v11, v13, v15);
}

- (id)currentView
{
  int *v2;

  if (self->_editMode)
    v2 = &OBJC_IVAR___SSSScreenshotView__screenshotPDFView;
  else
    v2 = &OBJC_IVAR___SSSScreenshotView__screenshotImageView;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)currentCropController
{
  int *v2;

  if (self->_editMode)
    v2 = &OBJC_IVAR___SSSScreenshotView__pdfCropController;
  else
    v2 = &OBJC_IVAR___SSSScreenshotView__imageCropController;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)viewModificationInfo
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = -[SSSScreenshotView _viewState](self, "_viewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewModificationInfoForState:", v4, v5));

  return v6;
}

- (id)modelModificationInfo
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = -[SSSScreenshotView _viewState](self, "_viewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelModificationInfoForState:", v4, v5));

  return v6;
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v5 = -[SSSScreenshotView _viewState](self, "_viewState");
  objc_msgSend(v7, "promoteViewValueToModelValueForKey:forState:", a3, v5, v6);

}

- (void)undo
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v3 = -[SSSScreenshotView _viewState](self, "_viewState");
  objc_msgSend(v5, "undoForViewState:", v3, v4);

}

- (void)redo
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v3 = -[SSSScreenshotView _viewState](self, "_viewState");
  objc_msgSend(v5, "redoForViewState:", v3, v4);

}

- (BOOL)canUndo
{
  SSSScreenshotView *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = -[SSSScreenshotView _viewState](v2, "_viewState");
  LOBYTE(v2) = objc_msgSend(v3, "canUndoForViewState:", v4, v5);

  return (char)v2;
}

- (BOOL)canRedo
{
  SSSScreenshotView *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v4 = -[SSSScreenshotView _viewState](v2, "_viewState");
  LOBYTE(v2) = objc_msgSend(v3, "canRedoForViewState:", v4, v5);

  return (char)v2;
}

- (void)revert
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotView screenshot](self, "screenshot"));
  v3 = -[SSSScreenshotView _viewState](self, "_viewState");
  objc_msgSend(v5, "revertForViewState:", v3, v4);

}

- (VKCImageAnalysis)currentImageAnalysis
{
  void *v3;
  void *v4;

  if (-[SSSScreenshotView editMode](self, "editMode"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analysis"));

  }
  return (VKCImageAnalysis *)v3;
}

- (NSString)vsGlyph
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visualSearchResultItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoButtonGlyphName"));

  return (NSString *)v5;
}

- (NSString)vsGlyphFilled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self->_screenshotImageView, "imageInteraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visualSearchResultItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filledInfoButtonGlyphName"));

  return (NSString *)v5;
}

- (UIActivity)visionKitFeedbackActivity
{
  if (self->_editMode)
    return (UIActivity *)0;
  else
    return (UIActivity *)(id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView visionKitFeedbackActivity](self->_screenshotImageView, "visionKitFeedbackActivity"));
}

- (CGRect)cropOverlayViewRectInWindow
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SSSCropController cropOverlayViewRectInWindow](self->_imageCropController, "cropOverlayViewRectInWindow");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)usesOriginalImageAspectRatio
{
  return self->_usesOriginalImageAspectRatio;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)annotationsEnabled
{
  return self->_annotationsEnabled;
}

- (BOOL)cropHandlesFadedOut
{
  return self->_cropHandlesFadedOut;
}

- (BOOL)isBeingRemoved
{
  return self->_isBeingRemoved;
}

- (void)setIsBeingRemoved:(BOOL)a3
{
  self->_isBeingRemoved = a3;
}

- (void)setExtent:(CGRect)a3
{
  self->_extent = a3;
}

- (SSSScreenshotViewDelegate)delegate
{
  return (SSSScreenshotViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (BOOL)showBackgroundForOccludingView
{
  return self->_showBackgroundForOccludingView;
}

- (void)setShowBackgroundForOccludingView:(BOOL)a3
{
  self->_showBackgroundForOccludingView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_screenshotPDFView, 0);
  objc_storeStrong((id *)&self->_pdfCropController, 0);
  objc_storeStrong((id *)&self->_screenshotImageView, 0);
  objc_storeStrong((id *)&self->_imageCropController, 0);
}

@end
