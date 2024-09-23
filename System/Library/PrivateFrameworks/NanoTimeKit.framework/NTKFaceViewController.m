@implementation NTKFaceViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && NTKConfigureFaceDefaultsChangedNotification_onceToken != -1)
    dispatch_once(&NTKConfigureFaceDefaultsChangedNotification_onceToken, &__block_literal_global_19);
}

- (NTKFaceViewController)initWithFace:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  NTKFaceViewController *v9;
  NTKFaceViewController *v10;
  id *p_face;
  NSMutableDictionary *v12;
  NSMutableDictionary *normalComplicationControllers;
  NSMutableDictionary *v14;
  NSMutableDictionary *detachedComplicationControllers;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  CGPoint v23;
  CGSize v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKFaceViewController;
  v9 = -[NTKFaceViewController init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    p_face = (id *)&v9->_face;
    objc_storeStrong((id *)&v9->_face, a3);
    objc_msgSend(*p_face, "addObserver:", v10);
    objc_msgSend(*p_face, "performComplicationTypeMigration");
    v10->_normalComplicationControllersLock._os_unfair_lock_opaque = 0;
    v10->_detachedComplicationControllersLock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    normalComplicationControllers = v10->_normalComplicationControllers;
    v10->_normalComplicationControllers = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detachedComplicationControllers = v10->_detachedComplicationControllers;
    v10->_detachedComplicationControllers = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel__handleDeviceLockChange, *MEMORY[0x1E0C93EE0], 0);

    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSensitiveUIObserver:", v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v10, sel__faceSnapshotDidChange_, CFSTR("NTKFaceSnapshotChangedNotification"), 0);

    objc_msgSend(v7, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_deviceLocked = objc_msgSend(v19, "isLocked");

    v23 = (CGPoint)*MEMORY[0x1E0C9D628];
    v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v10->_faceLaunchRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v10->_faceLaunchRect.size = v24;
    v20 = (id)-[NTKFaceViewController view](v10, "view");
    -[NTKFaceViewController setDefinesPresentationContext:](v10, "setDefinesPresentationContext:", 1);
    v10->_dataMode = 1;
    -[NTKFaceViewController configureWithDuration:block:](v10, "configureWithDuration:block:", v8, 0.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel__faceColorEditOptionsChanged, CFSTR("NTKColorEditOptionsChangedNotificationName"), *p_face);

    v10->_editingFromFaceContainerFrame.origin = v23;
    v10->_editingFromFaceContainerFrame.size = v24;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  objc_super v8;

  -[NTKFace removeObserver:](self->_face, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93EE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("NTKFaceSnapshotChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("NTKColorEditOptionsChangedNotificationName"), self->_face);

  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_16);
  -[NTKFaceViewController removeStatusBarViewController](self, "removeStatusBarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
    objc_msgSend(WeakRetained, "makeStatusBarViewControllerAvailableForReuse:", v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewController;
  -[NTKFaceViewController dealloc](&v8, sel_dealloc);
}

uint64_t __32__NTKFaceViewController_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return objc_msgSend(a3, "removeDisplayWrapper:", a4);
}

- (void)loadView
{
  NTKFaceView *v3;
  NTKFaceView *faceView;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  v3 = +[NTKFaceView newFaceViewForFace:](NTKFaceView, "newFaceViewForFace:", self->_face);
  faceView = self->_faceView;
  self->_faceView = v3;

  -[NTKFaceView setDelegate:](self->_faceView, "setDelegate:", self);
  -[NTKFaceViewController _setFaceViewResourceDirectoryFromFace](self, "_setFaceViewResourceDirectoryFromFace");
  -[NTKFaceView populateFaceViewEditOptionsFromFace:](self->_faceView, "populateFaceViewEditOptionsFromFace:", self->_face);
  -[NTKFaceViewController _loadInitialComplicationVisibilityFromFace](self, "_loadInitialComplicationVisibilityFromFace");
  if (-[NTKFaceViewController _shouldHideFaceUI](self, "_shouldHideFaceUI"))
  {
    objc_msgSend(v6, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  }
  -[NTKFaceView bounds](self->_faceView, "bounds");
  objc_msgSend(v6, "setBounds:");
  objc_msgSend(v6, "addSubview:", self->_faceView);
  -[NTKFaceViewController setView:](self, "setView:", v6);

}

- (id)tritium_complicationControllerForSlot:(id)a3
{
  id v4;

  v4 = 0;
  -[NTKFaceViewController getComplicationController:andDisplay:forSlot:](self, "getComplicationController:andDisplay:forSlot:", &v4, 0, a3);
  return v4;
}

- (BOOL)_shouldHideFaceUI
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend((id)objc_opt_class(), "uiSensitivity");
  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldHideForSensitivity:", v2);

  return v2;
}

- (void)setStatusBarViewController:(id)a3
{
  NTKClockStatusBarViewController *v5;
  NTKClockStatusBarViewController **p_statusBarViewController;
  NTKClockStatusBarViewController *statusBarViewController;
  void *v8;
  NTKClockStatusBarViewController *v9;
  NTKClockStatusBarViewController *v10;
  NTKClockStatusBarViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  NTKClockStatusBarViewController *v15;

  v5 = (NTKClockStatusBarViewController *)a3;
  p_statusBarViewController = &self->_statusBarViewController;
  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController != v5)
  {
    v15 = v5;
    -[NTKClockStatusBarViewController willMoveToParentViewController:](statusBarViewController, "willMoveToParentViewController:", 0);
    -[NTKClockStatusBarViewController view](*p_statusBarViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[NTKClockStatusBarViewController removeFromParentViewController](*p_statusBarViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_statusBarViewController, a3);
    v9 = *p_statusBarViewController;
    -[NTKFaceView horizontalPaddingForStatusBar](self->_faceView, "horizontalPaddingForStatusBar");
    -[NTKClockStatusBarViewController setHorizontalPadding:](v9, "setHorizontalPadding:");
    v10 = *p_statusBarViewController;
    -[NTKFaceView verticalPaddingForStatusBar](self->_faceView, "verticalPaddingForStatusBar");
    -[NTKClockStatusBarViewController setVerticalPadding:](v10, "setVerticalPadding:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = *p_statusBarViewController;
      -[NTKFaceView overrideColorForStatusBar](self->_faceView, "overrideColorForStatusBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKClockStatusBarViewController setOverrideColor:](v11, "setOverrideColor:", v12);

    }
    -[NTKFaceViewController _handleStatusBarChange](self, "_handleStatusBarChange");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NTKClockStatusBarViewController setWantsIconShadow:](*p_statusBarViewController, "setWantsIconShadow:", -[NTKFaceView wantsStatusBarIconShadow](self->_faceView, "wantsStatusBarIconShadow"));
    -[NTKFaceViewController addChildViewController:](self, "addChildViewController:", *p_statusBarViewController);
    -[NTKFaceViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKClockStatusBarViewController view](*p_statusBarViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    -[NTKClockStatusBarViewController didMoveToParentViewController:](*p_statusBarViewController, "didMoveToParentViewController:", self);
    v5 = v15;
  }

}

- (id)removeStatusBarViewController
{
  NTKClockStatusBarViewController *statusBarViewController;
  void *v4;
  NTKClockStatusBarViewController *v5;
  NTKClockStatusBarViewController *v6;

  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController)
  {
    -[NTKClockStatusBarViewController willMoveToParentViewController:](statusBarViewController, "willMoveToParentViewController:", 0);
    -[NTKClockStatusBarViewController view](self->_statusBarViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[NTKClockStatusBarViewController removeFromParentViewController](self->_statusBarViewController, "removeFromParentViewController");
    v5 = self->_statusBarViewController;
    v6 = self->_statusBarViewController;
    self->_statusBarViewController = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)freeze
{
  NTKDelayedBlock *delayedFreezeBlock;

  -[NTKDelayedBlock cancel](self->_delayedFreezeBlock, "cancel");
  delayedFreezeBlock = self->_delayedFreezeBlock;
  self->_delayedFreezeBlock = 0;

  -[NTKFaceViewController _ensureNotLive](self, "_ensureNotLive");
  self->_frozen = 1;
  -[NTKFaceView setFrozen:](self->_faceView, "setFrozen:", 1);
}

- (void)freezeAfterDelay:(double)a3
{
  NTKDelayedBlock *delayedFreezeBlock;
  NTKDelayedBlock *v6;
  NTKDelayedBlock *v7;
  NTKDelayedBlock *v8;
  _QWORD v9[5];

  delayedFreezeBlock = self->_delayedFreezeBlock;
  if (delayedFreezeBlock)
  {
    -[NTKDelayedBlock resetWithDelay:](delayedFreezeBlock, "resetWithDelay:", a3);
  }
  else
  {
    v6 = [NTKDelayedBlock alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__NTKFaceViewController_freezeAfterDelay___block_invoke;
    v9[3] = &unk_1E6BCF2E0;
    v9[4] = self;
    v7 = -[NTKDelayedBlock initWithDelay:action:](v6, "initWithDelay:action:", v9, a3);
    v8 = self->_delayedFreezeBlock;
    self->_delayedFreezeBlock = v7;

  }
}

uint64_t __42__NTKFaceViewController_freezeAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "freeze");
}

- (void)unfreeze
{
  NTKDelayedBlock *delayedFreezeBlock;

  -[NTKDelayedBlock cancel](self->_delayedFreezeBlock, "cancel");
  delayedFreezeBlock = self->_delayedFreezeBlock;
  self->_delayedFreezeBlock = 0;

  self->_frozen = 0;
  -[NTKFaceView setFrozen:](self->_faceView, "setFrozen:", 0);
  if (self->_becomeLiveOnUnfreeze)
    -[NTKFaceViewController setDataMode:](self, "setDataMode:", 1);
}

- (void)prepareForOrb
{
  -[NTKFaceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[NTKFaceView prepareForOrb](self->_faceView, "prepareForOrb");
}

- (void)cleanupAfterOrb:(BOOL)a3
{
  -[NTKFaceView cleanupAfterOrb:](self->_faceView, "cleanupAfterOrb:", a3);
}

- (void)enableSlowMode
{
  -[NTKFaceView setSlow:](self->_faceView, "setSlow:", 1);
}

- (void)disableSlowMode
{
  -[NTKFaceView setSlow:](self->_faceView, "setSlow:", 0);
}

- (void)setShowsLockedUI:(BOOL)a3
{
  if (self->_showsLockedUI != a3)
  {
    self->_showsLockedUI = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)_handleDeviceLockChange
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  _BOOL4 deviceLocked;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NTKFace device](self->_face, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKFace device](self->_face, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLocked");
    deviceLocked = self->_deviceLocked;
    v9[0] = 67109376;
    v9[1] = v7;
    v10 = 1024;
    v11 = deviceLocked;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "FaceViewController received CLKDeviceLockStateChangedNotification locked?%i _deviceLocked?%i", (uint8_t *)v9, 0xEu);

  }
  if (self->_deviceLocked != v4)
  {
    self->_deviceLocked = v4;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)sensitiveUIStateChanged
{
  -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
}

- (void)_faceSnapshotDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewController face](self, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dailySnapshotKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) != 0
    || objc_msgSend(v5, "wantsUnadornedSnapshot")
    && (objc_msgSend(v5, "unadornedSnapshotKey"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v4, "isEqual:", v8),
        v8,
        v9))
  {
    -[NTKFaceViewController faceView](self, "faceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "editing");

    if ((v11 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "FVC reloading snapshot for face %@", (uint8_t *)&v13, 0xCu);
      }

      -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
    }
  }

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NTKFaceView *faceView;
  NTKClockStatusBarViewController *statusBarViewController;
  void *v13;
  NTKFaceEditView *editView;
  void *v15;
  void *v16;

  -[NTKFaceViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKFaceView setBounds:](self->_faceView, "setBounds:");
  if (!-[NTKFaceView zooming](self->_faceView, "zooming"))
  {
    faceView = self->_faceView;
    MEMORY[0x1BCCA72B8](v4, v6, v8, v10);
    -[NTKFaceView setCenter:](faceView, "setCenter:");
  }
  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController)
  {
    -[NTKClockStatusBarViewController view](statusBarViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
    objc_msgSend(v16, "bringSubviewToFront:", v13);

  }
  editView = self->_editView;
  v15 = v16;
  if (editView)
  {
    -[NTKFaceEditView setFrame:](editView, "setFrame:", v4, v6, v8, v10);
    objc_msgSend(v16, "bringSubviewToFront:", self->_editView);
    v15 = v16;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKFaceViewController;
  -[NTKFaceViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[NTKFaceView setNeedsLayout](self->_faceView, "setNeedsLayout");
  -[NTKFaceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_31);
}

uint64_t __50__NTKFaceViewController_traitCollectionDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setNeedsLayout");
}

- (id)blurSourceImage
{
  return -[NTKFaceView blurSourceImage](self->_faceView, "blurSourceImage");
}

- (void)prepareForSnapshotting
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[NTKFaceView _prepareForSnapshotting](self->_faceView, "_prepareForSnapshotting");
}

