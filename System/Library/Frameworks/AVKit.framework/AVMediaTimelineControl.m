@implementation AVMediaTimelineControl

- (AVMediaTimelineControl)initWithSource:(id)a3
{
  id v4;
  AVMediaTimelineControl *v5;
  uint64_t v6;
  AVMediaTimelineControlConfiguration *configuration;
  float v8;
  UISelectionFeedbackGenerator *v9;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  NSArray *v11;
  NSArray *timeRangeMarks;
  __int128 v13;
  NSArray *v14;
  NSArray *nonMaskedTimeRangeMarks;
  NSArray *v16;
  NSArray *maskedTimeRangeMarks;
  NSArray *v18;
  NSArray *timeRangeMarkLayers;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVMediaTimelineControl;
  v5 = -[AVMediaTimelineControl initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    +[AVMediaTimelineControlConfiguration defaultConfiguration](AVMediaTimelineControlConfiguration, "defaultConfiguration");
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (AVMediaTimelineControlConfiguration *)v6;

    objc_storeWeak((id *)&v5->_source, v4);
    v5->_enabled = 1;
    v5->_shouldUpdateTimelineValuesAccordingToSource = 0;
    objc_msgSend(v4, "currentValue");
    v5->_lastUpdatedTime = v8;
    v9 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    selectionFeedbackGenerator = v5->_selectionFeedbackGenerator;
    v5->_selectionFeedbackGenerator = v9;

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    timeRangeMarks = v5->_timeRangeMarks;
    v5->_timeRangeMarks = v11;

    v13 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v5->_sliderEdgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v5->_sliderEdgeInsets.bottom = v13;
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nonMaskedTimeRangeMarks = v5->_nonMaskedTimeRangeMarks;
    v5->_nonMaskedTimeRangeMarks = v14;

    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    maskedTimeRangeMarks = v5->_maskedTimeRangeMarks;
    v5->_maskedTimeRangeMarks = v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    timeRangeMarkLayers = v5->_timeRangeMarkLayers;
    v5->_timeRangeMarkLayers = v18;

    v5->_isObservationControllerActivelyObserving = 0;
    v5->_shouldSkipNextDisplayLinkUpdate = 0;
    v5->_isRetargetableAnimationInProgress = 0;
  }

  return v5;
}

