@implementation CAMTimelapseController

- (void)restoreConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[CAMTimelapseController isCapturing](self, "isCapturing"))
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Resuming timelapse capture for %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[CAMTimelapseController _prepareForTimelapseCaptureSetModeAndDevice:](self, "_prepareForTimelapseCaptureSetModeAndDevice:", 1);
    -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resumeTimelapseWithUUID:", v6);

  }
  -[CAMTimelapseController _setBackendRecoveryNeeded:](self, "_setBackendRecoveryNeeded:", 1);
}

- (BOOL)isCapturing
{
  return self->__state != 0;
}

- (void)_setBackendRecoveryNeeded:(BOOL)a3
{
  if (self->__backendRecoveryNeeded != a3)
  {
    self->__backendRecoveryNeeded = a3;
    -[CAMTimelapseController _triggerBackendCrashRecoveryIfNeeded](self, "_triggerBackendCrashRecoveryIfNeeded");
  }
}

- (void)_triggerBackendCrashRecoveryIfNeeded
{
  uint64_t v3;
  id v4;

  if (-[CAMTimelapseController _backendRecoveryNeeded](self, "_backendRecoveryNeeded"))
  {
    if (-[CAMTimelapseController _previewStarted](self, "_previewStarted"))
    {
      v3 = -[CAMTimelapseController isCapturing](self, "isCapturing") ^ 1;
      -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performCrashRecoveryIfNeededForceEndLastTimelapseSession:", v3);
      -[CAMTimelapseController _setBackendRecoveryNeeded:](self, "_setBackendRecoveryNeeded:", 0);

    }
  }
}

- (BOOL)_backendRecoveryNeeded
{
  return self->__backendRecoveryNeeded;
}

- (BOOL)_previewStarted
{
  return self->__previewStarted;
}

- (void)setLastFocusResult:(id)a3
{
  CAMFocusResult *v4;
  CAMFocusResult *v5;
  _BOOL4 v6;
  CAMFocusResult *v7;

  v4 = (CAMFocusResult *)a3;
  v5 = v4;
  if (self->_lastFocusResult != v4)
  {
    self->_lastFocusResult = v4;
    v7 = v4;
    v6 = -[CAMTimelapseController _shouldUpdateFocusAndExposureWhenContrastDetectionCompletes](self, "_shouldUpdateFocusAndExposureWhenContrastDetectionCompletes");
    v5 = v7;
    if (v6)
    {
      -[CAMTimelapseController _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:](self, "_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:", 0);
      -[CAMTimelapseController _updateFocusAndExposureForStartCapturing](self, "_updateFocusAndExposureForStartCapturing");
      v5 = v7;
    }
  }

}

- (BOOL)_shouldUpdateFocusAndExposureWhenContrastDetectionCompletes
{
  return self->__shouldUpdateFocusAndExposureWhenContrastDetectionCompletes;
}

- (void)_resetIgnoringTimerCallbacksWaitingForCaptureResponse
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Error: was ignoring timer callbacks waiting for capture response but clearing because device started or session error occurred", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_previewStarted:(id)a3
{
  -[CAMTimelapseController _setPreviewStarted:](self, "_setPreviewStarted:", 1);
  if (-[CAMTimelapseController isCapturing](self, "isCapturing"))
    -[CAMTimelapseController _updateFocusAndExposureForStartCapturing](self, "_updateFocusAndExposureForStartCapturing");
}

- (void)_setPreviewStarted:(BOOL)a3
{
  if (self->__previewStarted != a3)
  {
    self->__previewStarted = a3;
    if (!a3)
      -[CAMTimelapseController _setFocusAndExposureAdjusted:](self, "_setFocusAndExposureAdjusted:", 0);
    -[CAMTimelapseController _triggerBackendCrashRecoveryIfNeeded](self, "_triggerBackendCrashRecoveryIfNeeded");
  }
}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[CAMTimelapseController _setPreviewStarted:](self, "_setPreviewStarted:", 0);
  if (-[CAMTimelapseController isCapturing](self, "isCapturing"))
    -[CAMTimelapseController stopCapturingWithReasons:](self, "stopCapturingWithReasons:", 4);
}

- (void)_setFocusAndExposureAdjusted:(BOOL)a3
{
  self->__focusAndExposureAdjusted = a3;
}

- (CAMTimelapseController)initWithCaptureController:(id)a3 locationController:(id)a4 motionController:(id)a5 persistenceController:(id)a6 storageController:(id)a7 librarySelectionController:(id)a8 nebulaDaemonProxyManager:(id)a9
{
  id v16;
  id v17;
  CAMTimelapseController *v18;
  CAMTimelapseController *v19;
  NSCountedSet *v20;
  NSCountedSet *inFlightTimelapseUUIDs;
  NSMutableSet *v22;
  NSMutableSet *pendingCompletedStates;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v16 = a8;
  v17 = a9;
  v32.receiver = self;
  v32.super_class = (Class)CAMTimelapseController;
  v18 = -[CAMTimelapseController init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->__captureController, a3);
    objc_storeStrong((id *)&v19->__locationController, a4);
    objc_storeStrong((id *)&v19->__motionController, a5);
    objc_storeStrong((id *)&v19->__storageController, a7);
    objc_storeStrong((id *)&v19->__persistenceController, a6);
    objc_storeStrong((id *)&v19->__librarySelectionController, a8);
    objc_storeStrong((id *)&v19->__nebulaDaemonProxyManager, a9);
    -[CAMNebulaDaemonProxyManager setTimelapseClientDelegate:](v19->__nebulaDaemonProxyManager, "setTimelapseClientDelegate:", v19);
    v20 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    inFlightTimelapseUUIDs = v19->__inFlightTimelapseUUIDs;
    v19->__inFlightTimelapseUUIDs = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingCompletedStates = v19->__pendingCompletedStates;
    v19->__pendingCompletedStates = v22;

    v19->__greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel__deviceStarted_, *MEMORY[0x1E0C89F48], 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel__sessionStarted_, *MEMORY[0x1E0C8A128], 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel__sessionRuntimeErrored_, *MEMORY[0x1E0C8A1B8], 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel__previewStarted_, *MEMORY[0x1E0C8A1D8], 0);
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  }
  return v19;
}