- (void)finalizeForSnapshotting:(id)a3
{
  id v4;
  NTKFaceView *v5;
  NTKFaceView *v6;
  void (**v7)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  NTKFaceView *v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  void *v17;
  _QWORD block[4];
  id v19;

  v4 = a3;
  v5 = self->_faceView;
  v6 = v5;
  if (v5)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__3;
    v16[4] = __Block_byref_object_dispose__3;
    v17 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_34;
    v12[3] = &unk_1E6BCF328;
    v13 = v5;
    v15 = v16;
    v14 = v4;
    v7 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
    v7[2](v7, v8, v9, v10);

    _Block_object_dispose(v16, 8);
    v11 = v17;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v19 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v11 = v19;
  }

}

void __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.faceSnapshotRenderer"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_34(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  __int128 v6;
  _QWORD v7[4];
  dispatch_group_t v8;
  __int128 v9;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "renderSynchronouslyWithImageQueueDiscard:inGroup:", 1, v2);
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_2;
  v7[3] = &unk_1E6BCF328;
  v8 = v2;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v9 = v6;
  v5 = v2;
  objc_msgSend(v3, "_finalizeForSnapshotting:", v7);

}

uint64_t __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  v3 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v2, v3))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.faceSnapshotRenderer"), 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)performPrewarmRoutine:(id)a3
{
  -[NTKFaceView _performPrewarmRoutine:](self->_faceView, "_performPrewarmRoutine:", a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewController;
  -[NTKFaceViewController description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace description](self->_face, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)getComplicationController:(id *)a3 andDisplay:(id *)a4 forSlot:(id)a5
{
  id v8;

  v8 = a5;
  if (a3)
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    -[NSMutableDictionary objectForKey:](self->_normalComplicationControllers, "objectForKey:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  }
  if (a4)
  {
    -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self->_faceView, "normalComplicationDisplayWrapperForSlot:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (void)enumerateComplicationControllersAndDisplaysWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  v9 = (id)-[NSMutableDictionary copy](self->_normalComplicationControllers, "copy");
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke;
  v12[3] = &unk_1E6BCF350;
  v6 = v4;
  v12[4] = self;
  v13 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  v7 = (void *)-[NSMutableDictionary copy](self->_detachedComplicationControllers, "copy");
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke_2;
  v10[3] = &unk_1E6BCF350;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "normalComplicationDisplayWrapperForSlot:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v6, v8);

}

void __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "detachedComplicationDisplayWrapperForSlot:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v6, v8);

}

- (void)configureWithDuration:(double)a3 block:(id)a4
{
  self->_readyToApplyConfiguration = 0;
  if (a4)
    (*((void (**)(id, NTKFaceViewController *))a4 + 2))(a4, self);
  self->_readyToApplyConfiguration = 1;
  -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", a3);
}

- (void)setShouldShowSnapshot:(BOOL)a3
{
  if (self->_shouldShowSnapshot != a3)
  {
    self->_shouldShowSnapshot = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)setSupressesNonSnapshotUI:(BOOL)a3
{
  if (self->_supressesNonSnapshotUI != a3)
  {
    self->_supressesNonSnapshotUI = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)setShowsCanonicalContent:(BOOL)a3
{
  if (self->_showsCanonicalContent != a3)
  {
    self->_showsCanonicalContent = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)setShowContentForUnadornedSnapshot:(BOOL)a3
{
  if (self->_showContentForUnadornedSnapshot != a3)
  {
    self->_showContentForUnadornedSnapshot = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)setIgnoreSnapshotImages:(BOOL)a3
{
  if (self->_ignoreSnapshotImages != a3)
  {
    self->_ignoreSnapshotImages = a3;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)setDataMode:(int64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (a3 == 1 && self->_frozen)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Frozen NTKFaceViewController can't show live data. View will become live without animation after unfreeze.", v5, 2u);
    }

    self->_becomeLiveOnUnfreeze = 1;
  }
  else
  {
    -[NTKFaceViewController _setDataMode:becomeLiveOnUnfreeze:](self, "_setDataMode:becomeLiveOnUnfreeze:");
  }
}

- (void)setPauseDate:(id)a3
{
  objc_storeStrong((id *)&self->_pauseDate, a3);
  if (self->_dataMode == 2)
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
}

- (void)_ensureNotLive
{
  if (self->_dataMode == 1)
  {
    -[NTKFaceViewController _ensurePauseDate](self, "_ensurePauseDate");
    -[NTKFaceViewController _setDataMode:becomeLiveOnUnfreeze:](self, "_setDataMode:becomeLiveOnUnfreeze:", 2, 1);
  }
}

- (void)_ensurePauseDate
{
  NSDate *v3;
  NSDate *pauseDate;

  if (!self->_pauseDate)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "now");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pauseDate = self->_pauseDate;
    self->_pauseDate = v3;

  }
}

- (id)_overrideDateForWake:(BOOL)a3
{
  void *v5;
  int64_t dataMode;
  NSDate *v7;
  NSDate *v8;
  void *v9;
  uint64_t v10;

  NTKNilOrDateOverrideInDemoMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dataMode = self->_dataMode;
  if (dataMode == 3)
  {
    NTKIdealizedDate();
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (dataMode == 2 && !a3)
  {
    -[NTKFaceViewController _ensurePauseDate](self, "_ensurePauseDate");
    v7 = self->_pauseDate;
LABEL_6:
    v8 = v7;

    v5 = v8;
  }
  CLKForcedTime();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    NTKIdealizedDate();
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return v5;
}

- (void)_setDataMode:(int64_t)a3 becomeLiveOnUnfreeze:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  BOOL v9;
  NTKFace *face;
  int v11;
  int64_t v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  NTKFace *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    face = self->_face;
    v11 = 134218498;
    v12 = a3;
    v13 = 1024;
    v14 = v4;
    v15 = 2112;
    v16 = face;
    _os_log_debug_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEBUG, "Set Data Mode: %ld, become live: %d, %@", (uint8_t *)&v11, 0x1Cu);
  }

  self->_becomeLiveOnUnfreeze = v4;
  if (self->_dataMode != a3)
  {
    self->_dataMode = a3;
    v9 = a3 != 3 || self->_hasGoneLive;
    self->_hasGoneLive = v9;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
    if (self->_dataMode == 1)
      -[NTKFaceView setNeedsRender](self->_faceView, "setNeedsRender");
  }
}

- (void)_applyConfigurationWithDuration:(double)a3
{
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  _BOOL8 hasGoneLive;
  NTKFaceView *faceView;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v21;
  NTKFaceView *v22;
  _BOOL4 v23;
  _BOOL8 hasRemovedUnadornedSnapshot;
  _BOOL8 wantsRemoveUnadorned;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  NTKFaceView *v41;
  void *v42;
  uint64_t v43;
  _BOOL8 v44;
  void *v45;
  NTKFace *face;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  uint64_t v60;
  id v61;
  void *v62;
  void (**v63)(void);
  void (**v64)(void);
  _QWORD v65[5];
  BOOL v66;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  BOOL v79;
  _QWORD v80[7];
  _QWORD aBlock[7];
  _QWORD v82[5];
  id v83;
  _QWORD v84[3];
  char v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[3];
  char v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  unint64_t v93;
  __int16 v94;
  NTKFaceView *v95;
  __int16 v96;
  _BOOL8 v97;
  __int16 v98;
  _BOOL8 v99;
  __int16 v100;
  _BOOL8 v101;
  __int16 v102;
  _BOOL8 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (!self->_readyToApplyConfiguration)
    return;
  kdebug_trace();
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v89 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__3;
  v86[4] = __Block_byref_object_dispose__3;
  v87 = 0;
  v83 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__3;
  v82[4] = __Block_byref_object_dispose__3;
  if (self->_ignoreSnapshotImages)
  {
    v63 = (void (**)(void))&__block_literal_global_44;
    v64 = (void (**)(void))&__block_literal_global_43;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3;
    aBlock[3] = &unk_1E6BCF3D8;
    aBlock[5] = v86;
    aBlock[6] = v88;
    aBlock[4] = self;
    v64 = (void (**)(void))_Block_copy(aBlock);
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4;
    v80[3] = &unk_1E6BCF3D8;
    v80[5] = v82;
    v80[6] = v84;
    v80[4] = self;
    v63 = (void (**)(void))_Block_copy(v80);
  }
  if (self->_hasGoneLive)
  {
    v5 = 0;
  }
  else
  {
    v64[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    hasGoneLive = self->_hasGoneLive;
    *(_DWORD *)buf = 134218240;
    v93 = v5;
    v94 = 2048;
    v95 = (NTKFaceView *)hasGoneLive;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Applying usingSwitcherSnapshot:%lu _hasGoneLive:%lu", buf, 0x16u);
  }

  faceView = self->_faceView;
  if (v5)
  {
    -[NTKFaceView switcherSnapshotView](faceView, "switcherSnapshotView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      if (NTKDebugShowVisualIndicatorOnSnapshot())
      {
        objc_msgSend(v12, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBorderWidth:", 3.0);

        objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "CGColor");
        objc_msgSend(v12, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBorderColor:", v15);

      }
      -[NTKFaceView setSwitcherSnapshotView:](self->_faceView, "setSwitcherSnapshotView:", v12);

    }
    -[NTKFaceView switcherSnapshotView](self->_faceView, "switcherSnapshotView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v18);

    v19 = 0;
  }
  else
  {
    -[NTKFaceView setSwitcherSnapshotView:](faceView, "setSwitcherSnapshotView:", 0);
    if (!-[NTKFaceView supportsUnadornedSnapshot](self->_faceView, "supportsUnadornedSnapshot")
      || self->_hasRemovedUnadornedSnapshot
      || self->_wantsRemoveUnadorned)
    {
      v19 = 0;
      goto LABEL_21;
    }
    v63[2]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17 != 0;
  }

LABEL_21:
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (id)objc_opt_class();
    v22 = self->_faceView;
    v23 = -[NTKFaceView supportsUnadornedSnapshot](v22, "supportsUnadornedSnapshot");
    hasRemovedUnadornedSnapshot = self->_hasRemovedUnadornedSnapshot;
    wantsRemoveUnadorned = self->_wantsRemoveUnadorned;
    *(_DWORD *)buf = 138413570;
    v93 = (unint64_t)v21;
    v94 = 2048;
    v95 = v22;
    v96 = 2048;
    v97 = v5;
    v98 = 2048;
    v99 = v23;
    v100 = 2048;
    v101 = hasRemovedUnadornedSnapshot;
    v102 = 2048;
    v103 = wantsRemoveUnadorned;
    _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "[%@-%p] Applying usingSwitcherSnapshot:%lu supportsUnadornedSnapshot:%lu _hasRemovedUnadornedSnapshot:%lu _wantsRemoveUnadorned:%lu", buf, 0x3Eu);

  }
  if (v19)
  {
    if (!self->_hasUsedUnadornedSnapshot)
    {
      -[NTKFaceView unadornedSnapshotView](self->_faceView, "unadornedSnapshotView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        v28 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        if (NTKDebugShowVisualIndicatorOnSnapshot())
        {
          objc_msgSend(v28, "layer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setBorderWidth:", 3.0);

          objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v31 = objc_msgSend(v30, "CGColor");
          objc_msgSend(v28, "layer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setBorderColor:", v31);

        }
        -[NTKFaceView setUnadornedSnapshotView:](self->_faceView, "setUnadornedSnapshotView:", v28);
        -[NTKFaceView addSubview:](self->_faceView, "addSubview:", v28);
        -[NTKFaceView sendSubviewToBack:](self->_faceView, "sendSubviewToBack:", v28);
        self->_hasUsedUnadornedSnapshot = 1;

      }
    }
    -[NTKFaceView unadornedSnapshotView](self->_faceView, "unadornedSnapshotView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2]();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v34);

  }
  else
  {
    v35 = self->_hasUsedUnadornedSnapshot && !self->_hasRemovedUnadornedSnapshot;
    v36 = self->_wantsRemoveUnadorned;
    if (-[NTKFaceView supportsUnadornedSnapshot](self->_faceView, "supportsUnadornedSnapshot"))
    {
      v63[2]();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 != 0;

    }
    else
    {
      v38 = 0;
    }
    if (v35 || v36 || !v5 && !v38)
    {
      -[NTKFaceView unadornedSnapshotView](self->_faceView, "unadornedSnapshotView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeFromSuperview");

      -[NTKFaceView setUnadornedSnapshotView:](self->_faceView, "setUnadornedSnapshotView:", 0);
      -[NTKFaceView loadContentToReplaceUnadornedSnapshot](self->_faceView, "loadContentToReplaceUnadornedSnapshot");
      -[NTKFaceView handleUnadornedSnapshotRemoved](self->_faceView, "handleUnadornedSnapshotRemoved");
      self->_hasRemovedUnadornedSnapshot = 1;
      self->_wantsRemoveUnadorned = 0;
    }
  }
  if (self->_supressesNonSnapshotUI)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v40, OS_LOG_TYPE_DEFAULT, "Applying _supressesNonSnapshotUI", buf, 2u);
    }

    -[NTKFaceView loadContentToReplaceUnadornedSnapshot](self->_faceView, "loadContentToReplaceUnadornedSnapshot");
  }
  -[NTKFaceView setShowContentForUnadornedSnapshot:](self->_faceView, "setShowContentForUnadornedSnapshot:", self->_showContentForUnadornedSnapshot);
  -[NTKFaceView setShouldShowUnsnapshotableContent:](self->_faceView, "setShouldShowUnsnapshotableContent:", !v5);
  if (!v5 && NTKSnapshotSwitchingEnabled() && -[NTKFaceView dataMode](self->_faceView, "dataMode") == 3)
  {
    v41 = self->_faceView;
    NTKIdealizedDate();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView setOverrideDate:duration:](v41, "setOverrideDate:duration:", v42, 0.0);

  }
  -[NTKFaceView setDataMode:](self->_faceView, "setDataMode:", self->_dataMode);
  -[NTKFaceView setShowsCanonicalContent:](self->_faceView, "setShowsCanonicalContent:", self->_showsCanonicalContent);
  if (self->_dataMode == 3)
    -[NTKClockStatusBarViewController hideAnimated:](self->_statusBarViewController, "hideAnimated:", 0);
  -[NTKFaceViewController _overrideDateForWake:](self, "_overrideDateForWake:", 0);
  v43 = objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setOverrideDate:duration:](self->_faceView, "setOverrideDate:duration:", v43, a3);
  v62 = (void *)v43;
  v44 = self->_showsLockedUI || self->_deviceLocked;
  -[NTKFaceView setShowsLockedUI:](self->_faceView, "setShowsLockedUI:", v44);
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_46;
  v78[3] = &unk_1E6BCF400;
  v78[4] = self;
  v79 = v5;
  v45 = _Block_copy(v78);
  face = self->_face;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2_48;
  v76[3] = &unk_1E6BCF428;
  v76[4] = self;
  v61 = v45;
  v77 = v61;
  -[NTKFace enumerateComplicationSlotsWithBlock:](face, "enumerateComplicationSlotsWithBlock:", v76);
  -[NTKFaceView _detachedComplicationDisplays](self->_faceView, "_detachedComplicationDisplays");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_opt_new();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v49 = v47;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v73 != v51)
          objc_enumerationMutation(v49);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v53);

      }
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
    }
    while (v50);
  }

  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  -[NSMutableDictionary allKeys](self->_detachedComplicationControllers, "allKeys");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v54, "copy");

  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  v71 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  v56 = v55;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v69 != v58)
          objc_enumerationMutation(v56);
        v60 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
        if ((objc_msgSend(v48, "containsObject:", v60) & 1) == 0)
          -[NTKFaceViewController _removeDetachedComplicationForSlot:andDisconnectDisplay:](self, "_removeDetachedComplicationForSlot:andDisconnectDisplay:", v60, 1);
      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
    }
    while (v57);
  }

  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3_51;
  v67[3] = &unk_1E6BCF450;
  v67[4] = self;
  objc_msgSend(v49, "enumerateObjectsUsingBlock:", v67);
  kdebug_trace();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4_53;
  v65[3] = &unk_1E6BCF4A0;
  v65[4] = self;
  v66 = v44;
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v65);
  -[NTKFaceViewController _updateInteractivityOfComplicationDisplays](self, "_updateInteractivityOfComplicationDisplays");
  -[NTKFaceViewController _updateWidgetVisibilityOfComplicationDisplays](self, "_updateWidgetVisibilityOfComplicationDisplays");
  kdebug_trace();
  -[NTKFaceView setNeedsLayout](self->_faceView, "setNeedsLayout");
  kdebug_trace();

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(v88, 8);
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke()
{
  return 0;
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2()
{
  return 0;
}

id __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v3 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_dailySnapshot");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v3 + 24) = 1;
    v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v1;
}

