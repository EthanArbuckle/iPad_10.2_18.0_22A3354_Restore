@implementation _SSSScreenshotPDFView

- (_SSSScreenshotPDFView)initWithFrame:(CGRect)a3
{
  _SSSScreenshotPDFView *v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *activityIndicatorView;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SSSScreenshotPDFView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    -[_SSSScreenshotPDFView setupPaperKitView](v3, "setupPaperKitView");
  else
    -[_SSSScreenshotPDFView setupPDFView](v3, "setupPDFView");
  v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  activityIndicatorView = v3->_activityIndicatorView;
  v3->_activityIndicatorView = v4;

  -[UIActivityIndicatorView setUserInteractionEnabled:](v3->_activityIndicatorView, "setUserInteractionEnabled:", 0);
  -[UIActivityIndicatorView startAnimating](v3->_activityIndicatorView, "startAnimating");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIActivityIndicatorView setColor:](v3->_activityIndicatorView, "setColor:", v6);

  -[_SSSScreenshotPDFView addSubview:](v3, "addSubview:", v3->_activityIndicatorView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](v3, "overlayController"));
  objc_msgSend(v7, "setViewState:", 1, 0);

  -[_SSSScreenshotAnnotationView setScreenshotEditsSnapshotted:](v3, "setScreenshotEditsSnapshotted:", 1);
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) == 0)
  {
    v8 = objc_alloc_init((Class)UIView);
    -[_SSSScreenshotAnnotationView setVellumView:](v3, "setVellumView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](v3, "vellumView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v9, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](v3, "vellumView"));
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  }
  v3->_currentVellumPage = 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView window](self, "window"));

  if (v3)
  {
    if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    {
      -[_SSSScreenshotPaperKitPDFView setEditable:](self->_paperKitView, "setEditable:", 0);
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "akController"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toolPicker"));

      objc_msgSend(v6, "setVisible:forFirstResponder:", 1, self->_pdfView);
    }
  }
}

- (void)enterEditing
{
  objc_super v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    -[_SSSScreenshotPaperKitPDFView setEditable:](self->_paperKitView, "setEditable:", 1);
    -[_SSSScreenshotPaperKitPDFView updatePaletteVisibilityIfNecessary:](self->_paperKitView, "updatePaletteVisibilityIfNecessary:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotPDFView;
  -[_SSSScreenshotAnnotationView enterEditing](&v3, "enterEditing");
}

- (void)endedEditing
{
  objc_super v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    -[_SSSScreenshotPaperKitPDFView setEditable:](self->_paperKitView, "setEditable:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotPDFView;
  -[_SSSScreenshotAnnotationView endedEditing](&v3, "endedEditing");
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    -[_SSSScreenshotPaperKitPDFView updatePaletteVisibilityIfNecessary:](self->_paperKitView, "updatePaletteVisibilityIfNecessary:", v3);
}

- (void)setIsInCropMode:(BOOL)a3
{
  self->_isInCropMode = a3;
  -[_SSSScreenshotPaperKitPDFView setIsCropping:](self->_paperKitView, "setIsCropping:");
}

- (void)setupPaperKitView
{
  _SSSScreenshotPaperKitPDFView *v3;
  _SSSScreenshotPaperKitPDFView *v4;
  _SSSScreenshotPaperKitPDFView *paperKitView;

  v3 = [_SSSScreenshotPaperKitPDFView alloc];
  -[_SSSScreenshotPDFView bounds](self, "bounds");
  v4 = -[_SSSScreenshotPaperKitPDFView initWithFrame:](v3, "initWithFrame:");
  paperKitView = self->_paperKitView;
  self->_paperKitView = v4;

  -[_SSSScreenshotPaperKitPDFView setDelegate:](self->_paperKitView, "setDelegate:", self);
  -[_SSSScreenshotPDFView addSubview:](self, "addSubview:", self->_paperKitView);
}

- (void)setupPDFView
{
  id v3;
  PDFView *v4;
  PDFView *pdfView;
  PDFView *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PDFView EnableAnnotationKit](PDFView, "EnableAnnotationKit");
  v3 = objc_alloc((Class)PDFView);
  -[_SSSScreenshotPDFView bounds](self, "bounds");
  v4 = (PDFView *)objc_msgSend(v3, "initWithFrame:");
  pdfView = self->_pdfView;
  self->_pdfView = v4;

  -[PDFView setDisplayMode:](self->_pdfView, "setDisplayMode:", 1);
  -[PDFView setDisplaysPageBreaks:](self->_pdfView, "setDisplaysPageBreaks:", 1);
  -[PDFView setMinScaleFactor:](self->_pdfView, "setMinScaleFactor:", 1.0);
  -[PDFView setMaxScaleFactor:](self->_pdfView, "setMaxScaleFactor:", 1.0);
  -[PDFView setAutoScales:](self->_pdfView, "setAutoScales:", 0);
  v6 = self->_pdfView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PDFView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[PDFView setEnableDataDetectors:](self->_pdfView, "setEnableDataDetectors:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView documentScrollView](self->_pdfView, "documentScrollView"));
  objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView documentScrollView](self->_pdfView, "documentScrollView"));
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);

  -[_SSSScreenshotPDFView addSubview:](self, "addSubview:", self->_pdfView);
  -[PDFView setAkAnnotationEditingEnabled:](self->_pdfView, "setAkAnnotationEditingEnabled:", 1);
}

