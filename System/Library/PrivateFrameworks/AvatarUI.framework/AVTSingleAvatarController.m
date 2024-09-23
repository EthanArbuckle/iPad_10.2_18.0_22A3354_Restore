@implementation AVTSingleAvatarController

- (AVTSingleAvatarController)initWithDataSource:(id)a3 environment:(id)a4
{
  id v5;
  AVTSingleAvatarController *v6;
  _AVTAvatarRecordImageProvider *v7;
  _AVTAvatarRecordImageProvider *thumbnailRenderer;
  uint64_t v9;
  AVTRenderingScope *renderingScope;
  uint64_t v11;
  AVTUILogger *logger;
  objc_super v14;

  v5 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTSingleAvatarController;
  v6 = -[AVTSingleAvatarController init](&v14, sel_init);
  if (v6)
  {
    v7 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v5);
    thumbnailRenderer = v6->_thumbnailRenderer;
    v6->_thumbnailRenderer = v7;

    +[AVTRenderingScope listControllerThumbnailScope](AVTRenderingScope, "listControllerThumbnailScope");
    v9 = objc_claimAutoreleasedReturnValue();
    renderingScope = v6->_renderingScope;
    v6->_renderingScope = (AVTRenderingScope *)v9;

    objc_msgSend(v5, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v6->_logger;
    v6->_logger = (AVTUILogger *)v11;

  }
  return v6;
}

- (AVTAdaptativeLayoutView)view
{
  if (!-[AVTSingleAvatarController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTSingleAvatarController loadView](self, "loadView");
    -[AVTSingleAvatarController viewDidLoad](self, "viewDidLoad");
  }
  return self->_view;
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (void)loadView
{
  AVTImageTransitioningContainerView *v3;
  AVTAdaptativeLayoutView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  AVTAdaptativeLayoutView *v15;

  v3 = -[AVTImageTransitioningContainerView initWithFrame:]([AVTImageTransitioningContainerView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  -[AVTSingleAvatarController setTransitioningContainer:](self, "setTransitioningContainer:", v3);

  v4 = [AVTAdaptativeLayoutView alloc];
  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AVTAdaptativeLayoutView initWithFrame:contentView:](v4, "initWithFrame:contentView:", v14, v7, v9, v11, v13);

  -[AVTSingleAvatarController setView:](self, "setView:", v15);
}

- (void)prepareViewWithLayout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!-[AVTSingleAvatarController isViewLoaded](self, "isViewLoaded"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Hey, you haven't even loaded my view first"));
  -[AVTSingleAvatarController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayout:", v4);

}

- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v6 = a4;
  v7 = a3;
  if (!-[AVTSingleAvatarController isViewLoaded](self, "isViewLoaded"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Hey, you haven't even loaded my view first"));
  -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't show an avatar if you don't give me one"));
  -[AVTSingleAvatarController logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avtView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logSingleModeControllerStartUsingLiveView:", v11);

  -[AVTSingleAvatarController setAvtViewSession:](self, "setAvtViewSession:", v7);
  objc_msgSend(v7, "aspectRatio");
  v13 = v12;
  v15 = v14;
  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAspectRatio:", v13, v15);

  -[AVTSingleAvatarController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLayout:", v6);

  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avtViewContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setLiveView:", v19);
  -[AVTSingleAvatarController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "willBeginFocus:", self);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__AVTSingleAvatarController_useAVTViewFromSession_withLayout___block_invoke;
  v21[3] = &unk_1EA51D250;
  v21[4] = self;
  -[AVTSingleAvatarController transitionToShowingDisplayedRecordWithCompletionHandler:](self, "transitionToShowingDisplayedRecordWithCompletionHandler:", v21);
}

void __62__AVTSingleAvatarController_useAVTViewFromSession_withLayout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didBeginFocus:", *(_QWORD *)(a1 + 32));

}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[AVTSingleAvatarController logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSingleAvatarController liveView](self, "liveView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logSingleModeControllerStopUsingLiveView:", v7);

  -[AVTSingleAvatarController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willEndFocus:", self);

  -[AVTSingleAvatarController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didEndFocus:", self);

  -[AVTSingleAvatarController currentTransition](self, "currentTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancel");

  -[AVTSingleAvatarController setCurrentTransition:](self, "setCurrentTransition:", 0);
  -[AVTSingleAvatarController updateImageViewWithAVTViewSnapshot](self, "updateImageViewWithAVTViewSnapshot");
  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLiveView:", 0);

  -[AVTSingleAvatarController setAvtViewSession:](self, "setAvtViewSession:", 0);
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    v12 = v13;
  }

}

- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a4;
  v6 = a3;
  -[AVTSingleAvatarController setDisplayedRecord:](self, "setDisplayedRecord:", v6);
  -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
    -[AVTSingleAvatarController transitionToOtherDisplayedRecord](self, "transitionToOtherDisplayedRecord");
  v9 = (void *)MEMORY[0x1E0CEABB0];
  if (v4)
    v10 = 0.3;
  else
    v10 = 0.0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__AVTSingleAvatarController_displayAvatarForRecord_animated___block_invoke;
  v12[3] = &unk_1EA51D570;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "animateWithDuration:animations:", v12, v10);

}

void __61__AVTSingleAvatarController_displayAvatarForRecord_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayingController:didMoveTowardRecord:withFactor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1.0);

}

- (void)updateImageViewWithDisplayedRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD *, _QWORD *, uint64_t);
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSingleAvatarController thumbnailRenderer](self, "thumbnailRenderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSingleAvatarController renderingScope](self, "renderingScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerForRecord:scope:", v6, v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__AVTSingleAvatarController_updateImageViewWithDisplayedRecord__block_invoke;
    v13[3] = &unk_1EA51E968;
    v13[4] = self;
    v14 = v4;
    v9 = (uint64_t (*)(_QWORD *, _QWORD *, uint64_t))v8[2];
    v10 = v4;
    v11 = (id)v9(v8, v13, 1);

  }
  else
  {
    -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStaticImage:", 0);

  }
}

