@implementation AXCameraVisionEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  if (UIAccessibilityIsVoiceOverRunning())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__AXCameraVisionEngine_sharedEngine__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedEngine_onceToken != -1)
      dispatch_once(&sharedEngine_onceToken, block);
  }
  return (id)sharedEngine_sharedVisionEngine;
}

void __36__AXCameraVisionEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedEngine_sharedVisionEngine;
  sharedEngine_sharedVisionEngine = (uint64_t)v1;

}

- (AXCameraVisionEngine)init
{
  AXCameraVisionEngine *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *axResultsQueue;
  uint64_t v6;
  NSMutableDictionary *mostRecentVisionFeatures;
  uint64_t v8;
  NSMutableDictionary *mostRecentVisionFeaturesUpdateTimes;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXCameraVisionEngine;
  v2 = -[AXCameraVisionEngine init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AXCameraVisionEngine", v3);
    axResultsQueue = v2->_axResultsQueue;
    v2->_axResultsQueue = (OS_dispatch_queue *)v4;

    -[AXCameraVisionEngine _setupEngine](v2, "_setupEngine");
    -[AXCameraVisionEngine _setupHaptics](v2, "_setupHaptics");
    -[AXCameraVisionEngine _setupLeveling](v2, "_setupLeveling");
    -[AXCameraVisionEngine _resetAnnouncementState](v2, "_resetAnnouncementState");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    mostRecentVisionFeatures = v2->__mostRecentVisionFeatures;
    v2->__mostRecentVisionFeatures = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    mostRecentVisionFeaturesUpdateTimes = v2->__mostRecentVisionFeaturesUpdateTimes;
    v2->__mostRecentVisionFeaturesUpdateTimes = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__handleAnnouncementDidFinish_, *MEMORY[0x24BDF71D0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXCameraVisionEngine;
  -[AXCameraVisionEngine dealloc](&v4, sel_dealloc);
}

- (void)setAppActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_appActive = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__AXCameraVisionEngine_setAppActive___block_invoke;
  v3[3] = &unk_24FEE0220;
  v3[4] = self;
  v4 = a3;
  -[AXCameraVisionEngine _dispatchToResultsQueueWithBlock:](self, "_dispatchToResultsQueueWithBlock:", v3);
}

uint64_t __37__AXCameraVisionEngine_setAppActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_queue_appActive:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    -[AXCameraVisionEngine _resetScheduling](self, "_resetScheduling");
    -[AXCameraVisionEngine _clearCachedVisionResults](self, "_clearCachedVisionResults");
    -[AXCameraVisionEngine _resetAccessiblityElements](self, "_resetAccessiblityElements");
    -[AXCameraVisionEngine _resetAnnouncementState](self, "_resetAnnouncementState");
  }
}

- (void)setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__AXCameraVisionEngine_setCaptureDevicePosition_mode___block_invoke;
  v4[3] = &unk_24FEE0248;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[AXCameraVisionEngine _dispatchToResultsQueueWithBlock:](self, "_dispatchToResultsQueueWithBlock:", v4);
}

uint64_t __54__AXCameraVisionEngine_setCaptureDevicePosition_mode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCaptureDevicePosition:mode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  self->_cameraDevicePosition = a3;
  self->_cameraMode = a4;
  -[AXCameraVisionEngine _resetScheduling](self, "_resetScheduling");
  -[AXCameraVisionEngine _clearCachedVisionResults](self, "_clearCachedVisionResults");
  -[AXCameraVisionEngine _resetAccessiblityElements](self, "_resetAccessiblityElements");
  -[AXCameraVisionEngine _resetAnnouncementState](self, "_resetAnnouncementState");
  -[AXCameraVisionEngine set_lastSampleBufferSize:](self, "set_lastSampleBufferSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (BOOL)_isMirrored
{
  return -[AXCameraVisionEngine cameraDevicePosition](self, "cameraDevicePosition") == 1;
}

- (void)_resetScheduling
{
  -[AXCameraVisionEngine setLastDesiredAnalysisOptions:](self, "setLastDesiredAnalysisOptions:", 0);
  -[AXCameraVisionEngine setCurrentFrameCount:](self, "setCurrentFrameCount:", 0);
}

- (void)_clearCachedVisionResults
{
  id v2;

  -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_resetAccessiblityElements
{
  void *v3;

  -[AXCameraVisionEngine set_accessibilityElementCandidates:](self, "set_accessibilityElementCandidates:", 0);
  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElements:", 0);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_resetAnnouncementState
{
  void *v3;

  -[AXCameraVisionEngine setLastAnnouncement:](self, "setLastAnnouncement:", 0);
  -[AXCameraVisionEngine setLastAnnouncementType:](self, "setLastAnnouncementType:", 0);
  -[AXCameraVisionEngine setLastAnnouncementTime:](self, "setLastAnnouncementTime:", CFAbsoluteTimeGetCurrent());
  -[AXCameraVisionEngine setInflightAnnouncement:](self, "setInflightAnnouncement:", 0);
  -[AXCameraVisionEngine setPreviousSceneAnnouncementCandidateWithoutLocation:](self, "setPreviousSceneAnnouncementCandidateWithoutLocation:", 0);
  -[AXCameraVisionEngine setLastSceneAnnouncement:](self, "setLastSceneAnnouncement:", 0);
  -[AXCameraVisionEngine setLastSceneAnnouncementFull:](self, "setLastSceneAnnouncementFull:", 0);
  -[AXCameraVisionEngine setLastSceneAnnouncementWithoutLocation:](self, "setLastSceneAnnouncementWithoutLocation:", 0);
  -[AXCameraVisionEngine setLastSceneAnnouncementLocation:](self, "setLastSceneAnnouncementLocation:", 0);
  -[AXCameraVisionEngine setLastSceneAnnouncementTime:](self, "setLastSceneAnnouncementTime:", 0.0);
  -[AXCameraVisionEngine setLastSceneAnnouncementFullTime:](self, "setLastSceneAnnouncementFullTime:", 0.0);
  -[AXCameraVisionEngine _levelingMotionAnalyzer](self, "_levelingMotionAnalyzer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[AXCameraVisionEngine setLastLevelZone:](self, "setLastLevelZone:", 0);
  -[AXCameraVisionEngine setLastLevelZoneChangedTime:](self, "setLastLevelZoneChangedTime:", 0.0);
  -[AXCameraVisionEngine setLastLevelAnnouncementZone:](self, "setLastLevelAnnouncementZone:", 0);
  -[AXCameraVisionEngine setLastLevelAnnouncementTime:](self, "setLastLevelAnnouncementTime:", 0.0);
}

- (BOOL)useThirdsForLocation
{
  return 1;
}

- (void)_dispatchToResultsQueueWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[AXCameraVisionEngine axResultsQueue](self, "axResultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AXCameraVisionEngine__dispatchToResultsQueueWithBlock___block_invoke;
  block[3] = &unk_24FEE0270;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __57__AXCameraVisionEngine__dispatchToResultsQueueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x2348BFE0C]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_performOnMainQueueWithBlock:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD block[4];
  void (**v6)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v4 = (void *)MEMORY[0x2348BFE0C]();
      v3[2](v3);
      objc_autoreleasePoolPop(v4);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__AXCameraVisionEngine__performOnMainQueueWithBlock___block_invoke;
      block[3] = &unk_24FEE0270;
      v6 = v3;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __53__AXCameraVisionEngine__performOnMainQueueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x2348BFE0C]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_setupEngine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7F8]), "initWithIdentifier:", CFSTR("CameraEngine"));
  objc_msgSend(obj, "setMaximumQueueSize:", 0);
  objc_msgSend(obj, "setDiagnosticsEnabled:", 1);
  objc_msgSend(obj, "setPrioritySchedulingEnabled:", 0);
  objc_storeStrong((id *)&self->_visionEngine, obj);
  if (objc_msgSend(obj, "canAddEvaluationNodeClass:", objc_opt_class()))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7A8]), "initWithIdentifier:", CFSTR("face"));
    objc_msgSend(obj, "addEvaluationNode:", v3);

  }
  if (objc_msgSend(obj, "canAddEvaluationNodeClass:", objc_opt_class()))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7D8]), "initWithIdentifier:", CFSTR("prominentObject"));
    objc_msgSend(obj, "addEvaluationNode:", v4);

  }
  if (objc_msgSend(obj, "canAddEvaluationNodeClass:", objc_opt_class()))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7E0]), "initWithIdentifier:", CFSTR("sceneDetector"));
    objc_msgSend(v5, "setTaxonomyOptions:", 7);
    objc_msgSend(obj, "addEvaluationNode:", v5);

  }
  if (objc_msgSend(obj, "canAddEvaluationNodeClass:", objc_opt_class()))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7B0]), "initWithIdentifier:", CFSTR("horizon"));
    objc_msgSend(obj, "addEvaluationNode:", v6);

  }
  if (objc_msgSend(obj, "canAddEvaluationNodeClass:", objc_opt_class()))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7C0]), "initWithIdentifier:", CFSTR("aesthetics"));
    objc_msgSend(obj, "addEvaluationNode:", v7);

  }
  self->_interfaceOrientation = 0;
  -[AXCameraVisionEngine setCameraDevicePosition:](self, "setCameraDevicePosition:", 0);
  -[AXCameraVisionEngine setCameraMode:](self, "setCameraMode:", 0);

}

