@implementation CAMRemoteShutterController

- (CAMRemoteShutterController)initWithCaptureConfiguration:(id)a3 motionController:(id)a4
{
  id v6;
  id v7;
  CAMRemoteShutterController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMRemoteShutterController;
  v8 = -[CAMRemoteShutterController init](&v13, sel_init);
  if (v8)
  {
    v8->_captureMode = objc_msgSend(v6, "mode");
    v8->_captureDevice = objc_msgSend(v6, "device");
    v8->_flashMode = objc_msgSend(v6, "flashMode");
    v8->_hdrMode = objc_msgSend(v6, "HDRMode");
    v8->_irisMode = objc_msgSend(v6, "irisMode");
    v8->_sharedLibraryMode = objc_msgSend(v6, "sharedLibraryMode");
    v8->_spatialEnabled = objc_msgSend(v6, "spatialVideoEnabled");
    v8->_showingPreview = 1;
    objc_storeStrong((id *)&v8->__motionController, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__enterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel__enterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__captureOrientationDidChange_, CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), 0);

  }
  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setFlashMode:(int64_t)a3
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    -[CCCameraConnection flashModeDidChange](self->_connection, "flashModeDidChange");
  }
}

- (void)setHdrMode:(int64_t)a3
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
    -[CCCameraConnection hdrModeDidChange](self->_connection, "hdrModeDidChange");
  }
}

- (void)setAvailableCaptureModes:(id)a3
{
  objc_storeStrong((id *)&self->_availableCaptureModes, a3);
}

- (void)setShowingPreview:(BOOL)a3
{
  if (self->_showingPreview != a3)
  {
    self->_showingPreview = a3;
    -[CCCameraConnection showingLivePreviewDidChange](self->_connection, "showingLivePreviewDidChange");
  }
}

- (void)setZoomAmount:(double)a3
{
  if (self->_zoomAmount != a3)
  {
    self->_zoomAmount = a3;
    -[CCCameraConnection zoomDidChange:](self->_connection, "zoomDidChange:");
  }
}

- (void)createConnectionIfNecessary
{
  CCCameraConnection *v3;
  CCCameraConnection *connection;

  if (!self->_connection)
  {
    v3 = (CCCameraConnection *)objc_alloc_init(NSClassFromString(CFSTR("CCCameraConnection")));
    connection = self->_connection;
    self->_connection = v3;

    -[CCCameraConnection setDelegate:](self->_connection, "setDelegate:", self);
    -[CCCameraConnection open](self->_connection, "open");
  }
}

- (void)sendThumbnailImage:(id)a3 isVideo:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  UIImage *image;

  v4 = a4;
  image = (UIImage *)a3;
  if (-[CCCameraConnection isOpen](self->_connection, "isOpen"))
  {
    UIImageJPEGRepresentation(image, 0.8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMRemoteShutterController sendThumbnailData:isVideo:](self, "sendThumbnailData:isVideo:", v6, v4);

  }
}

- (void)_enterBackground:(id)a3
{
  -[CCCameraConnection close](self->_connection, "close", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CAMRemoteShutterController closeConnection](self, "closeConnection");
  v4.receiver = self;
  v4.super_class = (Class)CAMRemoteShutterController;
  -[CAMRemoteShutterController dealloc](&v4, sel_dealloc);
}

- (void)applyCaptureConfiguration:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[CAMRemoteShutterController setCaptureMode:](self, "setCaptureMode:", objc_msgSend(v4, "mode"));
  -[CAMRemoteShutterController setCaptureDevice:](self, "setCaptureDevice:", objc_msgSend(v4, "device"));
  -[CAMRemoteShutterController setFlashMode:](self, "setFlashMode:", objc_msgSend(v4, "flashMode"));
  -[CAMRemoteShutterController setHdrMode:](self, "setHdrMode:", objc_msgSend(v4, "HDRMode"));
  -[CAMRemoteShutterController setIrisMode:](self, "setIrisMode:", objc_msgSend(v4, "irisMode"));
  -[CAMRemoteShutterController setSharedLibraryMode:](self, "setSharedLibraryMode:", objc_msgSend(v4, "sharedLibraryMode"));
  v5 = objc_msgSend(v4, "spatialVideoEnabled");

  -[CAMRemoteShutterController setSpatialEnabled:](self, "setSpatialEnabled:", v5);
}

