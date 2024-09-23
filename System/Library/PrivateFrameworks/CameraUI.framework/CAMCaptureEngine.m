@implementation CAMCaptureEngine

+ (void)preheatCaptureResources
{
  if (preheatCaptureResources_onceToken != -1)
    dispatch_once(&preheatCaptureResources_onceToken, &__block_literal_global_22);
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.camera.capture-engine.session-queue", v2);
  v1 = (void *)prewarmedCaptureSessionQueue;
  prewarmedCaptureSessionQueue = (uint64_t)v0;

  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_24);
  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_25);
  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_26);

}

id __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_2()
{
  return _prewarmAVCaptureSession();
}

- (id)prewarmedCaptureSession
{
  void *v2;
  void *v3;

  _prewarmAVCaptureSession();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)prewarmedAVCaptureSession;
  prewarmedAVCaptureSession = 0;

  return v2;
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_3()
{
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_15);
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_4()
{
  if (_prewarmAudioVideoDevices_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_18);
}

- (void)registerCaptureService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMCaptureEngine _captureServicesQueue](self, "_captureServicesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CAMCaptureEngine_registerCaptureService___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)_captureServicesQueue
{
  return self->__captureServicesQueue;
}

void __43__CAMCaptureEngine_registerCaptureService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_servicesQueueCaptureServices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableArray)_servicesQueueCaptureServices
{
  return self->__servicesQueueCaptureServices;
}

- (id)stillImageOutput
{
  AVCapturePhotoOutput *stillImageOutput;
  void *v4;
  AVCapturePhotoOutput *v5;
  AVCapturePhotoOutput *v6;
  void *v7;

  stillImageOutput = self->_stillImageOutput;
  if (!stillImageOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x1E0C8B0E8]);
    v6 = self->_stillImageOutput;
    self->_stillImageOutput = v5;

    objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCapturePhotoOutput setPhotoSettingsForSceneMonitoring:](self->_stillImageOutput, "setPhotoSettingsForSceneMonitoring:", v7);
    -[AVCapturePhotoOutput setPrivatePhotoDimensionsEnabled:](self->_stillImageOutput, "setPrivatePhotoDimensionsEnabled:", 1);
    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);

    stillImageOutput = self->_stillImageOutput;
  }
  return stillImageOutput;
}

- (void)enqueueCommand:(id)a3
{
  void *v4;
  CAMCaptureCommandContext *v5;
  void *v6;
  CAMCaptureCommandContext *v7;
  id v8;
  void *v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[CAMCaptureCommandContext initWithCaptureEngine:]([CAMCaptureCommandContext alloc], "initWithCaptureEngine:", self);
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v7 = v5;
  v8 = v4;
  pl_dispatch_async();

}

- (OS_dispatch_queue)_captureSessionQueue
{
  return self->__captureSessionQueue;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

void __35__CAMCaptureEngine_enqueueCommand___block_invoke(uint64_t a1)
{
  double Current;
  id v3;
  double v4;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v11 = 0;
  v12 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_beginSessionConfigurationIfRequiredByCommand:withContext:logReason:minimumExecutionTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v11, &v12);
  v3 = v11;
  if (objc_msgSend(*(id *)(a1 + 32), "_lockAllEngineManagedDevices"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeCommand:withContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_unlockAllEngineManagedDevices");
  }
  objc_msgSend(*(id *)(a1 + 32), "_commitSessionConfigurationIfNecessaryWithLogReason:", v3);
  v4 = CFAbsoluteTimeGetCurrent() - Current;
  if (v12 > 0.0 && v4 < v12)
  {
    v6 = v12 - v4;
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v14 = v6;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Sleeping for %.3f seconds to meet minimum mode change time %.3f", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_accumulatedUserInfoFromCommand:", *(_QWORD *)(a1 + 40), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    pl_dispatch_async();

  }
}

- (AVCaptureSession)_captureSession
{
  return self->__captureSession;
}

- (BOOL)_lockAllEngineManagedDevices
{
  CAMMemoizationCache *captureEngineDeviceCache;
  _BOOL4 v4;
  _BOOL8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  captureEngineDeviceCache = self->__captureEngineDeviceCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CAMCaptureEngine__lockAllEngineManagedDevices__block_invoke;
  v7[3] = &unk_1EA32E860;
  v7[4] = self;
  v7[5] = &v8;
  -[CAMMemoizationCache enumerateKeysAndObjectsUsingBlock:](captureEngineDeviceCache, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = -[CAMCaptureEngine _lockManagedCapturedDevice:](self, "_lockManagedCapturedDevice:", self->_audioCameraDevice);
  if (*((_BYTE *)v9 + 24))
    v5 = v4;
  else
    v5 = 0;
  -[CAMCaptureEngine setManagedDevicesLockedForConfiguration:](self, "setManagedDevicesLockedForConfiguration:", v5);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_lockManagedCapturedDevice:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9 = 0;
    v5 = objc_msgSend(v3, "lockForConfiguration:", &v9);
    v6 = v9;
    if ((v5 & 1) == 0)
    {
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CAMCaptureEngine _lockManagedCapturedDevice:].cold.1();

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)setManagedDevicesLockedForConfiguration:(BOOL)a3
{
  self->_managedDevicesLockedForConfiguration = a3;
}

- (void)_executeCommand:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CAMCaptureEngine _updateContext:](self, "_updateContext:", v7);
  CAMSignpostWithIDAndArgs(23, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(v6, "executeWithContext:", v7);
  CAMSignpostWithIDAndArgs(24, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "subcommands", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CAMCaptureEngine _executeCommand:withContext:](self, "_executeCommand:withContext:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_updateContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  CAMCaptureEngine *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;

  v4 = a3;
  objc_msgSend(v4, "clear");
  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentCaptureSession:", v30);
  objc_msgSend(v30, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "outputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "controls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __35__CAMCaptureEngine__updateContext___block_invoke;
  v39[3] = &unk_1EA32E798;
  v39[4] = self;
  v9 = v4;
  v40 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v39);
  -[CAMCaptureEngine _videoDeviceInputFromSession:](self, "_videoDeviceInputFromSession:", v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentVideoDevice:", v12);
    objc_msgSend(v12, "activeFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentVideoDeviceFormat:", v13);

    objc_msgSend(v12, "activeDepthDataFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentDepthDataFormat:", v14);

    objc_msgSend(v30, "sessionPreset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentVideoDevicePreset:", v15);

    objc_msgSend(v9, "setCurrentVideoDeviceInput:", v11);
  }
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __35__CAMCaptureEngine__updateContext___block_invoke_2;
  v37[3] = &unk_1EA32E7C0;
  v37[4] = self;
  v16 = v9;
  v38 = v16;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v37);
  if (v11)
  {
    objc_msgSend(v11, "device");
    v29 = v7;
    v17 = v6;
    v18 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", v20, objc_msgSend(v19, "position"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "systemZoomSlider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemLensSelector");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemExposureSlider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSystemDeviceActionDelegate:", self);

    v8 = MEMORY[0x1E0C809B0];
    v5 = v18;
    v6 = v17;
    v7 = v29;
  }
  else
  {
    v24 = 0;
    v23 = 0;
    v22 = 0;
  }
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __35__CAMCaptureEngine__updateContext___block_invoke_3;
  v31[3] = &unk_1EA32E7E8;
  v32 = v22;
  v33 = v16;
  v34 = v23;
  v35 = v24;
  v36 = self;
  v25 = v24;
  v26 = v23;
  v27 = v16;
  v28 = v22;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v31);
  objc_msgSend(v27, "setCurrentVideoPreviewLayer:", self->__videoPreviewLayer);

}

- (id)backCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89FA0], 1);
}

- (CAMMemoizationCache)_captureEngineDeviceCache
{
  return self->__captureEngineDeviceCache;
}

- (BOOL)areManagedDevicesLockedForConfiguration
{
  return self->_managedDevicesLockedForConfiguration;
}

- (id)prewarmedVideoDeviceInput:(id)a3 position:(int64_t)a4 device:(id)a5
{
  id v7;
  id v8;
  id v10;
  void *v12;

  v7 = a3;
  v8 = a5;
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_15);
  if ((id)prewarmedVideoDeviceType != v7 || prewarmedVideoDevicePosition != a4)
    goto LABEL_11;
  if (_prewarmAudioVideoDevices_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_18);
  if ((id)prewarmedVideoDevice == v8)
  {
    v10 = (id)prewarmedVideoDeviceInput;
    v12 = (void *)prewarmedVideoDeviceInput;
    prewarmedVideoDeviceInput = 0;

  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  return v10;
}

- (id)videoThumbnailOutput
{
  AVCaptureVideoThumbnailOutput *videoThumbnailOutput;
  void *v4;
  AVCaptureVideoThumbnailOutput *v5;
  AVCaptureVideoThumbnailOutput *v6;

  videoThumbnailOutput = self->_videoThumbnailOutput;
  if (!videoThumbnailOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = (AVCaptureVideoThumbnailOutput *)objc_alloc_init(MEMORY[0x1E0C8B178]);
    v6 = self->_videoThumbnailOutput;
    self->_videoThumbnailOutput = v5;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);
    videoThumbnailOutput = self->_videoThumbnailOutput;
  }
  return videoThumbnailOutput;
}

- (id)metadataOutput
{
  AVCaptureMetadataOutput *metadataOutput;
  void *v4;
  AVCaptureMetadataOutput *v5;
  AVCaptureMetadataOutput *v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *metadataObjectsQueue;
  AVCaptureMetadataOutput *v10;
  void *v11;

  metadataOutput = self->_metadataOutput;
  if (!metadataOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x1E0C8B0C8]);
    v6 = self->_metadataOutput;
    self->_metadataOutput = v5;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.capture-engine.metadata-queue", v7);
    metadataObjectsQueue = self->__metadataObjectsQueue;
    self->__metadataObjectsQueue = v8;

    v10 = self->_metadataOutput;
    -[CAMCaptureEngine _metadataObjectsQueue](self, "_metadataObjectsQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](v10, "setMetadataObjectsDelegate:queue:", self, v11);

    metadataOutput = self->_metadataOutput;
  }
  return metadataOutput;
}

- (OS_dispatch_queue)_metadataObjectsQueue
{
  return self->__metadataObjectsQueue;
}

uint64_t __35__CAMCaptureEngine__updateContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v4 + 16) == a2)
  {
    v6 = result;
    objc_msgSend(*(id *)(result + 40), "setCurrentAudioDevice:", *(_QWORD *)(v4 + 8));
    result = objc_msgSend(*(id *)(v6 + 40), "setCurrentAudioDeviceInput:", *(_QWORD *)(*(_QWORD *)(v6 + 32) + 16));
    *a4 = 1;
  }
  return result;
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (void)_unlockAllEngineManagedDevices
{
  CAMMemoizationCache *captureEngineDeviceCache;
  _QWORD v4[5];

  captureEngineDeviceCache = self->__captureEngineDeviceCache;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CAMCaptureEngine__unlockAllEngineManagedDevices__block_invoke;
  v4[3] = &unk_1EA32E888;
  v4[4] = self;
  -[CAMMemoizationCache enumerateKeysAndObjectsUsingBlock:](captureEngineDeviceCache, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[CAMCaptureEngine _unlockManagedCaptureDevice:](self, "_unlockManagedCaptureDevice:", self->_audioCameraDevice);
  -[CAMCaptureEngine setManagedDevicesLockedForConfiguration:](self, "setManagedDevicesLockedForConfiguration:", 0);
}

void __50__CAMCaptureEngine__unlockAllEngineManagedDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "captureDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_unlockManagedCaptureDevice:", v4);

}

- (void)_unlockManagedCaptureDevice:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isLockedForConfiguration"))
    objc_msgSend(v3, "unlockForConfiguration");

}

- (BOOL)_updatePanoramaSubgraphForEnteringBackground:(BOOL)a3
{
  void *v5;
  CAMPanoramaOutput *v6;
  CAMPanoramaOutput *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v13;
  _QWORD v15[4];
  CAMPanoramaOutput *v16;

  -[AVCaptureSession outputs](self->__captureSession, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_panoramaVideoDataOutput;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__CAMCaptureEngine__updatePanoramaSubgraphForEnteringBackground___block_invoke;
  v15[3] = &unk_1EA32EB70;
  v7 = v6;
  v16 = v7;
  v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v15);
  -[AVCaptureVideoDataOutput sampleBufferDelegate](v7, "sampleBufferDelegate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3 || (v8 == 0x7FFFFFFFFFFFFFFFLL ? (v11 = v9 == 0) : (v11 = 1), !v11))
  {
    -[CAMCaptureEngine _sessionQueuePanoramaTeardown](self, "_sessionQueuePanoramaTeardown");
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 != 0)
    goto LABEL_14;
  -[CAMCaptureEngine _sessionQueuePanoramaSetup](self, "_sessionQueuePanoramaSetup");
  v13 = 1;
LABEL_15:

  return v13;
}

BOOL __65__CAMCaptureEngine__updatePanoramaSubgraphForEnteringBackground___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (void)_updateEffectsSubgraph
{
  int v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  -[AVCaptureSession outputs](self->__captureSession, "outputs");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v10, "containsObject:", self->_effectsPreviewVideoDataOutput);
  -[AVCaptureVideoDataOutput sampleBufferDelegate](self->_effectsPreviewVideoDataOutput, "sampleBufferDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    -[CAMCaptureEngine effectsPreviewVideoDataOutput](self, "effectsPreviewVideoDataOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine _effectsPreviewSampleBufferQueue](self, "_effectsPreviewSampleBufferQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSampleBufferDelegate:queue:", self, v9);

  }
  else
  {
    if (v4)
      v7 = v3;
    else
      v7 = 1;
    if ((v7 & 1) == 0)
      -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self->_effectsPreviewVideoDataOutput, "setSampleBufferDelegate:queue:", 0, 0);
  }

}

- (void)_updateVideoThumbnailSubgraph
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  id v10;

  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[AVCaptureSession outputs](self->__captureSession, "outputs");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v10, "containsObject:", self->_videoThumbnailOutput);
  -[AVCaptureVideoThumbnailOutput thumbnailContentsDelegate](self->_videoThumbnailOutput, "thumbnailContentsDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    -[CAMCaptureEngine videoThumbnailOutput](self, "videoThumbnailOutput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setThumbnailContentsDelegate:", self);

  }
  else
  {
    if (v5)
      v8 = v4;
    else
      v8 = 1;
    if ((v8 & 1) == 0)
      -[AVCaptureVideoThumbnailOutput setThumbnailContentsDelegate:](self->_videoThumbnailOutput, "setThumbnailContentsDelegate:", 0);
  }

}

- (BOOL)_shouldStartSessionOnConfigurationChanges
{
  return (-[CAMCaptureEngine _engineOptions](self, "_engineOptions") & 1) == 0;
}

- (int64_t)_engineOptions
{
  return self->__engineOptions;
}

- (void)_scheduleDelayedSessionNonstartRecovery
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__CAMCaptureEngine__scheduleDelayedSessionNonstartRecovery__block_invoke;
  v2[3] = &unk_1EA328868;
  v2[4] = self;
  cam_perform_on_main_asap(v2);
}

uint64_t __59__CAMCaptureEngine__scheduleDelayedSessionNonstartRecovery__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelDelayedSessionNonstartRecovery");
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__performSessionNonstartRecoveryIfNeeded, 0, 5.0);
}

- (void)_cancelDelayedSessionNonstartRecovery
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__CAMCaptureEngine__cancelDelayedSessionNonstartRecovery__block_invoke;
  v2[3] = &unk_1EA328868;
  v2[4] = self;
  cam_perform_on_main_asap(v2);
}

uint64_t __57__CAMCaptureEngine__cancelDelayedSessionNonstartRecovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__performSessionNonstartRecoveryIfNeeded, 0);
}

- (void)_handleSessionDidStartRunning:(id)a3
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession started running!", buf, 0xCu);

  }
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(v6, block);

  -[CAMCaptureEngine _scheduleDelayedRecoveryCheckIfNecessary](self, "_scheduleDelayedRecoveryCheckIfNecessary");
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", &__block_literal_global_71);
}

- (void)_scheduleDelayedRecoveryCheckIfNecessary
{
  NSObject *v3;
  void *v4;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke;
  block[3] = &unk_1EA32C0D8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v7 + 24))
  {
    dispatch_time(0, 250000000);
    -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_after();

  }
  _Block_object_dispose(&v6, 8);
}

- (OS_dispatch_queue)_recoveryMutexQueue
{
  return self->__recoveryMutexQueue;
}

uint64_t __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isPerformingRecovery
{
  return self->__performingRecovery;
}

- (void)_enumerateCaptureServicesUsingBlock:(id)a3
{
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:completion:](self, "_enumerateCaptureServicesUsingBlock:completion:", a3, 0);
}

- (void)_enumerateCaptureServicesUsingBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CAMCaptureEngine _captureServicesQueue](self, "_captureServicesQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke;
  block[3] = &unk_1EA32E8D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_servicesQueueCaptureServices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke_2;
  v4[3] = &unk_1EA32E8B0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

uint64_t __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_accumulatedUserInfoFromCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  CAMCaptureEngine *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "subcommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __52__CAMCaptureEngine__accumulatedUserInfoFromCommand___block_invoke;
    v15 = &unk_1EA32E838;
    v16 = self;
    v8 = v7;
    v17 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v12);
    v9 = objc_msgSend(v8, "count", v12, v13, v14, v15, v16);
    objc_msgSend(v4, "userInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);

      v10 = v8;
    }

  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __52__CAMCaptureEngine__accumulatedUserInfoFromCommand___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accumulatedUserInfoFromCommand:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v3);
    v3 = v4;
  }

}

void __48__CAMCaptureEngine__lockAllEngineManagedDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "captureDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_lockManagedCapturedDevice:") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

- (void)_performSessionNonstartRecoveryIfNeeded
{
  char v3;
  char v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];

  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "isRunning");
  v4 = objc_msgSend(v6, "isInterrupted");
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__CAMCaptureEngine__performSessionNonstartRecoveryIfNeeded__block_invoke;
    block[3] = &unk_1EA328868;
    block[4] = self;
    dispatch_sync(v5, block);

    -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:](self, "_handleFailedSessionRecoveryAttemptAfterDelay:", 0);
  }

}

- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v9 = v6;
  v10 = v7;
  pl_dispatch_async();

}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "uniqueID");
  mach_absolute_time();
  CAMSignpostWithIDAndArgs(35, v8, v8, 0, 0, 0);
  -[CAMCaptureEngine _destroyAccidentalLaunchTimer](self, "_destroyAccidentalLaunchTimer");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[CAMCaptureEngine _signpostMutexQueue](self, "_signpostMutexQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke;
  block[3] = &unk_1EA32E008;
  block[5] = &v14;
  block[6] = v8;
  block[4] = self;
  dispatch_sync(v9, block);

  if (*((_BYTE *)v15 + 24))
  {
    CAMSignpostWithIDAndArgs(70, v8, v8, 0, 0, 0);
    CAMSignpostWithIDAndArgs(72, v8, v8, 0, 0, 0);
  }
  if (objc_msgSend(v7, "cam_isRecordingMovieForLivePhoto"))
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v8;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:willBeginCaptureForResolvedSettings: with video", buf, 0xCu);
    }

    -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    pl_dispatch_async();

  }
  else
  {
    CAMSignpostWithIDAndArgs(36, v8, v8, 0, 0, 0);
  }
  _Block_object_dispose(&v14, 8);

}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "uniqueID");
  CAMSignpostWithIDAndArgs(37, v8, v8, 0, 0, 0);
  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v10 = v6;
  v11 = v7;
  pl_dispatch_async();

}

