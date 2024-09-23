@implementation BKUIPearlEnrollController

- (BKUIPearlEnrollController)initWithPreloadedState:(id)a3
{
  id v5;
  BKUIPearlEnrollController *v6;
  BKUIOrientationStateHandler *v7;
  BKUIOrientationStateHandler *orientationStateHandler;
  BKUIPearlCoachingController *v9;
  BKUIPearlCoachingController *coachingController;
  __objc2_class *v11;
  uint64_t v12;
  BKUIPearlEnrollViewController *enrollViewController;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKUIPearlEnrollController;
  v6 = -[BKUIPearlEnrollController init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(BKUIOrientationStateHandler);
    orientationStateHandler = v6->_orientationStateHandler;
    v6->_orientationStateHandler = v7;

    v9 = objc_alloc_init(BKUIPearlCoachingController);
    coachingController = v6->_coachingController;
    v6->_coachingController = v9;

    -[BKUIPearlCoachingController setDelegate:](v6->_coachingController, "setDelegate:", v6);
    -[BKUIPearlCoachingController setIsDisplayZoomEnabled:](v6->_coachingController, "setIsDisplayZoomEnabled:", objc_msgSend((id)objc_opt_class(), "isDisplayZoomEnabled"));
    -[BKUIPearlEnrollController addChildViewController:](v6, "addChildViewController:", v6->_coachingController);
    objc_storeStrong((id *)&v6->_preloadState, a3);
    if (+[BKUIUtils containerEnrollmentStyleEnabled](BKUIUtils, "containerEnrollmentStyleEnabled"))
      v11 = BKUIPearlJindoEnrollViewController;
    else
      v11 = BKUIPearlEnrollViewController;
    v12 = objc_msgSend([v11 alloc], "initWithPreloadedState:", v5);
    enrollViewController = v6->_enrollViewController;
    v6->_enrollViewController = (BKUIPearlEnrollViewController *)v12;

    -[BKUIPearlEnrollViewController setDelegate:](v6->_enrollViewController, "setDelegate:", v6);
    -[BKUIPearlEnrollViewController setIsDisplayZoomEnabled:](v6->_enrollViewController, "setIsDisplayZoomEnabled:", objc_msgSend((id)objc_opt_class(), "isDisplayZoomEnabled"));
    -[BKUIPearlEnrollController addChildViewController:](v6, "addChildViewController:", v6->_enrollViewController);
    -[BKUIPearlEnrollController setEnrollmentConfiguration:](v6, "setEnrollmentConfiguration:", 0);
  }

  return v6;
}

- (BKUIPearlEnrollController)init
{
  return -[BKUIPearlEnrollController initWithPreloadedState:](self, "initWithPreloadedState:", 0);
}

- (BOOL)isModalInPresentation
{
  void *v2;
  char v3;

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isModalInPresentation");

  return v3;
}

