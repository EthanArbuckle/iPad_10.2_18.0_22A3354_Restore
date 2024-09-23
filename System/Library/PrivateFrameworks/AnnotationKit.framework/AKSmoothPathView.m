@implementation AKSmoothPathView

+ (id)newSmoothPathViewForCurrentPlatformWithController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithController:", v3);

  return v4;
}

- (AKSmoothPathView)initWithController:(id)a3
{
  id v4;
  AKSmoothPathView *v5;
  AKSmoothPathView *v6;

  v4 = a3;
  v5 = -[AKSmoothPathView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
    -[AKSmoothPathView setController:](v5, "setController:", v4);

  return v6;
}

- (AKSmoothPathView)initWithFrame:(CGRect)a3
{
  AKSmoothPathView *v3;
  AKSmoothPathView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSmoothPathView;
  v3 = -[AKSmoothPathView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKSmoothPathView commonInit](v3, "commonInit");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKSmoothPathView;
  -[AKSmoothPathView awakeFromNib](&v3, sel_awakeFromNib);
  -[AKSmoothPathView commonInit](self, "commonInit");
}

- (void)commonInit
{
  void *v3;

  -[AKSmoothPathView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[AKSmoothPathView setMinPressure:](self, "setMinPressure:", 0.015);
  -[AKSmoothPathView setMaxPressure:](self, "setMaxPressure:", 0.25);
  -[AKSmoothPathView setMinThickness:](self, "setMinThickness:", 0.04);
  -[AKSmoothPathView setMaxThickness:](self, "setMaxThickness:", 1.1);
  -[AKSmoothPathView setCurrentWeight:](self, "setCurrentWeight:", 1.0);
  -[AKSmoothPathView setStartedTouchDrawing:](self, "setStartedTouchDrawing:", 0);
  -[AKSmoothPathView setStrokeWidth:](self, "setStrokeWidth:", 6.0);
  objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.705882353, 0.88627451, 0.968627451, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSmoothPathView setStrokeColor:](self, "setStrokeColor:", v3);

  -[AKSmoothPathView setPrestrokedOutputMode:](self, "setPrestrokedOutputMode:", 0);
}

- (void)teardown
{
  void *v3;

  -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teardown");

  -[AKSmoothPathView setBitmapFifo:](self, "setBitmapFifo:", 0);
  -[AKSmoothPathView setInterpolatingFIFO:](self, "setInterpolatingFIFO:", 0);
  -[AKSmoothPathView setSmoothingFIFO:](self, "setSmoothingFIFO:", 0);
  -[AKSmoothPathView setStrokeFIFO:](self, "setStrokeFIFO:", 0);
  -[AKSmoothPathView setDelegate:](self, "setDelegate:", 0);
}

- (void)_setupFilterChainWithBitmapFifo:(BOOL)a3
{
  AKBitmapFIFO *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  if (a3)
  {
    v4 = -[AKBitmapFIFO initWithFIFO:]([AKBitmapFIFO alloc], "initWithFIFO:", 0);
    -[AKSmoothPathView setBitmapFifo:](self, "setBitmapFifo:", v4);

    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setView:", self);

    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsInLiveDraw:", 0);

    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBitmapSizeMultiplier:", 3.0);

    -[AKSmoothPathView _updateShadowRadiusInView](self, "_updateShadowRadiusInView");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDD8]), "initWithFIFO:drawingTarget:", 0, 0);
    -[AKSmoothPathView setInterpolatingFIFO:](self, "setInterpolatingFIFO:", v8);

    -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEmitInterpolatedPoints:", 1);

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_22903F7FC;
    v26[3] = &unk_24F1A7FB8;
    v10 = &v27;
    objc_copyWeak(&v27, &location);
    -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEmissionHandler:", v26);
  }
  else
  {
    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "teardown");

    -[AKSmoothPathView setBitmapFifo:](self, "setBitmapFifo:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDD8]), "initWithFIFO:drawingTarget:", 0, self);
    -[AKSmoothPathView setInterpolatingFIFO:](self, "setInterpolatingFIFO:", v13);

    -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEmitInterpolatedPoints:", 0);

    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_22903F8F8;
    v24[3] = &unk_24F1A7FB8;
    v10 = &v25;
    objc_copyWeak(&v25, &location);
    -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEmissionHandler:", v24);
  }

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  -[AKSmoothPathView updateInterpolatingFifoUnitScale](self, "updateInterpolatingFifoUnitScale");
  -[AKSmoothPathView _updateInterpolatingFifoLineWidth](self, "_updateInterpolatingFifoLineWidth");
  -[AKSmoothPathView _windowBackingScaleFactor](self, "_windowBackingScaleFactor");
  v16 = 1.0 / v15;
  v17 = objc_alloc(MEMORY[0x24BE1BDC0]);
  -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 * 4.0;
  *(float *)&v19 = v16 * 4.0;
  v20 = (void *)objc_msgSend(v17, "initWithFIFO:width:spacing:", v18, 3, v19);
  -[AKSmoothPathView setSmoothingFIFO:](self, "setSmoothingFIFO:", v20);

  v21 = objc_alloc(MEMORY[0x24BE1BDD0]);
  -[AKSmoothPathView smoothingFIFO](self, "smoothingFIFO");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFIFO:", v22);
  -[AKSmoothPathView setStrokeFIFO:](self, "setStrokeFIFO:", v23);

  -[AKSmoothPathView setStartedTouchDrawing:](self, "setStartedTouchDrawing:", 0);
}

