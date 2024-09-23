@implementation DKInkView

+ (BOOL)gpuAvailable
{
  return +[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable");
}

- (DKInkView)initWithFrame:(CGRect)a3
{
  DKInkView *v3;
  DKInkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  v3 = -[DKInkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DKInkView _commonInit](v3, "_commonInit");
  return v4;
}

- (DKInkView)initWithCoder:(id)a3
{
  id v4;
  DKInkView *v5;
  DKInkView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKInkView;
  v5 = -[DKInkView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
    -[DKInkView _commonInit](v5, "_commonInit");

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_renderPreviewDelegate, 0);
  -[DKInkRenderer setDelegate:](self->_renderer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)DKInkView;
  -[DKInkView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  UIColor *strokeColor;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  DKInkRenderer *renderer;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)DKInkView;
  -[DKInkView layoutSubviews](&v27, sel_layoutSubviews);
  if (!self->_isRenderingPaused)
  {
    strokeColor = self->_strokeColor;
    -[DKInkView renderer](self, "renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInkColor:", strokeColor);

    if (!self->_scaleDrawingToFitCanvas
      || !self->_currentDrawing
      || (-[DKInkView bounds](self, "bounds"), (CGRectIsUnrepresentable(v5, v6, v7, v8) & 1) != 0)
      || (-[DKDrawing canvasBounds](self->_currentDrawing, "canvasBounds"),
          (CGRectIsUnrepresentable(v9, v10, v11, v12) & 1) != 0)
      || (-[DKDrawing strokesFrame](self->_currentDrawing, "strokesFrame"),
          (CGRectIsUnrepresentable(v13, v14, v15, v16) & 1) != 0))
    {
      if ((-[DKInkRenderer initialized](self->_renderer, "initialized") & 1) == 0)
        -[DKInkRenderer setNeedsLayout](self->_renderer, "setNeedsLayout");
      -[DKInkView bounds](self, "bounds");
      renderer = self->_renderer;
    }
    else
    {
      -[DKDrawing canvasBounds](self->_currentDrawing, "canvasBounds");
      -[DKInkRenderer setFrame:](self->_renderer, "setFrame:");
      -[DKInkView bounds](self, "bounds");
      if (CGRectGetWidth(v28) <= 0.0)
        goto LABEL_11;
      -[DKInkView bounds](self, "bounds");
      if (CGRectGetHeight(v29) <= 0.0)
        goto LABEL_11;
      -[DKDrawing strokesFrame](self->_currentDrawing, "strokesFrame");
      v19 = v18;
      v21 = v20;
      -[DKInkView bounds](self, "bounds");
      v24 = v23 / v19;
      memset(&v26.c, 0, 32);
      if (v23 / v19 >= v22 / v21)
        v24 = v22 / v21;
      *(_OWORD *)&v26.a = 0uLL;
      CGAffineTransformMakeScale(&v26, v24, v24);
      v25 = v26;
      -[DKInkRenderer setTransform:](self->_renderer, "setTransform:", &v25);
      -[DKInkRenderer frame](self->_renderer, "frame");
      renderer = self->_renderer;
    }
    -[DKInkRenderer setFrame:](renderer, "setFrame:");
LABEL_11:
    -[DKInkView _startDisplayLink](self, "_startDisplayLink");
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DKInkView;
  -[DKInkView willMoveToSuperview:](&v5, sel_willMoveToSuperview_, v4);
  if (!v4)
    -[DKInkView _stopDisplayLink](self, "_stopDisplayLink");

}

- (void)didMoveToSuperview
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKInkView;
  -[DKInkView didMoveToSuperview](&v7, sel_didMoveToSuperview);
  -[DKInkView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[DKInkView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[DKInkRenderer initialized](self->_renderer, "initialized");

      if (v6)
        -[DKInkView _startDisplayLink](self, "_startDisplayLink");
    }
    else
    {

    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DKInkView;
  -[DKInkView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);
  if (!v4)
    -[DKInkView _stopDisplayLink](self, "_stopDisplayLink");

}

- (void)didMoveToWindow
{
  uint64_t v3;
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  -[DKInkView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[DKInkView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[DKInkRenderer initialized](self->_renderer, "initialized");

    if (v5)
      -[DKInkView _startDisplayLink](self, "_startDisplayLink");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  -[DKInkView setHidden:](&v6, sel_setHidden_);
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v3);
  -[DKInkView renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (void)setupRenderer
{
  void *v3;
  void *v4;
  void *v5;
  DKInkRendererGL *v6;
  DKInkRendererGL *v7;
  DKInkRendererCG *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[DKInkView renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DKInkView renderer](self, "renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[DKInkView renderer](self, "renderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[DKInkView setRenderer:](self, "setRenderer:", 0);
  }
  if (-[DKInkView _deviceSupportsGL](self, "_deviceSupportsGL")
    && +[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable"))
  {
    v6 = [DKInkRendererGL alloc];
    -[DKInkView bounds](self, "bounds");
    v7 = -[DKInkRendererGL initWithFrame:](v6, "initWithFrame:");
    -[DKInkView setRenderer:](self, "setRenderer:", v7);
  }
  else
  {
    v8 = [DKInkRendererCG alloc];
    -[DKInkView bounds](self, "bounds");
    v7 = -[DKInkRendererCG initWithFrame:](v8, "initWithFrame:");
    -[DKInkView setRenderer:](self, "setRenderer:", v7);
  }

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView renderer](self, "renderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[DKInkView setMode:](self, "setMode:", 0);
  -[DKInkView setScaleDrawingToFitCanvas:](self, "setScaleDrawingToFitCanvas:", 0);
  -[DKInkView setAllowInput:](self, "setAllowInput:", 1);
  -[DKInkView renderer](self, "renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[DKInkView renderer](self, "renderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView strokeColor](self, "strokeColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInkColor:", v13);

  -[DKInkView renderer](self, "renderer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView addSubview:](self, "addSubview:", v14);

  -[DKInkView layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)_deviceSupportsGL
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dk_deviceSupportsGL");

  return v3;
}

- (void)_commonInit
{
  void *v3;
  CGSize v4;
  DKDrawing *v5;
  id v6;
  DKPointSmoothing *v7;
  double v8;
  DKPointSmoothing *v9;
  DKPointSmoothing *inputFIFO;
  double v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[DKInkView setExclusiveTouch:](self, "setExclusiveTouch:", 1);
  -[DKInkView setDrawingScale:](self, "setDrawingScale:", 1.0);
  -[DKInkView setupRenderer](self, "setupRenderer");
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView setStrokeColor:](self, "setStrokeColor:", v3);

  -[DKInkView setCurrentWeight:](self, "setCurrentWeight:", 2.0);
  -[DKInkView setRenderPreviewMode:](self, "setRenderPreviewMode:", 0);
  v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_unionDrawingRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_unionDrawingRect.size = v4;
  v5 = objc_alloc_init(DKDrawing);
  -[DKInkView setCurrentDrawing:](self, "setCurrentDrawing:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDD1898]);
  -[DKInkView setStrokeUndoManager:](self, "setStrokeUndoManager:", v6);

  -[DKInkView setMinPressure:](self, "setMinPressure:", 0.0);
  -[DKInkView setMaxPressure:](self, "setMaxPressure:", 0.2);
  -[DKInkView setMinThickness:](self, "setMinThickness:", 0.2);
  -[DKInkView setMaxThickness:](self, "setMaxThickness:", 3.0);
  v7 = [DKPointSmoothing alloc];
  LODWORD(v8) = 1068149978;
  v9 = -[DKPointSmoothing initWithWidth:spacing:](v7, "initWithWidth:spacing:", 3, v8);
  inputFIFO = self->_inputFIFO;
  self->_inputFIFO = v9;

  -[DKPointSmoothing setEmitInterpolatedPoints:](self->_inputFIFO, "setEmitInterpolatedPoints:", 0);
  LODWORD(v11) = 1059761370;
  -[DKPointSmoothing setUnitScale:](self->_inputFIFO, "setUnitScale:", v11);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __24__DKInkView__commonInit__block_invoke;
  v12[3] = &unk_24E1B0BC0;
  objc_copyWeak(&v13, &location);
  -[DKPointSmoothing setEmissionHandler:](self->_inputFIFO, "setEmissionHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __24__DKInkView__commonInit__block_invoke(uint64_t a1, __int128 *a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (a3)
  {
    v11 = *a2;
    v12 = *a2;
    v19 = *a2;
    if (a3 != 1)
    {
      v11 = *a2;
      v12 = *a2;
      if (a4)
      {
        v12 = *a4;
        v11 = a2[1];
      }
    }
    objc_msgSend(WeakRetained, "_addUninterpolatedPoints:controlPoint:count:flushing:", a2, a4, a3, a5, v11, v12);
    objc_msgSend(v10, "inputFIFO");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitScale");
    v15 = v14;

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __24__DKInkView__commonInit__block_invoke_2;
    v20[3] = &unk_24E1B0B98;
    v21 = v10;
    LODWORD(v16) = v15;
    +[DKPointSmoothing _interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:](DKPointSmoothing, "_interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:", v20, *(double *)&v19, v17, v18, v16);

  }
}

uint64_t __24__DKInkView__commonInit__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_renderEmittedPoints:count:", a2, a3);
}

- (void)_addUninterpolatedPoints:(DKInkView *)self controlPoint:(SEL)a2 count:flushing:
{
  __int128 *v2;
  __int128 *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  __int128 v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  -[DKDrawingStroke strokePoints](self->_currentBrushStroke, "strokePoints");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v7 == 1)
    {
      v10 = *v9;
      v17 = *v9;
      if (v8)
        v10 = *v8;
      v15 = v10;
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setLocation:", vcvtq_f64_f32(*(float32x2_t *)&v17));
      objc_msgSend(v11, "setForce:", *((float *)&v17 + 3));
      objc_msgSend(v11, "setVelocity:", *((float *)&v17 + 2));
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setLocation:", vcvtq_f64_f32(*(float32x2_t *)&v15));
      objc_msgSend(v12, "setForce:", *((float *)&v15 + 3));
      objc_msgSend(v12, "setVelocity:", *((float *)&v15 + 2));
    }
    else
    {
      v13 = *v9;
      v18 = *v9;
      if (v8)
        v13 = *v8;
      v16 = v13;
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setLocation:", vcvtq_f64_f32(*(float32x2_t *)&v18));
      objc_msgSend(v11, "setForce:", *((float *)&v18 + 3));
      objc_msgSend(v11, "setVelocity:", *((float *)&v18 + 2));
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setLocation:", vcvtq_f64_f32(*(float32x2_t *)&v16));
      objc_msgSend(v12, "setForce:", *((float *)&v16 + 3));
      objc_msgSend(v12, "setVelocity:", *((float *)&v16 + 2));
      objc_msgSend(v20, "addObject:", v11);
      objc_msgSend(v20, "addObject:", v12);
      if (v6)
      {
        v19 = *v9;
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "setLocation:", vcvtq_f64_f32(*(float32x2_t *)&v19));
        objc_msgSend(v14, "setForce:", *((float *)&v19 + 3));
        objc_msgSend(v14, "setVelocity:", *((float *)&v19 + 2));
        objc_msgSend(v20, "addObject:", v14);

      }
    }

  }
}

- (void)_renderEmittedPoints:(DKInkView *)self count:(SEL)a2
{
  float32x4_t *v2;
  uint64_t v3;
  uint64_t v4;
  float32x4_t *v5;
  CGFloat v7;
  CGFloat v8;
  NSMutableArray **p_currentInterpolatedBrushStroke;
  NSMutableArray *v10;
  double v11;
  float v12;
  float v13;
  uint64_t v14;
  float32x4_t v15;
  float v16;
  double v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  unint64_t animationType;
  NSMutableArray **p_cachedInterpolatedAnimationPoints;
  DKInkRenderer *renderer;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect *p_unionDrawingRect;
  __int128 v30;
  __int128 v31;
  float64x2_t v32;
  CGFloat v33;
  CGFloat v34;
  float64x2_t v35;
  double v36;
  double v37;
  double v38;
  float64x2_t v39;
  double v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect v44;
  NSRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v4 = v3;
  v5 = v2;
  v30 = *(_OWORD *)&self->_lastVectorPoint[16];
  v31 = *(_OWORD *)self->_lastVectorPoint;
  v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v33 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v34 = *MEMORY[0x24BDBF070];
  p_currentInterpolatedBrushStroke = &self->_currentInterpolatedBrushStroke;
  v10 = self->_currentInterpolatedBrushStroke;
  -[DKInkView interfaceScale](self, "interfaceScale");
  if (v4)
  {
    v12 = v11;
    v13 = 1.0;
    v14 = v4;
    while (1)
    {
      v15 = *v5;
      LODWORD(v16) = HIDWORD(*(unsigned __int128 *)v5);
      v17 = (float)(vmuls_lane_f32(v16 + v13, *v5, 2) * v12);
      if (v17 > 0.00001)
        break;
LABEL_14:
      ++v5;
      if (!--v14)
        goto LABEL_15;
    }
    v18 = v16;
    v19 = v15.f32[2] / 3.0;
    if (v15.f32[2] >= 3.0)
      v19 = v13;
    v32 = vcvtq_f64_f32(*(float32x2_t *)v15.f32);
    v39 = v32;
    v20 = v19;
    v40 = v17;
    v41 = v19;
    v42 = v18;
    objc_msgSend(MEMORY[0x24BDD1968], "dk_valueWithRenderPoint:", &v39, v30, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    animationType = self->_animationType;
    p_cachedInterpolatedAnimationPoints = p_currentInterpolatedBrushStroke;
    if (animationType != 1)
    {
      if (animationType != 2)
      {
        renderer = self->_renderer;
        v35 = v32;
        v36 = v17;
        v37 = v20;
        v38 = v18;
        -[DKInkRenderer addPoint:](renderer, "addPoint:", &v35);
        goto LABEL_11;
      }
      p_cachedInterpolatedAnimationPoints = &self->_cachedInterpolatedAnimationPoints;
    }
    -[NSMutableArray addObject:](*p_cachedInterpolatedAnimationPoints, "addObject:", v21);
LABEL_11:
    -[NSMutableArray addObject:](v10, "addObject:", v21);
    v43.origin.x = v32.f64[0] - v17 * 0.5;
    v43.origin.y = v32.f64[1] - v17 * 0.5;
    v43.size.width = v17;
    v43.size.height = v17;
    v44 = CGRectInset(v43, -5.0, -5.0);
    v45 = NSIntegralRectWithOptions(v44, 0xF00uLL);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;
    v45.size.height = v33;
    v45.origin.x = v34;
    v45.origin.y = v7;
    v45.size.width = v8;
    if (!CGRectIsNull(v45))
    {
      v46.size.height = v33;
      v46.origin.x = v34;
      v46.origin.y = v7;
      v46.size.width = v8;
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v47 = CGRectUnion(v46, v51);
      x = v47.origin.x;
      y = v47.origin.y;
      width = v47.size.width;
      height = v47.size.height;
    }

    v33 = height;
    v34 = x;
    v7 = y;
    v8 = width;
    v13 = 1.0;
    goto LABEL_14;
  }
LABEL_15:
  self->_totalPointsAdded += v4;
  *(_OWORD *)self->_lastVectorPoint = v31;
  *(_OWORD *)&self->_lastVectorPoint[16] = v30;
  v48.size.height = v33;
  v48.origin.x = v34;
  v48.origin.y = v7;
  v48.size.width = v8;
  if (!CGRectIsNull(v48))
  {
    p_unionDrawingRect = &self->_unionDrawingRect;
    if (!CGRectIsNull(self->_unionDrawingRect))
    {
      v49.origin.x = p_unionDrawingRect->origin.x;
      v49.origin.y = self->_unionDrawingRect.origin.y;
      v49.size.width = self->_unionDrawingRect.size.width;
      v49.size.height = self->_unionDrawingRect.size.height;
      v52.size.height = v33;
      v52.origin.x = v34;
      v52.origin.y = v7;
      v52.size.width = v8;
      v50 = CGRectUnion(v49, v52);
      v33 = v50.size.height;
      v34 = v50.origin.x;
      v7 = v50.origin.y;
      v8 = v50.size.width;
    }
    p_unionDrawingRect->origin.x = v34;
    self->_unionDrawingRect.origin.y = v7;
    self->_unionDrawingRect.size.width = v8;
    self->_unionDrawingRect.size.height = v33;
    -[DKDrawing setStrokesFrame:](self->_currentDrawing, "setStrokesFrame:", v30, v31);
  }

}

- (void)teardown
{
  id animationCompletionHandler;
  void *v4;
  void *v5;
  void *v6;

  animationCompletionHandler = self->_animationCompletionHandler;
  self->_animationCompletionHandler = 0;

  -[DKInkView inputFIFO](self, "inputFIFO");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmissionHandler:", 0);

  -[DKInkView setInputFIFO:](self, "setInputFIFO:", 0);
  objc_storeWeak((id *)&self->_renderPreviewDelegate, 0);
  -[DKInkView _stopDisplayLink](self, "_stopDisplayLink");
  -[DKInkView renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teardown");

  -[DKInkView renderer](self, "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[DKInkView setRenderer:](self, "setRenderer:", 0);
}

- (void)pauseRendering
{
  self->_isRenderingPaused = 1;
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  if (+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable"))
    -[DKInkRenderer flush](self->_renderer, "flush");
}

- (void)resumeRendering
{
  self->_isRenderingPaused = 0;
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  -[DKInkView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCurrentDrawing:(id)a3 scaleDrawingToFitBounds:(BOOL)a4 withAnimationType:(unint64_t)a5 animationCompletionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  int v11;
  int v12;
  id animationCompletionHandler;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  DKDrawing *v25;
  DKDrawing *currentDrawing;
  NSMutableArray *v27;
  NSMutableArray *cachedInterpolatedBrushStrokes;
  NSMutableArray *v29;
  NSMutableArray *cachedInterpolatedAnimationPoints;
  NSMutableArray *v31;
  NSMutableArray *cachedInterpolatedAnimationStrokes;
  DKDrawing *v33;

  v8 = a4;
  v33 = (DKDrawing *)a3;
  v10 = a6;
  v11 = -[DKInkRenderer supportsBleedAnimation](self->_renderer, "supportsBleedAnimation");
  if (a5 == 2)
    v12 = v11;
  else
    v12 = 1;
  if (!v12)
    a5 = 0;
  animationCompletionHandler = self->_animationCompletionHandler;
  self->_animationCompletionHandler = 0;

  if (a5)
  {
    v14 = (void *)MEMORY[0x22079EDD4](v10);
    v15 = self->_animationCompletionHandler;
    self->_animationCompletionHandler = v14;

  }
  -[DKInkView setAnimationType:](self, "setAnimationType:", a5);
  -[DKInkView setScaleDrawingToFitCanvas:](self, "setScaleDrawingToFitCanvas:", v8);
  if (self->_currentDrawing != v33)
  {
    -[DKInkView clear](self, "clear");
    if (v8)
    {
      -[DKInkView bounds](self, "bounds");
      v17 = v16;
      -[DKDrawing strokesFrame](v33, "strokesFrame");
      v19 = v18;
      -[DKInkView bounds](self, "bounds");
      v21 = v20;
      -[DKDrawing strokesFrame](v33, "strokesFrame");
      if (v17 / v19 >= v21 / v22)
        v23 = v21 / v22;
      else
        v23 = v17 / v19;
      -[DKInkView bounds](self, "bounds");
      v24 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v33);

      -[DKInkView setDrawingScale:](self, "setDrawingScale:", v23);
      v25 = (DKDrawing *)v24;
      v33 = v25;
    }
    else
    {
      -[DKInkView setDrawingScale:](self, "setDrawingScale:", 1.0);
      v25 = (DKDrawing *)-[DKDrawing copy](v33, "copy");
    }
    currentDrawing = self->_currentDrawing;
    self->_currentDrawing = v25;

    if (!self->_cachedInterpolatedBrushStrokes)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
      self->_cachedInterpolatedBrushStrokes = v27;

    }
    if (!self->_cachedInterpolatedAnimationPoints)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
      self->_cachedInterpolatedAnimationPoints = v29;

    }
    if (!self->_cachedInterpolatedAnimationStrokes)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      cachedInterpolatedAnimationStrokes = self->_cachedInterpolatedAnimationStrokes;
      self->_cachedInterpolatedAnimationStrokes = v31;

    }
    if (a5 == 2)
    {
      -[DKInkView _setDrawingOnRendererWithBleedAnimation:](self, "_setDrawingOnRendererWithBleedAnimation:", self->_currentDrawing);
    }
    else if (a5 == 1)
    {
      -[DKInkView _setDrawingOnRendererWithReplayAnimation:](self, "_setDrawingOnRendererWithReplayAnimation:", self->_currentDrawing);
    }
    else
    {
      -[DKInkView _setDrawingOnRenderer:](self, "_setDrawingOnRenderer:", self->_currentDrawing);
    }
  }

}

- (void)setCurrentDrawing:(id)a3
{
  -[DKInkView setCurrentDrawing:scaleDrawingToFitBounds:withAnimationType:animationCompletionHandler:](self, "setCurrentDrawing:scaleDrawingToFitBounds:withAnimationType:animationCompletionHandler:", a3, self->_scaleDrawingToFitCanvas, 0, 0);
}

- (DKDrawing)currentDrawing
{
  return self->_currentDrawing;
}

- (void)setRenderer:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_renderer, a3);
  -[DKInkRenderer setDrawingScale:](self->_renderer, "setDrawingScale:", self->_drawingScale);
  -[DKInkRenderer setMode:](self->_renderer, "setMode:", self->_mode);
  -[DKInkRenderer setScaleDrawingToFitCanvas:](self->_renderer, "setScaleDrawingToFitCanvas:", self->_scaleDrawingToFitCanvas);

}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  -[DKInkRenderer setMode:](self->_renderer, "setMode:");
}

- (void)setScaleDrawingToFitCanvas:(BOOL)a3
{
  self->_scaleDrawingToFitCanvas = a3;
  -[DKInkRenderer setScaleDrawingToFitCanvas:](self->_renderer, "setScaleDrawingToFitCanvas:");
}

- (void)setDrawingScale:(double)a3
{
  double drawingScale;

  self->_drawingScale = a3;
  -[DKInkRenderer setDrawingScale:](self->_renderer, "setDrawingScale:");
  drawingScale = self->_drawingScale;
  LODWORD(drawingScale) = dword_21DCC0718[drawingScale < 1.0];
  -[DKPointSmoothing setUnitScale:](self->_inputFIFO, "setUnitScale:", drawingScale);
}

- (id)snapshotRendererState
{
  return (id)-[DKInkRenderer snapshotImage](self->_renderer, "snapshotImage");
}

- (CGRect)inkBounds
{
  DKDrawing *currentDrawing;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  currentDrawing = self->_currentDrawing;
  if (currentDrawing)
  {
    -[DKDrawing strokesFrame](currentDrawing, "strokesFrame");
  }
  else
  {
    v3 = *MEMORY[0x24BDBF090];
    v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_notifyRenderDelegate
{
  char v3;
  id v4;
  id v5;

  -[DKInkView renderPreviewDelegate](self, "renderPreviewDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    -[DKInkView renderPreviewDelegate](self, "renderPreviewDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel_inkViewDidRender_, self, 0.0);

  }
}

- (void)_postTouchesBeganNotification:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  v5 = (void *)MEMORY[0x24BDD16C8];
  v6 = DKInkViewTouchesBeganNotification;
  v10 = DKInkViewTouchesEndedLocationInViewUserInfoKey;
  v11[0] = DictionaryRepresentation;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationWithName:object:userInfo:", v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:", v8);

}

- (void)_postTouchesEndedNotification:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  v5 = (void *)MEMORY[0x24BDD16C8];
  v6 = DKInkViewTouchesEndedNotification;
  v10 = DKInkViewTouchesEndedLocationInViewUserInfoKey;
  v11[0] = DictionaryRepresentation;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationWithName:object:userInfo:", v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:", v8);

}

+ (double)windowBackingScaleFactor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "screen");
  else
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  return v7;
}

