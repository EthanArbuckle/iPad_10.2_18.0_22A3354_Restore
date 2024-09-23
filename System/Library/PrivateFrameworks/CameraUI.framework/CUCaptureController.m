@implementation CUCaptureController

- (void)_setupFocusAndExposureMonitoring
{
  id v3;

  -[CUCaptureController _setupFocusMonitoring](self, "_setupFocusMonitoring");
  -[CUCaptureController _setupExposureMonitoring](self, "_setupExposureMonitoring");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__subjectAreaDidChange_, *MEMORY[0x1E0C89F50], 0);

}

- (void)_setupFocusMonitoring
{
  void *v3;
  CAMKeyValueCoalescer *v4;
  CAMKeyValueCoalescer *v5;
  CAMKeyValueCoalescer *focusCoalescer;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id location;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = [CAMKeyValueCoalescer alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__CUCaptureController__setupFocusMonitoring__block_invoke;
  v15[3] = &unk_1EA32D4C8;
  objc_copyWeak(&v16, &location);
  v5 = -[CAMKeyValueCoalescer initWithInterval:handler:](v4, "initWithInterval:handler:", v15, 0.05);
  focusCoalescer = self->__focusCoalescer;
  self->__focusCoalescer = v5;

  -[CUCaptureController _focusKVOKeyPaths](self, "_focusKVOKeyPaths");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 3, CAMFocusResultContext, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v8);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (CAMCaptureEngine)_captureEngine
{
  return self->__captureEngine;
}

- (id)_focusKVOKeyPaths
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("currentCameraDevice.focusMode");
  v3[1] = CFSTR("currentCameraDevice.focusPointOfInterest");
  v3[2] = CFSTR("currentCameraDevice.adjustingFocus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupExposureMonitoring
{
  void *v3;
  CAMKeyValueCoalescer *v4;
  CAMKeyValueCoalescer *v5;
  CAMKeyValueCoalescer *exposureCoalescer;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id location;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = [CAMKeyValueCoalescer alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__CUCaptureController__setupExposureMonitoring__block_invoke;
  v15[3] = &unk_1EA32D4C8;
  objc_copyWeak(&v16, &location);
  v5 = -[CAMKeyValueCoalescer initWithInterval:handler:](v4, "initWithInterval:handler:", v15, 0.05);
  exposureCoalescer = self->__exposureCoalescer;
  self->__exposureCoalescer = v5;

  -[CUCaptureController _exposureKVOKeyPaths](self, "_exposureKVOKeyPaths");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 3, CAMExposureResultContext, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v8);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)_exposureKVOKeyPaths
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("currentCameraDevice.exposureMode");
  v3[1] = CFSTR("currentCameraDevice.exposurePointOfInterest");
  v3[2] = CFSTR("currentCameraDevice.exposureTargetBias");
  v3[3] = CFSTR("currentCameraDevice.adjustingExposure");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupSuggestionMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _suggestionKeyPaths](self, "_suggestionKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 3, CAMSuggestionResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_suggestionKeyPaths
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("currentCameraDevice.flashActive");
  v3[1] = CFSTR("currentCameraDevice.torchActive");
  v3[2] = CFSTR("currentStillImageOutput.isHDRScene");
  v3[3] = CFSTR("currentStillImageOutput.digitalFlashStatus");
  v3[4] = CFSTR("currentStillImageOutput.digitalFlashExposureTimes");
  v3[5] = CFSTR("currentCameraDevice.activePrimaryConstituentDevice");
  v3[6] = CFSTR("currentCameraDevice.preferredPrimaryConstituentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupAvailabilityMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _availabilityKeyPaths](self, "_availabilityKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 3, CAMAvailabilityResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_availabilityKeyPaths
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("currentCameraDevice.flashAvailable");
  v7[1] = CFSTR("currentCameraDevice.torchAvailable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFlashMitigationSupported");

  if (v4)
  {
    objc_msgSend(v2, "arrayByAddingObject:", CFSTR("currentCameraDevice.degradedCaptureQualityFactors"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

- (void)_setupZoomMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _zoomMonitoringKeyPaths](self, "_zoomMonitoringKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1, CAMZoomResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_zoomMonitoringKeyPaths
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("currentCameraDevice.videoZoomFactor");
  v3[1] = CFSTR("currentCameraDevice.minAvailableVideoZoomFactor");
  v3[2] = CFSTR("currentCameraDevice.rampingVideoZoom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupSystemPressureStateMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CUCaptureController _shouldMonitorSystemPressureState](self, "_shouldMonitorSystemPressureState"))
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _systemPressureStateMonitoringKeyPaths](self, "_systemPressureStateMonitoringKeyPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 5, CAMSystemPressureStateMonitoringContext);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_shouldMonitorSystemPressureState
{
  void *v2;
  char v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isBackPortraitModeSupported") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isFrontPortraitModeSupported");

  return v3;
}

- (int)_uniqueRequestIDForChangeToModeAndDevice
{
  int *p_uniqueRequestIDForConfigurationChange;
  int result;

  p_uniqueRequestIDForConfigurationChange = &self->_uniqueRequestIDForConfigurationChange;
  do
    result = __ldaxr((unsigned int *)p_uniqueRequestIDForConfigurationChange);
  while (__stlxr(result + 1, (unsigned int *)p_uniqueRequestIDForConfigurationChange));
  return result;
}

- (BOOL)isPreviewDisabled
{
  return self->_previewDisabled;
}

- (BOOL)_wantsMachineReadableCodesForGraphConfiguration:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;

  v3 = a3;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowQRBanners");

  v6 = objc_msgSend(v3, "device");
  return v5 & ((v6 > 0xB) | (0xFDu >> v6));
}

- (void)_setVideoCaptureAvailable:(BOOL)a3
{
  self->__isVideoCaptureAvailable = a3;
}

- (void)setFocusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusDelegate, a3);
}

- (void)setExposureDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_exposureDelegate, a3);
}

- (void)setMachineReadableCodeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_machineReadableCodeDelegate, a3);
}

- (void)setConfigurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configurationDelegate, a3);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionDelegate, a3);
}

- (void)setAvailabilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_availabilityDelegate, a3);
}

- (void)setBurstDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_burstDelegate, a3);
}

- (void)setRecoveryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recoveryDelegate, a3);
}

- (void)setInterruptionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interruptionDelegate, a3);
}

- (void)setRunningDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_runningDelegate, a3);
}

- (void)setZoomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_zoomDelegate, a3);
}

- (void)setStillImageCapturingVideoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stillImageCapturingVideoDelegate, a3);
}

- (void)setShallowDepthOfFieldStatusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shallowDepthOfFieldStatusDelegate, a3);
}

- (void)registerCaptureService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCaptureService:", v4);

}

- (BOOL)isCapturingVideo
{
  return -[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo")
      || -[CUCaptureController isCapturingCTMVideo](self, "isCapturingCTMVideo");
}

- (CAMVideoCaptureRequest)_capturingVideoRequest
{
  return self->__capturingVideoRequest;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return -[CAMCaptureEngine videoPreviewLayer](self->__captureEngine, "videoPreviewLayer");
}

- (BOOL)isFlashAvailable
{
  return self->_flashAvailable;
}

- (BOOL)isCapturingBurst
{
  void *v2;
  BOOL v3;

  -[CUCaptureController currentBurstIntervalometer](self, "currentBurstIntervalometer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAMCaptureRequestIntervalometer)currentBurstIntervalometer
{
  return self->_currentBurstIntervalometer;
}

- (void)pauseCapturingStillImagePairedVideo
{
  _BOOL4 v3;
  void *v4;
  CAMPausePairedVideoRecordingCommand *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = -[CUCaptureController _needsInitialPairedVideoUpdate](self, "_needsInitialPairedVideoUpdate");
  if (!-[CUCaptureController _isCapturingPairedVideoPaused](self, "_isCapturingPairedVideoPaused") || v3)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CAMPausePairedVideoRecordingCommand initWithRecordingPaused:]([CAMPausePairedVideoRecordingCommand alloc], "initWithRecordingPaused:", 1);
    objc_msgSend(v4, "enqueueCommand:", v5);
    -[CUCaptureController _setCapturingPairedVideoPaused:](self, "_setCapturingPairedVideoPaused:", 1);
    -[CUCaptureController _setNeedsInitialPairedVideoUpdate:](self, "_setNeedsInitialPairedVideoUpdate:", 0);
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Paused live photo video capture", v7, 2u);
    }

  }
}

- (BOOL)_needsInitialPairedVideoUpdate
{
  return self->__needsInitialPairedVideoUpdate;
}

- (BOOL)_isCapturingPairedVideoPaused
{
  return self->__capturingPairedVideoPaused;
}

- (void)_setCapturingPairedVideoPaused:(BOOL)a3
{
  self->__capturingPairedVideoPaused = a3;
}

- (void)_setNeedsInitialPairedVideoUpdate:(BOOL)a3
{
  self->__needsInitialPairedVideoUpdate = a3;
}

- (BOOL)isCapturingTimelapse
{
  return self->_capturingTimelapse;
}

- (BOOL)isCapturingPanorama
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _capturingPanoramaRequest](self, "_capturingPanoramaRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAMPanoramaCaptureRequest)_capturingPanoramaRequest
{
  return self->__capturingPanoramaRequest;
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

- (BOOL)isHDRSuggested
{
  return self->_HDRSuggested;
}

- (void)changeToFlashMode:(int64_t)a3
{
  void *v4;
  CAMFlashCommand *v5;

  v5 = -[CAMFlashCommand initWithFlashMode:]([CAMFlashCommand alloc], "initWithFlashMode:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)startMonitoringForHDRSuggestions
{
  CAMHDRSuggestionMonitoringCommand *v2;
  id v3;

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[CAMHDRSuggestionMonitoringCommand initWithHDRSuggestionMonitoringEnabled:]([CAMHDRSuggestionMonitoringCommand alloc], "initWithHDRSuggestionMonitoringEnabled:", 1);
  objc_msgSend(v3, "enqueueCommand:", v2);

}

- (BOOL)isConfigurationAvailable
{
  return self->_configurationAvailable;
}

- (BOOL)isCaptureAvailable
{
  return self->_captureAvailable;
}

- (BOOL)isInterrupted
{
  void *v2;
  char v3;

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterrupted");

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)CAMFocusResultContext == a6)
  {
    -[CUCaptureController _focusResultChangedForKeyPath:ofObject:change:](self, "_focusResultChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMExposureResultContext == a6)
  {
    -[CUCaptureController _exposureResultChangedForKeyPath:ofObject:change:](self, "_exposureResultChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMSuggestionResultContext == a6)
  {
    -[CUCaptureController _suggestionResultChangedForKeyPath:ofObject:change:](self, "_suggestionResultChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMAvailabilityResultContext == a6)
  {
    -[CUCaptureController _availabilityResultChangedForKeyPath:ofObject:change:](self, "_availabilityResultChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMZoomResultContext == a6)
  {
    -[CUCaptureController _zoomResultChangedForKeyPath:ofObject:change:](self, "_zoomResultChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMSystemPressureStateMonitoringContext == a6)
  {
    -[CUCaptureController _systemPressureStateMonitoringChangedForKeyPath:ofObject:change:](self, "_systemPressureStateMonitoringChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMOverCapturePreviewContext == a6)
  {
    -[CUCaptureController _overCapturePreviewStatusChangedForKeyPath:ofObject:change:](self, "_overCapturePreviewStatusChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMPreviewZoomPIPContext == a6)
  {
    -[CUCaptureController _zoomPIPChangedForKeyPath:ofObject:change:](self, "_zoomPIPChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMStereoCaptureStatusContext == a6)
  {
    -[CUCaptureController _stereoCaptureStatusChangedForKeyPath:ofObject:change:](self, "_stereoCaptureStatusChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMStereoVideoCaptureStatusContext == a6)
  {
    -[CUCaptureController _stereoVideoCaptureStatusChangedForKeyPath:ofObject:change:](self, "_stereoVideoCaptureStatusChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else if ((void *)CAMDocumentScanningResultsContext == a6)
  {
    -[CUCaptureController _documentScanningChangedForKeyPath:ofObject:change:](self, "_documentScanningChangedForKeyPath:ofObject:change:", v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CUCaptureController;
    -[CUCaptureController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_suggestionResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_msgSend(v11, "currentCameraDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentStillImageOutput.isHDRScene")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
      goto LABEL_6;
    objc_msgSend(v13, "BOOLValue");
LABEL_5:
    pl_dispatch_async();
LABEL_6:

    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentCameraDevice.flashActive")))
  {
    objc_msgSend(v12, "isFlashActive");
    v21 = v11;
    pl_dispatch_async();

    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentCameraDevice.torchActive")))
  {
    objc_msgSend(v12, "isTorchActive");
    pl_dispatch_async();
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentStillImageOutput.digitalFlashStatus")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v15)
      goto LABEL_6;
    +[CAMCaptureConversions lowLightStatusForCaptureStatus:](CAMCaptureConversions, "lowLightStatusForCaptureStatus:", objc_msgSend(v13, "integerValue"));
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentStillImageOutput.digitalFlashExposureTimes")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v13 == (id)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        v18 = objc_msgSend(v13, "count");

        if (v18)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1EA3B0DA8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1EA3B0DC0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");

          pl_dispatch_async();
        }
      }
    }

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("currentCameraDevice.activePrimaryConstituentDevice")))
  {
    -[CUCaptureController _updateAutoMacroActive](self, "_updateAutoMacroActive");
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("currentCameraDevice.preferredPrimaryConstituentDevice")))
  {
    -[CUCaptureController _updateAutoMacroSuggested](self, "_updateAutoMacroSuggested");
  }
LABEL_11:

}

- (void)_zoomResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("currentCameraDevice.videoZoomFactor")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      goto LABEL_14;
    goto LABEL_4;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("currentCameraDevice.minAvailableVideoZoomFactor")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v11)
      goto LABEL_14;
LABEL_4:
    objc_msgSend(v9, "floatValue");
LABEL_13:
    pl_dispatch_async();
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("currentCameraDevice.rampingVideoZoom")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v12)
      goto LABEL_14;
    -[CUCaptureController setRampingVideoZoom:](self, "setRampingVideoZoom:", objc_msgSend(v9, "BOOLValue"));
    goto LABEL_13;
  }
LABEL_15:

}

- (void)_availabilityResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    goto LABEL_12;
  v9 = v7;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("currentCameraDevice.flashAvailable"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("currentCameraDevice.torchAvailable")))
  {
    objc_msgSend(v9, "BOOLValue");
LABEL_8:
    pl_dispatch_async();
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("currentCameraDevice.degradedCaptureQualityFactors")))
  {
    objc_msgSend(v9, "unsignedIntegerValue");
    goto LABEL_8;
  }
LABEL_9:
  v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Observed availability key path %{public}@ change to %{public}@", buf, 0x16u);
  }

LABEL_12:
}

- (void)_exposureResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a5;
  objc_msgSend(a4, "currentCameraDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "exposureMode");
  objc_msgSend(v9, "exposurePointOfInterest");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v9, "isAdjustingExposure");
  objc_msgSend(v9, "exposureTargetBias");
  v17 = v16;
  -[CUCaptureController _exposureCoalescer](self, "_exposureCoalescer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v19, CFSTR("currentCameraDevice.exposureMode"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v20, CFSTR("currentCameraDevice.exposurePointOfInterest"));

  LODWORD(v21) = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v22, CFSTR("currentCameraDevice.exposureTargetBias"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v23, CFSTR("currentCameraDevice.adjustingExposure"));

  v24 = objc_msgSend(v9, "isFocusModeSupported:", 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v25, CFSTR("deviceSupportsFocusKeyPath"));

  if (objc_msgSend(v30, "isEqual:", CFSTR("currentCameraDevice.adjustingExposure")))
    v26 = -[CUCaptureController _kvoDidStartForChange:](self, "_kvoDidStartForChange:", v8);
  else
    v26 = 0;
  if (objc_msgSend(v30, "isEqual:", CFSTR("currentCameraDevice.adjustingExposure")))
    v27 = -[CUCaptureController _kvoDidEndForChange:](self, "_kvoDidEndForChange:", v8);
  else
    v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v28, CFSTR("exposureDidStartKeyPath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coalesceValue:forKeyPath:", v29, CFSTR("exposureDidEndKeyPath"));

  if (v26 || v27)
    objc_msgSend(v18, "flush");

}

- (CAMKeyValueCoalescer)_exposureCoalescer
{
  return self->__exposureCoalescer;
}

- (BOOL)_kvoDidStartForChange:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v3 = *MEMORY[0x1E0CB2CC8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v8)
  {

LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v10 || (objc_msgSend(v5, "BOOLValue") & 1) != 0)
    goto LABEL_10;
  v11 = objc_msgSend(v6, "BOOLValue");
LABEL_11:

  return v11;
}

- (BOOL)_kvoDidEndForChange:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v3 = *MEMORY[0x1E0CB2CC8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v8)
  {

LABEL_10:
    LOBYTE(v11) = 0;
    goto LABEL_11;
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v10 || !objc_msgSend(v5, "BOOLValue"))
    goto LABEL_10;
  v11 = objc_msgSend(v6, "BOOLValue") ^ 1;
LABEL_11:

  return v11;
}

- (void)_focusResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a5;
  objc_msgSend(a4, "currentCameraDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "focusMode");
  objc_msgSend(v9, "focusPointOfInterest");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v9, "isAdjustingFocus");
  -[CUCaptureController _focusCoalescer](self, "_focusCoalescer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v17, CFSTR("currentCameraDevice.focusMode"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v18, CFSTR("currentCameraDevice.focusPointOfInterest"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v19, CFSTR("currentCameraDevice.adjustingFocus"));

  v20 = objc_msgSend(v9, "isFocusModeSupported:", 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v21, CFSTR("deviceSupportsFocusKeyPath"));

  if (objc_msgSend(v26, "isEqual:", CFSTR("currentCameraDevice.adjustingFocus")))
    v22 = -[CUCaptureController _kvoDidStartForChange:](self, "_kvoDidStartForChange:", v8);
  else
    v22 = 0;
  if (objc_msgSend(v26, "isEqual:", CFSTR("currentCameraDevice.adjustingFocus")))
    v23 = -[CUCaptureController _kvoDidEndForChange:](self, "_kvoDidEndForChange:", v8);
  else
    v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v24, CFSTR("contrastBasedFocusDidStartKeyPath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coalesceValue:forKeyPath:", v25, CFSTR("contrastBasedFocusDidEndKeyPath"));

  if (v22 || v23)
    objc_msgSend(v16, "flush");

}

- (CAMKeyValueCoalescer)_focusCoalescer
{
  return self->__focusCoalescer;
}

void __47__CUCaptureController__setupExposureMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  CAMExposureResult *v27;
  double v28;
  CAMExposureResult *v29;
  id v30;
  int64_t v31;
  CAMExposureResult *v33;
  id v34;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "cam_compareKey:withDictionary:", CFSTR("currentCameraDevice.exposureMode"), v5);
  v7 = objc_msgSend(v4, "cam_compareKey:withDictionary:", CFSTR("currentCameraDevice.exposurePointOfInterest"), v5);
  v8 = objc_msgSend(v4, "cam_compareKey:withDictionary:", CFSTR("currentCameraDevice.exposureTargetBias"), v5);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.exposureMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v31 = +[CAMCaptureConversions exposureModeForCaptureExposureMode:](CAMCaptureConversions, "exposureModeForCaptureExposureMode:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.exposurePointOfInterest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGPointValue");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.exposureTargetBias"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.adjustingExposure"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exposureDidStartKeyPath"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exposureDidEndKeyPath"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSupportsFocusKeyPath"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  if (!v6 || !v7 || !v8 || (v22 & 1) != 0 || (_DWORD)v24)
  {
    v27 = [CAMExposureResult alloc];
    LODWORD(v28) = v18;
    v29 = -[CAMExposureResult initWithMode:pointOfInterest:exposureTargetBias:adjusting:exposureDidStart:exposureDidEnd:deviceSupportsFocus:](v27, "initWithMode:pointOfInterest:exposureTargetBias:adjusting:exposureDidStart:exposureDidEnd:deviceSupportsFocus:", v31, v20, v22, v24, v26, v13, v15, v28);
    v30 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v34, (id *)(a1 + 32));
    v33 = v29;
    pl_dispatch_async();

    objc_destroyWeak(&v34);
  }

}

void __44__CUCaptureController__setupFocusMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CAMFocusResult *v24;
  id v25;
  CAMFocusResult *v27;
  id v28;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "cam_compareKey:withDictionary:", CFSTR("currentCameraDevice.focusMode"), v5);
  v7 = objc_msgSend(v4, "cam_compareKey:withDictionary:", CFSTR("currentCameraDevice.focusPointOfInterest"), v5);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.focusMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = +[CAMCaptureConversions focusModeForCaptureFocusMode:](CAMCaptureConversions, "focusModeForCaptureFocusMode:", v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.focusPointOfInterest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGPointValue");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSupportsFocusKeyPath"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contrastBasedFocusDidStartKeyPath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contrastBasedFocusDidEndKeyPath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentCameraDevice.adjustingFocus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (!v6 || !v7 || (v19 & 1) != 0 || (_DWORD)v21)
  {
    v24 = -[CAMFocusResult initWithMode:pointOfInterest:performingContrastDetection:contrastBasedFocusDidStart:contrastBasedFocusDidEnd:deviceSupportsFocus:]([CAMFocusResult alloc], "initWithMode:pointOfInterest:performingContrastDetection:contrastBasedFocusDidStart:contrastBasedFocusDidEnd:deviceSupportsFocus:", v10, v23, v19, v21, v17, v13, v15);
    v25 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v28, (id *)(a1 + 32));
    v27 = v24;
    pl_dispatch_async();

    objc_destroyWeak(&v28);
  }

}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setHDRSuggested:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputHDRSuggestion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_setHDRSuggested:(BOOL)a3
{
  self->_HDRSuggested = a3;
}

- (CAMSuggestionDelegate)suggestionDelegate
{
  return (CAMSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionDelegate);
}

uint64_t __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "captureController:didOutputVideoZoomFactor:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_updateAutoMacroActive");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAutoMacroSuggested");
}

- (void)_setTorchAvailable:(BOOL)a3
{
  self->_torchAvailable = a3;
}

- (CAMAvailabilityDelegate)availabilityDelegate
{
  return (CAMAvailabilityDelegate *)objc_loadWeakRetained((id *)&self->_availabilityDelegate);
}

- (BOOL)isTorchAvailable
{
  return self->_torchAvailable;
}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setFlashAvailable:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "availabilityDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputFlashAvailability:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_setFlashAvailable:(BOOL)a3
{
  self->_flashAvailable = a3;
}

- (void)_setTorchActive:(BOOL)a3
{
  self->_torchActive = a3;
}

- (void)_setFlashActive:(BOOL)a3
{
  self->_flashActive = a3;
}

void __47__CUCaptureController__setupExposureMonitoring__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "exposureDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputExposureResult:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (CAMExposureDelegate)exposureDelegate
{
  return (CAMExposureDelegate *)objc_loadWeakRetained((id *)&self->_exposureDelegate);
}

void __44__CUCaptureController__setupFocusMonitoring__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "focusDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputFocusResult:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (CAMFocusDelegate)focusDelegate
{
  return (CAMFocusDelegate *)objc_loadWeakRetained((id *)&self->_focusDelegate);
}

- (void)changeToTorchMode:(int64_t)a3
{
  void *v4;
  CAMTorchCommand *v5;

  v5 = -[CAMTorchCommand initWithTorchMode:]([CAMTorchCommand alloc], "initWithTorchMode:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)handleSessionDidStartRunning
{
  pl_dispatch_async();
}

void __51__CUCaptureController_handleSessionDidStartRunning__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "captureControllerDidStartRunning:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (CAMCaptureRunningDelegate)runningDelegate
{
  return (CAMCaptureRunningDelegate *)objc_loadWeakRetained((id *)&self->_runningDelegate);
}

- (void)_handleCaptureEngineExecutionNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  CUCaptureController *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CAMModeAndDeviceCommandDesiredConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CAMModeAndDeviceCommandResolvedConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CAMModeAndDeviceCommandRequestID"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
    goto LABEL_18;
  -[CUCaptureController _setDidCompleteInitialConfiguration:](self, "_setDidCompleteInitialConfiguration:", 1);
  objc_msgSend(v4, "objectForKey:", CFSTR("CAMModeAndDeviceConfigurationError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _handleCaptureEngineExecutionNotification:].cold.1((uint64_t)v11, v12, v13);

    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("CAMModeAndDeviceCommandCannotCaptureErrorDomain"));

    if (!v15)
      goto LABEL_15;
    v16 = self;
    v17 = 1;
  }
  else
  {
    v16 = self;
    v17 = 0;
  }
  -[CUCaptureController _setFailedConfigurationPreventingCapture:](v16, "_setFailedConfigurationPreventingCapture:", v17);
LABEL_15:
  -[CUCaptureController _commandForResetFocus:resetExposure:resetExposureTargetBias:](self, "_commandForResetFocus:resetExposure:resetExposureTargetBias:", -[CUCaptureController _shouldManageFocusForMode:](self, "_shouldManageFocusForMode:", objc_msgSend(v6, "mode")), 1, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "enqueueCommand:", v18);
  v20 = objc_msgSend(v8, "integerValue");
  -[CUCaptureController configurationDelegate](self, "configurationDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "captureController:didChangeToGraphConfiguration:forDesiredConfiguration:requestID:", self, v6, v5, v20);

LABEL_18:
}

- (void)_setFailedConfigurationPreventingCapture:(BOOL)a3
{
  self->_failedConfigurationPreventingCapture = a3;
}

- (id)_commandForResetFocus:(BOOL)a3 resetExposure:(BOOL)a4 resetExposureTargetBias:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  id WeakRetained;
  id v10;
  CAMSubjectAreaChangeMonitoringCommand *v11;
  void *v12;
  int v13;
  int v14;
  CAMExposureTargetBiasCommand *v15;
  double v16;
  CAMExposureTargetBiasCommand *v17;
  CAMCaptureCommand *v18;
  CAMFocusCommand *v20;
  CAMExposureCommand *v21;
  CAMWhiteBalanceCommand *v22;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
  objc_msgSend(WeakRetained, "captureControllerWillResetFocusAndExposure:", self);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", 0);
  objc_msgSend(v10, "addObject:", v11);
  if (!v7)
  {
    if (!v6)
      goto LABEL_3;
LABEL_7:
    v21 = -[CAMExposureCommand initWithExposureMode:atPointOfInterest:]([CAMExposureCommand alloc], "initWithExposureMode:atPointOfInterest:", 2, 0.5, 0.5);
    objc_msgSend(v10, "addObject:", v21);
    if (!-[CUCaptureController _shouldLockWhiteBalanceForActiveVideoRequest](self, "_shouldLockWhiteBalanceForActiveVideoRequest"))
    {
      v22 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:]([CAMWhiteBalanceCommand alloc], "initWithWhiteBalanceMode:", 2);
      objc_msgSend(v10, "addObject:", v22);

    }
    if (v5)
      goto LABEL_4;
    goto LABEL_5;
  }
  v20 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", 3, -[CUCaptureController _useSmoothFocus](self, "_useSmoothFocus"), 0.5, 0.5);
  objc_msgSend(v10, "addObject:", v20);

  if (v6)
    goto LABEL_7;
LABEL_3:
  if (v5)
  {
LABEL_4:
    -[CUCaptureController exposureDelegate](self, "exposureDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "baselineExposureValueForCaptureController:", self);
    v14 = v13;

    v15 = [CAMExposureTargetBiasCommand alloc];
    LODWORD(v16) = v14;
    v17 = -[CAMExposureTargetBiasCommand initWithExposureTargetBias:](v15, "initWithExposureTargetBias:", v16);
    objc_msgSend(v10, "addObject:", v17);

  }
LABEL_5:
  v18 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v10);

  return v18;
}

- (CAMConfigurationDelegate)configurationDelegate
{
  return (CAMConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_configurationDelegate);
}

- (void)cancelDelayedFocusAndExposureReset
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__resetFocusAndExposureAfterCapture, 0);
}

- (void)prepareToCaptureStillImageAtSystemTime:(int64_t)a3
{
  void *v4;
  CAMPrepareStillImageCaptureCommand *v5;

  v5 = -[CAMPrepareStillImageCaptureCommand initWithSystemTime:]([CAMPrepareStillImageCaptureCommand alloc], "initWithSystemTime:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (BOOL)captureStillImageWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  v7 = -[CUCaptureController _internalCaptureStillImageWithRequest:error:](self, "_internalCaptureStillImageWithRequest:error:", v6, &v12);
  v8 = v12;
  if (!v7)
  {
    objc_msgSend(v6, "persistenceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _endCaptureSignpostIntervalForPersistenceUUID:](self, "_endCaptureSignpostIntervalForPersistenceUUID:", v9);

    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CUCaptureController captureStillImageWithRequest:error:].cold.1((uint64_t)v6, v8);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)_isFailedConfigurationPreventingCapture
{
  return self->_failedConfigurationPreventingCapture;
}

- (id)_sanitizeStillImageRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double Current;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  unsigned int v36;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (!self->_capturingTimelapse)
  {
    -[CUCaptureController _motionController](self, "_motionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaptureOrientation:", objc_msgSend(v6, "captureOrientation"));

  }
  if (-[CUCaptureController isCapturingBurst](self, "isCapturingBurst"))
  {
    objc_msgSend(v5, "setFlashMode:", 0);
    objc_msgSend(v5, "setHdrMode:", 0);
    objc_msgSend(v5, "setIrisMode:", 0);
    objc_msgSend(v5, "setPhotoQualityPrioritization:", 0);
    objc_msgSend(v5, "setWantsAutoDualCameraFusion:", 0);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isBurstSupportedForMode:device:", objc_msgSend(v5, "captureMode"), objc_msgSend(v5, "captureDevice"));

    if (v8)
    {
      -[CUCaptureController _burstController](self, "_burstController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentBurstIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBurstIdentifier:", v10);

      objc_msgSend(v5, "setDeferredPersistenceOptions:", 2);
    }
  }
  if (-[CUCaptureController isCapturingVideo](self, "isCapturingVideo"))
  {
    objc_msgSend(v5, "setFlashMode:", 0);
    objc_msgSend(v5, "setHdrMode:", 0);
    objc_msgSend(v5, "setIrisMode:", 0);
    objc_msgSend(v5, "setPhotoQualityPrioritization:", -[CUCaptureController isCapturingCTMVideo](self, "isCapturingCTMVideo") ^ 1);
    objc_msgSend(v5, "setPhotoEncodingBehavior:", 0);
  }
  -[CUCaptureController _irisVideoController](self, "_irisVideoController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldHandleLivePhotoRenderingForRequest:", v5);

  v36 = objc_msgSend(v5, "shouldPersistToIncomingDirectory");
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v4, "irisMode") - 3;
  objc_msgSend(v5, "irisVideoPersistenceUUIDForEV0:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisLocalVideoDestinationURLForEV0:", 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL && !v18)
  {
    if ((v12 & 1) != 0)
      +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:](CAMIrisDiskUtilities, "videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:", v5, 0, v15, Current);
    else
      +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v17, CFSTR("MOV"), v36, Current);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalVideoDestinationURL:", v19);

  }
  objc_msgSend(v5, "irisVideoPersistenceUUIDForEV0:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisLocalVideoDestinationURLForEV0:", 1);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL && !v22)
  {
    v24 = v17;
    if ((v12 & 1) != 0)
      +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:](CAMIrisDiskUtilities, "videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:", v5, 1, v15, Current);
    else
      +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v21, CFSTR("MOV"), v36, Current);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEV0LocalVideoDestinationURL:", v23);

    v17 = v24;
  }
  if (objc_msgSend(v4, "isCTMVideo"))
  {
    objc_msgSend(v4, "localCTMVideoDestinationURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v34 = v17;
      v27 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v5, "persistenceUUID");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v29 = (void *)v28;
        +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:](CAMIrisDiskUtilities, "videoDestinationPathForStillImageRequest:captureTime:isEV0ForHDR:bundleIdentifier:", v5, 0, v15, v27);
      }
      else
      {
        v29 = (void *)v28;
        +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v28, CFSTR("MOV"), v36, v27);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v30, v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocalCTMVideoDestinationURL:", v26);

      v17 = v35;
    }

  }
  if (!objc_msgSend(v5, "assertionIdentifier"))
  {
    -[CUCaptureController _powerController](self, "_powerController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssertionIdentifier:", objc_msgSend(v31, "generateAssertionIdentifier"));

  }
  v32 = (void *)objc_msgSend(v5, "copy");

  return v32;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (int64_t)_maximumNumberOfStillImageRequests
{
  return self->__maximumNumberOfStillImageRequests;
}

