@implementation CAMCameraRollController

- (CAMCameraRollController)init
{
  CAMCameraRollController *v2;
  NSMutableSet *v3;
  NSMutableSet *sessionAssetUUIDs;
  NSMutableSet *v5;
  NSMutableSet *ignoredEV0UUIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *HDRUUIDToIgnoredEV0UUIDs;
  CAMTransientDataSource *v9;
  CAMTransientDataSource *transientDataSource;
  CAMTransientImageManager *v11;
  CAMTransientImageManager *transientImageManager;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *photosFrameworksPreheatQueue;
  NSMutableSet *v16;
  NSMutableSet *outgoingOneUpPresentationHelpers;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMCameraRollController;
  v2 = -[CAMCameraRollController init](&v20, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sessionAssetUUIDs = v2->__sessionAssetUUIDs;
    v2->__sessionAssetUUIDs = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    ignoredEV0UUIDs = v2->__ignoredEV0UUIDs;
    v2->__ignoredEV0UUIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    HDRUUIDToIgnoredEV0UUIDs = v2->__HDRUUIDToIgnoredEV0UUIDs;
    v2->__HDRUUIDToIgnoredEV0UUIDs = v7;

    v9 = objc_alloc_init(CAMTransientDataSource);
    transientDataSource = v2->__transientDataSource;
    v2->__transientDataSource = v9;

    v11 = objc_alloc_init(CAMTransientImageManager);
    transientImageManager = v2->__transientImageManager;
    v2->__transientImageManager = v11;

    v2->_sessionIdentifier = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.camera.photo-frameworks-preheat", v13);
    photosFrameworksPreheatQueue = v2->__photosFrameworksPreheatQueue;
    v2->__photosFrameworksPreheatQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    outgoingOneUpPresentationHelpers = v2->__outgoingOneUpPresentationHelpers;
    v2->__outgoingOneUpPresentationHelpers = v16;

    v2->_prefersPresentingStatusbarHidden = 1;
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:priority:selector:name:object:", v2, 0, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v18, "addObserver:priority:selector:name:object:", v2, 0, sel_applicationResumed_, *MEMORY[0x1E0DC4828], 0);
    objc_msgSend(v18, "addObserver:priority:selector:name:object:", v2, 0, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  }
  return v2;
}

- (void)setImageWellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageWellDelegate, a3);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (void)setPresentationDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentationDelegate, obj);
    self->_presentationDelegateFlags.respondsToSourceAssetRect = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToShouldHideSourceAsset = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreviewGestureDidBecomeAvailable = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreviewSourceRect = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToImageForReveal = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToRevealWillBegin = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToRevealDidEnd = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToWillPresentCameraRoll = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPrefersPresentingStatusbarHiddenDidChange = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreferredPresentationOrientation = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)prefersPresentingStatusbarHidden
{
  return self->_prefersPresentingStatusbarHidden;
}

- (BOOL)isCameraRollViewControllerPresented
{
  void *v2;
  char v3;

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOneUpPresented");

  return v3;
}

- (PUOneUpPresentationHelper)_oneUpPresentationHelper
{
  return self->__oneUpPresentationHelper;
}

- (UIGestureRecognizer)previewGestureRecognizer
{
  return self->_previewGestureRecognizer;
}

- (id)persistedThumbnailImage
{
  void *v3;

  if (-[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked"))
  {
    v3 = 0;
  }
  else
  {
    if (-[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage"))
      -[CAMCameraRollController _externalStorageBrowsingSessionLastThumbnailImage](self, "_externalStorageBrowsingSessionLastThumbnailImage");
    else
      objc_msgSend(MEMORY[0x1E0D73140], "cameraPreviewWellImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder will appear", v10, 2u);
  }

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewWillAppear:", v3);

  v7 = -[CAMCameraRollController _didStopCaptureSession](self, "_didStopCaptureSession");
  -[CAMCameraRollController _setDidStopCaptureSession:](self, "_setDidStopCaptureSession:", 0);
  if (-[CAMCameraRollController _isOneUpVisible](self, "_isOneUpVisible"))
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "applicationState") != 2;

    }
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cameraRollController:willShowPresentingViewControllerShouldStartCaptureSession:", self, v7);

  }
  -[CAMCameraRollController _setPrefersPresentingStatusbarHidden:](self, "_setPrefersPresentingStatusbarHidden:", 1);
}

- (BOOL)_didStopCaptureSession
{
  return self->__didStopCaptureSession;
}

- (void)_setDidStopCaptureSession:(BOOL)a3
{
  self->__didStopCaptureSession = a3;
}

- (BOOL)_isOneUpVisible
{
  return self->__oneUpVisible;
}

- (void)_setPrefersPresentingStatusbarHidden:(BOOL)a3
{
  id v4;

  if (self->_prefersPresentingStatusbarHidden != a3)
  {
    self->_prefersPresentingStatusbarHidden = a3;
    if (self->_presentationDelegateFlags.respondsToPrefersPresentingStatusbarHiddenDidChange)
    {
      -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cameraRollControllerPrefersPresentingStatusbarHiddenDidChange:", self);

    }
  }
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder did appear", v8, 2u);
  }

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewDidAppear:", v3);

  if (-[CAMCameraRollController _isOneUpFullyPresented](self, "_isOneUpFullyPresented"))
  {
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraRollControllerDidDismissFullyPresentedCameraRoll:", self);

  }
  -[CAMCameraRollController _setOneUpFullyPresented:](self, "_setOneUpFullyPresented:", 0);
  -[CAMCameraRollController _setOneUpVisible:](self, "_setOneUpVisible:", 0);
}

- (BOOL)_isOneUpFullyPresented
{
  return self->__oneUpFullyPresented;
}

- (void)_setOneUpFullyPresented:(BOOL)a3
{
  self->__oneUpFullyPresented = a3;
}

- (void)_setOneUpVisible:(BOOL)a3
{
  self->__oneUpVisible = a3;
}

- (void)preload
{
  CFAbsoluteTime Current;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7[2];
  id location;

  Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  camSoftLinkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CAMCameraRollController_preload__block_invoke;
  v6[3] = &unk_1EA32B600;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&Current;
  dispatch_async(v4, v6);

  camSoftLinkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, &__block_literal_global_15);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __34__CAMCameraRollController_preload__block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4[2];

  objc_msgSend(a1[4], "_photosFrameworksPreheatQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CAMCameraRollController_preload__block_invoke_2;
  block[3] = &unk_1EA32A798;
  objc_copyWeak(v4, a1 + 5);
  block[4] = a1[4];
  v4[1] = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(v4);
}

void __34__CAMCameraRollController_preload__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  id v3[2];

  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__CAMCameraRollController_preload__block_invoke_3;
  v2[3] = &unk_1EA32A798;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  v3[1] = *(id *)(a1 + 48);
  __34__CAMCameraRollController_preload__block_invoke_3((uint64_t)v2);
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_destroyWeak(v3);
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isCaptureSessionCurrent:(unsigned __int16)a3
{
  return -[CAMCameraRollController sessionIdentifier](self, "sessionIdentifier") == a3;
}

- (void)willPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4
{
  int v4;
  id v6;
  _BOOL4 v7;
  int v8;
  int v9;
  NSObject *v10;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    v7 = -[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked");
    v8 = -[CAMCameraRollController sessionIdentifier](self, "sessionIdentifier");
    if (v7 && (v9 = v8, v8 != v4))
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CAMCameraRollController willPersistAssetWithUUID:captureSession:].cold.1((uint64_t)v6, v9, v10);
    }
    else
    {
      -[CAMCameraRollController _sessionAssetUUIDs](self, "_sessionAssetUUIDs");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v10, "addObject:", v6);
    }

  }
}