- (void)dealloc
{
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  CADisplayLink *displayLink;
  NSTimer *inSyncWithSourceValuesTimer;
  objc_super v6;

  objc_storeWeak((id *)&self->_source, 0);
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  self->_isObservationControllerActivelyObserving = 0;
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  self->_selectionFeedbackGenerator = 0;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
  if (inSyncWithSourceValuesTimer)
    -[NSTimer invalidate](inSyncWithSourceValuesTimer, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)AVMediaTimelineControl;
  -[AVMediaTimelineControl dealloc](&v6, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  AVObservationController *v4;
  AVObservationController *observationController;
  AVObservationController *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  CADisplayLink *v11;
  CADisplayLink *displayLink;
  CADisplayLink *v13;
  void *v14;
  AVMobileChromelessTimelineView *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSTimer *inSyncWithSourceValuesTimer;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)AVMediaTimelineControl;
  -[AVMediaTimelineControl didMoveToWindow](&v23, sel_didMoveToWindow);
  -[AVMediaTimelineControl window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self)
    {
      if (!self->_observationController)
      {
        v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
        observationController = self->_observationController;
        self->_observationController = v4;

      }
      if (!self->_isObservationControllerActivelyObserving)
      {
        self->_isObservationControllerActivelyObserving = 1;
        v6 = self->_observationController;
        v24[0] = CFSTR("source.loading");
        v24[1] = CFSTR("source.playing");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[AVObservationController startObserving:keyPaths:observationHandler:](v6, "startObserving:keyPaths:observationHandler:", self, v7, &__block_literal_global_14596);

        v9 = -[AVObservationController startObserving:keyPath:observationHandler:](self->_observationController, "startObserving:keyPath:observationHandler:", self, CFSTR("source.timeRangeMarks"), &__block_literal_global_88);
        v10 = -[AVObservationController startObserving:keyPath:observationHandler:](self->_observationController, "startObserving:keyPath:observationHandler:", self, CFSTR("source.currentValue"), &__block_literal_global_92_14599);
      }
      if (!self->_displayLink)
      {
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink);
        v11 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        displayLink = self->_displayLink;
        self->_displayLink = v11;

        v13 = self->_displayLink;
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADisplayLink addToRunLoop:forMode:](v13, "addToRunLoop:forMode:", v14, *MEMORY[0x1E0C99860]);

        -[AVMediaTimelineControl _updateDisplayLinkPausedStateIfNeeded](self, "_updateDisplayLinkPausedStateIfNeeded");
      }
      -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
      if (!self->_timelineView)
      {
        v15 = -[AVMobileChromelessTimelineView initWithUsingFluidSlider:]([AVMobileChromelessTimelineView alloc], "initWithUsingFluidSlider:", 1);
        -[AVMobileChromelessTimelineView setAutoresizingMask:](v15, "setAutoresizingMask:", 0);
        -[AVMobileChromelessTimelineView setDelegate:](v15, "setDelegate:", self);
        -[AVMobileChromelessTimelineView slider](v15, "slider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = 1120403456;
        objc_msgSend(v16, "setTotalValue:", v17);

        -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:]((uint64_t)self, 0);
        -[AVMediaTimelineControl setTimelineView:](self, "setTimelineView:", v15);
        -[AVMediaTimelineControl addSubview:](self, "addSubview:", self->_timelineView);

      }
      -[AVMediaTimelineControl timelineView](self, "timelineView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "slider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__timelineSliderDidChangeValue_, 4096);
        objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__timelineSliderDidChangeValue_, 448);
        objc_msgSend(v20, "setDelegate:", self);
        objc_msgSend(v18, "fluidSlider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDirectionalHitRectInsets:", -8.0, 0.0, -8.0, 0.0);

      }
    }
    else
    {
      -[AVMediaTimelineControl _updateContainerLayersFrames](0);
    }
    -[AVMediaTimelineControl _updateConfiguration](self);
    -[AVMediaTimelineControl _updateTimeRangeMarksIfNeeded](self, "_updateTimeRangeMarksIfNeeded");
    -[AVMediaTimelineControl _updateFineScrubbingStyleIfNeeded](self);
    -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
  }
  else
  {
    if (self)
    {
      -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
      self->_isObservationControllerActivelyObserving = 0;
      inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
      if (inSyncWithSourceValuesTimer)
        -[NSTimer invalidate](inSyncWithSourceValuesTimer, "invalidate");
    }
    -[AVMediaTimelineControl _invalidateDisplayLink]((uint64_t)self);
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMediaTimelineControl;
  -[AVMediaTimelineControl layoutSubviews](&v4, sel_layoutSubviews);
  -[AVMediaTimelineControl timelineView](self, "timelineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControl bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
  -[AVMediaTimelineControl _updateTimeRangeMarksLayerFramesIfNeeded](self, "_updateTimeRangeMarksLayerFramesIfNeeded");
  -[AVMediaTimelineControl _updateMaskedTimeRangeLayerPathIfNeeded](self, "_updateMaskedTimeRangeLayerPathIfNeeded");
  -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMobileChromelessTimelineView intrinsicContentSize](self->_timelineView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMediaTimelineControl;
  -[AVMediaTimelineControl setHidden:](&v4, sel_setHidden_, a3);
  -[AVMediaTimelineControl _updateDisplayLinkPausedStateIfNeeded](self, "_updateDisplayLinkPausedStateIfNeeded");
}

- (void)_updateDisplayLinkPausedStateIfNeeded
{
  char v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  if (self->_displayLink)
  {
    v3 = -[AVMediaTimelineControl isHidden](self, "isHidden");
    -[AVMediaTimelineControl source](self, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLoading");

    -[AVMediaTimelineControl source](self, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPlaying");

    -[AVMediaTimelineControl _timelineViewSlider](self);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 1;
    if ((v3 & 1) == 0 && (v5 & 1) == 0)
      v8 = objc_msgSend(v9, "isTracking", 1) | v7 ^ 1;
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v8);

  }
}

- (void)_updateDisplayLinkRefreshRateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float timelineValuesUpdateInterval;
  float v18;
  float v19;
  CAFrameRateRange v22;

  if (self->_displayLink)
  {
    -[AVMediaTimelineControl window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;

    -[AVMediaTimelineControl source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxValue");
    v10 = v9;

    -[AVMediaTimelineControl _timelineViewSlider](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v7 * v12;

    v14 = v13;
    v15 = fabsf(v14);
    if (v14 <= 0.0 || v15 < 0.00000011921)
    {
      timelineValuesUpdateInterval = self->_timelineValuesUpdateInterval;
    }
    else
    {
      timelineValuesUpdateInterval = v10 / v13 * 0.5;
      self->_timelineValuesUpdateInterval = timelineValuesUpdateInterval;
    }
    if (fabsf(timelineValuesUpdateInterval) >= 0.00000011921)
    {
      v18 = 1.0 / (float)(timelineValuesUpdateInterval + timelineValuesUpdateInterval);
      if (vabds_f32(v18, self->_lastPreferredFramesPerSecond) >= 0.00000011921)
      {
        self->_lastPreferredFramesPerSecond = v18;
        v22 = CAFrameRateRangeMake(48.0, 120.0, 0.0);
        v19 = fabsf(v18 + -24.0);
        if (fabsf(v18) >= 0.00000011921 && v18 < 24.0 && v19 >= 0.00000011921)
          v22 = CAFrameRateRangeMake(v18, v18, v18);
        -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
      }
    }
  }
}

- (void)_updateMaskedTimeRangeLayerPathIfNeeded
{
  NSUInteger v3;
  NSUInteger v4;
  CGPath *Mutable;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  id v17;
  id v18;

  v3 = -[NSArray count](self->_maskedTimeRangeMarks, "count");
  if (self->_timeRangeMarksMaskingContainerLayer)
  {
    v4 = v3;
    Mutable = CGPathCreateMutable();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", -[AVMediaTimelineControl _maskingLayerFrame]((uint64_t)self));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v18, "CGPath"));
    if (v4 && -[NSArray count](self->_maskedTimeRangeMarks, "count"))
    {
      v6 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_maskedTimeRangeMarks, "objectAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMediaTimelineControl _uiProxyForTimeRangeMark:](self, "_uiProxyForTimeRangeMark:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[AVMediaTimelineControl _frameForTimeRangeMark:]((uint64_t)self, v7);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(v8, "cornerRadius");
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v17, "CGPath"));

        ++v6;
      }
      while (-[NSArray count](self->_maskedTimeRangeMarks, "count") > v6);
    }
    -[CAShapeLayer setPath:](self->_timeRangeMarksMaskingContainerLayer, "setPath:", Mutable);

  }
}

- (void)_updateSliderPulsingStateIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[AVMediaTimelineControl _timelineViewSlider](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVMediaTimelineControl source](self, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLoading");

    if (v5)
    {
      v6 = 2 * ((unint64_t)(objc_msgSend(v3, "tintState") - 1) > 1);
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__AVMediaTimelineControl__updateSliderPulsingStateIfNeeded__block_invoke;
      v7[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v8, &location);
      -[AVMediaTimelineControl _updateSliderTintStateToState:duration:completionHandler:]((id *)&self->super.super.super.isa, v6, v7, 1.0);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVMediaTimelineControl _updateSliderTintStateToState:duration:completionHandler:]((id *)&self->super.super.super.isa, 1, 0, 0.25);
    }
  }

}

