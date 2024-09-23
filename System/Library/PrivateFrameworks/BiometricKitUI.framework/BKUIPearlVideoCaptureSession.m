@implementation BKUIPearlVideoCaptureSession

- (BKUIPearlVideoCaptureSession)init
{
  BKUIPearlVideoCaptureSession *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *captureQueue;
  objc_super v8;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlVideoCaptureSession;
  v3 = -[BKUIPearlVideoCaptureSession init](&v8, sel_init);
  if (v3)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.biometrickitui.pearlVideoCaptureSessionQueue", v4);
    captureQueue = v3->_captureQueue;
    v3->_captureQueue = (OS_dispatch_queue *)v5;

    v3->_additionalPreviewScalingAllowedByCameraFormat = 1.0;
    -[BKUIPearlVideoCaptureSession _setupCaptureStack](v3, "_setupCaptureStack");

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKUIPearlVideoCaptureSession _stopSessionAndTearDown](self, "_stopSessionAndTearDown");
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlVideoCaptureSession;
  -[BKUIPearlVideoCaptureSession dealloc](&v3, sel_dealloc);
}

- (id)_frontCamera
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_captureQueue);
  v2 = (void *)MEMORY[0x1E0C8B0A8];
  v8[0] = *MEMORY[0x1E0C89FA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v3, *MEMORY[0x1E0C8A808], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)endCapture
{
  NSObject *captureQueue;
  _QWORD block[5];

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BKUIPearlVideoCaptureSession_endCapture__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __42__BKUIPearlVideoCaptureSession_endCapture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSessionAndTearDown");
}

- (void)startCapture
{
  NSObject *captureQueue;
  _QWORD block[5];

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BKUIPearlVideoCaptureSession_startCapture__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __44__BKUIPearlVideoCaptureSession_startCapture__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isRunning");
  if ((result & 1) == 0)
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "+++++++++ BKUIPearl: Starting Capture Session", v4, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("running"), 1, CFSTR("PSCaptureSessionActiveContext"));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startRunning");
  }
  return result;
}

- (void)_stopSessionAndTearDown
{
  NSObject *v3;
  AVCaptureSession *captureSession;
  AVCaptureDeviceInput *v5;
  AVCaptureSession *v6;
  AVCaptureSession *v7;
  AVCaptureDeviceInput *deviceInput;
  uint8_t v9[16];

  if (self->_captureSession)
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "--------- BKUIPearl: Stopping Capture Session", v9, 2u);
    }

    captureSession = self->_captureSession;
    v5 = self->_deviceInput;
    v6 = captureSession;
    -[AVCaptureSession removeInput:](v6, "removeInput:", v5);
    -[AVCaptureSession stopRunning](v6, "stopRunning");
    -[AVCaptureSession removeObserver:forKeyPath:context:](self->_captureSession, "removeObserver:forKeyPath:context:", self, CFSTR("running"), CFSTR("PSCaptureSessionActiveContext"));
    v7 = self->_captureSession;
    self->_captureSession = 0;

    deviceInput = self->_deviceInput;
    self->_deviceInput = 0;

  }
}

