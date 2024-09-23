@implementation BCSRootViewController

- (BCSRootViewController)init
{
  BCSRootViewController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *captureQueue;
  BCSVisualCodeDetector *v6;
  BCSVisualCodeDetector *codeDetector;
  NSObject *v8;
  BCSRootViewController *v9;
  _QWORD block[4];
  BCSRootViewController *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BCSRootViewController;
  v2 = -[BCSRootViewController init](&v13, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeScanner.sessionQueue", 0, v3);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(BCSVisualCodeDetector);
    codeDetector = v2->_codeDetector;
    v2->_codeDetector = v6;

    if (shouldUseSystemPreferredCamera())
    {
      objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v2, CFSTR("systemPreferredCamera"), 4, observerContext);
    }
    else
    {
      v8 = v2->_captureQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__BCSRootViewController_init__block_invoke;
      block[3] = &unk_250863730;
      v12 = v2;
      dispatch_sync(v8, block);

    }
    v9 = v2;
  }

  return v2;
}

uint64_t __29__BCSRootViewController_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_bestCaptureDevice");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 968);
  *(_QWORD *)(v3 + 968) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("torchAvailable"), 0, observerContext);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("torchActive"), 0, observerContext);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  AVCaptureVideoPreviewLayer *v6;
  AVCaptureVideoPreviewLayer *previewLayer;
  BCSLiveViewController *v8;
  BCSLiveViewController *liveViewController;
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
  void *v20;
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
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  v22 = v3;
  -[BCSRootViewController setView:](self, "setView:", v3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  v6 = (AVCaptureVideoPreviewLayer *)objc_alloc_init(MEMORY[0x24BDB2510]);
  previewLayer = self->_previewLayer;
  self->_previewLayer = v6;

  v8 = -[BCSLiveViewController initWithPreviewLayer:]([BCSLiveViewController alloc], "initWithPreviewLayer:", self->_previewLayer);
  liveViewController = self->_liveViewController;
  self->_liveViewController = v8;

  -[BCSLiveViewController setDelegate:](self->_liveViewController, "setDelegate:", self);
  -[BCSRootViewController addChildViewController:](self, "addChildViewController:", self->_liveViewController);
  -[BCSLiveViewController view](self->_liveViewController, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSRootViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v33);

  v23 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSRootViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v29;
  objc_msgSend(v33, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSRootViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  objc_msgSend(v33, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSRootViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v13;
  objc_msgSend(v33, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSRootViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v18);

  -[BCSLiveViewController didMoveToParentViewController:](self->_liveViewController, "didMoveToParentViewController:", self);
  -[BCSRootViewController createSessionIfNeededConnectingPreviewLayer:completion:](self, "createSessionIfNeededConnectingPreviewLayer:completion:", self->_previewLayer, 0);
  self->_startTime = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  v19 = objc_alloc(MEMORY[0x24BDB2780]);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __33__BCSRootViewController_loadView__block_invoke;
  v34[3] = &unk_250863A10;
  objc_copyWeak(&v35, &location);
  v20 = (void *)objc_msgSend(v19, "initWithEventHandler:", v34);
  -[BCSRootViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addInteraction:", v20);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __33__BCSRootViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v4, "phase") == 1)
    WeakRetained[1040] = 1;

}

- (void)viewDidLayoutSubviews
{
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_statusBarOrientation = objc_msgSend(v3, "statusBarOrientation");

  -[BCSVisualCodeDetector setImageOrientation:](self->_codeDetector, "setImageOrientation:", -[BCSRootViewController _desiredImageOrientation](self, "_desiredImageOrientation"));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_bestCaptureDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  if (!shouldUseSystemPreferredCamera())
  {
    -[BCSRootViewController _preferredInternalCamera](self, "_preferredInternalCamera");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDB2460], "systemPreferredCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == (void *)*MEMORY[0x24BDB1A40])
  {

    goto LABEL_7;
  }
  objc_msgSend(v3, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BDB1A50];

  if (v6 == v7)
  {
LABEL_7:
    v10 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_236DE2000, v10, OS_LOG_TYPE_INFO, "Found ultra wide camera or triple camera from systemPreferredCamera, use preferred internal camera.", v12, 2u);
    }
    -[BCSRootViewController _preferredInternalCamera](self, "_preferredInternalCamera");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = v3;
LABEL_10:
  v11 = v8;

  return v11;
}

- (id)_preferredInternalCamera
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  id obj;
  int v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB2468];
  v3 = (void *)*MEMORY[0x24BDB1A20];
  v4 = *MEMORY[0x24BDB1A58];
  v37[0] = *MEMORY[0x24BDB1A20];
  v37[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v5, *MEMORY[0x24BDB1D50], 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = v6;
  objc_msgSend(v6, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v30 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[BCSRootViewController _bestCaptureFormatForDevice:](self, "_bestCaptureFormatForDevice:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "highResolutionStillImageDimensions");

        if (!v10)
        {
          v10 = v13;
          v9 = HIDWORD(v15);
          v30 = v15;
          continue;
        }
        objc_msgSend(v13, "deviceType");
        v16 = objc_claimAutoreleasedReturnValue();
        if ((void *)v16 == v3)
        {
          v18 = v10;

        }
        else
        {
          v17 = (void *)v16;
          v18 = v10;
          objc_msgSend(v10, "deviceType");
          v19 = v9;
          v20 = v8;
          v21 = v11;
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v22 == v3;
          v11 = v21;
          v8 = v20;
          v9 = v19;
          if (v23)
          {
            v10 = v18;
            continue;
          }
        }
        objc_msgSend(v13, "deviceType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 == v3)
        {
          v10 = v18;
          objc_msgSend(v18, "deviceType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 != v3)
          {
            v25 = v13;

            v9 = HIDWORD(v15);
            goto LABEL_21;
          }
        }
        else
        {

          v10 = v18;
        }
        if ((objc_msgSend(v10, "hasTorch") & 1) == 0 && objc_msgSend(v13, "hasTorch")
          || (int)v15 * HIDWORD(v15) > (unint64_t)(v30 * (uint64_t)(int)v9))
        {
          v25 = v13;

          v9 = HIDWORD(v15);
LABEL_21:
          v30 = v15;
          v10 = v25;
          continue;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (!v8)
        goto LABEL_26;
    }
  }
  v10 = 0;
LABEL_26:

  return v10;
}

- (void)_updateCameraDevice
{
  AVCaptureDevice *v3;
  AVCaptureDevice *v4;
  AVCaptureDevice **p_cameraDevice;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  AVCaptureDeviceRotationCoordinator *v11;
  AVCaptureDeviceRotationCoordinator *videoRotationCoordinator;
  _QWORD block[5];
  uint8_t buf[4];
  AVCaptureDevice *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BCSRootViewController _bestCaptureDevice](self, "_bestCaptureDevice");
  v3 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  p_cameraDevice = &self->_cameraDevice;
  if (self->_cameraDevice != v3)
  {
    v6 = -[AVCaptureDevice position](v3, "position");
    v7 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6 == 2)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543362;
        v15 = v4;
        _os_log_impl(&dword_236DE2000, v7, OS_LOG_TYPE_INFO, "Ignoring front-facing camera: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138477827;
        v15 = v4;
        _os_log_impl(&dword_236DE2000, v7, OS_LOG_TYPE_INFO, "Updating cameraDevice to system preferred: %{private}@", buf, 0xCu);
      }
      -[AVCaptureDeviceRotationCoordinator removeObserver:forKeyPath:](self->_videoRotationCoordinator, "removeObserver:forKeyPath:", self, CFSTR("videoRotationAngleForHorizonLevelPreview"));
      -[AVCaptureDevice removeObserver:forKeyPath:](*p_cameraDevice, "removeObserver:forKeyPath:", self, CFSTR("torchAvailable"));
      -[AVCaptureDevice removeObserver:forKeyPath:](*p_cameraDevice, "removeObserver:forKeyPath:", self, CFSTR("torchActive"));
      -[AVCaptureDevice deviceType](v4, "deviceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)*MEMORY[0x24BDB1A70];

      if (v9 == v10)
        -[BCSRootViewController _endSession](self, "_endSession");
      objc_storeStrong((id *)&self->_cameraDevice, v4);
      -[AVCaptureDevice addObserver:forKeyPath:options:context:](*p_cameraDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("torchAvailable"), 4, observerContext);
      -[AVCaptureDevice addObserver:forKeyPath:options:context:](*p_cameraDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("torchActive"), 4, observerContext);
      v11 = (AVCaptureDeviceRotationCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2478]), "initWithDevice:previewLayer:", *p_cameraDevice, self->_previewLayer);
      videoRotationCoordinator = self->_videoRotationCoordinator;
      self->_videoRotationCoordinator = v11;

      -[AVCaptureDeviceRotationCoordinator addObserver:forKeyPath:options:context:](self->_videoRotationCoordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("videoRotationAngleForHorizonLevelPreview"), 4, observerContext);
      -[BCSRootViewController _startSessionConnectingPreviewLayer:](self, "_startSessionConnectingPreviewLayer:", self->_previewLayer);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__BCSRootViewController__updateCameraDevice__block_invoke;
      block[3] = &unk_250863730;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }

}

uint64_t __44__BCSRootViewController__updateCameraDevice__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "cameraDeviceDidChange");
}