- (double)interfaceScale
{
  return 2.0;
}

- (void)setStrokeColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_strokeColor, a3);
  -[DKInkView renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInkColor:", v6);

}

- (void)clear
{
  void *v3;
  void *v4;
  void *v5;
  CGSize v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  -[DKInkView renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completeAnimationsImmediately");

  -[DKInkView renderer](self, "renderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetRendererState");

  -[DKInkView renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clear");

  -[DKPointSmoothing clear](self->_inputFIFO, "clear");
  v6 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_unionDrawingRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_unionDrawingRect.size = v6;
  -[NSMutableArray removeAllObjects](self->_cachedInterpolatedBrushStrokes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_cachedInterpolatedAnimationPoints, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_cachedInterpolatedAnimationStrokes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_computedAnimationFrames, "removeAllObjects");
  -[DKInkView currentDrawing](self, "currentDrawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

  -[DKInkView strokeUndoManager](self, "strokeUndoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllActions");

  memset(v9, 0, sizeof(v9));
  -[DKInkView setLastVectorPoint:](self, "setLastVectorPoint:", v9);
  -[DKInkView bounds](self, "bounds");
  -[DKInkView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  -[DKInkView _notifyRenderDelegate](self, "_notifyRenderDelegate");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  DKDrawing *currentDrawing;
  DKDrawing *v14;
  void *v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DKInkView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)DKInkView;
  -[DKInkView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (self->_scaleDrawingToFitCanvas)
    {
      currentDrawing = self->_currentDrawing;
      self->_currentDrawing = 0;
      v14 = currentDrawing;

      -[DKInkView setCurrentDrawing:](self, "setCurrentDrawing:", v14);
    }
    -[DKInkView renderer](self, "renderer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKInkView bounds](self, "bounds");
    objc_msgSend(v15, "setNeedsDisplayInRect:");

  }
}

- (int64_t)countOfCurrentStroke
{
  void *v2;
  int64_t v3;

  -[DKDrawingStroke strokePoints](self->_currentBrushStroke, "strokePoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)canvasHasInk
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[DKInkView currentDrawing](self, "currentDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalPoints");
  -[DKDrawingStroke strokePoints](self->_currentBrushStroke, "strokePoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6 > 0;
}

- (void)_startDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__display);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCA90]);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", -[DKInkView isHidden](self, "isHidden"));
  }
}

- (void)_stopDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)_display
{
  id v3;

  if (+[DKInkView gpuAvailable](DKInkView, "gpuAvailable"))
  {
    if (-[NSMutableArray count](self->_computedAnimationFrames, "count"))
      -[DKInkView _replayAnimationTick:](self, "_replayAnimationTick:", self);
    -[DKInkView renderer](self, "renderer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "display");
  }
  else
  {
    -[DKInkView renderer](self, "renderer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[DKInkView bounds](self, "bounds");
    objc_msgSend(v3, "setNeedsDisplayInRect:");
  }

}

- (void)_setDrawingOnRenderer:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *currentInterpolatedBrushStroke;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64_t v24;
  double v25;
  double v26;
  unsigned int v27;
  double v28;
  float v29;
  double v30;
  float v31;
  float64x2_t v32;
  float64x2_t v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  float64_t v44;
  float64_t v45;
  float64_t v46;
  float64_t v47;
  _QWORD v48[5];
  id v49;
  id location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v39 = a3;
  objc_msgSend(v39, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v5)
  {
    v41 = *(_QWORD *)v52;
    v40 = v4;
    do
    {
      v42 = v5;
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "strokePoints");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v7, "count") >= 3)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = v8;

          v10 = 0;
          *(_OWORD *)self->_lastVectorPoint = 0u;
          *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
          while (v10 < objc_msgSend(v7, "count") - 2)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v10 + 1;
            objc_msgSend(v7, "objectAtIndexedSubscript:", v10 + 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v10 += 2;
            objc_msgSend(v7, "objectAtIndexedSubscript:", v12 + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "location");
            v16 = v15;
            objc_msgSend(v11, "location");
            v18 = v17;
            objc_msgSend(v11, "velocity");
            objc_msgSend(v11, "force");
            objc_msgSend(v13, "location");
            v20 = v19;
            objc_msgSend(v13, "location");
            v22 = v21;
            objc_msgSend(v13, "velocity");
            objc_msgSend(v13, "force");
            objc_msgSend(v14, "location");
            v47 = v23;
            objc_msgSend(v14, "location");
            v46 = v24;
            objc_msgSend(v14, "velocity");
            v45 = v25;
            objc_msgSend(v14, "force");
            v44 = v26;
            objc_initWeak(&location, self);
            -[DKPointSmoothing unitScale](self->_inputFIFO, "unitScale");
            v43 = v27;
            v48[0] = MEMORY[0x24BDAC760];
            v48[1] = 3221225472;
            v48[2] = __35__DKInkView__setDrawingOnRenderer___block_invoke;
            v48[3] = &unk_24E1B0BE8;
            objc_copyWeak(&v49, &location);
            *(float *)&v28 = v16;
            v29 = v18;
            *((float *)&v28 + 1) = v29;
            *(float *)&v30 = v20;
            v31 = v22;
            *((float *)&v30 + 1) = v31;
            v32.f64[0] = v45;
            v32.f64[1] = v44;
            v33.f64[0] = v47;
            v33.f64[1] = v46;
            v48[4] = &v55;
            +[DKPointSmoothing _interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:](DKPointSmoothing, "_interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:", v48, v28, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v32).i64, v30, COERCE_DOUBLE(__PAIR64__(HIDWORD(v46), v43)));
            objc_destroyWeak(&v49);
            objc_destroyWeak(&location);

          }
          -[NSMutableArray addObject:](self->_cachedInterpolatedBrushStrokes, "addObject:", self->_currentInterpolatedBrushStroke);
          v34 = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = 0;

        }
        v4 = v40;
      }
      v5 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v5);
  }

  if (*((_BYTE *)v56 + 24))
  {
    -[DKInkView renderer](self, "renderer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "endStroke");

  }
  objc_msgSend(v39, "strokes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count") == 0;

  if (!v37)
  {
    -[DKInkView renderer](self, "renderer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "force");

  }
  _Block_object_dispose(&v55, 8);

}

void __35__DKInkView__setDrawingOnRenderer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 1;
      objc_msgSend(WeakRetained, "renderer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginStroke");

      WeakRetained = v9;
    }
  }
  objc_msgSend(WeakRetained, "_renderEmittedPoints:count:", a2, a3);

}