- (void)_setupHaptics
{
  AXCameraHapticEngine *v3;
  AXCameraHapticEngine *hapticEngine;

  v3 = objc_alloc_init(AXCameraHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v3;

  -[AXCameraHapticEngine setScreenEdgeFeedbackCooldownTime:](self->_hapticEngine, "setScreenEdgeFeedbackCooldownTime:", 0.2);
}

- (void)_setupLeveling
{
  AXCameraLevelingMotionAnalyzer *v3;
  AXCameraLevelingMotionAnalyzer *levelingMotionAnalyzer;

  v3 = objc_alloc_init(AXCameraLevelingMotionAnalyzer);
  levelingMotionAnalyzer = self->__levelingMotionAnalyzer;
  self->__levelingMotionAnalyzer = v3;

}

- (AVCaptureSession)captureSession
{
  return (AVCaptureSession *)objc_loadWeakRetained((id *)&self->_captureSession);
}

- (void)setCaptureSession:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[AXCameraVisionEngine visionEngine](self, "visionEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canAddSourceNodeClass:", objc_opt_class());

    v5 = obj;
    if (v7)
    {
      objc_storeWeak((id *)&self->_captureSession, obj);
      -[AXCameraVisionEngine _setupCaptureSessionNode](self, "_setupCaptureSessionNode");
      v5 = obj;
    }
  }

}

- (void)_setupCaptureSessionNode
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (*v8)(uint64_t);
  uint64_t *p_block;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint64_t block;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);

  v4 = MEMORY[0x24BDAC760];
  if (WeakRetained)
  {
    if (!self->_captureSessionNode)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE760]), "initWithIdentifier:", CFSTR("captureSession"));
      -[AXCameraVisionEngine setCaptureSessionNode:](self, "setCaptureSessionNode:", v5);

      -[AXCameraVisionEngine visionEngine](self, "visionEngine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXCameraVisionEngine captureSessionNode](self, "captureSessionNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSourceNode:", v7);

    }
    v16 = v4;
    v8 = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke;
    p_block = &v16;
    goto LABEL_7;
  }
  -[AXCameraVisionEngine captureSessionNode](self, "captureSessionNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    block = v4;
    v8 = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_2;
    p_block = &block;
LABEL_7:
    p_block[1] = 3221225472;
    p_block[2] = (uint64_t)v8;
    p_block[3] = (uint64_t)&unk_24FEDFFA8;
    p_block[4] = (uint64_t)self;
    dispatch_async(MEMORY[0x24BDAC9B8], p_block);
  }
  objc_initWeak(&location, self);
  -[AXCameraVisionEngine visionEngine](self, "visionEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_3;
  v12[3] = &unk_24FEE02C0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v11, "addResultHandler:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "captureSessionNode");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "axResultsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginFrameEventsWithAVCaptureSession:delegate:queue:", WeakRetained, v3, v4);

}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "captureSessionNode");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endVideoFrameEvents");

}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _AXLogWithFacility();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_4;
      v8[3] = &unk_24FEE0298;
      v8[4] = WeakRetained;
      v9 = v5;
      objc_msgSend(v6, "_dispatchToResultsQueueWithBlock:", v8);

    }
  }

}

void __48__AXCameraVisionEngine__setupCaptureSessionNode__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "features");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "evaluatedFeatureTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleVisionFeatures:evaluatedFeatureTypes:userContext:", v5, v3, v4);

}

- (id)_analysisOptionsForIncomingFrame
{
  id v3;
  _BOOL4 v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;

  v3 = objc_alloc_init(MEMORY[0x24BDFE7F0]);
  v4 = -[AXCameraVisionEngine _hasRealtimeFacesWithoutNames](self, "_hasRealtimeFacesWithoutNames");
  if (v4 || !-[AXCameraVisionEngine _hasDetectedFaces](self, "_hasDetectedFaces"))
  {
    objc_msgSend(v3, "setDetectFaceNames:", 1);
    objc_msgSend(v3, "setDetectFaceRectangles:", !v4);
  }
  v5 = -[AXCameraVisionEngine currentFrameCount](self, "currentFrameCount") % 0x1E;
  v6 = -[AXCameraVisionEngine currentFrameCount](self, "currentFrameCount");
  -[AXCameraVisionEngine lastDesiredAnalysisOptions](self, "lastDesiredAnalysisOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDFE7F0]);
  if (objc_msgSend(v3, "detectFaceNames"))
  {
    v9 = objc_msgSend(v7, "detectFaceNames") ^ 1;
    if (v5)
      v10 = v9;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v8, "setDetectFaceNames:", v10);
  if (objc_msgSend(v3, "detectFaceRectangles"))
  {
    v11 = objc_msgSend(v7, "detectFaceRectangles") ^ 1;
    if (v5)
      v12 = v11;
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v8, "setDetectFaceRectangles:", v12);
  if (objc_msgSend(v3, "detectProminentObjects"))
  {
    v13 = objc_msgSend(v7, "detectProminentObjects") ^ 1;
    if (v5)
      v14 = v13;
    else
      v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v8, "setDetectProminentObjects:", v14);
  if (objc_msgSend(v3, "detectScenes"))
  {
    v15 = objc_msgSend(v7, "detectScenes") ^ 1;
    if (v6 % 0x1E)
      v16 = v15;
    else
      v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v8, "setDetectScenes:", v16);
  if (objc_msgSend(v3, "detectHorizon"))
  {
    v17 = objc_msgSend(v7, "detectHorizon") ^ 1;
    if (v5)
      v18 = v17;
    else
      v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v8, "setDetectHorizon:", v18);
  if (objc_msgSend(v3, "detectAesthetics"))
  {
    v19 = objc_msgSend(v7, "detectAesthetics") ^ 1;
    if (v5)
      v20 = v19;
    else
      v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v8, "setDetectAesthetics:", v20);
  -[AXCameraVisionEngine setCurrentFrameCount:](self, "setCurrentFrameCount:", -[AXCameraVisionEngine currentFrameCount](self, "currentFrameCount") + 1);
  -[AXCameraVisionEngine setLastDesiredAnalysisOptions:](self, "setLastDesiredAnalysisOptions:", v3);

  return v8;
}

- (BOOL)_hasRealtimeFacesWithoutNames
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24FEF04F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXCameraVisionEngine _accessibilityElementCandidates](self, "_accessibilityElementCandidates");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "isFace", (_QWORD)v13))
          {
            objc_msgSend(v9, "faceName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "length");

            if (!v11)
            {
              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_hasDetectedFaces
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24FEF0508);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24FEF04F0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (void)_performBecameLevelFeedback
{
  id v2;

  -[AXCameraVisionEngine hapticEngine](self, "hapticEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performLevelFeedback");

}

- (void)_performBecameUnlevelFeedback
{
  id v2;

  -[AXCameraVisionEngine hapticEngine](self, "hapticEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performUnlevelFeedback");

}

- (void)_performScreenEdgeHaptic
{
  id v2;

  -[AXCameraVisionEngine hapticEngine](self, "hapticEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSubjectHitScreenEdgeFeedback");

}

- (void)_handleVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 userContext:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint8_t v30;
  _BYTE v31[15];
  uint8_t v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v9 = a5;
  if (v9)
  {
    -[AXCameraVisionEngine lastCameraFrameContext](self, "lastCameraFrameContext");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_4;
    v11 = (void *)v10;
    objc_msgSend(v9, "presentationTimestamp");
    v13 = v12;
    -[AXCameraVisionEngine lastCameraFrameContext](self, "lastCameraFrameContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationTimestamp");
    v16 = v15;

    if (v13 > v16)
LABEL_4:
      -[AXCameraVisionEngine setLastCameraFrameContext:](self, "setLastCameraFrameContext:", v9);
  }
  v28 = v9;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v23, "isMotion"))
        {
          AXMediaLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            -[AXCameraVisionEngine _handleVisionFeatures:evaluatedFeatureTypes:userContext:].cold.2(&v32, v33, v24);

        }
        if (objc_msgSend(v23, "isCameraMetadata"))
        {
          AXMediaLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            -[AXCameraVisionEngine _handleVisionFeatures:evaluatedFeatureTypes:userContext:].cold.1(&v30, v31, v25);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "featureType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, v26);
        }
        objc_msgSend(v27, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v29, "count"))
    -[AXCameraVisionEngine _handleUpdatedVisionFeatures:evaluatedFeatureTypes:fromMotionUpdate:](self, "_handleUpdatedVisionFeatures:evaluatedFeatureTypes:fromMotionUpdate:", v17, v29, 0);

}

- (void)_handleUpdatedVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4 fromMotionUpdate:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double Current;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  AXCameraVisionEngine *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self;
  -[AXCameraVisionEngine _mostRecentVisionFeaturesUpdateTimes](self, "_mostRecentVisionFeaturesUpdateTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v17);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", Current);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v17);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[AXCameraVisionEngine _purgeExpiredVisionFeaturesUsingTime:](v20, "_purgeExpiredVisionFeaturesUsingTime:", Current);
  -[AXCameraVisionEngine _createAccessibilityElementCandidatesForVisionFeatures:evaluatedFeatureTypes:](v20, "_createAccessibilityElementCandidatesForVisionFeatures:evaluatedFeatureTypes:", v9, v12);
  -[AXCameraVisionEngine _generateAnnouncementsForVisionFeatures:](v20, "_generateAnnouncementsForVisionFeatures:", v9);

}

- (void)_purgeExpiredVisionFeaturesUsingTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AXCameraVisionEngine _mostRecentVisionFeatures](self, "_mostRecentVisionFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _mostRecentVisionFeaturesUpdateTimes](self, "_mostRecentVisionFeaturesUpdateTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "integerValue");
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        -[AXCameraVisionEngine _expirationTimeForFeatureType:](self, "_expirationTimeForFeatureType:", v13);
        if (a3 - v16 >= v17)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v12);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (double)_expirationTimeForFeatureType:(unint64_t)a3
{
  return 4.0;
}