- (void)startInternalGlassesFlow
{
  NSObject *v3;
  _BOOL4 v4;
  __objc2_class **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: startInternalGlassesFlow", buf, 2u);
  }

  v4 = +[BKUIUtils containerEnrollmentStyleEnabled](BKUIUtils, "containerEnrollmentStyleEnabled");
  v5 = off_1EA27F0D8;
  if (!v4)
    v5 = off_1EA27F0C8;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithPreloadedState:", self->_preloadState);
  objc_msgSend(v6, "setEnrollmentConfiguration:", 4);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setIsDisplayZoomEnabled:", objc_msgSend((id)objc_opt_class(), "isDisplayZoomEnabled"));
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInBuddy:", objc_msgSend(v7, "inBuddy"));

  objc_msgSend(v6, "setGlassesMidFlowUpsell:", 1);
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentOperationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "externalizedAuthContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primeWithExternalizedAuthContext:", v10);

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentOperationHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primeWithPasscode:", v13);

  -[BKUIPearlEnrollController addChildViewController:](self, "addChildViewController:", v6);
  -[BKUIPearlEnrollController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[BKUIPearlEnrollController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  objc_msgSend(v6, "didMoveToParentViewController:", self);
  objc_msgSend(v6, "setInBuddyGlassesFollowUp:", -[BKUIPearlEnrollController inBuddy](self, "inBuddy"));
  +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__BKUIPearlEnrollController_startInternalGlassesFlow__block_invoke;
  v28[3] = &unk_1EA27FC78;
  v28[4] = self;
  v29 = v6;
  v27 = v6;
  objc_msgSend(v26, "transitionTo:completion:", v27, v28);

}

uint64_t __53__BKUIPearlEnrollController_startInternalGlassesFlow__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromParentViewController");

  objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setEnrollViewController:", *(_QWORD *)(a1 + 40));
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
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewDidLoad](&v51, sel_viewDidLoad);
  -[BKUIPearlEnrollController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BKUIPearlEnrollController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollController _startObserving](self, "_startObserving");
    -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rotationLockStatusIsLocked");

    -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rawDeviceOrientationIgnoringOrientationLocks");

    v20 = -[UIViewController bkui_uiforDeviceOrientation:](self, "bkui_uiforDeviceOrientation:", v19);
    v21 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", 0);
    v22 = objc_msgSend(MEMORY[0x1E0CEABB8], "bkui_reverseLeftRight:", v21);
    if (v20)
      v23 = v20;
    else
      v23 = v22;
    if (!v17)
      v23 = v22;
    self->_orientation = v23;
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOrientation:", self->_orientation);

    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "deviceOrientationChanged");

    -[BKUIPearlEnrollController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", v26);

    if (v27 == 1)
      -[BKUIPearlEnrollController setHasBeenPortrait:](self, "setHasBeenPortrait:", 1);
  }
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v5, v7, v9, v11);

  -[BKUIPearlEnrollController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v32);

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "didMoveToParentViewController:", self);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v38);

    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "didMoveToParentViewController:", self);

    -[BKUIPearlEnrollController setTransparencyForCoachingController](self, "setTransparencyForCoachingController");
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", v5, v7, v9, v11);

    -[BKUIPearlEnrollController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bringSubviewToFront:", v43);

  }
  if (!-[BKUIPearlEnrollController inBuddy](self, "inBuddy"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x1E0CEB288];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __40__BKUIPearlEnrollController_viewDidLoad__block_invoke;
    v48[3] = &unk_1EA280330;
    objc_copyWeak(&v49, &location);
    v47 = (id)objc_msgSend(v44, "addObserverForName:object:queue:usingBlock:", v46, 0, v45, v48);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
}

void __40__BKUIPearlEnrollController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setTransparencyForCoachingController
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int64_t orientation;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134)
      goto LABEL_7;
    v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454)
      goto LABEL_7;
    v4 = 2487868872;
  }
  if (v3 == v4)
  {
LABEL_7:
    if (self->_orientation == 4)
      v5 = 0.0;
    else
      v5 = 1.0;
    goto LABEL_10;
  }
  if (self->_orientation == 1)
    v5 = 0.0;
  else
    v5 = 1.0;
LABEL_10:
  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  _BKUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alpha");
    orientation = self->_orientation;
    v13 = 134218240;
    v14 = v12;
    v15 = 2048;
    v16 = orientation;
    _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "Coaching controller transparency: %f for orientation: %ld", (uint8_t *)&v13, 0x16u);

  }
}

