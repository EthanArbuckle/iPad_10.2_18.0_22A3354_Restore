@implementation CCUISensorAttributionExpandedViewController

- (void)sensorAttributionsChanged:(id)a3
{
  objc_storeStrong((id *)&self->_activeAndRecentSensorActivityData, a3);
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3.right + -5.0;
  if (self->_edgeInsets.left != a3.left + -5.0 || self->_edgeInsets.right != v4)
  {
    self->_edgeInsets.top = a3.top;
    self->_edgeInsets.left = a3.left + -5.0;
    self->_edgeInsets.bottom = a3.bottom;
    self->_edgeInsets.right = v4;
    CCUIEdgeInsetsRTLSwap();
    v6 = v5;
    CCUIEdgeInsetsRTLSwap();
    v8 = v7;
    -[CCUISensorAttributionExpandedViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    -[CCUISensorAttributionExpandedViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15 - v6 - v8;

    -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v6, v11, v16, v13);

    -[CCUISensorAttributionExpandedViewController _recreateViewsForAttributionsAndCacheExpandedFrames](self, "_recreateViewsForAttributionsAndCacheExpandedFrames");
  }
}

- (CCUISensorAttributionExpandedViewController)initWithModuleInstanceManager:(id)a3
{
  id v4;
  CCUISensorAttributionExpandedViewController *v5;
  CCUISensorAttributionExpandedViewController *v6;
  NSString *audioModuleIdentifier;
  NSString *videoModuleIdentifier;
  uint64_t v9;
  CCUIModuleInstance *audioModuleInstance;
  uint64_t v11;
  CCUIModuleInstance *videoModuleInstance;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CCUISensorAttributionExpandedViewController;
  v5 = -[CCUISensorAttributionExpandedViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_moduleInstanceManager, v4);
    audioModuleIdentifier = v6->_audioModuleIdentifier;
    v6->_audioModuleIdentifier = (NSString *)CFSTR("com.apple.replaykit.AudioConferenceControlCenterModule");

    videoModuleIdentifier = v6->_videoModuleIdentifier;
    v6->_videoModuleIdentifier = (NSString *)CFSTR("com.apple.replaykit.VideoConferenceControlCenterModule");

    objc_msgSend(v4, "obtainModuleWithBundleIdentifier:uniqueIdentifier:", v6->_audioModuleIdentifier, v6->_audioModuleIdentifier);
    v9 = objc_claimAutoreleasedReturnValue();
    audioModuleInstance = v6->_audioModuleInstance;
    v6->_audioModuleInstance = (CCUIModuleInstance *)v9;

    objc_msgSend(v4, "obtainModuleWithBundleIdentifier:uniqueIdentifier:", v6->_videoModuleIdentifier, v6->_videoModuleIdentifier);
    v11 = objc_claimAutoreleasedReturnValue();
    videoModuleInstance = v6->_videoModuleInstance;
    v6->_videoModuleInstance = (CCUIModuleInstance *)v11;

  }
  return v6;
}

- (void)viewDidLoad
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
  void *v12;
  void *v13;
  MTMaterialView *v14;
  MTMaterialView *materialView;
  void *v16;
  UIView *v17;
  UIView *contentView;
  void *v19;
  id v20;
  UIScrollView *v21;
  UIScrollView *scrollView;
  void *v23;
  UITapGestureRecognizer *v24;
  UITapGestureRecognizer *dismissTapGestureRecognizer;
  void *v26;
  void *v27;
  void *v28;
  CCUISensorAttributionPrivacyHeaderView *v29;
  CCUISensorAttributionPrivacyHeaderView *privacyHeaderView;
  void *v31;
  void *v32;
  CCUISensorAttributionPrivacyHeaderView *v33;
  CCUISensorAttributionPrivacyHeaderView *audioVideoHeaderView;
  CCUIAudioVideoControlsView *v35;
  CCUIAudioVideoControlsView *v36;
  CCUIAudioVideoControlsView *audioVideoControlsView;
  void *v38;
  void *v39;
  CCUISensorAttributionGameModeFooterView *v40;
  CCUISensorAttributionGameModeFooterView *gameModeFooterView;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CCUISensorAttributionExpandedViewController;
  -[CCUISensorAttributionExpandedViewController viewDidLoad](&v43, sel_viewDidLoad);
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)MEMORY[0x1E0D47498];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("privacyCenterBackground"), v13, 0, &__block_literal_global_12, 0.0);
  v14 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  materialView = self->_materialView;
  self->_materialView = v14;

  -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self->_materialView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v5, v7, v9, v11);
  -[MTMaterialView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_materialView);

  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  self->_contentView = v17;

  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_contentView);

  v20 = objc_alloc(MEMORY[0x1E0DC3C28]);
  -[UIView bounds](self->_contentView, "bounds");
  v21 = (UIScrollView *)objc_msgSend(v20, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v21;

  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView layer](self->_scrollView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsGroupBlending:", 0);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_scrollView);
  v24 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_recognizedDismissTapGesture_);
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v24;

  -[UITapGestureRecognizer setDelegate:](self->_dismissTapGestureRecognizer, "setDelegate:", self);
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addGestureRecognizer:", self->_dismissTapGestureRecognizer);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_STATUS_PRIVACY"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = -[CCUISensorAttributionPrivacyHeaderView initWithTitle:systemImageName:]([CCUISensorAttributionPrivacyHeaderView alloc], "initWithTitle:systemImageName:", v28, CFSTR("hand.raised.fill"));
  privacyHeaderView = self->_privacyHeaderView;
  self->_privacyHeaderView = v29;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_privacyHeaderView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_STATUS_AUDIO_AND_VIDEO"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[CCUISensorAttributionPrivacyHeaderView initWithTitle:systemImageName:]([CCUISensorAttributionPrivacyHeaderView alloc], "initWithTitle:systemImageName:", v32, CFSTR("video.fill"));
  audioVideoHeaderView = self->_audioVideoHeaderView;
  self->_audioVideoHeaderView = v33;

  -[CCUISensorAttributionPrivacyHeaderView setHidden:](self->_audioVideoHeaderView, "setHidden:", 1);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_audioVideoHeaderView);
  v35 = [CCUIAudioVideoControlsView alloc];
  v36 = -[CCUIAudioVideoControlsView initWithFrame:](v35, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  audioVideoControlsView = self->_audioVideoControlsView;
  self->_audioVideoControlsView = v36;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_audioVideoControlsView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_GAME_MODE_HINT"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = -[CCUISensorAttributionGameModeFooterView initWithLabel:]([CCUISensorAttributionGameModeFooterView alloc], "initWithLabel:", v39);
  gameModeFooterView = self->_gameModeFooterView;
  self->_gameModeFooterView = v40;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_gameModeFooterView);
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("CCUISensorAttributionExpandedViewController"));

}

double __58__CCUISensorAttributionExpandedViewController_viewDidLoad__block_invoke()
{
  return 0.33;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)prepareForInteractionWithClonedCompactControl:(id)a3
{
  CCUIHeaderPocketViewSensorAttributionDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (!self->_prepared)
  {
    self->_prepared = 1;
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "willOpenExpandedSensorAttributionViewController");

    -[CCUISensorAttributionExpandedViewController _showClonedCompactControl:](self, "_showClonedCompactControl:", v5);
    -[CCUISensorAttributionExpandedViewController _recreateViewsForAttributionsAndCacheExpandedFrames](self, "_recreateViewsForAttributionsAndCacheExpandedFrames");
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      -[CCUISensorAttributionExpandedViewController _reduceMotionPrepareForPresentation](self, "_reduceMotionPrepareForPresentation");
    }
    else
    {
      -[CCUISensorAttributionPrivacyHeaderView setBlurRadius:](self->_privacyHeaderView, "setBlurRadius:", 0.0);
      -[CCUISensorAttributionGameModeFooterView setBlurRadius:](self->_gameModeFooterView, "setBlurRadius:", 0.0);
      -[CCUISensorAttributionPrivacyHeaderView setBlurRadius:](self->_audioVideoHeaderView, "setBlurRadius:", 0.0);
      -[CCUIAudioVideoControlsView setBlurRadius:](self->_audioVideoControlsView, "setBlurRadius:", 0.0);
      -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[CCUISensorAttributionExpandedViewController materialView](self, "materialView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      -[CCUISensorAttributionExpandedViewController materialView](self, "materialView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWeighting:", 0.0);

      -[CCUISensorAttributionExpandedViewController _applyCompactAppearanceToAllViews](self, "_applyCompactAppearanceToAllViews");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __93__CCUISensorAttributionExpandedViewController_prepareForInteractionWithClonedCompactControl___block_invoke;
      v10[3] = &unk_1E8CFC3D0;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v10, 0, 0.2, 0.0, 50.0, 0.0);
    }
  }
}

uint64_t __93__CCUISensorAttributionExpandedViewController_prepareForInteractionWithClonedCompactControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 0.329);
}