void __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double Seconds;
  double v13;
  void *v14;
  CGFloat v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  void *v24;
  CGFloat v25;
  CGColor *SRGB;
  unint64_t v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  CAMStillImageCaptureResolvedSettings *v31;
  void *v32;
  CAMStillImageCaptureResolvedSettings *v33;
  unsigned int v34;
  _QWORD v35[4];
  id v36;
  CAMStillImageCaptureResolvedSettings *v37;
  CMTime time;
  __int128 v39;
  _OWORD v40[2];

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 1, *(_QWORD *)(a1 + 56));
    v6 = objc_msgSend(*(id *)(a1 + 40), "isHDREnabled");
    v7 = objc_msgSend(*(id *)(a1 + 48), "isDepthDataDeliveryEnabled");
    v8 = objc_msgSend(*(id *)(a1 + 40), "isAdjustedPhotoFilterRenderingEnabled");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(*(id *)(a1 + 40), "isCaptureBeforeResolvingSettingsEnabled");
    else
      v9 = 0;
    v10 = v8 & v7;
    if ((unint64_t)(objc_msgSend(v5, "lowLightMode") - 1) > 1)
    {
      SRGB = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0.0;
    }
    else
    {
      memset(v40, 0, sizeof(v40));
      v39 = 0u;
      v11 = *(void **)(a1 + 40);
      if (v11)
        objc_msgSend(v11, "photoProcessingTimeRange");
      *(_OWORD *)&time.value = v39;
      time.epoch = *(_QWORD *)&v40[0];
      Seconds = CMTimeGetSeconds(&time);
      time = *(CMTime *)((char *)v40 + 8);
      v13 = CMTimeGetSeconds(&time) * 0.5;
      objc_msgSend(*(id *)(a1 + 40), "digitalFlashUserInterfaceRGBEstimate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v14, "count") < 3)
      {
        SRGB = 0;
      }
      else
      {
        v34 = v6;
        v15 = 1.0;
        if ((unint64_t)objc_msgSend(v14, "count") >= 4)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v15 = v17;

        }
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;
        objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        SRGB = CGColorCreateSRGB(v20, v23, v25, v15);

        v6 = v34;
      }
      v29 = Seconds + v13;
      v30 = objc_msgSend(*(id *)(a1 + 40), "digitalFlashUserInterfaceHints");
      v27 = v30 & 1;

      v28 = (v30 >> 1) & 1;
    }
    v31 = -[CAMStillImageCaptureResolvedSettings initWithHDREnabled:portraitEffectEnabled:lowLightCaptureTime:lowLightPreviewColorEstimate:lowLightCaptureHasInitialPreviewFeedbackSensitivity:lowLightCaptureHasConstantPreviewFeedbackSensitivity:captureBeforeResolvingSettingsEnabled:]([CAMStillImageCaptureResolvedSettings alloc], "initWithHDREnabled:portraitEffectEnabled:lowLightCaptureTime:lowLightPreviewColorEstimate:lowLightCaptureHasInitialPreviewFeedbackSensitivity:lowLightCaptureHasConstantPreviewFeedbackSensitivity:captureBeforeResolvingSettingsEnabled:", v6, v10, SRGB, v27, v28, v9, v29);
    if (SRGB)
      CGColorRelease(SRGB);
    v32 = *(void **)(a1 + 32);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke_2;
    v35[3] = &unk_1EA32E928;
    v36 = v5;
    v37 = v31;
    v33 = v31;
    objc_msgSend(v32, "_enumerateCaptureServicesUsingBlock:", v35);
    CAMSignpostWithIDAndArgs(38, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64), 0, 0, 0);

  }
}

void __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestDidStartCapturing:resolvedSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "uniqueID");
  CAMSignpostWithIDAndArgs(39, v6, v6, 0, 0, 0);
  CAMSignpostWithIDAndArgs(71, v6, v6, 0, 0, 0);
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = v6;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didCapturePhotoForResolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  pl_dispatch_async();

}

void __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 2, *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke_2;
    v7[3] = &unk_1EA32E6B8;
    v8 = v5;
    objc_msgSend(v6, "_enumerateCaptureServicesUsingBlock:", v7);
    CAMSignpostWithIDAndArgs(40, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 0, 0, 0);

  }
}

void __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestDidStopCapturingStillImage:", *(_QWORD *)(a1 + 32));

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "resolvedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "uniqueID");

  CAMSignpostWithIDAndArgs(41, v10, v10, 0, 0, 0);
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218242;
    v13 = v10;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishProcessingPhoto:error:, error=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[CAMCaptureEngine _handleCaptureOutputDidFinishCapturingPhoto:deferredPhotoProxy:error:](self, "_handleCaptureOutputDidFinishCapturingPhoto:deferredPhotoProxy:error:", v8, 0, v7);
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = objc_msgSend(v7, "uniqueID");
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishCaptureForResolvedSettings:, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[CAMCaptureEngine _didFinishStillImageCaptureForUniqueID:error:](self, "_didFinishStillImageCaptureForUniqueID:error:", objc_msgSend(v7, "uniqueID"), v8);
}

- (id)_coordinationInfoForRequest:(id)a3 photo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  CAMCaptureCoordinationInfo *v10;

  v5 = a4;
  objc_msgSend(v5, "resolvedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("captureID:%lld"), objc_msgSend(v6, "uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _expectedResultSpecifiersForResolvedPhotoSettings:](self, "_expectedResultSpecifiersForResolvedPhotoSettings:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "expectedPhotoProcessingFlags");

  v10 = -[CAMCaptureCoordinationInfo initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:]([CAMCaptureCoordinationInfo alloc], "initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:", v7, v8, (v9 >> 2) & 2 | (v9 >> 1) & 1);
  return v10;
}

- (id)_expectedResultSpecifiersForResolvedPhotoSettings:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "photoManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CAMCaptureEngine__expectedResultSpecifiersForResolvedPhotoSettings___block_invoke;
  v9[3] = &unk_1EA32BE58;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __70__CAMCaptureEngine__expectedResultSpecifiersForResolvedPhotoSettings___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v3 >> 2) & 2 | (v3 >> 1) & 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  void *v4;

  -[CAMCaptureEngine _showAccidentalLaunchNotificationIfNecessary](self, "_showAccidentalLaunchNotificationIfNecessary", a3);
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

uint64_t __57__CAMCaptureEngine__handleApplicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePanoramaSubgraphForEnteringBackground:", 1);
}

- (void)_sessionQueuePanoramaTeardown
{
  void *v3;
  CAMCaptureEngine *v4;
  void *v5;

  -[CAMCaptureEngine panoramaVideoDataOutput](self, "panoramaVideoDataOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSampleBufferDelegate:queue:", 0, 0);
  v4 = self;
  -[CAMCaptureEngine _panoramaSampleBufferQueue](v4, "_panoramaSampleBufferQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

- (id)panoramaVideoDataOutput
{
  CAMPanoramaOutput *panoramaVideoDataOutput;
  void *v4;
  CAMPanoramaOutput *v5;
  CAMPanoramaOutput *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  panoramaVideoDataOutput = self->_panoramaVideoDataOutput;
  if (!panoramaVideoDataOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = -[CAMPanoramaOutput initWithEngine:]([CAMPanoramaOutput alloc], "initWithEngine:", self);
    v6 = self->_panoramaVideoDataOutput;
    self->_panoramaVideoDataOutput = v5;

    v9 = *MEMORY[0x1E0CA9040];
    v10[0] = &unk_1EA3B1480;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureVideoDataOutput setVideoSettings:](self->_panoramaVideoDataOutput, "setVideoSettings:", v7);
    -[AVCaptureVideoDataOutput setAlwaysDiscardsLateVideoFrames:](self->_panoramaVideoDataOutput, "setAlwaysDiscardsLateVideoFrames:", 0);
    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);

    panoramaVideoDataOutput = self->_panoramaVideoDataOutput;
  }
  return panoramaVideoDataOutput;
}

- (OS_dispatch_queue)_panoramaSampleBufferQueue
{
  return self->__panoramaSampleBufferQueue;
}

void __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", 1);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_panoramaSubgraphQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke_2;
  v5[3] = &unk_1EA32C0D8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = &v6;
  dispatch_sync(v2, v5);

  objc_msgSend((id)v7[5], "invalidate");
  v3 = (void *)v7[5];
  v7[5] = 0;

  objc_msgSend(*(id *)(a1 + 32), "_notifyServicesOfPanoramaConfigurationChangeWithImageQueue:direction:", 0, 0);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_powerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAssertionForIdentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "_panoramaAssertionIdentifier"), 8);

  }
  _Block_object_dispose(&v6, 8);

}

- (OS_dispatch_queue)_panoramaSubgraphQueue
{
  return self->__panoramaSubgraphQueue;
}

- (CAMPanoramaProcessor)_panoramaProcessor
{
  return self->__panoramaProcessor;
}

void __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_setPanoramaProcessor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setPanoramaImageQueue:", 0);
  v5 = *(const void **)(a1 + 32);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, v5, (CFNotificationName)*MEMORY[0x1E0CF12F8], 0);
  v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, v5, (CFNotificationName)*MEMORY[0x1E0CF1310], 0);
  v8 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v8, v5, (CFNotificationName)*MEMORY[0x1E0CF1270], 0);
}

- (void)_setPanoramaProcessor:(id)a3
{
  objc_storeStrong((id *)&self->__panoramaProcessor, a3);
}

- (void)_setPanoramaImageQueue:(_CAImageQueue *)a3
{
  _CAImageQueue *panoramaImageQueue;

  panoramaImageQueue = self->__panoramaImageQueue;
  if (panoramaImageQueue)
    CFRelease(panoramaImageQueue);
  self->__panoramaImageQueue = a3;
  if (a3)
    CFRetain(a3);
}

- (void)_notifyServicesOfPanoramaConfigurationChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4
{
  _QWORD v7[5];
  _QWORD v8[6];

  if (a3)
    CFRetain(a3);
  v7[4] = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___CAMCaptureService__8l;
  v8[4] = a3;
  v8[5] = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke_2;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:completion:](self, "_enumerateCaptureServicesUsingBlock:completion:", v8, v7);
}

void __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "panoramaConfigurationDidChangeWithImageQueue:direction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (void)_handleSessionInterruption:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[10];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[5] = MEMORY[0x1E0C809B0];
  block[6] = 3221225472;
  block[7] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke;
  block[8] = &unk_1EA328868;
  block[9] = self;
  pl_dispatch_async();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C8A148]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  switch(v9)
  {
    case 1:
      v10 = CFSTR("VideoDeviceNotAvailableInBackground");
      break;
    case 2:
      v10 = CFSTR("AudioDeviceInUseByAnotherClient");
      break;
    case 3:
      v10 = CFSTR("VideoDeviceInUseByAnotherClient");
      break;
    case 4:
      v10 = CFSTR("VideoDeviceNotAvailableWithMultipleForegroundApps");
      break;
    case 5:
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A150]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VideoDeviceNotAvailableDueToSystemPressure(%@)"), v11);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v4;
    v13 = v18;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession was interrupted for %{public}@! (%{public}@)", buf, 0x20u);

  }
  -[CAMCaptureEngine _setInterrupted:](self, "_setInterrupted:", 1);
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_93;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v14, block);

  -[CAMCaptureEngine _cancelDelayedSessionNonstartRecovery](self, "_cancelDelayedSessionNonstartRecovery");
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_94;
  v15[3] = &__block_descriptor_40_e29_v16__0___CAMCaptureService__8l;
  v15[4] = v9;
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v15);

}

uint64_t __47__CAMCaptureEngine__handleSessionInterruption___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", 1);
}

- (void)_setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (void)_handleSessionDidStopRunning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[6];
  __int128 buf;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got AVCaptureSession did stop running notification", (uint8_t *)&buf, 0xCu);

  }
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", &__block_literal_global_74);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x2020000000;
  v11 = 0;
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke_2;
  v8[3] = &unk_1EA32C0D8;
  v8[4] = self;
  v8[5] = &buf;
  dispatch_sync(v7, v8);

  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24) && !-[CAMCaptureEngine isInterrupted](self, "isInterrupted"))
    -[CAMCaptureEngine _recoverFromSessionRuntimeError](self, "_recoverFromSessionRuntimeError");
  _Block_object_dispose(&buf, 8);

}

- (id)prewarmedAudioDeviceInput:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_15);
  if ((id)prewarmedAudioDeviceType != v5)
    goto LABEL_7;
  if (_prewarmAudioVideoDevices_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_18);
  if ((id)prewarmedAudioDevice == v6)
  {
    v7 = (id)prewarmedAudioDeviceInput;
    v9 = (void *)prewarmedAudioDeviceInput;
    prewarmedAudioDeviceInput = 0;

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

- (CAMCaptureEngine)initWithPowerController:(id)a3 captureController:(id)a4 options:(int64_t)a5
{
  id v9;
  id v10;
  CAMCaptureEngine *v11;
  CAMCaptureEngine *v12;
  uint64_t v13;
  AVCaptureSession *captureSession;
  AVCaptureSession *v15;
  AVCaptureSession *v16;
  void *v17;
  uint64_t v18;
  AVSpatialOverCaptureVideoPreviewLayer *overCaptureVideoPreviewLayer;
  uint64_t v20;
  AVCaptureVideoPreviewLayer *videoPreviewLayer;
  CAMMemoizationCache *v22;
  CAMMemoizationCache *captureEngineDeviceCache;
  void *v24;
  void *v25;
  void **p_captureSessionQueue;
  void *captureSessionQueue;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  uint64_t v31;
  CAMCaptureEngine *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *captureResultsQueue;
  CAMCaptureEngine *v36;
  NSObject *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *captureServicesQueue;
  NSObject *v40;
  CAMCaptureEngine *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *recoveryMutexQueue;
  NSObject *v44;
  dispatch_queue_t v45;
  OS_dispatch_queue *panoramaFirstImageQueueUpdateSemaphoreQueue;
  NSObject *v47;
  dispatch_queue_t v48;
  OS_dispatch_queue *effectsPreviewSampleBufferQueue;
  NSObject *v50;
  dispatch_queue_t v51;
  OS_dispatch_queue *panoramaSubgraphQueue;
  NSObject *v53;
  dispatch_queue_t v54;
  OS_dispatch_queue *panoramaSampleBufferQueue;
  NSObject *v56;
  dispatch_queue_t v57;
  OS_dispatch_queue *signpostMutexQueue;
  uint64_t v59;
  NSMutableSet *didEmitCaptureIntervalStartedSignpostsForUniqueID;
  CAMCaptureEngine *v61;
  void *v63;
  void *v64;
  id v65;
  id v66;
  _QWORD block[4];
  CAMCaptureEngine *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  CAMCaptureEngine *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t);
  void *v77;
  CAMCaptureEngine *v78;
  objc_super v79;

  v9 = a3;
  v10 = a4;
  v79.receiver = self;
  v79.super_class = (Class)CAMCaptureEngine;
  v11 = -[CAMCaptureEngine init](&v79, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->__captureController, v10);
    objc_storeStrong((id *)&v12->__powerController, a3);
    v12->__engineOptions = a5;
    -[CAMCaptureEngine prewarmedCaptureSession](v12, "prewarmedCaptureSession");
    v13 = objc_claimAutoreleasedReturnValue();
    captureSession = v12->__captureSession;
    v12->__captureSession = (AVCaptureSession *)v13;

    if (!v12->__captureSession)
    {
      v15 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E0C8B108]);
      v16 = v12->__captureSession;
      v12->__captureSession = v15;

    }
    AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v9;
    v64 = v17;
    if ((objc_msgSend(v17, "isSpatialOverCaptureSupported") & 1) != 0
      || objc_msgSend(v17, "isAspectRatioCropSupported"))
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3A0]), "initWithSession:", v12->__captureSession);
      overCaptureVideoPreviewLayer = v12->__overCaptureVideoPreviewLayer;
      v12->__overCaptureVideoPreviewLayer = (AVSpatialOverCaptureVideoPreviewLayer *)v18;

      objc_storeStrong((id *)&v12->__videoPreviewLayer, v12->__overCaptureVideoPreviewLayer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[AVSpatialOverCaptureVideoPreviewLayer setAutomaticallyDimsOverCaptureRegion:](v12->__overCaptureVideoPreviewLayer, "setAutomaticallyDimsOverCaptureRegion:", 0);
    }
    else
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B170]), "initWithSession:", v12->__captureSession);
      videoPreviewLayer = v12->__videoPreviewLayer;
      v12->__videoPreviewLayer = (AVCaptureVideoPreviewLayer *)v20;

    }
    v65 = v10;
    v22 = -[CAMMemoizationCache initWithMemoizesNil:]([CAMMemoizationCache alloc], "initWithMemoizesNil:", 0);
    captureEngineDeviceCache = v12->__captureEngineDeviceCache;
    v12->__captureEngineDeviceCache = v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionDidStartRunning_, *MEMORY[0x1E0C8A128], v12->__captureSession);
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionDidStopRunning_, *MEMORY[0x1E0C8A130], v12->__captureSession);
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionRuntimeError_, *MEMORY[0x1E0C8A1B8], v12->__captureSession);
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionInterruption_, *MEMORY[0x1E0C8A1C8], v12->__captureSession);
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionInterruptionEnded_, *MEMORY[0x1E0C8A140], v12->__captureSession);
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__handleSessionWasPrewarmed_, CFSTR("AVCaptureSessionWasPrewarmedNotification"), v12->__captureSession);
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    v63 = v25;
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    p_captureSessionQueue = (void **)&v12->__captureSessionQueue;
    objc_storeStrong((id *)&v12->__captureSessionQueue, (id)prewarmedCaptureSessionQueue);
    captureSessionQueue = v12->__captureSessionQueue;
    if (!captureSessionQueue)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = dispatch_queue_create("com.apple.camera.capture-engine.session-queue", v28);
      v30 = *p_captureSessionQueue;
      *p_captureSessionQueue = v29;

      captureSessionQueue = *p_captureSessionQueue;
    }
    -[AVCaptureSession setControlsDelegate:queue:](v12->__captureSession, "setControlsDelegate:queue:", v12, captureSessionQueue);
    v31 = MEMORY[0x1E0C809B0];
    v74 = MEMORY[0x1E0C809B0];
    v75 = 3221225472;
    v76 = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke;
    v77 = &unk_1EA328868;
    v32 = v12;
    v78 = v32;
    pl_dispatch_async();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create("com.apple.camera.capture-engine.results-queue", v33);
    captureResultsQueue = v32->__captureResultsQueue;
    v32->__captureResultsQueue = (OS_dispatch_queue *)v34;

    v69 = v31;
    v70 = 3221225472;
    v71 = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_2;
    v72 = &unk_1EA328868;
    v36 = v32;
    v73 = v36;
    pl_dispatch_async();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_queue_create("com.apple.camera.capture-engine.services-queue", v37);
    captureServicesQueue = v36->__captureServicesQueue;
    v36->__captureServicesQueue = (OS_dispatch_queue *)v38;

    v40 = v36->__captureServicesQueue;
    block[0] = v31;
    block[1] = 3221225472;
    block[2] = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_3;
    block[3] = &unk_1EA328868;
    v41 = v36;
    v68 = v41;
    dispatch_sync(v40, block);
    v42 = dispatch_queue_create("com.apple.camera.capture-engine.recovery-queue", 0);
    recoveryMutexQueue = v41->__recoveryMutexQueue;
    v41->__recoveryMutexQueue = (OS_dispatch_queue *)v42;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-first-image-semaphore-queue", v44);
    panoramaFirstImageQueueUpdateSemaphoreQueue = v41->__panoramaFirstImageQueueUpdateSemaphoreQueue;
    v41->__panoramaFirstImageQueueUpdateSemaphoreQueue = (OS_dispatch_queue *)v45;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = dispatch_queue_create("com.apple.camera.capture-engine.effects-sample-buffer-queue", v47);
    effectsPreviewSampleBufferQueue = v41->__effectsPreviewSampleBufferQueue;
    v41->__effectsPreviewSampleBufferQueue = (OS_dispatch_queue *)v48;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-subgraph-queue", v50);
    panoramaSubgraphQueue = v41->__panoramaSubgraphQueue;
    v41->__panoramaSubgraphQueue = (OS_dispatch_queue *)v51;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-sample-buffer-queue", v53);
    panoramaSampleBufferQueue = v41->__panoramaSampleBufferQueue;
    v41->__panoramaSampleBufferQueue = (OS_dispatch_queue *)v54;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = dispatch_queue_create("com.apple.camera.capture-engine.signpost-mutex-queue", v56);
    signpostMutexQueue = v41->__signpostMutexQueue;
    v41->__signpostMutexQueue = (OS_dispatch_queue *)v57;

    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 8);
    didEmitCaptureIntervalStartedSignpostsForUniqueID = v41->__didEmitCaptureIntervalStartedSignpostsForUniqueID;
    v41->__didEmitCaptureIntervalStartedSignpostsForUniqueID = (NSMutableSet *)v59;

    v61 = v41;
    v10 = v65;
    v9 = v66;
  }

  return v12;
}

void __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

void __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 240);
  *(_QWORD *)(v3 + 240) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 264);
  *(_QWORD *)(v9 + 264) = v8;

}