- (NSMutableSet)_sessionAssetUUIDs
{
  return self->__sessionAssetUUIDs;
}

- (CAMTransientDataSource)_transientDataSource
{
  return self->__transientDataSource;
}

- (void)didPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4
{
  int v4;
  id v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    v7 = -[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked");
    v8 = -[CAMCameraRollController sessionIdentifier](self, "sessionIdentifier");
    if (!v7 || v8 == v4)
    {
      -[CAMCameraRollController _sessionAssetUUIDs](self, "_sessionAssetUUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v6);

      -[CAMCameraRollController _scheduleUpdateIfOneUpIsActive](self, "_scheduleUpdateIfOneUpIsActive");
      objc_initWeak(&location, self);
      v11 = dispatch_time(0, 45000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__CAMCameraRollController_didPersistAssetWithUUID_captureSession___block_invoke;
      block[3] = &unk_1EA328F00;
      objc_copyWeak(&v15, &location);
      v14 = v6;
      v12 = (void *)MEMORY[0x1E0C80D38];
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CAMCameraRollController didPersistAssetWithUUID:captureSession:].cold.1((uint64_t)v6, self, v9);

    }
  }

}

- (void)_scheduleUpdateIfOneUpIsActive
{
  void *v3;
  int v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!-[CAMCameraRollController _updateIsScheduled](self, "_updateIsScheduled"))
  {
    -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isOneUpPresented");

    if (v4)
    {
      -[CAMCameraRollController _setUpdateIsScheduled:](self, "_setUpdateIsScheduled:", 1);
      objc_initWeak(&location, self);
      v5 = dispatch_time(0, 500000000);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__CAMCameraRollController__scheduleUpdateIfOneUpIsActive__block_invoke;
      v6[3] = &unk_1EA329490;
      objc_copyWeak(&v7, &location);
      dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_updateIsScheduled
{
  return self->__updateIsScheduled;
}

void __34__CAMCameraRollController_preload__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  CFAbsoluteTime Current;
  double v8;
  _QWORD v9[7];
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_preheatQueue_shouldSkipPhotosFrameworkPreheat") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerChangeObserver:", WeakRetained);
    objc_msgSend(v3, "unregisterChangeObserver:", WeakRetained);
    v4 = (id)objc_msgSend(MEMORY[0x1E0D7D1F0], "sharedInstance");
    v5 = (id)objc_msgSend(WeakRetained, "_cameraRollCollectionListFetchResult");

  }
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CAMCameraRollController_preload__block_invoke_4;
  block[3] = &unk_1EA328868;
  block[4] = *(_QWORD *)(a1 + 32);
  if (CAMCameraRollControllerDeferredMediaLoadingReason_block_invoke_onceTokenCPAnalytics != -1)
    dispatch_once(&CAMCameraRollControllerDeferredMediaLoadingReason_block_invoke_onceTokenCPAnalytics, block);
  Current = CFAbsoluteTimeGetCurrent();
  v8 = *(double *)(a1 + 48);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __34__CAMCameraRollController_preload__block_invoke_5;
  v9[3] = &unk_1EA32B498;
  v9[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v9[5] = v8;
  *(double *)&v9[6] = Current - v8;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __34__CAMCameraRollController_preload__block_invoke_4()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-Camera"), v1);

  objc_msgSend(MEMORY[0x1E0D09910], "setupSystemPropertyProvidersForLibrary:", v2);
  objc_msgSend(MEMORY[0x1E0DC3470], "pu_prepareCPAnalytics");

}

void __34__CAMCameraRollController_preload__block_invoke_5(uint64_t a1)
{
  void *v2;
  char v3;
  double Current;
  double v5;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CAMSignpostWithIDAndArgs(68, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0D09910], "startAppTracking");
  objc_msgSend(MEMORY[0x1E0D09910], "startViewTracking");
  objc_msgSend(MEMORY[0x1E0D09910], "activateEventQueue");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "launchedToTest");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_ensureCameraRollViewController");
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(double *)(a1 + 40);
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = Current - v5 - *(double *)(a1 + 48);
      v11 = 134218240;
      v12 = Current - v5;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "preflightCameraRollFrameworks complete! (took %.3f seconds total, %.3f seconds on main)", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "updateShortcutItemsForApplication:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("CAMRegisterAppShortcuts"), 0);

  }
  CAMSignpostWithIDAndArgs(69, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (OS_dispatch_queue)_photosFrameworksPreheatQueue
{
  return self->__photosFrameworksPreheatQueue;
}

- (void)_startNewSession
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked");
  -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCameraRollController _setSessionIdentifier:](self, "_setSessionIdentifier:", (unsigned __int16)(-[CAMCameraRollController sessionIdentifier](self, "sessionIdentifier") + 1));
  -[CAMCameraRollController _setAllowUpdating:](self, "_setAllowUpdating:", 0);
  if (v3)
    objc_msgSend(v8, "removeAllAssets");
  -[CAMCameraRollController _sessionAssetUUIDs](self, "_sessionAssetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CAMCameraRollController _ignoredEV0UUIDs](self, "_ignoredEV0UUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[CAMCameraRollController sessionDelegate](self, "sessionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "cameraRollControllerDidStartSession:", self);

}

- (void)_setSessionIdentifier:(unsigned __int16)a3
{
  self->_sessionIdentifier = a3;
}

- (void)_setAllowUpdating:(BOOL)a3
{
  self->__allowUpdating = a3;
}

- (NSMutableSet)_ignoredEV0UUIDs
{
  return self->__ignoredEV0UUIDs;
}

- (NSMutableDictionary)_HDRUUIDToIgnoredEV0UUIDs
{
  return self->__HDRUUIDToIgnoredEV0UUIDs;
}

- (CAMCameraRollControllerSessionDelegate)sessionDelegate
{
  return (CAMCameraRollControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (BOOL)dismissCameraRollViewControllerForced:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  v5 = a3;
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "dismissOneUpViewControllerForced:animated:", v5, v4);
  else
    v8 = 1;

  return v8;
}

- (void)beginAllowingStagedMediaLoading
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (-[CAMCameraRollController _isDeferringStagedMediaLoading](self, "_isDeferringStagedMediaLoading"))
  {
    -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "browsingSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__CAMCameraRollController_beginAllowingStagedMediaLoading__block_invoke;
    v7[3] = &unk_1EA328868;
    v8 = v5;
    v6 = v5;
    objc_msgSend(v6, "performChanges:", v7);
    -[CAMCameraRollController _setDeferringStagedMediaLoading:](self, "_setDeferringStagedMediaLoading:", 0);

  }
}

- (BOOL)_isDeferringStagedMediaLoading
{
  return self->__deferringStagedMediaLoading;
}

- (void)_ensureCameraRollViewController
{
  -[CAMCameraRollController _setAllowUpdating:](self, "_setAllowUpdating:", 1);
  -[CAMCameraRollController _update](self, "_update");
}

- (void)_update
{
  -[CAMCameraRollController _updateAnimated:](self, "_updateAnimated:", 0);
}

- (BOOL)_allowUpdating
{
  return self->__allowUpdating;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (CAMTransientImageManager)_transientImageManager
{
  return self->__transientImageManager;
}

- (void)_setStagedDataSource:(id)a3
{
  objc_storeStrong((id *)&self->__stagedDataSource, a3);
}

- (void)_setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v7;

  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->__photosDataSource;
  if (photosDataSource != v5)
  {
    v7 = v5;
    if (photosDataSource)
      -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](self->__photosDataSource, "registerChangeObserver:", self);
    v5 = v7;
  }

}

