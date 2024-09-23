@implementation AVZoomingBehaviorContext

- (AVZoomingBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  id v5;
  AVObservationController *v6;
  AVObservationController *observationController;

  v4 = a3;
  if (self)
  {
    v5 = objc_storeWeak((id *)&self->_playerViewController, v4);
    objc_msgSend(v4, "setRequiresImmediateAssetInspection:", 1);

    v6 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v6;

    self->_contentAspectRatio = (CGSize)*MEMORY[0x1E0C9D820];
    self->_zoomingEnabled = 1;
  }

  return self;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVZoomingBehaviorContext observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVZoomingBehaviorContext;
  -[AVZoomingBehaviorContext dealloc](&v4, sel_dealloc);
}

- (void)setZoomingEnabled:(BOOL)a3
{
  self->_zoomingEnabled = a3;
  -[AVZoomingBehaviorContext _updateZoomingView](self, "_updateZoomingView");
}

- (void)setContentAspectRatio:(CGSize)a3
{
  if (a3.width != self->_contentAspectRatio.width || a3.height != self->_contentAspectRatio.height)
  {
    self->_contentAspectRatio = a3;
    -[AVZoomingBehaviorContext _updateZoomingView](self, "_updateZoomingView");
  }
}

- (AVPlaybackContentContainerView)activeContentView
{
  void *v2;
  void *v3;

  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlaybackContentContainerView *)v3;
}

- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  NSObject *v11;
  AVPlaybackContentZoomingView *v12;
  void *v13;
  __AVPlayerLayerView *v14;
  __AVPlayerLayerView *v15;
  uint8_t v17[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_ERROR, "Shouldn't already have a contentZooming view.", v17, 2u);
    }

  }
  v12 = -[AVPlaybackContentZoomingView initWithFrame:activeContentView:]([AVPlaybackContentZoomingView alloc], "initWithFrame:activeContentView:", v9, x, y, width, height);
  objc_msgSend(v9, "playerLayerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = [__AVPlayerLayerView alloc];
    objc_msgSend(v9, "bounds");
    v15 = -[__AVPlayerLayerView initWithFrame:](v14, "initWithFrame:");
    objc_msgSend(v9, "setPlayerLayerView:", v15);

    objc_msgSend(v9, "layoutIfNeeded");
  }
  -[AVZoomingBehaviorContext setContentZoomingView:](self, "setContentZoomingView:", v12);

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;

  -[AVZoomingBehaviorContext _updateZoomingView](self, "_updateZoomingView");
  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackControlsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVideoGravityButton:", 0);

}

- (void)didAddBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
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
  id v19;

  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isViewLoaded"))
    goto LABEL_4;
  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackContentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackContentContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    -[AVZoomingBehaviorContext makePlaybackContentContainerWithFrame:activeContentView:](self, "makePlaybackContentContainerWithFrame:activeContentView:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaybackContentContainerView:", v14);

    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playbackControlsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaybackControlsIncludeStartContentTransitionButtons:", 1);

LABEL_4:
  }
  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playbackControlsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShowsVideoGravityButton:", 0);

  -[AVZoomingBehaviorContext _updateZoomingView](self, "_updateZoomingView");
  -[AVZoomingBehaviorContext observationController](self, "observationController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerContentDimensionsChangedNotification"), 0, 0, &__block_literal_global_15994);

}

- (void)didRemoveBehavior:(id)a3
{
  void *v4;
  void *v5;
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
  id v17;

  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackContentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackContentContainerView:", v11);

  }
  -[AVZoomingBehaviorContext doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVZoomingBehaviorContext doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeGestureRecognizer:", v14);

  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "isViewLoaded");

  if ((_DWORD)v13)
  {
    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playbackControlsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShowsVideoGravityButton:", 1);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v8, "hitTest:withEvent:", 0, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v16, "isViewDescendantOfPlaybackControlsSubview:", v14) ^ 1;

  return (char)v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[AVZoomingBehaviorContext doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];

  v4 = a3;
  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AVZoomingBehaviorContext__handleDoubleTapGestureRecognizer___block_invoke;
  v10[3] = &unk_1E5BB32F0;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = v9;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327680, v10, 0, 0.3, 0.0);
}

- (void)_updateZoomingView
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  id v39;

  -[AVZoomingBehaviorContext contentAspectRatio](self, "contentAspectRatio");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentDimensions");
    v7 = v12;
    v9 = v13;

  }
  else
  {
    -[AVZoomingBehaviorContext contentAspectRatio](self, "contentAspectRatio");
    v7 = v6;
    v9 = v8;
  }
  if (v7 > 0.0 && v9 > 0.0)
  {
    -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentAspectRatio:", v7, v9);

  }
  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setZoomingEnabled:", -[AVZoomingBehaviorContext isZoomingEnabled](self, "isZoomingEnabled"));

  -[AVZoomingBehaviorContext doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 1);

  -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFullScreen:", objc_msgSend(v18, "isPresentedFullScreen"));

  if (-[AVZoomingBehaviorContext isZoomingEnabled](self, "isZoomingEnabled"))
  {
    -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isViewLoaded");

    if (v20)
    {
      -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pinchGestureRecognizer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pinchGestureRecognizer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 != v27)
        {
          -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "contentView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "pinchGestureRecognizer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addGestureRecognizer:", v31);

          -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "contentView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVZoomingBehaviorContext contentZoomingView](self, "contentZoomingView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "panGestureRecognizer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addGestureRecognizer:", v35);

        }
      }
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v39, "secondGenerationPlayerEnabled") & 1) == 0)
      {
        -[AVZoomingBehaviorContext doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          return;
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDoubleTapGestureRecognizer_);
        -[AVZoomingBehaviorContext playerViewController](self, "playerViewController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "contentView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addGestureRecognizer:", v39);

        objc_msgSend(v39, "setNumberOfTapsRequired:", 2);
        objc_msgSend(v39, "setDelegate:", self);
        -[AVZoomingBehaviorContext setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v39);
      }

    }
  }
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (AVZoomingBehavior)behavior
{
  return (AVZoomingBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (CGSize)contentAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_contentAspectRatio.width;
  height = self->_contentAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AVPlaybackContentZoomingView)contentZoomingView
{
  return self->_contentZoomingView;
}

- (void)setContentZoomingView:(id)a3
{
  objc_storeStrong((id *)&self->_contentZoomingView, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_contentZoomingView, 0);
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __62__AVZoomingBehaviorContext__handleDoubleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentZoomingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

void __43__AVZoomingBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    objc_msgSend(v8, "_updateZoomingView");

}

@end