- (void)_updateTimeRangeMarksIfNeeded
{
  NSArray *timeRangeMarks;
  AVMediaTimelineControlSource **p_source;
  id WeakRetained;
  NSArray *v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *maskedTimeRangeMarks;
  NSArray *v14;
  NSArray **p_nonMaskedTimeRangeMarks;
  NSArray *nonMaskedTimeRangeMarks;
  NSArray *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray **p_maskedTimeRangeMarks;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  CAShapeLayer *v27;
  CAShapeLayer *timeRangeMarksContainerLayer;
  void *v29;
  NSUInteger v30;
  void *v31;
  CAShapeLayer *v32;
  CAShapeLayer *timeRangeMarksMaskingContainerLayer;
  CAShapeLayer *v34;
  id v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  NSArray *timeRangeMarkLayers;
  unint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  float v46;
  NSArray *v47;
  NSArray *v48;
  void *v49;
  id v50;

  timeRangeMarks = self->_timeRangeMarks;
  p_source = &self->_source;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  objc_msgSend(WeakRetained, "timeRangeMarks");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

  if (timeRangeMarks == v6)
    return;
  v7 = objc_loadWeakRetained((id *)p_source);
  objc_msgSend(v7, "timeRangeMarks");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = self->_timeRangeMarks;
  self->_timeRangeMarks = v8;

  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (NSArray *)MEMORY[0x1E0C9AA60];
  v12 = (NSArray *)objc_msgSend(v10, "initWithArray:", MEMORY[0x1E0C9AA60]);
  maskedTimeRangeMarks = self->_maskedTimeRangeMarks;
  self->_maskedTimeRangeMarks = v12;

  v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v11);
  p_nonMaskedTimeRangeMarks = &self->_nonMaskedTimeRangeMarks;
  nonMaskedTimeRangeMarks = self->_nonMaskedTimeRangeMarks;
  self->_nonMaskedTimeRangeMarks = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v17 = self->_timeRangeMarks;
  if (v17)
    goto LABEL_5;
  if (objc_msgSend(0, "count"))
  {
    v17 = self->_timeRangeMarks;
LABEL_5:
    if (-[NSArray count](v17, "count"))
    {
      v18 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_timeRangeMarks, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMediaTimelineControl _uiProxyForTimeRangeMark:](self, "_uiProxyForTimeRangeMark:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v19, "startValue");
        objc_msgSend(v21, "numberWithFloat:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v22);

        if (objc_msgSend(v20, "isMasked"))
          p_maskedTimeRangeMarks = &self->_maskedTimeRangeMarks;
        else
          p_maskedTimeRangeMarks = &self->_nonMaskedTimeRangeMarks;
        -[NSArray arrayByAddingObject:](*p_maskedTimeRangeMarks, "arrayByAddingObject:", v19);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *p_maskedTimeRangeMarks;
        *p_maskedTimeRangeMarks = (NSArray *)v24;

        ++v18;
      }
      while (-[NSArray count](self->_timeRangeMarks, "count") > v18);
    }
  }
  -[AVMediaTimelineControl _timelineViewSlider](self);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setSnappingValues:", v50);
  v26 = -[NSArray count](*p_nonMaskedTimeRangeMarks, "count");
  if (!self->_timeRangeMarksContainerLayer && v26)
  {
    v27 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    timeRangeMarksContainerLayer = self->_timeRangeMarksContainerLayer;
    self->_timeRangeMarksContainerLayer = v27;

    -[AVMediaTimelineControl layer](self, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", self->_timeRangeMarksContainerLayer);

  }
  v30 = -[NSArray count](self->_maskedTimeRangeMarks, "count");
  if (!self->_timeRangeMarksMaskingContainerLayer && v30)
  {
    -[AVMediaTimelineControl _timelineViewSlider](self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      timeRangeMarksMaskingContainerLayer = self->_timeRangeMarksMaskingContainerLayer;
      self->_timeRangeMarksMaskingContainerLayer = v32;

      -[CAShapeLayer setFillRule:](self->_timeRangeMarksMaskingContainerLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
      v34 = self->_timeRangeMarksMaskingContainerLayer;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v34, "setFillColor:", objc_msgSend(v35, "CGColor"));

      -[AVMediaTimelineControl layer](self, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addSublayer:", self->_timeRangeMarksMaskingContainerLayer);

      objc_msgSend(v31, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMask:", self->_timeRangeMarksMaskingContainerLayer);

    }
  }
  if (self->_timeRangeMarksContainerLayer)
  {
    if (-[NSArray count](self->_timeRangeMarkLayers, "count"))
    {
      v38 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_timeRangeMarkLayers, "objectAtIndex:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "removeFromSuperlayer");

        ++v38;
      }
      while (-[NSArray count](self->_timeRangeMarkLayers, "count") > v38);
    }
    timeRangeMarkLayers = self->_timeRangeMarkLayers;
    self->_timeRangeMarkLayers = v11;

    if (-[NSArray count](*p_nonMaskedTimeRangeMarks, "count"))
    {
      v41 = 0;
      do
      {
        -[NSArray objectAtIndex:](*p_nonMaskedTimeRangeMarks, "objectAtIndex:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMediaTimelineControl _uiProxyForTimeRangeMark:](self, "_uiProxyForTimeRangeMark:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        objc_msgSend(v43, "backgroundColor");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v44, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));

        objc_msgSend(v43, "cornerRadius");
        objc_msgSend(v44, "setCornerRadius:", v46);
        objc_msgSend(v44, "setMasksToBounds:", 1);
        -[CAShapeLayer addSublayer:](self->_timeRangeMarksContainerLayer, "addSublayer:", v44);
        -[NSArray arrayByAddingObject:](self->_timeRangeMarkLayers, "arrayByAddingObject:", v44);
        v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v48 = self->_timeRangeMarkLayers;
        self->_timeRangeMarkLayers = v47;

        ++v41;
      }
      while (-[NSArray count](*p_nonMaskedTimeRangeMarks, "count") > v41);
    }
  }
  -[AVMediaTimelineControl _updateTimeRangeMarksLayerFramesIfNeeded](self, "_updateTimeRangeMarksLayerFramesIfNeeded");
  -[AVMediaTimelineControl _updateMaskedTimeRangeLayerPathIfNeeded](self, "_updateMaskedTimeRangeLayerPathIfNeeded");

}

