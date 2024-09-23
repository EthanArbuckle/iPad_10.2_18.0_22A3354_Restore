@implementation CAMPanoramaViewController

- (CAMPanoramaViewController)initWithCaptureController:(id)a3 layoutStyle:(int64_t)a4
{
  id v7;
  CAMPanoramaViewController *v8;
  CAMPanoramaViewController *v9;
  uint64_t v10;
  UITapGestureRecognizer *directionChangeGestureRecognizer;
  CAMPanoramaViewController *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMPanoramaViewController;
  v8 = -[CAMPanoramaViewController init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__captureController, a3);
    v9->__captureOrientation = 1;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v9, sel__handleDirectionChange_);
    directionChangeGestureRecognizer = v9->__directionChangeGestureRecognizer;
    v9->__directionChangeGestureRecognizer = (UITapGestureRecognizer *)v10;

    v9->_layoutStyle = a4;
    objc_msgSend(v7, "setPanoramaChangeDelegate:", v9);
    v12 = v9;
  }

  return v9;
}

- (CAMPanoramaViewController)initWithCoder:(id)a3
{
  -[CAMPanoramaViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMPanoramaViewController initWithCaptureController:layoutStyle:](self, "initWithCaptureController:layoutStyle:", 0, 0);
}

- (void)setLayoutStyle:(int64_t)a3
{
  id v4;

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMPanoramaViewController panoramaView](self, "panoramaView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLayoutStyle:", a3);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  int64_t v3;
  void *v4;
  CAMPanoramaView *v5;
  void *v6;
  id v7;

  v3 = -[CAMPanoramaViewController layoutStyle](self, "layoutStyle");
  -[CAMPanoramaViewController _captureController](self, "_captureController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "panoramaPreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMPanoramaView initWithPanoramaPreviewView:layoutStyle:]([CAMPanoramaView alloc], "initWithPanoramaPreviewView:layoutStyle:", v4, v3);
  -[CAMPanoramaView setDelegate:](v5, "setDelegate:", self);
  -[CAMPanoramaViewController _directionChangeGestureRecognizer](self, "_directionChangeGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView addGestureRecognizer:](v5, "addGestureRecognizer:", v6);
  -[CAMPanoramaViewController setView:](self, "setView:", v5);

}

- (void)startPainting
{
  id v3;

  -[CAMPanoramaViewController panoramaView](self, "panoramaView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPainting");
  -[CAMPanoramaViewController _setPainting:](self, "_setPainting:", 1);

}

- (void)stopPainting
{
  id v3;

  -[CAMPanoramaViewController panoramaView](self, "panoramaView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopPainting");
  -[CAMPanoramaViewController _setPainting:](self, "_setPainting:", 0);

}

- (void)startProcessingPanorama
{
  id v2;

  -[CAMPanoramaViewController panoramaView](self, "panoramaView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startProcessingPanorama");

}

- (void)finishedProcessingPanorama
{
  id v2;

  -[CAMPanoramaViewController panoramaView](self, "panoramaView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedProcessingPanorama");

}

- (void)_handleDirectionChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  -[CAMPanoramaViewController _captureController](self, "_captureController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCapturingPanorama");

  if ((v5 & 1) == 0)
  {
    -[CAMPanoramaViewController panoramaView](self, "panoramaView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "direction");
    if (v7)
    {
      v8 = 2;
      if (v7 != 1)
        v8 = 0;
      if (v7 == 2)
        v9 = 1;
      else
        v9 = v8;
    }
    else
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Changing panorama direction but the current direction is unknown!", v11, 2u);
      }

      v9 = 1;
    }
    objc_msgSend(v6, "setDirection:animated:", v9, 1);

  }
}

- (void)panoramaViewDidRequestSynchronizedDirectionChange:(id)a3 toDirection:(int64_t)a4
{
  id v5;

  -[CAMPanoramaViewController _captureController](self, "_captureController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToPanoramaDirection:", a4);

}

- (void)panoramaView:(id)a3 didUpdateInstruction:(int64_t)a4
{
  void *v5;
  id v6;

  -[CAMPanoramaViewController analyticsCaptureEvent](self, "analyticsCaptureEvent", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "populatePanoramaInstruction:", a4);
    v5 = v6;
  }

}

- (void)updateWithStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMPanoramaViewController panoramaView](self, "panoramaView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePaintingWithStatus:", v4);

}

- (void)panoramaConfigurationDidChangeWithDirection:(int64_t)a3
{
  id v4;

  if (a3)
  {
    -[CAMPanoramaViewController panoramaView](self, "panoramaView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDirection:", a3);

  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)isPainting
{
  return self->_painting;
}

- (void)_setPainting:(BOOL)a3
{
  self->_painting = a3;
}

- (CAMAnalyticsCaptureEvent)analyticsCaptureEvent
{
  return self->_analyticsCaptureEvent;
}

- (void)setAnalyticsCaptureEvent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCaptureEvent, a3);
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (int64_t)_captureOrientation
{
  return self->__captureOrientation;
}

- (void)_setCaptureOrientation:(int64_t)a3
{
  self->__captureOrientation = a3;
}

- (UITapGestureRecognizer)_directionChangeGestureRecognizer
{
  return self->__directionChangeGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__directionChangeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->_analyticsCaptureEvent, 0);
}

@end
