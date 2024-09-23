@implementation CKVideoRecorder

- (CKVideoRecorder)init
{
  CKVideoRecorder *v2;
  CKVideoRecorder *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *avCaptureSessionDispatchQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  CKVideoRecorder *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKVideoRecorder;
  v2 = -[CKVideoRecorder init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKVideoRecorder setCanceled:](v2, "setCanceled:", 0);
    v4 = dispatch_queue_create("CKVideoMessageSessionQueue", 0);
    avCaptureSessionDispatchQueue = v3->_avCaptureSessionDispatchQueue;
    v3->_avCaptureSessionDispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C8B108]);
    -[CKVideoRecorder setSession:](v3, "setSession:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B170]), "initWithSession:", v6);
    objc_msgSend(v7, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);
    -[CKVideoRecorder setCaptureVideoPreviewLayer:](v3, "setCaptureVideoPreviewLayer:", v7);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("kCKVideoMessagingCameraDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = objc_msgSend(v9, "integerValue");
    else
      v10 = 1;
    if (v10 >= 1)
      v11 = 1;
    else
      v11 = v10;
    v3->_currentDevice = v11;
    v12 = v3->_avCaptureSessionDispatchQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __23__CKVideoRecorder_init__block_invoke;
    v15[3] = &unk_1E274A108;
    v16 = v6;
    v17 = v3;
    v13 = v6;
    dispatch_async(v12, v15);

  }
  return v3;
}

void __23__CKVideoRecorder_init__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setSessionPreset:", *MEMORY[0x1E0C8A198]);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2[121] == 1)
    objc_msgSend(v2, "_configureFrontVideoInput");
  else
    objc_msgSend(v2, "_configureRearVideoInput");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canAddInput:", v12);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addInput:", v12);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C8B0D0]);
  objc_msgSend(v6, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isVideoOrientationSupported"))
    objc_msgSend(v7, "setVideoOrientation:", 1);
  if (objc_msgSend(v7, "isVideoStabilizationSupported"))
    objc_msgSend(v7, "setEnablesVideoStabilizationWhenAvailable:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "canAddOutput:", v6))
    objc_msgSend(*(id *)(a1 + 32), "addOutput:", v6);
  objc_msgSend(*(id *)(a1 + 40), "setVideoOutput:", v6);
  v8 = objc_alloc_init(MEMORY[0x1E0C8B120]);
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", *MEMORY[0x1E0C8AE60], *MEMORY[0x1E0C8AE68], 0);
  objc_msgSend(v8, "setOutputSettings:", v10);
  if (objc_msgSend(*(id *)(a1 + 32), "canAddOutput:", v8))
    objc_msgSend(*(id *)(a1 + 32), "addOutput:", v8);
  objc_msgSend(*(id *)(a1 + 40), "setStillImageOutput:", v8);
  objc_msgSend(*(id *)(a1 + 40), "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startRunning");

}

- (void)loadView
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKVideoRecorder;
  -[CKVideoRecorder loadView](&v15, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKVideoRecorder captureVideoPreviewLayer](self, "captureVideoPreviewLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  -[CKVideoRecorder view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertSublayer:atIndex:", v12, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *avCaptureSessionDispatchQueue;
  objc_super v6;
  _QWORD block[5];

  v3 = a3;
  avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CKVideoRecorder_viewWillAppear___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(avCaptureSessionDispatchQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)CKVideoRecorder;
  -[CKVideoRecorder viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

void __34__CKVideoRecorder_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginConfiguration");
  v2 = objc_alloc(MEMORY[0x1E0C8B0B0]);
  objc_msgSend(*(id *)(a1 + 32), "audioDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDevice:error:", v3, 0);

  if (objc_msgSend(v8, "canAddInput:", v4))
    objc_msgSend(v8, "addInput:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setAudioInput:", v4);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[121] == 1)
    v6 = (id)objc_msgSend(v5, "_configureRearVideoInput");
  else
    v7 = (id)objc_msgSend(v5, "_configureFrontVideoInput");
  objc_msgSend(v8, "commitConfiguration");

}

- (void)cancel
{
  NSObject *avCaptureSessionDispatchQueue;
  void *v4;
  char v5;
  void *v6;
  _QWORD block[5];

  -[CKVideoRecorder setCanceled:](self, "setCanceled:", 1);
  avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CKVideoRecorder_cancel__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(avCaptureSessionDispatchQueue, block);
  -[CKVideoRecorder delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKVideoRecorder delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ckVideoRecorderRecordingCanceled:", self);

  }
}

void __25__CKVideoRecorder_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopRunning");

}