void __63__AVTSingleAvatarController_updateImageViewWithDisplayedRecord__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStaticImage:", v6);

  }
}

- (void)updateImageViewWithAVTViewSnapshot
{
  void *v3;
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
  id v14;

  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "staticView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D006A8];
    -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avtView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "staticView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTSingleAvatarController logger](self, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotAVTView:matchingViewSize:highQuality:logger:", v8, v10, 1, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStaticImage:", v14);

    -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transitionStaticViewToFront");

  }
  else
  {
    -[AVTSingleAvatarController logger](self, "logger");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logSingleModeCantSnapshotForLackOfWindow");
  }

}

- (void)transitionToOtherDisplayedRecord
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't transition to other record without an AVTView"));
  -[AVTSingleAvatarController updateImageViewWithAVTViewSnapshot](self, "updateImageViewWithAVTViewSnapshot");
  -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avtViewUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke;
  v8[3] = &unk_1EA51D250;
  v8[4] = self;
  objc_msgSend(v6, "setAvatarRecord:completionHandler:", v7, v8);

}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  uint64_t v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "displayedRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayingController:didChangeCurrentRecord:", v4, v5);

    v6 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_2;
    v9[3] = &unk_1EA51D188;
    v10 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_3;
    v8[3] = &unk_1EA51D250;
    v8[4] = v10;
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 0, v9, v8, 0.3);

  }
}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transitionLiveViewToFront");

}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableFaceTracking");

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "transitionToShowingDisplayedRecordWithCompletionHandler:", 0);
}

- (void)transitionToShowingDisplayedRecordWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  AVTAvatarToLiveTransition *v11;
  void *v12;
  AVTAvatarToLiveTransition *v13;
  AVTAvatarToLiveTransition *v14;
  void *v15;
  AVTAvatarToLiveTransition *v16;
  uint64_t v17;
  void (**v18)(id, uint64_t);
  uint64_t *v19;
  _QWORD v20[5];
  uint64_t v21;
  id *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = (void (**)(id, uint64_t))a3;
  if (-[AVTSingleAvatarController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isActive") & 1) == 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "avtViewUpdater");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "avatarRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTSingleAvatarController displayedRecord](self, "displayedRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v10)
      {
        v11 = [AVTAvatarToLiveTransition alloc];
        -[AVTSingleAvatarController logger](self, "logger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[AVTAvatarToLiveTransition initWithModel:animated:setupHandler:completionHandler:logger:](v11, "initWithModel:animated:setupHandler:completionHandler:logger:", self, 0, 0, &__block_literal_global_33, v12);

        -[AVTTransition start](v13, "start");
        if (v4)
          v4[2](v4, 1);

      }
      else
      {
        -[AVTSingleAvatarController updateImageViewWithDisplayedRecord](self, "updateImageViewWithDisplayedRecord");
        v21 = 0;
        v22 = (id *)&v21;
        v23 = 0x3042000000;
        v24 = __Block_byref_object_copy__23;
        v25 = __Block_byref_object_dispose__23;
        v26 = 0;
        v14 = [AVTAvatarToLiveTransition alloc];
        v19 = &v21;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_15;
        v20[3] = &unk_1EA5203F0;
        v20[4] = self;
        v17 = MEMORY[0x1E0C809B0];
        v18 = v4;
        -[AVTSingleAvatarController logger](self, "logger", v17, 3221225472, __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_3, &unk_1EA520418, self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AVTAvatarToLiveTransition initWithModel:animated:setupHandler:completionHandler:logger:](v14, "initWithModel:animated:setupHandler:completionHandler:logger:", self, 1, v20, &v17, v15);

        objc_storeWeak(v22 + 5, v16);
        -[AVTSingleAvatarController setCurrentTransition:](self, "setCurrentTransition:", v16);
        -[AVTTransition start](v16, "start");

        _Block_object_dispose(&v21, 8);
        objc_destroyWeak(&v26);
      }
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avtViewUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayedRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1EA51D3F0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "setAvatarRecord:completionHandler:", v6, v8);

}

uint64_t __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id WeakRetained;
  uint64_t result;

  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitioningContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStaticImage:", 0);

    objc_msgSend(*(id *)(a1 + 32), "currentTransition");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    if (v5 == WeakRetained)
      objc_msgSend(*(id *)(a1 + 32), "setCurrentTransition:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)transitionStaticViewToFront
{
  id v2;

  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionStaticViewToFront");

}

- (void)transitionLiveViewToFront
{
  id v2;

  -[AVTSingleAvatarController transitioningContainer](self, "transitioningContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionLiveViewToFront");

}

- (id)liveView
{
  void *v2;
  void *v3;

  -[AVTSingleAvatarController avtViewSession](self, "avtViewSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVTAvatarDisplayingControllerDelegate)delegate
{
  return (AVTAvatarDisplayingControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (AVTImageTransitioningContainerView)transitioningContainer
{
  return self->_transitioningContainer;
}

- (void)setTransitioningContainer:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningContainer, a3);
}

- (AVTAvatarRecord)displayedRecord
{
  return self->_displayedRecord;
}

- (void)setDisplayedRecord:(id)a3
{
  objc_storeStrong((id *)&self->_displayedRecord, a3);
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (_AVTAvatarRecordImageProvider)thumbnailRenderer
{
  return self->_thumbnailRenderer;
}

- (void)setThumbnailRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailRenderer, a3);
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderer, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_transitioningContainer, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

@end
