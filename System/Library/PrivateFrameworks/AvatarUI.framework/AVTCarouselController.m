@implementation AVTCarouselController

+ (id)sessionProviderForMode:(int64_t)a3 environment:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  AVTViewSessionProvider *v9;

  v5 = a4;
  if (a3 == 1)
    +[AVTViewSessionProvider creatorForAVTRecordView](AVTViewSessionProvider, "creatorForAVTRecordView");
  else
    +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v5);
  v9 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v6, v5, v7, v8);

  return v9;
}

+ (id)displayingCarouselForRecordDataSource:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:dataSource:", 0, v4);

  return v5;
}

+ (id)recordingCarouselForRecordDataSource:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:dataSource:", 1, v4);

  return v5;
}

- (AVTCarouselController)initWithMode:(int64_t)a3 dataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  AVTCarouselController *v9;

  v6 = a4;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sessionProviderForMode:environment:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTCarouselController initWithMode:sessionProvider:dataSource:environment:](self, "initWithMode:sessionProvider:dataSource:environment:", a3, v8, v6, v7);

  return v9;
}

- (AVTCarouselController)initWithMode:(int64_t)a3 sessionProvider:(id)a4 dataSource:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  AVTUIEnvironment *v13;
  AVTCarouselController *v14;
  AVTCarouselController *v15;
  uint64_t v16;
  AVTUILogger *logger;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = (AVTUIEnvironment *)a6;
  v19.receiver = self;
  v19.super_class = (Class)AVTCarouselController;
  v14 = -[AVTCarouselController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_avtViewSessionProvider, a4);
    objc_storeStrong((id *)&v15->_dataSource, a5);
    -[AVTAvatarRecordDataSource addPriorityObserver:](v15->_dataSource, "addPriorityObserver:", v15);
    -[AVTUIEnvironment logger](v13, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    logger = v15->_logger;
    v15->_logger = (AVTUILogger *)v16;

    v15->_environment = v13;
    v15->_singleAvatarMode = 0;
  }

  return v15;
}

- (double)decelerationRate
{
  void *v2;
  double v3;
  double v4;

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decelerationRate");
  v4 = v3;

  return v4;
}

- (void)setDecelerationRate:(double)a3
{
  id v4;

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDecelerationRate:", a3);

}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avtViewBackingSize");
  +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:](AVTViewCarouselLayout, "adaptativeLayoutWithAVTViewAspectRatio:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController setAvtViewLayout:](self, "setAvtViewLayout:", v4);

  v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v9 = (id)objc_msgSend(v5, "initWithFrame:");

  -[AVTCarouselController setView:](self, "setView:", v9);
  if (-[AVTCarouselController singleAvatarMode](self, "singleAvatarMode"))
    -[AVTCarouselController showSingleAvatarControllerAnimated:](self, "showSingleAvatarControllerAnimated:", 0);
  else
    -[AVTCarouselController showMultiAvatarControllerAnimated:](self, "showMultiAvatarControllerAnimated:", 0);
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController avtViewLayout](self, "avtViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareViewWithLayout:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTCarouselController;
  -[AVTCarouselController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AVTCarouselController beginAVTViewSession](self, "beginAVTViewSession");
  -[AVTCarouselController reloadData](self, "reloadData");
}

- (void)beginAVTViewSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!-[AVTCarouselController isPostponingBeginSession](self, "isPostponingBeginSession"))
  {
    -[AVTCarouselController avtViewSession](self, "avtViewSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_initWeak(&location, self);
      -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke;
      v9[3] = &unk_1EA51D1D8;
      objc_copyWeak(&v10, &location);
      v7[0] = v5;
      v7[1] = 3221225472;
      v7[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke_2;
      v7[3] = &unk_1EA51D200;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v4, "sessionWithDidBecomeActiveHandler:tearDownHandler:", v9, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTCarouselController setAvtViewSession:](self, "setAvtViewSession:", v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __44__AVTCarouselController_beginAVTViewSession__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setupAVTView:", v4);

  objc_msgSend(WeakRetained, "setAvtViewSession:", v3);
  objc_msgSend(v3, "avtViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAvtViewContainer:", v5);

  objc_msgSend(WeakRetained, "avatarDisplayingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "avtViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "useAVTViewFromSession:withLayout:", v3, v7);

  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceTrackingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFaceTrackingManagementPaused:", 1);

}

void __44__AVTCarouselController_beginAVTViewSession__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avatarDisplayingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke_3;
  v8[3] = &unk_1EA51E2B8;
  v8[4] = WeakRetained;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "stopUsingAVTViewSessionSynchronously:completionHandler:", 0, v8);

}