- (BOOL)isExpanded
{
  void *v2;
  void *v3;
  char v4;

  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  return v4;
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[CCUISensorAttributionExpandedViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", v5);

  -[CCUISensorAttributionExpandedViewController audioControlsContentViewController](self, "audioControlsContentViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionExpandedViewController videoControlsContentViewController](self, "videoControlsContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ccui_safelyBeginAppearanceTransition:animated:", v5, v4);
  objc_msgSend(v9, "ccui_safelyBeginAppearanceTransition:animated:", v5, v4);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[CCUISensorAttributionExpandedViewController _reduceMotionSetExpanded:animated:](self, "_reduceMotionSetExpanded:animated:", v5, v4);
  }
  else
  {
    -[CCUISensorAttributionCompactControl setExpanded:animated:](self->_clonedCompactControl, "setExpanded:animated:", v5, v4);
    if (v4)
    {
      -[CCUISensorAttributionExpandedViewController _animatePrivacyHeader:](self, "_animatePrivacyHeader:", v5);
      -[CCUISensorAttributionExpandedViewController _animateAllSensorButtonsForExpanded:](self, "_animateAllSensorButtonsForExpanded:", v5);
      -[CCUISensorAttributionExpandedViewController _animateEntityAndWebsiteViews:](self, "_animateEntityAndWebsiteViews:", v5);
      -[CCUISensorAttributionExpandedViewController _animateSeparatorViews:](self, "_animateSeparatorViews:", v5);
      -[CCUISensorAttributionExpandedViewController _animateCompactControlAlpha:](self, "_animateCompactControlAlpha:", v5);
      -[CCUISensorAttributionExpandedViewController _animateBackgroundBlurWeighting:](self, "_animateBackgroundBlurWeighting:", v5);
    }
    else if (!v5)
    {
      -[CCUISensorAttributionExpandedViewController _removeClonedCompactPillViewAndNotifyDelegate](self, "_removeClonedCompactPillViewAndNotifyDelegate");
    }
    objc_msgSend(v10, "ccui_safelyEndAppearanceTransition");
    objc_msgSend(v9, "ccui_safelyEndAppearanceTransition");
  }

}

- (void)setAudioVideoModeSelectionAttribution:(id)a3
{
  CCUISensorActivityData *v4;
  CCUISensorActivityData *audioVideoModeSelectionAttribution;
  CCUISensorAttributionPrivacyHeaderView *audioVideoHeaderView;
  void *v7;
  id v8;

  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (CCUISensorActivityData *)objc_msgSend(v8, "copy");
    audioVideoModeSelectionAttribution = self->_audioVideoModeSelectionAttribution;
    self->_audioVideoModeSelectionAttribution = v4;

    audioVideoHeaderView = self->_audioVideoHeaderView;
    objc_msgSend(v8, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView setTrailingText:](audioVideoHeaderView, "setTrailingText:", v7);

  }
}

- (void)setGameModeActivityDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_gameModeActivityDataProvider, a3);
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  CCUISensorAttributionCompactControl *clonedCompactControl;

  clonedCompactControl = self->_clonedCompactControl;
  if (clonedCompactControl)
    -[CCUISensorAttributionCompactControl gameModeStateDidChange:](clonedCompactControl, "gameModeStateDidChange:", a3);
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CCUIContentModuleContainerViewController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CCUIContentModuleContainerViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CCUIContentModuleContainerViewController *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CCUIContentModuleContainerViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = !a3;
  -[CCUISensorAttributionPrivacyHeaderView setHidden:](self->_audioVideoHeaderView, "setHidden:", v4);
  -[CCUIAudioVideoControlsView setHidden:](self->_audioVideoControlsView, "setHidden:", v4);
  if (!v4)
  {
    -[CCUIAudioVideoControlsView subviews](self->_audioVideoControlsView, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[CCUISensorAttributionExpandedViewController audioModuleIdentifier](self, "audioModuleIdentifier");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[CCUISensorAttributionExpandedViewController videoModuleIdentifier](self, "videoModuleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUISensorAttributionExpandedViewController audioModuleInstance](self, "audioModuleInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUISensorAttributionExpandedViewController videoModuleInstance](self, "videoModuleInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [CCUIContentModuleContainerViewController alloc];
      v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v33, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
      objc_msgSend(v33, "module");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D14780], "defaultControlCenterPresentationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CCUIContentModuleContainerViewController initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:](v8, "initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:", v34, v11, v12, v13);

      -[CCUIContentModuleContainerViewController setDelegate:](v14, "setDelegate:", self);
      -[CCUIContentModuleContainerViewController view](v14, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CCUISensorAttributionExpandedViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v14, self->_audioVideoControlsView);
      -[CCUIContentModuleContainerViewController contentViewController](v14, "contentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_audioControlsContentViewController, v15);

      -[CCUIContentModuleContainerViewController view](v14, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_audioControlsContainerView, v16);

      -[CCUIContentModuleContainerViewController contentViewController](v14, "contentViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_audioControlsView, v18);

      v19 = [CCUIContentModuleContainerViewController alloc];
      v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v7, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);
      objc_msgSend(v7, "module");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D14780], "defaultControlCenterPresentationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CCUIContentModuleContainerViewController initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:](v19, "initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:", v31, v22, v23, v24);

      -[CCUIContentModuleContainerViewController setDelegate:](v25, "setDelegate:", self);
      -[CCUIContentModuleContainerViewController view](v25, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CCUISensorAttributionExpandedViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v25, self->_audioVideoControlsView);
      -[CCUIContentModuleContainerViewController contentViewController](v25, "contentViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_videoControlsContentViewController, v27);

      -[CCUIContentModuleContainerViewController view](v25, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_videoControlsContainerView, v28);

      -[CCUIContentModuleContainerViewController contentViewController](v25, "contentViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_videoControlsView, v30);

    }
  }
}

- (void)recognizedDismissTapGesture:(id)a3
{
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self, "setExpanded:animated:", 0, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_interactiveViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "view", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v12, "isDescendantOfView:", v11);

        if ((v11 & 1) != 0)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)_clonedPillButtonPressed:(id)a3
{
  -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self, "setExpanded:animated:", 1, 1);
}

- (void)_animateAllSensorButtonsForExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CCUISensorAttributionExpandedViewController _topMostButtons](self, "_topMostButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[CCUISensorAttributionExpandedViewController _animateTopmostSensorButton:toExpanded:](self, "_animateTopmostSensorButton:toExpanded:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++), v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_subsequentSensorButtons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[CCUISensorAttributionExpandedViewController _animateSubsequentSensorIcon:toExpanded:](self, "_animateSubsequentSensorIcon:toExpanded:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v3, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_animateBackgroundBlurWeighting:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 IsReduceTransparencyEnabled;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD aBlock[5];
  BOOL v15;

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke;
  aBlock[3] = &unk_1E8CFC3F8;
  v15 = a3;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_2;
  v12[3] = &unk_1E8CFD180;
  v13 = a3;
  v12[4] = self;
  v7 = _Block_copy(v12);
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v9 = (void *)MEMORY[0x1E0DC3F10];
  if (IsReduceTransparencyEnabled)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v6, v7, 0.66, 0.0, 50.0, 0.0);
  }
  else
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_3;
    v10[3] = &unk_1E8CFD348;
    v11 = v7;
    objc_msgSend(v9, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v6, v10, 300.0, 30.0);

  }
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setWeighting:", v1);
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(_BYTE *)(result + 40))
      return objc_msgSend(*(id *)(result + 32), "_removeClonedCompactPillViewAndNotifyDelegate");
  }
  return result;
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_animateCompactControlAlpha:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__CCUISensorAttributionExpandedViewController__animateCompactControlAlpha___block_invoke;
  v3[3] = &unk_1E8CFC3D0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v3, 0, 0.66, 0.0, 50.0, 0.0);
}

uint64_t __75__CCUISensorAttributionExpandedViewController__animateCompactControlAlpha___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 1.0);
}

- (void)_animateSeparatorViews:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  double v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke;
  v9[3] = &unk_1E8CFC3F8;
  v9[4] = self;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v9, 0, 0.66, 0.0, 50.0, 0.0);
  v6 = 0.33;
  if (v3)
    v6 = 0.66;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke_2;
  v7[3] = &unk_1E8CFC3F8;
  v7[4] = self;
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v7, 0, v6, 0.0, 50.0, 0.0);
}

uint64_t __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applySeparatorsLayoutExpanded:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applySeparatorAlphaExpanded:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_animateEntityAndWebsiteViews:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  double v6;
  double v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke;
  v12[3] = &unk_1E8CFC3F8;
  v12[4] = self;
  v13 = a3;
  v6 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v12, 0, 0.66, 0.0, 50.0, 0.0);
  if (v3)
    v6 = 0.0770128355;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_2;
  v10[3] = &unk_1E8CFC3F8;
  v10[4] = self;
  v11 = v3;
  if (v3)
    v7 = 0.66;
  else
    v7 = 0.33;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v10, 0, 0.66, v6, 50.0, 0.0);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_3;
  v8[3] = &unk_1E8CFC3F8;
  v8[4] = self;
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v8, 0, v7, v6, 50.0, 0.0);
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyLayoutOfEntityAndWebsiteViewsExpanded:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAlphaAndBlurToFirstEntityViewExpanded:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAlphaAndBlurToSubsequentEntityAndWebsiteViewsExpanded:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_animatePrivacyHeader:(BOOL)a3
{
  double v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  v5 = 0.0;
  if (a3)
    v5 = 0.066;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke;
  v9[3] = &unk_1E8CFC3F8;
  v9[4] = self;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v9, 0, 0.66, v5, 50.0, 0.0);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke_2;
  v7[3] = &unk_1E8CFC3F8;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v7, 0, 0.66, 0.0, 50.0, 0.0);
}

