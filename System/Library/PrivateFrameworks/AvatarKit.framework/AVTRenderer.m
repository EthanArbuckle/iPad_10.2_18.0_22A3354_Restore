@implementation AVTRenderer

- (void)_avtSetupWithOptions:(id)a3
{
  NSLock *v4;
  NSLock *lock;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AVTAvatarEnvironment *v10;
  void *v11;
  AVTAvatarEnvironment *v12;
  AVTAvatarEnvironment *environment;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTAugmentedRealityPresentationConfiguration *v18;
  AVTAugmentedRealityPresentationConfiguration *v19;
  id v20;

  v20 = a3;
  v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
  lock = self->_lock;
  self->_lock = v4;

  v6 = objc_alloc(MEMORY[0x1E0CD5A10]);
  objc_msgSend(v6, "avt_init");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderer setScene:](self, "setScene:", v7);

  -[AVTRenderer scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "physicsWorld");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpeed:", 4.0);

  v10 = [AVTAvatarEnvironment alloc];
  -[AVTRenderer scene](self, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTAvatarEnvironment initAndInstallInScene:renderer:](v10, "initAndInstallInScene:renderer:", v11, self);
  environment = self->_environment;
  self->_environment = v12;

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AVTRendererOptionEnableFaceTrackingLossFeedback"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    LOBYTE(v14) = objc_msgSend(v14, "BOOLValue");
  self->_enableFaceTrackingLossFeedback = (char)v14;
  self->_enableReticle = 0;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AVTRendererOptionInitiallyConfigureForARMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && !objc_msgSend(v16, "BOOLValue"))
  {
    +[AVTClassicPresentationConfiguration sharedConfiguration](AVTClassicPresentationConfiguration, "sharedConfiguration");
    v18 = (AVTAugmentedRealityPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  v19 = v18;
  -[AVTRenderer setPresentationConfiguration:](self, "setPresentationConfiguration:", v18);

  self->_antialiasingMode = 2;
  -[AVTRenderer set_wantsSceneRendererDelegationMessages:](self, "set_wantsSceneRendererDelegationMessages:", 1);
  -[AVTRenderer set_resourceManagerMonitor:](self, "set_resourceManagerMonitor:", self);
  -[AVTRenderer set_commandBufferStatusMonitor:](self, "set_commandBufferStatusMonitor:", self);
  -[AVTRenderer _allowGPUBackgroundExecution](self, "_allowGPUBackgroundExecution");

}

- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8
{
  _BOOL8 v10;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  objc_super v18;

  v10 = a6;
  v12 = a4;
  v14 = a3;
  v15 = a5;
  AVTInitializeShaderCache();
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
  v18.receiver = self;
  v18.super_class = (Class)AVTRenderer;
  v16 = -[AVTRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:](&v18, sel__initWithOptions_isPrivateRenderer_privateRendererOwner_clearsOnDraw_context_renderingAPI_, v14, v12, v15, v10, a7, a8);

  if (v16)
    objc_msgSend(v16, "_avtSetupWithOptions:", v14);
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

  return v16;
}

+ (id)renderer
{
  return (id)objc_msgSend(a1, "rendererWithDevice:options:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AVTRenderer _detachAvatarFromRenderer](self, "_detachAvatarFromRenderer");
  -[AVTFaceTracker removeDelegate:](self->_faceTracker, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)AVTRenderer;
  -[AVTRenderer dealloc](&v3, sel_dealloc);
}

- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  float v9;
  id v10;

  -[AVTRenderer scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicsWorld");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scale");
  if (v6 != 100.0)
  {
    -[AVTRenderer avatar](self, "avatar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && a3)
    {
      -[AVTRenderer avatar](self, "avatar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arScale");
      objc_msgSend(v10, "setScale:", (float)(1.0 / v9));

    }
    else
    {
      objc_msgSend(v10, "setScale:", 1.0);
    }

  }
}

- (BOOL)arMode
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  if ((arMode_done_1 & 1) == 0)
  {
    arMode_done_1 = 1;
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTRenderer arMode].cold.1(v3, v4, v5);

  }
  return -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
}

