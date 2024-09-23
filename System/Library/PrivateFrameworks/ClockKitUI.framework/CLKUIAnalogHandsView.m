@implementation CLKUIAnalogHandsView

- (id)initForDevice:(id)a3
{
  id v5;
  CLKUIAnalogHandsView *v6;
  CLKUIAnalogHandsView *v7;
  uint64_t v8;
  NSCalendar *calendar;
  uint64_t v10;
  CLKUIHandView *hourHandView;
  uint64_t v12;
  CLKUIHandView *minuteHandView;
  uint64_t v14;
  CLKUIHandView *secondHandView;
  uint64_t v16;
  CLKUIAnalogHandsView *v17;
  uint64_t v18;
  UIView *directionalShadowContainerView;
  CLKUIAnalogHandsView *v20;
  void *v21;
  id v22;
  id WeakRetained;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  CLKUIAnalogHandsView *v39;
  _QWORD v40[4];
  CLKUIAnalogHandsView *v41;
  objc_super v42;

  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CLKUIAnalogHandsView;
  v6 = -[CLKUIAnalogHandsView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v8 = objc_claimAutoreleasedReturnValue();
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    v7->_useDirectionalShadows = -[CLKUIAnalogHandsView useDirectionalShadows](v7, "useDirectionalShadows");
    -[CLKUIAnalogHandsView createHourHandView](v7, "createHourHandView");
    v10 = objc_claimAutoreleasedReturnValue();
    hourHandView = v7->_hourHandView;
    v7->_hourHandView = (CLKUIHandView *)v10;

    -[CLKUIAnalogHandsView createMinuteHandView](v7, "createMinuteHandView");
    v12 = objc_claimAutoreleasedReturnValue();
    minuteHandView = v7->_minuteHandView;
    v7->_minuteHandView = (CLKUIHandView *)v12;

    -[CLKUIAnalogHandsView createSecondHandView](v7, "createSecondHandView");
    v14 = objc_claimAutoreleasedReturnValue();
    secondHandView = v7->_secondHandView;
    v7->_secondHandView = (CLKUIHandView *)v14;

    v16 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __38__CLKUIAnalogHandsView_initForDevice___block_invoke;
    v40[3] = &unk_1E86E07D8;
    v17 = v7;
    v41 = v17;
    -[CLKUIAnalogHandsView _enumerateHandViews:](v17, "_enumerateHandViews:", v40);
    if (v7->_useDirectionalShadows)
    {
      v18 = objc_opt_new();
      directionalShadowContainerView = v17->_directionalShadowContainerView;
      v17->_directionalShadowContainerView = (UIView *)v18;

      v35 = v16;
      v36 = 3221225472;
      v37 = __38__CLKUIAnalogHandsView_initForDevice___block_invoke_2;
      v38 = &unk_1E86E0800;
      v20 = v17;
      v39 = v20;
      -[CLKUIAnalogHandsView _enumerateShadowViews:](v20, "_enumerateShadowViews:", &v35);
      -[CLKUIAnalogHandsView addSubview:](v20, "addSubview:", v17->_directionalShadowContainerView, v35, v36, v37, v38);
      -[CLKUIAnalogHandsView layoutShadowViews](v20, "layoutShadowViews");

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v17, sel__significantTimeChanged, *MEMORY[0x1E0DC4838], 0);

    -[CLKUIAnalogHandsView setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", 0);
    v22 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_4);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
    if (WeakRetained)
    {
      v24 = WeakRetained;
      v25 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
      if (v25 == v22)
      {
        v26 = objc_msgSend(v22, "version");
        v27 = _LayoutConstants___previousCLKDeviceVersion_4;

        if (v26 == v27)
        {
LABEL_9:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_4);
          v30 = _LayoutConstants___constants_0;
          v31 = _LayoutConstants___constants_1;

          *(_QWORD *)&v17->_secondHandDotDiameter = v31;
          *(_QWORD *)&v17->_minuteHandDotDiameter = v30;
          v32 = -[CLKUIAnalogHandsView minuteHandDot](v17, "minuteHandDot");
          v33 = -[CLKUIAnalogHandsView secondHandDot](v17, "secondHandDot");

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    v28 = objc_storeWeak(&_LayoutConstants___cachedDevice_4, v22);
    _LayoutConstants___previousCLKDeviceVersion_4 = objc_msgSend(v22, "version");

    ___LayoutConstants_block_invoke_4(v29, v22);
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

void __38__CLKUIAnalogHandsView_initForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "addSubview:", v3);
  objc_msgSend(v3, "setNeedsLayout");

}

uint64_t __38__CLKUIAnalogHandsView_initForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", a2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  v4.receiver = self;
  v4.super_class = (Class)CLKUIAnalogHandsView;
  -[CLKUIAnalogHandsView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIAnalogHandsView;
  -[CLKUIAnalogHandsView layoutSubviews](&v3, sel_layoutSubviews);
  -[CLKUIAnalogHandsView layoutHandViews](self, "layoutHandViews");
  -[CLKUIAnalogHandsView layoutShadowViews](self, "layoutShadowViews");
}

- (void)layoutHandViews
{
  double v3;
  double v4;
  double v5;
  _QWORD v6[7];

  -[CLKUIAnalogHandsView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[CLKUIAnalogHandsView bounds](self, "bounds");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CLKUIAnalogHandsView_layoutHandViews__block_invoke;
  v6[3] = &unk_1E86E0828;
  v6[4] = self;
  *(double *)&v6[5] = v4;
  *(double *)&v6[6] = v5 * 0.5;
  -[CLKUIAnalogHandsView _enumerateHandViews:](self, "_enumerateHandViews:", v6);
}

void __39__CLKUIAnalogHandsView_layoutHandViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(v5, "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)layoutShadowViews
{
  CLKUIHandView *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CLKUIHandView *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_hourHandView;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CLKUIAnalogHandsView subviews](self, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()))
        {
          v10 = v9;

          v3 = v10;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  -[CLKUIAnalogHandsView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_directionalShadowContainerView, v3);
  -[CLKUIAnalogHandsView _enumerateHandViews:](self, "_enumerateHandViews:", &__block_literal_global_10);

}

void __41__CLKUIAnalogHandsView_layoutShadowViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v2 = a2;
  objc_msgSend(v2, "directionalShadowOffset");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "center");
  v8 = v4 + v7;
  v10 = v6 + v9;
  objc_msgSend(v2, "shadowView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCenter:", v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  CLKSceneSizeForDevice();
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUIAnalogHandsView;
  -[CLKUIAnalogHandsView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[CLKUIAnalogHandsView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CLKUIAnalogHandsView _startNewTimeAnimation](self, "_startNewTimeAnimation");
}

- (void)_enumerateHandViews:(id)a3
{
  id v4;

  v4 = a3;
  -[CLKUIAnalogHandsView _enumerateHourHandViewsWithBlock:](self, "_enumerateHourHandViewsWithBlock:", v4);
  -[CLKUIAnalogHandsView _enumerateMinuteHandViewsWithBlock:](self, "_enumerateMinuteHandViewsWithBlock:", v4);
  if (!self->_secondHandDisabled)
    -[CLKUIAnalogHandsView _enumerateSecondHandViewsWithBlock:](self, "_enumerateSecondHandViewsWithBlock:", v4);

}

- (void)_enumerateShadowViews:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CLKUIAnalogHandsView__enumerateShadowViews___block_invoke;
  v6[3] = &unk_1E86E0890;
  v7 = v4;
  v5 = v4;
  -[CLKUIAnalogHandsView _enumerateHandViews:](self, "_enumerateHandViews:", v6);

}

void __46__CLKUIAnalogHandsView__enumerateShadowViews___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "shadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (id)hourHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:](CLKUIAnalogHandConfiguration, "defaultHourConfigurationForDevice:", self->_device);
}

- (id)minuteHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:](CLKUIAnalogHandConfiguration, "defaultMinuteConfigurationForDevice:", self->_device);
}