- (void)openConnection
{
  -[CCCameraConnection open](self->_connection, "open");
}

- (void)closeConnection
{
  -[CCCameraConnection close](self->_connection, "close");
}

- (BOOL)isConnected
{
  return -[CCCameraConnection isOpen](self->_connection, "isOpen");
}

- (int64_t)_convertCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return 0;
  else
    return qword_1DB9A6DB0[a3 - 1];
}

- (int64_t)_convertMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 7)
    return 0;
  else
    return a3;
}

- (int64_t)_convertPanoramaDirection:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (int64_t)_currentCaptureDevice
{
  return -[CAMRemoteShutterController _convertCaptureDevice:](self, "_convertCaptureDevice:", self->_captureDevice);
}

- (int64_t)_currentMode
{
  return -[CAMRemoteShutterController _convertMode:](self, "_convertMode:", self->_captureMode);
}

- (void)_sendMode
{
  -[CCCameraConnection modeSelected:](self->_connection, "modeSelected:", -[CAMRemoteShutterController _currentMode](self, "_currentMode"));
}

- (void)setCaptureMode:(int64_t)a3
{
  if (self->_captureMode != a3)
  {
    self->_captureMode = a3;
    -[CAMRemoteShutterController _sendMode](self, "_sendMode");
  }
}

- (void)setCaptureDevice:(int64_t)a3
{
  if (self->_captureDevice != a3)
  {
    self->_captureDevice = a3;
    -[CCCameraConnection captureDeviceDidChange:](self->_connection, "captureDeviceDidChange:", -[CAMRemoteShutterController _currentCaptureDevice](self, "_currentCaptureDevice"));
  }
}

- (void)setPanoramaDirection:(int64_t)a3
{
  -[CCCameraConnection panoramaDirectionDidChange:](self->_connection, "panoramaDirectionDidChange:", -[CAMRemoteShutterController _convertPanoramaDirection:](self, "_convertPanoramaDirection:", a3));
}

- (void)setSpatialEnabled:(BOOL)a3
{
  if (self->_spatialEnabled != a3)
  {
    self->_spatialEnabled = a3;
    -[CCCameraConnection spatialModeDidChange](self->_connection, "spatialModeDidChange");
  }
}

- (void)setIrisMode:(int64_t)a3
{
  if (self->_irisMode != a3)
  {
    self->_irisMode = a3;
    -[CCCameraConnection irisModeDidChange](self->_connection, "irisModeDidChange");
  }
}

- (void)setSharedLibrarySupported:(BOOL)a3
{
  if (self->_sharedLibrarySupported != a3)
  {
    self->_sharedLibrarySupported = a3;
    -[CCCameraConnection sharedLibrarySupportDidChange](self->_connection, "sharedLibrarySupportDidChange");
  }
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CCCameraConnection sharedLibraryModeDidChange](self->_connection, "sharedLibraryModeDidChange");
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  uint64_t v3;

  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    if ((unint64_t)(a3 - 1) > 0xD)
      v3 = 0;
    else
      v3 = qword_1DB9A6D40[a3 - 1];
    -[CCCameraConnection didUpdateShallowDepthOfFieldStatus:](self->_connection, "didUpdateShallowDepthOfFieldStatus:", v3);
  }
}

- (void)sendThumbnailData:(id)a3 isVideo:(BOOL)a4
{
  -[CCCameraConnection didUpdateThumbnailWithData:isVideo:](self->_connection, "didUpdateThumbnailWithData:isVideo:", a3, a4);
}

- (void)countdownCanceled
{
  -[CCCameraConnection countdownCanceled](self->_connection, "countdownCanceled");
}

