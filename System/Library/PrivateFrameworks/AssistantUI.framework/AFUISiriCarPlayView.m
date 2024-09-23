@implementation AFUISiriCarPlayView

- (AFUISiriCarPlayView)initWithFrame:(CGRect)a3 viewDelegate:(id)a4 instrumentationHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  AFUISiriCarPlayView *v13;
  AFUISiriCarPlayView *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFUISiriCarPlayView;
  v13 = -[AFUISiriCarPlayView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_mode = 5;
    objc_storeWeak((id *)&v13->_viewDelegate, v11);
    -[AFUISiriCarPlayView setupEdgeLightBackgroundView](v14, "setupEdgeLightBackgroundView");
    -[AFUISiriCarPlayView layer](v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

    -[AFUISiriCarPlayView _setupContentViews](v14, "_setupContentViews");
    objc_storeStrong((id *)&v14->_viewHostingInstrumentationHandler, a5);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[SUICOrbView invalidate](self->_orbView, "invalidate");
  -[CRSUIStatusBarStyleAssertion invalidate](self->_statusBarStyleAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCarPlayView;
  -[AFUISiriCarPlayView dealloc](&v3, sel_dealloc);
}

- (void)removeFromSuperview
{
  CRSUIStatusBarStyleAssertion *statusBarStyleAssertion;
  void *v4;
  CRSUIStatusBarStyleAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUISiriCarPlayView;
  -[AFUISiriCarPlayView removeFromSuperview](&v6, sel_removeFromSuperview);
  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    statusBarStyleAssertion = self->_statusBarStyleAssertion;
    objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIStatusBarStyleAssertion relinquishWithAnimationSettings:](statusBarStyleAssertion, "relinquishWithAnimationSettings:", v4);

    -[CRSUIStatusBarStyleAssertion invalidate](self->_statusBarStyleAssertion, "invalidate");
    v5 = self->_statusBarStyleAssertion;
    self->_statusBarStyleAssertion = 0;

  }
}

- (void)didMoveToWindow
{
  void *v3;
  CRSUIStatusBarStyleAssertion *statusBarStyleAssertion;
  void *v5;
  SUICEdgeLightMaskMetalLayer *edgeLightMask;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFUISiriCarPlayView;
  -[AFUISiriCarPlayView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[AFUISiriCarPlayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
    {
      statusBarStyleAssertion = self->_statusBarStyleAssertion;
      objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRSUIStatusBarStyleAssertion acquireWithAnimationSettings:](statusBarStyleAssertion, "acquireWithAnimationSettings:", v5);

      edgeLightMask = self->_edgeLightMask;
      -[AFUISiriCarPlayView window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICEdgeLightMaskMetalLayer setScreen:](edgeLightMask, "setScreen:", v8);

    }
  }
}

- (void)animateInEdgeLight
{
  unint64_t v3;

  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    v3 = -[SASRequestOptions requestSource](self->_lastRequestOptions, "requestSource");
    if (v3 <= 0x25 && ((1 << v3) & 0x2000006000) != 0)
      -[AFUISiriCarPlayView _animateEdgeLightToOn](self, "_animateEdgeLightToOn");
  }
}

