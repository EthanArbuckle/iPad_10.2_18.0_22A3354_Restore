@implementation AFUISiriView

- (AFUISiriView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (AFUISiriView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AFUISiriView *v11;
  AFUISiriView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUISiriView;
  v11 = -[AFUISiriView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    v12->_mode = objc_msgSend(v10, "siriViewMode");
    v12->_remoteContentViewHidden = 0;
    v12->_lockViewHidden = 1;
    v12->_helpButtonDeferred = 1;
    -[AFUISiriView _setupContentViews](v12, "_setupContentViews");
    -[AFUISiriView _updateSiriStatusViewForMode:](v12, "_updateSiriStatusViewForMode:", v12->_mode);
  }

  return v12;
}

- (void)_setupContentViews
{
  _UIBackdropView *v3;
  _UIBackdropView *backdropView;
  id v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *foregroundContainerView;
  void *v10;
  id v11;
  UIView *v12;
  UIView *foregroundView;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *dimmingAndLockContainer;
  AFUIPasscodeContainerView *v22;
  AFUIPasscodeContainerView *lockContainerView;
  UIView *v24;
  UIView *statusViewContainer;

  if (-[AFUISiriView _wantsBackdropView:](self, "_wantsBackdropView:", self->_mode))
  {
    v3 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", -2);
    backdropView = self->_backdropView;
    self->_backdropView = v3;

    if (!-[AFUISiriView _reducesMotionEffects](self, "_reducesMotionEffects"))
      -[_UIBackdropView setUsesZoom](self->_backdropView, "setUsesZoom");
    -[AFUISiriView addSubview:](self, "addSubview:", self->_backdropView);
  }
  v5 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AFUISiriView frame](self, "frame");
  v7 = v6;
  -[AFUISiriView frame](self, "frame");
  v8 = (UIView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  foregroundContainerView = self->_foregroundContainerView;
  self->_foregroundContainerView = v8;

  -[UIView layer](self->_foregroundContainerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

  -[AFUISiriView addSubview:](self, "addSubview:", self->_foregroundContainerView);
  v11 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AFUISiriView frame](self, "frame");
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0);
  foregroundView = self->_foregroundView;
  self->_foregroundView = v12;

  -[UIView layer](self->_foregroundView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

  -[UIView addSubview:](self->_foregroundContainerView, "addSubview:", self->_foregroundView);
  v15 = objc_alloc(MEMORY[0x24BEBDB00]);
  v16 = *MEMORY[0x24BDBF090];
  v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v20 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], v17, v18, v19);
  dimmingAndLockContainer = self->_dimmingAndLockContainer;
  self->_dimmingAndLockContainer = v20;

  -[UIView addSubview:](self->_foregroundView, "addSubview:", self->_dimmingAndLockContainer);
  v22 = -[AFUIPasscodeContainerView initWithFrame:backdropView:mode:passcodeViewFactoryClass:]([AFUIPasscodeContainerView alloc], "initWithFrame:backdropView:mode:passcodeViewFactoryClass:", self->_backdropView, self->_mode, objc_opt_class(), v16, v17, v18, v19);
  lockContainerView = self->_lockContainerView;
  self->_lockContainerView = v22;

  -[AFUIPasscodeContainerView setDelegate:](self->_lockContainerView, "setDelegate:", self);
  -[UIView addSubview:](self->_dimmingAndLockContainer, "addSubview:", self->_lockContainerView);
  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v16, v17, v18, v19);
  statusViewContainer = self->_statusViewContainer;
  self->_statusViewContainer = v24;

  -[UIView addSubview:](self->_foregroundView, "addSubview:", self->_statusViewContainer);
}

