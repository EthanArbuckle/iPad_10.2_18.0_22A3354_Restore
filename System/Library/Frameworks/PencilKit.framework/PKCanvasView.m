@implementation PKCanvasView

- (PKCanvasView)initWithFrame:(CGRect)a3
{
  return -[PKCanvasView initWithFrame:drawingWidth:](self, "initWithFrame:drawingWidth:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4
{
  return -[PKCanvasView initWithFrame:drawingWidth:fixedPixelSizeScrollView:](self, "initWithFrame:drawingWidth:fixedPixelSizeScrollView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4 fixedPixelSizeScrollView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PKCanvasView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PKCanvasView;
  v10 = a5;
  v11 = -[PKCanvasView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  +[PKContentVersionUtility sharedUtility]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v12);

  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:](v11, "setupDrawingWidth:fixedPixelSizeScrollView:", v10, a4, v14.receiver, v14.super_class);
  return v11;
}

- (PKCanvasView)initWithFrame:(CGRect)a3 sixChannelBlend:(BOOL)a4 snapshotView:(id)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v10;
  PKCanvasView *v11;
  void *v12;
  objc_super v14;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PKCanvasView;
  v10 = a5;
  v11 = -[PKCanvasView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  +[PKContentVersionUtility sharedUtility]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v12);

  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:](v11, "setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:", 0, v5, 0, 0.0, v14.receiver, v14.super_class);
  -[PKTiledView setContentSnapshottingView:](v11->_tiledView, "setContentSnapshottingView:", v10);

  return v11;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  -[PKCanvasView awakeFromNib](&v5, sel_awakeFromNib);
  if (!self->__observers)
  {
    +[PKContentVersionUtility sharedUtility]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v3);

  }
  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:](self, "setupDrawingWidth:fixedPixelSizeScrollView:", 0, 0.0);
  -[PKCanvasView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCanvasView _setChildrenBackgroundColor:](self, "_setChildrenBackgroundColor:", v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKCanvasView _tiledView](self, "_tiledView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "disableTileRendering");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKCanvasView;
    -[PKCanvasView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4
{
  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:](self, "setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:", a4, 0, 0, a3);
}

- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4 sixChannelBlend:(BOOL)a5 drawBitmapEraserMask:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  UIView *v20;
  UIView *fixedPixelSizeScrollViewWrapper;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  PKRulerHostingDelegate *v28;
  PKRulerHostingDelegate *rulerHostingDelegate;
  PKCanvasAttachmentView *v30;
  id v31;
  PKCanvasAttachmentView *v32;
  PKCanvasAttachmentView *pageView;
  PKTiledView *v34;
  PKCanvasView *fixedPixelSizeScrollView;
  PKTiledView *v36;
  PKTiledView *tiledView;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  UIScrollView *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  id v66;

  v6 = a5;
  v66 = a4;
  v10 = (objc_class *)objc_opt_class();
  if (v66)
  {
    objc_msgSend(v66, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_storeStrong((id *)&self->_fixedPixelSizeScrollView, a4);
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
    v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
    fixedPixelSizeScrollViewWrapper = self->_fixedPixelSizeScrollViewWrapper;
    self->_fixedPixelSizeScrollViewWrapper = v20;

    -[UIView addSubview:](self->_fixedPixelSizeScrollViewWrapper, "addSubview:", self->_fixedPixelSizeScrollView);
    -[UIView layer](self->_fixedPixelSizeScrollViewWrapper, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAnchorPoint:", 0.0, 0.0);

    -[PKCanvasView bounds](self, "bounds");
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:");
  }
  else
  {
    -[PKCanvasView bounds](self, "bounds");
    v12 = v23;
    v14 = v24;
    v16 = v25;
    v18 = v26;
  }
  -[PKCanvasView panGestureRecognizer](self, "panGestureRecognizer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAllowedTouchTypes:", &unk_1E77ECE50);

  v28 = (PKRulerHostingDelegate *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v14, v16, v18);
  rulerHostingDelegate = self->_rulerHostingDelegate;
  self->_rulerHostingDelegate = v28;

  v30 = [PKCanvasAttachmentView alloc];
  v31 = objc_alloc_init(v10);
  v32 = -[PKAttachmentView initWithFrame:drawing:](v30, "initWithFrame:drawing:", v31, v12, v14, v16, v18);
  pageView = self->_pageView;
  self->_pageView = v32;

  -[PKCanvasAttachmentView setCanvasView:](self->_pageView, "setCanvasView:", self);
  -[PKAttachmentView setSixChannelBlending:](self->_pageView, "setSixChannelBlending:", v6);
  -[PKCanvasAttachmentView setUserInteractionEnabled:](self->_pageView, "setUserInteractionEnabled:", 0);
  -[PKCanvasAttachmentView setDrawingWidth:](self->_pageView, "setDrawingWidth:", a3);
  -[PKRulerHostingDelegate addSubview:](self->_rulerHostingDelegate, "addSubview:", self->_pageView);
  v34 = [PKTiledView alloc];
  if (self->_fixedPixelSizeScrollView)
    fixedPixelSizeScrollView = (PKCanvasView *)self->_fixedPixelSizeScrollView;
  else
    fixedPixelSizeScrollView = self;
  v36 = -[PKTiledView initInScrollView:sixChannelBlending:defaultDrawingClass:](v34, "initInScrollView:sixChannelBlending:defaultDrawingClass:", fixedPixelSizeScrollView, v6, objc_opt_class());
  tiledView = self->_tiledView;
  self->_tiledView = v36;

  -[PKTiledView setAttachmentContainerView:](self->_tiledView, "setAttachmentContainerView:", self->_rulerHostingDelegate);
  -[PKTiledView setDelegate:](self->_tiledView, "setDelegate:", self);
  -[PKTiledView setRulerHostingDelegate:](self->_tiledView, "setRulerHostingDelegate:", self);
  -[PKTiledView setMaximumSupportedContentVersion:](self->_tiledView, "setMaximumSupportedContentVersion:", self->__observers);
  if ((+[PKShapeDrawingController hasSnapToShapeEntitlement]() & 1) != 0)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bundleIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v40 & 1) != 0)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bundleIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "hasPrefix:", CFSTR("com.apple.sidecar.extension."));

  if ((v43 & 1) != 0)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bundleIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if ((v46 & 1) != 0)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bundleIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    if ((objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.TestApp")) & 1) != 0
      || (objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.ZoomTestApp")) & 1) != 0
      || (objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.PaperKitTestApp")) & 1) != 0)
    {
      goto LABEL_16;
    }
    v63 = objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.pencilkit.MultiDrawingCanvasTestApp"));

    if ((v63 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bundleIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.PaperKit.MarkupPhotoEditingExtension"));

  if ((v51 & 1) != 0)
  {
LABEL_18:
    -[PKTiledView setAllowSnapToShape:](self->_tiledView, "setAllowSnapToShape:", 1);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bundleIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.quicklook.extension.previewUI")))
  {

LABEL_16:
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bundleIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.quicklook.UIExtension"));

  if ((v65 & 1) != 0)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView setAllowSnapToShape:](self->_tiledView, "setAllowSnapToShape:", objc_msgSend(v62, "BOOLForKey:", CFSTR("internalSettings.shapeRecognition.enableEverywhere")));

LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bundleIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("com.apple.Pages"));

  if ((v56 & 1) == 0)
  {
    -[PKTiledView selectionInteraction](self->_tiledView, "selectionInteraction");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDelegate:", self);

  }
  if (v6)
  {
    -[PKTiledView canvasView](self->_tiledView, "canvasView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setOpaque:", 1);

    -[PKTiledView setCanvasViewZOrderPolicy:](self->_tiledView, "setCanvasViewZOrderPolicy:", 1);
  }
  -[PKTiledView setInsertSpaceEnabled:](self->_tiledView, "setInsertSpaceEnabled:", self->_fixedPixelSizeScrollView == 0);
  v59 = self->_fixedPixelSizeScrollView;
  v60 = self->_rulerHostingDelegate;
  if (v59)
  {
    -[UIScrollView insertSubview:atIndex:](v59, "insertSubview:atIndex:", v60, 0);
    v60 = self->_fixedPixelSizeScrollViewWrapper;
  }
  -[PKCanvasView insertSubview:atIndex:](self, "insertSubview:atIndex:", v60, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObserver:selector:name:object:", self, sel__drawingDidChange, CFSTR("drawingDidChange"), self->_pageView);

  -[PKCanvasView _setContentViewOpaqueBackgroundColorIfApplicable](self, "_setContentViewOpaqueBackgroundColorIfApplicable");
  -[PKTiledView _layoutSubviews](self->_tiledView, "_layoutSubviews");

}

- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion
{
  self->__observers = (NSHashTable *)maximumSupportedContentVersion;
  -[PKTiledView setMaximumSupportedContentVersion:](self->_tiledView, "setMaximumSupportedContentVersion:");
}

- (void)setOpaque:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCanvasView;
  -[PKCanvasView setOpaque:](&v4, sel_setOpaque_, a3);
  -[PKCanvasView _updateChildrenOpaque](self, "_updateChildrenOpaque");
}

- (void)_updateChildrenOpaque
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PKCanvasView backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *((_QWORD *)&v8 + 1) = unk_1BE4FE880;
    -[PKCanvasView backgroundColor](self, "backgroundColor", 0, 0, 0);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    DKUColorGetRGBAComponents((CGColor *)objc_msgSend(v4, "CGColor"), &v7);

    v5 = *((double *)&v8 + 1) >= 1.0;
  }
  else
  {
    v5 = -[PKCanvasView isOpaque](self, "isOpaque");
  }
  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOpaque:", v5);

  -[PKRulerHostingDelegate setOpaque:](self->_rulerHostingDelegate, "setOpaque:", v5);
  -[PKCanvasAttachmentView setOpaque:](self->_pageView, "setOpaque:", v5);
  if ((_DWORD)v5)
    -[PKCanvasView _setContentViewOpaqueBackgroundColorIfApplicable](self, "_setContentViewOpaqueBackgroundColorIfApplicable");
  else
    -[PKRulerHostingDelegate setBackgroundColor:](self->_rulerHostingDelegate, "setBackgroundColor:", 0);
}

- (void)_setContentViewOpaqueBackgroundColorIfApplicable
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[PKCanvasView isOpaque](self, "isOpaque"))
  {
    -[PKCanvasView backgroundColor](self, "backgroundColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[PKCanvasView traitCollection](self, "traitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceStyle") == 2)
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PKRulerHostingDelegate backgroundColor](self->_rulerHostingDelegate, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v9);

    if ((v5 & 1) == 0)
      -[PKRulerHostingDelegate setBackgroundColor:](self->_rulerHostingDelegate, "setBackgroundColor:", v9);
    -[PKCanvasView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColorWithTraitCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTiledView canvasView](self->_tiledView, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCanvasBackgroundColor:", v7);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  v4 = a3;
  -[PKCanvasView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[PKCanvasView _setChildrenBackgroundColor:](self, "_setChildrenBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)_setChildrenBackgroundColor:(id)a3
{
  PKTiledView *tiledView;
  id v5;
  void *v6;

  tiledView = self->_tiledView;
  v5 = a3;
  -[PKTiledView canvasView](tiledView, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanvasBackgroundColor:", v5);

  -[PKRulerHostingDelegate setBackgroundColor:](self->_rulerHostingDelegate, "setBackgroundColor:", v5);
  -[PKCanvasView _updateChildrenOpaque](self, "_updateChildrenOpaque");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCanvasView;
  v4 = a3;
  -[PKCanvasView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  -[PKCanvasView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PKCanvasView _setContentViewOpaqueBackgroundColorIfApplicable](self, "_setContentViewOpaqueBackgroundColorIfApplicable");
}

- (void)setDelegate:(id)delegate
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char v20;
  int v21;
  PKCanvasView *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKCanvasView;
  v4 = delegate;
  -[PKCanvasView setDelegate:](&v23, sel_setDelegate_, v4);
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFD | v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 4;
  else
    v6 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFB | v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 8;
  else
    v7 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFF7 | v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 16;
  else
    v8 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFEF | v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 32;
  else
    v9 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFDF | v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 64;
  else
    v10 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFBF | v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 256;
  else
    v11 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFEFF | v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 512;
  else
    v12 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFDFF | v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = 1024;
  else
    v13 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFBFF | v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 4096;
  else
    v14 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFEFFF | v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = 0x2000;
  else
    v15 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFDFFF | v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = 2048;
  else
    v16 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFF7FF | v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = 0x4000;
  else
    v17 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFBFFF | v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = 0x8000;
  else
    v18 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFF7FFF | v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = 0x10000;
  else
    v19 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFEFFFF | v19);
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
    v21 = 0x20000;
  else
    v21 = 0;
  self->_canvasViewFlags = ($8446B240C960A07126890D1ABD60E262)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFDFFFF | v21);
  -[PKTiledView rulerHostingDelegate](self->_tiledView, "rulerHostingDelegate", v23.receiver, v23.super_class);
  v22 = (PKCanvasView *)objc_claimAutoreleasedReturnValue();

  if (v22 == self)
    -[PKTiledView setRulerHostingDelegate:](self->_tiledView, "setRulerHostingDelegate:", self);
}

- (id)_getDelegateZoomView
{
  return self->_rulerHostingDelegate;
}

- (void)setMaximumZoomScale:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCanvasView;
  -[PKCanvasView setMaximumZoomScale:](&v3, sel_setMaximumZoomScale_, fmin(a3, 10.0));
}

- (void)_fullyRendered
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[PKCanvasAttachmentView _wantsFullyRenderedNotification](self->_pageView, "_wantsFullyRenderedNotification"))
  {
    if ((*(_BYTE *)&self->_canvasViewFlags & 2) != 0)
    {
      -[PKCanvasView delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "canvasViewDidFinishRendering:", self);

    }
    -[PKCanvasAttachmentView set_wantsFullyRenderedNotification:](self->_pageView, "set_wantsFullyRenderedNotification:", 0);
  }
  -[PKCanvasAttachmentView fullyRenderedCompletionBlocks](self->_pageView, "fullyRenderedCompletionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKCanvasAttachmentView fullyRenderedCompletionBlocks](self->_pageView, "fullyRenderedCompletionBlocks", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[PKCanvasAttachmentView fullyRenderedCompletionBlocks](self->_pageView, "fullyRenderedCompletionBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

  }
}

- (void)_drawingDidChange
{
  void *v3;
  char v4;
  id v5;

  if ((*(_BYTE *)&self->_canvasViewFlags & 1) != 0)
  {
    -[PKAttachmentView drawing](self->_pageView, "drawing");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsInternalStrokes");

    if ((v4 & 1) == 0)
    {
      -[PKCanvasView delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "canvasViewDrawingDidChange:", self);

    }
  }
}

- (PKDrawing)drawing
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[PKAttachmentView drawing](self->_pageView, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsInternalStrokes");

  -[PKAttachmentView drawing](self->_pageView, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "copyWithoutInternalStrokes");
  else
    v7 = objc_msgSend(v5, "copy");
  v8 = (void *)v7;

  return (PKDrawing *)v8;
}

- (void)setDrawing:(PKDrawing *)drawing
{
  void *v4;
  uint64_t v5;
  PKDrawing *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKDrawing *v11;

  v11 = drawing;
  if (-[PKTiledView disableTileRendering](self->_tiledView, "disableTileRendering")
    && (-[PKDrawing strokes](v11, "strokes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        !v5))
  {
    -[PKAttachmentView drawing](self->_pageView, "drawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAttachmentView drawing](self->_pageView, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "strokes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteStrokes:", v10);

  }
  else
  {
    v6 = v11;
    if (!v11)
      v6 = (PKDrawing *)objc_alloc_init((Class)objc_opt_class());
    v11 = v6;
    -[PKTiledView _resetDrawingState](self->_tiledView, "_resetDrawingState");
    -[PKCanvasView layoutIfNeeded](self, "layoutIfNeeded");
    v7 = (void *)-[PKDrawing copy](v11, "copy");
    -[PKAttachmentView setDrawing:](self->_pageView, "setDrawing:", v7);

    if ((*(_BYTE *)&self->_canvasViewFlags & 2) != 0)
      -[PKCanvasAttachmentView set_wantsFullyRenderedNotification:](self->_pageView, "set_wantsFullyRenderedNotification:", 1);
    -[PKTiledView _layoutSubviews](self->_tiledView, "_layoutSubviews");
    -[PKTiledView updateTilesForVisibleRect](self->_tiledView, "updateTilesForVisibleRect");
  }

}

- (PKInk)ink
{
  return -[PKTiledView ink](self->_tiledView, "ink");
}

- (void)setInk:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.pen"), v5, -1.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
  }
  v7 = v4;
  -[PKTiledView setInk:](self->_tiledView, "setInk:", v4);

}

- (PKTool)tool
{
  PKTool *tool;
  PKTool *v3;
  void *v4;

  tool = self->_tool;
  if (tool)
  {
    v3 = tool;
  }
  else
  {
    -[PKTiledView ink](self->_tiledView, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKTool _toolWithInk:](PKTool, "_toolWithInk:", v4);
    v3 = (PKTool *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setTool:(PKTool *)tool
{
  PKTool *v5;
  void *v6;
  id v7;
  PKTool *v8;

  v8 = tool;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can not use PKCustomTool with PKCanvasView."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v5 = v8;
  if (v8)
  {
    -[PKTool ink](v8, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView setInk:](self->_tiledView, "setInk:", v6);

    objc_storeStrong((id *)&self->_tool, tool);
    v5 = v8;
  }

}

- (void)setRulerActive:(BOOL)rulerActive
{
  -[PKTiledView setRulerEnabled:](self->_tiledView, "setRulerEnabled:", rulerActive);
}

- (BOOL)isRulerActive
{
  return -[PKTiledView rulerEnabled](self->_tiledView, "rulerEnabled");
}

- (void)updateSubviewsForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_fixedPixelSizeScrollView)
  {
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    -[PKCanvasView contentSize](self, "contentSize");
    if (v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[PKTiledView setFrame:](self->_tiledView, "setFrame:", x, y, width, height);
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[PKRulerHostingDelegate frame](self->_rulerHostingDelegate, "frame");
      v14.origin.x = v11;
      v14.origin.y = v12;
      v14.size.width = width;
      v14.size.height = height;
      if (!CGRectEqualToRect(v13, v14))
      {
        -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:", v11, v12, width, height);
        -[PKAttachmentView setFrame:](self->_pageView, "setFrame:", v11, v12, width, height);
        -[PKTiledView _layoutSubviews](self->_tiledView, "_layoutSubviews");
        -[PKTiledView updateTilesForVisibleRect](self->_tiledView, "updateTilesForVisibleRect");
      }
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  -[PKCanvasView layoutSubviews](&v5, sel_layoutSubviews);
  -[PKCanvasView bounds](self, "bounds");
  -[PKCanvasView updateSubviewsForBounds:](self, "updateSubviewsForBounds:");
  -[PKCanvasView _setContentViewOpaqueBackgroundColorIfApplicable](self, "_setContentViewOpaqueBackgroundColorIfApplicable");
  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rulerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerController ensureRulerIsFullyOnscreen]((uint64_t)v4);

}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PKCanvasView;
  -[PKCanvasView setContentSize:](&v13, sel_setContentSize_);
  -[PKCanvasAttachmentView frame](self->_pageView, "frame");
  if (fabs(v9) >= 0.01 || fabs(v6) >= 0.01 || vabdd_f64(v7, width) >= 0.01 || vabdd_f64(v8, height) >= 0.01)
  {
    -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:", 0.0, 0.0, width, height);
    -[PKCanvasView zoomScale](self, "zoomScale");
    v11 = width / v10;
    -[PKCanvasView zoomScale](self, "zoomScale");
    -[PKAttachmentView setFrame:](self->_pageView, "setFrame:", 0.0, 0.0, v11, height / v12);
  }
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  void *v2;
  void *v3;

  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (BOOL)isDrawingEnabled
{
  return -[PKTiledView _isDrawingEnabled](self->_tiledView, "_isDrawingEnabled");
}

- (void)setDrawingEnabled:(BOOL)a3
{
  -[PKTiledView _setDrawingEnabled:](self->_tiledView, "_setDrawingEnabled:", a3);
}

- (BOOL)allowsFingerDrawing
{
  return -[PKTiledView allowsFingerDrawing](self->_tiledView, "allowsFingerDrawing");
}

- (void)setAllowsFingerDrawing:(BOOL)allowsFingerDrawing
{
  uint64_t v3;

  if (allowsFingerDrawing)
    v3 = 1;
  else
    v3 = 2;
  -[PKTiledView setDrawingPolicy:](self->_tiledView, "setDrawingPolicy:", v3);
}

- (PKCanvasViewDrawingPolicy)drawingPolicy
{
  return -[PKTiledView drawingPolicy](self->_tiledView, "drawingPolicy");
}

- (void)setDrawingPolicy:(PKCanvasViewDrawingPolicy)drawingPolicy
{
  -[PKTiledView setDrawingPolicy:](self->_tiledView, "setDrawingPolicy:", drawingPolicy);
}

- (id)_currentStroke
{
  return -[PKTiledView _currentStroke](self->_tiledView, "_currentStroke");
}

- (int64_t)_maxFileFormatVersion
{
  return -[PKTiledView _maxFileFormatVersion](self->_tiledView, "_maxFileFormatVersion");
}

- (void)set_maxFileFormatVersion:(int64_t)a3
{
  -[PKTiledView set_maxFileFormatVersion:](self->_tiledView, "set_maxFileFormatVersion:", a3);
}

- (PKTiledView)_tiledView
{
  return self->_tiledView;
}

- (void)_setDisableTileRendering:(BOOL)a3
{
  -[PKTiledView setDisableTileRendering:](self->_tiledView, "setDisableTileRendering:", a3);
}

- (BOOL)_disableTileRendering
{
  return -[PKTiledView disableTileRendering](self->_tiledView, "disableTileRendering");
}

- (void)_setContentCoordinateSpace:(id)a3
{
  -[PKTiledView setContentCoordinateSpace:](self->_tiledView, "setContentCoordinateSpace:", a3);
}

- (UICoordinateSpace)_contentCoordinateSpace
{
  return -[PKTiledView contentCoordinateSpace](self->_tiledView, "contentCoordinateSpace");
}

- (void)_setDrawBitmapEraserMask:(BOOL)a3
{
  -[PKTiledView setDrawBitmapEraserMask:](self->_tiledView, "setDrawBitmapEraserMask:", a3);
}

- (BOOL)_drawBitmapEraserMask
{
  return -[PKTiledView drawBitmapEraserMask](self->_tiledView, "drawBitmapEraserMask");
}

- (void)_setCombiningStrokesEnabled:(BOOL)a3
{
  -[PKTiledView setCombiningStrokesEnabled:](self->_tiledView, "setCombiningStrokesEnabled:", a3);
}

- (BOOL)_combiningStrokesEnabled
{
  return -[PKTiledView combiningStrokesEnabled](self->_tiledView, "combiningStrokesEnabled");
}

- (void)performUndo:(id)a3
{
  -[PKTiledView performUndo:](self->_tiledView, "performUndo:", a3);
}

- (id)drawingUndoTarget
{
  return -[PKTiledView drawingUndoTarget](self->_tiledView, "drawingUndoTarget");
}

- (void)setDrawingUndoTarget:(id)a3
{
  -[PKTiledView setDrawingUndoTarget:](self->_tiledView, "setDrawingUndoTarget:", a3);
}

- (SEL)drawingUndoSelector
{
  return -[PKTiledView drawingUndoSelector](self->_tiledView, "drawingUndoSelector");
}

- (void)setDrawingUndoSelector:(SEL)a3
{
  -[PKTiledView setDrawingUndoSelector:](self->_tiledView, "setDrawingUndoSelector:", a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  char v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (sel_paste_ != a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("com.apple.drawing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "containsPasteboardTypes:", v6);

  return v4;
}

- (void)paste:(id)a3
{
  -[PKTiledView paste:](self->_tiledView, "paste:", a3);
}

- (void)set_disableUndoManager:(BOOL)a3
{
  -[PKTiledView setDisableUndoManager:](self->_tiledView, "setDisableUndoManager:", a3);
}

- (BOOL)_disableUndoManager
{
  return -[PKTiledView disableUndoManager](self->_tiledView, "disableUndoManager");
}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "selectedToolItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_toolShouldBeSetOnCanvasView");
  if ((_DWORD)v5)
  {
    objc_msgSend(v8, "selectedToolItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCanvasView setTool:](self, "setTool:", v7);

  }
  -[PKCanvasView setDrawingEnabled:](self, "setDrawingEnabled:", v5);

}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  -[PKCanvasView setRulerActive:](self, "setRulerActive:", objc_msgSend(a3, "isRulerActive"));
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  -[PKCanvasView _setSelectedStrokesColor:](self, "_setSelectedStrokesColor:", a4);
}

- (PKCanvasView)initWithFrame:(CGRect)a3 fixedPixelSize:(CGSize)a4 drawingScale:(double)a5 layerFixedPixelSize:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  PKCanvasView *v19;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a5 == 0.0)
    v14 = 1.0;
  else
    v14 = a5;
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  if (v6)
  {
    +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", 0.0, 0.0, width / v16, height / v16);
    objc_msgSend(v17, "setScrollEnabled:", 0);
    objc_msgSend(v17, "setDelaysContentTouches:", 0);
    objc_msgSend(v17, "setCanCancelContentTouches:", 0);
    objc_msgSend(v17, "setMinimumZoomScale:", 1.0);
    objc_msgSend(v17, "setMaximumZoomScale:", 1.0);
    v18 = width / v14;
  }
  else
  {
    v17 = 0;
    v18 = v10 / v14 * v15;
  }
  v19 = -[PKCanvasView initWithFrame:drawingWidth:fixedPixelSizeScrollView:](self, "initWithFrame:drawingWidth:fixedPixelSizeScrollView:", v17, x, y, v10, v9, v18);
  -[PKCanvasView setScrollEnabled:](v19, "setScrollEnabled:", 0);
  -[PKCanvasView setDelaysContentTouches:](v19, "setDelaysContentTouches:", 0);
  -[PKCanvasView setCanCancelContentTouches:](v19, "setCanCancelContentTouches:", 0);
  -[PKCanvasView setMinimumZoomScale:](v19, "setMinimumZoomScale:", 1.0);
  -[PKCanvasView setMaximumZoomScale:](v19, "setMaximumZoomScale:", 1.0);

  return v19;
}

- (void)_setDrawing:(id)a3 fullyRenderedCompletionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PKCanvasAttachmentView fullyRenderedCompletionBlocks](self->_pageView, "fullyRenderedCompletionBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCanvasAttachmentView setFullyRenderedCompletionBlocks:](self->_pageView, "setFullyRenderedCompletionBlocks:", v10);

    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    -[PKCanvasAttachmentView fullyRenderedCompletionBlocks](self->_pageView, "fullyRenderedCompletionBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(v6);
    objc_msgSend(v8, "addObject:", v9);

  }
LABEL_4:
  -[PKCanvasView setDrawing:](self, "setDrawing:", v11);

}

- (void)_setDrawing:(id)a3 alreadyRenderedDrawing:(id)a4 imageForAlreadyRenderedDrawing:(id)a5 fullyRenderedCompletionBlock:(id)a6
{
  -[PKCanvasView _setDrawing:fullyRenderedCompletionBlock:](self, "_setDrawing:fullyRenderedCompletionBlock:", a3, a6, a5);
}

- (void)imageWithCompletionBlock:(id)a3
{
  id v4;
  PKCanvasView *fixedPixelSizeScrollView;
  double v6;
  double v7;
  double v8;
  double v9;
  PKImageRenderer *v10;
  double v11;
  PKImageRenderer *v12;
  void *v13;
  PKCanvasAttachmentView *pageView;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = a3;
  if (self->_fixedPixelSizeScrollView)
    fixedPixelSizeScrollView = (PKCanvasView *)self->_fixedPixelSizeScrollView;
  else
    fixedPixelSizeScrollView = self;
  -[PKCanvasView bounds](fixedPixelSizeScrollView, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = [PKImageRenderer alloc];
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  v12 = -[PKImageRenderer initWithSize:scale:](v10, "initWithSize:scale:", v7, v9, v11);
  -[PKCanvasView drawing](self, "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  pageView = self->_pageView;
  if (pageView)
  {
    -[PKCanvasAttachmentView drawingTransform](pageView, "drawingTransform");
    v15 = *((double *)&v25 + 1);
    v16 = *(double *)&v25;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    v15 = 0.0;
    v16 = 0.0;
  }
  v17 = sqrt(v15 * v15 + v16 * v16);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __41__PKCanvasView_imageWithCompletionBlock___block_invoke;
  v23[3] = &unk_1E777D0B0;
  v24 = v4;
  v18 = *MEMORY[0x1E0C9D628];
  v19 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v22 = v4;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v12, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v13, v23, v18, v19, v20, v21, v17);

}

uint64_t __41__PKCanvasView_imageWithCompletionBlock___block_invoke(uint64_t a1, id a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(objc_retainAutorelease(a2), "CGImage"));
}

- (UIView)rulerView
{
  return (UIView *)-[PKTiledView rulerView](self->_tiledView, "rulerView");
}

- (id)rulerHostingView
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  PKTiledView *v8;
  void *v9;

  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 0x40) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_canvasViewRulerHostingView:", self);
    v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_5;
    v4 = (void *)v3;
    -[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0
      || (-[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "rulerHostingView"),
          v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
LABEL_5:
      v8 = self->_tiledView;
    }
  }
  return v8;
}

- (BOOL)rulerHostWantsSharedRuler
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[PKCanvasView rulerHostingDelegate](self, "rulerHostingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rulerHostWantsSharedRuler");

  return v8;
}

- (UIView)selectionView
{
  _QWORD *v2;
  void *v3;
  UIView *v4;

  -[PKTiledView selectionController](self->_tiledView, "selectionController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[18];
  v4 = v2;

  return v4;
}

- (BOOL)_hasSelection
{
  return -[PKTiledView _hasSelection](self->_tiledView, "_hasSelection");
}

- (void)commitSelectionIfNecessaryWithCompletion:(id)a3
{
  -[PKTiledView commitSelectionIfNecessaryWithCompletion:](self->_tiledView, "commitSelectionIfNecessaryWithCompletion:", a3);
}

- (void)_setSelectedStrokesColor:(id)a3
{
  -[PKTiledView setSelectedStrokesColor:](self->_tiledView, "setSelectedStrokesColor:", a3);
}

- (id)_selectionController
{
  return -[PKTiledView selectionController](self->_tiledView, "selectionController");
}

- (void)_flushCaches
{
  -[PKTiledView _flushCaches](self->_tiledView, "_flushCaches");
}

- (CGSize)_metalViewDrawableSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_metalViewDrawableSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_rendererControllerPixelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rendererControllerPixelSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateCanvas
{
  -[PKTiledView _layoutSubviews](self->_tiledView, "_layoutSubviews");
  -[PKTiledView updateTilesForVisibleRect](self->_tiledView, "updateTilesForVisibleRect");
}

- (CGSize)_fixedPixelSize
{
  void *fixedPixelSizeScrollView;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (self->_fixedPixelSizeScrollView)
    fixedPixelSizeScrollView = self->_fixedPixelSizeScrollView;
  else
    fixedPixelSizeScrollView = self->_rulerHostingDelegate;
  objc_msgSend(fixedPixelSizeScrollView, "bounds");
  v4 = v3;
  v6 = v5;
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  v8 = v4 * v7;
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  v10 = v6 * v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)updateFixedPixelSizeViewForBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  UIView *fixedPixelSizeScrollViewWrapper;
  __int128 v11;
  UIView *v12;
  objc_super v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  _OWORD v16[3];

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3.origin.x, a3.origin.y);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
  v7 = width / v6;
  -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
  v9 = height / v8;
  -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
  -[PKAttachmentView setFrame:](self->_pageView, "setFrame:");
  -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
  -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:");
  fixedPixelSizeScrollViewWrapper = self->_fixedPixelSizeScrollViewWrapper;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v11;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](fixedPixelSizeScrollViewWrapper, "setTransform:", v16);
  -[UIScrollView bounds](self->_fixedPixelSizeScrollView, "bounds");
  -[UIView setFrame:](self->_fixedPixelSizeScrollViewWrapper, "setFrame:");
  CGAffineTransformMakeScale(&v15, v7, v9);
  v12 = self->_fixedPixelSizeScrollViewWrapper;
  v14 = v15;
  -[UIView setTransform:](v12, "setTransform:", &v14);
  v13.receiver = self;
  v13.super_class = (Class)PKCanvasView;
  -[PKCanvasView setContentSize:](&v13, sel_setContentSize_, width, height);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_setFixedPixelSize:(CGSize)a3 drawingScale:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_fixedPixelSizeScrollView)
  {
    height = a3.height;
    width = a3.width;
    +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
    -[UIScrollView setFrame:](self->_fixedPixelSizeScrollView, "setFrame:", 0.0, 0.0, width / v8, height / v8);
    -[PKCanvasView bounds](self, "bounds");
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:");
  }
  -[PKRulerHostingDelegate bounds](self->_rulerHostingDelegate, "bounds", a3.width, a3.height);
  v10 = v9 / a4;
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  -[PKCanvasAttachmentView setDrawingWidth:](self->_pageView, "setDrawingWidth:", v11 * v10);
}