id __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v3 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_unadornedSnapshot");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v3 + 24) = 1;
    v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v1;
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  int v11;
  int v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 1225) || *(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(v7 + 1228) || (objc_msgSend(*(id *)(v7 + 1288), "complicationIsHiddenAtSlot:", v6) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "dailySnapshotShowsComplication:forSlot:", v5, v6);
      v11 = v10 ^ 1;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1225))
        v12 = v10;
      else
        v12 = 1;
      if (!*(_BYTE *)(a1 + 40))
        v11 = 1;
      v8 = v12 & v11;
    }
  }
  else if (objc_msgSend(*(id *)(v7 + 1288), "complicationIsHiddenAtSlot:", v6))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "editing");
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2_48(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "_ensureComplication:forSlot:", v3, v4);
  else
    objc_msgSend(*(id *)(a1 + 32), "_removeComplicationForSlot:", v4);

}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3_51(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureDetachedComplication:", a2);
}

void __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4_53(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "setPauseDate:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_5;
  v9[3] = &unk_1E6BCF478;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "updatePropertiesForDisplayWrapper:withBlock:", v7, v9);

  objc_msgSend(v8, "setShowsLockedUI:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFaceDataMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256));
}

- (BOOL)dailySnapshotShowsComplication:(id)a3 forSlot:(id)a4
{
  return 1;
}

- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4
{
  -[NTKFaceViewController hideFaceEditingUIAnimated:destination:completion:](self, "hideFaceEditingUIAnimated:destination:completion:", a3, a4, 0);
}

- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(11, (uint64_t)"NTKLoggingDomainFaceLibraryViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109634;
    v10[1] = v6;
    v11 = 2048;
    v12 = a4;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "#events hideFaceEditingUIAnimated: %d, destination: %lu, for %@", (uint8_t *)v10, 0x1Cu);

  }
}

- (BOOL)canStopEditing
{
  return !-[NTKFaceEditView isTransitioningBetweenEditPages](self->_editView, "isTransitioningBetweenEditPages");
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v10;
  char v11;
  objc_super v12;

  -[NTKFaceViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[NTKFaceViewController faceView](self, "faceView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NTKFaceViewController presentedViewController](self, "presentedViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "presentedViewControllerShouldBecomeFirstResponder:", v5),
        v5,
        v4,
        v6))
  {
    -[NTKFaceViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canBecomeFirstResponder");

    return v8;
  }
  else
  {
    -[NTKFaceViewController faceView](self, "faceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canBecomeFirstResponder");

    if ((v11 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKFaceViewController;
      return -[NTKFaceViewController canBecomeFirstResponder](&v12, sel_canBecomeFirstResponder);
    }
  }
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v10;
  char v11;
  objc_super v12;

  -[NTKFaceViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[NTKFaceViewController faceView](self, "faceView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NTKFaceViewController presentedViewController](self, "presentedViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "presentedViewControllerShouldBecomeFirstResponder:", v5),
        v5,
        v4,
        v6))
  {
    -[NTKFaceViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "becomeFirstResponder");

    return v8;
  }
  else
  {
    -[NTKFaceViewController faceView](self, "faceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "becomeFirstResponder");

    if ((v11 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKFaceViewController;
      return -[NTKFaceViewController becomeFirstResponder](&v12, sel_becomeFirstResponder);
    }
  }
}

- (void)_loadInitialComplicationVisibilityFromFace
{
  void *v3;
  NTKFace *face;
  _QWORD v5[5];
  id v6;

  -[NTKFaceView _complicationSlotsHiddenByCurrentConfiguration](self->_faceView, "_complicationSlotsHiddenByCurrentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    face = self->_face;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__NTKFaceViewController__loadInitialComplicationVisibilityFromFace__block_invoke;
    v5[3] = &unk_1E6BCF4C8;
    v5[4] = self;
    v6 = v3;
    -[NTKFace enumerateComplicationSlotsWithBlock:](face, "enumerateComplicationSlotsWithBlock:", v5);

  }
}

void __67__NTKFaceViewController__loadInitialComplicationVisibilityFromFace__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v4 = a2;
  objc_msgSend(v3, "setComplicationHidden:atSlot:", objc_msgSend(v2, "containsObject:", v4), v4);

}

- (void)_setFaceViewResourceDirectoryFromFace
{
  NTKFaceView *faceView;
  id v3;

  faceView = self->_faceView;
  -[NTKFace resourceDirectory](self->_face, "resourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setResourceDirectory:](faceView, "setResourceDirectory:", v3);

}

- (BOOL)_isCollectionPickerViewEnabled
{
  return 1;
}

- (void)faceViewWantsStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  NTKClockStatusBarViewController *statusBarViewController;

  statusBarViewController = self->_statusBarViewController;
  if (a3)
    -[NTKClockStatusBarViewController hideAnimated:](statusBarViewController, "hideAnimated:", a4);
  else
    -[NTKClockStatusBarViewController showAnimated:](statusBarViewController, "showAnimated:", a4);
}

- (void)faceViewDidChangeWantsStatusBarIconShadow
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NTKClockStatusBarViewController setWantsIconShadow:](self->_statusBarViewController, "setWantsIconShadow:", -[NTKFaceView wantsStatusBarIconShadow](self->_faceView, "wantsStatusBarIconShadow"));
}

- (void)faceViewDidChangePaddingForStatusBar
{
  NTKClockStatusBarViewController *statusBarViewController;
  NTKClockStatusBarViewController *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    statusBarViewController = self->_statusBarViewController;
    -[NTKFaceView horizontalPaddingForStatusBar](self->_faceView, "horizontalPaddingForStatusBar");
    -[NTKClockStatusBarViewController setHorizontalPadding:](statusBarViewController, "setHorizontalPadding:");
    v4 = self->_statusBarViewController;
    -[NTKFaceView verticalPaddingForStatusBar](self->_faceView, "verticalPaddingForStatusBar");
    -[NTKClockStatusBarViewController setVerticalPadding:](v4, "setVerticalPadding:");
  }
}

- (void)faceViewDidChangeStatusBarOverrideColor:(BOOL)a3
{
  NTKClockStatusBarViewController *statusBarViewController;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    statusBarViewController = self->_statusBarViewController;
    -[NTKFaceView overrideColorForStatusBar](self->_faceView, "overrideColorForStatusBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKClockStatusBarViewController setOverrideColor:](statusBarViewController, "setOverrideColor:", v5);

  }
}

- (void)faceViewWantsComplicationKeylineFramesReloaded
{
  void *v3;
  void *v4;
  void *v5;
  NTKFace *face;
  id v7;
  _QWORD v8[4];
  id v9;
  NTKFaceViewController *v10;

  v3 = (void *)objc_opt_class();
  -[NTKFace device](self->_face, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixedComplicationSlotsForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  face = self->_face;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__NTKFaceViewController_faceViewWantsComplicationKeylineFramesReloaded__block_invoke;
  v8[3] = &unk_1E6BCF4C8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[NTKFace enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:](face, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v8);

}

void __71__NTKFaceViewController_faceViewWantsComplicationKeylineFramesReloaded__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    v3 = NTKFaceLibraryTabEditorEnabled();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 1000);
    objc_msgSend(*(id *)(v4 + 1288), "keylineFrameForComplicationSlot:selected:", v8, v3 ^ 1u);
    objc_msgSend(v5, "setSelectedKeylineFrame:forKey:editMode:", v8, 1);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1000);
    objc_msgSend(*(id *)(v6 + 1288), "keylineFrameForComplicationSlot:selected:", v8, 0);
    objc_msgSend(v7, "setDeselectedKeylineFrame:forKey:editMode:", v8, 1);
  }

}

- (void)faceViewWillEnterTimeTravel
{
  -[NTKFaceViewController faceViewWantsStatusBarHidden:animated:](self, "faceViewWantsStatusBarHidden:animated:", 1, 1);
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_62);
}

void __52__NTKFaceViewController_faceViewWillEnterTimeTravel__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1F8E08538) & 1) == 0)
    objc_msgSend(v5, "setDimmed:", 1);

}

- (void)faceViewDidScrubToDate:(id)a3 forced:(BOOL)a4
{
  id v6;
  void *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *time_travel_update_timer;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD handler[5];

  v6 = a3;
  NTKRoundDateDownToNearestMinute();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_storeStrong((id *)&self->_scrubDate, v7);
LABEL_3:
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke_2;
    v13[3] = &unk_1E6BCF510;
    v14 = v6;
    -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v13);

    goto LABEL_6;
  }
  if (!-[NSDate isEqualToDate:](self->_scrubDate, "isEqualToDate:", v7))
  {
    objc_storeStrong((id *)&self->_scrubDate, v7);
    if (!self->_time_travel_update_timer)
    {
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      time_travel_update_timer = self->_time_travel_update_timer;
      self->_time_travel_update_timer = v8;

      v10 = self->_time_travel_update_timer;
      v11 = dispatch_time(0, 32000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      v12 = self->_time_travel_update_timer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke;
      handler[3] = &unk_1E6BCD5F0;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume((dispatch_object_t)self->_time_travel_update_timer);
      goto LABEL_3;
    }
  }
LABEL_6:

}

void __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1096);
  *(_QWORD *)(v1 + 1096) = 0;

}