- (void)_createAccessibilityElementCandidatesForVisionFeatures:(id)a3 evaluatedFeatureTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  AXCameraAccessibilityElement *v52;
  AXCameraAccessibilityElement *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id obj;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXCameraVisionEngine lastDeviceMotion](self, "lastDeviceMotion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attitude");
    v10 = objc_claimAutoreleasedReturnValue();

    -[AXCameraVisionEngine lastCameraFrameContext](self, "lastCameraFrameContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v7;
    v83 = (void *)v10;
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDFE778]);
      objc_msgSend(v11, "videoFieldOfView");
      v14 = v13;
      objc_msgSend(v11, "videoZoomFactor");
      v16 = v15;
      v17 = objc_msgSend(v11, "videoSourceWidth");
      v18 = objc_msgSend(v11, "videoSourceHeight");
      objc_msgSend(v11, "presentationTimestamp");
      v20 = v19;
      LODWORD(v19) = v14;
      LODWORD(v21) = v16;
      v94 = (void *)objc_msgSend(v12, "initWithVideoFieldOfView:zoomFactor:sourceWidth:sourceHeight:presentationTimestamp:attitude:", v17, v18, v10, v19, v21, v20);
    }
    else
    {
      v94 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCameraVisionEngine _accessibilityElementCandidates](self, "_accessibilityElementCandidates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v23;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v108 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          v29 = (void *)objc_opt_class();
          objc_msgSend(v28, "normalizedFrame");
          if ((objc_msgSend(v29, "_isContainedWithinScreenBoundsForNormalizedFrame:") & 1) == 0)
            objc_msgSend(v91, "addObject:", v28);
          -[AXCameraVisionEngine _applyMotionCorrectionToElement:updatedFrameContext:](self, "_applyMotionCorrectionToElement:updatedFrameContext:", v28, v94);
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
      }
      while (v25);
    }
    v82 = v11;

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v30 = v89;
    v7 = v90;
    v85 = objc_msgSend(&unk_24FEF05E0, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
    if (v85)
    {
      v84 = *(_QWORD *)v104;
      v87 = *MEMORY[0x24BDF7430];
      v88 = v6;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v104 != v84)
            objc_enumerationMutation(&unk_24FEF05E0);
          v86 = v31;
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v31));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v100;
            v93 = v32;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v100 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
                -[AXCameraVisionEngine _motionCorrectedNormalizedFrameForFeature:](self, "_motionCorrectedNormalizedFrameForFeature:", v37);
                v39 = v38;
                v41 = v40;
                v43 = v42;
                v45 = v44;
                if (!-[AXCameraVisionEngine _updateAccessibilityElements:forIncomingFeature:correctedFrame:evaluatedFeatureTypes:](self, "_updateAccessibilityElements:forIncomingFeature:correctedFrame:evaluatedFeatureTypes:", v30, v37, v7)&& -[AXCameraVisionEngine _canCreateAccessibilityElementForFeature:correctedFrame:allFeatures:](self, "_canCreateAccessibilityElementForFeature:correctedFrame:allFeatures:", v37, v6, v39, v41, v43, v45))
                {
                  v97 = 0u;
                  v98 = 0u;
                  v95 = 0u;
                  v96 = 0u;
                  v46 = obj;
                  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
                  if (v47)
                  {
                    v48 = v47;
                    v49 = *(_QWORD *)v96;
LABEL_28:
                    v50 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v96 != v49)
                        objc_enumerationMutation(v46);
                      v51 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v50);
                      if (-[AXCameraVisionEngine _shouldReuseExistingElement:forFeature:correctedFrame:](self, "_shouldReuseExistingElement:forFeature:correctedFrame:", v51, v37, v39, v41, v43, v45))
                      {
                        break;
                      }
                      if (v48 == ++v50)
                      {
                        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
                        if (v48)
                          goto LABEL_28;
                        goto LABEL_34;
                      }
                    }
                    v52 = v51;

                    if (!v52)
                      goto LABEL_37;
                    objc_msgSend(v46, "removeObject:", v52);
                    -[AXCameraAccessibilityElement setDidReuse:](v52, "setDidReuse:", 1);
                  }
                  else
                  {
LABEL_34:

LABEL_37:
                    v53 = [AXCameraAccessibilityElement alloc];
                    -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = -[AXCameraAccessibilityElement initWithAccessibilityContainer:](v53, "initWithAccessibilityContainer:", v54);

                  }
                  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "bounds");
                  -[AXCameraVisionEngine _sceneObjectFrameForNormalizedFrame:inSceneFrame:](self, "_sceneObjectFrameForNormalizedFrame:inSceneFrame:", v39, v41, v43, v45, v56, v57, v58, v59);
                  v61 = v60;
                  v63 = v62;
                  v65 = v64;
                  v67 = v66;

                  v68 = objc_msgSend(MEMORY[0x24BDFE800], "locationForNormalizedFrame:previousLocation:usingThirds:", -[AXCameraAccessibilityElement location](v52, "location"), -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v39, v41, v43, v45);
                  -[AXCameraAccessibilityElement setFeatureType:](v52, "setFeatureType:", objc_msgSend(v37, "featureType"));
                  -[AXCameraAccessibilityElement setNormalizedFrame:](v52, "setNormalizedFrame:", v39, v41, v43, v45);
                  -[AXCameraAccessibilityElement setLocation:](v52, "setLocation:", v68);
                  objc_msgSend(v37, "confidence");
                  -[AXCameraAccessibilityElement setConfidence:](v52, "setConfidence:");
                  -[AXCameraAccessibilityElement setAccessibilityTraits:](v52, "setAccessibilityTraits:", v87 | -[AXCameraAccessibilityElement accessibilityTraits](v52, "accessibilityTraits"));
                  -[AXCameraAccessibilityElement setAccessibilityFrameInContainerSpace:](v52, "setAccessibilityFrameInContainerSpace:", v61, v63, v65, v67);
                  objc_msgSend(v37, "classificationLocalizedValue");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXCameraAccessibilityElement setClassificationLocalizedValue:](v52, "setClassificationLocalizedValue:", v69);

                  objc_msgSend(v37, "classificationLabel");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXCameraAccessibilityElement setClassificationLabel:](v52, "setClassificationLabel:", v70);

                  -[AXCameraAccessibilityElement setCameraFrameContext:](v52, "setCameraFrameContext:", v94);
                  if ((objc_msgSend(v91, "containsObject:", v52) & 1) != 0)
                  {
                    v71 = 0;
                  }
                  else
                  {
                    v72 = (void *)objc_opt_class();
                    -[AXCameraAccessibilityElement normalizedFrame](v52, "normalizedFrame");
                    v71 = objc_msgSend(v72, "_isContainedWithinScreenBoundsForNormalizedFrame:") ^ 1;
                  }
                  -[AXCameraAccessibilityElement setDidCrossEdge:](v52, "setDidCrossEdge:", v71);
                  -[AXCameraAccessibilityElement faceName](v52, "faceName");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v73, "length"))
                  {
LABEL_44:

                  }
                  else
                  {
                    objc_msgSend(v37, "faceDetectionResult");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "name");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v75, "length");

                    if (v76)
                    {
                      objc_msgSend(v37, "faceDetectionResult");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "name");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      -[AXCameraAccessibilityElement setFaceName:](v52, "setFaceName:", v77);

                      goto LABEL_44;
                    }
                  }
                  if (!-[AXCameraAccessibilityElement faceID](v52, "faceID") && objc_msgSend(v37, "faceId"))
                    -[AXCameraAccessibilityElement setFaceID:](v52, "setFaceID:", objc_msgSend(v37, "faceId"));
                  objc_msgSend(v37, "faceDetectionResult");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "attributes");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();

                  v6 = v88;
                  if (v79)
                  {
                    objc_msgSend(v37, "faceDetectionResult");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "attributes");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AXCameraAccessibilityElement setFaceAttributes:](v52, "setFaceAttributes:", v81);

                  }
                  v30 = v89;
                  objc_msgSend(v89, "addObject:", v52);

                  v7 = v90;
                  v32 = v93;
                  continue;
                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
            }
            while (v34);
          }

          v31 = v86 + 1;
        }
        while (v86 + 1 != v85);
        v85 = objc_msgSend(&unk_24FEF05E0, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      }
      while (v85);
    }
    -[AXCameraVisionEngine set_accessibilityElementCandidates:](self, "set_accessibilityElementCandidates:", v30);

  }
}

