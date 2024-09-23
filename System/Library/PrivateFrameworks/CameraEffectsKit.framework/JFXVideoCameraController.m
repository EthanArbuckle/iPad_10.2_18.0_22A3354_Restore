@implementation JFXVideoCameraController

+ (void)initialize
{
  if (JFX_getFrontAndBackCameras_onceToken != -1)
    dispatch_once(&JFX_getFrontAndBackCameras_onceToken, &__block_literal_global_632);
}

- (JFXVideoCameraController)init
{
  char *v2;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_queue_t v14;
  void *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  dispatch_queue_t v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_queue_t v24;
  void *v25;
  dispatch_queue_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)JFXVideoCameraController;
  v2 = -[JFXVideoCameraController init](&v36, sel_init);
  *((_QWORD *)v2 + 31) = 0;
  *((_QWORD *)v2 + 32) = 0;
  *((_QWORD *)v2 + 30) = 0;
  *((_QWORD *)v2 + 35) = 0;
  *((_QWORD *)v2 + 36) = 0;
  *((_QWORD *)v2 + 34) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v2 + 19) = _Q0;
  v2[190] = 1;
  *(_WORD *)(v2 + 185) = 0;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v2 + 17);
  *((_QWORD *)v2 + 17) = v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v2 + 19);
  *((_QWORD *)v2 + 19) = v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v2 + 21);
  *((_QWORD *)v2 + 21) = v12;

  v14 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.captureSession", 0);
  v15 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = v14;

  v16 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.audioOutput", 0);
  v17 = (void *)*((_QWORD *)v2 + 12);
  *((_QWORD *)v2 + 12) = v16;

  v18 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.dataOutSync", 0);
  v19 = (void *)*((_QWORD *)v2 + 13);
  *((_QWORD *)v2 + 13) = v18;

  v20 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.queryDataQueue", MEMORY[0x24BDAC9C0]);
  v21 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v20;

  v22 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.videoDelegate", 0);
  v23 = (void *)*((_QWORD *)v2 + 18);
  *((_QWORD *)v2 + 18) = v22;

  v24 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.audioDelegate", 0);
  v25 = (void *)*((_QWORD *)v2 + 20);
  *((_QWORD *)v2 + 20) = v24;

  v26 = dispatch_queue_create("com.apple.clips.JFXVideoCameraController.livePlayerSource", 0);
  v27 = (void *)*((_QWORD *)v2 + 22);
  *((_QWORD *)v2 + 22) = v26;

  v28 = (void *)*((_QWORD *)v2 + 27);
  *((_QWORD *)v2 + 27) = 0;

  v2[192] = 0;
  *((_QWORD *)v2 + 40) = 0;
  v29 = (void *)*((_QWORD *)v2 + 28);
  *((_QWORD *)v2 + 28) = 0;

  v2[187] = 1;
  v30 = objc_opt_new();
  v31 = (void *)*((_QWORD *)v2 + 51);
  *((_QWORD *)v2 + 51) = v30;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", v2, sel_JFX_thermalPolicyOrLevelChangedNotification_, CFSTR("JFXThermalMonitorLevelChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel_JFX_thermalPolicyOrLevelChangedNotification_, CFSTR("JFXThermalPolicyChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel_JFX_orientationMonitorDeviceInterfaceOrientationNotification_, CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationNotification"), 0);

  return (JFXVideoCameraController *)v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *queryDataQueue;
  objc_super v20;
  _QWORD block[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == sAVCapturePhotoOutputIsFlashScene)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[JFXVideoCameraController JFX_setIsFlashScene:](self, "JFX_setIsFlashScene:", v15);
  }
  else if (a6 == sAVCaptureDeviceSystemPressureState)
  {
    -[JFXVideoCameraController JFX_thermalPolicyOrLevelChangedNotification:](self, "JFX_thermalPolicyOrLevelChangedNotification:", 0);
  }
  else if (a6 == &sAVCaptureDeviceVideoZoomFactor)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    queryDataQueue = self->_queryDataQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__JFXVideoCameraController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24EE58078;
    block[4] = self;
    block[5] = v18;
    dispatch_barrier_async(queryDataQueue, block);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)JFXVideoCameraController;
    -[JFXVideoCameraController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __75__JFXVideoCameraController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraVideoZoomFactor_queryDataQueue:", *(double *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JFXVideoCameraController;
  -[JFXVideoCameraController dealloc](&v2, sel_dealloc);
}

- (VCPCaptureAnalysisSession)vcpAnalyzer
{
  VCPCaptureAnalysisSession *vcpAnalyzer;
  NSObject *v4;
  __int128 v5;
  VCPCaptureAnalysisSession *v6;
  VCPCaptureAnalysisSession *v7;
  _OWORD v9[3];

  vcpAnalyzer = self->_vcpAnalyzer;
  if (!vcpAnalyzer)
  {
    JFXLog_DebugCamera();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[JFXVideoCameraController vcpAnalyzer].cold.1();

    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v9[0] = *MEMORY[0x24BDBD8B8];
    v9[1] = v5;
    v9[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(MEMORY[0x24BE641E8], "analyzerForAnalysisTypes:withPreferredTransform:properties:", 2, v9, 0);
    v6 = (VCPCaptureAnalysisSession *)objc_claimAutoreleasedReturnValue();
    v7 = self->_vcpAnalyzer;
    self->_vcpAnalyzer = v6;

    vcpAnalyzer = self->_vcpAnalyzer;
  }
  return vcpAnalyzer;
}

- (void)clear
{
  uint64_t v3;
  NSObject *dataOutSynchQueue;
  NSObject *queryDataQueue;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__JFXVideoCameraController_clear__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(dataOutSynchQueue, block);
  queryDataQueue = self->_queryDataQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __33__JFXVideoCameraController_clear__block_invoke_2;
  v6[3] = &unk_24EE57B60;
  v6[4] = self;
  dispatch_barrier_async(queryDataQueue, v6);
}

uint64_t __33__JFXVideoCameraController_clear__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentFrameSet_dataOutSynchQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCapturedPhotoFrameSet_dataOutSynchQueue:", 0);
}

uint64_t __33__JFXVideoCameraController_clear__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentARMetadata_queryDataQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStillImageFaceAnchor_queryDataQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHasValidFaceData_queryDataQueue:", 0);
}

- (int64_t)cameraMode
{
  NSObject *queryDataQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_cameraMode__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__JFXVideoCameraController_cameraMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cameraMode_queryDataQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)cameraSessionRunning
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_cameraSessionRunning__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__JFXVideoCameraController_cameraSessionRunning__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "captureSessionRunning_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)cameraColorSpace
{
  NSObject *queryDataQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__JFXVideoCameraController_cameraColorSpace__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__JFXVideoCameraController_cameraColorSpace__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cameraColorSpace_queryDataQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)audioEnabled
{
  NSObject *captureSessionQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_audioEnabled__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(captureSessionQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_audioEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "JFX_isAudioEnabledCaptureSessionQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)depthEnabled
{
  void *v3;
  int v4;
  NSObject *captureSessionQueue;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "jfx_hasDepthCapableCamera");

  if (!v4)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__JFXVideoCameraController_depthEnabled__block_invoke;
  v8[3] = &unk_24EE57A80;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureSessionQueue, v8);
  v6 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __40__JFXVideoCameraController_depthEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "JFX_isDepthEnabledCaptureSessionQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)hasFFCZoomEnabled
{
  void *v3;
  int v4;
  NSObject *captureSessionQueue;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "jfx_hasTrueDepthFrontCameraCustomZoomFormat");

  if (!v4)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__JFXVideoCameraController_hasFFCZoomEnabled__block_invoke;
  v8[3] = &unk_24EE58380;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureSessionQueue, v8);
  v6 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __45__JFXVideoCameraController_hasFFCZoomEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "jfx_trueDepthCamera"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionPreset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB1B28]);

  }
}

- (BOOL)isFlashScene
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_isFlashScene__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_isFlashScene__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFlashScene_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDimensions
{
  NSObject *captureSessionQueue;
  $2825F4736939C4A6D3AD43837233062D v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2810000000;
  v9 = &unk_226ACDFC7;
  v10 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__JFXVideoCameraController_depthDimensions__block_invoke;
  block[3] = &unk_24EE58380;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  v3 = ($2825F4736939C4A6D3AD43837233062D)v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CMVideoDimensions __43__JFXVideoCameraController_depthDimensions__block_invoke(uint64_t a1)
{
  CMVideoDimensions result;
  void *v3;
  void *v4;
  const opaqueCMFormatDescription *v5;

  result = (CMVideoDimensions)objc_msgSend(*(id *)(a1 + 32), "JFX_isDepthEnabledCaptureSessionQueue");
  if (result.width)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeDepthDataFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const opaqueCMFormatDescription *)objc_msgSend(v4, "formatDescription");

    result = CMVideoFormatDescriptionGetDimensions(v5);
    *(CMVideoDimensions *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  }
  return result;
}

- (double)zoomFactor
{
  NSObject *queryDataQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_zoomFactor__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__JFXVideoCameraController_zoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "cameraVideoZoomFactor_queryDataQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  NSObject *captureSessionQueue;
  _QWORD v4[6];

  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__JFXVideoCameraController_setZoomFactor___block_invoke;
  v4[3] = &unk_24EE58078;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(captureSessionQueue, v4);
}

uint64_t __42__JFXVideoCameraController_setZoomFactor___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cameraVideoMaxZoomFactor_captureSessionQueue");
  if (v2 > v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraVideoMaxZoomFactor_captureSessionQueue");
    v2 = v4;
  }
  return objc_msgSend(*(id *)(a1 + 32), "JFX_setZoomFactor_captureSessionQueue:", v2);
}

- (void)setThermalDelegate:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__JFXVideoCameraController_setThermalDelegate___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __47__JFXVideoCameraController_setThermalDelegate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(a1 + 40));
}

- (BOOL)ARKitEnabled
{
  NSObject *captureSessionQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__JFXVideoCameraController_ARKitEnabled__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(captureSessionQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__JFXVideoCameraController_ARKitEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "JFX_isARKitEnabledCaptureSessionQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMostRecentARMetadata:(id)a3
{
  id v4;
  NSObject *queryDataQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryDataQueue = self->_queryDataQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__JFXVideoCameraController_setMostRecentARMetadata___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queryDataQueue, v7);

}

_BYTE *__52__JFXVideoCameraController_setMostRecentARMetadata___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[187])
    return (_BYTE *)objc_msgSend(result, "setMostRecentARMetadata_queryDataQueue:", *(_QWORD *)(a1 + 40));
  return result;
}

- (JFXARMetadata)mostRecentARMetadata
{
  NSObject *queryDataQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_mostRecentARMetadata__block_invoke;
  v5[3] = &unk_24EE58380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXARMetadata *)v3;
}

void __48__JFXVideoCameraController_mostRecentARMetadata__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[187])
  {
    objc_msgSend(v2, "mostRecentARMetadata_queryDataQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)setSessionRequiresFaceTracking:(BOOL)a3
{
  NSObject *queryDataQueue;
  _QWORD v4[5];
  BOOL v5;

  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__JFXVideoCameraController_setSessionRequiresFaceTracking___block_invoke;
  v4[3] = &unk_24EE57C98;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __59__JFXVideoCameraController_setSessionRequiresFaceTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSessionRequiresFaceTracking_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)sessionRequiresFaceTracking
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__JFXVideoCameraController_sessionRequiresFaceTracking__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__JFXVideoCameraController_sessionRequiresFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sessionRequiresFaceTracking_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setSkipARProcessingWhenNoFaceDataIsPresent:(BOOL)a3
{
  NSObject *queryDataQueue;
  _QWORD v4[5];
  BOOL v5;

  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__JFXVideoCameraController_setSkipARProcessingWhenNoFaceDataIsPresent___block_invoke;
  v4[3] = &unk_24EE57C98;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __71__JFXVideoCameraController_setSkipARProcessingWhenNoFaceDataIsPresent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSkipARProcessingWhenNoFaceData_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)skipARProcessingWhenNoFaceDataIsPresent
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__JFXVideoCameraController_skipARProcessingWhenNoFaceDataIsPresent__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__JFXVideoCameraController_skipARProcessingWhenNoFaceDataIsPresent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "skipARProcessingWhenNoFaceData_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (JFXFaceAnchor)stillImageFaceAnchor
{
  NSObject *queryDataQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_stillImageFaceAnchor__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXFaceAnchor *)v3;
}

void __48__JFXVideoCameraController_stillImageFaceAnchor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "stillImageFaceAnchor_queryDataQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAllowARMetadata:(BOOL)a3
{
  NSObject *queryDataQueue;
  _QWORD v4[5];
  BOOL v5;

  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__JFXVideoCameraController_setAllowARMetadata___block_invoke;
  v4[3] = &unk_24EE57C98;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

void __47__JFXVideoCameraController_setAllowARMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setAllowARMetadata_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 384);
    *(_QWORD *)(v2 + 384) = 0;

  }
}

- (BOOL)allowARMetadata
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__JFXVideoCameraController_allowARMetadata__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__JFXVideoCameraController_allowARMetadata__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allowARMetadata_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setHasValidFaceData:(BOOL)a3
{
  NSObject *queryDataQueue;
  _QWORD v4[5];
  BOOL v5;

  queryDataQueue = self->_queryDataQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__JFXVideoCameraController_setHasValidFaceData___block_invoke;
  v4[3] = &unk_24EE57C98;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(queryDataQueue, v4);
}

uint64_t __48__JFXVideoCameraController_setHasValidFaceData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasValidFaceData_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)hasValidFaceData
{
  NSObject *queryDataQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__JFXVideoCameraController_hasValidFaceData__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__JFXVideoCameraController_hasValidFaceData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasValidFaceData_queryDataQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)JFX_observeCaptureSessionNotifications:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_JFX_captureSessionDidStartRunningNotification_, *MEMORY[0x24BDB1AC8], v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_JFX_captureSessionDidStopRunningNotification_, *MEMORY[0x24BDB1AD0], v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_JFX_captureSessionWasInterruptedNotification_, *MEMORY[0x24BDB1B68], v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_JFX_captureSessionInterruptionEndedNotification_, *MEMORY[0x24BDB1AE0], v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_JFX_captureSessionRuntimeErrorNotification_, *MEMORY[0x24BDB1B58], v5);

}

- (void)JFX_captureSessionDidStartRunningNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queryDataQueue;
  _QWORD block[5];

  v4 = a3;
  JFXLog_DebugCamera();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXVideoCameraController JFX_captureSessionDidStartRunningNotification:].cold.1();

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__JFXVideoCameraController_JFX_captureSessionDidStartRunningNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);

}

uint64_t __74__JFXVideoCameraController_JFX_captureSessionDidStartRunningNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 1);
}

- (void)JFX_captureSessionDidStopRunningNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queryDataQueue;
  _QWORD block[5];

  v4 = a3;
  JFXLog_DebugCamera();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXVideoCameraController JFX_captureSessionDidStopRunningNotification:].cold.1();

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_JFX_captureSessionDidStopRunningNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);

}

uint64_t __73__JFXVideoCameraController_JFX_captureSessionDidStopRunningNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
}

- (void)JFX_captureSessionWasInterruptedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString **v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  NSObject *queryDataQueue;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB1AF0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AF0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v7)
  {
    case 1:
      v11 = kCaptureSessionInterruptionVideoDeviceNotAvailableInBackground;
      goto LABEL_7;
    case 2:
      v11 = kCaptureSessionInterruptionAudioDeviceInUseByAnotherClient;
      goto LABEL_7;
    case 3:
      v11 = kCaptureSessionInterruptionVideoDeviceInUseByAnotherClient;
      goto LABEL_7;
    case 4:
      v11 = kCaptureSessionInterruptionVideoDeviceNotAvailableWithMultipleForegroundApps;
LABEL_7:
      v12 = *v11;
      break;
    case 5:
      objc_msgSend(v4, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%@)"), CFSTR("VideoDeviceNotAvailableDueToSystemPressure"), v20);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v12 = 0;
      break;
  }
  JFXLog_camera();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v4;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionWasInterruptedNotification: %@\tReason: %@\tAVCaptureSystemPressureState: %@", buf, 0x20u);
  }

  +[JFXAnalyticsManager sharedInstance](JFXAnalyticsManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackEventWithName:", v12);

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_JFX_captureSessionWasInterruptedNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
  v22[0] = CFSTR("JTCaptureSessionInterruptedKey");
  v22[1] = CFSTR("JTCaptureSessionReasonInterruptedKey");
  v23[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("JTCaptureSessionInterruptedNotification"), self, v17);

}

uint64_t __73__JFXVideoCameraController_JFX_captureSessionWasInterruptedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
}

- (void)JFX_captureSessionInterruptionEndedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queryDataQueue;
  void *v7;
  void *v8;
  _QWORD block[5];
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  JFXLog_camera();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionInterruptionEndedNotification: %@", buf, 0xCu);
  }

  queryDataQueue = self->_queryDataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__JFXVideoCameraController_JFX_captureSessionInterruptionEndedNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_async(queryDataQueue, block);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("JTCaptureSessionInterruptedKey");
  v11 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("JTCaptureSessionInterruptedNotification"), self, v8);

}

uint64_t __76__JFXVideoCameraController_JFX_captureSessionInterruptionEndedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 1);
}

- (void)JFX_captureSessionRuntimeErrorNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *captureSessionQueue;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  JFXVideoCameraController *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  JFXLog_camera();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureSessionRuntimeErrorNotification: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  captureSessionQueue = self->_captureSessionQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke;
  v11[3] = &unk_24EE57AA8;
  v12 = v7;
  v13 = self;
  v9 = v7;
  v10 = captureSessionQueue;
  dispatch_async(v10, v11);

}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  v3 = *(id **)(a1 + 40);
  if (v2 == -11819)
  {
    objc_msgSend(v3[1], "startRunning");
  }
  else
  {
    v4 = objc_msgSend(v3, "cameraMode_captureSessionQueue");
    v5 = objc_msgSend(*(id *)(a1 + 40), "currentCameraPosition_captureSessionQueue");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_2;
    v10[3] = &unk_24EE5A118;
    v13 = v4;
    v14 = v5;
    v11 = v6;
    v12 = v7;
    v8 = v7;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareCameraForMode:position:completion:", 0, 0, 0);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareCameraForMode:position:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_41);
  objc_msgSend(*(id *)(a1 + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_58);
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startCameraSession:", &__block_literal_global_60);

}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addVideoRenderDelegate:", v2);

}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAudioRenderDelegate:", v2);

}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  JFXLog_DebugCamera();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5_cold_1();

}

- (void)JFX_thermalPolicyOrLevelChangedNotification:(id)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[5];

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

void __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke_2;
  v3[3] = &unk_24EE5A140;
  v3[4] = *(_QWORD *)(a1 + 32);
  JFX_configureCaptureDevice(v2, v3);

}

uint64_t __72__JFXVideoCameraController_JFX_thermalPolicyOrLevelChangedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceFrameRate:", a2);
}

- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3
{
  int64_t v4;
  NSObject *captureSessionQueue;
  _QWORD v6[6];

  v4 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation", a3);
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke;
  v6[3] = &unk_24EE58078;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(captureSessionQueue, v6);
}

void __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke_2;
  v4[3] = &unk_24EE5A168;
  v4[4] = v1;
  v4[5] = v2;
  JFX_configureCaptureSession(v3, v4);
}

uint64_t __89__JFXVideoCameraController_JFX_orientationMonitorDeviceInterfaceOrientationNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)JFX_audioSessionRouteChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *captureSessionQueue;
  _QWORD v8[6];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDB1738]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  captureSessionQueue = self->_captureSessionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke;
  v8[3] = &unk_24EE58078;
  v8[4] = self;
  v8[5] = v6;
  dispatch_async(captureSessionQueue, v8);

}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2;
  v4[3] = &unk_24EE5A168;
  v4[4] = v1;
  v4[5] = v2;
  JFX_configureCaptureSession(v3, v4);
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "JFX_isUsingInternalMicCaptureSessionQueue");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 2)
  {
    if (v4)
    {
      JFXLog_DebugCamera();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern");
    }
  }
  else if (v5 == 1 && (v4 & 1) == 0)
  {
    JFXLog_DebugCamera();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_1();

    objc_msgSend(v3, "setAutomaticallyConfiguresApplicationAudioSession:", 1);
  }

}

+ (BOOL)allowsDepthFromDualBackCamera
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "jfx_hasDualBackCamera"))
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("allowsDepthDualBackCamera"));
  else
    v4 = 0;

  return v4;
}

+ (id)sharedInstance
{
  JFXVideoCameraController *v2;
  void *v3;

  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_65_0);
  objc_msgSend((id)s_sharedInstanceLock, "lock");
  if (!s_sharedInstance)
  {
    v2 = objc_alloc_init(JFXVideoCameraController);
    v3 = (void *)s_sharedInstance;
    s_sharedInstance = (uint64_t)v2;

  }
  objc_msgSend((id)s_sharedInstanceLock, "unlock");
  return (id)s_sharedInstance;
}

void __42__JFXVideoCameraController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v1 = (void *)s_sharedInstanceLock;
  s_sharedInstanceLock = (uint64_t)v0;

}

- (void)prepareCameraForMode:(int64_t)a3 position:(int64_t)a4 completion:(id)a5
{
  id v8;
  BOOL v9;
  char v10;
  void (*v11)(OS_dispatch_queue *, _QWORD *);
  OS_dispatch_queue *captureSessionQueue;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  int64_t v17;
  char v18;

  v8 = a5;
  if (a3)
    v9 = a4 == 0;
  else
    v9 = 1;
  v10 = v9;
  if (v9)
    v11 = (void (*)(OS_dispatch_queue *, _QWORD *))MEMORY[0x24BDADFE8];
  else
    v11 = (void (*)(OS_dispatch_queue *, _QWORD *))MEMORY[0x24BDADCC0];
  captureSessionQueue = self->_captureSessionQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke;
  v14[3] = &unk_24EE5A1B0;
  v16 = a3;
  v17 = a4;
  v14[4] = self;
  v15 = v8;
  v18 = v10;
  v13 = v8;
  v11(captureSessionQueue, v14);

}

void __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[6];
  _QWORD block[6];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "cameraMode_captureSessionQueue") == *(_QWORD *)(a1 + 48)
    && objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == *(_QWORD *)(a1 + 56))
  {
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "JFX_resetSessionCaptureSessionQueue");
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend((id)s_sharedInstanceLock, "lock");
    v2 = (void *)s_sharedInstance;
    s_sharedInstance = 0;

    objc_msgSend((id)s_sharedInstanceLock, "unlock");
LABEL_5:
    v3 = *(void **)(a1 + 40);
    if (v3)
      dispatch_async(MEMORY[0x24BDAC9B8], v3);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCameraMode_captureSessionQueue:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 112);
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_3;
  block[3] = &unk_24EE58078;
  v7 = *(_QWORD *)(a1 + 48);
  block[4] = v4;
  block[5] = v7;
  dispatch_barrier_async(v5, block);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 104);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_4;
  v26[3] = &unk_24EE58078;
  v10 = *(_QWORD *)(a1 + 48);
  v26[4] = v8;
  v26[5] = v10;
  dispatch_async(v9, v26);
  v11 = *(void **)(a1 + 32);
  v25 = 0;
  LODWORD(v6) = objc_msgSend(v11, "JFX_buildCaptureSessionGraphError:", &v25);
  v12 = v25;
  v13 = v12;
  if (!(_DWORD)v6)
  {
    v17 = v12;
LABEL_12:
    JFXLog_camera();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromJFXCameraMode(*(_QWORD *)(a1 + 48));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v17;
      _os_log_error_impl(&dword_2269A9000, v19, OS_LOG_TYPE_ERROR, "error building capture graph for camera mode %@ position: %@\n\t%@", buf, 0x20u);

    }
    objc_msgSend((id)s_sharedInstanceLock, "lock");
    v20 = (void *)s_sharedInstance;
    s_sharedInstance = 0;

    objc_msgSend((id)s_sharedInstanceLock, "unlock");
    v18 = v17;
    goto LABEL_15;
  }
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 56);
  v24 = v13;
  v16 = objc_msgSend(v14, "JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:", v15, 1, 0, &v24);
  v17 = v24;

  if (!v16)
    goto LABEL_12;
  v18 = 0;
  if (v17)
    goto LABEL_12;
LABEL_15:
  v21 = *(void **)(a1 + 40);
  if (v21)
    dispatch_async(MEMORY[0x24BDAC9B8], v21);

}

uint64_t __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraMode_queryDataQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__JFXVideoCameraController_prepareCameraForMode_position_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraMode_dataOutSynchQueue:", *(_QWORD *)(a1 + 40));
}

- (void)startCameraSession:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  kdebug_trace();
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__JFXVideoCameraController_startCameraSession___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __47__JFXVideoCameraController_startCameraSession___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isRunning") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "JFX_startARCameraSessionController");
    kdebug_trace();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startRunning");
    kdebug_trace();
  }
  +[JTMotionData sharedInstance](JTMotionData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startMotion");

  kdebug_trace();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__JFXVideoCameraController_startCameraSession___block_invoke_2;
  block[3] = &unk_24EE580C8;
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __47__JFXVideoCameraController_startCameraSession___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopCameraSession:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  kdebug_trace();
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__JFXVideoCameraController_stopCameraSession___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __46__JFXVideoCameraController_stopCameraSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isRunning"))
  {
    kdebug_trace();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopRunning");
    kdebug_trace();
  }
  +[JTMotionData sharedInstance](JTMotionData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMotion");

  objc_msgSend(*(id *)(a1 + 32), "arCameraSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopARSession");

  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__JFXVideoCameraController_stopCameraSession___block_invoke_2;
    block[3] = &unk_24EE580C8;
    v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __46__JFXVideoCameraController_stopCameraSession___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)cameraType
{
  NSObject *queryDataQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__JFXVideoCameraController_cameraType__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__JFXVideoCameraController_cameraType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cameraType_queryDataQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)cameraPosition
{
  NSObject *queryDataQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__JFXVideoCameraController_cameraPosition__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__JFXVideoCameraController_cameraPosition__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_queryDataQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)captureVideoOrientation
{
  NSObject *queryDataQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__JFXVideoCameraController_captureVideoOrientation__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__JFXVideoCameraController_captureVideoOrientation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "captureVideoOrientation_queryDataQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)switchCamera:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__JFXVideoCameraController_switchCamera___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __41__JFXVideoCameraController_switchCamera___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == 1)
    v2 = 2;
  else
    v2 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__JFXVideoCameraController_switchCamera___block_invoke_2;
  v4[3] = &unk_24EE5A1D8;
  v6 = v2;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "switchCameraToPosition:completion:", v2, v4);

}

uint64_t __41__JFXVideoCameraController_switchCamera___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (a2)
      v6 = 0;
    else
      v6 = v5;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v6, a2);
  }
  return result;
}

- (void)switchCameraToPosition:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *captureSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke;
  block[3] = &unk_24EE59900;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(captureSessionQueue, block);

}

void __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue") == *(_QWORD *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke_2;
      block[3] = &unk_24EE580C8;
      v3 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "switchCameraToPosition:applyFFCZoom:configureLockedCamera:completion:");
  }
}

uint64_t __62__JFXVideoCameraController_switchCameraToPosition_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)switchCameraToPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *captureSessionQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a5;
  v11 = a6;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke;
  block[3] = &unk_24EE5A200;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a3;
  v13 = v11;
  v14 = v10;
  dispatch_async(captureSessionQueue, block);

}

void __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  v6 = objc_msgSend(v4, "JFX_configureCaptureSesstionForPosition:applyFFCZoom:configureLockedCamera:error:", v2, v3, v5, &v18);
  v7 = v18;
  JFXLog_DebugCamera();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "[JFX_configureCaptureSesstionForPosition:%@ applyFFCZoom:%@ configureLockedCamera:error:] result: %@, error: %@", buf, 0x2Au);

  }
  if (v7)
    v9 = 0;
  else
    v9 = v6;
  v10 = MEMORY[0x24BDAC760];
  if (v9 == 1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_69;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentARMetadata:", 0);
  if (*(_QWORD *)(a1 + 48))
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_2;
    v14[3] = &unk_24EE58FF0;
    v16 = *(id *)(a1 + 48);
    v15 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
}

void __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_69(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", *(_QWORD *)(a1 + 32), CFSTR("JTLastCameraPositionDefault"));

}

uint64_t __97__JFXVideoCameraController_switchCameraToPosition_applyFFCZoom_configureLockedCamera_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (double)cameraZoomFactorForUIZoomFactor:(double)a3 captureDeviceType:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1A40]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1A28]))
  {
    a3 = a3 + a3;
  }

  return a3;
}

- (void)setCameraZoomFactorForUIZoomFactor:(double)a3
{
  NSObject *captureSessionQueue;
  _QWORD v4[6];

  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke;
  v4[3] = &unk_24EE58078;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(captureSessionQueue, v4);
}

void __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke_2;
  block[3] = &unk_24EE583F8;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  block[4] = v4;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__JFXVideoCameraController_setCameraZoomFactorForUIZoomFactor___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "cameraZoomFactorForUIZoomFactor:captureDeviceType:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setZoomFactor:");
}

- (void)scaleCurrentZoomFactor:(double)a3
{
  double v5;

  -[JFXVideoCameraController zoomFactor](self, "zoomFactor");
  -[JFXVideoCameraController setZoomFactor:](self, "setZoomFactor:", v5 * a3);
}

- (void)setFFCZoom:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__JFXVideoCameraController_setFFCZoom_completion___block_invoke;
  v8[3] = &unk_24EE5A228;
  v9 = v6;
  v7 = v6;
  -[JFXVideoCameraController switchCameraToPosition:applyFFCZoom:configureLockedCamera:completion:](self, "switchCameraToPosition:applyFFCZoom:configureLockedCamera:completion:", 2, v4, 0, v8);

}

uint64_t __50__JFXVideoCameraController_setFFCZoom_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rampToZoom:(double)a3 rate:(double)a4
{
  NSObject *captureSessionQueue;
  _QWORD block[7];

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__JFXVideoCameraController_rampToZoom_rate___block_invoke;
  block[3] = &unk_24EE5A250;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __44__JFXVideoCameraController_rampToZoom_rate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_rampToZoom:rate:durationCaptureSessionQueue:", *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);
}

- (void)rampToZoom:(double)a3 duration:(double)a4
{
  NSObject *captureSessionQueue;
  _QWORD block[7];

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__JFXVideoCameraController_rampToZoom_duration___block_invoke;
  block[3] = &unk_24EE5A250;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __48__JFXVideoCameraController_rampToZoom_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_rampToZoom:rate:durationCaptureSessionQueue:", *(double *)(a1 + 40), 0.0, *(double *)(a1 + 48));
}

- (void)stopRampToZoom:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__JFXVideoCameraController_stopRampToZoom___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __43__JFXVideoCameraController_stopRampToZoom___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  JFX_configureCaptureDevice(v2, &__block_literal_global_71);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__JFXVideoCameraController_stopRampToZoom___block_invoke_3;
  v4[3] = &unk_24EE580A0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

uint64_t __43__JFXVideoCameraController_stopRampToZoom___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelVideoZoomRamp");
}

uint64_t __43__JFXVideoCameraController_stopRampToZoom___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)minFrameRate:(int *)a3 maxFrameRate:(int *)a4
{
  NSObject *captureSessionQueue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3810000000;
  v18 = &unk_226ACDFC7;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3810000000;
  v11 = &unk_226ACDFC7;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__JFXVideoCameraController_minFrameRate_maxFrameRate___block_invoke;
  block[3] = &unk_24EE5A2B8;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v8;
  dispatch_sync(captureSessionQueue, block);
  *a3 = *((int *)v9 + 10) / v9[4];
  *a4 = *((int *)v16 + 10) / v16[4];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
}

void __54__JFXVideoCameraController_minFrameRate_maxFrameRate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1[4] + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "activeVideoMinFrameDuration");
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
  }
  v4 = *(_QWORD *)(a1[5] + 8);
  *(_OWORD *)(v4 + 32) = v10;
  *(_QWORD *)(v4 + 48) = v11;

  objc_msgSend(*(id *)(a1[4] + 24), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activeVideoMaxFrameDuration");
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v7 = *(_QWORD *)(a1[6] + 8);
  *(_OWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 48) = v9;

}

- (void)setMinFrameRate:(int)a3 maxFrameRate:(int)a4
{
  NSObject *captureSessionQueue;
  _QWORD v5[5];
  int v6;
  int v7;

  captureSessionQueue = self->_captureSessionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke;
  v5[3] = &unk_24EE58078;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(captureSessionQueue, v5);
}

void __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[6];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke_2;
  v3[3] = &unk_24EE5A2E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);

}

uint64_t __57__JFXVideoCameraController_setMinFrameRate_maxFrameRate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDevice:minFrameRate:maxFrameRate:", a2, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (void)setFocusAndExposurePoint:(CGPoint)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[5];
  CGPoint v5;

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke;
  block[3] = &unk_24EE5A250;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureSessionQueue, block);
}

void __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke_2;
  v3[3] = &unk_24EE5A308;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);

}

void __53__JFXVideoCameraController_setFocusAndExposurePoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "JFX_configureLockedCaptureDeviceFocus:focusPoint:", v6, v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (id)debugFrameRateLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  -[JFXVideoCameraController minFrameRate:maxFrameRate:](self, "minFrameRate:maxFrameRate:", (char *)&v7 + 4, &v7);
  if (HIDWORD(v7) == (_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v2, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)videoAndAudioOutputSettings:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v2 = *MEMORY[0x24BDB1C40];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "recommendedVideoSettingsForAssetWriterWithOutputFileType:", *MEMORY[0x24BDB1C40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "recommendedAudioSettingsForAssetWriterWithOutputFileType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke_2;
  block[3] = &unk_24EE58280;
  v5 = *(id *)(a1 + 40);
  v10 = v4;
  v11 = v5;
  v9 = v3;
  v6 = v4;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__JFXVideoCameraController_videoAndAudioOutputSettings___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setCaptureTorchMode:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *captureSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke;
  block[3] = &unk_24EE59900;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(captureSessionQueue, block);

}

void __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasTorch"))
  {
    v3 = objc_msgSend(v2, "isTorchModeSupported:", *(_QWORD *)(a1 + 48));
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    if (v3)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_2;
      v8[3] = &unk_24EE5A330;
      v4 = *(_QWORD *)(a1 + 48);
      v8[4] = &v9;
      v8[5] = v4;
      JFX_configureCaptureDevice(v2, v8);
    }
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_3;
    v5[3] = &unk_24EE5A358;
    v6 = *(id *)(a1 + 40);
    v7 = &v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
  _Block_object_dispose(&v9, 8);

}