- (unint64_t)enrollmentConfiguration
{
  void *v2;
  unint64_t v3;

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enrollmentConfiguration");

  return v3;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  id v4;

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnrollmentConfiguration:", a3);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

+ (BOOL)isDisplayZoomEnabled
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  float v13;
  double v14;
  float v15;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;

  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("zoomed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") < 4)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
      if (v9 && v10)
      {
        objc_msgSend(v10, "floatValue");
        v14 = v13;
        objc_msgSend(v9, "floatValue");
        v12 = v7 == v15 && v5 == v14;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _OWORD v22[8];
  objc_super v23;

  v3 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewWillAppear:](&v23, sel_viewWillAppear_);
  -[BKUIPearlEnrollController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollController _copyAndShowInternalNavBar](self, "_copyAndShowInternalNavBar");
    -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    objc_msgSend(v10, "size");
    v13 = v12;
    objc_msgSend(v11, "size");
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v13, v14);

    -[BKUIPearlEnrollController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v22[5] = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v22[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v22[7] = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v22[0] = *MEMORY[0x1E0CD2610];
    v22[1] = v19;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v22[3] = v20;
    objc_msgSend(v16, "setTransform:", v22);

    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v21, "needsToShow");

    -[BKUIPearlEnrollController setCoachingHidden:animated:](self, "setCoachingHidden:animated:", v16 ^ 1, v3);
    -[BKUIPearlEnrollController diffSystemAndForcedRotationOrientations](self, "diffSystemAndForcedRotationOrientations");
  }
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController navigationItem](&v7, sel_navigationItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pushNavigationItem:transition:", v4, 0);

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController navigationItem](&v6, sel_navigationItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double MidX;
  void *v15;
  double MidY;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D65130], "preferredContentSize");
    v6 = v5;
    v8 = v7;
    if (!-[BKUIPearlEnrollController inSheet](self, "inSheet"))
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fixedCoordinateSpace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v6 = v11;
      v8 = v12;

    }
    -[BKUIPearlEnrollController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    MidX = CGRectGetMidX(v20);
    -[BKUIPearlEnrollController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MidY = CGRectGetMidY(v21);

    -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", MidX - v6 * 0.5, MidY - v8 * 0.5, v6, v8);

  }
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D651B8], "preferredContentSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
    goto LABEL_10;
  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "rotationLockStatusIsLocked") & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  -[BKUIPearlEnrollController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interfaceOrientation") - 3;

  if (v12 <= 1)
    v13 = v6;
  else
    v13 = v4;
  if (v12 <= 1)
    v6 = v4;
  v4 = v13;
LABEL_11:
  v14 = v4;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)deviceOrientationChanged:(int64_t)a3
{
  -[BKUIPearlEnrollController deviceOrientationChanged:duration:](self, "deviceOrientationChanged:duration:", a3, 0.400000006);
}