- (void)_updateTimeRangeMarksLayerFramesIfNeeded
{
  unint64_t v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  float v12;
  float v13;
  void *v14;
  CGRect v15;
  CGRect v16;

  if (self->_timeRangeMarksContainerLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if ((-[UIViewPropertyAnimator isRunning](self->_timelineSliderEmphasisAnimator, "isRunning") & 1) != 0
      || self->_isRetargetableAnimationInProgress)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    }
    if (-[NSArray count](self->_nonMaskedTimeRangeMarks, "count"))
    {
      v3 = 0;
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        -[NSArray objectAtIndex:](self->_nonMaskedTimeRangeMarks, "objectAtIndex:", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMediaTimelineControl _uiProxyForTimeRangeMark:](self, "_uiProxyForTimeRangeMark:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "backgroundColor");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "CGColor");

        objc_msgSend(v9, "cornerRadius");
        v13 = v12;
        -[NSArray objectAtIndex:](self->_timeRangeMarkLayers, "objectAtIndex:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBackgroundColor:", v11);
        objc_msgSend(v14, "setCornerRadius:", v13);
        objc_msgSend(v14, "setMasksToBounds:", 1);
        v15.origin.x = -[AVMediaTimelineControl _frameForTimeRangeMark:]((uint64_t)self, v8);
        v16.origin.x = v4;
        v16.origin.y = v5;
        v16.size.width = v6;
        v16.size.height = v7;
        if (!CGRectEqualToRect(v15, v16))
          objc_msgSend(v14, "setFrame:", -[AVMediaTimelineControl _frameForTimeRangeMark:]((uint64_t)self, v8));

        ++v3;
      }
      while (-[NSArray count](self->_nonMaskedTimeRangeMarks, "count") > v3);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setConfiguration:(id)a3
{
  AVMediaTimelineControlConfiguration *v4;
  AVMediaTimelineControlConfiguration *configuration;

  if (self->_configuration != a3)
  {
    v4 = (AVMediaTimelineControlConfiguration *)objc_msgSend(a3, "copy");
    configuration = self->_configuration;
    self->_configuration = v4;

    -[AVMediaTimelineControl _updateConfiguration](self);
  }
}

- (AVMediaTimelineControlConfiguration)configuration
{
  return (AVMediaTimelineControlConfiguration *)(id)-[AVMediaTimelineControlConfiguration copy](self->_configuration, "copy");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[AVMediaTimelineControl _timelineViewSlider](self);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)setFineScrubbingStyle:(unint64_t)a3
{
  if (self->_fineScrubbingStyle != a3)
  {
    self->_fineScrubbingStyle = a3;
    -[AVMediaTimelineControl _updateFineScrubbingStyleIfNeeded](self);
  }
}

- (void)setSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_source, obj);
    -[AVMediaTimelineControl _updateDisplayLinkRefreshRateIfNeeded](self, "_updateDisplayLinkRefreshRateIfNeeded");
    v5 = obj;
  }

}

- (void)_handleDisplayLink
{
  if (!self->_shouldSkipNextDisplayLinkUpdate)
    -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:]((uint64_t)self, 0);
  self->_shouldSkipNextDisplayLinkUpdate = 0;
}

