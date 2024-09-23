@implementation PKTextAttachmentDrawingView

- (PKTextAttachmentDrawingView)initWithDrawingClass:(Class)a3
{
  return -[PKTextAttachmentDrawingView initWithAttachment:drawingClass:inserted:](self, "initWithAttachment:drawingClass:inserted:", 0, a3, 0);
}

- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  return -[PKAttachmentView initWithFrame:drawing:](&v5, sel_initWithFrame_drawing_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKTextAttachmentDrawingView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  PKTextAttachmentDrawingView *v14;
  PKTextAttachmentDrawingView *v15;
  uint64_t v16;
  __int128 v17;
  _PKInlineDrawingScrollView *v18;
  uint64_t v19;
  UIScrollView *tileMaskView;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  UIView *tileScaleView;
  PKLinedPaperLayer *v27;
  PKLinedPaperLayer *linesLayer;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  UIView *v40;
  void *v41;
  uint64_t v42;
  UIPanGestureRecognizer *resizeDragGestureRecognizer;
  PKTextAttachmentDrawingViewTouchRecognizer *v44;
  PKTextAttachmentDrawingViewTouchRecognizer *resizeHighlightGestureRecognizer;
  uint64_t v46;
  UITapGestureRecognizer *eatKeyboardGestureRecognizer;
  uint64_t v48;
  UITapGestureRecognizer *tapBelowDrawingGestureRecognizer;
  uint64_t v50;
  UITapGestureRecognizer *showMenuGestureRecognizer;
  uint64_t v52;
  UILongPressGestureRecognizer *hideMenuGestureRecognizer;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  objc_super v59;

  v8 = a3;
  -[PKTextAttachmentDrawingView drawingForTextAttachment:drawingClass:](self, "drawingForTextAttachment:drawingClass:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView setZoomScale:](self, "setZoomScale:", 1.0);
  v10 = -[PKTextAttachmentResizeView initAtTop:delegate:]([PKTextAttachmentResizeView alloc], "initAtTop:delegate:", 1, self);
  v11 = -[PKTextAttachmentResizeView initAtTop:delegate:]([PKTextAttachmentResizeView alloc], "initAtTop:delegate:", 0, self);
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v59.receiver = self;
  v59.super_class = (Class)PKTextAttachmentDrawingView;
  v14 = -[PKAttachmentView initWithFrame:drawing:](&v59, sel_initWithFrame_drawing_, v9, v12, v13, 0.0, 1024.0);
  v15 = v14;
  if (v14)
  {
    v16 = MEMORY[0x1E0C9BAA8];
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v14->_cachedDrawingTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v14->_cachedDrawingTransform.c = v17;
    *(_OWORD *)&v14->_cachedDrawingTransform.tx = *(_OWORD *)(v16 + 32);
    v14->_cachedDrawingTransformBoundsWidth = 0.0;
    objc_storeWeak((id *)&v14->_textAttachment, v8);
    v15->_inserted = a5;
    v18 = [_PKInlineDrawingScrollView alloc];
    -[PKTextAttachmentDrawingView bounds](v15, "bounds");
    v19 = -[_PKInlineDrawingScrollView initWithFrame:](v18, "initWithFrame:");
    tileMaskView = v15->_tileMaskView;
    v15->_tileMaskView = (UIScrollView *)v19;

    -[PKTextAttachmentDrawingView drawingVisibleSize](v15, "drawingVisibleSize");
    -[UIScrollView setContentSize:](v15->_tileMaskView, "setContentSize:");
    -[UIScrollView setDelegate:](v15->_tileMaskView, "setDelegate:", v15);
    -[UIScrollView setMinimumZoomScale:](v15->_tileMaskView, "setMinimumZoomScale:", 0.0);
    -[UIScrollView setMaximumZoomScale:](v15->_tileMaskView, "setMaximumZoomScale:", 10.0);
    -[UIScrollView setClipsToBounds:](v15->_tileMaskView, "setClipsToBounds:", 1);
    -[UIScrollView setScrollEnabled:](v15->_tileMaskView, "setScrollEnabled:", 0);
    -[UIScrollView setZoomEnabled:](v15->_tileMaskView, "setZoomEnabled:", 0);
    -[PKTextAttachmentDrawingView traitCollection](v15, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (!v22)
    {
      -[UIScrollView setZoomEnabled:](v15->_tileMaskView, "setZoomEnabled:", 1);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v15, sel_handleDoubleTap_);
      objc_msgSend(v23, "setName:", CFSTR("com.apple.PencilKit.zoomDrawingOnPhone"));
      objc_msgSend(v23, "setNumberOfTapsRequired:", 2);
      -[UIScrollView addGestureRecognizer:](v15->_tileMaskView, "addGestureRecognizer:", v23);

    }
    -[PKTextAttachmentDrawingView addSubview:](v15, "addSubview:", v15->_tileMaskView);
    v24 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PKTextAttachmentDrawingView bounds](v15, "bounds");
    v25 = objc_msgSend(v24, "initWithFrame:");
    tileScaleView = v15->_tileScaleView;
    v15->_tileScaleView = (UIView *)v25;

    -[UIScrollView addSubview:](v15->_tileMaskView, "addSubview:", v15->_tileScaleView);
    v27 = -[PKLinedPaperLayer initWithLinedPaperLayerDelegate:]([PKLinedPaperLayer alloc], "initWithLinedPaperLayerDelegate:", v15);
    linesLayer = v15->_linesLayer;
    v15->_linesLayer = v27;

    -[UIView layer](v15->_tileScaleView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v15->_linesLayer);

    -[PKTextAttachmentDrawingView bounds](v15, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[PKAttachmentView tileContainerView](v15, "tileContainerView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

    -[PKAttachmentView tileContainerView](v15, "tileContainerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setUserInteractionEnabled:", 1);

    v40 = v15->_tileScaleView;
    -[PKAttachmentView tileContainerView](v15, "tileContainerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v40, "addSubview:", v41);

    objc_storeStrong((id *)&v15->_topResizeView, v10);
    objc_storeStrong((id *)&v15->_bottomResizeView, v11);
    -[PKTextAttachmentDrawingView addSubview:](v15, "addSubview:", v15->_topResizeView);
    -[PKTextAttachmentDrawingView addSubview:](v15, "addSubview:", v15->_bottomResizeView);
    -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility](v15, "_adjustResizeIndicatorVisibility");
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v15, sel_resizeDrawing_);
    resizeDragGestureRecognizer = v15->_resizeDragGestureRecognizer;
    v15->_resizeDragGestureRecognizer = (UIPanGestureRecognizer *)v42;

    -[UIPanGestureRecognizer setDelegate:](v15->_resizeDragGestureRecognizer, "setDelegate:", v15);
    -[UIPanGestureRecognizer setName:](v15->_resizeDragGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.resizeDragGestureRecognizer"));
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_resizeDragGestureRecognizer);
    v44 = -[PKTextAttachmentDrawingViewTouchRecognizer initWithTarget:action:]([PKTextAttachmentDrawingViewTouchRecognizer alloc], "initWithTarget:action:", v15, sel_higlightResize_);
    resizeHighlightGestureRecognizer = v15->_resizeHighlightGestureRecognizer;
    v15->_resizeHighlightGestureRecognizer = v44;

    -[PKTextAttachmentDrawingViewTouchRecognizer setDelegate:](v15->_resizeHighlightGestureRecognizer, "setDelegate:", v15);
    -[PKTextAttachmentDrawingViewTouchRecognizer setName:](v15->_resizeHighlightGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.resizeHighlightGestureRecognizer"));
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_resizeHighlightGestureRecognizer);
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v15, sel__noOpForGesture_);
    eatKeyboardGestureRecognizer = v15->_eatKeyboardGestureRecognizer;
    v15->_eatKeyboardGestureRecognizer = (UITapGestureRecognizer *)v46;

    -[UITapGestureRecognizer setName:](v15->_eatKeyboardGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.eatKeyboardGR"));
    -[UITapGestureRecognizer setDelegate:](v15->_eatKeyboardGestureRecognizer, "setDelegate:", v15);
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_eatKeyboardGestureRecognizer);
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v15, sel_tapBelowDrawingGesture_);
    tapBelowDrawingGestureRecognizer = v15->_tapBelowDrawingGestureRecognizer;
    v15->_tapBelowDrawingGestureRecognizer = (UITapGestureRecognizer *)v48;

    -[UITapGestureRecognizer setDelegate:](v15->_tapBelowDrawingGestureRecognizer, "setDelegate:", v15);
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_tapBelowDrawingGestureRecognizer);
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v15, sel_showDrawingMenu_);
    showMenuGestureRecognizer = v15->_showMenuGestureRecognizer;
    v15->_showMenuGestureRecognizer = (UITapGestureRecognizer *)v50;

    -[UITapGestureRecognizer setName:](v15->_showMenuGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.showMenuGR"));
    -[UITapGestureRecognizer setDelegate:](v15->_showMenuGestureRecognizer, "setDelegate:", v15);
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_showMenuGestureRecognizer);
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v15, sel_hideDrawingMenu_);
    hideMenuGestureRecognizer = v15->_hideMenuGestureRecognizer;
    v15->_hideMenuGestureRecognizer = (UILongPressGestureRecognizer *)v52;

    -[UILongPressGestureRecognizer setName:](v15->_hideMenuGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.hideMenuGR"));
    -[UILongPressGestureRecognizer setDelegate:](v15->_hideMenuGestureRecognizer, "setDelegate:", v15);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v15->_hideMenuGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[PKTextAttachmentDrawingView addGestureRecognizer:](v15, "addGestureRecognizer:", v15->_hideMenuGestureRecognizer);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *MEMORY[0x1E0DC5040];
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:selector:name:object:", v15, sel_menuDidHide_, v55, v56);

    -[PKTextAttachmentDrawingView layoutSubviews](v15, "layoutSubviews");
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v15);
    -[PKTextAttachmentDrawingView addInteraction:](v15, "addInteraction:", v57);

  }
  return v15;
}