uint64_t __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyPrivacyHeaderAlphaAndBlurRadius:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyPrivacyHeaderLayoutExpanded:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_animateTopmostSensorButton:(id)a3 toExpanded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  if (v4)
  {
    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke;
    v24[3] = &unk_1E8CFC3D0;
    v10 = v6;
    v25 = v10;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v24, 0, 0.66, 0.0, 50.0, 0.0);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_2;
    v22[3] = &unk_1E8CFC3D0;
    v23 = v10;
    v12 = v10;
    objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v22, 0, 0.66, 0.10801964, 50.0, 0.0);

    v13 = v25;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_3;
    v20[3] = &unk_1E8CFC540;
    v20[4] = self;
    v15 = v6;
    v21 = v15;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v20, 0, 0.66, 0.0, 50.0, 0.0);
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_4;
    v18[3] = &unk_1E8CFC3D0;
    v19 = v15;
    v17 = v15;
    objc_msgSend(v16, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v18, 0, 0.22, 0.0, 50.0, 0.0);

    v13 = v21;
  }

}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "cachedExpandedRect");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "sensorIconView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.5);

}

uint64_t __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyCompactLayoutToSensorButton:", *(_QWORD *)(a1 + 40));
}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_animateSubsequentSensorIcon:(id)a3 toExpanded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  if (v4)
  {
    v9 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke;
    v32[3] = &unk_1E8CFC3D0;
    v10 = v6;
    v33 = v10;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v32, 0, 0.540983607, 0.04, 50.0, 0.0);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_2;
    v30[3] = &unk_1E8CFC3D0;
    v12 = v10;
    v31 = v12;
    objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v30, 0, 0.66, 0.1, 50.0, 0.0);
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_3;
    v28[3] = &unk_1E8CFC3D0;
    v29 = v12;
    v14 = v12;
    objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v28, 0, 0.66, 0.16, 50.0, 0.0);

    v15 = v33;
  }
  else
  {
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_4;
    v26[3] = &unk_1E8CFC540;
    v26[4] = self;
    v17 = v6;
    v27 = v17;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v26, 0, 0.66, 0.0, 50.0, 0.0);
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_5;
    v24[3] = &unk_1E8CFC3D0;
    v19 = v17;
    v25 = v19;
    objc_msgSend(v18, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v24, 0, 0.22, 0.0, 50.0, 0.0);
    v20 = (void *)MEMORY[0x1E0DC3F10];
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_6;
    v22[3] = &unk_1E8CFC3D0;
    v23 = v19;
    v21 = v19;
    objc_msgSend(v20, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v22, 0, 0.33, 0.0, 50.0, 0.0);

    v15 = v27;
  }

}

uint64_t __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "cachedExpandedRect");
  return objc_msgSend(v1, "setFrame:");
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sensorIconView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.5);

}

uint64_t __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyCompactLayoutToSensorButton:", *(_QWORD *)(a1 + 40));
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sensorIconView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_applyAlphaAndBlurToFirstEntityViewExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[NSArray firstObject](self->_entityAndWebsiteViews, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[CCUISensorAttributionExpandedViewController _applyAlphaAndStylingToEntityOrWebsiteView:expanded:](self, "_applyAlphaAndStylingToEntityOrWebsiteView:expanded:", v5, v3);
    v5 = v6;
  }

}

- (void)_applyAlphaAndBlurToSubsequentEntityAndWebsiteViewsExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[NSArray firstObject](self->_entityAndWebsiteViews, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_entityAndWebsiteViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (v11 != v5)
          -[CCUISensorAttributionExpandedViewController _applyAlphaAndStylingToEntityOrWebsiteView:expanded:](self, "_applyAlphaAndStylingToEntityOrWebsiteView:expanded:", v11, v3, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_applySeparatorsLayoutExpanded:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = self->_separatorViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "cachedExpandedRect");
          objc_msgSend(v9, "setFrame:");
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v6);
    }
  }
  else
  {
    -[CCUISensorAttributionCompactControl frame](self->_clonedCompactControl, "frame");
    v11 = v10;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_separatorViews;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = v11 + -5.0;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v4);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          objc_msgSend(v18, "cachedExpandedRect", (_QWORD)v19);
          v31 = CGRectInset(v30, 10.0, 0.0);
          v14 = v17 + 10.0;
          objc_msgSend(v18, "setFrame:", v31.origin.x, v17, v31.size.width, v31.size.height);
          ++v16;
          v17 = v17 + 10.0;
        }
        while (v13 != v16);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }
  }

}

- (void)_applySeparatorAlphaExpanded:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_separatorViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    if (v3)
      v8 = 0.5;
    else
      v8 = 0.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", v8, (_QWORD)v10);
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_applyPrivacyHeaderLayoutExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 *v14;
  CCUISensorAttributionPrivacyHeaderView *privacyHeaderView;
  __int128 v16;
  double v17;
  CCUISensorAttributionPrivacyHeaderView *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CCUISensorAttributionPrivacyHeaderView *audioVideoHeaderView;
  __int128 v29;
  double v30;
  CCUISensorAttributionPrivacyHeaderView *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CCUIAudioVideoControlsView *audioVideoControlsView;
  __int128 v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CCUISensorAttributionGameModeFooterView *gameModeFooterView;
  __int128 v53;
  double v54;
  CCUISensorAttributionGameModeFooterView *v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v3 = a3;
  -[CCUISensorAttributionExpandedViewController privacyHeaderView](self, "privacyHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedExpandedRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (__int128 *)MEMORY[0x1E0C9BAA8];
  privacyHeaderView = self->_privacyHeaderView;
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v59 = *MEMORY[0x1E0C9BAA8];
  v60 = v16;
  v61 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CCUISensorAttributionPrivacyHeaderView setTransform:](privacyHeaderView, "setTransform:", &v59);
  if (v3)
  {
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_privacyHeaderView, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    -[CCUISensorAttributionCompactControl frame](self->_clonedCompactControl, "frame");
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_privacyHeaderView, "setFrame:", v7, v17 + -10.0, v11, v13);
    v18 = self->_privacyHeaderView;
    CGAffineTransformMakeScale(&v58, 0.43, 0.43);
    -[CCUISensorAttributionPrivacyHeaderView setTransform:](v18, "setTransform:", &v58);
  }
  -[CCUISensorAttributionExpandedViewController audioVideoHeaderView](self, "audioVideoHeaderView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cachedExpandedRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  audioVideoHeaderView = self->_audioVideoHeaderView;
  v29 = v14[1];
  v59 = *v14;
  v60 = v29;
  v61 = v14[2];
  -[CCUISensorAttributionPrivacyHeaderView setTransform:](audioVideoHeaderView, "setTransform:", &v59);
  if (v3)
  {
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_audioVideoHeaderView, "setFrame:", v21, v23, v25, v27);
  }
  else
  {
    -[CCUISensorAttributionCompactControl frame](self->_clonedCompactControl, "frame");
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_audioVideoHeaderView, "setFrame:", v21, v30 + -10.0, v25, v27);
    v31 = self->_audioVideoHeaderView;
    CGAffineTransformMakeScale(&v57, 0.43, 0.43);
    -[CCUISensorAttributionPrivacyHeaderView setTransform:](v31, "setTransform:", &v57);
  }
  -[CCUISensorAttributionExpandedViewController audioVideoControlsView](self, "audioVideoControlsView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cachedExpandedRect");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  audioVideoControlsView = self->_audioVideoControlsView;
  v42 = v14[1];
  v59 = *v14;
  v60 = v42;
  v61 = v14[2];
  -[CCUIAudioVideoControlsView setTransform:](audioVideoControlsView, "setTransform:", &v59);
  -[CCUIAudioVideoControlsView setFrame:](self->_audioVideoControlsView, "setFrame:", v34, v36, v38, v40);
  -[CCUISensorAttributionExpandedViewController gameModeFooterView](self, "gameModeFooterView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "cachedExpandedRect");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  gameModeFooterView = self->_gameModeFooterView;
  v53 = v14[1];
  v59 = *v14;
  v60 = v53;
  v61 = v14[2];
  -[CCUISensorAttributionGameModeFooterView setTransform:](gameModeFooterView, "setTransform:", &v59);
  if (v3)
  {
    -[CCUISensorAttributionGameModeFooterView setFrame:](self->_gameModeFooterView, "setFrame:", v45, v47, v49, v51);
  }
  else
  {
    -[CCUISensorAttributionCompactControl frame](self->_clonedCompactControl, "frame");
    -[CCUISensorAttributionGameModeFooterView setFrame:](self->_gameModeFooterView, "setFrame:", v45, v54 + -10.0, v49, v51);
    v55 = self->_gameModeFooterView;
    CGAffineTransformMakeScale(&v56, 0.43, 0.43);
    -[CCUISensorAttributionGameModeFooterView setTransform:](v55, "setTransform:", &v56);
  }
}