- (BOOL)_canCreateAccessibilityElementForFeature:(id)a3 correctedFrame:(CGRect)a4 allFeatures:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (CGRectGetMinX(v15) < -1.0)
    goto LABEL_5;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (CGRectGetMaxX(v16) > 2.0)
    goto LABEL_5;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (CGRectGetMinY(v17) < -1.0)
    goto LABEL_5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (CGRectGetMaxY(v18) > 2.0)
    goto LABEL_5;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v12 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = CGRectGetHeight(v20);
  if (objc_msgSend(v10, "isPerson"))
  {
    LOBYTE(self) = -[AXCameraVisionEngine cameraDevicePosition](self, "cameraDevicePosition") != 1;
    goto LABEL_6;
  }
  v14 = v12 * v13;
  if (objc_msgSend(v10, "isProminentObject"))
  {
LABEL_12:
    LOBYTE(self) = v14 >= 0.005;
    goto LABEL_6;
  }
  if ((objc_msgSend(v10, "isSceneClassification") & 1) == 0)
  {
    if (!objc_msgSend(v10, "isObjectClassification"))
    {
      LODWORD(self) = objc_msgSend(v10, "isFace") ^ 1;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_5:
  LOBYTE(self) = 0;
LABEL_6:

  return (char)self;
}

- (BOOL)_updateAccessibilityElements:(id)a3 forIncomingFeature:(id)a4 correctedFrame:(CGRect)a5 evaluatedFeatureTypes:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v55;
  double v56;
  double v57;
  double v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  if (objc_msgSend(v9, "isFace") && !objc_msgSend(v10, "containsObject:", &unk_24FEF0508))
  {
    v39 = 1;
  }
  else
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v61;
      v55 = 1.3;
LABEL_5:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v15);
        v17 = objc_msgSend(v9, "featureType", *(_QWORD *)&v55);
        if (v17 != objc_msgSend(v16, "featureType"))
        {
          objc_msgSend(v16, "normalizedFrame");
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v73.origin.x = v18;
          v73.origin.y = v20;
          v73.size.width = v22;
          v73.size.height = v24;
          v66 = CGRectIntersection(a5, v73);
          x = v66.origin.x;
          y = v66.origin.y;
          width = v66.size.width;
          height = v66.size.height;
          if (!CGRectIsNull(v66))
          {
            if (objc_msgSend(v16, "isPerson")
              && ((objc_msgSend(v9, "isFace") & 1) != 0 || objc_msgSend(v9, "isRealtimeFace")))
            {
              v67.origin.x = x;
              v67.origin.y = y;
              v67.size.width = width;
              v67.size.height = height;
              v30 = CGRectGetWidth(v67);
              v68.origin.x = x;
              v68.origin.y = y;
              v68.size.width = width;
              v68.size.height = height;
              v31 = v30 * CGRectGetHeight(v68);
              v32 = CGRectGetWidth(a5);
              if (v31 >= v32 * CGRectGetHeight(a5) * 0.2)
              {
                objc_msgSend(v16, "faceName");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v40, "length"))
                {
LABEL_33:

                }
                else
                {
                  objc_msgSend(v9, "faceDetectionResult");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "name");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "length");

                  if (v43)
                  {
                    objc_msgSend(v9, "faceDetectionResult");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "name");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "setFaceName:", v44);

                    goto LABEL_33;
                  }
                }
                if (!objc_msgSend(v16, "faceID") && objc_msgSend(v9, "faceId"))
                  objc_msgSend(v16, "setFaceID:", objc_msgSend(v9, "faceId"));
                goto LABEL_42;
              }
            }
            else if (objc_msgSend(v16, "featureType") == 6 && objc_msgSend(v9, "isFace"))
            {
              v69.origin.x = v19;
              v69.origin.y = v21;
              v69.size.width = v23;
              v69.size.height = v25;
              v57 = CGRectGetWidth(v69);
              v70.origin.x = v19;
              v70.origin.y = v21;
              v70.size.width = v23;
              v70.size.height = v25;
              v58 = v57 * CGRectGetHeight(v70);
              v56 = CGRectGetWidth(a5);
              v33 = v56 * CGRectGetHeight(a5);
              v71.origin.x = x;
              v71.origin.y = y;
              v71.size.width = width;
              v71.size.height = height;
              v34 = CGRectGetWidth(v71);
              v72.origin.x = x;
              v72.origin.y = y;
              v72.size.width = width;
              v72.size.height = height;
              v35 = CGRectGetHeight(v72);
              if (v33 == 0.0)
              {
                v36 = v58;
                if (v58 == 0.0)
                  goto LABEL_22;
              }
              else
              {
                v36 = v58;
                if (v58 / v33 > 0.7 && v58 / v33 < v55)
                {
LABEL_22:
                  v37 = v34 * v35;
                  if (v37 >= v36 * 0.65 && v37 >= v33 * 0.65)
                  {
                    objc_msgSend(v16, "faceName");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v45, "length"))
                    {
LABEL_41:

                    }
                    else
                    {
                      objc_msgSend(v9, "faceDetectionResult");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "name");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = objc_msgSend(v47, "length");

                      if (v48)
                      {
                        objc_msgSend(v9, "faceDetectionResult");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v45, "name");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "setFaceName:", v49);

                        goto LABEL_41;
                      }
                    }
LABEL_42:
                    objc_msgSend(v9, "faceDetectionResult");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "attributes");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v51)
                    {
                      objc_msgSend(v9, "faceDetectionResult");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "attributes");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "setFaceAttributes:", v53);

                    }
                    v39 = 1;
                    goto LABEL_45;
                  }
                }
              }
            }
          }
        }
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v13)
            goto LABEL_5;
          break;
        }
      }
    }
    v39 = 0;
LABEL_45:

  }
  return v39;
}

- (BOOL)_shouldReuseExistingElement:(id)a3 forFeature:(id)a4 correctedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v11, "featureType");
  if (v12 != objc_msgSend(v10, "featureType"))
    goto LABEL_6;
  if (objc_msgSend(v10, "faceID"))
  {
    v13 = objc_msgSend(v10, "faceID");
    if (v13 == objc_msgSend(v11, "faceId"))
    {
      v14 = 1;
      goto LABEL_7;
    }
  }
  objc_msgSend(v10, "normalizedFrame");
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v35 = CGRectIntersection(v34, v42);
  v15 = v35.origin.x;
  v16 = v35.origin.y;
  v17 = v35.size.width;
  v18 = v35.size.height;
  if (CGRectIsNull(v35))
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = v15;
  objc_msgSend(v10, "normalizedFrame");
  v20 = v36.origin.x;
  v21 = v36.origin.y;
  v22 = v36.size.width;
  v23 = v36.size.height;
  v33 = CGRectGetWidth(v36);
  v37.origin.x = v20;
  v37.origin.y = v21;
  v37.size.width = v22;
  v37.size.height = v23;
  v24 = v33 * CGRectGetHeight(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v25 = CGRectGetWidth(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v26 = v25 * CGRectGetHeight(v39);
  if (v26 == 0.0)
  {
    if (v24 != 0.0)
      goto LABEL_6;
    goto LABEL_13;
  }
  v14 = 0;
  if (v24 / v26 > 0.7 && v24 / v26 < 1.3)
  {
LABEL_13:
    v40.origin.x = v32;
    v40.origin.y = v31;
    v40.size.width = v30;
    v40.size.height = v29;
    v27 = CGRectGetWidth(v40);
    v41.origin.x = v32;
    v41.origin.y = v31;
    v41.size.width = v30;
    v41.size.height = v29;
    v28 = v27 * CGRectGetHeight(v41);
    v14 = v28 >= v26 * 0.65 && v28 >= v24 * 0.65;
  }
LABEL_7:

  return v14;
}

- (void)_generateAnnouncementsForVisionFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    v8 = 0;
    -[AXCameraVisionEngine _sceneDescriptionAnnouncementForVisionFeatures:previousAnnouncementLocation:locationForAnnouncement:announcementType:](self, "_sceneDescriptionAnnouncementForVisionFeatures:previousAnnouncementLocation:locationForAnnouncement:announcementType:", v4, -[AXCameraVisionEngine lastSceneAnnouncementLocation](self, "lastSceneAnnouncementLocation"), &v8, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCameraVisionEngine _attemptSceneDescriptionAnnouncement:locationForAnnouncement:type:](self, "_attemptSceneDescriptionAnnouncement:locationForAnnouncement:type:", v6, v8, v7);

  }
}

- (id)_sceneDescriptionAnnouncementForVisionFeatures:(id)a3 previousAnnouncementLocation:(int64_t)a4 locationForAnnouncement:(int64_t *)a5 announcementType:(int64_t *)a6
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  int64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  int64_t *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  int64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t m;
  void *v96;
  int64_t *v97;
  int64_t *v98;
  void *v99;
  void *v100;
  void *v102;
  void *v103;
  int64_t *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  id v126;
  id v127;
  id v128;
  _BYTE v129[128];
  _BYTE v130[128];
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _QWORD v134[4];

  v134[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_24FEF0568);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _accessibilityElementCandidates](self, "_accessibilityElementCandidates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0;
  v128 = 0;
  v125 = 0;
  v126 = 0;
  -[AXCameraVisionEngine _sortedAndFilteredAccessibilityElements:faces:persons:prominentObjects:objectClassifications:](self, "_sortedAndFilteredAccessibilityElements:faces:persons:prominentObjects:objectClassifications:", v10, &v128, &v127, &v126, &v125);
  v11 = v128;
  v12 = v127;
  v105 = v126;
  v107 = v125;

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v108, "count");
  v14 = objc_msgSend(v12, "count");
  v15 = objc_msgSend(v11, "count");
  v16 = (void *)MEMORY[0x24BDD17C8];
  if (!v15 || v14)
  {
    accessibilityCameraUILocalizedString(CFSTR("people.count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v17, v13);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("face.count"), &stru_24FEE0E80, CFSTR("Accessibility"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v18, v13);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v103 = v11;
  v104 = a5;
  v102 = v12;
  if (v13)
  {
    if (v13 == 1)
    {
      objc_msgSend(v108, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "faceName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(v19, "faceName");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = v106;
      }
      v45 = v21;

      if (objc_msgSend(v107, "count") == 1)
      {
        objc_msgSend(v107, "firstObject");
        v98 = a6;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "classificationLocalizedValue");
        v100 = v9;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v134[0] = v19;
        v134[1] = v46;
        v26 = 2;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 2);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[AXCameraVisionEngine _normalizedFrameForAccessibilityElements:](self, "_normalizedFrameForAccessibilityElements:", v25);
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;
        v56 = (void *)MEMORY[0x24BDD17C8];
        accessibilityCameraUILocalizedString(CFSTR("subjects.first.and.second"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringWithFormat:", v57, v45, v47);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(MEMORY[0x24BDFE800], "locationForNormalizedFrame:previousLocation:usingThirds:", a4, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v49, v51, v53, v55);
        v9 = v100;

        a6 = v98;
      }
      else
      {
        v23 = v45;
        v24 = objc_msgSend(v19, "location");
        v25 = v108;
        v26 = 1;
      }

      goto LABEL_57;
    }
    v97 = a6;
    v99 = v9;
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v28 = v108;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v122 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
          objc_msgSend(v33, "faceName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "length");

          if (v35)
          {
            objc_msgSend(v33, "faceName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v36);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
      }
      while (v30);
    }

    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sortedArrayUsingComparator:", &__block_literal_global_6);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v39 = v27;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v132, 16);
      if (v40)
      {
        v41 = v40;
        v42 = 0;
        v43 = *(_QWORD *)v118;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v118 != v43)
              objc_enumerationMutation(v39);
            v42 += objc_msgSend(v39, "countForObject:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * j));
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v132, 16);
        }
        while (v41);
      }
      else
      {
        v42 = 0;
      }

      v73 = v13 - v42;
      if (v13 - v42 >= 1)
      {
        v74 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("people.count"), &stru_24FEE0E80, CFSTR("Accessibility"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "localizedStringWithFormat:", v76, v73);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "arrayByAddingObject:", v77);
        v78 = objc_claimAutoreleasedReturnValue();

        v38 = (void *)v78;
      }
      v72 = a4;
      v79 = objc_msgSend(v38, "count");
      if (v79 == 2)
      {
        v81 = (void *)MEMORY[0x24BDD17C8];
        accessibilityCameraUILocalizedString(CFSTR("subjects.first.and.second"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringWithFormat:", v82, v83, v84);
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v79 == 1)
        {
          objc_msgSend(v38, "firstObject");
          v80 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = v106;
        }
        v23 = v80;
      }
      a6 = v97;
      v9 = v99;

    }
    else
    {
      v23 = v106;
      a6 = v97;
      v9 = v99;
      v72 = a4;
    }
    -[AXCameraVisionEngine _normalizedFrameForAccessibilityElements:](self, "_normalizedFrameForAccessibilityElements:", v28);
    v24 = objc_msgSend(MEMORY[0x24BDFE800], "locationForNormalizedFrame:previousLocation:usingThirds:", v72, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v85, v86, v87, v88);
    v25 = v28;

LABEL_56:
    v26 = 1;
    goto LABEL_57;
  }
  if (objc_msgSend(v105, "count"))
  {
    objc_msgSend(v105, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityCameraUILocalizedString(CFSTR("prominent.object"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "location");
    v131 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v26 = 3;
    goto LABEL_57;
  }
  if (!objc_msgSend(v107, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDFE7A0], "builderWithOptions:", 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addDetectedClassificationFeatures:", v9);
      objc_msgSend(v96, "buildSpeakableDescription");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v24 = 0;
      v26 = 5;
      goto LABEL_57;
    }
    v23 = v106;
    v25 = 0;
    v24 = 0;
    goto LABEL_56;
  }
  v58 = a6;
  objc_msgSend(MEMORY[0x24BDFE7A0], "builderWithOptions:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v60 = v107;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v114;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v114 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
        objc_msgSend(v65, "classificationLocalizedValue");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "classificationLabel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addDetectedClassificationLocalizedValue:forLabel:", v66, v67);

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
    }
    while (v62);
  }

  if ((unint64_t)objc_msgSend(v60, "count") > 2)
  {
    v24 = 0;
  }
  else
  {
    -[AXCameraVisionEngine _normalizedFrameForAccessibilityElements:](self, "_normalizedFrameForAccessibilityElements:", v60);
    v24 = objc_msgSend(MEMORY[0x24BDFE800], "locationForNormalizedFrame:previousLocation:usingThirds:", a4, -[AXCameraVisionEngine useThirdsForLocation](self, "useThirdsForLocation"), v68, v69, v70, v71);
  }
  a6 = v58;
  objc_msgSend(v59, "buildSpeakableDescription");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v60;

  v26 = 4;