- (PKTextAttachmentDrawingView)initWithCoder:(id)a3
{
  return -[PKTextAttachmentDrawingView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKTextAttachmentDrawingView *v7;
  PKTextAttachmentDrawingView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[PKTextAttachmentDrawingView init](self, "init");
  v8 = v7;
  if (v7)
    -[PKAttachmentView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView dealloc](&v4, sel_dealloc);
}

- (id)tiledViewAttachmentViews
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)beginLiveResize
{
  -[PKTextAttachmentDrawingView setIsLiveResizing:](self, "setIsLiveResizing:", 1);
  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  -[PKTextAttachmentDrawingView setLiveResizeAttachmentBounds:](self, "setLiveResizeAttachmentBounds:");
}

- (void)endLiveResize
{
  -[PKTextAttachmentDrawingView setIsLiveResizing:](self, "setIsLiveResizing:", 0);
}

- (CGRect)drawingTextAttachmentBoundsForContainerView:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  if (-[PKTextAttachmentDrawingView isLiveResizing](self, "isLiveResizing"))
  {
    -[PKTextAttachmentDrawingView liveResizeAttachmentBounds](self, "liveResizeAttachmentBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[PKTextAttachmentDrawingView desiredTextAttachmentSizeForContainerView:](self, "desiredTextAttachmentSizeForContainerView:", v4);
    v10 = v13;
    v15 = v14;
    objc_msgSend(v4, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "screen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;

    v20 = 1.0;
    if (v19 > 0.0)
      v20 = v19;
    v12 = round(v15 * v20) / v20;
  }

  v21 = v6;
  v22 = v8;
  v23 = v10;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)drawingTextAttachmentBounds
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView drawingTextAttachmentBoundsForContainerView:](self, "drawingTextAttachmentBoundsForContainerView:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)drawingForTextAttachment:(id)a3 drawingClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "fileWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regularFileContents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v7 && objc_msgSend(v7, "length")
     || (objc_msgSend(v5, "contents"),
         v8 = objc_claimAutoreleasedReturnValue(),
         v7,
         (v7 = (void *)v8) != 0))
    && objc_msgSend(v7, "length"))
  {
    v13 = 0;
    v9 = (id)objc_msgSend([a4 alloc], "initWithData:error:", v7, &v13);
    v10 = v13;
    if (v10)
    {
      v11 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "Error loading drawing: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v9 = +[PKTiledView newInlineDrawingOfClass:](PKTiledView, "newInlineDrawingOfClass:", a4);
  }

  return v9;
}

- (CGRect)drawingCanvasBounds
{
  void *v2;
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

  -[PKAttachmentView drawing](self, "drawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_canvasBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

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

- (void)setDrawingCanvasBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKAttachmentView drawing](self, "drawing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set_canvasBounds:", x, y, width, height);

}

- (void)_updateResizeTouchInsetsFingerDrawingEnabled:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v9 = -[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder");
  v10 = -10.0;
  v11 = 0.0;
  if (a3)
    v12 = v7;
  else
    v12 = 0.0;
  if (a3)
    v13 = v8;
  else
    v13 = -10.0;
  if (a3)
  {
    v11 = v5;
    v10 = v6;
  }
  if (v9)
  {
    v7 = v12;
    v8 = v13;
    v5 = v11;
    v6 = v10;
  }
  -[PKTextAttachmentDrawingView _setTouchInsets:](self, "_setTouchInsets:", v6, v5, v8, v7);
  -[PKTextAttachmentDrawingView topResizeView](self, "topResizeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setTouchInsets:", v6, v5, v8, v7);

  -[PKTextAttachmentDrawingView bottomResizeView](self, "bottomResizeView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setTouchInsets:", v6, v5, v8, v7);

}

- (id)tileMaskView
{
  return self->_tileMaskView;
}

- (void)cleanupViewProviders
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PKTextAttachmentDrawingView_cleanupViewProviders__block_invoke;
    block[3] = &unk_1E7778020;
    v5 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__PKTextAttachmentDrawingView_cleanupViewProviders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupStaleCachedViewProviders");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKTextAttachmentDrawingView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKAttachmentView setWantsDataDetection:](self, "setWantsDataDetection:", 1);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKTextAttachmentDrawingView willMoveToSuperview:](&v8, sel_willMoveToSuperview_, v4);
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentView:willMoveToSuperview:", self, v4);

  }
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[7];
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView didMoveToSuperview](&v51, sel_didMoveToSuperview);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC55A0];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC55A0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1230];
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC1230], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC5998];
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5998], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC5308];
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5308], 0);

  -[PKTextAttachmentDrawingView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKTextAttachmentDrawingView cleanupViewProviders](self, "cleanupViewProviders");
    -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_didAddDrawingAttachmentView");
    -[PKTextAttachmentDrawingView updateFrameForTextContainer](self, "updateFrameForTextContainer");
    -[PKTextAttachmentDrawingView _triggerRedraw](self, "_triggerRedraw");
    -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility](self, "_adjustResizeIndicatorVisibility");
    if (-[PKTextAttachmentDrawingView inserted](self, "inserted"))
    {
      v49 = v10;
      -[PKTextAttachmentDrawingView window](self, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstResponder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKTextAttachmentDrawingView window](self, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isVisible");

      -[PKTextAttachmentDrawingView becomeFirstResponder](self, "becomeFirstResponder");
      -[PKTextAttachmentDrawingView setInserted:](self, "setInserted:", 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v19 = v18;
      v20 = -[PKTextAttachmentDrawingView _characterIndex](self, "_characterIndex") - 1;
      v21 = 13.0;
      if (v20 <= 0x7FFFFFFFFFFFFFFDLL)
      {
        -[PKTextAttachmentDrawingView _textView](self, "_textView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_pk_lineFragmentRectForGlyphAtCharacterIndex:", v20);
        v24 = v23;

        v21 = fmax(v24, 13.0);
      }
      if (-[PKTextAttachmentDrawingView isAtEndOfDocument](self, "isAtEndOfDocument"))
      {
        -[PKTextAttachmentDrawingView _updateAttachmentBoundsEnsureLayout:](self, "_updateAttachmentBoundsEnsureLayout:", 0);
      }
      else
      {
        -[PKTextAttachmentDrawingView bounds](self, "bounds");
        -[PKTextAttachmentDrawingView setBounds:](self, "setBounds:");
        -[PKTextAttachmentDrawingView _updateAttachmentBoundsEnsureLayout:](self, "_updateAttachmentBoundsEnsureLayout:", 0);
        -[PKTextAttachmentDrawingView bounds](self, "bounds");
        if (v27 < 240.0)
        {
          -[PKAttachmentView drawing](self, "drawing");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "strokes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v29, "count");

          if (!v48)
          {
            -[PKTextAttachmentDrawingView beginLiveResize](self, "beginLiveResize");
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __49__PKTextAttachmentDrawingView_didMoveToSuperview__block_invoke;
            v50[3] = &unk_1E777C3B0;
            v50[4] = self;
            *(double *)&v50[5] = v21;
            v50[6] = v19;
            v30 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v50, 0.0166666667);
          }
        }
      }
      if (v17)
        objc_msgSend(v14, "becomeFirstResponder");

      v10 = v49;
    }
    -[PKTextAttachmentDrawingView traitCollection](self, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v31, "userInterfaceIdiom"))
    {
      -[PKTextAttachmentDrawingView window](self, "window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v32);

      if (v33)
        goto LABEL_19;
      -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "selectionController");
      v34 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setEnabled:", 0);

    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", self, sel__adjustResizeIndicatorVisibilityNotification, v4, v37);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "textStorage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", self, sel__adjustResizeIndicatorVisibilityNotification, v6, v40);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", self, sel__updateAfterBackgroundSnapshotting_, v8, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = objc_claimAutoreleasedReturnValue();
    -[PKTextAttachmentDrawingView window](self, "window");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "windowScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v42, "addObserver:selector:name:object:", self, sel__sceneDidActivate_, v10, v44);

    -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v42) = objc_opt_respondsToSelector();

    if ((v42 & 1) != 0)
    {
      -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextAttachmentDrawingView superview](self, "superview");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "attachmentView:didMoveToSuperview:", self, v47);

    }
    goto LABEL_21;
  }
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
    return;
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachmentView:didMoveToSuperview:", self, 0);
LABEL_21:

}

void __49__PKTextAttachmentDrawingView_didMoveToSuperview__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (v8 < 240.0)
  {
    v10 = v3;
    objc_msgSend(*(id *)(a1 + 32), "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "strokes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      UIRoundToViewScale();
      v9 = fmin(v14, 240.0);
      objc_msgSend(*(id *)(a1 + 32), "setBounds:", v5, v10, v7, v9);
      objc_msgSend(*(id *)(a1 + 32), "setLiveResizeAttachmentBounds:", v5, v10, v7, v9);
      objc_msgSend(*(id *)(a1 + 32), "_updateAttachmentBoundsEnsureLayout:", 0);
    }
  }
  if (v9 >= 240.0)
  {
    objc_msgSend(v22, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "endLiveResize");
    if ((objc_msgSend(*(id *)(a1 + 32), "isFirstResponder") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
    objc_msgSend(*(id *)(a1 + 32), "drawingBounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 32), "canvasHeightFromDrawingViewHeight:drawingViewWidth:", v9, v7);
    objc_msgSend(*(id *)(a1 + 32), "setDrawingCanvasBounds:", v16, v18, v20, v21);
  }

}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  int v5;

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pkAttachmentBoundsMightBeInvalid");

  if (v5)
    -[PKTextAttachmentDrawingView updateFrameForTextContainer](self, "updateFrameForTextContainer");
}

- (void)_updateAfterBackgroundSnapshotting:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "pkAttachmentBoundsMightBeInvalid") & 1) != 0)
  {
    -[PKTextAttachmentDrawingView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "activationState");

    if (!v6)
      -[PKTextAttachmentDrawingView updateFrameForTextContainer](self, "updateFrameForTextContainer");
  }
  else
  {

  }
}

- (id)tiledView
{
  void *v2;
  void *v3;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pkTiledViewIfEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView setContentHidden:](&v5, sel_setContentHidden_);
  -[PKLinedPaperLayer setHidden:](self->_linesLayer, "setHidden:", v3);
}

- (void)_triggerRedraw
{
  id v2;

  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layoutSubviews");
  objc_msgSend(v2, "updateTilesForVisibleRect");

}

