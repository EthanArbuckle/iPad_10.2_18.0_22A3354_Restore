@implementation ETGLSketchView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setGLContextAsCurrent
{
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", self->_context);
}

- (ETGLSketchView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  ETGLSketchView *v5;
  ETGLSketchView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  EAGLContext *context;
  ETGLSketchRenderer *v16;
  EAGLContext *v17;
  void *v18;
  uint64_t v19;
  ETGLSketchRenderer *renderer;
  ETGLSketchRenderer *v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  float v27;
  float v28;
  ETPointFIFO *v29;
  ETPointFIFO *pointFIFO;
  ETBoxcarFilterPointFIFO *v31;
  double v32;
  uint64_t v33;
  ETBoxcarFilterPointFIFO *smoothingFIFO;
  ETQuadCurvePointFIFO *v35;
  ETQuadCurvePointFIFO *interpolatingFIFO;
  double v37;
  uint64_t v38;
  ETPointFIFO *v39;
  ETPointFIFO *secondaryPointFIFO;
  ETBoxcarFilterPointFIFO *v41;
  double v42;
  uint64_t v43;
  ETBoxcarFilterPointFIFO *secondarySmoothingFIFO;
  ETQuadCurvePointFIFO *v45;
  ETQuadCurvePointFIFO *secondaryInterpolatingFIFO;
  double v47;
  ETGLSketchView *v48;
  NSObject *v49;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id location[2];
  objc_super v59;
  _QWORD v60[2];
  _QWORD v61[4];

  height = a3.size.height;
  width = a3.size.width;
  v61[2] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)ETGLSketchView;
  v5 = -[ETGLSketchView initWithFrame:](&v59, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[ETGLSketchView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOpaque:", 0);
    v60[0] = *MEMORY[0x24BDE2BD8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = *MEMORY[0x24BDE2BD0];
    v61[0] = v8;
    v61[1] = *MEMORY[0x24BDE2BC8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDrawableProperties:", v9);

    objc_msgSend(v7, "setAsynchronous:", 0);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11 > 1.0;

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      -[ETGLSketchView setContentScaleFactor:](v6, "setContentScaleFactor:");

    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
    context = v6->_context;
    v6->_context = (EAGLContext *)v14;

    if (v6->_context)
    {
      -[ETGLSketchView setGLContextAsCurrent](v6, "setGLContextAsCurrent");
      v16 = [ETGLSketchRenderer alloc];
      v17 = v6->_context;
      -[ETGLSketchView layer](v6, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ETGLSketchRenderer initWithContext:andDrawable:](v16, "initWithContext:andDrawable:", v17, v18);
      renderer = v6->_renderer;
      v6->_renderer = (ETGLSketchRenderer *)v19;

      v21 = v6->_renderer;
      if (v21)
      {
        -[ETGLSketchRenderer setDelegate:](v21, "setDelegate:", v6);
        -[ETGLSketchRenderer setUseFastVerticalWisp:](v6->_renderer, "setUseFastVerticalWisp:", v6->_useFastVerticalWisp);
        v22 = fmax(width / 156.0, 1.0);
        if (v22 > 3.0)
          v22 = 3.0;
        -[ETGLSketchRenderer setLineWidthScaleFactor:](v6->_renderer, "setLineWidthScaleFactor:", v22);
        v6->_paused = 1;
        -[ETGLSketchView contentScaleFactor](v6, "contentScaleFactor");
        v24 = v23;
        -[ETGLSketchView contentScaleFactor](v6, "contentScaleFactor");
        v25 = 2.0 / (width * v24);
        v27 = 2.0 / (height * v26);
        if (v25 >= v27)
          v28 = v27;
        else
          v28 = 2.0 / (width * v24);
        v6->_unitSize = v28;
        v29 = -[ETPointFIFO initWithFIFO:]([ETPointFIFO alloc], "initWithFIFO:", 0);
        pointFIFO = v6->_pointFIFO;
        v6->_pointFIFO = v29;

        v31 = [ETBoxcarFilterPointFIFO alloc];
        *(float *)&v32 = v6->_unitSize * 5.0;
        v33 = -[ETBoxcarFilterPointFIFO initWithFIFO:width:spacing:](v31, "initWithFIFO:width:spacing:", v6->_pointFIFO, 2, v32);
        smoothingFIFO = v6->_smoothingFIFO;
        v6->_smoothingFIFO = (ETBoxcarFilterPointFIFO *)v33;

        v35 = -[ETQuadCurvePointFIFO initWithFIFO:]([ETQuadCurvePointFIFO alloc], "initWithFIFO:", v6->_smoothingFIFO);
        interpolatingFIFO = v6->_interpolatingFIFO;
        v6->_interpolatingFIFO = v35;

        *(float *)&v37 = v28;
        -[ETQuadCurvePointFIFO setUnitSize:](v6->_interpolatingFIFO, "setUnitSize:", v37);
        objc_initWeak(location, v6);
        v38 = MEMORY[0x24BDAC760];
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __32__ETGLSketchView_initWithFrame___block_invoke;
        v56[3] = &unk_24F6E6C70;
        objc_copyWeak(&v57, location);
        -[ETQuadCurvePointFIFO setEmissionHandler:](v6->_interpolatingFIFO, "setEmissionHandler:", v56);
        -[ETQuadCurvePointFIFO setEmitInterpolatedPoints:](v6->_interpolatingFIFO, "setEmitInterpolatedPoints:", 0);
        v39 = -[ETPointFIFO initWithFIFO:]([ETPointFIFO alloc], "initWithFIFO:", 0);
        secondaryPointFIFO = v6->_secondaryPointFIFO;
        v6->_secondaryPointFIFO = v39;

        v41 = [ETBoxcarFilterPointFIFO alloc];
        *(float *)&v42 = v6->_unitSize * 5.0;
        v43 = -[ETBoxcarFilterPointFIFO initWithFIFO:width:spacing:](v41, "initWithFIFO:width:spacing:", v6->_secondaryPointFIFO, 3, v42);
        secondarySmoothingFIFO = v6->_secondarySmoothingFIFO;
        v6->_secondarySmoothingFIFO = (ETBoxcarFilterPointFIFO *)v43;

        v45 = -[ETQuadCurvePointFIFO initWithFIFO:]([ETQuadCurvePointFIFO alloc], "initWithFIFO:", v6->_secondarySmoothingFIFO);
        secondaryInterpolatingFIFO = v6->_secondaryInterpolatingFIFO;
        v6->_secondaryInterpolatingFIFO = v45;

        *(float *)&v47 = v28;
        -[ETQuadCurvePointFIFO setUnitSize:](v6->_secondaryInterpolatingFIFO, "setUnitSize:", v47);
        v51 = v38;
        v52 = 3221225472;
        v53 = __32__ETGLSketchView_initWithFrame___block_invoke_2;
        v54 = &unk_24F6E6C70;
        objc_copyWeak(&v55, location);
        -[ETQuadCurvePointFIFO setEmissionHandler:](v6->_secondaryInterpolatingFIFO, "setEmissionHandler:", &v51);
        -[ETQuadCurvePointFIFO setEmitInterpolatedPoints:](v6->_secondaryInterpolatingFIFO, "setEmitInterpolatedPoints:", 0, v51, v52, v53, v54);
        -[ETGLSketchView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&v57);
        objc_destroyWeak(location);

        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_22C68B000, v49, OS_LOG_TYPE_INFO, "ERROR: Couldn't allocate ETGLSketchRenderer", (uint8_t *)location, 2u);
        }
LABEL_20:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_22C68B000, v49, OS_LOG_TYPE_INFO, "ERROR: Couldn't allocate EAGLContext", (uint8_t *)location, 2u);
      }
      goto LABEL_20;
    }

    v48 = 0;
    goto LABEL_22;
  }