- (CGAffineTransform)strokeTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (CGAffineTransform)drawingTransform
{
  uint64_t v4;
  __int128 v5;
  CGAffineTransform *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat d;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;

  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  if (*(_QWORD *)&self[43].tx)
  {
    v6 = self;
    -[CGAffineTransform bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)&v6[43].tx, "bounds");
    v12 = v11;
    v14 = v13;
    memset(&v18, 0, sizeof(v18));
    d = v6[43].d;
    if (d != 0.0)
      objc_msgSend(*(id *)&d, "drawingTransform");
    CGAffineTransformMakeScale(&t1, v8 / v12, v10 / v14);
    v16 = v18;
    return CGAffineTransformConcat(retstr, &t1, &v16);
  }
  return self;
}

- (UIHoverGestureRecognizer)_hoverGestureRecognizer
{
  void *v2;
  void *v3;

  -[PKCanvasView _tiledView](self, "_tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hoverGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIHoverGestureRecognizer *)v3;
}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 0x20) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_canvasViewWillBeginDrawing:", self);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKCanvasView _observers](self, "_observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_canvasViewWillBeginDrawing:", self);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_canvasViewWillCreateSnapshot:(id)a3
{
  id v4;

  if ((*((_BYTE *)&self->_canvasViewFlags + 2) & 1) != 0)
  {
    -[PKCanvasView delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_canvasViewWillCreateSnapshot:", self);

  }
}

- (BOOL)_canvasViewSnapshottingDisabled:(id)a3
{
  PKCanvasView *v4;
  void *v5;

  if ((*((_BYTE *)&self->_canvasViewFlags + 2) & 2) == 0)
    return 0;
  v4 = self;
  -[PKCanvasView delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "_canvasViewSnapshottingDisabled:", v4);

  return (char)v4;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  $8446B240C960A07126890D1ABD60E262 canvasViewFlags;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  canvasViewFlags = self->_canvasViewFlags;
  if ((*(_BYTE *)&canvasViewFlags & 4) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasViewDidBeginDrawing:", self);

    canvasViewFlags = self->_canvasViewFlags;
  }
  if ((*(_BYTE *)&canvasViewFlags & 0x10) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canvasViewDidBeginUsingTool:", self);

  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  $8446B240C960A07126890D1ABD60E262 canvasViewFlags;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  canvasViewFlags = self->_canvasViewFlags;
  if ((*(_BYTE *)&canvasViewFlags & 8) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasViewDidEndDrawing:", self);

    canvasViewFlags = self->_canvasViewFlags;
  }
  if ((*(_BYTE *)&canvasViewFlags & 0x20) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canvasViewDidEndUsingTool:", self);

  }
}

- (void)canvasViewDidBeginLasso:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_canvasViewFlags & 0x10) != 0)
  {
    -[PKCanvasView delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canvasViewDidBeginUsingTool:", self);

  }
}