- (void)setArMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  AVTAugmentedRealityPresentationConfiguration *v8;
  AVTAugmentedRealityPresentationConfiguration *v9;

  v3 = a3;
  if ((setArMode__done_1 & 1) == 0)
  {
    setArMode__done_1 = 1;
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AVTRenderer setArMode:].cold.1(v5, v6, v7);

  }
  if (v3)
  {
    v8 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  else
  {
    +[AVTClassicPresentationConfiguration sharedConfiguration](AVTClassicPresentationConfiguration, "sharedConfiguration");
    v8 = (AVTAugmentedRealityPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[AVTRenderer setPresentationConfiguration:](self, "setPresentationConfiguration:", v8);

}

- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3
{
  double height;
  double width;
  int32x2_t v6;
  float32x4_t v7;
  int32x4_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  height = a3.height;
  width = a3.width;
  if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR")
    && !-[AVTAvatarEnvironment showReticle](self->_environment, "showReticle")
    && width != 0.0
    && height != 0.0)
  {
    -[AVTFaceTracker cameraIntrinsics](self->_faceTracker, "cameraIntrinsics");
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32(v8, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(v6, 1))).f32[0] != 0.0)
    {
      -[AVTFaceTracker projectionMatrixForViewportSize:zNear:zFar:](self->_faceTracker, "projectionMatrixForViewportSize:zNear:zFar:", width, height, 0.100000005, 100000.0);
      v16 = v10;
      v17 = v9;
      v14 = v12;
      v15 = v11;
      -[AVTRenderer setFramingMode:](self, "setFramingMode:", CFSTR("cameraARMode"));
      -[AVTRenderer pointOfView](self, "pointOfView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "camera");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "avt_setSimdProjectionTransform:", v17, v16, v15, v14);
    }
  }
}

- (BOOL)pauseSimulation
{
  return self->_pauseSimulation;
}