- (void)_setDrawingOnRendererWithBleedAnimation:(id)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *currentInterpolatedBrushStroke;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
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
  float64_t v23;
  double v24;
  double v25;
  unsigned int v26;
  double v27;
  float v28;
  double v29;
  float v30;
  float64x2_t v31;
  float64x2_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  DKInkRenderer *renderer;
  id v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  DKInkRenderer *v54;
  NSMutableArray *cachedInterpolatedAnimationPoints;
  id v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  float64_t v61;
  float64_t v62;
  float64_t v63;
  float64_t v64;
  _OWORD v65[2];
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[2];
  uint64_t v72;
  id location[2];
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  if (-[DKInkRenderer supportsBleedAnimation](self->_renderer, "supportsBleedAnimation"))
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend(v56, "strokes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v4)
    {
      v58 = *(_QWORD *)v83;
      do
      {
        v59 = v4;
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v83 != v58)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "strokePoints");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v6, "count") >= 3)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
            self->_currentInterpolatedBrushStroke = v7;

            v9 = 0;
            *(_OWORD *)self->_lastVectorPoint = 0u;
            *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
            while (v9 < objc_msgSend(v6, "count") - 2)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v9 + 1;
              objc_msgSend(v6, "objectAtIndexedSubscript:", v9 + 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v9 += 2;
              objc_msgSend(v6, "objectAtIndexedSubscript:", v11 + 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "location");
              v15 = v14;
              objc_msgSend(v10, "location");
              v17 = v16;
              objc_msgSend(v10, "velocity");
              objc_msgSend(v10, "force");
              objc_msgSend(v12, "location");
              v19 = v18;
              objc_msgSend(v12, "location");
              v21 = v20;
              objc_msgSend(v12, "velocity");
              objc_msgSend(v12, "force");
              objc_msgSend(v13, "location");
              v64 = v22;
              objc_msgSend(v13, "location");
              v63 = v23;
              objc_msgSend(v13, "velocity");
              v62 = v24;
              objc_msgSend(v13, "force");
              v61 = v25;
              objc_initWeak(location, self);
              -[DKPointSmoothing unitScale](self->_inputFIFO, "unitScale");
              v60 = v26;
              v80[0] = MEMORY[0x24BDAC760];
              v80[1] = 3221225472;
              v80[2] = __53__DKInkView__setDrawingOnRendererWithBleedAnimation___block_invoke;
              v80[3] = &unk_24E1B0C10;
              objc_copyWeak(&v81, location);
              *(float *)&v27 = v15;
              v28 = v17;
              *((float *)&v27 + 1) = v28;
              *(float *)&v29 = v19;
              v30 = v21;
              *((float *)&v29 + 1) = v30;
              v31.f64[0] = v62;
              v31.f64[1] = v61;
              v32.f64[0] = v64;
              v32.f64[1] = v63;
              +[DKPointSmoothing _interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:](DKPointSmoothing, "_interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:", v80, v27, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v31).i64, v29, COERCE_DOUBLE(__PAIR64__(HIDWORD(v63), v60)));
              objc_destroyWeak(&v81);
              objc_destroyWeak(location);

            }
            -[NSMutableArray addObject:](self->_cachedInterpolatedBrushStrokes, "addObject:", self->_currentInterpolatedBrushStroke);
            v33 = self->_currentInterpolatedBrushStroke;
            self->_currentInterpolatedBrushStroke = 0;

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      }
      while (v4);
    }

    v34 = -[DKInkRenderer maximumPointsForBleedAnimation](self->_renderer, "maximumPointsForBleedAnimation");
    if (-[NSMutableArray count](self->_cachedInterpolatedAnimationPoints, "count"))
      v35 = v34 < 1;
    else
      v35 = 1;
    if (!v35)
    {
      v36 = -[NSMutableArray count](self->_cachedInterpolatedAnimationPoints, "count");
      v37 = -[NSMutableArray count](self->_cachedInterpolatedAnimationPoints, "count");
      v38 = (v36 - v34) & ~((v36 - v34) >> 63);
      -[NSMutableArray subarrayWithRange:](self->_cachedInterpolatedAnimationPoints, "subarrayWithRange:", 0, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray subarrayWithRange:](self->_cachedInterpolatedAnimationPoints, "subarrayWithRange:", v38, v37 - v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v41 = v39;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      if (v42)
      {
        v43 = 0;
        v44 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v77 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
            v75 = 0;
            *(_OWORD *)location = 0u;
            v74 = 0u;
            if (v46)
              objc_msgSend(v46, "dk_renderPointValue");
            if ((v43 & 1) == 0)
              -[DKInkRenderer beginStroke](self->_renderer, "beginStroke");
            renderer = self->_renderer;
            v71[0] = *(_OWORD *)location;
            v71[1] = v74;
            v72 = v75;
            -[DKInkRenderer addPoint:](renderer, "addPoint:", v71);
            v43 = 1;
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
        }
        while (v42);

        -[DKInkRenderer endStroke](self->_renderer, "endStroke");
        -[DKInkRenderer force](self->_renderer, "force");
      }
      else
      {

      }
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v48 = v40;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      if (v49)
      {
        v50 = 0;
        v51 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v49; ++k)
          {
            if (*(_QWORD *)v68 != v51)
              objc_enumerationMutation(v48);
            v53 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
            v75 = 0;
            *(_OWORD *)location = 0u;
            v74 = 0u;
            if (v53)
              objc_msgSend(v53, "dk_renderPointValue");
            if ((v50 & 1) == 0)
              -[DKInkRenderer beginStroke](self->_renderer, "beginStroke");
            v54 = self->_renderer;
            v65[0] = *(_OWORD *)location;
            v65[1] = v74;
            v66 = v75;
            -[DKInkRenderer addPoint:](v54, "addPoint:", v65);
            v50 = 1;
          }
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
        }
        while (v49);

        -[DKInkRenderer endStroke](self->_renderer, "endStroke");
      }
      else
      {

      }
      cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
      self->_cachedInterpolatedAnimationPoints = 0;

      self->_animationType = 0;
    }
  }
  else
  {
    -[DKInkView _setDrawingOnRenderer:](self, "_setDrawingOnRenderer:", v56);
  }

}