- (void)setVellumOpacity:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SSSScreenshotPDFView;
  -[_SSSScreenshotAnnotationView setVellumOpacity:](&v5, "setVellumOpacity:");
  -[_SSSScreenshotPaperKitPDFView setVellumOpacity:](self->_paperKitView, "setVellumOpacity:", a3);
}

- (void)setRulerHostView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    -[_SSSScreenshotPaperKitPDFView setRulerHostView:](self->_paperKitView, "setRulerHostView:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_SSSScreenshotPDFView;
    -[_SSSScreenshotAnnotationView setRulerHostView:](&v5, "setRulerHostView:", v4);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  BOOL v23;
  UIActivityIndicatorView *activityIndicatorView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  double v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];

  v58.receiver = self;
  v58.super_class = (Class)_SSSScreenshotPDFView;
  -[_SSSScreenshotPDFView layoutSubviews](&v58, "layoutSubviews");
  -[_SSSScreenshotPDFView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFView setFrame:](self->_pdfView, "setFrame:");
  -[PDFView layoutDocumentView](self->_pdfView, "layoutDocumentView");
  -[_SSSScreenshotPaperKitPDFView setFrame:](self->_paperKitView, "setFrame:", v4, v6, v8, v10);
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) != 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pdfData")),
        v12,
        v11,
        !v12))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
    objc_msgSend(v16, "setViewState:", 1, 0);
    goto LABEL_9;
  }
  v13 = -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage");
  v14 = -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pageViewForPageAtIndex:", v14));

  if (self->_currentVellumPage != v14)
    goto LABEL_11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  if (!v18)
  {

LABEL_11:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
    objc_msgSend(v25, "removeFromSuperview");

    if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
      objc_msgSend(v16, "bounds");
      objc_msgSend(v26, "setFrame:");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
      objc_msgSend(v16, "addSubview:", v27);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "akController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "overlayViewAtIndex:", v14));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
      objc_msgSend(v27, "bounds");
      objc_msgSend(v30, "setFrame:");

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
      objc_msgSend(v16, "insertSubview:belowSubview:", v31, v27);

    }
    self->_currentVellumPage = -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage");
    goto LABEL_15;
  }
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  v21 = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));

  v23 = v22 == v16;
  v13 = v21;
  if (!v23)
    goto LABEL_11;
LABEL_15:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  -[_SSSScreenshotAnnotationView vellumOpacity](self, "vellumOpacity");
  objc_msgSend(v32, "setAlpha:");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  objc_msgSend(v33, "setHidden:", 0);

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    v34 = -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPaperKitPDFView pdfView](self->_paperKitView, "pdfView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pageViewForPageAtIndex:", v34));
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "akController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "overlayViewAtIndex:", v14));

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  objc_msgSend(v36, "bounds");
  objc_msgSend(v38, "setFrame:");

  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "visiblePages"));

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          -[_SSSScreenshotAnnotationView vellumOpacity](self, "vellumOpacity");
          objc_msgSend(v46, "setVellumOpacity:");
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v43);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
    objc_msgSend(v47, "setViewState:", 1, v13);

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "PDFDocument"));
  v50 = objc_msgSend(v49, "pageCount");

  if ((unint64_t)v50 >= 2)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v51, "userInterfaceIdiom"))
      v52 = 24.0;
    else
      v52 = 8.0;

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
    objc_msgSend(v53, "setPageBreakMargins:", v52, v52, v52, v52);

  }
LABEL_9:

  activityIndicatorView = self->_activityIndicatorView;
  -[_SSSScreenshotPDFView bounds](self, "bounds");
  -[UIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
}

- (id)currentPDFView
{
  PDFView *v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    v3 = (PDFView *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPaperKitPDFView pdfView](self->_paperKitView, "pdfView"));
  else
    v3 = self->_pdfView;
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    -[_SSSScreenshotPaperKitPDFView intrinsicContentSize](self->_paperKitView, "intrinsicContentSize");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "document"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageAtIndex:", -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage")));
    objc_msgSend(v7, "boundsForBox:", 1);
    v9 = v8;
    v11 = v10;

    v3 = v9;
    v4 = v11;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  double height;
  double width;
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
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
  {
    -[_SSSScreenshotPaperKitPDFView updateCurrentPageCropRect:](self->_paperKitView, "updateCurrentPageCropRect:", x, y, width, height);
  }
  else
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "document"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageAtIndex:", -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage")));
    objc_msgSend(v9, "boundsForBox:", 0);
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "document"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pageAtIndex:", -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage")));
    objc_msgSend(v15, "setBounds:forBox:", 1, x * v11, (1.0 - (y + height)) * v13, width * v11, height * v13);

    objc_msgSend(v16, "layoutDocumentView");
  }
}

