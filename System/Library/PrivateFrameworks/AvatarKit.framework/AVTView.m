@implementation AVTView

- (void)_avtCommonInit
{
  NSLock *v3;
  NSLock *lock;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AVTAvatarEnvironment *v11;
  void *v12;
  AVTAvatarEnvironment *v13;
  AVTAvatarEnvironment *environment;
  AVTFaceTracker *v15;
  AVTFaceTracker *faceTracker;
  void *v17;
  uint64_t v18;
  _OWORD v19[2];

  v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
  lock = self->_lock;
  self->_lock = v3;

  PerfTimesCreate(0x3Cu, (uint64_t)v19);
  v5 = v19[1];
  *(_OWORD *)&self->_perfTimes.lock._os_unfair_lock_opaque = v19[0];
  *(_OWORD *)&self->_perfTimes.current = v5;
  -[AVTView setEnableReticle:](self, "setEnableReticle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView setBackgroundColor:](self, "setBackgroundColor:", v6);

  -[AVTView setAntialiasingMode:](self, "setAntialiasingMode:", 2);
  -[AVTView setFaceIsTracked:](self, "setFaceIsTracked:", 1);
  v7 = objc_alloc(MEMORY[0x1E0CD5A10]);
  objc_msgSend(v7, "avt_init");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView setScene:](self, "setScene:", v8);

  -[AVTView scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "physicsWorld");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSpeed:", 4.0);

  v11 = [AVTAvatarEnvironment alloc];
  -[AVTView scene](self, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVTAvatarEnvironment initAndInstallInScene:renderer:](v11, "initAndInstallInScene:renderer:", v12, self);
  environment = self->_environment;
  self->_environment = v13;

  v15 = objc_alloc_init(AVTFaceTracker);
  faceTracker = self->_faceTracker;
  self->_faceTracker = v15;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 != 1)
    -[AVTFaceTracker setLimitRoll:](self->_faceTracker, "setLimitRoll:", 1);
  -[AVTFaceTracker setShouldConstrainHeadPose:](self->_faceTracker, "setShouldConstrainHeadPose:", 1);
  -[AVTFaceTracker addDelegate:](self->_faceTracker, "addDelegate:", self);
  -[AVTView setupOrientation](self, "setupOrientation");
  -[AVTView setup](self, "setup");
  -[AVTView set_wantsSceneRendererDelegationMessages:](self, "set_wantsSceneRendererDelegationMessages:", 1);
  -[AVTView set_resourceManagerMonitor:](self, "set_resourceManagerMonitor:", self);
  -[AVTView set_commandBufferStatusMonitor:](self, "set_commandBufferStatusMonitor:", self);
  -[AVTView _allowGPUBackgroundExecution](self, "_allowGPUBackgroundExecution");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AVTView _disconnectRendererFromAllAvatars](self, "_disconnectRendererFromAllAvatars");
  PerfTimesFree((uint64_t)&self->_perfTimes);
  -[AVTFaceTracker removeDelegate:](self->_faceTracker, "removeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)AVTView;
  -[AVTView dealloc](&v4, sel_dealloc);
}

- (AVTView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AVTView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  AVTInitializeShaderCache();
  v12.receiver = self;
  v12.super_class = (Class)AVTView;
  v10 = -[AVTView initWithFrame:options:](&v12, sel_initWithFrame_options_, v9, x, y, width, height);

  if (v10)
    -[AVTView _avtCommonInit](v10, "_avtCommonInit");
  return v10;
}

- (AVTView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AVTView *v8;
  AVTView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  AVTInitializeShaderCache();
  v11.receiver = self;
  v11.super_class = (Class)AVTView;
  v8 = -[AVTView initWithFrame:options:](&v11, sel_initWithFrame_options_, 0, x, y, width, height);
  v9 = v8;
  if (v8)
    -[AVTView _avtCommonInit](v8, "_avtCommonInit");
  return v9;
}

- (AVTView)initWithCoder:(id)a3
{
  id v4;
  AVTView *v5;
  objc_super v7;

  v4 = a3;
  AVTInitializeShaderCache();
  v7.receiver = self;
  v7.super_class = (Class)AVTView;
  v5 = -[AVTView initWithCoder:](&v7, sel_initWithCoder_, v4);

  if (v5)
    -[AVTView _avtCommonInit](v5, "_avtCommonInit");
  return v5;
}

- (void)lockAvatar
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)unlockAvatar
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  float v10;
  id v11;

  v3 = a3;
  -[AVTView scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicsWorld");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scale");
  if (v6 != 100.0)
  {
    -[AVTView avatar](self, "avatar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
    if (v7)
    {
      v9 = v11;
      if (v3)
      {
        objc_msgSend(v7, "arScale", 1.0);
        v9 = v11;
        v8 = (float)(1.0 / v10);
      }
    }
    else
    {
      v9 = v11;
    }
    objc_msgSend(v9, "setScale:", v8);

  }
}

- (BOOL)arMode
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  if ((arMode_done_0 & 1) == 0)
  {
    arMode_done_0 = 1;
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTView arMode].cold.1(v3, v4, v5);

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
  if ((setArMode__done_0 & 1) == 0)
  {
    setArMode__done_0 = 1;
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AVTView setArMode:].cold.1(v5, v6, v7);

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
  -[AVTView setPresentationConfiguration:](self, "setPresentationConfiguration:", v8);

}

- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  height = a3.height;
  width = a3.width;
  if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR")
    && !-[AVTAvatarEnvironment showReticle](self->_environment, "showReticle")
    && width != 0.0
    && height != 0.0)
  {
    -[AVTFaceTracker projectionMatrixForViewportSize:zNear:zFar:](self->_faceTracker, "projectionMatrixForViewportSize:zNear:zFar:", width, height, 0.100000005, 100000.0);
    v13 = v7;
    v14 = v6;
    v11 = v9;
    v12 = v8;
    -[AVTView pointOfView](self, "pointOfView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "camera");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "avt_setSimdProjectionTransform:", v14, v13, v12, v11);
  }
}