- (void)updateInterpolatingFifoUnitScale
{
  double v3;
  float v4;
  double v5;
  id v6;

  -[AKSmoothPathView _windowBackingScaleFactor](self, "_windowBackingScaleFactor");
  *(float *)&v3 = v3;
  v4 = 5.0 / *(float *)&v3;
  -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setUnitScale:", v5);

}

- (void)callDelegate
{
  void *v3;
  const CGPath *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  int v14;
  double width;
  double height;
  double v17;
  double v18;
  int v20;
  void *v21;
  void *v22;
  CGRect v23;
  CGRect BoundingBox;
  CGRect v25;
  CGRect v26;

  if (-[AKSmoothPathView prestrokedOutputMode](self, "prestrokedOutputMode"))
  {
    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const CGPath *)objc_msgSend(v3, "newPathFromCurrentBitmap");

    goto LABEL_6;
  }
  if (-[AKSmoothPathView disableSingleDotSpecialCase](self, "disableSingleDotSpecialCase"))
    goto LABEL_5;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[AKSmoothPathView singleDotRect](self, "singleDotRect");
  v26.origin.x = v9;
  v26.origin.y = v10;
  v26.size.width = v11;
  v26.size.height = v12;
  v23.origin.x = v5;
  v23.origin.y = v6;
  v23.size.width = v7;
  v23.size.height = v8;
  if (CGRectEqualToRect(v23, v26))
  {
LABEL_5:
    -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const CGPath *)objc_msgSend(v13, "path");

    CGPathRetain(v4);
LABEL_6:
    v14 = 0;
    if (!v4)
      goto LABEL_18;
    goto LABEL_7;
  }
  -[AKSmoothPathView singleDotRect](self, "singleDotRect");
  v4 = CGPathCreateWithEllipseInRect(v25, 0);
  v14 = 1;
  if (!v4)
    goto LABEL_18;
LABEL_7:
  if (!CGPathIsEmpty(v4))
  {
    BoundingBox = CGPathGetBoundingBox(v4);
    width = BoundingBox.size.width;
    height = BoundingBox.size.height;
    -[AKSmoothPathView convertRect:toView:](self, "convertRect:toView:", 0, 0.0, 0.0, 1.0, 1.0);
    if (width * v18 > 2.0 || height * v17 > 2.0)
    {
      v20 = v14 | -[AKSmoothPathView prestrokedOutputMode](self, "prestrokedOutputMode");
      -[AKSmoothPathView delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 == 1)
        objc_msgSend(v21, "inputView:didCollectPrestrokedPath:", self, v4);
      else
        objc_msgSend(v21, "inputView:didCollectPath:", self, v4);

    }
  }
LABEL_18:
  CGPathRelease(v4);
  MEMORY[0x24BEDD108](self, sel__clear);
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setPrestrokedOutputMode:(BOOL)a3
{
  self->_prestrokedOutputMode = a3;
  -[AKSmoothPathView setCurrentWeight:](self, "setCurrentWeight:", 1.0);
  MEMORY[0x24BEDD108](self, sel__setupFilterChainWithBitmapFifo_);
}