- (void)deselectAllAnnotations
{
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    -[_SSSScreenshotPaperKitPDFView deselectAllAnnotations](self->_paperKitView, "deselectAllAnnotations");
}

- (void)setScreenshot:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v4 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs"))
    objc_msgSend(v4, "setDocumentGenerator:", self->_paperKitView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_SSSScreenshotPDFView;
    -[_SSSScreenshotAnnotationView setScreenshot:](&v7, "setScreenshot:", v4);
    -[_SSSScreenshotPaperKitPDFView setScreenshot:](self->_paperKitView, "setScreenshot:", v4);
    -[_SSSScreenshotPDFView setNeedsLayout](self, "setNeedsLayout");
  }
  -[_SSSScreenshotPDFView setupPDFData](self, "setupPDFData");

}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManagerForEditMode:", 1));

  return v3;
}

- (void)setupPDFData
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pdfData"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPaperKitPDFView pdfData](self->_paperKitView, "pdfData"));
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if ((v8 & 1) == 0)
      -[_SSSScreenshotPaperKitPDFView setupDocumentViewController](self->_paperKitView, "setupDocumentViewController");
    v9 = objc_msgSend(v6, "length");

    if (!v9)
      goto LABEL_11;
LABEL_10:
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002DFE0;
    v14[3] = &unk_100091920;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002DFF8;
    v13[3] = &unk_1000919B0;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v13, 0.2);
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "PDFDocument"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
    v12 = objc_msgSend(v11, "isEqual:", v10);

    if ((v12 & 1) == 0)
      -[_SSSScreenshotPDFView setupOverlayControllerWithPDFDocument:](self, "setupOverlayControllerWithPDFDocument:", v10);

    goto LABEL_10;
  }
LABEL_11:
  -[UIActivityIndicatorView setAlpha:](self->_activityIndicatorView, "setAlpha:", 1.0);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
}

- (void)setupOverlayControllerWithPDFDocument:(id)a3
{
  PDFView *pdfView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  pdfView = self->_pdfView;
  v5 = a3;
  -[PDFView setDocument:](pdfView, "setDocument:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView documentView](self->_pdfView, "documentView"));
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
  objc_msgSend(v5, "setPDFAKControllerDelegate:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "akController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
  objc_msgSend(v8, "setAnnotationKitController:", v9);

}

- (void)enterCropMode
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  void *v7;
  id v8;

  -[_SSSScreenshotPDFView setIsInCropMode:](self, "setIsInCropMode:", 1);
  -[_SSSScreenshotPDFView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "documentScrollView"));

  objc_msgSend(v8, "contentOffset");
  self->_scrollOffset.x = v4;
  self->_scrollOffset.y = v5;
  objc_msgSend(v8, "zoomScale");
  self->_scrollZoomScale = v6;
  objc_msgSend(v8, "setZoomScale:", 1.0);
  objc_msgSend(v8, "setContentOffset:", CGPointZero.x, CGPointZero.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  objc_msgSend(v7, "setDisplayBox:", 0);

  -[_SSSScreenshotPDFView setNeedsLayout](self, "setNeedsLayout");
}

- (void)enterMarkupMode
{
  void *v3;
  void *v4;
  id v5;

  -[_SSSScreenshotPDFView setIsInCropMode:](self, "setIsInCropMode:", 0);
  -[_SSSScreenshotPDFView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  objc_msgSend(v3, "setDisplayBox:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentScrollView"));

  if (self->_scrollZoomScale != 0.0)
    objc_msgSend(v5, "setZoomScale:");
  objc_msgSend(v5, "setContentOffset:", self->_scrollOffset.x, self->_scrollOffset.y);
  -[_SSSScreenshotPDFView setNeedsLayout](self, "setNeedsLayout");

}

- (void)exitMarkupMode
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "documentScrollView"));

  objc_msgSend(v6, "contentOffset");
  self->_scrollOffset.x = v4;
  self->_scrollOffset.y = v5;
  -[_SSSScreenshotPDFView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (int64_t)currentPDFPage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView currentPDFView](self, "currentPDFView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentPage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "document"));
  v5 = objc_msgSend(v4, "indexForPage:", v3);

  return (int64_t)v5;
}

- (void)updateViewState
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pdfData"));

  if (v4)
  {
    v5 = -[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
    objc_msgSend(v6, "setViewState:", 1, v5);

  }
}

- (void)_paperKitPDFDidChangeInView:(id)a3 changeCounter:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot", a3, a4));
  objc_msgSend(v4, "undoStateMightHaveChanged");

}

- (void)_paperKitPDFView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView delegate](self, "delegate"));
  objc_msgSend(v6, "pdfView:startEditingOpacityInAccessoryView:", self, v5);

}

- (id)_paperKitPDFViewOverlayViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotPDFView delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pdfViewOverlayViewController:", self));

  return v5;
}

- (SSSScreenshotPDFViewDelegate)delegate
{
  return (SSSScreenshotPDFViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInCropMode
{
  return self->_isInCropMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_paperKitView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
}

@end