- (CAMTimelapseController)init
{
  -[CAMTimelapseController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMTimelapseController initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:](self, "initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:", 0, 0, 0, 0, 0, 0, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  ct_green_tea_logger_destroy();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[CAMTimelapseController _teardownCaptureTimer](self, "_teardownCaptureTimer");
  v5.receiver = self;
  v5.super_class = (Class)CAMTimelapseController;
  -[CAMTimelapseController dealloc](&v5, sel_dealloc);
}

- (void)_prepareForTimelapseCaptureSetModeAndDevice:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ensureConnectionToDaemon");
  -[CAMTimelapseController _captureController](self, "_captureController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMTimelapseController _graphConfigurationForCurrentState](self, "_graphConfigurationForCurrentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:", v6, 0, 1.0, 0.0);

  }
  -[CAMTimelapseController _graphConfigurationForCurrentState](self, "_graphConfigurationForCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "devicePosition");

  objc_msgSend(v5, "setCapturingTimelapse:forDevicePosition:", 1, v8);
  -[CAMTimelapseController _updateFocusAndExposureForStartCapturing](self, "_updateFocusAndExposureForStartCapturing");
  -[CAMTimelapseController _startCaptureTimer](self, "_startCaptureTimer");

}

- (BOOL)startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  uint64_t v4;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;
  uint8_t v12[16];

  v4 = a4;
  v7 = -[CAMTimelapseController isCapturing](self, "isCapturing");
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Error: trying to start timelapse capture when already in progress", v12, 2u);
    }

    v9 = -[CAMTimelapseState captureOrientation](self->__state, "captureOrientation");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timelapseController:startedWithCaptureOrientation:", self, v9);

  }
  else
  {
    -[CAMTimelapseController _startCapturingWithCaptureDevice:captureSession:](self, "_startCapturingWithCaptureDevice:captureSession:", a3, v4);
  }
  return !v7;
}

- (BOOL)stopCapturingWithReasons:(int64_t)a3
{
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Stopping timelapse capture with reasons %ld", (uint8_t *)&v9, 0xCu);
  }

  v6 = -[CAMTimelapseController isCapturing](self, "isCapturing");
  if (v6)
  {
    -[CAMTimelapseController _stopCapturingWithReasons:](self, "_stopCapturingWithReasons:", a3);
  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Error: trying to stop timelapse capture when none in progress", (uint8_t *)&v9, 2u);
    }

  }
  return v6;
}

- (void)_startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[CAMTimelapseController _setNewCaptureStateForCaptureDevice:captureSession:](self, "_setNewCaptureStateForCaptureDevice:captureSession:", a3, a4);
  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseController _state](self, "_state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preferHEVC");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CAMTimelapseController__startCapturingWithCaptureDevice_captureSession___block_invoke;
  v9[3] = &unk_1EA32D8E8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[CAMTimelapseController _reserveDiskSpaceForTimelapseUUID:preferHEVC:withCompletionBlock:](self, "_reserveDiskSpaceForTimelapseUUID:preferHEVC:withCompletionBlock:", v8, v7, v9);

}