- (void)setPauseSimulation:(BOOL)a3
{
  double v3;
  AVTARMaskRenderer *arMaskRenderer;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_pauseSimulation != a3)
  {
    self->_pauseSimulation = a3;
    arMaskRenderer = self->_arMaskRenderer;
    if (a3)
    {
      if (arMaskRenderer)
      {
        LODWORD(v3) = 0;
        -[AVTARMaskRenderer setDepthSmoothingFactor:](arMaskRenderer, "setDepthSmoothingFactor:", v3);
      }
      -[AVTRenderer scene](self, "scene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "physicsWorld");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSpeed:", 0.0);

      -[AVTRenderer scene](self, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      v9 = 1;
    }
    else
    {
      if (arMaskRenderer)
      {
        LODWORD(v3) = 0.5;
        -[AVTARMaskRenderer setDepthSmoothingFactor:](arMaskRenderer, "setDepthSmoothingFactor:", v3);
      }
      -[AVTRenderer scene](self, "scene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "physicsWorld");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSpeed:", 4.0);

      -[AVTRenderer scene](self, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      v9 = 0;
    }
    objc_msgSend(v8, "setPaused:", v9);

  }
}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v6;
  double lastFaceTrackerUpdateTimestamp;
  double v8;
  double v9;
  double lastFaceTrackerUpdateWithTrackedFaceTimestamp;
  double v11;
  double v12;
  void *v13;
  AVTAvatar *avatar;
  void *v15;
  void *v16;
  AVTARMaskRenderer *arMaskRenderer;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
  objc_msgSend(v19, "lastUpdateTimestamp");
  if (lastFaceTrackerUpdateTimestamp < v8)
  {
    objc_msgSend(v19, "lastUpdateTimestamp");
    self->_lastFaceTrackerUpdateTimestamp = v9;
  }
  lastFaceTrackerUpdateWithTrackedFaceTimestamp = self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp;
  -[AVTFaceTracker lastUpdateWithTrackedFaceTimestamp](self->_faceTracker, "lastUpdateWithTrackedFaceTimestamp");
  if (lastFaceTrackerUpdateWithTrackedFaceTimestamp < v11)
  {
    -[AVTFaceTracker lastUpdateWithTrackedFaceTimestamp](self->_faceTracker, "lastUpdateWithTrackedFaceTimestamp");
    self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp = v12;
    if (!self->_faceIsTracked)
    {
      -[AVTRenderer setFaceIsTracked:](self, "setFaceIsTracked:", 1);
      -[AVTRenderer clearOutAnimationToNoTrackingState](self, "clearOutAnimationToNoTrackingState");
    }
    objc_msgSend(v19, "faceTrackingInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    avatar = self->_avatar;
    -[AVTRenderer pointOfView](self, "pointOfView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatar applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:](avatar, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v13, 0, v15);

    -[AVTAvatar applyBlendShapesWithTrackingInfo:](self->_avatar, "applyBlendShapesWithTrackingInfo:", v13);
LABEL_7:

    goto LABEL_13;
  }
  if (self->_lastFaceTrackerUpdateTimestamp - self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp > 1.5)
  {
    -[AVTFaceTracker arSession](self->_faceTracker, "arSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (self->_faceIsTracked && (!v16 || objc_msgSend(v16, "state") == 1))
      -[AVTRenderer _animateToNoTrackingState](self, "_animateToNoTrackingState");
    goto LABEL_7;
  }
LABEL_13:
  if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"))
  {
    arMaskRenderer = self->_arMaskRenderer;
    objc_msgSend(v19, "fallBackDepthData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTARMaskRenderer updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:](arMaskRenderer, "updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:", v6, v18, objc_msgSend(v19, "captureVideoOrientation"), objc_msgSend(v19, "interfaceOrientation"), objc_msgSend(v19, "mirroredDepthData"));

  }
  -[AVTRenderer setCaptureImageIsTooDark:](self, "setCaptureImageIsTooDark:", objc_msgSend(v19, "lowLight"));
  -[AVTRenderer setSensorCovered:](self, "setSensorCovered:", objc_msgSend(v19, "isSensorCovered"));

}

- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    objc_msgSend(v8, "avatarRenderer:faceTrackingSessionFailedWithError:", self, v9);

  }
}

- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4
{
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    objc_msgSend(v8, "avatarRendererFaceTrackingSessionInterruptionDidBegin:", self);

  }
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    objc_msgSend(v8, "avatarRendererFaceTrackingSessionInterruptionDidEnd:", self);

  }
}

- (void)_animateToNoTrackingState
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[AVTRenderer setFaceIsTracked:](self, "setFaceIsTracked:", 0);
  if (self->_enableFaceTrackingLossFeedback)
  {
    -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", self->_enableReticle);
    objc_initWeak(&location, self);
    -[AVTRenderer avatar](self, "avatar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarPose friendlyPose](AVTAvatarPose, "friendlyPose");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animatePhysicsScaleFactor:duration:", 0.0, 1.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__AVTRenderer__animateToNoTrackingState__block_invoke;
    v5[3] = &unk_1EA61F5B0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "transitionToPose:duration:delay:completionHandler:", v4, v5, 1.0, 0.0);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __40__AVTRenderer__animateToNoTrackingState__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 504))
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[56], "setEnablePhysicsSimulation:", 0);
    WeakRetained = v2;
  }

}

- (void)clearOutAnimationToNoTrackingState
{
  id v3;

  if (self->_enableFaceTrackingLossFeedback)
  {
    -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", 0);
    -[AVTRenderer avatar](self, "avatar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopTransitionAnimation");
    objc_msgSend(v3, "animatePhysicsScaleFactor:duration:", 1.0, 0.75);
    objc_msgSend(v3, "setPose:", 0);
    -[AVTAvatarEnvironment setEnablePhysicsSimulation:](self->_environment, "setEnablePhysicsSimulation:", 1);

  }
}

- (BOOL)enableFaceTrackingLossFeedback
{
  return self->_enableFaceTrackingLossFeedback;
}

- (void)setEnableFaceTrackingLossFeedback:(BOOL)a3
{
  self->_enableFaceTrackingLossFeedback = a3;
}

