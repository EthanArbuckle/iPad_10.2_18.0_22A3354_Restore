@implementation AVRoutePickerView

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[AVMicaPackage targetSize](self->_routePickerButtonMicaPackage, "targetSize");
  v3 = v2 * 0.1;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)prioritizesVideoDevices
{
  return self->_prioritizesVideoDevices;
}

uint64_t __41__AVRoutePickerView__updateAirPlayActive__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAirPlayActive:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_createOrUpdateRoutePickerButton
{
  UIButton *v3;
  UIButton *routePickerButton;
  UIButton *v5;
  UIButton *v6;
  UIButton *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  _BOOL4 v12;
  __CFString *v13;
  AVMicaPackage *v14;
  AVMicaPackage *routePickerButtonMicaPackage;
  void *v16;
  void *v17;
  void *v18;
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
  id v31;

  -[UIButton removeFromSuperview](self->_routePickerButton, "removeFromSuperview");
  self->_oldSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[AVRoutePickerView customButton](self, "customButton");
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  routePickerButton = self->_routePickerButton;
  self->_routePickerButton = v3;

  v5 = self->_routePickerButton;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->_routePickerButton;
    self->_routePickerButton = v6;

    -[UIButton setAccessibilityIdentifier:](self->_routePickerButton, "setAccessibilityIdentifier:", CFSTR("AirPlay"));
    v8 = self->_routePickerButton;
    AVLocalizedString(CFSTR("AirPlay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v8, "setAccessibilityLabel:", v9);

    -[UIButton setContentEdgeInsets:](self->_routePickerButton, "setContentEdgeInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UIButton setContentHorizontalAlignment:](self->_routePickerButton, "setContentHorizontalAlignment:", 3);
    -[UIButton setContentVerticalAlignment:](self->_routePickerButton, "setContentVerticalAlignment:", 3);
    -[AVRoutePickerView customRoutingController](self, "customRoutingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = CFSTR("AVRoutePickerViewCustomDevicesGlyph");
    }
    else
    {
      v12 = -[AVRoutePickerView prioritizesVideoDevices](self, "prioritizesVideoDevices");
      v11 = CFSTR("AVRoutePickerViewCircularAirPlayGlyph");
      if (v12)
        v11 = CFSTR("AVRoutePickerViewSquareAirPlayGlyph");
    }
    v13 = v11;
    v14 = -[AVMicaPackage initWithPackageName:layoutDirection:]([AVMicaPackage alloc], "initWithPackageName:layoutDirection:", v13, -[AVRoutePickerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"));
    routePickerButtonMicaPackage = self->_routePickerButtonMicaPackage;
    self->_routePickerButtonMicaPackage = v14;

    -[AVMicaPackage removeCompositingFiltersWithName:](self->_routePickerButtonMicaPackage, "removeCompositingFiltersWithName:", CFSTR("plusL"));
    -[UIButton layer](self->_routePickerButton, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMicaPackage rootLayer](self->_routePickerButtonMicaPackage, "rootLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v17);

    v5 = self->_routePickerButton;
  }
  -[UIButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__routePickerButtonTapped_, 0x2000);
  -[AVRoutePickerView customButton](self, "customButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[UIButton addTarget:action:forControlEvents:](self->_routePickerButton, "addTarget:action:forControlEvents:", self, sel__routePickerButtonTouchDown_, 1);
    -[UIButton addTarget:action:forControlEvents:](self->_routePickerButton, "addTarget:action:forControlEvents:", self, sel__routePickerButtonTouchDragEnter_, 16);
    -[UIButton addTarget:action:forControlEvents:](self->_routePickerButton, "addTarget:action:forControlEvents:", self, sel__routePickerButtonTouchUp_, 480);
  }
  -[UIButton setPointerInteractionEnabled:](self->_routePickerButton, "setPointerInteractionEnabled:", 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_routePickerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AVRoutePickerView addSubview:](self, "addSubview:", self->_routePickerButton);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_routePickerButton, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVRoutePickerView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v21);

  -[UIButton bottomAnchor](self->_routePickerButton, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVRoutePickerView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v24);

  -[UIButton leadingAnchor](self->_routePickerButton, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVRoutePickerView leadingAnchor](self, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v27);

  -[UIButton trailingAnchor](self->_routePickerButton, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVRoutePickerView trailingAnchor](self, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");

}

- (void)setPrioritizesVideoDevices:(BOOL)prioritizesVideoDevices
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;

  if (self->_prioritizesVideoDevices != prioritizesVideoDevices)
  {
    v3 = prioritizesVideoDevices;
    self->_prioritizesVideoDevices = prioritizesVideoDevices;
    WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);
    objc_msgSend(WeakRetained, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortByIsVideoRoute:", v3);

    -[AVRoutePickerView _createOrUpdateRoutePickerButton](self, "_createOrUpdateRoutePickerButton");
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  -[AVRoutePickerView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  -[AVRoutePickerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double width;
  double height;
  _BOOL4 IsNull;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double MidX;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v28.receiver = self;
  v28.super_class = (Class)AVRoutePickerView;
  -[AVRoutePickerView layoutSubviews](&v28, sel_layoutSubviews);
  -[AVRoutePickerView bounds](self, "bounds");
  if (v3 != self->_oldSize.width || v4 != self->_oldSize.height)
  {
    v6 = v3;
    v7 = v4;
    self->_oldSize.width = v3;
    self->_oldSize.height = v4;
    -[AVMicaPackage unscaledSize](self->_routePickerButtonMicaPackage, "unscaledSize");
    v9 = (44.0 - v8) * 0.5;
    -[AVMicaPackage unscaledSize](self->_routePickerButtonMicaPackage, "unscaledSize");
    v11 = (44.0 - v10) * 0.5;
    -[AVMicaPackage unscaledSize](self->_routePickerButtonMicaPackage, "unscaledSize");
    v13 = fmax((v6 - v12) * 0.5, 0.0);
    if (v13 >= v9)
      v14 = v9;
    else
      v14 = v13;
    -[AVMicaPackage unscaledSize](self->_routePickerButtonMicaPackage, "unscaledSize");
    v16 = fmax((v7 - v15) * 0.5, 0.0);
    if (v16 >= v11)
      v17 = v11;
    else
      v17 = v16;
    -[AVRoutePickerView bounds](self, "bounds");
    v30 = CGRectInset(v29, v14, v17);
    width = v30.size.width;
    height = v30.size.height;
    IsNull = CGRectIsNull(v30);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!IsNull)
    {
      v22 = height;
      v21 = width;
    }
    -[AVMicaPackage setTargetSize:](self->_routePickerButtonMicaPackage, "setTargetSize:", v21, v22);
  }
  -[AVRoutePickerView customButton](self, "customButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVMicaPackage rootLayer](self->_routePickerButtonMicaPackage, "rootLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton layer](self->_routePickerButton, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    MidX = CGRectGetMidX(v31);
    -[UIButton layer](self->_routePickerButton, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    objc_msgSend(v24, "setPosition:", MidX, CGRectGetMidY(v32));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
}

- (AVRoutePickerView)initWithFrame:(CGRect)a3
{
  AVRoutePickerView *v3;
  AVRoutePickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVRoutePickerView;
  v3 = -[AVRoutePickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _CommonInit_14937(v3);
  return v4;
}

- (void)setActiveTintColor:(UIColor *)activeTintColor
{
  UIColor *v4;
  UIColor *obj;

  v4 = activeTintColor;
  if (!v4)
  {
    -[AVRoutePickerView _defaultActiveTintColor](self, "_defaultActiveTintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if (self->_activeTintColor != v4)
    objc_storeStrong((id *)&self->_activeTintColor, v4);
  -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");

}

- (void)_registerNotifications
{
  NSObject *getAirPlayStatusQueue;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  getAirPlayStatusQueue = self->_getAirPlayStatusQueue;
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __43__AVRoutePickerView__registerNotifications__block_invoke;
  v7 = &unk_1E5BB4A40;
  objc_copyWeak(&v8, &location);
  dispatch_async(getAirPlayStatusQueue, &v4);
  -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8B470], 0, 0, &__block_literal_global_46_14889, v4, v5, v6, v7);
  -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8B468], 0, 0, &__block_literal_global_47);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_defaultActiveTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.3629, 0.7041, 1.001, 1.0);
}

- (void)updateButtonAppearance
{
  void *v3;
  UIButton *routePickerButton;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _BOOL4 v17;
  const __CFString *v18;
  AVMicaPackage *routePickerButtonMicaPackage;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[AVRoutePickerView customButton](self, "customButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    routePickerButton = self->_routePickerButton;
    if (-[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive"))
    {
      -[AVRoutePickerView activeTintColor](self, "activeTintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](routePickerButton, "setTintColor:", v5);

    }
    else
    {
      -[UIButton setTintColor:](routePickerButton, "setTintColor:", 0);
    }
  }
  v6 = -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive");
  v7 = CFSTR("off");
  if (v6)
    v7 = CFSTR("on");
  v8 = v7;
  -[AVRoutePickerView tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive"))
  {
    -[AVRoutePickerView activeTintColor](self, "activeTintColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;
  v24 = 0.0;
  v25 = 0.0;
  v22 = 0;
  v23 = 0.0;
  objc_msgSend(v10, "getRed:green:blue:alpha:", &v25, &v24, &v23, &v22);
  _AVLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v25 * 255.0;
    v14 = v24 * 255.0;
    v15 = v23 * 255.0;
    v16 = v22;
    v17 = -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive");
    *(_DWORD *)buf = 136316418;
    v27 = "-[AVRoutePickerView updateButtonAppearance]";
    v18 = CFSTR("Inactive");
    v28 = 2048;
    v29 = v13;
    if (v17)
      v18 = CFSTR("Active");
    v30 = 2048;
    v31 = v14;
    v32 = 2048;
    v33 = v15;
    v34 = 2048;
    v35 = v16;
    v36 = 2112;
    v37 = v18;
    _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting mica color: (R: %.2f G: %.2f B: %.2f Alpha: %.2f) and state: %@.", buf, 0x3Eu);
  }

  routePickerButtonMicaPackage = self->_routePickerButtonMicaPackage;
  v20 = -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive");
  v21 = v9;
  if (v20)
  {
    -[AVRoutePickerView activeTintColor](self, "activeTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AVMicaPackage setState:color:](routePickerButtonMicaPackage, "setState:color:", v8, objc_msgSend(objc_retainAutorelease(v21), "CGColor"));

  if (v20)
}

- (BOOL)isAirPlayActive
{
  return self->_airPlayActive;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIButton intrinsicContentSize](self->_routePickerButton, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)_updateAirPlayActive
{
  NSObject *getAirPlayStatusQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  getAirPlayStatusQueue = self->_getAirPlayStatusQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AVRoutePickerView__updateAirPlayActive__block_invoke;
  v4[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v5, &location);
  dispatch_async(getAirPlayStatusQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAirPlayActive");
}

- (void)_setupOutputContext
{
  void *v3;
  AVOutputContext *v4;
  AVOutputContext *outputContext;
  id v6;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routingContextUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B2A8], "outputContextForID:", v6);
  v4 = (AVOutputContext *)objc_claimAutoreleasedReturnValue();
  outputContext = self->_outputContext;
  self->_outputContext = v4;

}

- (void)setRoutingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_routingConfiguration, a3);
}

- (void)setAirPlayActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_airPlayActive != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVRoutePickerView setAirPlayActive:]";
      v10 = "airPlayActive";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_airPlayActive = v3;
    -[AVRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
  }
}

void __41__AVRoutePickerView__updateAirPlayActive__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  _QWORD v4[5];
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "_isAirPlayOrCustomRouteActive");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__AVRoutePickerView__updateAirPlayActive__block_invoke_2;
    v4[3] = &unk_1E5BB2E68;
    v4[4] = v2;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);
  }

}

- (BOOL)_isAirPlayOrCustomRouteActive
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  char v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "%@ should be called from a background thread", buf, 0xCu);

    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AVOutputContext outputDevices](self->_outputContext, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "deviceType") < 2)
        {
          v9 = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_15:

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AVRoutePickerView customRoutingController](self, "customRoutingController", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authorizedRoutes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        -[AVRoutePickerView customRoutingController](self, "customRoutingController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v16) = objc_msgSend(v17, "isRouteActive:", v16);

        if ((v16 & 1) != 0)
        {
          v18 = 1;
          goto LABEL_25;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v13)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_25:

  return v9 | v18;
}

- (AVCustomRoutingController)customRoutingController
{
  return self->_customRoutingController;
}

void __43__AVRoutePickerView__registerNotifications__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVRoutePickerView__registerNotifications__block_invoke_2;
  block[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __43__AVRoutePickerView__registerNotifications__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[59], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB88], 0, 0, &__block_literal_global_14891);
    objc_msgSend(v2[59], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB38], 0, 0, &__block_literal_global_44);
    objc_msgSend(v2[59], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB28], 0, 0, &__block_literal_global_45_14892);
    WeakRetained = v2;
  }

}