- (void)_setMaximumNumberOfStillImageRequests:(int64_t)a3
{
  self->__maximumNumberOfStillImageRequests = a3;
}

- (void)_updateAvailabilityAfterEnqueuedRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "persistenceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:](self, "_startCaptureSignpostIntervalForPersistenceUUID:", v4);

  if (-[CUCaptureController _shouldTrackInflightCountForRequest:](self, "_shouldTrackInflightCountForRequest:", v8))
  {
    v5 = objc_msgSend(v8, "type");
    -[CUCaptureController _numberOfInflightRequestsByType](self, "_numberOfInflightRequestsByType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[CUCaptureController _updateAvailabilityForRequestType:](self, "_updateAvailabilityForRequestType:", v5);
  }

}

- (NSCountedSet)_numberOfInflightRequestsByType
{
  return self->__numberOfInflightRequestsByType;
}

- (void)_updateAvailabilityForRequestType:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (a3 == 1)
  {
    v8 = -[CUCaptureController _isVideoCaptureAvailable](self, "_isVideoCaptureAvailable");
  }
  else if (a3)
  {
    v8 = 1;
  }
  else
  {
    -[CUCaptureController _numberOfInflightRequestsByType](self, "_numberOfInflightRequestsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "countForObject:", v6);

    v8 = v7 < -[CUCaptureController _maximumNumberOfStillImageRequests](self, "_maximumNumberOfStillImageRequests");
  }
  v9 = -[CUCaptureController isCaptureAvailable](self, "isCaptureAvailable");
  v10 = v8 ^ -[CUCaptureController isConfigurationAvailable](self, "isConfigurationAvailable");
  -[CUCaptureController _setCaptureAvailable:](self, "_setCaptureAvailable:", v8);
  -[CUCaptureController _setConfigurationAvailable:](self, "_setConfigurationAvailable:", v8);
  if (v8 != v9)
    -[CUCaptureController _notifyDelegateOfCaptureAvailabilityChanged:](self, "_notifyDelegateOfCaptureAvailabilityChanged:", v8);
  if (v10)
    -[CUCaptureController _notifyDelegateOfConfigurationAvailabilityChanged:](self, "_notifyDelegateOfConfigurationAvailabilityChanged:", v8);
}

- (void)_setCaptureAvailable:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_captureAvailable != a3)
  {
    self->_captureAvailable = a3;
    v4 = os_log_create("com.apple.camera", "Camera");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Capture became available", v7, 2u);
      }
      v6 = 64;
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Capture became unavailable", buf, 2u);
      }
      v6 = 63;
    }

    CAMSignpostWithIDAndArgs(v6, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  }
}

- (void)_setConfigurationAvailable:(BOOL)a3
{
  self->_configurationAvailable = a3;
}

- (void)stillImageRequestDidStartCapturing:(id)a3 resolvedSettings:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  pl_dispatch_async();

}

void __75__CUCaptureController_stillImageRequestDidStartCapturing_resolvedSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "stillImageRequestDidStartCapturing:resolvedSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)stillImageRequest:(id)a3 didCompleteStillImageCaptureWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "burstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[CUCaptureController _processCapturedBurstRequest:withResult:](self, "_processCapturedBurstRequest:withResult:", v6, v7);
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController resultDelegate](self, "resultDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "captureController:didGenerateStillImageCaptureResult:fromRequest:", self, v7, v6);
  -[CUCaptureController _capturingLowLightStillImageRequest](self, "_capturingLowLightStillImageRequest");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
    pl_dispatch_async();
  -[CUCaptureController _responseQueue](self, "_responseQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v17 = v7;
  v13 = v9;
  v14 = v7;
  v15 = v6;
  pl_dispatch_async();

}

- (CAMCaptureResultDelegate)resultDelegate
{
  return (CAMCaptureResultDelegate *)objc_loadWeakRetained((id *)&self->_resultDelegate);
}

- (OS_dispatch_queue)_responseQueue
{
  return self->__responseQueue;
}

- (id)_thumbnailImageFromStillImageCaptureResult:(id)a3 imageOrientation:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  CGImage *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "stillImageFilteredPreviewSurface");
  if (!v7)
    v7 = objc_msgSend(v6, "stillImageUnfilteredPreviewSurface");
  -[CUCaptureController _responseThumbnailGenerator](self, "_responseThumbnailGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (CGImage *)objc_msgSend(v8, "newBGRAImageOfFormat:inOrientation:usingSurface:", objc_msgSend(MEMORY[0x1E0D73130], "masterThumbnailFormat"), a4, v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v9);
  CGImageRelease(v9);

  return v10;
}

- (CAMThumbnailGenerator)_responseThumbnailGenerator
{
  return self->__responseThumbnailGenerator;
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  pl_dispatch_async();

}

uint64_t __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCapturingLowLightStillImageRequest:", 0);
}

- (void)_updateAvailabilityAfterCapturedRequest:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "type");
  if (-[CUCaptureController _shouldTrackInflightCountForRequest:](self, "_shouldTrackInflightCountForRequest:", v8))
  {
    -[CUCaptureController _numberOfInflightRequestsByType](self, "_numberOfInflightRequestsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

    if (v4 != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
LABEL_5:
    -[CUCaptureController _setVideoCaptureAvailable:](self, "_setVideoCaptureAvailable:", 1);
LABEL_6:
    -[CUCaptureController _updateAvailabilityForRequestType:](self, "_updateAvailabilityForRequestType:", v4);
  }
  objc_msgSend(v8, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _endCaptureSignpostIntervalForPersistenceUUID:](self, "_endCaptureSignpostIntervalForPersistenceUUID:", v7);

}

- (void)_updateMaximumNumberOfStillImageRequestsAfterCapturedRequestIfNecessary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a3, "captureRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  -[CUCaptureController _numberOfInflightRequestsByType](self, "_numberOfInflightRequestsByType");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "countForObject:", v6);

  v8 = v11;
  if (v7 <= 0)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "maximumNumberOfInflightRequests");

    if (-[CUCaptureController isCapturingBurst](self, "isCapturingBurst"))
      v10 = -[CUCaptureController _maximumNumberOfStillImageRequestsDuringBurst](self, "_maximumNumberOfStillImageRequestsDuringBurst");
    -[CUCaptureController _setMaximumNumberOfStillImageRequests:](self, "_setMaximumNumberOfStillImageRequests:", v10);
    v8 = v11;
  }

}

void __65__CUCaptureController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "assertionIdentifier");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stillImageRequestDidCompleteCapture:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_powerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAssertionForIdentifier:withReason:", v2, 1);

}

- (id)_identifierForPendingVideoForStillImageRequest:(id)a3
{
  return (id)objc_msgSend(a3, "persistenceUUID");
}

void __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CAMStillImageCaptureResponse *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CAMStillImageCaptureResponse *v20;
  CAMStillImageCaptureResponse *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  objc_msgSend(a1[4], "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(a1[4], "sessionIdentifier");
  objc_msgSend(a1[4], "burstIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[5], "_burstController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v3, "estimatedCountForIdentifier:", v2);

  }
  else
  {
    v25 = 0;
  }
  v4 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", a1[6], objc_msgSend(a1[4], "captureDevice"), objc_msgSend(a1[4], "captureOrientation"));
  objc_msgSend(a1[5], "_thumbnailImageFromStillImageCaptureResult:imageOrientation:", a1[6], v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "metadata");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "textAnalysisIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[5], "_textAnalysisImageFromStillImageResult:imageOrientation:", a1[6], v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithPhotoMetadata:aspectRatio:", v5, objc_msgSend(a1[4], "aspectRatioCrop"));
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1[6], "capturePhoto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolvedSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "uniqueID");

  v15 = [CAMStillImageCaptureResponse alloc];
  objc_msgSend(a1[6], "persistenceUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "captureDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "metadata");
  v24 = (void *)v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "coordinationInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(a1[6], "isExpectingPairedVideo");
  v20 = -[CAMStillImageCaptureResponse initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:](v15, "initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:", v16, v26, v17, v18, v2, v25, v9, v11, v27, v7, v19, v23, v14, objc_msgSend(a1[6], "semanticEnhancement"));

  v29 = a1[4];
  v30 = a1[7];
  v21 = v20;
  v22 = v28;
  pl_dispatch_async();

}

- (BOOL)isCapturingStillImage
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _numberOfInflightRequestsByType](self, "_numberOfInflightRequestsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countForObject:", &unk_1EA3B0D90) != 0;

  return v3;
}

- (void)_resetFocusAndExposureAfterCapture
{
  NSObject *v3;
  uint8_t v4[16];

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  if (-[CUCaptureController _shouldResetFocusAndExposureAfterCapture](self, "_shouldResetFocusAndExposureAfterCapture"))
  {
    -[CUCaptureController _resetFocusAndExposureIfAppropriateForReason:](self, "_resetFocusAndExposureIfAppropriateForReason:", 1);
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Not resetting focus/exposure because still capturing", v4, 2u);
    }

  }
}

- (void)_resetFocusAndExposureIfAppropriateForReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[CUCaptureController focusDelegate](self, "focusDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  if (v5 && !objc_msgSend(v5, "captureController:shouldResetFocusAndExposureForReason:", self, a3))
  {
    v10 = 0;
    v6 = 0;
    goto LABEL_13;
  }
  if (-[CUCaptureController isCapturingVideo](self, "isCapturingVideo"))
    v6 = 0;
  else
    v6 = -[CUCaptureController isCapturingTimelapse](self, "isCapturingTimelapse") ^ 1;
  if (-[CUCaptureController isCapturingVideo](self, "isCapturingVideo"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_exposureDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_exposureDelegate);
      v10 = objc_msgSend(v9, "captureControllerUserHasAdjustedExposureTargetBiasFromBaseline:", self) ^ 1;

      if ((v6 & 1) != 0)
        goto LABEL_11;
LABEL_13:
      if (!(_DWORD)v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  v10 = 1;
LABEL_11:
  -[CUCaptureController _commandForResetFocus:resetExposure:resetExposureTargetBias:](self, "_commandForResetFocus:resetExposure:resetExposureTargetBias:", v6, v10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enqueueCommand:", v11);

LABEL_14:
}

- (void)panoramaConfigurationDidChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4
{
  if (a3)
    CFRetain(a3);
  pl_dispatch_async();
}

void __78__CUCaptureController_panoramaConfigurationDidChangeWithImageQueue_direction___block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "panoramaPreviewView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageQueue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "panoramaChangeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panoramaConfigurationDidChangeWithDirection:", *(_QWORD *)(a1 + 48));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);

}

- (CAMPanoramaPreviewView)panoramaPreviewView
{
  CAMPanoramaPreviewView *panoramaPreviewView;
  CAMPanoramaPreviewView *v4;
  CAMPanoramaPreviewView *v5;
  CAMPanoramaPreviewView *v6;

  panoramaPreviewView = self->_panoramaPreviewView;
  if (!panoramaPreviewView)
  {
    v4 = [CAMPanoramaPreviewView alloc];
    v5 = -[CAMPanoramaPreviewView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_panoramaPreviewView;
    self->_panoramaPreviewView = v5;

    panoramaPreviewView = self->_panoramaPreviewView;
  }
  return panoramaPreviewView;
}

- (CAMPanoramaChangeDelegate)panoramaChangeDelegate
{
  return (CAMPanoramaChangeDelegate *)objc_loadWeakRetained((id *)&self->_panoramaChangeDelegate);
}

- (void)handleSessionInterruptionForReason:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__CUCaptureController_handleSessionInterruptionForReason___block_invoke;
  v3[3] = &unk_1EA328868;
  v3[4] = self;
  cam_perform_on_main_asap(v3);
}

- (void)handleSessionDidStopRunning
{
  void *v3;
  _QWORD v4[5];

  -[CUCaptureController _protectionController](self, "_protectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "abortOutstandingNebulaDaemonWriteProtectionsForReason:", CFSTR("Capture session stopped running"));

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CUCaptureController_handleSessionDidStopRunning__block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  cam_perform_on_main_asap(v4);
}

void __58__CUCaptureController_handleSessionInterruptionForReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "interruptionDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "captureControllerWasInterrupted:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (CAMCaptureInterruptionDelegate)interruptionDelegate
{
  return (CAMCaptureInterruptionDelegate *)objc_loadWeakRetained((id *)&self->_interruptionDelegate);
}

void __50__CUCaptureController_handleSessionDidStopRunning__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCapturingTimelapse") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_commandForResetFocus:resetExposure:resetExposureTargetBias:", 1, 1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enqueueCommand:", v2);

  }
  objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "captureControllerDidStopRunning:", *(_QWORD *)(a1 + 32));
      v5 = v7;
    }
  }

}