- (void)setStartedTouchDrawing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (self->_startedTouchDrawing != a3)
    self->_startedTouchDrawing = a3;
  -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsInLiveDraw:", v3);

}

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    -[AKSmoothPathView setApplyModelBaseScaleFactorToStroke:](self, "setApplyModelBaseScaleFactorToStroke:", fabs(a3 + -1.0) >= 0.0005);
    -[AKSmoothPathView _updateInterpolatingFifoLineWidth](self, "_updateInterpolatingFifoLineWidth");
    -[AKSmoothPathView updateInterpolatingFifoUnitScale](self, "updateInterpolatingFifoUnitScale");
  }
}

- (void)setHasShadow:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  double v7;

  self->_hasShadow = a3;
  v4 = 0.0;
  if (a3)
  {
    -[AKSmoothPathView controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPageController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelBaseScaleFactor");
    v4 = v7 * 3.0;

  }
  -[AKSmoothPathView setShadowRadiusInModel:](self, "setShadowRadiusInModel:", v4);
  -[AKSmoothPathView _updateShadowRadiusInView](self, "_updateShadowRadiusInView");
}

- (id)drawing
{
  void *v2;
  void *v3;

  -[AKSmoothPathView strokeFIFO](self, "strokeFIFO");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  double v20;
  CGContext *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  CGImage *v28;
  void *v29;
  void *v30;
  double cachedModelToViewScale;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  void *v42;
  const CGPath *v43;
  id v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  id v54;
  void *v55;
  CGFloat v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform transform;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKSmoothPathView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v63.origin.x = x;
  v63.origin.y = y;
  v56 = height;
  v63.size.width = width;
  v63.size.height = height;
  v16 = CGRectGetWidth(v63);
  v64.origin.x = v9;
  v64.origin.y = v11;
  v64.size.width = v13;
  v64.size.height = v15;
  if (v16 <= CGRectGetWidth(v64) * 0.9)
  {
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = v56;
    v17 = CGRectGetHeight(v65);
    v66.origin.x = v9;
    v66.origin.y = v11;
    v66.size.width = v13;
    v66.size.height = v15;
    if (v17 <= CGRectGetHeight(v66) * 0.9)
    {
      -[AKSmoothPathView controller](self, "controller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v56;
      if (objc_msgSend(v18, "currentPageIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[AKSmoothPathView hasShadow](self, "hasShadow"))
        {
          -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel");
          if (v20 == 0.0)
            -[AKSmoothPathView setHasShadow:](self, "setHasShadow:", 1);
        }
        v21 = -[AKSmoothPathView _getPlatformCGContext](self, "_getPlatformCGContext", *(_QWORD *)&width, *(_QWORD *)&v56);
        CGContextSaveGState(v21);
        if (-[AKSmoothPathView hasShadow](self, "hasShadow"))
        {
          -[AKSmoothPathView shadowRadiusInView](self, "shadowRadiusInView");
          v23 = v22;
          -[AKSmoothPathView shadowRadiusInView](self, "shadowRadiusInView");
          v25 = v24 * -2.0;
          v67.origin.x = x;
          v67.origin.y = y;
          v67.size.width = width;
          v67.size.height = v19;
          v68 = CGRectInset(v67, v23 * -2.0, v25);
          x = v68.origin.x;
          y = v68.origin.y;
          width = v68.size.width;
          v19 = v68.size.height;
        }
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "set");

        v69.origin.x = x;
        v69.origin.y = y;
        v69.size.width = width;
        v69.size.height = v19;
        CGContextFillRect(v21, v69);
        -[AKSmoothPathView _updateInterpolatingFifoLineWidth](self, "_updateInterpolatingFifoLineWidth");
        if (-[AKSmoothPathView hasShadow](self, "hasShadow"))
        {
          -[AKSmoothPathView _setupShadowInContext:](self, "_setupShadowInContext:", v21);
          v70.origin.x = x;
          v70.origin.y = y;
          v70.size.width = width;
          v70.size.height = v19;
          CGContextBeginTransparencyLayerWithRect(v21, v70, 0);
        }
        CGContextSaveGState(v21);
        if (-[AKSmoothPathView prestrokedOutputMode](self, "prestrokedOutputMode"))
        {
          -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (CGImage *)objc_msgSend(v27, "currentBitmap");

          if (v28)
          {
            memset(&v62, 0, sizeof(v62));
            -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
              objc_msgSend(v29, "viewToBitmapTransform");
            else
              memset(&v62, 0, sizeof(v62));

            v60 = v62;
            memset(&v61, 0, sizeof(v61));
            CGAffineTransformInvert(&v61, &v60);
            transform = v61;
            CGContextConcatCTM(v21, &transform);
            -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "bitmapRectInView");
            v58 = v62;
            v74 = CGRectApplyAffineTransform(v73, &v58);
            v46 = v74.origin.x;
            v47 = v74.origin.y;
            v48 = v74.size.width;
            v49 = v74.size.height;

            v57 = v62;
            v75.origin.x = x;
            v75.origin.y = y;
            v75.size.width = width;
            v75.size.height = v19;
            v76 = CGRectApplyAffineTransform(v75, &v57);
            v50 = v76.origin.x;
            v51 = v76.origin.y;
            v52 = v76.size.width;
            v53 = v76.size.height;
            v76.origin.x = v46;
            v76.origin.y = v47;
            v76.size.width = v48;
            v76.size.height = v49;
            CGContextClipToMask(v21, v76, v28);
            -[AKSmoothPathView strokeColor](self, "strokeColor");
            v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            CGContextSetFillColorWithColor(v21, (CGColorRef)objc_msgSend(v54, "CGColor"));

            v77.origin.x = v50;
            v77.origin.y = v51;
            v77.size.width = v52;
            v77.size.height = v53;
            CGContextFillRect(v21, v77);
          }
          -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "resetDirtyRect");

        }
        else
        {
          if (self->_applyModelBaseScaleFactorToStroke)
            cachedModelToViewScale = self->_cachedModelToViewScale;
          else
            cachedModelToViewScale = 1.0;
          -[AKSmoothPathView _effectiveStrokeWidthInModel](self, "_effectiveStrokeWidthInModel");
          v33 = v32;
          CGContextSetLineJoin(v21, kCGLineJoinRound);
          CGContextSetLineCap(v21, kCGLineCapSquare);
          CGContextSetLineWidth(v21, cachedModelToViewScale * v33);
          if (-[AKSmoothPathView disableSingleDotSpecialCase](self, "disableSingleDotSpecialCase"))
            goto LABEL_20;
          v34 = *MEMORY[0x24BDBF090];
          v35 = *(double *)(MEMORY[0x24BDBF090] + 8);
          v36 = *(double *)(MEMORY[0x24BDBF090] + 16);
          v37 = *(double *)(MEMORY[0x24BDBF090] + 24);
          -[AKSmoothPathView singleDotRect](self, "singleDotRect");
          v78.origin.x = v38;
          v78.origin.y = v39;
          v78.size.width = v40;
          v78.size.height = v41;
          v71.origin.x = v34;
          v71.origin.y = v35;
          v71.size.width = v36;
          v71.size.height = v37;
          if (CGRectEqualToRect(v71, v78))
          {
LABEL_20:
            -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (const CGPath *)objc_msgSend(v42, "path");

            if (v43 && !CGPathIsEmpty(v43))
            {
              CGContextAddPath(v21, v43);
              -[AKSmoothPathView strokeColor](self, "strokeColor");
              v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              CGContextSetStrokeColorWithColor(v21, (CGColorRef)objc_msgSend(v44, "CGColor"));

              CGContextStrokePath(v21);
            }
          }
          else
          {
            -[AKSmoothPathView singleDotRect](self, "singleDotRect");
            CGContextAddEllipseInRect(v21, v72);
            CGContextFillPath(v21);
          }
        }
        CGContextRestoreGState(v21);
        if (-[AKSmoothPathView hasShadow](self, "hasShadow"))
          CGContextEndTransparencyLayer(v21);
        CGContextRestoreGState(v21);
      }

    }
  }
}