- (void)setMode:(int64_t)a3
{
  SiriUIHelpButton *helpButton;
  SiriUISiriStatusViewProtocol *siriStatusView;
  UIView *voiceActivationMaskView;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  SiriUIContentButton *reportBugButton;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[SiriUIHelpButton removeFromSuperview](self->_helpButton, "removeFromSuperview");
    helpButton = self->_helpButton;
    self->_helpButton = 0;

    -[SiriUISiriStatusViewProtocol removeFromSuperview](self->_siriStatusView, "removeFromSuperview");
    siriStatusView = self->_siriStatusView;
    self->_siriStatusView = 0;

    -[UIView removeFromSuperview](self->_voiceActivationMaskView, "removeFromSuperview");
    voiceActivationMaskView = self->_voiceActivationMaskView;
    self->_voiceActivationMaskView = 0;

    -[SiriUIAudioRoutePickerButton removeFromSuperview](self->_audioRoutePickerButton, "removeFromSuperview");
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = 0;

    -[SiriUIContentButton removeFromSuperview](self->_reportBugButton, "removeFromSuperview");
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = 0;

    -[AFUISiriView _destroyAssistantVersionLabelIfNecessary](self, "_destroyAssistantVersionLabelIfNecessary");
    -[AFUISiriView _updateSiriStatusViewForMode:](self, "_updateSiriStatusViewForMode:", a3);
    -[AFUISiriView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateSiriStatusViewForMode:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SiriUISiriStatusViewProtocol *siriStatusView;
  int64_t mode;
  BOOL v23;

  if ((unint64_t)(a3 - 7) < 2 || a3 == 4)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUISiriView _updateSiriStatusViewForMode:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (a3 == 5)
  {
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUISiriView _updateSiriStatusViewForMode:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  -[SiriUISiriStatusViewProtocol setFlamesViewDeferred:](self->_siriStatusView, "setFlamesViewDeferred:", self->_flamesViewDeferred);
  -[SiriUISiriStatusViewProtocol sizeToFit](self->_siriStatusView, "sizeToFit");
  siriStatusView = self->_siriStatusView;
  if (siriStatusView)
  {
    -[SiriUISiriStatusViewProtocol setDisabledMicOpacity:](siriStatusView, "setDisabledMicOpacity:", 0.25);
    -[SiriUISiriStatusViewProtocol setDelegate:](self->_siriStatusView, "setDelegate:", self);
    -[UIView addSubview:](self->_statusViewContainer, "addSubview:", self->_siriStatusView);
  }
  -[AFUISiriView _updateControlsAppearance](self, "_updateControlsAppearance");
  mode = self->_mode;
  v23 = mode == 8 || mode == 4;
  if (v23
    && +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState") != 1
    && +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState") != 3)
  {
    -[AFUISiriView _configureEyesFreeLogo](self, "_configureEyesFreeLogo");
  }
}

- (void)_createAssistantVersionLabelIfNecessary
{
  id v3;
  UILabel *v4;
  UILabel *assistantVersionLabel;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SiriUIVisualEffectView *v10;
  SiriUIVisualEffectView *assistantVersionVisualEffectView;
  UILabel *v12;
  void *v13;

  if (!self->_assistantVersionLabel)
  {
    if (AFUIShowServerVersionOnUI())
    {
      v3 = objc_alloc(MEMORY[0x24BEBD708]);
      v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      assistantVersionLabel = self->_assistantVersionLabel;
      self->_assistantVersionLabel = v4;

      v6 = objc_alloc(MEMORY[0x24BEA8530]);
      v7 = (void *)MEMORY[0x24BEBDAF0];
      objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "effectForBlurEffect:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (SiriUIVisualEffectView *)objc_msgSend(v6, "initWithEffect:", v9);
      assistantVersionVisualEffectView = self->_assistantVersionVisualEffectView;
      self->_assistantVersionVisualEffectView = v10;

      v12 = self->_assistantVersionLabel;
      objc_msgSend(MEMORY[0x24BEBD5E0], "siriui_lightWeightFontWithSize:", 12.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v12, "setFont:", v13);

      -[SiriUIVisualEffectView setCustomView:](self->_assistantVersionVisualEffectView, "setCustomView:", self->_assistantVersionLabel);
      -[UIView addSubview:](self->_statusViewContainer, "addSubview:", self->_assistantVersionVisualEffectView);
    }
  }
}

- (void)_destroyAssistantVersionLabelIfNecessary
{
  UILabel *assistantVersionLabel;
  UILabel *v4;
  SiriUIVisualEffectView *assistantVersionVisualEffectView;

  assistantVersionLabel = self->_assistantVersionLabel;
  if (assistantVersionLabel)
  {
    -[UILabel removeFromSuperview](assistantVersionLabel, "removeFromSuperview");
    v4 = self->_assistantVersionLabel;
    self->_assistantVersionLabel = 0;

    -[SiriUIVisualEffectView removeFromSuperview](self->_assistantVersionVisualEffectView, "removeFromSuperview");
    assistantVersionVisualEffectView = self->_assistantVersionVisualEffectView;
    self->_assistantVersionVisualEffectView = 0;

  }
}

- (BOOL)_wantsBackdropView:(int64_t)a3
{
  BOOL v3;

  if (a3)
    v3 = (unint64_t)(a3 - 8) >= 0xFFFFFFFFFFFFFFFELL;
  else
    v3 = 1;
  return !v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE08EB8], 0);

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriView;
  -[AFUISiriView dealloc](&v4, sel_dealloc);
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
  UIView *remoteContentView;
  AFUIPasscodeContainerView *lockContainerView;
  UIView *statusViewContainer;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double MaxY;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  SiriUIHelpButton *helpButton;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGRect rect;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  *(_QWORD *)&rect.size.width = self;
  *(_QWORD *)&rect.size.height = AFUISiriView;
  -[CGSize layoutSubviews]((objc_super *)&rect.size, sel_layoutSubviews);
  -[AFUISiriView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  if (self->_eyesFreeEffectView)
  {
    -[UIImageView setFrame:](self->_eyesFreeLogoView, "setFrame:", 0.0, 0.0, 133.0, 133.0);
    -[SiriUIVisualEffectView setFrame:](self->_eyesFreeEffectView, "setFrame:", v8 * 0.5 + -66.5, v10 * 0.42 + -133.0, 133.0, 133.0);
  }
  -[UIView setFrame:](self->_foregroundView, "setFrame:", v4, v6, v8, v10);
  remoteContentView = self->_remoteContentView;
  -[AFUISiriView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  -[UIView setFrame:](remoteContentView, "setFrame:");
  if (!self->_inFluidDismissal)
    -[UIView setFrame:](self->_foregroundContainerView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_dimmingAndLockContainer, "setFrame:", v4, v6, v8, v10);
  lockContainerView = self->_lockContainerView;
  -[AFUISiriView _lockViewFrame](self, "_lockViewFrame");
  -[AFUIPasscodeContainerView setFrame:](lockContainerView, "setFrame:");
  -[SiriUISiriStatusViewProtocol setFlamesViewWidth:](self->_siriStatusView, "setFlamesViewWidth:", v8);
  statusViewContainer = self->_statusViewContainer;
  -[AFUISiriView _statusViewContainerFrame](self, "_statusViewContainerFrame");
  -[UIView setFrame:](statusViewContainer, "setFrame:");
  -[UIView bounds](self->_statusViewContainer, "bounds");
  rect.origin.x = v14;
  rect.origin.y = v15;
  v17 = v16;
  v19 = v18;
  -[SiriUISiriStatusViewProtocol setFrame:](self->_siriStatusView, "setFrame:", v4, v6, v8, v10);
  v68 = v6;
  v69 = v4;
  -[UIView setFrame:](self->_voiceActivationMaskView, "setFrame:", v4, v6, v8, v10);
  -[AFUISiriView _buttonInset](self, "_buttonInset");
  v21 = v20;
  audioRoutePickerButton = self->_audioRoutePickerButton;
  v23 = MEMORY[0x24BDBF090];
  v24 = -v20;
  if (audioRoutePickerButton)
  {
    v62 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[SiriUIAudioRoutePickerButton sizeThatFits:](audioRoutePickerButton, "sizeThatFits:", v8, v10);
    v64 = v8;
    v25 = v19;
    v27 = v26;
    v61 = v28;
    v71.origin.x = rect.origin.x;
    v71.origin.y = v17;
    v71.size.width = v25;
    v71.size.height = rect.origin.y;
    v63 = v21;
    v29 = CGRectGetMaxX(v71) - v21 - v27;
    -[AFUISiriView safeAreaInsets](self, "safeAreaInsets");
    v31 = v29 - v30;
    v72.origin.x = rect.origin.x;
    v72.origin.y = v17;
    v72.size.width = v25;
    v72.size.height = rect.origin.y;
    v66 = v17;
    MaxY = CGRectGetMaxY(v72);
    -[SiriUISiriStatusViewProtocol statusViewHeight](self->_siriStatusView, "statusViewHeight");
    v33 = v10;
    v35 = v34;
    v73.origin.x = v31;
    v73.origin.y = v62;
    v73.size.width = v27;
    v73.size.height = v61;
    v36 = v35 + CGRectGetHeight(v73);
    -[SiriUISiriStatusViewProtocol safeAreaInsets](self->_siriStatusView, "safeAreaInsets");
    v38 = v36 + v37;
    v10 = v33;
    v39 = MaxY + v38 * -0.5;
    v40 = v31;
    v21 = v63;
    v41 = v27;
    v19 = v25;
    v8 = v64;
    v17 = v66;
    -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v40, v39, v41, v61);
    -[SiriUIAudioRoutePickerButton setHitTestEdgeInsets:](self->_audioRoutePickerButton, "setHitTestEdgeInsets:", v24, v24, v24, v24);
  }
  helpButton = self->_helpButton;
  if (helpButton)
  {
    v65 = *(double *)(v23 + 8);
    -[SiriUIHelpButton sizeThatFits:](helpButton, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v44 = v43;
    v67 = v10;
    v46 = v45;
    -[AFUISiriView safeAreaInsets](self, "safeAreaInsets");
    v47 = v17;
    v49 = v21 + v48;
    v74.origin.x = rect.origin.x;
    v74.origin.y = v47;
    v74.size.width = v19;
    v74.size.height = rect.origin.y;
    rect.origin.y = CGRectGetMaxY(v74);
    -[SiriUISiriStatusViewProtocol statusViewHeight](self->_siriStatusView, "statusViewHeight");
    v51 = v50;
    v75.origin.x = v49;
    v75.origin.y = v65;
    v75.size.width = v44;
    v75.size.height = v46;
    v52 = v51 + CGRectGetHeight(v75);
    -[SiriUISiriStatusViewProtocol safeAreaInsets](self->_siriStatusView, "safeAreaInsets");
    v54 = v46;
    v10 = v67;
    -[SiriUIHelpButton setFrame:](self->_helpButton, "setFrame:", v49, rect.origin.y + (v52 + v53) * -0.5, v44, v54);
    -[SiriUIHelpButton setHitTestEdgeInsets:](self->_helpButton, "setHitTestEdgeInsets:", v24, v24, v24, v24);
  }
  -[AFUISiriView _layoutReportBugButton](self, "_layoutReportBugButton");
  if (self->_assistantVersionVisualEffectView)
  {
    -[AFUISiriView safeAreaInsets](self, "safeAreaInsets");
    rect.origin.y = v55;
    -[SiriUIVisualEffectView sizeThatFits:](self->_assistantVersionVisualEffectView, "sizeThatFits:", v8, v10);
    v57 = v56;
    v59 = v58;
    v76.origin.x = v69;
    v76.origin.y = v68;
    v76.size.width = v8;
    v76.size.height = v10;
    v60 = CGRectGetMaxX(v76) - v57 + -6.0;
    v77.origin.x = v69;
    v77.origin.y = v68;
    v77.size.width = v8;
    v77.size.height = v10;
    -[SiriUIVisualEffectView setFrame:](self->_assistantVersionVisualEffectView, "setFrame:", v60, CGRectGetMaxY(v77) - v59 + -6.0 - rect.origin.y, v57, v59);
  }
}

- (void)_layoutReportBugButton
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  SiriUIContentButton *reportBugButton;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat rect_8;
  CGFloat rect_16;
  double rect_24;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[AFUISiriView _buttonInset](self, "_buttonInset");
  v4 = v3;
  -[SiriUIContentButton superview](self->_reportBugButton, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  reportBugButton = self->_reportBugButton;
  if (reportBugButton)
  {
    rect_8 = v9;
    rect_16 = v7;
    rect_24 = v4;
    v16 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[SiriUIContentButton sizeThatFits:](reportBugButton, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v18 = v17;
    v20 = v19;
    -[SiriUISiriStatusViewProtocol frame](self->_siriStatusView, "frame");
    MaxY = CGRectGetMaxY(v36);
    -[SiriUISiriStatusViewProtocol statusViewHeight](self->_siriStatusView, "statusViewHeight");
    v23 = v22;
    v37.origin.x = v16;
    v37.origin.y = v15;
    v37.size.width = v18;
    v37.size.height = v20;
    v24 = v23 + CGRectGetHeight(v37);
    -[SiriUISiriStatusViewProtocol safeAreaInsets](self->_siriStatusView, "safeAreaInsets");
    v26 = MaxY + (v24 + v25) * -0.5;
    audioRoutePickerButton = self->_audioRoutePickerButton;
    if (audioRoutePickerButton
      && (-[SiriUIAudioRoutePickerButton isHidden](audioRoutePickerButton, "isHidden") & 1) == 0)
    {
      -[SiriUIAudioRoutePickerButton frame](self->_audioRoutePickerButton, "frame");
      v28 = rect_24;
      v32 = CGRectGetMinX(v39) - rect_24;
      v40.origin.x = v16;
      v40.origin.y = v26;
      v40.size.width = v18;
      v40.size.height = v20;
      v31 = v32 - CGRectGetWidth(v40);
    }
    else
    {
      v38.origin.y = rect_8;
      v38.origin.x = rect_16;
      v38.size.width = v11;
      v38.size.height = v13;
      v28 = rect_24;
      v29 = CGRectGetMaxX(v38) - rect_24 - v18;
      -[AFUISiriView safeAreaInsets](self, "safeAreaInsets");
      v31 = v29 - v30;
    }
    -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v31, v26, v18, v20, *(_QWORD *)&v16);
    -[SiriUIContentButton setHitTestEdgeInsets:](self->_reportBugButton, "setHitTestEdgeInsets:", -v28, -v28, -v28, -v28);
  }
}

- (double)statusViewHeight
{
  double result;

  -[SiriUISiriStatusViewProtocol statusViewHeight](self->_siriStatusView, "statusViewHeight");
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  objc_super v6;
  UIEdgeInsets result;

  if (self->_safeAreaInsetsSuspended)
  {
    top = self->_suspendedSafeAreaInsets.top;
    left = self->_suspendedSafeAreaInsets.left;
    bottom = self->_suspendedSafeAreaInsets.bottom;
    right = self->_suspendedSafeAreaInsets.right;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AFUISiriView;
    -[AFUISiriView safeAreaInsets](&v6, sel_safeAreaInsets);
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setSafeAreaInsetsSuspended:(BOOL)a3
{
  UIEdgeInsets *p_suspendedSafeAreaInsets;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v10;

  if (self->_safeAreaInsetsSuspended != a3)
  {
    if (a3)
    {
      p_suspendedSafeAreaInsets = &self->_suspendedSafeAreaInsets;
      v10.receiver = self;
      v10.super_class = (Class)AFUISiriView;
      -[AFUISiriView safeAreaInsets](&v10, sel_safeAreaInsets);
      p_suspendedSafeAreaInsets->top = v6;
      self->_suspendedSafeAreaInsets.left = v7;
      self->_suspendedSafeAreaInsets.bottom = v8;
      self->_suspendedSafeAreaInsets.right = v9;
      self->_safeAreaInsetsSuspended = a3;
    }
    else
    {
      self->_safeAreaInsetsSuspended = 0;
      -[AFUISiriView safeAreaInsetsDidChange](self, "safeAreaInsetsDidChange");
    }
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
  -[AFUISiriView _setSafeAreaInsetsSuspended:](self, "_setSafeAreaInsetsSuspended:");
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[AFUISiriView _updateControlsAppearance](self, "_updateControlsAppearance");
  }
}

- (void)setStatusViewHidden:(BOOL)a3
{
  _BOOL4 v3;
  double MinY;
  void *v7;
  UIView *statusViewContainer;
  double v9;
  uint64_t v10;
  CGRect v11;
  CGRect v12;

  v3 = a3;
  if ((a3 || !self->_inShowUnlockViewAnimation && (self->_inHideUnlockViewAnimation || self->_lockViewHidden))
    && self->_statusViewHidden != a3
    && (!self->_keepStatusViewHidden || a3))
  {
    -[AFUISiriView _statusViewContainerFrame](self, "_statusViewContainerFrame");
    MinY = CGRectGetMinY(v11);
    self->_statusViewHidden = v3;
    v7 = (void *)objc_opt_class();
    statusViewContainer = self->_statusViewContainer;
    -[AFUISiriView _statusViewContainerFrame](self, "_statusViewContainerFrame");
    v9 = CGRectGetMinY(v12);
    if (v3)
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v7, "_animateView:fromYPosition:toYPosition:fade:completion:", statusViewContainer, v10, 0, MinY, v9);
    -[AFUISiriView _updateControlsAppearance](self, "_updateControlsAppearance");
  }
}

- (void)_updateControlsAppearance
{
  int64_t siriSessionState;
  uint64_t v4;
  double v5;
  _BOOL8 v6;

  if (self->_disabled)
  {
LABEL_2:
    siriSessionState = 4;
  }
  else
  {
    v4 = 0;
    siriSessionState = 0;
    switch(self->_siriSessionState)
    {
      case 0:
      case 4:
        goto LABEL_7;
      case 1:
      case 2:
        v4 = 1;
        goto LABEL_6;
      case 3:
        v4 = 0;
LABEL_6:
        siriSessionState = self->_siriSessionState;
LABEL_7:
        -[AFUISiriView _animateButtonsHidden:](self, "_animateButtonsHidden:", v4);
        break;
      default:
        goto LABEL_2;
    }
  }
  -[SiriUISiriStatusViewProtocol setMode:](self->_siriStatusView, "setMode:", siriSessionState);
  v5 = 0.0;
  if (!self->_statusViewHidden)
    v5 = 1.0;
  -[SiriUISiriStatusViewProtocol setAlpha:](self->_siriStatusView, "setAlpha:", v5);
  v6 = self->_disabled || -[AFUISiriView _isTextInputEnabled](self, "_isTextInputEnabled");
  -[SiriUIHelpButton setHidden:](self->_helpButton, "setHidden:", v6);
  -[SiriUIAudioRoutePickerButton setHidden:](self->_audioRoutePickerButton, "setHidden:", v6);
  -[SiriUIContentButton setHidden:](self->_reportBugButton, "setHidden:", v6);
}

- (void)_animateButtonsHidden:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_helpButtonDeferred || a3)
  {
    if (self->_helpButtonDeferred)
      return;
  }
  else
  {
    -[AFUISiriView _setupButtonsIfNecessary](self, "_setupButtonsIfNecessary");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__AFUISiriView__animateButtonsHidden___block_invoke;
  v5[3] = &unk_24D7A1A90;
  v6 = a3;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 0.25, 0.0, 1.0, 0.0);
}

uint64_t __38__AFUISiriView__animateButtonsHidden___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  if (v2)
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v3, "setAlpha:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", v4);
}