- (CUCaptureController)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13
{
  id v18;
  id v19;
  CUCaptureController *v20;
  CUCaptureController *v21;
  id v22;
  CAMCaptureEngine *v23;
  CAMCaptureEngine *captureEngine;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *responseQueue;
  CAMThumbnailGenerator *v31;
  CAMThumbnailGenerator *responseThumbnailGenerator;
  NSCountedSet *v33;
  NSCountedSet *numberOfInflightRequestsByType;
  NSMutableSet *v35;
  NSMutableSet *identifiersForActiveLivePhotoVideoCaptures;
  NSMutableSet *v37;
  NSMutableSet *identifiersForActiveCTMVideoCaptures;
  NSMutableDictionary *v39;
  NSMutableDictionary *persistenceUUIDToSignpostID;
  CUCaptureController *v41;
  int64_t v43;
  _BOOL4 v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v43 = a6;
  v44 = a5;
  v18 = a3;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v19 = a11;
  v46 = a12;
  v45 = a13;
  v51.receiver = self;
  v51.super_class = (Class)CUCaptureController;
  v20 = -[CUCaptureController init](&v51, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->__locationController, a7);
    objc_storeStrong((id *)&v21->__motionController, a8);
    objc_storeStrong((id *)&v21->__burstController, a9);
    objc_storeStrong((id *)&v21->__protectionController, a10);
    objc_storeStrong((id *)&v21->__powerController, a11);
    objc_storeStrong((id *)&v21->__irisVideoController, a12);
    objc_storeStrong((id *)&v21->__remoteShutterController, a13);
    v22 = v19;
    v23 = -[CAMCaptureEngine initWithPowerController:captureController:options:]([CAMCaptureEngine alloc], "initWithPowerController:captureController:options:", v19, v21, v43);
    captureEngine = v21->__captureEngine;
    v21->__captureEngine = v23;

    -[CAMCaptureEngine registerCaptureService:](v21->__captureEngine, "registerCaptureService:", v21);
    -[CUCaptureController _setupFocusAndExposureMonitoring](v21, "_setupFocusAndExposureMonitoring");
    -[CUCaptureController _setupSuggestionMonitoring](v21, "_setupSuggestionMonitoring");
    -[CUCaptureController _setupAvailabilityMonitoring](v21, "_setupAvailabilityMonitoring");
    -[CUCaptureController _setupZoomMonitoring](v21, "_setupZoomMonitoring");
    -[CUCaptureController _setupZoomPIPMonitoring](v21, "_setupZoomPIPMonitoring");
    -[CUCaptureController _setupSystemPressureStateMonitoring](v21, "_setupSystemPressureStateMonitoring");
    -[CUCaptureController _setupOverCapturePreviewMonitoring](v21, "_setupOverCapturePreviewMonitoring");
    -[CUCaptureController _setupDocumentScanningMonitoring](v21, "_setupDocumentScanningMonitoring");
    -[CUCaptureController _setupStereoCaptureStatusMonitoring](v21, "_setupStereoCaptureStatusMonitoring");
    -[CUCaptureController _setupStereoVideoCaptureStatusMonitoring](v21, "_setupStereoVideoCaptureStatusMonitoring");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v21, sel__handleCaptureEngineExecutionNotification_, CFSTR("CAMCaptureEngineExecutedCommandWithContextNotification"), v21->__captureEngine);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isBackPortraitModeSupported") & 1) != 0
      || objc_msgSend(v26, "isFrontPortraitModeSupported"))
    {
      objc_msgSend(v25, "addObserver:selector:name:object:", v21, sel__handleShallowDepthOfFieldStatusChangedNotification_, CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedNotification"), 0, v43);
    }
    -[CUCaptureController _commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:](v21, "_commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:", v18, v44, 0, a4, v43);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine enqueueCommand:](v21->__captureEngine, "enqueueCommand:", v27);
    -[CAMCaptureEngine startWithRetryCount:retryInterval:logReason:completion:](v21->__captureEngine, "startWithRetryCount:retryInterval:logReason:completion:", 0, CFSTR("initial configuration"), 0, 0.0);
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.camera.capture-controller.response-queue", v28);
    responseQueue = v21->__responseQueue;
    v21->__responseQueue = (OS_dispatch_queue *)v29;

    v31 = objc_alloc_init(CAMThumbnailGenerator);
    responseThumbnailGenerator = v21->__responseThumbnailGenerator;
    v21->__responseThumbnailGenerator = v31;

    v33 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    numberOfInflightRequestsByType = v21->__numberOfInflightRequestsByType;
    v21->__numberOfInflightRequestsByType = v33;

    v35 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiersForActiveLivePhotoVideoCaptures = v21->__identifiersForActiveLivePhotoVideoCaptures;
    v21->__identifiersForActiveLivePhotoVideoCaptures = v35;

    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiersForActiveCTMVideoCaptures = v21->__identifiersForActiveCTMVideoCaptures;
    v21->__identifiersForActiveCTMVideoCaptures = v37;

    v21->__needsInitialPairedVideoUpdate = 1;
    *(_DWORD *)&v21->_captureAvailable = 16843009;
    v21->_flashCompromise = 0;
    -[CUCaptureController _setVideoCaptureAvailable:](v21, "_setVideoCaptureAvailable:", 1);
    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    persistenceUUIDToSignpostID = v21->__persistenceUUIDToSignpostID;
    v21->__persistenceUUIDToSignpostID = v39;

    v21->__nextSignpostID = 1;
    v41 = v21;

    v19 = v22;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CUCaptureController invalidateController](self, "invalidateController");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CUCaptureController;
  -[CUCaptureController dealloc](&v4, sel_dealloc);
}

- (void)invalidateController
{
  CAMCaptureEngine *captureEngine;

  -[CUCaptureController _teardownFocusAndExposureMonitoring](self, "_teardownFocusAndExposureMonitoring");
  -[CUCaptureController _teardownSuggestionMonitoring](self, "_teardownSuggestionMonitoring");
  -[CUCaptureController _teardownAvailabilityMonitoring](self, "_teardownAvailabilityMonitoring");
  -[CUCaptureController _teardownZoomMonitoring](self, "_teardownZoomMonitoring");
  -[CUCaptureController _teardownZoomPIPMonitoring](self, "_teardownZoomPIPMonitoring");
  -[CUCaptureController _teardownSystemPressureStateMonitoring](self, "_teardownSystemPressureStateMonitoring");
  -[CUCaptureController _tearDownOverCapturePreviewMonitoring](self, "_tearDownOverCapturePreviewMonitoring");
  -[CUCaptureController _teardownStereoCaptureStatusMonitoring](self, "_teardownStereoCaptureStatusMonitoring");
  -[CUCaptureController _teardownStereoVideoCaptureStatusMonitoring](self, "_teardownStereoVideoCaptureStatusMonitoring");
  -[CUCaptureController _tearDownDocumentScanningMonitoring](self, "_tearDownDocumentScanningMonitoring");
  captureEngine = self->__captureEngine;
  self->__captureEngine = 0;

}

- (int)applyCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5
{
  CUCaptureController *v5;
  void *v6;
  int v8;

  v5 = self;
  v8 = 0;
  -[CUCaptureController _commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:](self, "_commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:", a3, a5, &v8, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine enqueueCommand:](v5->__captureEngine, "enqueueCommand:", v6);
  LODWORD(v5) = v8;

  return (int)v5;
}

- (void)_setupOverCapturePreviewMonitoring
{
  void *v3;
  id v4;

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overCaptureVideoPreviewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("overCaptureVideoPreviewLayer.overCaptureStatus"), 1, CAMOverCapturePreviewContext);

}

- (void)_tearDownOverCapturePreviewMonitoring
{
  void *v3;
  id v4;

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overCaptureVideoPreviewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("overCaptureVideoPreviewLayer.overCaptureStatus"), CAMOverCapturePreviewContext);

}

- (void)_overCapturePreviewStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "overCaptureVideoPreviewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12
    && objc_msgSend(v7, "isEqualToString:", CFSTR("overCaptureVideoPreviewLayer.overCaptureStatus")))
  {
    +[CAMCaptureConversions overCapturePreviewStatusForAVPreviewStatus:](CAMCaptureConversions, "overCapturePreviewStatusForAVPreviewStatus:", objc_msgSend(v11, "integerValue"));
    pl_dispatch_async();
  }

}

void __82__CUCaptureController__overCapturePreviewStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewLayerOverCaptureStatusDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputOverCapturePreviewStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_thumbnailImageFromVideoCaptureResult:(id)a3 previewOrientation:(int64_t)a4 previewImage:(id *)a5
{
  __CVBuffer *v8;
  void *v9;
  void *v10;
  CGImage *v11;
  void *v12;

  v8 = (__CVBuffer *)objc_msgSend(a3, "videoPreviewPixelBuffer");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "_initWithIOSurface:imageOrientation:", CVPixelBufferGetIOSurface(v8), a4);
  -[CUCaptureController _responseThumbnailGenerator](self, "_responseThumbnailGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CGImage *)objc_msgSend(v10, "newBGRAImageOfFormat:inOrientation:usingPixelBuffer:", objc_msgSend(MEMORY[0x1E0D73130], "masterThumbnailFormat"), a4, v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v11);
  CGImageRelease(v11);
  if (a5 && v9)
    *a5 = objc_retainAutorelease(v9);

  return v12;
}

- (id)_textAnalysisImageFromStillImageResult:(id)a3 imageOrientation:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  CGImage *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "stillImageFilteredPreviewSurface");
  if (!v7)
    v7 = objc_msgSend(v6, "stillImageUnfilteredPreviewSurface");
  -[CUCaptureController _responseThumbnailGenerator](self, "_responseThumbnailGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (CGImage *)objc_msgSend(v8, "newBGRAImageInOrientation:usingSurface:", a4, v7);

  v10 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v12 = (void *)objc_msgSend(v10, "initWithCGImage:scale:orientation:", v9, 0);

  CGImageRelease(v9);
  return v12;
}

- (BOOL)initiateCTMCaptureWithSettings:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  CAMCTMInitiateCaptureCommand *v10;
  void *v11;

  v6 = a3;
  v7 = -[CUCaptureController _canBeginCaptureCheckAvailability:error:](self, "_canBeginCaptureCheckAvailability:error:", 1, a4);
  if (v7)
  {
    objc_msgSend(v6, "persistenceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:](self, "_startCaptureSignpostIntervalForPersistenceUUID:", v8);

    -[CUCaptureController _sanitizeStillImageRequest:](self, "_sanitizeStillImageRequest:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CAMCTMInitiateCaptureCommand initWithSettings:]([CAMCTMInitiateCaptureCommand alloc], "initWithSettings:", v9);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueCommand:", v10);

  }
  return v7;
}

- (void)endCTMVideoCapture
{
  void *v3;
  void *v4;
  CAMCTMEndCaptureCommand *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[CUCaptureController _capturingCTMVideoRequest](self, "_capturingCTMVideoRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CUCaptureController _setCapturingCTMVideoRequest:](self, "_setCapturingCTMVideoRequest:", 0);
    objc_msgSend(v3, "persistenceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CAMCTMEndCaptureCommand initWithPersistenceUUID:]([CAMCTMEndCaptureCommand alloc], "initWithPersistenceUUID:", v4);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enqueueCommand:", v5);

  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Cannot stop CTM video recording: no capture request found", v8, 2u);
    }

  }
}

- (void)cancelCTMCaptureForSettings:(id)a3
{
  CAMCTMCancelMomentCaptureCommand *v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (a3)
  {
    objc_msgSend(a3, "persistenceUUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[CAMCTMCancelMomentCaptureCommand initWithPersistenceUUID:]([CAMCTMCancelMomentCaptureCommand alloc], "initWithPersistenceUUID:", v7);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueCommand:", v4);

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CUCaptureController cancelCTMCaptureForSettings:].cold.1();

  }
}

- (BOOL)_canBeginCaptureCheckAvailability:(BOOL)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  BOOL result;

  if (a3 && !-[CUCaptureController isCaptureAvailable](self, "isCaptureAvailable"))
  {
    if (a4)
    {
      v6 = -22100;
      goto LABEL_14;
    }
    return 0;
  }
  if (-[CUCaptureController _isFailedConfigurationPreventingCapture](self, "_isFailedConfigurationPreventingCapture"))
  {
    if (a4)
    {
      v6 = -22102;
LABEL_14:
      CAMCaptureControllerError(v6, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v7;
      return result;
    }
    return 0;
  }
  if (!-[CUCaptureController _didCompleteInitialConfiguration](self, "_didCompleteInitialConfiguration"))
  {
    if (a4)
    {
      v6 = -22103;
      goto LABEL_14;
    }
    return 0;
  }
  if (-[CUCaptureController isInterrupted](self, "isInterrupted"))
  {
    if (a4)
    {
      v6 = -22101;
      goto LABEL_14;
    }
    return 0;
  }
  return 1;
}

- (BOOL)_internalCaptureStillImageWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  CAMUpdateFocusAndExposureForStartVideoRecordingCommand *v10;
  CAMWhiteBalanceCommand *v11;
  CAMStillImageCaptureCommand *v12;
  CAMCaptureCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = -[CUCaptureController _canBeginCaptureCheckAvailability:error:](self, "_canBeginCaptureCheckAvailability:error:", 1, a4);
  if (v7)
  {
    -[CUCaptureController _sanitizeStillImageRequest:](self, "_sanitizeStillImageRequest:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isCTMVideo"))
    {
      -[CUCaptureController _setCapturingCTMVideoRequest:](self, "_setCapturingCTMVideoRequest:", v8);
      v10 = -[CAMCaptureCommand initWithSubcommands:]([CAMUpdateFocusAndExposureForStartVideoRecordingCommand alloc], "initWithSubcommands:", 0);
      objc_msgSend(v9, "addObject:", v10);
      if (-[CUCaptureController _shouldLockWhiteBalanceForCTMVideoRequest:](self, "_shouldLockWhiteBalanceForCTMVideoRequest:", v8))
      {
        v11 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:]([CAMWhiteBalanceCommand alloc], "initWithWhiteBalanceMode:", 0);
        objc_msgSend(v9, "addObject:", v11);

      }
    }
    else if (objc_msgSend(v8, "lowLightMode"))
    {
      -[CUCaptureController _setCapturingLowLightStillImageRequest:](self, "_setCapturingLowLightStillImageRequest:", v8);
    }
    v12 = -[CAMStillImageCaptureCommand initWithRequest:]([CAMStillImageCaptureCommand alloc], "initWithRequest:", v8);
    objc_msgSend(v9, "addObject:", v12);
    v13 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v9);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enqueueCommand:", v13);
    -[CUCaptureController _powerController](self, "_powerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAssertionForIndentifier:withReason:", objc_msgSend(v8, "assertionIdentifier"), 1);
    objc_msgSend(v8, "burstIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CUCaptureController _burstController](self, "_burstController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processEnqueuedRequest:", v8);

    }
    -[CUCaptureController _updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:](self, "_updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:", v8);
    -[CUCaptureController _updateAvailabilityAfterEnqueuedRequest:](self, "_updateAvailabilityAfterEnqueuedRequest:", v8);

  }
  else
  {
    v8 = v6;
  }

  return v7;
}

- (void)resumeCapturingStillImagePairedVideo
{
  _BOOL4 v3;
  void *v4;
  CAMPausePairedVideoRecordingCommand *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = -[CUCaptureController _needsInitialPairedVideoUpdate](self, "_needsInitialPairedVideoUpdate");
  if (-[CUCaptureController _isCapturingPairedVideoPaused](self, "_isCapturingPairedVideoPaused") || v3)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CAMPausePairedVideoRecordingCommand initWithRecordingPaused:]([CAMPausePairedVideoRecordingCommand alloc], "initWithRecordingPaused:", 0);
    objc_msgSend(v4, "enqueueCommand:", v5);
    -[CUCaptureController _setCapturingPairedVideoPaused:](self, "_setCapturingPairedVideoPaused:", 0);
    -[CUCaptureController _setNeedsInitialPairedVideoUpdate:](self, "_setNeedsInitialPairedVideoUpdate:", 0);
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Resumed live photo video capture", v7, 2u);
    }

  }
}

- (void)prepareDeferredProcessingWithStillImageRequest:(id)a3
{
  id v4;
  CAMPrepareDeferredProcessingCommand *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CUCaptureController _deferredProcessingCoordinator](self, "_deferredProcessingCoordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D715E8]);
    -[CUCaptureController _setDeferredProcessingCoordinator:](self, "_setDeferredProcessingCoordinator:");
  }
  v5 = -[CAMPrepareDeferredProcessingCommand initWithRequest:coordinator:]([CAMPrepareDeferredProcessingCommand alloc], "initWithRequest:coordinator:", v4, v7);

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueCommand:", v5);

}

- (void)preparePhotoOutputForExpectedPhotoResolution:(int64_t)a3
{
  void *v5;
  CAMUltraHighResolutionZeroShutterLagEnabledCommand *v6;

  if (!-[CUCaptureController isCapturingBurst](self, "isCapturingBurst"))
  {
    v6 = -[CAMUltraHighResolutionZeroShutterLagEnabledCommand initWithEnabled:]([CAMUltraHighResolutionZeroShutterLagEnabledCommand alloc], "initWithEnabled:", a3 == 3);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueCommand:", v6);

  }
}

- (void)stillImageRequestWillStartCapturingVideo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "isCTMVideo");
  -[CUCaptureController _identifierForPendingVideoForStillImageRequest:](self, "_identifierForPendingVideoForStillImageRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldProtectPersistenceForVideo"))
  {
    -[CUCaptureController _protectionController](self, "_protectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startProtectingPersistenceForRequest:", v4);

  }
  -[CUCaptureController _protectionController](self, "_protectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startProtectingNebulaDaemonWritesForIdentifier:", v5);

  v8 = v5;
  pl_dispatch_async();

}

uint64_t __64__CUCaptureController_stillImageRequestWillStartCapturingVideo___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_beginTrackingCTMVideoRecordingForIdentifier:", v4);
  else
    return objc_msgSend(v3, "_beginTrackingLivePhotoVideoRecordingForIdentifier:", v4);
}

- (void)stillImageRequestDidBeginCaptureBeforeResolvingSettings:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_async();

}

void __79__CUCaptureController_stillImageRequestDidBeginCaptureBeforeResolvingSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "stillImageRequestDidBeginCaptureBeforeResolvingSettings:", *(_QWORD *)(a1 + 32));

}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_async();

}

void __67__CUCaptureController_stillImageRequestDidStopCapturingStillImage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:", 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "stillImageRequestDidStopCapturingStillImage:", *(_QWORD *)(a1 + 40));

}

- (void)stillImageRequestDidUnblockResponsiveCapture:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_async();

}

uint64_t __68__CUCaptureController_stillImageRequestDidUnblockResponsiveCapture___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterCapturedRequest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaximumNumberOfStillImageRequestsAfterCapturedRequestIfNecessary:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "stillImageRequestDidCompleteStillImageCapture:withResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)stillImageRequest:(id)a3 didStopCapturingLivePhotoVideoForCoordinationInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (objc_msgSend(a4, "isFinalExpectedVideoResult"))
  {
    -[CUCaptureController _identifierForPendingVideoForStillImageRequest:](self, "_identifierForPendingVideoForStillImageRequest:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    pl_dispatch_async();

  }
}

uint64_t __91__CUCaptureController_stillImageRequest_didStopCapturingLivePhotoVideoForCoordinationInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_endTrackingLivePhotoVideoRecordingForIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_resetFocusAndExposureAfterCaptureForType:", 1);
}

- (void)stillImageRequest:(id)a3 didStopCapturingCTMVideoForCoordinationInfo:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  if (objc_msgSend(a4, "isFinalExpectedVideoResult"))
  {
    -[CUCaptureController _identifierForPendingVideoForStillImageRequest:](self, "_identifierForPendingVideoForStillImageRequest:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v8 = v7;
    pl_dispatch_async();

  }
}

void __85__CUCaptureController_stillImageRequest_didStopCapturingCTMVideoForCoordinationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  CAMWhiteBalanceCommand *v3;
  void *v4;
  CAMUpdateFocusAndExposureForStopVideoRecordingCommand *v5;

  objc_msgSend(*(id *)(a1 + 32), "_endTrackingCTMVideoRecordingForIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = -[CAMCaptureCommand initWithSubcommands:]([CAMUpdateFocusAndExposureForStopVideoRecordingCommand alloc], "initWithSubcommands:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_captureEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueCommand:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldLockWhiteBalanceForCTMVideoRequest:", *(_QWORD *)(a1 + 48)))
  {
    v3 = -[CAMWhiteBalanceCommand initWithMatchExposureMode]([CAMWhiteBalanceCommand alloc], "initWithMatchExposureMode");
    objc_msgSend(*(id *)(a1 + 32), "_captureEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueCommand:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_resetFocusAndExposureAfterCaptureForType:", 3);

}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isCTMVideo");
  -[CUCaptureController _identifierForPendingVideoForStillImageRequest:](self, "_identifierForPendingVideoForStillImageRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinationInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isFinalExpectedVideoResult"))
  {
    -[CUCaptureController _protectionController](self, "_protectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopProtectingNebulaDaemonWritesForIdentifier:", v9);

  }
  if (v8)
  {
    v21 = v6;
    pl_dispatch_async();

  }
  objc_msgSend(v7, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CUCaptureController stillImageRequest:didCompleteVideoCaptureWithResult:].cold.1(v7, v13);

  }
  -[CUCaptureController resultDelegate](self, "resultDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "captureController:didGenerateVideoCaptureResult:fromRequest:", self, v7, v6);
  -[CUCaptureController _responseQueue](self, "_responseQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  v20 = v6;
  v16 = v10;
  v17 = v6;
  v18 = v7;
  pl_dispatch_async();

}

uint64_t __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_capturingCTMVideoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "_setCapturingCTMVideoRequest:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterCapturedRequest:", *(_QWORD *)(a1 + 40));
}