LABEL_12:
  v48 = v6;
LABEL_22:

  return v48;
}

void __32__ETGLSketchView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateRendererWithPoints:count:controlPoint:flush:", a2, a3, a4, a5);

}

void __32__ETGLSketchView_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateRendererWithSecondaryPoints:count:controlPoint:flush:", a2, a3, a4, a5);

}

- (void)setWispDelay:(double)a3
{
  -[ETGLSketchRenderer setWispDelay:](self->_renderer, "setWispDelay:", a3);
}

- (void)setMessageData:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_messageData, a3);
  v5 = objc_msgSend(v6, "isRenderingOffscreen");
  self->_renderingOffscreen = v5;
  -[ETGLSketchRenderer setRenderingOffscreen:](self->_renderer, "setRenderingOffscreen:", v5);

}

- (void)animateOutWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id from;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  -[ETGLSketchView messageData](self, "messageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__ETGLSketchView_animateOutWithCompletion___block_invoke;
  v9[3] = &unk_24F6E6C98;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v10 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x22E2FF82C](v9);
  if (-[ETGLSketchView isPaused](self, "isPaused"))
    v8[2](v8);
  else
    -[ETGLSketchRenderer animateOutWithCompletion:](self->_renderer, "animateOutWithCompletion:", v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __43__ETGLSketchView_animateOutWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  uint64_t result;
  uint8_t v8[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22C68B000, v2, OS_LOG_TYPE_INFO, "Completed animation. Stopping displaylink and removing view", v8, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "didEndWisping");

  if ((v4 & 1) == 0)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "didEndWisp");

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "clear");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)beginStrokeWithColor:(id)a3
{
  id v4;
  void *v5;
  CGColor *v6;
  id v7;
  float64x2_t v8;
  float64x2_t v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  float32x4_t v22;
  float64_t v23;
  float64_t v24;
  float64_t v25;
  float64_t v26;

  v4 = a3;
  if (!self->_playing)
  {
    -[ETGLSketchView messageData](self, "messageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addStrokeWithColor:", v4);

  }
  v6 = -[UIColor CGColor](self->_currentStrokeColor, "CGColor");
  v7 = objc_retainAutorelease(v4);
  if (!CGColorEqualToColor(v6, (CGColorRef)objc_msgSend(v7, "CGColor")))
  {
    objc_storeStrong((id *)&self->_currentStrokeColor, v7);
    v25 = 0.0;
    v26 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);
    v8.f64[0] = v26;
    v8.f64[1] = v25;
    v9.f64[0] = v24;
    v9.f64[1] = v23;
    v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
    -[ETGLSketchView renderer](self, "renderer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFinalDrawingColor:", &v22);

    v20 = 0.0;
    v21 = 0.0;
    v19 = 0.0;
    objc_msgSend(v7, "getHue:saturation:brightness:alpha:", &v21, &v20, &v19, &v23);
    v11 = v21 + -0.05 + 1.0;
    v12 = fmodf(v11, 1.0);
    v13 = v20 + -0.05;
    v20 = fmaxf(fminf(v13, 1.0), 0.0);
    v21 = v12;
    v14 = v19 + 0.2;
    v19 = fmaxf(fminf(v14, 1.0), 0.0);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);
    v16.f64[0] = v26;
    v16.f64[1] = v25;
    v17.f64[0] = v24;
    v17.f64[1] = v23;
    v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v17);
    -[ETGLSketchView renderer](self, "renderer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInitialDrawingColor:", &v22);

  }
}

