@implementation AVTAnimojiPoseSelectionHeaderViewController

- (AVTAnimojiPoseSelectionHeaderViewController)initWithRecord:(id)a3
{
  id v5;
  AVTAnimojiPoseSelectionHeaderViewController *v6;
  AVTAnimojiPoseSelectionHeaderViewController *v7;
  uint64_t v8;
  UIColor *avtCaptureBackgroundColor;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTAnimojiPoseSelectionHeaderViewController;
  v6 = -[AVTAnimojiPoseSelectionHeaderViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    +[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    avtCaptureBackgroundColor = v7->_avtCaptureBackgroundColor;
    v7->_avtCaptureBackgroundColor = (UIColor *)v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  AVTView *v6;
  AVTView *avtView;
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
  AVTViewUpdater *v19;
  AVTView *v20;
  void *v21;
  void *v22;
  AVTViewUpdater *v23;
  AVTViewUpdater *viewUpdater;
  AVTViewUpdater *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)AVTAnimojiPoseSelectionHeaderViewController;
  -[AVTAnimojiPoseSelectionHeaderViewController viewDidLoad](&v37, sel_viewDidLoad);
  +[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0D006A8]);
  v6 = (AVTView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  avtView = self->_avtView;
  self->_avtView = v6;

  -[AVTView setTranslatesAutoresizingMaskIntoConstraints:](self->_avtView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AVTView setBackgroundColor:](self->_avtView, "setBackgroundColor:", self->_avtCaptureBackgroundColor);
  -[AVTAnimojiPoseSelectionHeaderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_avtView);

  -[AVTAnimojiPoseSelectionHeaderViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView heightAnchor](self->_avtView, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:multiplier:constant:", v31, 1.0, 40.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v30;
  -[AVTView heightAnchor](self->_avtView, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView widthAnchor](self->_avtView, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v27;
  -[AVTView centerYAnchor](self->_avtView, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v12;
  -[AVTView centerXAnchor](self->_avtView, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v26);
  -[AVTAnimojiPoseSelectionHeaderViewController avatarRecord](self, "avatarRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [AVTViewUpdater alloc];
  v20 = self->_avtView;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVTViewUpdater initWithAVTView:logger:](v19, "initWithAVTView:logger:", v20, v22);
  viewUpdater = self->_viewUpdater;
  self->_viewUpdater = v23;

  objc_initWeak(&location, self);
  v25 = self->_viewUpdater;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __58__AVTAnimojiPoseSelectionHeaderViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1EA51D520;
  objc_copyWeak(&v35, &location);
  -[AVTViewUpdater setAvatarRecord:avatar:completionHandler:](v25, "setAvatarRecord:avatar:completionHandler:", v17, v18, v34);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __58__AVTAnimojiPoseSelectionHeaderViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayedConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "avtView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayedConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "transitionToStickerConfiguration:duration:style:completionHandler:", v3, 1, 0, 0.0);

  }
}

- (void)updateForAvatarRecord:(id)a3 discardPose:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  AVTViewUpdater *viewUpdater;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_avatarRecord, a3);
  objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[AVTAnimojiPoseSelectionHeaderViewController setDisplayedConfiguration:](self, "setDisplayedConfiguration:", 0);
  objc_initWeak(&location, self);
  viewUpdater = self->_viewUpdater;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__AVTAnimojiPoseSelectionHeaderViewController_updateForAvatarRecord_discardPose___block_invoke;
  v10[3] = &unk_1EA51D520;
  objc_copyWeak(&v11, &location);
  -[AVTViewUpdater setAvatarRecord:avatar:completionHandler:](viewUpdater, "setAvatarRecord:avatar:completionHandler:", v7, v8, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __81__AVTAnimojiPoseSelectionHeaderViewController_updateForAvatarRecord_discardPose___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayedConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "avtView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayedConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "transitionToStickerConfiguration:duration:style:completionHandler:", v3, 1, 0, 0.0);

  }
}

- (id)newStickerConfigurationFromCurrentPose
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = CFSTR("memoji");
  objc_msgSend(v3, "physicsState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D00650]);
  objc_msgSend(v3, "pose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPose:physicsStates:", v7, v5);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00690]), "initWithName:pose:props:shaders:camera:options:", CFSTR("custom_capture"), v8, 0, 0, 0, 0);
  return v9;
}

- (void)beginFaceTrackingWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[AVTAnimojiPoseSelectionHeaderViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "enableFaceTracking") & 1) != 0)
    {
      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "faceTrackingIsPaused");

      if ((v6 & 1) == 0)
        goto LABEL_4;
    }
    else
    {

    }
    -[AVTAnimojiPoseSelectionHeaderViewController setDisplayedConfiguration:](self, "setDisplayedConfiguration:", 0);
    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnableReticle:", 1);

    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFaceTrackingPaused:", 0);

    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionToFaceTrackingWithDuration:enableBakedAnimations:completionHandler:", 0, v11, 0.25);

    goto LABEL_8;
  }
LABEL_4:
  v7 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
LABEL_8:
    v7 = v11;
  }

}

- (void)pauseFaceTracking
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (-[AVTAnimojiPoseSelectionHeaderViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "faceTrackingIsPaused");

    if ((v4 & 1) == 0)
    {
      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFaceTrackingPaused:", 1);

      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnableReticle:", 0);

    }
  }
}

- (void)endFaceTracking
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (-[AVTAnimojiPoseSelectionHeaderViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enableFaceTracking");

    if (v4)
    {
      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnableFaceTracking:", 0);

      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnableReticle:", 0);

    }
  }
}

- (void)updateForStickerConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[AVTAnimojiPoseSelectionHeaderViewController displayedConfiguration](self, "displayedConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v10)
  {
    -[AVTAnimojiPoseSelectionHeaderViewController setDisplayedConfiguration:](self, "setDisplayedConfiguration:", v10);
    if (-[AVTAnimojiPoseSelectionHeaderViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0.0;
      if (v4)
        v9 = 0.25;
      objc_msgSend(v7, "transitionToStickerConfiguration:duration:style:completionHandler:", v10, 1, 0, v9);

    }
  }

}

- (void)setCaptureBackgroundColor:(id)a3
{
  id v4;
  AVTView *avtView;
  UIColor *v6;
  UIColor *avtCaptureBackgroundColor;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!v4)
  {
    +[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_avtCaptureBackgroundColor, v4);
  if (!v10)

  avtView = self->_avtView;
  if (avtView)
  {
    -[AVTView backgroundColor](avtView, "backgroundColor");
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    avtCaptureBackgroundColor = self->_avtCaptureBackgroundColor;

    if (v6 != avtCaptureBackgroundColor)
    {
      -[AVTAnimojiPoseSelectionHeaderViewController avtCaptureBackgroundColor](self, "avtCaptureBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAnimojiPoseSelectionHeaderViewController avtView](self, "avtView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

    }
  }

}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  objc_storeStrong((id *)&self->_avtView, a3);
}

- (AVTStickerConfiguration)displayedConfiguration
{
  return self->_displayedConfiguration;
}

- (void)setDisplayedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayedConfiguration, a3);
}

- (AVTViewUpdater)viewUpdater
{
  return self->_viewUpdater;
}

- (void)setViewUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_viewUpdater, a3);
}

- (UIColor)avtCaptureBackgroundColor
{
  return self->_avtCaptureBackgroundColor;
}

- (void)setAvtCaptureBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_avtCaptureBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtCaptureBackgroundColor, 0);
  objc_storeStrong((id *)&self->_viewUpdater, 0);
  objc_storeStrong((id *)&self->_displayedConfiguration, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end