void __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke_94(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CAMVideoCaptureResponse *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  CAMVideoCaptureResponse *v27;
  id v28;
  CAMVideoCaptureResponse *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  CAMVideoCaptureResponse *v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  objc_msgSend(*(id *)(a1 + 32), "localDestinationURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "isEV0LocalVideoDestinationURL:", v2);
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v4, "persistenceUUID");
  else
    objc_msgSend(v4, "irisVideoPersistenceUUIDForEV0:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "irisStillImagePersistenceUUIDForEV0:", v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captureDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v43 = 0uLL;
  v44 = 0;
  v6 = *(void **)(a1 + 32);
  v32 = (void *)v5;
  if (v6 && (objc_msgSend(v6, "duration"), v7 = *(void **)(a1 + 32), v41 = 0uLL, v42 = 0, v7))
  {
    objc_msgSend(v7, "stillDisplayTime");
    v8 = *(void **)(a1 + 32);
  }
  else
  {
    v8 = 0;
    v41 = 0uLL;
    v42 = 0;
  }
  v9 = objc_msgSend(v8, "reason");
  objc_msgSend(*(id *)(a1 + 32), "videoZoomFactor");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
  v14 = +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", *(_QWORD *)(a1 + 40));
  v15 = 0;
  if (*(_BYTE *)(a1 + 64))
  {
    v16 = 0;
    if (!v12)
    {
      v17 = *(void **)(a1 + 48);
      v18 = *(_QWORD *)(a1 + 32);
      v40 = 0;
      objc_msgSend(v17, "_thumbnailImageFromVideoCaptureResult:previewOrientation:previewImage:", v18, v14, &v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v40;
    }
  }
  else
  {
    v16 = 0;
  }
  +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:", objc_msgSend(*(id *)(a1 + 32), "dimensions"), PLExifOrientationFromImageOrientation(), objc_msgSend(*(id *)(a1 + 40), "aspectRatioCrop"));
  v20 = v19;
  v22 = v21;
  v23 = [CAMVideoCaptureResponse alloc];
  v24 = objc_msgSend(*(id *)(a1 + 40), "captureMode");
  v25 = *(_QWORD *)(a1 + 56);
  v26 = objc_msgSend(*(id *)(a1 + 32), "slowWriterFrameDrops");
  v38 = v43;
  v39 = v44;
  v36 = v41;
  v37 = v42;
  LOBYTE(v30) = v26;
  v27 = -[CAMVideoCaptureResponse initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:](v23, "initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:", v31, v24, v13, v2, v32, &v38, v11, v20, v22, v33, &v36, v9, v15, v16, v25, v30);
  v34 = *(id *)(a1 + 40);
  v35 = v27;
  v28 = v12;
  v29 = v27;
  pl_dispatch_async();

}

void __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "stillImageRequestDidCompleteVideoCapture:withResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v3 = v5;
    }
  }

}

- (void)_beginTrackingLivePhotoVideoRecordingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[CUCaptureController _identifiersForActiveLivePhotoVideoCaptures](self, "_identifiersForActiveLivePhotoVideoCaptures");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject count](v5, "count");
    -[NSObject addObject:](v5, "addObject:", v4);
    v7 = -[NSObject count](v5, "count");
    if (!v6 && v7)
    {
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "stillImageRequestsWillStartCapturingLivePhotoVideo");

    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _beginTrackingLivePhotoVideoRecordingForIdentifier:].cold.1();
  }

}

- (void)_endTrackingLivePhotoVideoRecordingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[CUCaptureController _identifiersForActiveLivePhotoVideoCaptures](self, "_identifiersForActiveLivePhotoVideoCaptures");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject count](v5, "count");
    -[NSObject removeObject:](v5, "removeObject:", v4);
    v7 = -[NSObject count](v5, "count");
    if (v6 && !v7)
    {
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "stillImageRequestsDidCompleteCapturingLivePhotoVideo");

    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _endTrackingLivePhotoVideoRecordingForIdentifier:].cold.1();
  }

}

- (BOOL)isCapturingLivePhotoVideo
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _identifiersForActiveLivePhotoVideoCaptures](self, "_identifiersForActiveLivePhotoVideoCaptures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_beginTrackingCTMVideoRecordingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[CUCaptureController _identifiersForActiveCTMVideoCaptures](self, "_identifiersForActiveCTMVideoCaptures");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject count](v5, "count");
    -[NSObject addObject:](v5, "addObject:", v4);
    if (-[NSObject count](v5, "count"))
    {
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "stillImageRequestWillStartCapturingCTMVideoWithCaptureInFlight:", v6 != 0);

    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _beginTrackingCTMVideoRecordingForIdentifier:].cold.1();
  }

}

- (void)_endTrackingCTMVideoRecordingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[CUCaptureController _identifiersForActiveCTMVideoCaptures](self, "_identifiersForActiveCTMVideoCaptures");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject count](v5, "count");
    -[NSObject removeObject:](v5, "removeObject:", v4);
    v7 = -[NSObject count](v5, "count");
    if (v6 && !v7)
    {
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "stillImageRequestsDidStopCapturingCTMVideo");

    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _endTrackingCTMVideoRecordingForIdentifier:].cold.1();
  }

}

- (BOOL)isCapturingCTMVideo
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _capturingCTMVideoRequest](self, "_capturingCTMVideoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setCapturingCTMVideoRequest:(id)a3
{
  CAMStillImageCaptureRequest *v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  CAMStillImageCaptureRequest *v15;

  v5 = (CAMStillImageCaptureRequest *)a3;
  if (self->__capturingCTMVideoRequest != v5)
  {
    v15 = v5;
    v6 = -[CUCaptureController isCapturingCTMVideo](self, "isCapturingCTMVideo");
    objc_storeStrong((id *)&self->__capturingCTMVideoRequest, a3);
    v7 = -[CUCaptureController isCapturingCTMVideo](self, "isCapturingCTMVideo");
    v8 = v7;
    if (!v7 || v6)
    {
      if (v7 || !v6)
        goto LABEL_10;
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
        goto LABEL_10;
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stillImageRequestsWillRequestCTMVideoCaptureEnd");
    }
    else
    {
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_10:
        -[CUCaptureController _remoteShutterController](self, "_remoteShutterController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCapturingVideo:", v8);

        v5 = v15;
        goto LABEL_11;
      }
      -[CUCaptureController stillImageCapturingVideoDelegate](self, "stillImageCapturingVideoDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stillImageRequestsWillRequestCTMVideoCaptureStart");
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)hasActiveCTMVideoCaptures
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _identifiersForActiveCTMVideoCaptures](self, "_identifiersForActiveCTMVideoCaptures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isCapturingLowLightImage
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _capturingLowLightStillImageRequest](self, "_capturingLowLightStillImageRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)changeToLowLightMode:(int64_t)a3
{
  void *v4;
  CAMLowLightModeCommand *v5;

  v5 = -[CAMLowLightModeCommand initWithLowLightMode:]([CAMLowLightModeCommand alloc], "initWithLowLightMode:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (BOOL)isCapturingStandardVideo
{
  void *v2;
  BOOL v3;

  -[CUCaptureController _capturingVideoRequest](self, "_capturingVideoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_sanitizeVideoRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double Current;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[CUCaptureController _motionController](self, "_motionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptureOrientation:", objc_msgSend(v6, "captureOrientation"));
  objc_msgSend(v4, "localDestinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v5, "persistenceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v9, CFSTR("MOV"), objc_msgSend(v5, "shouldPersistToIncomingDirectory"), Current);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalDestinationURL:", v7);

  }
  if (objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode"))
    objc_msgSend(v5, "setMaximumRecordedDuration:", 120.0);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maximumRecordedFileSize");
  if (v12 >= 1)
  {
    v13 = v12;
    if (v12 < objc_msgSend(v5, "maximumRecordedFileSize"))
      objc_msgSend(v5, "setMaximumRecordedFileSize:", v13);
  }
  v14 = objc_msgSend(MEMORY[0x1E0D731D8], "freeDiskSpaceThreshold");
  v15 = objc_msgSend(v4, "remainingDiskUsageThreshold");
  if (v14 <= v15)
    v16 = v15;
  else
    v16 = v14;
  objc_msgSend(v5, "setRemainingDiskUsageThreshold:", v16);
  if (!objc_msgSend(v5, "assertionIdentifier"))
  {
    -[CUCaptureController _powerController](self, "_powerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssertionIdentifier:", objc_msgSend(v17, "generateAssertionIdentifier"));

  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (void)_processPendingVideoCaptureRequest:(id)a3
{
  id v4;
  void *v5;
  CAMTorchCommand *v6;
  void *v7;
  CAMVideoRecordingCameraSelectionBehaviorCommand *v8;
  CAMStartVideoRecordingCommand *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CAMUpdateFocusAndExposureForStartVideoRecordingCommand *v14;
  CAMWhiteBalanceCommand *v15;
  CAMCaptureCommand *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUCaptureController _locationController](self, "_locationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);
  v6 = -[CAMTorchCommand initWithTorchMode:]([CAMTorchCommand alloc], "initWithTorchMode:", objc_msgSend(v4, "torchMode"));
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMVideoRecordingCameraSelectionBehaviorCommand initWithCameraSwitchingEnabled:]([CAMVideoRecordingCameraSelectionBehaviorCommand alloc], "initWithCameraSwitchingEnabled:", objc_msgSend(v7, "shouldDisableCameraSwitchingDuringVideoRecordingForMode:", objc_msgSend(v4, "captureMode")) ^ 1);
  v9 = -[CAMStartVideoRecordingCommand initWithRequest:]([CAMStartVideoRecordingCommand alloc], "initWithRequest:", v4);
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18[0] = v6;
  v18[1] = v8;
  v18[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  if ((objc_msgSend(v4, "trueVideoEnabled") & 1) == 0)
  {
    -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", objc_msgSend(v4, "captureMode"), objc_msgSend(v4, "captureVideoConfiguration"), 1, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v13, 0);

  }
  if (-[CUCaptureController _shouldManageFocusForMode:](self, "_shouldManageFocusForMode:", objc_msgSend(v4, "captureMode")))
  {
    v14 = -[CAMCaptureCommand initWithSubcommands:]([CAMUpdateFocusAndExposureForStartVideoRecordingCommand alloc], "initWithSubcommands:", 0);
    objc_msgSend(v12, "insertObject:atIndex:", v14, 0);

  }
  if (-[CUCaptureController _shouldLockWhiteBalanceForVideoCaptureRequest:](self, "_shouldLockWhiteBalanceForVideoCaptureRequest:", v4))
  {
    v15 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:]([CAMWhiteBalanceCommand alloc], "initWithWhiteBalanceMode:", 0);
    objc_msgSend(v12, "insertObject:atIndex:", v15, 0);

  }
  v16 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v12);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enqueueCommand:", v16);
  -[CUCaptureController _setPendingVideoCaptureRequest:](self, "_setPendingVideoCaptureRequest:", 0);

}

- (BOOL)startCapturingVideoWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v11;

  v6 = a3;
  v11 = 0;
  v7 = -[CUCaptureController _internalStartCapturingVideoWithRequest:error:](self, "_internalStartCapturingVideoWithRequest:error:", v6, &v11);
  v8 = v11;
  if (!v7)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUCaptureController startCapturingVideoWithRequest:error:].cold.1((uint64_t)v6, v8);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)_internalStartCapturingVideoWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  CFAbsoluteTime Current;
  _QWORD v16[6];

  v6 = a3;
  if (-[CUCaptureController _canBeginCaptureCheckAvailability:error:](self, "_canBeginCaptureCheckAvailability:error:", 0, a4))
  {
    v7 = -[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo");
    if (v7)
    {
      if (a4)
      {
        CAMCaptureControllerError(-22100, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;
    }
    else
    {
      -[CUCaptureController _sanitizeVideoRequest:](self, "_sanitizeVideoRequest:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CUCaptureController _setPendingVideoCaptureRequest:](self, "_setPendingVideoCaptureRequest:", v8);
      -[CUCaptureController _setCapturingVideoRequest:](self, "_setCapturingVideoRequest:", v8);
      -[CUCaptureController _setWaitingForRecordingToStart:](self, "_setWaitingForRecordingToStart:", 1);
      -[CUCaptureController _powerController](self, "_powerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAssertionForIndentifier:withReason:", objc_msgSend(v8, "assertionIdentifier"), 2);

      v11 = objc_msgSend(v8, "trueVideoEnabled");
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11 && !objc_msgSend(v12, "isRegionalShutterSoundEnabled"))
      {
        -[CUCaptureController _didPlayBeginVideoRecordingSound](self, "_didPlayBeginVideoRecordingSound");
      }
      else
      {
        Current = CFAbsoluteTimeGetCurrent();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __69__CUCaptureController__internalStartCapturingVideoWithRequest_error___block_invoke;
        v16[3] = &unk_1EA328B18;
        *(CFAbsoluteTime *)&v16[5] = Current;
        v16[4] = self;
        AudioServicesPlaySystemSoundWithCompletion(0x45Du, v16);
      }
      -[CUCaptureController _updateAvailabilityAfterEnqueuedRequest:](self, "_updateAvailabilityAfterEnqueuedRequest:", v8);

    }
    v9 = !v7;
    v6 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __69__CUCaptureController__internalStartCapturingVideoWithRequest_error___block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v2 > 0.1)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Begin video recording sound took %.3f seconds", (uint8_t *)&v5, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_didPlayBeginVideoRecordingSound");
}

- (BOOL)stopCapturingVideo
{
  return -[CUCaptureController _stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:](self, "_stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:", 1);
}

- (BOOL)_stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  CAMStopVideoRecordingCommand *v10;
  CAMVideoCaptureResult *v11;
  CAMVideoCaptureResult *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint8_t buf[16];
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo"))
  {
    if (v3)
    {
      -[CUCaptureController _setVideoCaptureAvailable:](self, "_setVideoCaptureAvailable:", 0);
      -[CUCaptureController _capturingVideoRequest](self, "_capturingVideoRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUCaptureController _updateAvailabilityWhenPreparingToStopCapturingForRequest:](self, "_updateAvailabilityWhenPreparingToStopCapturingForRequest:", v5);

    }
    -[CUCaptureController _pendingVideoCaptureRequest](self, "_pendingVideoCaptureRequest");
    v6 = objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _capturingVideoRequest](self, "_capturingVideoRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _resetCapturingVideoState](self, "_resetCapturingVideoState");
    v8 = v6 == 0;
    if (v6)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Stopped capturing a video before the recording sound finished playing; pending request: %{public}@",
          buf,
          0xCu);
      }

      -[CUCaptureController videoRequestDidStopCapturing:](self, "videoRequestDidStopCapturing:", v6);
      CAMVideoCaptureRequestError(-28000, 0);
      v10 = (CAMStopVideoRecordingCommand *)objc_claimAutoreleasedReturnValue();
      v11 = [CAMVideoCaptureResult alloc];
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
      v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v16 = *(_OWORD *)buf;
      v17 = v19;
      LOBYTE(v15) = 0;
      v12 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v11, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", 0, 0, buf, &v16, 0, 0, 1.0, 0, 0, 0, v10, v15);
      -[CUCaptureController videoRequest:didCompleteCaptureWithResult:](self, "videoRequest:didCompleteCaptureWithResult:", v6, v12);

    }
    else
    {
      v10 = objc_alloc_init(CAMStopVideoRecordingCommand);
      -[CUCaptureController _captureEngine](self, "_captureEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "enqueueCommand:", v10);

    }
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring request to stop capturing video, because we aren't recording.", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)_setCapturingVideoRequest:(id)a3
{
  CAMVideoCaptureRequest *v5;
  _BOOL8 v6;
  void *v7;
  CAMVideoCaptureRequest *v8;

  v5 = (CAMVideoCaptureRequest *)a3;
  if (self->__capturingVideoRequest != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__capturingVideoRequest, a3);
    v6 = -[CUCaptureController isCapturingVideo](self, "isCapturingVideo");
    -[CUCaptureController _remoteShutterController](self, "_remoteShutterController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCapturingVideo:", v6);

    v5 = v8;
  }

}

- (void)_resetCapturingVideoState
{
  -[CUCaptureController _setPendingVideoCaptureRequest:](self, "_setPendingVideoCaptureRequest:", 0);
  -[CUCaptureController _setCapturingVideoRequest:](self, "_setCapturingVideoRequest:", 0);
  -[CUCaptureController _setWaitingForRecordingToStart:](self, "_setWaitingForRecordingToStart:", 0);
  -[CUCaptureController _setVideoCapturePaused:](self, "_setVideoCapturePaused:", 0);
}

- (void)changeToVideoRecordingCaptureOrientation:(int64_t)a3
{
  NSObject *v5;
  CAMSetVideoOrientationCommand *v6;
  void *v7;
  uint8_t v8[16];

  if (!-[CUCaptureController isCapturingVideo](self, "isCapturingVideo"))
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to change the video recording capture orientation because we are not recording.", v8, 2u);
    }

  }
  if (a3)
  {
    v6 = -[CAMSetVideoOrientationCommand initWithCaptureOrientation:]([CAMSetVideoOrientationCommand alloc], "initWithCaptureOrientation:", a3);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueCommand:", v6);

  }
}

- (BOOL)pauseCapturingVideo
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  BOOL v6;
  CAMPauseVideoRecordingCommand *v8;
  void *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;

  if (-[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo"))
  {
    if (-[CUCaptureController videoCapturePaused](self, "videoCapturePaused"))
    {
      v3 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v4 = "Ignoring request to pause capturing video because we are already paused.";
        v5 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
    else
    {
      if (!-[CUCaptureController _isWaitingForRecordingToStart](self, "_isWaitingForRecordingToStart"))
      {
        v6 = 1;
        -[CUCaptureController _setVideoCapturePaused:](self, "_setVideoCapturePaused:", 1);
        v8 = objc_alloc_init(CAMPauseVideoRecordingCommand);
        -[CUCaptureController _captureEngine](self, "_captureEngine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enqueueCommand:", v8);

        return v6;
      }
      v3 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v4 = "Ignoring request to pause capturing video because recording has not started.";
        v5 = (uint8_t *)&v10;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v4 = "Ignoring request to pause capturing video because we aren't recording.";
      v5 = (uint8_t *)&v12;
      goto LABEL_10;
    }
  }

  return 0;
}

- (BOOL)resumeCaptureVideo
{
  CAMResumeVideoRecordingCommand *v3;
  void *v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  if (-[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo"))
  {
    if (-[CUCaptureController videoCapturePaused](self, "videoCapturePaused"))
    {
      -[CUCaptureController _setVideoCapturePaused:](self, "_setVideoCapturePaused:", 0);
      v3 = objc_alloc_init(CAMResumeVideoRecordingCommand);
      -[CUCaptureController _captureEngine](self, "_captureEngine");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enqueueCommand:", v3);

      return 1;
    }
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v7 = "Ignoring request to resume capturing video because we are not paused.";
      v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "Ignoring request to resume capturing video because we aren't recording.";
      v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  return 0;
}

- (void)_didPlayBeginVideoRecordingSound
{
  pl_dispatch_async();
}

void __55__CUCaptureController__didPlayBeginVideoRecordingSound__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_pendingVideoCaptureRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_processPendingVideoCaptureRequest:", v2);
    v2 = v3;
  }

}

- (void)videoRequestDidStartCapturing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "shouldProtectPersistence"))
  {
    -[CUCaptureController _protectionController](self, "_protectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startProtectingPersistenceForRequest:", v4);
    objc_msgSend(v4, "persistenceUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startProtectingNebulaDaemonWritesForIdentifier:", v6);

  }
  v7 = v4;
  pl_dispatch_async();

}

void __53__CUCaptureController_videoRequestDidStartCapturing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_capturingVideoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "_setWaitingForRecordingToStart:", 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "videoRequestDidStartCapturing:", *(_QWORD *)(a1 + 40));
      v5 = v7;
    }
  }

}

- (void)videoRequestDidStopCapturing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "shouldProtectPersistence"))
  {
    objc_msgSend(v4, "persistenceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _protectionController](self, "_protectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopProtectingNebulaDaemonWritesForIdentifier:", v5);

  }
  v7 = v4;
  pl_dispatch_async();

}

void __52__CUCaptureController_videoRequestDidStopCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CAMUpdateFocusAndExposureForStopVideoRecordingCommand *v5;
  CAMWhiteBalanceCommand *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_capturingVideoRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v13 = (id)v2;
  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetCapturingVideoState");
    v3 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterStopCapturingForRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldManageFocusForMode:", objc_msgSend(*(id *)(a1 + 40), "captureMode")))
  {
    v5 = -[CAMCaptureCommand initWithSubcommands:]([CAMUpdateFocusAndExposureForStopVideoRecordingCommand alloc], "initWithSubcommands:", 0);
    objc_msgSend(v4, "enqueueCommand:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:", 3);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldLockWhiteBalanceForVideoCaptureRequest:", *(_QWORD *)(a1 + 40)))
  {
    v6 = -[CAMWhiteBalanceCommand initWithMatchExposureMode]([CAMWhiteBalanceCommand alloc], "initWithMatchExposureMode");
    objc_msgSend(v4, "enqueueCommand:", v6);

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "trueVideoEnabled");
  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", objc_msgSend(*(id *)(a1 + 40), "captureMode"), objc_msgSend(*(id *)(a1 + 40), "captureVideoConfiguration"), 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueCommand:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "_locationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v7 || objc_msgSend(v10, "isRegionalShutterSoundEnabled"))
    AudioServicesPlaySystemSound(0x45Eu);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "videoRequestDidStopCapturing:", *(_QWORD *)(a1 + 40));

}