- (BOOL)enableReticle
{
  return self->_enableReticle;
}

- (void)setEnableReticle:(BOOL)a3
{
  self->_enableReticle = a3;
  if (-[AVTAvatarEnvironment showReticle](self->_environment, "showReticle"))
  {
    if (!self->_enableReticle)
      -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", 0);
  }
}

- (NSString)framingMode
{
  return -[AVTAvatarEnvironment framingMode](self->_environment, "framingMode");
}

- (void)setFramingMode:(id)a3
{
  -[AVTAvatarEnvironment setFramingMode:](self->_environment, "setFramingMode:", a3);
}

- (void)setFramingModeForcingPointOfViewUpdate:(id)a3
{
  -[AVTAvatarEnvironment setFramingModeForcingPointOfViewUpdate:](self->_environment, "setFramingModeForcingPointOfViewUpdate:", a3);
}

- (unint64_t)avt_antialiasingMode
{
  return self->_antialiasingMode;
}

- (void)setAvt_antialiasingMode:(unint64_t)a3
{
  if (self->_antialiasingMode != a3)
  {
    self->_antialiasingMode = a3;
    -[AVTARMaskRenderer setClearWithCamera:antialiasingMode:](self->_arMaskRenderer, "setClearWithCamera:antialiasingMode:", 0, a3);
  }
}

- (void)setFaceTracker:(id)a3
{
  AVTFaceTracker *v5;
  AVTFaceTracker *faceTracker;
  AVTFaceTracker *v7;

  v5 = (AVTFaceTracker *)a3;
  faceTracker = self->_faceTracker;
  if (faceTracker != v5)
  {
    v7 = v5;
    -[AVTFaceTracker removeDelegate:](faceTracker, "removeDelegate:", self);
    objc_storeStrong((id *)&self->_faceTracker, a3);
    -[AVTFaceTracker addDelegate:](self->_faceTracker, "addDelegate:", self);
    v5 = v7;
  }

}

- (AVTFaceTracker)faceTracker
{
  return self->_faceTracker;
}

- (BOOL)faceIsTracked
{
  return self->_faceIsTracked;
}

- (void)setFaceIsTracked:(BOOL)a3
{
  _BOOL8 v3;
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  if (self->_faceIsTracked != a3)
  {
    v3 = a3;
    self->_faceIsTracked = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      objc_msgSend(v8, "avatarRenderer:didUpdateWithFaceTrackingStatus:", self, v3);

    }
  }
}

- (id)faceTrackingDelegate
{
  return objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
}

- (void)setFaceTrackingDelegate:(id)a3
{
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_faceTrackingDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_faceTrackingDelegate, obj);
    v6 = obj;
  }

}

- (BOOL)captureImageIsTooDark
{
  return self->_captureImageIsTooDark;
}

- (void)setCaptureImageIsTooDark:(BOOL)a3
{
  _BOOL8 v3;
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  if (self->_captureImageIsTooDark != a3)
  {
    v3 = a3;
    self->_captureImageIsTooDark = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      objc_msgSend(v8, "avatarRenderer:didUpdateWithLowLightStatus:", self, v3);

    }
  }
}

- (BOOL)isSensorCovered
{
  return self->_isSensorCovered;
}

- (void)setSensorCovered:(BOOL)a3
{
  _BOOL8 v3;
  AVTRendererFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  if (self->_isSensorCovered != a3)
  {
    v3 = a3;
    self->_isSensorCovered = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      objc_msgSend(v8, "avatarRenderer:didUpdateWithSensorOcclusionStatus:", self, v3);

    }
  }
}

- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  -[AVTRenderer updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:", width, height);
  v13.receiver = self;
  v13.super_class = (Class)AVTRenderer;
  -[AVTRenderer renderWithViewport:commandBuffer:passDescriptor:](&v13, sel_renderWithViewport_commandBuffer_passDescriptor_, v12, v11, x, y, width, height);

}

- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  -[AVTRenderer updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:", width, height);
  v15.receiver = self;
  v15.super_class = (Class)AVTRenderer;
  -[AVTRenderer renderAtTime:viewport:commandBuffer:passDescriptor:](&v15, sel_renderAtTime_viewport_commandBuffer_passDescriptor_, v14, v13, a3, x, y, width, height);

}

- (AVTPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  AVTPresentationConfiguration *v4;
  AVTPresentationConfiguration **p_presentationConfiguration;
  uint64_t v6;
  AVTARMaskRenderer *arMaskRenderer;
  AVTARMaskRenderer *v8;
  AVTARMaskRenderer *v9;
  AVTARMaskRenderer *v10;
  AVTARMaskRenderer *v11;
  __CFString **v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = (AVTPresentationConfiguration *)a3;
  if (!v4)
  {
    +[AVTClassicPresentationConfiguration sharedConfiguration](AVTClassicPresentationConfiguration, "sharedConfiguration");
    v4 = (AVTPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  p_presentationConfiguration = &self->_presentationConfiguration;
  if (self->_presentationConfiguration != v4)
  {
    objc_storeStrong((id *)&self->_presentationConfiguration, v4);
    v6 = -[AVTPresentationConfiguration usesAR](*p_presentationConfiguration, "usesAR");
    if ((_DWORD)v6)
    {
      arMaskRenderer = self->_arMaskRenderer;
      if (arMaskRenderer)
      {
        -[AVTARMaskRenderer setPresentationConfiguration:](arMaskRenderer, "setPresentationConfiguration:", v4);
      }
      else
      {
        objc_initWeak(&location, self);
        v9 = [AVTARMaskRenderer alloc];
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __44__AVTRenderer_setPresentationConfiguration___block_invoke;
        v16 = &unk_1EA61F6A0;
        objc_copyWeak(&v17, &location);
        v10 = -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:](v9, "initWithOwner:presentationConfiguration:techniqueDidChangeHandler:", self, v4, &v13);
        v11 = self->_arMaskRenderer;
        self->_arMaskRenderer = v10;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      -[AVTARMaskRenderer setFlipDepth:](self->_arMaskRenderer, "setFlipDepth:", self->_arMaskRendererHasFlippedDepth, v13, v14, v15, v16);
      -[AVTARMaskRenderer setClearWithCamera:antialiasingMode:](self->_arMaskRenderer, "setClearWithCamera:antialiasingMode:", 0, self->_antialiasingMode);
    }
    else
    {
      -[AVTRenderer setAvtRendererTechnique:](self, "setAvtRendererTechnique:", 0);
      v8 = self->_arMaskRenderer;
      self->_arMaskRenderer = 0;

    }
    v12 = &AVTFramingModeAR;
    if (!(_DWORD)v6)
      v12 = AVTFramingModeCamera;
    -[AVTRenderer setFramingMode:](self, "setFramingMode:", *v12);
    -[AVTAvatarEnvironment avatarDidChange:presentationConfiguration:](self->_environment, "avatarDidChange:presentationConfiguration:", self->_avatar, *p_presentationConfiguration);
    -[AVTAvatar setPresentationConfiguration:](self->_avatar, "setPresentationConfiguration:", *p_presentationConfiguration);
    -[AVTRenderer _updatePhysicsWorldForAvatarARScaleAndARMode:](self, "_updatePhysicsWorldForAvatarARScaleAndARMode:", v6);
  }

}

void __44__AVTRenderer_setPresentationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setAvtRendererTechnique:", v5);

}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (void)_detachAvatarFromRenderer
{
  AVTAvatar *avatar;
  void *v4;

  avatar = self->_avatar;
  -[AVTRenderer scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatar willRemoveFromScene:](avatar, "willRemoveFromScene:", v4);

  -[SCNNode removeFromParentNode](self->_avatarNode, "removeFromParentNode");
}

- (void)__setAvatar:(id)a3
{
  AVTAvatar **p_avatar;
  void *v6;
  SCNNode *v7;
  SCNNode *avatarNode;
  void *v9;
  void *v10;
  AVTAvatar *v11;
  void *v12;
  AVTAvatar *v13;

  p_avatar = &self->_avatar;
  v13 = (AVTAvatar *)a3;
  if (*p_avatar != v13)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
    objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
    -[AVTAvatar pose](*p_avatar, "pose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTRenderer lock](self, "lock");
    -[AVTRenderer _detachAvatarFromRenderer](self, "_detachAvatarFromRenderer");
    objc_storeStrong((id *)&self->_avatar, a3);
    -[AVTAvatar avatarNode](v13, "avatarNode");
    v7 = (SCNNode *)objc_claimAutoreleasedReturnValue();
    avatarNode = self->_avatarNode;
    self->_avatarNode = v7;

    -[AVTRenderer scene](self, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChildNode:", self->_avatarNode);

    v11 = *p_avatar;
    -[AVTRenderer scene](self, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatar didAddToScene:](v11, "didAddToScene:", v12);

    -[AVTAvatarEnvironment avatarDidChange:presentationConfiguration:](self->_environment, "avatarDidChange:presentationConfiguration:", *p_avatar, self->_presentationConfiguration);
    -[AVTAvatar setPresentationConfiguration:](*p_avatar, "setPresentationConfiguration:", self->_presentationConfiguration);
    -[AVTRenderer _updatePhysicsWorldForAvatarARScaleAndARMode:](self, "_updatePhysicsWorldForAvatarARScaleAndARMode:", -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"));
    -[AVTRenderer avatarDidChange](self, "avatarDidChange");
    -[AVTRenderer unlock](self, "unlock");
    -[AVTAvatar setPose:](*p_avatar, "setPose:", v6);
    objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

  }
}

- (void)_setAvatar:(id)a3
{
  id v4;

  v4 = a3;
  kdebug_trace();
  -[AVTRenderer __setAvatar:](self, "__setAvatar:", v4);

  kdebug_trace();
}

- (void)fadePuppetToWhite:(float)a3
{
  -[AVTAvatarEnvironment setFadeFactor:](self->_environment, "setFadeFactor:");
}

- (BOOL)isWarmingUp
{
  return self->_warmingUp;
}

- (void)setWarmingUp:(BOOL)a3
{
  self->_warmingUp = a3;
}

- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SCNNode scene](self->_avatarNode, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[AVTAvatar updateAfterAnimationsEvaluatedAtTime:renderer:](self->_avatar, "updateAfterAnimationsEvaluatedAtTime:renderer:", v8, a4);

}

- (id)_renderer:(id)a3 subdivDataForHash:(id)a4
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a4;
  +[AVTResourceLocator sharedResourceLocator]();
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator subdivDataCacheURL](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.osddata"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 8, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  NSObject *v16;
  id v17;

  v6 = a4;
  v7 = (void (**)(_QWORD))a5;
  +[AVTResourceLocator sharedResourceLocator]();
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator subdivDataCacheURL](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.osddata"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      dispatch_get_global_queue(25, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__AVTRenderer__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke;
      block[3] = &unk_1EA61DAA0;
      v16 = v12;
      v17 = v11;
      dispatch_async(v13, block);

      v14 = v16;
    }
    else
    {
      avt_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AVTView _renderer:didBuildSubdivDataForHash:dataProvider:].cold.1(v14);
    }

  }
}