- (void)burstCaptureWillStart
{
  -[CCCameraConnection burstCaptureWillStart](self->_connection, "burstCaptureWillStart");
}

- (void)burstCaptureNumberOfPhotosDidChange:(unint64_t)a3
{
  -[CCCameraConnection burstCaptureNumberOfPhotosDidChange:](self->_connection, "burstCaptureNumberOfPhotosDidChange:", a3);
}

- (void)burstCaptureDidStop
{
  -[CCCameraConnection burstCaptureDidStop](self->_connection, "burstCaptureDidStop");
}

- (void)willStartCapturing
{
  -[CCCameraConnection willStartCapturing](self->_connection, "willStartCapturing");
}

- (void)didStartCaptureTimer
{
  -[CCCameraConnection didStartCaptureTimer](self->_connection, "didStartCaptureTimer");
}

- (void)didStopCapture
{
  -[CCCameraConnection didStopCapture](self->_connection, "didStopCapture");
}

- (void)_enterForeground:(id)a3
{
  -[CCCameraConnection open](self->_connection, "open", a3);
}

- (void)_captureOrientationDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  -[CAMRemoteShutterController _motionController](self, "_motionController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "captureOrientation");

  -[CCCameraConnection switchedOrientation:](self->_connection, "switchedOrientation:", v5);
}

- (void)cameraConnection:(id)a3 takePhotoWithCountdown:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:takePhotoWithCountdown:", self, a4);

}

- (void)cameraConnectionCancelCountdown:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutterCancelCountdown:", self);

}

- (BOOL)cameraConnectionBeginBurstCapture:(id)a3
{
  CAMRemoteShutterController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "remoteShutterBeginBurstCapture:", v3);

  return (char)v3;
}

- (BOOL)cameraConnectionEndBurstCapture:(id)a3
{
  CAMRemoteShutterController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "remoteShutterEndBurstCapture:", v3);

  return (char)v3;
}

- (id)cameraConnectionSupportedCaptureDevices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedMode:withDevice:", self->_captureMode, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMRemoteShutterController _convertCaptureDevice:](self, "_convertCaptureDevice:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  if (objc_msgSend(v5, "isSupportedMode:withDevice:", self->_captureMode, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMRemoteShutterController _convertCaptureDevice:](self, "_convertCaptureDevice:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (BOOL)cameraConnection:(id)a3 setCaptureDevice:(int64_t)a4
{
  id WeakRetained;

  if (-[CAMRemoteShutterController isCapturingVideo](self, "isCapturingVideo", a3)
    || -[CAMRemoteShutterController isCapturingTimelapse](self, "isCapturingTimelapse"))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setCaptureDevice:", self, a4 == 1);

  return 1;
}

- (id)cameraConnectionSupportedCaptureModes:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_availableCaptureModes, "count", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_availableCaptureModes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMRemoteShutterController _convertMode:](self, "_convertMode:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue", (_QWORD)v13)));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)cameraConnection:(id)a3 setCaptureMode:(int64_t)a4
{
  id WeakRetained;

  if (-[CAMRemoteShutterController isCapturingVideo](self, "isCapturingVideo", a3)
    || -[CAMRemoteShutterController isCapturingTimelapse](self, "isCapturingTimelapse"))
  {
    return 0;
  }
  if ((unint64_t)(a4 - 1) >= 7)
    a4 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setMode:", self, a4);

  return 1;
}

- (void)cameraConnection:(id)a3 setFocusPoint:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:focusOn:", self, x, y);

}

- (BOOL)cameraConnectionStartCapture:(id)a3
{
  CAMRemoteShutterController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "remoteShutterStartCapture:", v3);

  return (char)v3;
}

- (BOOL)cameraConnectionStopCapture:(id)a3
{
  CAMRemoteShutterController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "remoteShutterStopCapture:", v3);

  return (char)v3;
}