- (void)setStatusViewUserInteractionEnabled:(BOOL)a3
{
  -[UIView setUserInteractionEnabled:](self->_statusViewContainer, "setUserInteractionEnabled:", a3);
}

- (void)setFlamesViewDeferred:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[AFUISiriView setFlamesViewDeferred:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  self->_flamesViewDeferred = v3;
  -[SiriUISiriStatusViewProtocol setFlamesViewDeferred:](self->_siriStatusView, "setFlamesViewDeferred:", v3);
}

- (BOOL)flamesViewPaused
{
  return -[SiriUISiriStatusViewProtocol paused](self->_siriStatusView, "paused");
}

- (void)setFlamesViewPaused:(BOOL)a3
{
  -[SiriUISiriStatusViewProtocol setPaused:](self->_siriStatusView, "setPaused:", a3);
}

- (void)teardownStatusView
{
  SiriUISiriStatusViewProtocol *siriStatusView;

  -[SiriUISiriStatusViewProtocol removeFromSuperview](self->_siriStatusView, "removeFromSuperview");
  siriStatusView = self->_siriStatusView;
  self->_siriStatusView = 0;

}

- (void)setInUITrackingMode:(BOOL)a3
{
  -[SiriUISiriStatusViewProtocol setInUITrackingMode:](self->_siriStatusView, "setInUITrackingMode:", a3);
}