- (AVRoutePickerView)initWithCoder:(id)a3
{
  AVRoutePickerView *v3;
  AVRoutePickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVRoutePickerView;
  v3 = -[AVRoutePickerView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _CommonInit_14937(v3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  -[AVRoutePickerView dealloc](&v3, sel_dealloc);
}

- (double)baselineOffsetFromBottom
{
  double result;

  -[UIButton intrinsicContentSize](self->_routePickerButton, "intrinsicContentSize");
  -[AVMicaPackage targetSize](self->_routePickerButtonMicaPackage, "targetSize");
  UIRoundToViewScale();
  return result;
}

- (UIColor)activeTintColor
{
  return self->_activeTintColor;
}

- (id)customButton
{
  return self->_customButton;
}

- (void)setCustomButton:(id)a3
{
  UIButton *v5;
  UIButton *v6;

  v5 = (UIButton *)a3;
  if (self->_customButton != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customButton, a3);
    -[AVRoutePickerView _createOrUpdateRoutePickerButton](self, "_createOrUpdateRoutePickerButton");
    v5 = v6;
  }

}

- (id)routingConfiguration
{
  return self->_routingConfiguration;
}

- (void)setCustomRoutingController:(AVCustomRoutingController *)customRoutingController
{
  objc_storeStrong((id *)&self->_customRoutingController, customRoutingController);
  -[AVRoutePickerView _createOrUpdateRoutePickerButton](self, "_createOrUpdateRoutePickerButton");
}

- (void)interruptActiveInteractions
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "dismiss");
    WeakRetained = v3;
  }

}