- (void)cameraConnectionSuspend:(id)a3
{
  id WeakRetained;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "remoteShutterShouldSuspendApp:", self);

  v6 = os_log_create("com.apple.camera", "Camera");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Suspending camera for -[CCCameraConnection cameraConnectionSuspend:]", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject suspend](v6, "suspend");
  }
  else if (v7)
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring -[CCCameraConnection cameraConnectionSuspend:]", v8, 2u);
  }

}

- (BOOL)cameraConnectionIsMirrored:(id)a3
{
  return (self->_captureDevice < 0xCuLL) & (0xF02u >> self->_captureDevice);
}

- (int64_t)cameraConnectionOrientation:(id)a3
{
  void *v3;
  int64_t v4;

  -[CAMRemoteShutterController _motionController](self, "_motionController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "captureOrientation");

  return v4;
}

- (BOOL)cameraConnectionZoomSupport:(id)a3
{
  return (self->_captureMode < 5uLL) & (0x17u >> self->_captureMode);
}

- (void)cameraConnection:(id)a3 setZoomAmount:(double)a4
{
  id WeakRetained;

  self->_zoomAmount = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setZoomAmount:", self, a4);

}

- (double)cameraConnectionZoomAmount:(id)a3
{
  return self->_zoomAmount;
}

- (void)_refreshZoomMagnificationState
{
  NSArray *currentContinuousZoomFactors;
  NSArray **p_currentContinuousZoomFactors;
  NSArray *currentContinuousDisplayZoomFactors;
  NSArray **p_currentContinuousDisplayZoomFactors;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  int64_t currentResolvedDevice;
  int64_t v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  NSArray *v25;
  id v26;
  id v27;
  id v28;

  *(_WORD *)&self->_currentZoomMagnificationAllowed = 0;
  p_currentContinuousZoomFactors = &self->_currentContinuousZoomFactors;
  currentContinuousZoomFactors = self->_currentContinuousZoomFactors;
  self->_currentContinuousZoomFactors = 0;

  p_currentContinuousDisplayZoomFactors = &self->_currentContinuousDisplayZoomFactors;
  currentContinuousDisplayZoomFactors = self->_currentContinuousDisplayZoomFactors;
  self->_currentContinuousDisplayZoomFactors = 0;

  v7 = -[CAMCaptureGraphConfiguration mode](self->_currentGraphConfiguration, "mode");
  v8 = -[CAMCaptureGraphConfiguration device](self->_currentGraphConfiguration, "device");
  v9 = -[CAMCaptureGraphConfiguration videoConfiguration](self->_currentGraphConfiguration, "videoConfiguration");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v8, v7, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength"), -[CAMCaptureGraphConfiguration enableStereoVideoCapture](self->_currentGraphConfiguration, "enableStereoVideoCapture"));
  self->_currentResolvedDevice = v11;
  if (objc_msgSend(v10, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", v7, v11, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength")))
  {
    currentResolvedDevice = self->_currentResolvedDevice;
    v13 = -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength");
    v27 = 0;
    v28 = 0;
    v14 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", v7, currentResolvedDevice, v9, v13, &v28, &v27);
    v15 = v28;
    v26 = v28;
    v16 = v27;
    v17 = v27;
    if (v14)
    {
      self->_currentZoomMagnificationAllowed = 1;
      objc_storeStrong((id *)p_currentContinuousZoomFactors, v15);
      objc_storeStrong((id *)&self->_currentContinuousDisplayZoomFactors, v16);
      v18 = +[CAMZoomControlUtilities shouldEmulateTripleCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:](CAMZoomControlUtilities, "shouldEmulateTripleCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:", v7, self->_currentResolvedDevice, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength"));
      self->_currentlyEmulatingMulticam = v18 | +[CAMZoomControlUtilities shouldEmulateWideDualCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:](CAMZoomControlUtilities, "shouldEmulateWideDualCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:", v7, self->_currentResolvedDevice, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength"));
      if (objc_msgSend(v10, "isCustomLensSupportedForMode:device:isTrueVideo:", v7, self->_currentResolvedDevice, -[CAMCaptureGraphConfiguration trueVideoEnabled](self->_currentGraphConfiguration, "trueVideoEnabled")))
      {
        +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "customLensGroup");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v26, v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMZoomPoint zoomFactorsFromZoomPoints:](CAMZoomPoint, "zoomFactorsFromZoomPoints:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *p_currentContinuousZoomFactors;
        *p_currentContinuousZoomFactors = (NSArray *)v22;

        +[CAMZoomPoint displayZoomFactorsFromZoomPoints:](CAMZoomPoint, "displayZoomFactorsFromZoomPoints:", v21);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *p_currentContinuousDisplayZoomFactors;
        *p_currentContinuousDisplayZoomFactors = (NSArray *)v24;

      }
    }

  }
}

- (double)_displayZoomValueForZoomFactor:(double)result
{
  if (self->_currentContinuousZoomFactors)
  {
    if (self->_currentContinuousDisplayZoomFactors)
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", result);
  }
  return result;
}

- (double)_zoomFactorForDisplayZoomValue:(double)result
{
  if (self->_currentContinuousZoomFactors)
  {
    if (self->_currentContinuousDisplayZoomFactors)
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", result);
  }
  return result;
}

- (BOOL)cameraConnectionIsSpatialCapture:(id)a3
{
  return self->_spatialEnabled;
}

- (BOOL)cameraConnectionZoomMagnificationSupport:(id)a3
{
  void *v4;
  BOOL v5;
  unint64_t v6;

  -[CAMRemoteShutterController _refreshZoomMagnificationState](self, "_refreshZoomMagnificationState", a3);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "zoomControlSupported"))
  {
    v5 = 0;
    switch(self->_captureMode)
    {
      case 0:
      case 1:
      case 4:
        goto LABEL_3;
      case 6:
        if (!objc_msgSend(v4, "continuousZoomSupportedForPortraitMode"))
          goto LABEL_9;
        goto LABEL_3;
      case 7:
        if ((objc_msgSend(v4, "continuousZoomSupportedForCinematicMode") & 1) == 0)
          goto LABEL_9;
LABEL_3:
        v6 = self->_currentResolvedDevice - 1;
        if (v6 < 0xB && ((0x781u >> v6) & 1) != 0)
          goto LABEL_9;
        v5 = !self->_currentlyEmulatingMulticam;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_9:
    v5 = 0;
  }

  return v5;
}

