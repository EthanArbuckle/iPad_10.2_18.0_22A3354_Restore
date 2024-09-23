@implementation AFUISiriSAEEffectsViewController

+ (id)sharedSiriUISettingsDefaults
{
  if (sharedSiriUISettingsDefaults_onceToken != -1)
    dispatch_once(&sharedSiriUISettingsDefaults_onceToken, &__block_literal_global_6);
  return (id)sharedSiriUISettingsDefaults_defaults;
}

void __64__AFUISiriSAEEffectsViewController_sharedSiriUISettingsDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  v1 = (void *)sharedSiriUISettingsDefaults_defaults;
  sharedSiriUISettingsDefaults_defaults = v0;

}

- (AFUISiriSAEEffectsViewController)initWithInstrumentationHandler:(id)a3
{
  id v5;
  AFUISiriSAEEffectsViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFUISiriSAEEffectsViewController;
  v6 = -[AFUISiriSAEEffectsViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v6->_supportsSAE = AFDeviceSupportsSystemAssistantExperience();
    objc_storeStrong((id *)&v6->_viewHostingInstrumentationHandler, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_thermalStateDidChange_, *MEMORY[0x24BDD1168], 0);

    +[AFUISiriSAEEffectsViewController sharedSiriUISettingsDefaults](AFUISiriSAEEffectsViewController, "sharedSiriUISettingsDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("DisableShockwave"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_disableShockwaveInternalPref = objc_msgSend(v9, "intValue");
    objc_msgSend(v8, "valueForKey:", CFSTR("ForceOrbGraphic"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "intValue"))
      v6->_supportsSAE = 0;

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISiriSAEEffectsViewController;
  -[AFUISiriSAEEffectsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[AFUISiriSAEEffectsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int disableShockwaveInternalPref;
  void *v14;

  -[AFUISiriSAEEffectsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  disableShockwaveInternalPref = self->_disableShockwaveInternalPref;
  if (!disableShockwaveInternalPref)
  {
    -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);

    disableShockwaveInternalPref = self->_disableShockwaveInternalPref;
  }
  if (disableShockwaveInternalPref == 2)
  {
    LODWORD(v12) = 0.5;
    -[SUICEdgeLightMaskMetalLayer setBurstOpacity:](self->_edgeLightMask, "setBurstOpacity:", v12);
  }
  -[SUICEdgeLightMaskMetalLayer setFrame:](self->_edgeLightMask, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_systemLightView, "setFrame:", v5, v7, v9, v11);
}

- (void)setupShockwaveIsButtonInvocation:(BOOL)a3
{
  _BOOL8 v3;
  os_log_t *v5;
  NSObject *v6;
  _BOOL4 supportsSAE;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int *v18;
  objc_class *v19;
  id v20;
  SUIAShockwaveViewController *v21;
  SUIAShockwaveViewController *shockwaveViewController;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    supportsSAE = self->_supportsSAE;
    v26 = 136315650;
    v27 = "-[AFUISiriSAEEffectsViewController setupShockwaveIsButtonInvocation:]";
    v28 = 1024;
    v29 = v3;
    v30 = 1024;
    v31 = supportsSAE;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController setup shockwave and edge light, isButtonInvocation: %d, _supportsSAE: %d", (uint8_t *)&v26, 0x18u);
  }
  if (self->_supportsSAE && !self->_shockwaveViewController && !self->_systemLightView)
  {
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315138;
      v27 = "-[AFUISiriSAEEffectsViewController setupShockwaveIsButtonInvocation:]";
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController supportsSAE and showSensitiveUI", (uint8_t *)&v26, 0xCu);
    }
    -[AFUISiriSAEEffectsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    if (!self->_disableShockwaveInternalPref)
    {
      -[AFUISiriSAEEffectsViewController _setupShockwaveWithBounds:](self, "_setupShockwaveWithBounds:", v11, v13, v15, v17);
      v18 = &OBJC_IVAR___AFUISiriSAEEffectsViewController__edgeShockWaveStyle;
      if (v3)
        v18 = &OBJC_IVAR___AFUISiriSAEEffectsViewController__buttonShockWaveStyle;
      v19 = (objc_class *)MEMORY[0x24BEB3728];
      v20 = *(id *)((char *)&self->super.super.super.isa + *v18);
      v21 = (SUIAShockwaveViewController *)objc_msgSend([v19 alloc], "initWithStyle:", v20);
      shockwaveViewController = self->_shockwaveViewController;
      self->_shockwaveViewController = v21;

      -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v11, v13, v15, v17);

      -[AFUISiriSAEEffectsViewController addChildViewController:](self, "addChildViewController:", self->_shockwaveViewController);
      -[AFUISiriSAEEffectsViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSubview:", v25);

      -[SUIAShockwaveViewController didMoveToParentViewController:](self->_shockwaveViewController, "didMoveToParentViewController:", self);
    }
    -[AFUISiriSAEEffectsViewController _setupEdgeLightWithFrame:isButtonInvocation:](self, "_setupEdgeLightWithFrame:isButtonInvocation:", v3, v11, v13, v15, v17);
    -[AFUISiriSAEEffectsViewController processCurrentThermalState](self, "processCurrentThermalState");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)startShockWaveHintState
{
  NSObject *v3;
  SUIAShockwaveViewController *shockwaveViewController;
  int v5;
  const char *v6;
  __int16 v7;
  SUIAShockwaveViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_disableShockwaveInternalPref)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      shockwaveViewController = self->_shockwaveViewController;
      v5 = 136315394;
      v6 = "-[AFUISiriSAEEffectsViewController startShockWaveHintState]";
      v7 = 2112;
      v8 = shockwaveViewController;
      _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController startShockWaveHintState, shockwaveViewController: %@", (uint8_t *)&v5, 0x16u);
    }
    -[SUIAShockwaveViewController setState:animated:recommendedNextAction:completion:](self->_shockwaveViewController, "setState:animated:recommendedNextAction:completion:", 1, 1, 0, 0);
  }
}

- (void)transitionToAnimatingState
{
  NSObject *v3;
  SUIAShockwaveViewController *shockwaveViewController;
  SUICEdgeLightMaskMetalLayer *edgeLightMask;
  SUICEdgeLightMaskMetalLayer *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SUIAShockwaveViewController *v12;
  __int16 v13;
  SUICEdgeLightMaskMetalLayer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    shockwaveViewController = self->_shockwaveViewController;
    edgeLightMask = self->_edgeLightMask;
    *(_DWORD *)buf = 136315650;
    v10 = "-[AFUISiriSAEEffectsViewController transitionToAnimatingState]";
    v11 = 2112;
    v12 = shockwaveViewController;
    v13 = 2112;
    v14 = edgeLightMask;
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController transition to shockwave animating state, shockWaveViewController: %@, edgeLight: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v6 = self->_edgeLightMask;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__AFUISiriSAEEffectsViewController_transitionToAnimatingState__block_invoke;
  v7[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v8, (id *)buf);
  -[SUICEdgeLightMaskMetalLayer animateOnWithCompletion:](v6, "animateOnWithCompletion:", v7);
  if (!self->_disableShockwaveInternalPref)
    -[AFUISiriSAEEffectsViewController _goToNextShockwaveState:](self, "_goToNextShockwaveState:", 2);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __62__AFUISiriSAEEffectsViewController_transitionToAnimatingState__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[128], "appearanceDidChange:machAbsoluteTime:", 1, mach_absolute_time());
    WeakRetained = v2;
  }

}