- (void)_animateToNoTrackingStateShowingReticle:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a3;
  -[AVTView setFaceIsTracked:](self, "setFaceIsTracked:", 0);
  v5 = self->_enableReticle && v3;
  -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", v5);
  objc_initWeak(&location, self);
  +[AVTAvatarPose friendlyPose](AVTAvatarPose, "friendlyPose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView avatar](self, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "animatePhysicsScaleFactor:duration:", 0.0, 1.0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__AVTView__animateToNoTrackingStateShowingReticle___block_invoke;
    v9[3] = &unk_1EA61F5B0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "transitionToPose:duration:delay:completionHandler:", v6, v9, 1.0, 0.0);
    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&location);
}

void __51__AVTView__animateToNoTrackingStateShowingReticle___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "faceIsTracked") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "environment");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setEnablePhysicsSimulation:", 0);

  }
}

- (void)clearOutAnimationToNoTrackingState
{
  id v3;

  -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", 0);
  -[AVTView avatar](self, "avatar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "stopTransitionAnimation");
    objc_msgSend(v3, "animatePhysicsScaleFactor:duration:", 1.0, 0.75);
    objc_msgSend(v3, "setPose:", 0);
  }
  -[AVTAvatarEnvironment setEnablePhysicsSimulation:](self->_environment, "setEnablePhysicsSimulation:", 1);

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

- (BOOL)allowTrackSmoothing
{
  return !-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
}

- (void)updateAtTime:(double)a3
{
  void *v5;
  _BOOL4 v6;
  AVTARMaskRenderer *arMaskRenderer;
  void *v8;
  void *v9;
  void *v10;
  double lastFaceTrackerUpdateTimestamp;
  double v12;
  double v13;
  double lastFaceTrackerUpdateWithTrackedFaceTimestamp;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  -[AVTView avatar](self, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27 = v5;
    -[AVTARMaskRenderer updateMaskParametersAtTime:](self->_arMaskRenderer, "updateMaskParametersAtTime:", a3);
    v6 = -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
    if (v6)
    {
      arMaskRenderer = self->_arMaskRenderer;
      -[AVTView avatar](self, "avatar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootJointNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTARMaskRenderer updateMaskParametersWithRootJointNode:](arMaskRenderer, "updateMaskParametersWithRootJointNode:", v9);

      -[AVTView renderer](self, "renderer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_backingSize");
      -[AVTView updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:");

    }
    objc_msgSend(v27, "update");
    if (-[AVTView enableFaceTracking](self, "enableFaceTracking"))
    {
      -[AVTFaceTracker beginQuery](self->_faceTracker, "beginQuery");
      lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
      -[AVTFaceTracker lastUpdateTimestamp](self->_faceTracker, "lastUpdateTimestamp");
      if (lastFaceTrackerUpdateTimestamp < v12)
      {
        -[AVTFaceTracker lastUpdateTimestamp](self->_faceTracker, "lastUpdateTimestamp");
        self->_lastFaceTrackerUpdateTimestamp = v13;
      }
      lastFaceTrackerUpdateWithTrackedFaceTimestamp = self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp;
      -[AVTFaceTracker lastUpdateWithTrackedFaceTimestamp](self->_faceTracker, "lastUpdateWithTrackedFaceTimestamp");
      if (lastFaceTrackerUpdateWithTrackedFaceTimestamp >= v15)
      {
        if (self->_lastFaceTrackerUpdateTimestamp - self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp > 1.5
          && self->_faceIsTracked)
        {
          -[AVTFaceTracker arSession](self->_faceTracker, "arSession");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "state");

          if (v23 == 1)
          {
            -[AVTView _animateToNoTrackingStateShowingReticle:](self, "_animateToNoTrackingStateShowingReticle:", 1);
            -[AVTView _didLostTrackingForAWhile](self, "_didLostTrackingForAWhile");
          }
        }
      }
      else
      {
        -[AVTFaceTracker lastUpdateWithTrackedFaceTimestamp](self->_faceTracker, "lastUpdateWithTrackedFaceTimestamp");
        self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp = v16;
        -[AVTView pointOfView](self, "pointOfView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[AVTView faceIsTracked](self, "faceIsTracked"))
        {
          -[AVTView setFaceIsTracked:](self, "setFaceIsTracked:", 1);
          -[AVTView clearOutAnimationToNoTrackingState](self, "clearOutAnimationToNoTrackingState");
        }
        -[AVTFaceTracker faceTrackingInfo](self->_faceTracker, "faceTrackingInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "timestamp");
          if (v20 >= self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp)
          {
            v21 = !v6;
            if (-[AVTView directRetargetingMode](self, "directRetargetingMode")
              || !-[AVTView allowTrackSmoothing](self, "allowTrackSmoothing")
              || (objc_msgSend(v27, "isTransitioning") & 1) != 0)
            {
              objc_msgSend(v27, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v19, v21, v17);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
              objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.05);
              v25 = (void *)MEMORY[0x1E0CD5A38];
              objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setAnimationTimingFunction:", v26);

              objc_msgSend(v27, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v19, v21, v17);
              objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
            }
            objc_msgSend(v27, "applyBlendShapesWithTrackingInfo:", v19);
          }
        }

      }
      -[AVTFaceTracker faceTrackingFrameID](self->_faceTracker, "faceTrackingFrameID");
      -[AVTFaceTracker endQuery](self->_faceTracker, "endQuery");
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_perfPacketUpdateTimestamp = v24;
    v5 = v27;
  }

}

- (void)_drawAtTime:(double)a3
{
  AVTAvatar *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  objc_super v9;

  -[AVTView lockAvatar](self, "lockAvatar");
  v9.receiver = self;
  v9.super_class = (Class)AVTView;
  -[AVTView _drawAtTime:](&v9, sel__drawAtTime_, a3);
  v5 = self->_avatar;
  -[AVTView unlockAvatar](self, "unlockAvatar");
  -[AVTView delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "avatarView:didRenderAvatar:", self, v5);

}

- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTView renderer](self, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AVTView_addAvatarPresentedOnScreenCallbackWithQueue_block___block_invoke;
  v11[3] = &unk_1EA61F5D8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "_addGPUFramePresentedHandler:", v11);

}

void __61__AVTView_addAvatarPresentedOnScreenCallbackWithQueue_block___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

- (AVTAvatarEnvironment)environment
{
  return self->_environment;
}

- (void)_disconnectRendererFromAvatar:(id)a3 avatarNode:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[AVTView scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willRemoveFromScene:", v7);

  objc_msgSend(v8, "removeFromParentNode");
}

- (void)_disconnectRendererFromAllAvatars
{
  AVTAvatar *avatar;
  void *v4;

  avatar = self->_avatar;
  -[AVTView scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatar willRemoveFromScene:](avatar, "willRemoveFromScene:", v4);

  -[SCNNode removeFromParentNode](self->_avatarNode, "removeFromParentNode");
}

- (void)setAvatar:(id)a3
{
  AVTAvatar *v5;
  SCNNode *v6;
  void *v7;
  AVTAvatar *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVTAvatar *v14;

  v14 = (AVTAvatar *)a3;
  v5 = self->_avatar;
  v6 = self->_avatarNode;
  if (v5 != v14)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
    objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
    -[AVTAvatar pose](v5, "pose");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTView lockAvatar](self, "lockAvatar");
    -[AVTView _disconnectRendererFromAvatar:avatarNode:](self, "_disconnectRendererFromAvatar:avatarNode:", v5, v6);
    v8 = v14;
    -[AVTAvatar avatarNode](v8, "avatarNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_avatar, a3);
    objc_storeStrong((id *)&self->_avatarNode, v9);
    -[AVTView scene](self, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChildNode:", v9);

    -[AVTView scene](self, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatar didAddToScene:](v8, "didAddToScene:", v12);

    -[AVTAvatarEnvironment avatarDidChange:presentationConfiguration:](self->_environment, "avatarDidChange:presentationConfiguration:", v8, self->_presentationConfiguration);
    -[AVTView _updatePhysicsWorldForAvatarARScaleAndARMode:](self, "_updatePhysicsWorldForAvatarARScaleAndARMode:", -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"));
    -[AVTView avatarDidChange](self, "avatarDidChange");
    -[AVTView unlockAvatar](self, "unlockAvatar");
    -[AVTAvatar setPose:](v8, "setPose:", v7);
    if (self->_enableReticle && !-[AVTView faceIsTracked](self, "faceIsTracked"))
    {
      +[AVTAvatarPose friendlyPose](AVTAvatarPose, "friendlyPose");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatar setPose:](v8, "setPose:", v13);

    }
    objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

  }
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  -[AVTView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVTView updateInterfaceOrientation](self, "updateInterfaceOrientation");
}

- (void)setupOrientation
{
  id v3;

  -[AVTView updateInterfaceOrientation](self, "updateInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__UIOrientationDidChangeNotification_, *MEMORY[0x1E0CEB280], 0);

}

- (void)updateInterfaceOrientation
{
  void *v3;
  void *v4;
  id v5;

  -[AVTView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTView window](self, "window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTracker setInterfaceOrientation:](self->_faceTracker, "setInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));

  }
}