void __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 296);
  *(_QWORD *)(v3 + 296) = v2;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CAMCaptureEngine;
  -[CAMCaptureEngine dealloc](&v5, sel_dealloc);
}

- (void)startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v8 = a5;
  v9 = a6;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v11 = v9;
  v12 = v8;
  pl_dispatch_async();

}

uint64_t __75__CAMCaptureEngine_startWithRetryCount_retryInterval_logReason_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_startWithRetryCount:retryInterval:logReason:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
}

- (void)_sessionQueue_startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  double Current;
  double v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t i;
  NSObject *v25;
  NSObject *v26;
  double v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  _WORD v32[17];

  *(_QWORD *)&v32[13] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAMCaptureEngine start (id=%ld: \"%@\")"), ++_sessionQueue_startWithRetryCount_retryInterval_logReason_completion__uniqueID, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isRunning");
  v16 = os_log_create("com.apple.camera", "Camera");
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    v28 = v10;
    if (v17)
    {
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Session is not running. Calling -[AVCaptureSession startRunning].", buf, 0xCu);
    }

    -[CAMCaptureEngine _scheduleDelayedSessionNonstartRecovery](self, "_scheduleDelayedSessionNonstartRecovery");
    Current = CFAbsoluteTimeGetCurrent();
    if (a3 == -1)
    {
LABEL_7:
      v19 = CFAbsoluteTimeGetCurrent();
      v16 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:
        v10 = v28;
        goto LABEL_21;
      }
      v20 = objc_msgSend(v13, "isInterrupted");
      *(_DWORD *)buf = 138543874;
      v30 = v14;
      v31 = 1024;
      *(_DWORD *)v32 = v20;
      v32[2] = 2048;
      *(double *)&v32[3] = v19 - Current;
      v21 = "%{public}@: Failed to start capture session. isInterrupted=%d (took %.3f seconds)";
      v22 = v16;
      v23 = 28;
    }
    else
    {
      for (i = 0; ; ++i)
      {
        CAMSignpostWithIDAndArgs(4, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        CAMSignpostWithIDAndArgs(15, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        objc_msgSend(v13, "startRunning");
        CAMSignpostWithIDAndArgs(16, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        if (objc_msgSend(v13, "isRunning"))
          break;
        if (a3 == i)
          goto LABEL_7;
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v14;
          v31 = 2048;
          *(double *)v32 = a4;
          _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -[AVCaptureSession startRunning] failed. Waiting %.3f seconds for retry.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", a4);
        v26 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v14;
          v31 = 2048;
          *(_QWORD *)v32 = i + 2;
          _os_log_impl(&dword_1DB760000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession startRunning] for attempt #%ld", buf, 0x16u);
        }

      }
      v27 = CFAbsoluteTimeGetCurrent();
      v16 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2048;
      *(double *)v32 = v27 - Current;
      v21 = "%{public}@: -[AVCaptureSession startRunning] succeeded (took %.3f seconds)";
      v22 = v16;
      v23 = 22;
    }
    _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_20;
  }
  if (v17)
  {
    *(_DWORD *)buf = 138543362;
    v30 = v14;
    _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Session is already running. Skipping call to -[AVCaptureSession startRunning].", buf, 0xCu);
  }
LABEL_21:

  if (v11)
    v11[2](v11);

}

- (void)stopWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCaptureEngine _cancelDelayedSessionNonstartRecovery](self, "_cancelDelayedSessionNonstartRecovery");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CAMCaptureEngine_stopWithCompletion___block_invoke;
  block[3] = &unk_1EA32C0D8;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v13 + 24))
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      v8 = v7;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing performing recovery flag due to calling stopWithCompletion: ", buf, 0xCu);

    }
    -[CAMCaptureEngine _resetPerformingRecoveryState](self, "_resetPerformingRecoveryState");
  }
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  pl_dispatch_async();

  _Block_object_dispose(&v12, 8);
}

uint64_t __39__CAMCaptureEngine_stopWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __39__CAMCaptureEngine_stopWithCompletion___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Servicing an explicit request to stop the session using -[AVCaptureSession stopRunning] regardless of whether it is running or not", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cancelDelayedSessionNonstartRecovery");
  CAMSignpostWithIDAndArgs(8, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  CAMSignpostWithIDAndArgs(17, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(v3, "stopRunning");
  CAMSignpostWithIDAndArgs(18, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)cancelAutoResumeAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  pl_dispatch_async();

}

void __46__CAMCaptureEngine_cancelAutoResumeAfterDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_captureSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelForegroundAutoResumeAfterDate:", *(_QWORD *)(a1 + 40));

}

uint64_t __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setResultsQueueLastCompletedVideoURL:", 0);
}

void __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleSessionDidStartRunning");

}

void __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleSessionDidStopRunning");

}

uint64_t __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_handleSessionRuntimeError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C8A138]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__CAMCaptureEngine__handleSessionRuntimeError___block_invoke;
  v18[3] = &unk_1EA32C0D8;
  v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(v7, v18);

  if (*((_BYTE *)v20 + 24))
    v8 = CFSTR("during recovery ");
  else
    v8 = &stru_1EA3325A0;
  v9 = v8;
  v10 = os_log_create("com.apple.camera", "Camera");
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v12;
      v25 = 2114;
      v26 = v9;
      v27 = 2114;
      v28 = v6;
      v13 = v12;
      _os_log_error_impl(&dword_1DB760000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Received a session runtime error notification %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v24 = v14;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v4;
    v15 = v14;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a session runtime error notification %{public}@without an explicit error: %{public}@", buf, 0x20u);

  }
  if (*((_BYTE *)v20 + 24))
  {
    v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_opt_class();
      -[CAMCaptureEngine _handleSessionRuntimeError:].cold.1(v17, (uint64_t)v6, (uint64_t)buf);
    }

  }
  else
  {
    -[CAMCaptureEngine _performSessionRuntimeRecovery:](self, "_performSessionRuntimeRecovery:", v6);
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__CAMCaptureEngine__handleSessionRuntimeError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__CAMCaptureEngine__performSessionNonstartRecoveryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPerformingRecovery:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "_setNumberOfRecoveryAttempts:", 0);
  }
  return result;
}

- (void)_performSessionRuntimeRecovery:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD block[5];

  v4 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CAMCaptureEngine _performSessionRuntimeRecovery:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v6, block);

  v9 = v7;
  v10 = 3221225472;
  v11 = __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke_2;
  v12 = &unk_1EA32E6B8;
  v13 = v4;
  v8 = v4;
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", &v9);
  -[CAMCaptureEngine _recoverFromSessionRuntimeError](self, "_recoverFromSessionRuntimeError", v9, v10, v11, v12);

}

uint64_t __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPerformingRecovery:", 1);
}

void __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "willPerformRecoveryFromRuntimeError:", *(_QWORD *)(a1 + 32));

}

uint64_t __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_93(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  if ((_DWORD)result)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = (id)objc_opt_class();
      v4 = v6;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing performing recovery flag due to interruptions ", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setPerformingRecovery:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_setNumberOfRecoveryAttempts:", 0);
  }
  return result;
}

void __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "handleSessionInterruptionForReason:", *(_QWORD *)(a1 + 32));

}

- (void)_handleSessionInterruptionEnded:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession interruption ended!", (uint8_t *)&v6, 0xCu);

  }
  -[CAMCaptureEngine _setInterrupted:](self, "_setInterrupted:", 0);
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", &__block_literal_global_98);
}

void __52__CAMCaptureEngine__handleSessionInterruptionEnded___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleSessionInterruptionEnded");

}

- (double)_delayForRecoveryAttempt:(unint64_t)a3
{
  unint64_t v3;

  v3 = 4;
  if (a3 < 4)
    v3 = a3;
  return _delayForRecoveryAttempt__delayForAttempt[v3];
}

- (void)_recoverFromSessionRuntimeError
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  v4 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, v5, "[%{public}@] Attempting to recover from a session runtime error by restarting the AVCaptureSession...", v6);

  OUTLINED_FUNCTION_1();
}

- (void)_resetPerformingRecoveryState
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CAMCaptureEngine__resetPerformingRecoveryState__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __49__CAMCaptureEngine__resetPerformingRecoveryState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPerformingRecovery:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setNumberOfRecoveryAttempts:", 0);
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[40];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke;
  block[3] = &unk_1EA32C0D8;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v23 + 24))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    -[CAMCaptureEngine _recoveryMutexQueue](self, "_recoveryMutexQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2;
    v16[3] = &unk_1EA32C0D8;
    v16[4] = self;
    v16[5] = &v17;
    dispatch_sync(v7, v16);

    v8 = v18[3];
    if (v8 == 5)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class();
        -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:].cold.1();
      }
    }
    else
    {
      if (v8 < 6)
      {
        if (v3)
        {
          -[CAMCaptureEngine _delayForRecoveryAttempt:](self, "_delayForRecoveryAttempt:");
          v11 = v10;
          v12 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = (void *)objc_opt_class();
            -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:].cold.3(v13, (uint64_t)v26, v11);
          }

          dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
          -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          pl_dispatch_after();

        }
        else
        {
          -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          pl_dispatch_async();

        }
        goto LABEL_15;
      }
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class();
        -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:].cold.2();
      }
    }

LABEL_15:
    _Block_object_dispose(&v17, 8);
  }
  _Block_object_dispose(&v22, 8);
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPerformingRecovery");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_numberOfRecoveryAttempts")+ 1;
  return objc_msgSend(*(id *)(a1 + 32), "_setNumberOfRecoveryAttempts:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_103(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverFromSessionRuntimeError");
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2_104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverFromSessionRuntimeError");
}

- (void)_validateSessionRecovery
{
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRunning"))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession is successfully running after error recovery!", (uint8_t *)&v6, 0xCu);

    }
    -[CAMCaptureEngine _resetPerformingRecoveryState](self, "_resetPerformingRecoveryState");
  }
  else
  {
    -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:](self, "_handleFailedSessionRecoveryAttemptAfterDelay:", 1);
  }

}

uint64_t __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateSessionRecovery");
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  void *v3;

  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

uint64_t __58__CAMCaptureEngine__handleApplicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePanoramaSubgraphForEnteringBackground:", 0);
}

- (void)_handleSessionWasPrewarmed:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A0A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.camera", "Camera");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Session was prewarmed for %@", (uint8_t *)&v12, 0xCu);
    }

    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8A068]))
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleAccidentalLaunchTimerFired_, 0, 0, 3.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCaptureEngine _setAccidentalLaunchTimer:](self, "_setAccidentalLaunchTimer:", v8);

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCaptureEngine _accidentalLaunchTimer](self, "_accidentalLaunchTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTimer:forMode:", v10, *MEMORY[0x1E0C99860]);

    }
    -[CAMCaptureEngine _accidentalLaunchTimer](self, "_accidentalLaunchTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[CAMCaptureEngine _setAccidentalLaunchPrewarmReason:](self, "_setAccidentalLaunchPrewarmReason:", v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine _handleSessionWasPrewarmed:].cold.1();

  }
}

- (void)_destroyAccidentalLaunchTimer
{
  void *v3;

  -[CAMCaptureEngine _accidentalLaunchTimer](self, "_accidentalLaunchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CAMCaptureEngine _setAccidentalLaunchTimer:](self, "_setAccidentalLaunchTimer:", 0);
  -[CAMCaptureEngine _setAccidentalLaunchPrewarmReason:](self, "_setAccidentalLaunchPrewarmReason:", 0);
}

- (void)_showAccidentalLaunchNotificationIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Showing an accidental launch TapToRadar alert, prewarmReason: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke_cold_1(a1, v3);

  }
}

- (id)_videoDeviceInputFromSession:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  objc_msgSend(v3, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CAMCaptureEngine__videoDeviceInputFromSession___block_invoke;
  v7[3] = &unk_1EA32E748;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __49__CAMCaptureEngine__videoDeviceInputFromSession___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v11;
    objc_msgSend(v9, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasMediaType:", *MEMORY[0x1E0C8A808]))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v11;
  }

}

- (id)_photoOutputFromSession:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CAMCaptureEngine__photoOutputFromSession___block_invoke;
  v7[3] = &unk_1EA32E770;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__CAMCaptureEngine__photoOutputFromSession___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __35__CAMCaptureEngine__updateContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v6 = v3;
  if ((id)v4[3] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentStillImageOutput:", v3);
    goto LABEL_13;
  }
  v5 = v3;
  if ((id)v4[4] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentMovieFileOutput:", v3);
    goto LABEL_13;
  }
  if ((id)v4[5] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentPanoramaOutput:", v3);
    goto LABEL_13;
  }
  if ((id)v4[6] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentMetadataOutput:", v3);
    goto LABEL_13;
  }
  if ((id)v4[7] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentEffectsPreviewOutput:", v3);
    goto LABEL_13;
  }
  if ((id)v4[8] == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentVideoThumbnailOutput:", v3);
LABEL_13:
    v5 = v6;
  }

}

void __35__CAMCaptureEngine__updateContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setSystemZoomSlider:", v3);
    goto LABEL_11;
  }
  if (*(id *)(a1 + 48) == v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setSystemLensSelector:", v3);
    goto LABEL_11;
  }
  if (*(id *)(a1 + 56) == v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setSystemExposureBiasSlider:", v3);
    goto LABEL_11;
  }
  v5 = *(_QWORD *)(a1 + 64);
  if (*(id *)(v5 + 72) == v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setApertureSlider:", v3);
    goto LABEL_11;
  }
  if (*(id *)(v5 + 88) == v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setEmulatedZoomSlider:", v3);
LABEL_11:
    v4 = v6;
  }

}

- (BOOL)_isSessionModificationRequiredByCommand:(id)a3 logReason:(id *)a4 minimumExecutionTime:(double *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v14;
  _QWORD v15[8];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v29 = objc_msgSend(v8, "requiresSessionModification");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__24;
  v24 = __Block_byref_object_dispose__24;
  v25 = 0;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(v8, "sessionModificationLogReason");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v21[5];
    v21[5] = v9;

    objc_msgSend(v8, "sessionModificationMinimumExecutionTime");
    *((_QWORD *)v17 + 3) = v11;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v8, "subcommands");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__CAMCaptureEngine__isSessionModificationRequiredByCommand_logReason_minimumExecutionTime___block_invoke;
  v15[3] = &unk_1EA32E810;
  v15[4] = self;
  v15[5] = &v26;
  v15[6] = &v20;
  v15[7] = &v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease((id)v21[5]);
LABEL_4:
  if (a5)
    *a5 = v17[3];
  v12 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

void __91__CAMCaptureEngine__isSessionModificationRequiredByCommand_logReason_minimumExecutionTime___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id *v8;
  char v9;
  id obj;

  v6 = (void *)a1[4];
  v7 = a1[7];
  v8 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  v9 = objc_msgSend(v6, "_isSessionModificationRequiredByCommand:logReason:minimumExecutionTime:", a2, &obj, *(_QWORD *)(v7 + 8) + 24);
  objc_storeStrong(v8, obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
}

- (void)_beginSessionConfigurationIfRequiredByCommand:(id)a3 withContext:(id)a4 logReason:(id *)a5 minimumExecutionTime:(double *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  double Current;
  double v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v20 = 0;
  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if ((objc_msgSend(v12, "isBeingConfigured") & 1) == 0)
  {
    v19 = 0;
    v14 = -[CAMCaptureEngine _isSessionModificationRequiredByCommand:logReason:minimumExecutionTime:](self, "_isSessionModificationRequiredByCommand:logReason:minimumExecutionTime:", v10, &v19, &v20);
    v13 = v19;
    if (v14)
    {
      objc_msgSend(v11, "setCurrentCaptureSession:", v12);
      v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession beginConfiguration]", buf, 0xCu);
      }

      Current = CFAbsoluteTimeGetCurrent();
      CAMSignpostWithIDAndArgs(19, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      objc_msgSend(v12, "beginConfiguration");
      CAMSignpostWithIDAndArgs(20, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      v17 = CFAbsoluteTimeGetCurrent();
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        v23 = 2048;
        v24 = v17 - Current;
        _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished -[AVCaptureSession beginConfiguration] (took %.3f seconds)", buf, 0x16u);
      }

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);
  if (a6)
    *(_QWORD *)a6 = v20;

}

- (void)_commitSessionConfigurationIfNecessaryWithLogReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  double Current;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  _BOOL4 v13;
  int v14;
  char v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isBeingConfigured"))
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession commitConfiguration]", buf, 0xCu);
    }

    Current = CFAbsoluteTimeGetCurrent();
    CAMSignpostWithIDAndArgs(21, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    objc_msgSend(v5, "commitConfiguration");
    CAMSignpostWithIDAndArgs(22, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v8 = CFAbsoluteTimeGetCurrent();
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = (uint64_t)v4;
      v28 = 2048;
      v29 = v8 - Current;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished -[AVCaptureSession commitConfiguration] (took %.3f seconds)", buf, 0x16u);
    }

    -[CAMCaptureEngine _updateCurrentlyConfiguredObjects](self, "_updateCurrentlyConfiguredObjects");
    v10 = -[CAMCaptureEngine _updatePanoramaSubgraphForEnteringBackground:](self, "_updatePanoramaSubgraphForEnteringBackground:", 0);
    -[CAMCaptureEngine _updateEffectsSubgraph](self, "_updateEffectsSubgraph");
    -[CAMCaptureEngine _updateVideoThumbnailSubgraph](self, "_updateVideoThumbnailSubgraph");
    v11 = objc_msgSend(v5, "isRunning");
    v12 = objc_msgSend(v5, "isInterrupted");
    v13 = -[CAMCaptureEngine _shouldStartSessionOnConfigurationChanges](self, "_shouldStartSessionOnConfigurationChanges");
    if ((v11 & ~v12 & 1) == 0 && v13)
      -[CAMCaptureEngine _sessionQueue_startWithRetryCount:retryInterval:logReason:completion:](self, "_sessionQueue_startWithRetryCount:retryInterval:logReason:completion:", 0, CFSTR("post commitConfiguration"), 0, 0.0);
    v14 = objc_msgSend(v5, "isRunning");
    v15 = objc_msgSend(v5, "isInterrupted");
    if (v10 && (v15 & 1) == 0 && v14)
    {
      v16 = dispatch_semaphore_create(0);
      -[CAMCaptureEngine _panoramaFirstImageQueueUpdateSemaphoreQueue](self, "_panoramaFirstImageQueueUpdateSemaphoreQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke;
      block[3] = &unk_1EA328A40;
      block[4] = self;
      v19 = v16;
      v25 = v19;
      dispatch_sync(v17, block);

      v20 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v19, v20))
      {
        v21 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v27 = 0x4010000000000000;
          _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Failed to update panorama image queue in %f seconds. Continuing configuration", buf, 0xCu);
        }

      }
      -[CAMCaptureEngine _panoramaFirstImageQueueUpdateSemaphoreQueue](self, "_panoramaFirstImageQueueUpdateSemaphoreQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke_133;
      v23[3] = &unk_1EA328868;
      v23[4] = self;
      dispatch_sync(v22, v23);

    }
  }

}

uint64_t __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPanoramaFirstImageQueueUpdateSemaphore:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPanoramaFirstImageQueueUpdateSemaphore:", 0);
}

- (void)_updateCurrentlyConfiguredObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _videoDeviceInputFromSession:](self, "_videoDeviceInputFromSession:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _photoOutputFromSession:](self, "_photoOutputFromSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCaptureEngine currentCameraDevice](self, "currentCameraDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v4)
    -[CAMCaptureEngine setCurrentCameraDevice:](self, "setCurrentCameraDevice:", v4);
  -[CAMCaptureEngine currentStillImageOutput](self, "currentStillImageOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    -[CAMCaptureEngine setCurrentStillImageOutput:](self, "setCurrentStillImageOutput:", v6);

}

void __35__CAMCaptureEngine_enqueueCommand___block_invoke_136(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("CAMCaptureEngineExecutedCommandWithContextNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)enqueueCommands:(id)a3
{
  id v4;
  CAMCaptureCommand *v5;

  v4 = a3;
  v5 = -[CAMCaptureCommand initWithSubcommands:]([CAMCaptureCommand alloc], "initWithSubcommands:", v4);

  -[CAMCaptureEngine enqueueCommand:](self, "enqueueCommand:", v5);
}

- (void)unregisterCaptureService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMCaptureEngine _captureServicesQueue](self, "_captureServicesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CAMCaptureEngine_unregisterCaptureService___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __45__CAMCaptureEngine_unregisterCaptureService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_servicesQueueCaptureServices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)overCaptureVideoPreviewLayer
{
  return self->__overCaptureVideoPreviewLayer;
}

uint64_t __66__CAMCaptureEngine_registerStillImageCaptureRequest_withSettings___block_invoke(uint64_t a1)
{
  CAMCaptureRequestInfo *v2;
  void *v3;
  void *v4;

  v2 = -[CAMCaptureRequestInfo initWithRequest:]([CAMCaptureRequestInfo alloc], "initWithRequest:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "_checkCallbacksForUniqueID:afterDelay:startTime:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"), 5.0, CFAbsoluteTimeGetCurrent());
}

- (void)_checkCallbacksForUniqueID:(int64_t)a3 afterDelay:(double)a4 startTime:(double)a5
{
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[8];

  v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CAMCaptureEngine__checkCallbacksForUniqueID_afterDelay_startTime___block_invoke;
  v11[3] = &unk_1EA32E1F0;
  v11[4] = self;
  v11[5] = a3;
  *(double *)&v11[6] = a5;
  *(double *)&v11[7] = a4;
  dispatch_after(v9, v10, v11);

}

void __68__CAMCaptureEngine__checkCallbacksForUniqueID_afterDelay_startTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("captureID:%lld Have not received final callback in %f seconds. "), *(_QWORD *)(a1 + 40), CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resultsQueue_logReceivedCallbacksForID:withIntroString:", *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(*(id *)(a1 + 32), "_checkCallbacksForUniqueID:afterDelay:startTime:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56) + 5.0, *(double *)(a1 + 48));

  }
}

- (void)_resultsQueue_logReceivedCallbacksForID:(int64_t)a3 withIntroString:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[CAMCaptureEngine _resultsQueueRegisteredStillImageRequests](self, "_resultsQueueRegisteredStillImageRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callbackReceipts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", CFSTR("Callbacks received:\n"));
  if (objc_msgSend(v12, "count"))
  {
    v27 = v10;
    v28 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v12;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v17 = 0.0;
      do
      {
        v18 = 0;
        v19 = v17;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v18);
          v21 = objc_msgSend(v20, "callback");
          if (v21 > 0xC)
            v22 = 0;
          else
            v22 = off_1EA32ECE8[v21];
          objc_msgSend(v20, "secondsSinceBegin");
          v17 = v23;
          objc_msgSend(v11, "appendFormat:", CFSTR("\t%.3fs"), *(_QWORD *)&v23);
          if (v19 == 0.0)
            objc_msgSend(v11, "appendFormat:", CFSTR("\t\t\t"), v25);
          else
            objc_msgSend(v11, "appendFormat:", CFSTR("\t(%.3fs)"), v17 - v19);
          objc_msgSend(v11, "appendFormat:", CFSTR("\t%@\n"), v22);
          ++v18;
          v19 = v17;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    v10 = v27;
    v6 = v28;
    v12 = v26;
  }
  else
  {
    objc_msgSend(v11, "appendString:", CFSTR("None"));
    v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

}

- (void)currentInflightCapturesStringWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  pl_dispatch_async();

}

void __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRequestsBeingRecorded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = objc_msgSend(v2, "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1EA32BE58;
    v9 = v3;
    v15 = v9;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v14);
    v3 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("None"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v5, "count"))
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1EA32E900;
    v10 = v6;
    v13 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
    v6 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("None"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@, "), v3);

}

uint64_t __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@, "), a2);
}

- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    -[CAMCaptureEngine _sessionQueueCachedPhotoInitiationSettings](self, "_sessionQueueCachedPhotoInitiationSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v7);
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine cacheMomentCaptureSettings:forIdentifier:].cold.1();
  }

}

- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[CAMCaptureEngine _sessionQueueCachedPhotoInitiationSettings](self, "_sessionQueueCachedPhotoInitiationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine cachedMomentCaptureSettingsForIdentifier:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[CAMCaptureEngine _captureSessionQueue](self, "_captureSessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[CAMCaptureEngine _sessionQueueCachedPhotoInitiationSettings](self, "_sessionQueueCachedPhotoInitiationSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, v4);
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine clearCachedMomentCaptureSettingsForIdentifier:].cold.1();
  }

}

- (void)captureOutput:(id)a3 willBeginCaptureBeforeResolvingSettingsForUniqueID:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  _QWORD block[6];

  CAMSignpostWithIDAndArgs(76, a4, a4, 0, 0, 0);
  CAMSignpostWithIDAndArgs(70, a4, a4, 0, 0, 0);
  CAMSignpostWithIDAndArgs(72, a4, a4, 0, 0, 0);
  mach_absolute_time();
  -[CAMCaptureEngine _signpostMutexQueue](self, "_signpostMutexQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke;
  block[3] = &unk_1EA328B18;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(v6, block);

  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_didEmitCaptureIntervalStartedSignpostsForUniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v2);

}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 11, *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_3;
  v8[3] = &unk_1EA32E6B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_enumerateCaptureServicesUsingBlock:", v8);
  CAMSignpostWithIDAndArgs(77, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0, 0, 0);

}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestDidBeginCaptureBeforeResolvingSettings:", *(_QWORD *)(a1 + 32));

}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_didEmitCaptureIntervalStartedSignpostsForUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didEmitCaptureIntervalStartedSignpostsForUniqueID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_162(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 0, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_2;
  v8[3] = &unk_1EA32E6B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_enumerateCaptureServicesUsingBlock:", v8);
  CAMSignpostWithIDAndArgs(36, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 0, 0, 0);

}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestWillStartCapturingVideo:", *(_QWORD *)(a1 + 32));

}

- (void)captureOutput:(id)a3 readyForResponsiveRequestAfterResolvedSettings:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "uniqueID", a3);
  CAMSignpostWithIDAndArgs(99, v5, v5, 0, 0, 0);
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:readyForResponsiveRequestAfterResolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

void __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 12, *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke_2;
    v7[3] = &unk_1EA32E6B8;
    v8 = v5;
    objc_msgSend(v6, "_enumerateCaptureServicesUsingBlock:", v7);
    CAMSignpostWithIDAndArgs(100, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0, 0, 0);

  }
}

void __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestDidUnblockResponsiveCapture:", *(_QWORD *)(a1 + 32));

}

- (void)captureOutput:(id)a3 didFinishCapturingDeferredPhotoProxy:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "resolvedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "uniqueID");

  CAMSignpostWithIDAndArgs(61, v10, v10, 0, 0, 0);
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218242;
    v13 = v10;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishCapturingDeferredPhotoProxy:error:, error=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[CAMCaptureEngine _handleCaptureOutputDidFinishCapturingPhoto:deferredPhotoProxy:error:](self, "_handleCaptureOutputDidFinishCapturingPhoto:deferredPhotoProxy:error:", 0, v8, v7);
}

- (void)_handleCaptureOutputDidFinishCapturingPhoto:(id)a3 deferredPhotoProxy:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CAMCaptureEngine *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v26 = self;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
    v10 = v7;
  else
    v10 = v8;
  v11 = v10;
  objc_msgSend(v11, "resolvedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v12, "photoManifest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "intValue", v26);
        if (v18 > objc_msgSend(v11, "expectedPhotoProcessingFlags"))
        {

          goto LABEL_14;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v15)
        continue;
      break;
    }
  }

  v19 = objc_msgSend(v12, "uniqueID");
  CAMSignpostWithIDAndArgs(73, v19, v19, 0, 0, 0);
  CAMSignpostWithIDAndArgs(74, v19, v19, 0, 0, 0);
LABEL_14:
  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](v26, "_captureResultsQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  v28 = v9;
  v30 = v8;
  v29 = v7;
  v21 = v8;
  v22 = v7;
  v23 = v9;
  v24 = v11;
  v25 = v12;
  pl_dispatch_async();

}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  BOOL v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "uniqueID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_resultsQueueRegisteredStillImageRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "uniqueID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_coordinationInfoForRequest:photo:", v6, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustmentFilters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    v36 = v2;
    if (v7 && (objc_msgSend(v7, "isEV0ForHDREV0Pair") & 1) != 0)
    {
      objc_msgSend(v6, "EV0PersistenceUUID");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "persistenceUUID");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    v12 = objc_msgSend(v7, "isUnfilteredImageForFilteredPair");
    v13 = 0;
    v55 = 0uLL;
    if (*(_QWORD *)(a1 + 56))
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      if ((v12 & 1) == 0)
      {
        v16 = *(void **)(a1 + 40);
        if (v16)
        {
          objc_msgSend(v16, "_previewFilterSetForRequest:photo:", v6, *(_QWORD *)(a1 + 48));
          v14 = *((_QWORD *)&v52 + 1);
          v15 = v52;
          v13 = v54;
        }
        else
        {
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v54 = 0;
          v52 = 0u;
          v53 = 0u;
        }
        v55 = v53;
      }
    }
    if (*(_QWORD *)(a1 + 64))
      v17 = 3;
    else
      v17 = 4;
    objc_msgSend(v5, "didReceiveCallback:atAbsoluteTime:", v17, *(_QWORD *)(a1 + 80));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_2;
    aBlock[3] = &unk_1EA32E978;
    v38 = *(id *)(a1 + 64);
    v39 = *(id *)(a1 + 32);
    v18 = v8;
    v40 = v18;
    v51 = v9;
    v19 = v11;
    v41 = v19;
    v20 = v7;
    v42 = v20;
    v47 = v15;
    v48 = v14;
    v49 = v55;
    v50 = v13;
    v43 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 72);
    v22 = *(_QWORD *)(a1 + 40);
    v44 = v21;
    v45 = v22;
    v46 = v6;
    v23 = _Block_copy(aBlock);
    v24 = v23;
    v25 = v15 != 0;
    if (v14)
      ++v25;
    if ((unint64_t)(v13 - 1) >= 0xFFFFFFFFFFFFFFFELL)
      v26 = 0;
    else
      v26 = -1;
    if (v25 == v26)
    {
      (*((void (**)(void *, _QWORD))v23 + 2))(v23, 0);
      v2 = v36;
    }
    else
    {
      v35 = v20;
      v27 = v18;
      v28 = *(void **)(a1 + 40);
      v34 = v5;
      v29 = v19;
      v30 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "previewPixelBuffer");
      objc_msgSend(*(id *)(a1 + 48), "metadata");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v52 = v15;
      *((_QWORD *)&v52 + 1) = v14;
      v53 = v55;
      v54 = v13;
      v32 = v28;
      v18 = v27;
      v33 = v30;
      v19 = v29;
      v5 = v34;
      v20 = v35;
      v2 = v36;
      objc_msgSend(v32, "_resultsQueue_performPostprocessingForPreviewBuffer:metadata:filters:stillImageCaptureRequestKey:completionHandler:", v33, v31, &v52, v36, v24);

    }
  }

}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_2(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  IOSurfaceRef IOSurface;
  uint64_t v4;
  CAMStillImageCaptureResult *v5;
  CAMStillImageCaptureResult *v6;
  int v7;
  void *v8;
  CAMStillImageCaptureResult *v9;
  _QWORD v10[4];
  id v11;
  CAMStillImageCaptureResult *v12;

  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = [CAMStillImageCaptureResult alloc];
  if (v4)
  {
    v6 = -[CAMStillImageCaptureResult initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:](v5, "initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "cam_isRecordingMovieForLivePhoto"), *(_QWORD *)(a1 + 48), IOSurface, *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 72));
    v7 = 42;
  }
  else
  {
    v6 = -[CAMStillImageCaptureResult initWithCaptureDeferredPhotoProxy:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:](v5, "initWithCaptureDeferredPhotoProxy:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:", *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 40), "cam_isRecordingMovieForLivePhoto"), *(_QWORD *)(a1 + 48), IOSurface, *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 72));
    v7 = 62;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_3;
  v10[3] = &unk_1EA32E928;
  v8 = *(void **)(a1 + 88);
  v11 = *(id *)(a1 + 96);
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "_enumerateCaptureServicesUsingBlock:", v10);
  CAMSignpostWithIDAndArgs(v7, objc_msgSend(*(id *)(a1 + 40), "uniqueID"), objc_msgSend(*(id *)(a1 + 40), "uniqueID"), 0, 0, 0);

}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequest:didCompleteStillImageCaptureWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_coordinationInfoForRequest:(id)a3 resolvedSettings:(id)a4 videoComplementURL:(id)a5 isFiltered:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  CAMCaptureCoordinationInfo *v19;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("captureID:%lld"), objc_msgSend(v12, "uniqueID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _expectedResultSpecifiersForResolvedPhotoSettings:](self, "_expectedResultSpecifiersForResolvedPhotoSettings:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isHDREnabled");

  v17 = objc_msgSend(v13, "isEV0LocalVideoDestinationURL:", v11);
  if (v6)
    v18 = v16 & (v17 ^ 1u) | 2;
  else
    v18 = v16 & (v17 ^ 1u);
  v19 = -[CAMCaptureCoordinationInfo initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:]([CAMCaptureCoordinationInfo alloc], "initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:", v14, v15, v18);

  return v19;
}

- (id)_coordinationInfoForCTMVideoRequest:(id)a3 videoOutputURL:(id)a4 resolvedMomentCaptureMovieSettings:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  CAMCaptureCoordinationInfo *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("captureID:%lld"), objc_msgSend(v7, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:](self, "_expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CAMCaptureCoordinationInfo initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:]([CAMCaptureCoordinationInfo alloc], "initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:", v8, v9, 0);
  return v10;
}

- (id)_expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "movieURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v5, "addObject:", &unk_1EA3B13D8);
  return v5;
}

- (void)captureOutput:(id)a3 didFinishRecordingLivePhotoMovieForEventualFileAtURL:(id)a4 resolvedSettings:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "uniqueID");
  CAMSignpostWithIDAndArgs(43, v9, v9, 0, 0, 0);
  v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v8, "uniqueID");
    _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v12 = v7;
  v13 = v8;
  pl_dispatch_async();

}

void __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 6, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_coordinationInfoForRequest:resolvedSettings:videoComplementURL:isFiltered:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke_2;
    v9[3] = &unk_1EA32E928;
    v10 = v5;
    v11 = v6;
    v8 = v6;
    objc_msgSend(v7, "_enumerateCaptureServicesUsingBlock:", v9);
    CAMSignpostWithIDAndArgs(44, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64), 0, 0, 0);

  }
}

void __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequest:didStopCapturingLivePhotoVideoForCoordinationInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v9 = *a5;
  v8 = *a6;
  -[CAMCaptureEngine captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:](self, "captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:metadataIdentifiers:resolvedSettings:error:", a3, a4, &v9, &v8, 0, a7, a8);
}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 metadataIdentifiers:(id)a7 resolvedSettings:(id)a8 error:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = a8;
  v15 = a9;
  v16 = objc_msgSend(v14, "uniqueID");
  CAMSignpostWithIDAndArgs(45, v16, v16, 0, 0, 0);
  v17 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v26 = objc_msgSend(v14, "uniqueID");
    v27 = 2114;
    v28 = v12;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:, url=%{public}@, error: %{public}@", buf, 0x20u);
  }

  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  v24 = v12;
  v19 = v13;
  v20 = v15;
  v21 = v12;
  v22 = v14;
  pl_dispatch_async();

}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CAMVideoCaptureResult *v16;
  uint64_t v17;
  uint64_t v18;
  CAMVideoCaptureResult *v19;
  void *v20;
  CAMVideoCaptureResult *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  CAMVideoCaptureResult *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCTMVideo") & 1) == 0)
  {
    objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 7, *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "_coordinationInfoForRequest:resolvedSettings:videoComplementURL:isFiltered:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_OWORD *)(a1 + 88);
    v33 = *(_QWORD *)(a1 + 104);
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 80);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v30 = *(_OWORD *)(a1 + 112);
    v31 = *(_QWORD *)(a1 + 128);
    v28 = *(_OWORD *)(a1 + 88);
    v29 = *(_QWORD *)(a1 + 104);
    objc_msgSend(v7, "_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:", v9, v5, v8, v10, 1, &v30, &v28, &v32, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v13 = MEMORY[0x1E0C809B0];
    v14 = *(void **)(a1 + 64);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_2;
    v26[3] = &unk_1EA32E9C8;
    v27 = v12;
    v15 = v12;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);
    v16 = [CAMVideoCaptureResult alloc];
    v17 = *(_QWORD *)(a1 + 48);
    v18 = objc_msgSend(*(id *)(a1 + 40), "livePhotoMovieDimensions");
    v30 = v32;
    v31 = v33;
    v28 = *(_OWORD *)(a1 + 112);
    v29 = *(_QWORD *)(a1 + 128);
    LOBYTE(v22) = 0;
    v19 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v16, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", v17, 0, &v30, &v28, v18, v15, 1.0, 0, 0, v6, v11, v22);
    v20 = *(void **)(a1 + 32);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_3;
    v23[3] = &unk_1EA32E928;
    v24 = v5;
    v25 = v19;
    v21 = v19;
    objc_msgSend(v20, "_enumerateCaptureServicesUsingBlock:", v23);
    CAMSignpostWithIDAndArgs(46, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 80), 0, 0, 0);

  }
}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C8B278];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
  objc_msgSend(v8, "setKey:", v7);

  objc_msgSend(v8, "setValue:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequest:didCompleteVideoCaptureWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_didFinishStillImageCaptureForUniqueID:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  CAMSignpostWithIDAndArgs(47, a3, a3, 0, 0, 0);
  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  pl_dispatch_async();

}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t aBlock;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 5, *(_QWORD *)(a1 + 56));
  aBlock = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_2;
  v18 = &unk_1EA329360;
  v19 = *(_QWORD *)(a1 + 32);
  v6 = v5;
  v20 = v6;
  v21 = *(id *)(a1 + 40);
  v7 = (void (**)(_QWORD))_Block_copy(&aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v2);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_effectsPreviewSurfaceFilteringQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
  else
  {
    v7[2](v7);
  }
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("captureID:%lld received final callback. "), v12, aBlock, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_resultsQueue_logReceivedCallbacksForID:withIntroString:", v12, v13);

  objc_msgSend(v3, "removeObjectForKey:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v2);

  CAMSignpostWithIDAndArgs(48, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48), 0, 0, 0);
}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_3;
  v3[3] = &unk_1EA32E928;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_enumerateCaptureServicesUsingBlock:", v3);

}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestDidCompleteCapture:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)captureOutput:(id)a3 didBeginMovieCaptureForResolvedSettings:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "uniqueID");
  CAMSignpostWithIDAndArgs(57, v6, v6, 0, 0, 0);
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = v6;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didBeginMovieCaptureForResolvedSettings:, %{public}@", buf, 0x16u);
  }

  mach_absolute_time();
  -[CAMCaptureEngine _destroyAccidentalLaunchTimer](self, "_destroyAccidentalLaunchTimer");
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  pl_dispatch_async();

}

void __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 8, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setResultsQueueLastCompletedVideoZoomFactor:", 0.0);
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke_2;
  v8[3] = &unk_1EA32E6B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_enumerateCaptureServicesUsingBlock:", v8);
  CAMSignpostWithIDAndArgs(58, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 0, 0, 0);

}

void __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequestWillStartCapturingVideo:", *(_QWORD *)(a1 + 32));

}

- (void)captureOutput:(id)a3 didFinishRecordingMovie:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "resolvedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "uniqueID");

  v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "outputFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishRecordingMovie:, url=%{public}@", buf, 0x16u);

  }
  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  pl_dispatch_async();

}

void __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 9, *(_QWORD *)(a1 + 56));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "outputFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resolvedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_coordinationInfoForCTMVideoRequest:videoOutputURL:resolvedMomentCaptureMovieSettings:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke_2;
  v13[3] = &unk_1EA32E928;
  v14 = v5;
  v15 = v9;
  v11 = v9;
  v12 = v5;
  objc_msgSend(v10, "_enumerateCaptureServicesUsingBlock:", v13);

}