void __74__CAMTimelapseController__startCapturingWithCaptureDevice_captureSession___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD **)(a1 + 32);
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v4, "_prepareForTimelapseCaptureSetModeAndDevice:", 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_greenTeaLogger");
      getCTGreenTeaOsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_INFO, "Take a video", buf, 2u);
      }

      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v8;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Starting timelapse capture for %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_nebulaDaemonProxyManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startTimelapseWithUUID:", *(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "captureOrientation");
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(WeakRetained, "timelapseController:startedWithCaptureOrientation:", *(_QWORD *)(a1 + 32), v10);

    }
    else
    {
      v12 = (void *)v4[5];
      v4[5] = 0;

      objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedGraphConfiguration");
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(v13, "timelapseControllerStopped:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_stopCapturingWithReasons:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  CAMTimelapseState *state;
  void *v8;
  void *v9;
  double Current;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CAMTimelapseState *v29;
  CAMTimelapseState *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id WeakRetained;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v6;
    v46 = 2048;
    v47 = a3;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Stopping timelapse capture for %{public}@, reason %ld", buf, 0x16u);

  }
  -[CAMTimelapseController _teardownCaptureTimer](self, "_teardownCaptureTimer");
  state = self->__state;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState addStopReasons:stopTime:](state, "addStopReasons:stopTime:", a3, v8);

  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  if (-[NSCountedSet countForObject:](self->__inFlightTimelapseUUIDs, "countForObject:", v9))
  {
    if (objc_msgSend(v9, "length"))
      -[NSMutableSet addObject:](self->__pendingCompletedStates, "addObject:", self->__state);
  }
  else
  {
    -[CAMTimelapseState setAllFramesWritten:](self->__state, "setAllFramesWritten:", 1);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v11 = (void *)MEMORY[0x1E0C99E98];
  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMPersistenceController uniqueIncomingPathForAssetWithUUID:captureTime:extension:](CAMPersistenceController, "uniqueIncomingPathForAssetWithUUID:captureTime:extension:", v12, CFSTR("MDATA"), Current);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  -[CAMTimelapseController _persistenceController](self, "_persistenceController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v39, "sharedLibraryMode");
  -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "acquiredSignalResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identitiesInProximity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLibrarySelectionIdentityContactIdentifiersForIdentities(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "librarySelectionDiagnostics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v14;
  LODWORD(v14) = objc_msgSend(v15, "writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:", v14, 0, v16, v20, v22);

  if ((_DWORD)v14)
    -[CAMTimelapseState setLocalPrivateMetadataFileURL:](self->__state, "setLocalPrivateMetadataFileURL:", v41);
  -[CAMTimelapseController _saveStateToDisk:](self, "_saveStateToDisk:", self->__state);
  -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateTimelapseWithUUID:", v24);

  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stopTimelapseWithUUID:", v25);

  if (-[CAMTimelapseState allFramesWritten](self->__state, "allFramesWritten"))
    objc_msgSend(v23, "closeConnectionToDaemon");
  v26 = -[CAMTimelapseState nextFrameIndex](self->__state, "nextFrameIndex");
  v27 = -[CAMTimelapseState sessionIdentifier](self->__state, "sessionIdentifier");
  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self->__state;
  v30 = self->__state;
  self->__state = 0;

  -[CAMTimelapseController _invalidateCachedGraphConfiguration](self, "_invalidateCachedGraphConfiguration");
  -[CAMTimelapseController _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:](self, "_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:", 0);
  -[CAMTimelapseController _captureController](self, "_captureController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[CAMTimelapseState captureDevice](v29, "captureDevice");
  v33 = 0;
  if ((unint64_t)(v32 - 1) <= 0xA)
    v33 = qword_1DB9A76F0[v32 - 1];
  objc_msgSend(v31, "setCapturingTimelapse:forDevicePosition:", 0, v33);
  if (v26 < 1)
  {
    v34 = 0;
    goto LABEL_17;
  }
  objc_msgSend((id)objc_opt_class(), "createPlaceholderResultForTimelapseState:", v29);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
LABEL_17:
    v36 = 0;
    goto LABEL_18;
  }
  -[CAMTimelapseController _persistenceController](self, "_persistenceController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke;
  v42[3] = &unk_1EA32D910;
  v42[4] = self;
  v34 = v34;
  v43 = v34;
  objc_msgSend(v35, "persistPlaceholderTimelapseVideoWithResult:completionHandler:", v34, v42);
  -[CAMTimelapseController _createThumbnailImageFromPlaceholderResult:](self, "_createThumbnailImageFromPlaceholderResult:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "timelapseController:generatedPlaceholderResult:withThumbnailImage:forAssetUUID:inCaptureSession:", self, v34, v36, v28, v27);

  v38 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v38, "timelapseControllerStopped:", self);

}

void __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  pl_dispatch_async();

}

void __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "timelapseController:persistedPlaceholderResult:error:", a1[4], a1[5], a1[6]);

}

- (void)_setNewCaptureStateForCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  CAMTimelapseState *v14;
  CAMTimelapseState *state;
  CAMTimelapseState *v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[5];

  v18 = a4;
  -[CAMTimelapseController _motionController](self, "_motionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "captureOrientation");
  -[CAMTimelapseController _captureController](self, "_captureController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", 0, 5, 0, 0, 0);
  v11 = 0;
  if ((unint64_t)(a3 - 1) <= 0xA)
    v11 = qword_1DB9A76F0[a3 - 1];
  v12 = v10 == 1;
  v13 = objc_msgSend(v9, "mirrorCameraCapturesForDevicePosition:mode:", v11, 5);
  v14 = objc_alloc_init(CAMTimelapseState);
  state = self->__state;
  self->__state = v14;

  v16 = self->__state;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState setStartTime:](v16, "setStartTime:", v17);

  -[CAMTimelapseState setCaptureOrientation:](self->__state, "setCaptureOrientation:", v7);
  -[CAMTimelapseState setCaptureMirrored:](self->__state, "setCaptureMirrored:", v13);
  -[CAMTimelapseState setCaptureDevice:](self->__state, "setCaptureDevice:", a3);
  -[CAMTimelapseState setSessionIdentifier:](self->__state, "setSessionIdentifier:", v18);
  -[CAMTimelapseState setPreferHEVC:](self->__state, "setPreferHEVC:", v12);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__CAMTimelapseController__setNewCaptureStateForCaptureDevice_captureSession___block_invoke;
  v19[3] = &unk_1EA32D938;
  v19[4] = self;
  objc_msgSend(v8, "queryTimelapseDimensionsWithCompletionBlock:", v19);
  -[CAMTimelapseController _invalidateCachedGraphConfiguration](self, "_invalidateCachedGraphConfiguration");

}

uint64_t __77__CAMTimelapseController__setNewCaptureStateForCaptureDevice_captureSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setNominalIntermediateFrameSize:", (double)a2, (double)a3);
}