- (void)stopVideoCapture
{
  id v2;

  -[CKVideoRecorder videoOutput](self, "videoOutput");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecording");

}

- (BOOL)startVideoCapture
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  id v15;

  CKAttachmentTmpFileURL(CFSTR("VideoMessage.mov"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v15);
  v7 = v15;

  if ((v6 & 1) == 0 && _IMWillLog())
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    _IMAlwaysLog();

  }
  -[CKVideoRecorder setOutputFileURL:](self, "setOutputFileURL:", v3, v13, v14);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoRecorder outputFileURL](self, "outputFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

  -[CKVideoRecorder videoOutput](self, "videoOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoRecorder outputFileURL](self, "outputFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startRecordingToOutputFileURL:recordingDelegate:", v11, self);

  return 1;
}

- (void)takePicture
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (!-[CKVideoRecorder canceled](self, "canceled"))
  {
    -[CKVideoRecorder stillImageOutput](self, "stillImageOutput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKVideoRecorder stillImageOutput](self, "stillImageOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__CKVideoRecorder_takePicture__block_invoke;
    v6[3] = &unk_1E2750490;
    v6[4] = self;
    objc_msgSend(v5, "captureStillImageAsynchronouslyFromConnection:completionHandler:", v4, v6);

  }
}

void __30__CKVideoRecorder_takePicture__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "canceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C8B120], "jpegStillImageNSDataRepresentation:", a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ckVideoRecorder:imageDataCaptured:error:", *(_QWORD *)(a1 + 32), v7, 0);

      }
    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVCaptureVideoPreviewLayer setSession:](self->_captureVideoPreviewLayer, "setSession:", 0);
  -[CKVideoRecorder removeFromParentViewController](self, "removeFromParentViewController");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoRecorder outputFileURL](self, "outputFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)CKVideoRecorder;
  -[CKVideoRecorder dealloc](&v5, sel_dealloc);
}

- (id)_cameraWithPosition:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "devicesWithMediaType:", *MEMORY[0x1E0C8A808]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "position", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)audioDevice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8B0A0], "devicesWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)frontFacingCamera
{
  AVCaptureDevice *frontFacingCamera;
  AVCaptureDevice *v4;
  AVCaptureDevice *v5;

  frontFacingCamera = self->_frontFacingCamera;
  if (!frontFacingCamera)
  {
    -[CKVideoRecorder _cameraWithPosition:](self, "_cameraWithPosition:", 2);
    v4 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
    v5 = self->_frontFacingCamera;
    self->_frontFacingCamera = v4;

    -[CKVideoRecorder setupCamera:](self, "setupCamera:", self->_frontFacingCamera);
    frontFacingCamera = self->_frontFacingCamera;
  }
  return frontFacingCamera;
}

- (id)rearFacingCamera
{
  AVCaptureDevice *rearFacingCamera;
  AVCaptureDevice *v4;
  AVCaptureDevice *v5;

  rearFacingCamera = self->_rearFacingCamera;
  if (!rearFacingCamera)
  {
    -[CKVideoRecorder _cameraWithPosition:](self, "_cameraWithPosition:", 1);
    v4 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rearFacingCamera;
    self->_rearFacingCamera = v4;

    -[CKVideoRecorder setupCamera:](self, "setupCamera:", self->_rearFacingCamera);
    rearFacingCamera = self->_rearFacingCamera;
  }
  return rearFacingCamera;
}

- (int64_t)cameraDevice
{
  return self->_currentDevice;
}

- (id)_configureFrontVideoInput
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C8B0B0]);
  -[CKVideoRecorder frontFacingCamera](self, "frontFacingCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDevice:error:", v4, 0);

  -[CKVideoRecorder setFrontVideoInput:](self, "setFrontVideoInput:", v5);
  return v5;
}