- (void)playShockWaveSkipHintState
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_disableShockwaveInternalPref)
  {
    -[SUIAShockwaveViewController setState:](self->_shockwaveViewController, "setState:", 1);
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __62__AFUISiriSAEEffectsViewController_playShockWaveSkipHintState__block_invoke;
    v3[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __62__AFUISiriSAEEffectsViewController_playShockWaveSkipHintState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "transitionToAnimatingState");
    WeakRetained = v2;
  }

}

- (id)edgeLightMaskMetalLayerForView:(id)a3
{
  return self->_edgeLightMask;
}

- (id)systemLightViewForView:(id)a3
{
  return self->_systemLightView;
}

- (void)insertEyesFreeView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AFUISiriSAEEffectsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[AFUISiriSAEEffectsViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:atIndex:", v4, 0);

}

- (void)_setupShockwaveWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  SUIAShockwaveStyle *v12;
  SUIAShockwaveStyle *buttonShockWaveStyle;
  SUIAShockwaveStyle *v14;
  SUIAShockwaveStyle *edgeShockWaveStyle;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    -[AFUISiriSAEEffectsViewController buttonHWRectForLockButtonOnEmbeddedDisplay](self, "buttonHWRectForLockButtonOnEmbeddedDisplay");
    v12 = (SUIAShockwaveStyle *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3710]), "initWithNormalizedButtonEdgeLocation:shockwaveViewBounds:", v8, v9, v10, v11, x, y, width, height);
    buttonShockWaveStyle = self->_buttonShockWaveStyle;
    self->_buttonShockWaveStyle = v12;

    v14 = (SUIAShockwaveStyle *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3718]), "initWithEdge:shockwaveViewBounds:", 4, x, y, width, height);
    edgeShockWaveStyle = self->_edgeShockWaveStyle;
    self->_edgeShockWaveStyle = v14;

  }
}