- (void)setupOrbIfNeeded
{
  -[SiriUISiriStatusViewProtocol setupOrbIfNeeded](self->_siriStatusView, "setupOrbIfNeeded");
}

- (void)fadeOutCurrentAura
{
  -[SiriUISiriStatusViewProtocol fadeOutCurrentAura](self->_siriStatusView, "fadeOutCurrentAura");
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[AFUISiriView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)reloadData
{
  AFUISiriViewDataSource **p_dataSource;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend(WeakRetained, "userAccountCountForSiriView:", self);

  if (v5 < 2)
  {
    -[AFUISiriView _destroyAssistantVersionLabelIfNecessary](self, "_destroyAssistantVersionLabelIfNecessary");
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v6, "assistantVersionForSiriView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v8, "activeAccountForSiriView:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AFUIDisplayStringForVersionAndAccount(v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "length"))
    {
      -[AFUISiriView _createAssistantVersionLabelIfNecessary](self, "_createAssistantVersionLabelIfNecessary");
      -[UILabel setText:](self->_assistantVersionLabel, "setText:", v10);
    }

  }
  -[AFUISiriView setNeedsLayout](self, "setNeedsLayout");
}

- (_UIBackdropView)backgroundBlurView
{
  return self->_backdropView;
}

- (void)setBackdropVisible:(BOOL)a3
{
  id v4;

  self->_backdropViewVisible = a3;
  if (a3)
  {
    -[AFUISiriView dimBackdropSettings](self, "dimBackdropSettings");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView transitionToSettings:](self->_backdropView, "transitionToSettings:", v4);

  }
  else
  {
    -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", -2);
  }
}