- (id)_textView
{
  void *v2;
  uint64_t v3;

  -[PKTextAttachmentDrawingView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (int64_t)_characterIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  v6 = *MEMORY[0x1E0DC10F8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKTextAttachmentDrawingView__characterIndex__block_invoke;
  v9[3] = &unk_1E777C3D8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v9);
  v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __46__PKTextAttachmentDrawingView__characterIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id *v8;
  id v9;
  id WeakRetained;

  v8 = (id *)(*(_QWORD *)(a1 + 32) + 800);
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v8);

  if (WeakRetained == v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a5 = 1;
  }
}

- (void)_updateAttachmentBoundsEnsureLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int64_t v7;
  id WeakRetained;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v3 = a3;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PKTextAttachmentDrawingView _characterIndex](self, "_characterIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  objc_msgSend(WeakRetained, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  v33.origin.x = v17;
  v33.origin.y = v18;
  v33.size.width = v19;
  v33.size.height = v20;
  v32.origin.x = v10;
  v32.origin.y = v12;
  v32.size.width = v14;
  v32.size.height = v16;
  v21 = CGRectEqualToRect(v32, v33);

  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = objc_loadWeakRetained((id *)&self->_textAttachment);
  objc_msgSend(v30, "setBounds:", v23, v25, v27, v29);

  if (v3 || !v6 || !v21)
    objc_msgSend(v31, "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", v7, 1, 1, v3);
  -[PKTextAttachmentDrawingView _triggerRedraw](self, "_triggerRedraw");

}

- (CGSize)drawingVisibleSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView desiredAttachmentViewWidthForContainerView:](self, "desiredAttachmentViewWidthForContainerView:", v3);
  v5 = v4;

  -[PKTextAttachmentDrawingView drawingScaleForViewWidth:](self, "drawingScaleForViewWidth:", v5);
  v7 = v6;
  -[PKTextAttachmentDrawingView drawingCanvasBounds](self, "drawingCanvasBounds");
  v9 = fmax(v7 * v8, 58.0);
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGRect)drawingBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PKTextAttachmentDrawingView drawingCanvasBounds](self, "drawingCanvasBounds");
  v6 = v5;
  if (fabs(v7) == INFINITY || fabs(v3) == INFINITY || (v8 = v4, v9 = fabs(v4), v9 >= INFINITY) && v9 <= INFINITY)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v6 = v11;
    v8 = v12;

  }
  v13 = 0.0;
  if (fabs(v6) == INFINITY)
    v14 = 0.0;
  else
    v14 = v6;
  v15 = 768.0;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)didBeginDrawing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView didBeginDrawing](&v3, sel_didBeginDrawing);
  -[PKTextAttachmentDrawingView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  void *v4;
  char v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView drawingDidChangeVisibleStrokes:](&v15, sel_drawingDidChangeVisibleStrokes_, a3);
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  -[PKAttachmentView drawing](self, "drawing");
  v6 = (os_log_t)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, "drawingDataDidChange:view:", v6, self);
  }
  else
  {
    v7 = objc_opt_class();
    v8 = objc_opt_class();

    if (v7 == v8)
    {
      -[PKAttachmentView drawing](self, "drawing");
      v6 = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject serialize](v6, "serialize");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContents:", v9);

    }
    else
    {
      v6 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[PKAttachmentView drawing](self, "drawing");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_error_impl(&dword_1BE213000, v6, OS_LOG_TYPE_ERROR, "Unexpected drawing class in attachment view: %@", buf, 0xCu);

      }
    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKTextAttachmentDrawingView_drawingDidChangeVisibleStrokes___block_invoke;
  block[3] = &unk_1E7778020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKTextAttachmentDrawingView_drawingDidChangeVisibleStrokes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pkTiledViewIfEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController updateCurrentSelectionWithNewDrawingIfNecessary:]((uint64_t)v3, v4);

}

- (void)toolPickerDidShow
{
  void *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView toolPickerDidShow](&v8, sel_toolPickerDidShow);
  -[PKTextAttachmentDrawingView resetZoom](self, "resetZoom");
  -[PKTextAttachmentDrawingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
  {
    -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionController");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

  }
}

- (void)toolPickerDidHide
{
  void *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView toolPickerDidHide](&v8, sel_toolPickerDidHide);
  -[PKTextAttachmentDrawingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
  {
    -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionController");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

  }
}

- (void)fingerDrawingEnabledDidChange
{
  void *v3;
  uint64_t v4;

  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsFingerDrawing");

  -[PKTextAttachmentResizeView setEnabled:](self->_topResizeView, "setEnabled:", v4 ^ 1);
  -[PKTextAttachmentResizeView setEnabled:](self->_bottomResizeView, "setEnabled:", v4 ^ 1);
  -[PKTextAttachmentDrawingView _updateResizeTouchInsetsFingerDrawingEnabled:](self, "_updateResizeTouchInsetsFingerDrawingEnabled:", v4);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PKTextAttachmentDrawingView isHidden](self, "isHidden");
  v6.receiver = self;
  v6.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKTextAttachmentDrawingView setHidden:](&v6, sel_setHidden_, v3);
  if (v5)
  {
    if (!v3)
      -[PKTextAttachmentDrawingView _triggerRedraw](self, "_triggerRedraw");
  }
}

- (CGSize)desiredTextAttachmentSizeForContainerView:(id)a3
{
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
  double v15;
  double v16;
  CGSize result;

  -[PKTextAttachmentDrawingView desiredAttachmentViewWidthForContainerView:](self, "desiredAttachmentViewWidthForContainerView:", a3);
  v5 = v4;
  -[PKTextAttachmentDrawingView drawingScaleForViewWidth:](self, "drawingScaleForViewWidth:");
  v7 = v6;
  -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
  v9 = v8;
  -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
  v11 = v10;
  -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
  v13 = v11 + v12;
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  v15 = v13 + fmax(v7 * v9 * v14, 58.0);
  v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)updateFrameForTextContainer
{
  double v3;
  CGFloat v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;

  -[PKTextAttachmentDrawingView frame](self, "frame");
  v4 = v3;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v5;
  if (v5)
  {
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v9 = v10;
  }

  -[PKTextAttachmentDrawingView desiredTextAttachmentSizeForContainerView:](self, "desiredTextAttachmentSizeForContainerView:", v50);
  v12 = v11;
  v14 = v13;
  -[PKAttachmentView setFrame:](self, "setFrame:", DKDRoundedRectForScale(0.0, v4, v11, v13, v9));
  -[PKTextAttachmentDrawingView window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_isPerformingSystemSnapshot");

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "pkAttachmentBoundsMightBeInvalid") | v17;

  -[PKTextAttachmentDrawingView _updateAttachmentBoundsEnsureLayout:](self, "_updateAttachmentBoundsEnsureLayout:", v19);
  -[UIScrollView contentSize](self->_tileMaskView, "contentSize");
  v21 = v20;
  -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
  v23 = v22;
  v25 = v24;
  -[UIScrollView frame](self->_tileMaskView, "frame");
  v27 = v26;
  -[UIScrollView setFrame:](self->_tileMaskView, "setFrame:", 0.0, 0.0, v12, v14);
  -[PKTextAttachmentDrawingView drawingVisibleSize](self, "drawingVisibleSize");
  v29 = v28;
  v31 = v30;
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  v33 = v29 * v32;
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  -[UIScrollView setContentSize:](self->_tileMaskView, "setContentSize:", v33, v31 * v34);
  -[UIScrollView setContentOffset:](self->_tileMaskView, "setContentOffset:", v23, v25);
  -[UIView frame](self->_tileScaleView, "frame");
  v36 = v35;
  v38 = v37;
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  v40 = v12 * v39;
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  -[UIView setFrame:](self->_tileScaleView, "setFrame:", v36, v38, v40, v14 * v41);
  -[UIScrollView frame](self->_tileMaskView, "frame");
  if (v42 != v27 && v23 != 0.0 && v21 > 0.0)
  {
    -[UIScrollView contentSize](self->_tileMaskView, "contentSize");
    -[UIScrollView setContentOffset:](self->_tileMaskView, "setContentOffset:", v23 / v21 * v43, 0.0);
  }
  if (v17)
  {
    -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    v46 = 1;
LABEL_12:
    objc_msgSend(v44, "setPkAttachmentBoundsMightBeInvalid:", v46);

    goto LABEL_13;
  }
  -[PKTextAttachmentDrawingView window](self, "window");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "windowScene");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "activationState");

  if (!v49)
  {
    -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    v46 = 0;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_updateViewHeightIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[PKTextAttachmentDrawingView drawingCanvasBounds](self, "drawingCanvasBounds");
  if (fabs(v3) == INFINITY)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextAttachmentDrawingView heightFromDrawing:delta:](self, "heightFromDrawing:delta:", v9, 0.0);
    v8 = v10;

  }
  else
  {
    v4 = v3;
    -[PKTextAttachmentDrawingView drawingTransform](self, "drawingTransform");
    -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
    v6 = v5;
    -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
    v8 = -(v6 + v7 - v4 * sqrt(v12 * v12 + v11 * v11));
  }
  if (fabs(v8) != INFINITY)
    -[PKTextAttachmentDrawingView updateDrawingHeight:notifyDrawingDidChange:](self, "updateDrawingHeight:notifyDrawingDidChange:", 0, v8);
}

- (void)_adjustResizeIndicatorVisibilityNotification
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility](self, "_adjustResizeIndicatorVisibility");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKTextAttachmentDrawingView__adjustResizeIndicatorVisibilityNotification__block_invoke;
    block[3] = &unk_1E7778020;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __75__PKTextAttachmentDrawingView__adjustResizeIndicatorVisibilityNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustResizeIndicatorVisibility");
}

- (void)_adjustResizeIndicatorVisibility
{
  -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility:highlightBackground:](self, "_adjustResizeIndicatorVisibility:highlightBackground:", 0, 0);
}