LABEL_57:
  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setAccessibilityElements:", v25);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v90 = v25;
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v110;
    while (2)
    {
      for (m = 0; m != v92; ++m)
      {
        if (*(_QWORD *)v110 != v93)
          objc_enumerationMutation(v90);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * m), "didCrossEdge"))
        {
          -[AXCameraVisionEngine _performScreenEdgeHaptic](self, "_performScreenEdgeHaptic");
          goto LABEL_67;
        }
      }
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
      if (v92)
        continue;
      break;
    }
  }
LABEL_67:

  if (v104)
    *v104 = v24;
  if (a6)
    *a6 = v26;

  return v23;
}

uint64_t __141__AXCameraVisionEngine__sceneDescriptionAnnouncementForVisionFeatures_previousAnnouncementLocation_locationForAnnouncement_announcementType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_attemptSceneDescriptionAnnouncement:(id)a3 locationForAnnouncement:(int64_t)a4 type:(int64_t)a5
{
  double Current;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  int v16;
  double v17;
  int64_t v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int64_t v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  id v27;

  v27 = a3;
  -[AXCameraVisionEngine setPreviousSceneAnnouncementCandidateWithoutLocation:](self, "setPreviousSceneAnnouncementCandidateWithoutLocation:");
  Current = CFAbsoluteTimeGetCurrent();
  -[AXCameraVisionEngine lastSceneAnnouncementTime](self, "lastSceneAnnouncementTime");
  v10 = Current - v9;
  -[AXCameraVisionEngine lastSceneAnnouncementFullTime](self, "lastSceneAnnouncementFullTime");
  v12 = v11;
  -[AXCameraVisionEngine previousSceneAnnouncementCandidateWithoutLocationChangedTime](self, "previousSceneAnnouncementCandidateWithoutLocationChangedTime");
  if (Current - v13 >= 1.5 || v10 >= 4.5)
  {
    -[AXCameraVisionEngine lastSceneAnnouncementWithoutLocation](self, "lastSceneAnnouncementWithoutLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v27, "isEqualToString:", v15);

    if (v16)
    {
      v17 = Current - v12;
      v18 = -[AXCameraVisionEngine lastSceneAnnouncementLocation](self, "lastSceneAnnouncementLocation");
      v19 = 30.0;
      if (v18 == a4)
      {
        if (v17 >= 30.0)
          goto LABEL_14;
LABEL_10:
        v20 = 0;
        v21 = 0;
        goto LABEL_15;
      }
      if (v17 < 30.0)
      {
        v19 = 2.0;
        if (v10 >= 2.0)
        {
          v22 = -[AXCameraVisionEngine lastAnnouncementType](self, "lastAnnouncementType");
          v21 = v22 == a5;
          v20 = v22 != a5;
          goto LABEL_15;
        }
        goto LABEL_10;
      }
    }
    else
    {
      v19 = 4.0;
      if (v10 < 4.0)
        goto LABEL_10;
    }
LABEL_14:
    v21 = 0;
    v20 = 1;
LABEL_15:
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDFE800], "localizedStringForLocation:isSubjectImplicit:", a4, 0, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v23, v27);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x24BDFE800], "localizedStringForLocation:isSubjectImplicit:", a4, 1);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else
    {
      v24 = v27;
      if (v21)
        goto LABEL_17;
    }
    v25 = v24;
    if (!v20)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_20:
    v26 = objc_msgSend(v25, "isEqualToString:", v24);
    if (-[AXCameraVisionEngine _attemptAnnouncement:type:isPartial:timestamp:](self, "_attemptAnnouncement:type:isPartial:timestamp:", v25, a5, v26 ^ 1u, Current))
    {
      -[AXCameraVisionEngine setLastSceneAnnouncement:](self, "setLastSceneAnnouncement:", v25);
      -[AXCameraVisionEngine setLastSceneAnnouncementFull:](self, "setLastSceneAnnouncementFull:", v24);
      -[AXCameraVisionEngine setLastSceneAnnouncementWithoutLocation:](self, "setLastSceneAnnouncementWithoutLocation:", v27);
      -[AXCameraVisionEngine setLastSceneAnnouncementLocation:](self, "setLastSceneAnnouncementLocation:", a4);
      -[AXCameraVisionEngine setLastSceneAnnouncementTime:](self, "setLastSceneAnnouncementTime:", Current);
      if (v26)
        -[AXCameraVisionEngine setLastSceneAnnouncementFullTime:](self, "setLastSceneAnnouncementFullTime:", Current);
    }
    goto LABEL_23;
  }
LABEL_24:

}

- (BOOL)_attemptAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6
{
  _BOOL8 v7;
  id v10;
  BOOL v11;

  v7 = a5;
  v10 = a3;
  if (v10
    && -[AXCameraVisionEngine _canPostAnnouncement:type:isPartial:timestamp:](self, "_canPostAnnouncement:type:isPartial:timestamp:", v10, a4, v7, a6))
  {
    -[AXCameraVisionEngine setInflightAnnouncement:](self, "setInflightAnnouncement:", v10);
    -[AXCameraVisionEngine setLastAnnouncement:](self, "setLastAnnouncement:", v10);
    -[AXCameraVisionEngine setLastAnnouncementType:](self, "setLastAnnouncementType:", a4);
    -[AXCameraVisionEngine setLastAnnouncementPartial:](self, "setLastAnnouncementPartial:", v7);
    -[AXCameraVisionEngine setLastAnnouncementTime:](self, "setLastAnnouncementTime:", a6);
    UIAccessibilitySpeakIfNotSpeaking();
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_canPostAnnouncement:(id)a3 type:(int64_t)a4 isPartial:(BOOL)a5 timestamp:(double)a6
{
  void *v9;
  double v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  BOOL v14;

  -[AXCameraVisionEngine inflightAnnouncement](self, "inflightAnnouncement", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (-[AXCameraVisionEngine lastAnnouncementTime](self, "lastAnnouncementTime"), a6 - v10 > 7.0))
  {
LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  v11 = -[AXCameraVisionEngine lastAnnouncementType](self, "lastAnnouncementType");
  v12 = -[AXCameraVisionEngine _priorityForAnnouncementType:](self, "_priorityForAnnouncementType:", a4);
  v13 = -[AXCameraVisionEngine _priorityForAnnouncementType:](self, "_priorityForAnnouncementType:", v11);
  if (v12 >= v13)
  {
    if (v12 <= v13)
    {
      v14 = -[AXCameraVisionEngine isLastAnnouncementPartial](self, "isLastAnnouncementPartial");
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)_handleAnnouncementDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AXCameraVisionEngine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__AXCameraVisionEngine__handleAnnouncementDidFinish___block_invoke;
  v6[3] = &unk_24FEE0298;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AXCameraVisionEngine _dispatchToResultsQueueWithBlock:](self, "_dispatchToResultsQueueWithBlock:", v6);

}

void __53__AXCameraVisionEngine__handleAnnouncementDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF71D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "inflightAnnouncement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isEqualToString:", v3);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setInflightAnnouncement:", 0);

}

- (int64_t)_priorityForAnnouncementType:(int64_t)a3
{
  return 0;
}

- (CGRect)_normalizedFrameForAccessibilityElements:(id)a3
{
  id v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  v3 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = &unk_230B5980A;
  v4 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v18 = *MEMORY[0x24BDBF090];
  v19 = v4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__AXCameraVisionEngine__normalizedFrameForAccessibilityElements___block_invoke;
  v13[3] = &unk_24FEE0328;
  v13[4] = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);
  v5 = v15[4];
  v6 = v15[5];
  v7 = v15[6];
  v8 = v15[7];
  _Block_object_dispose(&v14, 8);

  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

void __65__AXCameraVisionEngine__normalizedFrameForAccessibilityElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  CGRect *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v10;
  CGRect v11;

  if (a3)
  {
    v4 = a1 + 32;
    v5 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(a2, "normalizedFrame");
    v11.origin.x = v6;
    v11.origin.y = v7;
    v11.size.width = v8;
    v11.size.height = v9;
    v10 = CGRectUnion(v5[1], v11);
  }
  else
  {
    objc_msgSend(a2, "normalizedFrame");
    v4 = a1 + 32;
  }
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 32) = v10;
}