- (void)_timelineSliderDidChangeValue:(id)a3
{
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float lastFeedbackValue;
  float v16;
  float v17;
  BOOL v18;
  float v19;
  float v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  float v27;
  float v28;
  uint64_t v29;
  void *v30;
  float v31;
  double v32;
  id v33;

  -[AVMediaTimelineControl _timelineViewSlider](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;

  if (self)
  {
    if (self->_lastFeedbackValue != -3.4028e38)
    {
      -[AVMediaTimelineControl source](self, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minValue");
      v9 = v8;
      objc_msgSend(v7, "maxValue");
      v11 = v10;
      -[AVMediaTimelineControl _timelineViewSlider](self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v14 = v13;

      lastFeedbackValue = self->_lastFeedbackValue;
      v16 = (float)(v11 - v9) * 0.01;
      v17 = vabds_f32(v14, v16 + lastFeedbackValue);
      v18 = v14 <= (float)(v16 + lastFeedbackValue) || v17 < 0.00000011921;
      if (!v18
        || ((v19 = lastFeedbackValue - v16, v20 = vabds_f32(v14, v19), v14 < v19)
          ? (v21 = v20 < 0.00000011921)
          : (v21 = 1),
            !v21))
      {
        self->_lastFeedbackValue = -3.4028e38;
      }

    }
    -[AVMediaTimelineControl _timelineViewSlider](self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaTimelineControl timelineView](self, "timelineView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fluidSlider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[NSArray count](self->_timeRangeMarks, "count");
    if (v22)
    {
      if (v25 && v24 == 0)
      {
        objc_msgSend(v22, "value");
        v28 = v27;
        if (-[NSArray count](self->_timeRangeMarks, "count"))
        {
          v29 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_timeRangeMarks, "objectAtIndex:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "startValue");
            if (vabds_f32(v31, v28) < 0.00000011921 && vabds_f32(v31, self->_lastFeedbackValue) >= 0.00000011921)
              break;

            if (-[NSArray count](self->_timeRangeMarks, "count") <= ++v29)
              goto LABEL_27;
          }
          self->_lastFeedbackValue = v31;
          -[UISelectionFeedbackGenerator prepare](self->_selectionFeedbackGenerator, "prepare");

          -[UISelectionFeedbackGenerator selectionChanged](self->_selectionFeedbackGenerator, "selectionChanged");
        }
      }
    }
LABEL_27:

  }
  self->_lastUpdatedTime = v6;
  -[AVMediaTimelineControl delegate](self, "delegate");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v32 = v6;
    objc_msgSend(v33, "mediaTimelineControl:didChangeValue:", self, v32);
  }
  -[AVMediaTimelineControl _updateLabelsIfNeeded](self);

}

- (id)_uiProxyForTimeRangeMark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "markUIProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControl source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiProxyForTimeRangeMark:withSource:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)sliderDidBeginTracking:(id)a3
{
  NSTimer *inSyncWithSourceValuesTimer;
  id v5;

  -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
  -[AVMediaTimelineControl delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "mediaTimelineControlWillBeginChanging:", self);
  if (self)
  {
    inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
    if (inSyncWithSourceValuesTimer)
      -[NSTimer invalidate](inSyncWithSourceValuesTimer, "invalidate");
  }
  self->_shouldUpdateTimelineValuesAccordingToSource = 1;
  -[AVMediaTimelineControl _updateTimelineSliderEmphasisStateIfNeeded]((uint64_t)self);
  -[AVMediaTimelineControl _updateDisplayLinkPausedStateIfNeeded](self, "_updateDisplayLinkPausedStateIfNeeded");

}

- (void)sliderWillEndTracking:(id)a3
{
  NSTimer *inSyncWithSourceValuesTimer;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSTimer *v9;
  NSTimer *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[AVMediaTimelineControl delegate](self, "delegate", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "mediaTimelineControlDidEndChanging:", self);
  -[AVMediaTimelineControl _updateTimelineSliderEmphasisStateIfNeeded]((uint64_t)self);
  -[AVMediaTimelineControl _updateDisplayLinkPausedStateIfNeeded](self, "_updateDisplayLinkPausedStateIfNeeded");
  if (self)
  {
    inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
    if (inSyncWithSourceValuesTimer)
      -[NSTimer invalidate](inSyncWithSourceValuesTimer, "invalidate");
    -[AVMediaTimelineControl source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPlaying") & 1) != 0)
    {
      -[AVMediaTimelineControl source](self, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isLoading");

      if ((v7 & 1) == 0)
      {
        self->_shouldUpdateTimelineValuesAccordingToSource = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__AVMediaTimelineControl__updateShouldUpdateTimelineValuesAccordingToSource__block_invoke;
    v12[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 2.0);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_inSyncWithSourceValuesTimer;
    self->_inSyncWithSourceValuesTimer = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
LABEL_11:

}

- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  self->_sliderEdgeInsets = a4;
  -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
  -[AVMediaTimelineControl _updateTimeRangeMarksLayerFramesIfNeeded](self, "_updateTimeRangeMarksLayerFramesIfNeeded");
  -[AVMediaTimelineControl _updateMaskedTimeRangeLayerPathIfNeeded](self, "_updateMaskedTimeRangeLayerPathIfNeeded");
  -[AVMediaTimelineControl delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "mediaTimelineControl:didExtendWithInsets:", self, top, left, bottom, right);

}

- (void)slider:(id)a3 didChangeScrubbingRate:(unint64_t)a4
{
  unint64_t v6;
  id v7;

  -[AVMediaTimelineControl delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4 - 1 >= 3)
      v6 = 0;
    else
      v6 = a4;
    objc_msgSend(v7, "mediaTimelineControl:didChangeScrubbingRate:", self, v6);
  }

}

- (unint64_t)fineScrubbingStyle
{
  return self->_fineScrubbingStyle;
}

- (AVMediaTimelineControlSource)source
{
  return (AVMediaTimelineControlSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (AVMediaTimelineControlDelegate)delegate
{
  return (AVMediaTimelineControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (AVMobileChromelessTimelineView)timelineView
{
  return self->_timelineView;
}

- (void)setTimelineView:(id)a3
{
  objc_storeStrong((id *)&self->_timelineView, a3);
}

- (NSArray)timeRangeMarks
{
  return self->_timeRangeMarks;
}

- (void)setTimeRangeMarks:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeMarks, a3);
}

- (NSArray)nonMaskedTimeRangeMarks
{
  return self->_nonMaskedTimeRangeMarks;
}

- (void)setNonMaskedTimeRangeMarks:(id)a3
{
  objc_storeStrong((id *)&self->_nonMaskedTimeRangeMarks, a3);
}

- (NSArray)maskedTimeRangeMarks
{
  return self->_maskedTimeRangeMarks;
}

- (void)setMaskedTimeRangeMarks:(id)a3
{
  objc_storeStrong((id *)&self->_maskedTimeRangeMarks, a3);
}

- (NSArray)timeRangeMarkLayers
{
  return self->_timeRangeMarkLayers;
}

- (void)setTimeRangeMarkLayers:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeMarkLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMarkLayers, 0);
  objc_storeStrong((id *)&self->_maskedTimeRangeMarks, 0);
  objc_storeStrong((id *)&self->_nonMaskedTimeRangeMarks, 0);
  objc_storeStrong((id *)&self->_timeRangeMarks, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_timeRangeMarksMaskingContainerLayer, 0);
  objc_storeStrong((id *)&self->_timeRangeMarksContainerLayer, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_sliderPulsingAnimator, 0);
  objc_storeStrong((id *)&self->_timelineSliderEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_inSyncWithSourceValuesTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (double)_updateContainerLayersFrames
{
  double *v1;
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
  double v15;
  double v16;
  double v17;
  double v18;

  if (result)
  {
    v1 = result;
    if (*((_QWORD *)result + 62))
    {
      -[AVMediaTimelineControl _timelineViewSlider](result);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "frame");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v11 = v1[64];
      v12 = v1[65];
      v13 = v1[66];
      v14 = v1[67];

      v15 = v10 - (v11 + v13);
      v16 = v8 - (v12 + v14);
      v17 = v6 + v11;
      v18 = v4 + v12;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if ((objc_msgSend(*((id *)v1 + 54), "isRunning") & 1) != 0 || *((_BYTE *)v1 + 557))
        objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.2);
      else
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(*((id *)v1 + 62), "setFrame:", v18, v17, v16, v15);
      objc_msgSend(v1, "_updateTimeRangeMarksLayerFramesIfNeeded");
      return (double *)objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  return result;
}

- (id)_timelineViewSlider
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "timelineView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "fluidSlider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_updateTimelineSliderEmphasisStateIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  char v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  char v34;
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "timelineView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isTracking");
    if ((_DWORD)v4 != objc_msgSend(v2, "isEmphasized"))
    {
      objc_msgSend((id)a1, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "labelsConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "labelsStyle");

      objc_initWeak(&location, (id)a1);
      if (v7 != 2
        || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 512), *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 528), *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)
      {
        objc_msgSend(v2, "prepareForDeemphasisIfNeeded");
        objc_msgSend(v2, "setEmphasized:", v4);
        v11 = *(void **)(a1 + 432);
        v12 = 1.0;
        if (v11
          && objc_msgSend(v11, "isRunning")
          && objc_msgSend(*(id *)(a1 + 432), "isInterruptible"))
        {
          objc_msgSend(*(id *)(a1 + 432), "fractionComplete");
          v12 = v13;
          objc_msgSend(*(id *)(a1 + 432), "stopAnimation:", 1);
          objc_msgSend(*(id *)(a1 + 432), "finishAnimationAtPosition:", 2);
          v14 = *(void **)(a1 + 432);
          *(_QWORD *)(a1 + 432) = 0;

        }
        v15 = objc_alloc(MEMORY[0x1E0DC3F38]);
        if (v12 <= 1.0)
          v16 = v12 * 0.2;
        else
          v16 = 0.2;
        v17 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_3;
        v26[3] = &unk_1E5BB4CC8;
        v10 = &v27;
        objc_copyWeak(&v27, &location);
        v28 = v4;
        v18 = objc_msgSend(v15, "initWithDuration:curve:animations:", 3, v26, v16);
        v19 = *(void **)(a1 + 432);
        *(_QWORD *)(a1 + 432) = v18;

        v20 = *(void **)(a1 + 432);
        v21 = v17;
        v22 = 3221225472;
        v23 = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_4;
        v24 = &unk_1E5BB38A0;
        objc_copyWeak(&v25, &location);
        objc_msgSend(v20, "addCompletion:", &v21);
        objc_msgSend(*(id *)(a1 + 432), "startAnimation", v21, v22, v23, v24);
        objc_destroyWeak(&v25);
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0DC3F10];
        v9 = MEMORY[0x1E0C809B0];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke;
        v31[3] = &unk_1E5BB30D0;
        v10 = &v33;
        objc_copyWeak(&v33, &location);
        v32 = v2;
        v34 = v4;
        v29[0] = v9;
        v29[1] = 3221225472;
        v29[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_2;
        v29[3] = &unk_1E5BB2CB0;
        objc_copyWeak(&v30, &location);
        objc_msgSend(v8, "_animateByRetargetingAnimations:completion:", v31, v29);
        objc_destroyWeak(&v30);

      }
      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }

  }
}

void __76__AVMediaTimelineControl__updateShouldUpdateTimelineValuesAccordingToSource__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[456] = 0;

}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[557] = 1;
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setEmphasized:", *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_2(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    WeakRetained[557] = 0;
    v5 = WeakRetained;
    -[AVMediaTimelineControl _updateConfiguration](WeakRetained);
    v4 = (void *)v5[54];
    v5[54] = 0;

    WeakRetained = v5;
  }

}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMediaTimelineControl _updateConfiguration](WeakRetained);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "timelineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmphasized:", *(unsigned __int8 *)(a1 + 40));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "timelineView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[AVMediaTimelineControl _updateConfiguration](WeakRetained);
    v2 = (void *)v3[54];
    v3[54] = 0;

    WeakRetained = v3;
  }

}