- (void)startStroke
{
  double v3;
  AKSmoothPathView *v4;
  double *v5;
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
  void *v22;
  char v23;
  id v24;

  -[AKSmoothPathView setDisableSingleDotSpecialCase:](self, "setDisableSingleDotSpecialCase:", 0);
  -[AKSmoothPathView setSingleDotCurrentSize:](self, "setSingleDotCurrentSize:", 0.2);
  -[AKSmoothPathView setSingleDotRect:](self, "setSingleDotRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKSmoothPathView _effectiveStrokeWidthInModel](self, "_effectiveStrokeWidthInModel");
  self->_cachedEffectiveStrokeWidthInModel = v3;
  v4 = self;
  v5 = (double *)v4;
  if (v4->_applyModelBaseScaleFactorToStroke)
  {
    -[AKSmoothPathView controller](v4, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertRectFromModelToOverlay:", 0.0, 0.0, 1.0, 1.0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v6, "currentPageController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "overlayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toView:", v5, v9, v11, v13, v15);
    v19 = v18;
    v21 = v20;

    if (v19 < v21)
      v19 = v21;

  }
  else
  {
    v19 = 1.0;
  }

  v5[53] = v19;
  objc_msgSend(v5, "setStartedTouchDrawing:", 1);
  objc_msgSend(v5, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    objc_msgSend(v5, "delegate");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "inputViewWillStartDrawing:", v5);

  }
}