- (id)secondHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:](CLKUIAnalogHandConfiguration, "defaultSecondConfigurationForDevice:", self->_device);
}

+ (Class)handViewClass
{
  return (Class)objc_opt_class();
}

- (id)createHourHandView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[CLKUIAnalogHandsView hourHandConfiguration](self, "hourHandConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v5);

  objc_msgSend(v4, "anchorPointFromConfiguration");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (id)createMinuteHandView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[CLKUIAnalogHandsView minuteHandConfiguration](self, "minuteHandConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v5);

  objc_msgSend(v4, "anchorPointFromConfiguration");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (id)createSecondHandView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[CLKUIAnalogHandsView secondHandConfiguration](self, "secondHandConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v5);

  objc_msgSend(v4, "anchorPointFromConfiguration");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (BOOL)useDirectionalShadows
{
  return 1;
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return (double)CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice();
}

- (void)_startNewTimeAnimation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  NSTimer *v14;
  NSTimer *animationUpdateTimer;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD aBlock[4];
  id v31;
  CLKUIAnalogHandsView *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[CLKUIAnalogHandsView _canRunTimeAnimation](self, "_canRunTimeAnimation"))
  {
    v36 = 0;
    v37 = 0;
    v35 = 0;
    -[CLKUIAnalogHandsView displayTime](self, "displayTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CLKHourMinuteSecondAnglesForTime();

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 2139095040;
    objc_msgSend(v4, "setRepeatCount:", v5);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v6);

    -[CLKUIAnalogHandsView _timeAnimationFramesPerSecondForDevice:](self, "_timeAnimationFramesPerSecondForDevice:", self->_device);
    v8 = v7;
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke;
    aBlock[3] = &unk_1E86E08B8;
    v33 = 0x401921FB54442D18;
    v10 = 1.0 / v7;
    v11 = v4;
    v34 = v10;
    v31 = v11;
    v32 = self;
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_2;
    v27[3] = &unk_1E86E08E0;
    v12 = _Block_copy(aBlock);
    v28 = v12;
    v29 = v37;
    -[CLKUIAnalogHandsView _enumerateHourHandViewsWithBlock:](self, "_enumerateHourHandViewsWithBlock:", v27);
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_3;
    v24[3] = &unk_1E86E08E0;
    v13 = v12;
    v25 = v13;
    v26 = v36;
    -[CLKUIAnalogHandsView _enumerateMinuteHandViewsWithBlock:](self, "_enumerateMinuteHandViewsWithBlock:", v24);
    if (!self->_secondHandDisabled)
    {
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_4;
      v21[3] = &unk_1E86E08E0;
      v22 = v13;
      v23 = v35;
      -[CLKUIAnalogHandsView _enumerateSecondHandViewsWithBlock:](self, "_enumerateSecondHandViewsWithBlock:", v21);

    }
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__startNewTimeAnimation, 0, 0, 10.0);
    v14 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = v14;

    kdebug_trace();
    CLKLoggingObjectForDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar timeZone](self->_calendar, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v18;
      v40 = 2048;
      v41 = v8;
      v42 = 2112;
      v43 = v20;
      _os_log_impl(&dword_1CB9A4000, v16, OS_LOG_TYPE_DEFAULT, "%@ started new time animation at %.0fFPS (for the second hand) for timezone: %@", buf, 0x20u);

    }
  }
}