uint64_t __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "setTorchMode:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __59__JFXVideoCameraController_setCaptureTorchMode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)enableRecordingMovieMode:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *captureSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke;
  block[3] = &unk_24EE5A3A0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(captureSessionQueue, block);

}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  char v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isRecordingMovie_captureSessionQueue");
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 == v2)
  {
    if (*(_QWORD *)(a1 + 40))
      dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRecordingMovie_captureSessionQueue:", v3 != 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_2;
    v11[3] = &__block_descriptor_33_e25_v16__0__AVCaptureDevice_8l;
    v12 = *(_BYTE *)(a1 + 48);
    JFX_configureCaptureDevice(v4, v11);
    v6 = objc_msgSend(v4, "torchMode");
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v7, "setCachedMovieRecordingTorchMode:", v6);
      if (v6 == 2)
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isFlashScene"))
          v6 = 1;
        else
          v6 = 2;
      }
    }
    else
    {
      v6 = objc_msgSend(v7, "cachedMovieRecordingTorchMode");
    }
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_3;
    v9[3] = &unk_24EE59110;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setCaptureTorchMode:completion:", v6, v9);

  }
}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isSmoothAutoFocusSupported"))
  {
    objc_msgSend(v4, "setSmoothAutoFocusEnabled:", *(unsigned __int8 *)(a1 + 32));
    v3 = objc_msgSend(v4, "focusMode");
    if (objc_msgSend(v4, "isFocusModeSupported:", v3))
      objc_msgSend(v4, "setFocusMode:", v3);
  }

}

void __64__JFXVideoCameraController_enableRecordingMovieMode_completion___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (void)supportedFlashModes:(id)a3
{
  id v4;
  NSObject *captureSessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__JFXVideoCameraController_supportedFlashModes___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionQueue, v7);

}

void __48__JFXVideoCameraController_supportedFlashModes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "supportedFlashModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__JFXVideoCameraController_supportedFlashModes___block_invoke_2;
  v5[3] = &unk_24EE58FF0;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __48__JFXVideoCameraController_supportedFlashModes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)capturePhotoWithFlash:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *captureSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke;
  block[3] = &unk_24EE59900;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(captureSessionQueue, block);

}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD block[5];
  char v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "JFX_isARKitEnabledCaptureSessionQueue");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 112);
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_2;
  block[3] = &unk_24EE57C98;
  v37 = v2;
  block[4] = v3;
  dispatch_barrier_async(v4, block);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 104);
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_3;
  v35[3] = &unk_24EE57B60;
  v35[4] = v6;
  dispatch_async(v7, v35);
  v8 = MEMORY[0x2276A1F6C](*(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 128);
  *(_QWORD *)(v9 + 128) = v8;

  v11 = *MEMORY[0x24BDB22B0];
  v45[0] = *MEMORY[0x24BDB22A0];
  v45[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v15)
        objc_enumerationMutation(v12);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(*((_QWORD *)&v31 + 1) + 8 * v16));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "availablePhotoCodecTypes", (_QWORD)v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));

      if ((v18 & 1) != 0)
        break;
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 120);
      *(_QWORD *)(v19 + 120) = 0;

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v14)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v24 = (void *)MEMORY[0x24BDB24C8];
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    v42 = *MEMORY[0x24BDB2268];
    v43 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "photoSettingsWithFormat:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "ownerName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v40 = *MEMORY[0x24BDD9470];
      v38 = *MEMORY[0x24BDD9440];
      objc_msgSend(*(id *)(a1 + 32), "ownerName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMetadata:", v30);

    }
    objc_msgSend(v23, "setMaxPhotoDimensions:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "maxPhotoDimensions"));
    objc_msgSend(v23, "setFlashMode:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "capturePhotoWithSettings:delegate:", v23);
  }
  else
  {
LABEL_9:
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 120);
    *(_QWORD *)(v21 + 120) = 0;

    v23 = v12;
  }

LABEL_15:
}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mostRecentARMetadata_queryDataQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceAnchor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStillImageFaceAnchor_queryDataQueue:", v2);

  }
}

void __61__JFXVideoCameraController_capturePhotoWithFlash_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentFrameSet_dataOutSynchQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCapturedPhotoFrameSet_dataOutSynchQueue:", v2);

}

- (id)createLivePlayerCameraSource
{
  id v3;
  NSObject *livePlayerSourceQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BE79090]);
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__JFXVideoCameraController_createLivePlayerCameraSource__block_invoke;
  v9[3] = &unk_24EE57AA8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(livePlayerSourceQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

uint64_t __56__JFXVideoCameraController_createLivePlayerCameraSource__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeLivePlayerCameraSource:(id)a3
{
  id v4;
  NSObject *livePlayerSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__JFXVideoCameraController_removeLivePlayerCameraSource___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(livePlayerSourceQueue, v7);

}

uint64_t __57__JFXVideoCameraController_removeLivePlayerCameraSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addVideoRenderDelegate:(id)a3
{
  id v4;
  NSObject *videoDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  videoDelegateQueue = self->_videoDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__JFXVideoCameraController_addVideoRenderDelegate___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(videoDelegateQueue, v7);

}

uint64_t __51__JFXVideoCameraController_addVideoRenderDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeVideoRenderDelegate:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *videoDelegateQueue;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  videoDelegateQueue = self->_videoDelegateQueue;
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v13 = v6;
    dispatch_async(videoDelegateQueue, block);
    v9 = v13;
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke_2;
    v10[3] = &unk_24EE57AA8;
    v10[4] = self;
    v11 = v6;
    dispatch_sync(videoDelegateQueue, v10);
    v9 = v11;
  }

}

uint64_t __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__JFXVideoCameraController_removeVideoRenderDelegate_async___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addAudioRenderDelegate:(id)a3
{
  id v4;
  NSObject *audioDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  audioDelegateQueue = self->_audioDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__JFXVideoCameraController_addAudioRenderDelegate___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(audioDelegateQueue, v7);

}

uint64_t __51__JFXVideoCameraController_addAudioRenderDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAudioRenderDelegate:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *audioDelegateQueue;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  audioDelegateQueue = self->_audioDelegateQueue;
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v13 = v6;
    dispatch_async(audioDelegateQueue, block);
    v9 = v13;
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke_2;
    v10[3] = &unk_24EE57AA8;
    v10[4] = self;
    v11 = v6;
    dispatch_sync(audioDelegateQueue, v10);
    v9 = v11;
  }

}

uint64_t __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__JFXVideoCameraController_removeAudioRenderDelegate_async___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)saveToPhotoLibrary:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  dispatch_semaphore_t v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    JFXLog_DebugCamera();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[JFXVideoCameraController saveToPhotoLibrary:].cold.1();

    objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke;
    v12[3] = &unk_24EE57B60;
    v13 = v3;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke_2;
    v9[3] = &unk_24EE5A3C8;
    v10 = v13;
    v11 = v4;
    v8 = v4;
    objc_msgSend(v6, "performChanges:completionHandler:", v12, v9);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }

}

void __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDE3490], "creationRequestForAssetFromVideoAtFileURL:", *(_QWORD *)(a1 + 32));

}

void __47__JFXVideoCameraController_saveToPhotoLibrary___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  JFXLog_DebugCamera();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("Success");
    if (!a2)
      v8 = v5;
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEBUG, "Finished saving %@. %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)preProcessFrameWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 timestamp:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *dataOutSynchQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __CVBuffer *v18;
  double v19;
  CMTime v20;
  CMTime time;

  v10 = a4;
  v11 = a6;
  CMTimeMakeWithSeconds(&v20, a5, 1000000000);
  time = v20;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  CVPixelBufferRetain(a3);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke;
  v15[3] = &unk_24EE5A3F0;
  v15[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v18 = a3;
  v13 = v11;
  v14 = v10;
  dispatch_async(dataOutSynchQueue, v15);

}

void __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  CMTime v10;
  id v11;
  CMTime time;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(double *)(a1 + 64);
  v11 = 0;
  objc_msgSend(v3, "JFX_createPVFrameSetFromPixelBuffer:withMetadata:timeInterval:error:", v2, v4, &v11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  CMTimeMakeWithSeconds(&v10, *(Float64 *)(a1 + 64), 1000000000);
  time = v10;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (v7)
  {
    JFXLog_camera();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:", v6);
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);

}

- (void)notifyExternalARKitFaceTrackedImageData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dataOutSynchQueue;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  JFXVideoCameraController *v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cameraIntrinsics");
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__JFXVideoCameraController_notifyExternalARKitFaceTrackedImageData_completion___block_invoke;
  v17[3] = &unk_24EE5A418;
  v26 = self;
  v27 = v6;
  v18 = v9;
  v17[4] = v10;
  v19 = 0;
  v21 = v11;
  v20 = v12;
  v22 = 0;
  v24 = v13;
  v23 = v14;
  v25 = 0;
  v28 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_async(dataOutSynchQueue, v17);

}

uint64_t __79__JFXVideoCameraController_notifyExternalARKitFaceTrackedImageData_completion___block_invoke(uint64_t a1)
{
  double Width;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", objc_msgSend(*(id *)(a1 + 88), "orientation"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer")));
  objc_msgSend(*(id *)(a1 + 80), "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", 0, objc_msgSend(*(id *)(a1 + 88), "cameraPosition"));
  if (objc_msgSend(*(id *)(a1 + 88), "hasValidFaceData"))
    v3 = objc_msgSend(*(id *)(a1 + 80), "faceTrackingEnabled");
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 80), "setHasValidFaceData:", v3);
  if ((objc_msgSend(*(id *)(a1 + 80), "sessionRequiresFaceTracking") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 88), "requiresFaceTracking") ^ 1;
  v5 = objc_msgSend(*(id *)(a1 + 80), "skipARProcessingWhenNoFaceDataIsPresent");
  v6 = *(void **)(a1 + 80);
  if (v5 && v4 | v3 ^ 1)
  {
    v7 = objc_msgSend(*(id *)(a1 + 88), "pixelBuffer");
    objc_msgSend(*(id *)(a1 + 88), "timestamp");
    return objc_msgSend(v6, "preProcessFrameWithPixelBuffer:metadata:timestamp:completion:", v7, 0, 0);
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 80), "JFX_isARKitEnabledCaptureSessionQueue") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 80), "JFX_setupARCameraSessionController");
    objc_msgSend(*(id *)(a1 + 80), "JFX_startARCameraSessionController");
    result = *(_QWORD *)(a1 + 96);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notifyExternalImageData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dataOutSynchQueue;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  JFXVideoCameraController *v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cameraIntrinsics");
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke;
  v17[3] = &unk_24EE5A418;
  v26 = self;
  v27 = v6;
  v18 = v9;
  v17[4] = v10;
  v19 = 0;
  v21 = v11;
  v20 = v12;
  v22 = 0;
  v24 = v13;
  v23 = v14;
  v25 = 0;
  v28 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_async(dataOutSynchQueue, v17);

}

void __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke(uint64_t a1)
{
  double Width;
  uint64_t v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  Float64 v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  JFXARMetadata *v19;
  JFXARMetadata *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  const __CFString *v41;
  _QWORD v42[2];
  CGRect v43;

  v42[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", objc_msgSend(*(id *)(a1 + 88), "orientation"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer"));
  objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 88), "pixelBuffer")));
  objc_msgSend(*(id *)(a1 + 80), "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", 0, objc_msgSend(*(id *)(a1 + 88), "cameraPosition"));
  if (objc_msgSend(*(id *)(a1 + 88), "hasValidFaceData"))
    v3 = objc_msgSend(*(id *)(a1 + 80), "faceTrackingEnabled");
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 80), "setHasValidFaceData:", v3);
  if ((objc_msgSend(*(id *)(a1 + 80), "sessionRequiresFaceTracking") & 1) != 0)
  {
    if (!(_DWORD)v3)
    {
LABEL_6:
      v4 = 0;
      goto LABEL_10;
    }
  }
  else if ((v3 & objc_msgSend(*(id *)(a1 + 88), "requiresFaceTracking") & 1) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 88), "normalizedFaceRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 88), "rollAngle");
  memset(&v40, 0, sizeof(v40));
  objc_msgSend(*(id *)(a1 + 88), "timestamp");
  CMTimeMakeWithSeconds(&v40, v13, 1000000);
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, 1, objc_msgSend(*(id *)(a1 + 88), "captureFramesPerSecond"));
  v43.origin.x = v6;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  v4 = 0;
  if (!CGRectEqualToRect(v43, *MEMORY[0x24BDBF090]))
  {
    v14 = *(void **)(a1 + 80);
    v15 = objc_msgSend(*(id *)(a1 + 88), "pixelBuffer");
    objc_msgSend(*(id *)(a1 + 88), "cameraIntrinsics");
    v38 = v40;
    v37 = v39;
    objc_msgSend(v14, "JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:", v15, &v38, &v37, 4, 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 88), "cameraIntrinsics");
  HIDWORD(v16) = 0;
  HIDWORD(v17) = 0;
  v33 = v17;
  v34 = v16;
  HIDWORD(v18) = 0;
  v32 = v18;
  v19 = [JFXARMetadata alloc];
  v20 = v19;
  if (v4)
  {
    v21 = -[JFXARMetadata initWithFaceAnchor:cameraIntrinsics:](v19, "initWithFaceAnchor:cameraIntrinsics:", v4, *(double *)&v34, *(double *)&v33, *(double *)&v32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "cameraFrameResolution_dataOutSynchQueue");
    v21 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](v20, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48), *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48), v34, v33, v32, v22, v23);
  }
  v24 = (void *)v21;
  v25 = *(void **)(a1 + 80);
  v26 = objc_msgSend(*(id *)(a1 + 88), "pixelBuffer");
  v41 = CFSTR("PVFrameSetMetadataARMetadataKey");
  v42[0] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "timestamp");
  v29 = v28;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke_2;
  v35[3] = &unk_24EE5A440;
  v35[4] = *(_QWORD *)(a1 + 80);
  v30 = v24;
  v36 = v30;
  objc_msgSend(v25, "preProcessFrameWithPixelBuffer:metadata:timestamp:completion:", v26, v27, v35, v29);

  v31 = *(_QWORD *)(a1 + 96);
  if (v31)
    (*(void (**)(void))(v31 + 16))();

}

uint64_t __63__JFXVideoCameraController_notifyExternalImageData_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setMostRecentARMetadata:", *(_QWORD *)(result + 40));
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  NSObject *audioDelegateQueue;
  _QWORD v8[6];

  CFRetain(a4);
  audioDelegateQueue = self->_audioDelegateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
  v8[3] = &unk_24EE58078;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(audioDelegateQueue, v8);
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
  v7[3] = &unk_24EE5A468;
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_4;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async(v5, block);
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3;
  v7[3] = &unk_24EE58078;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAudioSample:", *(_QWORD *)(a1 + 40));
}