- (void)continueStroke:(AKSmoothPathView *)self
{
  -[CHPointStrokeFIFO addPoint:](self->_strokeFIFO, "addPoint:");
}

- (void)continueStrokeWithoutSmoothing:(AKSmoothPathView *)self
{
  __int128 v2;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v5;

  -[AKSmoothPathView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  -[CHQuadCurvePointFIFO emissionHandler](self->_interpolatingFIFO, "emissionHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, __int128 *, uint64_t, _QWORD, _QWORD))v4)[2](v4, &v5, 1, 0, 0);

  -[AKSmoothPathView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 0);
}

- (void)terminateStroke
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[CHPointStrokeFIFO flush](self->_strokeFIFO, "flush");
  -[AKBitmapFIFO flush](self->_bitmapFifo, "flush");
  -[AKSmoothPathView setStartedTouchDrawing:](self, "setStartedTouchDrawing:", 0);
  v3 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2290406E4;
  block[3] = &unk_24F1A7CD0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

- (void)handleForwardedEvent:(id)a3
{
  NSLog(CFSTR("%s: To be implemented by subclass."), a2, a3, "-[AKSmoothPathView handleForwardedEvent:]");
}

- (void)handleTapAction:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[AKSmoothPathView startStroke](self, "startStroke");
    -[AKSmoothPathView _pointForRecognizer:](self, "_pointForRecognizer:", v4);
    -[AKSmoothPathView continueStrokeWithoutSmoothing:](self, "continueStrokeWithoutSmoothing:");
    -[AKSmoothPathView terminateStroke](self, "terminateStroke");
  }

}

- (BOOL)_catchUpAccumulatedTouchesForRecognizer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accumulatedTouches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAccumulatedTouches");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        -[AKSmoothPathView _pointForTouch:](self, "_pointForTouch:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v6, "count") != 0;
  return v10;
}

