@implementation CAMZoomControl

- (CAMZoomControl)initWithLayoutStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CAMZoomControl *v8;
  void *v9;
  uint64_t v10;
  UIView *dialClippingView;
  CAMZoomButtonPlatter *v12;
  CAMZoomButtonPlatter *buttonPlatter;
  uint64_t v14;
  CAMZoomDial *v15;
  CAMZoomDial *zoomDial;
  CAMZoomButton *v17;
  CAMZoomButton *zoomButton;
  CAMZoomControlButtonMaskView *v19;
  CAMZoomControlButtonMaskView *buttonMaskView;
  CAMFeedbackController *v21;
  CAMFeedbackController *feedbackController;
  CAMZoomControl *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CAMZoomControl;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[CAMZoomControl initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  if (v8)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_layoutStyle = a3;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
    dialClippingView = v8->__dialClippingView;
    v8->__dialClippingView = (UIView *)v10;

    -[UIView setClipsToBounds:](v8->__dialClippingView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v8->__dialClippingView, "setUserInteractionEnabled:", 0);
    -[CAMZoomControl addSubview:](v8, "addSubview:", v8->__dialClippingView);
    if (objc_msgSend(v9, "isZoomPlatterSupported"))
    {
      v12 = objc_alloc_init(CAMZoomButtonPlatter);
      buttonPlatter = v8->__buttonPlatter;
      v8->__buttonPlatter = v12;

      -[CAMZoomButtonPlatter setUserInteractionEnabled:](v8->__buttonPlatter, "setUserInteractionEnabled:", 0);
      -[CAMZoomControl addSubview:](v8, "addSubview:", v8->__buttonPlatter);
    }
    v14 = objc_msgSend(v9, "zoomDialStyle");
    v15 = -[CAMZoomDial initWithStyle:]([CAMZoomDial alloc], "initWithStyle:", v14);
    zoomDial = v8->__zoomDial;
    v8->__zoomDial = v15;

    -[UIView addSubview:](v8->__dialClippingView, "addSubview:", v8->__zoomDial);
    v17 = -[CAMZoomButton initWithFrame:]([CAMZoomButton alloc], "initWithFrame:", v4, v5, v6, v7);
    zoomButton = v8->__zoomButton;
    v8->__zoomButton = v17;

    -[CAMZoomButton setDelegate:](v8->__zoomButton, "setDelegate:", v8);
    -[CAMZoomControl _updateZoomButtonTappableEdgeInsets](v8, "_updateZoomButtonTappableEdgeInsets");
    -[CAMZoomButton setUserInteractionEnabled:](v8->__zoomButton, "setUserInteractionEnabled:", 0);
    -[CAMZoomControl addSubview:](v8, "addSubview:", v8->__zoomButton);
    v8->__shouldShowZoomDial = 0;
    -[CAMZoomDial setExpanded:](v8->__zoomDial, "setExpanded:", 0);
    -[CAMZoomControl _updateSubviewsAlphasWithDuration:forConfigurationChange:](v8, "_updateSubviewsAlphasWithDuration:forConfigurationChange:", 0, 0.0);
    if (-[CAMZoomControl _shouldUseZoomDialMask](v8, "_shouldUseZoomDialMask"))
    {
      v19 = -[CAMZoomControlButtonMaskView initWithFrame:]([CAMZoomControlButtonMaskView alloc], "initWithFrame:", v4, v5, v6, v7);
      buttonMaskView = v8->__buttonMaskView;
      v8->__buttonMaskView = v19;

      -[CAMZoomDial setMaskView:](v8->__zoomDial, "setMaskView:", v8->__buttonMaskView);
    }
    -[CAMZoomControl configureForToggleOnlyWithZoomFactor:displayZoomFactor:](v8, "configureForToggleOnlyWithZoomFactor:displayZoomFactor:", 1.0, 1.0);
    if (v14 == 1)
    {
      v21 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v8->__feedbackController;
      v8->__feedbackController = v21;

    }
    v23 = v8;

  }
  return v8;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $5FA8A7BFF4EE9DF8B2B7603EA44865F5 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToDidChangeZoomFactor = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanToggleBetweenZoomFactors = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToToggleBetweenZoomFactors = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanPlayHaptics = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeShowingZoomDial = objc_opt_respondsToSelector() & 1;
  }

}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomFactors:(id)a5 displayZoomFactors:(id)a6 zoomButtonContentType:(int64_t)a7 animated:(BOOL)a8
{
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v14 = a6;
  v15 = a5;
  +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v15, v14, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  BYTE1(v16) = a8;
  LOBYTE(v16) = 0;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", a3, v17, v15, v14, 0, a7, a4, v16);

}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomButtonContentType:(int64_t)a6 animated:(BOOL)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v12 = a5;
  +[CAMZoomPoint zoomFactorsFromZoomPoints:](CAMZoomPoint, "zoomFactorsFromZoomPoints:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[CAMZoomPoint displayZoomFactorsFromZoomPoints:](CAMZoomPoint, "displayZoomFactorsFromZoomPoints:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v14) = a7;
  LOBYTE(v14) = 0;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", a3, v12, v15, v13, 0, a6, a4, v14);

}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomFactors:(id)a6 displayZoomFactors:(id)a7 createButtonForMaxZoomFactor:(BOOL)a8 zoomButtonContentType:(int64_t)a9 compactPlatterLayout:(BOOL)a10 animated:(BOOL)a11
{
  _BOOL8 v12;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  void *v31;

  v12 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  -[CAMZoomControl zoomFactor](self, "zoomFactor");
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
  v22 = v21;
  v23 = -[CAMZoomControl _shouldShowButtonPlatter](self, "_shouldShowButtonPlatter");
  -[CAMZoomControl _setZoomControlMode:](self, "_setZoomControlMode:", a3);
  -[CAMZoomControl _setZoomPoints:](self, "_setZoomPoints:", v20);

  -[CAMZoomControl _setZoomFactors:](self, "_setZoomFactors:", v19);
  -[CAMZoomControl _setDisplayZoomFactors:](self, "_setDisplayZoomFactors:", v18);

  -[CAMZoomControl _setCreateButtonForMaxZoomFactor:](self, "_setCreateButtonForMaxZoomFactor:", v12);
  -[CAMZoomControl _updateDisplayZoomFactorsAnimated:](self, "_updateDisplayZoomFactorsAnimated:", a11);
  objc_msgSend(v19, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  -[CAMZoomControl setMinAvailableZoomFactor:](self, "setMinAvailableZoomFactor:");

  objc_msgSend(v19, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "doubleValue");
  -[CAMZoomControl setMaxAvailableZoomFactor:](self, "setMaxAvailableZoomFactor:");

  -[CAMZoomControl setZoomFactor:](self, "setZoomFactor:", a4);
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:", a4);
  v27 = v26;
  -[CAMZoomControl setPlatterLayoutCompact:animated:](self, "setPlatterLayoutCompact:animated:", a10, a11);
  -[CAMZoomControl _updateZoomDialEnablement](self, "_updateZoomDialEnablement");
  -[CAMZoomControl _snappedZoomFactor](self, "_snappedZoomFactor");
  if (v28 > 0.0)
  {
    if (v27 == v22)
      -[CAMZoomControl _setSnappedZoomFactor:](self, "_setSnappedZoomFactor:", a4);
    else
      -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
  }
  v29 = -[CAMZoomControl _shouldShowButtonPlatter](self, "_shouldShowButtonPlatter");
  v30 = 0.25;
  if (!(a11 | v23 ^ v29))
    v30 = 0.0;
  -[CAMZoomControl _updateSubviewsAlphasWithDuration:forConfigurationChange:](self, "_updateSubviewsAlphasWithDuration:forConfigurationChange:", 1, v30);
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setContentType:animated:", a9, a11);

  -[CAMZoomControl _updateDisplayedValuesAllowingFlashingSubstate:animated:](self, "_updateDisplayedValuesAllowingFlashingSubstate:animated:", 0, 0);
}

- (BOOL)configureForContinuousZoomWithZoomFactor:(double)a3 zoomPoints:(id)a4 createButtonForMaxZoomFactor:(BOOL)a5 compactPlatterLayout:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;

  v9 = a5;
  v12 = a4;
  +[CAMZoomPoint zoomFactorsFromZoomPoints:](CAMZoomPoint, "zoomFactorsFromZoomPoints:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomPoint displayZoomFactorsFromZoomPoints:](CAMZoomPoint, "displayZoomFactorsFromZoomPoints:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "count");
  if (v15 < 2)
  {
    v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CAMZoomControl configureForContinuousZoomWithZoomFactor:zoomPoints:createButtonForMaxZoomFactor:compactPlatterLayout:animated:].cold.1(v12, v19);

  }
  else
  {
    +[CAMZoomPoint significantIndexesInZoomPoints:](CAMZoomPoint, "significantIndexesInZoomPoints:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v16, "count") > 2 || v9)
      v18 = 0;
    else
      v18 = 2;
    BYTE1(v21) = a7;
    LOBYTE(v21) = a6;
    -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", v18, v12, v13, v14, v9, 0, a3, v21);

  }
  return v15 > 1;
}

- (void)configureForTripleDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 switchOverZoomFactor1:(double)a8 displaySwitchOverZoomFactor1:(double)a9 switchOverZoomFactor2:(double)a10 displaySwitchOverZoomFactor2:(double)a11
{
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
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:](self, "_configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:", 0, v23, v28, 0, 0, a3);
}

- (void)configureForDualDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 dualCameraSwitchOverZoomFactor:(double)a8 displayDualCameraSwitchOverZoomFactor:(double)a9
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:](self, "_configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:", 0, v19, v23, 0, 0, a3);
}

- (void)configureForSingleCameraPlusToggleWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:](self, "_configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:", 2, v14, v17, 0, 0, a3);
}

- (void)configureForToggleOnlyWithZoomFactor:(double)a3 displayZoomFactor:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:](self, "_configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:", 3, v8, v10, 0, 0, a3);
}

- (void)configureForSelectionOnlyWithDisplayZoomFactors:(id)a3 selectedIndex:(unint64_t)a4 compactPlatterLayout:(BOOL)a5 animated:(BOOL)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;

  v10 = a3;
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v10, v10, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  BYTE1(v14) = a6;
  LOBYTE(v14) = a5;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", 1, v15, v10, v10, 0, 0, v13, v14);

}