void __79__JFXVideoCameraController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_4(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  CFTypeRef v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  __CVBuffer *v30;
  CVPixelBufferRef v31;
  __CVBuffer *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  double x;
  double y;
  double width;
  double height;
  CVImageBufferRef ImageBuffer;
  int64_t v57;
  int64_t v58;
  double v59;
  uint64_t v60;
  void *v61;
  JFXARMetadata *v62;
  JFXARMetadata *v63;
  uint64_t v64;
  uint64_t v65;
  __CVBuffer *v66;
  const __CFDictionary *v67;
  const void *Value;
  const void *v69;
  void *v70;
  NSObject *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  CMTime v80;
  CMTime v81;
  id v82;
  CMTime v83;
  CMTime v84;
  CGRect v85;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_videoOutput);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_64;
  kdebug_trace();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_videoOutput);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sampleBufferWasDropped");
  v9 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "sampleBuffer");
  v10 = v9;
  if (v8)
  {
    v11 = CMGetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC0CE8], 0);
    v12 = v11;
    if (v11 && !CFEqual(v11, (CFTypeRef)*MEMORY[0x24BDC0D20]) && !CFEqual(v12, (CFTypeRef)*MEMORY[0x24BDC0D28]))
      CFEqual(v12, (CFTypeRef)*MEMORY[0x24BDC0D18]);
    kdebug_trace();
    JFXLog_DebugCamera();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.5();

    memset(&v84, 0, sizeof(v84));
    CMSampleBufferGetPresentationTimeStamp(&v84, v10);
    v83 = v84;
    -[JFXVideoCameraController JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:](self, "JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:", &v83);
    v10 = 0;
  }
  if (self->_depthOutput)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "depthDataWasDropped"))
    {
      objc_msgSend(v14, "droppedReason");
      kdebug_trace();
      JFXLog_DebugCamera();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.4(v14);

      v16 = 0;
      LOBYTE(v8) = 1;
    }
    else
    {
      objc_msgSend(v14, "depthData");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = 0;
  }
  -[JFXVideoCameraController setPvDetectedFacesArray_dataOutSynchQueue:](self, "setPvDetectedFacesArray_dataOutSynchQueue:", 0);
  -[JFXVideoCameraController setMetadataFaceObjectsArray_dataOutSynchQueue:](self, "setMetadataFaceObjectsArray_dataOutSynchQueue:", 0);
  -[JFXVideoCameraController setMetadataTrackedFacesArray_dataOutSynchQueue:](self, "setMetadataTrackedFacesArray_dataOutSynchQueue:", 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_metadataOutput);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureMetadataOutput metadataObjectTypes](self->_metadataOutput, "metadataObjectTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v18;
  if (v17)
  {
    objc_msgSend(v17, "metadataObjects");
    v19 = objc_claimAutoreleasedReturnValue();
    -[JFXVideoCameraController JFX_processMetadataObjectsDataOutSynchQueue:](self, "JFX_processMetadataObjectsDataOutSynchQueue:", v19);
LABEL_26:

    goto LABEL_27;
  }
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BDB1ED0]))
  {
    JFXLog_DebugCamera();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.3();
    LOBYTE(v8) = 1;
    goto LABEL_26;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXVideoCameraController pvDetectedFacesArray_dataOutSynchQueue](self, "pvDetectedFacesArray_dataOutSynchQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[JFXVideoCameraController pvDetectedFacesArray_dataOutSynchQueue](self, "pvDetectedFacesArray_dataOutSynchQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE795E0]);

  }
  if ((v8 & 1) == 0)
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE78FF0]), "initWithSampleBuffer:", v10);
    v26 = (void *)v25;
    if (v16)
    {
      v27 = (void *)v25;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("JFXDepthPreQuantization"));

      if (v29)
      {
        v16 = objc_retainAutorelease(v16);
        v30 = (__CVBuffer *)objc_msgSend(v16, "depthDataMap");
        if (v30)
        {
          v31 = copySimulatedL010RoundtripImage(v30);
          if (v31)
          {
            v32 = v31;
            v82 = 0;
            objc_msgSend(v16, "depthDataByReplacingDepthDataMapWithPixelBuffer:error:", v31, &v82);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v82;
            if (v77)
            {
              v75 = v33;
              JFXLog_camera();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.2();

              v33 = v75;
            }
            else
            {

              v16 = v33;
            }
            CVPixelBufferRelease(v32);

          }
        }
      }
      v26 = v27;
    }
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79020]), "initWithColorBuffer:depthData:metadata:", v26, v16, v20);
    if (self->_runningARKit_dataOutSynchQueue)
    {
      if (objc_msgSend(v79, "containsObject:", *MEMORY[0x24BDB1ED0]))
      {
        -[JFXVideoCameraController metadataTrackedFacesArray_dataOutSynchQueue](self, "metadataTrackedFacesArray_dataOutSynchQueue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (v36)
        {
          -[JFXVideoCameraController arCameraSessionController](self, "arCameraSessionController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[JFXVideoCameraController metadataTrackedFacesArray_dataOutSynchQueue](self, "metadataTrackedFacesArray_dataOutSynchQueue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v38, "copy");
          objc_msgSend(MEMORY[0x24BDBCE30], "array");
          v40 = v16;
          v41 = v7;
          v42 = v26;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "provideSensorFrameSet:trackedFacesMetadata:faceObjectsMetadata:", v78, v39, v43);

          v26 = v42;
          v7 = v41;
          v16 = v40;

        }
        else
        {
          JFXLog_DebugCamera();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            -[JFXVideoCameraController dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.1();

        }
      }
    }
    else
    {
      v76 = v26;
      if (-[JFXVideoCameraController faceTrackingEnabled](self, "faceTrackingEnabled"))
      {
        -[JFXVideoCameraController metadataFaceObjectsArray_dataOutSynchQueue](self, "metadataFaceObjectsArray_dataOutSynchQueue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "copy");
        -[JFXVideoCameraController JFX_currentAVMetadataFaceObject:](self, "JFX_currentAVMetadataFaceObject:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = 0.0;
        if (objc_msgSend(v46, "hasRollAngle"))
        {
          objc_msgSend(v46, "rollAngle");
          v47 = v48;
        }
        -[JFXVideoCameraController cameraDeviceIntrinsics_dataOutSynchQueue](self, "cameraDeviceIntrinsics_dataOutSynchQueue");
        HIDWORD(v49) = 0;
        HIDWORD(v50) = 0;
        v73 = v50;
        v74 = v49;
        HIDWORD(v51) = 0;
        v72 = v51;
        objc_msgSend(v46, "bounds");
        x = v85.origin.x;
        y = v85.origin.y;
        width = v85.size.width;
        height = v85.size.height;
        if (CGRectEqualToRect(v85, *MEMORY[0x24BDBF090]))
          goto LABEL_51;
        ImageBuffer = CMSampleBufferGetImageBuffer(v10);
        memset(&v84, 0, sizeof(v84));
        CMSampleBufferGetPresentationTimeStamp(&v84, v10);
        memset(&v83, 0, sizeof(v83));
        CMSampleBufferGetDuration(&v83, v10);
        v57 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
        v58 = -[JFXVideoCameraController captureVideoOrientation_dataOutSynchQueue](self, "captureVideoOrientation_dataOutSynchQueue");
        v81 = v84;
        v80 = v83;
        *(float *)&v59 = v47;
        -[JFXVideoCameraController JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:](self, "JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:", ImageBuffer, &v81, &v80, v58, v57, 1, *(double *)&v74, *(double *)&v73, *(double *)&v72, x, y, width, height, v59);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!v60)
        {
LABEL_51:
          v63 = [JFXARMetadata alloc];
          -[JFXVideoCameraController cameraFrameResolution_dataOutSynchQueue](self, "cameraFrameResolution_dataOutSynchQueue");
          v62 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](v63, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48), *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48), v74, v73, v72, v64, v65);
        }
        else
        {
          v61 = (void *)v60;
          v62 = -[JFXARMetadata initWithFaceAnchor:cameraIntrinsics:]([JFXARMetadata alloc], "initWithFaceAnchor:cameraIntrinsics:", v60, *(double *)&v74, *(double *)&v73, *(double *)&v72);

        }
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v62, CFSTR("PVFrameSetMetadataARMetadataKey"));
        -[JFXVideoCameraController setMostRecentARMetadata:](self, "setMostRecentARMetadata:", v62);

      }
      v66 = CMSampleBufferGetImageBuffer(v10);
      v67 = CVBufferCopyAttachments(v66, kCVAttachmentMode_ShouldPropagate);
      Value = CFDictionaryGetValue(v67, (const void *)*MEMORY[0x24BDC5490]);
      v69 = CFDictionaryGetValue(v67, (const void *)*MEMORY[0x24BDC5510]);
      if (!Value || !v69)
      {
        objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "jfx_attachColorSpaceToPixelBuffer:", v66);

      }
      v26 = v76;
      if (v67)
        CFRelease(v67);
      objc_msgSend(v78, "setMetadataDict:", v20);
      -[JFXVideoCameraController JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:](self, "JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:", v78);
    }

  }
  kdebug_trace();

LABEL_64:
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *captureSessionQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke;
  block[3] = &unk_24EE585C0;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(captureSessionQueue, block);

}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  v4 = v3 == (void *)*MEMORY[0x24BDB22A0];
  *(_QWORD *)(v2 + 120) = 0;

  v5 = (void *)MEMORY[0x2276A1F6C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(v8 + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_2;
  block[3] = &unk_24EE5A490;
  block[4] = v8;
  v13 = v9;
  v16 = v4;
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v11 = v5;
  dispatch_async(v10, block);

}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "capturedPhotoFrameSet_dataOutSynchQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCapturedPhotoFrameSet_dataOutSynchQueue:", 0);
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_3;
  block[3] = &unk_24EE5A490;
  v6 = v2;
  v7 = *(id *)(a1 + 40);
  v10 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v4 = v2;
  dispatch_async(v3, block);

}

void __73__JFXVideoCameraController_captureOutput_didFinishProcessingPhoto_error___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  id v11;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v3)
  {
    v4 = v3;
LABEL_5:

    v5 = 0;
    v2 = 0;
    goto LABEL_6;
  }
  v11 = 0;
  +[JFXMediaURLManager capturedPhotoURL:isHEIF:](JFXMediaURLManager, "capturedPhotoURL:isHEIF:", &v11, *(unsigned __int8 *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    v4 = v6;

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 48), "fileDataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v7, "writeToURL:options:error:", v5, 1, &v10);
  v9 = v10;
  v4 = v9;
  if (!v8 || v9)
  {

    v5 = 0;
    v2 = 0;
  }

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)JFX_processMetadataObjectsDataOutSynchQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  NSObject *captureSessionQueue;
  NSObject *queryDataQueue;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD block[7];
  _QWORD v26[4];
  id v27;
  JFXVideoCameraController *v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[3];
  char v40;
  CGRect v41;
  CGRect v42;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16;
  v37 = __Block_byref_object_dispose__16;
  v38 = 0;
  v8 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke;
  v26[3] = &unk_24EE5A4E0;
  v9 = v6;
  v27 = v9;
  v28 = self;
  v10 = v5;
  v29 = v10;
  v31 = v39;
  v32 = &v33;
  v11 = v7;
  v30 = v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v26);
  if (-[JFXVideoCameraController currentCameraPosition_dataOutSynchQueue](self, "currentCameraPosition_dataOutSynchQueue") == 2)
  {
    v12 = (void *)v34[5];
    if (v12)
    {
      objc_msgSend(v12, "bounds");
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
      MidX = CGRectGetMidX(v41);
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      MidY = CGRectGetMidY(v42);
      captureSessionQueue = self->_captureSessionQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_3;
      block[3] = &unk_24EE5A250;
      block[4] = self;
      *(CGFloat *)&block[5] = MidX;
      *(CGFloat *)&block[6] = MidY;
      dispatch_async(captureSessionQueue, block);
    }
  }
  queryDataQueue = self->_queryDataQueue;
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_5;
  v24[3] = &unk_24EE58380;
  v24[4] = self;
  v24[5] = v39;
  dispatch_barrier_async(queryDataQueue, v24);
  v21 = (void *)objc_msgSend(v10, "copy");
  -[JFXVideoCameraController setPvDetectedFacesArray_dataOutSynchQueue:](self, "setPvDetectedFacesArray_dataOutSynchQueue:", v21);

  v22 = (void *)objc_msgSend(v9, "copy");
  -[JFXVideoCameraController setMetadataFaceObjectsArray_dataOutSynchQueue:](self, "setMetadataFaceObjectsArray_dataOutSynchQueue:", v22);

  v23 = (void *)objc_msgSend(v11, "copy");
  -[JFXVideoCameraController setMetadataTrackedFacesArray_dataOutSynchQueue:](self, "setMetadataTrackedFacesArray_dataOutSynchQueue:", v23);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v39, 8);

}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  AVMetadataFaceObject *v7;
  void *v8;
  uint64_t v9;
  AVMetadataFaceObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v14 = a2;
  objc_msgSend(v14, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1E98]);

  objc_msgSend(v14, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1ED0]);

  if (v4)
  {
    v7 = (AVMetadataFaceObject *)v14;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    MakePVFaceDetection(v7, (AVCaptureVideoOrientation)objc_msgSend(*(id *)(a1 + 40), "captureVideoOrientation_dataOutSynchQueue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (!*(_QWORD *)(v9 + 40))
    {
      v10 = v7;
      v11 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v10;
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v12 = v14;
  if (v6)
  {
    v13 = v14;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
    objc_msgSend(v13, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE05A40]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_2;
      v15[3] = &unk_24EE5A4B8;
      v15[4] = *(_QWORD *)(a1 + 64);
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
      goto LABEL_7;
    }
LABEL_8:

    v12 = v14;
  }

}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v6 = a2;
  v7 = *MEMORY[0x24BE059E8];
  v11 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE059E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 == 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_4;
  v3[3] = &unk_24EE5A308;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);

}

uint64_t __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __72__JFXVideoCameraController_JFX_processMetadataObjectsDataOutSynchQueue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasValidFaceData_queryDataQueue:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:(id *)a3
{
  NSObject *videoDelegateQueue;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  videoDelegateQueue = self->_videoDelegateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke;
  v4[3] = &unk_24EE57FD8;
  v4[4] = self;
  v5 = *a3;
  dispatch_async(videoDelegateQueue, v4);
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_2;
  v3[3] = &unk_24EE5A508;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_3;
  v6[3] = &unk_24EE57FD8;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_OWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 56);
    return objc_msgSend(v3, "droppedVideoFrame:", &v4);
  }
  return result;
}

- (void)JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue:(id)a3
{
  id v4;
  AVCaptureDevicePosition v5;
  int64_t v6;
  int64_t v7;
  UIInterfaceOrientation v8;
  void *v9;
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
  AVCaptureVideoOrientation v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *videoDelegateQueue;
  id v31;
  NSObject *livePlayerSourceQueue;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD block[5];
  id v37;
  _QWORD v38[2];
  CMQuaternion v39;

  v4 = a3;
  v5 = -[JFXVideoCameraController cameraPosition](self, "cameraPosition");
  v6 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  v7 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
  if (-[JFXVideoCameraController cameraMode](self, "cameraMode"))
  {
    v8 = v6;
  }
  else
  {
    v7 = 1;
    v8 = UIInterfaceOrientationPortrait;
  }
  +[JTMotionData sharedInstance](JTMotionData, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentOrientation");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "rollRadians");
  v19 = v18;
  v20 = -[JFXVideoCameraController captureVideoOrientation_dataOutSynchQueue](self, "captureVideoOrientation_dataOutSynchQueue");
  v39.x = v11;
  v39.y = v13;
  v39.z = v15;
  v39.w = v17;
  MakePVCameraFrameMetadata(v5, v39, v19, v8, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadataObject:forKey:", v21, *MEMORY[0x24BE79580]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadataObject:forKey:", v22, CFSTR("PVFrameSetMetadataDeviceOrientationkey"));

  objc_msgSend(v4, "colorImageBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "size");
  v25 = v24;
  v27 = v26;

  v38[0] = v25;
  v38[1] = v27;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v38, "{CGSize=dd}");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadataObject:forKey:", v28, CFSTR("PVFrameSetMetadataOriginalBufferSizeKey"));

  -[JFXVideoCameraController setCurrentFrameSet_dataOutSynchQueue:](self, "setCurrentFrameSet_dataOutSynchQueue:", v4);
  v29 = MEMORY[0x24BDAC760];
  videoDelegateQueue = self->_videoDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v31 = v4;
  v37 = v31;
  dispatch_async(videoDelegateQueue, block);
  livePlayerSourceQueue = self->_livePlayerSourceQueue;
  v34[0] = v29;
  v34[1] = 3221225472;
  v34[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_4;
  v34[3] = &unk_24EE57AA8;
  v34[4] = self;
  v35 = v31;
  v33 = v31;
  dispatch_async(livePlayerSourceQueue, v34);

}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_2;
  v4[3] = &unk_24EE5A530;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_3;
  v7[3] = &unk_24EE57AA8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderVideoFrame:", *(_QWORD *)(a1 + 40));
}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_5;
  v4[3] = &unk_24EE5A558;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_6;
  v7[3] = &unk_24EE57AA8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __80__JFXVideoCameraController_JFX_notifyVideoDelegatesOfFrameSetDataOutSynchQueue___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraFrameSetRecieved:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateFrame:(id)a3
{
  id v4;
  Float64 v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  NSObject *captureSessionQueue;
  JFXARMetadata *v20;
  uint64_t v21;
  double v22;
  double v23;
  JFXARMetadata *v24;
  _QWORD v25[5];
  JFXARMetadata *v26;
  _QWORD block[7];
  CMTime v28;
  CMTime time;
  CGRect v30;
  CGRect v31;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  CMTimeMakeWithSeconds(&v28, v5, 1000000000);
  time = v28;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
  v8 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  v9 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(v8);
  if (!-[JFXVideoCameraController cameraMode](self, "cameraMode"))
    v9 = 1;
  +[JFXFaceTrackingUtilities faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:](JFXFaceTrackingUtilities, "faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:", v8, v7);
  +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:](JFXFaceAnchor, "faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = JFXIsVideoCameraMode(-[JFXVideoCameraController cameraMode_dataOutSynchQueue](self, "cameraMode_dataOutSynchQueue"));
  v12 = MEMORY[0x24BDAC760];
  if (!v11
    && -[JFXVideoCameraController cameraMode_dataOutSynchQueue](self, "cameraMode_dataOutSynchQueue")
    && -[JFXVideoCameraController currentCameraPosition_dataOutSynchQueue](self, "currentCameraPosition_dataOutSynchQueue") == 2&& v10)
  {
    objc_msgSend(v10, "normalizedFaceRect");
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MidY = CGRectGetMidY(v31);
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke;
    block[3] = &unk_24EE5A250;
    block[4] = self;
    *(CGFloat *)&block[5] = MidX;
    *(CGFloat *)&block[6] = MidY;
    dispatch_async(captureSessionQueue, block);
  }
  v20 = -[JFXARMetadata initWithARFrame:faceAnchor:]([JFXARMetadata alloc], "initWithARFrame:faceAnchor:", v4, v10);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("PVFrameSetMetadataARMetadataKey"));
  v21 = objc_msgSend(v4, "capturedImage");
  objc_msgSend(v4, "timestamp");
  v23 = v22;
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke_3;
  v25[3] = &unk_24EE5A440;
  v25[4] = self;
  v26 = v20;
  v24 = v20;
  -[JFXVideoCameraController preProcessFrameWithPixelBuffer:metadata:timestamp:completion:](self, "preProcessFrameWithPixelBuffer:metadata:timestamp:completion:", v21, v6, v25, v23);

}

void __43__JFXVideoCameraController_didUpdateFrame___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__JFXVideoCameraController_didUpdateFrame___block_invoke_2;
  v3[3] = &unk_24EE5A308;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  JFX_configureCaptureDevice(v2, v3);

}

uint64_t __43__JFXVideoCameraController_didUpdateFrame___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __43__JFXVideoCameraController_didUpdateFrame___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setMostRecentARMetadata:", *(_QWORD *)(result + 40));
  return result;
}