void __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  double v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  if (a4 < 0.0)
    v7 = *(double *)(a1 + 48) + a4;
  v9 = a2;
  objc_msgSend(v9, "setZRotation:", v7);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByValue:", v11);

  objc_msgSend(*(id *)(a1 + 32), "setDuration:", a5);
  objc_msgSend(*(id *)(a1 + 32), "setFrameInterval:", *(double *)(a1 + 56) * a5 / 60.0);
  objc_msgSend(*(id *)(a1 + 32), "setDiscretizesTime:", a3);
  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("time"));

  objc_msgSend(v9, "shadowView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("time"));

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v16, "nominalAnimationStart:forHandView:", v15, v9);

}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 1, *(double *)(a1 + 40), 43200.0);
}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 1, *(double *)(a1 + 40), 3600.0);
}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 0, *(double *)(a1 + 40), 60.0);
}

- (void)_stopTimeAnimation
{
  NSTimer *animationUpdateTimer;
  _QWORD v4[5];

  if (self->_animationUpdateTimer)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke;
    v4[3] = &unk_1E86E07D8;
    v4[4] = self;
    -[CLKUIAnalogHandsView _enumerateHandViews:](self, "_enumerateHandViews:", v4);
    -[CLKUIAnalogHandsView _enumerateShadowViews:](self, "_enumerateShadowViews:", &__block_literal_global_25);
    -[NSTimer invalidate](self->_animationUpdateTimer, "invalidate");
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = 0;

    kdebug_trace();
  }
}