- (void)videoRequest:(id)a3 didCompleteCaptureWithResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  pl_dispatch_async();
  -[CUCaptureController resultDelegate](self, "resultDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "captureController:didGenerateVideoCaptureResult:fromRequest:", self, v7, v8);
  -[CUCaptureController _responseQueue](self, "_responseQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  v11 = v8;
  v12 = v7;
  pl_dispatch_async();

}

uint64_t __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterCapturedRequest:", *(_QWORD *)(a1 + 40));
}

void __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CAMVideoCaptureResponse *v25;
  uint64_t v26;
  void *v27;
  char v28;
  CAMVideoCaptureResponse *v29;
  id v30;
  CAMVideoCaptureResponse *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  CAMVideoCaptureResponse *v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  id v45[2];

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v5 = +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", *(_QWORD *)(a1 + 40));
    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v45[0] = 0;
    objc_msgSend(v6, "_thumbnailImageFromVideoCaptureResult:previewOrientation:previewImage:", v7, v5, v45);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = v45[0];
  }
  objc_msgSend(*(id *)(a1 + 40), "persistenceUUID");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localDestinationURL");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captureDate");
  v10 = objc_claimAutoreleasedReturnValue();
  v43 = 0uLL;
  v44 = 0;
  v11 = *(void **)(a1 + 32);
  v33 = (void *)v10;
  v34 = (void *)v9;
  if (v11 && (objc_msgSend(v11, "duration"), v12 = *(void **)(a1 + 32), v41 = 0uLL, v42 = 0, v12))
  {
    v13 = (void *)v8;
    v14 = v3;
    v15 = (void *)v4;
    objc_msgSend(v12, "stillDisplayTime");
    v16 = *(void **)(a1 + 32);
  }
  else
  {
    v13 = (void *)v8;
    v14 = v3;
    v15 = (void *)v4;
    v16 = 0;
    v41 = 0uLL;
    v42 = 0;
  }
  v17 = objc_msgSend(v16, "reason");
  objc_msgSend(*(id *)(a1 + 32), "videoZoomFactor");
  v19 = v18;
  v20 = objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
  +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", *(_QWORD *)(a1 + 40));
  PLExifOrientationFromImageOrientation();
  objc_msgSend(*(id *)(a1 + 32), "dimensions");
  CAMSizeForDimensions();
  v22 = v21;
  v24 = v23;
  v25 = [CAMVideoCaptureResponse alloc];
  v26 = objc_msgSend(*(id *)(a1 + 40), "captureMode");
  objc_msgSend(*(id *)(a1 + 32), "coordinationInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(*(id *)(a1 + 32), "slowWriterFrameDrops");
  v39 = v43;
  v40 = v44;
  v37 = v41;
  v38 = v42;
  LOBYTE(v32) = v28;
  v29 = -[CAMVideoCaptureResponse initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:](v25, "initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:", v13, v26, v20, v34, v33, &v39, v19, v22, v24, 0, &v37, v17, v15, v14, v27, v32);

  v35 = *(id *)(a1 + 40);
  v36 = v29;
  v30 = v2;
  v31 = v29;
  pl_dispatch_async();

}

void __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "videoRequestDidCompleteCapture:withResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_powerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAssertionForIdentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "assertionIdentifier"), 2);

}

- (void)videoRequestDidResumeCapturing:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "CAMCaptureController videoRequestDidResumeCapturing:", buf, 2u);
  }

  v6 = v3;
  v5 = v3;
  pl_dispatch_async();

}

void __54__CUCaptureController_videoRequestDidResumeCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "videoRequestDidResumeCapturing:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (id)_sanitizePanoramaRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[CUCaptureController _motionController](self, "_motionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureOrientation:", objc_msgSend(v5, "panoramaCaptureOrientation"));
  if (!objc_msgSend(v4, "assertionIdentifier"))
  {
    -[CUCaptureController _powerController](self, "_powerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAssertionIdentifier:", objc_msgSend(v6, "generateAssertionIdentifier"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (BOOL)startCapturingPanoramaWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  CAMStartPanoramaCommand *v11;
  CAMCaptureCommand *v12;
  void *v13;
  CAMCaptureCommand *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CUCaptureController _canBeginCaptureCheckAvailability:error:](self, "_canBeginCaptureCheckAvailability:error:", 0, a4))
  {
    v7 = -[CUCaptureController isCapturingPanorama](self, "isCapturingPanorama");
    if (v7)
    {
      if (a4)
      {
        CAMCaptureControllerError(-22100, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[CUCaptureController _sanitizePanoramaRequest:](self, "_sanitizePanoramaRequest:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CUCaptureController _setCapturingPanoramaRequest:](self, "_setCapturingPanoramaRequest:", v9);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__CUCaptureController_startCapturingPanoramaWithRequest_error___block_invoke;
      v18[3] = &unk_1EA328868;
      v18[4] = self;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, v18);
      -[CUCaptureController _updateFocusAndExposureForStartPanorama](self, "_updateFocusAndExposureForStartPanorama");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CAMStartPanoramaCommand initWithRequest:]([CAMStartPanoramaCommand alloc], "initWithRequest:", v9);
      v12 = [CAMCaptureCommand alloc];
      v19[0] = v10;
      v19[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CAMCaptureCommand initWithSubcommands:](v12, "initWithSubcommands:", v13);

      -[CUCaptureController _captureEngine](self, "_captureEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enqueueCommand:", v14);
      -[CUCaptureController _powerController](self, "_powerController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAssertionForIndentifier:withReason:", objc_msgSend(v9, "assertionIdentifier"), 4);
      -[CUCaptureController _updateAvailabilityAfterEnqueuedRequest:](self, "_updateAvailabilityAfterEnqueuedRequest:", v9);

      v6 = v9;
    }
    v8 = !v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __63__CUCaptureController_startCapturingPanoramaWithRequest_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPlayBeginVideoRecordingSound");
}

- (id)_updateFocusAndExposureForStartPanorama
{
  CAMSubjectAreaChangeMonitoringCommand *v2;
  CAMFocusCommand *v3;
  CAMExposureCommand *v4;
  CAMWhiteBalanceCommand *v5;
  CAMCaptureCommand *v6;
  void *v7;
  CAMCaptureCommand *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v2 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", 0);
  v3 = -[CAMFocusCommand initWithFocusMode:]([CAMFocusCommand alloc], "initWithFocusMode:", 0);
  v4 = -[CAMExposureCommand initWithExposureMode:]([CAMExposureCommand alloc], "initWithExposureMode:", 0);
  v5 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:]([CAMWhiteBalanceCommand alloc], "initWithWhiteBalanceMode:", 0);
  v6 = [CAMCaptureCommand alloc];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMCaptureCommand initWithSubcommands:](v6, "initWithSubcommands:", v7);

  return v8;
}

- (BOOL)stopCapturingPanoramaInterrupted:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  CAMStopPanoramaCommand *v7;

  v3 = a3;
  v5 = -[CUCaptureController isCapturingPanorama](self, "isCapturingPanorama");
  if (v5)
  {
    AudioServicesPlaySystemSound(0x45Eu);
    -[CUCaptureController _setCapturingPanoramaRequest:](self, "_setCapturingPanoramaRequest:", 0);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMStopPanoramaCommand initWithInterrupted:]([CAMStopPanoramaCommand alloc], "initWithInterrupted:", v3);
    objc_msgSend(v6, "enqueueCommand:", v7);

  }
  return v5;
}

- (void)changeToPanoramaDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  CAMPanoramaDirectionCommand *v7;

  v7 = -[CAMPanoramaDirectionCommand initWithDirection:]([CAMPanoramaDirectionCommand alloc], "initWithDirection:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _remoteShutterController](self, "_remoteShutterController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPanoramaDirection:", a3);

  objc_msgSend(v5, "enqueueCommand:", v7);
}

- (void)changeToPanoramaEncodingBehavior:(int64_t)a3
{
  void *v4;
  CAMPanoramaEncodingCommand *v5;

  v5 = -[CAMPanoramaEncodingCommand initWithPhotoEncodingBehavior:]([CAMPanoramaEncodingCommand alloc], "initWithPhotoEncodingBehavior:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)panoramaRequestDidStartCapturing:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_async();

}

void __56__CUCaptureController_panoramaRequestDidStartCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "panoramaRequestDidStartCapturing:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  pl_dispatch_async();

}

void __67__CUCaptureController_panoramaRequestDidStopCapturing_interrupted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_capturingPanoramaRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = (id)v2;
  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setCapturingPanoramaRequest:", 0);
    v3 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterStopCapturingForRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:", 4);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "panoramaRequestDidStopCapturing:interrupted:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)panoramaRequest:(id)a3 didCompleteCaptureWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v12 = v6;
  pl_dispatch_async();
  -[CUCaptureController _responseQueue](self, "_responseQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v9 = v12;
  v10 = v7;
  pl_dispatch_async();

}

uint64_t __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityAfterCapturedRequest:", *(_QWORD *)(a1 + 40));
}

void __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  CAMStillImageCaptureResponse *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CAMStillImageCaptureResponse *v15;
  id v16;
  CAMStillImageCaptureResponse *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(a1[4], "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "assertionIdentifier");
  objc_msgSend(a1[6], "_thumbnailImageFromStillImageCaptureResult:imageOrientation:", a1[4], +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", a1[4], objc_msgSend(a1[5], "captureDevice"), objc_msgSend(a1[5], "captureOrientation")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "capturePhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "uniqueID");

  v6 = [CAMStillImageCaptureResponse alloc];
  objc_msgSend(a1[4], "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1[5], "sessionIdentifier");
  objc_msgSend(a1[4], "captureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "coordinationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CAMSizeForPhotoMetadata(v12);
  LOBYTE(v19) = 0;
  v15 = -[CAMStillImageCaptureResponse initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:](v6, "initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:", v7, v8, v9, v10, 0, 0, v13, v14, v2, 0, v11, v19, v5, objc_msgSend(a1[4], "semanticEnhancement"));

  v22 = a1[5];
  v16 = v21;
  v17 = v15;
  v18 = v20;
  pl_dispatch_async();

}

void __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke_3(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "panoramaRequestDidCompleteCapture:withResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "_powerController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 72), 4);

}

- (void)panoramaRequest:(id)a3 didReceiveNotification:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)(a4 + 6001) <= 1)
  {
    v7 = v5;
    pl_dispatch_async();

  }
}

uint64_t __62__CUCaptureController_panoramaRequest_didReceiveNotification___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "populateFromPanoramaCaptureNotification:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "stopCapturingPanoramaInterrupted:", 1);
}

- (unint64_t)currentBurstCount
{
  void *v2;
  unint64_t v3;

  -[CUCaptureController _burstController](self, "_burstController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentBurstCount");

  return v3;
}

- (BOOL)startCapturingBurstWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  CAMBlinkAndSmileDetectionCommand *v14;
  CAMCaptureCommand *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CAMCaptureRequestIntervalometer *v29;
  void *v30;
  void *v32;
  int v33;
  void *v34;
  CAMBlinkAndSmileDetectionCommand *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CUCaptureController _canBeginCaptureCheckAvailability:error:](self, "_canBeginCaptureCheckAvailability:error:", 1, a4);
  if (v7)
  {
    objc_msgSend(v6, "captureRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "captureDevice");
    v10 = objc_msgSend(v8, "captureMode");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isBurstSupportedForMode:device:", v10, v9);
    -[CUCaptureController _updateFocusAndExposureForStartBurstCapture](self, "_updateFocusAndExposureForStartBurstCapture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CAMBlinkAndSmileDetectionCommand initWithBlinkDetection:smileDetection:]([CAMBlinkAndSmileDetectionCommand alloc], "initWithBlinkDetection:smileDetection:", 1, 1);
    v15 = [CAMCaptureCommand alloc];
    v35 = v14;
    v36[0] = v13;
    v36[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CAMCaptureCommand initWithSubcommands:](v15, "initWithSubcommands:", v16);

    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v17;
    objc_msgSend(v18, "enqueueCommand:", v17);
    v33 = v12;
    if (v12)
    {
      v19 = v18;
      v32 = v13;
      -[CUCaptureController _burstController](self, "_burstController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "analyticsEvent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "analyticsEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v25 = (id)objc_msgSend(v20, "startBurstCaptureWithAnalyticsEvent:", v23);

      v24 = objc_msgSend(v11, "maximumBurstLength");
      v26 = objc_msgSend(v6, "maximumBurstLength");
      if (v26 >= v24)
        v27 = v24;
      else
        v27 = v26;
      if (v26 > 0)
        v24 = v27;
      v13 = v32;
      v18 = v19;
    }
    else
    {
      v24 = objc_msgSend(v6, "maximumBurstLength");
    }
    objc_msgSend(v11, "captureIntervalForDevice:", v9);
    v29 = -[CAMCaptureRequestIntervalometer initWithDelegate:interval:delay:maximumCount:]([CAMCaptureRequestIntervalometer alloc], "initWithDelegate:interval:delay:maximumCount:", self, v24, v28, v28);
    -[CAMCaptureRequestIntervalometer setPrototypeRequest:](v29, "setPrototypeRequest:", v8);
    -[CAMCaptureRequestIntervalometer startGeneratingRequests](v29, "startGeneratingRequests");
    -[CUCaptureController _setCurrentBurstIntervalometer:](self, "_setCurrentBurstIntervalometer:", v29);
    if (v33)
      AudioServicesStartSystemSound();
    -[CUCaptureController burstDelegate](self, "burstDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "captureControllerWillStartCapturingBurst:", self);
    -[CAMCaptureRequestIntervalometer manuallyGenerateRequest](v29, "manuallyGenerateRequest");

  }
  return v7;
}

- (id)_updateFocusAndExposureForStartBurstCapture
{
  CAMSubjectAreaChangeMonitoringCommand *v2;
  void *v3;
  uint64_t v4;
  CAMFocusCommand *v5;
  CAMCaptureCommand *v6;
  void *v7;
  CAMCaptureCommand *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", 0);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "captureOnTouchDown");

  v5 = -[CAMFocusCommand initWithFocusMode:]([CAMFocusCommand alloc], "initWithFocusMode:", v4);
  v6 = [CAMCaptureCommand alloc];
  v10[0] = v2;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMCaptureCommand initWithSubcommands:](v6, "initWithSubcommands:", v7);

  return v8;
}

- (void)stopCapturingBurst
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  CAMBlinkAndSmileDetectionCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  CUCaptureController *v19;

  if (-[CUCaptureController isCapturingBurst](self, "isCapturingBurst"))
  {
    -[CUCaptureController currentBurstIntervalometer](self, "currentBurstIntervalometer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prototypeRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "captureDevice");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBurstSupportedForMode:device:", objc_msgSend(v4, "captureMode"), v5);

    if (v7)
    {
      -[CUCaptureController _burstController](self, "_burstController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishBurstCaptureForDevice:", v5);

      objc_msgSend(v3, "stopGeneratingRequests");
      -[CUCaptureController _setCurrentBurstIntervalometer:](self, "_setCurrentBurstIntervalometer:", 0);
      AudioServicesStopSystemSound();
      -[CUCaptureController burstDelegate](self, "burstDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "captureControllerWillStartPlayingBurstEndSound:", self);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __41__CUCaptureController_stopCapturingBurst__block_invoke;
      v17 = &unk_1EA328A40;
      v18 = v9;
      v19 = self;
      v10 = v9;
      AudioServicesPlaySystemSoundWithCompletion(0x462u, &v14);

    }
    else
    {
      objc_msgSend(v3, "stopGeneratingRequests");
      -[CUCaptureController _setCurrentBurstIntervalometer:](self, "_setCurrentBurstIntervalometer:", 0);
    }
    -[CUCaptureController _resetFocusAndExposureAfterCaptureForType:](self, "_resetFocusAndExposureAfterCaptureForType:", 2, v14, v15, v16, v17);
    v11 = -[CAMBlinkAndSmileDetectionCommand initWithBlinkDetection:smileDetection:]([CAMBlinkAndSmileDetectionCommand alloc], "initWithBlinkDetection:smileDetection:", 0, 0);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueCommand:", v11);
    -[CUCaptureController burstDelegate](self, "burstDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "captureControllerDidStopCapturingBurst:", self);
    }

  }
}

void __41__CUCaptureController_stopCapturingBurst__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__CUCaptureController_stopCapturingBurst__block_invoke_2;
  v4[3] = &unk_1EA328A40;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __41__CUCaptureController_stopCapturingBurst__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "captureControllerDidStopPlayingBurstEndSound:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_processCapturedBurstRequest:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CUCaptureController _burstController](self, "_burstController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processCapturedRequest:withResult:", v7, v6);

}

- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v6 = a4;
  v7 = a3;
  -[CUCaptureController currentBurstIntervalometer](self, "currentBurstIntervalometer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v8 == v7
    && !objc_msgSend(v6, "type")
    && -[CUCaptureController captureStillImageWithRequest:error:](self, "captureStillImageWithRequest:error:", v6, 0);

  return v9;
}

- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "maximumCount");
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Reached maximum burst count: %ld", (uint8_t *)&v8, 0xCu);
  }

  AudioServicesStopSystemSound();
  -[CUCaptureController burstDelegate](self, "burstDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "captureControllerDidReachMaximumBurstLength:", self);

}

- (void)changeToSmartStyle:(id)a3
{
  id v4;
  void *v5;
  CAMSessionSmartStyleCommand *v6;

  v4 = a3;
  v6 = -[CAMSessionSmartStyleCommand initWithSmartStyle:]([CAMSessionSmartStyleCommand alloc], "initWithSmartStyle:", v4);

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:", v6);

}

- (void)setCapturingTimelapse:(BOOL)a3 forDevicePosition:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  CAMTimelapseCaptureRateCommand *v9;
  CAMImageControlModeCommand *v10;
  void *v11;
  CAMUpdateCaptureButtonControlsCommand *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (self->_capturingTimelapse != a3)
  {
    v5 = a3;
    self->_capturingTimelapse = a3;
    if (a3)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__CUCaptureController_setCapturingTimelapse_forDevicePosition___block_invoke;
      v15[3] = &unk_1EA328868;
      v15[4] = self;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, v15);
    }
    else
    {
      AudioServicesPlaySystemSound(0x45Eu);
      -[CUCaptureController _locationController](self, "_locationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", 1);
      -[CUCaptureController _scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:](self, "_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:", 3);

    }
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CAMTimelapseCaptureRateCommand initWithDefaultTimelapseCaptureRate]([CAMTimelapseCaptureRateCommand alloc], "initWithDefaultTimelapseCaptureRate");
    v10 = -[CAMImageControlModeCommand initWithCaptureMode:capturing:]([CAMImageControlModeCommand alloc], "initWithCaptureMode:capturing:", 5, v5);
    -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", 5, 0, self->_capturingTimelapse, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CAMUpdateCaptureButtonControlsCommand initWithRecording:captureMode:devicePosition:]([CAMUpdateCaptureButtonControlsCommand alloc], "initWithRecording:captureMode:devicePosition:", v5, 5, a4);
    v16[0] = v9;
    v16[1] = v10;
    v16[2] = v11;
    v16[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enqueueCommands:", v13);

    -[CUCaptureController _remoteShutterController](self, "_remoteShutterController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCapturingTimelapse:", v5);

  }
}

uint64_t __63__CUCaptureController_setCapturingTimelapse_forDevicePosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPlayBeginVideoRecordingSound");
}

- (void)changeToTimelapseCaptureRate:(float)a3
{
  CAMTimelapseCaptureRateCommand *v5;
  double v6;
  void *v7;
  CAMTimelapseCaptureRateCommand *v8;

  v5 = [CAMTimelapseCaptureRateCommand alloc];
  *(float *)&v6 = a3;
  v8 = -[CAMTimelapseCaptureRateCommand initWithTimelapseCaptureRate:](v5, "initWithTimelapseCaptureRate:", v6);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueCommand:", v8);

}

- (void)notifyTimelapseControllerFinishedUpdatingWithLocation
{
  id v2;

  -[CUCaptureController _locationController](self, "_locationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 0);

}

- (id)_commandForConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 outRequestID:(int *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  CAMFlashCommand *v19;
  CAMTorchCommand *v20;
  CAMHDRSuggestionMonitoringCommand *v21;
  CAMCaptureCommand *v22;
  void *v23;
  CAMCaptureCommand *v24;
  _QWORD v26[5];

  v7 = a5;
  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:outputToExternalStorage:](CAMCaptureConfiguration, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:", v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mode");
  v14 = objc_msgSend(v12, "devicePosition");
  v15 = 0;
  if (v13 > 7)
  {
    v16 = 0;
  }
  else if (((1 << v13) & 0x51) != 0)
  {
    v16 = objc_msgSend(v10, "flashMode");
    v15 = 0;
  }
  else
  {
    v16 = 0;
    if (((1 << v13) & 0x86) != 0)
    {
      v15 = objc_msgSend(v10, "torchMode");
      v16 = 0;
    }
  }
  if (objc_msgSend(v11, "isHDRSupportedForMode:devicePosition:", v13, v14))
    v17 = objc_msgSend(v10, "HDRMode") == 2;
  else
    v17 = 0;
  -[CUCaptureController _commandForChangeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:outRequestID:](self, "_commandForChangeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:outRequestID:", v12, v7, a6, a4, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CAMFlashCommand initWithFlashMode:]([CAMFlashCommand alloc], "initWithFlashMode:", v16);
  v20 = -[CAMTorchCommand initWithTorchMode:]([CAMTorchCommand alloc], "initWithTorchMode:", v15);
  v21 = -[CAMHDRSuggestionMonitoringCommand initWithHDRSuggestionMonitoringEnabled:]([CAMHDRSuggestionMonitoringCommand alloc], "initWithHDRSuggestionMonitoringEnabled:", v17);
  v22 = [CAMCaptureCommand alloc];
  v26[0] = v18;
  v26[1] = v19;
  v26[2] = v20;
  v26[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CAMCaptureCommand initWithSubcommands:](v22, "initWithSubcommands:", v23);

  return v24;
}