void __53__DKInkView__setDrawingOnRendererWithBleedAnimation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renderEmittedPoints:count:", a2, a3);

}

- (void)_setDrawingOnRendererWithReplayAnimation:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *computedAnimationFrames;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *cachedInterpolatedAnimationStrokes;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *currentInterpolatedBrushStroke;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64_t v30;
  double v31;
  double v32;
  unsigned int v33;
  double v34;
  float v35;
  double v36;
  float v37;
  float64x2_t v38;
  float64x2_t v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  NSMutableArray *cachedInterpolatedAnimationPoints;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  float64_t v50;
  float64_t v51;
  float64_t v52;
  float64_t v53;
  _QWORD v54[5];
  id v55;
  id location;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  computedAnimationFrames = self->_computedAnimationFrames;
  self->_computedAnimationFrames = v4;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v45, "strokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  cachedInterpolatedAnimationStrokes = self->_cachedInterpolatedAnimationStrokes;
  self->_cachedInterpolatedAnimationStrokes = v8;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v45, "strokes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v11)
  {
    v47 = *(_QWORD *)v58;
    v46 = v10;
    do
    {
      v48 = v11;
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "strokePoints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") >= 3)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = v14;

          v16 = 0;
          *(_OWORD *)self->_lastVectorPoint = 0u;
          *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
          while (v16 < objc_msgSend(v13, "count") - 2)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v16 + 1;
            objc_msgSend(v13, "objectAtIndexedSubscript:", v16 + 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v16 += 2;
            objc_msgSend(v13, "objectAtIndexedSubscript:", v18 + 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "location");
            v22 = v21;
            objc_msgSend(v17, "location");
            v24 = v23;
            objc_msgSend(v17, "velocity");
            objc_msgSend(v17, "force");
            objc_msgSend(v19, "location");
            v26 = v25;
            objc_msgSend(v19, "location");
            v28 = v27;
            objc_msgSend(v19, "velocity");
            objc_msgSend(v19, "force");
            objc_msgSend(v20, "location");
            v53 = v29;
            objc_msgSend(v20, "location");
            v52 = v30;
            objc_msgSend(v20, "velocity");
            v51 = v31;
            objc_msgSend(v20, "force");
            v50 = v32;
            objc_initWeak(&location, self);
            -[DKPointSmoothing unitScale](self->_inputFIFO, "unitScale");
            v49 = v33;
            v54[0] = MEMORY[0x24BDAC760];
            v54[1] = 3221225472;
            v54[2] = __54__DKInkView__setDrawingOnRendererWithReplayAnimation___block_invoke;
            v54[3] = &unk_24E1B0BE8;
            objc_copyWeak(&v55, &location);
            *(float *)&v34 = v22;
            v35 = v24;
            *((float *)&v34 + 1) = v35;
            *(float *)&v36 = v26;
            v37 = v28;
            *((float *)&v36 + 1) = v37;
            v38.f64[0] = v51;
            v38.f64[1] = v50;
            v39.f64[0] = v53;
            v39.f64[1] = v52;
            v54[4] = &v61;
            +[DKPointSmoothing _interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:](DKPointSmoothing, "_interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:", v54, v34, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v38).i64, v36, COERCE_DOUBLE(__PAIR64__(HIDWORD(v52), v49)));
            objc_destroyWeak(&v55);
            objc_destroyWeak(&location);

          }
          -[NSMutableArray addObject:](self->_cachedInterpolatedAnimationStrokes, "addObject:", self->_currentInterpolatedBrushStroke);
          v40 = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = 0;

        }
        v10 = v46;
      }
      v11 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v11);
  }

  if (*((_BYTE *)v62 + 24))
  {
    -[DKInkView renderer](self, "renderer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "endStroke");

  }
  -[NSMutableArray firstObject](self->_cachedInterpolatedAnimationStrokes, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (NSMutableArray *)objc_msgSend(v42, "mutableCopy");
  cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
  self->_cachedInterpolatedAnimationPoints = v43;

  -[DKInkView _computeAnimationFramesFittingInMaxDuration:](self, "_computeAnimationFramesFittingInMaxDuration:", 15.0);
  _Block_object_dispose(&v61, 8);

}

void __54__DKInkView__setDrawingOnRendererWithReplayAnimation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 1;
      objc_msgSend(WeakRetained, "renderer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginStroke");

      WeakRetained = v9;
    }
  }
  objc_msgSend(WeakRetained, "_renderEmittedPoints:count:", a2, a3);

}