- (void)_updateUserPreferredCameraIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB2460], "userPreferredCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "position") != 1)
  {
    -[BCSRootViewController _preferredInternalCamera](self, "_preferredInternalCamera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_236DE2000, v6, OS_LOG_TYPE_INFO, "Updating userPreferredCamera to %{public}@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDB2460], "setUserPreferredCamera:", v5);

  }
}

- (void)_updateVideoRotationAngleIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_needsUpdateVideoRotationAngle)
    -[BCSRootViewController _updateVideoRotationAngle](self, "_updateVideoRotationAngle");
}

- (void)_updateVideoRotationAngle
{
  self->_needsUpdateVideoRotationAngle = 0;
  -[BCSLiveViewController compensateForVideoRotationAngleInLiveView:](self->_liveViewController, "compensateForVideoRotationAngleInLiveView:", self->_videoRotationAngle);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *captureQueue;
  _QWORD block[4];
  id v15;
  BCSRootViewController *v16;
  id v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if ((void *)observerContext == a6)
  {
    captureQueue = self->_captureQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2508639C0;
    v15 = v11;
    v16 = self;
    v17 = v10;
    dispatch_async(captureQueue, block);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BCSRootViewController;
    -[BCSRootViewController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

void __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  id v6;
  uint64_t v7;
  double v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  char v13;
  char v14;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateUserPreferredCameraIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "_updateCameraDevice");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v3 + 1072))
    {
      *(_BYTE *)(v3 + 1080) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "videoRotationAngleForHorizonLevelPreview");
      *(double *)(*(_QWORD *)(a1 + 40) + 1088) = v8 * 3.14159265 / 180.0;
      v9 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      block[3] = &unk_250863730;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_after(v9, MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      v4 = objc_msgSend(*(id *)(v3 + 968), "isTorchAvailable");
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "isTorchActive");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v10[3] = &unk_250863A38;
      v6 = *(id *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = v6;
      v12 = v7;
      v13 = v4;
      v14 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);

    }
  }
}