- (id)_commandForChangeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6 outRequestID:(int *)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  CUCaptureController *v18;
  char v19;
  void *v20;
  char v21;
  char v22;
  uint64_t v23;
  CAMModeAndDeviceCommand *v24;
  void *v25;
  CAMSetVideoZoomFactorCommand *v26;
  CAMLowLightConfigurationCommand *v27;
  CAMLowLightModeCommand *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CAMSetVideoZoomFactorCommand *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CAMSetExifFocalLengthsByZoomFactorCommand *v37;
  CAMCaptureCommand *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  void *v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CAMCaptureGraphConfiguration *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;

  v70 = a6;
  v11 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CUCaptureController _uniqueRequestIDForChangeToModeAndDevice](self, "_uniqueRequestIDForChangeToModeAndDevice");
  v14 = v13;
  if (a7)
    *a7 = v13;
  v74 = objc_msgSend(v11, "mode");
  v73 = objc_msgSend(v11, "device");
  v72 = v12;
  if (-[CUCaptureController isPreviewDisabled](self, "isPreviewDisabled"))
  {
    v69 = [CAMCaptureGraphConfiguration alloc];
    v68 = objc_msgSend(v11, "macroMode");
    v67 = objc_msgSend(v11, "videoConfiguration");
    v66 = objc_msgSend(v11, "audioConfiguration");
    v65 = objc_msgSend(v11, "mixAudioWithOthers");
    v64 = objc_msgSend(v11, "windNoiseRemovalEnabled");
    v63 = objc_msgSend(v11, "previewSampleBufferVideoFormat");
    objc_msgSend(v11, "previewFilters");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "videoThumbnailOutputConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v11, "photoEncodingBehavior");
    v59 = objc_msgSend(v11, "videoEncodingBehavior");
    v58 = objc_msgSend(v11, "enableAutoFPSVideo");
    v15 = objc_msgSend(v11, "isVideoHDRSuspended");
    v57 = objc_msgSend(v11, "aspectRatioCrop");
    v56 = objc_msgSend(v11, "photoQualityPrioritization");
    v55 = objc_msgSend(v11, "isCaptureMirrored");
    v54 = objc_msgSend(v11, "enableRAWCaptureIfSupported");
    v52 = objc_msgSend(v11, "semanticStyleSupport");
    objc_msgSend(v11, "previewSemanticStyle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v11, "enableContentAwareDistortionCorrection");
    v50 = objc_msgSend(v11, "enableResponsiveShutter");
    v49 = objc_msgSend(v11, "suspendLivePhotoCapture");
    v48 = objc_msgSend(v11, "videoStabilizationStrength");
    v47 = objc_msgSend(v11, "maximumPhotoResolution");
    v16 = objc_msgSend(v11, "colorSpace");
    v17 = objc_msgSend(v11, "enableDepthSuggestion");
    v18 = self;
    v19 = objc_msgSend(v11, "enableZoomPIP");
    objc_msgSend(v11, "customLensGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "enableStereoVideoCapture");
    v22 = objc_msgSend(v11, "trueVideoEnabled");
    BYTE2(v46) = objc_msgSend(v11, "prefersHDR10BitVideo");
    BYTE1(v46) = v22;
    LOBYTE(v46) = v21;
    BYTE1(v45) = v19;
    self = v18;
    LOBYTE(v45) = v17;
    v44 = v16;
    v12 = v72;
    BYTE2(v43) = v49;
    BYTE1(v43) = v50;
    LOBYTE(v43) = v51;
    BYTE1(v42) = v54;
    LOBYTE(v42) = v55;
    BYTE1(v41) = v15;
    LOBYTE(v41) = v58;
    LOBYTE(v40) = v64;
    v23 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v69, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v74, v73, v68, v67, v66, v65, v40, 0, v63, v62, v61,
            v60,
            v59,
            v41,
            v57,
            v56,
            v42,
            v52,
            v53,
            v43,
            v48,
            v47,
            v44,
            v45,
            v20,
            v46);

    v11 = (id)v23;
  }
  v24 = -[CAMModeAndDeviceCommand initWithGraphConfiguration:minimumExecutionTime:requestID:outputToExternalStorage:]([CAMModeAndDeviceCommand alloc], "initWithGraphConfiguration:minimumExecutionTime:requestID:outputToExternalStorage:", v11, v14, v70, a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[CAMSetVideoZoomFactorCommand initWithVideoZoomFactor:graphConfiguration:]([CAMSetVideoZoomFactorCommand alloc], "initWithVideoZoomFactor:graphConfiguration:", v11, a4);
  objc_msgSend(v25, "addObject:", v26);
  if (objc_msgSend(v12, "isLowLightSupported"))
  {
    v27 = -[CAMLowLightConfigurationCommand initWithLowLightEnabled:]([CAMLowLightConfigurationCommand alloc], "initWithLowLightEnabled:", objc_msgSend(v12, "isLowLightSupportedForMode:device:zoomFactor:", v74, v73, a4));
    objc_msgSend(v25, "addObject:", v27);
    v28 = -[CAMLowLightModeCommand initWithLowLightMode:]([CAMLowLightModeCommand alloc], "initWithLowLightMode:", 0);
    objc_msgSend(v25, "addObject:", v28);

  }
  -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", v74, objc_msgSend(v11, "videoConfiguration"), 0, -[CUCaptureController _wantsMachineReadableCodesForGraphConfiguration:](self, "_wantsMachineReadableCodesForGraphConfiguration:", v11), -[CUCaptureController _wantsImageAnalysisForGraphConfiguration:](self, "_wantsImageAnalysisForGraphConfiguration:", v11));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v29);
  if (objc_msgSend(v12, "focalLengthPickerSupported"))
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "customLensGroup");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v11, "videoConfiguration");
    v32 = v26;
    v33 = objc_msgSend(v11, "videoStabilizationStrength");
    v34 = objc_msgSend(v11, "trueVideoEnabled");
    v35 = v33;
    v26 = v32;
    +[CAMZoomControlUtilities exifFocalLengthsByZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:customLensGroup:isTrueVideo:](CAMZoomControlUtilities, "exifFocalLengthsByZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:customLensGroup:isTrueVideo:", v74, v73, v31, v35, v30, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[CAMSetExifFocalLengthsByZoomFactorCommand initWithExifFocalLengthsByZoomFactor:]([CAMSetExifFocalLengthsByZoomFactorCommand alloc], "initWithExifFocalLengthsByZoomFactor:", v36);
    objc_msgSend(v25, "addObject:", v37);

    v12 = v72;
  }
  v38 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v25);

  return v38;
}

- (void)updateRealtimeMetadataConfigurationForGraphConfiguration:(id)a3 isCapturing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = -[CUCaptureController _wantsMachineReadableCodesForGraphConfiguration:](self, "_wantsMachineReadableCodesForGraphConfiguration:", v6);
  v8 = -[CUCaptureController _wantsImageAnalysisForGraphConfiguration:](self, "_wantsImageAnalysisForGraphConfiguration:", v6);
  v9 = objc_msgSend(v6, "mode");
  v10 = objc_msgSend(v6, "videoConfiguration");

  -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", v9, v10, v4, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueueCommand:", v12);

}

- (id)_realtimeMetadataCommandsForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 capturing:(BOOL)a5 wantsMachineReadableCodes:(BOOL)a6 wantsImageAnalysis:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  CAMRealtimeMetadataCommand *v18;
  CAMFaceDrivenImageProcessingCommand *v19;
  CAMCaptureCommand *v20;
  void *v21;
  CAMCaptureCommand *v22;
  _QWORD v24[3];

  v7 = a7;
  v8 = a6;
  v24[2] = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;
  v15 = 1;
  v16 = 0;
  v17 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      if (v8)
      {
        objc_msgSend(v13, "addObject:", &unk_1EA3B0DA8);
        objc_msgSend(v14, "addObject:", &unk_1EA3B0DC0);
      }
      if (v7)
        objc_msgSend(v14, "addObject:", &unk_1EA3B0DD8);
      goto LABEL_9;
    case 1:
    case 2:
    case 8:
      if (a5)
        goto LABEL_3;
      goto LABEL_9;
    case 3:
      v15 = 0;
LABEL_9:
      v16 = 0;
      goto LABEL_10;
    case 5:
      goto LABEL_13;
    case 6:
    case 9:
      goto LABEL_10;
    case 7:
      v16 = 1;
LABEL_10:
      objc_msgSend(v14, "addObject:", &unk_1EA3B0D90);
      objc_msgSend(v14, "addObject:", &unk_1EA3B0DF0);
      objc_msgSend(v14, "addObject:", &unk_1EA3B0E08);
      if (v16)
      {
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E20);
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E38);
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E50);
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E68);
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E80);
      }
      v17 = v15;
LABEL_13:
      if (objc_msgSend(v12, "isExposureClippingIndicatorSupportedForMode:videoConfiguration:", a3, a4))
        objc_msgSend(v14, "addObject:", &unk_1EA3B0E98);
      break;
    default:
LABEL_3:
      v17 = 1;
      break;
  }
  v18 = -[CAMRealtimeMetadataCommand initWithTypes:]([CAMRealtimeMetadataCommand alloc], "initWithTypes:", v14);
  v19 = -[CAMFaceDrivenImageProcessingCommand initWithFaceDrivenImageProcessingEnabled:]([CAMFaceDrivenImageProcessingCommand alloc], "initWithFaceDrivenImageProcessingEnabled:", v17);
  v20 = [CAMCaptureCommand alloc];
  v24[0] = v18;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CAMCaptureCommand initWithSubcommands:](v20, "initWithSubcommands:", v21);

  return v22;
}

- (BOOL)_wantsImageAnalysisForGraphConfiguration:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isImageAnalysisEnabled");

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "mode");
  v8 = objc_msgSend(v3, "devicePosition");

  LOBYTE(v3) = objc_msgSend(v6, "isImageAnalysisSupportedForMode:devicePosition:", v7, v8);
  return v5 & v3;
}

- (int)changeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  int v16;
  uint8_t buf[16];

  v6 = a6;
  v10 = a3;
  if (-[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo"))
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Changing graph configuration while capturing video or while waiting for video capture. Attempting to stop video.", buf, 2u);
    }

    -[CUCaptureController _stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:](self, "_stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:", 0);
  }
  v16 = 0;
  -[CUCaptureController _commandForChangeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:outRequestID:](self, "_commandForChangeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:outRequestID:", v10, v6, &v16, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enqueueCommand:", v12);
  v14 = v16;

  return v14;
}

- (void)changeToTorchLevel:(float)a3
{
  CAMTorchCommand *v5;
  double v6;
  void *v7;
  CAMTorchCommand *v8;

  v5 = [CAMTorchCommand alloc];
  *(float *)&v6 = a3;
  v8 = -[CAMTorchCommand initWithTorchLevel:](v5, "initWithTorchLevel:", v6);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueCommand:", v8);

}

- (void)changeToPreviewDisabled
{
  void *v3;
  CAMPreviewConfigurationCommand *v4;

  if (!self->_previewDisabled)
  {
    self->_previewDisabled = 1;
    v4 = -[CAMPreviewConfigurationCommand initWithPreviewConfiguration:]([CAMPreviewConfigurationCommand alloc], "initWithPreviewConfiguration:", 0);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enqueueCommand:", v4);

  }
}

- (void)changeToPreviewEnabledWithConfiguration:(unint64_t)a3
{
  void *v4;
  CAMPreviewConfigurationCommand *v5;

  if (self->_previewDisabled)
  {
    self->_previewDisabled = 0;
    v5 = -[CAMPreviewConfigurationCommand initWithPreviewConfiguration:]([CAMPreviewConfigurationCommand alloc], "initWithPreviewConfiguration:", a3);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueCommand:", v5);

  }
}

- (void)changeToPreviewConfiguration:(unint64_t)a3
{
  void *v4;
  CAMPreviewConfigurationCommand *v5;

  if (!self->_previewDisabled)
  {
    v5 = -[CAMPreviewConfigurationCommand initWithPreviewConfiguration:]([CAMPreviewConfigurationCommand alloc], "initWithPreviewConfiguration:", a3);
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueCommand:", v5);

  }
}

- (void)changeToPreviewFilters:(id)a3 captureMode:(int64_t)a4
{
  id v6;
  CAMPreviewFiltersCommand *v7;

  v6 = a3;
  v7 = -[CAMPreviewFiltersCommand initWithFilters:captureMode:]([CAMPreviewFiltersCommand alloc], "initWithFilters:captureMode:", v6, a4);

  -[CAMCaptureEngine enqueueCommand:](self->__captureEngine, "enqueueCommand:", v7);
}

- (void)changeToVideoHDRSuspended:(BOOL)a3
{
  void *v4;
  CAMVideoHDRSuspensionCommand *v5;

  v5 = -[CAMVideoHDRSuspensionCommand initWithVideoHDRSuspended:]([CAMVideoHDRSuspensionCommand alloc], "initWithVideoHDRSuspended:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (BOOL)shouldAllowUserToChangeFocusAndExposure
{
  if (-[CUCaptureController isCapturingPanorama](self, "isCapturingPanorama")
    || -[CUCaptureController isCapturingTimelapse](self, "isCapturingTimelapse"))
  {
    return 0;
  }
  else
  {
    return !-[CUCaptureController isCapturingBurst](self, "isCapturingBurst");
  }
}

- (BOOL)_shouldLockWhiteBalanceForActiveVideoRequest
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CUCaptureController _capturingVideoRequest](self, "_capturingVideoRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CUCaptureController _shouldLockWhiteBalanceForVideoCaptureRequest:](self, "_shouldLockWhiteBalanceForVideoCaptureRequest:", v3))
  {
    v4 = 1;
  }
  else
  {
    -[CUCaptureController _capturingCTMVideoRequest](self, "_capturingCTMVideoRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CUCaptureController _shouldLockWhiteBalanceForCTMVideoRequest:](self, "_shouldLockWhiteBalanceForCTMVideoRequest:", v5);

  }
  return v4;
}

- (BOOL)_shouldLockWhiteBalanceForCTMVideoRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isCTMVideo"))
    v5 = objc_msgSend(v4, "wantsWhiteBalanceLockedDuringVideoRecording");
  else
    v5 = 0;

  return v5;
}

- (BOOL)_shouldLockWhiteBalanceForVideoCaptureRequest:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "wantsWhiteBalanceLocked");
  else
    return 0;
}

- (void)focusAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v10;
  CAMFocusCommand *v11;
  CAMSubjectAreaChangeMonitoringCommand *v12;
  void *v13;
  CAMCaptureCommand *v14;
  void *v15;
  _QWORD v16[3];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v16[2] = *MEMORY[0x1E0C80C00];
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v8 = -[CUCaptureController _useSmoothFocus](self, "_useSmoothFocus");
  v9 = -[CUCaptureController isCapturingVideo](self, "isCapturingVideo");
  if (v4)
    v10 = 2;
  else
    v10 = 3;
  v11 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v10, v8, x, y);
  v12 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", !v9);
  v16[0] = v11;
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v13);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enqueueCommand:", v14);

}

- (void)focusAndExposeAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4 resetExposureTargetBias:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double y;
  double x;
  _BOOL8 v10;
  uint64_t v11;
  CAMFocusCommand *v12;
  CAMExposureCommand *v13;
  void *v14;
  void *v15;
  CAMWhiteBalanceCommand *v16;
  void *v17;
  int v18;
  int v19;
  CAMExposureTargetBiasCommand *v20;
  double v21;
  CAMExposureTargetBiasCommand *v22;
  CAMSubjectAreaChangeMonitoringCommand *v23;
  CAMCaptureCommand *v24;
  void *v25;
  _QWORD v26[3];

  v5 = a5;
  v6 = a4;
  y = a3.y;
  x = a3.x;
  v26[2] = *MEMORY[0x1E0C80C00];
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v10 = -[CUCaptureController _useSmoothFocus](self, "_useSmoothFocus");
  if (v6)
    v11 = 2;
  else
    v11 = 3;
  v12 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v11, v10, x, y);
  v13 = -[CAMExposureCommand initWithExposureMode:atPointOfInterest:]([CAMExposureCommand alloc], "initWithExposureMode:atPointOfInterest:", 2, x, y);
  v26[0] = v12;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (!-[CUCaptureController _shouldLockWhiteBalanceForActiveVideoRequest](self, "_shouldLockWhiteBalanceForActiveVideoRequest"))
  {
    v16 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:]([CAMWhiteBalanceCommand alloc], "initWithWhiteBalanceMode:", 2);
    objc_msgSend(v15, "addObject:", v16);

  }
  if (v5)
  {
    -[CUCaptureController exposureDelegate](self, "exposureDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "baselineExposureValueForCaptureController:", self);
    v19 = v18;

    v20 = [CAMExposureTargetBiasCommand alloc];
    LODWORD(v21) = v19;
    v22 = -[CAMExposureTargetBiasCommand initWithExposureTargetBias:](v20, "initWithExposureTargetBias:", v21);
    objc_msgSend(v15, "addObject:", v22);

  }
  v23 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", -[CUCaptureController isCapturingVideo](self, "isCapturingVideo") ^ 1);
  objc_msgSend(v15, "addObject:", v23);

  v24 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v15);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "enqueueCommand:", v24);

}

- (id)_commandForLockingExposureIncludingFocus:(BOOL)a3
{
  _BOOL4 v3;
  CAMExposureCommand *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  CAMWhiteBalanceCommand *v9;
  uint64_t v10;
  CAMWhiteBalanceCommand *v11;
  CAMFocusCommand *v12;
  CAMCaptureCommand *v13;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = -[CAMExposureCommand initWithExposureMode:]([CAMExposureCommand alloc], "initWithExposureMode:", 0);
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!-[CUCaptureController _shouldLockWhiteBalanceForActiveVideoRequest](self, "_shouldLockWhiteBalanceForActiveVideoRequest"))
  {
    v8 = -[CUCaptureController isFlashActive](self, "isFlashActive");
    v9 = [CAMWhiteBalanceCommand alloc];
    if (v8)
      v10 = 2;
    else
      v10 = 0;
    v11 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:](v9, "initWithWhiteBalanceMode:", v10);
    objc_msgSend(v7, "addObject:", v11);

  }
  if (v3)
  {
    v12 = -[CAMFocusCommand initWithFocusMode:]([CAMFocusCommand alloc], "initWithFocusMode:", 0);
    objc_msgSend(v7, "addObject:", v12);

  }
  v13 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v7);

  return v13;
}

- (void)changeToLockedExposure
{
  void *v3;
  id v4;

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  -[CUCaptureController _commandForLockingExposureIncludingFocus:](self, "_commandForLockingExposureIncludingFocus:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueCommand:", v4);

}

- (void)changeToLockedFocusAndExposure
{
  void *v3;
  id v4;

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  -[CUCaptureController _commandForLockingExposureIncludingFocus:](self, "_commandForLockingExposureIncludingFocus:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueCommand:", v4);

}

- (void)resetFocusAndExposure
{
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  -[CUCaptureController _resetFocusAndExposureIfAppropriateForReason:](self, "_resetFocusAndExposureIfAppropriateForReason:", 3);
}

- (void)forceDisableSubjectAreaChangeMonitoring
{
  void *v3;
  CAMSubjectAreaChangeMonitoringCommand *v4;

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v4 = -[CAMSubjectAreaChangeMonitoringCommand initWithSubjectAreaChangeMonitoringEnabled:]([CAMSubjectAreaChangeMonitoringCommand alloc], "initWithSubjectAreaChangeMonitoringEnabled:", 0);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueCommand:", v4);

}

+ (float)focusLensPositionCurrentSentinel
{
  float result;

  +[CAMFocusLockWithLensPositionCommand currentLensPositionSentinel](CAMFocusLockWithLensPositionCommand, "currentLensPositionSentinel");
  return result;
}

- (void)lockFocusAtLensPosition:(float)a3 completionBlock:(id)a4
{
  id v6;
  CAMFocusLockWithLensPositionCommand *v7;
  id v8;
  double v9;
  CAMFocusLockWithLensPositionCommand *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v7 = [CAMFocusLockWithLensPositionCommand alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke;
  v12[3] = &unk_1EA32D4A0;
  v13 = v6;
  v8 = v6;
  *(float *)&v9 = a3;
  v10 = -[CAMFocusLockWithLensPositionCommand initWithLensPosition:completionBlock:](v7, "initWithLensPosition:completionBlock:", v12, v9);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueueCommand:", v10);

}

void __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  pl_dispatch_async();

}

uint64_t __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(float))(result + 16))(*(float *)(a1 + 40));
  return result;
}

- (void)focusAtCenterForVideoRecording
{
  void *v3;
  int v4;
  void *v5;
  CAMFocusAtCenterForVideoRecordingCommand *v6;
  void *v7;
  void *v8;

  if (-[CUCaptureController isCapturingVideo](self, "isCapturingVideo"))
  {
    -[CUCaptureController focusDelegate](self, "focusDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    if (!v3
      || (v4 = objc_msgSend(v3, "captureController:shouldResetFocusAndExposureForReason:", self, 2), v5 = v8, v4))
    {
      v6 = objc_alloc_init(CAMFocusAtCenterForVideoRecordingCommand);
      -[CUCaptureController _captureEngine](self, "_captureEngine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enqueueCommand:", v6);

      v5 = v8;
    }

  }
}

- (void)setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  CAMCinematicFocusCommand *v12;
  int64_t v13;
  void *v14;
  CAMCinematicFocusCommand *v15;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = [CAMCinematicFocusCommand alloc];
  v13 = -[CUCaptureController _cinematicMetadataObjectIDForMetadataObject:](self, "_cinematicMetadataObjectIDForMetadataObject:", v11);

  v15 = -[CAMCinematicFocusCommand initWithMetadataObjectID:atPointOfInterest:useFixedOpticalFocus:useHardFocus:](v12, "initWithMetadataObjectID:atPointOfInterest:useFixedOpticalFocus:useHardFocus:", v13, v7, v6, x, y);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enqueueCommand:", v15);

}