- (CAMCaptureGraphConfiguration)_graphConfigurationForCurrentState
{
  CAMTimelapseState *state;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  CAMCaptureGraphConfiguration *v16;
  CAMCaptureGraphConfiguration *graphConfigurationForCurrentState;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  state = self->__state;
  if (state)
  {
    if (!self->__graphConfigurationForCurrentState)
    {
      v4 = -[CAMTimelapseState captureDevice](state, "captureDevice");
      +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "photoEncodingBehavior");
      v7 = objc_msgSend(v5, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", 0, 5, 0, 0, 0);
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0;
      v11 = v4 - 1;
      if ((unint64_t)(v4 - 1) <= 0xA)
        v10 = qword_1DB9A76F0[v11];
      v12 = objc_msgSend(v8, "maxSupportedPhotoQualityPrioritizationForMode:devicePosition:", 5, v10);

      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shouldSuspendVideoHDRForHDRMode:captureMode:", 0, 5);

      v15 = 0;
      if (v11 <= 0xA)
        v15 = qword_1DB9A76F0[v11];
      BYTE2(v24) = 0;
      LOWORD(v24) = 0;
      LOWORD(v23) = 0;
      BYTE2(v22) = 0;
      LOWORD(v22) = 0;
      LOWORD(v21) = objc_msgSend(v5, "mirrorCameraCapturesForDevicePosition:mode:", v15, 5);
      BYTE1(v20) = v14;
      LOBYTE(v20) = 0;
      LOBYTE(v19) = 0;
      v16 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:]([CAMCaptureGraphConfiguration alloc], "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", 5, v4, 0, 0, 0, 0, v19, 1, 0, 0, 0,
              v6,
              v7,
              v20,
              0,
              v12,
              v21,
              0,
              0,
              v22,
              0,
              0,
              objc_msgSend(v5, "colorSpaceForMode:videoConfiguration:videoEncodingBehavior:spatialVideoEnabled:device:", 5, 0, v7, 0, v4), v23, 0, v24);
      graphConfigurationForCurrentState = self->__graphConfigurationForCurrentState;
      self->__graphConfigurationForCurrentState = v16;

    }
  }
  else
  {
    -[CAMTimelapseController _invalidateCachedGraphConfiguration](self, "_invalidateCachedGraphConfiguration");
  }
  return self->__graphConfigurationForCurrentState;
}

- (void)_invalidateCachedGraphConfiguration
{
  CAMCaptureGraphConfiguration *graphConfigurationForCurrentState;

  graphConfigurationForCurrentState = self->__graphConfigurationForCurrentState;
  self->__graphConfigurationForCurrentState = 0;

}

- (void)_restoreCaptureStateFromDisk
{
  void *v3;
  void *v4;
  id v5;

  +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:](CAMTimelapseDiskUtilities, "readSortedStatesFromDiskMergeSecondaryState:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "canContinueCapture"))
  {
    objc_storeStrong((id *)&self->__state, v4);
    -[CAMTimelapseController _invalidateCachedGraphConfiguration](self, "_invalidateCachedGraphConfiguration");
  }

}

- (void)_reserveDiskSpaceForTimelapseUUID:(id)a3 preferHEVC:(BOOL)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[CAMTimelapseController _captureController](self, "_captureController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke;
  v13[3] = &unk_1EA32D960;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "queryTimelapseDimensionsWithCompletionBlock:", v13);

}

uint64_t __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t result;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((objc_msgSend(*(id *)(a1 + 32), "isCapturing") & 1) != 0)
  {
    if (!a4 || !a5)
    {
      v10 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Failed to query video dimensions, falling back to 1080p, assuming no overscan", buf, 2u);
      }

      a4 = 1920;
      a5 = 1080;
    }
    v11 = (void *)MEMORY[0x1E0D731D8];
    NSHomeDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "diskSpaceAvailableForPath:", v12);

    +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "minAvailableBytesNeededForCaptureForWidth:height:useHEVC:", a4, a5, *(unsigned __int8 *)(a1 + 56));

    v17 = v13 < 0 || v15 <= v13;
    if (v17)
    {
      v18 = dispatch_queue_create("com.apple.camera.timelapse", 0);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke_160;
      v21[3] = &unk_1EA32BFF0;
      v22 = *(id *)(a1 + 40);
      v23 = a2;
      v24 = a3;
      v25 = *(_BYTE *)(a1 + 56);
      dispatch_async(v18, v21);

    }
    else
    {
      v20 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v27 = v15;
        v28 = 2048;
        v29 = v13;
        _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Not enough storage to start capture: %lld needed, %lld available", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_notifyInsufficientDiskSpaceForStartingCaptureWithNeededBytes:availableBytes:", v15, v13);
    }
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _BOOL8))(result + 16))(result, 0, v17);
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  }
  return result;
}

BOOL __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke_160(uint64_t a1)
{
  return +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:width:height:useHEVC:](CAMTimelapseDiskUtilities, "reserveDummyFileForTimelapseUUID:width:height:useHEVC:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (NSDate)captureStartTime
{
  void *v3;

  if (-[CAMTimelapseController isCapturing](self, "isCapturing"))
  {
    -[CAMTimelapseState startTime](self->__state, "startTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)_startCaptureTimer
{
  double v3;
  long double v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *captureTimer;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD handler[5];
  uint8_t buf[4];
  long double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->__captureTimer)
    -[CAMTimelapseController _teardownCaptureTimer](self, "_teardownCaptureTimer");
  -[CAMTimelapseState captureTimeInterval](self->__state, "captureTimeInterval");
  v4 = v3;
  if (v3 <= 0.0)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v4;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Error: invalid captureTimeInterval: %f", buf, 0xCu);
    }
  }
  else
  {
    self->__ignoringTimerCallbacksForTearDown = 0;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timelapseFirstShotDelay");
    v7 = v6;

    -[CAMTimelapseState startTime](self->__state, "startTime");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateByAddingTimeInterval:](v8, "dateByAddingTimeInterval:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;
    if (v10 <= 0.0)
      v11 = v4 - fmod(-v10, v4);
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    captureTimer = self->__captureTimer;
    self->__captureTimer = v12;

    v14 = self->__captureTimer;
    if (v14)
    {
      v15 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      dispatch_source_set_timer(v14, v15, (unint64_t)(v4 * 1000000000.0), 0);
      v16 = self->__captureTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __44__CAMTimelapseController__startCaptureTimer__block_invoke;
      handler[3] = &unk_1EA328868;
      handler[4] = self;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_resume((dispatch_object_t)self->__captureTimer);
    }

  }
}

void __44__CAMTimelapseController__startCaptureTimer__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    if (!v2[9])
      return;
  }
  else if (!v2[9])
  {
    objc_msgSend(v2, "_captureTimerFired");
    return;
  }
  v3 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring timelapse capture because we're waiting for capture response", v4, 2u);
  }

}