void __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequest:didStopCapturingCTMVideoForCoordinationInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)captureOutput:(id)a3 didFinishWritingMovie:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "resolvedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "uniqueID");

  CAMSignpostWithIDAndArgs(59, v10, v10, 0, 0, 0);
  objc_msgSend(v7, "outputFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishWritingMovie:, url=%{public}@, error: %{public}@", buf, 0x20u);
  }

  CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v7, "previewPixelBuffer"));
  mach_absolute_time();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = v8;
  v14 = v8;
  v15 = v7;
  v16 = v11;
  pl_dispatch_async();

}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t Width;
  size_t Height;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  _QWORD v53[3];
  char v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRegisteredStillImageRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveCallback:atAbsoluteTime:", 10, *(_QWORD *)(a1 + 72));
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "resolvedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_coordinationInfoForCTMVideoRequest:videoOutputURL:resolvedMomentCaptureMovieSettings:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0uLL;
  v57 = 0;
  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    objc_msgSend(v10, "duration");
    v10 = *(void **)(a1 + 48);
  }
  v55 = 0;
  v54 = 0;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  if (v10)
    objc_msgSend(v10, "duration");
  else
    memset(v53, 0, sizeof(v53));
  v49 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&v50 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v11, "_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:", v12, v5, v13, v14, 0, &v49, v53, &v56, &v55, &v54);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v52 = 0uLL;
  if (!*(_QWORD *)(a1 + 56))
  {
    Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 80));
    Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 80));
    v21 = *(void **)(a1 + 32);
    if (v21)
    {
      objc_msgSend(v21, "_previewFilterSetForRequest:previewSize:", v5, (double)Width, (double)Height);
      v17 = *((_QWORD *)&v49 + 1);
      v18 = v49;
      v16 = v51;
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v51 = 0;
      v49 = 0u;
      v50 = 0u;
    }
    v52 = v50;
  }
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueLastCompletedVideoZoomFactor");
  v23 = v22;
  objc_msgSend(*(id *)(a1 + 32), "_setResultsQueueLastCompletedVideoZoomFactor:", 0.0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_2;
  aBlock[3] = &unk_1EA32EA18;
  v36 = *(id *)(a1 + 40);
  v46 = v56;
  v47 = v57;
  v37 = *(id *)(a1 + 48);
  v42 = v23;
  v43 = v55;
  v24 = v9;
  v38 = v24;
  v25 = v15;
  v48 = v54;
  v44 = *(_QWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 32);
  v39 = v25;
  v40 = v26;
  v27 = v5;
  v28 = *(_QWORD *)(a1 + 64);
  v41 = v27;
  v45 = v28;
  v29 = _Block_copy(aBlock);
  v30 = v29;
  v31 = *(_QWORD *)(a1 + 80);
  if (!v31)
    goto LABEL_18;
  v32 = v18 != 0;
  if (v17)
    ++v32;
  v33 = (unint64_t)(v16 - 1) >= 0xFFFFFFFFFFFFFFFELL ? 0 : -1;
  if (v32 != v33)
  {
    v34 = *(void **)(a1 + 32);
    *(_QWORD *)&v49 = v18;
    *((_QWORD *)&v49 + 1) = v17;
    v50 = v52;
    v51 = v16;
    objc_msgSend(v34, "_resultsQueue_performPostprocessingForPreviewBuffer:metadata:filters:stillImageCaptureRequestKey:completionHandler:", v31, 0, &v49, v2, v30);
  }
  else
  {
LABEL_18:
    (*((void (**)(void *))v29 + 2))(v29);
  }

}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  CAMVideoCaptureResult *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  CAMVideoCaptureResult *v14;
  void *v15;
  CAMVideoCaptureResult *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  CAMVideoCaptureResult *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = [CAMVideoCaptureResult alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resolvedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "movieDimensions");
  objc_msgSend(*(id *)(a1 + 40), "movieMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(double *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_BYTE *)(a1 + 136);
  v23 = *(_OWORD *)(a1 + 112);
  v24 = *(_QWORD *)(a1 + 128);
  v21 = *MEMORY[0x1E0CA2E18];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  LOBYTE(v17) = v13;
  v14 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v4, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", v5, 0, &v23, &v21, v7, v8, v9, v10, a2, v11, v12, v17);

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 96));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_3;
  v18[3] = &unk_1EA32E928;
  v15 = *(void **)(a1 + 64);
  v19 = *(id *)(a1 + 72);
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "_enumerateCaptureServicesUsingBlock:", v18);
  CAMSignpostWithIDAndArgs(60, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 104), 0, 0, 0);

}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stillImageRequest:didCompleteVideoCaptureWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)captureOutput:(id)a3 didFinishMovieCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = objc_msgSend(v7, "uniqueID");
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishMovieCaptureForResolvedSettings:, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[CAMCaptureEngine _didFinishStillImageCaptureForUniqueID:error:](self, "_didFinishStillImageCaptureForUniqueID:error:", objc_msgSend(v7, "uniqueID"), v8);
}

- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 photo:(id)a4
{
  id v8;
  void *v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  $42FF7B9720B8FFE93045C4EB8F3F13A3 *result;
  id v16;

  v16 = a5;
  v8 = a4;
  objc_msgSend(v16, "resolvedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "previewDimensions");
  v11 = v10;
  v12 = HIDWORD(v10);

  retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  -[CAMCaptureEngine _previewFilterSetForRequest:previewSize:](self, "_previewFilterSetForRequest:previewSize:", v8, (double)v11, (double)(int)v12);
  LODWORD(self) = objc_msgSend(v8, "wantsSemanticSceneFilter");

  if ((_DWORD)self)
  {
    v13 = (void *)MEMORY[0x1E0D75260];
    objc_msgSend(v16, "privateClientMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var3 = objc_msgSend(v13, "semanticEnhanceSceneForPrivateClientMetadata:", v14);

  }
  return result;
}

- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 previewSize:(id)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  int64_t v9;
  $42FF7B9720B8FFE93045C4EB8F3F13A3 *result;
  id v11;

  height = a5.height;
  width = a5.width;
  v11 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  retstr->var3 = 0;
  retstr->var1 = objc_msgSend(v11, "aspectRatioCrop");
  retstr->var2.width = width;
  retstr->var2.height = height;
  objc_msgSend(v11, "adjustmentFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (!v8)
    v9 = objc_msgSend(v11, "effectFilterType");
  retstr->var0 = v9;

  return result;
}

- (id)_previewFiltersForFilterSet:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD aBlock[4];
  id v22;

  if (a3->var0)
    v4 = (a3->var1 != 0) + 1;
  else
    v4 = a3->var1 != 0;
  if ((unint64_t)(a3->var3 - 1) >= 0xFFFFFFFFFFFFFFFELL)
    v5 = v4;
  else
    v5 = v4 + 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CAMCaptureEngine__previewFiltersForFilterSet___block_invoke;
  aBlock[3] = &unk_1EA32EA68;
  v7 = v6;
  v22 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D75260], "filterForSemanticEnhanceScene:", a3->var3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "enableSemanticDevelopmentFilterDebugging");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0C9DDB8];
      objc_msgSend(v9, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "filterWithName:withInputParameters:", v13, &unk_1EA3B2E30);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
  }
  v8[2](v8, v9);
  v15 = (void *)MEMORY[0x1E0C9DDB8];
  +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", a3->var0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filterWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v17);

  +[CAMAspectCropUtilities cropFilterForAspectRatio:imageSize:](CAMAspectCropUtilities, "cropFilterForAspectRatio:imageSize:", a3->var1, a3->var2.width, a3->var2.height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v18);

  v19 = v7;
  return v19;
}

uint64_t __48__CAMCaptureEngine__previewFiltersForFilterSet___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (__CVBuffer)_createOutputPixelBufferWithSize:(CGSize)a3 matchingInputPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v4;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CVPixelBufferGetPixelFormatType(a4);
  CVPixelBufferGetAttributes();
  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CAMCaptureEngine _createOutputPixelBufferWithSize:matchingInputPixelBuffer:].cold.1();

  CVPixelBufferRelease(0);
  return 0;
}

- (__CVBuffer)_newFilteredPixelBufferFromPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  void (**v26)(_QWORD);
  double v27;
  double v28;
  __CVBuffer *v29;
  CIContext *effectsPreviewSurfaceFilteringContext;
  CIContext *v31;
  CIContext *v32;
  __CVBuffer *v34;
  void *v35;
  CAMCaptureEngine *v36;
  void *v37;
  _QWORD aBlock[4];
  id v39;
  CGAffineTransform v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v46 = *MEMORY[0x1E0C9E140];
    v47[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v36 = self;
  v37 = v8;
  v34 = a3;
  v35 = (void *)v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:options:", a3, v10);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    v16 = *MEMORY[0x1E0C9E1F8];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v18, "setValue:forKey:", v11, v16);
        objc_msgSend(v18, "outputImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CICrop"));

        if (v21)
        {
          objc_msgSend(v18, "valueForKey:", CFSTR("inputRectangle"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "CGRectValue");
          CGAffineTransformMakeTranslation(&v40, -v23, -v24);
          objc_msgSend(v19, "imageByApplyingTransform:", &v40);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = v19;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v14);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke;
  aBlock[3] = &unk_1EA328868;
  v25 = v12;
  v39 = v25;
  v26 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v11, "extent");
  v29 = -[CAMCaptureEngine _createOutputPixelBufferWithSize:matchingInputPixelBuffer:](v36, "_createOutputPixelBufferWithSize:matchingInputPixelBuffer:", v34, v27, v28);
  if (v29)
  {
    effectsPreviewSurfaceFilteringContext = v36->__effectsPreviewSurfaceFilteringContext;
    if (!effectsPreviewSurfaceFilteringContext)
    {
      v31 = (CIContext *)objc_alloc_init(MEMORY[0x1E0C9DD90]);
      v32 = v36->__effectsPreviewSurfaceFilteringContext;
      v36->__effectsPreviewSurfaceFilteringContext = v31;

      effectsPreviewSurfaceFilteringContext = v36->__effectsPreviewSurfaceFilteringContext;
    }
    -[CIContext render:toCVPixelBuffer:](effectsPreviewSurfaceFilteringContext, "render:toCVPixelBuffer:", v11, v29);
  }
  v26[2](v26);

  return v29;
}

uint64_t __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_212);
}

uint64_t __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", 0, *MEMORY[0x1E0C9E1F8]);
}

- (void)_resultsQueue_performPostprocessingForPreviewBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id *)a5 stillImageCaptureRequestKey:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *effectsPreviewSurfaceFilteringQueue;
  void *v18;
  id v19;
  id v20;
  void *v21;

  v10 = a4;
  v11 = a7;
  v12 = a6;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[CAMCaptureEngine _resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue](self, "_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v12);

  if (!self->__effectsPreviewSurfaceFilteringQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.capture-engine.effects-preview-surface-filtering-queue", v15);
    effectsPreviewSurfaceFilteringQueue = self->__effectsPreviewSurfaceFilteringQueue;
    self->__effectsPreviewSurfaceFilteringQueue = v16;

  }
  -[CAMCaptureEngine _effectsPreviewSurfaceFilteringQueue](self, "_effectsPreviewSurfaceFilteringQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  v19 = v11;
  v20 = v10;
  pl_dispatch_async();

}

void __135__CAMCaptureEngine__resultsQueue_performPostprocessingForPreviewBuffer_metadata_filters_stillImageCaptureRequestKey_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __CVBuffer *v5;
  _OWORD v6[2];
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v3;
  v7 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v2, "_previewFiltersForFilterSet:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newFilteredPixelBufferFromPixelBuffer:metadata:filters:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  CVPixelBufferRelease(v5);

}

- (void)registerVideoCaptureRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  pl_dispatch_async();

}

void __48__CAMCaptureEngine_registerVideoCaptureRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRequestsBeingRecorded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localDestinationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

- (void)registerVideoEndZoomFactor:(double)a3
{
  void *v3;

  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

uint64_t __47__CAMCaptureEngine_registerVideoEndZoomFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setResultsQueueLastCompletedVideoZoomFactor:", *(double *)(a1 + 40));
}

- (void)stopRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  -[CAMCaptureEngine movieFileOutput](self, "movieFileOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v11 = v3;
  v7 = v3;
  v8 = v5;
  v9 = v4;
  pl_dispatch_async();

}

void __33__CAMCaptureEngine_stopRecording__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resultsQueueRequestsBeingRecorded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "localDestinationURL");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_resultsQueueLastCompletedVideoURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Detected stop-after-completion case for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "connections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CAMVideoCaptureRequestError(-28000, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 48), v6);
      dispatch_get_global_queue(2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
      v15 = *(id *)(a1 + 56);
      v16 = v11;
      v13 = v11;
      v9 = v10;
      pl_dispatch_async();

    }
  }

}

uint64_t __33__CAMCaptureEngine_stopRecording__block_invoke_215(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Handling stop-before-start for video capture: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[16];

  v6 = a3;
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine didResumeRecordingToOutputFileAtURL:", buf, 2u);
  }

  objc_msgSend(v6, "currentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  pl_dispatch_async();

}

void __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke_2;
  v2[3] = &unk_1EA32E6B8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_enumerateCaptureServicesUsingBlock:", v2);

}

void __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "videoRequestDidResumeCapturing:", *(_QWORD *)(a1 + 32));

}

- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v7;
  id v8;
  double Current;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMCaptureEngine _destroyAccidentalLaunchTimer](self, "_destroyAccidentalLaunchTimer");
  objc_msgSend(v8, "currentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "userInitationTimestamp");
  if (v11 != 0.0)
  {
    v12 = v11;
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2048;
      v21 = Current - v12;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine captureOutput:didStartRecordingToOutputFileAtURL: url=%{public}@ (after %.3f seconds)", buf, 0x16u);
    }

  }
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v15 = v7;
  v16 = v10;
  pl_dispatch_async();

}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  id v20;
  id location;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setResultsQueueLastCompletedVideoZoomFactor:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "localDestinationURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 40) && (objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "shouldGenerateVideoPreviewImage");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v6);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v23 = __Block_byref_object_copy__24;
      v24 = __Block_byref_object_dispose__24;
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_219;
      v17[3] = &unk_1EA32EB20;
      v18 = *(id *)(a1 + 40);
      objc_copyWeak(&v20, &location);
      v8 = *MEMORY[0x1E0C89FE8];
      v19 = buf;
      objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v8, 0, v7, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v9;

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v20);

      objc_destroyWeak(&location);
    }
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_2;
    v15[3] = &unk_1EA32E6B8;
    v11 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_enumerateCaptureServicesUsingBlock:", v15);
    v12 = v16;
  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 2114;
      v23 = v14;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Started recording for an unexpected video request %{public}@ (%{public}@, %{public}@)", buf, 0x20u);
    }
  }

}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_219(uint64_t a1, void *a2)
{
  void *v3;
  CAMIOSurfaceWrapper *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(a2, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89FF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMIOSurfaceWrapper initWithIOSurface:]([CAMIOSurfaceWrapper alloc], "initWithIOSurface:", v3);
  objc_setAssociatedObject(*(id *)(a1 + 32), (const void *)_associatedVideoPreviewSurfaceKey, v4, (void *)1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "videoRequestDidStartCapturing:", *(_QWORD *)(a1 + 32));

}

- (void)_captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 forVideoCaptureRequest:(id)a6 videoZoomFactor:(double)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v17 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v33 = v14;
    v34 = 2114;
    v35 = v15;
    v36 = 2048;
    v37 = a7;
    v38 = 2114;
    v39 = v16;
    _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine _captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:forVideoCaptureRequest:videoZoomFactor:error url=%{public}@, request=%{public}@, videoZoomFactor=%.2f, error=%{public}@", buf, 0x2Au);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke;
  v30[3] = &unk_1EA32E6B8;
  v18 = v15;
  v31 = v18;
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v30);
  objc_msgSend(v13, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v29 = v19;
  v21 = v19;
  v22 = v16;
  v23 = v18;
  v24 = v14;
  v25 = v13;
  pl_dispatch_async();

}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "videoRequestDidStopCapturing:", *(_QWORD *)(a1 + 32));

}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __IOSurface *v13;
  NSObject *v14;
  NSObject *v15;
  CAMVideoCaptureResult *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  CAMVideoCaptureResult *v20;
  void *v21;
  CAMVideoCaptureResult *v22;
  uint64_t v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  CAMVideoCaptureResult *v27;
  __int128 v28;
  uint64_t v29;
  CVPixelBufferRef pixelBufferOut;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];
  char v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;

  v36 = 0uLL;
  v37 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "recordedDuration");
    v2 = *(void **)(a1 + 32);
  }
  v35 = 0;
  v34 = 0;
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  if (v2)
    objc_msgSend(v2, "recordedDuration");
  else
    memset(v33, 0, sizeof(v33));
  v24 = *MEMORY[0x1E0CA2E18];
  v31 = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v32 = v7;
  objc_msgSend(v3, "_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:", v4, v5, 0, v6, 0, &v31, v33, &v36, &v35, &v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

      if (v11)
      {

        v8 = 0;
      }
    }
  }
  objc_getAssociatedObject(*(id *)(a1 + 56), (const void *)_associatedVideoPreviewSurfaceKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__IOSurface *)objc_msgSend(v12, "surface");
  pixelBufferOut = 0;
  if (v13)
  {
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, 0, &pixelBufferOut))
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_2();

      CVPixelBufferRelease(pixelBufferOut);
      pixelBufferOut = 0;
    }
  }
  else
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_1();

  }
  v16 = [CAMVideoCaptureResult alloc];
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 72);
  v19 = *(double *)(a1 + 80);
  v31 = v36;
  v32 = v37;
  v28 = v24;
  v29 = v7;
  LOBYTE(v23) = v34;
  v20 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v16, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", v17, 0, &v31, &v28, 0, v18, v19, v35, pixelBufferOut, 0, v8, v23);
  objc_setAssociatedObject(*(id *)(a1 + 56), (const void *)_associatedVideoPreviewSurfaceKey, 0, (void *)1);
  CVPixelBufferRelease(pixelBufferOut);
  v21 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_227;
  v25[3] = &unk_1EA32E928;
  v26 = *(id *)(a1 + 56);
  v27 = v20;
  v22 = v20;
  objc_msgSend(v21, "_enumerateCaptureServicesUsingBlock:", v25);

}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_227(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "videoRequest:didCompleteCaptureWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_validateVideoAtURL:(id)a3 forCaptureRequest:(id)a4 captureID:(int64_t)a5 captureError:(id)a6 isVideoComplement:(BOOL)a7 stillImageDisplayTime:(id *)a8 reportedDuration:(id *)a9 outActualDuration:(id *)a10 outVideoRecordingStoppedReason:(int64_t *)a11 outSlowWriterFrameDrops:(BOOL *)a12
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  CMTimeFlags var2;
  int v21;
  Float64 Seconds;
  id v23;
  void *v24;
  _BOOL4 v25;
  unsigned int v26;
  double v27;
  __CFString *v28;
  int v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  _BOOL4 v34;
  _QWORD *v35;
  NSObject *v36;
  _BOOL4 v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  __CFString *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  const __CFString *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  Float64 v93;
  Float64 v94;
  __CFString *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int64_t v101;
  __CFString *v103;
  __CFString *v104;
  _BOOL4 v105;
  void *v106;
  __CFString *v108;
  id v109;
  CMTimeEpoch var3;
  CMTimeFlags flags;
  _QWORD v112[4];
  id v113;
  id v114;
  CMTime time2;
  id v116;
  CMTime time;
  id v118;
  __int16 v119;
  id v120;
  CMTimeValue var0;
  CMTimeScale var1;
  uint64_t v123;

  v105 = a7;
  v123 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v109 = a4;
  v15 = a6;
  v16 = objc_msgSend(v15, "code");
  if (!v15)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_16;
  }
  if (v16 > -11819)
  {
    v18 = 0;
    v19 = 0;
    v17 = 1;
    switch(v16)
    {
      case -11811:
        v18 = 0;
        v19 = 0;
        v17 = 3;
        break;
      case -11810:
        v18 = 0;
        v19 = 0;
        v17 = 2;
        break;
      case -11809:
      case -11808:
      case -11806:
        goto LABEL_14;
      case -11807:
        break;
      case -11805:
        goto LABEL_10;
      default:
        if (v16 != -11818)
          goto LABEL_14;
        v19 = v15;
        v18 = 0;
        v17 = 4;
        break;
    }
  }
  else
  {
    switch(v16)
    {
      case -28000:
        goto LABEL_10;
      case -11911:
        CAMVideoCaptureRequestError(-28003, v15);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v18 = 1;
        goto LABEL_16;
      case -11904:
LABEL_10:
        v19 = v15;
        v18 = 1;
        break;
      default:
LABEL_14:
        v19 = v15;
        v18 = 0;
        break;
    }
    v17 = 5;
  }