- (void)_fireTrackingLoss
{
  -[AVTView _animateToNoTrackingStateShowingReticle:](self, "_animateToNoTrackingStateShowingReticle:", 0);
  -[AVTView _didLostTrackingForAWhile](self, "_didLostTrackingForAWhile");
}

- (void)_delayedTrackingLoss
{
  -[AVTView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__fireTrackingLoss, 0, 1.5);
}

- (void)_cancelDelayedtrackingLoss
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fireTrackingLoss, 0);
}

- (_QWORD)transitionHelper
{
  _QWORD *v1;
  void *v2;
  id *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[91];
    if (!v2)
    {
      v3 = -[AVTViewTransitionHelper initWithView:]((id *)[AVTViewTransitionHelper alloc], a1);
      v4 = (void *)v1[91];
      v1[91] = v3;

      v2 = (void *)v1[91];
    }
    a1 = v2;
  }
  return a1;
}

- (void)transitionToPose:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  -[AVTView transitionToPose:duration:style:completionHandler:](self, "transitionToPose:duration:style:completionHandler:", a3, 0, a5, a4);
}

- (void)transitionToPose:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  AVTAvatar *v11;
  double v12;
  unint64_t v13;
  id *v14;
  id v15;

  v15 = a3;
  v10 = a6;
  v11 = self->_avatar;
  if (!v15)
  {
    +[AVTAvatarPose neutralPose](AVTAvatarPose, "neutralPose");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_enableFaceTracking)
  {
    -[AVTView setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:](self, "setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:", 0, 1);
    if (a4 <= 1.0)
      v12 = a4;
    else
      v12 = 1.0;
    -[AVTAvatar animatePhysicsScaleFactor:duration:](v11, "animatePhysicsScaleFactor:duration:", 1.0, v12);
  }
  if (a5 - 1 > 4)
    v13 = 0;
  else
    v13 = qword_1DD26A4F0[a5 - 1];
  -[AVTView transitionHelper](self);
  v14 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v14, 0, v15, v13, v11, v10, 0, a4);

}

- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  -[AVTView transitionToStickerConfiguration:duration:style:completionHandler:](self, "transitionToStickerConfiguration:duration:style:completionHandler:", a3, 0, a5, a4);
}

- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  AVTAvatar *v11;
  double v12;
  unint64_t v13;
  id *v14;
  id v15;

  v15 = a3;
  v10 = a6;
  v11 = self->_avatar;
  if (self->_enableFaceTracking)
  {
    -[AVTView setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:](self, "setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:", 0, 1);
    if (a4 <= 1.0)
      v12 = a4;
    else
      v12 = 1.0;
    -[AVTAvatar animatePhysicsScaleFactor:duration:](v11, "animatePhysicsScaleFactor:duration:", 0.0, v12);
  }
  if (a5 - 1 > 4)
    v13 = 0;
  else
    v13 = qword_1DD26A4F0[a5 - 1];
  -[AVTView transitionHelper](self);
  v14 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v14, v15, 0, v13, v11, v10, 0, a4);

}