- (void)_sortedAndFilteredAccessibilityElements:(id)a3 faces:(id *)a4 persons:(id *)a5 prominentObjects:(id *)a6 objectClassifications:(id *)a7
{
  id v11;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;

  v11 = a3;
  objc_msgSend(v11, "axFilterObjectsUsingBlock:", &__block_literal_global_263);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axFilterObjectsUsingBlock:", &__block_literal_global_264);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axFilterObjectsUsingBlock:", &__block_literal_global_265);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axFilterObjectsUsingBlock:", &__block_literal_global_266);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_268);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_269);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_270);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_271);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v16, v20, 0.110889);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeWidthThreshold:referenceElement:](self, "_filterElements:usingRelativeWidthThreshold:referenceElement:", v17, v22, 0.333);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v18, v24, 0.110889);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v19, v26, 0.110889);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v23, v28, 0.665334);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v21, v30, 0.0184815);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v31, v32, 0.0833333333);
  v39 = (id)objc_claimAutoreleasedReturnValue();

  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v29, v32, 0.5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v27, v34, 0.25);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _filterElements:usingRelativeAreaThreshold:referenceElement:](self, "_filterElements:usingRelativeAreaThreshold:referenceElement:", v35, v36, 0.0416666667);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v39);
  if (a5)
    *a5 = objc_retainAutorelease(v33);
  if (a6)
    *a6 = objc_retainAutorelease(v25);
  if (a7)
    *a7 = objc_retainAutorelease(v37);

}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFace");
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPerson");
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isProminentObject");
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isObjectClassification");
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  uint64_t v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "normalizedFrame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v10 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v4, "numberWithDouble:", v10 * CGRectGetHeight(v26));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "normalizedFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v21 = CGRectGetWidth(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  objc_msgSend(v12, "numberWithDouble:", v21 * CGRectGetHeight(v28));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v11, "compare:", v22);

  return v23;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  CGRect v19;
  CGRect v20;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "normalizedFrame");
  objc_msgSend(v4, "numberWithDouble:", CGRectGetWidth(v19));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "normalizedFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  objc_msgSend(v7, "numberWithDouble:", CGRectGetWidth(v20));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "compare:", v16);

  return v17;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  uint64_t v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "normalizedFrame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v10 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v4, "numberWithDouble:", v10 * CGRectGetHeight(v26));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "normalizedFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v21 = CGRectGetWidth(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  objc_msgSend(v12, "numberWithDouble:", v21 * CGRectGetHeight(v28));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v11, "compare:", v22);

  return v23;
}

uint64_t __117__AXCameraVisionEngine__sortedAndFilteredAccessibilityElements_faces_persons_prominentObjects_objectClassifications___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  uint64_t v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "normalizedFrame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v10 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v4, "numberWithDouble:", v10 * CGRectGetHeight(v26));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "normalizedFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v21 = CGRectGetWidth(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  objc_msgSend(v12, "numberWithDouble:", v21 * CGRectGetHeight(v28));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v11, "compare:", v22);

  return v23;
}

- (id)_filterElements:(id)a3 usingRelativeAreaThreshold:(double)a4 referenceElement:(id)a5
{
  id v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  CGFloat v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  CGRect v19;
  CGRect v20;

  v7 = a3;
  v8 = v7;
  if (a5)
  {
    objc_msgSend(a5, "normalizedFrame");
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
    v13 = CGRectGetWidth(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v14 = CGRectGetHeight(v20);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __84__AXCameraVisionEngine__filterElements_usingRelativeAreaThreshold_referenceElement___block_invoke;
    v18[3] = &__block_descriptor_48_e45_B32__0__AXCameraAccessibilityElement_8Q16_B24l;
    *(double *)&v18[4] = a4;
    *(double *)&v18[5] = v13 * v14;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v7;
  }

  return v16;
}

BOOL __84__AXCameraVisionEngine__filterElements_usingRelativeAreaThreshold_referenceElement___block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  CGRect v9;
  CGRect v10;

  objc_msgSend(a2, "normalizedFrame");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  v7 = CGRectGetWidth(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return v7 * CGRectGetHeight(v10) >= *(double *)(a1 + 32) * *(double *)(a1 + 40);
}

- (id)_filterElements:(id)a3 usingRelativeWidthThreshold:(double)a4 referenceElement:(id)a5
{
  id v7;
  void *v8;
  CGFloat Width;
  void *v10;
  id v11;
  _QWORD v13[6];
  CGRect v14;

  v7 = a3;
  v8 = v7;
  if (a5)
  {
    objc_msgSend(a5, "normalizedFrame");
    Width = CGRectGetWidth(v14);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __85__AXCameraVisionEngine__filterElements_usingRelativeWidthThreshold_referenceElement___block_invoke;
    v13[3] = &__block_descriptor_48_e45_B32__0__AXCameraAccessibilityElement_8Q16_B24l;
    *(double *)&v13[4] = a4;
    *(CGFloat *)&v13[5] = Width;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

BOOL __85__AXCameraVisionEngine__filterElements_usingRelativeWidthThreshold_referenceElement___block_invoke(uint64_t a1, void *a2)
{
  CGRect v4;

  objc_msgSend(a2, "normalizedFrame");
  return CGRectGetWidth(v4) >= *(double *)(a1 + 32) * *(double *)(a1 + 40);
}

- (void)setPreviousSceneAnnouncementCandidateWithoutLocation:(id)a3
{
  NSString *v4;
  NSString *previousSceneAnnouncementCandidateWithoutLocation;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  previousSceneAnnouncementCandidateWithoutLocation = self->_previousSceneAnnouncementCandidateWithoutLocation;
  if (previousSceneAnnouncementCandidateWithoutLocation != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](previousSceneAnnouncementCandidateWithoutLocation, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_previousSceneAnnouncementCandidateWithoutLocation;
      self->_previousSceneAnnouncementCandidateWithoutLocation = v7;

      -[AXCameraVisionEngine setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:](self, "setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:", CFAbsoluteTimeGetCurrent());
      v4 = v9;
    }
  }

}

- (CGRect)_sceneObjectFrameForNormalizedFrame:(CGRect)a3 inSceneFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform v16[2];
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation");
  AXMNormalizedFrameTransform();
  memset(v16, 0, sizeof(v16));
  v12 = (void *)objc_opt_class();
  if (v12)
    objc_msgSend(v12, "_scaleNormalizedCoordinatesToSceneCoordinates:", x, y, width, height);
  else
    memset(v16, 0, 48);
  t1 = v16[1];
  memset(&v15, 0, sizeof(v15));
  v13 = v16[0];
  CGAffineTransformConcat(&v15, &t1, &v13);
  t1 = v15;
  v17.origin.x = v11;
  v17.origin.y = v10;
  v17.size.width = v9;
  v17.size.height = v8;
  return CGRectApplyAffineTransform(v17, &t1);
}

+ (CGAffineTransform)_scaleNormalizedCoordinatesToSceneCoordinates:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = CGRectGetWidth(a4);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v10 = CGRectGetHeight(v12);
  return CGAffineTransformMakeScale(retstr, v9, v10);
}

+ (BOOL)_isContainedWithinScreenBoundsForNormalizedFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectGetMinX(a3) < 0.0)
    return 0;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  if (CGRectGetMaxX(v8) > 1.0)
    return 0;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  if (CGRectGetMinY(v9) < 0.0)
    return 0;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return CGRectGetMaxY(v10) <= 1.0;
}

- (void)_applyMotionCorrectionToElement:(id)a3 updatedFrameContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "cameraFrameContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAttitude");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    objc_msgSend(v10, "normalizedFrame");
    -[AXCameraVisionEngine _motionCorrectedNormalizedFrame:frameContext:targetAttitude:](self, "_motionCorrectedNormalizedFrame:frameContext:targetAttitude:", v7, v9);
    objc_msgSend(v10, "setNormalizedFrame:");
    objc_msgSend(v10, "setCameraFrameContext:", v6);
  }

}