uint64_t __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVideoRotationAngleIfNeeded");
}

uint64_t __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("torchAvailable")))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "torchAvailabilityChangedTo:", *(unsigned __int8 *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("torchActive"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "torchActivenessChangedTo:", *(unsigned __int8 *)(a1 + 49));
  return result;
}

- (id)_bestCaptureFormatForDevice:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const opaqueCMFormatDescription *v11;
  unint64_t Dimensions;
  int32_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = a3;
  objc_msgSend(v18, "formats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (const opaqueCMFormatDescription *)objc_msgSend(v10, "formatDescription");
        if (CMFormatDescriptionGetMediaSubType(v11) == 875704422)
        {
          Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v11);
          v13 = Dimensions;
          v14 = HIDWORD(Dimensions);
          if (v6)
          {
            v15 = HIDWORD(Dimensions) * (int)Dimensions;
            if (v15 > v7)
            {
              v16 = v10;

              v6 = v16;
              v7 = v15;
            }
          }
          else
          {
            v6 = v10;
            v7 = (int)v14 * v13;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)disconnectPreviewLayerFromSession
{
  -[AVCaptureVideoPreviewLayer setSession:](self->_previewLayer, "setSession:", 0);
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSRootViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 1;
  if (v2)
  {
    if ((objc_msgSend(v2, "isBeingDismissed") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = 0;
    }
  }

  return v4;
}

- (void)endSession
{
  NSObject *captureQueue;
  _QWORD block[5];

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BCSRootViewController_endSession__block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __35__BCSRootViewController_endSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSession");
}

- (void)_endSession
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVCaptureSession *currentSession;
  AVCaptureDeviceRotationCoordinator *videoRotationCoordinator;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[BCSRootViewController disconnectPreviewLayerFromSession](self, "disconnectPreviewLayerFromSession");
  if (-[AVCaptureSession isRunning](self->_currentSession, "isRunning"))
  {
    -[AVCaptureSession stopRunning](self->_currentSession, "stopRunning");
    -[BCSVisualCodeDetector endSession](self->_codeDetector, "endSession");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AVCaptureSession inputs](self->_currentSession, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        -[AVCaptureSession removeInput:](self->_currentSession, "removeInput:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AVCaptureSession outputs](self->_currentSession, "outputs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[AVCaptureSession removeOutput:](self->_currentSession, "removeOutput:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

  currentSession = self->_currentSession;
  self->_currentSession = 0;

  videoRotationCoordinator = self->_videoRotationCoordinator;
  self->_videoRotationCoordinator = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x24BDB1A18], 0);

}

- (void)_startSessionConnectingPreviewLayer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "start capturing", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke;
  v7[3] = &unk_2508638D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BCSRootViewController executeBlockSynchronouslyWithLockedCameraDevice:](self, "executeBlockSynchronouslyWithLockedCameraDevice:", v7);

}