- (BOOL)faceTrackingEnabled
{
  char v3;

  v3 = isFaceTrackingEnabledOnBackCamera();
  if (-[JFXVideoCameraController cameraPosition](self, "cameraPosition") != 1)
    return -[JFXVideoCameraController cameraPosition](self, "cameraPosition") != 0;
  return v3;
}

- (id)updateCurrentlyTrackedFaceID:(id)a3
{
  id v4;
  NSObject *dataOutSynchQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__JFXVideoCameraController_updateCurrentlyTrackedFaceID___block_invoke;
  block[3] = &unk_24EE58190;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dataOutSynchQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__JFXVideoCameraController_updateCurrentlyTrackedFaceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "JFX_updateCurrentlyTrackedFaceID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)JFX_buildCaptureSessionGraphError:(id *)a3
{
  AVCaptureSession *v5;
  AVCaptureSession *captureSession;
  AVCaptureSession *v7;
  AVCaptureSession *audioSession;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;

  v5 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x24BDB24D0]);
  captureSession = self->_captureSession;
  self->_captureSession = v5;

  v7 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x24BDB24D0]);
  audioSession = self->_audioSession;
  self->_audioSession = v7;

  if (-[JFXVideoCameraController cameraMode_captureSessionQueue](self, "cameraMode_captureSessionQueue") == 1)
  {
    v9 = 1;
  }
  else
  {
    -[JFXVideoCameraController callObserver](self, "callObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "callCount") > 0;

  }
  v11 = -[JFXVideoCameraController JFX_setupCaptureSessionVideoDataOutputError:](self, "JFX_setupCaptureSessionVideoDataOutputError:", a3);
  if (v11)
  {
    v11 = -[JFXVideoCameraController JFX_setupCaptureSessionPhotoError:](self, "JFX_setupCaptureSessionPhotoError:", a3);
    if (!v11 || v9)
    {
      if (!v11)
        return v11;
    }
    else if (!-[JFXVideoCameraController JFX_setupCaptureSessionAudioError:](self, "JFX_setupCaptureSessionAudioError:", a3))
    {
      LOBYTE(v11) = 0;
      return v11;
    }
    -[JFXVideoCameraController JFX_observeCaptureSessionNotifications:](self, "JFX_observeCaptureSessionNotifications:", self->_captureSession);
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (BOOL)JFX_setupCaptureSessionVideoDataOutputError:(id *)a3
{
  AVCaptureVideoDataOutput *v5;
  AVCaptureVideoDataOutput *videoOutput;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;

  v5 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x24BDB2508]);
  videoOutput = self->_videoOutput;
  self->_videoOutput = v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("alwaysDiscardsLateVideoFrames"));

  JFXLog_DebugCamera();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[JFXVideoCameraController JFX_setupCaptureSessionVideoDataOutputError:].cold.1(v8, v9);

  -[AVCaptureVideoDataOutput setAlwaysDiscardsLateVideoFrames:](self->_videoOutput, "setAlwaysDiscardsLateVideoFrames:", v8);
  v10 = -[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", self->_videoOutput);
  if (v10)
  {
    -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", self->_videoOutput);
  }
  else if (*a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11861, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (BOOL)JFX_setupCaptureSessionPhotoError:(id *)a3
{
  AVCapturePhotoOutput *v5;
  AVCapturePhotoOutput *photoOutput;
  void *v7;
  BOOL v8;

  v5 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x24BDB24C0]);
  photoOutput = self->_photoOutput;
  self->_photoOutput = v5;

  objc_msgSend(MEMORY[0x24BDB24C8], "photoSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFlashMode:", 2);
  -[AVCapturePhotoOutput setPhotoSettingsForSceneMonitoring:](self->_photoOutput, "setPhotoSettingsForSceneMonitoring:", v7);
  -[JFXVideoCameraController JFX_setIsFlashScene:](self, "JFX_setIsFlashScene:", -[AVCapturePhotoOutput isFlashScene](self->_photoOutput, "isFlashScene"));
  -[AVCapturePhotoOutput addObserver:forKeyPath:options:context:](self->_photoOutput, "addObserver:forKeyPath:options:context:", self, CFSTR("isFlashScene"), 1, sAVCapturePhotoOutputIsFlashScene);
  v8 = -[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", self->_photoOutput);
  if (v8)
  {
    -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", self->_photoOutput);
  }
  else if (*a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11861, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)JFX_setupCaptureSessionDepthError:(id *)a3
{
  void *v4;
  int v5;
  AVCaptureDepthDataOutput *v6;
  AVCaptureDepthDataOutput *depthOutput;
  AVCaptureDepthDataOutput *v9;
  NSObject *v10;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "jfx_hasDepthCapableCamera");

  if (v5)
  {
    v6 = (AVCaptureDepthDataOutput *)objc_alloc_init(MEMORY[0x24BDB2458]);
    depthOutput = self->_depthOutput;
    self->_depthOutput = v6;

    -[AVCaptureDepthDataOutput setAlwaysDiscardsLateDepthData:](self->_depthOutput, "setAlwaysDiscardsLateDepthData:", 1);
    -[AVCaptureDepthDataOutput setFilteringEnabled:](self->_depthOutput, "setFilteringEnabled:", 0);
    if (-[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", self->_depthOutput))
    {
      -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", self->_depthOutput);
      return 1;
    }
    v9 = self->_depthOutput;
    self->_depthOutput = 0;

    JFXLog_DebugCamera();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[JFXVideoCameraController JFX_setupCaptureSessionDepthError:].cold.1();

  }
  return 0;
}

- (BOOL)JFX_setupCaptureSessionAudioError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  AVCaptureDeviceInput *v8;
  id v9;
  AVCaptureDeviceInput *audioInput;
  BOOL v11;
  AVCaptureDeviceInput *v12;
  AVCaptureSession *v13;
  AVCaptureAudioDataOutput *v14;
  AVCaptureAudioDataOutput *audioOutput;
  id v16;
  AVCaptureDeviceInput *v17;
  AVCaptureAudioDataOutput *v18;
  id v20;

  v5 = *MEMORY[0x24BDB1C58];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11814, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithMediaType:", *MEMORY[0x24BDB1CF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v7, &v20);
    v8 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    audioInput = self->_audioInput;
    self->_audioInput = v8;

    if (v9)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v9);
      v11 = 0;
      v12 = self->_audioInput;
      self->_audioInput = 0;
      goto LABEL_19;
    }
    v13 = self->_captureSession;
    v12 = (AVCaptureDeviceInput *)v13;
    if (self->_audioInput && -[AVCaptureSession canAddInput:](v13, "canAddInput:"))
    {
      -[AVCaptureDeviceInput addInput:](v12, "addInput:", self->_audioInput);
      v14 = (AVCaptureAudioDataOutput *)objc_alloc_init(MEMORY[0x24BDB2438]);
      audioOutput = self->_audioOutput;
      self->_audioOutput = v14;

      if ((-[AVCaptureDeviceInput canAddOutput:](v12, "canAddOutput:", self->_audioOutput) & 1) != 0)
      {
        -[AVCaptureDeviceInput addOutput:](v12, "addOutput:", self->_audioOutput);
        -[AVCaptureAudioDataOutput setSampleBufferDelegate:queue:](self->_audioOutput, "setSampleBufferDelegate:queue:", self, self->_audioOutQueue);
        v11 = 1;
LABEL_19:

        goto LABEL_20;
      }
      -[AVCaptureDeviceInput removeInput:](v12, "removeInput:", self->_audioInput);
      v17 = self->_audioInput;
      self->_audioInput = 0;

      v18 = self->_audioOutput;
      self->_audioOutput = 0;

      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, -11861, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else if (a3)
    {
      v16 = objc_retainAutorelease(v6);
LABEL_14:
      v11 = 0;
      *a3 = v16;
      goto LABEL_19;
    }
    v11 = 0;
    goto LABEL_19;
  }
  v11 = 0;
  if (*a3)
    *a3 = objc_retainAutorelease(v6);
LABEL_20:

  return v11;
}

- (void)turnOnMicrophone
{
  NSObject *captureSessionQueue;
  _QWORD block[5];

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__JFXVideoCameraController_turnOnMicrophone__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __44__JFXVideoCameraController_turnOnMicrophone__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startRunning");
}

- (void)turnOffMicrophone
{
  NSObject *captureSessionQueue;
  _QWORD block[5];

  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__JFXVideoCameraController_turnOffMicrophone__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __45__JFXVideoCameraController_turnOffMicrophone__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopRunning");
}

- (BOOL)JFX_configureCaptureSesstionForPosition:(int64_t)a3 applyFFCZoom:(BOOL)a4 configureLockedCamera:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  NSObject *dataOutSynchQueue;
  AVCaptureSession *captureSession;
  id v19;
  id v20;
  char v21;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  char v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD block[5];
  id v42;
  id v43[2];

  v9 = a5;
  v42 = 0;
  v43[0] = 0;
  JFX_getFrontAndBackCameras((unint64_t)v43, (unint64_t)&v42);
  v10 = v43[0];
  v11 = v42;
  v12 = v11;
  if (a3 == 2)
    v13 = v10;
  else
    v13 = v11;
  v14 = v13;
  v15 = objc_msgSend(v14, "jfx_trueDepthCamera");
  v16 = MEMORY[0x24BDAC760];
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(dataOutSynchQueue, block);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  v36 = 0;
  captureSession = self->_captureSession;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2;
  v24[3] = &unk_24EE5A5A8;
  v24[4] = self;
  v27 = &v37;
  v19 = v14;
  v25 = v19;
  v28 = &v31;
  v29 = v15;
  v30 = a4;
  v20 = v9;
  v26 = v20;
  JFX_configureCaptureSession(captureSession, v24);
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  v21 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = 0;

}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;
  char v27;
  id obj;
  id v29;

  v3 = a2;
  v5 = (id *)(a1 + 32);
  v4 = *(id **)(a1 + 32);
  if (v4[7])
  {
    objc_msgSend(v4[1], "removeOutput:");
    v6 = (void *)*((_QWORD *)*v5 + 7);
    *((_QWORD *)*v5 + 7) = 0;

    v4 = (id *)*v5;
  }
  if (v4[8])
  {
    objc_msgSend(v4[1], "removeOutput:");
    v7 = (void *)*((_QWORD *)*v5 + 8);
    *((_QWORD *)*v5 + 8) = 0;

    v4 = (id *)*v5;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v29 = *(id *)(v9 + 40);
  v10 = objc_msgSend(v4, "JFX_configureCaptureSessionForCaptureDevice:error:", v8, &v29);
  objc_storeStrong((id *)(v9 + 40), v29);
  if (v10)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v11, "JFX_setupCaptureSessionDepthError:", &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v14 = *(void **)(a1 + 40);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_3;
    v22 = &unk_24EE5A580;
    v15 = v3;
    v16 = *(_QWORD *)(a1 + 32);
    v23 = v15;
    v24 = v16;
    v26 = *(_BYTE *)(a1 + 73);
    v27 = *(_BYTE *)(a1 + 72);
    v25 = *(id *)(a1 + 48);
    JFX_configureCaptureDevice(v14, &v19);
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionVideoDataOutput", v19, v20, v21, v22);
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:", +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMetadataForCaptureDevice:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionMicrophoneForPosition:", objc_msgSend(*(id *)(a1 + 32), "currentCameraPosition_captureSessionQueue"));
    objc_msgSend(*(id *)(a1 + 32), "JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery");
    v17 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v17, "JFX_setupARCameraSessionController");
      objc_msgSend(*v5, "JFX_startARCameraSessionController");
    }
    else
    {
      objc_msgSend(v17, "setArCameraSessionController:", 0);
    }
    objc_msgSend(*v5, "JFX_configureCaptureSessionDataOutputSynchronizer");
    JFXLog_DebugCamera();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2_cold_1((uint64_t)v5);

  }
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAutomaticallyConfiguresCaptureDeviceForWideColor:", 0);
  if ((objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceCustomFormat:applyFFCZoom:", v3, *(unsigned __int8 *)(a1 + 56)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutomaticallyConfiguresCaptureDeviceForWideColor:", 1);
    objc_msgSend(*(id *)(a1 + 40), "JFX_configureCaptureSessionPreset");
  }
  if (*(_BYTE *)(a1 + 57))
    objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceForDepth:", v3);
  objc_msgSend(v3, "setSpatialOverCaptureEnabled:", 0);
  v4 = objc_msgSend(v3, "activeColorSpace");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v5 + 112);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_4;
  v8[3] = &unk_24EE58078;
  v8[4] = v5;
  v8[5] = v4;
  dispatch_barrier_async(v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDevice:", v3);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceFocus:focusPoint:", v3, 3.40282347e38, 3.40282347e38);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceExposure:exposurePoint:", v3, 3.40282347e38, 3.40282347e38);
  objc_msgSend(*(id *)(a1 + 40), "JFX_configureLockedCaptureDeviceFrameRate:", v3);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraColorSpace_queryDataQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)JFX_configureCaptureSessionForCaptureDevice:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  AVCaptureDeviceInput *cameraDeviceInput;
  void *v11;
  AVCaptureDeviceInput *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a4)
  {
    if (*a4)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (v9)
      goto LABEL_30;
  }
  else if (!v7)
  {
    goto LABEL_30;
  }
  cameraDeviceInput = self->_cameraDeviceInput;
  if (cameraDeviceInput)
  {
    -[AVCaptureDeviceInput device](cameraDeviceInput, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("systemPressureState"), sAVCaptureDeviceSystemPressureState);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("videoZoomFactor"), &sAVCaptureDeviceVideoZoomFactor);
    -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:", self->_cameraDeviceInput);
    v12 = self->_cameraDeviceInput;
    self->_cameraDeviceInput = 0;

    -[AVCaptureSession setSessionPreset:](self->_captureSession, "setSessionPreset:", *MEMORY[0x24BDB1B20]);
  }
  v13 = -[AVCaptureSession canAddInput:](self->_captureSession, "canAddInput:", v8);
  if (v13)
  {
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("systemPressureState"), 1, sAVCaptureDeviceSystemPressureState);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("videoZoomFactor"), 1, &sAVCaptureDeviceVideoZoomFactor);
    -[AVCaptureSession addInput:](self->_captureSession, "addInput:", v8);
    objc_storeStrong((id *)&self->_cameraDeviceInput, v8);
    objc_msgSend(v8, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "supportedMaxPhotoDimensions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "CMVideoDimensionsValue");
      v19 = v18;
      v20 = HIDWORD(v18);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = v16;
      v21 = v16;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            v26 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "CMVideoDimensionsValue");
            v27 = v19 * v20;
            if (HIDWORD(v26) * (int)v26 <= (int)(v19 * v20))
              v20 = v20;
            else
              v20 = HIDWORD(v26);
            if (HIDWORD(v26) * (int)v26 > v27)
              v19 = v26;
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v23);
      }

      -[AVCapturePhotoOutput setMaxPhotoDimensions:](self->_photoOutput, "setMaxPhotoDimensions:", v19 | (v20 << 32));
      v16 = v34;
    }
    objc_msgSend(v6, "deviceType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXVideoCameraController JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:](self, "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", v28, objc_msgSend(v6, "position"));
    goto LABEL_29;
  }
  if (!a4)
  {
LABEL_30:
    LOBYTE(v13) = 0;
    goto LABEL_31;
  }
  v29 = (void *)MEMORY[0x24BDD1540];
  v30 = *MEMORY[0x24BDB1C58];
  v39 = *MEMORY[0x24BDB1BD0];
  v31 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "position"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("AVCaptureDevicePosition:%@"), v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, -11814, v32);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
LABEL_31:

  return v13;
}

- (void)JFX_configureCaptureSessionPreset
{
  int64_t v3;
  AVCaptureSession *captureSession;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;

  v3 = -[JFXVideoCameraController cameraMode_captureSessionQueue](self, "cameraMode_captureSessionQueue");
  if (v3 == 3)
  {
    captureSession = self->_captureSession;
    v5 = (_QWORD *)MEMORY[0x24BDB1B00];
LABEL_5:
    v6 = (void *)*v5;
    if (!-[AVCaptureSession canSetSessionPreset:](captureSession, "canSetSessionPreset:", *v5))
      return;
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    captureSession = self->_captureSession;
    v5 = (_QWORD *)MEMORY[0x24BDB1AF8];
    goto LABEL_5;
  }
  v6 = (void *)*MEMORY[0x24BDB1B40];
  if (!-[AVCaptureSession canSetSessionPreset:](self->_captureSession, "canSetSessionPreset:", *MEMORY[0x24BDB1B40]))
    return;
LABEL_8:
  v7 = v6;
  if (v7)
  {
    v8 = v7;
    -[AVCaptureSession setSessionPreset:](self->_captureSession, "setSessionPreset:", v7);

  }
}