void __64__AVTRenderer__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  v3 = objc_msgSend(v2, "writeToURL:options:error:", v1, 1, &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke_cold_1(v4, v5);

  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  SCNNode *avatarNode;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AVTARMaskRenderer *arMaskRenderer;
  void *v12;
  id v13;

  avatarNode = self->_avatarNode;
  v7 = a3;
  -[SCNNode scene](avatarNode, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[AVTRenderer avatar](self, "avatar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "update");

    -[AVTARMaskRenderer updateMaskParametersAtTime:](self->_arMaskRenderer, "updateMaskParametersAtTime:", a4);
    if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"))
    {
      arMaskRenderer = self->_arMaskRenderer;
      -[AVTRenderer avatar](self, "avatar");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rootJointNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTARMaskRenderer updateMaskParametersWithRootJointNode:](arMaskRenderer, "updateMaskParametersWithRootJointNode:", v12);

    }
  }
}

- (void)crashAppExtensionOrViewService_rdar98130076:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)renderer:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint8_t buf[64];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__AVTRenderer_renderer_didFallbackToDefaultTextureForSource_message___block_invoke;
    v21[3] = &unk_1EA61F6F0;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    -[AVTRenderer crashAppExtensionOrViewService_rdar98130076:](self, "crashAppExtensionOrViewService_rdar98130076:", v21);

  }
  objc_msgSend(v9, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsString:", CFSTR("onTopMask"));

  avt_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
  if ((v12 & 1) != 0)
  {
    if (v14)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v8;
      *(_WORD *)&buf[32] = 2112;
      *(_QWORD *)&buf[34] = v9;
      *(_WORD *)&buf[42] = 2112;
      *(_QWORD *)&buf[44] = v10;
      _os_log_fault_impl(&dword_1DD1FA000, v13, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Failed to find texture for source %@ with message:\n%@", buf, 0x34u);

    }
LABEL_10:

    return;
  }
  if (v14)
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v8;
    *(_WORD *)&buf[32] = 2112;
    *(_QWORD *)&buf[34] = v9;
    *(_WORD *)&buf[42] = 2112;
    *(_QWORD *)&buf[44] = v10;
    _os_log_fault_impl(&dword_1DD1FA000, v13, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Failed to find texture for source %@ with message:\n%@", buf, 0x34u);

  }
  if (!AVTLogAllowsInternalCrash())
    goto LABEL_10;
  v36 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 136316162;
  v26 = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
  v27 = 2112;
  v28 = v20;
  v29 = 2048;
  v30 = v8;
  v31 = 2112;
  v32 = v9;
  v33 = 2112;
  v34 = v10;
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

void __69__AVTRenderer_renderer_didFallbackToDefaultTextureForSource_message___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  _OWORD buf[5];
  uint64_t v11;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    LODWORD(buf[0]) = 136316162;
    *(_QWORD *)((char *)buf + 4) = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]_block_invoke";
    WORD6(buf[0]) = 2112;
    *(_QWORD *)((char *)buf + 14) = v4;
    WORD3(buf[1]) = 2048;
    *((_QWORD *)&buf[1] + 1) = v5;
    LOWORD(buf[2]) = 2112;
    *(_QWORD *)((char *)&buf[2] + 2) = v6;
    WORD5(buf[2]) = 2112;
    *(_QWORD *)((char *)&buf[2] + 12) = v7;
    _os_log_error_impl(&dword_1DD1FA000, v2, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Failed to find texture for source %@ with message:\n%@", (uint8_t *)buf, 0x34u);

  }
  v11 = 0;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (void)renderer:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint8_t buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__AVTRenderer_renderer_commandBufferDidCompleteWithError___block_invoke;
    v25[3] = &unk_1EA61F6F0;
    v26 = v6;
    v27 = v7;
    v28 = v8;
    -[AVTRenderer crashAppExtensionOrViewService_rdar98130076:](self, "crashAppExtensionOrViewService_rdar98130076:", v25);

  }
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0CC6960];

    if (v9 == v10 && objc_msgSend(v8, "code") == 7)
    {
      avt_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v7, "status");
        objc_msgSend(v7, "logs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v6;
        LOWORD(v42) = 1024;
        *(_DWORD *)((char *)&v42 + 2) = v19;
        WORD3(v42) = 2112;
        *((_QWORD *)&v42 + 1) = v8;
        LOWORD(v43) = 2112;
        *(_QWORD *)((char *)&v43 + 2) = v20;
        _os_log_fault_impl(&dword_1DD1FA000, v11, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);

      }