- (void)_computeAnimationFramesFittingInMaxDuration:(double)a3
{
  double *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  NSMutableArray *computedAnimationFrames;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_cachedInterpolatedAnimationStrokes;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v24)
  {
    v4 = (double *)MEMORY[0x24BDBEFB0];
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v6 = *v4;
        v7 = v4[1];
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v10 = 0.0;
        while (v9 < objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "objectAtIndex:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
            objc_msgSend(v11, "dk_renderPointValue");
          if (v6 != *v4 || v7 != v4[1])
            v10 = v10 + DKDistanceBetweenPoints(0.0, 0.0, v6, v7);
          v7 = 0.0;
          v6 = 0.0;
          objc_msgSend(v8, "addObject:", v12);
          if (v10 > 7.0 && v9 > 2 || v9 == objc_msgSend(v5, "count") - 1)
          {
            computedAnimationFrames = self->_computedAnimationFrames;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](computedAnimationFrames, "addObject:", v15);

            v10 = 0.0;
            objc_msgSend(v8, "removeAllObjects");
          }

          ++v9;
        }
        v16 = -[NSMutableArray indexOfObject:](self->_cachedInterpolatedAnimationStrokes, "indexOfObject:", v5) + 1;
        if (v16 < -[NSMutableArray count](self->_cachedInterpolatedAnimationStrokes, "count"))
        {
          objc_msgSend(v5, "lastObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndex:](self->_cachedInterpolatedAnimationStrokes, "objectAtIndex:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 && v18)
          {
            v19 = arc4random_uniform(0x14u) + 10;
            do
            {
              v20 = self->_computedAnimationFrames;
              objc_msgSend(MEMORY[0x24BDBCE30], "array");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v20, "addObject:", v21);

              --v19;
            }
            while (v19);
          }

        }
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v24);
  }

}