- (void)configureForZoomSymbolToggle
{
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:](self, "_configureForControlMode:zoomFactor:zoomFactors:displayZoomFactors:zoomButtonContentType:animated:", 4, &unk_1EA3B2F18, &unk_1EA3B2F30, 1, 0, 1.0);
}

- (BOOL)allowsContinuousZoom
{
  return (-[CAMZoomControl _zoomControlMode](self, "_zoomControlMode") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (double)minimumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)maximumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)_displayMinimumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)_displayMaximumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (NSArray)_switchOverZoomFactors
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 3)
  {
    v7 = 0;
  }
  else
  {
    -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v7;
}

- (BOOL)_shouldSnapDialToSwitchOverZoomFactors
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CAMZoomControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CAMZoomControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "zoomControlShouldSnapDialToSwitchOverZoomFactors:", self);

  return v6;
}

- (void)_updateDisplayZoomFactorsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  -[CAMZoomControl _zoomPoints](self, "_zoomPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setZoomPoints:", v5);

  -[CAMZoomControl _updateSignificantValuesForHaptics](self, "_updateSignificantValuesForHaptics");
  +[CAMZoomPoint significantIndexesInZoomPoints:](CAMZoomPoint, "significantIndexesInZoomPoints:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMZoomControl _numberOfZoomPlatterButtonsForZoomFactorCount:](self, "_numberOfZoomPlatterButtonsForZoomFactorCount:", objc_msgSend(v7, "count"));
  if (v8 >= 1)
  {
    v9 = v8;
    if (v3)
      -[CAMZoomControl layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(v5, "objectsAtIndexes:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZoomPoints:animated:", v11, v3);

    if (v3)
    {
      -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__CAMZoomControl__updateDisplayZoomFactorsAnimated___block_invoke;
      v13[3] = &unk_1EA328868;
      v13[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v13, 0.3);
    }

  }
}

uint64_t __52__CAMZoomControl__updateDisplayZoomFactorsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateDisplayedValuesAllowingFlashingSubstate:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
  v8 = v7;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZoomFactor:", v8);

  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZoomFactor:", v8);

  if (-[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration"))
  {
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setZoomFactor:allowFlashingSubstate:animated:", v5, v4, v8);

  }
}

- (double)displayZoomValue
{
  double result;

  -[CAMZoomControl zoomFactor](self, "zoomFactor");
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
  return result;
}

- (double)_displayZoomValueForZoomFactor:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", v5, v6, a3);
  v8 = v7;

  return v8;
}

- (double)_zoomFactorForDisplayZoomValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", v5, v6, a3);
  v8 = v7;

  return v8;
}

- (void)setZoomFactor:(double)a3
{
  -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 0, a3);
}

- (void)_setZoomFactor:(double)a3 interactionType:(int64_t)a4 shouldNotifyDelegate:(BOOL)a5
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
  uint64_t v18;
  id WeakRetained;
  id v20;

  v5 = a5;
  -[CAMZoomControl minimumZoomFactor](self, "minimumZoomFactor");
  v10 = v9;
  -[CAMZoomControl minAvailableZoomFactor](self, "minAvailableZoomFactor");
  v12 = fmax(v10, v11);
  -[CAMZoomControl maximumZoomFactor](self, "maximumZoomFactor");
  v14 = v13;
  -[CAMZoomControl maxAvailableZoomFactor](self, "maxAvailableZoomFactor");
  v16 = fmin(v14, v15);
  if (v16 >= a3)
    v16 = a3;
  if (v12 <= a3)
    v17 = v16;
  else
    v17 = v12;
  if (self->_zoomFactor != v17)
  {
    self->_zoomFactor = v17;
    -[CAMZoomControl _updateDisplayedValuesAllowingFlashingSubstate:animated:](self, "_updateDisplayedValuesAllowingFlashingSubstate:animated:", a4 == 1, 1);
    v18 = 0;
    if (!a4 && v5)
    {
      if (self->_delegateFlags.respondsToCanPlayHaptics)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = objc_msgSend(WeakRetained, "zoomControlCanPlayHaptics:", self);

      }
      else
      {
        v18 = 0;
      }
    }
    -[CAMZoomControl _updateHaptics:](self, "_updateHaptics:", v18);
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
    if (v5 && self->_delegateFlags.respondsToDidChangeZoomFactor)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "zoomControl:didChangeZoomFactor:interactionType:", self, a4, v17);

    }
  }
}

- (void)setMinAvailableZoomFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  -[CAMZoomControl minimumZoomFactor](self, "minimumZoomFactor");
  v6 = fmax(a3, v5);
  self->_minAvailableZoomFactor = v6;
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:", v6);
  v8 = v7;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinAvailableZoomFactor:", v8);

  -[CAMZoomControl minimumZoomFactor](self, "minimumZoomFactor");
  if (v6 != v10)
  {
    -[CAMZoomControl zoomFactor](self, "zoomFactor");
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);
  }
}

- (void)setMaxAvailableZoomFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  -[CAMZoomControl maximumZoomFactor](self, "maximumZoomFactor");
  v6 = fmin(a3, v5);
  self->_maxAvailableZoomFactor = v6;
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:", v6);
  v8 = v7;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaxAvailableZoomFactor:", v8);

  -[CAMZoomControl maximumZoomFactor](self, "maximumZoomFactor");
  if (v6 != v10)
  {
    -[CAMZoomControl zoomFactor](self, "zoomFactor");
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);
  }
}

- (int64_t)zoomButtonContentType
{
  void *v2;
  int64_t v3;

  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentType");

  return v3;
}

- (int64_t)zoomButtonSymbol
{
  void *v2;
  int64_t v3;

  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "zoomSymbol");

  return v3;
}

- (void)setZoomButtonSymbol:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setZoomSymbol:animated:", a3, v4);

}

- (void)setZoomButtonAccessoryState:(int64_t)a3
{
  -[CAMZoomControl setZoomButtonAccessoryState:animated:](self, "setZoomButtonAccessoryState:animated:", a3, 0);
}

- (void)setZoomButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_zoomButtonAccessoryState != a3)
  {
    self->_zoomButtonAccessoryState = a3;
    -[CAMZoomControl _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", a4);
  }
}

- (void)_updateButtonAccessoryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  _BOOL4 v6;
  int64_t v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = -[CAMZoomControl zoomButtonAccessoryState](self, "zoomButtonAccessoryState");
  v6 = -[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration");
  if (v6)
    v7 = 0;
  else
    v7 = v5;
  if (!v6)
    v5 = 0;
  -[CAMZoomControl edgeMargin](self, "edgeMargin");
  v9 = v8 < 0.0;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessoryState:animated:", v7, v3);

  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setButtonAccessoryState:animated:", v5, v3);

  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessoryPosition:animated:", v9, v3);

  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setButtonAccessoryPosition:animated:", v9, v3);

}