- (void)canvasViewDidEndLasso:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_canvasViewFlags & 0x20) != 0)
  {
    -[PKCanvasView delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canvasViewDidEndUsingTool:", self);

  }
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  id v5;
  id v6;

  if ((*(_BYTE *)&self->_canvasViewFlags & 0x40) != 0)
  {
    v5 = a4;
    -[PKCanvasView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_canvasView:beganStroke:", self, v5);

  }
}

- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  id v8;
  id v9;
  $8446B240C960A07126890D1ABD60E262 canvasViewFlags;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  canvasViewFlags = self->_canvasViewFlags;
  if ((*(_WORD *)&canvasViewFlags & 0x200) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_canvasView:endedStroke:shapeStrokes:", self, v8, v9);
    goto LABEL_5;
  }
  if ((*(_WORD *)&canvasViewFlags & 0x100) != 0)
  {
    -[PKCanvasView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_canvasView:endedStroke:", self, v8);
LABEL_5:

  }
}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  id v5;
  id v6;

  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 4) != 0)
  {
    v5 = a4;
    -[PKCanvasView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_canvasView:cancelledStroke:", self, v5);

  }
}

- (void)canvasView:(id)a3 didChangeHiddenState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 0x10) != 0)
  {
    v4 = a4;
    -[PKCanvasView delegate](self, "delegate", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_canvasView:didChangeHiddenState:", self, v4);

  }
}

- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5;
  char v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v5 = a4;
  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 8) != 0)
  {
    -[PKCanvasView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v7);

    if (v8)
    {
      -[PKCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allowedTouchTypes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCanvasView _allowedDrawingTouchTypes](self, "_allowedDrawingTouchTypes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToArray:", v11);

      if ((v12 & 1) == 0)
      {
        v13 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Received an unexpected touch type according to the current drawing policy.", v19, 2u);
        }

        -[PKCanvasView _allowedDrawingTouchTypes](self, "_allowedDrawingTouchTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAllowedTouchTypes:", v14);

      }
    }
    objc_msgSend(v5, "locationInView:", self);
    -[PKCanvasView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PKCanvasView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v17, "_canvasView:shouldBeginDrawingWithTouch:", self, v5);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4
{
  PKCanvasView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if ((*((_BYTE *)&self->_canvasViewFlags + 1) & 0x80) == 0)
    return 1;
  v5 = self;
  -[PKTiledView convertPoint:toView:](self->_tiledView, "convertPoint:toView:", self, a4.x, a4.y);
  v7 = v6;
  v9 = v8;
  -[PKCanvasView delegate](v5, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "_canvasView:hoverShouldBeActiveAt:", v5, v7, v9);

  return (char)v5;
}

- (id)_allowedDrawingTouchTypes
{
  if (-[PKTiledView allowsFingerDrawing](self->_tiledView, "allowsFingerDrawing"))
    return &unk_1E77ECE68;
  else
    return &unk_1E77ECE80;
}

