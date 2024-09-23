@implementation HUCameraBlurViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUCameraBlurViewController;
  -[HUCameraBlurViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HUCameraBlurViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[HUCameraBlurViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraBlurViewController blurView](self, "blurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraBlurViewController blurView](self, "blurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraBlurViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v9);

}

- (BOOL)shouldShowBlurForPlaybackEngine:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) == 0
    && objc_msgSend(v3, "timelineState") != 2
    && objc_msgSend(v3, "timeControlStatus") == 0;

  return v4;
}

- (void)updateBlurWithPlaybackEngine:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8);
  _BOOL8 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  double v17;
  _DWORD v18[2];
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _BOOL8))a4;
  v8 = -[HUCameraBlurViewController shouldShowBlurForPlaybackEngine:](self, "shouldShowBlurForPlaybackEngine:", v6);
  -[HUCameraBlurViewController setShowingBlur:](self, "setShowingBlur:", v8);
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[HUCameraBlurViewController showingBlur](self, "showingBlur");
    objc_msgSend(v6, "engineModeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timelineStateDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeControlStatusDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 67110146;
    v18[1] = v10;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Showing blur:%{BOOL}d engine:%@ engineMode:%@ timelineState:%@ timeControlStatus:%@.", (uint8_t *)v18, 0x30u);

  }
  v14 = (float)-[HUCameraBlurViewController showingBlur](self, "showingBlur");
  -[HUCameraBlurViewController blurView](self, "blurView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = v14;
  objc_msgSend(v16, "setOpacity:", v17);

  if (v7)
    v7[2](v7, v8);

}

- (UIVisualEffectView)blurView
{
  UIVisualEffectView *blurView;
  void *v4;
  UIVisualEffectView *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIVisualEffectView *v10;

  blurView = self->_blurView;
  if (!blurView)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 35.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v4);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[UIVisualEffectView bounds](v5, "bounds");
    v7 = (void *)objc_msgSend(v6, "initWithFrame:");
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v7, "setAlpha:", 0.5);
    -[UIVisualEffectView contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    -[UIVisualEffectView setAlpha:](v5, "setAlpha:", 0.0);
    v10 = self->_blurView;
    self->_blurView = v5;

    blurView = self->_blurView;
  }
  return blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (BOOL)showingBlur
{
  return self->_showingBlur;
}

- (void)setShowingBlur:(BOOL)a3
{
  self->_showingBlur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