- (void)_updateConfiguration
{
  void *v1;
  void *v2;
  void *v3;
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

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "labelsConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "timelineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "labelsStyle") == 2)
    {
      objc_msgSend(v4, "setLeadingTimeText:", 0);
      objc_msgSend(v4, "setTrailingTimeText:", 0);
    }
    else
    {
      objc_msgSend(v4, "setLabelPosition:", objc_msgSend(v3, "labelsStyle") != 0);
      objc_msgSend(v3, "textFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLabelsFont:", v5);

      objc_msgSend(v3, "textColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLabelsTextColor:", v6);

      objc_msgSend(v3, "textFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[AVMediaTimelineControlLabelsConfiguration _defaultFont](AVMediaTimelineControlLabelsConfiguration, "_defaultFont");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setLabelsFont:", v7);
      objc_msgSend(v3, "textColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor](AVMediaTimelineControlLabelsConfiguration, "_defaultTextColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setLabelsTextColor:", v8);
      objc_msgSend(v3, "extendedDynamicRangeGain");
      objc_msgSend(v4, "setLabelsExtendedDynamicRangeGain:");

    }
    objc_msgSend(v1, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaTimelineControl _timelineViewSlider](v1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentValueVisualEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maxValueVisualEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilledBarVisualEffect:", v11);
    objc_msgSend(v10, "setUnfilledBarVisualEffect:", v12);

    objc_msgSend(v1, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "timelineView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extendedDynamicRangeGain");
    objc_msgSend(v14, "setSliderExtendedDynamicRangeGain:");

    return (void *)objc_msgSend(v1, "_updateDisplayLinkRefreshRateIfNeeded");
  }
  return result;
}