- (void)_applyPrivacyHeaderAlphaAndBlurRadius:(BOOL)a3
{
  CCUISensorAttributionPrivacyHeaderView *privacyHeaderView;
  double v5;
  double v6;
  int *v7;
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  privacyHeaderView = self->_privacyHeaderView;
  if (a3)
    v5 = 0.0;
  else
    v5 = 5.0;
  if (a3)
    v6 = 1.0;
  else
    v6 = 0.0;
  if (a3)
    v7 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoHeaderView;
  else
    v7 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__gameModeFooterView;
  if (a3)
    v8 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoControlsView;
  else
    v8 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoHeaderView;
  if (a3)
    v9 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__gameModeFooterView;
  else
    v9 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoControlsView;
  -[CCUISensorAttributionPrivacyHeaderView setBlurRadius:](privacyHeaderView, "setBlurRadius:", v5);
  -[CCUISensorAttributionPrivacyHeaderView setAlpha:](self->_privacyHeaderView, "setAlpha:", v6);
  v10 = *v7;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "setBlurRadius:", v5);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "setAlpha:", v6);
  v11 = *v8;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "setBlurRadius:", v5);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "setAlpha:", v6);
  v12 = *v9;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "setBlurRadius:", v5);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "setAlpha:", v6);
}

- (void)_applyLayoutOfEntityAndWebsiteViewsExpanded:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
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
  void *v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_entityAndWebsiteViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "cachedExpandedRect", (_QWORD)v26);
        if (v3)
        {
          objc_msgSend(v10, "cachedExpandedRect");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
        }
        else
        {
          v20 = v11;
          objc_msgSend(v10, "cachedExpandedRect");
          v17 = v21;
          v19 = v22;
          -[CCUISensorAttributionCompactControl frame](self->_clonedCompactControl, "frame");
          v15 = v23;
          objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "userInterfaceLayoutDirection") == 1)
            v25 = -20.0;
          else
            v25 = 20.0;
          v13 = v20 + v25;

        }
        objc_msgSend(v10, "setFrame:", v13, v15, v17, v19);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

}

- (void)_applyAlphaAndStylingToEntityOrWebsiteView:(id)a3 expanded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v4 = a4;
  v5 = a3;
  v8 = v5;
  v6 = 1.0;
  if (v4)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = 0.0;
    v7 = 5.0;
  }
  objc_msgSend(v5, "setAlpha:", v6);
  objc_msgSend(v8, "setBlurRadius:", v7);

}

- (void)_applyCompactLayoutToSensorButton:(id)a3
{
  void *v4;
  CCUISensorAttributionCompactControl *clonedCompactControl;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  id v33;

  v33 = a3;
  if (v33)
  {
    -[CCUISensorAttributionExpandedViewController _iconInCompactViewForSensorType:](self, "_iconInCompactViewForSensorType:", objc_msgSend(v33, "sensorType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    clonedCompactControl = self->_clonedCompactControl;
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionCompactControl convertRect:toView:](clonedCompactControl, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;

    objc_msgSend(v33, "frame");
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

    if (v24 == 1)
    {
      objc_msgSend(v33, "bounds");
      v26 = v16 - v25;
      objc_msgSend(v4, "bounds");
      v16 = v26 + v27;
    }
    objc_msgSend(v33, "bounds");
    v29 = v28;
    objc_msgSend(v33, "sensorIconView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v29 - v31;

    objc_msgSend(v33, "setFrame:", v16, v18 + v32 * -0.5, v20, v22);
  }

}

- (void)_applyCompactAlphaForSensorButton:(id)a3 isTopMost:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(v5, "sensorIconView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = 0.329;
  if (!v4)
    v7 = 0.0;
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)_applyCompactAppearanceToAllViews
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[CCUISensorAttributionExpandedViewController _applyLayoutOfEntityAndWebsiteViewsExpanded:](self, "_applyLayoutOfEntityAndWebsiteViewsExpanded:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = self->_entityAndWebsiteViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "setAlpha:", 0.0);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v5);
  }

  -[CCUISensorAttributionExpandedViewController _applySeparatorsLayoutExpanded:](self, "_applySeparatorsLayoutExpanded:", 0);
  -[CCUISensorAttributionExpandedViewController _applySeparatorAlphaExpanded:](self, "_applySeparatorAlphaExpanded:", 0);
  -[CCUISensorAttributionExpandedViewController _applyPrivacyHeaderLayoutExpanded:](self, "_applyPrivacyHeaderLayoutExpanded:", 0);
  -[CCUISensorAttributionExpandedViewController _applyPrivacyHeaderAlphaAndBlurRadius:](self, "_applyPrivacyHeaderAlphaAndBlurRadius:", 0);
  -[CCUISensorAttributionExpandedViewController _topMostButtons](self, "_topMostButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        -[CCUISensorAttributionExpandedViewController _applyCompactLayoutToSensorButton:](self, "_applyCompactLayoutToSensorButton:", v13);
        -[CCUISensorAttributionExpandedViewController _applyCompactAlphaForSensorButton:isTopMost:](self, "_applyCompactAlphaForSensorButton:isTopMost:", v13, 1);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v10);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_subsequentSensorButtons;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k);
        -[CCUISensorAttributionExpandedViewController _applyCompactLayoutToSensorButton:](self, "_applyCompactLayoutToSensorButton:", v19, (_QWORD)v20);
        -[CCUISensorAttributionExpandedViewController _applyCompactAlphaForSensorButton:isTopMost:](self, "_applyCompactAlphaForSensorButton:isTopMost:", v19, 0);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }

}

- (void)_showClonedCompactControl:(id)a3
{
  CCUISensorAttributionCompactControl *v4;
  CCUISensorAttributionCompactControl *clonedCompactControl;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CCUISensorAttributionCompactControl *v11;

  v4 = (CCUISensorAttributionCompactControl *)a3;
  -[CCUISensorAttributionCompactControl removeFromSuperview](self->_clonedCompactControl, "removeFromSuperview");
  clonedCompactControl = self->_clonedCompactControl;
  self->_clonedCompactControl = v4;
  v11 = v4;

  -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v11);

  -[CCUISensorAttributionCompactControl setNeedsLayout](v11, "setNeedsLayout");
  -[CCUISensorAttributionCompactControl layoutIfNeeded](v11, "layoutIfNeeded");
  -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 * 0.5;

  -[CCUISensorAttributionCompactControl center](self->_clonedCompactControl, "center");
  -[CCUISensorAttributionCompactControl setCenter:](v11, "setCenter:", v9);
  -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v11);

  -[CCUISensorAttributionCompactControl setHidden:](self->_clonedCompactControl, "setHidden:", 0);
}

- (void)_removeClonedCompactPillViewAndNotifyDelegate
{
  CCUISensorAttributionCompactControl *clonedCompactControl;
  id WeakRetained;

  self->_prepared = 0;
  -[CCUISensorAttributionCompactControl removeFromSuperview](self->_clonedCompactControl, "removeFromSuperview");
  clonedCompactControl = self->_clonedCompactControl;
  self->_clonedCompactControl = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didCloseExpandedSensorAttributionViewController");

}