- (void)_drawCurrentPointAdvancingPlayback
{
  void *v3;
  unint64_t currentStrokeIndex;
  void *v5;
  unint64_t currentPointIndex;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  double v14;
  _BOOL4 v15;
  ETSketchMessage *messageData;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  dispatch_time_t v21;
  _QWORD v22[5];
  unsigned int v23;
  __int16 v24;

  -[ETSketchMessage strokes](self->_messageData, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentStrokeIndex = self->_currentStrokeIndex;
  if (currentStrokeIndex < objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", self->_currentStrokeIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    currentPointIndex = self->_currentPointIndex;
    if (currentPointIndex >= objc_msgSend(v5, "count"))
    {
      self->_currentPointIndex = 0;
      ++self->_currentStrokeIndex;
      ++self->_numberOfDrawnStrokes;
      v7 = self->_currentStrokeIndex;
      if (v7 >= objc_msgSend(v3, "count"))
      {
        self->_playbackCompleted = 1;
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", self->_currentStrokeIndex);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", self->_currentPointIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getValue:", &v23);

    LOWORD(v10) = v24;
    self->_timestampForLastDrawnPoint = (double)v10 / 1000.0;
    v11 = v23;
    v12 = objc_msgSend(v5, "count");
    v13 = (double)(unsigned __int16)v11 / 32767.0 + -1.0;
    v14 = (double)HIWORD(v11) / 32767.0 + -1.0;
    if (!self->_currentPointIndex)
    {
      v15 = -[ETSketchMessage hasMultipleColors](self->_messageData, "hasMultipleColors");
      messageData = self->_messageData;
      if (v15)
      {
        -[ETSketchMessage colorsInMessage](messageData, "colorsInMessage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", self->_numberOfDrawnStrokes);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ETMessage color](messageData, "color");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[ETGLSketchView beginStrokeWithColor:](self, "beginStrokeWithColor:", v18);
      if (v12 == 1)
      {
        -[ETGLSketchView handleTapAtPosition:](self, "handleTapAtPosition:", v13, v14);
        self->_renderingDelay = 0.1;
      }

    }
    -[ETGLSketchView handleSketchAtPosition:](self, "handleSketchAtPosition:", v13, v14);
    v19 = self->_currentPointIndex + 1;
    self->_currentPointIndex = v19;
    if (v19 == objc_msgSend(v5, "count"))
    {
      -[ETGLSketchView didCompleteStroke](self, "didCompleteStroke");
      ++self->_currentStrokeIndex;
      ++self->_numberOfDrawnStrokes;
      self->_currentPointIndex = 0;
      if (v12 != 1)
        self->_renderingDelay = 0.3;
    }
    v20 = self->_currentStrokeIndex;
    if (v20 == objc_msgSend(v3, "count"))
    {
      self->_playbackCompleted = 1;
      -[ETGLSketchView setPlaying:](self, "setPlaying:", 0);
      if (-[ETMessage isRenderingOffscreen](self->_messageData, "isRenderingOffscreen"))
      {
        -[ETGLSketchView _endPlayback](self, "_endPlayback");
      }
      else
      {
        v21 = dispatch_time(0, 300000000);
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __52__ETGLSketchView__drawCurrentPointAdvancingPlayback__block_invoke;
        v22[3] = &unk_24F6E6CC0;
        v22[4] = self;
        dispatch_after(v21, MEMORY[0x24BDAC9B8], v22);
      }
    }
    goto LABEL_21;
  }
  self->_playbackCompleted = 1;
LABEL_22:

}

uint64_t __52__ETGLSketchView__drawCurrentPointAdvancingPlayback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPlayback");
}

- (void)drawFrameBeforeWisp
{
  void *v3;
  int v4;
  int v5;

  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  -[ETGLSketchView setPlaying:](self, "setPlaying:", 1);
  do
  {
    -[ETGLSketchView _drawCurrentPointAdvancingPlayback](self, "_drawCurrentPointAdvancingPlayback");
    -[ETGLSketchRenderer render](self->_renderer, "render");
    -[ETGLSketchView messageData](self, "messageData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "didDrawPoints");

  }
  while (!v4);
  v5 = 18;
  do
  {
    -[ETGLSketchView _drawCurrentPointAdvancingPlayback](self, "_drawCurrentPointAdvancingPlayback");
    -[ETGLSketchRenderer render](self->_renderer, "render");
    --v5;
  }
  while (v5);
}

- (BOOL)_doesPoint:(id *)a3 predateTime:(double)a4
{
  double renderingStartTime;
  double v5;

  renderingStartTime = self->_renderingStartTime;
  v5 = a4 - renderingStartTime;
  LOWORD(renderingStartTime) = a3->var1.var0;
  return v5 >= (double)*(unint64_t *)&renderingStartTime / 1000.0;
}

- (void)drawView:(id)a3
{
  id v4;
  double v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  double v10;
  void *v11;
  _BYTE v12[6];

  v4 = a3;
  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  if (self->_playing)
  {
    objc_msgSend(v4, "timestamp");
    v6 = v5;
    if (self->_renderingStartTime == 0.0)
      self->_renderingStartTime = v5;
    if (-[ETMessage supportsPlaybackTimeOffset](self->_messageData, "supportsPlaybackTimeOffset"))
    {
      v7 = -[ETGLSketchView _getCurrentSketchPoint:](self, "_getCurrentSketchPoint:", v12);
      v8 = -601;
      while (self->_playing)
      {
        if (!v7)
          break;
        if (!-[ETGLSketchView _doesPoint:predateTime:](self, "_doesPoint:predateTime:", v12, v6))
          break;
        if (__CFADD__(v8++, 1))
          break;
        -[ETGLSketchView _drawCurrentPointAdvancingPlayback](self, "_drawCurrentPointAdvancingPlayback");
        v7 = -[ETGLSketchView _getCurrentSketchPoint:](self, "_getCurrentSketchPoint:", v12);
      }
      if (-[ETSketchMessage hideComet](self->_messageData, "hideComet") && self->_playbackCompleted)
      {
        v10 = v6 + 1000.0;
        *(float *)&v10 = v6 + 1000.0;
        -[ETGLSketchRenderer updateGLWithTime:](self->_renderer, "updateGLWithTime:", v10);
      }
    }
    else
    {
      self->_renderingDelay = fmax(self->_renderingDelay - (v6 - self->_lastDisplayLinkTime), 0.0);
      self->_lastDisplayLinkTime = v6;
      if (self->_renderingDelay == 0.0)
        -[ETGLSketchView _drawCurrentPointAdvancingPlayback](self, "_drawCurrentPointAdvancingPlayback");
    }
  }
  -[ETGLSketchView renderer](self, "renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "render");

}

- (BOOL)_getCurrentSketchPoint:(id *)a3
{
  void *v5;
  unint64_t currentStrokeIndex;
  void *v7;
  unint64_t currentPointIndex;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;

  -[ETSketchMessage strokes](self->_messageData, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentStrokeIndex = self->_currentStrokeIndex;
  if (currentStrokeIndex >= objc_msgSend(v5, "count"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", self->_currentStrokeIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    currentPointIndex = self->_currentPointIndex;
    v9 = objc_msgSend(v7, "count");
    v10 = currentPointIndex >= v9;
    v11 = currentPointIndex < v9;
    if (!v10)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", self->_currentPointIndex);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getValue:", a3);

    }
  }

  return v11;
}

- (CGImage)createRenderedFrameImage
{
  void *v2;
  CGImage *v3;

  -[ETGLSketchView renderer](self, "renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "createRenderedFrameImageUsingAlpha:", 0);

  return v3;
}

- (CGImage)createImageForTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  CGImage *v10;

  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  self->_playing = 1;
  if (self->_playbackCompleted)
  {
LABEL_4:
    if (!-[ETMessage delayWisp](self->_messageData, "delayWisp"))
    {
      -[ETGLSketchView renderer](self, "renderer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIsDying:", 1);

    }
  }
  else
  {
    while (self->_timestampForLastDrawnPoint <= a3)
    {
      -[ETGLSketchView _drawCurrentPointAdvancingPlayback](self, "_drawCurrentPointAdvancingPlayback");
      if (self->_playbackCompleted)
        goto LABEL_4;
    }
  }
  -[ETGLSketchView renderer](self, "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "updateGLWithTime:", v7);

  -[ETGLSketchView renderer](self, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "render");

  self->_playing = 0;
  -[ETGLSketchView renderer](self, "renderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CGImage *)objc_msgSend(v9, "createRenderedFrameImageUsingAlpha:", -[ETMessage isRenderingOffscreenOpaque](self->_messageData, "isRenderingOffscreenOpaque") ^ 1);

  return v10;
}

- (void)_endPlayback
{
  -[ETGLSketchView setPlaying:](self, "setPlaying:", 0);
  -[ETSketchMessage willBeginWisp](self->_messageData, "willBeginWisp");
  if (!-[ETMessage delayWisp](self->_messageData, "delayWisp")
    && !-[ETMessage isRenderingOffscreen](self->_messageData, "isRenderingOffscreen"))
  {
    -[ETGLSketchView animateOutWithCompletion:](self, "animateOutWithCompletion:", 0);
  }
}

- (void)setPaused:(BOOL)a3
{
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  id v8;

  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!self->_renderingOffscreen)
    {
      if (a3)
      {
        self->_pauseTime = CFAbsoluteTimeGetCurrent();
        -[CADisplayLink invalidate](self->_displayLink, "invalidate");
        displayLink = self->_displayLink;
        self->_displayLink = 0;

        if (-[ETSketchMessage didDrawPoints](self->_messageData, "didDrawPoints")
          && !-[ETSketchMessage didEndWisping](self->_messageData, "didEndWisping")
          && !-[ETMessage delayWisp](self->_messageData, "delayWisp"))
        {
          -[ETGLSketchView animateOutWithCompletion:](self, "animateOutWithCompletion:", 0);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_drawView_);
        v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        v6 = self->_displayLink;
        self->_displayLink = v5;

        -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
        if (self->_pauseTime != 0.0)
        {
          self->_renderingStartTime = CFAbsoluteTimeGetCurrent() - self->_pauseTime + self->_renderingStartTime;
          self->_pauseTime = 0.0;
        }
        v7 = self->_displayLink;
        objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:");

      }
    }
  }
}

- (void)setPlaying:(BOOL)a3
{
  UIColor *currentStrokeColor;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      currentStrokeColor = self->_currentStrokeColor;
      self->_currentStrokeColor = 0;

      self->_currentPointIndex = 0;
      self->_numberOfDrawnStrokes = 0;
      self->_renderingStartTime = 0.0;
      self->_renderingDelay = 0.0;
      -[ETGLSketchView messageData](self, "messageData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDidDrawPoints:", 0);
      objc_msgSend(v5, "setDidEndWisping:", 0);
      objc_msgSend(v5, "color");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ETGLSketchView beginStrokeWithColor:](self, "beginStrokeWithColor:", v6);

      -[ETGLSketchView setPaused:](self, "setPaused:", 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "message playback mode has begun", v8, 2u);
        }

      }
    }
  }
}