- (void)_replayAnimationTick:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray firstObject](self->_computedAnimationFrames, "firstObject", a3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v14 = 0;
        v12 = 0u;
        v13 = 0u;
        if (v8)
          objc_msgSend(v8, "dk_renderPointValue");
        -[DKInkView renderer](self, "renderer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v12;
        v10[1] = v13;
        v11 = v14;
        objc_msgSend(v9, "addPoint:", v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeObjectAtIndex:](self->_computedAnimationFrames, "removeObjectAtIndex:", 0);
}

- (void)inkDidRender:(id)a3
{
  unint64_t renderPreviewMode;
  id v5;

  v5 = a3;
  renderPreviewMode = self->_renderPreviewMode;
  if (renderPreviewMode == 1
    || renderPreviewMode == 2 && !-[DKInkView countOfCurrentStroke](self, "countOfCurrentStroke"))
  {
    -[DKInkView _notifyRenderDelegate](self, "_notifyRenderDelegate");
  }

}

- (void)inkDidCompleteRender:(id)a3
{
  void (**animationCompletionHandler)(id, SEL, id);
  id v5;

  animationCompletionHandler = (void (**)(id, SEL, id))self->_animationCompletionHandler;
  if (animationCompletionHandler)
  {
    animationCompletionHandler[2](animationCompletionHandler, a2, a3);
    v5 = self->_animationCompletionHandler;
    self->_animationCompletionHandler = 0;

  }
}

- (void)undoLastStroke
{
  NSUndoManager *strokeUndoManager;

  strokeUndoManager = self->_strokeUndoManager;
  if (strokeUndoManager)
  {
    -[NSUndoManager undo](strokeUndoManager, "undo");
    if (!-[NSUndoManager canUndo](self->_strokeUndoManager, "canUndo"))
      -[NSUndoManager removeAllActions](self->_strokeUndoManager, "removeAllActions");
  }
}

- (void)_undoLastStroke:(id)a3
{
  void *v4;
  CGSize v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  double v10[4];
  CGPoint v11;
  CGSize v12;
  unint64_t v13;
  __int128 v14;
  int v15;

  objc_msgSend(a3, "getValue:size:", v10, 104);
  -[DKDrawing mutableStrokes](self->_currentDrawing, "mutableStrokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  objc_msgSend(v4, "removeLastObject");
  -[DKDrawing setStrokesFrame:](self->_currentDrawing, "setStrokesFrame:", v10[0], v10[1], v10[2], v10[3]);
  self->_totalPointsAdded = v13;
  -[NSMutableArray removeLastObject](self->_cachedInterpolatedBrushStrokes, "removeLastObject");
  v5 = v12;
  self->_unionDrawingRect.origin = v11;
  self->_unionDrawingRect.size = v5;
  LODWORD(v5.width) = v15;
  v9[0] = v14;
  v9[1] = v5;
  -[DKInkView setLastVectorPoint:](self, "setLastVectorPoint:", v9);
  -[DKInkView renderer](self, "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeLastStroke");

  -[DKInkView renderer](self, "renderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView renderer](self, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setNeedsDisplayInRect:");

  -[DKInkView _notifyRenderDelegate](self, "_notifyRenderDelegate");
}

- (void)startStroke:(DKInkView *)self
{
  float32x2_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGSize size;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *cachedInterpolatedBrushStrokes;
  NSMutableArray *v16;
  NSMutableArray *currentInterpolatedBrushStroke;
  DKDrawingStroke *v18;
  DKDrawingStroke *currentBrushStroke;
  void *v20;
  float32x2_t v21;
  _OWORD v22[2];
  _QWORD v23[4];
  CGPoint origin;
  CGSize v25;
  uint64_t v26;
  unint64_t totalPointsAdded;
  __int128 v28;
  int v29;

  v21 = v2;
  -[DKInkView currentDrawing](self, "currentDrawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v5, "count");

  -[DKInkView currentDrawing](self, "currentDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "strokesFrame");
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  v23[3] = v10;

  totalPointsAdded = self->_totalPointsAdded;
  size = self->_unionDrawingRect.size;
  origin = self->_unionDrawingRect.origin;
  v25 = size;
  v28 = *(_OWORD *)self->_lastVectorPoint;
  v29 = *(_DWORD *)&self->_lastVectorPoint[16];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v23, "{?={CGRect={CGPoint=dd}{CGSize=dd}}{CGRect={CGPoint=dd}{CGSize=dd}}qQfffff}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInkView strokeUndoManager](self, "strokeUndoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerUndoWithTarget:selector:object:", self, sel__undoLastStroke_, v12);

  -[DKInkView setStrokeStartTime:](self, "setStrokeStartTime:", CFAbsoluteTimeGetCurrent());
  -[DKInkView setStrokeLastLocation:](self, "setStrokeLastLocation:", vcvtq_f64_f32(v21));
  -[DKInkView strokeLastLocation](self, "strokeLastLocation");
  -[DKInkView setStrokeStartLocation:](self, "setStrokeStartLocation:");
  -[DKInkView setTotalPointsAdded:](self, "setTotalPointsAdded:", 0);
  memset(v22, 0, sizeof(v22));
  -[DKInkView setLastVectorPoint:](self, "setLastVectorPoint:", v22);
  if (!self->_cachedInterpolatedBrushStrokes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
    self->_cachedInterpolatedBrushStrokes = v14;

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2000);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = v16;

  v18 = (DKDrawingStroke *)objc_opt_new();
  currentBrushStroke = self->_currentBrushStroke;
  self->_currentBrushStroke = v18;

  -[DKPointSmoothing clear](self->_inputFIFO, "clear");
  -[DKInkView renderer](self, "renderer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "beginStroke");

}

- (void)continueStroke:(DKInkView *)self
{
  float32x2_t v2;
  double v4;

  v4 = *(double *)&v2;
  -[DKInkView setStrokeLastLocation:](self, "setStrokeLastLocation:", vcvtq_f64_f32(v2));
  -[DKPointSmoothing addPoint:](self->_inputFIFO, "addPoint:", v4);
}

- (void)continueStrokeWithoutSmoothing:(DKInkView *)self
{
  __int128 v2;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v5;

  -[DKInkView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  -[DKPointSmoothing emissionHandler](self->_inputFIFO, "emissionHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, __int128 *, uint64_t, _QWORD, _QWORD))v4)[2](v4, &v5, 1, 0, 0);

  -[DKInkView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 0);
}

- (void)terminateStroke
{
  double Current;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  unsigned int v18;
  double v19;
  float64x2_t v20;
  int32x4_t v21;
  DKDrawingStroke *currentBrushStroke;
  NSMutableArray *currentInterpolatedBrushStroke;
  id v24[2];
  float64_t v25;
  void *v26;

  -[DKPointSmoothing flush](self->_inputFIFO, "flush");
  Current = CFAbsoluteTimeGetCurrent();
  -[DKInkView strokeStartTime](self, "strokeStartTime");
  v5 = v4;
  if (-[DKInkView totalPointsAdded](self, "totalPointsAdded"))
  {
    if (-[DKInkView totalPointsAdded](self, "totalPointsAdded") <= 9)
    {
      v6 = Current - v5;
      if (Current - v5 > 0.0 && v6 < 0.2)
      {
        -[DKInkView strokeStartLocation](self, "strokeStartLocation");
        v8 = v7;
        *(_OWORD *)v24 = v9;
        -[DKInkView strokeLastLocation](self, "strokeLastLocation");
        v11 = v10;
        v13 = v12;
        v14 = DKDistanceBetweenPoints(v8, *(double *)v24, v10, v12);
        v6 = 15.0;
        if (v14 < 15.0)
        {
          if (v14 > 0.0)
          {
            objc_msgSend((id)objc_opt_class(), "normalizeVectorPoint:", v11 - v8, v13 - *(double *)v24);
            v8 = v8 + v14 * v15 * 0.5;
            *((id *)&v17 + 1) = v24[1];
            *(double *)&v17 = *(double *)v24 + v14 * v16 * 0.5;
            *(_OWORD *)v24 = v17;
          }
          -[DKInkView currentWeight](self, "currentWeight", *(_OWORD *)v24);
          *(float *)&v18 = v8;
          v20.f64[0] = v25;
          v20.f64[1] = fmax(v19, 2.4);
          *(float32x2_t *)v21.i8 = vcvt_f32_f64(v20);
          -[DKInkView continueStrokeWithoutSmoothing:](self, "continueStrokeWithoutSmoothing:", *(double *)vtrn1q_s32((int32x4_t)v18, vzip1q_s32(v21, v21)).i64);
        }
      }
    }
  }
  if (self->_currentInterpolatedBrushStroke)
    -[NSMutableArray addObject:](self->_cachedInterpolatedBrushStrokes, "addObject:", v6);
  if (self->_currentBrushStroke)
  {
    -[DKDrawing addBrushStroke:](self->_currentDrawing, "addBrushStroke:", v6);
    currentBrushStroke = self->_currentBrushStroke;
  }
  else
  {
    currentBrushStroke = 0;
  }
  self->_currentBrushStroke = 0;

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = 0;

  -[DKInkView renderer](self, "renderer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "endStroke");

}

- (double)weightForValue:(double)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__DKInkView_weightForValue___block_invoke;
  block[3] = &unk_24E1B0C38;
  block[4] = self;
  if (-[DKInkView weightForValue:]::onceToken != -1)
    dispatch_once(&-[DKInkView weightForValue:]::onceToken, block);
  v4 = a3;
  v5 = fminf(fmaxf((float)(v4 + -0.3) + (float)(v4 + -0.3), 0.0), 1.0);
  v6 = (float)(v5 * v5) * (float)((float)(v5 * -2.0) + 3.0);
  v7 = *(double *)&-[DKInkView weightForValue:]::MIN_PRESSURE;
  v8 = *(double *)&-[DKInkView weightForValue:]::MAX_PRESSURE;
  if (v6 <= v8)
    v8 = v6;
  if (v6 >= v7)
    return v8;
  return v7;
}

uint64_t __28__DKInkView_weightForValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "minPressure");
  -[DKInkView weightForValue:]::MIN_PRESSURE = v2;
  result = objc_msgSend(*(id *)(a1 + 32), "maxPressure");
  -[DKInkView weightForValue:]::MAX_PRESSURE = v4;
  return result;
}

- (BOOL)ak_forceAvailableForTouch:(id)a3
{
  double v3;

  objc_msgSend(a3, "maximumPossibleForce");
  return v3 != 0.0;
}

- (double)weightForTouch:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = 0.0;
  if (-[DKInkView ak_forceAvailableForTouch:](self, "ak_forceAvailableForTouch:", v4))
  {
    objc_msgSend(v4, "force");
    v7 = v6;
    objc_msgSend(v4, "maximumPossibleForce");
    -[DKInkView weightForValue:](self, "weightForValue:", v7 / v8);
    v5 = v9;
  }

  return v5;
}

- (CGPoint)_velocityForTouch:(id)a3
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
  double v16;
  double v17;
  double v18;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "previousLocationInView:", 0);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "locationInView:", 0);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "timestamp");
  v14 = v13 - self->_lastTouchTime;
  if (v14 >= 0.001)
  {
    v16 = (v10 - v6) / v14;
    v15 = (v12 - v8) / v14;
  }
  else
  {
    v16 = *MEMORY[0x24BDBEFB0];
    v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v17 = v16;
  v18 = v15;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (self->_allowInput)
  {
    self->_lastTouchTime = 0.0;
    self->_trackingTouches = 1;
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKInkView _vector4ForTouchSettingWeightAndVelocity:average:](self, "_vector4ForTouchSettingWeightAndVelocity:average:", v8, 0);
    -[DKInkView startStroke:](self, "startStroke:");
    objc_msgSend(v8, "locationInView:", self);
    -[DKInkView _postTouchesBeganNotification:](self, "_postTouchesBeganNotification:");

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DKInkView;
    -[DKInkView touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (self->_allowInput)
  {
    self->_trackingTouches = 1;
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "coalescedTouchesForTouch:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKInkView handleCoalescedTouches:forTouch:average:](self, "handleCoalescedTouches:forTouch:average:", v9, v8, 1);

    }
    else
    {
      -[DKInkView _vector4ForTouchSettingWeightAndVelocity:average:](self, "_vector4ForTouchSettingWeightAndVelocity:average:", v8, 0);
      -[DKInkView continueStroke:](self, "continueStroke:");
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DKInkView;
    -[DKInkView touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (self->_allowInput)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKInkView _vector4ForTouchSettingWeightAndVelocity:average:](self, "_vector4ForTouchSettingWeightAndVelocity:average:", v8, 1);
    -[DKInkView continueStroke:](self, "continueStroke:");
    -[DKInkView terminateStroke](self, "terminateStroke");
    self->_trackingTouches = 0;
    objc_msgSend(v8, "locationInView:", self);
    -[DKInkView _postTouchesEndedNotification:](self, "_postTouchesEndedNotification:");

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DKInkView;
    -[DKInkView touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (self->_allowInput)
  {
    -[DKDrawingStroke strokePoints](self->_currentBrushStroke, "strokePoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[DKInkView terminateStroke](self, "terminateStroke");
    if (v9 <= 4)
      -[NSUndoManager undo](self->_strokeUndoManager, "undo");
    self->_trackingTouches = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DKInkView;
    -[DKInkView touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v6, v7);
  }

}

- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4 average:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[DKInkView _vector4ForTouchSettingWeightAndVelocity:average:](self, "_vector4ForTouchSettingWeightAndVelocity:average:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), v5, (_QWORD)v11);
        -[DKInkView continueStroke:](self, "continueStroke:");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (__n128)_vector4ForTouchSettingWeightAndVelocity:(void *)a3 average:(uint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float32x2_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float64x2_t v21;
  float v22;
  float64x2_t v24;
  float64_t v25;
  float64_t v26;
  float64x2_t v27;

  v6 = a3;
  objc_msgSend(v6, "locationInView:", a1);
  v25 = v8;
  v26 = v7;
  objc_msgSend((id)a1, "weightForTouch:", v6);
  v10 = v9;
  objc_msgSend((id)a1, "setCurrentWeight:");
  objc_msgSend((id)a1, "_updateVelocityWithTouch:average:", v6, a4);
  v24 = *(float64x2_t *)(a1 + 456);
  objc_msgSend((id)a1, "minThickness");
  v12 = v11;
  objc_msgSend((id)a1, "maxThickness");
  v14 = vcvt_f32_f64(v24);
  v15 = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
  if (v15 >= *(float *)&MaxVelocityValue)
    v15 = *(float *)&MaxVelocityValue;
  v16 = fminf(fmaxf(v15 / (float)(*(float *)&MaxVelocityValue * 0.5), 0.0), 1.0);
  v17 = 1.0 - (float)((float)(v16 * v16) * (float)((float)(v16 * -2.0) + 3.0));
  v18 = v13;
  v19 = (float)(v17 * v17) * v18;
  if (v19 <= v18)
    v18 = v19;
  v20 = v12;
  if (v19 < v20)
    v18 = v12;
  v21.f64[0] = v26;
  v21.f64[1] = v25;
  *(float32x2_t *)&v21.f64[0] = vcvt_f32_f64(v21);
  *(float *)&v21.f64[1] = v18;
  v22 = v10;
  *((float *)&v21.f64[1] + 1) = v22;
  v27 = v21;

  return (__n128)v27;
}

- (void)_updateVelocityWithTouch:(id)a3 average:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a4;
  v6 = a3;
  x = self->_velocityInWindow.x;
  y = self->_velocityInWindow.y;
  v12 = v6;
  -[DKInkView _velocityForTouch:](self, "_velocityForTouch:");
  if (v4)
  {
    v10 = y * 0.15 + v10 * 0.85;
    v9 = x * 0.15 + v9 * 0.85;
  }
  self->_velocityInWindow.x = v9;
  self->_velocityInWindow.y = v10;
  objc_msgSend(v12, "timestamp");
  self->_lastTouchTime = v11;

}

+ (CGVector)normalizeVector:(CGVector)a3
{
  double dy;
  double dx;
  double v5;
  double v6;
  double v7;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  objc_msgSend(a1, "lengthOfVector:");
  v6 = dy / v5;
  v7 = dx / v5;
  result.dy = v6;
  result.dx = v7;
  return result;
}

- (BOOL)trackingTouches
{
  return self->_trackingTouches;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)minPressure
{
  return self->_minPressure;
}

- (void)setMinPressure:(double)a3
{
  self->_minPressure = a3;
}

- (double)maxPressure
{
  return self->_maxPressure;
}

- (void)setMaxPressure:(double)a3
{
  self->_maxPressure = a3;
}

- (double)minThickness
{
  return self->_minThickness;
}

- (void)setMinThickness:(double)a3
{
  self->_minThickness = a3;
}

- (double)maxThickness
{
  return self->_maxThickness;
}

- (void)setMaxThickness:(double)a3
{
  self->_maxThickness = a3;
}

- (DKInkRenderer)renderer
{
  return self->_renderer;
}

- (DKDrawingStroke)currentBrushStroke
{
  return self->_currentBrushStroke;
}

- (void)setCurrentBrushStroke:(id)a3
{
  objc_storeStrong((id *)&self->_currentBrushStroke, a3);
}

- (NSMutableArray)currentInterpolatedBrushStroke
{
  return self->_currentInterpolatedBrushStroke;
}

- (void)setCurrentInterpolatedBrushStroke:(id)a3
{
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, a3);
}

- (NSMutableArray)cachedInterpolatedBrushStrokes
{
  return self->_cachedInterpolatedBrushStrokes;
}

- (void)setCachedInterpolatedBrushStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, a3);
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (unint64_t)totalPointsAdded
{
  return self->_totalPointsAdded;
}

- (void)setTotalPointsAdded:(unint64_t)a3
{
  self->_totalPointsAdded = a3;
}

- (CGPoint)strokeStartLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_strokeStartLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStrokeStartLocation:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_strokeStartLocation, &v3, 16, 1, 0);
}

- (CGPoint)strokeLastLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_strokeLastLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStrokeLastLocation:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_strokeLastLocation, &v3, 16, 1, 0);
}