uint64_t __44__AVTCarouselController_beginAVTViewSession__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "avtViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "setAvtViewContainer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAvtViewSession:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setupAVTView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setEnableFaceTracking:", 1);
  -[AVTCarouselController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (AVTUIShowPerfHUD_once())
    objc_msgSend(v6, "setShowPerfHUD:", 1);
  objc_msgSend(v6, "setEnableReticle:", 1);

}

- (void)setIsPostponingBeginSession:(BOOL)a3
{
  if (self->_isPostponingBeginSession != a3)
  {
    self->_isPostponingBeginSession = a3;
    if (!a3)
    {
      -[AVTCarouselController beginAVTViewSession](self, "beginAVTViewSession");
      -[AVTCarouselController reloadData](self, "reloadData");
    }
  }
}

- (void)reloadData
{
  id v3;

  -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v3);

}

- (void)reloadDataCenteringToAvatarRecord:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[AVTCarouselController displayAvatarRecord:animated:](self, "displayAvatarRecord:animated:", v5, 0);
}

- (void)setSingleAvatarMode:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AVTCarouselController avtViewLayout](self, "avtViewLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController setSingleAvatarMode:fillContainer:animated:](self, "setSingleAvatarMode:fillContainer:animated:", v3, objc_msgSend(v5, "fillContainer"), 0);

}

- (void)setSingleAvatarMode:(BOOL)a3 fillContainer:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[AVTCarouselController avtViewLayout](self, "avtViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFillContainer:", v6);

  if (self->_singleAvatarMode != v7)
  {
    self->_singleAvatarMode = v7;
    -[AVTCarouselController logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      objc_msgSend(v10, "logCarouselChangingToSingleMode");

      -[AVTCarouselController showSingleAvatarControllerAnimated:](self, "showSingleAvatarControllerAnimated:", v5);
    }
    else
    {
      objc_msgSend(v10, "logCarouselChangingToMultiMode");

      -[AVTCarouselController showMultiAvatarControllerAnimated:](self, "showMultiAvatarControllerAnimated:", v5);
    }
  }
}

- (void)displayAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  v6 = a3;
  -[AVTCarouselController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__AVTCarouselController_displayAvatarRecordWithIdentifier_animated___block_invoke;
  v14[3] = &unk_1EA51DCC8;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v7, "indexesOfRecordsPassingTest:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    -[AVTCarouselController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordAtIndex:", objc_msgSend(v8, "firstIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTCarouselController displayAvatarRecord:animated:](self, "displayAvatarRecord:animated:", v10, v4);
  }
  else
  {
    -[AVTCarouselController environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't fetch record with ID %@, err: %@"), v13, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logErrorFetchingRecords:", v12);

  }
}

uint64_t __68__AVTCarouselController_displayAvatarRecordWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)displayAvatarRecord:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTCarouselController setCurrentAvatarRecord:](self, "setCurrentAvatarRecord:", v6);
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayAvatarForRecord:animated:", v6, v4);

}

- (BOOL)allowsCreate
{
  void *v2;
  char v3;

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsCreate");

  return v3;
}

- (void)setAllowsCreate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsCreate:animated:", v3, 0);

}

- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsCreate:animated:", v5, v4);

}