- (void)_adjustResizeIndicatorVisibility:(BOOL)a3 highlightBackground:(BOOL)a4
{
  -[PKTextAttachmentDrawingView _setAdjustResizeIndicatorVisible:animated:highlightBackground:](self, "_setAdjustResizeIndicatorVisible:animated:highlightBackground:", -[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder"), a3, a4);
}

- (void)_setAdjustResizeIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5
{
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;
  double v10;
  PKTextAttachmentResizeView *topResizeView;
  void *v12;
  PKTextAttachmentResizeView *bottomResizeView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  if (a3)
  {
    -[PKTextAttachmentDrawingView frame](self, "frame");
    v8 = 0;
    v9 = 0;
    if (v10 > 1.0 && !a5)
    {
      v8 = -[PKTextAttachmentDrawingView isAtBeginningOfDocument](self, "isAtBeginningOfDocument") ^ 1;
      v9 = -[PKTextAttachmentDrawingView isAtEndOfDocument](self, "isAtEndOfDocument") ^ 1;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  topResizeView = self->_topResizeView;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentResizeView show:enabled:animated:](topResizeView, "show:enabled:animated:", v8, objc_msgSend(v12, "allowsFingerDrawing") ^ 1, v6);

  bottomResizeView = self->_bottomResizeView;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentResizeView show:enabled:animated:](bottomResizeView, "show:enabled:animated:", v9, objc_msgSend(v14, "allowsFingerDrawing") ^ 1, v6);

  if (a5)
  {
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectionHighlightColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextAttachmentDrawingView setBackgroundColor:](self, "setBackgroundColor:", v16);

  }
  else
  {
    -[PKTextAttachmentDrawingView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView _updateResizeTouchInsetsFingerDrawingEnabled:](self, "_updateResizeTouchInsetsFingerDrawingEnabled:", objc_msgSend(v17, "allowsFingerDrawing"));

  -[PKAttachmentView drawing](self, "drawing");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[PKTextAttachmentDrawingView layoutTileViews](self, "layoutTileViews");
}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  CGFloat v6;
  CGFloat v7;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a3, "bounds");
  v6 = CGRectGetMaxY(v11) + a4;
  -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
  v7 = v6 - CGRectGetMinY(v12);
  -[PKTextAttachmentDrawingView drawingTransform](self, "drawingTransform");
  return v7 * sqrt(v10 * v10 + v9 * v9);
}

- (double)canvasHeightFromDrawingViewHeight:(double)a3
{
  double v5;
  double result;

  -[PKTextAttachmentDrawingView frame](self, "frame");
  -[PKTextAttachmentDrawingView canvasHeightFromDrawingViewHeight:drawingViewWidth:](self, "canvasHeightFromDrawingViewHeight:drawingViewWidth:", a3, v5);
  return result;
}

- (double)canvasHeightFromDrawingViewHeight:(double)a3 drawingViewWidth:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[PKTextAttachmentDrawingView drawingScaleForViewWidth:](self, "drawingScaleForViewWidth:", a4);
  v7 = v6;
  -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
  v9 = v8;
  -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
  v11 = a3 - (v9 + v10);
  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  return v11 / (v7 * v12);
}

- (void)updateDrawingHeight:(double)a3
{
  -[PKTextAttachmentDrawingView updateDrawingHeight:notifyDrawingDidChange:](self, "updateDrawingHeight:notifyDrawingDidChange:", 1, a3);
}

- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a4;
  -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
  v8 = v7 + a3;
  -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
  v10 = v8 + v9;
  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  -[PKTextAttachmentDrawingView _setHeight:originalHeight:growFromTop:](self, "_setHeight:originalHeight:growFromTop:", 0, v10, v11);
  if (v4)
    -[PKTextAttachmentDrawingView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
}

- (void)_setHeight:(double)a3 originalHeight:(double)a4 growFromTop:(BOOL)a5
{
  _BOOL4 v5;
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
  double v19;
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
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MinY;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double MaxY;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat rect;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v5 = a5;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView frame](self, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = v13 * 58.0;
  -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
  v19 = fmax(v17 / v18, 8.0);
  v20 = fabs(a3);
  if (v19 >= a3)
    v21 = v19;
  else
    v21 = a3;
  if (v20 == INFINITY)
    v22 = v19;
  else
    v22 = v21;
  v23 = v22;
  if (v22 != v16)
  {
    v81 = v16;
    v82 = a4;
    v85 = v12;
    v86 = v10;
    v78 = v22 - v16;
    objc_msgSend(v88, "contentOffset");
    -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
    v83 = v24;
    v80 = v25;
    v87 = v26;
    rect = v27;
    -[PKTextAttachmentDrawingView frame](self, "frame");
    -[PKTextAttachmentDrawingView drawingBoundsForViewWidth:](self, "drawingBoundsForViewWidth:", v28);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v84 = v14;
    -[PKTextAttachmentDrawingView drawingScaleForViewWidth:](self, "drawingScaleForViewWidth:", v14);
    v79 = 1.0 / v37;
    objc_msgSend(v88, "contentInset");
    v39 = v38;
    objc_msgSend(v88, "_contentScrollInset");
    if (v5)
    {
      v89.origin.x = v30;
      v89.origin.y = v32;
      v89.size.width = v34;
      v89.size.height = v36;
      if (CGRectIsEmpty(v89))
      {
        v41 = v88;
        v43 = v83;
        v42 = v84;
        v44 = v78;
        v45 = v79;
      }
      else
      {
        v92.origin.x = v30;
        v92.origin.y = v32;
        v92.size.width = v34;
        v92.size.height = v36;
        MinY = CGRectGetMinY(v92);
        -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
        v56 = MinY * v55 / -768.0;
        v43 = v83;
        v93.origin.x = v83;
        v93.origin.y = v80;
        v93.size.width = v87;
        v93.size.height = rect;
        v57 = CGRectGetMinY(v93) + v56;
        -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
        v59 = fmin(v58 + v57, 0.0);
        v44 = v78;
        v45 = v79;
        if (v78 < v59)
          v44 = v59;
        v41 = v88;
        v42 = v84;
      }
      v60 = v44;
      objc_msgSend(v41, "contentOffset");
      objc_msgSend(v88, "setContentOffset:");
      v61 = v81 + v60;
      v62 = v81 + v60 - v82;
      -[PKTextAttachmentDrawingView canvasHeightFromDrawingViewHeight:](self, "canvasHeightFromDrawingViewHeight:", v81 + v60);
      v64 = v63;
      -[PKTextAttachmentResizeView originalDrawingBounds](self->_topResizeView, "originalDrawingBounds");
      v66 = v65;
      -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
      v68 = v66 - v45 * v62 / v67;
      v51 = v85;
    }
    else
    {
      v46 = v39 + v40;
      objc_msgSend(v88, "contentSize");
      v48 = v46 + v47;
      objc_msgSend(v88, "bounds");
      v49 = v48 - CGRectGetMaxY(v90);
      if (v49 >= 0.0)
        v50 = v49;
      else
        v50 = 0.0;
      v91.origin.x = v30;
      v91.origin.y = v32;
      v91.size.width = v34;
      v91.size.height = v36;
      if (CGRectIsEmpty(v91))
      {
        v42 = v84;
        v51 = v85;
        v43 = v83;
        v52 = v78;
        v53 = v79;
      }
      else
      {
        v94.origin.x = v30;
        v94.origin.y = v32;
        v94.size.width = v34;
        v94.size.height = v36;
        MaxY = CGRectGetMaxY(v94);
        v43 = v83;
        v95.origin.x = v83;
        v95.origin.y = v80;
        v95.size.width = v87;
        v95.size.height = rect;
        v53 = v79;
        v70 = (MaxY - CGRectGetMaxY(v95)) / v79;
        -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
        v72 = fmin(v70 - v71, 0.0);
        v52 = v78;
        if (v78 < v72)
          v52 = v72;
        v42 = v84;
        v51 = v85;
      }
      v73 = v23 - v82;
      if (v50 >= v23 - v82)
        v73 = v50;
      v74 = -v73;
      if (v52 >= v74)
        v74 = v52;
      v61 = v81 + v74;
      v75 = v53 * (v81 + v74);
      -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
      v64 = v75 / v76;
      v68 = v80;
    }
    -[PKTextAttachmentDrawingView setDrawingCanvasBounds:](self, "setDrawingCanvasBounds:", v43, v68, v87, v64);
    -[PKAttachmentView setFrame:](self, "setFrame:", v86, v51, v42, v61);
    -[PKTextAttachmentDrawingView _updateAttachmentBoundsEnsureLayout:](self, "_updateAttachmentBoundsEnsureLayout:", 1);
  }

}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  double v4;

  v4 = 80.0;
  if (a4)
    v4 = 40.0;
  return -[PKTextAttachmentDrawingView hitTestResizeHandles:threshold:](self, "hitTestResizeHandles:threshold:", a3.x, a3.y, v4);
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  CGFloat width;
  double height;
  int64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v18 = CGRectInset(a4, -64.0, 0.0);
  v7 = v18.origin.x;
  v8 = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v11 = -[PKTextAttachmentDrawingView _characterIndex](self, "_characterIndex");
  if (v11)
    v12 = v8;
  else
    v12 = v8 + -16.0;
  if (v11)
    v13 = height;
  else
    v13 = height + 16.0;
  v14 = v7;
  v15 = width;
  v17.x = x;
  v17.y = y;
  return CGRectContainsPoint(*(CGRect *)(&v12 - 1), v17);
}