- (void)deviceOrientationChanged:(int64_t)a3 duration:(double)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t orientation;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int64_t v15;
  int64_t v16;
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
  uint64_t v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  _QWORD v46[4];
  id v47;
  _OWORD v48[3];
  float64x2_t v49;
  float64x2_t v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  char v54;
  _QWORD v55[5];
  char v56;
  float64x2_t buf[2];
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0].f64[0]) = 134218240;
    *(_QWORD *)((char *)buf[0].f64 + 4) = a3;
    WORD2(buf[0].f64[1]) = 2048;
    *(double *)((char *)&buf[0].f64[1] + 6) = a4;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "deviceOrientationChanged: orientation = %lu, duration = %f", (uint8_t *)buf, 0x16u);
  }

  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrientation:", a3);

  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "needsToShow");

  orientation = self->_orientation;
  self->_orientation = a3;
  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrientation:", a3);

  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "rotationLockStatusIsLocked"))
  {
    v14 = !self->_systemRotationAnimating;

    if (v14)
    {
      v15 = -[UIViewController bkui_deviceOrientationForIterfaceOrientation:](self, "bkui_deviceOrientationForIterfaceOrientation:", orientation);
      v16 = -[UIViewController bkui_deviceOrientationForIterfaceOrientation:](self, "bkui_deviceOrientationForIterfaceOrientation:", self->_orientation);
      objc_initWeak((id *)buf, self);
      -[BKUIPearlEnrollController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      -[BKUIPearlEnrollController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke;
      v55[3] = &unk_1EA280358;
      v55[4] = self;
      v56 = v10;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_2;
      v52[3] = &unk_1EA280380;
      objc_copyWeak(&v53, (id *)buf);
      v52[4] = self;
      v54 = v10;
      -[UIViewController bkui_rotateView:fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:](self, "bkui_rotateView:fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:", v27, v15, v16, v55, v52, v20, v22, v24, v26, a4);

      objc_destroyWeak(&v53);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {

  }
  -[BKUIPearlEnrollController resetLayout](self, "resetLayout");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "userInterfaceIdiom");

  if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[UIViewController bkui_uiforDeviceOrientation:](self, "bkui_uiforDeviceOrientation:", objc_msgSend(v30, "rawDeviceOrientationIgnoringOrientationLocks"));
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setOrientation:", v31);

    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "needsToShow");

    -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollController coachingController](self, "coachingController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "animateWithOrientation:", objc_msgSend(v36, "orientation"));

    if ((v34 & 1) == 0)
    {
      -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setEnrollMovieViewHidden:", 0);

    }
    _BKUILoggingFacility();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].f64[0]) = 0;
      _os_log_impl(&dword_1DB281000, v38, OS_LOG_TYPE_DEFAULT, "Enroll controller completed size transition", (uint8_t *)buf, 2u);
    }

    if (-[BKUIPearlEnrollController hasBeenPortrait](self, "hasBeenPortrait"))
    {
      v58 = 0u;
      memset(buf, 0, sizeof(buf));
      -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        objc_msgSend(v40, "transform");
      }
      else
      {
        v58 = 0u;
        memset(buf, 0, sizeof(buf));
      }

      buf[0] = vrndaq_f64(buf[0]);
      buf[1] = vrndaq_f64(buf[1]);
      v50 = buf[1];
      v51 = v58;
      v49 = buf[0];
      -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v49;
      v48[1] = v50;
      v48[2] = v51;
      objc_msgSend(v43, "setTransform:", v48);

    }
    objc_initWeak((id *)buf, self);
    if (v34)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_27;
      v46[3] = &unk_1EA27FB70;
      objc_copyWeak(&v47, (id *)buf);
      -[BKUIPearlEnrollController setCoachingHidden:animated:completion:](self, "setCoachingHidden:animated:completion:", 0, 1, v46);
      objc_destroyWeak(&v47);
    }
    else
    {
      -[BKUIPearlEnrollController setCoachingHidden:animated:](self, "setCoachingHidden:animated:", 1, 1);
    }
    -[BKUIPearlEnrollController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", v44) == 1;

    if (v45)
      -[BKUIPearlEnrollController setHasBeenPortrait:](self, "setHasBeenPortrait:", 1);
    self->_systemRotationAnimating = 0;
    objc_destroyWeak((id *)buf);
  }
}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "bkui_debugBorder:withWidth:", v3, 1);

  objc_msgSend(*(id *)(a1 + 32), "coachingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopCoachingAnimation");

  objc_msgSend(*(id *)(a1 + 32), "setCoachingHidden:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateWithOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnrollMovieViewHidden:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  float64x2_t v15;
  __int128 v16;
  uint8_t buf[16];
  float64x2_t v18;
  __int128 v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Enroll controller completed size transition", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenPortrait"))
  {
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)buf = 0u;
    objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "transform");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      *(_OWORD *)buf = 0u;
    }

    *(float64x2_t *)buf = vrndaq_f64(*(float64x2_t *)buf);
    v18 = vrndaq_f64(v18);
    v15 = v18;
    v16 = v19;
    v14 = *(_OWORD *)buf;
    objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    objc_msgSend(v8, "setTransform:", v13);

  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnrollMovieViewHidden:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", v10);

  if (v11 == 1)
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenPortrait:", 1);
  objc_msgSend(*(id *)(a1 + 32), "coachingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceOrientationChanged");

}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_27(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "center");
  v3 = v2;
  v5 = v4;
  objc_msgSend(WeakRetained, "coachingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v3, v5);

  objc_msgSend(WeakRetained, "enrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnrollMovieViewHidden:", 1);

  objc_msgSend(WeakRetained, "coachingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceOrientationChanged");

}

- (void)_startObserving
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __44__BKUIPearlEnrollController__startObserving__block_invoke;
  v8 = &unk_1EA2803A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "registerRotationObserver:", &v5);

  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerRotationLockObserver:", &__block_literal_global_3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__BKUIPearlEnrollController__startObserving__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "bkui_uiforDeviceOrientation:", a2);
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218240;
    v12 = a2;
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "ForcedRotation: orientation changed: deviceOrientation = %lu, orientation = %lu", (uint8_t *)&v11, 0x16u);
  }

  if (!a2
    || (unint64_t)(a2 - 5) < 2
    || (unint64_t)(a2 - 5) < 2 == a2
    || (objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "applicationState"),
        v6,
        v7))
  {
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "applicationState");
      v11 = 134218240;
      v12 = v10;
      v13 = 2048;
      v14 = a2;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "ForcedRotration:[orientation stat change callback pruned] - application state %li, orientation %li", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "deviceOrientationChanged:", v4);
    objc_msgSend(WeakRetained, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }

}