- (id)_configureRearVideoInput
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C8B0B0]);
  -[CKVideoRecorder rearFacingCamera](self, "rearFacingCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDevice:error:", v4, 0);

  -[CKVideoRecorder setRearVideoInput:](self, "setRearVideoInput:", v5);
  return v5;
}

- (void)setCameraDevice:(int64_t)a3
{
  NSObject *avCaptureSessionDispatchQueue;
  _QWORD v6[6];

  if (!-[CKVideoRecorder canceled](self, "canceled") && self->_currentDevice != a3)
  {
    avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__CKVideoRecorder_setCameraDevice___block_invoke;
    v6[3] = &unk_1E274C9C0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(avCaptureSessionDispatchQueue, v6);
    self->_currentDevice = a3;
  }
}

void __35__CKVideoRecorder_setCameraDevice___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginConfiguration");

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v5, "rearVideoInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInput:", v6);

    objc_msgSend(*(id *)(a1 + 32), "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "frontVideoInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "canAddInput:", v8);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "frontVideoInput");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v16 = (void *)v11;
      objc_msgSend(v10, "addInput:", v11);

    }
  }
  else
  {
    objc_msgSend(v5, "frontVideoInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInput:", v12);

    objc_msgSend(*(id *)(a1 + 32), "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rearVideoInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "canAddInput:", v14);

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rearVideoInput");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commitConfiguration");

}

- (void)setupCamera:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "hasFlash") && objc_msgSend(v3, "lockForConfiguration:", 0))
  {
    if (objc_msgSend(v3, "isFlashModeSupported:", 2))
      objc_msgSend(v3, "setFlashMode:", 2);
    objc_msgSend(v3, "unlockForConfiguration");
  }
  if (objc_msgSend(v3, "hasTorch") && objc_msgSend(v3, "lockForConfiguration:", 0))
  {
    if (objc_msgSend(v3, "isTorchModeSupported:", 2))
      objc_msgSend(v3, "setTorchMode:", 2);
    objc_msgSend(v3, "unlockForConfiguration");
  }
  if (objc_msgSend(v3, "isFocusModeSupported:", 2)
    && objc_msgSend(v3, "lockForConfiguration:", 0))
  {
    objc_msgSend(v3, "setFocusMode:", 2);
    objc_msgSend(v3, "unlockForConfiguration");
  }

}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a6;
  if (!-[CKVideoRecorder canceled](self, "canceled"))
  {
    -[CKVideoRecorder delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CKVideoRecorder delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ckVideoRecorder:videoCaptured:error:", self, v12, v8);

    }
  }

}

- (AVCaptureVideoPreviewLayer)captureVideoPreviewLayer
{
  return self->_captureVideoPreviewLayer;
}

- (void)setCaptureVideoPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_captureVideoPreviewLayer, a3);
}

- (CKVideoRecorderDelegate)delegate
{
  return (CKVideoRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AVCaptureDeviceInput)rearVideoInput
{
  return self->_rearVideoInput;
}

- (void)setRearVideoInput:(id)a3
{
  objc_storeStrong((id *)&self->_rearVideoInput, a3);
}

- (AVCaptureDeviceInput)frontVideoInput
{
  return self->_frontVideoInput;
}

- (void)setFrontVideoInput:(id)a3
{
  objc_storeStrong((id *)&self->_frontVideoInput, a3);
}

- (AVCaptureDeviceInput)audioInput
{
  return self->_audioInput;
}

- (void)setAudioInput:(id)a3
{
  objc_storeStrong((id *)&self->_audioInput, a3);
}

- (AVCaptureMovieFileOutput)videoOutput
{
  return self->_videoOutput;
}

- (void)setVideoOutput:(id)a3
{
  objc_storeStrong((id *)&self->_videoOutput, a3);
}

- (AVCaptureStillImageOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (void)setStillImageOutput:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageOutput, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_frontVideoInput, 0);
  objc_storeStrong((id *)&self->_rearVideoInput, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->_avCaptureSessionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_rearFacingCamera, 0);
  objc_storeStrong((id *)&self->_frontFacingCamera, 0);
}

@end