- (id)_accessorizedZoomButton
{
  void *v3;
  void *v4;

  if (-[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration"))
  {
    if (-[CAMZoomControl isPlatterExpanded](self, "isPlatterExpanded"))
    {
      v3 = 0;
    }
    else
    {
      -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "zoomFactorButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[CAMZoomControl _zoomButton](self, "_zoomButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_isTouchWithinZoomButtonAccessory:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  return -[CAMZoomControl _isPointWithinZoomButtonAccessory:](self, "_isPointWithinZoomButtonAccessory:");
}

- (BOOL)_isPointWithinZoomButtonAccessory:(CGPoint)a3
{
  double y;
  double x;
  int64_t v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v6 = -[CAMZoomControl zoomButtonAccessoryState](self, "zoomButtonAccessoryState");
  if (v6)
  {
    -[CAMZoomControl _accessorizedZoomButton](self, "_accessorizedZoomButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tappableEdgeInsets");
    objc_msgSend(v7, "accessoryFrame");
    v8 = v21.origin.x;
    v9 = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    if (!CGRectIsEmpty(v21))
    {
      UIRectInset();
      v8 = v12;
      v9 = v13;
      width = v14;
      height = v15;
    }
    -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    v20.x = v16;
    v20.y = v17;
    v22.origin.x = v8;
    v22.origin.y = v9;
    v22.size.width = width;
    v22.size.height = height;
    v18 = CGRectContainsPoint(v22, v20);

    LOBYTE(v6) = v18;
  }
  return v6;
}

- (void)setEdgeMargin:(double)a3
{
  -[CAMZoomControl setEdgeMargin:animated:](self, "setEdgeMargin:animated:", 0, a3);
}

- (void)setEdgeMargin:(double)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_edgeMargin != a3)
  {
    if (a4)
    {
      -[CAMZoomControl layoutIfNeeded](self, "layoutIfNeeded");
      self->_edgeMargin = a3;
      -[CAMZoomControl _updateZoomButtonTappableEdgeInsets](self, "_updateZoomButtonTappableEdgeInsets");
      -[CAMZoomControl _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 1);
      -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomControl_setEdgeMargin_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.25, 0.0);
    }
    else
    {
      self->_edgeMargin = a3;
      -[CAMZoomControl _updateZoomButtonTappableEdgeInsets](self, "_updateZoomButtonTappableEdgeInsets");
      -[CAMZoomControl _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 0);
      -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __41__CAMZoomControl_setEdgeMargin_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setZoomDialRadius:(double)a3
{
  if (self->_zoomDialRadius != a3)
  {
    self->_zoomDialRadius = a3;
    -[CAMZoomControl _updateHapticEpsilons](self, "_updateHapticEpsilons");
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)zoomDialContentMaskingHeight
{
  void *v2;
  double v3;
  double v4;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMaskingHeight");
  v4 = v3;

  return v4;
}

- (void)setZoomDialContentMaskingHeight:(double)a3
{
  id v4;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMaskingHeight:", a3);

}

- (double)zoomDialBorderWidth
{
  void *v2;
  double v3;
  double v4;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dialBorderWidth");
  v4 = v3;

  return v4;
}

- (void)setZoomButtonMaxYWhenContracted:(double)a3
{
  if (self->_zoomButtonMaxYWhenContracted != a3)
  {
    self->_zoomButtonMaxYWhenContracted = a3;
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateZoomButtonTappableEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[CAMZoomControl edgeMargin](self, "edgeMargin");
  if (v3 <= 0.0)
  {
    -[CAMZoomControl edgeMargin](self, "edgeMargin");
    if (v6 >= 0.0)
      v5 = 11.0;
    else
      v5 = 24.0;
    if (v6 >= 0.0)
      v4 = 11.0;
    else
      v4 = 16.0;
  }
  else
  {
    v4 = 24.0;
    v5 = 16.0;
  }
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTappableEdgeInsets:", 11.0, v5, 4.0, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)_shouldUseZoomDialMask
{
  void *v2;
  uint64_t v3;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3 != 1;
}

- (void)setHideFocalLengthLabels:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHideFocalLengthLabels:", v3);

  }
}

- (BOOL)hideFocalLengthLabels
{
  void *v3;
  void *v4;
  char v5;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hideFocalLengthLabels");

  return v5;
}

- (void)_setZoomDialEnabled:(BOOL)a3
{
  -[CAMZoomControl _setZoomDialEnabled:animationDuration:](self, "_setZoomDialEnabled:animationDuration:", a3, 0);
}

- (void)_setZoomDialEnabled:(BOOL)a3 animationDuration:(int64_t)a4
{
  if (self->__zoomDialEnabled != a3)
  {
    self->__zoomDialEnabled = a3;
    if (!a3)
      -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", 0, a4);
  }
}

- (void)_setShouldShowZoomDial:(BOOL)a3
{
  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", a3, 0);
}

- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4
{
  _BOOL8 v5;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  BOOL v29;
  _QWORD v30[4];
  id v31;
  CAMZoomControl *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  BOOL v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  -[CAMZoomControl _cancelDelayedZoomDialVisibilityChange](self, "_cancelDelayedZoomDialVisibilityChange");
  if (self->__shouldShowZoomDial != v5)
  {
    -[CAMZoomControl _setStartTimeForHideAnimationInProgress:](self, "_setStartTimeForHideAnimationInProgress:", 0);
    v7 = 0.0;
    if ((unint64_t)(a4 - 1) <= 2)
      v7 = dbl_1DB9A4EB8[a4 - 1];
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 > 0.0)
    {
      -[CAMZoomControl layoutIfNeeded](self, "layoutIfNeeded");
      objc_msgSend(v8, "layoutIfNeeded");
    }
    self->__shouldShowZoomDial = v5;
    objc_msgSend(v8, "setExpanded:", v5);
    if (v5)
    {
      v9 = 0.23;
      v10 = 0.4;
    }
    else
    {
      -[CAMZoomControl _setEligibleForZoomFactorLabelTaps:](self, "_setEligibleForZoomFactorLabelTaps:", 0);
      v9 = 0.18;
      v10 = 0.7;
    }
    if (v7 > 0.0)
    {
      v11 = v10;
    }
    else
    {
      v9 = 0.0;
      v11 = 0.0;
    }
    v12 = 1.0;
    if (v7 != 0.0)
      v12 = v7;
    v13 = v9 / v12;
    v14 = objc_msgSend(v8, "style");
    v15 = MEMORY[0x1E0C809B0];
    if (v14 == 1)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke;
      v37[3] = &unk_1EA328908;
      v37[4] = self;
      v38 = v5;
      +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v37, v13);
    }
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
    -[CAMZoomControl _updateSubviewsAlphasWithDuration:forConfigurationChange:](self, "_updateSubviewsAlphasWithDuration:forConfigurationChange:", 0, v13);
    if (v7 > 0.0)
    {
      -[CAMZoomControl _zoomDial](self, "_zoomDial");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v16, "subviews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            -[CAMZoomControl removeAnimationFromView:forKeys:](self, "removeAnimationFromView:forKeys:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), &unk_1EA3B2F48);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v19);
      }

      -[CAMZoomControl removeAnimationFromView:forKeys:](self, "removeAnimationFromView:forKeys:", v16, &unk_1EA3B2F60);
      -[CAMZoomControl _zoomButton](self, "_zoomButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMZoomControl removeAnimationFromView:forKeys:](self, "removeAnimationFromView:forKeys:", v22, &unk_1EA3B2F78);

      -[CAMZoomControl _buttonMaskView](self, "_buttonMaskView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMZoomControl removeAnimationFromView:forKeys:](self, "removeAnimationFromView:forKeys:", v23, &unk_1EA3B2F90);

      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMZoomControl _setStartTimeForHideAnimationInProgress:](self, "_setStartTimeForHideAnimationInProgress:", v24);

        -[CAMZoomControl _setHideAnimationInProgressDuration:](self, "_setHideAnimationInProgressDuration:", v11);
      }
      v25 = (void *)MEMORY[0x1E0DC3F10];
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_2;
      v30[3] = &unk_1EA328A40;
      v31 = v16;
      v32 = self;
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_3;
      v28[3] = &unk_1EA329A78;
      v29 = v5;
      v28[4] = self;
      v26 = v16;
      objc_msgSend(v25, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v30, v28, v11, 0.0, 0.758, 0.0);

    }
    if (v5)
      -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", 0);
    else
      -[CAMZoomControl _setEligibleForSwipeDownToDismiss:](self, "_setEligibleForSwipeDownToDismiss:", 0);
    if (self->_delegateFlags.respondsToDidChangeShowingZoomDial)
    {
      -[CAMZoomControl delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "zoomControlDidChangeShowingZoomDial:", self);

    }
  }
}

void __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_zoomButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

uint64_t __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_setStartTimeForHideAnimationInProgress:", 0);
  return result;
}

- (void)_updateSubviewsAlphasWithDuration:(double)a3 forConfigurationChange:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  _QWORD v16[6];
  BOOL v17;
  BOOL v18;
  _QWORD v19[6];
  BOOL v20;
  BOOL v21;
  _QWORD v22[6];
  BOOL v23;
  BOOL v24;

  v4 = a4;
  v7 = -[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial");
  v8 = -[CAMZoomControl _shouldShowButtonPlatter](self, "_shouldShowButtonPlatter");
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alpha");
  v11 = v10;

  if (v8)
    v12 = 0.0;
  else
    v12 = 1.0;
  if (v4)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke;
    v22[3] = &unk_1EA329AA0;
    v22[4] = self;
    v23 = v7;
    v24 = v8;
    *(double *)&v22[5] = v12;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v22, a3);
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_2;
    v19[3] = &unk_1EA329AA0;
    v19[4] = self;
    v20 = v7;
    v21 = v8;
    *(double *)&v19[5] = v12;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v19, a3);
    v16[0] = v13;
    if (v7)
      v14 = 0.0;
    else
      v14 = 2.0;
    v16[1] = 3221225472;
    v16[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_3;
    v16[3] = &unk_1EA329AA0;
    v17 = v8;
    v16[4] = self;
    *(double *)&v16[5] = v12;
    v18 = !v7;
    +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v16, 0, a3, 1.0, v14);
  }
  if (v12 != 0.0)
  {
    if (v12 != v11)
      a3 = 0.0;
    -[CAMZoomControl _zoomButton](self, "_zoomButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldHideBackground:animationDuration:", -[CAMZoomControl _shouldHideZoomButtonBackground](self, "_shouldHideZoomButtonBackground"), a3);

  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_zoomDial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_buttonPlatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*(_BYTE *)(a1 + 49))
      v5 = 1.0;
    else
      v5 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "_buttonPlatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

    v7 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_zoomButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);

  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_zoomDial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_buttonPlatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*(_BYTE *)(a1 + 49))
      v5 = 1.0;
    else
      v5 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "_buttonPlatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

    if (!*(_BYTE *)(a1 + 49))
    {
      v7 = *(double *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_zoomButton");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", v7);

    }
  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_3(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_zoomButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", v2);

  }
  v4 = *(unsigned __int8 *)(a1 + 49);
  objc_msgSend(*(id *)(a1 + 32), "_zoomDial");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHideLabels:", v4);

}

- (BOOL)_shouldHideZoomButtonBackground
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  v5 = v4 == 1 && -[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial");
  return -[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration")
      || v5;
}

- (void)setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (-[CAMZoomControl _isZoomDialEnabled](self, "_isZoomDialEnabled"))
    -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", v5, a4, 0.0);
}

- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4 afterDelay:(double)a5
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  NSTimer *v12;
  NSTimer *zoomDialVisibilityTimer;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v7 = a3;
  v16[2] = *MEMORY[0x1E0C80C00];
  -[CAMZoomControl _cancelDelayedZoomDialVisibilityChange](self, "_cancelDelayedZoomDialVisibilityChange");
  if (a5 <= 0.0)
  {
    -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", v7, a4);
  }
  else
  {
    v15[0] = CAMZoomControlShouldShowZoomDialKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CAMZoomControlAnimationDurationKey;
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleZoomDialVisibilityTimerFiredWithUserInfo_, v11, 0, a5);
    v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
    self->__zoomDialVisibilityTimer = v12;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTimer:forMode:", self->__zoomDialVisibilityTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)_handleZoomDialVisibilityTimerFiredWithUserInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSTimer *zoomDialVisibilityTimer;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CAMZoomControlShouldShowZoomDialKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CAMZoomControlAnimationDurationKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", v5, v7);
  zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
  self->__zoomDialVisibilityTimer = 0;

}