- (void)_setupCaptureStack
{
  NSObject *v3;
  AVCaptureSession *v4;
  AVCaptureSession *captureSession;
  NSObject *v6;
  AVCaptureVideoPreviewLayer *v7;
  AVCaptureVideoPreviewLayer *previewLayer;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  NSObject *captureQueue;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack", buf, 2u);
  }

  v4 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E0C8B108]);
  captureSession = self->_captureSession;
  self->_captureSession = v4;

  -[BKUIPearlVideoCaptureSession supportMultitaskingCameraAccess](self, "supportMultitaskingCameraAccess");
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "_setupCaptureStack: PreviewLayer will be setup", buf, 2u);
  }

  v7 = (AVCaptureVideoPreviewLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B170]), "initWithSession:", self->_captureSession);
  previewLayer = self->_previewLayer;
  self->_previewLayer = v7;

  -[BKUIPearlVideoCaptureSession previewLayer](self, "previewLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);

  -[BKUIPearlVideoCaptureSession previewLayer](self, "previewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  _BKUILoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v12, OS_LOG_TYPE_DEFAULT, "_setupCaptureStack: PreviewLayer did setup", buf, 2u);
  }

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(captureQueue, block);
  _BKUILoggingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v14, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack finished sync work", buf, 2u);
  }

}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const opaqueCMFormatDescription *v44;
  CMVideoDimensions Dimensions;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack async work", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginConfiguration");
  v3 = *MEMORY[0x1E0C8A178];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "canSetSessionPreset:", *MEMORY[0x1E0C8A178]))
  {
    _BKUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_4(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v20 + 8);
    *(_QWORD *)(v20 + 8) = 0;
    goto LABEL_72;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSessionPreset:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_frontCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _BKUILoggingFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);

    v29 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(v29 + 8);
    *(_QWORD *)(v29 + 8) = 0;
    goto LABEL_71;
  }
  v62 = 0;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B0B0]), "initWithDevice:error:", v4, &v62);
  v6 = v62;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;

  if (v6)
  {
    _BKUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_3((uint64_t)v6, v9);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = 0;

    goto LABEL_71;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addInput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_70;
  v32 = 0;
  v33 = MGGetProductType();
  v34 = v33;
  if (v33 <= 2619317133)
  {
    if (v33 != 555503454)
    {
      v35 = 2487868872;
      goto LABEL_21;
    }
LABEL_22:
    objc_msgSend(*(id *)(a1 + 32), "previewLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "connection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v37, "isVideoOrientationSupported"))
    {
      objc_msgSend(v37, "setVideoOrientation:", 3);
      _BKUILoggingFacility();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v65 = v34;
        _os_log_impl(&dword_1DB281000, v38, OS_LOG_TYPE_DEFAULT, "Capture orientation: Set to LandscapeRight for model: %ld", buf, 0xCu);
      }
    }
    else
    {
      _BKUILoggingFacility();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_2(v34, v38);
    }

    v32 = 1;
    goto LABEL_28;
  }
  if (v33 == 3241053352)
    goto LABEL_22;
  v35 = 2619317134;
LABEL_21:
  if (v33 == v35)
    goto LABEL_22;
LABEL_28:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v4, "formats");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v40)
    goto LABEL_65;
  v55 = v32;
  v56 = v4;
  v41 = *(_QWORD *)v59;
LABEL_30:
  v42 = 0;
  while (1)
  {
    if (*(_QWORD *)v59 != v41)
      objc_enumerationMutation(v39);
    v43 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v42);
    v44 = (const opaqueCMFormatDescription *)objc_msgSend(v43, "formatDescription");
    if (MGGetProductType() == 2023824667
      || MGGetProductType() == 3101941570
      || MGGetProductType() == 1868379043
      || MGGetProductType() == 1373516433
      || MGGetProductType() == 746003606
      || MGGetProductType() == 1834147427
      || MGGetProductType() == 3054476161
      || MGGetProductType() == 2628394914
      || MGGetProductType() == 3228373941
      || MGGetProductType() == 1625227434
      || MGGetProductType() == 3361025853
      || ((MGGetProductType() != 2089455188) & ~v55) == 0)
    {
      if (CMFormatDescriptionGetMediaType(v44) != 1986618469 || !objc_msgSend(v43, "isVideoBinned"))
        goto LABEL_49;
      Dimensions = CMVideoFormatDescriptionGetDimensions(v44);
      v46 = 0x2D000000500;
    }
    else
    {
      if (CMFormatDescriptionGetMediaType(v44) != 1986618469 || CMFormatDescriptionGetMediaSubType(v44) != 875704438)
        goto LABEL_49;
      Dimensions = CMVideoFormatDescriptionGetDimensions(v44);
      v46 = 0x438000005A0;
    }
    if (Dimensions == v46)
      break;
LABEL_49:
    if (v40 == (id)++v42)
    {
      v47 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v40 = (id)v47;
      if (!v47)
      {
        v4 = v56;
        goto LABEL_65;
      }
      goto LABEL_30;
    }
  }
  v40 = v43;

  if (v40)
  {
    _BKUILoggingFacility();
    v48 = objc_claimAutoreleasedReturnValue();
    v4 = v56;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = (uint64_t)v40;
      _os_log_impl(&dword_1DB281000, v48, OS_LOG_TYPE_DEFAULT, "will switch active camera format to %@", buf, 0xCu);
    }

    v57 = 0;
    v49 = objc_msgSend(v56, "lockForConfiguration:", &v57);
    v39 = v57;
    if (v49)
    {
      objc_msgSend(v56, "setActiveFormat:", v40);
      objc_msgSend(v56, "unlockForConfiguration");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0x3FF5555555555555;
    }
    if (v39)
    {
      _BKUILoggingFacility();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = (uint64_t)v39;
        _os_log_impl(&dword_1DB281000, v50, OS_LOG_TYPE_DEFAULT, "lockForConfiguration error %@", buf, 0xCu);
      }

    }