- (void)animateOutEdgeLight
{
  id v3;

  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCarPlayView _updateEdgeLightBackgroundColor:](self, "_updateEdgeLightBackgroundColor:", v3);

  }
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (CGRect)orbViewRectInCarplayView
{
  UIView *orbContainerView;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  orbContainerView = self->_orbContainerView;
  -[SUICOrbView frame](self->_orbView, "frame");
  -[UIView convertRect:toView:](orbContainerView, "convertRect:toView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)siriXIndicatorView
{
  return self->_siriXIndicatorView;
}

- (void)setRemoteContentView:(id)a3
{
  UIView *v5;
  UIView **p_remoteContentView;
  UIView *remoteContentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v5 = (UIView *)a3;
  p_remoteContentView = &self->_remoteContentView;
  remoteContentView = self->_remoteContentView;
  if (remoteContentView != v5)
  {
    if (remoteContentView)
    {
      v8 = (void *)MEMORY[0x24BDD1628];
      -[UIView constraints](remoteContentView, "constraints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deactivateConstraints:", v9);

      -[UIView removeFromSuperview](*p_remoteContentView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_remoteContentView, a3);
    if (*p_remoteContentView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_remoteContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AFUISiriCarPlayView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_remoteContentView, 0);
      v19 = (void *)MEMORY[0x24BDD1628];
      -[UIView topAnchor](*p_remoteContentView, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView topAnchor](self, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[UIView leadingAnchor](*p_remoteContentView, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView leadingAnchor](self, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v11;
      -[UIView trailingAnchor](*p_remoteContentView, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView trailingAnchor](self, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v14;
      -[UIView bottomAnchor](*p_remoteContentView, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView bottomAnchor](self, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activateConstraints:", v18);

    }
  }

}

- (void)setSiriSessionState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_siriSessionState != a3)
  {
    v5 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      SRUIFSiriSessionStateGetDescription();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SRUIFSiriSessionStateGetDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[AFUISiriCarPlayView setSiriSessionState:]";
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s session state %@ -> %@", (uint8_t *)&v9, 0x20u);

    }
    self->_siriSessionState = a3;
    if (AFDeviceSupportsSystemAssistantExperience())
      -[AFUISiriCarPlayView _updateEdgeLightToMatchSessionState:](self, "_updateEdgeLightToMatchSessionState:", a3);
    else
      -[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState](self, "_updateOrbViewModeToMatchSessionState");
  }
}

- (void)resetOrbViewToSiriSessionState
{
  if (self->_siriSessionState || -[SUICOrbView mode](self->_orbView, "mode"))
    -[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState](self, "_updateOrbViewModeToMatchSessionState");
}

- (void)_updateOrbViewModeToMatchSessionState
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUICOrbView mode](self->_orbView, "mode");
  v4 = -[AFUISiriCarPlayView _orbViewModeForCurrentSessionState](self, "_orbViewModeForCurrentSessionState");
  v5 = (void *)*MEMORY[0x24BE08FB0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      v7 = v5;
      -[AFUISiriCarPlayView _SUICOrbViewModeGetDescription:](self, "_SUICOrbViewModeGetDescription:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode stays at %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    if (v6)
    {
      v9 = v5;
      -[AFUISiriCarPlayView _SUICOrbViewModeGetDescription:](self, "_SUICOrbViewModeGetDescription:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView _SUICOrbViewModeGetDescription:](self, "_SUICOrbViewModeGetDescription:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState]";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode %@ -> %@", (uint8_t *)&v12, 0x20u);

    }
    -[SUICOrbView setMode:](self->_orbView, "setMode:", v4);
  }
}

- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  void *v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  v5 = a3;
  -[SUICOrbView alpha](self->_orbView, "alpha");
  if (v5)
  {
    if (v7 == 0.0)
      return;
    -[UIView layer](self->_orbContainerView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsHitTesting:", 0);

  }
  else if (v7 == 1.0)
  {
    return;
  }
  v9 = 0.200000003;
  if (!v4)
    v9 = 0.0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke;
  v12[3] = &unk_24D7A1A90;
  v12[4] = self;
  v13 = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke_2;
  v10[3] = &unk_24D7A37D8;
  v11 = v5;
  v10[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v12, v10, v9);
}

uint64_t __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", v1);
}

void __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "layer");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setAllowsHitTesting:", 1);

  }
}

- (void)setSiriContentDelegate:(id)a3
{
  AFUISiriContentDelegate **p_siriContentDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_siriContentDelegate = &self->_siriContentDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_siriContentDelegate, obj);
    v6 = obj;
  }

}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  UIView *siriXIndicatorView;
  id v4;

  siriXIndicatorView = self->_siriXIndicatorView;
  AFUISiriRequestHandlingStatusColor(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](siriXIndicatorView, "setBackgroundColor:", v4);

}

