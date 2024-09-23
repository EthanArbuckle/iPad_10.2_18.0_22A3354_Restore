@implementation AKInkOverlayView

+ (id)newAKInkOverlayViewForCurrentPlatformWithPageController:(id)a3 drawingUndoTarget:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPageController:drawingUndoTarget:", v6, v5);

  return v7;
}

+ (id)newDrawingUndoTargetWithPageController:(id)a3
{
  id v3;
  _AKInkOverlayDrawingUndoTarget *v4;

  v3 = a3;
  v4 = -[_AKInkOverlayDrawingUndoTarget initWithPageController:]([_AKInkOverlayDrawingUndoTarget alloc], "initWithPageController:", v3);

  return v4;
}

- (AKInkOverlayView)initWithPageController:(id)a3 drawingUndoTarget:(id)a4
{
  id v6;
  id v7;
  AKInkOverlayView *v8;
  AKInkOverlayView *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[AKInkOverlayView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    -[AKInkOverlayView setPageController:](v8, "setPageController:", v6);
    -[AKInkOverlayView setDrawingUndoTarget:](v9, "setDrawingUndoTarget:", v7);
    -[AKInkOverlayView commonPostInit](v9, "commonPostInit");
  }

  return v9;
}

- (AKInkOverlayView)initWithFrame:(CGRect)a3
{
  AKInkOverlayView *v3;
  AKInkOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKInkOverlayView;
  v3 = -[AKInkOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKInkOverlayView commonInit](v3, "commonInit");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKInkOverlayView;
  -[AKInkOverlayView awakeFromNib](&v3, sel_awakeFromNib);
  -[AKInkOverlayView commonInit](self, "commonInit");
}

- (void)commonInit
{
  NSHashTable *v3;
  NSHashTable *reportedStrokes;
  CGSize v5;

  v3 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 10);
  reportedStrokes = self->_reportedStrokes;
  self->_reportedStrokes = v3;

  v5 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_previousPageRectInAKModel.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_previousPageRectInAKModel.size = v5;
}

- (void)commonPostInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  -[AKInkOverlayView pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12
    || (objc_msgSend(v12, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7 = v12,
        !v6))
  {
    NSLog(CFSTR("%s: Invalid initial ink! Please fix this."), "-[AKInkOverlayView commonPostInit]");
    v8 = (void *)MEMORY[0x24BDE33B0];
    v9 = *MEMORY[0x24BDE3438];
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inkWithIdentifier:color:weight:", v9, v10, 0.0);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  v13 = v7;
  -[AKInkOverlayView setInk:](self, "setInk:", v7);

}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AKInkOverlayView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[AKInkOverlayView canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[AKInkOverlayView setCanvasView:](self, "setCanvasView:", 0);
  -[AKInkOverlayView setDelegate:](self, "setDelegate:", 0);
}

- (PKInk)ink
{
  return self->_ink;
}

- (void)setInk:(id)a3
{
  PKInk **p_ink;
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  p_ink = &self->_ink;
  v10 = a3;
  if ((objc_msgSend(v10, "isEqual:", *p_ink) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ink, a3);
    -[AKInkOverlayView _updateCanvasViewInk](self, "_updateCanvasViewInk");
  }
  v6 = -[PKInk _isLassoInk](*p_ink, "_isLassoInk");
  v7 = v10;
  if (v6)
  {
    v8 = objc_msgSend(v10, "_isLassoInk");
    v7 = v10;
    if (v8)
    {
      objc_msgSend(v10, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKInkOverlayView _updatedSelectedStrokesWithColor:](self, "_updatedSelectedStrokesWithColor:", v9);

      v7 = v10;
    }
  }

}

- (void)_updateCanvasViewInk
{
  void *v3;
  void *v4;
  id v5;

  -[AKInkOverlayView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKInkOverlayView ink](self, "ink");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AKInkOverlayView canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInk:", v5);

  }
}

- (void)_updatedSelectedStrokesWithColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AKInkOverlayView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKInkOverlayView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setSelectedStrokesColor:", v6);

  }
}