- (void)cameraConnection:(id)a3 setZoomMagnificationAmount:(double)a4
{
  double v5;
  double v6;
  id WeakRetained;

  -[CAMRemoteShutterController _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:", a3, a4);
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setZoomFactor:", self, v6);

}

- (double)cameraConnectionMinimumZoomMagnification:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  -[CAMRemoteShutterController currentContinuousDisplayZoomFactors](self, "currentContinuousDisplayZoomFactors", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (double)cameraConnectionMaximumZoomMagnification:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  -[CAMRemoteShutterController currentContinuousDisplayZoomFactors](self, "currentContinuousDisplayZoomFactors", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (id)cameraConnectionSignificantZoomMagnifications:(id)a3
{
  return self->_currentContinuousDisplayZoomFactors;
}

- (double)cameraConnectionCurrentZoomMagnification:(id)a3
{
  double result;

  -[CAMRemoteShutterController _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:", a3, self->_zoomFactor);
  return result;
}

- (int64_t)cameraConnectionFlashSupport:(id)a3
{
  unint64_t captureMode;
  BOOL v4;
  uint64_t v5;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;

  captureMode = self->_captureMode;
  v4 = captureMode > 7;
  v5 = (1 << captureMode) & 0xD7;
  if (v4 || v5 == 0)
    return 0;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = self->_captureDevice - 1;
  if (v10 > 0xA)
    v11 = 0;
  else
    v11 = qword_1DB9A6DB0[v10];
  if (objc_msgSend(v8, "isFlashSupportedForDevicePosition:", v11))
    v12 = 2;
  else
    v12 = 0;

  return v12;
}

- (int64_t)cameraConnectionFlashMode:(id)a3
{
  int64_t flashMode;

  flashMode = self->_flashMode;
  if (flashMode == 1)
    return 1;
  else
    return 2 * (flashMode != 0);
}

- (int64_t)cameraConnectionHDRSupport:(id)a3
{
  void *v4;
  unint64_t captureMode;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHDRSettingAllowed") & 1) == 0 && (objc_msgSend(v4, "isModernHDRSupported") & 1) != 0
    || ((captureMode = self->_captureMode, v6 = captureMode > 9, v7 = (1 << captureMode) & 0x211, !v6)
      ? (v8 = v7 == 0)
      : (v8 = 1),
        v8))
  {
    v11 = 0;
  }
  else
  {
    v9 = self->_captureDevice - 1;
    if (v9 > 0xA)
      v10 = 0;
    else
      v10 = qword_1DB9A6DB0[v9];
    v12 = objc_msgSend(v4, "isHDROnSupportedForDevicePosition:", v10);
    v13 = objc_msgSend(v4, "isAutomaticHDRSupportedForDevicePosition:", v10);
    v14 = 2;
    if (v12)
      v14 = 3;
    if (v13)
      v11 = v14;
    else
      v11 = v12;
  }

  return v11;
}

- (int64_t)cameraConnectionHDRMode:(id)a3
{
  int64_t hdrMode;

  hdrMode = self->_hdrMode;
  if (hdrMode == 1)
    return 1;
  else
    return 2 * (hdrMode != 0);
}

- (int64_t)cameraConnectionIrisSupport:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = self->_captureDevice - 1;
  if (v6 > 0xA)
    v7 = 0;
  else
    v7 = qword_1DB9A6DB0[v6];
  if (objc_msgSend(v4, "isLivePhotoSupportedForMode:devicePosition:", self->_captureMode, v7))
  {
    if (objc_msgSend(v5, "isLivePhotoAutoModeSupported"))
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)cameraConnectionIrisMode:(id)a3
{
  int64_t irisMode;

  irisMode = self->_irisMode;
  if (irisMode == 2)
    return 2;
  else
    return irisMode == 1;
}

- (BOOL)cameraConnectionBurstSupport:(id)a3
{
  void *v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isBurstSupportedForMode:device:", -[CAMRemoteShutterController captureMode](self, "captureMode"), -[CAMRemoteShutterController captureDevice](self, "captureDevice"));

  return (char)self;
}

- (BOOL)cameraConnectionSupportsMomentCapture:(id)a3
{
  void *v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isCTMVideoCaptureSupportedForMode:", -[CAMRemoteShutterController captureMode](self, "captureMode"));

  return (char)self;
}

- (BOOL)cameraConnectionToggleCameraDeviceSupport:(id)a3
{
  unint64_t captureMode;
  BOOL v4;
  uint64_t v5;
  void *v7;
  char v8;

  captureMode = self->_captureMode;
  v4 = captureMode > 5;
  v5 = (1 << captureMode) & 0x33;
  if (v4 || v5 == 0)
    return 0;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBackCameraSupported"))
    v8 = objc_msgSend(v7, "isFrontCameraSupported");
  else
    v8 = 0;

  return v8;
}

- (void)cameraConnectionToggleCameraDevice:(id)a3
{
  unint64_t v4;
  int64_t v5;
  id WeakRetained;

  v4 = self->_captureDevice - 1;
  if (v4 > 0xA)
    v5 = 1;
  else
    v5 = qword_1DB9A6E08[v4];
  self->_captureDevice = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setCaptureDevice:", self, self->_captureDevice);

}

- (void)cameraConnection:(id)a3 setFlashMode:(int64_t)a4
{
  int64_t v5;
  id WeakRetained;

  v5 = a4 == 1;
  if (a4 == 2)
    v5 = 2;
  self->_flashMode = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setFlashMode:", self, self->_flashMode);

}

- (void)cameraConnection:(id)a3 setHDRMode:(int64_t)a4
{
  int64_t v5;
  id WeakRetained;

  v5 = a4 == 1;
  if (a4 == 2)
    v5 = 2;
  self->_hdrMode = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setHDRMode:", self, self->_hdrMode);

}

- (void)cameraConnection:(id)a3 setIrisMode:(int64_t)a4
{
  int64_t v5;
  id WeakRetained;

  v5 = a4 == 1;
  if (a4 == 2)
    v5 = 2;
  self->_irisMode = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setIrisMode:", self, self->_irisMode);

}

- (BOOL)cameraConnectionIsShowingLivePreview:(id)a3
{
  return self->_showingPreview;
}

- (int64_t)cameraConnectionSharedLibrarySupport:(id)a3
{
  return self->_sharedLibrarySupported;
}

- (int64_t)cameraConnectionSharedLibraryMode:(id)a3
{
  return CAMSharedLibraryModeIsOn(self->_sharedLibraryMode);
}

- (void)cameraConnection:(id)a3 setSharedLibraryMode:(int64_t)a4
{
  int64_t v5;
  id WeakRetained;

  v5 = 2 * (a4 == 1);
  if (!a4)
    v5 = 3;
  self->_sharedLibraryMode = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:setSharedLibraryMode:", self, self->_sharedLibraryMode);

}

- (BOOL)isShowingPreview
{
  return self->_showingPreview;
}

- (CAMCaptureGraphConfiguration)currentGraphConfiguration
{
  return self->_currentGraphConfiguration;
}

- (void)setCurrentGraphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentGraphConfiguration, a3);
}

- (NSArray)availableCaptureModes
{
  return self->_availableCaptureModes;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (BOOL)sharedLibrarySupported
{
  return self->_sharedLibrarySupported;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (double)zoomAmount
{
  return self->_zoomAmount;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (BOOL)spatialEnabled
{
  return self->_spatialEnabled;
}

- (BOOL)isCapturingVideo
{
  return self->_capturingVideo;
}

- (void)setCapturingVideo:(BOOL)a3
{
  self->_capturingVideo = a3;
}

- (BOOL)isCapturingTimelapse
{
  return self->_capturingTimelapse;
}

- (void)setCapturingTimelapse:(BOOL)a3
{
  self->_capturingTimelapse = a3;
}

- (CAMRemoteShutterDelegate)delegate
{
  return (CAMRemoteShutterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CCCameraConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (BOOL)currentZoomMagnificationAllowed
{
  return self->_currentZoomMagnificationAllowed;
}

- (void)setCurrentZoomMagnificationAllowed:(BOOL)a3
{
  self->_currentZoomMagnificationAllowed = a3;
}

- (int64_t)currentResolvedDevice
{
  return self->_currentResolvedDevice;
}

- (void)setCurrentResolvedDevice:(int64_t)a3
{
  self->_currentResolvedDevice = a3;
}

- (BOOL)currentlyEmulatingMulticam
{
  return self->_currentlyEmulatingMulticam;
}

- (void)setCurrentlyEmulatingMulticam:(BOOL)a3
{
  self->_currentlyEmulatingMulticam = a3;
}

- (NSArray)currentContinuousZoomFactors
{
  return self->_currentContinuousZoomFactors;
}

- (void)setCurrentContinuousZoomFactors:(id)a3
{
  objc_storeStrong((id *)&self->_currentContinuousZoomFactors, a3);
}

- (NSArray)currentContinuousDisplayZoomFactors
{
  return self->_currentContinuousDisplayZoomFactors;
}

- (void)setCurrentContinuousDisplayZoomFactors:(id)a3
{
  objc_storeStrong((id *)&self->_currentContinuousDisplayZoomFactors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContinuousDisplayZoomFactors, 0);
  objc_storeStrong((id *)&self->_currentContinuousZoomFactors, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableCaptureModes, 0);
  objc_storeStrong((id *)&self->_currentGraphConfiguration, 0);
}

@end