- (CAMCameraRollControllerImageWellDelegate)imageWellDelegate
{
  return (CAMCameraRollControllerImageWellDelegate *)objc_loadWeakRetained((id *)&self->_imageWellDelegate);
}

- (PXPhotosDataSource)_stagedDataSource
{
  return self->__stagedDataSource;
}

- (id)oneUpPresentationHelperViewController:(id)a3
{
  void *v4;
  void *v5;

  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraRollControllerPresentingViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CAMCameraRollControllerPresentationDelegate)presentationDelegate
{
  return (CAMCameraRollControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (PUPhotoKitDataSourceManager)_photoKitDataSourceManager
{
  return self->__photoKitDataSourceManager;
}

- (void)_updateTransientDataSourceIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[4];

  if (!-[CAMCameraRollController _transientAssetsAreValid](self, "_transientAssetsAreValid"))
  {
    -[CAMCameraRollController _setTransientAssetsAreValid:](self, "_setTransientAssetsAreValid:", 1);
    -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCameraRollController _photoKitDataSourceManager](self, "_photoKitDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      v19[3] = 0;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke;
      v14[3] = &unk_1EA32B7B8;
      v15 = v5;
      v9 = v3;
      v16 = v9;
      v10 = v7;
      v17 = v10;
      v18 = v19;
      objc_msgSend(v15, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v6, 1, v14);
      if (objc_msgSend(v10, "count"))
      {
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke_2;
        v11[3] = &unk_1EA328A40;
        v12 = v10;
        v13 = v9;
        objc_msgSend(v13, "performChanges:", v11);

      }
      _Block_object_dispose(v19, 8);
    }

  }
}

- (BOOL)_transientAssetsAreValid
{
  return self->__transientAssetsAreValid;
}

- (void)_setTransientAssetsAreValid:(BOOL)a3
{
  self->__transientAssetsAreValid = a3;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CAMCameraRollController *v19;

  v6 = a3;
  v7 = a4;
  -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = objc_msgSend(v6, "versionIdentifier");
    -[CAMCameraRollController _stagedDataSource](self, "_stagedDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[CAMCameraRollController _update](self, "_update");
    -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v6)
    {

LABEL_11:
      -[CAMCameraRollController _invalidateTransientAssets](self, "_invalidateTransientAssets");
      -[CAMCameraRollController _updateTransientDataSourceIfNeeded](self, "_updateTransientDataSourceIfNeeded");
      goto LABEL_12;
    }
    v12 = objc_msgSend(v6, "versionIdentifier");

    if (v12 != v9 || !objc_msgSend(v7, "hasIncrementalChanges"))
      goto LABEL_11;
    -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMCameraRollController _transientImageManager](self, "_transientImageManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEmpty") && (objc_msgSend(v14, "isEmpty") & 1) != 0)
    {

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__CAMCameraRollController_photosDataSource_didChange___block_invoke;
      v16[3] = &unk_1EA329360;
      v17 = v14;
      v18 = v13;
      v19 = self;
      v15 = v13;
      v13 = v14;
      objc_msgSend(v15, "performChanges:", v16);

    }
  }
LABEL_12:

}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke(uint64_t a1)
{
  void (**v2)(void *, void *, void *);
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void (**v59)(void *, void *, void *);
  id v60;
  id obj;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  char *v68;
  void *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD aBlock[4];
  id v96;
  _BYTE v97[5];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_2;
  aBlock[3] = &unk_1EA32B668;
  v96 = *(id *)(a1 + 32);
  v2 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v70 = a1;
  objc_msgSend(*(id *)(a1 + 32), "existingPairedVideoUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v92 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsExclusivePredicate:", 1);
  v57 = v4;
  v55 = v11;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v4, v11);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v88 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v16, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v2[2](v2, v16, v17);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
    }
    while (v13);
  }
  v56 = v5;
  objc_msgSend(*(id *)(v70 + 40), "existingAssetUUIDs");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v2;
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v19 = v58;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v84 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIsExclusivePredicate:", 1);
    v62 = v25;
    v64 = v18;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v18, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v70 + 48), "_photosDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indexPathForLastAsset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v27;
    objc_msgSend(v27, "lastAssetCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v67 = v26;
    v30 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v80 != v32)
            objc_enumerationMutation(v67);
          v34 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * m);
          objc_msgSend(v69, "indexPathForAsset:hintIndexPath:hintCollection:", v34, v28, v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v34, "uuid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "burstIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              objc_msgSend(*(id *)(v70 + 40), "removeRepresentativeAssetForBurstIdentifier:", v37);
            }
            else
            {
              v38 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v100 = v36;
                _os_log_impl(&dword_1DB760000, v38, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (photosDataSource:didChange:): de-dup one asset from transient DS: %{public}@", buf, 0xCu);
              }

              objc_msgSend(*(id *)(v70 + 40), "removeAssetWithUUID:", v36);
              v2 = v59;
            }
            v2[2](v2, v34, v36);

          }
        }
        v31 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      }
      while (v31);
    }

  }
  objc_msgSend(*(id *)(v70 + 40), "existingBurstIdentifiers");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
  if (v65)
  {
    v63 = *(_QWORD *)v76;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(v60);
        v68 = v39;
        v40 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v39);
        objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setIsExclusivePredicate:", 1);
        v66 = v41;
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithBurstIdentifier:options:", v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v70 + 48), "_photosDataSource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "indexPathForLastAsset");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "lastAssetCollection");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v46 = v42;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v72;
          do
          {
            for (n = 0; n != v48; ++n)
            {
              if (*(_QWORD *)v72 != v49)
                objc_enumerationMutation(v46);
              v51 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * n);
              objc_msgSend(v43, "indexPathForAsset:hintIndexPath:hintCollection:", v51, v44, v45);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (v52)
              {
                objc_msgSend(v51, "burstIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (v53)
                {
                  objc_msgSend(*(id *)(v70 + 40), "removeRepresentativeAssetForBurstIdentifier:", v53);
                }
                else
                {
                  v54 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                    __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_cold_1(buf, &buf[1], v54);

                }
              }

            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
          }
          while (v48);
        }

        v39 = v68 + 1;
      }
      while (v68 + 1 != (char *)v65);
      v65 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
    }
    while (v65);
  }

}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  char v7;
  id v8;

  v8 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "isPhotoIris");
  v7 = objc_msgSend(v5, "isPhotoIrisPlaceholder");

  if (v6 && (v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removePairedVideoForUUID:", v8);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CAMCameraRollController _setObserveCameraPreviewWellChanges:](self, "_setObserveCameraPreviewWellChanges:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CAMCameraRollController;
  -[CAMCameraRollController dealloc](&v4, sel_dealloc);
}

- (void)resetNavigation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CAMCameraRollController_resetNavigation__block_invoke;
  v6[3] = &unk_1EA328868;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

void __42__CAMCameraRollController_resetNavigation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "assetsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startingAssetReference");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", v3);
}

void __66__CAMCameraRollController_didPersistAssetWithUUID_captureSession___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_transientDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "existingAssetForUUID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (didPersistAssetWithUUID): removing one asset from transient DS after timeout: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "removeAssetWithUUID:", *(_QWORD *)(a1 + 32));
  }

}

void __57__CAMCameraRollController__scheduleUpdateIfOneUpIsActive__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setUpdateIsScheduled:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_update");

}

void __34__CAMCameraRollController_preload__block_invoke_154()
{
  NSObject *v0;

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_156);

}