- (void)clear
{
  NSObject *v3;
  ETGLSketchRenderer *renderer;
  EAGLContext *context;
  uint8_t v6[16];

  -[ETGLSketchView setPlaying:](self, "setPlaying:", 0);
  -[ETGLSketchView setPaused:](self, "setPaused:", 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22C68B000, v3, OS_LOG_TYPE_INFO, "Clearing Renderer", v6, 2u);
    }

  }
  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  -[ETGLSketchRenderer erase](self->_renderer, "erase");
  -[ETGLSketchRenderer reset](self->_renderer, "reset");
  renderer = self->_renderer;
  self->_renderer = 0;

  -[ETGLSketchView clearAllPoints](self, "clearAllPoints");
  context = self->_context;
  self->_context = 0;

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  ETGLSketchRenderer *renderer;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ETGLSketchView;
  -[ETGLSketchView layoutSubviews](&v20, sel_layoutSubviews);
  -[ETGLSketchView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[ETGLSketchView contentScaleFactor](self, "contentScaleFactor");
  v8 = 2.0 / (v7 * v4);
  -[ETGLSketchView contentScaleFactor](self, "contentScaleFactor");
  v10 = 2.0 / (v6 * v9);
  if (v8 < v10)
    v10 = v8;
  v11 = v4 / 156.0;
  v12 = fmax(v11 * 0.7, 1.0) * v10;
  self->_unitSize = v12;
  renderer = self->_renderer;
  -[ETGLSketchView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETGLSketchRenderer resizeFromLayer:](renderer, "resizeFromLayer:", v14);

  -[ETGLSketchRenderer setUseFastVerticalWisp:](self->_renderer, "setUseFastVerticalWisp:", self->_useFastVerticalWisp);
  v15 = fmax(v11, 1.0);
  if (v15 > 3.0)
    v15 = 3.0;
  -[ETGLSketchRenderer setLineWidthScaleFactor:](self->_renderer, "setLineWidthScaleFactor:", v15);
  *(float *)&v16 = self->_unitSize * 5.0;
  -[ETBoxcarFilterPointFIFO setSpacing:](self->_smoothingFIFO, "setSpacing:", v16);
  *(float *)&v17 = self->_unitSize;
  -[ETQuadCurvePointFIFO setUnitSize:](self->_interpolatingFIFO, "setUnitSize:", v17);
  *(float *)&v18 = self->_unitSize * 5.0;
  -[ETBoxcarFilterPointFIFO setSpacing:](self->_secondarySmoothingFIFO, "setSpacing:", v18);
  *(float *)&v19 = self->_unitSize;
  -[ETQuadCurvePointFIFO setUnitSize:](self->_secondaryInterpolatingFIFO, "setUnitSize:", v19);
}