- (void)_recreateViewsForAttributionsAndCacheExpandedFrames
{
  CCUISensorAttributionExpandedViewController *v2;
  void *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  CCUISensorAttributionSensorButton *topMostCameraButton;
  CCUISensorAttributionSensorButton *topMostMicButton;
  CCUISensorAttributionSensorButton *topMostLocButton;
  CCUISensorAttributionPrivacyHeaderView *privacyHeaderView;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  uint64_t m;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CCUISensorEntityNameAndIconView *v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  double v72;
  void *v73;
  double v74;
  _BOOL4 v75;
  double v76;
  double v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  void *v84;
  uint64_t ii;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  CCUISensorAttributionWebsiteView *v108;
  CCUISensorAttributionSensorButton *v109;
  id v110;
  _BOOL4 v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CCUISensorAttributionPrivacyHeaderView *audioVideoHeaderView;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  double v140;
  id WeakRetained;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  id v153;
  id v154;
  double v155;
  id v156;
  char v157;
  uint64_t jj;
  void *v159;
  void *v160;
  CCUISensorEntityHeaderView *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t kk;
  CCUISensorEntityHeaderView *v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  CCUISensorEntityHeaderView *v171;
  id v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  uint64_t v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  void *v183;
  double v184;
  double v185;
  CCUISensorEntityHeaderView *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t mm;
  void *v191;
  CCUIGameModeControlsView *v192;
  id v193;
  void *v194;
  CCUIGameModeControlsView *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  id v204;
  double v205;
  void *v206;
  void *v207;
  CCUISensorAttributionGameModeFooterView *gameModeFooterView;
  void *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  void *v218;
  double v219;
  void *v220;
  double v221;
  UIScrollView *scrollView;
  double v223;
  uint64_t v224;
  NSArray *entityAndWebsiteViews;
  uint64_t v226;
  NSArray *subsequentSensorButtons;
  uint64_t v228;
  NSArray *separatorViews;
  uint64_t v230;
  NSArray *interactiveViews;
  uint64_t v232;
  id v233;
  uint64_t v234;
  uint64_t v235;
  id obj;
  void *v237;
  id v238;
  id v239;
  uint64_t v240;
  uint64_t v241;
  NSSet *v242;
  void *v243;
  uint64_t v244;
  _BOOL4 IsAccessibilityCategory;
  void *v246;
  void *v247;
  CCUISensorEntityNameAndIconView *v248;
  CCUISensorEntityHeaderView *v249;
  void *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  char v254;
  CCUISensorEntityHeaderView *v255;
  id *p_isa;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  _BYTE v293[128];
  _BYTE v294[128];
  _BYTE v295[128];
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE v298[128];
  _BYTE v299[128];
  _BYTE v300[128];
  _BYTE v301[128];
  uint64_t v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;

  v2 = self;
  v302 = *MEMORY[0x1E0C80C00];
  -[CCUISensorAttributionExpandedViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[CCUISensorAttributionExpandedViewController traitCollection](v2, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v232 = v6;

  v7 = v2->_activeAndRecentSensorActivityData;
  CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v7);
  v289 = 0u;
  v290 = 0u;
  v291 = 0u;
  v292 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v289, v301, 16);
  if (v8)
  {
    v9 = v8;
    v254 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v290;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v290 != v11)
          objc_enumerationMutation(obj);
        CCUISortedAttributionsForEntity(*(void **)(*((_QWORD *)&v289 + 1) + 8 * i), v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v285 = 0u;
        v286 = 0u;
        v287 = 0u;
        v288 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v285, v300, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v286;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v286 != v16)
                objc_enumerationMutation(v13);
              v18 = CCUISectionForSensorType(objc_msgSend(*(id *)(*((_QWORD *)&v285 + 1) + 8 * j), "sensorType", v232));
              if (v18)
              {
                v254 = 1;
              }
              else if (!v18)
              {
                v10 = 1;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v285, v300, 16);
          }
          while (v15);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v289, v301, 16);
    }
    while (v9);
  }
  else
  {
    v254 = 0;
    v10 = 0;
  }

  -[UIScrollView setContentOffset:animated:](v2->_scrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v283 = 0u;
  v284 = 0u;
  v281 = 0u;
  v282 = 0u;
  -[UIScrollView subviews](v2->_scrollView, "subviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v281, v299, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v282;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v282 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * k);
        if (v24 != v2->_privacyHeaderView
          && v24 != v2->_gameModeFooterView
          && v24 != v2->_audioVideoHeaderView
          && v24 != v2->_audioVideoControlsView)
        {
          objc_msgSend(v24, "removeFromSuperview");
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v281, v299, 16);
    }
    while (v21);
  }

  topMostCameraButton = v2->_topMostCameraButton;
  v2->_topMostCameraButton = 0;

  topMostMicButton = v2->_topMostMicButton;
  v2->_topMostMicButton = 0;

  topMostLocButton = v2->_topMostLocButton;
  v2->_topMostLocButton = 0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  privacyHeaderView = v2->_privacyHeaderView;
  v29 = 0x1E0DC3000uLL;
  p_isa = (id *)&v2->super.super.super.isa;
  v242 = v7;
  if ((v10 & 1) != 0)
  {
    -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;
    LODWORD(v31) = 1148846080;
    LODWORD(v33) = 1132068864;
    -[CCUISensorAttributionPrivacyHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](privacyHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v32, v34, v31, v33);
    v36 = v35;
    v38 = v37;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 2.0;
    if (objc_msgSend(v39, "userInterfaceLayoutDirection") == 1)
    {
      -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bounds");
      v40 = v42 - v36 + -2.0;

    }
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](v2->_privacyHeaderView, "setFrame:", v40, 80.0, v36, v38);
    -[CCUISensorAttributionPrivacyHeaderView setCachedExpandedRect:](v2->_privacyHeaderView, "setCachedExpandedRect:", v40, 80.0, v36, v38);
    -[CCUISensorAttributionPrivacyHeaderView setHidden:](v2->_privacyHeaderView, "setHidden:", 0);
    v303.origin.x = v40;
    v303.origin.y = 80.0;
    v303.size.width = v36;
    v303.size.height = v38;
    v277 = 0u;
    v278 = 0u;
    v43 = CGRectGetMaxY(v303) + 25.0;
    v279 = 0u;
    v280 = 0u;
    v233 = obj;
    v235 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v277, v298, 16);
    if (v235)
    {
      v234 = *(_QWORD *)v278;
      do
      {
        for (m = 0; m != v235; ++m)
        {
          if (*(_QWORD *)v278 != v234)
            objc_enumerationMutation(v233);
          v45 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * m);
          CCUISortedAttributionsForEntity(v45, v7);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v273 = 0u;
          v274 = 0u;
          v275 = 0u;
          v276 = 0u;
          v47 = v46;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v273, v297, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v274;
            while (2)
            {
              for (n = 0; n != v49; ++n)
              {
                if (*(_QWORD *)v274 != v50)
                  objc_enumerationMutation(v47);
                if (!CCUISectionForSensorType(objc_msgSend(*(id *)(*((_QWORD *)&v273 + 1) + 8 * n), "sensorType", v232)))
                {

                  -[CCUISensorAttributionExpandedViewController _makeHeaderSeparatorView](v2, "_makeHeaderSeparatorView");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "bounds");
                  v56 = v55;

                  objc_msgSend(v53, "setFrame:", 0.0, v43 + -15.0, v56, 1.0);
                  objc_msgSend(v53, "frame");
                  objc_msgSend(v53, "setCachedExpandedRect:");
                  objc_msgSend(v243, "addObject:", v53);
                  v237 = v53;
                  -[UIScrollView addSubview:](v2->_scrollView, "addSubview:", v53);
                  -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "bounds");
                  v59 = v58;
                  if (!IsAccessibilityCategory)
                  {
                    UIRoundToScale();
                    v59 = v60;
                  }

                  v61 = v59 + -10.0;
                  +[CCUISensorEntityNameAndIconView iconSize](CCUISensorEntityNameAndIconView, "iconSize");
                  v63 = v62
                      * (double)(+[CCUISensorEntityNameAndIconView maximumNumberOfLines](CCUISensorEntityNameAndIconView, "maximumNumberOfLines")+ 1);
                  v64 = -[CCUISensorEntityNameAndIconView initWithSensorEntity:maxSize:]([CCUISensorEntityNameAndIconView alloc], "initWithSensorEntity:maxSize:", v45, v59 + -10.0, v63);
                  v65 = objc_alloc_init(MEMORY[0x1E0DC3998]);
                  -[CCUISensorEntityNameAndIconView addInteraction:](v64, "addInteraction:", v65);

                  objc_msgSend(v253, "addObject:", v64);
                  -[UIScrollView addSubview:](v2->_scrollView, "addSubview:", v64);
                  -[CCUISensorEntityNameAndIconView frame](v64, "frame");
                  v67 = v66;
                  v69 = v68;
                  objc_msgSend(*(id *)(v29 + 1136), "sharedApplication");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = objc_msgSend(v70, "userInterfaceLayoutDirection");

                  v72 = 2.0;
                  if (v71 == 1)
                  {
                    -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "bounds");
                    v72 = v74 - v67 + -2.0;

                  }
                  v240 = m;
                  -[CCUISensorEntityNameAndIconView setFrame:](v64, "setFrame:", v72, v43, v67, v69);
                  -[CCUISensorEntityNameAndIconView setCachedExpandedRect:](v64, "setCachedExpandedRect:", v72, v43, v67, v69);
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v250 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = IsAccessibilityCategory;
                  if (!IsAccessibilityCategory)
                    v59 = v59 + 5.0;
                  v76 = 0.0;
                  v77 = 0.0;
                  if (!IsAccessibilityCategory)
                  {
                    objc_msgSend(*(id *)(v29 + 1136), "sharedApplication");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v78, "userInterfaceLayoutDirection") == 1)
                      v77 = 0.0;
                    else
                      v77 = v61;

                  }
                  v271 = 0u;
                  v272 = 0u;
                  v269 = 0u;
                  v270 = 0u;
                  v238 = v47;
                  v79 = v47;
                  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v269, v296, 16);
                  if (v80)
                  {
                    v81 = v80;
                    v82 = 0;
                    v83 = *(_QWORD *)v270;
                    v84 = v250;
                    v248 = v64;
                    do
                    {
                      for (ii = 0; ii != v81; ++ii)
                      {
                        if (*(_QWORD *)v270 != v83)
                          objc_enumerationMutation(v79);
                        v86 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * ii);
                        if (!CCUISectionForSensorType(objc_msgSend(v86, "sensorType")))
                        {
                          objc_msgSend(v86, "website");
                          v87 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v87)
                          {
                            -[CCUISensorEntityNameAndIconView frame](v64, "frame");
                            if (v43 < CGRectGetMaxY(v304))
                            {
                              -[CCUISensorEntityNameAndIconView frame](v64, "frame");
                              v89 = v88;
                              objc_msgSend((id)objc_opt_class(), "iconSize");
                              v43 = v43 + v89 - v90;
                            }
                            if (!objc_msgSend(v84, "count"))
                            {
                              objc_msgSend(v79, "firstObject");
                              v91 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v86 == v91)
                                v43 = v43 + 25.0;
                            }
                            objc_msgSend(v86, "website");
                            v92 = (void *)objc_claimAutoreleasedReturnValue();
                            v93 = v84;
                            v94 = objc_msgSend(v84, "containsObject:", v92);

                            if ((v94 & 1) == 0)
                            {
                              objc_msgSend(v86, "website");
                              v95 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v93, "addObject:", v95);

                              objc_msgSend(p_isa, "contentView");
                              v96 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v96, "bounds");
                              v98 = v97;

                              +[CCUISensorEntityNameAndIconView iconSize](CCUISensorEntityNameAndIconView, "iconSize");
                              v100 = v99 + 2.0;
                              +[CCUISensorEntityNameAndIconView horizontalPaddingBetweenIconAndLabel](CCUISensorEntityNameAndIconView, "horizontalPaddingBetweenIconAndLabel");
                              v102 = v100 + v101;
                              objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
                              v103 = (void *)objc_claimAutoreleasedReturnValue();
                              v104 = objc_msgSend(v103, "userInterfaceLayoutDirection");

                              v105 = v98 - v102 - (v98 * 0.5 + 5.0 + 5.0);
                              if (v104 == 1)
                                v106 = v98 * 0.5 + 5.0 + 5.0;
                              else
                                v106 = v102;
                              if (v104 == 1)
                                v107 = v105;
                              else
                                v107 = v77 + -5.0 - v102;
                              v108 = -[CCUISensorAttributionWebsiteView initWithSensorActivityData:maxSize:]([CCUISensorAttributionWebsiteView alloc], "initWithSensorActivityData:maxSize:", v86, v107, 20.0);
                              v75 = IsAccessibilityCategory;
                              objc_msgSend(p_isa[127], "addSubview:", v108);
                              -[CCUISensorAttributionWebsiteView setFrame:](v108, "setFrame:", v106, v43, v107, 20.0);
                              -[CCUISensorAttributionWebsiteView setCachedExpandedRect:](v108, "setCachedExpandedRect:", v106, v43, v107, 20.0);
                              objc_msgSend(v253, "addObject:", v108);

                            }
                            v64 = v248;
                          }
                          v109 = -[CCUISensorAttributionSensorButton initWithSensorActivityData:]([CCUISensorAttributionSensorButton alloc], "initWithSensorActivityData:", v86);
                          v110 = objc_alloc_init(MEMORY[0x1E0DC3998]);
                          -[CCUISensorAttributionSensorButton addInteraction:](v109, "addInteraction:", v110);

                          if ((objc_msgSend(p_isa, "_cacheTopmostSensorButtonIfNotAlreadySet:sensorData:", v109, v86) & 1) == 0)
                            objc_msgSend(v247, "addObject:", v109);
                          if (v82)
                            v111 = 0;
                          else
                            v111 = v75;
                          if (v111)
                          {
                            -[CCUISensorEntityNameAndIconView bounds](v64, "bounds");
                            v43 = v43 + v112;
                          }
                          v84 = v250;
                          -[CCUISensorAttributionSensorButton sizeThatFits:](v109, "sizeThatFits:", v59, v63);
                          v114 = v113;
                          v115 = 0.0;
                          if (!v75)
                          {
                            objc_msgSend((id)objc_opt_class(), "iconSize");
                            v115 = (v116 - v114) * 0.5;
                          }
                          -[CCUISensorAttributionSensorButton setFrame:](v109, "setFrame:", v77, v43 + v115, v59, v114);
                          -[CCUISensorAttributionSensorButton setCachedExpandedRect:](v109, "setCachedExpandedRect:", v77, v43 + v115, v59, v114);
                          -[CCUISensorAttributionSensorButton bounds](v109, "bounds");
                          v76 = v43 + v115 + v117 + 5.0;
                          objc_msgSend(p_isa[127], "addSubview:", v109);
                          ++v82;

                          v43 = v76;
                        }
                      }
                      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v269, v296, 16);
                    }
                    while (v81);
                  }

                  -[CCUISensorEntityNameAndIconView frame](v64, "frame");
                  if (v76 < CGRectGetMaxY(v305))
                  {
                    -[CCUISensorEntityNameAndIconView frame](v64, "frame");
                    v43 = v43 + CGRectGetMaxY(v306) - v76;
                  }
                  v29 = 0x1E0DC3000;
                  v47 = v238;
                  m = v240;
                  v52 = v237;
                  v43 = v43 + 25.0;

                  v2 = (CCUISensorAttributionExpandedViewController *)p_isa;
                  v7 = v242;
                  goto LABEL_97;
                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v273, v297, 16);
              if (v49)
                continue;
              break;
            }
          }
          v52 = v47;