- (void)JFX_configureCaptureSessionVideoDataOutput
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t Dimensions;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  AVCaptureVideoDataOutput *videoOutput;
  float v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  NSObject *log;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[AVCaptureVideoDataOutput setVideoSettings:](self->_videoOutput, "setVideoSettings:", 0);
  -[AVCaptureVideoDataOutput videoSettings](self->_videoOutput, "videoSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v3, "mutableCopy");

  v4 = -[JFXVideoCameraController cameraMode_captureSessionQueue](self, "cameraMode_captureSessionQueue");
  v5 = JFXMinimumVideoDimensionsForCameraMode(2);
  v6 = JFXMaximumVideoDimensionsForCameraMode(6);
  v7 = JFXMinimumVideoDimensionsForCameraMode(v4);
  v47 = HIDWORD(v7);
  v8 = JFXMaximumVideoDimensionsForCameraMode(v4);
  -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v10, "formatDescription"));
  JFXLog_camera();
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v48 = v8;
    v50 = v5;
    v12 = (void *)MEMORY[0x24BDD17C8];
    v45 = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v46 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
    v49 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("{%@, %@}"), v13, v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = (void *)MEMORY[0x24BDD16E0];
    v43 = v44;
    objc_msgSend(v16, "numberWithInt:", v50);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v50));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("{%@, %@}"), v17, v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = (void *)MEMORY[0x24BDD16E0];
    v41 = v42;
    objc_msgSend(v20, "numberWithInt:", v49);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v49));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("{%@, %@}"), v21, v22);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = (void *)MEMORY[0x24BDD16E0];
    v39 = v40;
    objc_msgSend(v24, "numberWithInt:", v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v47);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("{%@, %@}"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = HIDWORD(v8);
    v29 = (void *)MEMORY[0x24BDD17C8];
    v30 = (void *)MEMORY[0x24BDD16E0];
    v31 = v27;
    objc_msgSend(v30, "numberWithInt:", v48);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("{%@, %@}"), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v48;
    *(_DWORD *)buf = 134219266;
    v54 = v45;
    v55 = 2114;
    v56 = v44;
    v57 = 2114;
    v58 = v42;
    v59 = 2114;
    v60 = v40;
    v61 = 2114;
    v62 = v27;
    v7 = v46;
    v63 = 2114;
    v64 = v34;
    _os_log_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEFAULT, "cameraMode: %ld, videoDimensions: %{public}@, absoluteMinVideoDimensions: %{public}@, absoluteMaxVideoDimensions: %{public}@, cameraModeMinVideoDimensions: %{public}@, cameraModeMaxVideoDimensions: %{public}@", buf, 0x3Eu);

    v5 = v50;
    v6 = v49;

  }
  videoOutput = self->_videoOutput;
  if (Dimensions == v5 || Dimensions == v6 || Dimensions == v7 || Dimensions == v8)
  {
    -[AVCaptureVideoDataOutput setAutomaticallyConfiguresOutputBufferDimensions:](videoOutput, "setAutomaticallyConfiguresOutputBufferDimensions:", 1);
  }
  else
  {
    -[AVCaptureVideoDataOutput setAutomaticallyConfiguresOutputBufferDimensions:](videoOutput, "setAutomaticallyConfiguresOutputBufferDimensions:", 0);
    -[AVCaptureVideoDataOutput setDeliversPreviewSizedOutputBuffers:](self->_videoOutput, "setDeliversPreviewSizedOutputBuffers:", 0);
    if ((_DWORD)Dimensions && HIDWORD(Dimensions))
    {
      v36 = (float)(int)v7 / (float)(int)Dimensions;
      if (v36 >= (float)((float)(int)v47 / (float)SHIDWORD(Dimensions)))
        v36 = (float)(int)v47 / (float)SHIDWORD(Dimensions);
      if (v36 > 1.0)
        v36 = 1.0;
      if (v36 < 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDC5708]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v47);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BDC5650]);

        -[AVCaptureVideoDataOutput setVideoSettings:](self->_videoOutput, "setVideoSettings:", v51);
      }
    }
  }

}

- (void)JFX_configureCaptureSessionPhotoOrientationFromInterfaceOrientation:(int64_t)a3
{
  int64_t v5;
  id v6;

  -[AVCapturePhotoOutput connectionWithMediaType:](self->_photoOutput, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isVideoOrientationSupported"))
  {
    if ((unint64_t)(a3 - 2) >= 3)
      v5 = 1;
    else
      v5 = a3;
    objc_msgSend(v6, "setVideoOrientation:", v5);
  }
  if (objc_msgSend(v6, "isVideoMirroringSupported"))
    objc_msgSend(v6, "setVideoMirrored:", -[JFXVideoCameraController currentCameraPosition_captureSessionQueue](self, "currentCameraPosition_captureSessionQueue") == 2);
  if (objc_msgSend(v6, "isCameraIntrinsicMatrixDeliverySupported"))
    objc_msgSend(v6, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);

}

- (void)JFX_configureCaptureSessionMetadataForCaptureDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  _QWORD *v9;
  id v10;

  v10 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDB2498]);
  if (-[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", v4))
  {
    -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", v4);
    v5 = objc_msgSend(v10, "position");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 2)
    {
      v7 = objc_msgSend(v10, "jfx_trueDepthCamera");
      v8 = objc_msgSend(v4, "isFaceTrackingSupported");
      v9 = (_QWORD *)MEMORY[0x24BDB1E98];
      if (v8 && v7)
      {
        objc_msgSend(v4, "setFaceTrackingMetadataObjectTypesAvailable:", 1);
        v9 = (_QWORD *)MEMORY[0x24BDB1ED0];
      }
    }
    else
    {
      v9 = (_QWORD *)MEMORY[0x24BDB1E98];
    }
    objc_msgSend(v6, "addObject:", *v9);
    objc_msgSend(v4, "setMetadataObjectTypes:", v6);
    if (objc_msgSend(v6, "count"))
      objc_storeStrong((id *)&self->_metadataOutput, v4);
    else
      -[AVCaptureSession removeOutput:](self->_captureSession, "removeOutput:", v4);

  }
}

- (void)JFX_configureCaptureSessionMicrophoneForPosition:(int64_t)a3
{
  void *v4;

  if (a3 == 2)
  {
    if (self->_observingAudioRouteChanges)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDB1728], 0);

      self->_observingAudioRouteChanges = 0;
    }
    -[AVCaptureSession setAutomaticallyConfiguresApplicationAudioSession:](self->_captureSession, "setAutomaticallyConfiguresApplicationAudioSession:", 1);
  }
  else if (a3 == 1)
  {
    -[JFXVideoCameraController JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern](self, "JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern");
  }
}

- (void)JFX_configureCaptureSessionMicrophoneForOmnidirectionalPattern
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "mic: [cam] not using the internal mic - not configurng polar pattern", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery
{
  AVCaptureDepthDataOutput *depthOutput;
  void *v4;
  AVCaptureVideoDataOutput **p_videoOutput;
  uint64_t v6;
  void *v7;
  AVCaptureVideoDataOutput *v8;
  AVCaptureVideoDataOutput *videoOutput;
  AVCaptureDepthDataOutput *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[JFXVideoCameraController JFX_isDepthEnabledCaptureSessionQueue](self, "JFX_isDepthEnabledCaptureSessionQueue"))
  {
    depthOutput = self->_depthOutput;
    videoOutput = self->_videoOutput;
    v10 = depthOutput;
    v4 = (void *)MEMORY[0x24BDBCE30];
    p_videoOutput = &videoOutput;
    v6 = 2;
  }
  else
  {
    v8 = self->_videoOutput;
    v4 = (void *)MEMORY[0x24BDBCE30];
    p_videoOutput = &v8;
    v6 = 1;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", p_videoOutput, v6, v8, videoOutput, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_125);

}

void __90__JFXVideoCameraController_JFX_configureCaptureSessionEnableCameraIntrinsicMatrixDelivery__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isCameraIntrinsicMatrixDeliverySupported"))
    objc_msgSend(v2, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);

}

- (void)JFX_configureCaptureSessionDataOutputSynchronizer
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t Dimensions;
  int32_t v11;
  unint64_t v12;
  NSObject *dataOutSynchQueue;
  AVCaptureDataOutputSynchronizer *v14;
  AVCaptureDataOutputSynchronizer *dataOutputSynchronizer;
  NSObject *v16;
  AVCaptureDataOutputSynchronizer *v17;
  OS_dispatch_queue *v18;
  simd_float3 v19;
  simd_float3 v20;
  simd_float3 v21;
  _QWORD block[4];
  simd_float3 v23;
  simd_float3 v24;
  simd_float3 v25;
  JFXVideoCameraController *v26;
  uint64_t v27;
  int32_t v28;
  int v29;
  BOOL v30;
  uint8_t buf[4];
  AVCaptureDataOutputSynchronizer *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  OS_dispatch_queue *v36;
  uint64_t v37;
  simd_float3x3 v38;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = -[JFXVideoCameraController JFX_isDepthEnabledCaptureSessionQueue](self, "JFX_isDepthEnabledCaptureSessionQueue");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_videoOutput)
    objc_msgSend(v4, "addObject:");
  if (v3)
    objc_msgSend(v5, "addObject:", self->_depthOutput);
  if (self->_metadataOutput)
    objc_msgSend(v5, "addObject:");
  -[AVCaptureVideoDataOutput connectionWithMediaType:](self->_videoOutput, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "videoOrientation");
  -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v9, "formatDescription"));
  v11 = Dimensions;
  v12 = HIDWORD(Dimensions);
  objc_msgSend(v9, "videoFieldOfView");
  pv_intrinsics_from_fov_side_and_resolution();
  v38.columns[0].i32[3] = 0;
  v38.columns[1].i32[3] = 0;
  v20 = v38.columns[1];
  v21 = v38.columns[0];
  v38.columns[2].i32[3] = 0;
  v19 = v38.columns[2];
  JFX_logCameraIntrinsics(v38);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke;
  block[3] = &unk_24EE5A610;
  v26 = self;
  v27 = v7;
  v30 = v3;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v28 = v11;
  v29 = v12;
  dispatch_async(dataOutSynchQueue, block);
  v14 = (AVCaptureDataOutputSynchronizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2450]), "initWithDataOutputs:", v5);
  dataOutputSynchronizer = self->_dataOutputSynchronizer;
  self->_dataOutputSynchronizer = v14;

  -[AVCaptureDataOutputSynchronizer setDelegate:queue:](self->_dataOutputSynchronizer, "setDelegate:queue:", self, self->_dataOutSynchQueue);
  JFXLog_DebugCamera();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = self->_dataOutputSynchronizer;
    v18 = self->_dataOutSynchQueue;
    *(_DWORD *)buf = 138412802;
    v32 = v17;
    v33 = 2112;
    v34 = v5;
    v35 = 2112;
    v36 = v18;
    _os_log_debug_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEBUG, "created %@ with capture outputs %@ and placing on Q %@", buf, 0x20u);
  }

}

uint64_t __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v6[6];

  objc_msgSend(*(id *)(a1 + 80), "setCaptureVideoOrientation_dataOutSynchQueue:", *(_QWORD *)(a1 + 88));
  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(NSObject **)(v2 + 112);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke_2;
  v6[3] = &unk_24EE58078;
  v6[4] = v2;
  v6[5] = v3;
  dispatch_barrier_async(v4, v6);
  *(_BYTE *)(*(_QWORD *)(a1 + 80) + 185) = *(_BYTE *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 80), "setCameraDeviceIntrinsics_dataOutSynchQueue:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 80), "setCameraFrameResolution_dataOutSynchQueue:", (double)*(int *)(a1 + 96), (double)*(int *)(a1 + 100));
}

uint64_t __77__JFXVideoCameraController_JFX_configureCaptureSessionDataOutputSynchronizer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaptureVideoOrientation_queryDataQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)JFX_configureLockedCaptureDeviceCustomFormat:(id)a3 applyFFCZoom:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((JFXLowResolutionDevice() & 1) != 0)
    v9 = 1;
  else
    v9 = JFXMediumResolutionDevice();
  v10 = objc_msgSend(v6, "jfx_trueDepthCamera");
  v11 = -[JFXVideoCameraController cameraMode_captureSessionQueue](self, "cameraMode_captureSessionQueue");
  v12 = JFXIsCTMCameraMode(v11);
  v13 = 0;
  if (v4 && !v8 && (v9 & 1) == 0 && v10 && v12)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "jfx_hasTrueDepthFrontCameraCustomZoomFormat");

  }
  switch(v11)
  {
    case 4:
      v16 = 0x2D000000000;
      v17 = 2;
      v15 = 1280;
      break;
    case 5:
      v16 = 0x43800000000;
      v17 = 2;
      v15 = 1920;
      break;
    case 7:
      v15 = 3088;
      if (!v13)
        v15 = 1920;
      v16 = 0x5A000000000;
      if (v13)
        v16 = 0x90C00000000;
      v17 = 2;
      break;
    default:
      if (!v13)
      {
        v19 = 0;
        goto LABEL_23;
      }
      v16 = 0x90C00000000;
      v17 = 1;
      v15 = 3088;
      break;
  }
  -[JFXVideoCameraController JFX_getFormatForCaptureDevice:previewDimensions:colorSpace:](self, "JFX_getFormatForCaptureDevice:previewDimensions:colorSpace:", v6, v16 | v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveFormat:", v18);
  objc_msgSend(v6, "setActiveColorSpace:", v17);

  v19 = 1;
LABEL_23:

  return v19;
}

- (void)JFX_configureLockedCaptureDeviceForDepth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2810000000;
  v8[3] = &unk_226ACDFC7;
  v8[4] = 0;
  objc_msgSend(v4, "activeFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedDepthDataFormats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__JFXVideoCameraController_JFX_configureLockedCaptureDeviceForDepth___block_invoke;
  v7[3] = &unk_24EE5A638;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(v4, "setActiveDepthDataFormat:", v10[5]);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

}

void __69__JFXVideoCameraController_JFX_configureLockedCaptureDeviceForDepth___block_invoke(_QWORD *a1, void *a2)
{
  const opaqueCMFormatDescription *v4;
  unint64_t Dimensions;
  int32_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v4 = (const opaqueCMFormatDescription *)objc_msgSend(v13, "formatDescription");
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v4);
  v6 = Dimensions;
  v7 = HIDWORD(Dimensions);
  v8 = *(void **)(a1[4] + 200);
  if ((!v8
     || (int)objc_msgSend(v8, "intValue") >= v6 && (int)objc_msgSend(*(id *)(a1[4] + 200), "intValue") >= (int)v7)
    && CMFormatDescriptionGetMediaSubType(v4) == 1717855600)
  {
    v9 = *(_QWORD *)(a1[5] + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11 || *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 32) < v6)
    {
      objc_storeStrong(v10, a2);
      v12 = *(_QWORD *)(a1[6] + 8);
      *(_DWORD *)(v12 + 32) = v6;
      *(_DWORD *)(v12 + 36) = v7;
    }
  }

}

- (void)JFX_configureLockedCaptureDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setVideoZoomFactor:", 1.0);
  objc_msgSend(v5, "activeFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoMaxZoomFactor");
  -[JFXVideoCameraController setCameraVideoMaxZoomFactor_captureSessionQueue:](self, "setCameraVideoMaxZoomFactor_captureSessionQueue:");

  if (objc_msgSend(v5, "isSmoothAutoFocusSupported"))
    objc_msgSend(v5, "setSmoothAutoFocusEnabled:", 0);
  if (objc_msgSend(v5, "position") == 2 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "performSelector:withObject:", sel_setFaceDetectionDrivenImageProcessingEnabled_, MEMORY[0x24BDBD1C8]);

}

- (void)JFX_configureLockedCaptureDeviceFocus:(id)a3 focusPoint:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  CGPoint v12;
  CGRect v13;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  if (objc_msgSend(v11, "isFocusPointOfInterestSupported"))
  {
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    v13.size.width = 1.0;
    v13.size.height = 1.0;
    v12.x = x;
    v12.y = y;
    v6 = CGRectContainsPoint(v13, v12);
    v7 = 0.5;
    if (v6)
      v8 = y;
    else
      v8 = 0.5;
    if (v6)
      v7 = x;
    objc_msgSend(v11, "setFocusPointOfInterest:", v7, v8);
  }
  v9 = objc_msgSend(v11, "focusMode");
  v10 = 2;
  if ((objc_msgSend(v11, "isFocusModeSupported:", 2) & 1) == 0)
  {
    if (objc_msgSend(v11, "isFocusModeSupported:", 1))
      v10 = 1;
    else
      v10 = v9;
  }
  if (objc_msgSend(v11, "isFocusModeSupported:", v10))
    objc_msgSend(v11, "setFocusMode:", v10);

}

- (void)JFX_configureLockedCaptureDeviceExposure:(id)a3 exposurePoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  _BOOL4 v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  CGPoint v14;
  CGRect v15;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  if (objc_msgSend(v6, "isExposurePointOfInterestSupported"))
  {
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = 1.0;
    v15.size.height = 1.0;
    v14.x = x;
    v14.y = y;
    v7 = CGRectContainsPoint(v15, v14);
    v8 = 0.5;
    if (v7)
      v9 = y;
    else
      v9 = 0.5;
    if (v7)
      v8 = x;
    objc_msgSend(v6, "setExposurePointOfInterest:", v8, v9);
  }
  v12 = *MEMORY[0x24BDC0D40];
  v13 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  objc_msgSend(v6, "setActiveMaxExposureDuration:", &v12);
  v10 = objc_msgSend(v6, "exposureMode");
  v11 = 2;
  if ((objc_msgSend(v6, "isExposureModeSupported:", 2) & 1) == 0)
  {
    if (objc_msgSend(v6, "isExposureModeSupported:", 1))
      v11 = 1;
    else
      v11 = v10;
  }
  if (objc_msgSend(v6, "isExposureModeSupported:", v11))
    objc_msgSend(v6, "setExposureMode:", v11);

}