- (id)topViewControllerForPresentingAlert
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[AVRoutePickerView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "presentedViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      do
      {
        v6 = v5;

        objc_msgSend(v6, "presentedViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v6;
      }
      while (v5);
    }
    else
    {
      v6 = v3;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_routePickerButtonTapped:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id location;

  v4 = a3;
  -[AVRoutePickerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVRoutePickerView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routePickerViewWillBeginPresentingRoutes:", self);

  }
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);

  if (!WeakRetained)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__14895;
    v31 = __Block_byref_object_dispose__14896;
    v32 = 0;
    -[AVRoutePickerView routingConfiguration](self, "routingConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && !objc_msgSend(v9, "isDefault"))
    {
      v13 = objc_alloc((Class)getMPMediaControlsClass());
      v14 = objc_msgSend(v10, "sharingPolicy");
      objc_msgSend(v10, "outputContextID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithRouteSharingPolicy:routingContextUID:", v14, v12);
      v16 = (void *)v28[5];
      v28[5] = v15;

    }
    else
    {
      v11 = objc_alloc_init((Class)getMPMediaControlsClass());
      v12 = (void *)v28[5];
      v28[5] = (uint64_t)v11;
    }

    objc_storeWeak((id *)&self->_routePickingControls, (id)v28[5]);
    -[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls](self, "_addCustomRoutingItemsToRoutePickingControls");
    objc_msgSend((id)v28[5], "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSortByIsVideoRoute:", -[AVRoutePickerView prioritizesVideoDevices](self, "prioritizesVideoDevices"));

    objc_msgSend((id)v28[5], "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSSelectorFromString(CFSTR("useGenericDevicesIconInHeader"));
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      objc_msgSend((id)v28[5], "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[AVRoutePickerView customRoutingController](self, "customRoutingController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithBool:", v22 != 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValue:forKey:", v23, CFSTR("useGenericDevicesIconInHeader"));

    }
    objc_msgSend((id)v28[5], "startPrewarming");
    v24 = (void *)v28[5];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __46__AVRoutePickerView__routePickerButtonTapped___block_invoke;
    v25[3] = &unk_1E5BB2DC0;
    objc_copyWeak(&v26, &location);
    v25[4] = &v27;
    objc_msgSend(v24, "setDismissHandler:", v25);
    objc_msgSend((id)v28[5], "present");
    objc_destroyWeak(&v26);

    _Block_object_dispose(&v27, 8);
  }
  objc_destroyWeak(&location);

}