- (CGRect)_motionCorrectedNormalizedFrameForFeature:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[AXCameraVisionEngine lastDeviceMotion](self, "lastDeviceMotion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attitude");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraVisionEngine _motionCorrectedNormalizedFrame:frameContext:targetAttitude:](self, "_motionCorrectedNormalizedFrame:frameContext:targetAttitude:", v5, v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_motionCorrectedNormalizedFrame:(CGRect)a3 frameContext:(id)a4 targetAttitude:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  int v13;
  int v14;
  int64_t v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 && a5)
  {
    v11 = a5;
    v12 = a4;
    objc_msgSend(v12, "videoZoomFactor");
    v14 = v13;
    v15 = -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation");
    v16 = -[AXCameraVisionEngine _isMirrored](self, "_isMirrored");
    LODWORD(v17) = v14;
    objc_msgSend(v12, "motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:", v11, v15, v16, x, y, width, height, v17);
    x = v18;
    y = v19;
    width = v20;
    height = v21;

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_handleDeviceMotion:(id)a3
{
  id v4;

  v4 = a3;
  -[AXCameraVisionEngine _updateLevelFeedbackForDeviceMotion:](self, "_updateLevelFeedbackForDeviceMotion:", v4);
  -[AXCameraVisionEngine setLastDeviceMotion:](self, "setLastDeviceMotion:", v4);

}

- (void)_updateLevelFeedbackForDeviceMotion:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[AXCameraVisionEngine lastLevelZone](self, "lastLevelZone");
  -[AXCameraVisionEngine _levelingMotionAnalyzer](self, "_levelingMotionAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "updateWithDeviceMotion:previousZone:", v4, v5);

  if (-[AXCameraVisionEngine shouldEmitLevelFeedback](self, "shouldEmitLevelFeedback") && v7)
  {
    if (!v5 || v7 == v5)
    {
      -[AXCameraVisionEngine setLastLevelZone:](self, "setLastLevelZone:", v7);
    }
    else
    {
      if (v7 == 1)
        -[AXCameraVisionEngine _performBecameLevelFeedback](self, "_performBecameLevelFeedback");
      else
        -[AXCameraVisionEngine _performBecameUnlevelFeedback](self, "_performBecameUnlevelFeedback");
      -[AXCameraVisionEngine setLastLevelZone:](self, "setLastLevelZone:", v7);
      -[AXCameraVisionEngine setLastLevelZoneChangedTime:](self, "setLastLevelZoneChangedTime:", CFAbsoluteTimeGetCurrent());
    }
    -[AXCameraVisionEngine _attemptLevelingAnnouncementForZone:previousZone:](self, "_attemptLevelingAnnouncementForZone:previousZone:", v7, v5);
  }
  else
  {
    -[AXCameraVisionEngine setLastLevelZone:](self, "setLastLevelZone:", v7);
    -[AXCameraVisionEngine setLastLevelZoneChangedTime:](self, "setLastLevelZoneChangedTime:", CFAbsoluteTimeGetCurrent());
  }
}

- (void)_attemptLevelingAnnouncementForZone:(int64_t)a3 previousZone:(int64_t)a4
{
  int64_t v6;
  BOOL v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  double v17;
  double v18;
  double Current;
  BOOL v20;
  id v21;

  -[AXCameraVisionEngine _announcementStringForFeedbackZone:](self, "_announcementStringForFeedbackZone:", a3, a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_25;
  v6 = -[AXCameraVisionEngine lastAnnouncementType](self, "lastAnnouncementType");
  v7 = -[AXCameraVisionEngine _isLevelingNeededForZone:](self, "_isLevelingNeededForZone:", a3);
  v8 = -[AXCameraVisionEngine _isLevelingNeededForZone:](self, "_isLevelingNeededForZone:", -[AXCameraVisionEngine lastLevelAnnouncementZone](self, "lastLevelAnnouncementZone"));
  if (!v7 && !v8)
    goto LABEL_25;
  if (v6 != 6)
  {
    if (v6)
    {
      -[AXCameraVisionEngine lastAnnouncementTime](self, "lastAnnouncementTime");
      v10 = v14;
      -[AXCameraVisionEngine lastLevelZoneChangedTime](self, "lastLevelZoneChangedTime");
      if (v10 < v15)
        v10 = v15;
      v11 = 2.0;
    }
    else
    {
      -[AXCameraVisionEngine lastAnnouncementTime](self, "lastAnnouncementTime");
      v10 = v9;
      v11 = 8.0;
    }
LABEL_17:
    v13 = 1.79769313e308;
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    v16 = -[AXCameraVisionEngine lastLevelAnnouncementZone](self, "lastLevelAnnouncementZone");
    -[AXCameraVisionEngine lastAnnouncementTime](self, "lastAnnouncementTime");
    v10 = v17;
    if (v16 == a3)
    {
      v11 = 10.0;
    }
    else
    {
      -[AXCameraVisionEngine lastLevelZoneChangedTime](self, "lastLevelZoneChangedTime");
      if (v10 < v18)
        v10 = v18;
      v11 = 3.0;
    }
    goto LABEL_17;
  }
  -[AXCameraVisionEngine lastLevelAnnouncementTime](self, "lastLevelAnnouncementTime");
  v10 = v12;
  v11 = 0.0;
  v13 = 5.0;
LABEL_18:
  Current = CFAbsoluteTimeGetCurrent();
  v20 = Current - v10 >= v11 && Current - v10 <= v13;
  if (v20
    && -[AXCameraVisionEngine _attemptAnnouncement:type:isPartial:timestamp:](self, "_attemptAnnouncement:type:isPartial:timestamp:", v21, 6, 0, Current))
  {
    -[AXCameraVisionEngine setLastLevelAnnouncementZone:](self, "setLastLevelAnnouncementZone:", a3);
    -[AXCameraVisionEngine setLastLevelAnnouncementTime:](self, "setLastLevelAnnouncementTime:", Current);
  }
LABEL_25:

}

- (BOOL)_isLevelingNeededForZone:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)_announcementStringForFeedbackZone:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  accessibilityCameraUILocalizedString(off_24FEE04F8[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)motionManagerDidUpdateDeviceMotion:(id)a3 captureOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  -[AXCameraVisionEngine sceneObjectElementContainerView](self, "sceneObjectElementContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__AXCameraVisionEngine_motionManagerDidUpdateDeviceMotion_captureOrientation___block_invoke;
    v8[3] = &unk_24FEE04B0;
    v8[4] = self;
    v10 = a4;
    v9 = v6;
    -[AXCameraVisionEngine _dispatchToResultsQueueWithBlock:](self, "_dispatchToResultsQueueWithBlock:", v8);

  }
}

void __78__AXCameraVisionEngine_motionManagerDidUpdateDeviceMotion_captureOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(*(id *)(a1 + 32), "setInterfaceOrientation:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleDeviceMotion:");
      objc_msgSend(*(id *)(a1 + 32), "_mostRecentVisionFeatures");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "count"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_accessibilityElementCandidates");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "count");

        if (!v4)
          return;
      }
      objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedVisionFeatures:evaluatedFeatureTypes:fromMotionUpdate:", 0, 0, 1);
    }
  }
}

- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  id v9;
  __CVBuffer *ImageBuffer;
  double Width;
  void *v12;
  void *v13;
  uint64_t v14;
  double Seconds;
  id v16;
  int v17;
  int v18;
  double v19;
  float v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  CMTime time;

  v8 = a3;
  v9 = a5;
  if (UIAccessibilityIsVoiceOverRunning() && -[AXCameraVisionEngine _queue_appActive](self, "_queue_appActive"))
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    Width = (double)CVPixelBufferGetWidth(ImageBuffer);
    -[AXCameraVisionEngine set_lastSampleBufferSize:](self, "set_lastSampleBufferSize:", Width, (double)CVPixelBufferGetHeight(ImageBuffer));
    -[AXCameraVisionEngine _analysisOptionsForIncomingFrame](self, "_analysisOptionsForIncomingFrame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasDetectionsEnabled"))
    {
      objc_msgSend(MEMORY[0x24BDFE770], "videoDeviceFromConnection:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(MEMORY[0x24BDFE770], "isMirroredVideoDevice:", v13);
      v26 = v13;
      objc_msgSend(v13, "activeFormat");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(MEMORY[0x24BDFE770], "videoDimensionsForDeviceFormat:");
      CMSampleBufferGetPresentationTimeStamp(&time, a4);
      Seconds = CMTimeGetSeconds(&time);
      v16 = objc_alloc(MEMORY[0x24BDFE778]);
      objc_msgSend(v27, "videoFieldOfView");
      v18 = v17;
      objc_msgSend(v13, "videoZoomFactor");
      v20 = v19;
      -[AXCameraVisionEngine lastDeviceMotion](self, "lastDeviceMotion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attitude");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = v18;
      *(float *)&v24 = v20;
      v25 = (void *)objc_msgSend(v16, "initWithVideoFieldOfView:zoomFactor:sourceWidth:sourceHeight:presentationTimestamp:attitude:", (int)v14, v14 >> 32, v22, v23, v24, Seconds);

      objc_msgSend(v8, "triggerWithSampleBuffer:interfaceOrientation:mirrored:options:userContext:", a4, -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation"), v28, v12, v25);
    }

  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__AXCameraVisionEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
  v16[3] = &unk_24FEE04D8;
  objc_copyWeak(&v19, &location);
  v14 = v11;
  v17 = v14;
  v15 = v13;
  v18 = v15;
  -[AXCameraVisionEngine _dispatchToResultsQueueWithBlock:](self, "_dispatchToResultsQueueWithBlock:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __101__AXCameraVisionEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleCameraMetadataObjects:fromConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleCameraMetadataObjects:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  double Seconds;
  id v28;
  int v29;
  int v30;
  double v31;
  float v32;
  AXCameraVisionEngine *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  CMTime time;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[AXCameraVisionEngine _lastSampleBufferSize](self, "_lastSampleBufferSize");
    v10 = v9;
    v11 = v8;
    if (v9 != *MEMORY[0x24BDBF148] || v8 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v13 = -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation");
      if (v13 >= 3)
        v14 = v11;
      else
        v14 = v10;
      if (v13 < 3)
        v10 = v11;
      objc_msgSend(MEMORY[0x24BDFE770], "videoDeviceFromConnection:", v7, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(MEMORY[0x24BDFE770], "isMirroredVideoDevice:", v15);
      v50 = v15;
      objc_msgSend(v15, "activeFormat");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(MEMORY[0x24BDFE770], "videoDimensionsForDeviceFormat:");
      v18 = -[AXCameraVisionEngine interfaceOrientation](self, "interfaceOrientation");
      if ((unint64_t)(v18 - 2) > 2)
        v19 = 3;
      else
        v19 = qword_230B57968[v18 - 2];
      v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v43 = v6;
      obj = v6;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v53;
        v45 = v17 >> 32;
        v46 = (int)v17;
        v47 = v20;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDFE800], "featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:", v25, v19, v16, v10, v14);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              if (v25)
                objc_msgSend(v25, "time");
              else
                memset(&time, 0, sizeof(time));
              Seconds = CMTimeGetSeconds(&time);
              v28 = objc_alloc(MEMORY[0x24BDFE778]);
              objc_msgSend(v49, "videoFieldOfView");
              v30 = v29;
              objc_msgSend(v50, "videoZoomFactor");
              v32 = v31;
              -[AXCameraVisionEngine lastDeviceMotion](self, "lastDeviceMotion");
              v33 = self;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "attitude");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v36) = v30;
              *(float *)&v37 = v32;
              v38 = (void *)objc_msgSend(v28, "initWithVideoFieldOfView:zoomFactor:sourceWidth:sourceHeight:presentationTimestamp:attitude:", v46, v45, v35, v36, v37, Seconds);

              objc_msgSend(v26, "setUserContext:", v38);
              v20 = v47;
              objc_msgSend(v47, "addObject:", v26);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v26, "featureType"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "addObject:", v39);

              self = v33;
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v22);
      }

      if (!objc_msgSend(obj, "count"))
      {
        objc_msgSend(v48, "addObject:", &unk_24FEF04F0);
        objc_msgSend(v48, "addObject:", &unk_24FEF0580);
      }
      v7 = v42;
      if (objc_msgSend(v48, "count"))
      {
        objc_msgSend(v20, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "userContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXCameraVisionEngine _handleVisionFeatures:evaluatedFeatureTypes:userContext:](self, "_handleVisionFeatures:evaluatedFeatureTypes:userContext:", v20, v48, v41);
      }

      v6 = v43;
    }
  }

}