- (void)JFX_configureLockedCaptureDeviceFrameRate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXVideoCameraController thermalDelegate](self, "thermalDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[JFXThermalMonitor sharedInstance](JFXThermalMonitor, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "thermalLevel");

    v11 = 0;
    -[JFXVideoCameraController thermalDelegate](self, "thermalDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraFPSForThermalLevel:deviceType:minRate:maxRate:", v7, v9, (char *)&v11 + 4, &v11);

    -[JFXVideoCameraController JFX_configureLockedCaptureDevice:minFrameRate:maxFrameRate:](self, "JFX_configureLockedCaptureDevice:minFrameRate:maxFrameRate:", v4, HIDWORD(v11), v11);
    JFXLog_DebugThermals();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      v13 = v7;
      v14 = 1024;
      v15 = HIDWORD(v11);
      v16 = 1024;
      v17 = v11;
      _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "Thermal Level Changes to %d with throttling [%d - %d]", buf, 0x14u);
    }

  }
}

- (void)JFX_configureLockedCaptureDevice:(id)a3 minFrameRate:(int)a4 maxFrameRate:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  JFXVideoCameraController *v29;
  __CFString *v30;
  void *v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  _QWORD block[4];
  id v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime time1;
  CMTime v42;
  CMTime time2;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v5 = *(_QWORD *)&a5;
  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  memset(&v42, 0, sizeof(v42));
  CMTimeMake(&v42, 1, v5);
  if (v8)
    objc_msgSend(v8, "activeVideoMinFrameDuration");
  else
    memset(&time1, 0, sizeof(time1));
  time2 = v42;
  if (CMTimeCompare(&time1, &time2))
  {
    v40 = v42;
    objc_msgSend(v8, "setActiveVideoMinFrameDuration:", &v40);
  }
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, 1, a4);
  if (v8)
    objc_msgSend(v8, "activeVideoMaxFrameDuration");
  else
    memset(&v38, 0, sizeof(v38));
  time2 = v39;
  if (CMTimeCompare(&v38, &time2))
  {
    v37 = v39;
    objc_msgSend(v8, "setActiveVideoMaxFrameDuration:", &v37);
  }
  objc_msgSend(v8, "systemPressureState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "factors");
  objc_msgSend(v9, "level");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  if (objc_msgSend(v8, "jfx_trueDepthCamera")
    && self->_depthOutput
    && (objc_msgSend(v8, "activeDepthDataFormat"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__JFXVideoCameraController_JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate___block_invoke;
    block[3] = &unk_24EE57B60;
    v13 = v8;
    v36 = v13;
    if (JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__onceToken != -1)
      dispatch_once(&JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__onceToken, block);
    v14 = v5;
    if ((v10 & 4) != 0)
    {
      objc_msgSend((id)JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v14 = v5;
      if (v15)
      {
        v17 = objc_msgSend(v15, "intValue");
        if (v17 >= (int)v5)
          v14 = v5;
        else
          v14 = v17;
      }

    }
    memset(&time2, 0, sizeof(time2));
    CMTimeMake(&time2, 1, v14);
    if (v8)
      objc_msgSend(v13, "activeDepthDataMinFrameDuration");
    else
      memset(&v34, 0, sizeof(v34));
    v33 = time2;
    if (CMTimeCompare(&v34, &v33))
    {
      v32 = time2;
      objc_msgSend(v13, "setActiveDepthDataMinFrameDuration:", &v32);
    }

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v8, "deviceType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXThermalMonitor sharedInstance](JFXThermalMonitor, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "thermalLevel");

  JFXLog_DebugCamera();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromJFXCameraMode(-[JFXVideoCameraController cameraMode_captureSessionQueue](v29, "cameraMode_captureSessionQueue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    if ((int)v14 < 1)
    {
      v30 = &stru_24EE5C428;
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR(" depth %@ fps"), v26);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    +[JFXThermalMonitor stringFromThermalPressureLevel:](JFXThermalMonitor, "stringFromThermalPressureLevel:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time2.value) = 138414082;
    *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v18;
    LOWORD(time2.flags) = 2112;
    *(_QWORD *)((char *)&time2.flags + 2) = v28;
    HIWORD(time2.epoch) = 2112;
    v44 = v27;
    v45 = 2112;
    v46 = v31;
    v47 = 2112;
    v48 = v30;
    v49 = 2112;
    v50 = v24;
    v51 = 2112;
    v52 = v11;
    v53 = 2112;
    v54 = v25;
    _os_log_debug_impl(&dword_2269A9000, v21, OS_LOG_TYPE_DEBUG, "configuring camera %@ (mode: %@) to [%@, %@] fps%@ system thermal: %@ avf thermal: %@ avf thermal factors: %@", (uint8_t *)&time2, 0x52u);

    if ((int)v22 >= 1)
    {

    }
  }

}

void __87__JFXVideoCameraController_JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "activeDepthDataMinFrameDuration");
    v2 = *(void **)(v1 + 32);
    v1 = (int)v21 / v20;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "activeDepthDataFormat", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoSupportedFrameRateRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "minFrameRate");
        if (v10 <= (double)(int)v1)
        {
          objc_msgSend(v9, "minFrameRate");
          v1 = (int)v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v6);
  }

  v12 = *MEMORY[0x24BDB1B70];
  v23[0] = *MEMORY[0x24BDB1B80];
  v23[1] = v12;
  v24[0] = &unk_24EE9BC60;
  v24[1] = &unk_24EE9BC78;
  v23[2] = *MEMORY[0x24BDB1B88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup;
  JFX_configureLockedCaptureDevice_minFrameRate_maxFrameRate__depthSystemPressureLevelFPSLookup = v14;

}

- (BOOL)JFX_isAudioEnabledCaptureSessionQueue
{
  return self->_audioInput && self->_audioOutput != 0;
}

- (BOOL)JFX_isDepthEnabledCaptureSessionQueue
{
  return self->_depthOutput != 0;
}

- (void)JFX_setCaptureDeviceType:(id)a3 captureDevicePositionCaptureSessionQueue:(int64_t)a4
{
  id v6;
  NSObject *queryDataQueue;
  uint64_t v8;
  id v9;
  NSObject *dataOutSynchQueue;
  _QWORD v11[6];
  _QWORD block[5];
  id v13;
  int64_t v14;

  v6 = a3;
  -[JFXVideoCameraController setCurrentCameraPosition_captureSessionQueue:](self, "setCurrentCameraPosition_captureSessionQueue:", a4);
  queryDataQueue = self->_queryDataQueue;
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke;
  block[3] = &unk_24EE583F8;
  block[4] = self;
  v13 = v6;
  v14 = a4;
  v9 = v6;
  dispatch_barrier_async(queryDataQueue, block);
  dataOutSynchQueue = self->_dataOutSynchQueue;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke_2;
  v11[3] = &unk_24EE58078;
  v11[4] = self;
  v11[5] = a4;
  dispatch_async(dataOutSynchQueue, v11);

}

uint64_t __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCameraType_queryDataQueue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentCameraPosition_queryDataQueue:", *(_QWORD *)(a1 + 48));
}

uint64_t __94__JFXVideoCameraController_JFX_setCaptureDeviceType_captureDevicePositionCaptureSessionQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentCameraPosition_dataOutSynchQueue:", *(_QWORD *)(a1 + 40));
}

- (id)JFX_getFormatForCaptureDevice:(id)a3 previewDimensions:(id)a4 colorSpace:(int64_t)a5
{
  id v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v7 = a3;
  v8 = objc_msgSend(v7, "jfx_trueDepthCamera");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  objc_msgSend(v7, "formats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__JFXVideoCameraController_JFX_getFormatForCaptureDevice_previewDimensions_colorSpace___block_invoke;
  v12[3] = &unk_24EE5A660;
  v13 = v8;
  v12[5] = a5;
  v12[6] = a4;
  v12[4] = &v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __87__JFXVideoCameraController_JFX_getFormatForCaptureDevice_previewDimensions_colorSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  const opaqueCMFormatDescription *v13;
  CMVideoDimensions Dimensions;
  FourCharCode MediaSubType;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "supportedDepthDataFormats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (*(_BYTE *)(a1 + 56))
    v9 = v8 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    objc_msgSend(v16, "supportedColorSpaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v12)
    {
      v13 = (const opaqueCMFormatDescription *)objc_msgSend(v16, "formatDescription");
      Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
      MediaSubType = CMFormatDescriptionGetMediaSubType(v13);
      if (*(_QWORD *)(a1 + 48) == Dimensions && MediaSubType != 2016686642)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
        *a4 = 1;
      }
    }
  }

}

- (void)JFX_setIsFlashScene:(BOOL)a3
{
  NSObject *queryDataQueue;
  _QWORD v6[5];
  BOOL v7;

  -[JFXVideoCameraController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFlashScene"));
  queryDataQueue = self->_queryDataQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(queryDataQueue, v6);
}

void __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setIsFlashScene_queryDataQueue:", *(unsigned __int8 *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke_2;
  block[3] = &unk_24EE57B60;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__JFXVideoCameraController_JFX_setIsFlashScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFlashScene"));
}

- (void)JFX_resetSessionCaptureSessionQueue
{
  void *v3;
  void *v4;
  AVCaptureSession *captureSession;
  AVCaptureDeviceInput *cameraDeviceInput;
  AVCaptureDeviceInput *audioInput;
  AVCaptureVideoDataOutput *videoOutput;
  AVCapturePhotoOutput *photoOutput;
  AVCaptureDepthDataOutput *depthOutput;
  AVCaptureMetadataOutput *metadataOutput;
  AVCaptureAudioDataOutput *audioOutput;
  AVCaptureDataOutputSynchronizer *dataOutputSynchronizer;
  JFXARKitCameraSessionController *arCameraSessionController;
  uint64_t v15;
  NSObject *dataOutSynchQueue;
  NSObject *queryDataQueue;
  _QWORD v18[5];
  _QWORD block[5];

  if (-[AVCaptureSession isRunning](self->_captureSession, "isRunning"))
    -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
  -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("systemPressureState"), sAVCaptureDeviceSystemPressureState);

  -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("videoZoomFactor"), &sAVCaptureDeviceVideoZoomFactor);

  -[AVCapturePhotoOutput removeObserver:forKeyPath:context:](self->_photoOutput, "removeObserver:forKeyPath:context:", self, CFSTR("isFlashScene"), sAVCapturePhotoOutputIsFlashScene);
  captureSession = self->_captureSession;
  self->_captureSession = 0;

  -[JFXVideoCameraController JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:](self, "JFX_setCaptureDeviceType:captureDevicePositionCaptureSessionQueue:", 0, 0);
  cameraDeviceInput = self->_cameraDeviceInput;
  self->_cameraDeviceInput = 0;

  audioInput = self->_audioInput;
  self->_audioInput = 0;

  videoOutput = self->_videoOutput;
  self->_videoOutput = 0;

  photoOutput = self->_photoOutput;
  self->_photoOutput = 0;

  depthOutput = self->_depthOutput;
  self->_depthOutput = 0;

  metadataOutput = self->_metadataOutput;
  self->_metadataOutput = 0;

  -[AVCaptureAudioDataOutput setSampleBufferDelegate:queue:](self->_audioOutput, "setSampleBufferDelegate:queue:", 0, 0);
  audioOutput = self->_audioOutput;
  self->_audioOutput = 0;

  dataOutputSynchronizer = self->_dataOutputSynchronizer;
  self->_dataOutputSynchronizer = 0;

  arCameraSessionController = self->_arCameraSessionController;
  self->_arCameraSessionController = 0;

  v15 = MEMORY[0x24BDAC760];
  dataOutSynchQueue = self->_dataOutSynchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(dataOutSynchQueue, block);
  queryDataQueue = self->_queryDataQueue;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke_2;
  v18[3] = &unk_24EE57B60;
  v18[4] = self;
  dispatch_barrier_async(queryDataQueue, v18);
}

uint64_t __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setPvDetectedFacesArray_dataOutSynchQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMetadataFaceObjectsArray_dataOutSynchQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMetadataTrackedFacesArray_dataOutSynchQueue:", 0);
}

uint64_t __63__JFXVideoCameraController_JFX_resetSessionCaptureSessionQueue__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCaptureSessionRunning_queryDataQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentARMetadata_queryDataQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setStillImageFaceAnchor_queryDataQueue:", 0);
}

- (void)JFX_setZoomFactor_captureSessionQueue:(double)a3
{
  int64_t v5;
  double v7;
  void *v8;
  _QWORD v9[5];

  v5 = -[JFXVideoCameraController currentCameraPosition_captureSessionQueue](self, "currentCameraPosition_captureSessionQueue");
  if (a3 >= 1.0 && v5 == 1)
  {
    -[JFXVideoCameraController cameraVideoMaxZoomFactor_captureSessionQueue](self, "cameraVideoMaxZoomFactor_captureSessionQueue");
    if (v7 >= a3)
    {
      -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __66__JFXVideoCameraController_JFX_setZoomFactor_captureSessionQueue___block_invoke;
      v9[3] = &__block_descriptor_40_e25_v16__0__AVCaptureDevice_8l;
      *(double *)&v9[4] = a3;
      JFX_configureCaptureDevice(v8, v9);

    }
  }
}

uint64_t __66__JFXVideoCameraController_JFX_setZoomFactor_captureSessionQueue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVideoZoomFactor:", *(double *)(a1 + 32));
}

- (void)JFX_rampToZoom:(double)a3 rate:(double)a4 durationCaptureSessionQueue:(double)a5
{
  void *v8;
  _QWORD v9[7];

  -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__JFXVideoCameraController_JFX_rampToZoom_rate_durationCaptureSessionQueue___block_invoke;
  v9[3] = &__block_descriptor_56_e25_v16__0__AVCaptureDevice_8l;
  *(double *)&v9[4] = a5;
  *(double *)&v9[5] = a3;
  *(double *)&v9[6] = a4;
  JFX_configureCaptureDevice(v8, v9);

}

uint64_t __76__JFXVideoCameraController_JFX_rampToZoom_rate_durationCaptureSessionQueue___block_invoke(double *a1, void *a2)
{
  double v2;
  double v3;

  v2 = a1[5];
  if (a1[4] == 0.0)
  {
    v3 = a1[6];
    *(float *)&v3 = v3;
    return objc_msgSend(a2, "rampToVideoZoomFactor:withRate:", v2, v3);
  }
  else
  {
    *(float *)&v2 = v2;
    return objc_msgSend(a2, "rampExponentiallyToVideoZoomFactor:withDuration:", v2);
  }
}

- (BOOL)JFX_isUsingInternalMicCaptureSessionQueue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "portType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16C8]);

  return (char)v4;
}

- (BOOL)JFX_isARKitEnabledCaptureSessionQueue
{
  void *v2;
  BOOL v3;

  -[JFXVideoCameraController arCameraSessionController](self, "arCameraSessionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)JFX_setupARCameraSessionController
{
  JFXARKitCameraSessionController *v3;
  AVCaptureSession *captureSession;
  void *v5;
  JFXARKitCameraSessionController *v6;
  id v7;

  if (!self->_arCameraSessionController)
  {
    v3 = [JFXARKitCameraSessionController alloc];
    captureSession = self->_captureSession;
    -[AVCaptureDeviceInput device](self->_cameraDeviceInput, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[JFXARKitCameraSessionController initWithAVCaptureSession:captureDevice:arSessionDelegateQueue:](v3, "initWithAVCaptureSession:captureDevice:arSessionDelegateQueue:", captureSession, v5, self->_dataOutSynchQueue);
    -[JFXVideoCameraController setArCameraSessionController:](self, "setArCameraSessionController:", v6);

    -[JFXVideoCameraController arCameraSessionController](self, "arCameraSessionController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFrameDelegate:", self);

  }
}

- (void)JFX_startARCameraSessionController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "starting ARKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)JFX_createPVFrameSetFromPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 timeInterval:(double)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int32_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CMTime v22;
  CMTime v23;
  id v24;
  CMTime v25;
  CMTime v26;

  v10 = a4;
  memset(&v26, 0, sizeof(v26));
  CMTimeMakeWithSeconds(&v26, a5, 1000000000);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[JFXMediaSettings timeScale](JFXMediaSettings, "timeScale");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PVFrameSetMetadataARMetadataKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "capturedDepthData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  memset(&v25, 0, sizeof(v25));
  CMTimeMake(&v25, 1, v12);
  v23 = v26;
  v24 = 0;
  v22 = v25;
  objc_msgSend(MEMORY[0x24BE78FF0], "sampleBufferWithPVImageBuffer:timestamp:frameDuration:error:", v11, &v23, &v22, &v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;
  v19 = v18;
  if (a6)
    *a6 = objc_retainAutorelease(v18);
  if (v19)
  {
    if (objc_msgSend(v17, "sampleBufferRef"))
    {
      memset(&v23, 0, sizeof(v23));
      CMSampleBufferGetPresentationTimeStamp(&v23, (CMSampleBufferRef)objc_msgSend(v17, "sampleBufferRef"));
      v22 = v23;
      -[JFXVideoCameraController JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:](self, "JFX_notifyVideoDelegatesOfDroppedFrameWithTimeStamp:", &v22);
    }
    v20 = 0;
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79020]), "initWithColorBuffer:depthData:metadata:", v17, v16, v10);
  }

  return v20;
}