- (CGPoint)rulerSnapLineOriginAndNormal:(CGPoint *)a3 topSide:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGPoint result;

  v4 = a4;
  -[PKCanvasView _tiledView](self, "_tiledView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rulerEnabled");

  if ((v8 & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    -[PKCanvasView _tiledView](self, "_tiledView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "rulerTransform");
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
    }

    -[PKCanvasView _tiledView](self, "_tiledView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rulerWidth");
    v15 = v14;

    if (v4)
      v16 = v15 * 0.5;
    else
      v16 = -(v15 * 0.5);
    v17 = v16 * *(double *)&v25 + *(double *)&v24 * -100.0;
    v18 = v16 * *((double *)&v25 + 1) + *((double *)&v24 + 1) * -100.0;
    if (a3)
    {
      v19 = v16 + v16;
      v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v21 = *(double *)&v26
          + v19 * *(double *)&v25
          + *(double *)&v24 * 0.0
          - (*(double *)&v26
           + *(double *)&v25 * v20
           + *(double *)&v24 * *MEMORY[0x1E0C9D538]);
      v22 = *((double *)&v26 + 1)
          + v19 * *((double *)&v25 + 1)
          + *((double *)&v24 + 1) * 0.0
          - (*((double *)&v26 + 1)
           + *((double *)&v25 + 1) * v20
           + *((double *)&v24 + 1) * *MEMORY[0x1E0C9D538]);
      v23 = 1.0 / sqrt(v22 * v22 + v21 * v21);
      a3->x = v21 * v23;
      a3->y = v22 * v23;
    }
    v11 = *(double *)&v26 + v17;
    v12 = *((double *)&v26 + 1) + v18;
  }
  else
  {
    if (a3)
    {
      a3->x = 0.0;
      a3->y = 0.0;
    }
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setRulerEnabled:(BOOL)a3
{
  -[PKTiledView setRulerEnabled:](self->_tiledView, "setRulerEnabled:", a3);
}

- (BOOL)rulerEnabled
{
  return -[PKTiledView rulerEnabled](self->_tiledView, "rulerEnabled");
}

- (void)setRulerHostingDelegate:(id)a3
{
  CGAffineTransform *p_drawingTransform;
  PKCanvasView *v5;
  PKCanvasView *v6;

  p_drawingTransform = &self->_drawingTransform;
  v6 = (PKCanvasView *)a3;
  objc_storeWeak((id *)p_drawingTransform, v6);
  if (v6)
    v5 = v6;
  else
    v5 = self;
  -[PKTiledView setRulerHostingDelegate:](self->_tiledView, "setRulerHostingDelegate:", v5);

}

- (void)setPredictionDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredictionDisabled:", v3);

}

- (BOOL)predictionDisabled
{
  void *v2;
  char v3;

  -[PKTiledView canvasView](self->_tiledView, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionDisabled");

  return v3;
}

- (double)_latestLatency
{
  double result;

  -[PKTiledView _latestLatency](self->_tiledView, "_latestLatency");
  return result;
}

- (id)_adornmentViewsToHitTest
{
  return -[PKTiledView _adornmentViewsToHitTest](self->_tiledView, "_adornmentViewsToHitTest");
}

- (id)_selectionInteraction
{
  id *v2;
  void *v3;

  -[PKTiledView selectionController](self->_tiledView, "selectionController");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectionInteraction](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsCopyAsText
{
  return -[PKTiledView supportsCopyAsText](self->_tiledView, "supportsCopyAsText");
}

- (void)setSupportsCopyAsText:(BOOL)a3
{
  -[PKTiledView setSupportsCopyAsText:](self->_tiledView, "setSupportsCopyAsText:", a3);
}

- (NSHashTable)_observers
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }
  return (NSHashTable *)contentView;
}

- (void)_addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKCanvasView _observers](self, "_observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKCanvasView _observers](self, "_observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)_hasObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKCanvasView _observers](self, "_observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_keepPencilShadowVisible
{
  id v2;

  -[PKCanvasView _tiledView](self, "_tiledView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keepPencilShadowVisible");

}

- (void)_updatePencilShadowViewWithInputPoint:(id *)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  -[PKCanvasView _tiledView](self, "_tiledView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v5;
  v6 = *(_OWORD *)&a3->var13;
  v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = v6;
  v7 = *(_OWORD *)&a3->var1;
  v9[0] = a3->var0;
  v9[1] = v7;
  v8 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v8;
  objc_msgSend(v4, "_updatePencilShadowView:", v9);

}

- (PKContentVersion)maximumSupportedContentVersion
{
  return (PKContentVersion)self->__observers;
}

- (void)set_observers:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)contentView
{
  return (UIView *)self->_rulerHostingDelegate;
}

- (BOOL)disableWideGamut
{
  return self->_maximumSupportedContentVersion;
}

- (void)setDisableWideGamut:(BOOL)a3
{
  LOBYTE(self->_maximumSupportedContentVersion) = a3;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  return (PKRulerHostingDelegate *)objc_loadWeakRetained((id *)&self->_drawingTransform);
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.b = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.d = v4;
  *(_OWORD *)&self->_drawingTransform.ty = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingTransform);
  objc_storeStrong((id *)&self->_rulerHostingDelegate, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_fixedPixelSizeScrollViewWrapper, 0);
  objc_storeStrong((id *)&self->_fixedPixelSizeScrollView, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_tool, 0);
  objc_storeStrong((id *)&self->_tiledView, 0);
}

@end