- (void)setupEdgeLightBackgroundView
{
  AFUITouchPassThroughView *v3;
  AFUITouchPassThroughView *edgeLightBackgroundView;
  void *v5;
  void *v6;

  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    v3 = objc_alloc_init(AFUITouchPassThroughView);
    edgeLightBackgroundView = self->_edgeLightBackgroundView;
    self->_edgeLightBackgroundView = v3;

    -[AFUITouchPassThroughView setFrame:](self->_edgeLightBackgroundView, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AFUITouchPassThroughView layer](self->_edgeLightBackgroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITouchPassThroughView setBackgroundColor:](self->_edgeLightBackgroundView, "setBackgroundColor:", v6);

    -[AFUITouchPassThroughView setAutoresizingMask:](self->_edgeLightBackgroundView, "setAutoresizingMask:", 18);
    -[AFUISiriCarPlayView addSubview:](self, "addSubview:", self->_edgeLightBackgroundView);
  }
}

- (void)initializeEdgeLightForRequest:(id)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_lastRequestOptions, a3);
  v5 = objc_msgSend(v9, "requestSource");
  v6 = objc_msgSend(v9, "isRightHandDrive");
  v7 = 5;
  if (v6)
    v7 = 6;
  if (v5 == 14)
    v8 = 0;
  else
    v8 = v7;
  -[SUICEdgeLightMaskMetalLayer setBurstStartPosition:](self->_edgeLightMask, "setBurstStartPosition:", v8);
  self->_edgeLightOffAndInitialized = 1;

}

- (void)_updateEdgeLightToMatchSessionState:(int64_t)a3
{
  if (a3 == 1 && self->_edgeLightOffAndInitialized)
  {
    -[AFUISiriCarPlayView _animateEdgeLightToOn](self, "_animateEdgeLightToOn");
    goto LABEL_7;
  }
  if (a3 != 2)
  {
LABEL_7:
    if (!-[UIView isHidden](self->_latencyLightView, "isHidden"))
      -[AFUISiriCarPlayView _animateLatencyLightToOff](self, "_animateLatencyLightToOff");
    return;
  }
  if (-[UIView isHidden](self->_latencyLightView, "isHidden"))
    -[AFUISiriCarPlayView _animateLatencyLightToOn](self, "_animateLatencyLightToOn");
}

- (void)_animateEdgeLightToOn
{
  SUICEdgeLightMaskMetalLayer *edgeLightMask;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_edgeLightOffAndInitialized)
  {
    self->_edgeLightOffAndInitialized = 0;
    objc_initWeak(&location, self);
    edgeLightMask = self->_edgeLightMask;
    v4 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke;
    v8[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v9, &location);
    -[SUICEdgeLightMaskMetalLayer animateOnWithCompletion:](edgeLightMask, "animateOnWithCompletion:", v8);
    v5 = (void *)MEMORY[0x24BEBDB00];
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke_2;
    v6[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "animateWithDuration:animations:", v6, 0.419999987);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[65], "appearanceDidChange:machAbsoluteTime:", 1, mach_absolute_time());
    WeakRetained = v2;
  }

}

void __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateEdgeLightBackgroundColor:", v1);

}

- (void)_animateEdgeLightToOffWithCompletion:(id)a3
{
  self->_edgeLightOffAndInitialized = 0;
  -[SUICEdgeLightMaskMetalLayer animateOffWithCompletion:](self->_edgeLightMask, "animateOffWithCompletion:", a3);
}

- (void)_animateLatencyLightToOn
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[UIView setAlpha:](self->_latencyLightView, "setAlpha:", 0.0);
  -[UIView setHidden:](self->_latencyLightView, "setHidden:", 0);
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBDB00];
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke;
  v7[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v8, &location);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke_2;
  v5[3] = &unk_24D7A1AE0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v7, v5, 0.419999987);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[60], "setAlpha:", 1.0);

}

void __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setFlameScaleMin:max:", 0.0500000007, 0.300000012);

}

- (void)_animateLatencyLightToOff
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BEBDB00];
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke;
  v6[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke_2;
  v4[3] = &unk_24D7A1AE0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v4, 0.419999987);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[60], "setAlpha:", 0.0);

}

void __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke_2(uint64_t a1)
{
  id *v1;
  id v2;
  id *WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[60], "setAlpha:", 0.0);
  objc_msgSend(WeakRetained[60], "setHidden:", 0);
  v2 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "_setFlameScaleMin:max:", 0.150000006, 0.400000006);

}