LABEL_97:

        }
        v235 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v277, v298, 16);
      }
      while (v235);
    }

    v118 = v43 + -25.0 + 25.0;
  }
  else
  {
    -[CCUISensorAttributionPrivacyHeaderView setHidden:](privacyHeaderView, "setHidden:", 1);
    v118 = 80.0;
  }
  if ((-[CCUISensorAttributionPrivacyHeaderView isHidden](v2->_audioVideoHeaderView, "isHidden", v232) & 1) == 0)
  {
    audioVideoHeaderView = v2->_audioVideoHeaderView;
    -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "bounds");
    v122 = v121;
    v124 = v123;
    LODWORD(v121) = 1148846080;
    LODWORD(v123) = 1132068864;
    -[CCUISensorAttributionPrivacyHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](audioVideoHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v122, v124, v121, v123);
    v126 = v125;
    v128 = v127;

    objc_msgSend(*(id *)(v29 + 1136), "sharedApplication");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = 2.0;
    if (objc_msgSend(v129, "userInterfaceLayoutDirection") == 1)
    {
      -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "bounds");
      v130 = v132 - v126 + -2.0;

    }
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](v2->_audioVideoHeaderView, "setFrame:", v130, v118, v126, v128);
    -[CCUISensorAttributionPrivacyHeaderView setCachedExpandedRect:](v2->_audioVideoHeaderView, "setCachedExpandedRect:", v130, v118, v126, v128);
    v133 = v118 + v128 + 25.0;
    -[CCUISensorAttributionExpandedViewController _makeHeaderSeparatorView](v2, "_makeHeaderSeparatorView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "bounds");
    v137 = v136;

    objc_msgSend(v134, "setFrame:", 0.0, v133 + -15.0, v137, 1.0);
    objc_msgSend(v134, "frame");
    objc_msgSend(v134, "setCachedExpandedRect:");
    objc_msgSend(v243, "addObject:", v134);
    -[UIScrollView addSubview:](v2->_scrollView, "addSubview:", v134);
    -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "bounds");
    v140 = v139;

    WeakRetained = objc_loadWeakRetained((id *)&v2->_audioControlsView);
    if (WeakRetained
      && (v142 = WeakRetained,
          v143 = objc_loadWeakRetained((id *)&v2->_videoControlsView),
          v143,
          v142,
          v143))
    {
      -[CCUISensorAttributionExpandedViewController audioControlsContentViewController](v2, "audioControlsContentViewController");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUISensorAttributionExpandedViewController videoControlsContentViewController](v2, "videoControlsContentViewController");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "view");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "view");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "intrinsicContentSize");
      v149 = v148;
      objc_msgSend(v147, "intrinsicContentSize");
      v151 = v150;
      objc_msgSend(v252, "addObject:", v146);
      objc_msgSend(v252, "addObject:", v147);
      v152 = v140 + 0.0;
      -[CCUIAudioVideoControlsView setFrame:](v2->_audioVideoControlsView, "setFrame:");
      -[CCUIAudioVideoControlsView setCachedExpandedRect:](v2->_audioVideoControlsView, "setCachedExpandedRect:", 0.0, v133, v152, v151 + v149 + 0.0 + 20.0);
      v153 = objc_loadWeakRetained((id *)&v2->_audioControlsContainerView);
      objc_msgSend(v153, "setFrame:", 0.0, 0.0, v152, v149);

      v154 = objc_loadWeakRetained((id *)&v2->_videoControlsContainerView);
      objc_msgSend(v154, "setFrame:", 0.0, v149 + 0.0 + 20.0, v152, v151);

      -[CCUIAudioVideoControlsView frame](v2->_audioVideoControlsView, "frame");
      v133 = v133 + v155;

      v7 = v242;
    }
    else
    {
      -[CCUIAudioVideoControlsView setFrame:](v2->_audioVideoControlsView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v118 = v133 + 25.0;

  }
  if ((v254 & 1) != 0)
  {
    v267 = 0u;
    v268 = 0u;
    v265 = 0u;
    v266 = 0u;
    v156 = obj;
    v244 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v265, v295, 16);
    if (v244)
    {
      v157 = 0;
      v239 = v156;
      v241 = *(_QWORD *)v266;
      do
      {
        for (jj = 0; jj != v244; ++jj)
        {
          if (*(_QWORD *)v266 != v241)
            objc_enumerationMutation(v239);
          v159 = *(void **)(*((_QWORD *)&v265 + 1) + 8 * jj);
          CCUISortedAttributionsForEntity(v159, v7);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v261 = 0u;
          v262 = 0u;
          v263 = 0u;
          v264 = 0u;
          v161 = v160;
          v162 = -[CCUISensorEntityHeaderView countByEnumeratingWithState:objects:count:](v161, "countByEnumeratingWithState:objects:count:", &v261, v294, 16);
          if (v162)
          {
            v163 = v162;
            v255 = v161;
            v251 = jj;
            v164 = *(_QWORD *)v262;
            while (2)
            {
              for (kk = 0; kk != v163; ++kk)
              {
                if (*(_QWORD *)v262 != v164)
                  objc_enumerationMutation(v255);
                if (CCUISectionForSensorType(objc_msgSend(*(id *)(*((_QWORD *)&v261 + 1) + 8 * kk), "sensorType")))
                {

                  -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v167, "bounds");
                  v169 = v168;

                  +[CCUISensorEntityHeaderView iconSize](CCUISensorEntityHeaderView, "iconSize");
                  v171 = -[CCUISensorEntityHeaderView initWithSensorEntity:maxSize:]([CCUISensorEntityHeaderView alloc], "initWithSensorEntity:maxSize:", v159, v169 + -10.0, v170* (double)(+[CCUISensorEntityHeaderView maximumNumberOfLines](CCUISensorEntityHeaderView, "maximumNumberOfLines")+ 1));
                  v172 = objc_alloc_init(MEMORY[0x1E0DC3998]);
                  -[CCUISensorEntityHeaderView addInteraction:](v171, "addInteraction:", v172);

                  objc_msgSend(v253, "addObject:", v171);
                  -[UIScrollView addSubview:](v2->_scrollView, "addSubview:", v171);
                  -[CCUISensorEntityHeaderView frame](v171, "frame");
                  v174 = v173;
                  v176 = v175;
                  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  v178 = objc_msgSend(v177, "userInterfaceLayoutDirection");

                  v179 = 2.0;
                  if (v178 == 1)
                  {
                    -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v180, "bounds");
                    v179 = v181 - v174 + -2.0;

                  }
                  -[CCUISensorEntityHeaderView setFrame:](v171, "setFrame:", v179, v118, v174, v176);
                  v249 = v171;
                  -[CCUISensorEntityHeaderView setCachedExpandedRect:](v171, "setCachedExpandedRect:", v179, v118, v174, v176);
                  v118 = v118 + v176 + 25.0;
                  -[CCUISensorAttributionExpandedViewController _makeHeaderSeparatorView](v2, "_makeHeaderSeparatorView");
                  v182 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CCUISensorAttributionExpandedViewController contentView](v2, "contentView");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "bounds");
                  v185 = v184;

                  objc_msgSend(v182, "setFrame:", 0.0, v118 + -15.0, v185, 1.0);
                  objc_msgSend(v182, "frame");
                  objc_msgSend(v182, "setCachedExpandedRect:");
                  objc_msgSend(v243, "addObject:", v182);
                  v246 = v182;
                  -[UIScrollView addSubview:](v2->_scrollView, "addSubview:", v182);
                  v259 = 0u;
                  v260 = 0u;
                  v257 = 0u;
                  v258 = 0u;
                  v186 = v255;
                  v187 = -[CCUISensorEntityHeaderView countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v257, v293, 16);
                  if (v187)
                  {
                    v188 = v187;
                    v189 = *(_QWORD *)v258;
                    do
                    {
                      for (mm = 0; mm != v188; ++mm)
                      {
                        if (*(_QWORD *)v258 != v189)
                          objc_enumerationMutation(v186);
                        v191 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * mm);
                        if (objc_msgSend(v191, "sensorType") == 3)
                        {
                          v192 = [CCUIGameModeControlsView alloc];
                          v193 = objc_loadWeakRetained(p_isa + 139);
                          objc_msgSend(p_isa, "contentView");
                          v194 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v194, "bounds");
                          v195 = -[CCUIGameModeControlsView initWithProvider:activityData:frame:](v192, "initWithProvider:activityData:frame:", v193, v191, 0.0, v118);

                          -[CCUIGameModeControlsView frame](v195, "frame");
                          v197 = v196;
                          v199 = v198;
                          v201 = v200;
                          v203 = v202;
                          -[CCUIGameModeControlsView setFrame:](v195, "setFrame:");
                          -[CCUIGameModeControlsView setCachedExpandedRect:](v195, "setCachedExpandedRect:", v197, v199, v201, v203);
                          v204 = objc_alloc_init(MEMORY[0x1E0DC3998]);
                          -[CCUIGameModeControlsView addInteraction:](v195, "addInteraction:", v204);

                          objc_msgSend(v252, "addObject:", v195);
                          objc_msgSend(v253, "addObject:", v195);
                          objc_msgSend(p_isa[127], "addSubview:", v195);
                          -[CCUIGameModeControlsView bounds](v195, "bounds");
                          v118 = v118 + v205 + 25.0;

                          v157 = 1;
                        }
                      }
                      v188 = -[CCUISensorEntityHeaderView countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v257, v293, 16);
                    }
                    while (v188);
                  }

                  v161 = v255;
                  v2 = (CCUISensorAttributionExpandedViewController *)p_isa;
                  v7 = v242;
                  v166 = v249;
                  jj = v251;
                  goto LABEL_137;
                }
              }
              v163 = -[CCUISensorEntityHeaderView countByEnumeratingWithState:objects:count:](v255, "countByEnumeratingWithState:objects:count:", &v261, v294, 16);
              if (v163)
                continue;
              break;
            }
            v161 = v255;
            v166 = v255;
            jj = v251;
          }
          else
          {
            v166 = v161;
          }