- (void)setCinematicFocusAtPoint:(CGPoint)a3 useFixedOpticalFocus:(BOOL)a4 useHardFocus:(BOOL)a5
{
  -[CUCaptureController setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", 0, a4, a5, a3.x, a3.y);
}

- (int64_t)_cinematicMetadataObjectIDForMetadataObject:(id)a3
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v7;
  uint8_t v8[16];

  if (a3)
  {
    objc_msgSend(a3, "underlyingMetadataObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "faceID");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = objc_msgSend(v3, "bodyID");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v8 = 0;
            _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Cinematic: Trying to find ID for Cinematic focus for an unsupported metadata object", v8, 2u);
          }

          v5 = -1;
          goto LABEL_10;
        }
        v4 = objc_msgSend(v3, "objectID");
      }
    }
    v5 = v4;
LABEL_10:

    return v5;
  }
  return -1;
}

- (BOOL)_shouldManageFocusForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x37Fu >> a3);
}

- (BOOL)_shouldResetFocusAndExposureAfterCapture
{
  if (-[CUCaptureController isCapturingLivePhotoVideo](self, "isCapturingLivePhotoVideo")
    || -[CUCaptureController isCapturingStandardVideo](self, "isCapturingStandardVideo")
    || -[CUCaptureController isCapturingBurst](self, "isCapturingBurst")
    || -[CUCaptureController isCapturingTimelapse](self, "isCapturingTimelapse"))
  {
    return 0;
  }
  else
  {
    return !-[CUCaptureController hasActiveCTMVideoCaptures](self, "hasActiveCTMVideoCaptures");
  }
}

- (void)_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:(int64_t)a3
{
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  double v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  -[CUCaptureController focusDelegate](self, "focusDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v5, "captureController:shouldResetFocusAndExposureAfterCaptureForType:", self, a3);

  if ((_DWORD)a3)
  {
    if (-[CUCaptureController _shouldResetFocusAndExposureAfterCapture](self, "_shouldResetFocusAndExposureAfterCapture"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0
        && (v8 = objc_loadWeakRetained((id *)&self->_focusDelegate),
            objc_msgSend(v8, "captureControllerDelayBeforeResettingFocusAndExposureAfterCapture:", self),
            v10 = v9,
            v8,
            v10 > 0.0))
      {
        -[CUCaptureController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resetFocusAndExposureAfterCapture, 0, v10);
      }
      else
      {
        -[CUCaptureController _resetFocusAndExposureAfterCapture](self, "_resetFocusAndExposureAfterCapture");
      }
    }
    else
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Not scheduling focus/exposure reset because still capturing", v12, 2u);
      }

    }
  }
}

- (void)_resetFocusAndExposureAfterCaptureForType:(int64_t)a3
{
  void *v5;

  -[CUCaptureController focusDelegate](self, "focusDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v5, "captureController:shouldResetFocusAndExposureAfterCaptureForType:", self, a3);

  if ((_DWORD)a3)
    -[CUCaptureController _resetFocusAndExposureAfterCapture](self, "_resetFocusAndExposureAfterCapture");
}

- (void)changeExposureTargetBias:(float)a3
{
  CAMExposureTargetBiasCommand *v5;
  double v6;
  void *v7;
  CAMExposureTargetBiasCommand *v8;

  -[CUCaptureController cancelDelayedFocusAndExposureReset](self, "cancelDelayedFocusAndExposureReset");
  v5 = [CAMExposureTargetBiasCommand alloc];
  *(float *)&v6 = a3;
  v8 = -[CAMExposureTargetBiasCommand initWithExposureTargetBias:](v5, "initWithExposureTargetBias:", v6);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueCommand:", v8);

}

- (void)_teardownFocusAndExposureMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _focusKVOKeyPaths](self, "_focusKVOKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++), CAMFocusResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }
  -[CUCaptureController _exposureKVOKeyPaths](self, "_exposureKVOKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), CAMExposureResultContext);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:name:object:", self, *MEMORY[0x1E0C89F50], 0);

}

- (void)stopMonitoringForHDRSuggestions
{
  CAMHDRSuggestionMonitoringCommand *v2;
  id v3;

  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[CAMHDRSuggestionMonitoringCommand initWithHDRSuggestionMonitoringEnabled:]([CAMHDRSuggestionMonitoringCommand alloc], "initWithHDRSuggestionMonitoringEnabled:", 0);
  objc_msgSend(v3, "enqueueCommand:", v2);

}

- (void)_teardownSuggestionMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _suggestionKeyPaths](self, "_suggestionKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CAMSuggestionResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateAutoMacroSuggested
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuperWideAutoMacroSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentCameraDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "preferredPrimaryConstituentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoZoomFactor");
    v9 = v8;
    objc_msgSend(v6, "virtualDeviceSwitchOverVideoZoomFactors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v7, "deviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "isRampingVideoZoom") || v9 < v13)
    {
      v16 = v9 >= v13 && v14 == (void *)*MEMORY[0x1E0C89F98];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __48__CUCaptureController__updateAutoMacroSuggested__block_invoke;
      v17[3] = &unk_1EA328908;
      v18 = v16;
      v17[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v17);
    }

  }
}

void __48__CUCaptureController__updateAutoMacroSuggested__block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "isAutoMacroSuggested"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutoMacroSuggested:", *(unsigned __int8 *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "captureController:didChangeAutoMacroSuggested:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_updateAutoMacroActive
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuperWideAutoMacroSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentCameraDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "activePrimaryConstituentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoZoomFactor");
    v9 = v8;
    objc_msgSend(v6, "virtualDeviceSwitchOverVideoZoomFactors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v7, "deviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "isRampingVideoZoom") || v9 < v13)
    {
      v16 = v9 >= v13 && v14 == (void *)*MEMORY[0x1E0C89F98];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __45__CUCaptureController__updateAutoMacroActive__block_invoke;
      v17[3] = &unk_1EA328908;
      v18 = v16;
      v17[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v17);
    }

  }
}

void __45__CUCaptureController__updateAutoMacroActive__block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "isAutoMacroActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutoMacroActive:", *(unsigned __int8 *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "captureController:didChangeAutoMacroActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  int v2;
  CAMWhiteBalanceCommand *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_setFlashActive:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureController:didOutputFlashActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldLockWhiteBalanceForActiveVideoRequest") & 1) == 0)
  {
    v2 = *(unsigned __int8 *)(a1 + 48);
    v3 = [CAMWhiteBalanceCommand alloc];
    if (v2)
      v4 = -[CAMWhiteBalanceCommand initWithWhiteBalanceMode:](v3, "initWithWhiteBalanceMode:", 2);
    else
      v4 = -[CAMWhiteBalanceCommand initWithMatchExposureMode](v3, "initWithMatchExposureMode");
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 40), "enqueueCommand:", v4);

  }
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setTorchActive:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputTorchActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setLowLightStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputLowLightStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputLowLightModeDurationMapping:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)_teardownAvailabilityMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _availabilityKeyPaths](self, "_availabilityKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CAMAvailabilityResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setTorchAvailable:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "availabilityDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputTorchAvailability:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "flashCompromise"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setFlashCompromise:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "availabilityDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "captureController:didOutputFlashCompromise:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;

  v16 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CUCaptureController _maximumNumberOfStillImageRequests](self, "_maximumNumberOfStillImageRequests");
  if (!v5)
    v5 = objc_msgSend(v4, "maximumNumberOfInflightRequests");
  v6 = objc_msgSend(v16, "ctmCaptureType");
  v7 = v16;
  if (v6 != 2)
  {
    v8 = objc_msgSend(v16, "flashMode");
    v9 = -[CUCaptureController isFlashActive](self, "isFlashActive");
    if (v8 == 1 || v8 == 2 && v9)
      v5 = 1;
    v10 = objc_msgSend(v16, "hdrMode");
    v11 = -[CUCaptureController isHDRSuggested](self, "isHDRSuggested");
    v7 = v16;
    if (v10 == 1 || v10 == 2 && v11)
      v5 = 1;
  }
  objc_msgSend(v7, "burstIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v5 = -[CUCaptureController _maximumNumberOfStillImageRequestsDuringBurst](self, "_maximumNumberOfStillImageRequestsDuringBurst");
  if ((objc_msgSend(v4, "portraitModeOverlappingCapturesSupported") & 1) != 0)
  {
    v13 = v16;
  }
  else
  {
    objc_msgSend(v16, "adjustmentFilters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[CAMEffectFilterManager isDepthEffectInFilters:](CAMEffectFilterManager, "isDepthEffectInFilters:", v14);

    v13 = v16;
    if (v15)
      v5 = 1;
  }
  if (objc_msgSend(v13, "lowLightMode"))
    v5 = 1;
  if (objc_msgSend(v16, "maximumPhotoResolution") == 3
    && !objc_msgSend(v4, "supportsOverlappingCapturesForResolution:", 3))
  {
    v5 = 1;
  }
  -[CUCaptureController _setMaximumNumberOfStillImageRequests:](self, "_setMaximumNumberOfStillImageRequests:", v5);

}

- (void)_updateMaximumNumberOfStillImageRequestsAfterBurst
{
  id v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _setMaximumNumberOfStillImageRequests:](self, "_setMaximumNumberOfStillImageRequests:", objc_msgSend(v3, "maximumNumberOfInflightRequests"));

}

- (unint64_t)_maximumNumberOfStillImageRequestsDuringBurst
{
  void *v2;
  unint64_t v3;
  void *v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isPipelinedStillImageProcessingSupported") & 1) != 0)
  {
    v3 = 3;
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "maximumNumberOfInflightRequests");

  }
  return v3;
}

- (void)logCaptureAvailabilityDescription
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (-[CUCaptureController isCaptureAvailable](self, "isCaptureAvailable"))
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Capture is available", v5, 2u);
    }

  }
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInflightCapturesStringWithCompletionHandler:", &__block_literal_global_37);

}

void __56__CUCaptureController_logCaptureAvailabilityDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture unavailable. Still image requests: %@ and / or video requests: %@ are still in flight"), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

}

- (BOOL)_shouldTrackInflightCountForRequest:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "type"))
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "ctmCaptureType") != 2;

  return v4;
}

- (void)_updateAvailabilityWhenPreparingToStopCapturingForRequest:(id)a3
{
  -[CUCaptureController _updateAvailabilityForRequestType:](self, "_updateAvailabilityForRequestType:", objc_msgSend(a3, "type"));
}

- (void)_updateAvailabilityAfterStopCapturingForRequest:(id)a3
{
  -[CUCaptureController _updateAvailabilityForRequestType:](self, "_updateAvailabilityForRequestType:", objc_msgSend(a3, "type"));
}

- (void)_notifyDelegateOfCaptureAvailabilityChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CUCaptureController availabilityDelegate](self, "availabilityDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:didOutputCaptureAvailability:", self, v3);

}

- (void)_notifyDelegateOfConfigurationAvailabilityChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CUCaptureController availabilityDelegate](self, "availabilityDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:didOutputConfigurationAvailability:", self, v3);

}

- (void)metadataWasRecognized:(id)a3 forMetadataObjectTypes:(id)a4 deviceFormat:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  CAMMachineReadableCodeResult *v17;
  CAMFaceResult *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  int v26;
  CAMHistogramResult *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  CAMHistogramResult *v48;
  id v49;
  uint64_t v50;
  id v51;
  CAMHistogramResult *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v43 = a4;
  v47 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (!v11)
  {
    v48 = 0;
    v14 = v51;
    goto LABEL_42;
  }
  v12 = v11;
  v48 = 0;
  v13 = *(_QWORD *)v61;
  v50 = *MEMORY[0x1E0C8AA60];
  v44 = *MEMORY[0x1E0C8AA70];
  v14 = v51;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v61 != v13)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v15);
      if (objc_msgSend(v16, "isHumanFace"))
      {
        v17 = v16;
        v18 = -[CAMFaceResult initWithFaceObject:]([CAMFaceResult alloc], "initWithFaceObject:", v17);
        v19 = v8;
        goto LABEL_8;
      }
      if ((objc_msgSend(v16, "isPetHead") & 1) != 0 || objc_msgSend(v16, "isHumanHead"))
      {
        v18 = -[CAMHeadObjectResult initWithHeadObject:]([CAMHeadObjectResult alloc], "initWithHeadObject:", v16);
        objc_msgSend(v9, "addObject:", v18);
        goto LABEL_14;
      }
      if ((objc_msgSend(v16, "isPetBody") & 1) != 0 || objc_msgSend(v16, "isHumanBody"))
      {
        v17 = v16;
        v18 = -[CAMBodyObjectResult initWithBodyObject:]([CAMBodyObjectResult alloc], "initWithBodyObject:", v17);
        v19 = v14;
        goto LABEL_8;
      }
      if (objc_msgSend(v16, "isSalientObject"))
      {
        v17 = v16;
        v18 = -[CAMSalientObjectResult initWithSalientObject:]([CAMSalientObjectResult alloc], "initWithSalientObject:", v17);
        v19 = v53;
LABEL_8:
        v20 = v18;
LABEL_9:
        objc_msgSend(v19, "addObject:", v20);
LABEL_10:

        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v16;
        v17 = -[CAMMachineReadableCodeResult initWithMachineReadableCodeObject:]([CAMMachineReadableCodeResult alloc], "initWithMachineReadableCodeObject:", v18);
        v21 = -[CAMMachineReadableCodeResult mrcType](v17, "mrcType");
        if (v21 == 2)
        {
          v28 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            -[CAMFaceResult description](v18, "description");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v65 = (uint64_t)v41;
            _os_log_impl(&dword_1DB760000, v28, OS_LOG_TYPE_DEFAULT, "Unknown machine readable code type %{public}@", buf, 0xCu);

          }
          v14 = v51;
          goto LABEL_10;
        }
        if (v21 == 1)
        {
          v19 = v45;
        }
        else
        {
          if (v21)
            goto LABEL_10;
          v19 = v46;
        }
        v20 = v17;
        goto LABEL_9;
      }
      objc_msgSend(v16, "type");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", v50);

      if (v23)
      {
        v24 = v16;
        v18 = -[CAMTextRegionResult initWithTextRegionObject:]([CAMTextRegionResult alloc], "initWithTextRegionObject:", v24);
        objc_msgSend(v49, "addObject:", v18);
      }
      else
      {
        objc_msgSend(v16, "type");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v44);

        if (v26)
        {
          v18 = v16;
          v27 = -[CAMHistogramResult initWithHistogramObject:forDeviceFormat:]([CAMHistogramResult alloc], "initWithHistogramObject:forDeviceFormat:", v18, v47);

          v48 = v27;
          goto LABEL_38;
        }
        v18 = (CAMFaceResult *)os_log_create("com.apple.camera", "Camera");
        if (!os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
          goto LABEL_38;
        v29 = objc_opt_class();
        objc_msgSend(v16, "type");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v29;
        v66 = 2114;
        v67 = v24;
        _os_log_impl(&dword_1DB760000, &v18->super, OS_LOG_TYPE_DEFAULT, "Unhandled metadata object %{public}@/%{public}@", buf, 0x16u);
      }

LABEL_38:
      v14 = v51;
LABEL_14:

      ++v15;
    }
    while (v12 != v15);
    v30 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    v12 = v30;
  }
  while (v30);
LABEL_42:

  objc_msgSend(v43, "count");
  -[CUCaptureController _burstController](self, "_burstController");
  v31 = v14;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "processFaceResults:", v8);
  v55 = v10;
  v56 = v8;
  v57 = v9;
  v58 = v31;
  v59 = v53;
  v52 = v48;
  v54 = v53;
  v33 = v31;
  v34 = v9;
  v35 = v8;
  v36 = v49;
  v37 = v45;
  v38 = v10;
  v39 = v46;
  v40 = v43;
  pl_dispatch_async();

}

void __81__CUCaptureController_metadataWasRecognized_forMetadataObjectTypes_deviceFormat___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (*(_BYTE *)(a1 + 120))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA38]);
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA20]) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA10]) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA40]);
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA50]);
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA08]);
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA60]);
    v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA58]);
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA48]) & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA18]) & 1) == 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x1E0C8AA28]);
      if (((v2 | v3 | v7) & 1) == 0 && !v8)
      {
        if (!v4)
          goto LABEL_13;
        goto LABEL_24;
      }
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
      LOBYTE(v4) = 1;
    else
      LOBYTE(v4) = objc_msgSend(*(id *)(a1 + 48), "count") == 0;
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
      v5 = 1;
    else
      v5 = objc_msgSend(*(id *)(a1 + 48), "count") == 0;
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
      v6 = 1;
    else
      v6 = objc_msgSend(*(id *)(a1 + 48), "count") == 0;
  }
  objc_msgSend(*(id *)(a1 + 72), "facesDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "captureController:didOutputFaceResults:headResults:bodyResults:salientObjectResults:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));

  if ((v4 & 1) == 0)
  {
LABEL_13:
    if (v5)
      goto LABEL_14;
LABEL_25:
    if (!v6)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_24:
  objc_msgSend(*(id *)(a1 + 72), "machineReadableCodeDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "captureController:didOutputQRCodeResults:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));

  if ((v5 & 1) == 0)
    goto LABEL_25;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 72), "machineReadableCodeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "captureController:didOutputAppClipCodeResults:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));

  if ((v6 & 1) != 0)
  {
LABEL_26:
    objc_msgSend(*(id *)(a1 + 72), "textRegionResultDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "captureController:didOutputTextRegionResults:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

  }
LABEL_27:
  if (*(_QWORD *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 72), "histogramDelegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "captureController:didOutputHistogramResult:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 112));

  }
}

- (void)_subjectAreaDidChange:(id)a3
{
  -[CUCaptureController _resetFocusAndExposureIfAppropriateForReason:](self, "_resetFocusAndExposureIfAppropriateForReason:", 0);
}

- (void)queryVideoDimensionsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  CAMQueryVideoDimensionsCommand *v6;
  id v7;
  CAMQueryVideoDimensionsCommand *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CAMQueryVideoDimensionsCommand alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1EA32D580;
  v10 = v4;
  v7 = v4;
  v8 = -[CAMQueryVideoDimensionsCommand initWithCompletionBlock:](v6, "initWithCompletionBlock:", v9);
  objc_msgSend(v5, "enqueueCommand:", v8);

}

void __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  pl_dispatch_async();

}

uint64_t __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[5], a1[6]);
  return result;
}

- (void)queryTimelapseDimensionsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  CAMQueryTimelapseDimensionsCommand *v6;
  id v7;
  CAMQueryTimelapseDimensionsCommand *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CAMQueryTimelapseDimensionsCommand alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1EA32D5D0;
  v10 = v4;
  v7 = v4;
  v8 = -[CAMQueryTimelapseDimensionsCommand initWithCompletionBlock:](v6, "initWithCompletionBlock:", v9);
  objc_msgSend(v5, "enqueueCommand:", v8);

}

void __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  pl_dispatch_async();

}

uint64_t __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  return result;
}

- (void)willPerformRecoveryFromRuntimeError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CUCaptureController_willPerformRecoveryFromRuntimeError___block_invoke;
  v6[3] = &unk_1EA328A40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cam_perform_on_main_asap(v6);

}

void __59__CUCaptureController_willPerformRecoveryFromRuntimeError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recoveryDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:willRecoverFromRuntimeError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)startCaptureSessionWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startWithRetryCount:retryInterval:logReason:completion:", a3, v11, v10, a4);

}

- (void)startCaptureSession
{
  -[CUCaptureController startCaptureSessionWithRetryCount:retryInterval:logReason:completion:](self, "startCaptureSessionWithRetryCount:retryInterval:logReason:completion:", 0, CFSTR("startCaptureSession"), 0, 0.0);
}

- (void)stopCaptureSessionWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopWithCompletion:", v4);

}

- (void)stopCaptureSession
{
  -[CUCaptureController stopCaptureSessionWithCompletion:](self, "stopCaptureSessionWithCompletion:", 0);
}

- (void)cancelAutoResumeAfterDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAutoResumeAfterDate:", v4);

}

- (void)attemptToEndInterruptions
{
  id v3;

  if (-[CUCaptureController isInterrupted](self, "isInterrupted"))
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startWithRetryCount:retryInterval:logReason:completion:", 0, CFSTR("attemptToEndInterruptions"), 0, 0.0);

  }
}

- (void)handleSessionInterruptionEnded
{
  pl_dispatch_async();
}

void __53__CUCaptureController_handleSessionInterruptionEnded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "interruptionDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "captureControllerInterruptionEnded:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (void)unregisterCaptureService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterCaptureService:", v4);

}

- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerEffectsPreviewSampleBufferDelegate:", v4);

}

- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterEffectsPreviewSampleBufferDelegate:", v4);

}

- (void)registerVideoThumbnailContentsDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerVideoThumbnailContentsDelegate:", v4);

}

- (void)unregisterVideoThumbnailContentsDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterVideoThumbnailContentsDelegate:", v4);

}

- (void)changeToVideoZoomFactor:(double)a3 graphConfiguration:(id)a4
{
  id v6;
  CAMSetVideoZoomFactorCommand *v7;

  v6 = a4;
  v7 = -[CAMSetVideoZoomFactorCommand initWithVideoZoomFactor:graphConfiguration:]([CAMSetVideoZoomFactorCommand alloc], "initWithVideoZoomFactor:graphConfiguration:", v6, a3);

  -[CAMCaptureEngine enqueueCommand:](self->__captureEngine, "enqueueCommand:", v7);
}

- (void)startRampToVideoZoomFactor:(double)a3 withRate:(float)a4 graphConfiguration:(id)a5
{
  id v8;
  CAMRampToVideoZoomFactorCommand *v9;
  double v10;
  CAMRampToVideoZoomFactorCommand *v11;

  v8 = a5;
  v9 = [CAMRampToVideoZoomFactorCommand alloc];
  *(float *)&v10 = a4;
  v11 = -[CAMRampToVideoZoomFactorCommand initWithVideoZoomFactor:rate:graphConfiguration:](v9, "initWithVideoZoomFactor:rate:graphConfiguration:", v8, a3, v10);

  -[CAMCaptureEngine enqueueCommand:](self->__captureEngine, "enqueueCommand:", v11);
}