- (void)_cancelDelayedZoomDialVisibilityChange
{
  NSTimer *zoomDialVisibilityTimer;
  NSTimer *v4;

  zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
  if (zoomDialVisibilityTimer)
  {
    -[NSTimer invalidate](zoomDialVisibilityTimer, "invalidate");
    v4 = self->__zoomDialVisibilityTimer;
    self->__zoomDialVisibilityTimer = 0;

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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CAMZoomControl;
  -[CAMZoomControl layoutSubviews](&v41, sel_layoutSubviews);
  -[CAMZoomControl bounds](self, "bounds");
  -[CAMZoomControl alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _dialClippingView](self, "_dialClippingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intrinsicContentSize");
  v15 = v14;
  v17 = v16;
  -[CAMZoomControl zoomButtonMaxYWhenContracted](self, "zoomButtonMaxYWhenContracted");
  -[CAMZoomControl zoomDialRadius](self, "zoomDialRadius");
  v19 = v18;
  objc_msgSend(v13, "setFrame:", v4, v6 + -40.0, v8, v10 + 40.0);
  v20 = v19 + v19;
  objc_msgSend(v12, "setCenter:", v8 * 0.5, v19 + 40.0);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v19 + v19, v19 + v19);
  objc_msgSend(v12, "zoomFactor");
  v22 = v21;
  objc_msgSend(v12, "textCenterForZoomFactor:assumeExpanded:", 1);
  v38 = v23;
  v25 = v24;
  v39 = v17 * 0.5;
  v40 = v17;
  UIRoundToViewScale();
  objc_msgSend(v12, "setContractionDistance:");
  -[CAMZoomControl edgeMargin](self, "edgeMargin");
  objc_msgSend(v12, "textCenterForZoomFactor:assumeExpanded:", 0, v22);
  v36 = v26;
  v37 = v27;
  objc_msgSend(v12, "convertPoint:toView:", self);
  UIRoundToViewScale();
  v29 = v28;
  UIRoundToViewScale();
  objc_msgSend(v11, "frameForAlignmentRect:", v29 - v15 * 0.5, v30 - v39, v15, v40);
  UIRectIntegralWithScale();
  objc_msgSend(v11, "setFrame:");
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v33 = (double *)MEMORY[0x1E0C9D648];
  if (v31)
  {
    objc_msgSend(v31, "intrinsicContentSize");
    objc_msgSend(v12, "convertPoint:toView:", self, v38, v25);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "isQuadraWideSupported");

    UIRectCenteredAboutPointScale();
    objc_msgSend(v32, "setFrame:");
  }
  if (-[CAMZoomControl _shouldUseZoomDialMask](self, "_shouldUseZoomDialMask"))
  {
    -[CAMZoomControl _buttonMaskView](self, "_buttonMaskView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBounds:", *v33, v33[1], v20, v20 + 40.0);
    objc_msgSend(v35, "setCenter:", v20 * 0.5 + v36 - v38, (v20 + -40.0) * 0.5 + v37 - v25);
    objc_msgSend(v35, "setMaskOvalFrame:", v38 - v15 * 0.5, v25 - v39 + 40.0, v15, v40);
    -[CAMZoomControl _updateMaskViewForZoomButtonHighlightingTransform](self, "_updateMaskViewForZoomButtonHighlightingTransform");

  }
}

- (void)_updateMaskViewForZoomButtonHighlightingTransform
{
  void *v3;
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
  CGFloat v17;
  CGFloat v18;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform v21;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  if (-[CAMZoomControl _shouldUseZoomDialMask](self, "_shouldUseZoomDialMask"))
  {
    -[CAMZoomControl _buttonMaskView](self, "_buttonMaskView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControl _zoomButton](self, "_zoomButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "maskOvalFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "bounds");
    UIRectGetCenter();
    v14 = v13;
    v16 = v15;
    memset(&v24, 0, sizeof(v24));
    if (v4)
      objc_msgSend(v4, "highlightingTransform");
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    v17 = CGRectGetMidX(v25) - v14;
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    v18 = CGRectGetMidY(v26) - v16;
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeTranslation(&t1, -v17, -v18);
    CGAffineTransformMakeTranslation(&t2, v17, v18);
    v19 = v24;
    CGAffineTransformConcat(&v21, &v19, &t2);
    CGAffineTransformConcat(&v23, &t1, &v21);
    v19 = v23;
    objc_msgSend(v3, "setTransform:", &v19);

  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMZoomControl setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControl _zoomButton](self, "_zoomButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrientation:animated:", a3, v4);
    objc_msgSend(v7, "setOrientation:animated:", a3, v4);
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrientation:animated:", a3, v4);

  }
}

- (double)_distanceFromDialClippingViewToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat MaxY;
  double v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  -[CAMZoomControl _dialClippingView](self, "_dialClippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v16 = v15;
  v18 = v17;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  if (v16 >= CGRectGetMinX(v24))
  {
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    v19 = 0.0;
    if (v16 > CGRectGetMaxX(v26))
    {
      v27.origin.x = v8;
      v27.origin.y = v10;
      v27.size.width = v12;
      v27.size.height = v14;
      v19 = v16 - CGRectGetMaxX(v27);
    }
  }
  else
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = v14;
    v19 = CGRectGetMinX(v25) - v16;
  }
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  if (v18 >= CGRectGetMinY(v28))
  {
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    MaxY = CGRectGetMaxY(v30);
    v20 = 0.0;
    if (v18 > MaxY)
    {
      v31.origin.x = v8;
      v31.origin.y = v10;
      v31.size.width = v12;
      v31.size.height = v14;
      v20 = v18 - CGRectGetMaxY(v31);
    }
  }
  else
  {
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    v20 = CGRectGetMinY(v29) - v18;
  }
  v22 = sqrt(v20 * v20 + v19 * v19);

  return v22;
}

- (double)_dampingFactorForDistanceFromDialForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;

  -[CAMZoomControl _distanceFromDialClippingViewToPoint:](self, "_distanceFromDialClippingViewToPoint:", a3.x, a3.y);
  v4 = 1.0;
  if (v3 > 0.0)
  {
    v5 = v3 / -80.0 + 1.0;
    v4 = 0.0;
    if (v5 >= 0.0)
      return v5;
  }
  return v4;
}

- (double)_dampingFactorForPerpendicularityFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[CAMZoomControl _zoomDial](self, "_zoomDial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dialCenter");
  v11 = v10;
  v13 = v12;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v9, v7, v6);
  v15 = v14;
  v17 = v16;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  v20 = v18 - v15;
  v21 = v19 - v17;
  v22 = sqrt(v21 * v21 + v20 * v20);
  v23 = 1.0;
  if (v22 > 0.0)
  {
    v24 = v18 - v11;
    v25 = v19 - v13;
    v26 = sqrt(v25 * v25 + v24 * v24);
    if (v26 > 0.0)
    {
      v27 = fabs(v21 / v22 * (v25 / v26) + v20 / v22 * (v24 / v26));
      if (v27 > 0.707)
      {
        v28 = (0.92 - v27) / 0.213;
        if (v28 >= 0.0)
          v23 = v28;
        else
          v23 = 0.0;
        if (v23 > 1.0)
          v23 = 1.0;
      }
    }
  }

  return v23;
}

- (double)_dampingFactorForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[CAMZoomControl _dampingFactorForDistanceFromDialForPoint:](self, "_dampingFactorForDistanceFromDialForPoint:", a4.x, a4.y);
  v10 = v9;
  -[CAMZoomControl _dampingFactorForPerpendicularityFromPoint:toPoint:](self, "_dampingFactorForPerpendicularityFromPoint:toPoint:", v7, v6, x, y);
  return v10 * v11;
}

- (double)_accelerationForMovementFromPointFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 elapsedTime:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  int64_t v11;
  double result;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v11 = -[CAMZoomControl layoutStyle](self, "layoutStyle");
  result = 1.0;
  if (v11 != 1)
  {
    v13 = x - v9;
    v14 = 0.0166666667 / a5;
    if (a5 < 0.00833333333)
      v14 = 2.0;
    v15 = v13 * v14;
    -[CAMZoomControl _normalizeValue:betweenMinimumValue:maximumValue:](self, "_normalizeValue:betweenMinimumValue:maximumValue:", fabs(v13 * v14), 12.0, 30.0);
    v17 = v16 * v16 + v16 * v16;
    -[CAMZoomControl _additionalAccelerationForMovementFromPoint:toPoint:deltaX:](self, "_additionalAccelerationForMovementFromPoint:toPoint:deltaX:", v9, v8, x, y, v15);
    return v18 + v17 + 1.0;
  }
  return result;
}

- (double)_additionalAccelerationForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 deltaX:(double)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v31;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  -[CAMZoomControl _dialClippingView](self, "_dialClippingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v10, v8, v7);
  v20 = v19;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  v22 = v21;
  v31.origin.x = v12;
  v31.origin.y = v14;
  v31.size.width = v16;
  v31.size.height = v18;
  Width = CGRectGetWidth(v31);
  if (v22 <= v20)
  {
    -[CAMZoomControl _normalizeValue:betweenMinimumValue:maximumValue:](self, "_normalizeValue:betweenMinimumValue:maximumValue:", v22, 0.0, Width * 0.4);
    v24 = 1.0 - v25;
  }
  else
  {
    -[CAMZoomControl _normalizeValue:betweenMinimumValue:maximumValue:](self, "_normalizeValue:betweenMinimumValue:maximumValue:", v22, Width * 0.6);
  }
  v26 = v24 * v24;
  -[CAMZoomControl _normalizeValue:betweenMinimumValue:maximumValue:](self, "_normalizeValue:betweenMinimumValue:maximumValue:", fabs(a5), 2.0, 4.0);
  v28 = v27 * (v26 * 5.0);

  return v28;
}

- (double)_normalizeValue:(double)a3 betweenMinimumValue:(double)a4 maximumValue:(double)a5
{
  double result;

  result = (a3 - a4) / (a5 - a4);
  if (result < 0.0)
    result = 0.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (void)removeAnimationFromView:(id)a3 forKeys:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CAMZoomControl_removeAnimationFromView_forKeys___block_invoke;
  v8[3] = &unk_1EA329AC8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __50__CAMZoomControl_removeAnimationFromView_forKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "animationForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:", v6);

  }
}