void __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  _QWORD block[5];
  uint8_t buf[8];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDB24D0]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 976);
    *(_QWORD *)(v4 + 976) = v3;

    objc_msgSend(*(id *)(a1 + 40), "setSession:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  }
  objc_msgSend(v2, "beginConfiguration");
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "inputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "removeInput:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v8);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "outputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "removeOutput:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v13);
  }

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
  v39 = 0;
  objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v16, &v39);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v39;
  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (v18
    || (v20 = objc_msgSend(v19, "canAddInput:", v17), v19 = *(void **)(*(_QWORD *)(a1 + 32) + 976), (v20 & 1) == 0))
  {
    objc_msgSend(v19, "commitConfiguration");
    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    objc_msgSend(v19, "addInput:", v17);
    v21 = objc_alloc_init(MEMORY[0x24BDB2508]);
    v48 = *MEMORY[0x24BDC56B8];
    v49 = &unk_250869900;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setVideoSettings:", v22);

    objc_msgSend(v21, "setSampleBufferDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "canAddOutput:", v21);
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
    if ((v23 & 1) != 0)
    {
      objc_msgSend(v24, "addOutput:", v21);
      objc_msgSend(v21, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isCameraIntrinsicMatrixDeliverySupported"))
      {
        objc_msgSend(v25, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
      }
      else
      {
        v26 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236DE2000, v26, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery not supported", buf, 2u);
        }
      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isExposureModeSupported:", 2))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setExposureMode:", 2);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isWhiteBalanceModeSupported:", 2))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setWhiteBalanceMode:", 2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setVideoZoomFactor:", 1.0);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "areControlsSupported"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setControlsDelegate:queue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2500]), "initWithDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "canAddControl:", v27))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "addControl:", v27);

      }
      v28 = *MEMORY[0x24BDB1B10];
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "canSetSessionPreset:", *MEMORY[0x24BDB1B10]))v29 = v28;
      else
        v29 = *MEMORY[0x24BDB1B20];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setSessionPreset:", v29);
      if (shouldUseSystemPreferredCamera())
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "connection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setVideoRotationAngle:", 0.0);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "connection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isVideoMirroringSupported");

        if (v32)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "connection");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setAutomaticallyAdjustsVideoMirroring:", 0);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "connection");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setVideoMirrored:", 0);

        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "commitConfiguration");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "startRunning");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "videoRotationAngleForHorizonLevelPreview");
      *(double *)(*(_QWORD *)(a1 + 32) + 1088) = v35 * 3.14159265 / 180.0;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke_35;
      block[3] = &unk_250863730;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "startSession");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_subjectAreaDidChange_, *MEMORY[0x24BDB1A18], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

    }
    else
    {
      objc_msgSend(v24, "commitConfiguration");
      objc_msgSend(*(id *)(a1 + 32), "endSession");
    }

  }
}

uint64_t __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVideoRotationAngle");
}

- (void)subjectAreaDidChange:(id)a3
{
  -[BCSRootViewController focusWithMode:exposeWithMode:atDevicePoint:monitorSubjectAreaChange:](self, "focusWithMode:exposeWithMode:atDevicePoint:monitorSubjectAreaChange:", 2, 2, 0, 0.5, 0.5);
}

- (void)_executeBlockWithLockedCameraDevice:(id)a3
{
  AVCaptureDevice *cameraDevice;
  void (**v5)(id, BOOL);
  id v6;
  id v7;

  cameraDevice = self->_cameraDevice;
  v7 = 0;
  v5 = (void (**)(id, BOOL))a3;
  -[AVCaptureDevice lockForConfiguration:](cameraDevice, "lockForConfiguration:", &v7);
  v6 = v7;
  v5[2](v5, v6 == 0);

  -[AVCaptureDevice unlockForConfiguration](self->_cameraDevice, "unlockForConfiguration");
}

- (void)executeBlockAsynchronouslyWithLockedCameraDevice:(id)a3
{
  id v4;
  NSObject *captureQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureQueue = self->_captureQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__BCSRootViewController_executeBlockAsynchronouslyWithLockedCameraDevice___block_invoke;
  v7[3] = &unk_250863A60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureQueue, v7);

}

uint64_t __74__BCSRootViewController_executeBlockAsynchronouslyWithLockedCameraDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeBlockWithLockedCameraDevice:", *(_QWORD *)(a1 + 40));
}