- (void)_updateVariableScrubbingOffSetScalarIfNeeded
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  id v14;

  if (a1)
  {
    objc_msgSend(a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v14 = v2;
      -[AVMediaTimelineControl _timelineViewSlider](a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      v5 = v4 * 0.5;
      objc_msgSend(v3, "frame");
      objc_msgSend(a1, "convertPoint:toView:", v14, v5, v6 * 0.5);
      v8 = v7;
      if (objc_msgSend(a1, "fineScrubbingStyle") == 2)
      {
        objc_msgSend(v14, "bounds");
        v8 = v9 - v8;
      }
      +[AVMobileChromelessFluidSlider variableSpeedScrubbingMultiplierForDistanceToEdge:](AVMobileChromelessFluidSlider, "variableSpeedScrubbingMultiplierForDistanceToEdge:", v8);
      v11 = v10;
      v12 = fabsf(v11 + -0.9);
      if (v11 > 0.9 || v12 < 0.00000011921)
        objc_msgSend(v3, "setVariableSpeedScrubbingOffsetMultiplier:", v10 * 0.6);

      v2 = v14;
    }

  }
}

- (void)_updateLabelsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  float v15;
  uint64_t v16;
  void *v17;
  id v18;

  if (a1)
  {
    objc_msgSend(a1, "timelineView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v18 = v2;
      objc_msgSend(a1, "configuration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "labelsConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "labelsStyle") != 2)
      {
        objc_msgSend(a1, "source");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "currentValueText");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMediaTimelineControl _timelineViewSlider](a1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isTracking");

        objc_msgSend(a1, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isLoading");

        if ((v8 & 1) != 0 || v10)
        {
          v11 = (void *)a1[58];
          if (!v11)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
            v13 = (void *)a1[58];
            a1[58] = v12;

            v11 = (void *)a1[58];
          }
          -[AVMediaTimelineControl _timelineViewSlider](a1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "value");
          objc_msgSend(v11, "stringFromSeconds:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v16;
        }
        objc_msgSend(v18, "setLeadingTimeText:", v6);
        objc_msgSend(v5, "maxValueText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTrailingTimeText:", v17);

      }
      v2 = v18;
    }

  }
}

- (void)_updateTimelineViewValuesWithForceUpdate:(uint64_t)a1
{
  int v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v22;
  BOOL v23;
  int v24;
  double v25;
  id v26;

  if (a1
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 512), *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 528), *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)
  {
    if (a2)
      *(_BYTE *)(a1 + 556) = 1;
    -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v26, "isTracking");
    v4 = *(unsigned __int8 *)(a1 + 456);
    objc_msgSend((id)a1, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLoading");
    v7 = objc_msgSend(v5, "isPlaying");
    objc_msgSend(v5, "minValue");
    v9 = v8;
    objc_msgSend(v26, "minimumValue");
    v11 = vabds_f32(v9, v10);
    objc_msgSend(v5, "maxValue");
    v13 = v12;
    objc_msgSend(v26, "maximumValue");
    v15 = vabds_f32(v13, v14);
    objc_msgSend(v5, "currentValue");
    v17 = v16;
    v18 = *(float *)(a1 + 472);
    v19 = *(float *)(a1 + 552);
    v20 = vabds_f32(v17, v18 + v19);
    if (v17 > (float)(v18 + v19) || v20 < 0.00000011921)
    {
      v23 = 0;
    }
    else
    {
      v22 = v18 - v19;
      v23 = v17 >= v22;
      if (vabds_f32(v17, v22) < 0.00000011921)
        v23 = 0;
      if (v11 >= 0.00000011921)
        v23 = 0;
      if (v15 >= 0.00000011921)
        v23 = 0;
    }
    if (v26)
      v24 = v3;
    else
      v24 = 1;
    if (v4)
      v24 = 1;
    if (((v24 | v6) & 1) == 0 && ((v7 ^ 1) & 1) == 0 && !v23)
    {
      objc_msgSend(v5, "minValue");
      if (v11 >= 0.00000011921)
      {
        objc_msgSend(v5, "minValue");
        objc_msgSend(v26, "setMinimumValue:");
      }
      objc_msgSend(v5, "maxValue");
      HIDWORD(v25) = 872415232;
      if (v15 >= 0.00000011921)
      {
        objc_msgSend(v5, "maxValue");
        objc_msgSend(v26, "setMaximumValue:");
      }
      *(float *)&v25 = v17;
      objc_msgSend(v26, "setValue:", v25);
      *(float *)(a1 + 472) = v17;
    }
    -[AVMediaTimelineControl _updateLabelsIfNeeded]((_QWORD *)a1);

  }
}