- (BOOL)hitTestResizeHandles:(CGPoint)a3 threshold:(double)a4
{
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  v10 = v9;
  v11 = v8;
  v12 = a4 * 0.5;
  if (a4 * 0.5 + v8 * 0.5 >= a4)
    v13 = a4;
  else
    v13 = a4 * 0.5 + v8 * 0.5;
  if (-[PKTextAttachmentDrawingView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v14 = v10 - v12;
  else
    v14 = a4 * -0.5;
  v19.origin.x = v14;
  v19.size.width = a4;
  v19.size.height = v13;
  v17.x = x;
  v17.y = y;
  v19.origin.y = a4 * -0.5;
  if (CGRectContainsPoint(v19, v17) && -[PKTextAttachmentResizeView shown](self->_topResizeView, "shown"))
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v20.origin.y = v12 + v11 - v13;
    v20.origin.x = v14;
    v20.size.width = a4;
    v20.size.height = v13;
    v18.x = x;
    v18.y = y;
    v15 = CGRectContainsPoint(v20, v18);
    if (v15)
      LOBYTE(v15) = -[PKTextAttachmentResizeView shown](self->_bottomResizeView, "shown");
  }
  return v15;
}

- (void)tapBelowDrawingGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder", a3))
  {
    -[PKTextAttachmentDrawingView resignFirstResponder](self, "resignFirstResponder");
    -[PKTextAttachmentDrawingView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "resignFirstResponder");

  }
  -[PKTextAttachmentDrawingView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_tellDelegateToHideToolPicker");
}

- (id)_drawingGestureRecognizer
{
  void *v2;
  void *v3;
  void *v4;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pkTiledViewIfEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((UITapGestureRecognizer *)self->_resizeDragGestureRecognizer == v6
    || (UITapGestureRecognizer *)self->_resizeHighlightGestureRecognizer == v6
    || self->_showMenuGestureRecognizer == v6)
  {
    objc_msgSend(v7, "locationInView:", self);
    v11 = v10;
    v13 = v12;
    +[PKTextAttachmentResizeView resizeHitSize](PKTextAttachmentResizeView, "resizeHitSize");
    if (-[PKTextAttachmentDrawingView hitTestResizeHandles:threshold:](self, "hitTestResizeHandles:threshold:", v11, v13, v14))
    {
      if (self->_showMenuGestureRecognizer != v6)
      {
        objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hideMenu");

        -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility](self, "_adjustResizeIndicatorVisibility");
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
    v9 = objc_opt_isKindOfClass() ^ 1;
  }

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  id v8;
  char isKindOfClass;
  id v10;
  id v11;
  BOOL v12;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  -[PKTextAttachmentDrawingView showMenuGestureRecognizer](self, "showMenuGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {
    NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_7:
      v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (self->_resizeDragGestureRecognizer == v6)
  {
    -[PKTextAttachmentDrawingView showMenuGestureRecognizer](self, "showMenuGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v7)
      goto LABEL_7;
  }
  -[PKTextAttachmentDrawingView _drawingGestureRecognizer](self, "_drawingGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11 == v7;

LABEL_8:
  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UITapGestureRecognizer *v7;
  uint64_t v8;
  void *v9;
  UITapGestureRecognizer *v10;
  UIPanGestureRecognizer *resizeDragGestureRecognizer;
  PKTextAttachmentDrawingViewTouchRecognizer *resizeHighlightGestureRecognizer;
  BOOL v13;
  BOOL v14;

  v6 = a3;
  v7 = (UITapGestureRecognizer *)a4;
  -[PKTextAttachmentDrawingView _drawingGestureRecognizer](self, "_drawingGestureRecognizer");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v6)
  {

    goto LABEL_7;
  }
  v9 = (void *)v8;
  -[PKTextAttachmentDrawingView _drawingGestureRecognizer](self, "_drawingGestureRecognizer");
  v10 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
    goto LABEL_7;
  resizeDragGestureRecognizer = self->_resizeDragGestureRecognizer;
  resizeHighlightGestureRecognizer = self->_resizeHighlightGestureRecognizer;
  if (resizeDragGestureRecognizer == v6)
  {
    v14 = resizeHighlightGestureRecognizer == (PKTextAttachmentDrawingViewTouchRecognizer *)v7;
    goto LABEL_11;
  }
  if (resizeHighlightGestureRecognizer != v6)
  {
    NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
    objc_opt_isKindOfClass();
    v13 = 0;
    goto LABEL_14;
  }
  if (resizeDragGestureRecognizer == (UIPanGestureRecognizer *)v7)
  {
LABEL_7:
    v13 = 1;
    goto LABEL_14;
  }
  v14 = self->_showMenuGestureRecognizer == v7;
LABEL_11:
  v13 = v14;
LABEL_14:

  return v13;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  char v17;
  void *v18;

  v4 = (UITapGestureRecognizer *)a3;
  -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  v13 = -[PKTextAttachmentDrawingView hitByTouchLocation:bounds:](self, "hitByTouchLocation:bounds:", v6, v8, v9, v10, v11, v12);
  if (self->_tapBelowDrawingGestureRecognizer != v4)
  {
    -[PKAttachmentView inlineViewAtPoint:](self, "inlineViewAtPoint:", v6, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14 || (objc_msgSend(v14, "alpha"), v16 <= 0.0))
    {
      if (self->_eatKeyboardGestureRecognizer == v4)
      {
        v17 = 1;
        goto LABEL_16;
      }
      if (self->_showMenuGestureRecognizer == v4)
      {
        if (-[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder"))
        {
          objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v18, "isMenuVisible") ^ 1;
LABEL_14:

          goto LABEL_16;
        }
      }
      else
      {
        if ((UITapGestureRecognizer *)self->_hideMenuGestureRecognizer != v4)
        {
          NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
          v17 = objc_opt_isKindOfClass() ^ 1;
LABEL_16:

          goto LABEL_17;
        }
        if (-[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder"))
        {
          objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v18, "isMenuVisible");
          goto LABEL_14;
        }
      }
    }
    v17 = 0;
    goto LABEL_16;
  }
  v17 = !v13;
LABEL_17:

  return v17 & 1;
}

- (BOOL)gestureRecognizerShouldDelayLift:(id)a3
{
  PKTextAttachmentDrawingViewTouchRecognizer *v4;
  UITapGestureRecognizer *v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  BOOL v9;

  v4 = (PKTextAttachmentDrawingViewTouchRecognizer *)a3;
  v5 = (UITapGestureRecognizer *)v4;
  if (self->_resizeHighlightGestureRecognizer == v4
    || (PKTextAttachmentDrawingViewTouchRecognizer *)self->_resizeDragGestureRecognizer == v4)
  {
    v9 = 1;
  }
  else
  {
    -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canvasView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "drawingGestureRecognizer");
    v8 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == v5 || self->_showMenuGestureRecognizer == v5;

  }
  return v9;
}

- (void)higlightResize:(id)a3
{
  uint64_t v4;
  int *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;

  v10 = a3;
  v4 = objc_msgSend(v10, "state");
  if (v4 == 5 || v4 == 3)
  {
    v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__bottomResizeView;
    -[PKTextAttachmentResizeView setHighlighted:](self->_topResizeView, "setHighlighted:", 0);
    v7 = 0;
LABEL_12:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v6), "setHighlighted:", v7);
    goto LABEL_13;
  }
  if (v4 == 1)
  {
    objc_msgSend(v10, "locationInView:", self);
    v9 = v8;
    -[PKTextAttachmentDrawingView bounds](self, "bounds");
    if (v9 >= CGRectGetMidY(v11))
      v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__bottomResizeView;
    else
      v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__topResizeView;
    v7 = 1;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)resizeDrawing:(id)a3
{
  double v4;
  double v5;
  _BOOL4 resizeUpper;
  BOOL v7;
  uint64_t v8;
  id v9;
  CGRect v10;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    objc_msgSend(v9, "locationInView:", self);
    v5 = v4;
    -[PKTextAttachmentDrawingView bounds](self, "bounds");
    resizeUpper = v5 < CGRectGetMidY(v10);
    self->_resizeUpper = resizeUpper;
  }
  else
  {
    resizeUpper = self->_resizeUpper;
  }
  v7 = !resizeUpper;
  v8 = 7;
  if (v7)
    v8 = 8;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKTextAttachmentDrawingView__cachedDrawingTransform[v8]), "handleGesture:", v9);

}

- (void)hideDrawingMenu:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideMenu");

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedTextRange:", 0);

  -[PKTextAttachmentDrawingView resignFirstResponder](self, "resignFirstResponder");
}

- (void)showDrawingMenu:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((-[PKTextAttachmentDrawingView isFirstResponder](self, "isFirstResponder") & 1) == 0)
    -[PKTextAttachmentDrawingView becomeFirstResponder](self, "becomeFirstResponder");
  if (objc_msgSend(v5, "state") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isMenuVisible") & 1) != 0)
    {
      objc_msgSend(v4, "hideMenu");
    }
    else
    {
      objc_msgSend(v5, "locationInView:", self);
      objc_msgSend(v4, "showMenuFromView:rect:", self);
    }
    -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility:highlightBackground:](self, "_adjustResizeIndicatorVisibility:highlightBackground:", 1, 1);

  }
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canSelectDrawing");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  v3 = -[PKTextAttachmentDrawingView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility:highlightBackground:](self, "_adjustResizeIndicatorVisibility:highlightBackground:", 1, 0);
  return v3;
}

- (BOOL)canResignFirstResponder
{
  return !self->_isLiveResizing;
}

- (BOOL)resignFirstResponder
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  v3 = -[PKTextAttachmentDrawingView resignFirstResponder](&v5, sel_resignFirstResponder);
  -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility:highlightBackground:](self, "_adjustResizeIndicatorVisibility:highlightBackground:", 1, 0);
  return v3;
}

- (id)keyCommands
{
  void *v2;
  int v3;
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
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasSelection");

  _PencilKitBundle();
  if (v3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Copy strokes"), CFSTR("Copy strokes"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __42__PKTextAttachmentDrawingView_keyCommands__block_invoke((uint64_t)CFSTR("c"), 0x100000, (uint64_t)sel_copyStrokeSelection_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    _PencilKitBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cut strokes"), CFSTR("Cut strokes"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __42__PKTextAttachmentDrawingView_keyCommands__block_invoke((uint64_t)CFSTR("x"), 0x100000, (uint64_t)sel_cutStrokeSelection_, v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Paste strokes"), CFSTR("Paste strokes"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __42__PKTextAttachmentDrawingView_keyCommands__block_invoke((uint64_t)CFSTR("v"), 0x100000, (uint64_t)sel_paste_, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v9;
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete strokes"), CFSTR("Delete strokes"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __42__PKTextAttachmentDrawingView_keyCommands__block_invoke((uint64_t)CFSTR("\b"), 0, (uint64_t)sel_deleteStrokeSelection_, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v17;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Select All"), CFSTR("Select All"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __42__PKTextAttachmentDrawingView_keyCommands__block_invoke((uint64_t)CFSTR("a"), 0x100000, (uint64_t)sel_selectAll_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0DC3930];
  v8 = a4;
  objc_msgSend(v7, "keyCommandWithInput:modifierFlags:action:", a1, a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  objc_super v20;
  _QWORD v21[2];
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (sel__share_ == a3)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    if (!CGRectIsEmpty(v22))
    {
      -[PKTextAttachmentDrawingView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v12, "expectsSecureRendering") ^ 1;

LABEL_20:
      goto LABEL_21;
    }
LABEL_10:
    LOBYTE(v7) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (sel_cut_ == a3)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    if (CGRectIsEmpty(v23))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = v13 == v6;

    }
    goto LABEL_16;
  }
  if (sel_copy_ == a3)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    LODWORD(v7) = !CGRectIsEmpty(v24);
LABEL_16:

    goto LABEL_22;
  }
  if (sel_delete_ == a3)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    if (!CGRectIsEmpty(v25) || !-[PKTextAttachmentDrawingView isAtEndOfDocument](self, "isAtEndOfDocument"))
    {
      -[PKTextAttachmentDrawingView _textView](self, "_textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v11, "length") != 0;
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (sel_paste_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("com.apple.drawing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsPasteboardTypes:", v16);

    -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectionController");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v7, (uint64_t)a3, v6, 0);

    LOBYTE(v7) = v17 | v19;
  }
  else
  {
    LOBYTE(v7) = 0;
    if (sel_insertSpace_ != a3 && sel_selectAll_ != a3)
    {
      v20.receiver = self;
      v20.super_class = (Class)PKTextAttachmentDrawingView;
      LOBYTE(v7) = -[PKTextAttachmentDrawingView canPerformAction:withSender:](&v20, sel_canPerformAction_withSender_, a3, v6);
    }
  }
LABEL_22:

  return (char)v7;
}

- (void)cutStrokeSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cut:", v4);

}

- (void)copyStrokeSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copy:", v4);

}