void __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F8E08538))
  {
    objc_msgSend(v7, "setTimeTravelDate:animated:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(v6, "setTimeTravelDate:animated:", *(_QWORD *)(a1 + 32), 0);
  }

}

- (void)faceViewWillExitTimeTravel
{
  void *v3;

  -[NTKFaceViewController faceView](self, "faceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewController faceViewWantsStatusBarHidden:animated:](self, "faceViewWantsStatusBarHidden:animated:", objc_msgSend(v3, "wantsStatusBarHidden"), 1);

  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_65);
}

void __51__NTKFaceViewController_faceViewWillExitTimeTravel__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1F8E08538) & 1) == 0)
    objc_msgSend(v5, "setDimmed:", 0);

}

- (void)faceViewDidReloadSnapshotContentViews
{
  -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
}

- (void)faceViewWantsUnadornedSnapshotViewRemoved
{
  if (!self->_hasRemovedUnadornedSnapshot)
  {
    self->_wantsRemoveUnadorned = 1;
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
  }
}

- (void)faceViewDidHideOrShowComplicationSlot
{
  -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
}

- (BOOL)faceViewComplicationIsEmptyForSlot:(id)a3
{
  void *v3;
  BOOL v4;

  -[NTKFace complicationForSlot:](self->_face, "complicationForSlot:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "complicationType") == 0;

  return v4;
}

- (void)faceViewUpdatedResourceDirectory:(id)a3 wantsToTransferOwnership:(BOOL)a4
{
  NTKFace *face;

  face = self->_face;
  if (a4)
    -[NTKFace setResourceDirectoryByTransferringOwnership:](face, "setResourceDirectoryByTransferringOwnership:", a3);
  else
    -[NTKFace setResourceDirectory:](face, "setResourceDirectory:", a3);
}

- (void)faceViewWantsToPresentViewController:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setModalPresentationStyle:", 6);
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller %@", (uint8_t *)&v6, 0xCu);
  }

  -[NTKFaceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (BOOL)faceView:(id)a3 wantsToDismissPresentedViewControllerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  -[NTKFaceViewController presentedViewController](self, "presentedViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[NTKFaceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, 0);
  return v6 != 0;
}

- (id)faceViewComplicationAppIdentifierForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NTKFace complicationForSlot:](self->_face, "complicationForSlot:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "complicationType"))
  {
    objc_msgSend(v3, "appIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)faceViewComplicationForSlot:(id)a3
{
  return -[NTKFace complicationForSlot:](self->_face, "complicationForSlot:", a3);
}

- (id)faceViewComplicationControllerForSlot:(id)a3
{
  id v4;

  v4 = 0;
  -[NTKFaceViewController getComplicationController:andDisplay:forSlot:](self, "getComplicationController:andDisplay:forSlot:", &v4, 0, a3);
  return v4;
}

- (id)faceViewComplicationSlots
{
  return -[NTKFace orderedComplicationSlots](self->_face, "orderedComplicationSlots");
}

- (id)faceViewEditOptionThatHidesAllComplications
{
  return -[NTKFace editOptionThatHidesAllComplications](self->_face, "editOptionThatHidesAllComplications");
}

- (id)faceViewEditOptionsThatHideEditModes
{
  return -[NTKFace editOptionsThatHideEditModes](self->_face, "editOptionsThatHideEditModes");
}

- (id)faceViewComplicationSlotsHiddenByEditOption:(id)a3
{
  return -[NTKFace complicationSlotsHiddenByEditOption:](self->_face, "complicationSlotsHiddenByEditOption:", a3);
}

- (id)faceViewAllVisibleComplicationsForCurrentConfiguration
{
  return -[NTKFace allVisibleComplicationsForCurrentConfiguration](self->_face, "allVisibleComplicationsForCurrentConfiguration");
}

- (id)faceViewWantsFaceColorPalette
{
  NTKFaceColorPalette *v2;
  void *v3;
  void *v4;
  NTKFaceColorPalette *v5;

  if (-[NTKFace supportsPigmentEditOption](self->_face, "supportsPigmentEditOption"))
  {
    v2 = [NTKFaceColorPalette alloc];
    objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NTKFaceColorPalette initWithDomainName:inBundle:](v2, "initWithDomainName:inBundle:", v3, v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)faceViewDidRequestCustomDataForKey:(id)a3
{
  return -[NTKFace customDataForKey:](self->_face, "customDataForKey:", a3);
}

- (void)faceViewDidUpdateCustomData:(id)a3 forKey:(id)a4
{
  -[NTKFace setCustomData:forKey:](self->_face, "setCustomData:forKey:", a3, a4);
}

- (id)faceAnalyticsIdentifier
{
  return -[NTKFace analyticsIdentifier](self->_face, "analyticsIdentifier");
}

- (id)PPTUniqueComplicationsToSlotForCurrentFace
{
  void *v3;
  void *v4;
  NTKFace *face;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  face = self->_face;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__NTKFaceViewController_PPTUniqueComplicationsToSlotForCurrentFace__block_invoke;
  v11[3] = &unk_1E6BCF558;
  v11[4] = self;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  -[NTKFace enumerateComplicationSlotsWithBlock:](face, "enumerateComplicationSlotsWithBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __67__NTKFaceViewController_PPTUniqueComplicationsToSlotForCurrentFace__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "allowedComplicationsForSlot:", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v13 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v13)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "preferredComplicationFamilyForComplication:withSlot:", v7, v3));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "complicationType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v8);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v9);
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v3, v7);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)PPTPrepareComplicationTest
{
  -[NTKFaceView removeFromSuperview](self->_faceView, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
}

- (void)PPTCreateComplication:(id)a3 forSlot:(id)a4 synchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int64_t v9;
  NTKComplicationController *v10;
  NTKComplicationController *pptComplicationController;
  NTKComplicationDisplayWrapperView *v12;
  NTKComplicationDisplayWrapperView *pptComplicationDisplay;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  -[NTKFace faceStyle](self->_face, "faceStyle");
  -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self->_face, "preferredComplicationFamilyForComplication:withSlot:", v15, v8);
  objc_msgSend(v15, "complicationType");
  kdebug_trace();
  v9 = -[NTKFaceViewController dataMode](self, "dataMode");
  if (v5)
    -[NTKFaceViewController setDataMode:](self, "setDataMode:", 3);
  objc_msgSend((id)objc_opt_class(), "_controllerForComplication:face:slot:", v15, self->_face, v8);
  v10 = (NTKComplicationController *)objc_claimAutoreleasedReturnValue();
  pptComplicationController = self->_pptComplicationController;
  self->_pptComplicationController = v10;

  v12 = -[NTKFaceViewController _newNormalDisplayForComplicationController:slot:](self, "_newNormalDisplayForComplicationController:slot:", self->_pptComplicationController, v8);
  pptComplicationDisplay = self->_pptComplicationDisplay;
  self->_pptComplicationDisplay = v12;

  -[NTKFaceViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_pptComplicationDisplay);

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  if (v5)
    -[NTKFaceViewController setDataMode:](self, "setDataMode:", v9);
  -[NTKFace faceStyle](self->_face, "faceStyle");
  -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self->_face, "preferredComplicationFamilyForComplication:withSlot:", v15, v8);
  objc_msgSend(v15, "complicationType");
  kdebug_trace();

}