- (double)strokeStartTime
{
  return self->_strokeStartTime;
}

- (void)setStrokeStartTime:(double)a3
{
  self->_strokeStartTime = a3;
}

- (BOOL)isAddingPointWithoutSmoothing
{
  return self->_isAddingPointWithoutSmoothing;
}

- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3
{
  self->_isAddingPointWithoutSmoothing = a3;
}

- (__n128)lastVectorPoint
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 720);
  v3 = *(_OWORD *)(a1 + 736);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setLastVectorPoint:(DKInkView *)self
{
  _OWORD *v2;
  __int128 v3;

  v3 = v2[1];
  *(_OWORD *)self->_lastVectorPoint = *v2;
  *(_OWORD *)&self->_lastVectorPoint[16] = v3;
}

- (DKPointSmoothing)inputFIFO
{
  return self->_inputFIFO;
}

- (void)setInputFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_inputFIFO, a3);
}

- (CGRect)aggregateInvalid
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_aggregateInvalid.origin.x;
  y = self->_aggregateInvalid.origin.y;
  width = self->_aggregateInvalid.size.width;
  height = self->_aggregateInvalid.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAggregateInvalid:(CGRect)a3
{
  self->_aggregateInvalid = a3;
}

- (CGRect)unionDrawingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unionDrawingRect.origin.x;
  y = self->_unionDrawingRect.origin.y;
  width = self->_unionDrawingRect.size.width;
  height = self->_unionDrawingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnionDrawingRect:(CGRect)a3
{
  self->_unionDrawingRect = a3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (NSMutableArray)cachedInterpolatedAnimationPoints
{
  return self->_cachedInterpolatedAnimationPoints;
}

- (void)setCachedInterpolatedAnimationPoints:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationPoints, a3);
}