void __34__CAMCameraRollController_preload__block_invoke_2_155()
{
  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  __34__CAMCameraRollController_preload__block_invoke_3_157();
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void __34__CAMCameraRollController_preload__block_invoke_3_157()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_issueNonLaunchingCommand:", CFSTR("commit"));

}

- (void)ppt_awaitPreload:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  camSoftLinkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke;
  v7[3] = &unk_1EA328F80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_photosFrameworksPreheatQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_2;
  v4[3] = &unk_1EA328F80;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3;
  v2[3] = &unk_1EA328F80;
  v3 = *(_OWORD *)(a1 + 32);
  __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3((uint64_t)v2);
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_4;
  v2[3] = &unk_1EA328F80;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureCameraRollViewController");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cameraPreviewWellImageDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  void *v19;
  void *v20;
  CAMCameraRollController *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCameraRollController imageWellDelegate](self, "imageWellDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "image");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked");
    -[CAMCameraRollController _sessionAssetUUIDs](self, "_sessionAssetUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCameraRollController _ignoredEV0UUIDs](self, "_ignoredEV0UUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v24 = objc_msgSend(v8, "containsObject:", v6) ^ 1;
    else
      v24 = 0;
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v9;
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        v29 = 2114;
        v30 = (uint64_t)v11;
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: removing ignored EV0 UUID %{public}@ since we received HDR image from assetsd", buf, 0x16u);
      }

      objc_msgSend(v10, "removeObjectForKey:", v6);
      v9 = v12;
      objc_msgSend(v12, "removeObject:", v11);
    }
    v25 = v9;
    v14 = objc_msgSend(v9, "containsObject:", v6);
    v15 = -[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage");
    v16 = os_log_create("com.apple.camera", "Camera");
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (!v17)
      {
LABEL_13:

        v19 = (void *)v26;
LABEL_25:

        goto LABEL_26;
      }
      *(_DWORD *)buf = 138543362;
      v28 = v6;
      v18 = "ImageWell %{public}@: rejecting update from assetsd since we're currently on external storage mode";
LABEL_12:
      _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_13;
    }
    if (v24)
    {
      v19 = (void *)v26;
      if (v17)
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: rejecting update from assetsd for secure session", buf, 0xCu);
      }

      v20 = v5;
      v21 = self;
      v22 = 0;
      v23 = 0;
    }
    else
    {
      if ((v14 & 1) != 0)
      {
        if (!v17)
          goto LABEL_13;
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        v18 = "ImageWell %{public}@: ignoring from assetsd because in ignored list";
        goto LABEL_12;
      }
      v19 = (void *)v26;
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        v29 = 2114;
        v30 = v26;
        _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: updating from assetsd with %{public}@", buf, 0x16u);
      }

      v20 = v5;
      v21 = self;
      v22 = v26;
      v23 = v6;
    }
    objc_msgSend(v20, "cameraRollController:didChangeImageWellImage:withUUID:animated:", v21, v22, v23, 1);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)ignoreImageWellChangeNotificationForEV0UUID:(id)a3 withHDRUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[CAMCameraRollController _ignoredEV0UUIDs](self, "_ignoredEV0UUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

    -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v10, "setObject:forKey:", v6, v8);
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "ignoreImageWellChangeNotificationForEV0UUID called with missing EV0UUID=%{public}@ or HDRUUID=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void)clearIgnoredImageWellUUIDs
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "ImageWell: clearIgnoredImageWellUUIDs called while still ignoring HDR to EV0 UUIDs %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[CAMCameraRollController _ignoredEV0UUIDs](self, "_ignoredEV0UUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[CAMCameraRollController _HDRUUIDToIgnoredEV0UUIDs](self, "_HDRUUIDToIgnoredEV0UUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)processTransientAssetUpdate:(id)a3 preventingInsertion:(BOOL)a4 persistenceOptions:(int64_t)a5
{
  id v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 != 3)
  {
    v10 = -[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked");
    v11 = objc_msgSend(v8, "sessionIdentifier");
    v12 = -[CAMCameraRollController sessionIdentifier](self, "sessionIdentifier");
    if (!v10 || v11 == v12)
    {
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "burstIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "existingRepresentativeAssetForBurstIdentifier:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 && v16)
      {
        objc_msgSend(v9, "updateAssetWithConvertible:", v8);
      }
      else if (!v15 || v16 || a4)
      {
        objc_msgSend(v9, "existingAssetForUUID:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 || a4)
          objc_msgSend(v9, "updateAssetWithConvertible:", v8);
        else
          v19 = (id)objc_msgSend(v9, "insertAssetWithConvertible:", v8);

      }
      else
      {
        objc_msgSend(v9, "enqueuePendingBurstAssetWithConvertible:", v8);
      }

    }
    else
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CAMCameraRollController processTransientAssetUpdate:preventingInsertion:persistenceOptions:].cold.1((uint64_t)v8, self, v13);

    }
  }

}

- (void)processPendingBursts
{
  id v2;

  -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processPendingBurstAssets");

}

- (void)processTransientPairedVideoUpdate:(id)a3 filterType:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[CAMCameraRollController _transientImageManager](self, "_transientImageManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "insertPairedVideoWithConvertible:filterType:", v8, a4);

}

- (BOOL)canPresentCameraRollViewController
{
  void *v3;
  char v4;

  -[CAMCameraRollController _ensureCameraRollViewController](self, "_ensureCameraRollViewController");
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canPresentOneUpViewControllerAnimated:", 1);

  return v4;
}

- (void)presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4 deferringStagedMediaLoading:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109376;
    v13[1] = v6;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Presenting the Camera Roll interactively=%d deferring media loading=%d", (uint8_t *)v13, 0xEu);
  }

  -[CAMCameraRollController _stopCaptureSessionIfNecessary](self, "_stopCaptureSessionIfNecessary");
  -[CAMCameraRollController _setDeferringStagedMediaLoading:](self, "_setDeferringStagedMediaLoading:", v5);
  -[CAMCameraRollController _ensureCameraRollViewController](self, "_ensureCameraRollViewController");
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
    v12 = 2;
  else
    v12 = 0;
  objc_msgSend(v10, "presentOneUpViewControllerAnimated:interactiveMode:", v7, v12);

}

uint64_t __58__CAMCameraRollController_beginAllowingStagedMediaLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowed:forReason:", 1, CFSTR("CAMCameraRollControllerDeferredMediaLoadingReason"));
}

- (void)handlePresentingPanGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePresentingPanGestureRecognizer:", v4);

}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder will disappear", v10, 2u);
  }

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewWillDisappear:", v3);

  -[CAMCameraRollController _setOneUpVisible:](self, "_setOneUpVisible:", 1);
  -[CAMCameraRollController clearIgnoredImageWellUUIDs](self, "clearIgnoredImageWellUUIDs");
  -[CAMCameraRollController _stopCaptureSessionIfNecessary](self, "_stopCaptureSessionIfNecessary");
  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraRollControllerPresentingViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraRollController _setPrefersPresentingStatusbarHidden:](self, "_setPrefersPresentingStatusbarHidden:", objc_msgSend(v9, "prefersStatusBarHidden"));

}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder did disappear", v8, 2u);
  }

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewDidDisappear:", v3);

  if (!-[CAMCameraRollController _isOneUpFullyPresented](self, "_isOneUpFullyPresented"))
  {
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraRollControllerDidFullyPresentCameraRoll:", self);

  }
  -[CAMCameraRollController _setOneUpFullyPresented:](self, "_setOneUpFullyPresented:", 1);
}