- (void)_teardownCaptureTimer
{
  NSObject *captureTimer;
  OS_dispatch_source *v4;

  self->__ignoringTimerCallbacksForTearDown = 1;
  captureTimer = self->__captureTimer;
  if (captureTimer)
  {
    dispatch_source_cancel(captureTimer);
    v4 = self->__captureTimer;
    self->__captureTimer = 0;

  }
}

- (void)_captureTimerFired
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Error: failed to enqueue capture request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (BOOL)_canCapturePhoto
{
  void *v3;
  char v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;

  -[CAMTimelapseController _captureController](self, "_captureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInterrupted");
  v5 = objc_msgSend(v3, "isCaptureAvailable");
  v6 = -[CAMTimelapseController _isFocusAndExposureAdjusted](self, "_isFocusAndExposureAdjusted");
  -[CAMTimelapseController _storageController](self, "_storageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseController _graphConfigurationForCurrentState](self, "_graphConfigurationForCurrentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:", v8, 1);

  return v5 & ~v4 & v6 & v9;
}

- (BOOL)_enqueueCaptureRequest
{
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CAMTimelapseController _stillImageCaptureRequestWithCurrentSettings](self, "_stillImageCaptureRequestWithCurrentSettings");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setTimelapseIdentifier:](v4, "setTimelapseIdentifier:", v3);
    -[NSCountedSet addObject:](self->__inFlightTimelapseUUIDs, "addObject:", v3);
    -[CAMTimelapseController _captureController](self, "_captureController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v6 = objc_msgSend(v5, "captureStillImageWithRequest:error:", v4, &v15);

  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseController _enqueueCaptureRequest].cold.1(v4, v7, v8, v9, v10, v11, v12, v13);
    v6 = 0;
  }

  return v6;
}

- (id)_stillImageCaptureRequestWithCurrentSettings
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CAMMutableStillImageCaptureRequest *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = -[CAMTimelapseState captureOrientation](self->__state, "captureOrientation");
  v4 = -[CAMTimelapseState captureDevice](self->__state, "captureDevice");
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseState filePathForNextFrameIndex](self->__state, "filePathForNextFrameIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 0xA)
    v11 = 0;
  else
    v11 = qword_1DB9A76F0[v10];
  v12 = objc_msgSend(v8, "maxSupportedPhotoQualityPrioritizationForMode:devicePosition:", 5, v11);

  v13 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  -[CAMMutableStillImageCaptureRequest setDelegate:](v13, "setDelegate:", self);
  -[CAMMutableStillImageCaptureRequest setPersistenceOptions:](v13, "setPersistenceOptions:", 1);
  -[CAMMutableStillImageCaptureRequest setLocalDestinationURL:](v13, "setLocalDestinationURL:", v7);
  -[CAMMutableStillImageCaptureRequest setCaptureOrientation:](v13, "setCaptureOrientation:", v3);
  if (v10 > 0xA)
    v14 = 0;
  else
    v14 = qword_1DB9A76F0[v10];
  -[CAMMutableStillImageCaptureRequest setCaptureMirrored:](v13, "setCaptureMirrored:", objc_msgSend(v5, "mirrorCameraCapturesForDevicePosition:mode:", v14, 5));
  -[CAMMutableStillImageCaptureRequest setCaptureDevice:](v13, "setCaptureDevice:", v4);
  -[CAMMutableStillImageCaptureRequest setFlashMode:](v13, "setFlashMode:", 0);
  -[CAMMutableStillImageCaptureRequest setHdrMode:](v13, "setHdrMode:", 0);
  -[CAMMutableStillImageCaptureRequest setIrisMode:](v13, "setIrisMode:", 0);
  -[CAMMutableStillImageCaptureRequest setPhotoQualityPrioritization:](v13, "setPhotoQualityPrioritization:", v12);
  -[CAMMutableStillImageCaptureRequest setWantsAudioForCapture:](v13, "setWantsAudioForCapture:", 0);
  -[CAMMutableStillImageCaptureRequest setWantsHighResolutionStills:](v13, "setWantsHighResolutionStills:", 0);
  -[CAMMutableStillImageCaptureRequest setStillDuringVideo:](v13, "setStillDuringVideo:", 0);
  -[CAMMutableStillImageCaptureRequest setWantsSemanticSceneFilter:](v13, "setWantsSemanticSceneFilter:", 0);
  -[CAMMutableStillImageCaptureRequest setPhotoEncodingBehavior:](v13, "setPhotoEncodingBehavior:", 0);
  -[CAMTimelapseController _locationController](self, "_locationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[CAMMutableStillImageCaptureRequest setLocation:](v13, "setLocation:", v16);
  if (objc_msgSend(v5, "sharedLibraryEnabled"))
  {
    -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMMutableStillImageCaptureRequest setSharedLibraryMode:](v13, "setSharedLibraryMode:", objc_msgSend(v17, "sharedLibraryMode"));

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isInternalInstall");

    if (v19)
    {
      -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "librarySelectionDiagnostics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMMutableStillImageCaptureRequest setSharedLibraryDiagnostics:](v13, "setSharedLibraryDiagnostics:", v21);

    }
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "peopleProximityPersistenceSupported");

    if (v23)
    {
      -[CAMTimelapseController _librarySelectionController](self, "_librarySelectionController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "acquiredSignalResults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "identitiesInProximity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      CAMLibrarySelectionIdentityContactIdentifiersForIdentities(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMMutableStillImageCaptureRequest setContactIDsInProximity:](v13, "setContactIDsInProximity:", v27);

    }
  }

  return v13;
}