- (id)JFX_updateCurrentlyTrackedFaceID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      -[JFXVideoCameraController currentlyTrackedFaceID](self, "currentlyTrackedFaceID", (_QWORD)v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        -[JFXVideoCameraController setCurrentlyTrackedFaceID:](self, "setCurrentlyTrackedFaceID:", v9);
      -[JFXVideoCameraController currentlyTrackedFaceID](self, "currentlyTrackedFaceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v11);

      if ((v12 & 1) != 0)
        break;
      objc_msgSend(v4, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v13)
        -[JFXVideoCameraController setCurrentlyTrackedFaceID:](self, "setCurrentlyTrackedFaceID:", v9);
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  -[JFXVideoCameraController currentlyTrackedFaceID](self, "currentlyTrackedFaceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)JFX_currentAVMetadataFaceObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke;
  v13[3] = &unk_24EE5A6C8;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v8 = -[JFXVideoCameraController JFX_updateCurrentlyTrackedFaceID:](self, "JFX_updateCurrentlyTrackedFaceID:", v7);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke_2;
  v12[3] = &unk_24EE5A6F0;
  v12[4] = self;
  v9 = objc_msgSend(v4, "indexOfObjectPassingTest:", v12);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "faceID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __60__JFXVideoCameraController_JFX_currentAVMetadataFaceObject___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v3 = objc_msgSend(a2, "faceID");
  objc_msgSend(*(id *)(a1 + 32), "currentlyTrackedFaceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == objc_msgSend(v4, "integerValue");

  return v5;
}

- (JFXFaceAnchor)JFX_processPixelBufferForFaceTransform:(double)a3 cameraIntrinsics:(float)a4 forNormalizedFaceRect:(CGFloat)a5 withRollAngle:(CGFloat)a6 withTimestamp:(CGFloat)a7 andDuration:(CGFloat)a8 detectionOrientation:(float)a9 interfaceOrientation:(uint64_t)a10 needsMirroring:(__CVBuffer *)a11
{
  __int128 v27;
  size_t Width;
  size_t Height;
  double v30;
  void *v31;
  double v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double SquareWithSize;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  JFXFaceAnchor *v65;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  unsigned int v75;
  double v77;
  double v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  void *v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  uint64_t v87;
  _QWORD v88[3];
  CGRect v89;

  v88[1] = *MEMORY[0x24BDAC8D0];
  v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v82.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v82.c = v27;
  *(_OWORD *)&v82.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  Width = CVPixelBufferGetWidth(a11);
  Height = CVPixelBufferGetHeight(a11);
  CGAffineTransformMakeTranslation(&v82, (double)Height, 0.0);
  v80 = v82;
  CGAffineTransformRotate(&v81, &v80, 3.14159265);
  v82 = v81;
  v30 = a2 / (a4 + a4);
  objc_msgSend(a1, "vcpAnalyzer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = a16;
  v74 = a15;
  if (v31)
  {
    v32 = v30 * (double)Width;
    objc_msgSend(a1, "vcpAnalyzer");
    v33 = objc_claimAutoreleasedReturnValue();
    v87 = *MEMORY[0x24BE64230];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject updatePreferredTransform:properties:](v33, "updatePreferredTransform:properties:", &v82, v35);

  }
  else
  {
    JFXLog_camera();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[JFXVideoCameraController JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:].cold.1();
  }

  v85[0] = *MEMORY[0x24BE64220];
  v89.origin.x = a5;
  v89.origin.y = a6;
  v89.size.width = a7;
  v89.size.height = a8;
  NSStringFromCGRect(v89);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v37;
  v85[1] = *MEMORY[0x24BE64228];
  *(float *)&v38 = a9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "vcpAnalyzer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v81.a = *(_OWORD *)a12;
  v81.c = *(CGFloat *)(a12 + 16);
  *(_OWORD *)&v80.a = *(_OWORD *)a13;
  v80.c = *(CGFloat *)(a13 + 16);
  objc_msgSend(v42, "analyzePixelBuffer:withTimestamp:andDuration:properties:error:", a11, &v81, &v80, v41, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x24BE64218]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "count"))
  {
    objc_msgSend(v44, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "transform");
    v77 = v46;
    v72 = v48;
    v73 = v47;
    v71 = v49;
    objc_msgSend(v45, "geometry");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "vertices");
    v79 = a8;
    objc_msgSend(v45, "geometry");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "vertices");

    SquareWithSize = CGRectMakeSquareWithSize();
    v68 = v53;
    v69 = SquareWithSize;
    v55 = v54;
    v67 = v56;
    +[JFXFaceTrackingUtilities faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:](JFXFaceTrackingUtilities, "faceRectScaleFactorForInterfaceOrientation:andDeviceInterfaceOrientation:", v74, +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
    v70 = a7;
    v58 = v57;
    v59 = a6;
    v61 = v60;
    v62 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(v74);
    objc_msgSend(a1, "cameraFrameResolution_dataOutSynchQueue");
    v65 = -[JFXFaceAnchor initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:]([JFXFaceAnchor alloc], "initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:", v75, v62, 3, v77, v73, v72, v71, v69, v68, v55, v67, v58, v61, v63, v64);
    -[JFXFaceAnchor setFocalLength:](v65, "setFocalLength:", v30);
    -[JFXFaceAnchor setNormalizedFaceRect:](v65, "setNormalizedFaceRect:", a5, v59, v70, v79);
    if (!+[JFXFaceTrackingUtilities isFaceAnchorInRange:](JFXFaceTrackingUtilities, "isFaceAnchorInRange:", v65))
    {

      v65 = 0;
    }

  }
  else
  {
    v65 = 0;
  }

  return v65;
}

- (NSNumber)largestDepthDimension
{
  return self->_largestDepthDimension;
}

- (void)setLargestDepthDimension:(id)a3
{
  objc_storeStrong((id *)&self->_largestDepthDimension, a3);
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerName, a3);
}

- (JFXVideoCameraThermalDelegate)thermalDelegate
{
  return self->_thermalDelegate;
}

- (JFXARKitCameraSessionController)arCameraSessionController
{
  return self->_arCameraSessionController;
}

- (void)setArCameraSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_arCameraSessionController, a3);
}

- (int64_t)cameraMode_captureSessionQueue
{
  return self->_cameraMode_captureSessionQueue;
}

- (void)setCameraMode_captureSessionQueue:(int64_t)a3
{
  self->_cameraMode_captureSessionQueue = a3;
}

- (int64_t)cameraMode_dataOutSynchQueue
{
  return self->_cameraMode_dataOutSynchQueue;
}

- (void)setCameraMode_dataOutSynchQueue:(int64_t)a3
{
  self->_cameraMode_dataOutSynchQueue = a3;
}

- (int64_t)cameraMode_queryDataQueue
{
  return self->_cameraMode_queryDataQueue;
}

- (void)setCameraMode_queryDataQueue:(int64_t)a3
{
  self->_cameraMode_queryDataQueue = a3;
}

- (BOOL)captureSessionRunning_queryDataQueue
{
  return self->_captureSessionRunning_queryDataQueue;
}

- (void)setCaptureSessionRunning_queryDataQueue:(BOOL)a3
{
  self->_captureSessionRunning_queryDataQueue = a3;
}

- (NSString)cameraType_queryDataQueue
{
  return self->_cameraType_queryDataQueue;
}

- (void)setCameraType_queryDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cameraType_queryDataQueue, a3);
}

- (int64_t)currentCameraPosition_captureSessionQueue
{
  return self->_currentCameraPosition_captureSessionQueue;
}

- (void)setCurrentCameraPosition_captureSessionQueue:(int64_t)a3
{
  self->_currentCameraPosition_captureSessionQueue = a3;
}

- (int64_t)currentCameraPosition_dataOutSynchQueue
{
  return self->_currentCameraPosition_dataOutSynchQueue;
}

- (void)setCurrentCameraPosition_dataOutSynchQueue:(int64_t)a3
{
  self->_currentCameraPosition_dataOutSynchQueue = a3;
}

- (int64_t)currentCameraPosition_queryDataQueue
{
  return self->_currentCameraPosition_queryDataQueue;
}

- (void)setCurrentCameraPosition_queryDataQueue:(int64_t)a3
{
  self->_currentCameraPosition_queryDataQueue = a3;
}

- (int64_t)cameraColorSpace_queryDataQueue
{
  return self->_cameraColorSpace_queryDataQueue;
}

- (void)setCameraColorSpace_queryDataQueue:(int64_t)a3
{
  self->_cameraColorSpace_queryDataQueue = a3;
}

- (double)cameraVideoZoomFactor_queryDataQueue
{
  return self->_cameraVideoZoomFactor_queryDataQueue;
}

- (void)setCameraVideoZoomFactor_queryDataQueue:(double)a3
{
  self->_cameraVideoZoomFactor_queryDataQueue = a3;
}

- (double)cameraVideoMaxZoomFactor_captureSessionQueue
{
  return self->_cameraVideoMaxZoomFactor_captureSessionQueue;
}

- (void)setCameraVideoMaxZoomFactor_captureSessionQueue:(double)a3
{
  self->_cameraVideoMaxZoomFactor_captureSessionQueue = a3;
}

- (__n128)cameraDeviceIntrinsics_dataOutSynchQueue
{
  return a1[27];
}

- (__n128)setCameraDeviceIntrinsics_dataOutSynchQueue:(__n128)a3
{
  result[27] = a2;
  result[28] = a3;
  result[29] = a4;
  return result;
}

- (CGSize)cameraFrameResolution_dataOutSynchQueue
{
  double width;
  double height;
  CGSize result;

  width = self->_cameraFrameResolution_dataOutSynchQueue.width;
  height = self->_cameraFrameResolution_dataOutSynchQueue.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCameraFrameResolution_dataOutSynchQueue:(CGSize)a3
{
  self->_cameraFrameResolution_dataOutSynchQueue = a3;
}

- (int64_t)cachedMovieRecordingTorchMode
{
  return self->_cachedMovieRecordingTorchMode;
}

- (void)setCachedMovieRecordingTorchMode:(int64_t)a3
{
  self->_cachedMovieRecordingTorchMode = a3;
}

- (NSArray)pvDetectedFacesArray_dataOutSynchQueue
{
  return self->_pvDetectedFacesArray_dataOutSynchQueue;
}

- (void)setPvDetectedFacesArray_dataOutSynchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pvDetectedFacesArray_dataOutSynchQueue, a3);
}

- (NSArray)metadataFaceObjectsArray_dataOutSynchQueue
{
  return self->_metadataFaceObjectsArray_dataOutSynchQueue;
}

- (void)setMetadataFaceObjectsArray_dataOutSynchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metadataFaceObjectsArray_dataOutSynchQueue, a3);
}

- (NSArray)metadataTrackedFacesArray_dataOutSynchQueue
{
  return self->_metadataTrackedFacesArray_dataOutSynchQueue;
}

- (void)setMetadataTrackedFacesArray_dataOutSynchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metadataTrackedFacesArray_dataOutSynchQueue, a3);
}

- (int64_t)captureVideoOrientation_dataOutSynchQueue
{
  return self->_captureVideoOrientation_dataOutSynchQueue;
}

- (void)setCaptureVideoOrientation_dataOutSynchQueue:(int64_t)a3
{
  self->_captureVideoOrientation_dataOutSynchQueue = a3;
}

- (int64_t)captureVideoOrientation_queryDataQueue
{
  return self->_captureVideoOrientation_queryDataQueue;
}

- (void)setCaptureVideoOrientation_queryDataQueue:(int64_t)a3
{
  self->_captureVideoOrientation_queryDataQueue = a3;
}

- (BOOL)allowARMetadata_queryDataQueue
{
  return self->_allowARMetadata_queryDataQueue;
}

- (void)setAllowARMetadata_queryDataQueue:(BOOL)a3
{
  self->_allowARMetadata_queryDataQueue = a3;
}

- (BOOL)hasValidFaceData_queryDataQueue
{
  return self->_hasValidFaceData_queryDataQueue;
}

- (void)setHasValidFaceData_queryDataQueue:(BOOL)a3
{
  self->_hasValidFaceData_queryDataQueue = a3;
}

- (BOOL)sessionRequiresFaceTracking_queryDataQueue
{
  return self->_sessionRequiresFaceTracking_queryDataQueue;
}

- (void)setSessionRequiresFaceTracking_queryDataQueue:(BOOL)a3
{
  self->_sessionRequiresFaceTracking_queryDataQueue = a3;
}

- (BOOL)skipARProcessingWhenNoFaceData_queryDataQueue
{
  return self->_skipARProcessingWhenNoFaceData_queryDataQueue;
}

- (void)setSkipARProcessingWhenNoFaceData_queryDataQueue:(BOOL)a3
{
  self->_skipARProcessingWhenNoFaceData_queryDataQueue = a3;
}

- (BOOL)isFlashScene_queryDataQueue
{
  return self->_isFlashScene_queryDataQueue;
}

- (void)setIsFlashScene_queryDataQueue:(BOOL)a3
{
  self->_isFlashScene_queryDataQueue = a3;
}

- (PVFrameSet)capturedPhotoFrameSet_dataOutSynchQueue
{
  return self->_capturedPhotoFrameSet_dataOutSynchQueue;
}

- (void)setCapturedPhotoFrameSet_dataOutSynchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_capturedPhotoFrameSet_dataOutSynchQueue, a3);
}

- (PVFrameSet)currentFrameSet_dataOutSynchQueue
{
  return self->_currentFrameSet_dataOutSynchQueue;
}

- (void)setCurrentFrameSet_dataOutSynchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrameSet_dataOutSynchQueue, a3);
}

- (JFXARMetadata)mostRecentARMetadata_queryDataQueue
{
  return self->_mostRecentARMetadata_queryDataQueue;
}

- (void)setMostRecentARMetadata_queryDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentARMetadata_queryDataQueue, a3);
}

- (JFXFaceAnchor)stillImageFaceAnchor_queryDataQueue
{
  return self->_stillImageFaceAnchor_queryDataQueue;
}

- (void)setStillImageFaceAnchor_queryDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageFaceAnchor_queryDataQueue, a3);
}

- (BOOL)isRecordingMovie_captureSessionQueue
{
  return self->_isRecordingMovie_captureSessionQueue;
}

- (void)setIsRecordingMovie_captureSessionQueue:(BOOL)a3
{
  self->_isRecordingMovie_captureSessionQueue = a3;
}

- (NSNumber)currentlyTrackedFaceID
{
  return self->_currentlyTrackedFaceID;
}

- (void)setCurrentlyTrackedFaceID:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyTrackedFaceID, a3);
}

- (JFXCaptureCallObserver)callObserver
{
  return self->_callObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_currentlyTrackedFaceID, 0);
  objc_storeStrong((id *)&self->_stillImageFaceAnchor_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_mostRecentARMetadata_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_currentFrameSet_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_capturedPhotoFrameSet_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_metadataTrackedFacesArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_metadataFaceObjectsArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_pvDetectedFacesArray_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_cameraType_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_arCameraSessionController, 0);
  objc_storeStrong((id *)&self->_thermalDelegate, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_vcpAnalyzer, 0);
  objc_storeStrong((id *)&self->_largestDepthDimension, 0);
  objc_storeStrong((id *)&self->_livePlayerSourceQueue, 0);
  objc_storeStrong((id *)&self->_livePlayerSources, 0);
  objc_storeStrong((id *)&self->_audioDelegateQueue, 0);
  objc_storeStrong((id *)&self->_audioDelegates, 0);
  objc_storeStrong((id *)&self->_videoDelegateQueue, 0);
  objc_storeStrong((id *)&self->_videoDelegates, 0);
  objc_storeStrong(&self->_capturePhotoCompletionBlock, 0);
  objc_storeStrong((id *)&self->_photoOutCodec, 0);
  objc_storeStrong((id *)&self->_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_dataOutSynchQueue, 0);
  objc_storeStrong((id *)&self->_audioOutQueue, 0);
  objc_storeStrong((id *)&self->_captureSessionQueue, 0);
  objc_storeStrong((id *)&self->_dataOutputSynchronizer, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_cameraDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)vcpAnalyzer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "creating vcpAnalyzer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_captureSessionDidStartRunningNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "AVCaptureSessionDidStartRunningNotification: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)JFX_captureSessionDidStopRunningNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "AVCaptureSessionDidStopRunningNotification: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __71__JFXVideoCameraController_JFX_captureSessionRuntimeErrorNotification___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "AVCaptureSessionRuntimeErrorNotification camera rebuilt and restarted, error: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "mic: NOT using internal mic. setting to automatic configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__JFXVideoCameraController_JFX_audioSessionRouteChangeNotification___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "mic: using internal mic. setting to omni", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveToPhotoLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "Saving %@ to photo library", v2);
  OUTLINED_FUNCTION_4();
}

void __89__JFXVideoCameraController_preProcessFrameWithPixelBuffer_metadata_timestamp_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "pre-process frame failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Dropping frame due to tracked faces metadata being empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "-[AVDepthData depthDataByReplacingDepthDataMapWithPixelBuffer:error:] returned an  error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Dropping frame due to nil metadata.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataOutputSynchronizer:(void *)a1 didOutputSynchronizedDataCollection:.cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "droppedReason");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "Dropping frame due to depth data being dropped (reason: %ld).", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)dataOutputSynchronizer:didOutputSynchronizedDataCollection:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "Dropping frame due to video buffer being dropped (reason: %@).", v2);
  OUTLINED_FUNCTION_4();
}

- (void)JFX_setupCaptureSessionVideoDataOutputError:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "alwaysDiscardsLateVideoFrames = %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_setupCaptureSessionDepthError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "failure to add depth output to device that is JFXCaptureCapabilitiesIsDepthCapableDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __109__JFXVideoCameraController_JFX_configureCaptureSesstionForPosition_applyFFCZoom_configureLockedCamera_error___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 8), "sessionPreset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "_captureSession.sessionPreset %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_processPixelBufferForFaceTransform:cameraIntrinsics:forNormalizedFaceRect:withRollAngle:withTimestamp:andDuration:detectionOrientation:interfaceOrientation:needsMirroring:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2269A9000, v0, OS_LOG_TYPE_ERROR, "VCP Analyzer is nil", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