- (AXMAVCaptureSessionNode)captureSessionNode
{
  return self->_captureSessionNode;
}

- (void)setCaptureSessionNode:(id)a3
{
  objc_storeStrong((id *)&self->_captureSessionNode, a3);
}

- (UIView)sceneObjectElementContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sceneObjectElementContainerView);
}

- (void)setSceneObjectElementContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_sceneObjectElementContainerView, a3);
}

- (BOOL)isAppActive
{
  return self->_appActive;
}

- (OS_dispatch_queue)axResultsQueue
{
  return self->_axResultsQueue;
}

- (AXMVisionEngine)visionEngine
{
  return self->_visionEngine;
}

- (void)setVisionEngine:(id)a3
{
  objc_storeStrong((id *)&self->_visionEngine, a3);
}

- (AXMVisionAnalysisOptions)lastDesiredAnalysisOptions
{
  return self->_lastDesiredAnalysisOptions;
}

- (void)setLastDesiredAnalysisOptions:(id)a3
{
  objc_storeStrong((id *)&self->_lastDesiredAnalysisOptions, a3);
}

- (unint64_t)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unint64_t)a3
{
  self->_currentFrameCount = a3;
}

- (BOOL)_queue_appActive
{
  return self->__queue_appActive;
}

- (void)set_queue_appActive:(BOOL)a3
{
  self->__queue_appActive = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (int64_t)cameraDevicePosition
{
  return self->_cameraDevicePosition;
}

- (void)setCameraDevicePosition:(int64_t)a3
{
  self->_cameraDevicePosition = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (void)setCameraMode:(int64_t)a3
{
  self->_cameraMode = a3;
}

- (CGSize)_lastSampleBufferSize
{
  double width;
  double height;
  CGSize result;

  width = self->__lastSampleBufferSize.width;
  height = self->__lastSampleBufferSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_lastSampleBufferSize:(CGSize)a3
{
  self->__lastSampleBufferSize = a3;
}

- (NSMutableDictionary)_mostRecentVisionFeatures
{
  return self->__mostRecentVisionFeatures;
}

- (NSMutableDictionary)_mostRecentVisionFeaturesUpdateTimes
{
  return self->__mostRecentVisionFeaturesUpdateTimes;
}

- (NSArray)_accessibilityElementCandidates
{
  return self->__accessibilityElementCandidates;
}

- (void)set_accessibilityElementCandidates:(id)a3
{
  objc_storeStrong((id *)&self->__accessibilityElementCandidates, a3);
}

- (NSString)lastAnnouncement
{
  return self->_lastAnnouncement;
}

- (void)setLastAnnouncement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)lastAnnouncementType
{
  return self->_lastAnnouncementType;
}

- (void)setLastAnnouncementType:(int64_t)a3
{
  self->_lastAnnouncementType = a3;
}

- (BOOL)isLastAnnouncementPartial
{
  return self->_lastAnnouncementPartial;
}

- (void)setLastAnnouncementPartial:(BOOL)a3
{
  self->_lastAnnouncementPartial = a3;
}

- (double)lastAnnouncementTime
{
  return self->_lastAnnouncementTime;
}

- (void)setLastAnnouncementTime:(double)a3
{
  self->_lastAnnouncementTime = a3;
}

- (NSString)inflightAnnouncement
{
  return self->_inflightAnnouncement;
}

- (void)setInflightAnnouncement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)previousSceneAnnouncementCandidateWithoutLocation
{
  return self->_previousSceneAnnouncementCandidateWithoutLocation;
}

- (double)previousSceneAnnouncementCandidateWithoutLocationChangedTime
{
  return self->_previousSceneAnnouncementCandidateWithoutLocationChangedTime;
}

- (void)setPreviousSceneAnnouncementCandidateWithoutLocationChangedTime:(double)a3
{
  self->_previousSceneAnnouncementCandidateWithoutLocationChangedTime = a3;
}

- (NSString)lastSceneAnnouncement
{
  return self->_lastSceneAnnouncement;
}

- (void)setLastSceneAnnouncement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)lastSceneAnnouncementFull
{
  return self->_lastSceneAnnouncementFull;
}

- (void)setLastSceneAnnouncementFull:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)lastSceneAnnouncementWithoutLocation
{
  return self->_lastSceneAnnouncementWithoutLocation;
}

- (void)setLastSceneAnnouncementWithoutLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)lastSceneAnnouncementLocation
{
  return self->_lastSceneAnnouncementLocation;
}

- (void)setLastSceneAnnouncementLocation:(int64_t)a3
{
  self->_lastSceneAnnouncementLocation = a3;
}

- (double)lastSceneAnnouncementTime
{
  return self->_lastSceneAnnouncementTime;
}

- (void)setLastSceneAnnouncementTime:(double)a3
{
  self->_lastSceneAnnouncementTime = a3;
}

- (double)lastSceneAnnouncementFullTime
{
  return self->_lastSceneAnnouncementFullTime;
}

- (void)setLastSceneAnnouncementFullTime:(double)a3
{
  self->_lastSceneAnnouncementFullTime = a3;
}

- (int64_t)lastLevelZone
{
  return self->_lastLevelZone;
}

- (void)setLastLevelZone:(int64_t)a3
{
  self->_lastLevelZone = a3;
}

- (double)lastLevelZoneChangedTime
{
  return self->_lastLevelZoneChangedTime;
}

- (void)setLastLevelZoneChangedTime:(double)a3
{
  self->_lastLevelZoneChangedTime = a3;
}

- (int64_t)lastLevelAnnouncementZone
{
  return self->_lastLevelAnnouncementZone;
}

- (void)setLastLevelAnnouncementZone:(int64_t)a3
{
  self->_lastLevelAnnouncementZone = a3;
}

- (double)lastLevelAnnouncementTime
{
  return self->_lastLevelAnnouncementTime;
}

- (void)setLastLevelAnnouncementTime:(double)a3
{
  self->_lastLevelAnnouncementTime = a3;
}

- (AXCameraLevelingMotionAnalyzer)_levelingMotionAnalyzer
{
  return self->__levelingMotionAnalyzer;
}

- (CMDeviceMotion)lastDeviceMotion
{
  return self->_lastDeviceMotion;
}

- (void)setLastDeviceMotion:(id)a3
{
  objc_storeStrong((id *)&self->_lastDeviceMotion, a3);
}

- (AXMCameraFrameContext)lastCameraFrameContext
{
  return self->_lastCameraFrameContext;
}

- (void)setLastCameraFrameContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastCameraFrameContext, a3);
}

- (AXCameraHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_lastCameraFrameContext, 0);
  objc_storeStrong((id *)&self->_lastDeviceMotion, 0);
  objc_storeStrong((id *)&self->__levelingMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncementWithoutLocation, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncementFull, 0);
  objc_storeStrong((id *)&self->_lastSceneAnnouncement, 0);
  objc_storeStrong((id *)&self->_previousSceneAnnouncementCandidateWithoutLocation, 0);
  objc_storeStrong((id *)&self->_inflightAnnouncement, 0);
  objc_storeStrong((id *)&self->_lastAnnouncement, 0);
  objc_storeStrong((id *)&self->__accessibilityElementCandidates, 0);
  objc_storeStrong((id *)&self->__mostRecentVisionFeaturesUpdateTimes, 0);
  objc_storeStrong((id *)&self->__mostRecentVisionFeatures, 0);
  objc_storeStrong((id *)&self->_lastDesiredAnalysisOptions, 0);
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_axResultsQueue, 0);
  objc_destroyWeak((id *)&self->_sceneObjectElementContainerView);
  objc_storeStrong((id *)&self->_captureSessionNode, 0);
  objc_destroyWeak((id *)&self->_captureSession);
}

- (void)_handleVisionFeatures:(uint8_t *)a1 evaluatedFeatureTypes:(_BYTE *)a2 userContext:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_230B33000, (int)a2, a3, "CameraMetadata feature not expected to be handled on Vision results queue. We would have to account for this here.", a1);
}

- (void)_handleVisionFeatures:(uint8_t *)a1 evaluatedFeatureTypes:(_BYTE *)a2 userContext:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_230B33000, (int)a2, a3, "Motion feature should not be handled on Vision results queue. We would have to account for this here.", a1);
}

@end