- (void)_updateFocusAndExposureForStartCapturing
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  BOOL v10;
  id v11;
  double v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  id location;

  -[CAMTimelapseController _setFocusAndExposureAdjusted:](self, "_setFocusAndExposureAdjusted:", 0);
  -[CAMTimelapseController lastFocusResult](self, "lastFocusResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPerformingContrastDetection"))
  {
    -[CAMTimelapseController _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:](self, "_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:", 1);
  }
  else
  {
    -[CAMTimelapseController _captureController](self, "_captureController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTimelapseState focusLensPosition](self->__state, "focusLensPosition");
    v6 = v5;
    -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    +[CUCaptureController focusLensPositionCurrentSentinel](CUCaptureController, "focusLensPositionCurrentSentinel");
    v10 = v6 == v9;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CAMTimelapseController__updateFocusAndExposureForStartCapturing__block_invoke;
    v13[3] = &unk_1EA32D988;
    objc_copyWeak(&v15, &location);
    v11 = v8;
    v14 = v11;
    v16 = v10;
    *(float *)&v12 = v6;
    objc_msgSend(v4, "lockFocusAtLensPosition:completionBlock:", v13, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __66__CAMTimelapseController__updateFocusAndExposureForStartCapturing__block_invoke(uint64_t a1, float a2)
{
  id *v4;
  id WeakRetained;
  double v6;
  id v7;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setFocusAndExposureAdjusted:", 1);

  v7 = objc_loadWeakRetained(v4);
  *(float *)&v6 = a2;
  objc_msgSend(v7, "_updateFocusLensPosition:forTimelapseUUID:forceUpdate:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), v6);

}

- (void)_updateFocusLensPosition:(float)a3 forTimelapseUUID:(id)a4 forceUpdate:(BOOL)a5
{
  CAMTimelapseState *state;
  id v8;
  void *v9;
  int v10;
  float v11;
  float v12;
  float v13;
  double v14;
  void *v15;
  id v16;

  state = self->__state;
  v8 = a4;
  -[CAMTimelapseState timelapseUUID](state, "timelapseUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if (v10)
  {
    +[CUCaptureController focusLensPositionCurrentSentinel](CUCaptureController, "focusLensPositionCurrentSentinel");
    v12 = v11;
    -[CAMTimelapseState focusLensPosition](self->__state, "focusLensPosition");
    if (v13 == v12)
    {
      -[CAMTimelapseState focusLensPosition](self->__state, "focusLensPosition");
      if (*(float *)&v14 != a3)
      {
        *(float *)&v14 = a3;
        -[CAMTimelapseState setFocusLensPosition:](self->__state, "setFocusLensPosition:", v14);
        -[CAMTimelapseController _saveStateToDisk:](self, "_saveStateToDisk:", self->__state);
        -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateTimelapseWithUUID:", v15);

      }
    }
  }
}

- (void)_saveStateToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "timelapseUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v4, "canContinueCapture"))
    {
      +[CAMTimelapseDiskUtilities readSecondaryStateForTimelapseUUID:](CAMTimelapseDiskUtilities, "readSecondaryStateForTimelapseUUID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mergeSecondaryState:", v6);
      v7 = objc_msgSend(v4, "canContinueCapture");

      +[CAMTimelapseDiskUtilities writeStateToDisk:createDirectoryIfNeeded:](CAMTimelapseDiskUtilities, "writeStateToDisk:createDirectoryIfNeeded:", v4, 1);
      if ((v7 & 1) == 0)
        -[CAMTimelapseController _stopCapturingWithReasons:](self, "_stopCapturingWithReasons:", 0);
    }
    else
    {
      +[CAMTimelapseDiskUtilities writeStateToDisk:createDirectoryIfNeeded:](CAMTimelapseDiskUtilities, "writeStateToDisk:createDirectoryIfNeeded:", v4, 1);
    }
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Error: cannot save state without timelapseUUID", v9, 2u);
    }

  }
}

- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t *v21;
  CAMTimelapseState *v22;
  void *v23;
  NSMutableSet *pendingCompletedStates;
  void *v25;
  int v26;
  uint64_t *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, _BYTE *);
  void *v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->__ignoringTimerCallbacksWaitingForCaptureResponse)
    self->__ignoringTimerCallbacksWaitingForCaptureResponse = 0;
  v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CAMTimelapseController stillImageRequestDidCompleteStillImageCapture:withResponse:error:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  if (!v10)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__15;
    v47 = __Block_byref_object_dispose__15;
    v48 = 0;
    objc_msgSend(v8, "timelapseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length")
      && (-[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v18, "isEqualToString:", v19),
          v19,
          v20))
    {
      v21 = v44;
      v22 = self->__state;
      v23 = (void *)v21[5];
      v21[5] = (uint64_t)v22;
    }
    else
    {
      pendingCompletedStates = self->__pendingCompletedStates;
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __91__CAMTimelapseController_stillImageRequestDidCompleteStillImageCapture_withResponse_error___block_invoke;
      v40 = &unk_1EA32D9B0;
      v41 = v18;
      v42 = &v43;
      -[NSMutableSet enumerateObjectsUsingBlock:](pendingCompletedStates, "enumerateObjectsUsingBlock:", &v37);
      v23 = v41;
    }

    v25 = (void *)v44[5];
    if (v25)
    {
      v26 = objc_msgSend(v25, "incrementFrameIndex");
      v27 = v44;
      if (v26 && (CAMTimelapseState *)v44[5] == self->__state)
      {
        -[CAMTimelapseController _state](self, "_state");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "captureTimeInterval");
        v30 = v29;

        -[CAMTimelapseController _captureController](self, "_captureController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 1.0 / v30;
        *(float *)&v32 = 1.0 / v30;
        objc_msgSend(v31, "changeToTimelapseCaptureRate:", v32);

        -[CAMTimelapseController _startCaptureTimer](self, "_startCaptureTimer");
        v27 = v44;
      }
      v33 = (void *)v27[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v37, v38, v39, v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLastFrameResponseTime:", v34);

      -[CAMTimelapseController _saveStateToDisk:](self, "_saveStateToDisk:", v44[5]);
      -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v44[5], "timelapseUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateTimelapseWithUUID:", v36);

    }
    _Block_object_dispose(&v43, 8);

  }
}