- (void)setBackdropShouldRasterize:(BOOL)a3
{
  -[_UIBackdropView setShouldRasterizeEffectsView:](self->_backdropView, "setShouldRasterizeEffectsView:", a3);
}

- (id)dimBackdropSettings
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBDB80];
  if (-[AFUISiriView _reducesMotionEffects](self, "_reducesMotionEffects"))
    v3 = 2050;
  else
    v3 = 2032;
  objc_msgSend(v2, "settingsForPrivateStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlurRadius:", 24.0);
  objc_msgSend(v4, "setScale:", 0.5);
  return v4;
}

- (void)setRemoteContentView:(id)a3
{
  UIView *v4;
  UIView *remoteContentView;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_remoteContentView, "removeFromSuperview");
  remoteContentView = self->_remoteContentView;
  self->_remoteContentView = v4;

  -[AFUISiriView _placeRemoteContentView](self, "_placeRemoteContentView");
}

- (void)_placeRemoteContentView
{
  UIView *remoteContentView;
  UIView *foregroundView;
  void *v5;
  UIView *voiceActivationMaskView;
  UIView *v7;
  id v8;

  remoteContentView = self->_remoteContentView;
  if (remoteContentView)
  {
    -[AFUISiriView _remoteContentViewFrame](self, "_remoteContentViewFrame");
    -[UIView setFrame:](remoteContentView, "setFrame:");
    -[UIView insertSubview:aboveSubview:](self->_foregroundView, "insertSubview:aboveSubview:", self->_remoteContentView, self->_dimmingAndLockContainer);
    foregroundView = self->_foregroundView;
    -[SiriUISiriStatusViewProtocol flamesContainerView](self->_siriStatusView, "flamesContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:belowSubview:](foregroundView, "insertSubview:belowSubview:", v5, self->_remoteContentView);

  }
  voiceActivationMaskView = self->_voiceActivationMaskView;
  if (voiceActivationMaskView)
  {
    v7 = self->_foregroundView;
    -[SiriUISiriStatusViewProtocol flamesContainerView](self->_siriStatusView, "flamesContainerView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:below:](v7, "insertSubview:below:", voiceActivationMaskView, v8);

  }
}

- (void)setVoiceActivationMaskViewVisible:(BOOL)a3
{
  int64_t mode;
  void *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  mode = self->_mode;
  if (mode == 4 || mode == 8)
  {
    if (a3)
    {
      -[AFUISiriView _setupVoiceActivationMaskView](self, "_setupVoiceActivationMaskView");
    }
    else if (self->_voiceActivationMaskView)
    {
      self->_remoteContentViewHidden = 0;
      -[AFUISiriView _placeRemoteContentView](self, "_placeRemoteContentView");
      objc_initWeak((id *)buf, self);
      v10 = (void *)MEMORY[0x24BEBDB00];
      v11 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke;
      v14[3] = &unk_24D7A1AB8;
      objc_copyWeak(&v15, (id *)buf);
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke_2;
      v12[3] = &unk_24D7A1AE0;
      objc_copyWeak(&v13, (id *)buf);
      objc_msgSend(v10, "animateWithDuration:animations:completion:", v14, v12, 0.4);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      SiriUINSStringFromSiriUIViewMode();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[AFUISiriView setVoiceActivationMaskViewVisible:]";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s Not showing voiceActivationMaskView for mode - %@", buf, 0x16u);

    }
  }
}

void __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[64], "setAlpha:", 0.0);
    WeakRetained = v2;
  }

}

void __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setStatusViewHidden:", 0);
    objc_msgSend(v3[64], "removeFromSuperview");
    v2 = v3[64];
    v3[64] = 0;

    WeakRetained = v3;
  }

}

- (void)_setupVoiceActivationMaskView
{
  id v3;
  UIView *v4;
  UIView *voiceActivationMaskView;
  UIView *v6;
  void *v7;

  self->_remoteContentViewHidden = 1;
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  voiceActivationMaskView = self->_voiceActivationMaskView;
  self->_voiceActivationMaskView = v4;

  v6 = self->_voiceActivationMaskView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView insertSubview:below:](self->_foregroundView, "insertSubview:below:", self->_voiceActivationMaskView, self->_remoteContentView);
}

- (CGRect)_remoteContentViewFrame
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AFUISiriView bounds](self, "bounds");
  v7 = v3;
  v8 = v5;
  v9 = v6;
  if (self->_remoteContentViewHidden)
    v10 = -CGRectGetHeight(*(CGRect *)&v3);
  else
    v10 = 0.0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (void)updateForPercentageRevealed:(double)a3
{
  double v5;

  if (!self->_backdropViewVisible)
    -[AFUISiriView setBackdropVisible:](self, "setBackdropVisible:", 1);
  -[SiriUISiriStatusViewProtocol forceMicVisible:](self->_siriStatusView, "forceMicVisible:", 1);
  if (a3 <= 0.2)
    v5 = a3 * 5.0;
  else
    v5 = 1.0;
  -[SiriUISiriStatusViewProtocol setAlpha:](self->_siriStatusView, "setAlpha:", v5);
}