void __44__BKUIPearlEnrollController__startObserving__block_invoke_30(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "ForcedRotration:[rotation lock status changed] - locked:%i", (uint8_t *)v4, 8u);
  }

}

- (void)resetLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[8];

  -[BKUIPearlEnrollController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "bkui_debugBorder:withWidth:", v4, 1);

  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopCoachingAnimation");

  -[BKUIPearlEnrollController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v13[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v13[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v13[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v13[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v13[0] = *MEMORY[0x1E0CD2610];
  v13[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v13[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v13[3] = v12;
  objc_msgSend(v8, "setTransform:", v13);

}

- (void)diffSystemAndForcedRotationOrientations
{
  void *v3;
  void *v4;
  int64_t v5;

  -[BKUIPearlEnrollController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_orientation = -[UIViewController bkui_reverseLeftRight:](self, "bkui_reverseLeftRight:", +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", v3));

  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewController bkui_uiforDeviceOrientation:](self, "bkui_uiforDeviceOrientation:", objc_msgSend(v4, "rawDeviceOrientationIgnoringOrientationLocks"));

  if (v5)
    -[BKUIPearlEnrollController deviceOrientationChanged:duration:](self, "deviceOrientationChanged:duration:", v5, 0.0);
}

- (void)_copyAndShowInternalNavBar
{
  void *v3;
  void *v4;
  UINavigationBar *v5;
  UINavigationBar *navbarCopy;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[BKUIPearlEnrollController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BKUITypeSafeCopier copy:](BKUITypeSafeCopier, "copy:", v4);
  navbarCopy = self->_navbarCopy;
  self->_navbarCopy = v5;

  -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pushNavigationItem:transition:", v8, 0);

  -[BKUIPearlEnrollController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNavigationBarHidden:animated:", 1, 0);

  -[BKUIPearlEnrollController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[BKUIPearlEnrollController navbarCopy](self, "navbarCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[BKUIPearlEnrollController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[BKUIPearlEnrollController setRotationLockToken:](self, "setRotationLockToken:", 0);
  -[BKUIPearlEnrollController setRotationChangeToken:](self, "setRotationChangeToken:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  -[BKUIPearlEnrollController orientationStateHandler](self, "orientationStateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rotationLockStatusIsLocked");

  return v6;
}

- (void)deviceOrientationDidChange:(id)a3
{
  void *v4;
  int v5;

  -[BKUIPearlEnrollController coachingController](self, "coachingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsToShow");

  -[BKUIPearlEnrollController setCoachingHidden:animated:](self, "setCoachingHidden:animated:", v5 ^ 1u, 1);
}

- (void)coachingSkipped
{
  void *v3;
  id v4;

  -[BKUIPearlEnrollController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pearlEnrollController:finishedEnrollWithError:", self, v3);

}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[BKUIPearlEnrollController setCoachingHidden:animated:completion:](self, "setCoachingHidden:animated:completion:", a3, a4, 0);
}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v5 = a4;
  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _BKUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v20 = v6;
    v21 = 1024;
    v22 = v5;
    _os_log_impl(&dword_1DB281000, v9, OS_LOG_TYPE_DEFAULT, "Setting coaching hidden: %i animated: %i", buf, 0xEu);
  }

  v10 = !v5;
  v11 = MEMORY[0x1E0CEABB0];
  if (v10)
    v12 = 0.0;
  else
    v12 = 0.389999986;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke;
  v17[3] = &unk_1EA280410;
  v17[4] = self;
  v18 = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke_2;
  v14[3] = &unk_1EA280438;
  v16 = v6;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  +[UIView bkui_animateWithDuration:animations:completion:](v12, v11, v17, v14);

}

void __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "coachingController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "restartEnroll");

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BKUIPearlEnrollController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
  }
  v9 = objc_msgSend(v8, "preferredStatusBarStyle");

  return v9;
}

- (BOOL)inBuddy
{
  void *v2;
  char v3;

  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inBuddy");

  return v3;
}

- (void)setInBuddy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInBuddy:", v3);

  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInBuddy:", v3);

}

- (void)setInSheet:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_inSheet = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInSheet:", v3);

  -[BKUIPearlEnrollController coachingController](self, "coachingController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInSheet:", v3);

}

- (void)setExistingIdentity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExistingIdentity:", v4);

}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomInstructionString:forState:", v6, v4);

}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomDetailString:forState:", v6, v4);

}

- (void)primeWithPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primeWithPasscode:", v4);

}

- (void)primeWithExternalizedAuthContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollController enrollViewController](self, "enrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primeWithExternalizedAuthContext:", v4);

}