- (void)deleteStrokeSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delete:", v4);

}

- (void)cut:(id)a3
{
  void *v4;
  id v5;

  -[PKTextAttachmentDrawingView copy:](self, "copy:", a3);
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeDrawingAttachment:withView:forDeletion:", v4, self, 0);

}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PKImageRenderer *v12;
  void *v13;
  double v14;
  PKImageRenderer *v15;
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
  id v26;
  _QWORD v27[4];
  id v28;

  -[PKAttachmentView drawing](self, "drawing", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializeTransiently");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAttachmentView drawing](self, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if (v10 <= 2048.0)
  {
    v11 = 1.0;
  }
  else
  {
    v11 = 2048.0 / v10;
    v8 = ceil(v8 * (2048.0 / v10));
    v10 = 2048.0;
  }
  v12 = [PKImageRenderer alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = -[PKImageRenderer initWithSize:scale:](v12, "initWithSize:scale:", v8, v10, v14);

  -[PKAttachmentView drawing](self, "drawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView drawing](self, "drawing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __36__PKTextAttachmentDrawingView_copy___block_invoke;
  v27[3] = &unk_1E777C400;
  v28 = v5;
  v26 = v5;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v15, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v27, v19, v21, v23, v25, v11);

}

void __36__PKTextAttachmentDrawingView_copy___block_invoke(uint64_t a1, void *a2)
{
  UIImage *v3;
  UIImage *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  UIImage *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    UIImagePNGRepresentation(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PKTextAttachmentDrawingView_copy___block_invoke_2;
    block[3] = &unk_1E777BD10;
    v8 = v4;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = 0;
    goto LABEL_5;
  }
LABEL_6:

}

void __36__PKTextAttachmentDrawingView_copy___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    v3 = a1[5];
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

  }
  v5 = a1[6];
  if (v5)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("com.apple.drawing"));
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItems:", v7);

  }
}

- (void)paste:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paste:", v4);

}

- (void)delete:(id)a3
{
  void *v4;
  id v5;

  -[PKTextAttachmentDrawingView _textView](self, "_textView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeDrawingAttachment:withView:forDeletion:", v4, self, 1);

}

- (void)insertSpace:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSpace:", v4);

}

- (void)selectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll:", v4);

}

- (void)_share:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  PKImageRenderer *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  PKImageRenderer *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  dispatch_time_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__24;
  v52 = __Block_byref_object_dispose__24;
  v53 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = [PKImageRenderer alloc];
  -[PKAttachmentView drawing](self, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = -[PKImageRenderer initWithSize:scale:](v6, "initWithSize:scale:", v9, v11, v13);

  -[PKAttachmentView drawing](self, "drawing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView drawing](self, "drawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __38__PKTextAttachmentDrawingView__share___block_invoke;
  v45[3] = &unk_1E7779240;
  v47 = &v48;
  v25 = v5;
  v46 = v25;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v14, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v15, v45, v18, v20, v22, v24, 1.0);

  v26 = dispatch_time(0, 4000000000);
  dispatch_semaphore_wait(v25, v26);
  if (v49[5])
  {
    v27 = objc_alloc(MEMORY[0x1E0CEA2D8]);
    v55[0] = v49[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithActivityItems:applicationActivities:", v28, 0);

    objc_msgSend(v29, "setModalPresentationStyle:", 7);
    objc_msgSend(v29, "popoverPresentationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSourceView:", self);

    -[PKTextAttachmentDrawingView bounds](self, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(v29, "popoverPresentationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSourceRect:", v32, v34, v36, v38);

    objc_msgSend(v29, "popoverPresentationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPermittedArrowDirections:", 3);

    objc_msgSend(v29, "popoverPresentationController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCanOverlapSourceViewRect:", 1);

    v54 = *MEMORY[0x1E0CEB1D8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setExcludedActivityTypes:", v42);

    -[PKTextAttachmentDrawingView window](self, "window");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "rootViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "presentViewController:animated:completion:", v29, 1, 0);

  }
  _Block_object_dispose(&v48, 8);

}

void __38__PKTextAttachmentDrawingView__share___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)scaleDrawing:(double)a3
{
  double v5;
  double v6;

  -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
  -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 0, a3, v5, v6);
}

- (void)scaleDrawing:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  int64_t v19;
  double v20;
  _QWORD v21[12];
  _QWORD v22[3];
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;

  if (a5)
  {
    y = a4.y;
    x = a4.x;
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    v10 = dbl_1BE4FE5A0[v9 < a3];
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    v12 = v11;
    -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
    UIRoundToViewScale();
    v14 = v13;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    v25 = v15;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
    v23 = v16;
    -[PKTextAttachmentDrawingView setZoomingProgramatically:](self, "setZoomingProgramatically:", 1);
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
    v19 = -[PKTextAttachmentDrawingView _characterIndex](self, "_characterIndex");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__PKTextAttachmentDrawingView_scaleDrawing_withOffset_animated___block_invoke;
    v21[3] = &unk_1E777C428;
    *(double *)&v21[7] = (a3 - v12) * v10;
    *(double *)&v21[8] = a3;
    v21[4] = self;
    v21[5] = v24;
    v21[6] = v22;
    v21[9] = v14;
    *(CGFloat *)&v21[10] = x;
    *(CGFloat *)&v21[11] = y;
    objc_msgSend(v17, "_growView:textAttachment:atCharacterIndex:step:stop:", self, WeakRetained, v19, v21);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    -[PKTextAttachmentDrawingView setZoomScale:](self, "setZoomScale:", a3, a4.x, a4.y);
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    -[UIScrollView setScrollEnabled:](self->_tileMaskView, "setScrollEnabled:", v20 > 1.0);
    -[PKTextAttachmentDrawingView updateFrameForTextContainer](self, "updateFrameForTextContainer");
  }
}