- (void)handleDragAction:(id)a3
{
  BOOL v4;
  id v5;

  v5 = a3;
  switch(objc_msgSend(v5, "state"))
  {
    case 1:
      -[AKSmoothPathView startStroke](self, "startStroke");
      v4 = -[AKSmoothPathView _catchUpAccumulatedTouchesForRecognizer:](self, "_catchUpAccumulatedTouchesForRecognizer:", v5);
      goto LABEL_5;
    case 2:
      v4 = -[AKSmoothPathView _catchUpAccumulatedTouchesForRecognizer:](self, "_catchUpAccumulatedTouchesForRecognizer:", v5);
LABEL_5:
      if (!v4)
      {
        -[AKSmoothPathView _pointForRecognizer:](self, "_pointForRecognizer:", v5);
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      break;
    case 3:
      if (!-[AKSmoothPathView _catchUpAccumulatedTouchesForRecognizer:](self, "_catchUpAccumulatedTouchesForRecognizer:", v5))
      {
        -[AKSmoothPathView _pointForRecognizer:](self, "_pointForRecognizer:", v5);
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      goto LABEL_2;
    case 4:
    case 5:
LABEL_2:
      -[AKSmoothPathView terminateStroke](self, "terminateStroke");
      break;
    default:
      break;
  }

}

- (double)weightForValue:(double)a3
{
  double v4;
  double v5;
  double v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_229040A94;
  block[3] = &unk_24F1A7CD0;
  block[4] = self;
  if (qword_255A271A0 != -1)
    dispatch_once(&qword_255A271A0, block);
  v4 = (*(double *)&qword_255A271C0 - *(double *)&qword_255A271B8)
     / (*(double *)&qword_255A271B0 - *(double *)&qword_255A271A8);
  v5 = *(double *)&qword_255A271B8 + v4 * (a3 - *(double *)&qword_255A271A8);
  if (v5 <= *(double *)&qword_255A271C0)
    v6 = *(double *)&qword_255A271B8 + v4 * (a3 - *(double *)&qword_255A271A8);
  else
    v6 = *(double *)&qword_255A271C0;
  if (v5 >= *(double *)&qword_255A271B8)
    return v6;
  else
    return *(double *)&qword_255A271B8;
}

- (void)_clear
{
  -[CHPointStrokeFIFO clear](self->_strokeFIFO, "clear");
  -[AKBitmapFIFO clear](self->_bitmapFifo, "clear");
  -[AKSmoothPathView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_setupShadowInContext:(CGContext *)a3
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGColor *v16;
  id v17;
  CGSize v18;

  -[AKSmoothPathView controller](self, "controller");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentModelToScreenExifOrientation");

  v7 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v6);
  -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel");
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v7, 0.0, -v8, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v10 = v9;
  v12 = v11;
  -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel");
  v14 = v13;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (CGColor *)objc_msgSend(v15, "CGColor");
  v18.width = v10;
  v18.height = v12;
  CGContextSetShadowWithColor(a3, v18, v14, v16);

}

- (void)_updateShadowRadiusInView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel");
  v4 = v3;
  v5 = 0.0;
  if (v4 != 0.0)
  {
    -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel", 0.0);
    -[AKSmoothPathView _convertValueFromModelToSelf:](self, "_convertValueFromModelToSelf:");
    -[AKSmoothPathView setShadowRadiusInView:](self, "setShadowRadiusInView:");
    -[AKSmoothPathView shadowRadiusInView](self, "shadowRadiusInView");
    v5 = v6 + v6;
  }
  -[AKSmoothPathView setShadowRadiusInView:](self, "setShadowRadiusInView:", v5);
  -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKSmoothPathView shadowRadiusInView](self, "shadowRadiusInView");
    v9 = v8;
    -[AKSmoothPathView bitmapFifo](self, "bitmapFifo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadiusInView:", v9);

  }
}

- (double)_effectiveStrokeWidthInModel
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[AKSmoothPathView strokeWidth](self, "strokeWidth");
  v4 = v3;
  if (self->_applyModelBaseScaleFactorToStroke)
  {
    -[AKSmoothPathView controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPageController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelBaseScaleFactor");
    v8 = v7;

    v9 = 1.0;
    if (v8 > 0.0)
      v9 = v8;
    v4 = v4 * v9;

  }
  return v4;
}

- (double)_convertValueFromModelToSelf:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
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

  -[AKSmoothPathView controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v5, "currentPageController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPointFromModelToOverlay:", a3, 0.0);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v5, "currentPageController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPointFromModelToOverlay:", v6, v7);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v5, "currentPageController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "overlayView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:toView:", self, v10, v12);
  v21 = v20;
  v23 = v22;

  objc_msgSend(v5, "currentPageController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "overlayView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertPoint:toView:", self, v15, v17);
  v27 = v26;
  v29 = v28;

  v30 = vabdd_f64(v21, v27);
  v31 = vabdd_f64(v23, v29);
  if (v30 >= v31)
    v32 = v30;
  else
    v32 = v31;

  return v32;
}

- (__n128)_pointForTouch:(void *)a3
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
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  __int128 v18;
  __int128 v20;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", a1);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "maximumPossibleForce");
  if (v9 == 0.0)
  {
    v14 = 1.0;
  }
  else
  {
    objc_msgSend(v4, "force");
    v11 = v10;
    objc_msgSend(v4, "maximumPossibleForce");
    objc_msgSend(a1, "weightForValue:", v11 / v12);
    v14 = v13;
  }
  objc_msgSend(a1, "setCurrentWeight:", v14);
  *(float *)&v15 = v6;
  *(float *)&v16 = v8;
  *(float *)&v17 = v14;
  *(_QWORD *)&v18 = __PAIR64__(v16, v15);
  *((_QWORD *)&v18 + 1) = v17;
  v20 = v18;

  return (__n128)v20;
}