- (void)_routePickerButtonTouchDown:(id)a3
{
  -[AVRoutePickerView _setRoutePickerButtonAlpha:animated:](self, "_setRoutePickerButtonAlpha:animated:", 0, 0.2);
}

- (void)_routePickerButtonTouchDragEnter:(id)a3
{
  -[AVRoutePickerView _setRoutePickerButtonAlpha:animated:](self, "_setRoutePickerButtonAlpha:animated:", 1, 0.2);
}

- (void)_routePickerButtonTouchUp:(id)a3
{
  -[AVRoutePickerView _setRoutePickerButtonAlpha:animated:](self, "_setRoutePickerButtonAlpha:animated:", 1, 1.0);
}

- (void)_setRoutePickerButtonAlpha:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  id v8;
  UIViewPropertyAnimator *v9;
  UIViewPropertyAnimator *buttonHighlightAnimator;
  _QWORD v11[4];
  id v12[2];
  id location;

  v4 = a4;
  -[UIButton alpha](self->_routePickerButton, "alpha");
  if (v7 != a3)
  {
    if (-[UIViewPropertyAnimator isRunning](self->_buttonHighlightAnimator, "isRunning")
      && -[UIViewPropertyAnimator isInterruptible](self->_buttonHighlightAnimator, "isInterruptible"))
    {
      -[UIViewPropertyAnimator stopAnimation:](self->_buttonHighlightAnimator, "stopAnimation:", 0);
      -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_buttonHighlightAnimator, "finishAnimationAtPosition:", 2);
    }
    if ((-[UIViewPropertyAnimator isRunning](self->_buttonHighlightAnimator, "isRunning") & 1) == 0)
    {
      if (v4)
      {
        objc_initWeak(&location, self);
        v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __57__AVRoutePickerView__setRoutePickerButtonAlpha_animated___block_invoke;
        v11[3] = &unk_1E5BB4638;
        objc_copyWeak(v12, &location);
        v12[1] = *(id *)&a3;
        v9 = (UIViewPropertyAnimator *)objc_msgSend(v8, "initWithDuration:curve:animations:", 3, v11, 0.25);
        buttonHighlightAnimator = self->_buttonHighlightAnimator;
        self->_buttonHighlightAnimator = v9;

        -[UIViewPropertyAnimator startAnimation](self->_buttonHighlightAnimator, "startAnimation");
        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
      }
      else
      {
        -[UIButton setAlpha:](self->_routePickerButton, "setAlpha:", a3);
      }
    }
  }
}