- (CGRect)_lockViewFrame
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AFUISiriView bounds](self, "bounds");
  v7 = v3;
  v8 = v5;
  v9 = v6;
  if (self->_lockViewHidden)
    Height = CGRectGetHeight(*(CGRect *)&v3);
  else
    Height = 0.0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = Height;
  result.origin.x = v11;
  return result;
}

- (CGRect)_statusViewContainerFrame
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AFUISiriView bounds](self, "bounds");
  v7 = v3;
  v8 = v5;
  v9 = v6;
  if (self->_statusViewHidden)
    Height = CGRectGetHeight(*(CGRect *)&v3);
  else
    Height = 0.0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = Height;
  result.origin.x = v11;
  return result;
}

- (double)_buttonInset
{
  int v2;
  double result;

  v2 = SiriUIIsCompactWidth();
  result = 26.0;
  if (v2)
    return 16.0;
  return result;
}

- (void)setShowAudioRoutePicker:(BOOL)a3
{
  id v5;
  SiriUIAudioRoutePickerButton *v6;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  SiriUIAudioRoutePickerButton *v8;
  SiriUIAudioRoutePickerButton *v9;
  void *v10;
  uint64_t v11;
  SiriUIAudioRoutePickerButton *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  SiriUIAudioRoutePickerButton *v15;
  AFUISiriView *v16;
  BOOL v17;
  _QWORD v18[4];
  SiriUIAudioRoutePickerButton *v19;
  BOOL v20;

  if (a3 && !self->_audioRoutePickerButton)
  {
    v5 = objc_alloc(MEMORY[0x24BEA84D0]);
    v6 = (SiriUIAudioRoutePickerButton *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = v6;

    -[SiriUIAudioRoutePickerButton addTarget:action:forControlEvents:](self->_audioRoutePickerButton, "addTarget:action:forControlEvents:", self, sel__audioRouteButtonTapped_, 64);
    -[SiriUIAudioRoutePickerButton setAlpha:](self->_audioRoutePickerButton, "setAlpha:", 0.0);
    -[SiriUIAudioRoutePickerButton _setTouchInsets:](self->_audioRoutePickerButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    -[SiriUIAudioRoutePickerButton setHidden:](self->_audioRoutePickerButton, "setHidden:", -[AFUISiriView _isTextInputEnabled](self, "_isTextInputEnabled"));
    -[UIView insertSubview:above:](self->_statusViewContainer, "insertSubview:above:", self->_audioRoutePickerButton, self->_siriStatusView);
    -[AFUISiriView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = self->_audioRoutePickerButton;
  if (v8 && self->_siriSessionState != 1)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x24BEBDB00];
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke;
    v18[3] = &unk_24D7A1A90;
    v19 = v9;
    v20 = a3;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_2;
    v14[3] = &unk_24D7A1B08;
    v17 = a3;
    v12 = v19;
    v15 = v12;
    v16 = self;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v18, v14, 0.2);
    if (-[AFUISiriView _showsReportBugButton](self, "_showsReportBugButton"))
    {
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_3;
      v13[3] = &unk_24D7A1B30;
      v13[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v13, 0.2);
    }

  }
}

uint64_t __40__AFUISiriView_setShowAudioRoutePicker___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

void __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 488);
    if (v3 == *(void **)(a1 + 32))
    {
      *(_QWORD *)(v2 + 488) = 0;

    }
  }
}

uint64_t __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutReportBugButton");
}

- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3
{
  -[SiriUIAudioRoutePickerButton setBluetoothOn:](self->_audioRoutePickerButton, "setBluetoothOn:", a3);
}

- (void)_audioRouteButtonTapped:(id)a3
{
  id v4;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewDidReceiveAudioRouteAction:", self);

}

- (void)_preferencesDidChange:(id)a3
{
  uint64_t v4;

  v4 = -[AFUISiriView _showsReportBugButton](self, "_showsReportBugButton", a3) ^ 1;
  -[SiriUIContentButton setHidden:](self->_reportBugButton, "setHidden:", v4);
  -[SiriUIVisualEffectView setHidden:](self->_assistantVersionVisualEffectView, "setHidden:", v4);
}

- (BOOL)_showsReportBugButton
{
  void *v3;
  BOOL v4;

  if (!AFIsInternalInstall())
    return 0;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "debugButtonIsEnabled"))
    v4 = self->_mode != 5;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldIndicateHoldToTalkMode
{
  int v2;
  void *v3;
  char v4;

  v2 = AFIsInternalInstall();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showsHoldToTalkIndicator");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  SiriUIContentButton *reportBugButton;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v3 = a3;
  v5 = -[AFUISiriView _showsReportBugButton](self, "_showsReportBugButton");
  reportBugButton = self->_reportBugButton;
  if (v5)
  {
    if (reportBugButton)
    {
      -[AFUISiriView _configureReportBugButtonWithHoldToTalkState:](self, "_configureReportBugButtonWithHoldToTalkState:", v3);
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke;
      v7[3] = &unk_24D7A1B80;
      objc_copyWeak(&v8, &location);
      v9 = v3;
      -[AFUISiriView _loadReportBugButtonTemplateImageInBackgroundWithCompletion:](self, "_loadReportBugButtonTemplateImageInBackgroundWithCompletion:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SiriUIContentButton setHidden:](reportBugButton, "setHidden:", 1);
  }
}

void __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke_2;
  block[3] = &unk_24D7A1B58;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v8 = *(_BYTE *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_createReportBugButtonWithTemplateImage:andConfigureWithHoldToTalkState:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)_createReportBugButtonWithTemplateImage:(id)a3 andConfigureWithHoldToTalkState:(BOOL)a4
{
  _BOOL8 v4;
  SiriUIContentButton *v6;
  SiriUIContentButton *reportBugButton;
  void *v8;

  v4 = a4;
  if (!self->_reportBugButton)
  {
    objc_msgSend(MEMORY[0x24BEA84F8], "buttonWithImageTemplate:style:", a3, 0);
    v6 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = v6;

    -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    -[SiriUIContentButton setAlpha:](self->_reportBugButton, "setAlpha:", 0.0);
    -[SiriUIContentButton addTarget:action:forControlEvents:](self->_reportBugButton, "addTarget:action:forControlEvents:", self, sel__reportBugButtonTapped, 64);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__reportBugButtonLongPressed);
    -[SiriUIContentButton addGestureRecognizer:](self->_reportBugButton, "addGestureRecognizer:", v8);
    -[SiriUIContentButton setHidden:](self->_reportBugButton, "setHidden:", 0);
    -[UIView insertSubview:above:](self->_statusViewContainer, "insertSubview:above:", self->_reportBugButton, self->_siriStatusView);
    -[AFUISiriView setNeedsLayout](self, "setNeedsLayout");

  }
  -[AFUISiriView _configureReportBugButtonWithHoldToTalkState:](self, "_configureReportBugButtonWithHoldToTalkState:", v4);
  -[AFUISiriView _updateControlsAppearance](self, "_updateControlsAppearance");
}

- (void)_configureReportBugButtonWithHoldToTalkState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AFUISiriView _shouldIndicateHoldToTalkMode](self, "_shouldIndicateHoldToTalkMode"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.7, 1.0, 0.4, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    if (a3)
    {
      objc_msgSend(v5, "colorWithAlphaComponent:", 0.6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.2);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "siriui_transparantButtonColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "siriui_transparantHighlightedButtonColor");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setDefaultColorForTemplate:](self->_reportBugButton, "setDefaultColorForTemplate:", v6);
    -[SiriUIContentButton setHighlightColorForTemplate:](self->_reportBugButton, "setHighlightColorForTemplate:", v7);

  }
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AFUISiriView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_24D7A1BA8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __76__AFUISiriView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("radarBug"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithRenderingMode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = 0;
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_7:
    v2 = v7;
  }

}

