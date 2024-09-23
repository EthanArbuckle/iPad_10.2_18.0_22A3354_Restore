@implementation AKSignatureView

- (AKSignatureView)initWithFrame:(CGRect)a3
{
  AKSignatureView *v3;
  AKSignatureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureView;
  v3 = -[AKSignatureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKSignatureView _commonInit](v3, "_commonInit");
  return v4;
}

- (AKSignatureView)initWithCoder:(id)a3
{
  AKSignatureView *v3;
  AKSignatureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureView;
  v3 = -[AKSignatureView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKSignatureView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  CGSize v4;
  AKBitmapFIFO *v5;
  AKBitmapFIFO *bitmapFifo;
  CHQuadCurvePointFIFO *v7;
  CHQuadCurvePointFIFO *interpolatingFIFO;
  double v9;
  float v10;
  id v11;
  double v12;
  CHBoxcarFilterPointFIFO *v13;
  CHBoxcarFilterPointFIFO *boxcarFIFO;
  CHPointStrokeFIFO *v15;
  CHPointStrokeFIFO *strokeFIFO;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, double *, uint64_t);
  void *v20;
  id v21;
  id location;

  -[AKSignatureView setClearsContextBeforeDrawing:](self, "setClearsContextBeforeDrawing:", 0);
  -[AKSignatureView setOpaque:](self, "setOpaque:", 1);
  -[AKSignatureView setContentMode:](self, "setContentMode:", 3);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureView setStrokeColor:](self, "setStrokeColor:", v3);

  -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:", 2.0);
  v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_accumulatedSignatureDirtyRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_accumulatedSignatureDirtyRect.size = v4;
  -[AKSignatureView setMinPressure:](self, "setMinPressure:", 0.0034);
  -[AKSignatureView setMaxPressure:](self, "setMaxPressure:", 0.45);
  -[AKSignatureView setMinThickness:](self, "setMinThickness:", 0.56);
  -[AKSignatureView setMaxThickness:](self, "setMaxThickness:", 3.0);
  v5 = -[AKBitmapFIFO initWithFIFO:]([AKBitmapFIFO alloc], "initWithFIFO:", 0);
  bitmapFifo = self->_bitmapFifo;
  self->_bitmapFifo = v5;

  -[AKBitmapFIFO setView:](self->_bitmapFifo, "setView:", self);
  -[AKBitmapFIFO setIsInLiveDraw:](self->_bitmapFifo, "setIsInLiveDraw:", 0);
  -[AKBitmapFIFO setBitmapSizeMultiplier:](self->_bitmapFifo, "setBitmapSizeMultiplier:", 3.0);
  v7 = (CHQuadCurvePointFIFO *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDD8]), "initWithFIFO:", 0);
  interpolatingFIFO = self->_interpolatingFIFO;
  self->_interpolatingFIFO = v7;

  -[CHQuadCurvePointFIFO setEmitInterpolatedPoints:](self->_interpolatingFIFO, "setEmitInterpolatedPoints:", 1);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = sub_22900118C;
  v20 = &unk_24F1A7A88;
  objc_copyWeak(&v21, &location);
  -[CHQuadCurvePointFIFO setEmissionHandler:](self->_interpolatingFIFO, "setEmissionHandler:", &v17);
  -[AKSignatureView _windowBackingScaleFactor](self, "_windowBackingScaleFactor", v17, v18, v19, v20);
  *(float *)&v9 = v9;
  v10 = 1.0 / *(float *)&v9;
  *(float *)&v9 = (float)(1.0 / *(float *)&v9) * 5.0;
  -[CHQuadCurvePointFIFO setUnitScale:](self->_interpolatingFIFO, "setUnitScale:", v9);
  v11 = objc_alloc(MEMORY[0x24BE1BDC0]);
  *(float *)&v12 = v10 * 4.0;
  v13 = (CHBoxcarFilterPointFIFO *)objc_msgSend(v11, "initWithFIFO:width:spacing:", self->_interpolatingFIFO, 3, v12);
  boxcarFIFO = self->_boxcarFIFO;
  self->_boxcarFIFO = v13;

  v15 = (CHPointStrokeFIFO *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDD0]), "initWithFIFO:", self->_boxcarFIFO);
  strokeFIFO = self->_strokeFIFO;
  self->_strokeFIFO = v15;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AKSignatureView;
  -[AKSignatureView dealloc](&v2, sel_dealloc);
}