- (void)PPTCleanupLastComplication
{
  NTKComplicationDisplayWrapperView *pptComplicationDisplay;
  NTKComplicationController *pptComplicationController;
  void *v5;
  id v6;

  -[NTKComplicationDisplayWrapperView removeFromSuperview](self->_pptComplicationDisplay, "removeFromSuperview");
  -[NTKComplicationController removeDisplayWrapper:](self->_pptComplicationController, "removeDisplayWrapper:", self->_pptComplicationDisplay);
  pptComplicationDisplay = self->_pptComplicationDisplay;
  self->_pptComplicationDisplay = 0;

  pptComplicationController = self->_pptComplicationController;
  self->_pptComplicationController = 0;

  -[NTKFaceViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_faceView);

  -[NTKFaceViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (id)PPTDescriptionForComplication:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(a3, "complicationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)faceConfigurationDidChange:(id)a3
{
  NTKFaceEditColorPickerConfiguration *colorPickerConfig;
  id v5;

  if (self->_face == a3)
  {
    colorPickerConfig = self->_colorPickerConfig;
    self->_colorPickerConfig = 0;
    v5 = a3;

    -[NTKFaceView populateFaceViewEditOptionsFromFace:](self->_faceView, "populateFaceViewEditOptionsFromFace:", v5);
    -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
    -[NTKFaceViewController _clearFaceLaunchRect](self, "_clearFaceLaunchRect");
    -[NTKFaceViewController _clearLastTappedComplication](self, "_clearLastTappedComplication");
  }
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  -[NTKFaceViewController _setFaceViewResourceDirectoryFromFace](self, "_setFaceViewResourceDirectoryFromFace", a3);
  -[NTKFaceViewController _applyConfigurationWithDuration:](self, "_applyConfigurationWithDuration:", 0.0);
}

- (void)prepareToZoomWithIconView:(id)a3 minDiameter:(double)a4 maxDiameter:(double)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  kdebug_trace();
  self->_zoomingMinDiameter = a4;
  self->_zoomingMaxDiameter = a5;
  -[NTKClockStatusBarViewController view](self->_statusBarViewController, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView center](self->_faceView, "center");
  objc_msgSend(v8, "convertPoint:toView:", v17);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v17, "bounds");
  v13 = v10 / CGRectGetWidth(v18);
  objc_msgSend(v17, "bounds");
  v14 = v12 / CGRectGetHeight(v19);
  objc_msgSend(v17, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAnchorPoint:", v13, v14);

  -[NTKFaceView prepareToZoom](self->_faceView, "prepareToZoom");
  -[NTKFaceViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[NTKFaceView layoutIfNeeded](self->_faceView, "layoutIfNeeded");
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_71);

}

uint64_t __75__NTKFaceViewController_prepareToZoomWithIconView_minDiameter_maxDiameter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFaceZooming:", 1);
}

- (void)setZoomFraction:(double)a3 iconDiameter:(double)a4
{
  double zoomingMaxDiameter;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  kdebug_trace();
  zoomingMaxDiameter = self->_zoomingMaxDiameter;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, a4 / zoomingMaxDiameter, a4 / zoomingMaxDiameter);
  v10 = v11;
  -[NTKFaceView setTransform:](self->_faceView, "setTransform:", &v10);
  v9 = v11;
  -[NTKClockStatusBarViewController view](self->_statusBarViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

  CLKInterpolateBetweenFloatsClipped();
  -[NTKFaceView setAlpha:](self->_faceView, "setAlpha:");
}

- (void)cleanupAfterZoom
{
  void *v3;
  void *v4;
  void *v5;
  NTKFaceView *faceView;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];
  _OWORD v13[2];
  __int128 v14;

  -[NTKClockStatusBarViewController view](self->_statusBarViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  -[NTKClockStatusBarViewController view](self->_statusBarViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v10 = v13[0];
  v13[1] = v11;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v9 = v14;
  objc_msgSend(v5, "setTransform:", v13);

  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", &__block_literal_global_72);
  -[NTKFaceView cleanupAfterZoom](self->_faceView, "cleanupAfterZoom");
  -[NTKFaceView setAlpha:](self->_faceView, "setAlpha:", 1.0);
  faceView = self->_faceView;
  v12[0] = v10;
  v12[1] = v11;
  v12[2] = v9;
  -[NTKFaceView setTransform:](faceView, "setTransform:", v12);
  -[NTKFaceViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[NTKFaceView setFrame:](self->_faceView, "setFrame:");

  -[NTKFaceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  kdebug_trace();
}

uint64_t __41__NTKFaceViewController_cleanupAfterZoom__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFaceZooming:", 0);
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4;
  void *editView;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  editView = self->_editView;
  if (editView)
    goto LABEL_7;
  if (!NTKStarbearEnabled()
    || -[NTKFaceView dataMode](self->_faceView, "dataMode") != 3
    && (-[NTKFaceViewController presentedViewController](self, "presentedViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    editView = self->_faceView;
LABEL_7:
    v8 = editView;
    v7 = objc_msgSend(v8, "_wheelChangedWithEvent:", v4);

    goto LABEL_8;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  void *editView;
  id v7;
  char v8;

  editView = self->_editView;
  if (!editView)
    editView = self->_faceView;
  v7 = editView;
  v8 = objc_msgSend(v7, "_handlePhysicalButton:event:", a3, a4);

  return v8;
}

- (void)prepareWristRaiseAnimation
{
  -[NTKFaceView prepareWristRaiseAnimation](self->_faceView, "prepareWristRaiseAnimation");
}

- (void)performWristRaiseAnimation
{
  -[NTKFaceView performWristRaiseAnimation](self->_faceView, "performWristRaiseAnimation");
}

- (void)handleWristRaiseScreenWake
{
  id v3;

  -[NTKFaceViewController _showStatusBarAfterWake](self, "_showStatusBarAfterWake");
  -[NTKFaceViewController _overrideDateForWake:](self, "_overrideDateForWake:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setOverrideDate:duration:](self->_faceView, "setOverrideDate:duration:", v3, 0.0);
  -[NTKFaceView handleWristRaiseScreenWake](self->_faceView, "handleWristRaiseScreenWake");

}

- (void)handleOrdinaryScreenWake
{
  id v3;

  -[NTKFaceViewController _showStatusBarAfterWake](self, "_showStatusBarAfterWake");
  -[NTKFaceViewController _overrideDateForWake:](self, "_overrideDateForWake:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setOverrideDate:duration:](self->_faceView, "setOverrideDate:duration:", v3, 0.0);
  -[NTKFaceView handleOrdinaryScreenWake](self->_faceView, "handleOrdinaryScreenWake");

}

- (id)currentClockComplicationCountSet
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__NTKFaceViewController_currentClockComplicationCountSet__block_invoke;
  v17[3] = &unk_1E6BCF510;
  v4 = v3;
  v18 = v4;
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v17);
  -[NTKFaceView _additionalPrelaunchApplicationIdentifiers](self->_faceView, "_additionalPrelaunchApplicationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94120]), "initWithApplicationIdentifier:countOnFace:isWidget:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), 1, 1);
        objc_msgSend(v4, "appendCount:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }
  v11 = v4;

  return v11;
}

void __57__NTKFaceViewController_currentClockComplicationCountSet__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "complication");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "complicationType");
  objc_msgSend(v4, "complicationApplicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94120]), "initWithApplicationIdentifier:countOnFace:isWidget:", v6, 1, v5 == 56);
    objc_msgSend(*(id *)(a1 + 32), "appendCount:", v7);

  }
}

- (void)_showStatusBarAfterWake
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[NTKFaceView wantsStatusBarHidden](self->_faceView, "wantsStatusBarHidden"))
  {
    -[NTKFaceViewController statusBarViewController](self, "statusBarViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    -[NTKFaceViewController statusBarViewController](self, "statusBarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showAnimated:", 0);

    -[NTKFaceViewController statusBarViewController](self, "statusBarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareToAnimate");

    -[NTKFaceViewController statusBarViewController](self, "statusBarViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animate");

  }
}

- (void)_handleStatusBarChange
{
  -[NTKFaceView prepareForStatusChange:](self->_faceView, "prepareForStatusChange:", -[NTKClockStatusBarViewController isDisplayingStatus](self->_statusBarViewController, "isDisplayingStatus"));
}

- (void)_removeComplicationForSlot:(id)a3
{
  -[NTKFaceViewController _removeNormalComplicationForSlot:andDisconnectDisplay:](self, "_removeNormalComplicationForSlot:andDisconnectDisplay:", a3, 1);
}

- (void)_ensureNormalComplication:(id)a3 forSlot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  NTKFaceView *faceView;
  id v15;

  v15 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  -[NSMutableDictionary objectForKey:](self->_normalComplicationControllers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  if (!v7
    || (objc_msgSend(v7, "complication"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", v15),
        v8,
        (v9 & 1) == 0))
  {
    -[NTKFaceViewController _removeNormalComplicationForSlot:andDisconnectDisplay:](self, "_removeNormalComplicationForSlot:andDisconnectDisplay:", v6, 1);
    objc_msgSend((id)objc_opt_class(), "_controllerForComplication:face:slot:", v15, self->_face, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTKFaceViewController _newNormalDisplayForComplicationController:slot:](self, "_newNormalDisplayForComplicationController:slot:", v10, v6);
    -[NTKFaceViewController _insertNormalComplicationDisplay:controller:forSlot:](self, "_insertNormalComplicationDisplay:controller:forSlot:", v11, v10, v6);
    -[NTKFaceView device](self->_faceView, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((NTKShowGossamerUI(v12) & 1) == 0)
    {
      v13 = -[NTKFaceView _legacyShouldSwapGraphicCircularComplicationColors](self->_faceView, "_legacyShouldSwapGraphicCircularComplicationColors");

      if (!v13)
      {
LABEL_7:

        goto LABEL_8;
      }
      faceView = self->_faceView;
      objc_msgSend(v11, "display");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceView _configureComplicationView:forSlot:](faceView, "_configureComplicationView:forSlot:", v12, v6);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_ensureDetachedComplication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NTKComplicationDisplayWrapperView *v16;
  void *v17;
  NTKComplicationDisplayWrapperView *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "complication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  -[NSMutableDictionary objectForKey:](self->_detachedComplicationControllers, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  if (!v6
    || (objc_msgSend(v6, "complication"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v5),
        v7,
        (v8 & 1) == 0))
  {
    -[NTKFaceViewController _removeDetachedComplicationForSlot:andDisconnectDisplay:](self, "_removeDetachedComplicationForSlot:andDisconnectDisplay:", v4, 1);
    v9 = objc_msgSend(v20, "family");
    -[NTKFaceViewController face](self, "face");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationVariant defaultVariantForFamily:device:](NTKComplicationVariant, "defaultVariantForFamily:device:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKFaceViewController face](self, "face");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", v5, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [NTKComplicationDisplayWrapperView alloc];
    objc_msgSend(v20, "display");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NTKComplicationDisplayWrapperView initWithCustomTemplateDisplay:isDetachedDisplay:family:](v16, "initWithCustomTemplateDisplay:isDetachedDisplay:family:", v17, 1, objc_msgSend(v20, "family"));

    -[NTKComplicationDisplayWrapperView setComplicationSlotIdentifier:](v18, "setComplicationSlotIdentifier:", v4);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setFaceDataMode:", self->_dataMode);
    objc_msgSend(v15, "setPauseDate:", self->_pauseDate);
    objc_msgSend(v15, "addDisplayWrapper:withDisplayProperties:", v18, v19);
    -[NTKFaceViewController _insertDetachedComplicationDisplay:controller:forSlot:](self, "_insertDetachedComplicationDisplay:controller:forSlot:", v18, v15, v4);

  }
}

- (void)_insertDetachedComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5
{
  NTKFaceView *faceView;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  faceView = self->_faceView;
  v9 = a5;
  v10 = a3;
  -[NTKFaceView detachedComplicationDisplayWrapperForSlot:](faceView, "detachedComplicationDisplayWrapperForSlot:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setDetachedComplicationDisplayWrapper:forSlot:](self->_faceView, "setDetachedComplicationDisplayWrapper:forSlot:", v10, v9);

  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  -[NSMutableDictionary setObject:forKey:](self->_detachedComplicationControllers, "setObject:forKey:", v13, v9);
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  -[NTKFaceView detachedComplicationDisplayWrapperForSlot:](self->_faceView, "detachedComplicationDisplayWrapperForSlot:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
    objc_msgSend(v13, "removeDisplayWrapper:", v11);

}

- (void)_insertNormalComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5
{
  NTKFaceView *faceView;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  faceView = self->_faceView;
  v9 = a5;
  v10 = a3;
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](faceView, "normalComplicationDisplayWrapperForSlot:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setNormalComplicationDisplayWrapper:forSlot:](self->_faceView, "setNormalComplicationDisplayWrapper:forSlot:", v10, v9);

  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  -[NSMutableDictionary setObject:forKey:](self->_normalComplicationControllers, "setObject:forKey:", v13, v9);
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self->_faceView, "normalComplicationDisplayWrapperForSlot:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v12)
    objc_msgSend(v13, "removeDisplayWrapper:", v11);
  -[NTKFaceViewController _updateInteractivityOfComplicationDisplays](self, "_updateInteractivityOfComplicationDisplays");
  -[NTKFaceViewController _updateWidgetVisibilityOfComplicationDisplays](self, "_updateWidgetVisibilityOfComplicationDisplays");

}

- (void)_removeDetachedComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[NTKFaceView detachedComplicationDisplayWrapperForSlot:](self->_faceView, "detachedComplicationDisplayWrapperForSlot:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NTKFaceView setDetachedComplicationDisplayWrapper:forSlot:](self->_faceView, "setDetachedComplicationDisplayWrapper:forSlot:", 0, v8);
    os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
    -[NSMutableDictionary objectForKey:](self->_detachedComplicationControllers, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
    if (v4)
      objc_msgSend(v7, "removeDisplayWrapper:", v6);
    else
      objc_msgSend(v7, "updatePropertiesForDisplayWrapper:withBlock:", v6, &__block_literal_global_79);

  }
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  -[NSMutableDictionary removeObjectForKey:](self->_detachedComplicationControllers, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);

}

uint64_t __81__NTKFaceViewController__removeDetachedComplicationForSlot_andDisconnectDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFaceDataMode:", 0);
}

- (void)_removeNormalComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self->_faceView, "normalComplicationDisplayWrapperForSlot:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NTKFaceView setNormalComplicationDisplayWrapper:forSlot:](self->_faceView, "setNormalComplicationDisplayWrapper:forSlot:", 0, v8);
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    -[NSMutableDictionary objectForKey:](self->_normalComplicationControllers, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    if (v4)
      objc_msgSend(v7, "removeDisplayWrapper:", v6);
    else
      objc_msgSend(v7, "updatePropertiesForDisplayWrapper:withBlock:", v6, &__block_literal_global_80);

  }
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  -[NSMutableDictionary removeObjectForKey:](self->_normalComplicationControllers, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);

}

uint64_t __79__NTKFaceViewController__removeNormalComplicationForSlot_andDisconnectDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFaceDataMode:", 0);
}

- (void)setSuppressFaceViewInteraction:(BOOL)a3
{
  if (self->_suppressFaceViewInteraction != a3)
  {
    self->_suppressFaceViewInteraction = a3;
    -[NTKFaceView setUserInteractionEnabled:](self->_faceView, "setUserInteractionEnabled:", !a3);
  }
}

- (void)_updateInteractivityOfComplicationDisplays
{
  BOOL v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = -[NTKFaceViewController _shouldWidgetComplicationsEnableTap](self, "_shouldWidgetComplicationsEnableTap");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke;
  v4[3] = &__block_descriptor_33_e86_v32__0__NSString_8__NTKComplicationController_16__NTKComplicationDisplayWrapperView_24l;
  v5 = v3;
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v4);
}

void __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke_2;
  v8[3] = &unk_1E6BCF620;
  v10 = *(_BYTE *)(a1 + 32);
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "updatePropertiesForDisplayWrapper:withBlock:", a4, v8);

}