LABEL_137:

        }
        v244 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v265, v295, 16);
      }
      while (v244);

      if ((v157 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_GAME_MODE_HINT"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
        v207 = (void *)objc_claimAutoreleasedReturnValue();

        -[CCUISensorAttributionGameModeFooterView setText:](v2->_gameModeFooterView, "setText:", v207);
        gameModeFooterView = v2->_gameModeFooterView;
        -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "bounds");
        v211 = v210;
        v213 = v212;
        LODWORD(v210) = 1148846080;
        LODWORD(v212) = 1132068864;
        -[CCUISensorAttributionGameModeFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](gameModeFooterView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v211, v213, v210, v212);
        v215 = v214;
        v217 = v216;

        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = 2.0;
        if (objc_msgSend(v218, "userInterfaceLayoutDirection") == 1)
        {
          -[CCUISensorAttributionExpandedViewController scrollView](v2, "scrollView");
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "bounds");
          v219 = v221 - v215 + -2.0;

        }
        -[CCUISensorAttributionGameModeFooterView setFrame:](v2->_gameModeFooterView, "setFrame:", v219, v118, v215, v217);
        -[CCUISensorAttributionGameModeFooterView setCachedExpandedRect:](v2->_gameModeFooterView, "setCachedExpandedRect:", v219, v118, v215, v217);
        -[CCUISensorAttributionGameModeFooterView setHidden:](v2->_gameModeFooterView, "setHidden:", 0);
        v118 = v118 + v217;

        goto LABEL_146;
      }
    }
    else
    {

    }
    -[CCUISensorAttributionGameModeFooterView setHidden:](v2->_gameModeFooterView, "setHidden:", 1);
LABEL_146:
    v118 = v118 + 25.0;
    goto LABEL_147;
  }
  -[CCUISensorAttributionGameModeFooterView setHidden:](v2->_gameModeFooterView, "setHidden:", 1);
LABEL_147:
  scrollView = v2->_scrollView;
  -[UIScrollView bounds](scrollView, "bounds");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v223, v118);
  v224 = objc_msgSend(v253, "copy");
  entityAndWebsiteViews = v2->_entityAndWebsiteViews;
  v2->_entityAndWebsiteViews = (NSArray *)v224;

  v226 = objc_msgSend(v247, "copy");
  subsequentSensorButtons = v2->_subsequentSensorButtons;
  v2->_subsequentSensorButtons = (NSArray *)v226;

  v228 = objc_msgSend(v243, "copy");
  separatorViews = v2->_separatorViews;
  v2->_separatorViews = (NSArray *)v228;

  v230 = objc_msgSend(v252, "copy");
  interactiveViews = v2->_interactiveViews;
  v2->_interactiveViews = (NSArray *)v230;

}

- (BOOL)_cacheTopmostSensorButtonIfNotAlreadySet:(id)a3 sensorData:(id)a4
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "sensorType") || self->_topMostCameraButton)
  {
    v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_topMostCameraButton, a3);
    v9 = 1;
  }
  if (objc_msgSend(v8, "sensorType") == 1 && !self->_topMostMicButton)
  {
    objc_storeStrong((id *)&self->_topMostMicButton, a3);
    v9 = 1;
  }
  if (objc_msgSend(v8, "sensorType") == 2 && !self->_topMostLocButton)
  {
    objc_storeStrong((id *)&self->_topMostLocButton, a3);
    v9 = 1;
  }

  return v9;
}

