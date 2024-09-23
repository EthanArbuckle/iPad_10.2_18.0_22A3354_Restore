@implementation HUCameraPlayerLiveContentViewController

- (HUCameraPlayerLiveContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPlaybackEngine_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPlayerLiveContentViewController.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraPlayerLiveContentViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUCameraPlayerLiveContentViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPlaybackEngine_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPlayerLiveContentViewController.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraPlayerLiveContentViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUCameraPlayerLiveContentViewController)initWithPlaybackEngine:(id)a3
{
  id v5;
  HUCameraPlayerLiveContentViewController *v6;
  HUCameraPlayerLiveContentViewController *v7;
  HFCameraPlaybackEngine *playbackEngine;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUCameraPlayerLiveContentViewController;
  v6 = -[HUCameraPlayerLiveContentViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackEngine, a3);
    playbackEngine = v7->_playbackEngine;
    objc_msgSend(MEMORY[0x1E0D31250], "defaultOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine addObserver:withOptions:](playbackEngine, "addObserver:withOptions:", v7, v9);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  HUCameraBadgeView *v4;
  HUCameraView *v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUCameraPlayerLiveContentViewController;
  -[HUCameraPlayerLiveContentViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[HUCameraPlayerLiveContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4 = -[HUCameraBadgeView initWithSize:]([HUCameraBadgeView alloc], "initWithSize:", 1);
  v5 = -[HUCameraView initWithBadgeView:]([HUCameraView alloc], "initWithBadgeView:", v4);
  -[HUCameraPlayerLiveContentViewController setCameraView:](self, "setCameraView:", v5);

  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", 1);

  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBadgeHidden:", 1);

  -[HUCameraPlayerLiveContentViewController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "liveCameraSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCameraSource:", v9);

  -[HUCameraPlayerLiveContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "naui_addAutoLayoutSubview:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerLiveContentViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v16);

  -[HUCameraPlayerLiveContentViewController _updateCameraCornerRadius](self, "_updateCameraCornerRadius");
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HUCameraPlayerLiveContentViewController *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Updating %@ to source:%@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HUCameraPlayerLiveContentViewController_playbackEngine_didUpdateLiveCameraSource___block_invoke;
  v8[3] = &unk_1E6F4C638;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __84__HUCameraPlayerLiveContentViewController_playbackEngine_didUpdateLiveCameraSource___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  objc_msgSend(*(id *)(a1 + 32), "cameraView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCameraSource:animated:", *(_QWORD *)(a1 + 40), v3);

}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[HUCameraPlayerLiveContentViewController _updateCameraCornerRadius](self, "_updateCameraCornerRadius");
}

- (void)_updateCameraCornerRadius
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[HUCameraPlayerLiveContentViewController cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", v4);

  -[HUCameraPlayerLiveContentViewController cameraView](self, "cameraView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCameraCorners:", -1);

}

- (HUCameraMicrophoneControl)microphoneControl
{
  HUCameraMicrophoneControl *microphoneControl;
  HUCameraMicrophoneControl *v4;
  HUCameraMicrophoneControl *v5;

  microphoneControl = self->_microphoneControl;
  if (!microphoneControl)
  {
    v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 45.0, 44.0);
    -[HUCameraMicrophoneControl setAutoresizingMask:](v4, "setAutoresizingMask:", 12);
    -[HUCameraMicrophoneControl setHidden:](v4, "setHidden:", 0);
    v5 = self->_microphoneControl;
    self->_microphoneControl = v4;

    microphoneControl = self->_microphoneControl;
  }
  return microphoneControl;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (void)setMicrophoneControl:(id)a3
{
  objc_storeStrong((id *)&self->_microphoneControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_playbackEngine, 0);
}

@end