- (void)_reportBugButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriViewDidReceiveReportBugAction:", self);

}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriViewDidReceiveBugButtonLongPress:", self);

}

- (void)setSiriSessionState:(int64_t)a3
{
  if (self->_siriSessionState != a3)
  {
    self->_siriSessionState = a3;
    -[AFUISiriView _updateControlsAppearance](self, "_updateControlsAppearance");
  }
}

- (void)setBugReportingAvailable:(BOOL)a3
{
  -[SiriUIContentButton setEnabled:](self->_reportBugButton, "setEnabled:", a3);
}

- (void)_configureHelpButton
{
  SiriUIHelpButton *v3;
  SiriUIHelpButton *helpButton;

  if (!self->_helpButton)
  {
    objc_msgSend(MEMORY[0x24BEA8500], "buttonWithHelpImageMask");
    v3 = (SiriUIHelpButton *)objc_claimAutoreleasedReturnValue();
    helpButton = self->_helpButton;
    self->_helpButton = v3;

    -[SiriUIHelpButton setAlpha:](self->_helpButton, "setAlpha:", 0.0);
    -[SiriUIHelpButton _setTouchInsets:](self->_helpButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    -[SiriUIHelpButton addTarget:action:forControlEvents:](self->_helpButton, "addTarget:action:forControlEvents:", self, sel__helpButtonTapped_, 64);
    -[UIView insertSubview:above:](self->_statusViewContainer, "insertSubview:above:", self->_helpButton, self->_siriStatusView);
  }
}

- (void)_helpButtonTapped:(id)a3
{
  id v4;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewDidReceiveHelpAction:", self);

}

- (void)setHelpButtonEmphasized:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AFUISiriView _helpButtonIsVisible](self, "_helpButtonIsVisible"))
    -[SiriUIHelpButton setEmphasized:](self->_helpButton, "setEmphasized:", v3);
}

- (void)setHelpButtonDeferred:(BOOL)a3
{
  if (self->_helpButtonDeferred != a3)
    self->_helpButtonDeferred = a3;
}

- (void)pulseHelpButton
{
  if (-[AFUISiriView _helpButtonIsVisible](self, "_helpButtonIsVisible"))
    -[SiriUIHelpButton pulse](self->_helpButton, "pulse");
}

- (BOOL)_helpButtonIsVisible
{
  double v4;

  if ((-[SiriUIHelpButton isHidden](self->_helpButton, "isHidden") & 1) != 0)
    return 0;
  -[SiriUIHelpButton alpha](self->_helpButton, "alpha");
  return v4 > 2.22044605e-16;
}