- (void)showMultiAvatarControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  AVTMultiAvatarController *v6;
  void *v7;
  void *v8;
  AVTMultiAvatarController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void (**v37)(_QWORD);
  id v38;
  id v39;
  void (**v40)(_QWORD);
  void (**v41)(_QWORD);
  void *v42;
  _QWORD v43[4];
  void (**v44)(_QWORD);
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;

  v3 = a3;
  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [AVTMultiAvatarController alloc];
    -[AVTCarouselController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTMultiAvatarController initWithDataSource:environment:](v6, "initWithDataSource:environment:", v7, v8);

    -[AVTMultiAvatarController setDelegate:](v9, "setDelegate:", self);
    -[AVTMultiAvatarController view](v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutoresizingMask:", 18);

    -[AVTCarouselController setMultiAvatarController:](self, "setMultiAvatarController:", v9);
  }
  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCarouselController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSubview:aboveSubview:", v14, v16);

  }
  else
  {
    objc_msgSend(v12, "insertSubview:atIndex:", v14, 0);
  }

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController setAvatarDisplayingController:](self, "setAvatarDisplayingController:", v17);

  -[AVTCarouselController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "reloadData");

  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayAvatarForRecord:animated:", v31, 0);

  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v32, "prepareToTransitionToVisible:completionHandler:", 0, &v50);
  v33 = v50;

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v34, "prepareToTransitionToVisible:completionHandler:", 1, &v49);
  v35 = v49;

  v36 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke;
  v48[3] = &unk_1EA51D188;
  v48[4] = self;
  v37 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v48);
  v45[0] = v36;
  v45[1] = 3221225472;
  v45[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_2;
  v45[3] = &unk_1EA51F118;
  v38 = v33;
  v46 = v38;
  v39 = v35;
  v47 = v39;
  v45[4] = self;
  v40 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v45);
  v41 = v40;
  if (v3)
  {
    v42 = (void *)MEMORY[0x1E0CEABB0];
    v43[0] = v36;
    v43[1] = 3221225472;
    v43[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_3;
    v43[3] = &unk_1EA51D3F0;
    v44 = v40;
    objc_msgSend(v42, "animateWithDuration:animations:completion:", v37, v43, 0.3);

  }
  else
  {
    v37[2](v37);
    v41[2](v41);
  }

}

void __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "avatarDisplayingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "singleAvatarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUsingAVTViewSessionSynchronously:completionHandler:", 1, 0);

  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "avatarDisplayingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "avtViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "useAVTViewFromSession:withLayout:", v7, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "singleAvatarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "singleAvatarController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

  }
}

uint64_t __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)showSingleAvatarControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  AVTSingleAvatarController *v6;
  void *v7;
  void *v8;
  AVTSingleAvatarController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void (**v41)(_QWORD);
  id v42;
  id v43;
  void (**v44)(_QWORD);
  void (**v45)(_QWORD);
  void *v46;
  _QWORD v47[4];
  void (**v48)(_QWORD);
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;

  v3 = a3;
  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [AVTSingleAvatarController alloc];
    -[AVTCarouselController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTSingleAvatarController initWithDataSource:environment:](v6, "initWithDataSource:environment:", v7, v8);

    -[AVTSingleAvatarController setDelegate:](v9, "setDelegate:", self);
    -[AVTSingleAvatarController view](v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutoresizingMask:", 18);

    -[AVTCarouselController setSingleAvatarController:](self, "setSingleAvatarController:", v9);
  }
  -[AVTCarouselController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSubview:atIndex:", v13, 0);

  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stopUsingAVTViewSessionSynchronously:completionHandler:", 1, 0);

  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController setAvatarDisplayingController:](self, "setAvatarDisplayingController:", v15);

  -[AVTCarouselController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reloadData");

  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayAvatarForRecord:animated:", v29, 0);

  -[AVTCarouselController multiAvatarController](self, "multiAvatarController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v30, "prepareToTransitionToVisible:completionHandler:", 0, &v54);
  v31 = v54;

  -[AVTCarouselController singleAvatarController](self, "singleAvatarController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(v32, "prepareToTransitionToVisible:completionHandler:", 1, &v53);
  v33 = v53;

  -[AVTCarouselController avtViewSession](self, "avtViewSession");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController avtViewSession](self, "avtViewSession");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController avtViewLayout](self, "avtViewLayout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "useAVTViewFromSession:withLayout:", v36, v37);

  }
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAlpha:", 1.0);

  v40 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke;
  v52[3] = &unk_1EA51D188;
  v52[4] = self;
  v41 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v52);
  v49[0] = v40;
  v49[1] = 3221225472;
  v49[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_2;
  v49[3] = &unk_1EA51F118;
  v42 = v31;
  v50 = v42;
  v43 = v33;
  v51 = v43;
  v49[4] = self;
  v44 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v49);
  v45 = v44;
  if (v3)
  {
    v46 = (void *)MEMORY[0x1E0CEABB0];
    v47[0] = v40;
    v47[1] = 3221225472;
    v47[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_3;
    v47[3] = &unk_1EA51D3F0;
    v48 = v44;
    objc_msgSend(v46, "animateWithDuration:animations:completion:", v41, v47, 0.3);

  }
  else
  {
    v41[2](v41);
    v45[2](v45);
  }

}