- (void)_transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  AVTAvatar *v11;
  void *v12;
  AVTAvatar *faceTrackerDidUpdateBlock;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  AVTAvatar *v22;
  id v23;
  id v24;
  id v25[2];
  BOOL v26;
  id location;

  v9 = a6;
  v10 = v9;
  if (self->_enableFaceTracking && !self->_faceTrackingPaused)
  {
    if (!v9)
      goto LABEL_8;
    if (self->_faceTrackerDidUpdateBlock)
    {
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AVTView _transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:].cold.1(v17, v18, v19);

    }
    v20 = (void *)MEMORY[0x1DF0D6F78](v10);
    faceTrackerDidUpdateBlock = (AVTAvatar *)self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = v20;
  }
  else
  {
    v11 = self->_avatar;
    -[AVTAvatar pose](v11, "pose");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatar setPhysicsScaleFactor:](v11, "setPhysicsScaleFactor:", 0.0);
    -[AVTAvatar transitionToPose:duration:delay:completionHandler:](v11, "transitionToPose:duration:delay:completionHandler:", v12, 0, 3.40282347e38, 0.0);
    -[AVTAvatar setPose:](v11, "setPose:", 0);
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke;
    v21[3] = &unk_1EA61F628;
    objc_copyWeak(v25, &location);
    v25[1] = *(id *)&a3;
    faceTrackerDidUpdateBlock = v11;
    v22 = faceTrackerDidUpdateBlock;
    v26 = a5;
    v14 = v12;
    v23 = v14;
    v24 = v10;
    v15 = (void *)MEMORY[0x1DF0D6F78](v21);
    v16 = self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = v15;

    if (self->_enableFaceTracking)
      -[AVTView setFaceTrackingPaused:](self, "setFaceTrackingPaused:", 0);
    else
      -[AVTView setEnableFaceTracking:](self, "setEnableFaceTracking:", 1);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);

  }
LABEL_8:

}

void __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = 1.0;
    objc_msgSend(*(id *)(a1 + 32), "animatePhysicsScaleFactor:duration:", 1.0, fmax(*(double *)(a1 + 64), 0.75));
    if (!*(_BYTE *)(a1 + 72))
      v3 = 0.0;
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(double *)(a1 + 64);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke_2;
    v8[3] = &unk_1EA61F600;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", v5, 0, 0, 0, v8, v3, v6, 0.0);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 completionHandler:(id)a4
{
  -[AVTView transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:](self, "transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:", 0, 1, a4, a3);
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 completionHandler:(id)a5
{
  -[AVTView transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:](self, "transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:", a4, 1, a5, a3);
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 enableBakedAnimations:(BOOL)a4 completionHandler:(id)a5
{
  -[AVTView transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:](self, "transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:", 0, a4, a5, a3);
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  AVTAvatar *v11;
  unint64_t v12;
  id *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[3];
  BOOL v18;
  id location;

  v10 = a6;
  v11 = self->_avatar;
  objc_initWeak(&location, self);
  if (a4 - 1 > 4)
    v12 = 0;
  else
    v12 = qword_1DD26A4F0[a4 - 1];
  -[AVTView transitionHelper](self);
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__AVTView_transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke;
  v15[3] = &unk_1EA61F650;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a3;
  v17[2] = (id)a4;
  v18 = a5;
  v14 = v10;
  v16 = v14;
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v13, 0, 0, v12, v11, 0, v15, a3);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __94__AVTView_transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

- (void)_transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7
{
  void (**v11)(id, _QWORD *);
  id v12;
  AVTAvatar *v13;
  void *v14;
  AVTAvatar *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  AVTAvatar *v19;
  id v20;
  id v21;
  id v22[2];
  BOOL v23;
  id location;

  v11 = (void (**)(id, _QWORD *))a6;
  v12 = a7;
  v13 = self->_avatar;
  -[AVTAvatar pose](v13, "pose");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatar setPhysicsScaleFactor:](v13, "setPhysicsScaleFactor:", 0.0);
  -[AVTAvatar transitionToPose:duration:delay:completionHandler:](v13, "transitionToPose:duration:delay:completionHandler:", v14, 0, 3.40282347e38, 0.0);
  -[AVTAvatar setPose:](v13, "setPose:", 0);
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke;
  v18[3] = &unk_1EA61F628;
  objc_copyWeak(v22, &location);
  v23 = a5;
  v15 = v13;
  v19 = v15;
  v16 = v14;
  v20 = v16;
  v22[1] = *(id *)&a3;
  v17 = v12;
  v21 = v17;
  v11[2](v11, v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

void __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 72))
      v3 = 1.0;
    else
      v3 = 0.0;
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(double *)(a1 + 64);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke_2;
    v8[3] = &unk_1EA61F600;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", v5, 0, 0, 0, v8, v3, v6, 0.0);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  AVTAvatar *v14;
  unint64_t v15;
  id *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22[3];
  BOOL v23;
  id location;

  v12 = a6;
  v13 = a7;
  v14 = self->_avatar;
  objc_initWeak(&location, self);
  if (a4 - 1 > 4)
    v15 = 0;
  else
    v15 = qword_1DD26A4F0[a4 - 1];
  -[AVTView transitionHelper](self);
  v16 = (id *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __141__AVTView_transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke;
  v19[3] = &unk_1EA61F678;
  objc_copyWeak(v22, &location);
  v22[1] = *(id *)&a3;
  v22[2] = (id)a4;
  v23 = a5;
  v17 = v12;
  v20 = v17;
  v18 = v13;
  v21 = v18;
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v16, 0, 0, v15, v14, 0, v19, a3);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

void __141__AVTView_transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_transitionToCustomFaceTrackingWithDuration:style:enableBakedAnimations:faceTrackingDidStartHandlerReceiverBlock:completionHandler:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

}