LABEL_16:
  var0 = a9->var0;
  var2 = a9->var2;
  var1 = a9->var1;
  var3 = a9->var3;
  flags = var2;
  v21 = var2 & 0x1D;
  Seconds = 0.0;
  if (v21 == 1)
  {
    time.value = a9->var0;
    time.timescale = a9->var1;
    time.flags = var2;
    time.epoch = var3;
    Seconds = CMTimeGetSeconds(&time);
  }
  v101 = v17;
  if (v14)
  {
    v23 = v14;
    objc_msgSend(v14, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length") != 0;

  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  v26 = a9->var2;
  if (v21 != 1)
  {
    if (v105)
      v32 = CFSTR("Live Photo movie");
    else
      v32 = CFSTR("video");
    v104 = v32;
    if ((v26 & 1) != 0)
    {
      v31 = v23;
      goto LABEL_38;
    }
    v29 = 0;
    v30 = CFSTR("Invalid");
LABEL_36:
    v31 = v23;
    goto LABEL_39;
  }
  time.value = var0;
  time.timescale = var1;
  time.flags = flags;
  time.epoch = var3;
  v27 = CMTimeGetSeconds(&time);
  if (v105)
    v28 = CFSTR("Live Photo movie");
  else
    v28 = CFSTR("video");
  v104 = v28;
  v29 = v26 | (v27 == 0.0);
  if ((v26 & 1) != 0)
    v30 = CFSTR("Zero");
  else
    v30 = CFSTR("Invalid");
  if ((v26 & 1) == 0)
    goto LABEL_36;
  v31 = v23;
  if (v27 != 0.0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3fs"), *(_QWORD *)&Seconds);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
  }
LABEL_39:
  v34 = (v26 & 1) == 0 || v15 != 0;
  v35 = (_QWORD *)MEMORY[0x1E0CB3388];
  if ((v25 & ~v18) == 1 && ((v34 | v29) & 1) != 0)
  {
    v36 = os_log_create("com.apple.camera", "Camera");
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (!v37)
        goto LABEL_51;
      LODWORD(time.value) = 138544130;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v30;
      HIWORD(time.epoch) = 2114;
      v118 = v15;
      v119 = 2114;
      v120 = v31;
      v38 = "Encountered an error during %{public}@ recording! (duration: %{public}@ error: %{public}@, file: %{public}@)";
      v39 = v36;
      v40 = 42;
    }
    else
    {
      if (!v37)
        goto LABEL_51;
      LODWORD(time.value) = 138543874;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v30;
      HIWORD(time.epoch) = 2114;
      v118 = v31;
      v38 = "Encountered a reported %{public}@ duration of %{public}@! (file: %{public}@)";
      v39 = v36;
      v40 = 32;
    }
    _os_log_error_impl(&dword_1DB760000, v39, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&time, v40);
LABEL_51:

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "fileExistsAtPath:", v42);

    if ((v43 & 1) == 0)
    {
      v54 = v15;

      v50 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.6();
      goto LABEL_81;
    }
    if (v15)
    {
      objc_msgSend(v15, "userInfo");
      v44 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A250]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = v45;
        v47 = objc_msgSend(v45, "BOOLValue");

        if ((v47 & 1) != 0 || !v105)
        {
          if ((v47 & 1) == 0)
          {
            v55 = v15;

            v56 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.4();

LABEL_99:
            v61 = 0;
LABEL_107:
            v60 = os_log_create("com.apple.camera", "Camera");
            v103 = v30;
            v108 = v61;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              LODWORD(time.value) = 138543874;
              *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
              LOWORD(time.flags) = 2114;
              *(_QWORD *)((char *)&time.flags + 2) = v30;
              HIWORD(time.epoch) = 2114;
              v118 = v31;
              _os_log_error_impl(&dword_1DB760000, v60, OS_LOG_TYPE_ERROR, "Encountered a reported %{public}@ duration of %{public}@! (file: %{public}@)", (uint8_t *)&time, 0x20u);
            }
            v19 = v15;
            goto LABEL_110;
          }
          goto LABEL_59;
        }
        v44 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.5();
      }

    }
LABEL_59:
    v48 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.3();

    v116 = 0;
    v49 = objc_msgSend(MEMORY[0x1E0C8B0D0], "consolidateMovieFragmentsInFile:error:", v31, &v116);
    v50 = v116;
    v51 = os_log_create("com.apple.camera", "Camera");
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (v49)
    {
      if (v52)
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.1();

      objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v31, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v53;
      if (v53)
      {
        objc_msgSend(v53, "duration");
        flags = time.flags;
        var3 = time.epoch;
      }
      else
      {
        var3 = 0;
        flags = 0;
        memset(&time, 0, sizeof(time));
      }
      var0 = time.value;
      var1 = time.timescale;
      v57 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        time.value = var0;
        time.timescale = var1;
        time.flags = flags;
        time.epoch = var3;
        v93 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 134218242;
        *(Float64 *)((char *)&time.value + 4) = v93;
        LOWORD(time.flags) = 2114;
        *(_QWORD *)((char *)&time.flags + 2) = v30;
        _os_log_error_impl(&dword_1DB760000, v57, OS_LOG_TYPE_ERROR, "Replaced duration with asset duration %f (reportedDuration was %{public}@)", (uint8_t *)&time, 0x16u);
      }

      v54 = 0;
    }
    else
    {
      if (v52)
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.2();

      CAMVideoCaptureRequestError(-28001, v15);
      v54 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_81:
    v19 = v54;
  }
  if (v19)
    goto LABEL_95;
  if (!v15 || !v105)
  {
    v58 = flags & 0x1D;
    goto LABEL_92;
  }
  v58 = flags & 0x1D;
  if ((a8->var2 & 1) == 0 || v58 != 1)
  {
LABEL_92:
    if (v58 == 1)
    {
      time.value = var0;
      time.timescale = var1;
      time.flags = flags;
      time.epoch = var3;
      if (CMTimeGetSeconds(&time) > 0.0)
        goto LABEL_100;
    }
    goto LABEL_94;
  }
  time = (CMTime)*a8;
  time2.value = var0;
  time2.timescale = var1;
  time2.flags = flags;
  time2.epoch = var3;
  if (CMTimeCompare(&time, &time2) < 0)
    goto LABEL_100;
  v59 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    time = (CMTime)*a8;
    v94 = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 138543618;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = v94;
    _os_log_error_impl(&dword_1DB760000, v59, OS_LOG_TYPE_ERROR, "LivePhoto video complement had duration of %{public}@, which is less than still image time of %.3f", (uint8_t *)&time, 0x16u);
  }

LABEL_94:
  CAMVideoCaptureRequestError(-28002, v15);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
LABEL_95:
    if (v19 != v15)
    {
      v60 = os_log_create("com.apple.camera", "Camera");
      v103 = v30;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 138544130;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
        LOWORD(time.flags) = 2114;
        *(_QWORD *)((char *)&time.flags + 2) = v30;
        HIWORD(time.epoch) = 2114;
        v118 = v31;
        v119 = 2114;
        v120 = v19;
        _os_log_error_impl(&dword_1DB760000, v60, OS_LOG_TYPE_ERROR, "Encountered an error during %{public}@ recording! (duration: %{public}@, file: %{public}@, error: %{public}@)", (uint8_t *)&time, 0x2Au);
      }
      v108 = 0;
LABEL_110:

      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1EA3B13F0, &unk_1EA3B1408, &unk_1EA3B1420, &unk_1EA3B1438, &unk_1EA3B1450, 0);
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "shouldEnableUserNotifications");

      objc_msgSend(v19, "userInfo");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKeyedSubscript:", *v35);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v70, "code"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v63, "containsObject:", v71);

      if (((v18 | v68 ^ 1) & 1) == 0 && (v72 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("validateVideoURLErrorNotificationID%ld%ld%lld"), objc_msgSend(v19, "code"), objc_msgSend(v70, "code"), a5);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userInfo");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A248]);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v97 = v75;
        v76 = objc_msgSend(v75, "unsignedIntegerValue");
        v77 = v108;
        if (!v108)
        {
          if ((unint64_t)(v76 - 2) >= 3)
          {
            v78 = CFSTR("Video Error:");
            if (v105)
              v78 = CFSTR("Live Photo Error:");
            v77 = v78;
          }
          else
          {
            v77 = off_1EA32ED50[v76 - 2];
          }
        }
        v108 = v77;
        -[__CFString stringByAppendingFormat:](v77, "stringByAppendingFormat:", CFSTR(" %ld, %ld"), objc_msgSend(v19, "code"), objc_msgSend(v70, "code"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v31;
        objc_msgSend(v31, "path");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v80, "fileExistsAtPath:", v81);

        if (v82)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error occurred while recording a %@ (duration:%@). The video has been placed in the Photo Library. Tap to file a Radar and please attach the video."), v104, v103);
        }
        else
        {
          if (objc_msgSend(v109, "persistenceOptions") == 3)
          {
            v83 = CFSTR("An error occurred, the storage drive might have been disconnected. Tap to file a Radar.");
          }
          else
          {
            v95 = v104;
            v83 = CFSTR("An error occurred and no %@ was recorded. Tap to file a Radar.");
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v83, v95, v96);
        }
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a5);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v86, CFSTR("captureID"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%ld"), objc_msgSend(v19, "code"), objc_msgSend(v70, "code"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v87, CFSTR("error"));

        -[CAMCaptureEngine _TTRKeywordIDsFromCaptureRequest:](self, "_TTRKeywordIDsFromCaptureRequest:", v109);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v88, CFSTR("keywordIDs"));

        objc_msgSend(v73, "setTitle:", v79);
        objc_msgSend(v73, "setBody:", v84);
        objc_msgSend(v73, "setUserInfo:", v85);
        objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v98, v73, 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke;
        v112[3] = &unk_1EA32D910;
        v113 = v79;
        v114 = v84;
        v90 = v84;
        v91 = v79;
        objc_msgSend(v99, "addNotificationRequest:withCompletionHandler:", v89, v112);

        v31 = v106;
      }

      v30 = v103;
      v61 = v108;
      goto LABEL_126;
    }
    goto LABEL_99;
  }
LABEL_100:
  objc_msgSend(v15, "userInfo");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKeyedSubscript:", *v35);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = objc_msgSend(v63, "code");
  if (v64 == -15437)
  {
    v66 = v15;
    if (a12)
      *a12 = 1;
    v61 = CFSTR("Frame Drops Reported (Slow Writer):");
  }
  else
  {
    if (v64 != -15435)
    {
      v19 = 0;
      v61 = 0;
LABEL_126:

      goto LABEL_127;
    }
    v65 = v15;
    v61 = CFSTR("Frame Drops Reported:");
  }

  if (v15)
    goto LABEL_107;
  v19 = 0;
LABEL_127:
  if (a10)
  {
    a10->var0 = var0;
    a10->var1 = var1;
    a10->var2 = flags;
    a10->var3 = var3;
  }
  if (a11)
    *a11 = v101;

  return v19;
}

void __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke_cold_1(a1, v3);

  }
}

- (id)_TTRKeywordIDsFromCaptureRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "videoEncodingBehavior") == 2)
    objc_msgSend(v4, "addObject:", &unk_1EA3B1468);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if (v8)
        {
          objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v11 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CAMCaptureEngine _captureResultsQueue](self, "_captureResultsQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = v13;
  v21 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v13;
  v18 = v11;
  pl_dispatch_async();

}

void __92__CAMCaptureEngine_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  CAMUpdateCaptureButtonControlsCommand *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    v26 = v3;
    v27 = 2114;
    v28 = v4;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error url=%{public}@, error=%{public}@", buf, 0x16u);
  }

  objc_msgSend(a1[6], "_resultsQueueRequestsBeingRecorded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 138543362;
      v26 = v8;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine could not find CAMVideoCaptureRequest for url=%{public}@, using the current capture request", buf, 0xCu);
    }

    objc_msgSend(a1[7], "currentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[6], "_resultsQueueLastCompletedVideoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", a1[4]);

  if (v10)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v13 = a1[5];
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v13;
      v14 = "Skipping duplicate handling for %{public}@, %{public}@, %{public}@";
      v15 = v11;
      v16 = 32;
LABEL_14:
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!v6)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = a1[4];
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      v14 = "Finished recording for an unexpected video URL %{public}@";
      v15 = v11;
      v16 = 12;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v5, "removeObjectForKey:", a1[4]);
  objc_msgSend(a1[6], "_setResultsQueueLastCompletedVideoURL:", a1[4]);
  objc_msgSend(a1[6], "_resultsQueueLastCompletedVideoZoomFactor");
  objc_msgSend(a1[6], "_setResultsQueueLastCompletedVideoZoomFactor:", 0.0);
  dispatch_get_global_queue(2, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a1[7];
  v21 = a1[4];
  v22 = a1[8];
  v23 = v6;
  v24 = a1[5];
  pl_dispatch_async();

  v18 = -[CAMUpdateCaptureButtonControlsCommand initWithRecording:captureMode:devicePosition:]([CAMUpdateCaptureButtonControlsCommand alloc], "initWithRecording:captureMode:devicePosition:", 0, objc_msgSend(v23, "captureMode"), objc_msgSend(v23, "captureDevicePosition"));
  objc_msgSend(a1[6], "enqueueCommand:", v18);

LABEL_16:
}

uint64_t __92__CAMCaptureEngine_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke_283(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:forVideoCaptureRequest:videoZoomFactor:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)_subgraphQueueHandlePanoramaStatusNotification:(__CFString *)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF1260]))
  {
    -[CAMCaptureEngine _panoramaProcessor](self, "_panoramaProcessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__CAMCaptureEngine__subgraphQueueHandlePanoramaStatusNotification___block_invoke;
    v7[3] = &unk_1EA32E6B8;
    v8 = v5;
    v6 = v5;
    -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v7);

  }
}

void __67__CAMCaptureEngine__subgraphQueueHandlePanoramaStatusNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "panoramaRequestDidStartCapturing:", *(_QWORD *)(a1 + 32));
      v4 = v6;
    }
  }

}

- (void)_subgraphQueueHandlePanoramaWarningNotification:(__CFString *)a3
{
  NSObject *v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a3;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Received panorama warning %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (int64_t)_notificationForError:(__CFString *)a3
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF1298]))
    return -6000;
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF1308]))
    return -6001;
  return 0;
}

- (void)_subgraphQueueHandlePanoramaErrorNotification:(__CFString *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CAMCaptureEngine _subgraphQueueHandlePanoramaErrorNotification:].cold.1();

  -[CAMCaptureEngine _panoramaProcessor](self, "_panoramaProcessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMCaptureEngine _notificationForError:](self, "_notificationForError:", a3);
  if (v8)
  {
    v9 = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__CAMCaptureEngine__subgraphQueueHandlePanoramaErrorNotification___block_invoke;
    v10[3] = &unk_1EA32EB48;
    v11 = v7;
    v12 = v9;
    -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v10);

  }
}

void __66__CAMCaptureEngine__subgraphQueueHandlePanoramaErrorNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "panoramaRequest:didReceiveNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v4 = v6;
    }
  }

}

- (void)_sessionQueuePanoramaSetup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CAMCaptureEngine panoramaVideoDataOutput](self, "panoramaVideoDataOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "photoEncodingBehavior");
  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  pl_dispatch_async();

  -[CAMCaptureEngine panoramaVideoDataOutput](self, "panoramaVideoDataOutput", v8, 3221225472, __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke, &unk_1EA328B18, self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSampleBufferDelegate:queue:", self, v7);

}

void __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_panoramaSubgraphQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke_2;
  v5[3] = &unk_1EA32EB98;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = &v10;
  v5[6] = &v6;
  v5[7] = v3;
  dispatch_sync(v2, v5);

  objc_msgSend(*(id *)(a1 + 32), "_notifyServicesOfPanoramaConfigurationChangeWithImageQueue:direction:", v11[3], v7[3]);
  v4 = (const void *)v11[3];
  if (v4)
    CFRelease(v4);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  __CFNotificationCenter *LocalCenter;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_powerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAssertionForIndentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "_panoramaAssertionIdentifier"), 8);

  }
  objc_msgSend(*(id *)(a1 + 32), "_subgraphQueueCreatePanoramaProcessorIfNecessaryWithEncodingBehavior:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_subgraphQueueCreatePanoramaImageQueueIfNecessary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_panoramaImageQueue");
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4)
    CFRetain(v4);
  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "direction");
  v5 = *(const void **)(a1 + 32);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x1E0CF12F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x1E0CF1310], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x1E0CF1270], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)_subgraphQueueCreatePanoramaProcessorIfNecessaryWithEncodingBehavior:(int64_t)a3
{
  CAMPanoramaProcessor *v4;
  CAMPanoramaProcessor *panoramaProcessor;

  if (!self->__panoramaProcessor)
  {
    v4 = -[CAMPanoramaProcessor initWithDelegate:encodingBehavior:]([CAMPanoramaProcessor alloc], "initWithDelegate:encodingBehavior:", self, a3);
    panoramaProcessor = self->__panoramaProcessor;
    self->__panoramaProcessor = v4;

  }
}

- (void)_subgraphQueueCreatePanoramaImageQueueIfNecessary
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a1, v5, "Failed to create a panorama image queue because ACT returned a panorama size of %{public}@", v6);

  OUTLINED_FUNCTION_1();
}

- (void)changeToPanoramaDirection:(int64_t)a3
{
  void *v3;

  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

void __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__24;
  v8 = __Block_byref_object_dispose__24;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_panoramaSubgraphQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke_2;
  v3[3] = &unk_1EA32C0D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = &v4;
  dispatch_sync(v2, v3);

  objc_msgSend((id)v5[5], "setDirection:", *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v4, 8);

}

void __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)changePanoramaEncodingBehaviorIfNeeded:(int64_t)a3
{
  void *v3;

  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

void __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[6];

  objc_msgSend(*(id *)(a1 + 32), "_panoramaSubgraphQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_2;
  v4[3] = &unk_1EA328B18;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  dispatch_sync(v2, v4);

}

void __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "photoEncodingBehavior") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_captureSessionQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

uint64_t __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sessionQueuePanoramaTeardown");
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueuePanoramaSetup");
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMCaptureEngine _destroyAccidentalLaunchTimer](self, "_destroyAccidentalLaunchTimer");
  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  pl_dispatch_async();

}

void __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__24;
  v8 = __Block_byref_object_dispose__24;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_panoramaSubgraphQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke_2;
  v3[3] = &unk_1EA32C0D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = &v4;
  dispatch_sync(v2, v3);

  objc_msgSend((id)v5[5], "startPanoramaCaptureWithRequest:", *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v4, 8);

}

void __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)stopPanoramaCaptureInterrupted:(BOOL)a3
{
  void *v3;

  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

uint64_t __51__CAMCaptureEngine_stopPanoramaCaptureInterrupted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  BOOL v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[CAMCaptureEngine _panoramaSampleBufferQueue](self, "_panoramaSampleBufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__24;
  v24 = __Block_byref_object_dispose__24;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  v19 = 0;
  -[CAMCaptureEngine _panoramaSubgraphQueue](self, "_panoramaSubgraphQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke;
  block[3] = &unk_1EA32E348;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v20;
  dispatch_sync(v6, block);

  if (objc_msgSend((id)v15[5], "isCapturingPanorama"))
  {
    objc_msgSend((id)v15[5], "stopPanoramaCapture");
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_2;
    v11[3] = &unk_1EA32EBE0;
    v11[4] = &v20;
    v12 = a3;
    -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v11);
    v8 = (void *)v15[5];
    v9 = v21[5];
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_3;
    v10[3] = &unk_1EA32EC30;
    v10[4] = self;
    v10[5] = &v20;
    objc_msgSend(v8, "processPanoramaCaptureWithRequest:completionHandler:", v9, v10);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "request");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "panoramaRequestDidStopCapturing:interrupted:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(unsigned __int8 *)(a1 + 40));
      v4 = v6;
    }
  }

}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_4;
  v7[3] = &unk_1EA32EC08;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "_enumerateCaptureServicesUsingBlock:", v7);

}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "panoramaRequest:didCompleteCaptureWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

}