- (__n128)_pointForRecognizer:(void *)a3
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
  objc_class *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  __int128 v20;
  __int128 v22;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", a1);
  v6 = v5;
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "currentMaxWeight");
    if (v9 == 0.0)
    {
      v14 = 1.0;
    }
    else
    {
      objc_msgSend(v4, "currentWeight");
      v11 = v10;
      objc_msgSend(v4, "currentMaxWeight");
      objc_msgSend(a1, "weightForValue:", v11 / v12);
      v14 = v13;
    }
  }
  else
  {
    objc_opt_class();
    v14 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Unexpected gesture recognizer class: %@"), "-[AKSmoothPathView _pointForRecognizer:]", v16);

    }
  }
  objc_msgSend(a1, "setCurrentWeight:", v14);
  *(float *)&v17 = v6;
  *(float *)&v18 = v8;
  *(float *)&v19 = v14;
  *(_QWORD *)&v20 = __PAIR64__(v18, v17);
  *((_QWORD *)&v20 + 1) = v19;
  v22 = v20;

  return (__n128)v22;
}

- (double)_windowBackingScaleFactor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[AKSmoothPathView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKSmoothPathView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v8 = v9;
  }

  return v8;
}

- (void)_updateInterpolatingFifoLineWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = 0.0;
  if (!-[AKSmoothPathView prestrokedOutputMode](self, "prestrokedOutputMode"))
  {
    -[AKSmoothPathView _effectiveStrokeWidthInModel](self, "_effectiveStrokeWidthInModel");
    v5 = v4;
    -[AKSmoothPathView shadowRadiusInModel](self, "shadowRadiusInModel");
    -[AKSmoothPathView _convertValueFromModelToSelf:](self, "_convertValueFromModelToSelf:", (v6 + v6) * 1.25 + v5 * 1.75);
    v3 = v7;
  }
  -[AKSmoothPathView interpolatingFIFO](self, "interpolatingFIFO");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineWidth:", v3);

}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKSmoothPathViewDelegate)delegate
{
  return (AKSmoothPathViewDelegate *)objc_getProperty(self, a2, 448, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (BOOL)prestrokedOutputMode
{
  return self->_prestrokedOutputMode;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (BOOL)applyModelBaseScaleFactorToStroke
{
  return self->_applyModelBaseScaleFactorToStroke;
}

- (void)setApplyModelBaseScaleFactorToStroke:(BOOL)a3
{
  self->_applyModelBaseScaleFactorToStroke = a3;
}

- (BOOL)startedTouchDrawing
{
  return self->_startedTouchDrawing;
}

- (BOOL)isAddingPointWithoutSmoothing
{
  return self->_isAddingPointWithoutSmoothing;
}

- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3
{
  self->_isAddingPointWithoutSmoothing = a3;
}

- (CGRect)singleDotRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_singleDotRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSingleDotRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_singleDotRect, &v3, 32, 1, 0);
}

- (double)shadowRadiusInModel
{
  return self->_shadowRadiusInModel;
}

- (void)setShadowRadiusInModel:(double)a3
{
  self->_shadowRadiusInModel = a3;
}

- (double)shadowRadiusInView
{
  return self->_shadowRadiusInView;
}

- (void)setShadowRadiusInView:(double)a3
{
  self->_shadowRadiusInView = a3;
}

- (double)cachedModelToViewScale
{
  return self->_cachedModelToViewScale;
}

- (void)setCachedModelToViewScale:(double)a3
{
  self->_cachedModelToViewScale = a3;
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

- (CHPointStrokeFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_strokeFIFO, a3);
}

- (CHBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_smoothingFIFO, a3);
}

- (CHQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, a3);
}

- (AKBitmapFIFO)bitmapFifo
{
  return self->_bitmapFifo;
}

- (void)setBitmapFifo:(id)a3
{
  objc_storeStrong((id *)&self->_bitmapFifo, a3);
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (BOOL)disableSingleDotSpecialCase
{
  return self->_disableSingleDotSpecialCase;
}

- (void)setDisableSingleDotSpecialCase:(BOOL)a3
{
  self->_disableSingleDotSpecialCase = a3;
}

- (double)singleDotCurrentSize
{
  return self->_singleDotCurrentSize;
}

- (void)setSingleDotCurrentSize:(double)a3
{
  self->_singleDotCurrentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapFifo, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