- (void)handleTapAtPosition:(CGPoint)a3
{
  CGFloat v4;
  CGFloat x;
  CGFloat y;
  float32x2_t v7;

  if (!self->_playing)
  {
    x = a3.x;
    y = a3.y;
    -[ETSketchMessage addSketchPoint:](self->_messageData, "addSketchPoint:", a3.x, a3.y);
    a3.x = x;
    a3.y = y;
  }
  v4 = a3.y;
  v7 = vcvt_f32_f64((float64x2_t)a3);
  -[ETGLSketchRenderer appendPointArray:length:](self->_renderer, "appendPointArray:length:", &v7, 1);
}

- (void)updateRendererWithPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:
{
  uint64_t v2;
  unint64_t v3;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v4;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v5;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *end;
  void *v20;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_controlBatches;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v30;
  char *v31;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v32;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v34;
  vector<unsigned long, std::allocator<unsigned long>> *p_vertexBatchCount;
  unint64_t *v36;
  unint64_t *value;
  unint64_t *v38;
  unint64_t *begin;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  unint64_t *v45;
  unint64_t *v46;
  unint64_t v47;
  void *__p;
  char *v49;
  char *v50;

  v5 = v4;
  v6 = v3;
  __p = 0;
  v49 = 0;
  v50 = 0;
  if (v3)
  {
    v8 = v2;
    v9 = 0;
    v10 = 0;
    do
    {
      if (v9 >= v50)
      {
        v11 = (v9 - (_BYTE *)__p) >> 3;
        if ((unint64_t)(v11 + 1) >> 61)
          _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
        v12 = (v50 - (_BYTE *)__p) >> 2;
        if (v12 <= v11 + 1)
          v12 = v11 + 1;
        if ((unint64_t)(v50 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v12;
        if (v13)
          v14 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v50, v13);
        else
          v14 = 0;
        v15 = &v14[8 * v11];
        *(_QWORD *)v15 = *(_QWORD *)(v8 + 8 * v10);
        v9 = v15 + 8;
        v17 = (char *)__p;
        v16 = v49;
        if (v49 != __p)
        {
          do
          {
            v18 = *((_QWORD *)v16 - 1);
            v16 -= 8;
            *((_QWORD *)v15 - 1) = v18;
            v15 -= 8;
          }
          while (v16 != v17);
          v16 = (char *)__p;
        }
        __p = v15;
        v49 = v9;
        v50 = &v14[8 * v13];
        if (v16)
          operator delete(v16);
      }
      else
      {
        *(_QWORD *)v9 = *(_QWORD *)(v8 + 8 * v10);
        v9 += 8;
      }
      v49 = v9;
      ++v10;
    }
    while (v10 != v6);
  }
  end = (char *)self->_vertexBatches.__end_;
  if (end >= self->_vertexBatches.__end_cap_.__value_)
  {
    v20 = (void *)_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE21__push_back_slow_pathIRKS4_EEPS4_OT_((uint64_t *)&self->_vertexBatches, (uint64_t)&__p);
  }
  else
  {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE22__construct_one_at_endB8ne180100IJRKS4_EEEvDpOT_((uint64_t)&self->_vertexBatches, (uint64_t)&__p);
    v20 = end + 24;
  }
  self->_vertexBatches.__end_ = v20;
  p_controlBatches = &self->_controlBatches;
  v22 = *(_QWORD **)self->_anon_280;
  v23 = *(_QWORD *)&self->_anon_280[8];
  if ((unint64_t)v22 >= v23)
  {
    v25 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)v22
        - p_controlBatches->var0;
    if ((unint64_t)(v25 + 1) >> 61)
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    v26 = v23 - (unint64_t)p_controlBatches->var0;
    v27 = v26 >> 2;
    if (v26 >> 2 <= (unint64_t)(v25 + 1))
      v27 = v25 + 1;
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
      v28 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v28 = v27;
    if (v28)
      v29 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_280[8], v28);
    else
      v29 = 0;
    v30 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v29[8 * v25];
    v31 = &v29[8 * v28];
    *v30 = *v5;
    v24 = v30 + 1;
    var0 = p_controlBatches->var0;
    v32 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_280;
    if (v32 != p_controlBatches->var0)
    {
      do
      {
        v34 = *--v32;
        *--v30 = v34;
      }
      while (v32 != var0);
      v32 = p_controlBatches->var0;
    }
    p_controlBatches->var0 = v30;
    *(_QWORD *)self->_anon_280 = v24;
    *(_QWORD *)&self->_anon_280[8] = v31;
    if (v32)
      operator delete(v32);
  }
  else
  {
    *v22 = *v5;
    v24 = v22 + 1;
  }
  *(_QWORD *)self->_anon_280 = v24;
  p_vertexBatchCount = &self->_vertexBatchCount;
  v36 = self->_vertexBatchCount.__end_;
  value = self->_vertexBatchCount.__end_cap_.__value_;
  if (v36 >= value)
  {
    begin = p_vertexBatchCount->__begin_;
    v40 = v36 - p_vertexBatchCount->__begin_;
    v41 = v40 + 1;
    if ((unint64_t)(v40 + 1) >> 61)
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    v42 = (char *)value - (char *)begin;
    if (v42 >> 2 > v41)
      v41 = v42 >> 2;
    if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
      v43 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v43 = v41;
    if (v43)
    {
      v44 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_vertexBatchCount.__end_cap_, v43);
      begin = p_vertexBatchCount->__begin_;
      v36 = self->_vertexBatchCount.__end_;
    }
    else
    {
      v44 = 0;
    }
    v45 = (unint64_t *)&v44[8 * v40];
    v46 = (unint64_t *)&v44[8 * v43];
    *v45 = v6;
    v38 = v45 + 1;
    while (v36 != begin)
    {
      v47 = *--v36;
      *--v45 = v47;
    }
    p_vertexBatchCount->__begin_ = v45;
    self->_vertexBatchCount.__end_ = v38;
    self->_vertexBatchCount.__end_cap_.__value_ = v46;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *v36 = v6;
    v38 = v36 + 1;
  }
  self->_vertexBatchCount.__end_ = v38;
  self->_vertexOffset += v6;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }
}

- (void)updateRendererWithSecondaryPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:
{
  uint64_t v2;
  unint64_t v3;
  double *v4;
  int v5;
  int v6;
  double *v7;
  unint64_t v8;
  uint64_t v9;
  double v11;
  vector<unsigned long, std::allocator<unsigned long>> *p_secondaryVertexBatchCount;
  unint64_t *end;
  unint64_t *value;
  double *v15;
  unint64_t *v16;
  unint64_t *begin;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  p_secondaryVertexBatchCount = &self->_secondaryVertexBatchCount;
  end = self->_secondaryVertexBatchCount.__end_;
  value = self->_secondaryVertexBatchCount.__end_cap_.__value_;
  if (end >= value)
  {
    begin = p_secondaryVertexBatchCount->__begin_;
    v18 = end - p_secondaryVertexBatchCount->__begin_;
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 61)
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    v20 = (char *)value - (char *)begin;
    if (v20 >> 2 > v19)
      v19 = v20 >> 2;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
      v21 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v21 = v19;
    v15 = v7;
    if (v21)
    {
      v22 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_secondaryVertexBatchCount.__end_cap_, v21);
      begin = p_secondaryVertexBatchCount->__begin_;
      end = self->_secondaryVertexBatchCount.__end_;
    }
    else
    {
      v22 = 0;
    }
    v23 = (unint64_t *)&v22[8 * v18];
    v24 = (unint64_t *)&v22[8 * v21];
    *v23 = v8;
    v16 = v23 + 1;
    while (end != begin)
    {
      v25 = *--end;
      *--v23 = v25;
    }
    p_secondaryVertexBatchCount->__begin_ = v23;
    self->_secondaryVertexBatchCount.__end_ = v16;
    self->_secondaryVertexBatchCount.__end_cap_.__value_ = v24;
    if (begin)
      operator delete(begin);
  }
  else
  {
    v15 = v7;
    *end = v8;
    v16 = end + 1;
  }
  self->_secondaryVertexBatchCount.__end_ = v16;
  if (v6)
  {
    v26 = self->_vertexBatchCount.__begin_;
    v27 = (char *)self->_vertexBatchCount.__end_ - (char *)v26;
    v28 = (char *)v16 - (char *)p_secondaryVertexBatchCount->__begin_;
    v29 = v28 >> 3;
    v30 = (v28 >> 3) - 1;
    if (v30 < v27 >> 3)
    {
      v31 = v8;
      v32 = v9;
      v33 = v15;
      v34 = 0;
      v41 = 608;
      v42 = (v27 >> 3) - (v28 >> 3) + 2;
      v39 = 536;
      v40 = 632;
      v35 = 24 * v29 - 24;
      v36 = 8 * v29 - 8;
      do
      {
        *(float *)&v11 = self->_unitSize;
        v37 = v31;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v39), "appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:", *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa + v41) + v35), *(unint64_t *)((char *)&v26[v34] + v36), v32, v31, v34, v42, *(double *)(*(char **)((char *)&self->super.super.super.isa + v40) + 8 * v34 + v36), *v33, v11, v39, v40, v41, v42);
        v31 = v37;
        ++v34;
        v26 = self->_vertexBatchCount.__begin_;
        v35 += 24;
      }
      while (v30 + v34 < self->_vertexBatchCount.__end_ - v26);
    }
  }
  else
  {
    v38 = (char *)v16 - (char *)p_secondaryVertexBatchCount->__begin_;
    if ((unint64_t)v38 >= 9)
    {
      *(float *)&v11 = self->_unitSize;
      -[ETGLSketchRenderer appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:](self->_renderer, "appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:", *(double *)&self->_controlBatches.var0[(v38 >> 3) - 1], *v15, v11);
    }
  }
}