- (void)executeBlockSynchronouslyWithLockedCameraDevice:(id)a3
{
  NSObject *captureQueue;
  id v5;

  captureQueue = self->_captureQueue;
  v5 = a3;
  dispatch_assert_queue_V2(captureQueue);
  -[BCSRootViewController _executeBlockWithLockedCameraDevice:](self, "_executeBlockWithLockedCameraDevice:", v5);

}

- (void)createSessionIfNeededConnectingPreviewLayer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *captureQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__BCSRootViewController_createSessionIfNeededConnectingPreviewLayer_completion___block_invoke;
  block[3] = &unk_250863A88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(captureQueue, block);

}

uint64_t __80__BCSRootViewController_createSessionIfNeededConnectingPreviewLayer_completion___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  if (v2[122])
  {
    if (v3)
    {
      objc_msgSend((id)a1[5], "session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1[4] + 976);

      if (v4 != v5)
        objc_msgSend((id)a1[5], "setSession:", *(_QWORD *)(a1[4] + 976));
    }
  }
  else
  {
    objc_msgSend(v2, "_startSessionConnectingPreviewLayer:", v3);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1[4] + 976));
  return result;
}

- (void)setLiveZoomFactor:(double)a3
{
  NSObject *captureQueue;
  _QWORD v4[6];

  captureQueue = self->_captureQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__BCSRootViewController_setLiveZoomFactor___block_invoke;
  v4[3] = &unk_250863AD8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(captureQueue, v4);
}

uint64_t __43__BCSRootViewController_setLiveZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[6];

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isRunning");
  if ((_DWORD)result)
  {
    v3 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "videoZoomFactor");
    v5 = v3 * v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "activeFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoMaxZoomFactor");
    v8 = v7;

    if (v5 >= v8)
      v9 = v8;
    else
      v9 = v5;
    v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__BCSRootViewController_setLiveZoomFactor___block_invoke_2;
    v11[3] = &unk_250863AB0;
    v11[4] = v10;
    v11[5] = fmax(v9, 1.0);
    return objc_msgSend(v10, "executeBlockSynchronouslyWithLockedCameraDevice:", v11);
  }
  return result;
}

uint64_t __43__BCSRootViewController_setLiveZoomFactor___block_invoke_2(uint64_t result, int a2, double a3, double a4)
{
  if (a2)
  {
    LODWORD(a4) = 1157234688;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 968), "rampToVideoZoomFactor:withRate:", *(double *)(result + 40), a4);
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BCSRootViewController;
  v7 = a4;
  -[BCSRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[BCSLiveViewController rotationAnimationWillStart](self->_liveViewController, "rotationAnimationWillStart");
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_250863B00;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_250863B00;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

void __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v2 = shouldUseSystemPreferredCamera();
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_updateVideoRotationAngle");
  }
  else
  {
    v4 = (void *)v3[125];
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "statusBarOrientation");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
    objc_msgSend(v4, "compensateForInterfaceOrientationInLiveView:referenceSize:", v5, v7, v8);

  }
}

uint64_t __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "rotationAnimationDidFinish");
}

- (void)_pauseSessionIfNeeded
{
  NSObject *captureQueue;
  _QWORD block[5];

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__BCSRootViewController__pauseSessionIfNeeded__block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

void __46__BCSRootViewController__pauseSessionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isRunning"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "stopRunning");
    v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_236DE2000, v2, OS_LOG_TYPE_INFO, "_pauseSessionIfNeeded - stopRunning.", v3, 2u);
    }
  }
}

- (void)_restartSessionIfNeeded
{
  AVCaptureVideoPreviewLayer *previewLayer;
  _QWORD v3[5];

  previewLayer = self->_previewLayer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__BCSRootViewController__restartSessionIfNeeded__block_invoke;
  v3[3] = &unk_250863B28;
  v3[4] = self;
  -[BCSRootViewController createSessionIfNeededConnectingPreviewLayer:completion:](self, "createSessionIfNeededConnectingPreviewLayer:completion:", previewLayer, v3);
}

void __48__BCSRootViewController__restartSessionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isRunning"))
  {
    v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236DE2000, v2, OS_LOG_TYPE_INFO, "_restartSessionIfNeeded - isRunning.", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__BCSRootViewController__restartSessionIfNeeded__block_invoke_43;
    block[3] = &unk_250863730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __48__BCSRootViewController__restartSessionIfNeeded__block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "resetUIAndStartCapturing:", 1);
}

- (void)_clearResumeCapturingTimer
{
  NSTimer *resumeCapturingTimer;

  -[NSTimer invalidate](self->_resumeCapturingTimer, "invalidate");
  resumeCapturingTimer = self->_resumeCapturingTimer;
  self->_resumeCapturingTimer = 0;

}