uint64_t __64__PKTextAttachmentDrawingView_scaleDrawing_withOffset_animated___block_invoke(uint64_t a1)
{
  double v2;
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;

  v2 = *(double *)(a1 + 56);
  if (v2 == 0.0
    || (v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v5 = *(double *)(v4 + 24), v2 < 0.0) && v5 <= *(double *)(a1 + 64)
    || v2 > 0.0 && v5 >= *(double *)(a1 + 64))
  {
    v3 = 1;
  }
  else
  {
    *(double *)(v4 + 24) = v2 + v5;
    v6 = *(double *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    if ((v6 >= 0.0 || (v8 = *(_QWORD *)(v7 + 8), v9 = *(double *)(a1 + 64), *(double *)(v8 + 24) >= v9))
      && (v6 <= 0.0 || (v8 = *(_QWORD *)(v7 + 8), v9 = *(double *)(a1 + 64), *(double *)(v8 + 24) <= v9)))
    {
      v3 = 0;
    }
    else
    {
      *(double *)(v8 + 24) = v9;
      v7 = *(_QWORD *)(a1 + 40);
      v3 = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "scaleDrawing:", *(double *)(*(_QWORD *)(v7 + 8) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setZoomScale:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  v10 = *(double *)(a1 + 72);
  if (v10 == 0.0
    || (v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v13 = *(double *)(v12 + 24), v10 < 0.0)
    && v13 <= *(double *)(a1 + 80)
    || v10 > 0.0 && v13 >= *(double *)(a1 + 80))
  {
    v11 = 1;
  }
  else
  {
    *(double *)(v12 + 24) = v10 + v13;
    v14 = *(double *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 48);
    if (v14 < 0.0 && (v16 = *(_QWORD *)(v15 + 8), v17 = *(double *)(a1 + 80), *(double *)(v16 + 24) <= v17)
      || v14 > 0.0 && (v16 = *(_QWORD *)(v15 + 8), v17 = *(double *)(a1 + 80), *(double *)(v16 + 24) >= v17))
    {
      *(double *)(v16 + 24) = v17;
      v15 = *(_QWORD *)(a1 + 48);
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setContentOffset:", *(double *)(*(_QWORD *)(v15 + 8) + 24), 0.0);
  }
  v18 = v3 & v11;
  if ((_DWORD)v18 == 1)
    objc_msgSend(*(id *)(a1 + 32), "setZoomingProgramatically:", 0);
  return v18;
}

- (BOOL)isAtBeginningOfDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v9;

  return v8;
}

- (BOOL)isAtEndOfDocument
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;

  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    goto LABEL_4;
  objc_msgSend(v4, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", v10, 4);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14 == v15;

  }
  else
  {
LABEL_4:
    v12 = 0;
  }

  return v12;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKTextAttachmentResizeView layoutInsideSuperview](self->_topResizeView, "layoutInsideSuperview");
  -[PKTextAttachmentResizeView layoutInsideSuperview](self->_bottomResizeView, "layoutInsideSuperview");
  -[PKTextAttachmentDrawingView layoutTileViews](self, "layoutTileViews");
}

- (void)layoutTileViews
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
  void *v22;

  -[PKTextAttachmentDrawingView bounds](self, "bounds");
  if (v5 != 0.0)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    if (-[PKTextAttachmentDrawingView isAtEndOfDocument](self, "isAtEndOfDocument"))
    {
      -[PKTextAttachmentDrawingView _textView](self, "_textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v10 = v10 + v12;

    }
    -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
    v14 = v8 + v13;
    -[PKTextAttachmentResizeView resizeContentInset](self->_topResizeView, "resizeContentInset");
    v16 = v15;
    -[PKTextAttachmentResizeView resizeContentInset](self->_bottomResizeView, "resizeContentInset");
    -[UIScrollView setFrame:](self->_tileMaskView, "setFrame:", v7, v14, v9, v10 - (v16 + v17));
    -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
    v19 = -(v18 * v9);
    -[PKTextAttachmentDrawingView drawingBounds](self, "drawingBounds");
    v21 = floor(v19 / v20);
    -[PKAttachmentView tileContainerView](self, "tileContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", 0.0, v21, v9, v10);

    -[PKLinedPaperLayer updateLinesFromAttachmentBounds:](self->_linesLayer, "updateLinesFromAttachmentBounds:", v7, v8, v9, v10);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_tileScaleView;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  void *v5;
  UIView *tileScaleView;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[PKTextAttachmentDrawingView zoomingProgramatically](self, "zoomingProgramatically"))
  {
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    -[PKTextAttachmentDrawingView setZoomStartScale:](self, "setZoomStartScale:");
    objc_msgSend(v9, "pinchGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", 0);
    -[PKTextAttachmentDrawingView setZoomStartLocationInWindow:](self, "setZoomStartLocationInWindow:");

    tileScaleView = self->_tileScaleView;
    -[PKTextAttachmentDrawingView zoomStartLocationInWindow](self, "zoomStartLocationInWindow");
    -[UIView convertPoint:fromView:](tileScaleView, "convertPoint:fromView:", 0);
    -[PKTextAttachmentDrawingView setZoomStartLocationInAttachment:](self, "setZoomStartLocationInAttachment:");
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    -[PKTextAttachmentDrawingView setTextViewContentOffsetStartLocation:](self, "setTextViewContentOffsetStartLocation:");

    objc_msgSend(v9, "pinchGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    -[PKTextAttachmentDrawingView scaleDrawing:](self, "scaleDrawing:");

  }
}

- (void)scrollViewDidZoom:(id)a3
{
  void *v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  void *v22;
  id v23;

  v23 = a3;
  if (!-[PKTextAttachmentDrawingView zoomingProgramatically](self, "zoomingProgramatically"))
  {
    objc_msgSend(v23, "pinchGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    -[PKTextAttachmentDrawingView scaleDrawing:](self, "scaleDrawing:", v6);
    v7 = -[PKTextAttachmentDrawingView _characterIndex](self, "_characterIndex");
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_pk_ensureLayoutForCharacterRange:", v7, 1);

    objc_msgSend(v23, "pinchGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", 0);
    v11 = v10;

    -[PKTextAttachmentDrawingView zoomStartLocationInWindow](self, "zoomStartLocationInWindow");
    v13 = v12 - v11;
    -[PKTextAttachmentDrawingView zoomStartLocationInAttachment](self, "zoomStartLocationInAttachment");
    v15 = v14;
    -[PKTextAttachmentDrawingView zoomStartScale](self, "zoomStartScale");
    v17 = v13 + v15 * (v6 - v16);
    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v19 = v18;
    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v21 = v17 + v20;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentOffset:", v19, v21);

  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  void *v7;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  id v68;

  v68 = a3;
  if (!-[PKTextAttachmentDrawingView zoomingProgramatically](self, "zoomingProgramatically"))
  {
    -[PKTextAttachmentDrawingView scaleDrawing:](self, "scaleDrawing:", a5);
    objc_msgSend(v68, "pinchGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", 0);

    -[PKTextAttachmentDrawingView zoomStartLocationInWindow](self, "zoomStartLocationInWindow");
    -[PKTextAttachmentDrawingView zoomStartLocationInAttachment](self, "zoomStartLocationInAttachment");
    -[PKTextAttachmentDrawingView zoomStartScale](self, "zoomStartScale");
    -[PKTextAttachmentDrawingView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    v10 = v9;

    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v12 = v11;
    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v14 = v10 + v13;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentOffset:", v12, v14);

    v16 = 3.0;
    if (a5 <= 3.0)
      v16 = a5;
    if (a5 >= 1.0)
      v17 = v16;
    else
      v17 = 1.0;
    -[PKTextAttachmentDrawingView zoomStartLocationInWindow](self, "zoomStartLocationInWindow", 1.0, v16);
    -[PKTextAttachmentDrawingView zoomStartLocationInAttachment](self, "zoomStartLocationInAttachment");
    -[PKTextAttachmentDrawingView zoomStartScale](self, "zoomStartScale");
    -[PKTextAttachmentDrawingView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    v20 = v19;

    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v22 = v21;
    -[PKTextAttachmentDrawingView textViewContentOffsetStartLocation](self, "textViewContentOffsetStartLocation");
    v24 = v20 + v23;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "adjustedContentInset");
    v27 = -v26;

    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentSize");
    v30 = v29;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "adjustedContentInset");
    v33 = v30 + v32;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "adjustedContentInset");
    v36 = v33 + v35;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = v38;

    if (v24 < v27 || v36 <= v39)
      v24 = v27;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "contentSize");
    v43 = v42;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    v46 = v43 - v45;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "adjustedContentInset");
    v49 = v46 + v48;

    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "contentSize");
    v52 = v51;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "adjustedContentInset");
    v55 = v52 + v54;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "adjustedContentInset");
    v58 = v55 + v57;
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "frame");
    v61 = v60;

    if (v24 <= v49 || v58 <= v61)
      v63 = v24;
    else
      v63 = v49;
    -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
    UIRoundToViewScale();
    v65 = v64;
    -[UIScrollView contentOffset](self->_tileMaskView, "contentOffset");
    UIRoundToViewScale();
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, v17, v65, v66);
    -[PKTextAttachmentDrawingView _textView](self, "_textView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setContentOffset:animated:", 1, v22, v63);

  }
}

- (void)handleDoubleTap:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PKTextAttachmentDrawingView *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  -[PKTextAttachmentDrawingView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PKTextAttachmentDrawingView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstResponder");
    v8 = (PKTextAttachmentDrawingView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      goto LABEL_5;
    -[PKTextAttachmentDrawingView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resignFirstResponder");

  }
LABEL_5:
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isFingerDrawingEnabled");

  if ((v11 & 1) == 0)
  {
    -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
    if (v12 <= 1.0)
    {
      objc_msgSend(v20, "locationInView:", self);
      -[PKTextAttachmentDrawingView bounds](self, "bounds");
      UIRoundToViewScale();
      v16 = v15;
      -[PKTextAttachmentDrawingView bounds](self, "bounds");
      UIRoundToViewScale();
      UIRoundToViewScale();
      v18 = fmax(v17, 0.0);
      -[PKTextAttachmentDrawingView bounds](self, "bounds");
      if (v18 >= -(v16 - v19 * 2.0))
        v14 = -(v16 - v19 * 2.0);
      else
        v14 = v18;
      v13 = 2.0;
    }
    else
    {
      v13 = 1.0;
      v14 = 0.0;
    }
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, v13, v14, 0.0);
  }

}

- (CGRect)drawingContentBounds
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PKAttachmentView drawing](self, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (fabs(v5) == INFINITY
    || fabs(v7) == INFINITY
    || fabs(v9) == INFINITY
    || (v12 = fabs(v11), v12 >= INFINITY) && v12 <= INFINITY)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PKTextAttachmentDrawingView semanticContentAttribute](self, "semanticContentAttribute")))
    {
      v11 = 0.0;
      v5 = 768.0;
      v9 = 0.0;
      v7 = 0.0;
    }
    else
    {
      v5 = *MEMORY[0x1E0C9D648];
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
  }
  if (v11 >= 58.0)
    v13 = v11;
  else
    v13 = 58.0;
  v14 = v5;
  v15 = v7;
  v16 = v9;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)drawingBoundsForViewWidth:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  int v14;
  double MinX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[PKTextAttachmentDrawingView drawingContentBounds](self, "drawingContentBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKTextAttachmentDrawingView tiledView](self, "tiledView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "cropDrawingAttachmentsWhenViewIsSmaller");

  if (v14)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PKTextAttachmentDrawingView semanticContentAttribute](self, "semanticContentAttribute")))
    {
      v22.origin.x = v6;
      v22.origin.y = v8;
      v22.size.width = v10;
      v22.size.height = v12;
      MinX = CGRectGetMinX(v22);
      if (MinX >= 768.0 - a3 + -16.0)
        MinX = 768.0 - a3 + -16.0;
      v16 = fmax(MinX, 0.0);
      v17 = 768.0 - v16;
    }
    else
    {
      v16 = 0.0;
      v23.origin.x = 0.0;
      v23.origin.y = v8;
      v23.size.width = v10;
      v23.size.height = v12;
      v18 = CGRectGetMaxX(v23) + 16.0;
      if (v18 < a3)
        v18 = a3;
      if (v18 <= 768.0)
        v17 = v18;
      else
        v17 = 768.0;
    }
  }
  else
  {
    v16 = 0.0;
    v17 = 768.0;
  }
  v19 = v16;
  v20 = v8;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)drawingScaleForViewWidth:(double)a3
{
  double v4;
  double v5;

  -[PKTextAttachmentDrawingView drawingTransformForViewWidth:](self, "drawingTransformForViewWidth:", a3);
  return sqrt(v5 * v5 + v4 * v4);
}