- (void)_transitionCoordinatorToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 options:(unint64_t)a6
{
  AVTAvatar *v11;
  id v12;
  id *v13;

  v11 = self->_avatar;
  v12 = a3;
  -[AVTView transitionHelper](self);
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionCoordinatorToStickerConfiguration:duration:style:options:avatar:](v13, v12, a5, a6, v11, a4);

}

- (void)_transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(unint64_t)a4 options:(unint64_t)a5
{
  AVTAvatar *v9;
  id *v10;

  v9 = self->_avatar;
  -[AVTView transitionHelper](self);
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionCoordinatorOutOfStickerConfigurationWithDuration:style:options:avatar:](v10, a4, a3, a5, v9);

}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v6;
  uint64_t v7;
  AVTARMaskRenderer *arMaskRenderer;
  void *v9;
  void *v10;
  void (**faceTrackerDidUpdateBlock)(void);
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "faceIsTracked"))
  {
    self->_packetNeedRecording = 1;
    self->_droppedFrameCount = 0;
  }
  if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"))
  {
    v7 = objc_msgSend(v6, "capturedImage");
    if (v7)
      -[SCNCaptureDeviceOutputConsumer setPixelBuffer:](self->_arCaptureDeviceOutputConsumer, "setPixelBuffer:", v7);
    arMaskRenderer = self->_arMaskRenderer;
    objc_msgSend(v13, "fallBackDepthData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTARMaskRenderer updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:](arMaskRenderer, "updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:", v6, v9, 4, objc_msgSend(v13, "interfaceOrientation"), 0);

    -[AVTView renderer](self, "renderer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AVTApplyARGrainIfNeeded(v10, v6);

  }
  -[AVTView setCaptureImageIsTooDark:](self, "setCaptureImageIsTooDark:", objc_msgSend(v13, "lowLight"));
  -[AVTView setSensorCovered:](self, "setSensorCovered:", objc_msgSend(v13, "isSensorCovered"));
  faceTrackerDidUpdateBlock = (void (**)(void))self->_faceTrackerDidUpdateBlock;
  if (faceTrackerDidUpdateBlock)
  {
    faceTrackerDidUpdateBlock[2]();
    v12 = self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = 0;

  }
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
    objc_msgSend(v8, "avatarView:faceTrackingSessionFailedWithError:", self, v9);

  }
}

- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4
{
  AVTViewFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    objc_msgSend(v8, "avatarViewFaceTrackingSessionInterruptionDidBegin:", self);

  }
  -[AVTView _delayedTrackingLoss](self, "_delayedTrackingLoss");
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  AVTViewFaceTrackingDelegate **p_faceTrackingDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    objc_msgSend(v8, "avatarViewFaceTrackingSessionInterruptionDidEnd:", self);

  }
  -[AVTView _cancelDelayedtrackingLoss](self, "_cancelDelayedtrackingLoss");
}

- (id)arSession
{
  return -[AVTFaceTracker arSession](self->_faceTracker, "arSession");
}

- (id)faceTracker
{
  return self->_faceTracker;
}

- (void)setFaceTracker:(id)a3
{
  AVTFaceTracker *v4;
  AVTFaceTracker *faceTracker;
  AVTFaceTracker *v6;

  v4 = (AVTFaceTracker *)a3;
  -[AVTFaceTracker removeDelegate:](self->_faceTracker, "removeDelegate:", self);
  faceTracker = self->_faceTracker;
  self->_faceTracker = v4;
  v6 = v4;

  -[AVTFaceTracker addDelegate:](self->_faceTracker, "addDelegate:", self);
}

- (BOOL)faceIsTracked
{
  return self->_faceIsTracked;
}

- (void)setFaceIsTracked:(BOOL)a3
{
  _BOOL8 v3;
  AVTARMaskRenderer *arMaskRenderer;
  double v6;
  id WeakRetained;
  char v8;
  id v9;

  if (self->_faceIsTracked != a3)
  {
    v3 = a3;
    self->_faceIsTracked = a3;
    if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"))
    {
      if (v3)
      {
        arMaskRenderer = self->_arMaskRenderer;
        v6 = 1.0;
      }
      else
      {
        arMaskRenderer = 0;
        v6 = 0.0;
      }
      -[AVTView setAvtRendererTechnique:](self, "setAvtRendererTechnique:", arMaskRenderer);
      -[SCNNode setOpacity:](self->_avatarNode, "setOpacity:", v6);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      objc_msgSend(v9, "avatarView:didUpdateWithFaceTrackingStatus:", self, v3);

    }
  }
}

- (BOOL)faceTrackingIsPaused
{
  return self->_faceTrackingPaused;
}

- (void)setFaceTrackingPaused:(BOOL)a3
{
  if (self->_faceTrackingPaused != a3)
  {
    self->_faceTrackingPaused = a3;
    if (a3)
      -[AVTView setRendersContinuously:](self, "setRendersContinuously:", 0);
    else
      -[AVTAvatarEnvironment setEnablePhysicsSimulation:](self->_environment, "setEnablePhysicsSimulation:", 1);
    -[AVTView updateForChangedFaceTrackingPaused](self, "updateForChangedFaceTrackingPaused");
  }
}

- (void)updateForChangedFaceTrackingPaused
{
  BOOL v3;
  AVTFaceTracker *faceTracker;

  v3 = -[AVTView faceTrackingIsPaused](self, "faceTrackingIsPaused");
  faceTracker = self->_faceTracker;
  if (v3)
    -[AVTFaceTracker pauseByPausingARSession](faceTracker, "pauseByPausingARSession");
  else
    -[AVTFaceTracker run](faceTracker, "run");
}

- (id)faceTrackingDelegate
{
  return objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
}