void __91__CAMTimelapseController_stillImageRequestDidCompleteStillImageCapture_withResponse_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "timelapseUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)stillImageRequestDidCompleteStillImageLocalPersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableSet *pendingCompletedStates;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, _BYTE *);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CAMTimelapseController stillImageRequestDidCompleteStillImageLocalPersistence:withResponse:error:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend(v8, "timelapseIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    -[NSCountedSet removeObject:](self->__inFlightTimelapseUUIDs, "removeObject:", v18);
    -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishCaptureForTimelapseWithUUID:", v18);
    if (!-[NSCountedSet countForObject:](self->__inFlightTimelapseUUIDs, "countForObject:", v18))
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__15;
      v36 = __Block_byref_object_dispose__15;
      v37 = 0;
      pendingCompletedStates = self->__pendingCompletedStates;
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __100__CAMTimelapseController_stillImageRequestDidCompleteStillImageLocalPersistence_withResponse_error___block_invoke;
      v29 = &unk_1EA32D9B0;
      v30 = v18;
      v31 = &v32;
      -[NSMutableSet enumerateObjectsUsingBlock:](pendingCompletedStates, "enumerateObjectsUsingBlock:", &v26);
      v21 = (void *)v33[5];
      if (v21)
      {
        objc_msgSend(v21, "setAllFramesWritten:", 1, v26, v27, v28, v29);
        -[CAMTimelapseController _saveStateToDisk:](self, "_saveStateToDisk:", v33[5]);
        -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v33[5], "timelapseUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateTimelapseWithUUID:", v23);

        objc_msgSend(v22, "closeConnectionToDaemon");
        -[NSMutableSet removeObject:](self->__pendingCompletedStates, "removeObject:", v33[5]);

      }
      _Block_object_dispose(&v32, 8);

    }
  }
  -[CAMTimelapseController _storageController](self, "_storageController", v26, v27, v28, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseController _graphConfigurationForCurrentState](self, "_graphConfigurationForCurrentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:", v25, 1);

}

void __100__CAMTimelapseController_stillImageRequestDidCompleteStillImageLocalPersistence_withResponse_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "timelapseUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)_createThumbnailImageFromPlaceholderResult:(id)a3
{
  uint64_t v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a3, "previewImageSurface") && (v3 = PLCreateImageFromPreviewImageSurface()) != 0)
  {
    v4 = (const void *)v3;
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)createPlaceholderResultForTimelapseState:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CAMTimelapsePlaceholderResult *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;

  v4 = a3;
  v5 = objc_msgSend(a1, "_newVideoPreviewSurfaceForTimelapseState:", v4);
  if (v5)
  {
    v6 = (const void *)v5;
    objc_msgSend(v4, "timelapseUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "captureOrientation");
    v10 = v9;
    v11 = objc_msgSend(v4, "captureDevice");
    objc_msgSend(v4, "nominalIntermediateFrameSize");
    if (v9 > 4)
    {
      v15 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      v14 = v13;
      if (((1 << v9) & 0x19) != 0)
      {
        v15 = v12;
      }
      else
      {
        v15 = v13;
        v14 = v12;
      }
    }
    objc_msgSend(v4, "startTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "timeIntervalSinceDate:", v17);
    v20 = v19;
    objc_msgSend(v4, "localPrivateMetadataFileURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CAMTimelapsePlaceholderResult initWithAssetUUID:captureSession:creationDate:captureOrientation:captureDevice:videoDimensions:duration:previewImageSurface:localPrivateMetadataFileURL:]([CAMTimelapsePlaceholderResult alloc], "initWithAssetUUID:captureSession:creationDate:captureOrientation:captureDevice:videoDimensions:duration:previewImageSurface:localPrivateMetadataFileURL:", v7, objc_msgSend(v4, "sessionIdentifier"), v8, v10, v11, v6, v15, v14, v20, v21);
    CFRelease(v6);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (__IOSurface)_newVideoPreviewSurfaceForTimelapseState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  __CVBuffer *v18;
  __CVBuffer *v19;
  IOSurfaceRef IOSurface;
  __IOSurface *v21;
  NSObject *v22;
  int v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CAMTimelapseDiskUtilities fileNameForImageFrameIndex:](CAMTimelapseDiskUtilities, "fileNameForImageFrameIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timelapseUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((v9 & 1) == 0)
  {
    v10 = os_log_create("com.apple.camera", "Nebula");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      v21 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v3, "timelapseUUID");
    v22 = objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v22;
    _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "First frame not found for timelapse %{public}@", (uint8_t *)&v24, 0xCu);
LABEL_13:

    goto LABEL_14;
  }
  v10 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:", v7);
  if (!v10)
  {
    v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[CAMTimelapseController _newVideoPreviewSurfaceForTimelapseState:].cold.1(v3, v22);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  objc_msgSend(v11, "bounds");
  v16 = v15 * v13;
  if (v14 * v13 >= v16)
    v16 = v14 * v13;
  v17 = vcvtpd_s64_f64(v16);
  objc_msgSend(v3, "nominalIntermediateFrameSize");
  v18 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:", v10, 1, v17, 1);
  if (v18)
  {
    v19 = v18;
    IOSurface = CVPixelBufferGetIOSurface(v18);
    v21 = IOSurface;
    if (IOSurface)
      CFRetain(IOSurface);
    CVPixelBufferRelease(v19);
  }
  else
  {
    v21 = 0;
  }

LABEL_17:
  return v21;
}

- (void)_sessionRuntimeErrored:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C8A138]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMTimelapseController _resetIgnoringTimerCallbacksWaitingForCaptureResponse](self, "_resetIgnoringTimerCallbacksWaitingForCaptureResponse");
    -[CAMTimelapseController _setPreviewStarted:](self, "_setPreviewStarted:", 0);
  }

}