void __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationForKey:", CFSTR("time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "presentationLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "transform");
      objc_msgSend(v4, "setTransform:", &v9);
    }
    objc_msgSend(v4, "removeAnimationForKey:", CFSTR("time"));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nominalAnimationEndForHandView:", v3);

}

void __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("time"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(v3, "removeAnimationForKey:", CFSTR("time"));

}

- (BOOL)_canRunTimeAnimation
{
  BOOL v2;
  void *v3;

  if (self->_frozen)
    return 0;
  -[CLKUIAnalogHandsView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    if (a3)
      -[CLKUIAnalogHandsView _stopTimeAnimation](self, "_stopTimeAnimation");
    else
      -[CLKUIAnalogHandsView _startNewTimeAnimation](self, "_startNewTimeAnimation");
  }
}

- (void)setSecondHandDisabled:(BOOL)a3
{
  if (self->_secondHandDisabled != a3)
  {
    self->_secondHandDisabled = a3;
    -[CLKUIHandView setHidden:](self->_secondHandView, "setHidden:");
  }
}

- (void)applyHourMinuteHandsStrokeColor:(id)a3 fillColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v6);

  -[CLKUIAnalogHandsView setInlayColor:](self, "setInlayColor:", v9);
}

- (void)applySecondHandColor:(id)a3
{
  -[CLKUIHandView setColor:](self->_secondHandView, "setColor:", a3);
}

- (void)setInlayColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_inlayColor, a3);
  v5 = a3;
  -[CLKUIHandView setInlayColor:](self->_hourHandView, "setInlayColor:", v5);
  -[CLKUIHandView setInlayColor:](self->_minuteHandView, "setInlayColor:", v5);
  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandDotColor:", v5);

}

- (void)setUseDirectionalShadows:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  BOOL v7;

  if (self->_useDirectionalShadows != a3)
  {
    self->_useDirectionalShadows = a3;
    v4 = MEMORY[0x1E0C809B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke;
    v6[3] = &__block_descriptor_33_e23_v16__0__CLKUIHandView_8l;
    v7 = a3;
    -[CLKUIAnalogHandsView _enumerateHandViews:](self, "_enumerateHandViews:", v6);
    if (self->_useDirectionalShadows)
    {
      -[CLKUIAnalogHandsView _enumerateShadowViews:](self, "_enumerateShadowViews:", &__block_literal_global_26);
    }
    else
    {
      v5[0] = v4;
      v5[1] = 3221225472;
      v5[2] = __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_3;
      v5[3] = &unk_1E86E0800;
      v5[4] = self;
      -[CLKUIAnalogHandsView _enumerateShadowViews:](self, "_enumerateShadowViews:", v5);
      -[CLKUIAnalogHandsView layoutShadowViews](self, "layoutShadowViews");
    }
  }
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDropShadowsHidden:", *(_BYTE *)(a1 + 32) == 0);
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", a2);
}

- (id)displayTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C94130], "now");
}

- (UIView)directionalShadowContainerView
{
  return self->_directionalShadowContainerView;
}

- (void)setTimeZone:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[NSTimeZone isEqualToTimeZone:](self->_timeZone, "isEqualToTimeZone:", v5))
  {
    CLKLoggingObjectForDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar timeZone](self->_calendar, "timeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CB9A4000, v6, OS_LOG_TYPE_DEFAULT, "%@ received manual timezone update with current timezone: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_storeStrong((id *)&self->_timeZone, a3);
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v5);
    CLKLoggingObjectForDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar timeZone](self->_calendar, "timeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1CB9A4000, v11, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after manual timezone update to: %@", (uint8_t *)&v16, 0x16u);

    }
  }

}

- (void)_enumerateSecondHandViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIHandView *))a3 + 2))(a3, self->_secondHandView);
}

- (void)_enumerateMinuteHandViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIHandView *))a3 + 2))(a3, self->_minuteHandView);
}

- (void)_enumerateHourHandViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIHandView *))a3 + 2))(a3, self->_hourHandView);
}