- (void)setFaceTrackingDelegate:(id)a3
{
  AVTViewFaceTrackingDelegate **p_faceTrackingDelegate;
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
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_captureImageIsTooDark != a3)
  {
    v3 = a3;
    self->_captureImageIsTooDark = a3;
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1DD1FA000, v5, OS_LOG_TYPE_DEFAULT, "lowLight status changed: %d", (uint8_t *)v9, 8u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      objc_msgSend(v8, "avatarView:didUpdateWithLowLightStatus:", self, v3);

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
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_isSensorCovered != a3)
  {
    v3 = a3;
    self->_isSensorCovered = a3;
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1DD1FA000, v5, OS_LOG_TYPE_DEFAULT, "sensorCovered status changed: %d", (uint8_t *)v9, 8u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      objc_msgSend(v8, "avatarView:didUpdateWithSensorOcclusionStatus:", self, v3);

    }
  }
}

- (BOOL)enableFaceTracking
{
  return self->_enableFaceTracking;
}

- (void)setEnableFaceTracking:(BOOL)a3
{
  -[AVTView setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:](self, "setEnableFaceTracking:bySkippingARFramesInsteadOfStopping:", a3, 0);
}

- (void)setEnableFaceTracking:(BOOL)a3 bySkippingARFramesInsteadOfStopping:(BOOL)a4
{
  _BOOL8 v4;
  AVTFaceTracker *faceTracker;
  uint64_t v7;

  if (self->_enableFaceTracking != a3)
  {
    v4 = a3;
    faceTracker = self->_faceTracker;
    if (a3)
    {
      -[AVTFaceTracker run](faceTracker, "run", a3, a4);
      if (-[AVTView enableReticle](self, "enableReticle"))
      {
        v7 = -[AVTView faceIsTracked](self, "faceIsTracked") ^ 1;
LABEL_9:
        -[AVTAvatarEnvironment setShowReticle:](self->_environment, "setShowReticle:", v7);
        self->_enableFaceTracking = v4;
        -[AVTView setRendersContinuously:](self, "setRendersContinuously:", v4);
        return;
      }
    }
    else if (a4)
    {
      -[AVTFaceTracker pauseBySkippingARFrames](faceTracker, "pauseBySkippingARFrames");
    }
    else
    {
      -[AVTFaceTracker stop](faceTracker, "stop");
    }
    v7 = 0;
    goto LABEL_9;
  }
}

- (BOOL)directRetargetingMode
{
  return self->_directRetargetingMode;
}

- (void)setDirectRetargetingMode:(BOOL)a3
{
  self->_directRetargetingMode = a3;
}

- (BOOL)faceIsFullyActive
{
  void *v2;
  char v3;

  -[AVTView environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceIsFullyVisible");

  return v3;
}

- (void)_resetFaceToRandomPosition
{
  id v2;

  -[AVTView avatar](self, "avatar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetFaceToRandomPosition");

}

- (id)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  AVTPresentationConfiguration *v5;
  AVTPresentationConfiguration **p_presentationConfiguration;
  uint64_t v7;
  __CFString **v8;
  void *v9;
  void *v10;
  SCNCaptureDeviceOutputConsumer *arCaptureDeviceOutputConsumer;
  void *v12;
  void *v13;
  AVTARMaskRenderer *arMaskRenderer;
  AVTARMaskRenderer *v15;
  AVTARMaskRenderer *v16;
  AVTARMaskRenderer *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;

  v5 = (AVTPresentationConfiguration *)a3;
  p_presentationConfiguration = &self->_presentationConfiguration;
  if (self->_presentationConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    v7 = -[AVTPresentationConfiguration usesAR](*p_presentationConfiguration, "usesAR");
    v8 = &AVTFramingModeAR;
    if (!(_DWORD)v7)
      v8 = AVTFramingModeCamera;
    -[AVTView setFramingMode:](self, "setFramingMode:", *v8);
    -[AVTView renderer](self, "renderer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AVTSetARCompositingEnabled(v9, v7);

    if ((_DWORD)v7)
    {
      objc_msgSend(MEMORY[0x1E0CD59C8], "captureDeviceOutputConsumer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)&self->_arCaptureDeviceOutputConsumer, v10);
    if ((_DWORD)v7)

    arCaptureDeviceOutputConsumer = self->_arCaptureDeviceOutputConsumer;
    -[AVTView scene](self, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContents:", arCaptureDeviceOutputConsumer);

    -[AVTFaceTracker setShouldConstrainHeadPose:](self->_faceTracker, "setShouldConstrainHeadPose:", v7 ^ 1);
    -[AVTFaceTracker setWantsPersonSegmentation:](self->_faceTracker, "setWantsPersonSegmentation:", v7);
    -[AVTAvatarEnvironment avatarDidChange:presentationConfiguration:](self->_environment, "avatarDidChange:presentationConfiguration:", self->_avatar, *p_presentationConfiguration);
    -[AVTAvatar setPresentationConfiguration:](self->_avatar, "setPresentationConfiguration:", *p_presentationConfiguration);
    arMaskRenderer = self->_arMaskRenderer;
    if (((v7 ^ 1) & 1) != 0)
    {
      self->_arMaskRenderer = 0;

    }
    else
    {
      if (arMaskRenderer)
      {
        -[AVTARMaskRenderer setPresentationConfiguration:](arMaskRenderer, "setPresentationConfiguration:", v5);
      }
      else
      {
        objc_initWeak(&location, self);
        v15 = [AVTARMaskRenderer alloc];
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __40__AVTView_setPresentationConfiguration___block_invoke;
        v21 = &unk_1EA61F6A0;
        objc_copyWeak(&v22, &location);
        v16 = -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:](v15, "initWithOwner:presentationConfiguration:techniqueDidChangeHandler:", self, v5, &v18);
        v17 = self->_arMaskRenderer;
        self->_arMaskRenderer = v16;

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      -[AVTARMaskRenderer setClearWithCamera:antialiasingMode:](self->_arMaskRenderer, "setClearWithCamera:antialiasingMode:", 1, -[AVTView antialiasingMode](self, "antialiasingMode", v18, v19, v20, v21));
    }
    -[AVTView _updatePhysicsWorldForAvatarARScaleAndARMode:](self, "_updatePhysicsWorldForAvatarARScaleAndARMode:", v7);
    -[AVTView updateForMultiAvatarPositioningStyle](self, "updateForMultiAvatarPositioningStyle");
  }

}

void __40__AVTView_setPresentationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "faceIsTracked"))
      v5 = v6;
    else
      v5 = 0;
    objc_msgSend(v4, "setAvtRendererTechnique:", v5);
  }

}