- (void)teardown
{
  void *v3;

  -[AKSignatureView bitmapFifo](self, "bitmapFifo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teardown");

  -[AKSignatureView setBitmapFifo:](self, "setBitmapFifo:", 0);
  -[AKSignatureView setInterpolatingFIFO:](self, "setInterpolatingFIFO:", 0);
  -[AKSignatureView setBoxcarFIFO:](self, "setBoxcarFIFO:", 0);
  -[AKSignatureView setStrokeFIFO:](self, "setStrokeFIFO:", 0);
  -[AKSignatureView setStrokeColor:](self, "setStrokeColor:", 0);
}

- (CGPath)copyStrokedInterpolatedPath
{
  void *v2;
  CGPath *v3;

  -[AKSignatureView bitmapFifo](self, "bitmapFifo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGPath *)objc_msgSend(v2, "newPathFromCurrentBitmap");

  return v3;
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

  -[AKSignatureView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKSignatureView window](self, "window");
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

- (double)interfaceScale
{
  return 2.0;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGRect *p_accumulatedSignatureDirtyRect;
  CFAbsoluteTime Current;
  CGSize v6;
  objc_super v7;

  p_accumulatedSignatureDirtyRect = &self->_accumulatedSignatureDirtyRect;
  self->_accumulatedSignatureDirtyRect = CGRectUnion(self->_accumulatedSignatureDirtyRect, a3);
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastSetNeedsDisplayCallToSuperTime > 0.0166666667)
  {
    self->_lastSetNeedsDisplayCallToSuperTime = Current;
    v7.receiver = self;
    v7.super_class = (Class)AKSignatureView;
    -[AKSignatureView setNeedsDisplayInRect:](&v7, sel_setNeedsDisplayInRect_, p_accumulatedSignatureDirtyRect->origin.x, p_accumulatedSignatureDirtyRect->origin.y, p_accumulatedSignatureDirtyRect->size.width, p_accumulatedSignatureDirtyRect->size.height);
    v6 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    p_accumulatedSignatureDirtyRect->origin = (CGPoint)*MEMORY[0x24BDBF070];
    p_accumulatedSignatureDirtyRect->size = v6;
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  CGImage *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[AKSignatureView totalPointsAdded](self, "totalPointsAdded"))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_strokeColor, "CGColor"));
    -[AKSignatureView bitmapFifo](self, "bitmapFifo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CGImage *)objc_msgSend(v9, "currentBitmap");

    if (v10)
    {
      memset(&v25, 0, sizeof(v25));
      -[AKSignatureView bitmapFifo](self, "bitmapFifo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "viewToBitmapTransform");
      else
        memset(&v25, 0, sizeof(v25));

      v23 = v25;
      memset(&v24, 0, sizeof(v24));
      CGAffineTransformInvert(&v24, &v23);
      v23 = v24;
      CGContextConcatCTM(CurrentContext, &v23);
      -[AKSignatureView bitmapFifo](self, "bitmapFifo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bitmapRectInView");
      v23 = v25;
      v27 = CGRectApplyAffineTransform(v26, &v23);
      v14 = v27.origin.x;
      v15 = v27.origin.y;
      v16 = v27.size.width;
      v17 = v27.size.height;

      v23 = v25;
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v29 = CGRectApplyAffineTransform(v28, &v23);
      v18 = v29.origin.x;
      v19 = v29.origin.y;
      v20 = v29.size.width;
      v21 = v29.size.height;
      v29.origin.x = v14;
      v29.origin.y = v15;
      v29.size.width = v16;
      v29.size.height = v17;
      CGContextClipToMask(CurrentContext, v29, v10);
      v30.origin.x = v18;
      v30.origin.y = v19;
      v30.size.width = v20;
      v30.size.height = v21;
      CGContextFillRect(CurrentContext, v30);
    }
    CGContextRestoreGState(CurrentContext);
    -[AKSignatureView bitmapFifo](self, "bitmapFifo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resetDirtyRect");

  }
}