void __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (*(_BYTE *)(a1 + 40))
    v3 = objc_msgSend(*(id *)(a1 + 32), "hasTapAction");
  else
    v3 = 0;
  objc_msgSend(v4, "setTapEnabled:", v3);
  objc_msgSend(v4, "setDefaultTapAnimationEnabled:", 1);

}

- (BOOL)_shouldWidgetComplicationsEnableTap
{
  int64_t dataMode;

  dataMode = self->_dataMode;
  if ((unint64_t)(dataMode - 3) < 2 || dataMode == 0)
    return 0;
  if (dataMode == 2)
    return !self->_pausedForObstruction;
  return 1;
}

- (id)_newNormalDisplayForComplicationController:(id)a3 slot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_createNormalDisplayForComplicationController:slot:face:faceView:", v7, v6, self->_face, self->_faceView);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__wrapperViewTapped_, 64);
  -[NTKFaceView configureComplicationViewDisplayWrapper:forSlot:](self->_faceView, "configureComplicationViewDisplayWrapper:forSlot:", v8, v6);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setShowPreview:", -[NTKFaceViewController shouldUseSampleTemplate](self, "shouldUseSampleTemplate"));
  objc_msgSend(v9, "setFaceDataMode:", self->_dataMode);
  objc_msgSend(v7, "setPauseDate:", self->_pauseDate);
  objc_msgSend(v7, "addDisplayWrapper:withDisplayProperties:", v8, v9);

  return v8;
}

+ (id)_createNormalDisplayForComplicationController:(id)a3 slot:(id)a4 face:(id)a5 faceView:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NTKComplicationDisplayWrapperView *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v27;
  char isKindOfClass;
  NTKComplicationDisplayWrapperView *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "complication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "preferredComplicationFamilyForComplication:withSlot:", v13, v10);
  objc_msgSend(v12, "_filterProviderForSlot:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "wantsLegacyDisplay"))
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend(v11, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "richComplicationSlotsForDevice:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v10);

    v23 = (void *)objc_msgSend(v9, "richComplicationDisplayViewClass");
    if (v22 && (v24 = (objc_class *)v23) != 0)
    {
      if (objc_msgSend(v23, "instancesRespondToSelector:", sel_initWithFamily_))
        v25 = (id)objc_msgSend([v24 alloc], "initWithFamily:", v14);
      else
        v25 = objc_alloc_init(v24);
      v27 = v25;
      objc_msgSend(v25, "setFilterProvider:", v15);
      objc_msgSend(v12, "configureComplicationView:forSlot:", v27, v10);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v29 = [NTKComplicationDisplayWrapperView alloc];
      if ((isKindOfClass & 1) != 0)
        v30 = -[NTKComplicationDisplayWrapperView initWithCustomTemplateDisplay:isDetachedDisplay:family:](v29, "initWithCustomTemplateDisplay:isDetachedDisplay:family:", v27, 0, v14);
      else
        v30 = -[NTKComplicationDisplayWrapperView initWithCustomRichDisplay:](v29, "initWithCustomRichDisplay:", v27);
      v18 = (NTKComplicationDisplayWrapperView *)v30;

    }
    else
    {
      v18 = -[NTKComplicationDisplayWrapperView initWithFamily:]([NTKComplicationDisplayWrapperView alloc], "initWithFamily:", v14);
      if (!v22)
        goto LABEL_13;
    }
    -[NTKComplicationDisplayWrapperView setFilterProvider:](v18, "setFilterProvider:", v15);
    goto LABEL_13;
  }
  v16 = (void *)objc_msgSend(v12, "newLegacyComplicationViewForSlot:family:complication:", v10, v14, v13);
  if (!v16)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v31 = 138412802;
      v32 = v13;
      v33 = 2112;
      v34 = v10;
      v35 = 2048;
      v36 = v14;
      _os_log_error_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_ERROR, "Missing legacy complication view for %@ slot %@ family %ld", (uint8_t *)&v31, 0x20u);
    }

  }
  v18 = -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:layoutOverride:]([NTKComplicationDisplayWrapperView alloc], "initWithLegacyDisplay:layoutOverride:", v16, objc_msgSend(v12, "legacyComplicationLayoutOverrideForSlot:complication:", v10, v13));
  objc_msgSend(v12, "configureComplicationView:forSlot:", v16, v10);

LABEL_13:
  -[NTKComplicationDisplayWrapperView setComplicationSlotIdentifier:](v18, "setComplicationSlotIdentifier:", v10);

  return v18;
}

+ (id)_controllerForComplication:(id)a3 face:(id)a4 slot:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "complicationVariantForComplication:withSlot:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setShouldUseSampleTemplate:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_shouldUseSampleTemplate != a3)
  {
    self->_shouldUseSampleTemplate = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke;
    v3[3] = &__block_descriptor_33_e86_v32__0__NSString_8__NTKComplicationController_16__NTKComplicationDisplayWrapperView_24l;
    v4 = a3;
    -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v3);
  }
}

uint64_t __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD v5[4];
  char v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke_2;
  v5[3] = &__block_descriptor_33_e59_v16__0__NTKMutableComplicationControllerDisplayProperties_8l;
  v6 = *(_BYTE *)(a1 + 32);
  return objc_msgSend(a3, "updatePropertiesForDisplayWrapper:withBlock:", a4, v5);
}

uint64_t __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShowPreview:", *(unsigned __int8 *)(a1 + 32));
}