- (id)framingMode
{
  return -[AVTAvatarEnvironment framingMode](self->_environment, "framingMode");
}

- (void)setFramingMode:(id)a3
{
  -[AVTAvatarEnvironment setFramingMode:](self->_environment, "setFramingMode:", a3);
}

- (void)setFramingMode:(id)a3 animationDuration:(double)a4
{
  -[AVTAvatarEnvironment setFramingMode:animationDuration:](self->_environment, "setFramingMode:animationDuration:", a3, a4);
}

- (id)snapshotWithSize:(CGSize)a3
{
  double v3;

  LODWORD(v3) = 2.0;
  return -[AVTView snapshotWithSize:scaleFactor:](self, "snapshotWithSize:scaleFactor:", a3.width, a3.height, v3);
}

- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4
{
  return -[AVTView snapshotWithSize:scaleFactor:options:](self, "snapshotWithSize:scaleFactor:options:", MEMORY[0x1E0C9AA70], a3.width, a3.height);
}

- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4 options:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[AVTView scene](self, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    kdebug_trace();
    -[AVTAvatarEnvironment willSnapshot](self->_environment, "willSnapshot");
    -[AVTView lockAvatar](self, "lockAvatar");
    objc_msgSend(MEMORY[0x1E0CD5A08], "rendererWithDevice:options:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTView scene](self, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScene:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v13);

    -[AVTView sceneTime](self, "sceneTime");
    objc_msgSend(v11, "setSceneTime:");
    objc_msgSend(v9, "valueForKey:", CFSTR("AVTViewSnapshotDisableSuperSamplingFactorKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) == 0)
      objc_msgSend(v11, "set_superSamplingFactor:", 1.5);
    -[AVTView _resourceManagerMonitor](self, "_resourceManagerMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set_resourceManagerMonitor:", v16);

    -[AVTView _commandBufferStatusMonitor](self, "_commandBufferStatusMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set_commandBufferStatusMonitor:", v17);

    objc_msgSend(v11, "_allowGPUBackgroundExecution");
    objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    objc_msgSend(MEMORY[0x1E0CD5A38], "lock");
    objc_msgSend(v11, "snapshotAtTime:withSize:antialiasingMode:", 2, CACurrentMediaTime(), width * a4, height * a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a4 != 1.0)
    {
      v20 = (void *)MEMORY[0x1E0CEA638];
      v21 = objc_retainAutorelease(v18);
      objc_msgSend(v20, "imageWithCGImage:scale:orientation:", objc_msgSend(v21, "CGImage"), 0, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[AVTAvatarEnvironment didSnapshot](self->_environment, "didSnapshot");
    objc_msgSend(MEMORY[0x1E0CD5A38], "unlock");
    -[AVTView unlockAvatar](self, "unlockAvatar");
    kdebug_trace();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double lastFaceTrackerUpdateTimestamp;
  _QWORD v18[5];
  id v19[4];
  id location;

  v7 = a3;
  v8 = a4;
  -[SCNNode scene](self->_avatarNode, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    if (self->_packetNeedRecording)
    {
      objc_msgSend(v7, "currentRenderCommandEncoder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commandBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTFaceTracker arFrameTimestamp](self->_faceTracker, "arFrameTimestamp");
      v14 = v13;
      -[AVTFaceTracker arDelegateTimestamp](self->_faceTracker, "arDelegateTimestamp");
      v16 = v15;
      self->_packetNeedRecording = 0;
      lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __44__AVTView__renderer_willRenderScene_atTime___block_invoke;
      v18[3] = &unk_1EA61F6C8;
      v19[1] = *(id *)&lastFaceTrackerUpdateTimestamp;
      objc_copyWeak(v19, &location);
      v19[2] = v14;
      v19[3] = v16;
      v18[4] = self;
      objc_msgSend(v12, "addCompletedHandler:", v18);
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);

    }
    else
    {
      ++self->_droppedFrameCount;
    }
  }

}

void __44__AVTView__renderer_willRenderScene_atTime___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  double v9;

  kdebug_trace();
  kdebug_trace();
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(double *)(a1 + 64);
    v4 = v3 - *(double *)(a1 + 56);
    v5 = *(double *)(*(_QWORD *)(a1 + 32) + 768) - v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6 - *(double *)(*(_QWORD *)(a1 + 32) + 768);
    *(double *)&v8 = v4;
    *((double *)&v8 + 1) = v5;
    v9 = v7;
    PerfTimesPush(WeakRetained + 184, &v8);
  }

}

- (double)currentlyRenderedTrackingDate
{
  return self->_lastFaceTrackerUpdateTimestamp;
}

- (BOOL)showPerfHUD
{
  return self->_showPerfHUD;
}

- (void)setShowPerfHUD:(BOOL)a3
{
  NSTimer **p_perfTimeRefreshTimer;
  id WeakRetained;
  void *v6;
  AVTHUDView *v7;
  AVTHUDView *debugView;

  self->_showPerfHUD = a3;
  p_perfTimeRefreshTimer = &self->_perfTimeRefreshTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_perfTimeRefreshTimer);
  objc_msgSend(WeakRetained, "invalidate");

  if (self->_showPerfHUD)
  {
    SCNSetShaderCollectionEnabled();
    SCNSetPerformanceStatisticsEnabled();
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__refreshPerfTimesInfo, 0, 1, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_perfTimeRefreshTimer, v6);

    if (!self->_debugView)
    {
      v7 = -[AVTHUDView initWithFrame:]([AVTHUDView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      debugView = self->_debugView;
      self->_debugView = v7;

      -[AVTView addSubview:](self, "addSubview:", self->_debugView);
    }
  }
  -[AVTHUDView setHidden:](self->_debugView, "setHidden:", !self->_showPerfHUD);
  SCNSetPerformanceStatisticsEnabled();
}

- (void)_refreshPerfTimesInfo
{
  $B7FC74333F04356157F81CB09A619D06 *p_perfTimes;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int droppedFrameCount;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  AVTHUDView *debugView;
  _QWORD v20[5];
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  __int16 v26;
  char v27;
  int v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[28];

  p_perfTimes = &self->_perfTimes;
  v4 = PerfTimesAverageLatency((uint64_t)&self->_perfTimes);
  v5 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 0);
  v6 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 1);
  v7 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 2);
  v34 = 0u;
  memset(v35, 0, sizeof(v35));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  SCNGetPerformanceStatistics();
  -[AVTView currentAudioTime](self, "currentAudioTime");
  v9 = v8;
  -[AVTFaceTracker arFrameDeltaTime](self->_faceTracker, "arFrameDeltaTime");
  v11 = v10;
  droppedFrameCount = self->_droppedFrameCount;
  v13 = -[AVTView isDoubleBuffered](self, "isDoubleBuffered");
  SCNGetShaderCollectionOutputURL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  debugView = self->_debugView;
  *(double *)v20 = v4;
  *(double *)&v20[1] = v5;
  *(double *)&v20[2] = v6;
  *(double *)&v20[3] = v7;
  v20[4] = v11;
  v21 = 0;
  v22 = 0;
  v23 = v9;
  v24 = droppedFrameCount;
  v25 = v13;
  v26 = 0;
  v27 = 0;
  v28 = v18;
  v29 = 0;
  -[AVTHUDView updateWithData:](debugView, "updateWithData:", v20);

}