- (void)clear
{
  id WeakRetained;

  -[CHPointStrokeFIFO clear](self->_strokeFIFO, "clear");
  -[AKBitmapFIFO clear](self->_bitmapFifo, "clear");
  -[AKSignatureView _forceRedisplay](self, "_forceRedisplay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_liveDelegate);
  objc_msgSend(WeakRetained, "signatureViewSignatureUpdated:", self);

}

- (void)_forceRedisplay
{
  self->_lastSetNeedsDisplayCallToSuperTime = 0.0;
  -[AKSignatureView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKSignatureView;
  -[AKSignatureView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AKSignatureView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)startStroke:(AKSignatureView *)self
{
  double v2;
  double v4;

  v4 = v2;
  -[AKSignatureView setStrokeStartTime:](self, "setStrokeStartTime:", CFAbsoluteTimeGetCurrent());
  -[AKSignatureView setStrokeLastLocation:](self, "setStrokeLastLocation:", vcvtq_f64_f32(*(float32x2_t *)&v4));
  -[AKSignatureView strokeLastLocation](self, "strokeLastLocation");
  -[AKSignatureView setStrokeStartLocation:](self, "setStrokeStartLocation:");
  -[AKSignatureView setTotalPointsAdded:](self, "setTotalPointsAdded:", 0);
  -[CHPointStrokeFIFO addPoint:](self->_strokeFIFO, "addPoint:", v4);
}

- (void)continueStroke:(AKSignatureView *)self
{
  float32x2_t v2;
  double v4;

  v4 = *(double *)&v2;
  -[AKSignatureView setStrokeLastLocation:](self, "setStrokeLastLocation:", vcvtq_f64_f32(v2));
  -[CHPointStrokeFIFO addPoint:](self->_strokeFIFO, "addPoint:", v4);
}

- (void)continueStrokeWithoutSmoothing:(AKSignatureView *)self
{
  __int128 v2;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v5;

  -[AKSignatureView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  -[CHQuadCurvePointFIFO emissionHandler](self->_interpolatingFIFO, "emissionHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, __int128 *, uint64_t, _QWORD, _QWORD))v4)[2](v4, &v5, 1, 0, 0);

  -[AKSignatureView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 0);
}

- (void)terminateStroke
{
  double Current;
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
  double v17;
  double v18;
  unsigned int v19;
  unsigned int v20;
  _QWORD block[5];

  -[CHPointStrokeFIFO flush](self->_strokeFIFO, "flush");
  Current = CFAbsoluteTimeGetCurrent();
  -[AKSignatureView strokeStartTime](self, "strokeStartTime");
  v5 = v4;
  if (-[AKSignatureView totalPointsAdded](self, "totalPointsAdded") <= 9)
  {
    v6 = Current - v5;
    if (Current - v5 > 0.0 && v6 < 0.2)
    {
      -[AKSignatureView strokeStartLocation](self, "strokeStartLocation");
      v8 = v7;
      v10 = v9;
      -[AKSignatureView strokeLastLocation](self, "strokeLastLocation");
      v12 = v11;
      v14 = v13;
      +[AKGeometryHelper distanceBetweenPoints:andPoint:](AKGeometryHelper, "distanceBetweenPoints:andPoint:", v8, v10, v11, v13);
      v16 = v15;
      v6 = 15.0;
      if (v16 < 15.0)
      {
        if (v16 > 0.0)
        {
          +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v12 - v8, v14 - v10);
          v8 = v8 + v16 * v17 * 0.5;
          v10 = v10 + v16 * v18 * 0.5;
        }
        -[AKSignatureView currentWeight](self, "currentWeight");
        *(float *)&v19 = v8;
        *(float *)&v20 = v10;
        -[AKSignatureView continueStrokeWithoutSmoothing:](self, "continueStrokeWithoutSmoothing:", COERCE_DOUBLE(__PAIR64__(v20, v19)));
      }
    }
  }
  -[AKBitmapFIFO flush](self->_bitmapFifo, "flush", v6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_229001A08;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (double)weightForValue:(double)a3
{
  double v4;
  double v5;
  double v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_229001B38;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A27030 != -1)
    dispatch_once(&qword_255A27030, block);
  v4 = (*(double *)&qword_255A27028 - *(double *)&qword_255A27020)
     / (*(double *)&qword_255A27018 - *(double *)&qword_255A27010);
  v5 = *(double *)&qword_255A27020 + v4 * (a3 - *(double *)&qword_255A27010);
  if (v5 <= *(double *)&qword_255A27028)
    v6 = *(double *)&qword_255A27020 + v4 * (a3 - *(double *)&qword_255A27010);
  else
    v6 = *(double *)&qword_255A27028;
  if (v5 >= *(double *)&qword_255A27020)
    return v6;
  else
    return *(double *)&qword_255A27020;
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
  v5 = 2.0;
  if (-[AKSignatureView ak_forceAvailableForTouch:](self, "ak_forceAvailableForTouch:", v4))
  {
    objc_msgSend(v4, "force");
    v7 = v6;
    objc_msgSend(v4, "maximumPossibleForce");
    -[AKSignatureView weightForValue:](self, "weightForValue:", v7 / v8);
    v5 = v9;
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  unsigned int v10;
  id v11;

  objc_msgSend(a3, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[AKSignatureView weightForTouch:](self, "weightForTouch:", v11);
  -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
  *(float *)&v9 = v6;
  *(float *)&v10 = v8;
  -[AKSignatureView startStroke:](self, "startStroke:", COERCE_DOUBLE(__PAIR64__(v10, v9)));

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "coalescedTouchesForTouch:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignatureView handleCoalescedTouches:forTouch:](self, "handleCoalescedTouches:forTouch:", v11, v6);

  }
  else
  {
    -[AKSignatureView weightForTouch:](self, "weightForTouch:", v6);
    -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
    *(float *)&v12 = v8;
    *(float *)&v13 = v10;
    -[AKSignatureView continueStroke:](self, "continueStroke:", COERCE_DOUBLE(__PAIR64__(v13, v12)));
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "coalescedTouchesForTouch:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignatureView handleCoalescedTouches:forTouch:](self, "handleCoalescedTouches:forTouch:", v11, v6);

  }
  else
  {
    -[AKSignatureView weightForTouch:](self, "weightForTouch:", v6);
    -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
    *(float *)&v12 = v8;
    *(float *)&v13 = v10;
    -[AKSignatureView continueStroke:](self, "continueStroke:", COERCE_DOUBLE(__PAIR64__(v13, v12)));
  }
  -[AKSignatureView terminateStroke](self, "terminateStroke");

}

- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "locationInView:", self);
        v12 = v11;
        v14 = v13;
        -[AKSignatureView weightForTouch:](self, "weightForTouch:", v10);
        -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
        *(float *)&v15 = v12;
        *(float *)&v16 = v14;
        -[AKSignatureView continueStroke:](self, "continueStroke:", COERCE_DOUBLE(__PAIR64__(v16, v15)));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

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

- (unint64_t)totalPointsAdded
{
  return self->_totalPointsAdded;
}

- (void)setTotalPointsAdded:(unint64_t)a3
{
  self->_totalPointsAdded = a3;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
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

- (CHPointStrokeFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_strokeFIFO, a3);
}

- (CHBoxcarFilterPointFIFO)boxcarFIFO
{
  return self->_boxcarFIFO;
}

- (void)setBoxcarFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_boxcarFIFO, a3);
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

- (AKSignatureViewLiveDelegate)liveDelegate
{
  return (AKSignatureViewLiveDelegate *)objc_loadWeakRetained((id *)&self->_liveDelegate);
}

- (void)setLiveDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_liveDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveDelegate);
  objc_storeStrong((id *)&self->_bitmapFifo, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_boxcarFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong(&self->_trackingTouchID, 0);
}

@end