- (void)_updateFineScrubbingStyleIfNeeded
{
  id v2;

  if (a1)
  {
    -[AVMediaTimelineControl _timelineViewSlider](a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFineScrubbingStyle:", objc_msgSend(a1, "fineScrubbingStyle") & 3);

  }
}

- (double)_frameForTimeRangeMark:(uint64_t)a1
{
  id v3;
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
  double v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  float v20;
  id WeakRetained;
  float v22;
  float v23;
  id v24;
  float v25;
  float v26;
  id v27;
  float v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  BOOL v38;
  double v39;
  double v40;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "markUIProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uiProxyForTimeRangeMark:withSource:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isMasked"))
      v8 = -[AVMediaTimelineControl _maskingLayerFrame](a1);
    else
      objc_msgSend(*(id *)(a1 + 496), "frame");
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;

    objc_msgSend(v4, "startValue");
    v20 = v19;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 576));
    objc_msgSend(WeakRetained, "minValue");
    v23 = v20 - v22;
    v24 = objc_loadWeakRetained((id *)(a1 + 576));
    objc_msgSend(v24, "maxValue");
    v26 = v25;
    v27 = objc_loadWeakRetained((id *)(a1 + 576));
    objc_msgSend(v27, "minValue");
    v29 = (float)(v23 / (float)(v26 - v28));

    objc_msgSend(v4, "markUIProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeRangeMark:sizeInFrame:", v4, v12, v13, v14, v15);
    v32 = v31;

    v33 = v14 * v29;
    v34 = *(double *)(a1 + 520);
    if (v34 < 0.0)
      v33 = v33 + v34 - fabs(*(double *)(a1 + 536)) + (v14 - v18) * -0.5;
    objc_msgSend(v4, "startValue");
    v36 = v35;
    objc_msgSend(v4, "endValue");
    v38 = vabds_f32(v36, v37) < 0.00000011921;
    v39 = 0.0;
    if (v38)
      v39 = v32 * 0.5;
    v40 = v33 - v39;

  }
  else
  {
    v40 = 0.0;
  }

  return v40;
}

- (double)_maskingLayerFrame
{
  void *v2;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 432), "isRunning");
  -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");

  return *(double *)(a1 + 520);
}

void __59__AVMediaTimelineControl__updateSliderPulsingStateIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSliderPulsingStateIfNeeded");

}

- (void)_updateSliderTintStateToState:(void *)a3 duration:(double)a4 completionHandler:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v7 = a3;
  if (a1)
  {
    -[AVMediaTimelineControl _timelineViewSlider](a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = a1[55];
      if (v9 && objc_msgSend(v9, "isRunning") && objc_msgSend(a1[55], "isInterruptible"))
      {
        objc_msgSend(a1[55], "stopAnimation:", 1);
        objc_msgSend(a1[55], "finishAnimationAtPosition:", 2);
        v10 = a1[55];
        a1[55] = 0;

      }
      v11 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v12 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke;
      v20[3] = &unk_1E5BB4660;
      v21 = v8;
      v22 = a2;
      v13 = objc_msgSend(v11, "initWithDuration:curve:animations:", 3, v20, a4);
      v14 = a1[55];
      a1[55] = (id)v13;

      if (v7)
      {
        objc_initWeak(&location, a1);
        v15 = a1[55];
        v16[0] = v12;
        v16[1] = 3221225472;
        v16[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_2;
        v16[3] = &unk_1E5BB2C88;
        objc_copyWeak(&v18, &location);
        v17 = v7;
        objc_msgSend(v15, "addCompletion:", v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      objc_msgSend(a1[55], "startAnimation");

    }
  }

}

uint64_t __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTintState:", *(_QWORD *)(a1 + 40));
}

void __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_3;
  v2[3] = &unk_1E5BB44A0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v2 = (void *)WeakRetained[55];
    WeakRetained[55] = 0;

  }
}

- (void)_invalidateDisplayLink
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 416), "invalidate");
    v2 = *(void **)(a1 + 416);
    *(_QWORD *)(a1 + 416) = 0;

  }
}

void __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:](a2, 1);
}

uint64_t __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTimeRangeMarksIfNeeded");
}

void __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateDisplayLinkPausedStateIfNeeded");
  objc_msgSend(v2, "_updateSliderPulsingStateIfNeeded");

}

@end