- (BOOL)_shouldInterceptTouchesForHidingZoomDial
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  BOOL v13;

  -[CAMZoomControl _startTimeForHideAnimationInProgress](self, "_startTimeForHideAnimationInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = -v5;
    -[CAMZoomControl _hideAnimationInProgressDuration](self, "_hideAnimationInProgressDuration");
    v8 = v7;
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "style");

    if (v10 == 1)
    {
      -[CAMZoomControl _hideAnimationInProgressDuration](self, "_hideAnimationInProgressDuration");
      v12 = v11 * 0.7;
    }
    else
    {
      v12 = v8 * 0.9;
    }
    v13 = v12 > v6;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  CAMZoomControl *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _BOOL4 v13;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  _BOOL4 v19;
  CAMZoomControl *v20;
  objc_super v22;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v22.receiver = self;
  v22.super_class = (Class)CAMZoomControl;
  -[CAMZoomControl hitTest:withEvent:](&v22, sel_hitTest_withEvent_, a4);
  v7 = (CAMZoomControl *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;
  v13 = -[CAMZoomControl _isPointWithinZoomButtonAccessory:](self, "_isPointWithinZoomButtonAccessory:", x, y);
  if (v7 == self || v13)
  {
    v15 = v13;
    objc_msgSend(v8, "bounds");
    v23.x = v10;
    v23.y = v12;
    v16 = CGRectContainsPoint(v24, v23);
    v17 = -[CAMZoomControl _isPointWithinButtonPlatter:](self, "_isPointWithinButtonPlatter:", x, y);
    v18 = -[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial");
    v19 = -[CAMZoomControl _shouldInterceptTouchesForHidingZoomDial](self, "_shouldInterceptTouchesForHidingZoomDial");
    if (!v16 && !v17 && !v15 && !v18 && !v19)
    {
      v20 = 0;
LABEL_11:

      v7 = v20;
      goto LABEL_12;
    }
    if (v15)
    {
      v20 = self;
      goto LABEL_11;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)_isWithinZoomButtonBoundsWithTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGPoint v11;
  CGRect v12;

  v4 = a3;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "bounds");
  v11.x = v7;
  v11.y = v9;
  LOBYTE(v4) = CGRectContainsPoint(v12, v11);

  return (char)v4;
}

- (void)_setHighlightedZoomButton:(id)a3
{
  CAMZoomButton *v4;
  CAMZoomButton *highlightedZoomButton;
  CAMZoomButton *v6;
  CAMZoomButton *v7;

  v4 = (CAMZoomButton *)a3;
  highlightedZoomButton = self->__highlightedZoomButton;
  if (highlightedZoomButton != v4)
    -[CAMZoomButton setHighlighted:](highlightedZoomButton, "setHighlighted:", 0);
  v6 = self->__highlightedZoomButton;
  self->__highlightedZoomButton = v4;
  v7 = v4;

  -[CAMZoomButton setHighlighted:](self->__highlightedZoomButton, "setHighlighted:", 1);
}

- (void)_resetSnapping
{
  -[CAMZoomControl _setSnappedZoomFactor:](self, "_setSnappedZoomFactor:", 0.0);
  -[CAMZoomControl _setUnsnappingProgress:](self, "_setUnsnappingProgress:", 0.0);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  void *v29;
  unsigned int v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CAMZoomControl;
  v8 = -[CAMZoomControl beginTrackingWithTouch:withEvent:](&v32, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  if (v8)
  {
    -[CAMZoomControl _zoomButton](self, "_zoomButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", self);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "timestamp");
    v15 = v14;
    v16 = -[CAMZoomControl _isZoomDialEnabled](self, "_isZoomDialEnabled");
    v17 = -[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial");
    -[CAMZoomControl _setStartTouchLocation:](self, "_setStartTouchLocation:", v11, v13);
    -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v11, v13);
    -[CAMZoomControl _setPreviousTouchTime:](self, "_setPreviousTouchTime:", v15);
    -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
    -[CAMZoomControl _cancelDelayedZoomDialVisibilityChange](self, "_cancelDelayedZoomDialVisibilityChange");
    v18 = -[CAMZoomControl _isWithinZoomButtonBoundsWithTouch:](self, "_isWithinZoomButtonBoundsWithTouch:", v6);
    v19 = -[CAMZoomControl _isTouchWithinButtonPlatter:](self, "_isTouchWithinButtonPlatter:", v6);
    v20 = -[CAMZoomControl _isTouchWithinZoomButtonAccessory:](self, "_isTouchWithinZoomButtonAccessory:", v6);
    if (v19)
    {
      -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
      v31 = v17;
      v21 = v18;
      v22 = v16;
      v23 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "nearestZoomButtonForTouch:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", v25);

      v9 = v23;
      v16 = v22;
      v18 = v21;
      v17 = v31;
    }
    else if (v18)
    {
      -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", v9);
    }
    else if (v20)
    {
      -[CAMZoomControl _accessorizedZoomButton](self, "_accessorizedZoomButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", v26);

    }
    if (v16)
    {
      v27 = -[CAMZoomControl _shouldInterceptTouchesForHidingZoomDial](self, "_shouldInterceptTouchesForHidingZoomDial")
         && !v19;
      if ((v27 & 1) != 0 || v17 != 1)
      {
        v28 = 0.23;
        if (v27)
          v28 = 0.0;
        -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 1, 1, v28);
      }
    }
    -[CAMZoomControl _setEligibleForSwipeDownToDismiss:](self, "_setEligibleForSwipeDownToDismiss:", v17 & v18);
    -[CAMZoomControl _setEligibleForZoomFactorLabelTaps:](self, "_setEligibleForZoomFactorLabelTaps:", v17);
    -[CAMZoomControl _feedbackController](self, "_feedbackController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "prepareDiscreteFeedback:", 0);

  }
  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  int v5;
  void *v6;
  char v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = -[CAMZoomControl isTracking](self, "isTracking");
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("_UISheetInteractionBackgroundDismissRecognizer"));

  if (v5 && (v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMZoomControl;
    v8 = -[CAMZoomControl gestureRecognizerShouldBegin:](&v10, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  void *v28;
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
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  double v71;
  void *v72;
  BOOL v73;
  double v75;
  double v76;
  double v77;
  double v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v83.receiver = self;
  v83.super_class = (Class)CAMZoomControl;
  if (!-[CAMZoomControl continueTrackingWithTouch:withEvent:](&v83, sel_continueTrackingWithTouch_withEvent_, v6, v7))
    goto LABEL_75;
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  -[CAMZoomControl _startTouchLocation](self, "_startTouchLocation");
  v13 = v12;
  v15 = v14;
  -[CAMZoomControl _previousTouchLocation](self, "_previousTouchLocation");
  v17 = v16;
  v19 = v18;
  -[CAMZoomControl _previousTouchTime](self, "_previousTouchTime");
  v21 = v20;
  objc_msgSend(v7, "timestamp");
  v23 = v22;
  if (-[CAMZoomControl _isZoomDialEnabled](self, "_isZoomDialEnabled"))
  {
    v24 = v11 - v15;
    v25 = vabdd_f64(v9, v13);
    if (-[CAMZoomControl _isEligibleForSwipeDownToDismiss](self, "_isEligibleForSwipeDownToDismiss"))
    {
      if (v24 > 13.0)
      {
        -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", 0, 1);
        v26 = 0;
        if (!-[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial"))
          goto LABEL_65;
LABEL_19:
        v77 = v23;
        v75 = v23 - v21;
        v76 = v25;
        -[CAMZoomControl _zoomDial](self, "_zoomDial");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v28, v17, v19);
        v29 = v11;
        v31 = v30;
        v33 = v32;
        v78 = v29;
        -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v28, v9, v29);
        v35 = v34;
        v37 = v36;
        objc_msgSend(v28, "offsetAngleForPoint:", v31, v33);
        v39 = v38;
        objc_msgSend(v28, "offsetAngleForPoint:", v35, v37);
        v41 = v40 - v39;
        if (v40 - v39 >= -3.14159265)
        {
          if (v41 <= 3.14159265)
            goto LABEL_24;
          v42 = -6.28318531;
        }
        else
        {
          v42 = 6.28318531;
        }
        v41 = v41 + v42;
LABEL_24:
        -[CAMZoomControl _dampingFactorForMovementFromPoint:toPoint:](self, "_dampingFactorForMovementFromPoint:toPoint:", v17, v19, v9, v78);
        v44 = v43;
        -[CAMZoomControl _accelerationForMovementFromPointFromPoint:toPoint:elapsedTime:](self, "_accelerationForMovementFromPointFromPoint:toPoint:elapsedTime:", v17, v19, v9, v78, v75);
        v46 = -(v41 * v44) * v45;
        objc_msgSend(v28, "zoomFactor");
        objc_msgSend(v28, "offsetAngleForZoomFactor:");
        v48 = v47;
        v49 = v46 + v47;
        if (-[CAMZoomControl _shouldSnapDialToSwitchOverZoomFactors](self, "_shouldSnapDialToSwitchOverZoomFactors"))
        {
          objc_msgSend(v28, "dialCenter");
          v52 = sqrt((v37 - v51) * (v37 - v51) + (v35 - v50) * (v35 - v50));
          if (v52 <= 0.0)
            v53 = 0.0;
          else
            v53 = 14.0 / v52;
          -[CAMZoomControl _snappedZoomFactor](self, "_snappedZoomFactor");
          if (v54 > 0.0)
          {
            -[CAMZoomControl _snappedZoomFactor](self, "_snappedZoomFactor");
            -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
            objc_msgSend(v28, "offsetAngleForZoomFactor:");
            v49 = v55;
            -[CAMZoomControl _unsnappingProgress](self, "_unsnappingProgress");
            v25 = v76;
            if (v46 > 0.0 && v56 < 0.0 || v46 < 0.0 && v56 > 0.0)
              v56 = 0.0;
            v57 = v46 + v56;
            if (v46 + v56 <= v53)
            {
              v11 = v78;
              if (v57 >= -v53)
              {
                -[CAMZoomControl _setUnsnappingProgress:](self, "_setUnsnappingProgress:", v57);
              }
              else
              {
                -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
                v49 = v48 + v53 + v57;
              }
            }
            else
            {
              -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
              v49 = v48 + v57 - v53;
              v11 = v78;
            }
            goto LABEL_61;
          }
          -[CAMZoomControl _switchOverZoomFactors](self, "_switchOverZoomFactors");
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
          if (v59)
          {
            v60 = v59;
            v61 = *(_QWORD *)v80;
            do
            {
              for (i = 0; i != v60; ++i)
              {
                if (*(_QWORD *)v80 != v61)
                  objc_enumerationMutation(v58);
                objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "doubleValue");
                v64 = v63;
                -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
                objc_msgSend(v28, "offsetAngleForZoomFactor:");
                v66 = v49 - v65;
                v67 = v48 > v65;
                if (v49 - v65 > 0.0)
                  v67 = 0;
                if (v66 <= -v53)
                  v67 = 0;
                if (v66 < v53 && v66 >= 0.0 && v48 < v65 || v67)
                {
                  -[CAMZoomControl _setSnappedZoomFactor:](self, "_setSnappedZoomFactor:", v64);
                  -[CAMZoomControl _setUnsnappingProgress:](self, "_setUnsnappingProgress:", v66);
                  goto LABEL_59;
                }
              }
              v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
            }
            while (v60);
          }
LABEL_59:

          v11 = v78;
        }
        else
        {
          -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
          v11 = v78;
        }
        v25 = v76;
LABEL_61:
        -[CAMZoomControl _snappedZoomFactor](self, "_snappedZoomFactor");
        v23 = v77;
        if (v71 <= 0.0)
        {
          objc_msgSend(v28, "zoomFactorForOffsetAngle:", v49);
          -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
        }
        else
        {
          -[CAMZoomControl _snappedZoomFactor](self, "_snappedZoomFactor");
        }
        -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);

LABEL_65:
        if (-[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial"))
        {
          -[CAMZoomControl _highlightedZoomButton](self, "_highlightedZoomButton");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {

LABEL_69:
            if (v25 > 4.0 || fabs(v24) > 4.0)
            {
              -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", 0);
              -[CAMZoomControl _setEligibleForZoomFactorLabelTaps:](self, "_setEligibleForZoomFactorLabelTaps:", 0);
            }
            goto LABEL_72;
          }
          if (-[CAMZoomControl _isEligibleForZoomFactorLabelTaps](self, "_isEligibleForZoomFactorLabelTaps"))
            goto LABEL_69;
        }
LABEL_72:
        -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v9, v11);
        -[CAMZoomControl _setPreviousTouchTime:](self, "_setPreviousTouchTime:", v23);
        if ((v26 & 1) != 0)
          goto LABEL_73;
        -[CAMZoomControl _cleanupForCancelTracking](self, "_cleanupForCancelTracking");
LABEL_75:
        v73 = 0;
        goto LABEL_76;
      }
      if (v24 < -13.0 || v25 > 15.0)
        -[CAMZoomControl _setEligibleForSwipeDownToDismiss:](self, "_setEligibleForSwipeDownToDismiss:", 0);
    }
    if (-[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial"))
    {
      v26 = 1;
    }
    else
    {
      if (v25 <= 15.0 && v24 >= -13.0)
      {
        v26 = 1;
        goto LABEL_65;
      }
      v26 = 1;
      -[CAMZoomControl _setShouldShowZoomDial:animationDuration:](self, "_setShouldShowZoomDial:animationDuration:", 1, 1);
    }
    goto LABEL_19;
  }
  -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v9, v11);
  -[CAMZoomControl _setPreviousTouchTime:](self, "_setPreviousTouchTime:", v23);
LABEL_73:
  v73 = 1;
LABEL_76:

  return v73;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _BOOL4 v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id obj;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGPoint v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _accessorizedZoomButton](self, "_accessorizedZoomButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _highlightedZoomButton](self, "_highlightedZoomButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", 0);
  if (!v6)
    goto LABEL_32;
  if (v10 != v8 && (!v9 || v10 != v9))
  {
    if (!v10)
    {
      if (!-[CAMZoomControl _isEligibleForZoomFactorLabelTaps](self, "_isEligibleForZoomFactorLabelTaps"))
        goto LABEL_31;
      -[CAMZoomControl _zoomDial](self, "_zoomDial");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activeZoomFactorLabels");
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v23)
      {
        v29 = v22;
        v30 = v9;
        v24 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v26, "superview");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "locationInView:", v27);

            objc_msgSend(v26, "center");
            UIDistanceBetweenPoints();
            if (v28 <= 30.0)
            {
              v23 = v26;
              goto LABEL_28;
            }
          }
          v23 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v23)
            continue;
          break;
        }