- (id)_iconInCompactViewForSensorType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      -[CCUISensorAttributionCompactControl cameraIndicatorView](self->_clonedCompactControl, "cameraIndicatorView", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[CCUISensorAttributionCompactControl micIndicatorView](self->_clonedCompactControl, "micIndicatorView", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[CCUISensorAttributionCompactControl locationIndicatorView](self->_clonedCompactControl, "locationIndicatorView", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[CCUISensorAttributionCompactControl gameModeIndicatorView](self->_clonedCompactControl, "gameModeIndicatorView", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_topMostButtons
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_topMostCameraButton)
    objc_msgSend(v3, "addObject:");
  if (self->_topMostMicButton)
    objc_msgSend(v4, "addObject:");
  if (self->_topMostLocButton)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)_makeHeaderSeparatorView
{
  _CCUIPositionRememberingSeparator *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(_CCUIPositionRememberingSeparator);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CCUIPositionRememberingSeparator setBackgroundColor:](v2, "setBackgroundColor:", v3);

  -[_CCUIPositionRememberingSeparator layer](v2, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  -[_CCUIPositionRememberingSeparator layer](v2, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 0.5);

  -[_CCUIPositionRememberingSeparator layer](v2, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2E80]);

  -[_CCUIPositionRememberingSeparator layer](v2, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupBlending:", 0);

  -[_CCUIPositionRememberingSeparator setAlpha:](v2, "setAlpha:", 0.0);
  return v2;
}

- (void)_reduceMotionPrepareForPresentation
{
  void *v3;

  -[CCUISensorAttributionExpandedViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[MTMaterialView setAlpha:](self->_materialView, "setAlpha:", 0.0);
  -[CCUISensorAttributionCompactControl setAlpha:](self->_clonedCompactControl, "setAlpha:", 0.0);
  -[CCUISensorAttributionPrivacyHeaderView setBlurRadius:](self->_privacyHeaderView, "setBlurRadius:", 0.0);
  -[CCUISensorAttributionPrivacyHeaderView setAlpha:](self->_privacyHeaderView, "setAlpha:", 1.0);
  -[CCUISensorAttributionPrivacyHeaderView setBlurRadius:](self->_audioVideoHeaderView, "setBlurRadius:", 0.0);
  -[CCUISensorAttributionPrivacyHeaderView setAlpha:](self->_audioVideoHeaderView, "setAlpha:", 1.0);
  -[CCUISensorAttributionGameModeFooterView setBlurRadius:](self->_gameModeFooterView, "setBlurRadius:", 0.0);
  -[CCUISensorAttributionGameModeFooterView setAlpha:](self->_gameModeFooterView, "setAlpha:", 1.0);
  -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", 1.0);
  -[CCUISensorAttributionExpandedViewController _applyPrivacyHeaderLayoutExpanded:](self, "_applyPrivacyHeaderLayoutExpanded:", 1);
  -[CCUISensorAttributionExpandedViewController _applySeparatorAlphaExpanded:](self, "_applySeparatorAlphaExpanded:", 1);
  -[CCUISensorAttributionExpandedViewController _applySeparatorsLayoutExpanded:](self, "_applySeparatorsLayoutExpanded:", 1);
}

- (void)_reduceMotionSetExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(void *, uint64_t);
  _QWORD v10[5];
  BOOL v11;
  _QWORD aBlock[5];
  BOOL v13;

  v4 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E8CFC3F8;
  v13 = a3;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke_2;
  v10[3] = &unk_1E8CFD180;
  v11 = a3;
  v10[4] = self;
  v9 = (void (**)(void *, uint64_t))_Block_copy(v10);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v9, 0.33);
  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

}

void __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  id v5;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  objc_msgSend(*(id *)(a1 + 32), "materialView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

uint64_t __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_removeClonedCompactPillViewAndNotifyDelegate");
  return result;
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  return 1;
}

- (CCUIHeaderPocketViewSensorAttributionDelegate)delegate
{
  return (CCUIHeaderPocketViewSensorAttributionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CCUISensorActivityData)audioVideoModeSelectionAttribution
{
  return self->_audioVideoModeSelectionAttribution;
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (void)setDismissTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, a3);
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (CCUISensorAttributionCompactControl)clonedCompactControl
{
  return self->_clonedCompactControl;
}

- (void)setClonedCompactControl:(id)a3
{
  objc_storeStrong((id *)&self->_clonedCompactControl, a3);
}

- (CCUISensorAttributionPrivacyHeaderView)privacyHeaderView
{
  return self->_privacyHeaderView;
}

- (void)setPrivacyHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyHeaderView, a3);
}

- (CCUISensorAttributionPrivacyHeaderView)audioVideoHeaderView
{
  return self->_audioVideoHeaderView;
}

- (void)setAudioVideoHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_audioVideoHeaderView, a3);
}

- (CCUIAudioVideoControlsView)audioVideoControlsView
{
  return self->_audioVideoControlsView;
}

- (void)setAudioVideoControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_audioVideoControlsView, a3);
}

- (CCUIContentModuleContentViewController)audioControlsContentViewController
{
  return (CCUIContentModuleContentViewController *)objc_loadWeakRetained((id *)&self->_audioControlsContentViewController);
}

- (void)setAudioControlsContentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_audioControlsContentViewController, a3);
}

- (UIView)audioControlsContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_audioControlsContainerView);
}

- (void)setAudioControlsContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_audioControlsContainerView, a3);
}

- (UIView)audioControlsView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_audioControlsView);
}

- (void)setAudioControlsView:(id)a3
{
  objc_storeWeak((id *)&self->_audioControlsView, a3);
}

- (CCUIContentModuleContentViewController)videoControlsContentViewController
{
  return (CCUIContentModuleContentViewController *)objc_loadWeakRetained((id *)&self->_videoControlsContentViewController);
}

- (void)setVideoControlsContentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_videoControlsContentViewController, a3);
}

- (UIView)videoControlsContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_videoControlsContainerView);
}

- (void)setVideoControlsContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_videoControlsContainerView, a3);
}

- (UIView)videoControlsView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_videoControlsView);
}

- (void)setVideoControlsView:(id)a3
{
  objc_storeWeak((id *)&self->_videoControlsView, a3);
}

- (CCUISensorAttributionGameModeFooterView)gameModeFooterView
{
  return self->_gameModeFooterView;
}

- (void)setGameModeFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_gameModeFooterView, a3);
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider
{
  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  return (CCUIModuleInstanceManager *)objc_loadWeakRetained((id *)&self->_moduleInstanceManager);
}

- (void)setModuleInstanceManager:(id)a3
{
  objc_storeWeak((id *)&self->_moduleInstanceManager, a3);
}

- (NSSet)activeAndRecentSensorActivityData
{
  return self->_activeAndRecentSensorActivityData;
}

- (void)setActiveAndRecentSensorActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_activeAndRecentSensorActivityData, a3);
}

- (NSArray)entityAndWebsiteViews
{
  return self->_entityAndWebsiteViews;
}

- (void)setEntityAndWebsiteViews:(id)a3
{
  objc_storeStrong((id *)&self->_entityAndWebsiteViews, a3);
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (NSArray)interactiveViews
{
  return self->_interactiveViews;
}

- (void)setInteractiveViews:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveViews, a3);
}

- (CCUISensorAttributionSensorButton)topMostCameraButton
{
  return self->_topMostCameraButton;
}

- (void)setTopMostCameraButton:(id)a3
{
  objc_storeStrong((id *)&self->_topMostCameraButton, a3);
}

- (CCUISensorAttributionSensorButton)topMostMicButton
{
  return self->_topMostMicButton;
}

- (void)setTopMostMicButton:(id)a3
{
  objc_storeStrong((id *)&self->_topMostMicButton, a3);
}

- (CCUISensorAttributionSensorButton)topMostLocButton
{
  return self->_topMostLocButton;
}

- (void)setTopMostLocButton:(id)a3
{
  objc_storeStrong((id *)&self->_topMostLocButton, a3);
}

- (NSArray)subsequentSensorButtons
{
  return self->_subsequentSensorButtons;
}

- (void)setSubsequentSensorButtons:(id)a3
{
  objc_storeStrong((id *)&self->_subsequentSensorButtons, a3);
}

- (NSString)audioModuleIdentifier
{
  return self->_audioModuleIdentifier;
}

- (void)setAudioModuleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_audioModuleIdentifier, a3);
}

- (NSString)videoModuleIdentifier
{
  return self->_videoModuleIdentifier;
}

- (void)setVideoModuleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_videoModuleIdentifier, a3);
}

- (CCUIModuleInstance)audioModuleInstance
{
  return self->_audioModuleInstance;
}

- (void)setAudioModuleInstance:(id)a3
{
  objc_storeStrong((id *)&self->_audioModuleInstance, a3);
}

- (CCUIModuleInstance)videoModuleInstance
{
  return self->_videoModuleInstance;
}

- (void)setVideoModuleInstance:(id)a3
{
  objc_storeStrong((id *)&self->_videoModuleInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoModuleInstance, 0);
  objc_storeStrong((id *)&self->_audioModuleInstance, 0);
  objc_storeStrong((id *)&self->_videoModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_subsequentSensorButtons, 0);
  objc_storeStrong((id *)&self->_topMostLocButton, 0);
  objc_storeStrong((id *)&self->_topMostMicButton, 0);
  objc_storeStrong((id *)&self->_topMostCameraButton, 0);
  objc_storeStrong((id *)&self->_interactiveViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_entityAndWebsiteViews, 0);
  objc_storeStrong((id *)&self->_activeAndRecentSensorActivityData, 0);
  objc_destroyWeak((id *)&self->_moduleInstanceManager);
  objc_destroyWeak((id *)&self->_gameModeActivityDataProvider);
  objc_storeStrong((id *)&self->_gameModeFooterView, 0);
  objc_destroyWeak((id *)&self->_videoControlsView);
  objc_destroyWeak((id *)&self->_videoControlsContainerView);
  objc_destroyWeak((id *)&self->_videoControlsContentViewController);
  objc_destroyWeak((id *)&self->_audioControlsView);
  objc_destroyWeak((id *)&self->_audioControlsContainerView);
  objc_destroyWeak((id *)&self->_audioControlsContentViewController);
  objc_storeStrong((id *)&self->_audioVideoControlsView, 0);
  objc_storeStrong((id *)&self->_audioVideoHeaderView, 0);
  objc_storeStrong((id *)&self->_privacyHeaderView, 0);
  objc_storeStrong((id *)&self->_clonedCompactControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_audioVideoModeSelectionAttribution, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