- (NSMutableArray)cachedInterpolatedAnimationStrokes
{
  return self->_cachedInterpolatedAnimationStrokes;
}

- (void)setCachedInterpolatedAnimationStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationStrokes, a3);
}

- (NSMutableArray)computedAnimationFrames
{
  return self->_computedAnimationFrames;
}

- (void)setComputedAnimationFrames:(id)a3
{
  objc_storeStrong((id *)&self->_computedAnimationFrames, a3);
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (NSUndoManager)strokeUndoManager
{
  return self->_strokeUndoManager;
}

- (void)setStrokeUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_strokeUndoManager, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)scaleDrawingToFitCanvas
{
  return self->_scaleDrawingToFitCanvas;
}

- (BOOL)allowInput
{
  return self->_allowInput;
}

- (void)setAllowInput:(BOOL)a3
{
  self->_allowInput = a3;
}

- (BOOL)isRenderingPaused
{
  return self->_isRenderingPaused;
}

- (DKInkViewRenderDelegate)renderPreviewDelegate
{
  return (DKInkViewRenderDelegate *)objc_loadWeakRetained((id *)&self->_renderPreviewDelegate);
}

- (void)setRenderPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_renderPreviewDelegate, a3);
}

- (unint64_t)renderPreviewMode
{
  return self->_renderPreviewMode;
}

- (void)setRenderPreviewMode:(unint64_t)a3
{
  self->_renderPreviewMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderPreviewDelegate);
  objc_storeStrong((id *)&self->_strokeUndoManager, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_computedAnimationFrames, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationStrokes, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationPoints, 0);
  objc_storeStrong((id *)&self->_inputFIFO, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, 0);
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, 0);
  objc_storeStrong((id *)&self->_currentBrushStroke, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong(&self->_animationCompletionHandler, 0);
  objc_storeStrong(&self->_trackingTouchID, 0);
  objc_storeStrong((id *)&self->_currentDrawing, 0);
}

@end