LABEL_12:

      return;
    }
  }
  avt_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "status");
    objc_msgSend(v7, "logs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v6;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = v15;
    WORD3(v42) = 2112;
    *((_QWORD *)&v42 + 1) = v8;
    LOWORD(v43) = 2112;
    *(_QWORD *)((char *)&v43 + 2) = v16;
    _os_log_fault_impl(&dword_1DD1FA000, v12, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);

  }
  if (!AVTLogAllowsInternalCrash())
    goto LABEL_12;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "status");
  objc_msgSend(v7, "logs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 136316418;
  v30 = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
  v31 = 2112;
  v32 = v22;
  v33 = 2048;
  v34 = v6;
  v35 = 1024;
  v36 = v23;
  v37 = 2112;
  v38 = v8;
  v39 = 2112;
  v40 = v24;
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

void __58__AVTRenderer_renderer_commandBufferDidCompleteWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD buf[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "status");
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "logs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf[0]) = 136316418;
    *(_QWORD *)((char *)buf + 4) = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]_block_invoke";
    WORD2(buf[1]) = 2112;
    *(_QWORD *)((char *)&buf[1] + 6) = v4;
    HIWORD(buf[2]) = 2048;
    buf[3] = v5;
    LOWORD(v13) = 1024;
    *(_DWORD *)((char *)&v13 + 2) = v6;
    WORD3(v13) = 2112;
    *((_QWORD *)&v13 + 1) = v7;
    LOWORD(v14) = 2112;
    *(_QWORD *)((char *)&v14 + 2) = v8;
    _os_log_error_impl(&dword_1DD1FA000, v2, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", (uint8_t *)buf, 0x3Au);

  }
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "status");
  objc_msgSend(*(id *)(a1 + 40), "logs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (AVTRendererTechnique)avtRendererTechnique
{
  return self->_avtRendererTechnique;
}

- (void)setAvtRendererTechnique:(id)a3
{
  AVTRendererTechnique *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v5 = (AVTRendererTechnique *)a3;
  -[AVTRendererTechnique technique](v5, "technique");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_avtRendererTechnique != v5
    || (v9.receiver = self,
        v9.super_class = (Class)AVTRenderer,
        -[AVTRenderer technique](&v9, sel_technique),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v6))
  {
    objc_storeStrong((id *)&self->_avtRendererTechnique, a3);
    v8.receiver = self;
    v8.super_class = (Class)AVTRenderer;
    -[AVTRenderer setTechnique:](&v8, sel_setTechnique_, v6);
  }

}