- (void)suspendCapturing
{
  void *v3;
  char v4;

  -[BCSLiveViewController actionCoordinator](self->_liveViewController, "actionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsBeingUnlocked");

  if ((v4 & 1) == 0)
  {
    -[BCSRootViewController _clearResumeCapturingTimer](self, "_clearResumeCapturingTimer");
    -[BCSLiveViewController resetUIAndStartCapturing:](self->_liveViewController, "resetUIAndStartCapturing:", 0);
    -[BCSRootViewController _pauseSessionIfNeeded](self, "_pauseSessionIfNeeded");
  }
}

- (void)resumeCapturing
{
  void *v3;
  char v4;
  void *v5;
  NSTimer *v6;
  NSTimer *resumeCapturingTimer;
  _QWORD v8[5];

  -[BCSLiveViewController actionCoordinator](self->_liveViewController, "actionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsBeingUnlocked");

  if ((v4 & 1) == 0)
  {
    -[BCSRootViewController _clearResumeCapturingTimer](self, "_clearResumeCapturingTimer");
    if (self->_shouldResumeCapturingOnNextAppActive)
    {
      if (self->_applicationWasInBackground)
      {
        self->_applicationWasInBackground = 0;
      }
      else
      {
        -[BCSRootViewController presentedViewController](self, "presentedViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
        {
          v8[0] = MEMORY[0x24BDAC760];
          v8[1] = 3221225472;
          v8[2] = __40__BCSRootViewController_resumeCapturing__block_invoke;
          v8[3] = &unk_250863B50;
          v8[4] = self;
          objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 0.1);
          v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          resumeCapturingTimer = self->_resumeCapturingTimer;
          self->_resumeCapturingTimer = v6;

        }
      }
    }
    else
    {
      self->_shouldResumeCapturingOnNextAppActive = 1;
    }
  }
}

uint64_t __40__BCSRootViewController_resumeCapturing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartSessionIfNeeded");
}

- (void)applicationWillEnterForeground
{
  void *v3;
  char v4;

  -[BCSLiveViewController actionCoordinator](self->_liveViewController, "actionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsBeingUnlocked");

  if ((v4 & 1) == 0 && self->_applicationWasInBackground)
    -[BCSRootViewController _restartSessionIfNeeded](self, "_restartSessionIfNeeded");
}

- (void)applicationDidEnterBackground
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *captureQueue;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  -[BCSLiveViewController actionCoordinator](self->_liveViewController, "actionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsBeingUnlocked");

  if ((v4 & 1) == 0)
  {
    -[BCSRootViewController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[BCSRootViewController _clearResumeCapturingTimer](self, "_clearResumeCapturingTimer");
      -[BCSLiveViewController resetUIAndStartCapturing:](self->_liveViewController, "resetUIAndStartCapturing:", 0);
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v7 = MEMORY[0x24BDAC760];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __54__BCSRootViewController_applicationDidEnterBackground__block_invoke;
      v15[3] = &unk_250863B78;
      v8 = v6;
      v16 = v8;
      v17 = &v18;
      v9 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.BarcodeScanner.BackgroundTask"), v15);
      v19[3] = v9;
      captureQueue = self->_captureQueue;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __54__BCSRootViewController_applicationDidEnterBackground__block_invoke_2;
      block[3] = &unk_250863BA0;
      block[4] = self;
      v13 = v8;
      v14 = &v18;
      v11 = v8;
      dispatch_async(captureQueue, block);
      self->_applicationWasInBackground = 1;

      _Block_object_dispose(&v18, 8);
    }
  }
}

uint64_t __54__BCSRootViewController_applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __54__BCSRootViewController_applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isRunning"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "stopRunning");
    v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_236DE2000, v2, OS_LOG_TYPE_INFO, "applicationDidEnterBackground - stopRunning.", v4, 2u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (void)continueUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detectedCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSRootViewController continueUserActivity:].cold.4(v9);
    }
    else
    {
      objc_msgSend(v4, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("detectedImage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v19, &v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v33;
        if (v9)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[BCSRootViewController continueUserActivity:].cold.2(v9);
        }
        else
        {
          self->_hasCapturedCode = 1;
          self->_applicationWasInBackground = 0;
          self->_shouldResumeCapturingOnNextAppActive = 1;
          -[BCSRootViewController presentedViewController](self, "presentedViewController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v30[0] = MEMORY[0x24BDAC760];
            v30[1] = 3221225472;
            v30[2] = __46__BCSRootViewController_continueUserActivity___block_invoke;
            v30[3] = &unk_2508639C0;
            v30[4] = self;
            v31 = v7;
            v32 = v20;
            -[BCSRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v30);

          }
          else
          {
            -[BCSLiveViewController didCaptureVisualCode:image:shouldAnimate:](self->_liveViewController, "didCaptureVisualCode:image:shouldAnimate:", v7, v20, 0);
          }
        }

      }
      else
      {
        v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v21)
          -[BCSRootViewController continueUserActivity:].cold.3(v21, v22, v23, v24, v25, v26, v27, v28);
        v9 = 0;
      }

    }
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[BCSRootViewController continueUserActivity:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __46__BCSRootViewController_continueUserActivity___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 1000), "didCaptureVisualCode:image:shouldAnimate:", a1[5], a1[6], 0);
}