- (id)_selectedVisibleSlotForEditMode:(int64_t)a3
{
  NTKFaceView *faceView;
  void *v5;
  void *v6;

  faceView = self->_faceView;
  -[NTKFace selectedSlotForEditMode:](self->_face, "selectedSlotForEditMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView closestVisibleSlotToSlot:editMode:](faceView, "closestVisibleSlotToSlot:editMode:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_validateIfCurrentSelectedColorStillExists
{
  void (**v3)(void *, _QWORD);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD aBlock[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__NTKFaceViewController__validateIfCurrentSelectedColorStillExists__block_invoke;
  aBlock[3] = &unk_1E6BCF688;
  aBlock[4] = self;
  v3 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[NTKFaceViewController face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slotsForCustomEditMode:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    v3[2](v3, 0);
  }

}

void __67__NTKFaceViewController__validateIfCurrentSelectedColorStillExists__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedOptionForCustomEditMode:slot:", 10, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "faceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionForCustomEditMode:slot:", 10, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "faceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOption:forCustomEditMode:slot:", v4, 10, v8);

  }
}

- (void)_configureBackgroundFillAlpha:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  BOOL v9;
  BOOL v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  double v16;
  id v17;

  if (-[NTKFaceView isEveryComplicationHidden](self->_faceView, "isEveryComplicationHidden"))
  {
    v9 = a4 == 1 || a5 == 1;
    v10 = !v9;
    if (a4 != a5 && !v10)
    {
      v11 = 1.0;
      if (a3 <= 1.0)
        v11 = a3;
      -[NTKFaceEditView setBackgroundFillAlpha:](self->_editView, "setBackgroundFillAlpha:", v11);
    }
  }
  -[NTKFaceView _editModesDisabledByCurrentConfiguration](self->_faceView, "_editModesDisabledByCurrentConfiguration");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v17, "containsObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v17, "containsObject:", v14);

  if (a4 != a5 && v13 | v15)
  {
    v16 = 1.0;
    if (1.0 - a3 <= 1.0)
      v16 = 1.0 - a3;
    -[NTKFaceEditView setBackgroundFillAlpha:](self->_editView, "setBackgroundFillAlpha:", v16);
  }

}

- (CGRect)launchRectForComplicationApplicationIdentifier:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGRect *v15;
  _BOOL4 IsNull;
  CGRect *v17;
  CGSize size;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  NTKFaceViewController *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  _OWORD v36[2];
  CGRect result;

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x4010000000;
  v35 = &unk_1B75A3F6B;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v36[0] = *MEMORY[0x1E0C9D628];
  v36[1] = v5;
  if (self->_lastTappedSlotIdentifier)
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_normalComplicationControllers, "objectForKeyedSubscript:", self->_lastTappedSlotIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    objc_msgSend(v6, "complicationApplicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if (v8)
    {
      -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self->_faceView, "normalComplicationDisplayWrapperForSlot:", self->_lastTappedSlotIdentifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v10 = v33;
      v33[4] = v11;
      v10[5] = v12;
      v10[6] = v13;
      v10[7] = v14;

    }
    v15 = (CGRect *)(v33 + 4);
  }
  else
  {
    v15 = (CGRect *)v36;
  }
  IsNull = CGRectIsNull(*v15);
  v17 = (CGRect *)v33;
  if (IsNull)
  {
    size = self->_faceLaunchRect.size;
    *((_OWORD *)v33 + 2) = self->_faceLaunchRect.origin;
    v17[1].size = size;
  }
  if (CGRectIsNull(v17[1]))
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    v19 = (void *)-[NSMutableDictionary copy](self->_normalComplicationControllers, "copy");
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __72__NTKFaceViewController_launchRectForComplicationApplicationIdentifier___block_invoke;
    v28[3] = &unk_1E6BCF6B0;
    v30 = self;
    v31 = &v32;
    v29 = v4;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v28);

  }
  v20 = *((double *)v33 + 4);
  v21 = *((double *)v33 + 5);
  v22 = *((double *)v33 + 6);
  v23 = *((double *)v33 + 7);
  _Block_object_dispose(&v32, 8);

  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

void __72__NTKFaceViewController_launchRectForComplicationApplicationIdentifier___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(a3, "complicationApplicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

  if (v8)
  {
    objc_msgSend(*(id *)(a1[5] + 1288), "normalComplicationDisplayWrapperForSlot:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v10 = *(_QWORD **)(a1[6] + 8);
    v10[4] = v11;
    v10[5] = v12;
    v10[6] = v13;
    v10[7] = v14;

    *a4 = 1;
  }

}

- (void)_clearLastTappedComplication
{
  NSString *lastTappedSlotIdentifier;

  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = 0;

}

- (void)_clearFaceLaunchRect
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_faceLaunchRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_faceLaunchRect.size = v2;
}

- (void)faceViewRequestedLaunchFromRect:(CGRect)a3
{
  NSString *lastTappedSlotIdentifier;

  self->_faceLaunchRect = a3;
  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = 0;

}

- (void)_wrapperViewTapped:(id)a3
{
  NSString *v4;
  NSString *lastTappedSlotIdentifier;

  objc_msgSend(a3, "complicationSlotIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = v4;

  -[NTKFaceViewController _clearFaceLaunchRect](self, "_clearFaceLaunchRect");
}

- (BOOL)shouldLoadLiveFaceAtNextScreenOff
{
  void *v3;
  BOOL v4;

  -[NTKFaceViewController _unadornedSnapshot](self, "_unadornedSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[NTKFaceView _wantsOpportunisticLiveFaceLoading](self->_faceView, "_wantsOpportunisticLiveFaceLoading");
  else
    v4 = 0;

  return v4;
}

- (id)_dailySnapshot
{
  void *v3;

  if (self->_shouldShowSnapshot && (NTKDebugNoSnapshotsInSwitcher() & 1) == 0)
  {
    NTKSnapshotForFace(self->_face);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_unadornedSnapshot
{
  return NTKUnadornedSnapshotForFace(self->_face);
}

- (id)acquireComplicationTouchCancellationAssertion
{
  void *v3;
  id v4;
  NTKInvalidatableGroup *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NTKFaceViewController_acquireComplicationTouchCancellationAssertion__block_invoke;
  v7[3] = &unk_1E6BCF510;
  v8 = v3;
  v4 = v3;
  -[NTKFaceViewController enumerateComplicationControllersAndDisplaysWithBlock:](self, "enumerateComplicationControllersAndDisplaysWithBlock:", v7);
  v5 = -[NTKInvalidatableGroup initWithInvalidatables:]([NTKInvalidatableGroup alloc], "initWithInvalidatables:", v4);

  return v5;
}

void __70__NTKFaceViewController_acquireComplicationTouchCancellationAssertion__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "acquireTouchCancellationAssertion");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    }
  }

}

- (NTKFaceViewControllerDelegate)delegate
{
  return (NTKFaceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKFaceViewControllerStatusBarDelegate)statusBarDelegate
{
  return (NTKFaceViewControllerStatusBarDelegate *)objc_loadWeakRetained((id *)&self->_statusBarDelegate);
}

- (void)setStatusBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarDelegate, a3);
}

- (BOOL)shouldShowSnapshot
{
  return self->_shouldShowSnapshot;
}

- (BOOL)supressesNonSnapshotUI
{
  return self->_supressesNonSnapshotUI;
}

- (BOOL)shouldUseSampleTemplate
{
  return self->_shouldUseSampleTemplate;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (NSDate)pauseDate
{
  return self->_pauseDate;
}

- (BOOL)showsCanonicalContent
{
  return self->_showsCanonicalContent;
}

- (BOOL)showContentForUnadornedSnapshot
{
  return self->_showContentForUnadornedSnapshot;
}

- (BOOL)ignoreSnapshotImages
{
  return self->_ignoreSnapshotImages;
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (BOOL)exitingEditing
{
  return self->_exitingEditing;
}

- (void)setExitingEditing:(BOOL)a3
{
  self->_exitingEditing = a3;
}

- (BOOL)suppressFaceViewInteraction
{
  return self->_suppressFaceViewInteraction;
}

- (BOOL)pausedForHomeScreen
{
  return self->_pausedForHomeScreen;
}

- (void)setPausedForHomeScreen:(BOOL)a3
{
  self->_pausedForHomeScreen = a3;
}

- (BOOL)pausedForObstruction
{
  return self->_pausedForObstruction;
}

- (void)setPausedForObstruction:(BOOL)a3
{
  self->_pausedForObstruction = a3;
}

- (BOOL)widgetsVisible
{
  return self->_widgetsVisible;
}

- (void)setWidgetsVisible:(BOOL)a3
{
  self->_widgetsVisible = a3;
}

- (BOOL)isOrbDisabled
{
  return self->_isOrbDisabled;
}

- (NTKClockStatusBarViewController)statusBarViewController
{
  return self->_statusBarViewController;
}

- (NTKFace)face
{
  return self->_face;
}

- (NTKFaceView)faceView
{
  return self->_faceView;
}

- (NTKTritiumAnimationController)tritiumAnimationController
{
  return self->_tritiumAnimationController;
}

- (NTKTritiumController)tritiumController
{
  return self->_tritiumController;
}

- (NHSUISClockAppearance)homeScreenAppearance
{
  return self->_homeScreenAppearance;
}

- (NSString)widgetIdentifierNamespace
{
  return self->_widgetIdentifierNamespace;
}

- (void)setWidgetIdentifierNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifierNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifierNamespace, 0);
  objc_storeStrong((id *)&self->_homeScreenAppearance, 0);
  objc_storeStrong((id *)&self->_tritiumController, 0);
  objc_storeStrong((id *)&self->_tritiumAnimationController, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_statusBarViewController, 0);
  objc_storeStrong((id *)&self->_pauseDate, 0);
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tombstoneColor, 0);
  objc_storeStrong((id *)&self->_colorPickerConfig, 0);
  objc_storeStrong((id *)&self->_lastTappedSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_pptComplicationController, 0);
  objc_storeStrong((id *)&self->_pptComplicationDisplay, 0);
  objc_storeStrong((id *)&self->_time_travel_update_timer, 0);
  objc_storeStrong((id *)&self->_scrubDate, 0);
  objc_storeStrong((id *)&self->_delayedFreezeBlock, 0);
  objc_storeStrong((id *)&self->_informationVariantsCache, 0);
  objc_storeStrong((id *)&self->_appearanceVariantsCache, 0);
  objc_storeStrong((id *)&self->_editView, 0);
  objc_storeStrong((id *)&self->_detachedComplicationControllers, 0);
  objc_storeStrong((id *)&self->_normalComplicationControllers, 0);
}

@end