- (void)handleSketchAtPosition:(CGPoint)a3
{
  float64x2_t v4;
  double x;
  double y;
  float32x2_t v7;

  x = a3.x;
  y = a3.y;
  -[ETGLSketchView setGLContextAsCurrent](self, "setGLContextAsCurrent");
  if (!self->_playing)
    -[ETSketchMessage addSketchPoint:](self->_messageData, "addSketchPoint:", x, y);
  v4.f64[0] = x;
  v4.f64[1] = y;
  v7 = vcvt_f32_f64(v4);
  -[ETPointFIFO addPoints:count:](self->_pointFIFO, "addPoints:count:", &v7, 1);
  -[ETPointFIFO addPoints:count:](self->_secondaryPointFIFO, "addPoints:count:", &v7, 1);
}

- (void)didCompleteStroke
{
  -[ETPointFIFO flush](self->_pointFIFO, "flush");
  -[ETPointFIFO flush](self->_secondaryPointFIFO, "flush");
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE7__clearB8ne180100Ev((uint64_t *)&self->_vertexBatches);
  *(_QWORD *)self->_anon_280 = self->_controlBatches.var0;
  self->_vertexBatchCount.__end_ = self->_vertexBatchCount.__begin_;
  self->_secondaryVertexBatchCount.__end_ = self->_secondaryVertexBatchCount.__begin_;
}

- (void)clearAllPoints
{
  -[ETPointFIFO clear](self->_pointFIFO, "clear");
  -[ETPointFIFO clear](self->_secondaryPointFIFO, "clear");
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE7__clearB8ne180100Ev((uint64_t *)&self->_vertexBatches);
  *(_QWORD *)self->_anon_280 = self->_controlBatches.var0;
  self->_vertexBatchCount.__end_ = self->_vertexBatchCount.__begin_;
  self->_secondaryVertexBatchCount.__end_ = self->_secondaryVertexBatchCount.__begin_;
}

- (void)sketchRendererDidReachVertexLimit:(id)a3
{
  -[ETSketchMessage didReachRendererLimit](self->_messageData, "didReachRendererLimit", a3);
}

- (ETSketchMessage)messageData
{
  return self->_messageData;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)wispDelay
{
  return self->_wispDelay;
}

- (double)timestampForLastDrawnPoint
{
  return self->_timestampForLastDrawnPoint;
}

- (void)setTimestampForLastDrawnPoint:(double)a3
{
  self->_timestampForLastDrawnPoint = a3;
}

- (BOOL)playbackCompleted
{
  return self->_playbackCompleted;
}

- (void)setPlaybackCompleted:(BOOL)a3
{
  self->_playbackCompleted = a3;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (ETGLSketchRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (ETQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, a3);
}

- (ETBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_smoothingFIFO, a3);
}

- (ETPointFIFO)pointFIFO
{
  return self->_pointFIFO;
}

- (void)setPointFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_pointFIFO, a3);
}