- (void)_notifyInsufficientDiskSpaceForStartingCaptureWithNeededBytes:(int64_t)a3 availableBytes:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3 / 0x100000;
  v6 = a4 / 0x100000;
  CAMLocalizedFrameworkString(CFSTR("TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_START_TITLE"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  CAMLocalizedFrameworkString(CFSTR("TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_START_MESSAGE_FORMAT_NEEDEDMB_AVAILABLEMB"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d%d"), 0, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("CAMTimelapseLowDiskSpaceTitleInfo");
  v13[1] = CFSTR("CAMTimelapseLowDiskSpaceMessageInfo");
  v14[0] = v7;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("CAMTimelapseLowDiskSpaceNotification"), self, v11);

}

- (void)_notifyInsufficientDiskSpaceForContinuingCapture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  CAMLocalizedFrameworkString(CFSTR("TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_CONTINUE_TITLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_CONTINUE_MESSAGE"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("CAMTimelapseLowDiskSpaceTitleInfo");
  v7[1] = CFSTR("CAMTimelapseLowDiskSpaceMessageInfo");
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CAMTimelapseLowDiskSpaceNotification"), self, v5);

}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[CAMTimelapseController _setBackendRecoveryNeeded:](self, "_setBackendRecoveryNeeded:", 1);
}

- (void)_updateLocationIfNecessary
{
  CAMTimelapseState *state;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  state = self->__state;
  if (state)
  {
    -[CAMTimelapseState startLocation](state, "startLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[CAMTimelapseController _locationController](self, "_locationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLocation");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[CAMTimelapseState setStartLocation:](self->__state, "setStartLocation:", v9);
        -[CAMTimelapseController _saveStateToDisk:](self, "_saveStateToDisk:", self->__state);
        -[CAMTimelapseController _nebulaDaemonProxyManager](self, "_nebulaDaemonProxyManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMTimelapseState timelapseUUID](self->__state, "timelapseUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateTimelapseWithUUID:", v7);

        -[CAMTimelapseController _captureController](self, "_captureController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notifyTimelapseControllerFinishedUpdatingWithLocation");

      }
      v4 = v9;
    }

  }
}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  if (-[CAMTimelapseController isCapturing](self, "isCapturing"))
    -[CAMTimelapseController stopCapturingWithReasons:](self, "stopCapturingWithReasons:", a3);
}

- (CAMTimelapseControllerDelegate)delegate
{
  return (CAMTimelapseControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMFocusResult)lastFocusResult
{
  return self->_lastFocusResult;
}

- (CAMTimelapseState)_state
{
  return self->__state;
}

- (OS_dispatch_source)_captureTimer
{
  return self->__captureTimer;
}

- (BOOL)_ignoringTimerCallbacksForTearDown
{
  return self->__ignoringTimerCallbacksForTearDown;
}

- (BOOL)_ignoringTimerCallbacksWaitingForCaptureResponse
{
  return self->__ignoringTimerCallbacksWaitingForCaptureResponse;
}

- (NSCountedSet)_inFlightTimelapseUUIDs
{
  return self->__inFlightTimelapseUUIDs;
}

- (NSMutableSet)_pendingCompletedStates
{
  return self->__pendingCompletedStates;
}

- (void)_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:(BOOL)a3
{
  self->__shouldUpdateFocusAndExposureWhenContrastDetectionCompletes = a3;
}

- (ct_green_tea_logger_s)_greenTeaLogger
{
  return self->__greenTeaLogger;
}

- (BOOL)_isFocusAndExposureAdjusted
{
  return self->__focusAndExposureAdjusted;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMStorageController)_storageController
{
  return self->__storageController;
}

- (CAMLibrarySelectionController)_librarySelectionController
{
  return self->__librarySelectionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->__librarySelectionController, 0);
  objc_storeStrong((id *)&self->__storageController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->__pendingCompletedStates, 0);
  objc_storeStrong((id *)&self->__inFlightTimelapseUUIDs, 0);
  objc_storeStrong((id *)&self->__captureTimer, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__graphConfigurationForCurrentState, 0);
}

- (void)_enqueueCaptureRequest
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Error: cannot enqueue request with no timelapseUUID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)stillImageRequestDidCompleteStillImageCapture:(uint64_t)a3 withResponse:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Generated timelapse capture response (%{public}@)", a5, a6, a7, a8, 2u);
}

- (void)stillImageRequestDidCompleteStillImageLocalPersistence:(uint64_t)a3 withResponse:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Finished writing timelapse capture response (%{public}@)", a5, a6, a7, a8, 2u);
}

+ (void)_newVideoPreviewSurfaceForTimelapseState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timelapseUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Error creating video preview surface for timelapse %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