void __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "multiAvatarController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "multiAvatarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "multiAvatarController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

  }
}

uint64_t __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)presentEditorForCreatingAvatar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTCarouselController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalRecordStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:avtViewSessionProvider:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
  -[AVTCarouselController wrapAndPresentViewController:animated:](self, "wrapAndPresentViewController:animated:", v6, 1);

}

- (void)presentActionsForAvatar:(id)a3
{
  id v4;
  AVTAvatarActionsProvider *v5;
  void *v6;
  AVTAvatarActionsProvider *v7;
  AVTAvatarInlineActionsController *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTAvatarInlineActionsController *v12;
  AVTAvatarActionsViewController *v13;
  void *v14;
  void *v15;
  AVTAvatarActionsViewController *v16;
  id v17;

  v4 = a3;
  if ((objc_msgSend(v4, "isEditable") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Record %@ is not editable!"), v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
  v17 = v4;
  v5 = [AVTAvatarActionsProvider alloc];
  -[AVTCarouselController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v5, "initWithAvatarRecord:dataSource:allowCreate:", v17, v6, 0);

  v8 = [AVTAvatarInlineActionsController alloc];
  -[AVTCarouselController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTAvatarInlineActionsController initWithDataSource:avtViewProvider:environment:](v8, "initWithDataSource:avtViewProvider:environment:", v9, v10, v11);

  -[AVTAvatarInlineActionsController updateWithActionsModel:](v12, "updateWithActionsModel:", v7);
  v13 = [AVTAvatarActionsViewController alloc];
  -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController environment](self, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AVTAvatarActionsViewController initWithAVTViewSessionProvider:actionsController:environment:](v13, "initWithAVTViewSessionProvider:actionsController:environment:", v14, v12, v15);

  -[AVTAvatarActionsViewController setDelegate:](v16, "setDelegate:", self);
  -[AVTCarouselController wrapAndPresentViewController:animated:](self, "wrapAndPresentViewController:animated:", v16, 1);

}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentAvatarUIController:animated:", v6, 1);

}

- (void)didBeginFocus:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[AVTCarouselController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "usageTrackingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didStartFaceTrackingInCarouselWithAvatar:", v8);

    -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController avtViewSession](self, "avtViewSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avtView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController notifyDelegateDidFocusRecord:avtView:](self, "notifyDelegateDidFocusRecord:avtView:", v11, v10);

  }
}

- (void)willEndFocus:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[AVTCarouselController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "usageTrackingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didStopFaceTrackingInCarousel");

    -[AVTCarouselController currentAvatarRecord](self, "currentAvatarRecord");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController avtViewSession](self, "avtViewSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avtView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController notifyDelegateWillEndFocusOnRecord:avtView:](self, "notifyDelegateWillEndFocusOnRecord:avtView:", v10, v9);

  }
}

- (void)displayingController:(id)a3 didChangeCurrentRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[AVTCarouselController setCurrentAvatarRecord:](self, "setCurrentAvatarRecord:", v10);
    -[AVTCarouselController environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "usageTrackingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didChangeCurrentAvatarInCarousel:", v10);

    -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v10);
  }

}

- (void)displayingControllerWantsToPresentEditorForCreation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCarouselController presentEditorForCreatingAvatar:](self, "presentEditorForCreatingAvatar:", v6);

    v5 = v7;
  }

}

- (void)displayingController:(id)a3 didMoveTowardRecord:(id)a4 withFactor:(double)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a4;
  v8 = a3;
  -[AVTCarouselController avatarDisplayingController](self, "avatarDisplayingController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    -[AVTCarouselController notifyDelegateNearnessFactorDidChange:towardRecord:](self, "notifyDelegateNearnessFactorDidChange:towardRecord:", v10, a5);

}

- (void)notifyDelegateDidFocusRecord:(id)a3 avtView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  -[AVTCarouselController environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logCarouselDelegateDidFocusRecord:", v10);

  v11 = -[AVTCarouselController mode](self, "mode");
  if (v11 == 1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__14;
    v31 = __Block_byref_object_dispose__14;
    v32 = 0;
    if (v6)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __62__AVTCarouselController_notifyDelegateDidFocusRecord_avtView___block_invoke;
      v26[3] = &unk_1EA51F140;
      v26[4] = &v27;
      objc_msgSend(v7, "downcastWithAVTViewHandler:recordViewHandler:", 0, v26);
    }
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "carouselController:didFocusOnRecordView:", self, v28[5]);

    }
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "carouselController:didUpdateWithRecord:", self, v6);

    }
    _Block_object_dispose(&v27, 8);

  }
  else if (!v11)
  {
    if (v6)
      v12 = v7;
    else
      v12 = 0;
    v13 = v12;
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "carouselController:didFocusOnView:", self, v13);

    }
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "carouselController:didUpdateWithRecord:", self, v6);

    }
  }

}