- (void)_stopCaptureSessionIfNecessary
{
  id v3;

  if (!-[CAMCameraRollController _didStopCaptureSession](self, "_didStopCaptureSession"))
  {
    -[CAMCameraRollController _setDidStopCaptureSession:](self, "_setDidStopCaptureSession:", 1);
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraRollControllerRequestsCaptureSessionStopped:", self);

  }
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CAMCameraRollController _ensureCameraRollViewController](self, "_ensureCameraRollViewController", a3, a4.x, a4.y);
  -[CAMCameraRollController resetNavigation](self, "resetNavigation");
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "assetsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startingAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewViewControllerForItemAtIndexPath:allowingActions:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitPreviewViewController:", v5);

}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Present the Camera Roll preview", v15, 2u);
  }

  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cameraRollControllerWillPresentPreviewController:", self);
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginUsingBlackTheme");

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "willPresentPreviewViewController:forLocation:inSourceView:", v10, v9, x, y);

  -[CAMCameraRollController _stopCaptureSessionIfNecessary](self, "_stopCaptureSessionIfNecessary");
  -[CAMCameraRollController _setOneUpVisible:](self, "_setOneUpVisible:", 1);
  -[CAMCameraRollController clearIgnoredImageWellUUIDs](self, "clearIgnoredImageWellUUIDs");

}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss the Camera Roll preview, committing=%d", (uint8_t *)v11, 8u);
  }

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didDismissPreviewViewController:committing:", v6, v4);

  if (!v4)
  {
    -[CAMCameraRollController _setOneUpVisible:](self, "_setOneUpVisible:", 0);
    v9 = -[CAMCameraRollController _didStopCaptureSession](self, "_didStopCaptureSession");
    -[CAMCameraRollController _setDidStopCaptureSession:](self, "_setDidStopCaptureSession:", 0);
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cameraRollController:didDismissPreviewControllerShouldStartCaptureSession:", self, v9);

  }
}

- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4
{
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a4;
  if (self->_presentationDelegateFlags.respondsToPreviewSourceRect)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    objc_msgSend(WeakRetained, "cameraRollControllerPreviewSourceRect:", self);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (self->_presentationDelegateFlags.respondsToImageForReveal)
  {
    v15 = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    objc_msgSend(v15, "cameraRollControllerImageForReveal:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cameraPreviewTransitionDelegateWithSourceRect:sourceImage:", v16, v8, v10, v12, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)animateRevealWithInteractionProgress:(id)a3 forPreviewingAtLocation:(CGPoint)a4 inSourceView:(id)a5 containerView:(id)a6
{
  id WeakRetained;
  id v8;

  v8 = a3;
  if (self->_presentationDelegateFlags.respondsToRevealWillBegin)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    objc_msgSend(WeakRetained, "cameraRollControllerRevealWillBegin:", self);

  }
  objc_msgSend(v8, "addProgressObserver:", self);

}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  id WeakRetained;

  if (self->_presentationDelegateFlags.respondsToRevealDidEnd)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    objc_msgSend(WeakRetained, "cameraRollControllerRevealDidEnd:", self);

  }
}

- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldStartPreviewingSimultaneouslyWithGestureRecognizer:", v4);

  return v6;
}

- (BOOL)_isPhotoLibraryLocked
{
  return +[CAMFrameworkUtilities isPasscodeLocked](CAMFrameworkUtilities, "isPasscodeLocked")
      || +[CAMFrameworkUtilities isPhotosAppLocked](CAMFrameworkUtilities, "isPhotosAppLocked");
}

- (BOOL)_shouldRequestUnlock
{
  CAMCameraRollController *v2;
  void *v3;

  v2 = self;
  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "cameraRollControllerShouldRequestUnlock:", v2);

  return (char)v2;
}