LABEL_28:
        v22 = v29;
        v9 = v30;
      }

      if (!v23)
        goto LABEL_31;
      objc_msgSend(v23, "zoomFactor");
      -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
      -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
      -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, 0.0);

      goto LABEL_32;
    }
    if (!-[CAMZoomControl _isTouchWithinButtonPlatter:](self, "_isTouchWithinButtonPlatter:", v6))
      goto LABEL_31;
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nearestZoomButtonForTouch:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v21)
      goto LABEL_31;
    goto LABEL_16;
  }
  objc_msgSend(v6, "locationInView:", v8);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "bounds");
  v39.x = v12;
  v39.y = v14;
  v15 = CGRectContainsPoint(v40, v39);
  v16 = -[CAMZoomControl _isTouchWithinZoomButtonAccessory:](self, "_isTouchWithinZoomButtonAccessory:", v6);
  v17 = v16;
  if (v15 && !v16)
  {
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "style");

    if (v19)
    {
      if (v19 == 1)
      {
        if (-[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial"))
          goto LABEL_31;
        goto LABEL_16;
      }
      goto LABEL_11;
    }
LABEL_16:
    -[CAMZoomControl _handleButtonTapped:forAccessoryTap:](self, "_handleButtonTapped:forAccessoryTap:", v10, 0);
    goto LABEL_32;
  }
LABEL_11:
  if (!v17)
  {
LABEL_31:
    -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, 1.5);
    goto LABEL_32;
  }
  -[CAMZoomControl _handleAccessoryTappedForButton:](self, "_handleAccessoryTappedForButton:", v10);
LABEL_32:
  -[CAMZoomControl _resetSnapping](self, "_resetSnapping");
  v32.receiver = self;
  v32.super_class = (Class)CAMZoomControl;
  -[CAMZoomControl endTrackingWithTouch:withEvent:](&v32, sel_endTrackingWithTouch_withEvent_, v6, v7);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CAMZoomControl _cleanupForCancelTracking](self, "_cleanupForCancelTracking");
  v5.receiver = self;
  v5.super_class = (Class)CAMZoomControl;
  -[CAMZoomControl cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, v4);

}

- (void)_cleanupForCancelTracking
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[CAMZoomControl _highlightedZoomButton](self, "_highlightedZoomButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring touches to zoom button because cancelTrackingWithEvent received before endTrackingWithTouch is received", v5, 2u);
    }

    -[CAMZoomControl _setHighlightedZoomButton:](self, "_setHighlightedZoomButton:", 0);
  }
  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, 0.0);
  -[CAMZoomControl _resetSnapping](self, "_resetSnapping");

}

- (BOOL)_isButtonPlatterSupportedForConfiguration
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  BOOL v7;

  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (unint64_t)-[CAMZoomControl _zoomControlMode](self, "_zoomControlMode") > 1)
    return 0;
  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 >= objc_msgSend(v6, "buttonCount");

  return v7;
}

- (unint64_t)_numberOfZoomPlatterButtonsForZoomFactorCount:(unint64_t)a3
{
  int64_t v5;

  v5 = -[CAMZoomControl _zoomControlMode](self, "_zoomControlMode");
  if (!v5)
    return a3
         - (-[CAMZoomControl _createButtonForMaxZoomFactor](self, "_createButtonForMaxZoomFactor") ^ 1);
  if (v5 == 1)
    return a3;
  return 0;
}

- (BOOL)_shouldShowButtonPlatter
{
  _BOOL4 v3;

  v3 = -[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration");
  if (v3)
    LOBYTE(v3) = !-[CAMZoomControl _shouldShowZoomDial](self, "_shouldShowZoomDial");
  return v3;
}

- (BOOL)_isTouchWithinButtonPlatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  LOBYTE(self) = -[CAMZoomControl _isPointWithinButtonPlatter:](self, "_isPointWithinButtonPlatter:", v8, v10);
  return (char)self;
}

- (BOOL)_isPointWithinButtonPlatter:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = -[CAMZoomControl _shouldShowButtonPlatter](self, "_shouldShowButtonPlatter");
  if (v6)
  {
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8 + -11.0;
    v11 = v10 + -11.0;
    v13 = v12 + 22.0;
    v15 = v14 + 15.0;

    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    v17.x = x;
    v17.y = y;
    LOBYTE(v6) = CGRectContainsPoint(v18, v17);
  }
  return v6;
}

- (void)setPlatterLayoutCompact:(BOOL)a3
{
  -[CAMZoomControl setPlatterLayoutCompact:animated:](self, "setPlatterLayoutCompact:animated:", a3, 0);
}

- (void)setPlatterLayoutCompact:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_platterLayoutCompact != a3)
  {
    self->_platterLayoutCompact = a3;
    -[CAMZoomControl _setButtonPlatterCollapsed:animated:](self, "_setButtonPlatterCollapsed:animated:");
    -[CAMZoomControl _updateZoomDialEnablement](self, "_updateZoomDialEnablement");
  }
}

- (void)_updateZoomDialEnablement
{
  unint64_t v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v16;
  id v17;

  v3 = -[CAMZoomControl _zoomControlMode](self, "_zoomControlMode");
  if (v3 > 4)
  {
    -[CAMZoomControl _setZoomDialEnabled:](self, "_setZoomDialEnabled:", 1);
LABEL_7:
    -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = v9 != 0.0 && v13 / v9 <= 2.0;
    if (-[CAMZoomControl layoutStyle](self, "layoutStyle") == 1 || v14)
      v16 = 1.04719755;
    else
      v16 = 1.57079633;
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAngleDeltaForZoomRange:", v16);

    return;
  }
  if (((1 << v3) & 0x1A) != 0)
  {
    -[CAMZoomControl _setZoomDialEnabled:](self, "_setZoomDialEnabled:", 0);
    return;
  }
  v4 = -[CAMZoomControl isPlatterLayoutCompact](self, "isPlatterLayoutCompact");
  v5 = v4;
  -[CAMZoomControl _setZoomDialEnabled:](self, "_setZoomDialEnabled:", !v4);
  if (!v5)
    goto LABEL_7;
}

- (void)_setButtonPlatterCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a3;
  if (a4)
  {
    -[CAMZoomControl layoutIfNeeded](self, "layoutIfNeeded");
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__CAMZoomControl__setButtonPlatterCollapsed_animated___block_invoke;
    v7[3] = &unk_1EA328908;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v7, 0, 0.3, 0.0, 1.0, 1.0);
  }
  else
  {
    -[CAMZoomControl setNeedsLayout](self, "setNeedsLayout");
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCollapsed:", v4);

  }
}