- (void)_updateEdgeLightBackgroundColor:(id)a3
{
  -[AFUITouchPassThroughView setBackgroundColor:](self->_edgeLightBackgroundView, "setBackgroundColor:", a3);
}

- (void)_orbTappedWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v4, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[AFUISiriCarPlayView _orbTappedWithGestureRecognizer:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Tapped State %@", (uint8_t *)&v10, 0x16u);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    objc_msgSend(WeakRetained, "siriContentDidReceiveOrbTappedAction:", self);

  }
}

- (void)_orbHeldWithGestureRecognizer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "state");
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[AFUISiriCarPlayView _orbHeldWithGestureRecognizer:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Held State %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    objc_msgSend(WeakRetained, "siriContentDidReceiveOrbHoldDidBeginAction:", self);
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    objc_msgSend(WeakRetained, "siriContentDidReceiveOrbHoldDidEndAction:", self);
  }

}

- (void)_setupContentViews
{
  id v3;
  UIView *v4;
  UIView *siriXIndicatorView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    -[AFUISiriCarPlayView _setupEdgeLightView](self, "_setupEdgeLightView");
    -[AFUISiriCarPlayView _setupLatencyLightView](self, "_setupLatencyLightView");
  }
  else
  {
    -[AFUISiriCarPlayView _setupOrbView](self, "_setupOrbView");
  }
  if (+[AFUIUtilities shouldShowSiriXIndicator](AFUIUtilities, "shouldShowSiriXIndicator"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    siriXIndicatorView = self->_siriXIndicatorView;
    self->_siriXIndicatorView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_siriXIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_siriXIndicatorView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 2.5);

    -[UIView layer](self->_siriXIndicatorView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsHitTesting:", 0);

    -[AFUISiriCarPlayView setRequestHandlingStatus:](self, "setRequestHandlingStatus:", 0);
    -[AFUISiriCarPlayView addSubview:](self, "addSubview:", self->_siriXIndicatorView);
    -[UIView leadingAnchor](self->_siriXIndicatorView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCarPlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 5.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    -[UIView bottomAnchor](self->_siriXIndicatorView, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCarPlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -5.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    -[UIView widthAnchor](self->_siriXIndicatorView, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 5.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    -[UIView heightAnchor](self->_siriXIndicatorView, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 5.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v16);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
  }
}

- (void)_setFlameScaleMin:(double)a3 max:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  int v18;
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "carPlayPrimaryScreenPhysicalSize");
  v9 = v8;
  v11 = v10;

  v13 = v9 * v11;
  if (v13 < 1.0)
  {
    LODWORD(v12) = 1051931443;
    -[SUICEdgeLightMaskMetalLayer setFlameScale:](self->_edgeLightMask, "setFlameScale:", v12);
  }
  v14 = fmin((v13 + -10000.0) / -12000.0 + 1.0, 1.0);
  if (v14 < 0.0)
    v14 = 0.0;
  v15 = (a4 - a3) * v14 + a3;
  v16 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "-[AFUISiriCarPlayView _setFlameScaleMin:max:]";
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = v15;
    _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s CarPlay primary screen area %f. Scaling flames to: %f", (uint8_t *)&v18, 0x20u);
  }
  *(float *)&v17 = v15;
  -[SUICEdgeLightMaskMetalLayer setFlameScale:](self->_edgeLightMask, "setFlameScale:", v17);
}