- (unsigned)_desiredImageOrientation
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (shouldUseSystemPreferredCamera())
  {
    -[AVCaptureDevice deviceType](self->_cameraDevice, "deviceType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)*MEMORY[0x24BDB1A70];

    if (v3 == v4)
      return 1;
  }
  v5 = self->_statusBarOrientation - 2;
  if (v5 > 2)
    return 6;
  else
    return dword_236DFDD00[v5];
}

- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6
{
  _QWORD v6[6];
  CGPoint v7;
  int64_t v8;
  BOOL v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __93__BCSRootViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke;
  v6[3] = &unk_250863BC8;
  v6[4] = self;
  v6[5] = a3;
  v7 = a5;
  v8 = a4;
  v9 = a6;
  -[BCSRootViewController executeBlockAsynchronouslyWithLockedCameraDevice:](self, "executeBlockAsynchronouslyWithLockedCameraDevice:", v6);
}

uint64_t __93__BCSRootViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    if (objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 968), "isFocusPointOfInterestSupported")
      && objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "isFocusModeSupported:", *(_QWORD *)(v2 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "setFocusPointOfInterest:", *(double *)(v2 + 48), *(double *)(v2 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "setFocusMode:", *(_QWORD *)(v2 + 40));
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "isExposurePointOfInterestSupported"))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "isExposureModeSupported:", *(_QWORD *)(v2 + 64)))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "setExposurePointOfInterest:", *(double *)(v2 + 48), *(double *)(v2 + 56));
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "setExposureMode:", *(_QWORD *)(v2 + 64));
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 968), "setSubjectAreaChangeMonitoringEnabled:", *(unsigned __int8 *)(v2 + 72));
  }
  return result;
}

- (BOOL)_isCapturingSteady
{
  if (-[AVCaptureDevice isAdjustingExposure](self->_cameraDevice, "isAdjustingExposure"))
    return 0;
  else
    return !-[AVCaptureDevice isAdjustingFocus](self->_cameraDevice, "isAdjustingFocus");
}

- (id)_bestCandidateVisualCode:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  CGRect v15;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else if (objc_msgSend(v4, "count") == 2)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0x7FEFFFFFFFFFFFFFLL;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__BCSRootViewController__bestCandidateVisualCode___block_invoke;
    v9[3] = &unk_250863BF0;
    v9[4] = v14;
    v9[5] = &v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(v4, "objectAtIndex:", v11[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingBox");
    if (CGRectGetWidth(v15) >= 0.05)
    {
      v6 = 1;
    }
    else
    {

      v5 = 0;
      v6 = 2;
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    v5 = 0;
    v6 = 2 * ((unint64_t)objc_msgSend(v4, "count") > 2);
  }
  if (self->_lastAvailability != v6)
  {
    self->_lastAvailability = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__BCSRootViewController__bestCandidateVisualCode___block_invoke_2;
    v8[3] = &unk_250863AD8;
    v8[4] = self;
    v8[5] = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);
  }

  return v5;
}

uint64_t __50__BCSRootViewController__bestCandidateVisualCode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;
  uint64_t v7;

  objc_msgSend(a2, "boundingBox");
  result = _bcs_pointToRectDistance();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 < *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

uint64_t __50__BCSRootViewController__bestCandidateVisualCode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "updateQRCodeAvailability:", *(_QWORD *)(a1 + 40));
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  id v9;
  BCSVisualCodeDetector *codeDetector;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v8 = a3;
  v9 = a5;
  if (!self->_hasCapturedCode
    && (self->_shouldScanFaster || -[BCSRootViewController _isCapturingSteady](self, "_isCapturingSteady"))
    && CMSampleBufferGetNumSamples(a4) == 1
    && CMSampleBufferIsValid(a4)
    && CMSampleBufferDataIsReady(a4))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    codeDetector = self->_codeDetector;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v11[3] = &unk_250863C18;
    v11[4] = self;
    v11[5] = &v12;
    v11[6] = a4;
    -[BCSVisualCodeDetector detectCodeFromBuffer:completion:](codeDetector, "detectCodeFromBuffer:completion:", a4, v11);
    if (*((_BYTE *)v13 + 24))
      -[BCSVisualCodeDetector resetCache](self->_codeDetector, "resetCache");
    _Block_object_dispose(&v12, 8);
  }

}