LABEL_65:

  }
  else
  {
    v4 = v56;
  }
  _BKUILoggingFacility();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "activeFormat");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v65 = (uint64_t)v52;
    _os_log_impl(&dword_1DB281000, v51, OS_LOG_TYPE_DEFAULT, "active camera format %@", buf, 0xCu);

  }
LABEL_70:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "commitConfiguration");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__captureSessionStarted_, *MEMORY[0x1E0C8A128], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__captureSessionStopped_, *MEMORY[0x1E0C8A130], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__captureSessionInterrupted_, *MEMORY[0x1E0C8A1C8], 0);
LABEL_71:

LABEL_72:
}

- (void)supportMultitaskingCameraAccess
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  if (-[AVCaptureSession isMultitaskingCameraAccessSupported](self->_captureSession, "isMultitaskingCameraAccessSupported"))
  {
    -[AVCaptureSession setMultitaskingCameraAccessEnabled:](self->_captureSession, "setMultitaskingCameraAccessEnabled:", 1);
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v4 = "_setupCaptureStack: Supporting Multitasking Camera Access";
      v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 0;
      v4 = "_setupCaptureStack: Not supporting Multitasking Camera Access";
      v5 = (uint8_t *)&v6;
      goto LABEL_6;
    }
  }

}

- (void)_captureSessionStarted:(id)a3
{
  id v4;
  BKUIPearlVideoCaptureSession *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Capture session started", v7, 2u);
  }

  v5->_captureSessionInterrupted = 0;
  objc_sync_exit(v5);

}

- (void)_captureSessionStopped:(id)a3
{
  id v4;
  BKUIPearlVideoCaptureSession *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Capture session stopped", v7, 2u);
  }

  v5->_captureSessionInterrupted = 0;
  objc_sync_exit(v5);

}

- (void)_captureSessionInterrupted:(id)a3
{
  id v4;
  BKUIPearlVideoCaptureSession *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Capture session interrupted", v7, 2u);
  }

  v5->_captureSessionInterrupted = 1;
  objc_sync_exit(v5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;
  void *v8;
  unint64_t captureSessionRestarts;
  NSObject *v10;
  NSObject *captureQueue;
  objc_super v12;
  _QWORD block[5];
  uint8_t buf[16];

  if (a6 == CFSTR("PSCaptureSessionActiveContext"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("running"), a4, a5))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained;
      if (WeakRetained)
      {
        if (objc_msgSend(WeakRetained, "expectsRunningVideoCaptureSession:", self))
        {
          if (!-[AVCaptureSession isRunning](self->_captureSession, "isRunning")
            && !-[BKUIPearlVideoCaptureSession _synchronizedCaptureSessionInterrupted](self, "_synchronizedCaptureSessionInterrupted"))
          {
            captureSessionRestarts = self->_captureSessionRestarts;
            if (captureSessionRestarts <= 4)
            {
              self->_captureSessionRestarts = captureSessionRestarts + 1;
              _BKUILoggingFacility();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Capture session suddenly stopped running. mediaserverd crash?", buf, 2u);
              }

              captureQueue = self->_captureQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __79__BKUIPearlVideoCaptureSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
              block[3] = &unk_1EA27FB98;
              block[4] = self;
              dispatch_async(captureQueue, block);
            }
          }
        }
      }

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BKUIPearlVideoCaptureSession;
    -[BKUIPearlVideoCaptureSession observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __79__BKUIPearlVideoCaptureSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startRunning");
}

- (BOOL)_synchronizedCaptureSessionInterrupted
{
  BKUIPearlVideoCaptureSession *v2;
  BOOL captureSessionInterrupted;

  v2 = self;
  objc_sync_enter(v2);
  captureSessionInterrupted = v2->_captureSessionInterrupted;
  objc_sync_exit(v2);

  return captureSessionInterrupted;
}

- (BKUIVideoCaptureSesssionDelegate)delegate
{
  return (BKUIVideoCaptureSesssionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewLayer, a3);
}

- (double)additionalPreviewScalingAllowedByCameraFormat
{
  return self->_additionalPreviewScalingAllowedByCameraFormat;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1DB281000, a1, a3, "BKUIPearl: Failed to get camera", a5, a6, a7, a8, 0);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DB281000, a2, OS_LOG_TYPE_ERROR, "Capture orientation: Failed to set to LandscapeRight for model: %ld - video orientation unsupported", (uint8_t *)&v2, 0xCu);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1DB281000, a2, OS_LOG_TYPE_FAULT, "BKUIPearl: Failed to get input device, %@", (uint8_t *)&v2, 0xCu);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1DB281000, a1, a3, "BKUIPearl: Failed to set session preset", a5, a6, a7, a8, 0);
}

@end