void __62__AVTCarouselController_notifyDelegateDidFocusRecord_avtView___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)notifyDelegateWillEndFocusOnRecord:(id)a3 avtView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  -[AVTCarouselController environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logCarouselDelegateWillEndFocusRecord:", v10);

  v11 = -[AVTCarouselController mode](self, "mode");
  if (v11 == 1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__14;
    v25 = __Block_byref_object_dispose__14;
    v26 = 0;
    if (v6)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__AVTCarouselController_notifyDelegateWillEndFocusOnRecord_avtView___block_invoke;
      v20[3] = &unk_1EA51F140;
      v20[4] = &v21;
      objc_msgSend(v7, "downcastWithAVTViewHandler:recordViewHandler:", 0, v20);
    }
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "carouselController:willEndFocusOnRecordView:", self, v22[5]);

    }
    _Block_object_dispose(&v21, 8);

  }
  else if (!v11)
  {
    if (v6)
      v12 = v7;
    else
      v12 = 0;
    v13 = v12;
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "carouselController:willEndFocusOnView:", self, v13);

    }
  }
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v6);

}

void __68__AVTCarouselController_notifyDelegateWillEndFocusOnRecord_avtView___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)notifyDelegateNearnessFactorDidChange:(double)a3 towardRecord:(id)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v21 = a4;
  -[AVTCarouselController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logCarouselDelegateNearnessFactorDidChange:towardRecord:editable:", v21 != 0, objc_msgSend(v21, "isEditable"), a3);

  v8 = -[AVTCarouselController mode](self, "mode");
  if (v8 == 1)
  {
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "carouselController:didMoveTowardRecord:withFactor:", self, v21, a3);

    }
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else if (!v8)
  {
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "carouselController:didMoveTowardRecord:withFactor:", self, v21, a3);

    }
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v20 = v14;
      objc_msgSend(v14, "carouselController:didMoveToNearestRecord:withFactor:", self, v21, a3);

    }
  }

}

- (void)notifyDelegateDidUpdateWithRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  -[AVTCarouselController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logCarouselDelegateDidUpdateRecord:", v6);

  v7 = -[AVTCarouselController mode](self, "mode");
  if (v7 == 1)
  {
    -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[AVTCarouselController recordingDelegate](self, "recordingDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if (!v7)
  {
    -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[AVTCarouselController displayingDelegate](self, "displayingDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = v10;
      objc_msgSend(v10, "carouselController:didUpdateWithRecord:", self, v14);

    }
  }

}

- (AVTRecordView)focusedRecordingView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (-[AVTCarouselController mode](self, "mode") != 1)
    return (AVTRecordView *)0;
  -[AVTCarouselController avtViewSession](self, "avtViewSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (!v4)
    return (AVTRecordView *)0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = 0;
  -[AVTCarouselController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avtView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AVTCarouselController_focusedRecordingView__block_invoke;
  v9[3] = &unk_1EA51F140;
  v9[4] = &v10;
  objc_msgSend(v6, "downcastWithAVTViewHandler:recordViewHandler:", 0, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (AVTRecordView *)v7;
}

void __45__AVTCarouselController_focusedRecordingView__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (AVTView)focusedDisplayView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (-[AVTCarouselController mode](self, "mode"))
    return (AVTView *)0;
  -[AVTCarouselController avtViewSession](self, "avtViewSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (!v4)
    return (AVTView *)0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = 0;
  -[AVTCarouselController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avtView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AVTCarouselController_focusedDisplayView__block_invoke;
  v9[3] = &unk_1EA51F168;
  v9[4] = &v10;
  objc_msgSend(v6, "downcastWithAVTViewHandler:recordViewHandler:", v9, 0);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (AVTView *)v7;
}

void __43__AVTCarouselController_focusedDisplayView__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  v6 = a4;
  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v6);
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v6);

}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  v6 = a4;
  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v6);
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v6);

}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v7 = a3;
  -[AVTCarouselController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexSetForEditableRecords");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v13 = v9;
  objc_msgSend(v7, "recordAtIndex:", objc_msgSend(v9, "closestIndexToIndex:greaterIndexesFirst:", a5, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v11);
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v11);

}