- (void)removeStrokesFromDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[AKInkOverlayView canvasView](self, "canvasView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "minusOrderedSet:", v4);
  v8 = objc_alloc(MEMORY[0x24BDE3380]);
  v9 = (void *)objc_msgSend(v7, "copy");
  -[AKInkOverlayView canvasView](self, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithStrokes:fromDrawing:", v9, v11);
  objc_msgSend(v13, "setDrawing:", v12);

}

- (void)willMoveToSuperview:(id)a3
{
  void *v4;
  id v5;

  -[AKInkOverlayView canvasView](self, "canvasView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setDelegate:", 0);
    objc_msgSend(v5, "setDrawingUndoTarget:", 0);
    -[AKInkOverlayView setCanvasView:](self, "setCanvasView:", 0);
    v4 = v5;
  }

}

- (void)didMoveToSuperview
{
  void *v3;

  -[AKInkOverlayView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKInkOverlayView bounds](self, "bounds");
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
      MEMORY[0x24BEDD108](self, sel_setupInkView);
  }
}

- (void)setupInkView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  double v35;
  __int128 v36;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKInkOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v36 = *MEMORY[0x24BDBF148];
  v35 = 1.0;
  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v3))
  {
    __asm { FMOV            V0.2D, #5.0 }
    v36 = _Q0;
    v6 = 0.0;
    v10 = 5.0;
    v8 = 5.0;
    v4 = 0.0;
  }
  else
  {
    -[AKInkOverlayView _calculateFixedPixelSize:drawingScale:](self, "_calculateFixedPixelSize:drawingScale:", &v36, &v35);
  }
  v16 = objc_alloc(MEMORY[0x24BDE3378]);
  v17 = (void *)objc_msgSend(v16, "initWithFrame:fixedPixelSize:drawingScale:layerFixedPixelSize:", 1, v4, v6, v8, v10, v36, v35);
  -[AKInkOverlayView setCanvasView:](self, "setCanvasView:", v17);
  objc_msgSend(v17, "setOpaque:", 0);
  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
  if (WeakRetained)
    objc_msgSend(v17, "setRulerHostingDelegate:", WeakRetained);
  objc_msgSend(v17, "setOverrideUserInterfaceStyle:", 1);
  -[AKInkOverlayView _updateCanvasViewInk](self, "_updateCanvasViewInk");
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 0.5);

  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeScale(&v34, 1.0, -1.0);
  v33 = v34;
  objc_msgSend(v17, "setTransform:", &v33);
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);
  -[AKInkOverlayView drawingUndoTarget](self, "drawingUndoTarget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDrawingUndoTarget:", v20);

  objc_msgSend(v17, "setDrawingUndoSelector:", sel_performUndo_);
  -[AKInkOverlayView addSubview:](self, "addSubview:", v17);
  objc_msgSend(v17, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkOverlayView centerXAnchor](self, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  objc_msgSend(v17, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkOverlayView centerYAnchor](self, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  objc_msgSend(v17, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkOverlayView widthAnchor](self, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  objc_msgSend(v17, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkOverlayView heightAnchor](self, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (BOOL)canvasNeedsUpdate
{
  _BOOL4 v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  BOOL v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[AKInkOverlayView previousPageRectInAKModel](self, "previousPageRectInAKModel");
  if (CGRectIsNull(v24))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[AKInkOverlayView pageController](self, "pageController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxPageRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AKInkOverlayView previousPageRectInAKModel](self, "previousPageRectInAKModel");
    v28.origin.x = v13;
    v28.origin.y = v14;
    v28.size.width = v15;
    v28.size.height = v16;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    v3 = !CGRectEqualToRect(v25, v28);

  }
  -[AKInkOverlayView canvasView](self, "canvasView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[AKInkOverlayView canvasView](self, "canvasView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_fixedPixelSize");
    if (v19 == 5.0)
    {
      -[AKInkOverlayView canvasView](self, "canvasView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      if (CGRectGetWidth(v26) <= 10.0)
      {
        v22 = 0;
      }
      else
      {
        -[AKInkOverlayView canvasView](self, "canvasView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        v22 = CGRectGetHeight(v27) > 10.0;

      }
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v3 || v22;
}

- (id)updatedDrawingForPageRectUpdate
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
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MinX;
  CGFloat v42;
  double MinY;
  CGFloat v44;
  void *v45;
  void *v46;
  CGFloat recta;
  CGAffineTransform rect_8;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[AKInkOverlayView previousPageRectInAKModel](self, "previousPageRectInAKModel");
  if (CGRectIsNull(v51))
  {
    -[AKInkOverlayView canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AKInkOverlayView pageController](self, "pageController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_class();
    -[AKInkOverlayView previousPageRectInAKModel](self, "previousPageRectInAKModel");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[AKInkOverlayView canvasView](self, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_convertRect:fromPageControllerModelSpace:toDrawingInCanvasViewSpace:", v3, v14, v7, v9, v11, v13);
    v16 = v15;
    recta = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = (void *)objc_opt_class();
    objc_msgSend(v3, "maxPageRect");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[AKInkOverlayView canvasView](self, "canvasView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_convertRect:fromPageControllerModelSpace:toDrawingInCanvasViewSpace:", v3, v32, v25, v27, v29, v31);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v52.origin.x = v16;
    v52.origin.y = v18;
    v52.size.width = v20;
    v52.size.height = v22;
    MinX = CGRectGetMinX(v52);
    v53.origin.x = v34;
    v53.origin.y = v36;
    v53.size.width = v38;
    v53.size.height = v40;
    v42 = MinX - CGRectGetMinX(v53);
    v54.origin.x = recta;
    v54.origin.y = v18;
    v54.size.width = v20;
    v54.size.height = v22;
    MinY = CGRectGetMinY(v54);
    v55.origin.x = v34;
    v55.origin.y = v36;
    v55.size.width = v38;
    v55.size.height = v40;
    v44 = CGRectGetMinY(v55);
    memset(&v50, 0, sizeof(v50));
    CGAffineTransformMakeTranslation(&v50, v42, MinY - v44);
    -[AKInkOverlayView canvasView](self, "canvasView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "drawing");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    rect_8 = v50;
    objc_msgSend(v46, "drawingByApplyingTransform:", &rect_8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKInkOverlayView;
  -[AKInkOverlayView layoutSubviews](&v9, sel_layoutSubviews);
  -[AKInkOverlayView pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKInkOverlayView canvasNeedsUpdate](self, "canvasNeedsUpdate"))
  {
    v8 = *MEMORY[0x24BDBF148];
    v7 = 1.0;
    -[AKInkOverlayView _calculateFixedPixelSize:drawingScale:](self, "_calculateFixedPixelSize:drawingScale:", &v8, &v7);
    -[AKInkOverlayView canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setFixedPixelSize:drawingScale:", v8, v7);

    -[AKInkOverlayView updatedDrawingForPageRectUpdate](self, "updatedDrawingForPageRectUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInkOverlayView canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDrawing:", v5);

    objc_msgSend(v3, "updateOverlayViewLayers");
  }
  objc_msgSend(v3, "maxPageRect");
  -[AKInkOverlayView setPreviousPageRectInAKModel:](self, "setPreviousPageRectInAKModel:");

}

- (void)setRulerHostingDelegate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_rulerHostingDelegate, v6);
  -[AKInkOverlayView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKInkOverlayView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRulerHostingDelegate:", v6);

  }
}

- (void)_calculateFixedPixelSize:(CGSize *)a3 drawingScale:(double *)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  AKInkOverlayView *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  _BOOL4 v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _BOOL4 v59;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGAffineTransform v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[AKInkOverlayView pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  v14 = self;
  objc_msgSend(v9, "maxPageRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v10, "akModelToCanvasFixedPixelScaleOfFirstEncounteredPage");
  v24 = v23;
  objc_msgSend(v10, "screenPixelsToCanvasPixelsDownscale");
  if (v24 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.iBooks"));

    v29 = v8;
    v30 = v7;
    if (v28)
    {
      v31 = v16;
      -[AKInkOverlayView window](v14, "window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "screen");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "scale");
      v35 = v34;

      v36 = fmax(v35, 1.0);
      -[AKInkOverlayView bounds](v14, "bounds");
      if (v37 >= v38)
        v39 = v38;
      else
        v39 = v37;
      if (v39 > 0.0 && v39 < 768.0)
      {
        v40 = 768.0 / v39;
        v37 = v37 * v40;
        v38 = v38 * v40;
      }
      v30 = v36 * v37;
      v29 = v36 * v38;
      v16 = v31;
    }
    if (v30 == v7 && v29 == v8)
    {
      -[AKInkOverlayView bounds](v14, "bounds");
      +[AKGeometryHelper convertRect:fromViewToScreenPixels:useNativeScale:](AKGeometryHelper, "convertRect:fromViewToScreenPixels:useNativeScale:", v14, 1);
    }
    v42 = v29 * v30;
    v43 = 1.0;
    v79 = v8;
    v44 = v7;
    v45 = v16;
    v46 = v22;
    if (v29 * v30 > 5595136.0)
    {
      v42 = sqrt(v42);
      v43 = 2365.40398 / v42;
      v30 = v30 * (2365.40398 / v42);
      v29 = v29 * (2365.40398 / v42);
    }
    v47 = round(v30);
    v48 = round(v29);
    v49 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v9, "currentModelToScreenExifOrientation", v42, *(_QWORD *)&v79));
    if (v49)
      v50 = v47;
    else
      v50 = v48;
    v81 = v50;
    if (v49)
      v47 = v48;
    v83.origin.x = v45;
    v83.origin.y = v18;
    v83.size.width = v20;
    v83.size.height = v46;
    objc_msgSend(v10, "setAkModelToCanvasFixedPixelScaleOfFirstEncounteredPage:", v47 / CGRectGetWidth(v83));
    objc_msgSend(v10, "setScreenPixelsToCanvasPixelsDownscale:", v43);
    v7 = v44;
    v8 = v80;
  }
  else
  {
    v43 = v25;
    CGAffineTransformMakeScale(&v82, v24, v24);
    v84.origin.x = v16;
    v84.origin.y = v18;
    v84.size.width = v20;
    v84.size.height = v22;
    v85 = CGRectApplyAffineTransform(v84, &v82);
    v47 = round(v85.size.width);
    v81 = round(v85.size.height);
  }
  objc_msgSend(v9, "pageModelController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "inkCanvasAnnotation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v7;
  v54 = v8;
  if (v52)
  {
    objc_msgSend(v52, "drawingSize", v7, v8);
    v56 = v55;
    v58 = v57;
    v59 = +[AKGeometryHelper isUnpresentableSize:](AKGeometryHelper, "isUnpresentableSize:");
    if (v59)
      v53 = v7;
    else
      v53 = v56;
    if (v59)
      v54 = v8;
    else
      v54 = v58;
  }
  if (v53 == v7 && v54 == v8)
  {
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v10, "akModelToCanvasFixedPixelScaleOfFirstEncounteredPage");
      v62 = v64;
    }
    else
    {
      -[AKInkOverlayView window](v14, "window");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "screen");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bounds");
      v70 = v69;
      v72 = v71;

      if (v70 >= v72)
        v73 = v72;
      else
        v73 = v70;
      v74 = v73 / 768.0;
      -[AKInkOverlayView window](v14, "window");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "screen");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "nativeScale");
      v78 = v74 * v77;

      v62 = v43 * v78;
    }
    v63 = v81;
    -[AKInkOverlayView setCanvasSizeInPKDrawingSpace:](v14, "setCanvasSizeInPKDrawingSpace:", v47 / v62, v81 / v62);
  }
  else if ((v13 & 1) != 0)
  {
    objc_msgSend(v10, "akModelToCanvasFixedPixelScaleOfFirstEncounteredPage");
    v62 = v61;
    v63 = v81;
  }
  else
  {
    v65 = v47 / v53;
    v63 = v81;
    v66 = v81 / v54;
    if (v65 >= v66)
      v62 = v65;
    else
      v62 = v66;
  }
  if (a3)
  {
    a3->width = v47;
    a3->height = v63;
  }
  if (a4)
    *a4 = v62;

}

+ (CGRect)_convertRect:(CGRect)a3 fromPageControllerModelSpace:(id)a4 toDrawingInCanvasViewSpace:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGRect v32;

  if (a4 && a5)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    memset(&v31, 0, sizeof(v31));
    v10 = a5;
    v11 = a4;
    objc_msgSend(v10, "drawingTransform");
    CGAffineTransformInvert(&v31, &v30);
    objc_msgSend(v11, "convertRectFromModelToOverlay:", x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "overlayView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "convertRect:toView:", v10, v13, v15, v17, v19);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v29 = v31;
    v32.origin.x = v22;
    v32.origin.y = v24;
    v32.size.width = v26;
    v32.size.height = v28;
    return CGRectApplyAffineTransform(v32, &v29);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
  }
}

- (BOOL)_canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[AKInkOverlayView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "inputViewCanBeginDrawing:withTouch:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AKInkOverlayView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputViewDidBeginStroke:", self);

  -[AKInkOverlayView pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modernToolbarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkOverlayView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    v10 = objc_msgSend(v7, "shouldHide");

    if ((v10 & 1) == 0)
      objc_msgSend(v12, "becomeFirstResponder");
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", qword_255A255C0, v6);

}

- (void)canvasViewDidEndDrawing:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = off_255A255B8;
  -[AKInkOverlayView pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", v4, v6);

}

- (void)_canvasView:(id)a3 beganStroke:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[AKInkOverlayView pageController](self, "pageController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sidecarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleLiveStrokeBegan:onInkOverlayView:", v5, self);

}

- (void)_canvasView:(id)a3 endedStroke:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[AKInkOverlayView pageController](self, "pageController", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sidecarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleLiveStrokeComplete:", 1);

}

- (void)_canvasView:(id)a3 cancelledStroke:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKInkOverlayView pageController](self, "pageController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", qword_255A255C8, v7);

  objc_msgSend(v7, "sidecarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleLiveStrokeComplete:", 0);

}

- (void)canvasViewDrawingDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKInkOverlayView pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undoController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isUndoRegistrationEnabled");
  if (v9)
    objc_msgSend(v8, "disableUndoRegistration");
  objc_msgSend(v4, "drawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v22 = v9;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v10, "strokes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (!-[NSHashTable containsObject:](self->_reportedStrokes, "containsObject:", v17))
          {
            -[NSHashTable addObject:](self->_reportedStrokes, "addObject:", v17);
            objc_msgSend(v11, "addObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }
    v18 = objc_alloc(MEMORY[0x24BDE3380]);
    v19 = (void *)objc_msgSend(v11, "copy");
    v20 = (void *)objc_msgSend(v18, "initWithStrokes:fromDrawing:", v19, v10);

    -[AKInkOverlayView delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "inputView:didCollectDrawingForAnalysis:", self, v20);

    v9 = v22;
  }
  if (v9)
    objc_msgSend(v8, "enableUndoRegistration");

}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKInkOverlayView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (UIGestureRecognizer)pinchGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKInkOverlayView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (id)drawingUndoTarget
{
  return objc_loadWeakRetained(&self->_drawingUndoTarget);
}

- (void)setDrawingUndoTarget:(id)a3
{
  objc_storeWeak(&self->_drawingUndoTarget, a3);
}

- (PKCanvasView)canvasView
{
  return (PKCanvasView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCanvasView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (AKInkOverlayViewDelegate)delegate
{
  return (AKInkOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)canvasSizeInPKDrawingSpace
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_canvasSizeInPKDrawingSpace, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCanvasSizeInPKDrawingSpace:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_canvasSizeInPKDrawingSpace, &v3, 16, 1, 0);
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  return (PKRulerHostingDelegate *)objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
}

- (CGRect)previousPageRectInAKModel
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousPageRectInAKModel.origin.x;
  y = self->_previousPageRectInAKModel.origin.y;
  width = self->_previousPageRectInAKModel.size.width;
  height = self->_previousPageRectInAKModel.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousPageRectInAKModel:(CGRect)a3
{
  self->_previousPageRectInAKModel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak(&self->_drawingUndoTarget);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_reportedStrokes, 0);
  objc_storeStrong((id *)&self->_ink, 0);
}

@end