uint64_t __54__CAMZoomControl__setButtonPlatterCollapsed_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_buttonPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollapsed:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)isPlatterExpanded
{
  CAMZoomControl *v2;
  void *v3;
  int v4;
  BOOL v5;

  v2 = self;
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[CAMZoomControl _isButtonPlatterSupportedForConfiguration](v2, "_isButtonPlatterSupportedForConfiguration");
  v4 = v2 & (objc_msgSend(v3, "isCollapsed") ^ 1);
  if (v3)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPreferredCustomLens:(int64_t)a3
{
  id v4;

  if (self->_preferredCustomLens != a3)
  {
    self->_preferredCustomLens = a3;
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredCustomLens:", a3);

  }
}

- (void)_handleButtonTapped:(id)a3 forAccessoryTap:(BOOL)a4
{
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a3;
  if (-[CAMZoomControl isPlatterLayoutCompact](self, "isPlatterLayoutCompact"))
    v6 = -[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration");
  else
    v6 = 0;
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCollapsed");

  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "buttonCount") == 2 && v6;
  v11 = v10 & v8;

  if (!v6 || !v8 || a4 || (v11 & 1) != 0)
  {
    switch(-[CAMZoomControl _zoomControlMode](self, "_zoomControlMode"))
    {
      case 0:
        -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          v15 = v11;
        else
          v15 = 1;

        if ((v15 & 1) != 0)
          -[CAMZoomControl _handleButtonTappedForDualCameraMode](self, "_handleButtonTappedForDualCameraMode");
        else
          -[CAMZoomControl _handleButtonTappedForContinuousModeWithPlatter:](self, "_handleButtonTappedForContinuousModeWithPlatter:", v16);
        break;
      case 1:
        -[CAMZoomControl _handleButtonTappedForSelection:](self, "_handleButtonTappedForSelection:", v16);
        break;
      case 2:
        -[CAMZoomControl _handleButtonTappedForSingleCameraZoomPlusToggle](self, "_handleButtonTappedForSingleCameraZoomPlusToggle");
        break;
      case 3:
      case 4:
        if (self->_delegateFlags.respondsToToggleBetweenZoomFactors)
        {
          -[CAMZoomControl delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "toggleBetweenZoomFactorsForZoomControl:", self);
          goto LABEL_12;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    -[CAMZoomControl _setButtonPlatterCollapsed:animated:](self, "_setButtonPlatterCollapsed:animated:", 0, 1);
    -[CAMZoomControl delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoomControlDidChangePlatterExpanded:", self);
LABEL_12:

  }
  if (((!v6 | v8) & 1) == 0)
  {
    -[CAMZoomControl _setButtonPlatterCollapsed:animated:](self, "_setButtonPlatterCollapsed:animated:", 1, 1);
    -[CAMZoomControl delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoomControlDidChangePlatterExpanded:", self);

  }
}

- (void)_handleButtonTappedForDualCameraMode
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[CAMZoomControl _zoomFactors](self, "_zoomFactors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _displayMinimumZoomFactor](self, "_displayMinimumZoomFactor");
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v22, "isEqualToString:", v11);
  v14 = objc_msgSend(v22, "isEqualToString:", v12);
  -[CAMZoomControl zoomFactor](self, "zoomFactor");
  v16 = v15;
  if ((v13 & 1) == 0)
  {
    if (!v14
      && ((-[CAMZoomControl _displayMinimumZoomFactor](self, "_displayMinimumZoomFactor"), v17 == 1.0) || v10 == 1.0))
    {
      -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:", 1.0);
    }
    else
    {
      -[CAMZoomControl minimumZoomFactor](self, "minimumZoomFactor");
    }
    v6 = v18;
  }
  -[CAMZoomControl minAvailableZoomFactor](self, "minAvailableZoomFactor");
  if (v6 < v19 || (-[CAMZoomControl maxAvailableZoomFactor](self, "maxAvailableZoomFactor"), v6 > v20))
    v6 = v16;
  if (v6 == v16)
  {
    -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 1, 1, 0.0);
    v21 = 1.5;
  }
  else
  {
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1, v6);
    v21 = 0.0;
  }
  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, v21);

}

- (void)_handleButtonTappedForContinuousModeWithPlatter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[7];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  -[CAMZoomControl _zoomButton](self, "_zoomButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v13 = 1.5;
  }
  else
  {
    -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baseZoomPointForButton:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControl zoomFactor](self, "zoomFactor");
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v6, "zoomFactorButton");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
      {
        objc_msgSend(v7, "allZoomPoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = 0;
        v22 = (double *)&v21;
        v23 = 0x2020000000;
        v24 = 0x7FEFFFFFFFFFFFFFLL;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __66__CAMZoomControl__handleButtonTappedForContinuousModeWithPlatter___block_invoke;
        v20[3] = &unk_1EA329AF0;
        *(double *)&v20[6] = v9;
        v20[4] = &v21;
        v20[5] = &v25;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
        v12 = v22[3];
        if (vabdd_f64(v12, v9) < 0.001)
        {
          v15 = objc_msgSend(v14, "count");
          objc_msgSend(v14, "objectAtIndexedSubscript:", (v15 + v26[3] - 1) % v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zoomFactor");
          v12 = v17;

        }
        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v25, 8);

      }
      else
      {
        objc_msgSend(v6, "defaultZoomFactorForButton:", v4);
        -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
        v12 = v11;
      }
    }
    else
    {
      v12 = 1.0;
    }
    -[CAMZoomControl minAvailableZoomFactor](self, "minAvailableZoomFactor");
    if (v12 >= v18 && (-[CAMZoomControl maxAvailableZoomFactor](self, "maxAvailableZoomFactor"), v12 <= v19))
    {
      if (v12 != v9)
        -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1, v12);
      v13 = 0.0;
    }
    else
    {
      v13 = 0.0;
      if (-[CAMZoomControl _isZoomDialEnabled](self, "_isZoomDialEnabled"))
      {
        -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 1, 1, 0.0);
        v13 = 1.5;
      }
    }

  }
  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, v13);

}

uint64_t __66__CAMZoomControl__handleButtonTappedForContinuousModeWithPlatter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;
  uint64_t v7;

  result = objc_msgSend(a2, "zoomFactor");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (vabdd_f64(v6, *(double *)(a1 + 48)) < vabdd_f64(*(double *)(v7 + 24), *(double *)(a1 + 48)))
  {
    *(double *)(v7 + 24) = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)_handleButtonTappedForSelection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseZoomPointForButton:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayZoomFactor");
  if (v15)
  {
    v7 = v6;
    -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
    if (v7 != v8)
    {
      -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoomFactors");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend((id)v10, "indexOfObject:", v11);

      -[CAMZoomControl delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[CAMZoomControl delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoomControl:didChangeSelectedButtonIndex:displayZoomFactor:", self, v12, v7);

      }
    }
  }

}

- (void)_handleAccessoryTappedForButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[CAMZoomControl delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (-[CAMZoomControl _isButtonPlatterSupportedForConfiguration](self, "_isButtonPlatterSupportedForConfiguration"))
    {
      -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoomFactors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMZoomControl _buttonPlatter](self, "_buttonPlatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttons");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[CAMZoomControl _zoomButton](self, "_zoomButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zoomFactor");
      objc_msgSend(v10, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMZoomControl _zoomButton](self, "_zoomButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v9;

    -[CAMZoomControl delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "zoomControl:accessoryButtonTapIndexInDisplayZoomFactors:", self, v7);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 >= objc_msgSend(v13, "count"))
      {
        v16 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 134218240;
          v21 = v15;
          v22 = 2048;
          v23 = objc_msgSend(v13, "count");
          _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "accessoryButtonTapIndexInDisplayZoomFactors %ld outside available count: %ld", (uint8_t *)&v20, 0x16u);
        }
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        -[CAMZoomControl _handleButtonTapped:forAccessoryTap:](self, "_handleButtonTapped:forAccessoryTap:", v16, 1);
      }

    }
  }
  -[CAMZoomControl delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CAMZoomControl delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "zoomControlDidTapZoomButtonAccessory:", self);

  }
}

- (void)_handleButtonTappedForSingleCameraZoomPlusToggle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  id v8;

  -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomControl _displayMinimumZoomFactor](self, "_displayMinimumZoomFactor");
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v3))
  {
    if (!self->_delegateFlags.respondsToCanToggleBetweenZoomFactors
      || (-[CAMZoomControl delegate](self, "delegate"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "canToggleBetweenZoomFactorsForZoomControl:", self),
          v4,
          !v5))
    {
      -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 1, 1, 0.0);
      v7 = 1.5;
      goto LABEL_9;
    }
    if (self->_delegateFlags.respondsToToggleBetweenZoomFactors)
    {
      -[CAMZoomControl delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toggleBetweenZoomFactorsForZoomControl:", self);

    }
  }
  else
  {
    -[CAMZoomControl minimumZoomFactor](self, "minimumZoomFactor");
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
  }
  v7 = 0.0;
LABEL_9:
  -[CAMZoomControl _setShouldShowZoomDial:animationDuration:afterDelay:](self, "_setShouldShowZoomDial:animationDuration:afterDelay:", 0, 1, v7);

}

- (void)_updateSignificantValuesForHaptics
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CAMZoomControl _displayZoomFactors](self, "_displayZoomFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CAMZoomControl__updateSignificantValuesForHaptics__block_invoke;
  v10[3] = &unk_1EA329B18;
  v11 = v5;
  v12 = v3;
  v13 = v4;
  v14 = v6 - 1;
  v7 = v4;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  -[CAMZoomControl _setSignificantHapticDisplayValues:](self, "_setSignificantHapticDisplayValues:", v8);
  -[CAMZoomControl _setSignificantHapticDisplayValueSwitchOverIndexes:](self, "_setSignificantHapticDisplayValueSwitchOverIndexes:", v7);
  -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
  -[CAMZoomControl set_lastHapticZone:](self, "set_lastHapticZone:", -[CAMZoomControl _hapticZoneForDisplayValue:](self, "_hapticZoneForDisplayValue:"));

}

void __52__CAMZoomControl__updateSignificantValuesForHaptics__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (a3)
  {
    if (*(_QWORD *)(a1 + 56) == a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v7 = v6;

      objc_msgSend(v15, "doubleValue");
      v9 = v8;
      v10 = floor(v7) + 1.0;
      if (v10 < v8)
      {
        do
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

          v10 = v10 + 1.0;
        }
        while (v10 < v9);
      }
    }
    if (*(_QWORD *)(a1 + 56) > a3)
    {
      v13 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

}

- (void)_setSignificantHapticDisplayValues:(id)a3
{
  NSArray *v5;
  NSArray *significantHapticDisplayValues;
  BOOL v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  significantHapticDisplayValues = self->__significantHapticDisplayValues;
  if (significantHapticDisplayValues != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqualToArray:](significantHapticDisplayValues, "isEqualToArray:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->__significantHapticDisplayValues, a3);
      -[CAMZoomControl _updateHapticEpsilons](self, "_updateHapticEpsilons");
      v5 = v8;
    }
  }

}