- (void)significantRecordChangeInDataSource:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[AVTCarouselController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__AVTCarouselController_significantRecordChangeInDataSource___block_invoke;
  v9[3] = &unk_1EA51DCC8;
  v9[4] = self;
  v5 = objc_msgSend(v4, "indexOfRecordPassingTest:", v9);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;
  -[AVTCarouselController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v8);
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v8);

}

uint64_t __61__AVTCarouselController_significantRecordChangeInDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentAvatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[AVTCarouselController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:withDataSource:](AVTAvatarActionsRecordUpdate, "recordUpdateForDeletingRecord:withDataSource:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  void *v4;

  -[AVTCarouselController presenterDelegate](self, "presenterDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAvatarUIControllerAnimated:", 1);

  -[AVTCarouselController beginAVTViewSession](self, "beginAVTViewSession");
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[AVTCarouselController reloadDataCenteringToAvatarRecord:](self, "reloadDataCenteringToAvatarRecord:", v5);
  -[AVTCarouselController notifyDelegateDidUpdateWithRecord:](self, "notifyDelegateDidUpdateWithRecord:", v5);

  -[AVTCarouselController presenterDelegate](self, "presenterDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAvatarUIControllerAnimated:", 1);

  -[AVTCarouselController beginAVTViewSession](self, "beginAVTViewSession");
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  void *v4;

  -[AVTCarouselController presenterDelegate](self, "presenterDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAvatarUIControllerAnimated:", 1);

  -[AVTCarouselController beginAVTViewSession](self, "beginAVTViewSession");
}

- (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[AVTCarouselController avtViewSessionProvider](self, "avtViewSessionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avtViewBackingSize");
  v10 = v9;
  v12 = v11;
  -[AVTCarouselController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCarouselController environment](self, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTMultiAvatarController snapshotProviderFocusedOnRecordWithIdentifier:size:avtViewAspectRatio:dataSource:environment:](AVTMultiAvatarController, "snapshotProviderFocusedOnRecordWithIdentifier:size:avtViewAspectRatio:dataSource:environment:", v7, v13, v14, width, height, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (AVTDisplayingCarouselControllerDelegate)displayingDelegate
{
  return (AVTDisplayingCarouselControllerDelegate *)objc_loadWeakRetained((id *)&self->displayingDelegate);
}

- (void)setDisplayingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->displayingDelegate, a3);
}

- (AVTRecordingCarouselControllerDelegate)recordingDelegate
{
  return (AVTRecordingCarouselControllerDelegate *)objc_loadWeakRetained((id *)&self->recordingDelegate);
}

- (void)setRecordingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->recordingDelegate, a3);
}

- (BOOL)singleAvatarMode
{
  return self->_singleAvatarMode;
}

- (BOOL)isPostponingBeginSession
{
  return self->_isPostponingBeginSession;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarRecord)currentAvatarRecord
{
  return self->_currentAvatarRecord;
}

- (void)setCurrentAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_currentAvatarRecord, a3);
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewContainer, a3);
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (AVTMultiAvatarController)multiAvatarController
{
  return self->_multiAvatarController;
}

- (void)setMultiAvatarController:(id)a3
{
  objc_storeStrong((id *)&self->_multiAvatarController, a3);
}

- (AVTSingleAvatarController)singleAvatarController
{
  return self->_singleAvatarController;
}

- (void)setSingleAvatarController:(id)a3
{
  objc_storeStrong((id *)&self->_singleAvatarController, a3);
}

- (AVTAvatarDisplayingController)avatarDisplayingController
{
  return self->_avatarDisplayingController;
}

- (void)setAvatarDisplayingController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarDisplayingController, a3);
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewLayout, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong((id *)&self->_avatarDisplayingController, 0);
  objc_storeStrong((id *)&self->_singleAvatarController, 0);
  objc_storeStrong((id *)&self->_multiAvatarController, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avtViewContainer, 0);
  objc_storeStrong((id *)&self->_currentAvatarRecord, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->recordingDelegate);
  objc_destroyWeak((id *)&self->displayingDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