- (void)_updateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  PXPhotosDataSource *photosDataSource;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PUOneUpPresentationHelper *v39;
  PUOneUpPresentationHelper *oneUpPresentationHelper;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  void *v63;
  _QWORD v64[5];
  _QWORD aBlock[5];
  _QWORD block[4];
  id v67;
  id location;
  _QWORD v69[4];

  v3 = a3;
  v69[2] = *MEMORY[0x1E0C80C00];
  if (!-[CAMCameraRollController _allowUpdating](self, "_allowUpdating"))
    return;
  objc_initWeak(&location, self);
  -[CAMCameraRollController _photosFrameworksPreheatQueue](self, "_photosFrameworksPreheatQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CAMCameraRollController__updateAnimated___block_invoke;
  block[3] = &unk_1EA329490;
  objc_copyWeak(&v67, &location);
  dispatch_async(v5, block);

  if (-[CAMCameraRollController _isPhotoLibraryLocked](self, "_isPhotoLibraryLocked")
    && (-[CAMCameraRollController _sessionAssetUUIDs](self, "_sessionAssetUUIDs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (void *)objc_msgSend(v6, "copy"),
        v6,
        v7))
  {
    v8 = 0;
  }
  else
  {
    -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isOneUpPresented");

      if ((v12 & 1) == 0)
      {
        -[CAMCameraRollController _setStagedDataSource:](self, "_setStagedDataSource:", 0);
        -[CAMCameraRollController _setPhotosDataSource:](self, "_setPhotosDataSource:", 0);
        -[CAMCameraRollController _invalidateTransientAssets](self, "_invalidateTransientAssets");
      }
    }
    else
    {

    }
    v7 = 0;
    v8 = 1;
  }
  -[CAMCameraRollController _transientDataSource](self, "_transientDataSource");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraRollController _transientImageManager](self, "_transientImageManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage"))
    -[CAMCameraRollController _createPhotosDatasourceIfNeededWithAllowedUUIds:animated:](self, "_createPhotosDatasourceIfNeededWithAllowedUUIds:animated:", v7, v3);
  -[PXPhotosDataSource setAllowedUUIDs:](self->__photosDataSource, "setAllowedUUIDs:", v7);
  -[PXPhotosDataSource startBackgroundFetchIfNeeded](self->__photosDataSource, "startBackgroundFetchIfNeeded");
  -[CAMCameraRollController _stagedDataSource](self, "_stagedDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_17;
  if (!v8)
  {

    goto LABEL_19;
  }
  photosDataSource = self->__photosDataSource;
  if (!photosDataSource)
  {
LABEL_17:

    goto LABEL_20;
  }
  v16 = -[PXPhotosDataSource isEmpty](photosDataSource, "isEmpty");

  if ((v16 & 1) == 0)
LABEL_19:
    -[CAMCameraRollController _setStagedDataSource:](self, "_setStagedDataSource:", 0);
LABEL_20:
  if (PLIsCamera() && _updateAnimated__onceToken != -1)
    dispatch_once(&_updateAnimated__onceToken, &__block_literal_global_190);
  -[CAMCameraRollController _stagedDataSource](self, "_stagedDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  if (!self->__oneUpPresentationHelper)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_3;
    aBlock[3] = &unk_1EA32B6B0;
    aBlock[4] = self;
    v49 = _Block_copy(aBlock);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_4;
    v64[3] = &unk_1EA32B6D8;
    v64[4] = self;
    v51 = _Block_copy(v64);
    if (-[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage"))
    {
      -[CAMCameraRollController externalStorage](self, "externalStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7D1B0];
      v50 = v21;
      objc_msgSend(v21, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "importBrowsingSessionWithDeviceUUID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMCameraRollController _setExternalStorageBrowsingSession:](self, "_setExternalStorageBrowsingSession:", v25);
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_5;
      v62[3] = &unk_1EA32B700;
      v63 = v25;
      v26 = v25;
      v27 = _Block_copy(v62);
      v28 = v63;
    }
    else
    {
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D200]), "initWithPhotosDataSource:", v20);
      objc_storeStrong((id *)&self->__photoKitDataSourceManager, v50);
      v29 = objc_alloc_init(MEMORY[0x1E0D7D208]);
      v28 = objc_alloc_init(MEMORY[0x1E0D7D1F8]);
      objc_msgSend(v28, "setDataSourceManager:", v50);
      objc_msgSend(v28, "setEnableNavigateToPhotos:", 1);
      objc_msgSend(MEMORY[0x1E0D7D1A0], "setUnlockDeviceHandlerWithActionType:", v51);
      -[CAMCameraRollController _updateTransientDataSourceIfNeeded](self, "_updateTransientDataSourceIfNeeded");
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D1C0]), "initWithTransientDataSource:", v53);
      v30 = objc_alloc(MEMORY[0x1E0D7D1C8]);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_6;
      v60[3] = &unk_1EA32B728;
      v26 = v29;
      v61 = v26;
      v48 = (void *)objc_msgSend(v30, "initWithTransientImageManager:supplementaryLivePhotoImageSource:", v52, v60);
      v46 = objc_alloc_init(MEMORY[0x1E0D7D1B8]);
      v31 = objc_alloc(MEMORY[0x1E0D7D1D8]);
      v69[0] = v50;
      v69[1] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithDataSourceManagers:", v32);

      v34 = objc_alloc_init(MEMORY[0x1E0D7D1D0]);
      objc_msgSend(v34, "registerActionManager:forAssetClass:", v28, 0);
      objc_msgSend(v34, "registerActionManager:forAssetClass:", v28, objc_opt_class());
      objc_msgSend(v34, "registerActionManager:forAssetClass:", v46, objc_opt_class());
      v35 = objc_alloc_init(MEMORY[0x1E0D7D1E0]);
      objc_msgSend(v35, "registerMediaProvider:forAssetClass:", v26, objc_opt_class());
      objc_msgSend(v35, "registerMediaProvider:forAssetClass:", v48, objc_opt_class());
      objc_msgSend(v35, "registerMediaProvider:forAssetPassingTest:", v48, &__block_literal_global_214);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_8;
      v56[3] = &unk_1EA32B790;
      v57 = v33;
      v58 = v34;
      v59 = v35;
      v36 = v35;
      v37 = v34;
      v38 = v33;
      v27 = _Block_copy(v56);

    }
    v39 = (PUOneUpPresentationHelper *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D1E8]), "initWithBrowsingSessionCreationBlock:", v27);
    oneUpPresentationHelper = self->__oneUpPresentationHelper;
    self->__oneUpPresentationHelper = v39;

    -[PUOneUpPresentationHelper setDelegate:](self->__oneUpPresentationHelper, "setDelegate:", self);
    -[PUOneUpPresentationHelper setAssetDisplayDelegate:](self->__oneUpPresentationHelper, "setAssetDisplayDelegate:", self);
    -[PUOneUpPresentationHelper setCachesScrubberView:](self->__oneUpPresentationHelper, "setCachesScrubberView:", 1);
    -[PUOneUpPresentationHelper setUnlockDeviceStatus:](self->__oneUpPresentationHelper, "setUnlockDeviceStatus:", v49);
    -[PUOneUpPresentationHelper setUnlockDeviceHandlerWithActionType:](self->__oneUpPresentationHelper, "setUnlockDeviceHandlerWithActionType:", v51);
    objc_msgSend(MEMORY[0x1E0D7D248], "setupStatusBarInternalSettingsGestureOnInternalDevices");

  }
  -[CAMCameraRollController _photoKitDataSourceManager](self, "_photoKitDataSourceManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPhotosDataSource:", v20);

  -[CAMCameraRollController _updateTransientDataSourceIfNeeded](self, "_updateTransientDataSourceIfNeeded");
  if (-[CAMCameraRollController _isDeferringStagedMediaLoading](self, "_isDeferringStagedMediaLoading"))
  {
    -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "browsingSession");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "viewModel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_9;
    v54[3] = &unk_1EA328868;
    v45 = v44;
    v55 = v45;
    objc_msgSend(v45, "performChanges:", v54);

  }
  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);
}

void __43__CAMCameraRollController__updateAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPreheatQueue_shouldSkipPhotosFrameworkPreheat:", 1);

}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0DC3F20], "px_swizzleMethod:withMethod:", sel_supportedInterfaceOrientations, sel_cam_swizzled_supportedInterfaceOrientations);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldRequestUnlock") ^ 1;
}

void __43__CAMCameraRollController__updateAnimated___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void (**v6)(id, uint64_t);

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldRequestUnlock") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraRollController:didRequestPasscodeUnlockForAction:completionBlock:", *(_QWORD *)(a1 + 32), a3, v6);

  }
  else
  {
    v6[2](v6, 1);
  }

}

id __43__CAMCameraRollController__updateAnimated___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v13 = a2;
  v14 = a4;
  v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "isPhotoIrisPlaceholder"))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a3, v14, v15, a6, a7);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return objc_msgSend(a2, "isPhotoIrisPlaceholder");
  else
    return 0;
}

id __43__CAMCameraRollController__updateAnimated___block_invoke_8(_QWORD *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D1B0]), "initWithDataSourceManager:actionManager:mediaProvider:", a1[4], a1[5], a1[6]);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowed:forReason:", 0, CFSTR("CAMCameraRollControllerDeferredMediaLoadingReason"));
}

- (void)_createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  CAMCameraRollController *v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (!self->__undoActionsInvalidator && !self->__preparingUndoActionsInvalidator)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "ImageWell: Undo actions invalidator setup starting...", buf, 2u);
    }

    self->__preparingUndoActionsInvalidator = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__CAMCameraRollController__createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary___block_invoke;
    block[3] = &unk_1EA329360;
    v10 = v4;
    v11 = self;
    v12 = v6;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

void __93__CAMCameraRollController__createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D7BAC8], "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000201, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CAMCameraRollController__createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary___block_invoke_2;
  block[3] = &unk_1EA329360;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__CAMCameraRollController__createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B288], "privacyControllerForCollection:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraRollControllerPresentingViewController:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7BB90]), "initWithUndoManager:privacyController:", v6, v3);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 192);
  *(_QWORD *)(v8 + 192) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "beginObservingSystemEventsForAutomaticInvalidation");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v2);
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v15 = v14;

  v16 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218240;
    v18 = v15;
    v19 = 2048;
    v20 = v12;
    _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell: Undo actions invalidator setup cost total: %.3fs, main thread setup: %.3fs", (uint8_t *)&v17, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 28) = 0;
}

- (void)_createPhotosDatasourceIfNeededWithAllowedUUIds:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[8];
  _QWORD v21[3];

  v4 = a4;
  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CAMCameraRollController _cameraRollCollectionListFetchResult](self, "_cameraRollCollectionListFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v12 = 8;
    }
    else
    {
      v12 = 8;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v8, 8);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v13);
      objc_msgSend(v14, "setFetchLimit:", 100);
      objc_msgSend(v14, "setSortDescriptors:", v11);
      if ((objc_msgSend(v14, "isEmpty") & 1) == 0)
      {
        -[CAMCameraRollController _setStagedDataSource:](self, "_setStagedDataSource:", v14);
        v12 = 9;
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v8, v12);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v15);
    objc_msgSend(v16, "setAllowedUUIDs:", v6);
    objc_msgSend(v16, "setSortDescriptors:", v11);
    -[CAMCameraRollController _setPhotosDataSource:](self, "_setPhotosDataSource:", v16);
    objc_msgSend(v16, "isEmpty");
    -[CAMCameraRollController _setObserveCameraPreviewWellChanges:](self, "_setObserveCameraPreviewWellChanges:", 1);
    -[CAMCameraRollController imageWellDelegate](self, "imageWellDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[CAMCameraRollController persistedThumbnailImage](self, "persistedThumbnailImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "ImageWell: updating from persistedThumbnailImage after setting up photos data source", v20, 2u);
      }

      objc_msgSend(v17, "cameraRollController:didChangeImageWellImage:withUUID:animated:", self, v18, 0, v4);
    }

  }
}