- (void)_setupEdgeLightView
{
  SUICEdgeLightMaskMetalLayer *v3;
  SUICEdgeLightMaskMetalLayer *edgeLightMask;
  SUICEdgeLightMaskMetalLayer *v5;
  id v6;
  UIView *v7;
  UIView *systemLightView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRSUIStatusBarStyleAssertion *v24;
  CRSUIStatusBarStyleAssertion *statusBarStyleAssertion;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BYTE v32[80];
  _QWORD v33[4];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v3 = (SUICEdgeLightMaskMetalLayer *)objc_opt_new();
  edgeLightMask = self->_edgeLightMask;
  self->_edgeLightMask = v3;

  -[SUICEdgeLightMaskMetalLayer setAllowsHitTesting:](self->_edgeLightMask, "setAllowsHitTesting:", 0);
  v5 = self->_edgeLightMask;
  -[AFUISiriCarPlayView frame](self, "frame");
  -[SUICEdgeLightMaskMetalLayer setFrame:](v5, "setFrame:");
  -[SUICEdgeLightMaskMetalLayer setUserInterfaceIdiom:](self->_edgeLightMask, "setUserInterfaceIdiom:", 3);
  -[AFUISiriCarPlayView _setFlameScaleMin:max:](self, "_setFlameScaleMin:max:", 0.150000006, 0.400000006);
  -[SUICEdgeLightMaskMetalLayer setCompositingFilter:](self->_edgeLightMask, "setCompositingFilter:", *MEMORY[0x24BDE5B98]);
  v6 = objc_alloc(MEMORY[0x24BEBDC70]);
  -[AFUISiriCarPlayView bounds](self, "bounds");
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:preferringAudioReactivity:", 1);
  systemLightView = self->_systemLightView;
  self->_systemLightView = v7;

  -[UIView setUserInteractionEnabled:](self->_systemLightView, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->_systemLightView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1968];
  CAColorMatrixMakeMultiplyColor();
  objc_msgSend(v11, "valueWithCAColorMatrix:", v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v12, *MEMORY[0x24BDE5AD8]);

  objc_msgSend(v10, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5A98]);
  v34[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v13);

  objc_msgSend(v9, "setOpaque:", 0);
  objc_msgSend(v9, "setAllowsHitTesting:", 0);
  v31 = v9;
  objc_msgSend(v9, "addSublayer:", self->_edgeLightMask);
  -[AFUISiriCarPlayView addSubview:](self, "addSubview:", self->_systemLightView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_systemLightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (void *)MEMORY[0x24BDBCEB8];
  -[UIView bottomAnchor](self->_systemLightView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  -[UIView topAnchor](self->_systemLightView, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView topAnchor](self, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  -[UIView leadingAnchor](self->_systemLightView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v18;
  -[UIView trailingAnchor](self->_systemLightView, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v23);
  if (!self->_statusBarStyleAssertion)
  {
    v24 = (CRSUIStatusBarStyleAssertion *)objc_msgSend(objc_alloc(MEMORY[0x24BE15428]), "initForSiriPresentation");
    statusBarStyleAssertion = self->_statusBarStyleAssertion;
    self->_statusBarStyleAssertion = v24;

  }
}

- (void)_setupLatencyLightView
{
  _TtC11AssistantUI26AFUISiriCarPlayLatencyView *v3;
  UIView *latencyLightView;
  UIView *v5;
  void *v6;

  v3 = objc_alloc_init(_TtC11AssistantUI26AFUISiriCarPlayLatencyView);
  latencyLightView = self->_latencyLightView;
  self->_latencyLightView = &v3->super;

  v5 = self->_latencyLightView;
  -[AFUISiriCarPlayView bounds](self, "bounds");
  -[UIView setFrame:](v5, "setFrame:");
  -[UIView setAutoresizingMask:](self->_latencyLightView, "setAutoresizingMask:", 18);
  -[UIView setHidden:](self->_latencyLightView, "setHidden:", 1);
  -[UIView layer](self->_latencyLightView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsHitTesting:", 0);

  -[AFUISiriCarPlayView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_latencyLightView, self->_systemLightView);
}

- (void)_setupOrbView
{
  UIView *v3;
  UIView *orbContainerView;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SUICOrbView *v17;
  SUICOrbView *orbView;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[10];

  v47[8] = *MEMORY[0x24BDAC8D0];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  orbContainerView = self->_orbContainerView;
  self->_orbContainerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_orbContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](self->_orbContainerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  -[AFUISiriCarPlayView addSubview:](self, "addSubview:", self->_orbContainerView);
  objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  UISizeRoundToScale();
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__orbHeldWithGestureRecognizer_);
  objc_msgSend(v11, "setMinimumPressDuration:", 0.25);
  v46 = v11;
  -[UIView addGestureRecognizer:](self->_orbContainerView, "addGestureRecognizer:", v11);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__orbTappedWithGestureRecognizer_);
  objc_msgSend(v45, "requireGestureRecognizerToFail:", v11);
  -[UIView addGestureRecognizer:](self->_orbContainerView, "addGestureRecognizer:", v45);
  objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  UISizeRoundToScale();
  v14 = v13;
  v16 = v15;

  v17 = (SUICOrbView *)objc_msgSend(objc_alloc(MEMORY[0x24BEA85D8]), "initWithFrame:", 0.0, 0.0, v14, v16);
  orbView = self->_orbView;
  self->_orbView = v17;

  -[SUICOrbView setTranslatesAutoresizingMaskIntoConstraints:](self->_orbView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SUICOrbView layer](self->_orbView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsHitTesting:", 0);

  -[UIView addSubview:](self->_orbContainerView, "addSubview:", self->_orbView);
  v35 = (void *)MEMORY[0x24BDBCEB8];
  -[UIView bottomAnchor](self->_orbContainerView, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -12.5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v41;
  -[UIView centerXAnchor](self->_orbContainerView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v37;
  -[UIView widthAnchor](self->_orbContainerView, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToConstant:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v34;
  -[UIView heightAnchor](self->_orbContainerView, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToConstant:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v32;
  -[SUICOrbView centerYAnchor](self->_orbView, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_orbContainerView, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v20;
  -[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_orbContainerView, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v23;
  -[SUICOrbView widthAnchor](self->_orbView, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v25;
  -[SUICOrbView heightAnchor](self->_orbView, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arrayWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v29);
}

- (id)_SUICOrbViewModeGetDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Off");
  else
    return off_24D7A37F8[a3 - 1];
}

- (void)updateVolumeInputdB:(float)a3
{
  -[SUICEdgeLightMaskMetalLayer updateVolumeInputdB:](self->_edgeLightMask, "updateVolumeInputdB:");
}

- (int64_t)_orbViewModeForCurrentSessionState
{
  void *v2;
  int64_t siriSessionState;
  id WeakRetained;
  int64_t v5;

  v2 = (void *)MEMORY[0x24BEA6290];
  siriSessionState = self->_siriSessionState;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
  v5 = objc_msgSend(v2, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "requestSessionAttendingState"));

  return v5;
}

- (void)setInputPowerLevel:(float)a3
{
  double v5;

  if (-[SUICOrbView mode](self->_orbView, "mode") == 1)
  {
    *(float *)&v5 = a3;
    -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:", v5);
  }
}

- (void)setOutputPowerLevel:(float)a3
{
  double v5;

  if (-[SUICOrbView mode](self->_orbView, "mode") == 3)
  {
    *(float *)&v5 = a3;
    -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:", v5);
  }
}

- (void)animateOrbViewToOffWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SUICOrbView *orbView;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[AFUISiriCarPlayView _deviceSupportsAI](self, "_deviceSupportsAI"))
  {
    -[AFUISiriCarPlayView _animateEdgeLightToOffWithCompletion:](self, "_animateEdgeLightToOffWithCompletion:", v4);
  }
  else
  {
    v5 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      orbView = self->_orbView;
      v7 = v5;
      -[AFUISiriCarPlayView _SUICOrbViewModeGetDescription:](self, "_SUICOrbViewModeGetDescription:", -[SUICOrbView mode](orbView, "mode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriCarPlayView _SUICOrbViewModeGetDescription:](self, "_SUICOrbViewModeGetDescription:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[AFUISiriCarPlayView animateOrbViewToOffWithCompletion:]";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode %@ -> %@", (uint8_t *)&v10, 0x20u);

    }
    -[SUICOrbView animateToOffWithCompletion:](self->_orbView, "animateToOffWithCompletion:", v4);
  }

}

- (void)setContentViewsAlpha:(double)a3
{
  -[UIView setAlpha:](self->_remoteContentView, "setAlpha:", a3);
}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeLightBackgroundView, 0);
  objc_storeStrong((id *)&self->_lastRequestOptions, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong((id *)&self->_siriXIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_orbContainerView, 0);
  objc_storeStrong((id *)&self->_latencyLightView, 0);
  objc_storeStrong((id *)&self->_systemLightView, 0);
  objc_storeStrong((id *)&self->_edgeLightMask, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
  objc_storeStrong((id *)&self->_remoteContentView, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_destroyWeak((id *)&self->_siriContentDelegate);
}

@end