- (id)_createEdgeLightEDRLayer
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[AFUISiriSAEEffectsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v3, "setAllowsHitTesting:", 0);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", &unk_24D7B59B8, *MEMORY[0x24BDE5AA8]);
  objc_msgSend(v6, "setValue:forKey:", &unk_24D7B5A08, *MEMORY[0x24BDE5B38]);
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5A98]);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v7);

  objc_msgSend(v3, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
  return v3;
}

- (void)_setupEdgeLightWithFrame:(CGRect)a3 isButtonInvocation:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  SUICEdgeLightMaskMetalLayer *v10;
  SUICEdgeLightMaskMetalLayer *edgeLightMask;
  UIView *v12;
  UIView *systemLightView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v10 = (SUICEdgeLightMaskMetalLayer *)objc_opt_new();
  edgeLightMask = self->_edgeLightMask;
  self->_edgeLightMask = v10;

  -[SUICEdgeLightMaskMetalLayer setName:](self->_edgeLightMask, "setName:", CFSTR("EdgeLightMask"));
  -[SUICEdgeLightMaskMetalLayer setAllowsHitTesting:](self->_edgeLightMask, "setAllowsHitTesting:", 0);
  -[SUICEdgeLightMaskMetalLayer setFrame:](self->_edgeLightMask, "setFrame:", x, y, width, height);
  -[SUICEdgeLightMaskMetalLayer setCompositingFilter:](self->_edgeLightMask, "setCompositingFilter:", *MEMORY[0x24BDE5B98]);
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDC70]), "initWithFrame:preferringAudioReactivity:", 1, x, y, width, height);
  systemLightView = self->_systemLightView;
  self->_systemLightView = v12;

  -[UIView setUserInteractionEnabled:](self->_systemLightView, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->_systemLightView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD1968];
  CAColorMatrixMakeMultiplyColor();
  objc_msgSend(v16, "valueWithCAColorMatrix:", &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v17, *MEMORY[0x24BDE5AD8]);

  objc_msgSend(v15, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5A98]);
  v23[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilters:", v18);

  LODWORD(v19) = 2.0;
  objc_msgSend(v14, "setGain:", v19);
  objc_msgSend(v14, "setOpaque:", 0);
  objc_msgSend(v14, "setAllowsHitTesting:", 0);
  objc_msgSend(v14, "addSublayer:", self->_edgeLightMask);
  -[AFUISiriSAEEffectsViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_systemLightView);

  if (v4)
    v21 = 1;
  else
    v21 = 2;
  -[SUICEdgeLightMaskMetalLayer setBurstStartPosition:](self->_edgeLightMask, "setBurstStartPosition:", v21);

}

- (void)_goToNextShockwaveState:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12[2];
  _QWORD v13[4];
  id v14;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__AFUISiriSAEEffectsViewController__goToNextShockwaveState___block_invoke;
  v13[3] = &unk_24D7A1BF8;
  objc_copyWeak(&v14, &location);
  v6 = (void *)MEMORY[0x219A0D984](v13);
  v8 = v5;
  v9 = 3221225472;
  v10 = __60__AFUISiriSAEEffectsViewController__goToNextShockwaveState___block_invoke_2;
  v11 = &unk_24D7A2D80;
  v12[1] = (id)a3;
  objc_copyWeak(v12, &location);
  v7 = (void *)MEMORY[0x219A0D984](&v8);
  -[SUIAShockwaveViewController setState:animated:recommendedNextAction:completion:](self->_shockwaveViewController, "setState:animated:recommendedNextAction:completion:", a3, a3 != 0, v6, v7, v8, v9, v10, v11);

  objc_destroyWeak(v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__AFUISiriSAEEffectsViewController__goToNextShockwaveState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_goToNextShockwaveState:", a2);

}