- (id)_cameraRollCollectionListFetchResult
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 209, 0);
}

- (void)_invalidateTransientAssets
{
  -[CAMCameraRollController _setTransientAssetsAreValid:](self, "_setTransientAssetsAreValid:", 0);
}

void __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:", a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v13, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingAssetForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "burstIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = 1;
    else
      v10 = v8 == 0;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "existingRepresentativeAssetForBurstIdentifier:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(_QWORD *)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v12 + 1;
  if (v12 >= 101)
    *a3 = 1;

}

void __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v9;
          _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (_updateTransientDataSourceIfNeeded): de-dup one asset from transient DS: %{public}@", buf, 0xCu);

        }
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v7, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAssetWithUUID:", v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);
  }

}

- (void)_setObserveCameraPreviewWellChanges:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->__observeCameraPreviewWellChanges != a3)
  {
    v3 = a3;
    self->__observeCameraPreviewWellChanges = a3;
    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "addCameraPreviewWellImageChangeObserver:", self);
    else
      objc_msgSend(v5, "removeCameraPreviewWellImageChangeObserver:", self);

  }
}

- (void)_setExternalStorageBrowsingSession:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a3;
  -[CAMCameraRollController _externalStorageBrowsingSession](self, "_externalStorageBrowsingSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[CAMCameraRollController _externalStorageBrowsingSession](self, "_externalStorageBrowsingSession");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = -[CAMCameraRollController _externalStorageBrowsingSessionThumbnailRequest](self, "_externalStorageBrowsingSessionThumbnailRequest");

      if (v9 >= 1)
      {
        -[CAMCameraRollController _externalStorageBrowsingSession](self, "_externalStorageBrowsingSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageWellThumbnailProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancelThumbnailRequest:", -[CAMCameraRollController _externalStorageBrowsingSessionThumbnailRequest](self, "_externalStorageBrowsingSessionThumbnailRequest"));

        -[CAMCameraRollController set_externalStorageBrowsingSessionThumbnailRequest:](self, "set_externalStorageBrowsingSessionThumbnailRequest:", 0);
      }
    }
    objc_storeStrong((id *)&self->__externalStorageBrowsingSession, a3);
    objc_initWeak(&location, self);
    objc_msgSend(v5, "imageWellThumbnailProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__CAMCameraRollController__setExternalStorageBrowsingSession___block_invoke;
    v13[3] = &unk_1EA32B7E0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v12, "requestImageAndUUIDForStartingAssetFillingTargetSize:resultHandler:", v13, 360.0, 640.0);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }

}

void __62__CAMCameraRollController__setExternalStorageBrowsingSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updateExternalStorageThumbnail:withUUID:", v6, v5);

}

- (void)_updateExternalStorageThumbnail:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage")
    && !+[CAMFrameworkUtilities isPasscodeLocked](CAMFrameworkUtilities, "isPasscodeLocked"))
  {
    -[CAMCameraRollController imageWellDelegate](self, "imageWellDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__CAMCameraRollController__updateExternalStorageThumbnail_withUUID___block_invoke;
    v10[3] = &unk_1EA3290F0;
    v10[4] = self;
    v11 = v6;
    v12 = v8;
    v13 = v7;
    v9 = v8;
    cam_perform_on_main_asap(v10);

  }
}

uint64_t __68__CAMCameraRollController__updateExternalStorageThumbnail_withUUID___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "set_externalStorageBrowsingSessionLastThumbnailImage:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell: updating from persistedThumbnailImage after browsing session updated", (uint8_t *)&v7, 2u);
    }

    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 56);
      if (*(_QWORD *)(a1 + 40))
        v6 = &stru_1EA3325A0;
      else
        v6 = CFSTR(" with a empty image");
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "External storage: imageWellThumbnailProvider updating the image well thumbnail %{public}@, uuid=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 48), "cameraRollController:didChangeImageWellImage:withUUID:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0);
  }
  return result;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 37;
}

- (int64_t)oneUpPresentationHelperPreferredBarStyle:(id)a3
{
  return 1;
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 0;
}

- (void)oneUpPresentationHelper:(id)a3 previewScrubberDidBecomeAvailable:(id)a4
{
  void *v5;
  id WeakRetained;

  objc_msgSend(a4, "panGestureRecognizer", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraRollController _setPreviewGestureRecognizer:](self, "_setPreviewGestureRecognizer:", v5);

  if (self->_presentationDelegateFlags.respondsToPreviewGestureDidBecomeAvailable)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    objc_msgSend(WeakRetained, "cameraRollControllerPreviewGestureDidBecomeAvailable:", self);

  }
}

- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_storeWeak((id *)&self->_oneUpViewController, v11);
  if (self->_presentationDelegateFlags.respondsToWillPresentCameraRoll)
  {
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraRollControllerWillPresentCameraRoll:withOneUpController:", self, v11);

  }
  -[CAMCameraRollController _stagedDataSource](self, "_stagedDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[CAMCameraRollController _photosDataSource](self, "_photosDataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraRollController _createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary:](self, "_createUndoActionsInvalidatorInBackgroundIfNeededWithPhotoLibrary:", v10);

}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  PUOneUpViewController **p_oneUpViewController;
  id v6;
  id v7;

  p_oneUpViewController = &self->_oneUpViewController;
  v6 = a3;
  objc_storeWeak((id *)p_oneUpViewController, 0);
  -[CAMCameraRollController _outgoingOneUpPresentationHelpers](self, "_outgoingOneUpPresentationHelpers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (BOOL)oneUpPresentationHelperEnableFreezeLayoutOnOrientationChange:(id)a3
{
  void *v4;
  void *v5;

  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraRollControllerPresentingViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "supportedInterfaceOrientations") == 2;
  return (char)v4;
}

- (CGRect)oneUpPresentationHelper:(id)a3 rectForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5 contentsRect:(CGRect *)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (self->_presentationDelegateFlags.respondsToSourceAssetRect)
  {
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate", a3, a4, a5, a6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraRollControllerSourceAssetRect:", self);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  _BOOL8 v5;
  id v6;

  if (self->_presentationDelegateFlags.respondsToShouldHideSourceAsset)
  {
    v5 = objc_msgSend(a4, "count", a3) != 0;
    -[CAMCameraRollController presentationDelegate](self, "presentationDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraRollController:shouldHideSourceAsset:", self, v5);

  }
}