- (id)technique
{
  void *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTRenderer;
  -[AVTRenderer technique](&v6, sel_technique);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AVTView technique].cold.1(a2, v4);

  }
  return 0;
}

- (void)setTechnique:(id)a3
{
  NSObject *v4;

  if (a3)
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AVTView technique].cold.1(a2, v4);

  }
}

- (BOOL)deprecated_ntk_isPaused
{
  void *v2;
  char v3;

  -[AVTRenderer scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (void)deprecated_ntk_setPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVTRenderer scene](self, "scene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)deprecated_ntk_setPhysicsWorldTimeStep:(float)a3
{
  double v3;
  void *v4;
  id v5;

  v3 = a3;
  -[AVTRenderer scene](self, "scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicsWorld");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeStep:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtRendererTechnique, 0);
  objc_storeStrong((id *)&self->_arMaskRenderer, 0);
  objc_destroyWeak((id *)&self->_faceTrackingDelegate);
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (BOOL)enableDepthMask
{
  return -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
}

- (void)setEnableDepthMask:(BOOL)a3 withFlippedDepth:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  self->_arMaskRendererHasFlippedDepth = a4;
  -[AVTARMaskRenderer setFlipDepth:](self->_arMaskRenderer, "setFlipDepth:", a4);
  -[AVTRenderer setArMode:](self, "setArMode:", v4);
}

- (void)setCapturedDepth:(id)a3
{
  -[AVTARMaskRenderer setCapturedDepth:](self->_arMaskRenderer, "setCapturedDepth:", a3);
}

- (MTLTexture)capturedDepth
{
  return -[AVTARMaskRenderer capturedDepth](self->_arMaskRenderer, "capturedDepth");
}

- (void)arMode
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTRenderer arMode]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
}

- (void)setArMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTRenderer setArMode:]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
}

@end