- (void)startRampToVideoZoomFactor:(double)a3 withDuration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6
{
  id v10;
  CAMRampToVideoZoomFactorCommand *v11;

  v10 = a6;
  v11 = -[CAMRampToVideoZoomFactorCommand initWithVideoZoomFactor:duration:zoomRampTuning:graphConfiguration:]([CAMRampToVideoZoomFactorCommand alloc], "initWithVideoZoomFactor:duration:zoomRampTuning:graphConfiguration:", a5, v10, a3, a4);

  -[CAMCaptureEngine enqueueCommand:](self->__captureEngine, "enqueueCommand:", v11);
}

- (void)stopRampToVideoZoomFactor
{
  CAMCancelVideoZoomRampCommand *v3;

  v3 = objc_alloc_init(CAMCancelVideoZoomRampCommand);
  -[CAMCaptureEngine enqueueCommand:](self->__captureEngine, "enqueueCommand:", v3);

}

- (void)_teardownZoomMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUCaptureController _zoomMonitoringKeyPaths](self, "_zoomMonitoringKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CAMZoomResultContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "captureController:didOutputMinAvailableVideoZoomFactor:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

void __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "captureController:didChangeRampingVideoZoom:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isRampingVideoZoom"));

}

- (void)_setupZoomPIPMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoomPIPSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("videoPreviewLayer.zoomPictureInPictureOverlayRect"), 1, CAMPreviewZoomPIPContext);

  }
}

- (void)_teardownZoomPIPMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoomPIPSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("videoPreviewLayer.zoomPictureInPictureOverlayRect"), CAMPreviewZoomPIPContext);

  }
}

- (void)_zoomPIPChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[9];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "videoPreviewLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("videoPreviewLayer.zoomPictureInPictureOverlayRect")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "CGRectValue");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __65__CUCaptureController__zoomPIPChangedForKeyPath_ofObject_change___block_invoke;
        v18[3] = &unk_1EA328D90;
        v18[4] = self;
        v18[5] = v14;
        v18[6] = v15;
        v18[7] = v16;
        v18[8] = v17;
        cam_perform_on_main_asap(v18);
      }
    }
  }

}

void __65__CUCaptureController__zoomPIPChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "zoomDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didChangePreviewZoomPIPRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)changeToPortraitAperture:(double)a3
{
  void *v4;
  CAMPortraitApertureCommand *v5;

  v5 = -[CAMPortraitApertureCommand initWithAperture:]([CAMPortraitApertureCommand alloc], "initWithAperture:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)_handleShallowDepthOfFieldStatusChangedNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyEffectStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureConversions shallowDepthOfFieldStatusForCaptureStatus:](CAMCaptureConversions, "shallowDepthOfFieldStatusForCaptureStatus:", objc_msgSend(v4, "integerValue"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyStagePreviewStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureConversions stagePreviewStatusForCaptureStatus:](CAMCaptureConversions, "stagePreviewStatusForCaptureStatus:", objc_msgSend(v5, "integerValue"));
  pl_dispatch_async();

}

void __75__CUCaptureController__handleShallowDepthOfFieldStatusChangedNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "shallowDepthOfFieldStatusDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputShallowDepthOfFieldStatus:stagePreviewStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)changeToPortraitLightingEffectStrength:(double)a3
{
  void *v4;
  CAMPortraitLightingEffectStrengthCommand *v5;

  v5 = -[CAMPortraitLightingEffectStrengthCommand initWithEffectStrength:]([CAMPortraitLightingEffectStrengthCommand alloc], "initWithEffectStrength:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (id)_systemPressureStateMonitoringKeyPaths
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("currentCameraDevice.systemPressureState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_teardownSystemPressureStateMonitoring
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CUCaptureController _shouldMonitorSystemPressureState](self, "_shouldMonitorSystemPressureState"))
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUCaptureController _systemPressureStateMonitoringKeyPaths](self, "_systemPressureStateMonitoringKeyPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CAMSystemPressureStateMonitoringContext);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_systemPressureStateMonitoringChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CUCaptureController *v13;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("currentCameraDevice.systemPressureState")))
      {
        v10 = v8;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __87__CUCaptureController__systemPressureStateMonitoringChangedForKeyPath_ofObject_change___block_invoke;
        v11[3] = &unk_1EA328A40;
        v12 = v10;
        v13 = self;
        cam_perform_on_main_asap(v11);

      }
    }
  }

}

void __87__CUCaptureController__systemPressureStateMonitoringChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  CAMSystemPressureState *v2;

  v2 = -[CAMSystemPressureState initWithCaptureSystemPressureState:]([CAMSystemPressureState alloc], "initWithCaptureSystemPressureState:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_handleSystemPressureState:", v2);

}

- (void)_handleSystemPressureState:(id)a3
{
  id v4;
  void *v5;
  CAMSystemPressureMitigationCommand *v6;

  v4 = a3;
  v6 = objc_alloc_init(CAMSystemPressureMitigationCommand);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:", v6);

  -[CUCaptureController _setCurrentCameraSystemPressureState:](self, "_setCurrentCameraSystemPressureState:", v4);
}

- (void)_setCurrentCameraSystemPressureState:(id)a3
{
  CAMSystemPressureState *v5;
  CAMSystemPressureState *v6;
  BOOL v7;
  void *v8;
  CAMSystemPressureState *v9;

  v5 = (CAMSystemPressureState *)a3;
  v6 = v5;
  if (self->_currentCameraSystemPressureState != v5)
  {
    v9 = v5;
    v7 = -[CAMSystemPressureState isEqual:](v5, "isEqual:");
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentCameraSystemPressureState, a3);
      -[CUCaptureController systemPressureStateDelegate](self, "systemPressureStateDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "captureController:didChangeCameraSystemPressureState:", self, v9);

      v6 = v9;
    }
  }

}

- (void)changeToAspectRatioCrop:(int64_t)a3
{
  void *v4;
  CAMNonDestructiveCropAspectRatioCommand *v5;

  v5 = -[CAMNonDestructiveCropAspectRatioCommand initWithAspectRatioCrop:]([CAMNonDestructiveCropAspectRatioCommand alloc], "initWithAspectRatioCrop:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)setFallbackPrimaryConstituentDeviceSelection:(int64_t)a3
{
  void *v4;
  CAMFallbackPrimaryConstituentDeviceCommand *v5;

  v5 = -[CAMFallbackPrimaryConstituentDeviceCommand initWithFallbackPrimaryConstituentDeviceSelection:]([CAMFallbackPrimaryConstituentDeviceCommand alloc], "initWithFallbackPrimaryConstituentDeviceSelection:", a3);
  -[CUCaptureController _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommand:", v5);

}

- (void)_setupStereoCaptureStatusMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpatialModeSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("currentCameraDevice.stereoCaptureStatus"), 5, CAMStereoCaptureStatusContext);

  }
}

- (void)_teardownStereoCaptureStatusMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpatialModeSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("currentCameraDevice.stereoCaptureStatus"), CAMStereoCaptureStatusContext);

  }
}

- (void)_stereoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "isEqualToString:", CFSTR("currentCameraDevice.stereoCaptureStatus")))
  {
    +[CAMCaptureConversions CAMStereoCaptureStatusForAVStereoCaptureStatus:](CAMCaptureConversions, "CAMStereoCaptureStatusForAVStereoCaptureStatus:", objc_msgSend(v7, "integerValue"));
    pl_dispatch_async();
  }

}

void __77__CUCaptureController__stereoCaptureStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stereoCaptureStatusDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputStereoCaptureStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setupStereoVideoCaptureStatusMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpatialVideoCaptureSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("currentCameraDevice.stereoVideoCaptureStatus"), 5, CAMStereoVideoCaptureStatusContext);

  }
}

- (void)_teardownStereoVideoCaptureStatusMonitoring
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpatialVideoCaptureSupported");

  if (v4)
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("currentCameraDevice.stereoVideoCaptureStatus"), CAMStereoVideoCaptureStatusContext);

  }
}

- (void)_stereoVideoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "isEqualToString:", CFSTR("currentCameraDevice.stereoVideoCaptureStatus")))
  {
    +[CAMCaptureConversions CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:](CAMCaptureConversions, "CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:", objc_msgSend(v7, "integerValue"));
    pl_dispatch_async();
  }

}

void __82__CUCaptureController__stereoVideoCaptureStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stereoCaptureStatusDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:didOutputStereoCaptureStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startCaptureSignpostIntervalForPersistenceUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[CUCaptureController _persistenceUUIDToSignpostID](self, "_persistenceUUIDToSignpostID");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = -[CUCaptureController _nextSignpostID](self, "_nextSignpostID");
      -[CUCaptureController _setNextSignpostID:](self, "_setNextSignpostID:", v7 + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, v4);

      CAMSignpostWithIDAndArgs(66, v7, v7, 0, 0, 0);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:].cold.1();
  }

}

- (void)_endCaptureSignpostIntervalForPersistenceUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    -[CUCaptureController _persistenceUUIDToSignpostID](self, "_persistenceUUIDToSignpostID");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", 0, v4);
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
      CAMSignpostWithIDAndArgs(67, v7, v7, 0, 0, 0);
    }
    else
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CUCaptureController _endCaptureSignpostIntervalForPersistenceUUID:].cold.2((uint64_t)v4, v8, v9);

    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:].cold.1();
  }

}

- (void)_setupDocumentScanningMonitoring
{
  void *v3;
  id v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDocumentScanningSupported"))
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("currentCameraDevice.documentSceneConfidence"), 3, CAMDocumentScanningResultsContext);

  }
}

- (void)_tearDownDocumentScanningMonitoring
{
  void *v3;
  id v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDocumentScanningSupported"))
  {
    -[CUCaptureController _captureEngine](self, "_captureEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("currentCameraDevice.documentSceneConfidence"), CAMDocumentScanningResultsContext);

  }
}

- (void)_documentScanningChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  void *v6;
  int v7;
  _QWORD v8[5];
  int v9;

  objc_msgSend(a4, "currentCameraDevice", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentSceneConfidence");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CUCaptureController__documentScanningChangedForKeyPath_ofObject_change___block_invoke;
  v8[3] = &unk_1EA32D5F8;
  v8[4] = self;
  v9 = v7;
  cam_perform_on_main_asap(v8);

}

void __74__CUCaptureController__documentScanningChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "documentSceneResultDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "captureController:didChangeDocumentSceneConfidenceResults:", *(_QWORD *)(a1 + 32), v2);

}

- (CAMPreviewLayerOverCaptureStatusDelegate)previewLayerOverCaptureStatusDelegate
{
  return (CAMPreviewLayerOverCaptureStatusDelegate *)objc_loadWeakRetained((id *)&self->_previewLayerOverCaptureStatusDelegate);
}

- (void)setPreviewLayerOverCaptureStatusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_previewLayerOverCaptureStatusDelegate, a3);
}

- (CAMStillImageCapturingVideoDelegate)stillImageCapturingVideoDelegate
{
  return (CAMStillImageCapturingVideoDelegate *)objc_loadWeakRetained((id *)&self->_stillImageCapturingVideoDelegate);
}

- (int64_t)lowLightStatus
{
  return self->_lowLightStatus;
}

- (void)_setLowLightStatus:(int64_t)a3
{
  self->_lowLightStatus = a3;
}

- (BOOL)videoCapturePaused
{
  return self->_videoCapturePaused;
}

- (void)_setVideoCapturePaused:(BOOL)a3
{
  self->_videoCapturePaused = a3;
}

- (void)setPanoramaChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_panoramaChangeDelegate, a3);
}

- (CAMBurstDelegate)burstDelegate
{
  return (CAMBurstDelegate *)objc_loadWeakRetained((id *)&self->_burstDelegate);
}

- (BOOL)isTorchActive
{
  return self->_torchActive;
}

- (unint64_t)flashCompromise
{
  return self->_flashCompromise;
}

- (void)_setFlashCompromise:(unint64_t)a3
{
  self->_flashCompromise = a3;
}

- (BOOL)isAutoMacroActive
{
  return self->_autoMacroActive;
}

- (void)setAutoMacroActive:(BOOL)a3
{
  self->_autoMacroActive = a3;
}

- (BOOL)isAutoMacroSuggested
{
  return self->_autoMacroSuggested;
}

- (void)setAutoMacroSuggested:(BOOL)a3
{
  self->_autoMacroSuggested = a3;
}

- (CAMDocumentSceneResultDelegate)documentSceneResultDelegate
{
  return (CAMDocumentSceneResultDelegate *)objc_loadWeakRetained((id *)&self->_documentSceneResultDelegate);
}

- (void)setDocumentSceneResultDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_documentSceneResultDelegate, a3);
}

- (CAMShallowDepthOfFieldStatusDelegate)shallowDepthOfFieldStatusDelegate
{
  return (CAMShallowDepthOfFieldStatusDelegate *)objc_loadWeakRetained((id *)&self->_shallowDepthOfFieldStatusDelegate);
}

- (CAMFacesDelegate)facesDelegate
{
  return (CAMFacesDelegate *)objc_loadWeakRetained((id *)&self->_facesDelegate);
}

- (void)setFacesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_facesDelegate, a3);
}

- (CAMMachineReadableCodeDelegate)machineReadableCodeDelegate
{
  return (CAMMachineReadableCodeDelegate *)objc_loadWeakRetained((id *)&self->_machineReadableCodeDelegate);
}

- (CAMHistogramDelegate)histogramDelegate
{
  return (CAMHistogramDelegate *)objc_loadWeakRetained((id *)&self->_histogramDelegate);
}

- (void)setHistogramDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_histogramDelegate, a3);
}

- (CAMTextRegionResultDelegate)textRegionResultDelegate
{
  return (CAMTextRegionResultDelegate *)objc_loadWeakRetained((id *)&self->_textRegionResultDelegate);
}

- (void)setTextRegionResultDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textRegionResultDelegate, a3);
}

- (void)setResultDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultDelegate, a3);
}

- (CAMZoomDelegate)zoomDelegate
{
  return (CAMZoomDelegate *)objc_loadWeakRetained((id *)&self->_zoomDelegate);
}

- (BOOL)isRampingVideoZoom
{
  return self->_rampingVideoZoom;
}

- (void)setRampingVideoZoom:(BOOL)a3
{
  self->_rampingVideoZoom = a3;
}

- (CAMControlsDelegate)controlsDelegate
{
  return (CAMControlsDelegate *)objc_loadWeakRetained((id *)&self->_controlsDelegate);
}

- (void)setControlsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controlsDelegate, a3);
}

- (CAMCaptureRecoveryDelegate)recoveryDelegate
{
  return (CAMCaptureRecoveryDelegate *)objc_loadWeakRetained((id *)&self->_recoveryDelegate);
}

- (CAMSystemPressureState)currentCameraSystemPressureState
{
  return self->_currentCameraSystemPressureState;
}

- (CAMCaptureControllerSystemPressureStateDelegate)systemPressureStateDelegate
{
  return (CAMCaptureControllerSystemPressureStateDelegate *)objc_loadWeakRetained((id *)&self->_systemPressureStateDelegate);
}

- (void)setSystemPressureStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemPressureStateDelegate, a3);
}

- (CAMStereoCaptureStatusDelegate)stereoCaptureStatusDelegate
{
  return (CAMStereoCaptureStatusDelegate *)objc_loadWeakRetained((id *)&self->_stereoCaptureStatusDelegate);
}

- (void)setStereoCaptureStatusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stereoCaptureStatusDelegate, a3);
}

- (CAMStillImageCaptureRequest)_capturingCTMVideoRequest
{
  return self->__capturingCTMVideoRequest;
}

- (CAMVideoCaptureRequest)_pendingVideoCaptureRequest
{
  return self->__pendingVideoCaptureRequest;
}

- (void)_setPendingVideoCaptureRequest:(id)a3
{
  objc_storeStrong((id *)&self->__pendingVideoCaptureRequest, a3);
}

- (BOOL)_isWaitingForRecordingToStart
{
  return self->__waitingForRecordingToStart;
}

- (void)_setWaitingForRecordingToStart:(BOOL)a3
{
  self->__waitingForRecordingToStart = a3;
}

- (void)_setCapturingPanoramaRequest:(id)a3
{
  objc_storeStrong((id *)&self->__capturingPanoramaRequest, a3);
}

- (CAMStillImageCaptureRequest)_capturingLowLightStillImageRequest
{
  return self->__capturingLowLightStillImageRequest;
}

- (void)_setCapturingLowLightStillImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->__capturingLowLightStillImageRequest, a3);
}

- (void)_setCurrentBurstIntervalometer:(id)a3
{
  objc_storeStrong((id *)&self->_currentBurstIntervalometer, a3);
}

- (BOOL)_didCompleteInitialConfiguration
{
  return self->__didCompleteInitialConfiguration;
}

- (void)_setDidCompleteInitialConfiguration:(BOOL)a3
{
  self->__didCompleteInitialConfiguration = a3;
}

- (BOOL)_isVideoCaptureAvailable
{
  return self->__isVideoCaptureAvailable;
}

- (NSMutableSet)_identifiersForActiveLivePhotoVideoCaptures
{
  return self->__identifiersForActiveLivePhotoVideoCaptures;
}

- (NSMutableSet)_identifiersForActiveCTMVideoCaptures
{
  return self->__identifiersForActiveCTMVideoCaptures;
}

- (NSMutableDictionary)_persistenceUUIDToSignpostID
{
  return self->__persistenceUUIDToSignpostID;
}

- (unint64_t)_nextSignpostID
{
  return self->__nextSignpostID;
}

- (void)_setNextSignpostID:(unint64_t)a3
{
  self->__nextSignpostID = a3;
}

- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator
{
  return self->__deferredProcessingCoordinator;
}

- (void)_setDeferredProcessingCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->__deferredProcessingCoordinator, a3);
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (CAMBurstController)_burstController
{
  return self->__burstController;
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (CAMIrisVideoController)_irisVideoController
{
  return self->__irisVideoController;
}

- (CAMRemoteShutterController)_remoteShutterController
{
  return self->__remoteShutterController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteShutterController, 0);
  objc_storeStrong((id *)&self->__irisVideoController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_storeStrong((id *)&self->__burstController, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__deferredProcessingCoordinator, 0);
  objc_storeStrong((id *)&self->__persistenceUUIDToSignpostID, 0);
  objc_storeStrong((id *)&self->__identifiersForActiveCTMVideoCaptures, 0);
  objc_storeStrong((id *)&self->__identifiersForActiveLivePhotoVideoCaptures, 0);
  objc_storeStrong((id *)&self->__numberOfInflightRequestsByType, 0);
  objc_storeStrong((id *)&self->__exposureCoalescer, 0);
  objc_storeStrong((id *)&self->__focusCoalescer, 0);
  objc_storeStrong((id *)&self->_currentBurstIntervalometer, 0);
  objc_storeStrong((id *)&self->__capturingLowLightStillImageRequest, 0);
  objc_storeStrong((id *)&self->__capturingPanoramaRequest, 0);
  objc_storeStrong((id *)&self->__pendingVideoCaptureRequest, 0);
  objc_storeStrong((id *)&self->__capturingVideoRequest, 0);
  objc_storeStrong((id *)&self->__capturingCTMVideoRequest, 0);
  objc_storeStrong((id *)&self->__responseThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__responseQueue, 0);
  objc_storeStrong((id *)&self->__captureEngine, 0);
  objc_destroyWeak((id *)&self->_stereoCaptureStatusDelegate);
  objc_destroyWeak((id *)&self->_systemPressureStateDelegate);
  objc_storeStrong((id *)&self->_currentCameraSystemPressureState, 0);
  objc_destroyWeak((id *)&self->_interruptionDelegate);
  objc_destroyWeak((id *)&self->_runningDelegate);
  objc_destroyWeak((id *)&self->_recoveryDelegate);
  objc_destroyWeak((id *)&self->_controlsDelegate);
  objc_destroyWeak((id *)&self->_zoomDelegate);
  objc_destroyWeak((id *)&self->_resultDelegate);
  objc_destroyWeak((id *)&self->_textRegionResultDelegate);
  objc_destroyWeak((id *)&self->_histogramDelegate);
  objc_destroyWeak((id *)&self->_machineReadableCodeDelegate);
  objc_destroyWeak((id *)&self->_facesDelegate);
  objc_destroyWeak((id *)&self->_shallowDepthOfFieldStatusDelegate);
  objc_destroyWeak((id *)&self->_exposureDelegate);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_documentSceneResultDelegate);
  objc_destroyWeak((id *)&self->_availabilityDelegate);
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_destroyWeak((id *)&self->_burstDelegate);
  objc_destroyWeak((id *)&self->_panoramaChangeDelegate);
  objc_destroyWeak((id *)&self->_stillImageCapturingVideoDelegate);
  objc_destroyWeak((id *)&self->_previewLayerOverCaptureStatusDelegate);
  objc_storeStrong((id *)&self->_panoramaPreviewView, 0);
}

- (void)cancelCTMCaptureForSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot cancel CTM capture with nil settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)captureStillImageWithRequest:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v3, v4, "Failed to capture still image with request %{public}@ (%{public}@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)stillImageRequest:(void *)a1 didCompleteVideoCaptureWithResult:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, v5, "Error: \"%{public}@\" on CAMVideoCaptureResult occurred", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_2();
}

- (void)_beginTrackingLivePhotoVideoRecordingForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot track live photo video recording for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_endTrackingLivePhotoVideoRecordingForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot end tracking live photo video recording for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_beginTrackingCTMVideoRecordingForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot track CTM video recording for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_endTrackingCTMVideoRecordingForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot end tracking CTM video recording for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startCapturingVideoWithRequest:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v3, v4, "Failed to start video capture with request %{public}@: (%{public}@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleCaptureEngineExecutionNotification:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, a3, "CAMModeAndDeviceCommand configuration failed! (%{public}@)", (uint8_t *)&v3);
}

- (void)_startCaptureSignpostIntervalForPersistenceUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "No persistenceUUID for tracking signposts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_endCaptureSignpostIntervalForPersistenceUUID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, a3, "No signpostID found for persistenceUUID %{public}@", (uint8_t *)&v3);
}

@end