- (void)panoramaProcessor:(id)a3 didProcessSampleBuffer:(opaqueCMSampleBuffer *)a4 withStatus:(int)a5 forRequest:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v14;
  const __CFDictionary *v15;
  void *Value;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  CGSize v21;
  const __CFDictionary *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  CAMPanoramaPaintingStatus *v28;
  CAMPanoramaPaintingStatus *v29;
  id v30;
  CAMPanoramaPaintingStatus *v31;
  NSObject *v32;
  NSObject *v33;
  double v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  CAMPanoramaPaintingStatus *v47;
  CGRect rect;
  _QWORD block[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v9 = a3;
  v10 = a6;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  -[CAMCaptureEngine _panoramaSubgraphQueue](self, "_panoramaSubgraphQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke;
  block[3] = &unk_1EA32C0D8;
  block[4] = self;
  block[5] = &v50;
  dispatch_sync(v11, block);

  if (v51[3])
    CAImageQueueCollect();
  if (a4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    v14 = ImageBuffer;
    if (ImageBuffer)
    {
      if (CVPixelBufferGetIOSurface(ImageBuffer) && v51[3] && CAImageQueueRegisterIOSurfaceBuffer())
        CAImageQueueInsertImage();
      v15 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, 1u);
      Value = (void *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CF12F0]);
      if (Value)
        v17 = objc_msgSend(Value, "integerValue");
      else
        v17 = 0;
      +[CAMPanoramaConfiguration sharedInstance](CAMPanoramaConfiguration, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "sampleBufferWidth");

      if (v19)
        v20 = (double)v17 / (double)v19;
      else
        v20 = 0.0;
      v21 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      rect.size = v21;
      v22 = (const __CFDictionary *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CF12B8]);
      if (v22)
        CGRectMakeWithDictionaryRepresentation(v22, &rect);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scale");
      v34 = 1.0 / v24;

      rect.origin = (CGPoint)vmulq_n_f64((float64x2_t)rect.origin, v34);
      rect.size = (CGSize)vmulq_n_f64((float64x2_t)rect.size, v34);
      v25 = (void *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CF12C8]);
      if (v25)
      {
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
      }
      else
      {
        v27 = 0.0;
      }
      v28 = [CAMPanoramaPaintingStatus alloc];
      v29 = -[CAMPanoramaPaintingStatus initWithSpeed:cropRectangle:normalizedBaselineOffset:](v28, "initWithSpeed:cropRectangle:normalizedBaselineOffset:", v27, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v20);
      v30 = MEMORY[0x1E0C80D38];
      v42 = v12;
      v43 = 3221225472;
      v44 = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_2;
      v45 = &unk_1EA328A40;
      v46 = v10;
      v31 = v29;
      v47 = v31;
      pl_dispatch_async();

      CFRelease(v15);
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__24;
      v40 = __Block_byref_object_dispose__24;
      v41 = 0;
      -[CAMCaptureEngine _panoramaFirstImageQueueUpdateSemaphoreQueue](self, "_panoramaFirstImageQueueUpdateSemaphoreQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v35[0] = v12;
      v35[1] = 3221225472;
      v35[2] = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_3;
      v35[3] = &unk_1EA32C0D8;
      v35[4] = self;
      v35[5] = &v36;
      dispatch_sync(v32, v35);

      v33 = v37[5];
      if (v33)
        dispatch_semaphore_signal(v33);
      _Block_object_dispose(&v36, 8);

    }
  }
  _Block_object_dispose(&v50, 8);

}

uint64_t __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_panoramaImageQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_2(uint64_t a1)
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
      objc_msgSend(v5, "panoramaRequest:didGeneratePaintingStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

void __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaFirstImageQueueUpdateSemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    -[CAMCaptureEngine _effectsPreviewSampleBufferQueue](self, "_effectsPreviewSampleBufferQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    pl_dispatch_async();

  }
}

uint64_t __63__CAMCaptureEngine_registerEffectsPreviewSampleBufferDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 384);
    *(_QWORD *)(v4 + 384) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    -[CAMCaptureEngine _effectsPreviewSampleBufferQueue](self, "_effectsPreviewSampleBufferQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    pl_dispatch_async();

  }
}

uint64_t __65__CAMCaptureEngine_unregisterEffectsPreviewSampleBufferDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)registerVideoThumbnailContentsDelegate:(id)a3
{
  id v4;
  NSHashTable *videoThumbnailContentsDelegates;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    videoThumbnailContentsDelegates = self->__videoThumbnailContentsDelegates;
    v8 = v4;
    if (!videoThumbnailContentsDelegates)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->__videoThumbnailContentsDelegates;
      self->__videoThumbnailContentsDelegates = v6;

      videoThumbnailContentsDelegates = self->__videoThumbnailContentsDelegates;
    }
    -[NSHashTable addObject:](videoThumbnailContentsDelegates, "addObject:", v8);
    v4 = v8;
  }

}

- (void)unregisterVideoThumbnailContentsDelegate:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->__videoThumbnailContentsDelegates, "removeObject:");
}

- (void)videoThumbnailOutput:(id)a3 willBeginRenderingThumbnailsWithContents:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  pl_dispatch_async();

}

void __82__CAMCaptureEngine_videoThumbnailOutput_willBeginRenderingThumbnailsWithContents___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_videoThumbnailContentsDelegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "videoThumbnailOutputWillBeginRenderingThumbnailsWithContents:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)videoThumbnailOutputWillEndRenderingThumbnails:(id)a3
{
  pl_dispatch_async();
}

void __67__CAMCaptureEngine_videoThumbnailOutputWillEndRenderingThumbnails___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_videoThumbnailContentsDelegates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "videoThumbnailOutputWillEndRenderingThumbnails");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  CAMPanoramaOutput *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (CAMPanoramaOutput *)a3;
  v9 = a5;
  if (self->_panoramaVideoDataOutput == v8)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__24;
    v25 = __Block_byref_object_dispose__24;
    v26 = 0;
    -[CAMCaptureEngine _panoramaSubgraphQueue](self, "_panoramaSubgraphQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__CAMCaptureEngine_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    block[3] = &unk_1EA32C0D8;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(v14, block);

    if (a4)
    {
      v15 = (void *)v22[5];
      if (v15)
        objc_msgSend(v15, "processSampleBuffer:", a4);
    }
    _Block_object_dispose(&v21, 8);

  }
  else if ((CAMPanoramaOutput *)self->_effectsPreviewVideoDataOutput == v8)
  {
    -[CAMCaptureEngine _effectsPreviewSampleBufferDelegates](self, "_effectsPreviewSampleBufferDelegates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "effectsPreviewVideoDataOutputDidOutputSampleBuffer:", a4);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      }
      while (v11);
    }

  }
}

void __71__CAMCaptureEngine_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_panoramaProcessor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_effectsPreviewVideoDataOutput == a3)
  {
    -[CAMCaptureEngine _effectsPreviewSampleBufferDelegates](self, "_effectsPreviewSampleBufferDelegates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "effectsPreviewVideoDataOutputDidDropSampleBuffer:", a4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  -[CAMCaptureEngine currentCameraDevice](self, "currentCameraDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__CAMCaptureEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
  v15[3] = &unk_1EA32EC58;
  v16 = v8;
  v17 = v9;
  v18 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  -[CAMCaptureEngine _enumerateCaptureServicesUsingBlock:](self, "_enumerateCaptureServicesUsingBlock:", v15);

}

void __97__CAMCaptureEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "metadataWasRecognized:forMetadataObjectTypes:deviceFormat:", a1[4], a1[5], a1[6]);

}

- (id)frontCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89FA0], 2);
}

- (id)frontPearlCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F90], 2);
}

- (id)frontSuperWideCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F98], 2);
}

- (id)backTelephotoCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F78], 1);
}

- (id)backDualCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F58], 1);
}

- (id)backSuperWideCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F98], 1);
}

- (id)backWideDualCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F60], 1);
}

- (id)backTripleCameraDevice
{
  return -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", *MEMORY[0x1E0C89F88], 1);
}

+ (id)_cacheKeyForDeviceType:(id)a3 position:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %ld"), a3, a4);
}

- (id)_captureEngineDeviceForDeviceType:(id)a3 position:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v12;
  int v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  CAMCaptureEngine *v21;
  int64_t v22;

  v6 = a3;
  -[CAMCaptureEngine _captureEngineDeviceCache](self, "_captureEngineDeviceCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cacheKeyForDeviceType:position:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "featureDevelopmentEmulateSuperWide");

  if (v10)
  {
    if ((id)*MEMORY[0x1E0C89F88] == v6 || *MEMORY[0x1E0C89F60] == (_QWORD)v6)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isBackDualSupported");

      v14 = (id *)MEMORY[0x1E0C89FA0];
      if (v13)
        v14 = (id *)MEMORY[0x1E0C89F58];
      goto LABEL_12;
    }
    if ((id)*MEMORY[0x1E0C89F98] == v6)
    {
      v14 = (id *)MEMORY[0x1E0C89FA0];
LABEL_12:
      v15 = *v14;

      v6 = v15;
    }
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke;
  v19[3] = &unk_1EA32EC80;
  v21 = self;
  v22 = a4;
  v20 = v6;
  v16 = v6;
  objc_msgSend(v7, "objectForKey:memoizationBlock:", v8, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

CAMCaptureEngineDevice *__63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  CAMCaptureEngineDevice *v5;
  NSObject *v6;

  v2 = (_QWORD *)(a1 + 32);
  v3 = (_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithDeviceType:mediaType:position:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C8A808], *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[CAMCaptureEngineDevice initWithEngine:captureDevice:]([CAMCaptureEngineDevice alloc], "initWithEngine:captureDevice:", *(_QWORD *)(a1 + 40), v4);
    if (objc_msgSend(*(id *)(a1 + 40), "areManagedDevicesLockedForConfiguration"))
      objc_msgSend(*(id *)(a1 + 40), "_lockManagedCapturedDevice:", v4);
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke_cold_1(v2, v3, v6);

    v5 = 0;
  }

  return v5;
}

- (id)systemPreferredCameraDevice
{
  void *v3;
  CAMCaptureEngineDevice *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0C8B0A0], "systemPreferredCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CAMCaptureEngineDevice initWithEngine:captureDevice:]([CAMCaptureEngineDevice alloc], "initWithEngine:captureDevice:", self, v3);
    if (-[CAMCaptureEngine areManagedDevicesLockedForConfiguration](self, "areManagedDevicesLockedForConfiguration"))
      -[CAMCaptureEngine _lockManagedCapturedDevice:](self, "_lockManagedCapturedDevice:", v3);
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CAMCaptureEngine systemPreferredCameraDevice].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)audioCaptureDevice
{
  AVCaptureDevice *audioCameraDevice;
  void *v4;
  AVCaptureDevice *v5;
  AVCaptureDevice *v6;

  audioCameraDevice = self->_audioCameraDevice;
  if (!audioCameraDevice)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v5 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
    v6 = self->_audioCameraDevice;
    self->_audioCameraDevice = v5;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);
    if (-[CAMCaptureEngine areManagedDevicesLockedForConfiguration](self, "areManagedDevicesLockedForConfiguration"))
      -[CAMCaptureEngine _lockManagedCapturedDevice:](self, "_lockManagedCapturedDevice:", self->_audioCameraDevice);

    audioCameraDevice = self->_audioCameraDevice;
  }
  return audioCameraDevice;
}

- (id)audioCaptureDeviceInput
{
  AVCaptureDeviceInput *audioCaptureDeviceInput;
  void *v5;
  void *v6;
  void *v7;
  AVCaptureDeviceInput *v8;
  AVCaptureDeviceInput *v9;
  AVCaptureDeviceInput *v10;
  id v11;
  AVCaptureDeviceInput *v12;
  NSObject *v13;
  id v15;

  audioCaptureDeviceInput = self->_audioCaptureDeviceInput;
  if (!audioCaptureDeviceInput)
  {
    -[CAMCaptureEngine audioCaptureDevice](self, "audioCaptureDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v6);
    objc_msgSend(v5, "deviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine prewarmedAudioDeviceInput:device:](self, "prewarmedAudioDeviceInput:device:", v7, v5);
    v8 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
    v9 = self->_audioCaptureDeviceInput;
    self->_audioCaptureDeviceInput = v8;

    if (!self->_audioCaptureDeviceInput)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0C8B0B0], "deviceInputWithDevice:error:", v5, &v15);
      v10 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      v12 = self->_audioCaptureDeviceInput;
      self->_audioCaptureDeviceInput = v10;

      if (v11)
      {
        v13 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CAMCaptureEngine audioCaptureDeviceInput].cold.1();

      }
    }
    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v6);

    audioCaptureDeviceInput = self->_audioCaptureDeviceInput;
  }
  return audioCaptureDeviceInput;
}

- (id)movieFileOutput
{
  CAMCaptureMovieFileOutput *movieFileOutput;
  void *v4;
  CAMCaptureMovieFileOutput *v5;
  CAMCaptureMovieFileOutput *v6;

  movieFileOutput = self->_movieFileOutput;
  if (!movieFileOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = -[CAMCaptureMovieFileOutput initWithEngine:]([CAMCaptureMovieFileOutput alloc], "initWithEngine:", self);
    v6 = self->_movieFileOutput;
    self->_movieFileOutput = v5;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);
    movieFileOutput = self->_movieFileOutput;
  }
  return movieFileOutput;
}

- (id)effectsPreviewVideoDataOutput
{
  AVCaptureVideoDataOutput *effectsPreviewVideoDataOutput;
  void *v4;
  AVCaptureVideoDataOutput *v5;
  AVCaptureVideoDataOutput *v6;

  effectsPreviewVideoDataOutput = self->_effectsPreviewVideoDataOutput;
  if (!effectsPreviewVideoDataOutput)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    v5 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x1E0C8B168]);
    v6 = self->_effectsPreviewVideoDataOutput;
    self->_effectsPreviewVideoDataOutput = v5;

    -[AVCaptureVideoDataOutput setAlwaysDiscardsLateVideoFrames:](self->_effectsPreviewVideoDataOutput, "setAlwaysDiscardsLateVideoFrames:", 1);
    -[AVCaptureVideoDataOutput setVideoSettings:](self->_effectsPreviewVideoDataOutput, "setVideoSettings:", 0);
    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4);

    effectsPreviewVideoDataOutput = self->_effectsPreviewVideoDataOutput;
  }
  return effectsPreviewVideoDataOutput;
}

- (BOOL)controlsSupported
{
  return -[AVCaptureSession areControlsSupported](self->__captureSession, "areControlsSupported");
}

- (id)systemStylePicker
{
  AVCaptureSystemStylePicker *systemStylePicker;
  AVCaptureSystemStylePicker *v4;
  AVCaptureSystemStylePicker *v5;

  systemStylePicker = self->_systemStylePicker;
  if (!systemStylePicker)
  {
    -[CAMCaptureEngine stylePickerIncludingSystemStyles:resolvedSystemStyle:creativeStyles:](self, "stylePickerIncludingSystemStyles:resolvedSystemStyle:creativeStyles:", 1, 0, 0);
    v4 = (AVCaptureSystemStylePicker *)objc_claimAutoreleasedReturnValue();
    v5 = self->_systemStylePicker;
    self->_systemStylePicker = v4;

    systemStylePicker = self->_systemStylePicker;
  }
  return systemStylePicker;
}

- (id)creativeStylePicker
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  AVCaptureSystemStylePicker *creativeStylePicker;
  AVCaptureSystemStylePicker *v9;
  AVCaptureSystemStylePicker *v10;
  AVCaptureSystemStylePicker *v11;
  AVCaptureSystemStylePicker *v12;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowSystemSmartStylesInPicker");

  +[CAMSmartStyleUtilities readAVCaptureSystemStyle](CAMSmartStyleUtilities, "readAVCaptureSystemStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureSmartStyle cast](self->_cachedSystemStyleForCreativeStylePicker, "cast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7 && (objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    creativeStylePicker = self->_creativeStylePicker;
    self->_creativeStylePicker = 0;

  }
  v9 = self->_creativeStylePicker;
  if (!v9)
  {
    -[CAMCaptureEngine stylePickerIncludingSystemStyles:resolvedSystemStyle:creativeStyles:](self, "stylePickerIncludingSystemStyles:resolvedSystemStyle:creativeStyles:", v4, v5, 1);
    v10 = (AVCaptureSystemStylePicker *)objc_claimAutoreleasedReturnValue();
    v11 = self->_creativeStylePicker;
    self->_creativeStylePicker = v10;

    objc_storeStrong((id *)&self->_cachedSystemStyleForCreativeStylePicker, v5);
    v9 = self->_creativeStylePicker;
  }
  v12 = v9;

  return v12;
}

- (id)stylePickerIncludingSystemStyles:(BOOL)a3 resolvedSystemStyle:(id)a4 creativeStyles:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v25[4];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v6 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D098], "defaultStylesIncludingSystemStyles:systemStylePlaceholder:creativeStyles:", v6, v7 != 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v15, "presetType"))
        {
          if (v7)
          {
            v16 = objc_msgSend(v15, "presetType");
            if (v16 == objc_msgSend(v8, "presetType"))
              continue;
          }
          +[CAMCaptureConversions AVCaptureSmartStyleForCEKSmartStyle:](CAMCaptureConversions, "AVCaptureSmartStyleForCEKSmartStyle:", v15);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = v7;
        }
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v10, "addObject:", v17);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  -[CAMCaptureEngine _captureSession](self, "_captureSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngine _captureController](self, "_captureController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v20);

  v21 = objc_alloc(MEMORY[0x1E0C8B150]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__CAMCaptureEngine_stylePickerIncludingSystemStyles_resolvedSystemStyle_creativeStyles___block_invoke;
  v25[3] = &unk_1EA32ECA8;
  objc_copyWeak(&v26, &location);
  v22 = (void *)objc_msgSend(v21, "initWithSession:styles:action:", v19, v10, v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v22;
}

void __88__CAMCaptureEngine_stylePickerIncludingSystemStyles_resolvedSystemStyle_creativeStyles___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:receivedOverlayChangeSmartStyle:", WeakRetained, v4);

}

- (id)toneBiasSlider
{
  AVCaptureSystemStyleSlider *toneBiasSlider;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  AVCaptureSystemStyleSlider *v8;
  AVCaptureSystemStyleSlider *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  toneBiasSlider = self->_toneBiasSlider;
  if (!toneBiasSlider)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    -[CAMCaptureEngine _captureSession](self, "_captureSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine _captureController](self, "_captureController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);

    v7 = objc_alloc(MEMORY[0x1E0C8B158]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __34__CAMCaptureEngine_toneBiasSlider__block_invoke;
    v14 = &unk_1EA32ECA8;
    objc_copyWeak(&v15, &location);
    v8 = (AVCaptureSystemStyleSlider *)objc_msgSend(v7, "initWithSession:parameter:action:", v5, 2, &v11);
    v9 = self->_toneBiasSlider;
    self->_toneBiasSlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    toneBiasSlider = self->_toneBiasSlider;
  }
  return toneBiasSlider;
}

void __34__CAMCaptureEngine_toneBiasSlider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:receivedOverlayUpdateSmartStyle:", WeakRetained, v4);

}

- (id)colorBiasSlider
{
  AVCaptureSystemStyleSlider *colorBiasSlider;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  AVCaptureSystemStyleSlider *v8;
  AVCaptureSystemStyleSlider *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  colorBiasSlider = self->_colorBiasSlider;
  if (!colorBiasSlider)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    -[CAMCaptureEngine _captureSession](self, "_captureSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine _captureController](self, "_captureController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);

    v7 = objc_alloc(MEMORY[0x1E0C8B158]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __35__CAMCaptureEngine_colorBiasSlider__block_invoke;
    v14 = &unk_1EA32ECA8;
    objc_copyWeak(&v15, &location);
    v8 = (AVCaptureSystemStyleSlider *)objc_msgSend(v7, "initWithSession:parameter:action:", v5, 1, &v11);
    v9 = self->_colorBiasSlider;
    self->_colorBiasSlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    colorBiasSlider = self->_colorBiasSlider;
  }
  return colorBiasSlider;
}

void __35__CAMCaptureEngine_colorBiasSlider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:receivedOverlayUpdateSmartStyle:", WeakRetained, v4);

}

- (id)intensitySlider
{
  AVCaptureSystemStyleSlider *intensitySlider;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  AVCaptureSystemStyleSlider *v8;
  AVCaptureSystemStyleSlider *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  intensitySlider = self->_intensitySlider;
  if (!intensitySlider)
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    -[CAMCaptureEngine _captureSession](self, "_captureSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureEngine _captureController](self, "_captureController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);

    v7 = objc_alloc(MEMORY[0x1E0C8B158]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __35__CAMCaptureEngine_intensitySlider__block_invoke;
    v14 = &unk_1EA32ECA8;
    objc_copyWeak(&v15, &location);
    v8 = (AVCaptureSystemStyleSlider *)objc_msgSend(v7, "initWithSession:parameter:action:", v5, 0, &v11);
    v9 = self->_intensitySlider;
    self->_intensitySlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    intensitySlider = self->_intensitySlider;
  }
  return intensitySlider;
}