- (CGAffineTransform)drawingTransformForViewWidth:(SEL)a3
{
  CGAffineTransform *v5;
  double v7;
  CGAffineTransform *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v15;
  BOOL v16;
  int v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double *p_a;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;

  v5 = self;
  v7 = a4 - self[16].a;
  if (v7 < 0.0)
    v7 = -v7;
  if (v7 < 1.0)
  {
    v8 = self + 15;
LABEL_16:
    v18 = *(_OWORD *)&v8->c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v8->a;
    *(_OWORD *)&retstr->c = v18;
    v19 = *(_OWORD *)&v8->tx;
    goto LABEL_21;
  }
  self = (CGAffineTransform *)-[CGAffineTransform drawingBoundsForViewWidth:](self, "drawingBoundsForViewWidth:", a4);
  v11 = a4 / v10;
  v12 = fabs(a4 / v10);
  v13 = (unint64_t)(*(_QWORD *)&v12 - 1) < 0xFFFFFFFFFFFFFLL;
  v14 = (unint64_t)(*(_QWORD *)&v12 - 0x10000000000000) >> 53 < 0x3FF;
  if (COERCE__INT64(a4 / v10) >= 0)
  {
    v14 = 0;
    v13 = 0;
  }
  v15 = fabs(a4 / v10);
  if (v15 == 0.0)
    v13 = 1;
  v16 = *(_QWORD *)&v15 <= 0x7FF0000000000000;
  v17 = v15 == INFINITY || v13;
  if (!v16)
    v17 = 1;
  if ((v17 | v14) == 1)
  {
    v8 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
    goto LABEL_16;
  }
  v20 = v9;
  self = (CGAffineTransform *)objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[CGAffineTransform semanticContentAttribute](v5, "semanticContentAttribute"));
  p_a = &v5[15].a;
  if (self)
  {
    *p_a = v11;
    v5[15].b = 0.0;
    v5[15].c = 0.0;
    v5[15].d = v11;
    v5[15].tx = -(v11 * v20);
    v5[15].ty = 0.0;
  }
  else
  {
    self = CGAffineTransformMakeScale(&v24, v11, v11);
    v22 = *(_OWORD *)&v24.c;
    *(_OWORD *)p_a = *(_OWORD *)&v24.a;
    *(_OWORD *)&v5[15].c = v22;
    *(_OWORD *)&v5[15].tx = *(_OWORD *)&v24.tx;
  }
  v5[16].a = a4;
  v23 = *(_OWORD *)&v5[15].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)p_a;
  *(_OWORD *)&retstr->c = v23;
  v19 = *(_OWORD *)&v5[15].tx;
LABEL_21:
  *(_OWORD *)&retstr->tx = v19;
  return self;
}

- (double)desiredAttachmentViewWidthForContainerView:(id)a3
{
  double v3;

  if (!a3)
    return 768.0;
  objc_msgSend(a3, "bounds");
  return v3;
}

- (CGAffineTransform)drawingTransform
{
  CGAffineTransform *result;
  id v5;

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView desiredAttachmentViewWidthForContainerView:](self, "desiredAttachmentViewWidthForContainerView:", v5);
  -[PKTextAttachmentDrawingView drawingTransformForViewWidth:](self, "drawingTransformForViewWidth:");

  return result;
}

- (CGRect)resizeViewDrawingBounds:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[PKAttachmentView drawing](self, "drawing", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  if (CGRectIsNull(v17))
  {
    v13 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[PKTextAttachmentDrawingView drawingCanvasBounds](self, "drawingCanvasBounds");
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)resizeView:(id)a3 setDrawingHeight:(double)a4 originalHeight:(double)a5 growFromTop:(BOOL)a6
{
  -[PKTextAttachmentDrawingView _setHeight:originalHeight:growFromTop:](self, "_setHeight:originalHeight:growFromTop:", a6, a4, a5);
}

- (void)resizeViewRemoveAttachment:(id)a3
{
  void *v4;
  id v5;

  -[PKTextAttachmentDrawingView _textView](self, "_textView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeDrawingAttachment:withView:forDeletion:", v4, self, 0);

}

- (void)resizeViewLayoutAttachment:(id)a3
{
  -[PKTextAttachmentDrawingView _updateAttachmentBoundsEnsureLayout:](self, "_updateAttachmentBoundsEnsureLayout:", 1);
}

- (void)resizeView:(id)a3 finishedWithOriginalDrawingBounds:(CGRect)a4 originalViewBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  -[PKTextAttachmentDrawingView undoManager](self, "undoManager", a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "prepareWithInvocationTarget:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView drawing](self, "drawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_undoDrawingBounds:viewBounds:ofAttachmentUUID:", v17, v12, v11, v10, v9, x, y, width, height);

}

- (void)resizeViewDidUpdate:(id)a3
{
  -[PKTextAttachmentDrawingView _adjustResizeIndicatorVisibility](self, "_adjustResizeIndicatorVisibility", a3);
  -[PKAttachmentView drawingDidChange](self, "drawingDidChange");
}

- (id)dataForTextAttachment:(id)a3
{
  void *v3;
  void *v4;

  -[PKAttachmentView drawing](self, "drawing", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)drawingDataDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[2];
  __int16 v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "drawingDataDidChange called", buf, 2u);
  }

  -[PKTextAttachmentDrawingView _textView](self, "_textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pkTiledViewIfEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAggd_didMergeWithCollaborator:", 1);

  -[PKAttachmentView drawing](self, "drawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v8)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "mergeWithDrawing:", v4);
    +[PKStatisticsManager sharedStatisticsManager]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordCollaboration:]((uint64_t)v12, v11);

    if (v11 == 2)
    {
      v16 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v17 = 0;
        _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "drawing updated when merging", v17, 2u);
      }

      -[PKAttachmentView setDrawing:](self, "setDrawing:", v10);
      -[PKTextAttachmentDrawingView _updateViewHeightIfNecessary](self, "_updateViewHeightIfNecessary");
      -[PKTextAttachmentDrawingView _triggerRedraw](self, "_triggerRedraw");
      goto LABEL_15;
    }
    if (v11 == 1)
    {
      v13 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v18 = 0;
        v14 = "No change when merging drawings";
        v15 = v18;
        goto LABEL_18;
      }
    }
    else
    {
      if (v11)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v19 = 0;
        v14 = "Fail when merging drawings";
        v15 = (uint8_t *)&v19;
LABEL_18:
        _os_log_debug_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEBUG, v14, v15, 2u);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

- (void)resetZoom
{
  double v3;

  -[PKTextAttachmentDrawingView zoomScale](self, "zoomScale");
  if (v3 != 1.0)
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, 1.0, 0.0, 0.0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (id)linedPaperLayerLinedPaper:(id)a3
{
  void *v3;
  void *v4;

  -[PKTextAttachmentDrawingView _textView](self, "_textView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linedPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)drawingAspectRatio
{
  return self->_drawingAspectRatio;
}

- (UIView)tileScaleView
{
  return self->_tileScaleView;
}

- (NSTextAttachment)textAttachment
{
  return (NSTextAttachment *)objc_loadWeakRetained((id *)&self->_textAttachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (PKTextAttachmentResizeView)topResizeView
{
  return self->_topResizeView;
}

- (void)setTopResizeView:(id)a3
{
  objc_storeStrong((id *)&self->_topResizeView, a3);
}

- (PKTextAttachmentResizeView)bottomResizeView
{
  return self->_bottomResizeView;
}

- (void)setBottomResizeView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomResizeView, a3);
}

- (PKLinedPaperLayer)linesLayer
{
  return self->_linesLayer;
}

- (void)setLinesLayer:(id)a3
{
  objc_storeStrong((id *)&self->_linesLayer, a3);
}

- (PKTextAttachmentDrawingViewTouchRecognizer)resizeHighlightGestureRecognizer
{
  return self->_resizeHighlightGestureRecognizer;
}

- (void)setResizeHighlightGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_resizeHighlightGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)resizeDragGestureRecognizer
{
  return self->_resizeDragGestureRecognizer;
}

- (void)setResizeDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_resizeDragGestureRecognizer, a3);
}

- (UITapGestureRecognizer)eatKeyboardGestureRecognizer
{
  return self->_eatKeyboardGestureRecognizer;
}

- (void)setEatKeyboardGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_eatKeyboardGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapBelowDrawingGestureRecognizer
{
  return self->_tapBelowDrawingGestureRecognizer;
}

- (void)setTapBelowDrawingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapBelowDrawingGestureRecognizer, a3);
}

- (UITapGestureRecognizer)showMenuGestureRecognizer
{
  return self->_showMenuGestureRecognizer;
}

- (void)setShowMenuGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_showMenuGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)hideMenuGestureRecognizer
{
  return self->_hideMenuGestureRecognizer;
}

- (void)setHideMenuGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hideMenuGestureRecognizer, a3);
}

- (BOOL)resizeUpper
{
  return self->_resizeUpper;
}

- (void)setResizeUpper:(BOOL)a3
{
  self->_resizeUpper = a3;
}

- (BOOL)inserted
{
  return self->_inserted;
}

- (void)setInserted:(BOOL)a3
{
  self->_inserted = a3;
}

- (BOOL)zoomingProgramatically
{
  return self->_zoomingProgramatically;
}

- (void)setZoomingProgramatically:(BOOL)a3
{
  self->_zoomingProgramatically = a3;
}

- (CGPoint)zoomStartLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomStartLocationInWindow.x;
  y = self->_zoomStartLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomStartLocationInWindow:(CGPoint)a3
{
  self->_zoomStartLocationInWindow = a3;
}

- (CGPoint)zoomStartLocationInAttachment
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomStartLocationInAttachment.x;
  y = self->_zoomStartLocationInAttachment.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomStartLocationInAttachment:(CGPoint)a3
{
  self->_zoomStartLocationInAttachment = a3;
}

- (CGPoint)textViewContentOffsetStartLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_textViewContentOffsetStartLocation.x;
  y = self->_textViewContentOffsetStartLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTextViewContentOffsetStartLocation:(CGPoint)a3
{
  self->_textViewContentOffsetStartLocation = a3;
}

- (double)zoomStartScale
{
  return self->_zoomStartScale;
}

- (void)setZoomStartScale:(double)a3
{
  self->_zoomStartScale = a3;
}

- (BOOL)isLiveResizing
{
  return self->_isLiveResizing;
}

- (void)setIsLiveResizing:(BOOL)a3
{
  self->_isLiveResizing = a3;
}

- (CGRect)liveResizeAttachmentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_liveResizeAttachmentBounds.origin.x;
  y = self->_liveResizeAttachmentBounds.origin.y;
  width = self->_liveResizeAttachmentBounds.size.width;
  height = self->_liveResizeAttachmentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLiveResizeAttachmentBounds:(CGRect)a3
{
  self->_liveResizeAttachmentBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMenuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_showMenuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapBelowDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eatKeyboardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_resizeDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_resizeHighlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_linesLayer, 0);
  objc_storeStrong((id *)&self->_bottomResizeView, 0);
  objc_storeStrong((id *)&self->_topResizeView, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_tileScaleView, 0);
  objc_storeStrong((id *)&self->_tileMaskView, 0);
}

@end