- (ETQuadCurvePointFIFO)secondaryInterpolatingFIFO
{
  return self->_secondaryInterpolatingFIFO;
}

- (void)setSecondaryInterpolatingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryInterpolatingFIFO, a3);
}

- (ETBoxcarFilterPointFIFO)secondarySmoothingFIFO
{
  return self->_secondarySmoothingFIFO;
}

- (void)setSecondarySmoothingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySmoothingFIFO, a3);
}

- (ETPointFIFO)secondaryPointFIFO
{
  return self->_secondaryPointFIFO;
}

- (void)setSecondaryPointFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryPointFIFO, a3);
}

- (float)unitSize
{
  return self->_unitSize;
}

- (void)setUnitSize:(float)a3
{
  self->_unitSize = a3;
}

- (vector<std::vector<float)vertexBatches
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::vector<float __attribute__((ext_vector_type(2)))>, std::allocator<std::vector<float __attribute__((ext_vector_type(2)))>>> *)_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__init_with_sizeB8ne180100IPS4_S8_EEvT_T0_m(retstr, (uint64_t)self->_vertexBatches.__begin_, (uint64_t)self->_vertexBatches.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_vertexBatches.__end_ - (char *)self->_vertexBatches.__begin_) >> 3));
}

- (void)setVertexBatches:(vector<std::vector<float)__attribute__((ext_vector_type(2
{
  vector<std::vector<float __attribute__((ext_vector_type(2)))>, std::allocator<std::vector<float __attribute__((ext_vector_type(2)))>>> *p_vertexBatches;

  p_vertexBatches = &self->_vertexBatches;
  if (p_vertexBatches != a3)
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE18__assign_with_sizeB8ne180100IPS4_S8_EEvT_T0_l((uint64_t)p_vertexBatches, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
}

- (vector<float)controlBatches
{
  _QWORD *v2;

  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_controlBatches.var0, *(_QWORD *)self->_anon_280, (uint64_t)(*(_QWORD *)self->_anon_280 - (unint64_t)self->_controlBatches.var0) >> 3);
}

- (void)setControlBatches:(vector<float)__attribute__((ext_vector_type(2
{
  char *p_controlBatches;

  p_controlBatches = (char *)&self->_controlBatches;
  if (p_controlBatches != (char *)a3.var0)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_controlBatches, *(char **)a3.var0, *((_QWORD *)a3.var0 + 1), (uint64_t)(*((_QWORD *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
}

- (vector<unsigned)vertexBatchCount
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_vertexBatchCount.__begin_, (uint64_t)self->_vertexBatchCount.__end_, self->_vertexBatchCount.__end_- self->_vertexBatchCount.__begin_);
}

- (void)setVertexBatchCount:(vector<unsigned)long
{
  char *p_vertexBatchCount;

  p_vertexBatchCount = (char *)&self->_vertexBatchCount;
  if (p_vertexBatchCount != (char *)a3)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_vertexBatchCount, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (vector<unsigned)secondaryVertexBatchCount
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_secondaryVertexBatchCount.__begin_, (uint64_t)self->_secondaryVertexBatchCount.__end_, self->_secondaryVertexBatchCount.__end_- self->_secondaryVertexBatchCount.__begin_);
}

- (void)setSecondaryVertexBatchCount:(vector<unsigned)long
{
  char *p_secondaryVertexBatchCount;

  p_secondaryVertexBatchCount = (char *)&self->_secondaryVertexBatchCount;
  if (p_secondaryVertexBatchCount != (char *)a3)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_secondaryVertexBatchCount, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (unint64_t)vertexOffset
{
  return self->_vertexOffset;
}

- (void)setVertexOffset:(unint64_t)a3
{
  self->_vertexOffset = a3;
}

- (double)delayBetweenStrokes
{
  return self->_delayBetweenStrokes;
}

- (void)setDelayBetweenStrokes:(double)a3
{
  self->_delayBetweenStrokes = a3;
}

- (void).cxx_destruct
{
  vector<unsigned long, std::allocator<unsigned long>> *p_secondaryVertexBatchCount;
  unint64_t *begin;
  unint64_t *v5;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  vector<std::vector<float __attribute__((ext_vector_type(2)))>, std::allocator<std::vector<float __attribute__((ext_vector_type(2)))>>> *p_vertexBatches;

  p_secondaryVertexBatchCount = &self->_secondaryVertexBatchCount;
  begin = self->_secondaryVertexBatchCount.__begin_;
  if (begin)
  {
    p_secondaryVertexBatchCount->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_vertexBatchCount.__begin_;
  if (v5)
  {
    self->_vertexBatchCount.__end_ = v5;
    operator delete(v5);
  }
  var0 = self->_controlBatches.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_280 = var0;
    operator delete(var0);
  }
  p_vertexBatches = &self->_vertexBatches;
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__destroy_vectorclB8ne180100Ev((void ***)&p_vertexBatches);
  objc_storeStrong((id *)&self->_secondaryPointFIFO, 0);
  objc_storeStrong((id *)&self->_secondarySmoothingFIFO, 0);
  objc_storeStrong((id *)&self->_secondaryInterpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_pointFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_currentStrokeColor, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 81) = 0;
  *((_QWORD *)self + 79) = 0;
  *((_QWORD *)self + 83) = 0;
  *((_QWORD *)self + 84) = 0;
  *((_QWORD *)self + 82) = 0;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 87) = 0;
  *((_QWORD *)self + 85) = 0;
  return self;
}

@end