void __35__CAMCaptureEngine_intensitySlider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureController:receivedOverlayUpdateSmartStyle:", WeakRetained, v4);

}

- (id)apertureSlider
{
  return self->_apertureSlider;
}

- (id)emulatedZoomSlider
{
  return self->_emulatedZoomSlider;
}

- (void)_ensureApertureSliderForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  AVCaptureSlider *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  AVCaptureSlider *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  OS_dispatch_queue *captureSessionQueue;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, float);
  void *v32;
  id v33;
  id location;

  v4 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDepthEffectApertureSupported"))
  {
    v6 = self->_apertureSlider;
    v7 = objc_msgSend(v4, "mode");
    v8 = objc_msgSend(v4, "device");
    if ((unint64_t)(v8 - 1) > 0xA)
      v9 = 0;
    else
      v9 = qword_1DB9A7B20[v8 - 1];
    if (objc_msgSend(v5, "isDepthEffectApertureSupportedForMode:devicePosition:", v7, v9))
    {
      v10 = v7;
    }
    else
    {
      v8 = 0;
      v10 = 0;
    }
    objc_msgSend(v5, "minimumDepthEffectApertureForMode:device:", v10, v8);
    v12 = v11;
    objc_msgSend(v5, "maximumDepthEffectApertureForMode:device:", v10, v8);
    v14 = v13;
    v15 = objc_msgSend(MEMORY[0x1E0D0D020], "indexOfClosestValidValueForAperture:", v12);
    v16 = objc_msgSend(MEMORY[0x1E0D0D020], "indexOfClosestValidValueForAperture:", v14) - v15 + 1;
    objc_msgSend(MEMORY[0x1E0D0D020], "validApertureValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subarrayWithRange:", v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "defaultZoomFactorForGraphConfiguration:captureOrientation:customLens:outputToExternalStorage:overrodeWithForcedZoomValue:", v4, 1, 0, 0, 0);
    objc_msgSend(v5, "defaultDepthEffectApertureForMode:device:zoomFactor:", v10, v8);
    v20 = v19;
    if (v6 && (objc_msgSend(v18, "isEqualToArray:", self->_apertureSliderValues) & 1) != 0)
    {
      v22 = v6;
    }
    else
    {
      -[CAMCaptureEngine _captureController](self, "_captureController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v23);

      v24 = objc_alloc(MEMORY[0x1E0C8B110]);
      CAMLocalizedFrameworkString(CFSTR("CAMERA_OVERLAY_APERTURE_SLIDER_TITLE"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (AVCaptureSlider *)objc_msgSend(v24, "initWithLocalizedTitle:symbolName:values:", v25, CFSTR("f.cursive"), v18);

      CAMLocalizedFrameworkString(CFSTR("CAMERA_OVERLAY_APERTURE_SLIDER_VALUE_FORMAT"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureSlider setValueFormat:](v22, "setValueFormat:", v26);

      captureSessionQueue = self->__captureSessionQueue;
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke;
      v32 = &unk_1EA328FA8;
      objc_copyWeak(&v33, &location);
      -[AVCaptureSlider setActionQueue:action:](v22, "setActionQueue:action:", captureSessionQueue, &v29);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    *(float *)&v21 = v20;
    -[AVCaptureSlider setValue:](v22, "setValue:", v21, v29, v30, v31, v32);
    -[AVCaptureSlider setProminentValues:](v22, "setProminentValues:", &unk_1EA3B3A70);
    if (v22 != self->_apertureSlider)
    {
      NSStringFromSelector(sel_apertureSlider);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCaptureEngine willChangeValueForKey:](self, "willChangeValueForKey:", v28);
      objc_storeStrong((id *)&self->_apertureSlider, v22);
      objc_storeStrong((id *)&self->_apertureSliderValues, v18);
      -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v28);

    }
  }

}

void __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke(uint64_t a1, float a2)
{
  _QWORD v3[4];
  id v4;
  float v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke_2;
  v3[3] = &unk_1EA3296A8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controlsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v2, "captureController:receivedOverlaySimulatedAperture:", WeakRetained, v3);

}

- (void)ensureControlsForGraphConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  -[CAMCaptureEngine _ensureEmulatedZoomSliderForGraphConfiguration:](self, "_ensureEmulatedZoomSliderForGraphConfiguration:", v4);
  -[CAMCaptureEngine _ensureApertureSliderForGraphConfiguration:](self, "_ensureApertureSliderForGraphConfiguration:", v4);

}

- (void)_ensureEmulatedZoomSliderForGraphConfiguration:(id)a3
{
  id v4;
  AVCaptureSlider *emulatedZoomSlider;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  AVCaptureSlider *v19;
  AVCaptureSlider *v20;
  id v21;

  v4 = a3;
  emulatedZoomSlider = self->_emulatedZoomSlider;
  if (emulatedZoomSlider)
  {
    self->_emulatedZoomSlider = 0;

  }
  v21 = 0;
  v6 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", objc_msgSend(v4, "mode"), objc_msgSend(v4, "device"), objc_msgSend(v4, "videoConfiguration"), objc_msgSend(v4, "videoStabilizationStrength"), &v21, 0);
  v7 = v21;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    objc_msgSend(v8, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    v15 = objc_alloc(MEMORY[0x1E0C8B110]);
    CAMLocalizedFrameworkString(CFSTR("ZOOM"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v11;
    LODWORD(v18) = v14;
    v19 = (AVCaptureSlider *)objc_msgSend(v15, "initWithLocalizedTitle:symbolName:minValue:maxValue:", v16, CFSTR("magnifyingglass"), v17, v18);
    v20 = self->_emulatedZoomSlider;
    self->_emulatedZoomSlider = v19;

    -[AVCaptureSlider setProminentValues:](self->_emulatedZoomSlider, "setProminentValues:", v8);
    -[AVCaptureSlider setActionQueue:action:](self->_emulatedZoomSlider, "setActionQueue:action:", MEMORY[0x1E0C80D38], &__block_literal_global_346);
  }

}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  -[CAMCaptureEngine _captureController](self, "_captureController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CAMCaptureEngine_sessionControlsDidBecomeActive___block_invoke;
  block[3] = &unk_1EA328868;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__CAMCaptureEngine_sessionControlsDidBecomeActive___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedOverlayVisible:", *(_QWORD *)(a1 + 32), 1);

}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  -[CAMCaptureEngine _captureController](self, "_captureController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CAMCaptureEngine_sessionControlsDidBecomeInactive___block_invoke;
  block[3] = &unk_1EA328868;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__CAMCaptureEngine_sessionControlsDidBecomeInactive___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedOverlayVisible:", *(_QWORD *)(a1 + 32), 0);

}

- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  -[CAMCaptureEngine _captureController](self, "_captureController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CAMCaptureEngine_sessionControlsWillEnterFullscreenAppearance___block_invoke;
  block[3] = &unk_1EA328868;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__CAMCaptureEngine_sessionControlsWillEnterFullscreenAppearance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedQuietUIActive:", *(_QWORD *)(a1 + 32), 1);

}

- (void)sessionControlsWillExitFullscreenAppearance:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  -[CAMCaptureEngine _captureController](self, "_captureController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CAMCaptureEngine_sessionControlsWillExitFullscreenAppearance___block_invoke;
  block[3] = &unk_1EA328868;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__CAMCaptureEngine_sessionControlsWillExitFullscreenAppearance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedQuietUIActive:", *(_QWORD *)(a1 + 32), 0);

}

- (void)session:(id)a3 didChangeActiveControl:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v5 = a4;
  -[CAMCaptureEngine _captureController](self, "_captureController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMCaptureEngine creativeStylePicker](self, "creativeStylePicker");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v5)
    {
      v12 = 1;
    }
    else
    {
      -[CAMCaptureEngine systemStylePicker](self, "systemStylePicker");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v5)
      {
        v12 = 1;
      }
      else
      {
        -[CAMCaptureEngine intensitySlider](self, "intensitySlider");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 == v5)
        {
          v12 = 1;
        }
        else
        {
          -[CAMCaptureEngine colorBiasSlider](self, "colorBiasSlider");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10 == v5)
          {
            v12 = 1;
          }
          else
          {
            -[CAMCaptureEngine toneBiasSlider](self, "toneBiasSlider");
            v11 = (id)objc_claimAutoreleasedReturnValue();
            v12 = v11 == v5;

          }
        }

      }
    }

  }
  else
  {
    v12 = 0;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__CAMCaptureEngine_session_didChangeActiveControl___block_invoke;
  v14[3] = &unk_1EA328908;
  v15 = v6;
  v16 = v12;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __51__CAMCaptureEngine_session_didChangeActiveControl___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedOverlayStyleControlActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)captureEngineDevice:(id)a3 didChangeSystemExposureTargetBias:(float)a4
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  float v9;

  -[CAMCaptureEngine _captureController](self, "_captureController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CAMCaptureEngine_captureEngineDevice_didChangeSystemExposureTargetBias___block_invoke;
  v7[3] = &unk_1EA32D5F8;
  v8 = v5;
  v9 = a4;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __74__CAMCaptureEngine_captureEngineDevice_didChangeSystemExposureTargetBias___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controlsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureController:receivedSystemOverlayUpdateExposureBias:", *(_QWORD *)(a1 + 32), *(float *)(a1 + 40));

}

- (OS_dispatch_queue)_captureResultsQueue
{
  return self->__captureResultsQueue;
}

- (AVCaptureVideoPreviewLayer)_videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

- (AVSpatialOverCaptureVideoPreviewLayer)_overCaptureVideoPreviewLayer
{
  return self->__overCaptureVideoPreviewLayer;
}

- (CUCaptureController)_captureController
{
  return (CUCaptureController *)objc_loadWeakRetained((id *)&self->__captureController);
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (unsigned)_panoramaAssertionIdentifier
{
  return self->__panoramaAssertionIdentifier;
}

- (void)_setPanoramaAssertionIdentifier:(unsigned int)a3
{
  self->__panoramaAssertionIdentifier = a3;
}

- (AVCaptureDevice)currentCameraDevice
{
  return self->_currentCameraDevice;
}

- (void)setCurrentCameraDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentCameraDevice, a3);
}

- (AVCapturePhotoOutput)currentStillImageOutput
{
  return self->_currentStillImageOutput;
}

- (void)setCurrentStillImageOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentStillImageOutput, a3);
}

- (NSMutableDictionary)_resultsQueueRegisteredStillImageRequests
{
  return self->__resultsQueueRegisteredStillImageRequests;
}

- (NSMutableSet)_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue
{
  return self->__resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue;
}

- (NSMutableDictionary)_sessionQueueCachedPhotoInitiationSettings
{
  return self->__sessionQueueCachedPhotoInitiationSettings;
}

- (NSMutableDictionary)_resultsQueueRequestsBeingRecorded
{
  return self->__resultsQueueRequestsBeingRecorded;
}

- (NSURL)_resultsQueueLastCompletedVideoURL
{
  return self->__resultsQueueLastCompletedVideoURL;
}

- (void)_setResultsQueueLastCompletedVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->__resultsQueueLastCompletedVideoURL, a3);
}

- (double)_resultsQueueLastCompletedVideoZoomFactor
{
  return self->__resultsQueueLastCompletedVideoZoomFactor;
}

- (void)_setResultsQueueLastCompletedVideoZoomFactor:(double)a3
{
  self->__resultsQueueLastCompletedVideoZoomFactor = a3;
}

- (_CAImageQueue)_panoramaImageQueue
{
  return self->__panoramaImageQueue;
}

- (OS_dispatch_semaphore)_panoramaFirstImageQueueUpdateSemaphore
{
  return self->__panoramaFirstImageQueueUpdateSemaphore;
}

- (void)_setPanoramaFirstImageQueueUpdateSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->__panoramaFirstImageQueueUpdateSemaphore, a3);
}

- (OS_dispatch_queue)_panoramaFirstImageQueueUpdateSemaphoreQueue
{
  return self->__panoramaFirstImageQueueUpdateSemaphoreQueue;
}

- (OS_dispatch_queue)_effectsPreviewSurfaceFilteringQueue
{
  return self->__effectsPreviewSurfaceFilteringQueue;
}

- (CIContext)_effectsPreviewSurfaceFilteringContext
{
  return self->__effectsPreviewSurfaceFilteringContext;
}

- (OS_dispatch_queue)_effectsPreviewSampleBufferQueue
{
  return self->__effectsPreviewSampleBufferQueue;
}

- (NSHashTable)_effectsPreviewSampleBufferDelegates
{
  return self->__effectsPreviewSampleBufferDelegates;
}

- (NSHashTable)_videoThumbnailContentsDelegates
{
  return self->__videoThumbnailContentsDelegates;
}

- (void)_setPerformingRecovery:(BOOL)a3
{
  self->__performingRecovery = a3;
}

- (unint64_t)_numberOfRecoveryAttempts
{
  return self->__numberOfRecoveryAttempts;
}

- (void)_setNumberOfRecoveryAttempts:(unint64_t)a3
{
  self->__numberOfRecoveryAttempts = a3;
}

- (NSTimer)_accidentalLaunchTimer
{
  return self->__accidentalLaunchTimer;
}

- (void)_setAccidentalLaunchTimer:(id)a3
{
  objc_storeStrong((id *)&self->__accidentalLaunchTimer, a3);
}

- (NSString)_accidentalLaunchPrewarmReason
{
  return self->__accidentalLaunchPrewarmReason;
}

- (void)_setAccidentalLaunchPrewarmReason:(id)a3
{
  objc_storeStrong((id *)&self->__accidentalLaunchPrewarmReason, a3);
}

- (OS_dispatch_queue)_signpostMutexQueue
{
  return self->__signpostMutexQueue;
}

- (NSMutableSet)_didEmitCaptureIntervalStartedSignpostsForUniqueID
{
  return self->__didEmitCaptureIntervalStartedSignpostsForUniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__didEmitCaptureIntervalStartedSignpostsForUniqueID, 0);
  objc_storeStrong((id *)&self->__signpostMutexQueue, 0);
  objc_storeStrong((id *)&self->__accidentalLaunchPrewarmReason, 0);
  objc_storeStrong((id *)&self->__accidentalLaunchTimer, 0);
  objc_storeStrong((id *)&self->__recoveryMutexQueue, 0);
  objc_storeStrong((id *)&self->__videoThumbnailContentsDelegates, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSampleBufferDelegates, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSampleBufferQueue, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSurfaceFilteringContext, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSurfaceFilteringQueue, 0);
  objc_storeStrong((id *)&self->__panoramaFirstImageQueueUpdateSemaphoreQueue, 0);
  objc_storeStrong((id *)&self->__panoramaFirstImageQueueUpdateSemaphore, 0);
  objc_storeStrong((id *)&self->__panoramaProcessor, 0);
  objc_storeStrong((id *)&self->__panoramaSubgraphQueue, 0);
  objc_storeStrong((id *)&self->__panoramaSampleBufferQueue, 0);
  objc_storeStrong((id *)&self->__metadataObjectsQueue, 0);
  objc_storeStrong((id *)&self->__servicesQueueCaptureServices, 0);
  objc_storeStrong((id *)&self->__captureServicesQueue, 0);
  objc_storeStrong((id *)&self->__resultsQueueLastCompletedVideoURL, 0);
  objc_storeStrong((id *)&self->__resultsQueueRequestsBeingRecorded, 0);
  objc_storeStrong((id *)&self->__sessionQueueCachedPhotoInitiationSettings, 0);
  objc_storeStrong((id *)&self->__resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue, 0);
  objc_storeStrong((id *)&self->__resultsQueueRegisteredStillImageRequests, 0);
  objc_storeStrong((id *)&self->_currentStillImageOutput, 0);
  objc_storeStrong((id *)&self->_currentCameraDevice, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_destroyWeak((id *)&self->__captureController);
  objc_storeStrong((id *)&self->__overCaptureVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->__videoPreviewLayer, 0);
  objc_storeStrong((id *)&self->__captureResultsQueue, 0);
  objc_storeStrong((id *)&self->__captureSessionQueue, 0);
  objc_storeStrong((id *)&self->__captureSession, 0);
  objc_storeStrong((id *)&self->__captureEngineDeviceCache, 0);
  objc_storeStrong((id *)&self->_toneBiasSlider, 0);
  objc_storeStrong((id *)&self->_colorBiasSlider, 0);
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_cachedSystemStyleForCreativeStylePicker, 0);
  objc_storeStrong((id *)&self->_creativeStylePicker, 0);
  objc_storeStrong((id *)&self->_systemStylePicker, 0);
  objc_storeStrong((id *)&self->_emulatedZoomSlider, 0);
  objc_storeStrong((id *)&self->_apertureSliderValues, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_videoThumbnailOutput, 0);
  objc_storeStrong((id *)&self->_effectsPreviewVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_panoramaVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_movieFileOutput, 0);
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_audioCaptureDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioCameraDevice, 0);
}

- (void)_handleSessionRuntimeError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v3 = a1;
  OUTLINED_FUNCTION_7_0(&dword_1DB760000, v4, v5, "[%{public}@] Encountered another AVCaptureSession runtime error during session recovery… (%{public}@)");

  OUTLINED_FUNCTION_9();
}

- (void)_performSessionRuntimeRecovery:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Performing recovery from error: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  v3 = (id)OUTLINED_FUNCTION_14_0(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_7_0(&dword_1DB760000, v4, v5, "[%{public}@] Stopping recovery after %ld failed attempts! Please file a radar with /DiagnosticLogs/com.apple.photos/ and syslog attached.");

  OUTLINED_FUNCTION_9();
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:.cold.2()
{
  NSObject *v0;
  uint8_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int16 v7;
  id v8;

  OUTLINED_FUNCTION_17_0();
  v5 = (void *)OUTLINED_FUNCTION_14_0(v2, v3, v4, 5.8383e-34);
  *(_WORD *)(v6 + 22) = v7;
  *(_QWORD *)(v6 + 24) = 5;
  v8 = v5;
  _os_log_error_impl(&dword_1DB760000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Not attempting to recover from an AVCaptureSession error, because we've already had %ld failed attempts, more than the maximum %ld", v1, 0x20u);

  OUTLINED_FUNCTION_9();
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:(double)a3 .cold.3(void *a1, uint64_t a2, double a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a3;
  v3 = a1;
  OUTLINED_FUNCTION_7_0(&dword_1DB760000, v4, v5, "[%{public}@] Backing off from an AVCaptureSession error recovery retry for %f seconds...");

  OUTLINED_FUNCTION_9();
}

- (void)_handleSessionWasPrewarmed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Session was prewarmed without a reason!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0(&dword_1DB760000, v6, v7, "Error posting UNNotificationRequest for %{public}@. \n Original message was: %{public}@, but encountered %ld", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)_lockManagedCapturedDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to lock %{public}@ for configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheMomentCaptureSettings:forIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot cache initiation settings for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cachedMomentCaptureSettingsForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot retrieve cached initiation settings for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot clear cached moment capture settings for nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to create IOSurface backed pixel buffer matching the input for filtering: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to get bulk attachments from input IOSurface before filtering: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to set bulk attachments on output IOSurface for filtering: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Missing video preview surface (AVCaptureMovieFileOutputRecordingCompletedNotification not called)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Error creating pixel buffer from video preview surface: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Successfully recovered movie fragments into a usable movie file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to recover the movie fragments into a usable movie file. (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Attempting to recover from movie fragments…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Did not attempt recovery of %{public}@ because AVErrorRecordingSuccessfullyFinishedKey==NO: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "AVErrorRecordingSuccessfullyFinishedKey==NO for Live Photo movie but file exists so we will try to recover anyway", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "File does not exist: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0(&dword_1DB760000, v2, v3, "Error posting UNNotificationRequest for %{public}@. \n Original message was: %{public}@, but encountered %ld", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_14();
}

- (void)_subgraphQueueHandlePanoramaErrorNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Received panorama error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_7(&dword_1DB760000, (uint64_t)a2, a3, "Failed to get device from -[AVCaptureDevice defaultDeviceWithDeviceType:%{public}@ mediaType:AVMediaTypeVideo position:%ld]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)systemPreferredCameraDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to get device from +[AVCaptureDevice systemPreferredCamera]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)audioCaptureDeviceInput
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Creating an AVCaptureDeviceInput for the audio device (%{public}@) failed. (%{public}@)");
  OUTLINED_FUNCTION_1_0();
}

@end