- (CGRect)_normalizedRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
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
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "convertRect:fromView:", v8, x, y, width, height);
  v32 = v19;
  v33 = v18;
  v30 = v21;
  v31 = v20;

  v22 = *MEMORY[0x1E0C9D648];
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v34.origin.x = v11;
  v34.origin.y = v13;
  v34.size.width = v15;
  v34.size.height = v17;
  if (!CGRectIsEmpty(v34))
  {
    v35.origin.x = v11;
    v35.origin.y = v13;
    v35.size.width = v15;
    v35.size.height = v17;
    if (!CGRectIsInfinite(v35))
    {
      v22 = v33 / v15;
      v23 = v32 / v17;
      v24 = v31 / v15;
      v25 = v30 / v17;
    }
  }

  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_addCustomRoutingItemsToRoutePickingControls
{
  MPMediaControls **p_routePickingControls;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  AVRoutePickerView *v22;
  NSObject *v23;
  NSObject *obj;
  _QWORD v25[4];
  NSObject *v26;
  AVRoutePickerView *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  p_routePickingControls = &self->_routePickingControls;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);

  if (WeakRetained)
  {
    -[AVRoutePickerView customRoutingController](self, "customRoutingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customActionItems");
    v6 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v6, "count"))
    {
      v22 = self;
      v23 = v6;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = v6;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            _AVLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "type");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "overrideTitle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
              v34 = 2112;
              v35 = v13;
              v36 = 2112;
              v37 = v14;
              v38 = 2112;
              v39 = v15;
              _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Adding custom row with type: %@, titleOverride: %@, identifier: %@", buf, 0x2Au);

            }
            v16 = objc_loadWeakRetained((id *)p_routePickingControls);
            objc_msgSend(v11, "type");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "overrideTitle");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addCustomRowWithType:titleOverride:identifier:", v17, v18, v19);

          }
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v8);
      }

      v20 = objc_loadWeakRetained((id *)p_routePickingControls);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __65__AVRoutePickerView__addCustomRoutingItemsToRoutePickingControls__block_invoke;
      v25[3] = &unk_1E5BB2E90;
      v26 = obj;
      v27 = v22;
      objc_msgSend(v20, "setCustomRowDidTapHandler:", v25);

      v21 = v26;
      v6 = v23;
    }
    else
    {
      _AVLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
        _os_log_impl(&dword_1AC4B1000, v21, OS_LOG_TYPE_DEFAULT, "%s No custom rows to be added to MPMediaControls.", buf, 0xCu);
      }
    }

  }
  else
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Can't add custom rows to MPMediaControls because MPMediaControls instance doesn't exist.", buf, 0xCu);
    }
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(AVPlayer *)player
{
  objc_storeStrong((id *)&self->_player, player);
}