void __60__AFUISiriSAEEffectsViewController__goToNextShockwaveState___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;
  id *WeakRetained;
  void *v6;
  id v7;
  id *v8;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = v1 > 5;
  v3 = (1 << v1) & 0x2C;
  if (!v2 && v3 != 0)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      objc_msgSend(WeakRetained[127], "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      objc_msgSend(v8[127], "willMoveToParentViewController:", 0);
      objc_msgSend(v8[127], "removeFromParentViewController");
      v7 = v8[127];
      v8[127] = 0;

      WeakRetained = v8;
    }

  }
}

- (CGRect)buttonHWRectForLockButtonOnEmbeddedDisplay
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD block[5];
  CGRect v32;
  CGRect v33;
  CGRect result;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __AUIGetCGRectAnswer_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = CFSTR("UserIntentPhysicalButtonNormalizedCGRect");
  if (AUIGetCGRectAnswer_onceToken != -1)
    dispatch_once(&AUIGetCGRectAnswer_onceToken, block);
  if (AUIGetCGRectAnswer_cgRectData)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", objc_msgSend((id)AUIGetCGRectAnswer_cgRectData, "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "CGRectValue");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    if (CGRectEqualToRect(v32, *MEMORY[0x24BDBF090])
      || (v33.origin.x = v4, v33.origin.y = v6, v33.size.width = v8, v33.size.height = v10, CGRectIsNull(v33)))
    {
      v11 = *MEMORY[0x24BE08FB0];
      v4 = 1.0;
      v8 = 0.0;
      v6 = 0.3;
      v10 = 0.075;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[AFUISiriSAEEffectsViewController buttonHWRectForLockButtonOnEmbeddedDisplay].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    v19 = *MEMORY[0x24BE08FB0];
    v4 = 1.0;
    v8 = 0.0;
    v6 = 0.3;
    v10 = 0.075;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUISiriSAEEffectsViewController buttonHWRectForLockButtonOnEmbeddedDisplay].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  v27 = v4;
  v28 = v6;
  v29 = v8;
  v30 = v10;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)processCurrentThermalState
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "thermalState");

  if (v4 < 2)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[AFUISiriSAEEffectsViewController processCurrentThermalState]";
      _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController Edge Light Mask exiting performance mode due to decreased thermal pressure", (uint8_t *)&v8, 0xCu);
    }
    -[SUICEdgeLightMaskMetalLayer endReducedFramerateForPerformance](self->_edgeLightMask, "endReducedFramerateForPerformance");
  }
  else if (v4 - 2 > 1)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[AFUISiriSAEEffectsViewController processCurrentThermalState]";
      _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController Edge Light Mask detected unknown thermal pressure", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[AFUISiriSAEEffectsViewController processCurrentThermalState]";
      _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #AFUISiriSAEEffectsViewController Edge Light Mask entering performance mode due to thermal pressure", (uint8_t *)&v8, 0xCu);
    }
    -[SUICEdgeLightMaskMetalLayer startReducedFramerateForPerformance](self->_edgeLightMask, "startReducedFramerateForPerformance");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong((id *)&self->_shockwaveViewController, 0);
  objc_storeStrong((id *)&self->_buttonShockWaveStyle, 0);
  objc_storeStrong((id *)&self->_edgeShockWaveStyle, 0);
  objc_storeStrong((id *)&self->_edgeLightMask, 0);
  objc_storeStrong((id *)&self->_systemLightView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)buttonHWRectForLockButtonOnEmbeddedDisplay
{
  OUTLINED_FUNCTION_0_0(&dword_217514000, a1, a3, "%s Invalid data found for MG query %{public}@", a5, a6, a7, a8, 2u);
}

@end