- (void)pearlEnrollViewController:(id)a3 finishedEnrollWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[BKUIPearlEnrollController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pearlEnrollController:finishedEnrollWithError:", self, v5);

}

- (void)pearlEnrollControllerCompleted:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BKUIPearlEnrollController_pearlEnrollControllerCompleted___block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__BKUIPearlEnrollController_pearlEnrollControllerCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navbarCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setHidesShadow:", 1);

  objc_msgSend(*(id *)(a1 + 32), "coachingController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

+ (BOOL)isPearlAvailable
{
  id BKDeviceClass;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  uint64_t v9;

  BKDeviceClass = getBKDeviceClass();
  objc_msgSend(getBKDeviceDescriptorClass(), "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(BKDeviceClass, "deviceWithDescriptor:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (BOOL)isPearlInterlocked
{
  id BKDeviceClass;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  BKDeviceClass = getBKDeviceClass();
  objc_msgSend(getBKDeviceDescriptorClass(), "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(BKDeviceClass, "deviceWithDescriptor:error:", v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v4)
  {
    v14 = 0;
    v13 = 0;
    v6 = objc_msgSend(v4, "bioLockoutState:forUser:error:", &v14, getuid(), &v13);
    v7 = v13;
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v4;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "Biolockout state for device: %@, state: %@, error: %@, success: %@", buf, 0x2Au);

    }
    v11 = v14 == 7;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)preloadWithCompletion:(id)a3
{
  +[BKUIPearlEnrollViewController preloadWithCompletion:](BKUIPearlEnrollViewController, "preloadWithCompletion:", a3);
}

- (void)dealloc
{
  BKUIPearlCoachingController *coachingController;
  BKUIPearlEnrollViewController *enrollViewController;
  objc_super v5;

  coachingController = self->_coachingController;
  self->_coachingController = 0;

  enrollViewController = self->_enrollViewController;
  self->_enrollViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController dealloc](&v5, sel_dealloc);
}

- (BKUIPearlEnrollControllerDelegate)delegate
{
  return (BKUIPearlEnrollControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (BKIdentity)existingIdentity
{
  return self->_existingIdentity;
}

- (BKUIPearlEnrollViewController)enrollViewController
{
  return self->_enrollViewController;
}

- (void)setEnrollViewController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollViewController, a3);
}

- (BKUIPearlCoachingController)coachingController
{
  return self->_coachingController;
}

- (void)setCoachingController:(id)a3
{
  objc_storeStrong((id *)&self->_coachingController, a3);
}

- (BOOL)hasBeenPortrait
{
  return self->_hasBeenPortrait;
}

- (void)setHasBeenPortrait:(BOOL)a3
{
  self->_hasBeenPortrait = a3;
}

- (NSObject)rotationChangeToken
{
  return self->_rotationChangeToken;
}

- (void)setRotationChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_rotationChangeToken, a3);
}

- (NSObject)rotationLockToken
{
  return self->_rotationLockToken;
}

- (void)setRotationLockToken:(id)a3
{
  objc_storeStrong((id *)&self->_rotationLockToken, a3);
}

- (UINavigationBar)navbarCopy
{
  return self->_navbarCopy;
}

- (BKUIOrientationStateHandler)orientationStateHandler
{
  return self->_orientationStateHandler;
}

- (void)setOrientationStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_orientationStateHandler, a3);
}

- (BKUIPearlEnrollControllerPreloadedState)preloadState
{
  return self->_preloadState;
}

- (void)setPreloadState:(id)a3
{
  objc_storeStrong((id *)&self->_preloadState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadState, 0);
  objc_storeStrong((id *)&self->_orientationStateHandler, 0);
  objc_storeStrong((id *)&self->_navbarCopy, 0);
  objc_storeStrong((id *)&self->_rotationLockToken, 0);
  objc_storeStrong((id *)&self->_rotationChangeToken, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_enrollViewController, 0);
  objc_storeStrong((id *)&self->_existingIdentity, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