- (BOOL)isRoutePickerButtonBordered
{
  return self->_routePickerButtonBordered;
}

- (void)setRoutePickerButtonBordered:(BOOL)routePickerButtonBordered
{
  self->_routePickerButtonBordered = routePickerButtonBordered;
}

- (AVRoutePickerViewButtonStyle)routePickerButtonStyle
{
  return self->_routePickerButtonStyle;
}

- (void)setRoutePickerButtonStyle:(AVRoutePickerViewButtonStyle)routePickerButtonStyle
{
  self->_routePickerButtonStyle = routePickerButtonStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_routePickingControls);
  objc_storeStrong((id *)&self->_routePickerButtonMicaPackage, 0);
  objc_storeStrong((id *)&self->_customRoutingController, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_buttonHighlightAnimator, 0);
  objc_storeStrong((id *)&self->_customButton, 0);
  objc_storeStrong((id *)&self->_routePickerButton, 0);
  objc_storeStrong((id *)&self->_activeTintColor, 0);
  objc_storeStrong((id *)&self->_getAirPlayStatusQueue, 0);
}

void __65__AVRoutePickerView__addCustomRoutingItemsToRoutePickingControls__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "customRoutingController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleCustomActionItemSelected:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAirPlayActive");
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_customRoutingItemsDidChange");
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAirPlayActive");
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAirPlayActive");
}

void __57__AVRoutePickerView__setRoutePickerButtonAlpha_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[54], "setAlpha:", *(double *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __46__AVRoutePickerView__routePickerButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "routePickerViewDidEndPresentingRoutes:", WeakRetained);

    }
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

@end