void __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_bestCandidateVisualCode:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_imageFromLastVideoSample:rect:", v4, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
    block[3] = &unk_2508639C0;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 1000), "didCaptureVisualCode:image:shouldAnimate:", a1[5], a1[6], 1);
}

- (void)liveViewControllerWillPerformAction:(id)a3
{
  NSObject *v4;
  NSObject *captureQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "end capturing enableTelemetry=YES ", buf, 2u);
  }
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BCSRootViewController_liveViewControllerWillPerformAction___block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

void __61__BCSRootViewController_liveViewControllerWillPerformAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "stopRunning");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "endSession");
  v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_236DE2000, v2, OS_LOG_TYPE_INFO, "liveViewControllerWillPerformAction - stopRunning.", v3, 2u);
  }
}

- (void)liveViewControllerDidResetCapture:(id)a3
{
  NSObject *v4;
  NSObject *captureQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "restart capturing", buf, 2u);
  }
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BCSRootViewController_liveViewControllerDidResetCapture___block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

void __59__BCSRootViewController_liveViewControllerDidResetCapture___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 1016) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "startRunning");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "startSession");
  v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_236DE2000, v2, OS_LOG_TYPE_INFO, "liveViewControllerDidResetCapture - startRunning.", v3, 2u);
  }
}

- (BOOL)liveViewControllerTorchModeSupported:(id)a3
{
  _BOOL4 v4;

  v4 = -[AVCaptureDevice hasTorch](self->_cameraDevice, "hasTorch", a3);
  if (v4)
    LOBYTE(v4) = -[AVCaptureDevice isTorchModeSupported:](self->_cameraDevice, "isTorchModeSupported:", 1);
  return v4;
}

- (void)liveViewController:(id)a3 torchModeChangedTo:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke;
  v4[3] = &unk_250863C40;
  v5 = a4;
  v4[4] = self;
  -[BCSRootViewController _executeBlockWithLockedCameraDevice:](self, "_executeBlockWithLockedCameraDevice:", v4);
}

void __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke(uint64_t a1, int a2, double a3)
{
  int v3;
  void *v4;
  id v5;
  uint8_t v6[8];
  id v7;

  if (a2)
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
    if (v3)
    {
      v7 = 0;
      LODWORD(a3) = 1.0;
      objc_msgSend(v4, "setTorchModeOnWithLevel:error:", &v7, a3);
      v5 = v7;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke_cold_1(v5);
      }

    }
    else
    {
      objc_msgSend(v4, "setTorchMode:", 0);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_236DE2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSRootViewController: unable to gain exclusive ownership of the device to adjust the torch", v6, 2u);
  }
}

- (id)_imageFromLastVideoSample:(opaqueCMSampleBuffer *)a3 rect:(CGRect)a4
{
  CVImageBufferRef ImageBuffer;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v6 = (void *)MEMORY[0x24BDBF660];
  v7 = *MEMORY[0x24BDBF8D8];
  v17[0] = MEMORY[0x24BDBD1C8];
  v8 = *MEMORY[0x24BDBF900];
  v16[0] = v7;
  v16[1] = v8;
  v14 = *MEMORY[0x24BDD9698];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[BCSRootViewController _desiredImageOrientation](self, "_desiredImageOrientation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithCVPixelBuffer:options:", ImageBuffer, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)liveViewController:(id)a3 didTapAtDevicePoint:(CGPoint)a4
{
  -[BCSRootViewController focusWithMode:exposeWithMode:atDevicePoint:monitorSubjectAreaChange:](self, "focusWithMode:exposeWithMode:atDevicePoint:monitorSubjectAreaChange:", 1, 1, 1, a4.x, a4.y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoRotationCoordinator, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_codeDetector, 0);
  objc_storeStrong((id *)&self->_resumeCapturingTimer, 0);
  objc_storeStrong((id *)&self->_liveViewController, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_cameraDevice, 0);
}

- (void)continueUserActivity:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSRootViewController: UserActivity doesn't contain detectedCode", a5, a6, a7, a8, 0);
}

- (void)continueUserActivity:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSRootViewController: could not decode detectedImage from UserActivity: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)continueUserActivity:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSRootViewController: UserActivity doesn't contain detectedImage", a5, a6, a7, a8, 0);
}

- (void)continueUserActivity:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSRootViewController: could not decode detectedCode from UserActivity: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

void __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236DE2000, MEMORY[0x24BDACB70], v2, "BCSRootViewController: failed to set torch mode on %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

@end