- (BOOL)isDoubleBuffered
{
  return 0;
}

- (double)currentAudioTime
{
  return 0.0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  -[AVTView layoutSubviews](&v3, sel_layoutSubviews);
  if (-[AVTView showPerfHUD](self, "showPerfHUD"))
  {
    -[AVTView bounds](self, "bounds");
    -[AVTHUDView setFrame:](self->_debugView, "setFrame:", 0.0, 0.0);
  }
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

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  SCNNode *avatarNode;
  id v7;
  void *v8;
  void *v9;

  avatarNode = self->_avatarNode;
  v7 = a3;
  -[SCNNode scene](avatarNode, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    -[AVTView updateAtTime:](self, "updateAtTime:", a4);
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
      block[2] = __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke;
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

void __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke(uint64_t a1)
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
    v21[2] = __65__AVTView_renderer_didFallbackToDefaultTextureForSource_message___block_invoke;
    v21[3] = &unk_1EA61F6F0;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    -[AVTView crashAppExtensionOrViewService_rdar98130076:](self, "crashAppExtensionOrViewService_rdar98130076:", v21);

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
      *(_QWORD *)&buf[4] = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
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
    *(_QWORD *)&buf[4] = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
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
  v26 = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
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

void __65__AVTView_renderer_didFallbackToDefaultTextureForSource_message___block_invoke(_QWORD *a1)
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
    *(_QWORD *)((char *)buf + 4) = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]_block_invoke";
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
    v25[2] = __54__AVTView_renderer_commandBufferDidCompleteWithError___block_invoke;
    v25[3] = &unk_1EA61F6F0;
    v26 = v6;
    v27 = v7;
    v28 = v8;
    -[AVTView crashAppExtensionOrViewService_rdar98130076:](self, "crashAppExtensionOrViewService_rdar98130076:", v25);

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
        *(_QWORD *)&buf[4] = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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
    *(_QWORD *)&buf[4] = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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
  v30 = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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

void __54__AVTView_renderer_commandBufferDidCompleteWithError___block_invoke(uint64_t a1)
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
    *(_QWORD *)((char *)buf + 4) = "-[AVTView renderer:commandBufferDidCompleteWithError:]_block_invoke";
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

- (BOOL)rendersContinuously
{
  return self->_avtRendersContinuously;
}

- (void)setRendersContinuously:(BOOL)a3
{
  self->_avtRendersContinuously = a3;
  -[AVTView _avtUpdateRendersContinuously](self, "_avtUpdateRendersContinuously");
}

- (void)_avtUpdateRendersContinuously
{
  _BOOL8 v2;
  objc_super v3;

  v2 = self->_avtRendersContinuously || self->_avtRendererTechnique != 0;
  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  -[AVTView setRendersContinuously:](&v3, sel_setRendersContinuously_, v2);
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
        v9.super_class = (Class)AVTView,
        -[AVTView technique](&v9, sel_technique),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v6))
  {
    objc_storeStrong((id *)&self->_avtRendererTechnique, a3);
    v8.receiver = self;
    v8.super_class = (Class)AVTView;
    -[AVTView setTechnique:](&v8, sel_setTechnique_, v6);
  }

}

- (id)technique
{
  void *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTView;
  -[AVTView technique](&v6, sel_technique);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_perfTimeRefreshTimer);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
  objc_storeStrong((id *)&self->_avtRendererTechnique, 0);
  objc_storeStrong((id *)&self->_arMaskRenderer, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_arCaptureDeviceOutputConsumer, 0);
  objc_storeStrong(&self->_faceTrackerDidUpdateBlock, 0);
  objc_destroyWeak((id *)&self->_faceTrackingDelegate);
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)arMode
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTView arMode]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)setArMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTView setArMode:]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_transitionToFaceTrackingWithDuration:(uint64_t)a3 style:enableBakedAnimations:completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_faceTrackerDidUpdateBlock == nil";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. A previously registered callback won't be executed because it will be overwritten", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_renderer:(os_log_t)log didBuildSubdivDataForHash:dataProvider:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Error while writing subdiv data (data provider returned nil)", v1, 2u);
}

void __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a2, v4, "Error: Error while writing subdiv data: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

- (void)technique
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a2, v4, "Error: Unreachable code: %@ is not supported on AVTView", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

@end