- (void)_updateHapticEpsilons
{
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  double v19;

  -[CAMZoomControl zoomDialRadius](self, "zoomDialRadius");
  if (v3 > 0.0)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "angleDeltaForZoomRange");
    v9 = v8;

    if (v4 * v9 <= 0.0)
      v10 = 0.0;
    else
      v10 = 2.0 / (v4 * v9);
    -[CAMZoomControl _significantHapticDisplayValues](self, "_significantHapticDisplayValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__CAMZoomControl__updateHapticEpsilons__block_invoke;
    v15[3] = &unk_1EA329B18;
    v16 = v6;
    v17 = v11;
    v19 = v10;
    v18 = v5;
    v12 = v5;
    v13 = v11;
    v14 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
    -[CAMZoomControl _setSignificantHapticDisplayValueEpsilons:](self, "_setSignificantHapticDisplayValueEpsilons:", v12);

  }
}

void __39__CAMZoomControl__updateHapticEpsilons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "normalizedValueForZoomFactor:");
  v8 = v7;
  v9 = objc_msgSend(*(id *)(a1 + 40), "count") - 1;
  v10 = *(double *)(a1 + 56);
  v11 = *(void **)(a1 + 32);
  if (v9 == a3)
  {
    objc_msgSend(v11, "zoomFactorForNormalizedValue:", v8 - v10);
  }
  else
  {
    objc_msgSend(v11, "zoomFactorForNormalizedValue:", v8 + v10);
    v14 = v13;
    v12 = v6;
    v6 = v14;
  }
  v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 - v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

}

- (int64_t)_hapticZoneForDisplayValue:(double)a3
{
  BOOL v5;
  void *v6;
  int64_t v7;
  _QWORD v9[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  v5 = -[CAMZoomControl _shouldSnapDialToSwitchOverZoomFactors](self, "_shouldSnapDialToSwitchOverZoomFactors");
  -[CAMZoomControl _significantHapticDisplayValues](self, "_significantHapticDisplayValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CAMZoomControl__hapticZoneForDisplayValue___block_invoke;
  v9[3] = &unk_1EA329B40;
  v10 = v5;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __45__CAMZoomControl__hapticZoneForDisplayValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;

  objc_msgSend(a2, "doubleValue");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_significantHapticDisplayValueEpsilons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "_significantHapticDisplayValueSwitchOverIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  v16 = *(double *)(a1 + 48);
  if (v16 < v8)
    goto LABEL_8;
  v17 = 0.0;
  if (!v15)
    v17 = v12;
  if (!*(_BYTE *)(a1 + 56))
    v17 = v12;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v16 <= v8 + v17)
LABEL_8:
    *a4 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)_updateHaptics:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[CAMZoomControl _feedbackController](self, "_feedbackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMZoomControl displayZoomValue](self, "displayZoomValue");
    v6 = -[CAMZoomControl _hapticZoneForDisplayValue:](self, "_hapticZoneForDisplayValue:");
    v7 = -[CAMZoomControl _lastHapticZone](self, "_lastHapticZone");
    -[CAMZoomControl _zoomDial](self, "_zoomDial");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isExpanded");

    if (v9)
    {
      if (v3)
      {
        v10 = v6 - v7;
        if (v6 != v7)
        {
          if ((v6 & 1) == 0)
            goto LABEL_9;
          if (v10 < 0)
            v10 = v7 - v6;
          if ((unint64_t)v10 >= 2)
          {
LABEL_9:
            -[CAMZoomControl _feedbackController](self, "_feedbackController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "performDiscreteFeedback:", 0);

            -[CAMZoomControl _feedbackController](self, "_feedbackController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "prepareDiscreteFeedback:", 0);

          }
        }
      }
    }
    -[CAMZoomControl set_lastHapticZone:](self, "set_lastHapticZone:", v6);
  }
}

- (CAMZoomControlDelegate)delegate
{
  return (CAMZoomControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)minAvailableZoomFactor
{
  return self->_minAvailableZoomFactor;
}

- (double)maxAvailableZoomFactor
{
  return self->_maxAvailableZoomFactor;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)zoomButtonAccessoryState
{
  return self->_zoomButtonAccessoryState;
}

- (CAMZoomButton)_zoomButton
{
  return self->__zoomButton;
}

- (CAMZoomDial)_zoomDial
{
  return self->__zoomDial;
}

- (UIView)_dialClippingView
{
  return self->__dialClippingView;
}

- (CAMZoomControlButtonMaskView)_buttonMaskView
{
  return self->__buttonMaskView;
}

- (CAMZoomButtonPlatter)_buttonPlatter
{
  return self->__buttonPlatter;
}

- (int64_t)_zoomControlMode
{
  return self->__zoomControlMode;
}

- (void)_setZoomControlMode:(int64_t)a3
{
  self->__zoomControlMode = a3;
}

- (NSArray)_zoomFactors
{
  return self->__zoomFactors;
}

- (void)_setZoomFactors:(id)a3
{
  objc_storeStrong((id *)&self->__zoomFactors, a3);
}

- (NSArray)_displayZoomFactors
{
  return self->__displayZoomFactors;
}

- (void)_setDisplayZoomFactors:(id)a3
{
  objc_storeStrong((id *)&self->__displayZoomFactors, a3);
}

- (NSArray)_zoomPoints
{
  return self->__zoomPoints;
}

- (void)_setZoomPoints:(id)a3
{
  objc_storeStrong((id *)&self->__zoomPoints, a3);
}

- (BOOL)_createButtonForMaxZoomFactor
{
  return self->__createButtonForMaxZoomFactor;
}

- (void)_setCreateButtonForMaxZoomFactor:(BOOL)a3
{
  self->__createButtonForMaxZoomFactor = a3;
}

- (BOOL)_isZoomDialEnabled
{
  return self->__zoomDialEnabled;
}

- (BOOL)_shouldShowZoomDial
{
  return self->__shouldShowZoomDial;
}

- (CGPoint)_startTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->__startTouchLocation.x;
  y = self->__startTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setStartTouchLocation:(CGPoint)a3
{
  self->__startTouchLocation = a3;
}

- (CGPoint)_previousTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->__previousTouchLocation.x;
  y = self->__previousTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setPreviousTouchLocation:(CGPoint)a3
{
  self->__previousTouchLocation = a3;
}

- (double)_previousTouchTime
{
  return self->__previousTouchTime;
}

- (void)_setPreviousTouchTime:(double)a3
{
  self->__previousTouchTime = a3;
}

- (BOOL)_isEligibleForSwipeDownToDismiss
{
  return self->__eligibleForSwipeDownToDismiss;
}

- (void)_setEligibleForSwipeDownToDismiss:(BOOL)a3
{
  self->__eligibleForSwipeDownToDismiss = a3;
}

- (BOOL)_isEligibleForZoomFactorLabelTaps
{
  return self->__eligibleForZoomFactorLabelTaps;
}

- (void)_setEligibleForZoomFactorLabelTaps:(BOOL)a3
{
  self->__eligibleForZoomFactorLabelTaps = a3;
}

- (NSTimer)_zoomDialVisibilityTimer
{
  return self->__zoomDialVisibilityTimer;
}

- (void)_setZoomDialVisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->__zoomDialVisibilityTimer, a3);
}

- (NSDate)_startTimeForHideAnimationInProgress
{
  return self->__startTimeForHideAnimationInProgress;
}

- (void)_setStartTimeForHideAnimationInProgress:(id)a3
{
  objc_storeStrong((id *)&self->__startTimeForHideAnimationInProgress, a3);
}

- (double)_hideAnimationInProgressDuration
{
  return self->__hideAnimationInProgressDuration;
}

- (void)_setHideAnimationInProgressDuration:(double)a3
{
  self->__hideAnimationInProgressDuration = a3;
}

- (CAMZoomButton)_highlightedZoomButton
{
  return self->__highlightedZoomButton;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (NSArray)_significantHapticDisplayValues
{
  return self->__significantHapticDisplayValues;
}

- (NSArray)_significantHapticDisplayValueEpsilons
{
  return self->__significantHapticDisplayValueEpsilons;
}

- (void)_setSignificantHapticDisplayValueEpsilons:(id)a3
{
  objc_storeStrong((id *)&self->__significantHapticDisplayValueEpsilons, a3);
}

- (NSSet)_significantHapticDisplayValueSwitchOverIndexes
{
  return self->__significantHapticDisplayValueSwitchOverIndexes;
}

- (void)_setSignificantHapticDisplayValueSwitchOverIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__significantHapticDisplayValueSwitchOverIndexes, a3);
}

- (int64_t)_lastHapticZone
{
  return self->__lastHapticZone;
}

- (void)set_lastHapticZone:(int64_t)a3
{
  self->__lastHapticZone = a3;
}

- (double)_snappedZoomFactor
{
  return self->__snappedZoomFactor;
}

- (void)_setSnappedZoomFactor:(double)a3
{
  self->__snappedZoomFactor = a3;
}

- (double)_unsnappingProgress
{
  return self->__unsnappingProgress;
}

- (void)_setUnsnappingProgress:(double)a3
{
  self->__unsnappingProgress = a3;
}

- (int64_t)preferredCustomLens
{
  return self->_preferredCustomLens;
}

- (double)edgeMargin
{
  return self->_edgeMargin;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)zoomButtonMaxYWhenContracted
{
  return self->_zoomButtonMaxYWhenContracted;
}

- (BOOL)isPlatterLayoutCompact
{
  return self->_platterLayoutCompact;
}

- (double)zoomDialRadius
{
  return self->_zoomDialRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__significantHapticDisplayValueSwitchOverIndexes, 0);
  objc_storeStrong((id *)&self->__significantHapticDisplayValueEpsilons, 0);
  objc_storeStrong((id *)&self->__significantHapticDisplayValues, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__highlightedZoomButton, 0);
  objc_storeStrong((id *)&self->__startTimeForHideAnimationInProgress, 0);
  objc_storeStrong((id *)&self->__zoomDialVisibilityTimer, 0);
  objc_storeStrong((id *)&self->__zoomPoints, 0);
  objc_storeStrong((id *)&self->__displayZoomFactors, 0);
  objc_storeStrong((id *)&self->__zoomFactors, 0);
  objc_storeStrong((id *)&self->__buttonPlatter, 0);
  objc_storeStrong((id *)&self->__buttonMaskView, 0);
  objc_storeStrong((id *)&self->__dialClippingView, 0);
  objc_storeStrong((id *)&self->__zoomDial, 0);
  objc_storeStrong((id *)&self->__zoomButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)configureForContinuousZoomWithZoomFactor:(void *)a1 zoomPoints:(NSObject *)a2 createButtonForMaxZoomFactor:compactPlatterLayout:animated:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Unexpected count for zoomPoints: %lu", (uint8_t *)&v3, 0xCu);
}

@end
