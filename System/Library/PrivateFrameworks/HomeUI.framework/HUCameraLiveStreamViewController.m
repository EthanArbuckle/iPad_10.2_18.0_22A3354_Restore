@implementation HUCameraLiveStreamViewController

- (HUCameraLiveStreamViewController)initWithCameraProfile:(id)a3
{
  id v4;
  HUCameraLiveStreamViewController *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HFCameraLiveStreamController *liveStreamController;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraLiveStreamViewController;
  v5 = -[HUCameraLiveStreamViewController init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31238]);
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHome:cameraProfile:", v8, v4);
    liveStreamController = v5->_liveStreamController;
    v5->_liveStreamController = (HFCameraLiveStreamController *)v9;

    -[HFCameraLiveStreamController setDelegate:](v5->_liveStreamController, "setDelegate:", v5);
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUCameraLiveStreamViewController;
  -[HUCameraLiveStreamViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[HUCameraLiveStreamViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[HUCameraLiveStreamViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveStreamViewController cameraView](self, "cameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = -[HUCameraLiveStreamViewController shouldRespectAspectRatio](self, "shouldRespectAspectRatio");
  -[HUCameraLiveStreamViewController cameraView](self, "cameraView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldRespectAspectRatio:", v6);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraLiveStreamViewController cameraView](self, "cameraView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveStreamViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v11);

  -[HUCameraLiveStreamViewController liveStreamController](self, "liveStreamController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startStreaming");

  -[HUCameraLiveStreamViewController liveStreamController](self, "liveStreamController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "streamState");

  if (v14 == 2)
  {
    -[HUCameraLiveStreamViewController liveStreamControllerDelegate](self, "liveStreamControllerDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLiveStreamViewController liveStreamController](self, "liveStreamController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "streamControllerStateDidUpdate:", v16);

  }
}

- (void)setShouldRespectAspectRatio:(BOOL)a3
{
  if (self->_shouldRespectAspectRatio != a3)
  {
    self->_shouldRespectAspectRatio = a3;
    -[HUCameraView setShouldRespectAspectRatio:](self->_cameraView, "setShouldRespectAspectRatio:");
  }
}

- (void)streamControllerStateDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HUCameraLiveStreamViewController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ did update: %@", (uint8_t *)&v11, 0x16u);
  }

  -[HUCameraLiveStreamViewController liveStreamController](self, "liveStreamController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "liveCameraSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveStreamViewController cameraView](self, "cameraView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCameraSource:", v7);

  -[HUCameraLiveStreamViewController liveStreamControllerDelegate](self, "liveStreamControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUCameraLiveStreamViewController liveStreamControllerDelegate](self, "liveStreamControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "streamControllerStateDidUpdate:", v4);

  }
}

- (HUCameraView)cameraView
{
  HUCameraView *cameraView;
  HUCameraView *v4;
  void *v5;
  void *v6;
  HUCameraView *v7;

  cameraView = self->_cameraView;
  if (!cameraView)
  {
    v4 = -[HUCameraView initWithBadgeView:]([HUCameraView alloc], "initWithBadgeView:", 0);
    -[HUCameraView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUCameraView setShouldRespectAspectRatio:](v4, "setShouldRespectAspectRatio:", -[HUCameraLiveStreamViewController shouldRespectAspectRatio](self, "shouldRespectAspectRatio"));
    -[HUCameraLiveStreamViewController liveStreamController](self, "liveStreamController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "liveCameraSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView setCameraSource:](v4, "setCameraSource:", v6);

    v7 = self->_cameraView;
    self->_cameraView = v4;

    cameraView = self->_cameraView;
  }
  return cameraView;
}

- (HFCameraLiveStreamControllerDelegate)liveStreamControllerDelegate
{
  return (HFCameraLiveStreamControllerDelegate *)objc_loadWeakRetained((id *)&self->_liveStreamControllerDelegate);
}

- (void)setLiveStreamControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_liveStreamControllerDelegate, a3);
}

- (BOOL)shouldRespectAspectRatio
{
  return self->_shouldRespectAspectRatio;
}

- (HFCameraLiveStreamController)liveStreamController
{
  return self->_liveStreamController;
}

- (void)setLiveStreamController:(id)a3
{
  objc_storeStrong((id *)&self->_liveStreamController, a3);
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);
  objc_destroyWeak((id *)&self->_liveStreamControllerDelegate);
}

@end