- (void)_configureEyesFreeLogo
{
  id v3;
  void *v4;
  SiriUIVisualEffectView *v5;
  SiriUIVisualEffectView *eyesFreeEffectView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *eyesFreeLogoView;
  id v15;

  v3 = objc_alloc(MEMORY[0x24BEA8530]);
  objc_msgSend(MEMORY[0x24BEBDAF0], "siriui_platterVibrancyEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (SiriUIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  eyesFreeEffectView = self->_eyesFreeEffectView;
  self->_eyesFreeEffectView = v5;

  v7 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("DnDwDSiri"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_flatImageWithColor:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v15);
  eyesFreeLogoView = self->_eyesFreeLogoView;
  self->_eyesFreeLogoView = v13;

  -[SiriUIVisualEffectView setCustomView:](self->_eyesFreeEffectView, "setCustomView:", self->_eyesFreeLogoView);
  -[UIView insertSubview:above:](self->_statusViewContainer, "insertSubview:above:", self->_eyesFreeEffectView, self->_backdropView);

}

- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6
{
  -[AFUIPasscodeContainerView showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:](self->_lockContainerView, "showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:", a3, a4, a5, a6);
}

- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  double MinY;
  void *v7;
  UIView *remoteContentView;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  AFUIPasscodeContainerView *lockContainerView;
  double v14;
  uint64_t v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  v16 = a4;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  if (v16)
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v16);
  -[AFUISiriView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  MinY = CGRectGetMinY(v17);
  self->_remoteContentViewHidden = v4;
  v7 = (void *)objc_opt_class();
  remoteContentView = self->_remoteContentView;
  -[AFUISiriView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  v9 = CGRectGetMinY(v18);
  if (self->_remoteContentViewHidden)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v7, "_animateView:fromYPosition:toYPosition:fade:completion:", remoteContentView, v10, 0, MinY, v9);
  -[AFUISiriView _lockViewFrame](self, "_lockViewFrame");
  v11 = CGRectGetMinY(v19);
  self->_lockViewHidden = !v4;
  v12 = (void *)objc_opt_class();
  lockContainerView = self->_lockContainerView;
  -[AFUISiriView _lockViewFrame](self, "_lockViewFrame");
  v14 = CGRectGetMinY(v20);
  if (self->_lockViewHidden)
    v15 = 2;
  else
    v15 = 1;
  objc_msgSend(v12, "_animateView:fromYPosition:toYPosition:fade:completion:", lockContainerView, v15, 0, v11, v14);
  -[AFUISiriView setStatusViewHidden:](self, "setStatusViewHidden:", v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)cancelShowingPasscodeUnlock
{
  -[AFUIPasscodeContainerView cancelShowingPasscodeUnlock](self->_lockContainerView, "cancelShowingPasscodeUnlock");
}

+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  _BOOL8 v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v11 = a7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  if (v11)
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDE5760]);
  objc_msgSend(v13, "setKeyPath:", CFSTR("position.y"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", v15);

  objc_msgSend(v13, "setMass:", 4.0);
  objc_msgSend(v13, "setStiffness:", 600.0);
  objc_msgSend(v13, "setDamping:", 800.0);
  objc_msgSend(v12, "addObject:", v13);
  if (a6)
  {
    v16 = a6 == 2;
    v17 = a6 != 2;
    v18 = v16;
    if (v16)
      v19 = 0.1;
    else
      v19 = 32.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
    a6 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x24BDE5760]);
    objc_msgSend(v21, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(v21, "setFromValue:", v20);
    objc_msgSend(v21, "setToValue:", a6);
    objc_msgSend(v21, "setMass:", v19);
    objc_msgSend(v21, "setStiffness:", 600.0);
    objc_msgSend(v21, "setDamping:", 800.0);
    objc_msgSend(v12, "addObject:", v21);

  }
  v22 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v22, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultTimingFunction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v23);

  objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
  objc_msgSend(v22, "setDuration:");
  objc_msgSend(v22, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v22, "setAnimations:", v12);
  objc_msgSend(v28, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v22, CFSTR("Animation Group"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if (a6)
  {
    objc_msgSend(v28, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a6, "floatValue");
    objc_msgSend(v25, "setOpacity:");

  }
  objc_msgSend(v28, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);

  objc_msgSend(v28, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPosition:", 0.0, a5);

}

- (float)audioLevelForSiriStatusView:(id)a3
{
  void *v4;
  float v5;
  float v6;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioRecordingPowerLevelForSiriView:", self);
  v6 = v5;

  return v6;
}

- (void)siriStatusViewWasTapped:(id)a3
{
  id v4;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewDidRecieveStatusViewTappedAction:", self);

}

- (void)siriStatusViewHoldDidBegin:(id)a3
{
  id v4;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewDidRecieveStatusViewHoldDidBeginAction:", self);

}

- (void)siriStatusViewHoldDidEnd:(id)a3
{
  id v4;

  -[AFUISiriView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewDidRecieveStatusViewHoldDidEndAction:", self);

}

- (BOOL)_isTextInputEnabled
{
  AFUISiriView *v2;
  void *v3;

  v2 = self;
  -[AFUISiriView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "siriViewShouldSupportTextInput:", v2);

  return (char)v2;
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (+[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState") == 2)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[AFUISiriView siriDidActivateFromSource:]";
      _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s Not dismissing lock view since we're at first unlock stage", buf, 0xCu);
    }
  }
  else
  {
    if ((unint64_t)a3 <= 0x17 && ((1 << a3) & 0x8C0000) != 0)
      -[SiriUISiriStatusViewProtocol forceMicVisible:](self->_siriStatusView, "forceMicVisible:", 1);
    -[AFUISiriView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriView:didReceiveSiriActivationMessageWithSource:", self, a3);

  }
}

- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD block[4];
  id v13;
  int64_t v14;

  v7 = (void *)MEMORY[0x219A0D984](a5, a2, a3);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
    v10 = dispatch_time(0, (uint64_t)(v9 * 0.15 * 1000000000.0));
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke;
    block[3] = &unk_24D7A1BD0;
    v13 = v7;
    v14 = a4;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

  }
  self->_inHideUnlockViewAnimation = 1;
  self->_inShowUnlockViewAnimation = 0;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2;
  v11[3] = &unk_24D7A1B30;
  v11[4] = self;
  -[AFUISiriView _animateLockViewIsAnimatingIn:completion:](self, "_animateLockViewIsAnimatingIn:completion:", 0, v11);

}

uint64_t __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 537) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  AFUISiriView *v4;
  AFUISiriViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "siriView:attemptUnlockWithPassword:", v4, v6);

  return (char)v4;
}

- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = a4;
  self->_inShowUnlockViewAnimation = 1;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke;
  v12[3] = &unk_24D7A1B30;
  v12[4] = self;
  -[AFUISiriView _animateLockViewIsAnimatingIn:completion:](self, "_animateLockViewIsAnimatingIn:completion:", 1, v12);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
  v8 = dispatch_time(0, (uint64_t)(v7 * 0.15 * 1000000000.0));
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24D7A1BA8;
  v11 = v5;
  v9 = v5;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

}

void __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 536) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logEventWithType:context:", 1433, 0);

}

uint64_t __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setContentViewsAlpha:(double)a3
{
  id v4;

  -[AFUISiriView foregroundContainerView](self, "foregroundContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (int64_t)mode
{
  return self->_mode;
}

- (AFUISiriViewDataSource)dataSource
{
  return (AFUISiriViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (AFUISiriViewDelegate)delegate
{
  return (AFUISiriViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_remoteContentView, 0);
  objc_storeStrong((id *)&self->_siriStatusView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_assistantVersionVisualEffectView, 0);
  objc_storeStrong((id *)&self->_assistantVersionLabel, 0);
  objc_storeStrong((id *)&self->_eyesFreeLogoView, 0);
  objc_storeStrong((id *)&self->_eyesFreeEffectView, 0);
  objc_storeStrong((id *)&self->_lockContainerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_voiceActivationMaskView, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_helpButton, 0);
  objc_storeStrong((id *)&self->_audioRoutePickerButton, 0);
  objc_storeStrong((id *)&self->_statusViewContainer, 0);
  objc_storeStrong((id *)&self->_dimmingAndLockContainer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)_updateSiriStatusViewForMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s AFUISiriView's mode set to SiriUIViewModeCompact. This should use AFUISiriViewCompact instead", a5, a6, a7, a8, 2u);
}

- (void)_updateSiriStatusViewForMode:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s AFUISiriView's mode set to SiriUIViewModeCarPlay. This should use AFUISiriCarPlayView instead", a5, a6, a7, a8, 2u);
}

@end