- (int64_t)oneUpPresentationHelperPreferredPresentationOrientation:(id)a3
{
  void *v4;
  int64_t v5;

  if (!self->_presentationDelegateFlags.respondsToPreferredPresentationOrientation)
    return 1;
  -[CAMCameraRollController presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cameraRollControllerPreferredPresentationOrientation:", self);

  return v5;
}

- (void)setExternalStorage:(id)a3
{
  void *v4;
  id v5;

  if (self->_externalStorage != a3)
  {
    self->_externalStorage = (CAMExternalStorage *)a3;
    -[CAMCameraRollController _setStagedDataSource:](self, "_setStagedDataSource:", 0);
    -[CAMCameraRollController _setPhotosDataSource:](self, "_setPhotosDataSource:", 0);
    -[CAMCameraRollController _invalidateTransientAssets](self, "_invalidateTransientAssets");
    -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "state"))
    {
      -[CAMCameraRollController _outgoingOneUpPresentationHelpers](self, "_outgoingOneUpPresentationHelpers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
    -[CAMCameraRollController set_oneUpPresentationHelper:](self, "set_oneUpPresentationHelper:", 0);
    -[CAMCameraRollController _setExternalStorageBrowsingSession:](self, "_setExternalStorageBrowsingSession:", 0);
    -[CAMCameraRollController set_photoKitDataSourceManager:](self, "set_photoKitDataSourceManager:", 0);
    -[CAMCameraRollController _setAllowUpdating:](self, "_setAllowUpdating:", 1);
    -[CAMCameraRollController set_externalStorageBrowsingSessionLastThumbnailImage:](self, "set_externalStorageBrowsingSessionLastThumbnailImage:", 0);
    -[CAMCameraRollController _updateAnimated:](self, "_updateAnimated:", 1);
    -[CAMCameraRollController _setObserveCameraPreviewWellChanges:](self, "_setObserveCameraPreviewWellChanges:", -[CAMCameraRollController _outputToExternalStorage](self, "_outputToExternalStorage") ^ 1);

  }
}

- (BOOL)_outputToExternalStorage
{
  void *v2;
  BOOL v3;

  -[CAMCameraRollController externalStorage](self, "externalStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)currentAssetIndexFromEnd
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastItemIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v8 && v6)
  {
    v10 = objc_msgSend(v8, "row");
    v9 = v10 - objc_msgSend(v6, "row");
  }

  return v9;
}

- (void)setCurrentAssetIndexFromEnd:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CAMCameraRollController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastItemIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v8, "row") - a3, objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "row") <= 0)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v17 = objc_msgSend(v9, "row");
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring setCurrentAssetIndexFromEnd row=%ld, indexFromEnd=%ld", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v6, "assetsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetReferenceAtIndexPath:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__CAMCameraRollController_setCurrentAssetIndexFromEnd___block_invoke;
      v13[3] = &unk_1EA328A40;
      v14 = v6;
      v15 = v11;
      -[NSObject performChanges:](v14, "performChanges:", v13);

      v12 = v14;
    }
    else
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CAMCameraRollController setCurrentAssetIndexFromEnd:].cold.1(v9, a3, v12);
    }

  }
}

uint64_t __55__CAMCameraRollController_setCurrentAssetIndexFromEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

- (void)_setPreviewGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_previewGestureRecognizer, a3);
}

- (CAMExternalStorage)externalStorage
{
  return self->_externalStorage;
}

- (PUOneUpViewController)oneUpViewController
{
  return (PUOneUpViewController *)objc_loadWeakRetained((id *)&self->_oneUpViewController);
}

- (void)set_oneUpPresentationHelper:(id)a3
{
  objc_storeStrong((id *)&self->__oneUpPresentationHelper, a3);
}

- (NSMutableSet)_outgoingOneUpPresentationHelpers
{
  return self->__outgoingOneUpPresentationHelpers;
}

- (void)set_photoKitDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->__photoKitDataSourceManager, a3);
}

- (void)_setUpdateIsScheduled:(BOOL)a3
{
  self->__updateIsScheduled = a3;
}

- (void)_setDeferringStagedMediaLoading:(BOOL)a3
{
  self->__deferringStagedMediaLoading = a3;
}

- (BOOL)_preheatQueue_shouldSkipPhotosFrameworkPreheat
{
  return self->__preheatQueue_shouldSkipPhotosFrameworkPreheat;
}

- (void)_setPreheatQueue_shouldSkipPhotosFrameworkPreheat:(BOOL)a3
{
  self->__preheatQueue_shouldSkipPhotosFrameworkPreheat = a3;
}

- (BOOL)_observeCameraPreviewWellChanges
{
  return self->__observeCameraPreviewWellChanges;
}

- (PUBrowsingSession)_externalStorageBrowsingSession
{
  return self->__externalStorageBrowsingSession;
}

- (int64_t)_externalStorageBrowsingSessionThumbnailRequest
{
  return self->__externalStorageBrowsingSessionThumbnailRequest;
}

- (void)set_externalStorageBrowsingSessionThumbnailRequest:(int64_t)a3
{
  self->__externalStorageBrowsingSessionThumbnailRequest = a3;
}

- (UIImage)_externalStorageBrowsingSessionLastThumbnailImage
{
  return self->__externalStorageBrowsingSessionLastThumbnailImage;
}

- (void)set_externalStorageBrowsingSessionLastThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->__externalStorageBrowsingSessionLastThumbnailImage, a3);
}

- (PXUndoActionsInvalidator)_undoActionsInvalidator
{
  return self->__undoActionsInvalidator;
}

- (BOOL)_preparingUndoActionsInvalidator
{
  return self->__preparingUndoActionsInvalidator;
}

- (void)set_preparingUndoActionsInvalidator:(BOOL)a3
{
  self->__preparingUndoActionsInvalidator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__undoActionsInvalidator, 0);
  objc_storeStrong((id *)&self->__externalStorageBrowsingSessionLastThumbnailImage, 0);
  objc_storeStrong((id *)&self->__externalStorageBrowsingSession, 0);
  objc_storeStrong((id *)&self->__photosFrameworksPreheatQueue, 0);
  objc_storeStrong((id *)&self->__stagedDataSource, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->__HDRUUIDToIgnoredEV0UUIDs, 0);
  objc_storeStrong((id *)&self->__ignoredEV0UUIDs, 0);
  objc_storeStrong((id *)&self->__sessionAssetUUIDs, 0);
  objc_storeStrong((id *)&self->__photoKitDataSourceManager, 0);
  objc_storeStrong((id *)&self->__transientImageManager, 0);
  objc_storeStrong((id *)&self->__transientDataSource, 0);
  objc_storeStrong((id *)&self->__outgoingOneUpPresentationHelpers, 0);
  objc_storeStrong((id *)&self->__oneUpPresentationHelper, 0);
  objc_destroyWeak((id *)&self->_oneUpViewController);
  objc_storeStrong((id *)&self->_previewGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_imageWellDelegate);
  objc_destroyWeak((id *)&self->_sessionDelegate);
}

- (void)willPersistAssetWithUUID:(NSObject *)a3 captureSession:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_0_6(&dword_1DB760000, a3, (uint64_t)a3, "Rejecting persist notification from asset %{public}@ because it does not belong in this session %d", (uint8_t *)&v3);
}

- (void)didPersistAssetWithUUID:(NSObject *)a3 captureSession:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_6(&dword_1DB760000, a3, v4, "Rejecting persist notification from asset %{public}@ because it does not belong in this session %d", v5);
  OUTLINED_FUNCTION_1();
}

- (void)processTransientAssetUpdate:(uint64_t)a1 preventingInsertion:(void *)a2 persistenceOptions:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_6(&dword_1DB760000, a3, v4, "Rejecting update from asset %{public}@ because it does not belong in this session %d", v5);
  OUTLINED_FUNCTION_1();
}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Expected burst identifier for asset fetched with burst identifer", buf, 2u);
}

- (void)setCurrentAssetIndexFromEnd:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "row");
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Cannot find asset reference for row=%ld, indexFromEnd=%ld", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