- (UIView)secondHandDot
{
  void *v3;
  CLKUIHandView *secondHandView;

  -[CLKUIHandView handDotView](self->_secondHandView, "handDotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    secondHandView = self->_secondHandView;
    -[CLKUIAnalogHandsView secondHandDotDiameter](self, "secondHandDotDiameter");
    -[CLKUIHandView setupHandDotViewWithDiameter:](secondHandView, "setupHandDotViewWithDiameter:");
  }
  return -[CLKUIHandView handDotView](self->_secondHandView, "handDotView");
}

- (void)setSecondHandDotDiameter:(double)a3
{
  CLKUIHandView *secondHandView;

  if (self->_secondHandDotDiameter != a3)
  {
    self->_secondHandDotDiameter = a3;
    secondHandView = self->_secondHandView;
    -[CLKUIAnalogHandsView secondHandDotDiameter](self, "secondHandDotDiameter");
    -[CLKUIHandView setupHandDotViewWithDiameter:](secondHandView, "setupHandDotViewWithDiameter:");
  }
}

- (UIView)minuteHandDot
{
  void *v3;
  CLKUIHandView *minuteHandView;

  -[CLKUIHandView handDotView](self->_minuteHandView, "handDotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    minuteHandView = self->_minuteHandView;
    -[CLKUIAnalogHandsView minuteHandDotDiameter](self, "minuteHandDotDiameter");
    -[CLKUIHandView setupHandDotViewWithDiameter:](minuteHandView, "setupHandDotViewWithDiameter:");
    -[CLKUIHandView setHandDotColor:](self->_minuteHandView, "setHandDotColor:", self->_inlayColor);
  }
  return -[CLKUIHandView handDotView](self->_minuteHandView, "handDotView");
}

- (void)setMinuteHandDotDiameter:(double)a3
{
  CLKUIHandView *minuteHandView;

  if (self->_minuteHandDotDiameter != a3)
  {
    self->_minuteHandDotDiameter = a3;
    minuteHandView = self->_minuteHandView;
    -[CLKUIAnalogHandsView minuteHandDotDiameter](self, "minuteHandDotDiameter");
    -[CLKUIHandView setupHandDotViewWithDiameter:](minuteHandView, "setupHandDotViewWithDiameter:");
  }
}

- (void)_significantTimeChanged
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CB9A4000, v4, OS_LOG_TYPE_DEFAULT, "%@ received significant time change with current timezone: %@", (uint8_t *)&v14, 0x16u);

  }
  if (!self->_timeZone)
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v3);
  CLKLoggingObjectForDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1CB9A4000, v9, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after significant time change to: %@", (uint8_t *)&v14, 0x16u);

  }
}

+ (double)hourHandAngleForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a3)
    return 0.0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 224, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hour");
  objc_msgSend(v6, "minute");
  CLKNormalizeAngle();
  v8 = v7;

  return v8;
}

+ (double)minuteHandAngleForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  if (!a3)
    return 0.0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 224, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "minute");
  v8 = ((double)objc_msgSend(v6, "second") / 60.0 + (double)v7) * 6.0;

  return v8;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)isSecondHandDisabled
{
  return self->_secondHandDisabled;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (CLKUIHandView)hourHandView
{
  return self->_hourHandView;
}

- (void)setHourHandView:(id)a3
{
  objc_storeStrong((id *)&self->_hourHandView, a3);
}

- (CLKUIHandView)minuteHandView
{
  return self->_minuteHandView;
}

- (void)setMinuteHandView:(id)a3
{
  objc_storeStrong((id *)&self->_minuteHandView, a3);
}

- (CLKUIHandView)secondHandView
{
  return self->_secondHandView;
}

- (void)setSecondHandView:(id)a3
{
  objc_storeStrong((id *)&self->_secondHandView, a3);
}

- (double)secondHandDotDiameter
{
  return self->_secondHandDotDiameter;
}

- (double)minuteHandDotDiameter
{
  return self->_minuteHandDotDiameter;
}

- (UIColor)inlayColor
{
  return self->_inlayColor;
}

- (CLKUIAnalogHandsViewDelegate)delegate
{
  return (CLKUIAnalogHandsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inlayColor, 0);
  objc_storeStrong((id *)&self->_secondHandView, 0);
  objc_storeStrong((id *)&self->_minuteHandView, 0);
  objc_storeStrong((id *)&self->_hourHandView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_directionalShadowContainerView, 0);
  objc_storeStrong((id *)&self->_animationUpdateTimer, 0);
}

@end
