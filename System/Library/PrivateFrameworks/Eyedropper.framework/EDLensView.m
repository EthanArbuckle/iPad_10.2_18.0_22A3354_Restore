@implementation EDLensView

- (id)dragItemsForInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v5, "backgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD15F0]);
  v8 = (void *)MEMORY[0x24BDBF638];
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "colorWithCGColor:", objc_msgSend(v9, "CGColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithObject:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v12);
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (EDLensView)initWithFrame:(CGRect)a3
{
  EDLensView *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *hoverColorRingView;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIView *ringBorderView;
  void *v21;
  uint64_t v22;
  UIView *screenshotSurfaceView;
  uint64_t v24;
  void *v25;
  EDGridView *v26;
  EDGridView *gridView;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIView *hoverColorCenterView;
  void *v33;
  uint64_t v34;
  EDColorAnalyzer *colorAnalyzer;
  uint64_t v36;
  CADisplayLink *displayLink;
  CADisplayLink *v38;
  void *v39;
  uint64_t v40;
  UIPointerInteraction *pointerInteraction;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)EDLensView;
  v3 = -[EDLensView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[EDLensView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowColor:", v5);

    -[EDLensView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1050253722;
    objc_msgSend(v7, "setShadowOpacity:", v8);

    -[EDLensView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowRadius:", 20.0);

    -[EDLensView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowOffset:", 0.0, 1.0);

    -[EDLensView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableUpdateMask:", 2);

    v12 = objc_opt_new();
    hoverColorRingView = v3->_hoverColorRingView;
    v3->_hoverColorRingView = (UIView *)v12;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_hoverColorRingView, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGColor");
    -[UIView layer](v3->_hoverColorRingView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderColor:", v16);

    -[UIView layer](v3->_hoverColorRingView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderWidth:", 3.0);

    -[UIView setUserInteractionEnabled:](v3->_hoverColorRingView, "setUserInteractionEnabled:", 0);
    -[EDLensView addSubview:](v3, "addSubview:", v3->_hoverColorRingView);
    v19 = objc_opt_new();
    ringBorderView = v3->_ringBorderView;
    v3->_ringBorderView = (UIView *)v19;

    -[UIView setClipsToBounds:](v3->_ringBorderView, "setClipsToBounds:", 1);
    -[UIView layer](v3->_ringBorderView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 13.0);

    -[EDLensView addSubview:](v3, "addSubview:", v3->_ringBorderView);
    v22 = objc_opt_new();
    screenshotSurfaceView = v3->_screenshotSurfaceView;
    v3->_screenshotSurfaceView = (UIView *)v22;

    -[UIView setClipsToBounds:](v3->_screenshotSurfaceView, "setClipsToBounds:", 1);
    v24 = *MEMORY[0x24BDE5BB0];
    -[UIView layer](v3->_screenshotSurfaceView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMagnificationFilter:", v24);

    -[UIView setUserInteractionEnabled:](v3->_screenshotSurfaceView, "setUserInteractionEnabled:", 0);
    -[EDLensView addSubview:](v3, "addSubview:", v3->_screenshotSurfaceView);
    v26 = -[EDGridView initWithWithCellCount:]([EDGridView alloc], "initWithWithCellCount:", 9);
    gridView = v3->_gridView;
    v3->_gridView = v26;

    -[EDGridView setClipsToBounds:](v3->_gridView, "setClipsToBounds:", 1);
    -[EDGridView layer](v3->_gridView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBorderWidth:", 5.0);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDGridView setBackgroundColor:](v3->_gridView, "setBackgroundColor:", v29);

    -[EDGridView layer](v3->_gridView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMagnificationFilter:", v24);

    -[EDGridView setUserInteractionEnabled:](v3->_gridView, "setUserInteractionEnabled:", 0);
    -[EDLensView addSubview:](v3, "addSubview:", v3->_gridView);
    v31 = objc_opt_new();
    hoverColorCenterView = v3->_hoverColorCenterView;
    v3->_hoverColorCenterView = (UIView *)v31;

    -[UIView layer](v3->_hoverColorCenterView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBorderWidth:", 4.0);

    -[UIView _setContinuousCornerRadius:](v3->_hoverColorCenterView, "_setContinuousCornerRadius:", 2.0);
    -[EDLensView addSubview:](v3, "addSubview:", v3->_hoverColorCenterView);
    v34 = objc_opt_new();
    colorAnalyzer = v3->_colorAnalyzer;
    v3->_colorAnalyzer = (EDColorAnalyzer *)v34;

    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", v3, sel__displayLinkFired);
    v36 = objc_claimAutoreleasedReturnValue();
    displayLink = v3->_displayLink;
    v3->_displayLink = (CADisplayLink *)v36;

    v38 = v3->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v38, "addToRunLoop:forMode:", v39, *MEMORY[0x24BDBCB80]);

    -[CADisplayLink setPaused:](v3->_displayLink, "setPaused:", 1);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C78]), "initWithDelegate:", v3);
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v40;

    -[EDLensView addInteraction:](v3, "addInteraction:", v3->_pointerInteraction);
  }
  return v3;
}

- (void)_layoutStaticElements
{
  CGFloat v3;
  void *v4;
  CGFloat v5;
  void *v6;
  CGFloat v7;
  void *v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  -[EDLensView bounds](self, "bounds");
  v27 = CGRectInset(v26, 70.0, 70.0);
  -[UIView setFrame:](self->_ringBorderView, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  -[UIView bounds](self->_ringBorderView, "bounds");
  v3 = CGRectGetWidth(v28) * 0.5;
  -[UIView layer](self->_ringBorderView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[EDLensView bounds](self, "bounds");
  v30 = CGRectInset(v29, 83.0, 83.0);
  -[UIView setFrame:](self->_screenshotSurfaceView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  -[UIView bounds](self->_screenshotSurfaceView, "bounds");
  v5 = CGRectGetWidth(v31) * 0.5;
  -[UIView layer](self->_screenshotSurfaceView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[EDLensView bounds](self, "bounds");
  v33 = CGRectInset(v32, 82.0, 82.0);
  -[EDGridView setFrame:](self->_gridView, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  -[UIView bounds](self->_screenshotSurfaceView, "bounds");
  v7 = CGRectGetWidth(v34) * 0.5;
  -[EDGridView layer](self->_gridView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  -[UIView bounds](self->_screenshotSurfaceView, "bounds");
  v9 = CGRectGetWidth(v35) / 9.0;
  -[UIView layer](self->_hoverColorCenterView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borderWidth");
  v12 = v11;

  -[UIView setFrame:](self->_hoverColorCenterView, "setFrame:", -v12, -v12, v9 + v12, v9 + v12);
  -[UIView center](self->_ringBorderView, "center");
  -[UIView setCenter:](self->_hoverColorCenterView, "setCenter:");
  v13 = 0.4;
  if (self->_hoverColorBrightness <= 0.9)
    v13 = 1.0;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v13, 0.7);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0.6;
  if (self->_hoverColorBrightness <= 0.9)
    v14 = 1.0;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v14, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ColorUIColor(self->_hoverColor.r, self->_hoverColor.g, self->_hoverColor.b);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "CGColor");
  -[UIView layer](self->_ringBorderView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderColor:", v17);

  v19 = objc_retainAutorelease(v15);
  v20 = objc_msgSend(v19, "CGColor");
  -[UIView layer](self->_hoverColorCenterView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBorderColor:", v20);

  -[EDGridView setStrokeColor:](self->_gridView, "setStrokeColor:", v25);
  v22 = objc_retainAutorelease(v19);
  v23 = objc_msgSend(v22, "CGColor");
  -[EDGridView layer](self->_gridView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBorderColor:", v23);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDLensView;
  -[EDLensView layoutSubviews](&v3, sel_layoutSubviews);
  -[EDLensView _layoutStaticElements](self, "_layoutStaticElements");
  -[EDLensView setCenter:](self, "setCenter:", self->_lastPosition.x, self->_lastPosition.y);
  -[EDLensView setAlpha:](self, "setAlpha:", (double)-[EDLensView isActive](self, "isActive"));
}

- (CGPoint)_lensViewLocalCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[UIView center](self->_screenshotSurfaceView, "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  return CFSTR("Eyedropper hovering over color");
}

- (id)accessibilityValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RGB value is R: %.2f., G: %.2f., B: %.2f."), *(_QWORD *)&self->_hoverColor.r, *(_QWORD *)&self->_hoverColor.g, *(_QWORD *)&self->_hoverColor.b);
}

- (unint64_t)accessibilityTraits
{
  BOOL v2;

  if (*MEMORY[0x24BDF7430])
    v2 = *MEMORY[0x24BDF73B0] == 0;
  else
    v2 = 1;
  return !v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
    self->_interfaceOrientation = a3;
}

- (void)updateCenterOffsetAtTouchDown:(CGPoint)a3
{
  double y;
  double x;
  CGPoint *p_centerOffsetAtTouchDown;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  if (!-[EDLensView floatingMode](self, "floatingMode"))
  {
    p_centerOffsetAtTouchDown = &self->_centerOffsetAtTouchDown;
LABEL_6:
    p_centerOffsetAtTouchDown->x = 0.0;
    p_centerOffsetAtTouchDown->y = 0.0;
    return;
  }
  -[UIView convertPoint:fromView:](self->_hoverColorCenterView, "convertPoint:fromView:", 0, x, y);
  p_centerOffsetAtTouchDown = &self->_centerOffsetAtTouchDown;
  self->_centerOffsetAtTouchDown.x = v7;
  self->_centerOffsetAtTouchDown.y = v8;
  -[EDLensView size](self, "size");
  if (fabs(self->_centerOffsetAtTouchDown.x) >= v10 * 0.5 || fabs(self->_centerOffsetAtTouchDown.y) >= v9 * 0.5)
    goto LABEL_6;
}

- (void)_updateLastPosition:(CGPoint)a3
{
  self->_lastPosition = a3;
  -[EDLensView setNeedsLayout](self, "setNeedsLayout");
}

- (void)presentAtLocation:(CGPoint)a3
{
  -[EDLensView _updateLastPosition:](self, "_updateLastPosition:", a3.x, a3.y);
  -[EDLensView layoutIfNeeded](self, "layoutIfNeeded");
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  -[EDLensView setNeedsLayout](self, "setNeedsLayout");
}

- (void)selectColor
{
  void *v3;
  id v4;

  -[EDLensView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  ColorUIColor(self->_hoverColor.r, self->_hoverColor.g, self->_hoverColor.b);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lensView:didSelectColor:", self, v3);

}

- (void)setActive:(BOOL)a3
{
  CADisplayLink *displayLink;
  void *v5;
  _QWORD v6[5];

  if (self->_active != a3)
  {
    self->_active = a3;
    displayLink = self->_displayLink;
    if (a3)
    {
      -[CADisplayLink setPaused:](displayLink, "setPaused:", 0);
      -[EDLensView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lensViewDidActivate:", self);

    }
    else
    {
      -[CADisplayLink setPaused:](displayLink, "setPaused:", 1);
    }
    -[EDLensView setNeedsLayout](self, "setNeedsLayout");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __24__EDLensView_setActive___block_invoke;
    v6[3] = &unk_24F24FB70;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v6, 0, 0.2, 0.0, 1.0, 0.0);
  }
}

uint64_t __24__EDLensView_setActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateLensViewWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[EDLensView window](self, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "locationInView:", v10);
        v12 = v11;
        v14 = v13;

        -[EDLensView _updateLastPosition:](self, "_updateLastPosition:", v12 - self->_centerOffsetAtTouchDown.x, v14 - self->_centerOffsetAtTouchDown.y);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (BOOL)_isScreenScaleEven
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[EDLensView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = ((int)v4 & 1) == 0;

  return v5;
}

- (void)_displayLinkFired
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MidX;
  CGFloat MidY;
  double v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __IOSurface *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  _QWORD v41[4];
  _QWORD v42[7];
  _QWORD v43[8];
  CGRect v44;
  CGRect v45;

  v43[7] = *MEMORY[0x24BDAC8D0];
  -[EDLensView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "scale");
  v9 = v8;
  -[EDLensView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v44.origin.x = v13;
  v44.origin.y = v15;
  v44.size.width = v17;
  v44.size.height = v19;
  MidX = CGRectGetMidX(v44);
  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  MidY = CGRectGetMidY(v45);
  v22 = 9.0 / v9 * 0.5;
  v23 = MidX - v22;
  v24 = MidY - v22;
  v25 = *MEMORY[0x24BDF8228];
  v43[0] = v7;
  v26 = *MEMORY[0x24BDF81F8];
  v42[0] = v25;
  v42[1] = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "gamut"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BDF8200];
  v43[1] = v27;
  v43[2] = MEMORY[0x24BDBD1C8];
  v29 = *MEMORY[0x24BDF8208];
  v42[2] = v28;
  v42[3] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BDF8218];
  v43[3] = v30;
  v43[4] = &unk_24F2523A0;
  v32 = *MEMORY[0x24BDF8210];
  v42[4] = v31;
  v42[5] = v32;
  v43[5] = MEMORY[0x24BDBD1C0];
  v42[6] = *MEMORY[0x24BDF8220];
  *(double *)v41 = v23;
  *(CGFloat *)&v41[1] = v24;
  *(double *)&v41[2] = 9.0 / v9;
  *(double *)&v41[3] = 9.0 / v9;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v41, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (__IOSurface *)_UIRenderDisplay();
  -[UIView layer](self->_screenshotSurfaceView, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContents:", v35);

  IOSurfaceLock(v35, 1u, 0);
  -[EDColorAnalyzer colorAtCenterOfSurface:offset:](self->_colorAnalyzer, "colorAtCenterOfSurface:offset:", v35, 0.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = ColorMakeWithColor(v37);
  self->_hoverColor.r = v38;
  self->_hoverColor.g = v39;
  self->_hoverColor.b = v40;
  self->_hoverColorBrightness = v39 * 0.59 + v38 * 0.3 + v40 * 0.11;
  IOSurfaceUnlock(v35, 1u, 0);
  -[EDLensView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __31__EDLensView__displayLinkFired__block_invoke()
{
  return _UIRenderingBufferCreate();
}

- (int64_t)_lensPosition
{
  double MinY;
  void *v4;
  double v5;
  double MaxY;
  void *v7;
  double v8;
  double MinX;
  void *v10;
  double v11;
  double MaxX;
  void *v13;
  double v14;
  int64_t v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[EDLensView frame](self, "frame");
  MinY = CGRectGetMinY(v17);
  -[EDLensView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetMinY(v18);

  -[EDLensView frame](self, "frame");
  MaxY = CGRectGetMaxY(v19);
  -[EDLensView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetMaxY(v20);

  -[EDLensView frame](self, "frame");
  MinX = CGRectGetMinX(v21);
  -[EDLensView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetMinX(v22);

  -[EDLensView frame](self, "frame");
  MaxX = CGRectGetMaxX(v23);
  -[EDLensView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v14 = CGRectGetMaxX(v24);

  if (MinY >= v5)
  {
    if (MaxY <= v8)
    {
      if (MinX >= v11)
        return 2 * (MaxX > v14);
      else
        return 1;
    }
    else if (MinX >= v11)
    {
      if (MaxX <= v14)
        return 4;
      else
        return 8;
    }
    else
    {
      return 7;
    }
  }
  else
  {
    v15 = 3;
    if (MaxX > v14)
      v15 = 6;
    if (MinX >= v11)
      return v15;
    else
      return 5;
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_ringBorderView, "frame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGRect v6;
  CGRect v7;

  -[UIView frame](self->_hoverColorCenterView, "frame", a3, a4, a5);
  v7 = CGRectInset(v6, -10.0, -10.0);
  return (id)objc_msgSend(MEMORY[0x24BDF6C88], "regionWithRect:identifier:", CFSTR("CenterView"), v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDF6C98], "hiddenPointerStyle", a3, a4);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (EDLensViewDelegate)delegate
{
  return (EDLensViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)floatingMode
{
  return self->_floatingMode;
}

- (void)setFloatingMode:(BOOL)a3
{
  self->_floatingMode = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CGPoint)lastPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastPosition.x;
  y = self->_lastPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPosition:(CGPoint)a3
{
  self->_lastPosition = a3;
}

- (CGPoint)centerOffsetAtTouchDown
{
  double x;
  double y;
  CGPoint result;

  x = self->_centerOffsetAtTouchDown.x;
  y = self->_centerOffsetAtTouchDown.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterOffsetAtTouchDown:(CGPoint)a3
{
  self->_centerOffsetAtTouchDown = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_colorAnalyzer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_ringBorderView, 0);
  objc_storeStrong((id *)&self->_screenshotSurfaceView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_hoverColorRingView, 0);
  objc_storeStrong((id *)&self->_hoverColorCenterView, 0);
}

@end
