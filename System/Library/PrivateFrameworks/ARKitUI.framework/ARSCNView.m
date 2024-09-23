@implementation ARSCNView

- (ARSCNView)initWithFrame:(CGRect)a3
{
  ARSCNView *v3;
  ARSCNView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  v3 = -[ARSCNView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ARSCNView _commonInit](v3, "_commonInit");
  return v4;
}

- (ARSCNView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  ARSCNView *v12;
  ARSCNView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v11, "removeObjectForKey:", *MEMORY[0x1E0CD5B68]);

  }
  else
  {
    v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)ARSCNView;
  v12 = -[ARSCNView initWithFrame:options:](&v15, sel_initWithFrame_options_, v11, x, y, width, height);
  v13 = v12;
  if (v12)
    -[ARSCNView _commonInit](v12, "_commonInit");

  return v13;
}

- (ARSCNView)initWithCoder:(id)a3
{
  id v4;
  ARSCNView *v5;
  ARSCNView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARSCNView;
  v5 = -[ARSCNView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[ARSCNView _commonInit](v5, "_commonInit");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("automaticallyUpdatesLighting")))
      v6->_automaticallyUpdatesLighting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticallyUpdatesLighting"));
  }

  return v6;
}

- (id)compositor
{
  return self->_compositor;
}

- (ARFrame)currentRenderFrame
{
  return -[ARSession currentFrame](self->_session, "currentFrame");
}

- (void)_commonInit
{
  SCNNode *lightNode;
  NSMutableArray *v4;
  NSMutableArray *environmentProbeNodes;
  NSMutableArray *v6;
  NSMutableArray *environmentProbeNodesToRemove;
  SCNNode *v8;
  SCNNode *cameraNode;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *addedAnchors;
  NSMutableArray *v15;
  NSMutableArray *updatedAnchors;
  NSMutableArray *v17;
  NSMutableArray *removedAnchors;
  OS_dispatch_semaphore *v19;
  OS_dispatch_semaphore *anchorsSemaphore;
  NSMutableDictionary *v21;
  NSMutableDictionary *nodesByAnchorIdentifier;
  NSMutableDictionary *v23;
  NSMutableDictionary *occlusionGeometryNodesByAnchorIdentifier;
  OS_dispatch_semaphore *v25;
  OS_dispatch_semaphore *nodesSemaphore;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  double v30;
  CIWarpKernel *warpKernel;
  void *v32;
  uint64_t v33;
  char rendersMotionBlur;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  id v54;

  self->_lastFrameTimestamp = 0.0;
  lightNode = self->_lightNode;
  self->_lightNode = 0;

  v4 = (NSMutableArray *)objc_opt_new();
  environmentProbeNodes = self->_environmentProbeNodes;
  self->_environmentProbeNodes = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  environmentProbeNodesToRemove = self->_environmentProbeNodesToRemove;
  self->_environmentProbeNodesToRemove = v6;

  objc_msgSend(MEMORY[0x1E0CD59D0], "node");
  v8 = (SCNNode *)objc_claimAutoreleasedReturnValue();
  cameraNode = self->_cameraNode;
  self->_cameraNode = v8;

  objc_msgSend(MEMORY[0x1E0CD5960], "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNNode setCamera:](self->_cameraNode, "setCamera:", v10);

  -[SCNNode camera](self->_cameraNode, "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setZNear:", 0.00100000005);

  -[SCNNode camera](self->_cameraNode, "camera");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setZFar:", 1000.0);

  self->_drawsCameraImage = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  addedAnchors = self->_addedAnchors;
  self->_addedAnchors = v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  updatedAnchors = self->_updatedAnchors;
  self->_updatedAnchors = v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  removedAnchors = self->_removedAnchors;
  self->_removedAnchors = v17;

  v19 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  anchorsSemaphore = self->_anchorsSemaphore;
  self->_anchorsSemaphore = v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  self->_nodesByAnchorIdentifier = v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  self->_occlusionGeometryNodesByAnchorIdentifier = v23;

  v25 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  nodesSemaphore = self->_nodesSemaphore;
  self->_nodesSemaphore = v25;

  self->_arDebugOptions = 0;
  -[ARSCNView bounds](self, "bounds");
  self->_viewportSize.width = v27;
  self->_viewportSize.height = v28;
  -[ARSCNView layer](self, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentsScale");
  self->_contentsScale = v30;

  self->_automaticallyUpdatesLighting = 1;
  self->_providesOcclusionGeometry = 0;
  self->_automaticallyOccludesVirtualContent = 0;
  self->_segmentationUseEstimatedDepthData = 0;
  self->_compositorAlgorithm = 0;
  warpKernel = self->_warpKernel;
  self->_warpKernel = 0;

  self->_occlusionLock._os_unfair_lock_opaque = 0;
  self->_attemptRenderSynchronisationARFrame = objc_msgSend(MEMORY[0x1E0CF2120], "BOOLForKey:", *MEMORY[0x1E0CF2090]);
  self->_renderRawSceneUnderstandingImage = objc_msgSend(MEMORY[0x1E0CF2120], "BOOLForKey:", *MEMORY[0x1E0CF2098]);
  self->_anchorUpdatesPerRendererUpdate = 1;
  -[ARSession replaySensor](self->_session, "replaySensor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "replayMode");

  if (v33)
    self->_attemptRenderSynchronisationARFrame = 0;
  if ((ARLinkedOnOrAfterYukon() & 1) != 0)
  {
    self->_rendersCameraGrain = objc_msgSend(MEMORY[0x1E0CF2120], "BOOLForKey:", *MEMORY[0x1E0CF20A0]);
    rendersMotionBlur = objc_msgSend(MEMORY[0x1E0CF2120], "BOOLForKey:", *MEMORY[0x1E0CF20A8]);
    self->_rendersMotionBlur = rendersMotionBlur;
  }
  else
  {
    rendersMotionBlur = self->_rendersMotionBlur;
  }
  self->_lastRendersMotionBlur = rendersMotionBlur;
  v35 = (_OWORD *)MEMORY[0x1E0C83FF0];
  v36 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  *(_OWORD *)&self->_anon_360[32] = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  *(_OWORD *)&self->_anon_360[48] = v36;
  v37 = v35[1];
  *(_OWORD *)self->_anon_360 = *v35;
  *(_OWORD *)&self->_anon_360[16] = v37;
  objc_msgSend(MEMORY[0x1E0CD5A10], "scene");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[ARSCNView setScene:](self, "setScene:");
  if (ARDeviceRequiresFrameTrendControllerWorkaround())
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView setBackgroundColor:](self, "setBackgroundColor:", v38);

  self->_developerPreferredFramesPerSecond = -1;
  objc_msgSend(MEMORY[0x1E0CF21A8], "supportedVideoFormats");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_alloc(MEMORY[0x1E0CF20C8]);
  objc_msgSend(v40, "deviceFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  ARIntrinsicsFromDeviceFormat();
  v52 = v44;
  v53 = v43;
  v51 = v45;
  objc_msgSend(v40, "imageResolution");
  v48 = (void *)objc_msgSend(v41, "initWithIntrinsics:imageResolution:", v53, v52, v51, v46, v47);

  -[ARSCNView _updateCamera:](self, "_updateCamera:", v48);
  objc_msgSend(MEMORY[0x1E0CF2188], "setRenderType:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView renderer](self, "renderer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "removeObserver:name:object:", v50, *MEMORY[0x1E0CEB280], 0);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARSCNView;
  v4 = a3;
  -[ARSCNView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_automaticallyUpdatesLighting, CFSTR("automaticallyUpdatesLighting"), v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  double contentsScale;
  void *v14;
  ARSCNCompositor *compositor;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  ARSCNView *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ARSCNView;
  -[ARSCNView layoutSubviews](&v16, sel_layoutSubviews);
  -[ARSCNView bounds](self, "bounds");
  self->_viewportSize.width = v3;
  self->_viewportSize.height = v4;
  -[ARSCNView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsScale");
  self->_contentsScale = v6;

  -[ARSCNView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_interfaceOrientation = objc_msgSend(v8, "interfaceOrientation");

  _ARLogGeneral_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSCNView bounds](self, "bounds");
    NSStringFromCGRect(v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    contentsScale = self->_contentsScale;
    NSStringFromUIInterfaceOrientation(self->_interfaceOrientation);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v18 = v11;
    v19 = 2048;
    v20 = self;
    v21 = 2114;
    v22 = v12;
    v23 = 2048;
    v24 = contentsScale;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Layout changed to %{public}@, %.2fx, %{public}@", buf, 0x34u);

  }
  -[ARSCNView _forceUpdateCamera](self, "_forceUpdateCamera");
  compositor = self->_compositor;
  if (compositor)
  {
    -[ARSCNCompositor setCurrentOrientation:](compositor, "setCurrentOrientation:", self->_interfaceOrientation);
    -[ARSCNCompositor setCurrentSize:](self->_compositor, "setCurrentSize:", self->_viewportSize.width, self->_viewportSize.height);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGRect v14;

  -[ARSCNView frame](self, "frame");
  NSStringFromCGRect(v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView sceneTime](self, "sceneTime");
  v10 = v9;
  -[ARSCNView pointOfView](self, "pointOfView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p | session=%p scene=%@ sceneTime=%f frame=%@ pointOfView=%@>"), v6, self, v7, v8, v10, v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (ARSession)session
{
  ARSCNView *v2;
  ARSession *session;
  uint64_t v4;
  ARSession *v5;
  ARSession *v6;

  v2 = self;
  objc_sync_enter(v2);
  session = v2->_session;
  if (!session)
  {
    v4 = objc_opt_new();
    v5 = v2->_session;
    v2->_session = (ARSession *)v4;

    -[ARSession _addObserver:](v2->_session, "_addObserver:", v2);
    session = v2->_session;
  }
  v6 = session;
  objc_sync_exit(v2);

  return v6;
}

- (void)setSession:(ARSession *)session
{
  ARSCNView *v5;
  id *p_session;
  ARSession *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  ARSession *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  ARSession *v17;

  v17 = session;
  v5 = self;
  objc_sync_enter(v5);
  p_session = (id *)&v5->_session;
  v7 = v5->_session;
  if (v7 != v17)
  {
    -[ARSession _removeObserver:](v7, "_removeObserver:", v5);
    -[ARSCNView currentRenderFrame](v5, "currentRenderFrame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *p_session;
      objc_msgSend(v8, "anchors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView session:didRemoveAnchors:](v5, "session:didRemoveAnchors:", v10, v11);

      objc_storeStrong((id *)&v5->_session, session);
      objc_msgSend(v9, "anchors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView session:didAddAnchors:](v5, "session:didAddAnchors:", v17, v12);
    }
    else
    {
      v13 = v17;
      v12 = *p_session;
      *p_session = v13;
    }

    objc_msgSend(*p_session, "_addObserver:", v5);
    -[ARSCNView session:didChangeState:](v5, "session:didChangeState:", *p_session, objc_msgSend(*p_session, "state"));
    objc_msgSend(*p_session, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "frameSemantics") & 3;
    if (v15)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(*p_session, "configuration");
      p_session = (id *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(p_session, "frameSemantics") & 1;
    }
    -[ARSCNView setRunningWithSegmentation:](v5, "setRunningWithSegmentation:", v16);
    if (!v15)

  }
  objc_sync_exit(v5);

}

- (void)setAutomaticallyUpdatesLighting:(BOOL)automaticallyUpdatesLighting
{
  SCNNode *lightNode;
  SCNNode *v5;

  self->_automaticallyUpdatesLighting = automaticallyUpdatesLighting;
  if (!automaticallyUpdatesLighting)
  {
    lightNode = self->_lightNode;
    if (lightNode)
    {
      -[SCNNode removeFromParentNode](lightNode, "removeFromParentNode");
      v5 = self->_lightNode;
      self->_lightNode = 0;

    }
  }
}

- (void)setRunningWithSegmentation:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__ARSCNView_setRunningWithSegmentation___block_invoke;
  v3[3] = &unk_1EA586AD0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __40__ARSCNView_setRunningWithSegmentation___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 936) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_updateOcclusionCompositor");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
}

- (BOOL)runningWithSegmentation
{
  ARSCNView *v2;
  os_unfair_lock_s *p_occlusionLock;

  v2 = self;
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  LOBYTE(v2) = v2->_runningWithSegmentation;
  os_unfair_lock_unlock(p_occlusionLock);
  return (char)v2;
}

- (void)setAutomaticallyOccludesVirtualContent:(BOOL)a3
{
  os_unfair_lock_s *p_occlusionLock;

  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_automaticallyOccludesVirtualContent = a3;
  -[ARSCNView _updateOcclusionCompositor](self, "_updateOcclusionCompositor");
  os_unfair_lock_unlock(p_occlusionLock);
}

- (void)setSegmentationUseEstimatedDepthData:(BOOL)a3
{
  os_unfair_lock_s *p_occlusionLock;

  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_segmentationUseEstimatedDepthData = a3;
  -[ARSCNView _updateOcclusionCompositor](self, "_updateOcclusionCompositor");
  os_unfair_lock_unlock(p_occlusionLock);
}

- (BOOL)automaticallyOccludesVirtualContent
{
  ARSCNView *v2;
  os_unfair_lock_s *p_occlusionLock;

  v2 = self;
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  LOBYTE(v2) = v2->_automaticallyOccludesVirtualContent;
  os_unfair_lock_unlock(p_occlusionLock);
  return (char)v2;
}

- (void)setOcclusionExcludedBitMask:(unint64_t)a3
{
  os_unfair_lock_s *p_occlusionLock;

  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_occlusionExcludedBitMask = a3;
  -[ARSCNView _updateOcclusionCompositor](self, "_updateOcclusionCompositor");
  os_unfair_lock_unlock(p_occlusionLock);
}

- (unint64_t)occlusionExcludedBitMask
{
  os_unfair_lock_s *p_occlusionLock;
  unint64_t occlusionExcludedBitMask;

  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  occlusionExcludedBitMask = self->_occlusionExcludedBitMask;
  os_unfair_lock_unlock(p_occlusionLock);
  return occlusionExcludedBitMask;
}

- (void)setProvidesOcclusionGeometry:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_occlusionLock;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_providesOcclusionGeometry = v3;
  -[ARSCNView _updateOcclusionCompositor](self, "_updateOcclusionCompositor");
  os_unfair_lock_unlock(p_occlusionLock);
  if (v3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v6, "anchors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            -[ARSCNView _addOcclusionGeometryForAnchor:](self, "_addOcclusionGeometryForAnchor:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v9);
      }

    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);

  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allValues](self->_occlusionGeometryNodesByAnchorIdentifier, "allValues", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "removeFromParentNode");
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[NSMutableDictionary removeAllObjects](self->_occlusionGeometryNodesByAnchorIdentifier, "removeAllObjects");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  }
}

- (ARAnchor)anchorForNode:(SCNNode *)node
{
  NSObject *nodesSemaphore;
  SCNNode *v5;
  void *v6;
  void *v7;

  nodesSemaphore = self->_nodesSemaphore;
  v5 = node;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView _anchorForNode:inFrame:](self, "_anchorForNode:inFrame:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  return (ARAnchor *)v7;
}

- (SCNNode)nodeForAnchor:(ARAnchor *)anchor
{
  NSObject *nodesSemaphore;
  ARAnchor *v5;
  NSMutableDictionary *nodesByAnchorIdentifier;
  void *v7;
  void *v8;

  nodesSemaphore = self->_nodesSemaphore;
  v5 = anchor;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  -[ARAnchor identifier](v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](nodesByAnchorIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  return (SCNNode *)v8;
}

- (id)occlusionGeometryNodeForAnchor:(id)a3
{
  NSObject *nodesSemaphore;
  id v5;
  NSMutableDictionary *occlusionGeometryNodesByAnchorIdentifier;
  void *v7;
  void *v8;

  nodesSemaphore = self->_nodesSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](occlusionGeometryNodesByAnchorIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  return v8;
}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  double y;
  double x;
  void *v8;
  void *v9;

  y = point.y;
  x = point.x;
  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView _hitTest:frame:types:](self, "_hitTest:frame:types:", v8, types, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  simd_float3 v10;
  double v12;
  double v13;
  double v14;
  double v15;
  simd_float3 v16;

  v14 = *(double *)planeTransform.columns[2].i64;
  v15 = *(double *)planeTransform.columns[3].i64;
  v12 = *(double *)planeTransform.columns[0].i64;
  v13 = *(double *)planeTransform.columns[1].i64;
  y = point.y;
  x = point.x;
  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "camera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", self->_interfaceOrientation, x, y, v12, v13, v14, v15, self->_viewportSize.width, self->_viewportSize.height);
    v16 = v10;

  }
  else
  {
    v16 = 0u;
  }

  return v16;
}

- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  double y;
  double x;
  void *v10;
  void *v11;
  CGSize *p_viewportSize;
  double height;
  int64_t interfaceOrientation;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;

  y = point.y;
  x = point.x;
  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    p_viewportSize = &self->_viewportSize;
    height = self->_viewportSize.height;
    v21 = x / self->_viewportSize.width;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    interfaceOrientation = self->_interfaceOrientation;
    v20 = y / height;
    objc_msgSend(v10, "camera");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageResolution");
    ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v22, p_viewportSize->width, p_viewportSize->height, v16, v17);

    objc_msgSend(v11, "raycastQueryFromPoint:allowingTarget:alignment:", target, alignment, vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v20), v22, v21)));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return (ARRaycastQuery *)v18;
}

- (void)setScene:(SCNScene *)scene
{
  SCNScene *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  v4 = scene;
  -[ARSCNView setScene:](&v6, sel_setScene_, v4);
  -[SCNScene rootNode](v4, "rootNode", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addChildNode:", self->_cameraNode);
  -[ARSCNView setPointOfView:](self, "setPointOfView:", self->_cameraNode);
}

- (void)setPointOfView:(id)a3
{
  SCNNode *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  SCNCaptureDeviceOutputConsumer *v8;
  SCNCaptureDeviceOutputConsumer *captureDeviceOutputConsumer;
  void *v10;
  void *v11;
  void *v12;
  id originalBackgroundContents;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ARSCNView;
  v4 = (SCNNode *)a3;
  -[ARSCNView setPointOfView:](&v17, sel_setPointOfView_, v4);
  v5 = self->_cameraNode == v4;

  -[ARSCNView setDrawsCameraImage:](self, "setDrawsCameraImage:", v5, v17.receiver, v17.super_class);
  LODWORD(v4) = -[ARSCNView drawsCameraImage](self, "drawsCameraImage");
  -[ARSCNView scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "background");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contents");
  v8 = (SCNCaptureDeviceOutputConsumer *)objc_claimAutoreleasedReturnValue();
  captureDeviceOutputConsumer = self->_captureDeviceOutputConsumer;

  if ((_DWORD)v4)
  {
    if (v8 == captureDeviceOutputConsumer)
      return;
    -[ARSCNView scene](self, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "background");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    originalBackgroundContents = self->_originalBackgroundContents;
    self->_originalBackgroundContents = v12;

    v14 = self->_captureDeviceOutputConsumer;
  }
  else
  {
    if (v8 != captureDeviceOutputConsumer)
      return;
    v14 = self->_originalBackgroundContents;
  }
  -[ARSCNView scene](self, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "background");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContents:", v14);

}

- (void)setDebugOptions:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  objc_super v5;

  v3 = 0xFFFFFFFF80000000;
  if (!(a3 >> 31))
    v3 = 0;
  v4 = v3 | a3 & 0x60000000;
  self->_arDebugOptions = v4;
  v5.receiver = self;
  v5.super_class = (Class)ARSCNView;
  -[ARSCNView setDebugOptions:](&v5, sel_setDebugOptions_, a3 & ~v4);
}

- (unint64_t)debugOptions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  return self->_arDebugOptions | -[ARSCNView debugOptions](&v3, sel_debugOptions);
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  -[ARSCNView setDeveloperPreferredFramesPerSecond:](self, "setDeveloperPreferredFramesPerSecond:", a3);
  -[ARSCNView _updatePreferredFramesPerSecond](self, "_updatePreferredFramesPerSecond");
}

- (int64_t)preferredFramesPerSecond
{
  int64_t result;
  objc_super v4;

  result = self->_developerPreferredFramesPerSecond;
  if (result < 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)ARSCNView;
    return -[ARSCNView preferredFramesPerSecond](&v4, sel_preferredFramesPerSecond);
  }
  return result;
}

- (void)setDelegate:(id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  -[ARSCNView setDelegate:](&v3, sel_setDelegate_, delegate);
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  uint64_t v5;
  void *v6;
  unsigned int v7;
  double v8;
  unsigned int v9;
  void *v10;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  SCNCaptureDeviceOutputConsumer *v21;
  SCNCaptureDeviceOutputConsumer *captureDeviceOutputConsumer;
  void *v23;
  void *v24;
  void *v25;
  SCNCaptureDeviceOutputConsumer *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SCNCaptureDeviceOutputConsumer *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t anchorUpdatesPerRendererUpdate;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  float v62;
  float v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  float v69;
  double v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  __CVBuffer *v76;
  _QWORD block[5];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  ARSCNView *v81;
  __int16 v82;
  unsigned int v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (!self->_renderThreadFixed)
  {
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, -4);
    pthread_set_fixedpriority_self();
    self->_renderThreadFixed = 1;
  }
  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_attemptRenderSynchronisationARFrame && v5)
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "timestamp");
      if (v8 != self->_lastFrameTimestamp)
        break;
      usleep(0x1F4u);
      v9 = v7 + 1;
      -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "timestamp");
      kdebug_trace();
      if (v10)
      {
        v6 = v10;
        if (v7++ < 4)
          continue;
      }
      goto LABEL_12;
    }
    v10 = v6;
    v9 = v7;
    if (!v7)
      goto LABEL_15;
LABEL_12:
    _ARLogGeneral_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v79 = v14;
      v80 = 2048;
      v81 = self;
      v82 = 1024;
      v83 = v9;
      _os_log_impl(&dword_1DCC73000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missed frame and retried to find a matching using %d attempts.", buf, 0x1Cu);

    }
    v6 = v10;
  }
LABEL_15:
  if (!self->_renderRawSceneUnderstandingImage
    || (objc_msgSend(v6, "rawSceneUnderstandingData"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "capturedImage"),
        v15,
        v16))
  {
    if (!v6 || (objc_msgSend(v6, "timestamp"), v17 == self->_lastFrameTimestamp))
    {
      kdebug_trace();
LABEL_60:
      kdebug_trace();
      goto LABEL_61;
    }
    objc_msgSend(v6, "timestamp");
    objc_msgSend(v6, "captureDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceNow");
    kdebug_trace();

    objc_msgSend(v6, "timestamp");
    self->_lastFrameInterval = v19 - self->_lastFrameTimestamp;
    objc_msgSend(v6, "timestamp");
    self->_lastFrameTimestamp = v20;
    if (-[ARSCNView drawsCameraImageAndNilPresentation](self, "drawsCameraImageAndNilPresentation"))
    {
      if (!self->_captureDeviceOutputConsumer)
      {
        objc_msgSend(MEMORY[0x1E0CD59C8], "captureDeviceOutputConsumer");
        v21 = (SCNCaptureDeviceOutputConsumer *)objc_claimAutoreleasedReturnValue();
        captureDeviceOutputConsumer = self->_captureDeviceOutputConsumer;
        self->_captureDeviceOutputConsumer = v21;

        -[ARSCNView scene](self, "scene");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "background");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v26 = self->_captureDeviceOutputConsumer;
          -[ARSCNView scene](self, "scene");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "background");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setContents:", v26);

        }
      }
    }
    -[ARSCNView scene](self, "scene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "background");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contents");
    v31 = (SCNCaptureDeviceOutputConsumer *)objc_claimAutoreleasedReturnValue();
    if (v31 == self->_captureDeviceOutputConsumer && objc_msgSend(v6, "capturedImage"))
    {
      v34 = -[ARSCNView rotationSnapshotState](self, "rotationSnapshotState");

      if (v34 == 1)
        goto LABEL_26;
      objc_msgSend(v6, "camera");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "lensType") == 1)
      {

LABEL_63:
        v74 = objc_msgSend(v6, "capturedImage");
        objc_msgSend(v6, "camera");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = -[ARSCNView _warpPixelBuffer:withCamera:](self, "_warpPixelBuffer:withCamera:", v74, v75);

        -[ARSCNView _renderCapturedPixelBuffer:](self, "_renderCapturedPixelBuffer:", v76);
        CVPixelBufferRelease(v76);
        goto LABEL_26;
      }
      objc_msgSend(v6, "camera");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "lensType");

      if (v73 == 2)
        goto LABEL_63;
      if (!self->_renderRawSceneUnderstandingImage)
      {
        -[ARSCNView _renderCapturedPixelBuffer:](self, "_renderCapturedPixelBuffer:", objc_msgSend(v6, "capturedImage"));
        goto LABEL_26;
      }
      objc_msgSend(v6, "rawSceneUnderstandingData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView _renderCapturedPixelBuffer:](self, "_renderCapturedPixelBuffer:", objc_msgSend(v29, "capturedImage"));
    }
    else
    {

    }
LABEL_26:
    if (self->_renderRawSceneUnderstandingImage)
    {
      objc_msgSend(v6, "rawSceneUnderstandingData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "wideCamera");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView _updateCamera:](self, "_updateCamera:", v33);

    }
    else
    {
      objc_msgSend(v6, "camera");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView _updateCamera:](self, "_updateCamera:", v32);
    }

    -[ARSCNView _updateProbesWithFrame:](self, "_updateProbesWithFrame:", v6);
    if (self->_rendersMotionBlur)
    {
      objc_msgSend(v6, "camera");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "exposureDuration");
      v38 = v37 / self->_lastFrameInterval;
      -[SCNNode camera](self->_cameraNode, "camera");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setMotionBlurIntensity:", v38);

    }
    else if (self->_lastRendersMotionBlur)
    {
      -[SCNNode camera](self->_cameraNode, "camera");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setMotionBlurIntensity:", 0.0);

    }
    self->_lastRendersMotionBlur = self->_rendersMotionBlur;
    if (-[ARSCNView automaticallyUpdatesLighting](self, "automaticallyUpdatesLighting"))
    {
      objc_msgSend(v6, "lightEstimate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSCNView _updateLighting:](self, "_updateLighting:", v41);

    }
    if (-[ARSCNView rotationSnapshotState](self, "rotationSnapshotState") == 2
      && (-[ARSCNView frameToRemoveRotationSnapshotOn](self, "frameToRemoveRotationSnapshotOn") & 0x8000000000000000) == 0)
    {
      if (!-[ARSCNView frameToRemoveRotationSnapshotOn](self, "frameToRemoveRotationSnapshotOn"))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __36__ARSCNView__renderer_updateAtTime___block_invoke;
        block[3] = &unk_1EA586888;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      -[ARSCNView setFrameToRemoveRotationSnapshotOn:](self, "setFrameToRemoveRotationSnapshotOn:", -[ARSCNView frameToRemoveRotationSnapshotOn](self, "frameToRemoveRotationSnapshotOn") - 1);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v42 = (void *)-[NSMutableArray copy](self->_addedAnchors, "copy");
    -[NSMutableArray removeAllObjects](self->_addedAnchors, "removeAllObjects");
    v43 = (void *)-[NSMutableArray copy](self->_removedAnchors, "copy");
    -[NSMutableArray removeAllObjects](self->_removedAnchors, "removeAllObjects");
    if (-[ARSCNView graduallyUpdateAnchors](self, "graduallyUpdateAnchors")
      && -[NSMutableArray count](self->_updatedAnchors, "count"))
    {
      v44 = -[NSMutableArray count](self->_updatedAnchors, "count");
      if (v44 >= self->_anchorUpdatesPerRendererUpdate)
        anchorUpdatesPerRendererUpdate = self->_anchorUpdatesPerRendererUpdate;
      else
        anchorUpdatesPerRendererUpdate = v44;
      -[NSMutableArray subarrayWithRange:](self->_updatedAnchors, "subarrayWithRange:", 0, anchorUpdatesPerRendererUpdate);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_updatedAnchors, "removeObjectsInRange:", 0, anchorUpdatesPerRendererUpdate);
    }
    else
    {
      v46 = (void *)-[NSMutableArray copy](self->_updatedAnchors, "copy");
      -[NSMutableArray removeAllObjects](self->_updatedAnchors, "removeAllObjects");
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
    -[ARSCNView _removeAnchors:](self, "_removeAnchors:", v43);
    -[ARSCNView _addAnchors:](self, "_addAnchors:", v42);
    -[ARSCNView _updateAnchors:frame:](self, "_updateAnchors:frame:", v46, v6);
    -[ARSCNView _updateDebugVisualization:](self, "_updateDebugVisualization:", v6);
    if (self->_compositor && -[ARSCNView rotationSnapshotState](self, "rotationSnapshotState") != 1)
      -[ARSCNCompositor setCurrentFrame:](self->_compositor, "setCurrentFrame:", v6);
    if (!self->_rendersCameraGrain || (objc_msgSend(v6, "cameraGrainIntensity"), v47 == 0.0))
    {
      -[SCNNode camera](self->_cameraNode, "camera");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setGrainIntensity:", 0.0);
    }
    else
    {
      -[SCNNode camera](self->_cameraNode, "camera");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setGrainIntensity:", 0.82);

      -[ARSCNView renderer](self, "renderer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "currentRenderPassDescriptor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "colorAttachments");
      v51 = v46;
      v52 = v43;
      v53 = v42;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "texture");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v53;
      v43 = v52;
      v46 = v51;

      objc_msgSend(v6, "camera");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "imageResolution");
      v59 = v58;
      v61 = v60;

      *(float *)&v59 = v59;
      v62 = fmax((double)(unint64_t)objc_msgSend(v56, "width"), (double)(unint64_t)objc_msgSend(v56, "height"));
      v63 = fmin((double)(unint64_t)objc_msgSend(v56, "width"), (double)(unint64_t)objc_msgSend(v56, "height"));
      *(float *)&v61 = v61;
      v64 = fmaxf(v62 / *(float *)&v59, v63 / *(float *)&v61);
      -[SCNNode camera](self->_cameraNode, "camera");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setGrainScale:", v64);

      -[SCNNode camera](self->_cameraNode, "camera");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setGrainIsColored:", 1);

      objc_msgSend(v6, "cameraGrainTexture");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCNNode camera](self->_cameraNode, "camera");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setGrainTexture:", v67);

      objc_msgSend(v6, "cameraGrainIntensity");
      v70 = v69;
      -[SCNNode camera](self->_cameraNode, "camera");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setGrainSlice:", v70);

    }
    objc_msgSend(v6, "timestamp");
    kdebug_trace();

    goto LABEL_60;
  }
LABEL_61:

}

void __36__ARSCNView__renderer_updateAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRotationSnapshotState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 792);
  *(_QWORD *)(v2 + 792) = 0;

  _ARLogGeneral_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1DCC73000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Removing rotation snapshot", (uint8_t *)&v8, 0x16u);

  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "renderFramesPerSecond");
  v7 = objc_msgSend(v5, "shouldRestrictFrameRate");

  -[ARSCNView _updateFramesPerSecondWithTarget:shouldRestrictFrameRate:](self, "_updateFramesPerSecondWithTarget:shouldRestrictFrameRate:", v6, v7);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  ARSCNView *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_session == a3)
  {
    _ARLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = "NO";
      v12 = 138543874;
      v13 = v8;
      if (a4 == 1)
        v9 = "YES";
      v14 = 2048;
      v15 = self;
      v16 = 2082;
      v17 = v9;
      _os_log_impl(&dword_1DCC73000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting playing state to %{public}s", (uint8_t *)&v12, 0x20u);

    }
    v10 = a4 == 1;

    -[ARSCNView set_wantsSceneRendererDelegationMessages:](self, "set_wantsSceneRendererDelegationMessages:", v10);
    -[ARSCNView setPlaying:](self, "setPlaying:", v10);
    -[ARSCNView renderer](self, "renderer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set_enableARMode:", 1);

  }
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  NSObject *anchorsSemaphore;
  id v6;

  anchorsSemaphore = self->_anchorsSemaphore;
  v6 = a4;
  dispatch_semaphore_wait(anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray removeObjectsInArray:](self->_removedAnchors, "removeObjectsInArray:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_addedAnchors, "addObjectsFromArray:", v6);
  -[NSMutableArray removeObjectsInArray:](self->_updatedAnchors, "removeObjectsInArray:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_updatedAnchors, "addObjectsFromArray:", v6);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  uint64_t v5;
  unint64_t anchorUpdatesPerRendererUpdate;
  uint64_t v7;
  unint64_t v8;
  id v9;

  v9 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (-[ARSCNView graduallyUpdateAnchors](self, "graduallyUpdateAnchors"))
  {
    v5 = -[NSMutableArray count](self->_updatedAnchors, "count");
    anchorUpdatesPerRendererUpdate = self->_anchorUpdatesPerRendererUpdate;
    if (v5)
    {
      v7 = -[NSMutableArray count](self->_updatedAnchors, "count");
      v8 = objc_msgSend(v9, "count") + v7;
      if (anchorUpdatesPerRendererUpdate + 1 < v8)
        v8 = anchorUpdatesPerRendererUpdate + 1;
      goto LABEL_8;
    }
    if (anchorUpdatesPerRendererUpdate >= 2)
    {
      v8 = anchorUpdatesPerRendererUpdate - 1;
LABEL_8:
      self->_anchorUpdatesPerRendererUpdate = v8;
    }
  }
  -[NSMutableArray removeObjectsInArray:](self->_updatedAnchors, "removeObjectsInArray:", v9);
  -[NSMutableArray addObjectsFromArray:](self->_updatedAnchors, "addObjectsFromArray:", v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);

}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  NSObject *anchorsSemaphore;
  id v6;

  anchorsSemaphore = self->_anchorsSemaphore;
  v6 = a4;
  dispatch_semaphore_wait(anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray removeObjectsInArray:](self->_addedAnchors, "removeObjectsInArray:", v6);
  -[NSMutableArray removeObjectsInArray:](self->_updatedAnchors, "removeObjectsInArray:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_removedAnchors, "addObjectsFromArray:", v6);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ARSCNView_session_didFailWithError___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __38__ARSCNView_session_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ARSCNView_session_cameraDidChangeTrackingState___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __50__ARSCNView_session_cameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:cameraDidChangeTrackingState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__ARSCNView_sessionWasInterrupted___block_invoke;
  v6[3] = &unk_1EA5868F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __35__ARSCNView_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWasInterrupted:", *(_QWORD *)(a1 + 40));
  }

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__ARSCNView_sessionInterruptionEnded___block_invoke;
  v6[3] = &unk_1EA5868F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __38__ARSCNView_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionInterruptionEnded:", *(_QWORD *)(a1 + 40));
  }

}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ARSCNView_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_1EA586948;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__ARSCNView_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, objc_msgSend(v7, "sessionShouldAttemptRelocalization:", *(_QWORD *)(a1 + 40)));
  }

}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  opaqueCMSampleBuffer *v10;

  v6 = a3;
  if (a4)
    CFRetain(a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ARSCNView_session_didOutputAudioSampleBuffer___block_invoke;
  block[3] = &unk_1EA586970;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__ARSCNView_session_didOutputAudioSampleBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  const void *v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "session:didOutputAudioSampleBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

LABEL_6:
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ARSCNView_session_didChangeGeoTrackingStatus___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__ARSCNView_session_didChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:didChangeGeoTrackingStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  if ((objc_msgSend(v6, "frameSemantics") & 3) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v6, "frameSemantics") & 1;
  -[ARSCNView setRunningWithSegmentation:](self, "setRunningWithSegmentation:", v5);
  if ((objc_msgSend(v6, "frameSemantics") & 1) != 0)
  {
    -[ARSCNView setAutomaticallyOccludesVirtualContent:](self, "setAutomaticallyOccludesVirtualContent:", 1);
    -[ARSCNView setSegmentationUseEstimatedDepthData:](self, "setSegmentationUseEstimatedDepthData:", 0);
  }
  if ((~objc_msgSend(v6, "frameSemantics") & 3) == 0)
  {
    -[ARSCNView setAutomaticallyOccludesVirtualContent:](self, "setAutomaticallyOccludesVirtualContent:", 1);
    -[ARSCNView setSegmentationUseEstimatedDepthData:](self, "setSegmentationUseEstimatedDepthData:", 1);
  }

}

- (id)_anchorForNode:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootNode");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allValues](self->_nodesByAnchorIdentifier, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary allValues](self->_occlusionGeometryNodesByAnchorIdentifier, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = v6;
  v15 = v14;
  v16 = 0;
  v17 = v14;
  if (v14 && v9 != v14)
  {
    v18 = v14;
    while ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0)
    {
      objc_msgSend(v18, "parentNode");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      if (v17)
      {
        v18 = v17;
        if (v17 != v9)
          continue;
      }
      goto LABEL_14;
    }
    -[NSMutableDictionary allKeysForObject:](self->_nodesByAnchorIdentifier, "allKeysForObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[NSMutableDictionary allKeysForObject:](self->_occlusionGeometryNodesByAnchorIdentifier, "allKeysForObject:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "anchors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __36__ARSCNView__anchorForNode_inFrame___block_invoke;
    v27[3] = &unk_1EA5868D0;
    v23 = v20;
    v28 = v23;
    v24 = objc_msgSend(v22, "indexOfObjectPassingTest:", v27);

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "anchors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = v18;
  }
LABEL_14:

  return v16;
}

uint64_t __36__ARSCNView__anchorForNode_inFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_hitTest:(CGPoint)a3 frame:(id)a4 types:(unint64_t)a5
{
  CGSize *p_viewportSize;
  double height;
  int64_t interfaceOrientation;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;

  if (!a4)
    return MEMORY[0x1E0C9AA60];
  p_viewportSize = &self->_viewportSize;
  height = self->_viewportSize.height;
  v16 = a3.x / self->_viewportSize.width;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  interfaceOrientation = self->_interfaceOrientation;
  v15 = a3.y / height;
  v9 = a4;
  objc_msgSend(v9, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageResolution");
  ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v17, p_viewportSize->width, p_viewportSize->height, v11, v12);

  objc_msgSend(v9, "hitTest:types:", a5, vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, v15), v17, v16)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_renderCapturedPixelBuffer:(__CVBuffer *)a3
{
  -[SCNCaptureDeviceOutputConsumer setPixelBuffer:](self->_captureDeviceOutputConsumer, "setPixelBuffer:", a3);
}

- (void)_forceUpdateCamera
{
  void *v3;
  void *v4;
  id v5;

  -[ARSCNView currentRenderFrame](self, "currentRenderFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "camera");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSCNView _updateCamera:](self, "_updateCamera:", v4);

    v3 = v5;
  }

}

- (void)_updateCamera:(id)a3
{
  id v4;
  int64_t interfaceOrientation;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  float v16;
  __float2 v17;
  float v26;
  float v27;
  __int128 v28;
  float v29;
  __int128 v33;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  float32x4_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[4];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v4 = a3;
  if (-[ARSCNView rotationSnapshotState](self, "rotationSnapshotState") != 1)
  {
    interfaceOrientation = self->_interfaceOrientation;
    -[SCNNode camera](self->_cameraNode, "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zNear");
    v8 = v7;
    -[SCNNode camera](self->_cameraNode, "camera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zFar");
    objc_msgSend(v4, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", interfaceOrientation, self->_viewportSize.width, self->_viewportSize.height, v8, v10);
    v47 = v12;
    v49 = v11;
    v44 = v14;
    v45 = v13;

    -[SCNNode camera](self->_cameraNode, "camera");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v49;
    v53 = v47;
    v54 = v45;
    v55 = v44;
    objc_msgSend(v15, "setProjectionTransform:", &v52);

    if (objc_msgSend(v4, "trackingState"))
    {
      v16 = (float)ARCameraToDisplayRotation(self->_interfaceOrientation) * 3.14159265 / 180.0;
      v17 = __sincosf_stret(v16 * 0.5);
      _Q0 = vmulq_n_f32((float32x4_t)xmmword_1DCCA10D0, v17.__sinval);
      _S2 = _Q0.i32[1];
      _S4 = _Q0.i32[2];
      __asm { FMLS            S3, S4, V0.S[2] }
      v26 = vmlas_n_f32(vmuls_lane_f32(v17.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
      v27 = vmlas_n_f32(-(float)(v17.__cosval * _Q0.f32[1]), _Q0.f32[2], _Q0.f32[0]);
      HIDWORD(v28) = 0;
      *(float *)&v28 = _S3 + (float)(v17.__cosval * v17.__cosval);
      *((float *)&v28 + 1) = v26 + v26;
      *((float *)&v28 + 2) = v27 + v27;
      v29 = vmlas_n_f32(-(float)(v17.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
      __asm
      {
        FMLA            S5, S2, V0.S[1]
        FMLS            S5, S0, V0.S[0]
        FMLA            S6, S4, V0.S[1]
      }
      HIDWORD(v33) = 0;
      *(float *)&v33 = v29 + v29;
      DWORD1(v33) = _S5;
      *((float *)&v33 + 2) = _S6 + _S6;
      v48 = v33;
      v50 = v28;
      __asm
      {
        FMLA            S7, S0, V0.S[2]
        FMLA            S5, S4, V0.S[1]
        FMLA            S1, S4, V0.S[2]
        FMLS            S1, S0, V0.S[0]
        FMLS            S1, S2, V0.S[1]
      }
      _Q0.f32[0] = _S7 + _S7;
      _Q0.f32[1] = _S5 + _S5;
      _Q0.i64[1] = _S1;
      v46 = _Q0;
      objc_msgSend(v4, "transform");
      v43 = 0;
      v51[0] = v50;
      v51[1] = v48;
      v51[2] = v46;
      v51[3] = xmmword_1DCCA0DE0;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      do
      {
        *(__int128 *)((char *)&v52 + v43 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(v51[v43])), v40, *(float32x2_t *)&v51[v43], 1), v41, (float32x4_t)v51[v43], 2), v42, (float32x4_t)v51[v43], 3);
        ++v43;
      }
      while (v43 != 4);
      -[SCNNode setSimdTransform:](self->_cameraNode, "setSimdTransform:", *(double *)&v52, *(double *)&v53, *(double *)&v54, *(double *)&v55);
    }
  }

}

- (void)_updateLighting:(id)a3
{
  id v4;
  SCNNode *lightNode;
  SCNNode *v6;
  SCNNode *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  if (v4)
  {
    v25 = v4;
    lightNode = self->_lightNode;
    if (!lightNode)
    {
      objc_msgSend(MEMORY[0x1E0CD59D0], "node");
      v6 = (SCNNode *)objc_claimAutoreleasedReturnValue();
      v7 = self->_lightNode;
      self->_lightNode = v6;

      objc_msgSend(MEMORY[0x1E0CD59B8], "light");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCNNode setLight:](self->_lightNode, "setLight:", v8);

      v9 = *MEMORY[0x1E0CD5AE0];
      -[SCNNode light](self->_lightNode, "light");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setType:", v9);

      LODWORD(v11) = 0;
      LODWORD(v12) = 0;
      LODWORD(v13) = 0;
      -[SCNNode setPosition:](self->_lightNode, "setPosition:", v11, v12, v13);
      -[ARSCNView scene](self, "scene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rootNode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addChildNode:", self->_lightNode);

      lightNode = self->_lightNode;
    }
    -[SCNNode light](lightNode, "light");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sphericalHarmonicsCoefficients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set_sphericalHarmonics:", v17);

    -[ARSCNView scene](self, "scene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lightingEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v25;
    if (v20)
    {
      objc_msgSend(v25, "ambientIntensity");
      v22 = v21 / 1000.0;
      -[ARSCNView scene](self, "scene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lightingEnvironment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setIntensity:", v22);

      v4 = v25;
    }
  }

}

- (void)_updateProbesWithFrame:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  double v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "renderFramesPerSecond");
  objc_msgSend(v4, "lightEstimate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v4;
  if (v6)
  {
    objc_msgSend(v4, "lightEstimate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ambientIntensity");
    v9 = v8;

    v10 = v9;
  }
  else
  {
    v10 = 1000.0;
  }

  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v57 = (void *)objc_opt_new();
  v11 = self->_environmentProbeNodes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 1.0 / (double)v5;
    v15 = *(_QWORD *)v64;
    v16 = v14;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v64 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v18, "light");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[ARSCNView anchorForNode:](self, "anchorForNode:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v18, "light");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "probeEnvironment");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              objc_msgSend(v18, "light");
              v24 = v11;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "probeEnvironment");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "intensity");
              v28 = v27;

              v11 = v24;
              if (v28 < 1.0)
              {
                objc_msgSend(v18, "light");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "probeEnvironment");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "intensity");
                objc_msgSend(v30, "setIntensity:", v31 + v16);

              }
              goto LABEL_21;
            }
          }
          else
          {
            objc_msgSend(v18, "valueForKey:", CFSTR("timestamp"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              v33 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v58, "timestamp");
              objc_msgSend(v33, "numberWithDouble:");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setValue:forKey:", v34, CFSTR("timestamp"));

            }
            objc_msgSend(v18, "valueForKey:", CFSTR("timestamp"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "doubleValue");
            v37 = v36;

            objc_msgSend(v18, "light");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "probeEnvironment");
            v38 = objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              v39 = (void *)v38;
              v40 = v37 + 1.0;
              objc_msgSend(v58, "timestamp");
              v42 = v41;

              if (v40 < v42)
              {
                objc_msgSend(v18, "light");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "probeEnvironment");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "intensity");
                objc_msgSend(v44, "setIntensity:", v45 - v16);

                objc_msgSend(v18, "light");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "probeEnvironment");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "intensity");
                v49 = v48;

                if (v49 <= 0.0)
                  objc_msgSend(v57, "addObject:", v18);
              }
              goto LABEL_21;
            }
          }

LABEL_21:
          if (-[ARSCNView automaticallyUpdatesLighting](self, "automaticallyUpdatesLighting"))
          {
            objc_msgSend(v18, "light");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setIntensity:", v10);

          }
          continue;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v13);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v51 = v57;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v60 != v54)
          objc_enumerationMutation(v51);
        v56 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
        -[NSMutableArray removeObject:](self->_environmentProbeNodes, "removeObject:", v56);
        -[NSMutableArray addObject:](self->_environmentProbeNodesToRemove, "addObject:", v56);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v53);
  }

}

- (void)_addAnchors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  unint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v35 = 672;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      v9 = 0x1F03B5000uLL;
      do
      {
        v10 = 0;
        v37 = v7;
        do
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
          v12 = *(int *)(v9 + 1216);
          v13 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
          objc_msgSend(v11, "identifier", v35);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            -[ARSCNView delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_respondsToSelector();

            if ((v17 & 1) != 0)
            {
              kdebug_trace();
              -[ARSCNView delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "renderer:nodeForAnchor:", self, v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              kdebug_trace();
              if (!v15)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_15;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CD59D0], "node");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[ARSCNView scene](self, "scene");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "rootNode");
            v20 = v8;
            v21 = v5;
            v22 = v9;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addChildNode:", v15);

            v24 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
            objc_msgSend(v11, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v24;
            v9 = v22;
            v5 = v21;
            v8 = v20;
            v7 = v37;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, v25);

          }
          if (-[ARSCNView providesOcclusionGeometry](self, "providesOcclusionGeometry"))
            -[ARSCNView _addOcclusionGeometryForAnchor:](self, "_addOcclusionGeometryForAnchor:", v11);
LABEL_15:
          objc_msgSend(v5, "addObject:", v15);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v7);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.super.super.super.isa + v35));
    -[ARSCNView delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0 && objc_msgSend(v5, "count"))
    {
      v29 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v29, v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        if ((v32 & 1) == 0)
        {
          kdebug_trace();
          -[ARSCNView delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "objectAtIndexedSubscript:", v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "renderer:didAddNode:forAnchor:", self, v30, v34);

          kdebug_trace();
        }

        ++v29;
      }
      while (v29 < objc_msgSend(v5, "count"));
    }

    v4 = v36;
  }

}

- (void)_updateAnchors:(id)a3 frame:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *nodesByAnchorIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *occlusionGeometryNodesByAnchorIdentifier;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v24 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](nodesByAnchorIdentifier, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[ARSCNView providesOcclusionGeometry](self, "providesOcclusionGeometry"))
        {
          occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](occlusionGeometryNodesByAnchorIdentifier, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            goto LABEL_12;
        }
        else
        {
          v16 = 0;
          if (!v13)
            goto LABEL_12;
        }
        -[ARSCNView delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        if ((v18 & 1) != 0)
        {
          kdebug_trace();
          -[ARSCNView delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "renderer:willUpdateNode:forAnchor:", self, v13, v10);

          kdebug_trace();
        }
LABEL_12:
        if (v16)
        {
          objc_msgSend(v16, "setCategoryBitMask:", objc_msgSend(v16, "categoryBitMask") | 0x40000000);
          objc_msgSend(v10, "transform");
          objc_msgSend(v16, "setSimdTransform:");
        }
        if (v13)
        {
          -[ARSCNView _updateNode:forAnchor:frame:](self, "_updateNode:forAnchor:frame:", v13, v10, v24);
          -[ARSCNView delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_opt_respondsToSelector();

          if ((v21 & 1) != 0)
          {
            kdebug_trace();
            -[ARSCNView delegate](self, "delegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "renderer:didUpdateNode:forAnchor:", self, v13, v10);

            kdebug_trace();
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

}

- (void)_updateNode:(id)a3 forAnchor:(id)a4 frame:(id)a5
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
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  _BOOL8 v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  uint64_t v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "environmentTexture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "light");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "probeEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "environmentTexture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "light");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "probeEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && v12 != v13)
      {
        objc_msgSend(v7, "clone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARSCNView scene](self, "scene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "rootNode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addChildNode:", v17);

        -[NSMutableArray addObject:](self->_environmentProbeNodes, "addObject:", v17);
      }
      if (v12 != v13)
      {
        v20 = v8;
        v21 = (void *)objc_opt_new();
        objc_msgSend(v21, "setType:", *MEMORY[0x1E0CD5AE0]);
        objc_msgSend(v21, "setProbeType:", 1);
        objc_msgSend(v7, "setLight:", v21);
        if ((-[NSMutableArray containsObject:](self->_environmentProbeNodes, "containsObject:", v7) & 1) == 0)
          -[NSMutableArray addObject:](self->_environmentProbeNodes, "addObject:", v7);
        objc_msgSend(v20, "extent");
        if (fabsf(v22) == INFINITY || (objc_msgSend(v20, "extent"), fabsf(v23) == INFINITY))
        {
          v25 = 0;
        }
        else
        {
          objc_msgSend(v20, "extent");
          v25 = fabsf(v24) != INFINITY;
        }
        objc_msgSend(v7, "light");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setParallaxCorrectionEnabled:", v25);

        objc_msgSend(v20, "extent");
        v43 = v27;
        objc_msgSend(v7, "light");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setProbeExtents:", v43);

        objc_msgSend(v7, "light");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setParallaxCenterOffset:", -0.000000381469818);

        objc_msgSend(v7, "light");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setParallaxExtentsFactor:", *(double *)vdupq_n_s32(0x3FA66666u).i64);

        objc_msgSend(v20, "environmentTexture");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "light");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "probeEnvironment");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setContents:", v31);

        objc_msgSend(v7, "light");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "probeEnvironment");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setIntensity:", 0.0);

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v36 = self->_environmentProbeNodesToRemove;
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v45 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "removeFromParentNode");
            }
            v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v38);
        }

        -[NSMutableArray removeAllObjects](self->_environmentProbeNodesToRemove, "removeAllObjects");
      }
    }
  }
  objc_msgSend(v8, "transform");
  objc_msgSend(v7, "setSimdTransform:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v8;
      if (objc_msgSend(v41, "isDetectionOnly"))
        v42 = objc_msgSend(v7, "isHidden");
      else
        v42 = objc_msgSend(v41, "isTracked") ^ 1;
      objc_msgSend(v7, "setHidden:", v42);

    }
    else
    {
      objc_msgSend(v7, "setHidden:", objc_msgSend(v8, "isTracked") ^ 1);
    }
  }

}

- (void)_removeAnchors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *occlusionGeometryNodesByAnchorIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *nodesByAnchorIdentifier;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  unint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (-[ARSCNView providesOcclusionGeometry](self, "providesOcclusionGeometry"))
          {
            occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
            objc_msgSend(v10, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](occlusionGeometryNodesByAnchorIdentifier, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v13, "removeFromParentNode");
              v14 = self->_occlusionGeometryNodesByAnchorIdentifier;
              objc_msgSend(v10, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

            }
          }
          nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
          objc_msgSend(v10, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](nodesByAnchorIdentifier, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (-[NSMutableArray containsObject:](self->_environmentProbeNodes, "containsObject:", v18) & 1) == 0)
            {
              objc_msgSend(v18, "removeFromParentNode");
            }
            v19 = self->_nodesByAnchorIdentifier;
            objc_msgSend(v10, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

            objc_msgSend(v5, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v21);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v7);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
    -[ARSCNView delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0 && objc_msgSend(v5, "count"))
    {
      v24 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if ((v27 & 1) == 0)
        {
          kdebug_trace();
          -[ARSCNView delegate](self, "delegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "objectAtIndexedSubscript:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "renderer:didRemoveNode:forAnchor:", self, v25, v29);

          kdebug_trace();
        }

        ++v24;
      }
      while (v24 < objc_msgSend(v5, "count"));
    }

    v4 = v30;
  }

}

- (void)_addOcclusionGeometryForAnchor:(id)a3
{
  id v4;
  NSMutableDictionary *occlusionGeometryNodesByAnchorIdentifier;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v4 = a3;
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  v15 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](occlusionGeometryNodesByAnchorIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[ARSCNView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      kdebug_trace();
      -[ARSCNView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "renderer:occlusionGeometryNodeForAnchor:", self, v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      kdebug_trace();
      if (!v7)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD59D0], "node");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ARSCNView scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rootNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addChildNode:", v7);

    v13 = self->_occlusionGeometryNodesByAnchorIdentifier;
    objc_msgSend(v15, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v7, v14);

  }
LABEL_7:

}

- (void)_updateDebugVisualization:(id)a3
{
  SCNNode *worldOriginNode;
  SCNNode *v5;
  SCNNode *v6;
  void *v7;
  void *v8;
  SCNNode *featurePointNode;
  void *currentlyVisibleDebugPointerCloud;
  void *v11;
  SCNNode *v12;
  SCNNode *v13;
  ARPointCloud *v14;
  ARPointCloud *v15;
  void *v16;
  void *v17;
  ARPointCloud *v18;
  ARPointCloud *v19;
  void *v20;
  void *v21;
  ARSCNCompositor *compositor;
  int v23;
  unint64_t v24;
  id v25;

  v25 = a3;
  worldOriginNode = self->_worldOriginNode;
  if (self->_arDebugOptions >> 31)
  {
    if (!worldOriginNode)
    {
      +[ARSCNVisualizationHelper createAxesNode:](ARSCNVisualizationHelper, "createAxesNode:", 0.200000003);
      v5 = (SCNNode *)objc_claimAutoreleasedReturnValue();
      v6 = self->_worldOriginNode;
      self->_worldOriginNode = v5;

      -[SCNNode setCastsShadow:](self->_worldOriginNode, "setCastsShadow:", 0);
    }
    -[ARSCNView scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addChildNode:", self->_worldOriginNode);

  }
  else
  {
    -[SCNNode removeFromParentNode](worldOriginNode, "removeFromParentNode");
  }
  featurePointNode = self->_featurePointNode;
  if ((self->_arDebugOptions & 0x40000000) == 0)
  {
    -[SCNNode removeFromParentNode](featurePointNode, "removeFromParentNode");
    currentlyVisibleDebugPointerCloud = self->_currentlyVisibleDebugPointerCloud;
    self->_currentlyVisibleDebugPointerCloud = 0;
LABEL_14:

    goto LABEL_15;
  }
  v11 = v25;
  if (!featurePointNode)
  {
    v12 = (SCNNode *)objc_opt_new();
    v13 = self->_featurePointNode;
    self->_featurePointNode = v12;

    -[SCNNode setCastsShadow:](self->_featurePointNode, "setCastsShadow:", 0);
    v11 = v25;
  }
  v14 = self->_currentlyVisibleDebugPointerCloud;
  objc_msgSend(v11, "featurePoints");
  v15 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    objc_msgSend(v25, "featurePoints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARSCNVisualizationHelper createGeometryForPointCloud:](ARSCNVisualizationHelper, "createGeometryForPointCloud:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode setGeometry:](self->_featurePointNode, "setGeometry:", v17);

    objc_msgSend(v25, "featurePoints");
    v18 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();
    v19 = self->_currentlyVisibleDebugPointerCloud;
    self->_currentlyVisibleDebugPointerCloud = v18;

  }
  -[SCNNode parentNode](self->_featurePointNode, "parentNode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    -[ARSCNView scene](self, "scene");
    currentlyVisibleDebugPointerCloud = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(currentlyVisibleDebugPointerCloud, "rootNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addChildNode:", self->_featurePointNode);

    goto LABEL_14;
  }
LABEL_15:
  compositor = self->_compositor;
  if (compositor)
  {
    v23 = -[ARSCNCompositor showOcclusionGeometry](compositor, "showOcclusionGeometry");
    v24 = self->_arDebugOptions & 0x20000000;
    if (v24 != v23)
      -[ARSCNCompositor setShowOcclusionGeometry:](self->_compositor, "setShowOcclusionGeometry:", v24 != 0);
  }

}

- (void)_updateOcclusionCompositor
{
  void *v3;
  int v4;
  ARSCNCompositor *compositor;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  ARSCNCompositor *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  ARSCNCompositor *v16;
  ARSCNCompositor *v17;
  int v18;
  void *v19;
  __int16 v20;
  ARSCNView *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ARSession configuration](self->_session, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableOcclusionForPersonSegmentation");

  if (v4)
    goto LABEL_2;
  v6 = self->_compositorAlgorithm == 1;
  -[ARSession configuration](self->_session, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ~objc_msgSend(v7, "frameSemantics") & 3;

  if (v8)
  {
    -[ARSession configuration](self->_session, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "frameSemantics");

    if ((v11 & 1) == 0)
    {
LABEL_2:
      compositor = self->_compositor;
      self->_compositor = 0;

      return;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (-[ARSCNCompositor compositorAlgorithm](self->_compositor, "compositorAlgorithm") != v6
    || v9 != -[ARSCNCompositor mode](self->_compositor, "mode"))
  {
    v12 = self->_compositor;
    self->_compositor = 0;

  }
  if (!self->_compositor)
  {
    _ARLogGeneral_2();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = v9;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_1DCC73000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting up ARSCNCompositor (%li, %li)", (uint8_t *)&v18, 0x2Au);

    }
    v16 = -[ARSCNCompositor initWithView:mode:algorithm:]([ARSCNCompositor alloc], "initWithView:mode:algorithm:", self, v9, v6);
    v17 = self->_compositor;
    self->_compositor = v16;

  }
}

- (void)setCompositorAlgorithm:(int64_t)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARSCNView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__ARSCNView_setCompositorAlgorithm___block_invoke;
  v7[3] = &unk_1EA586A00;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  _ARLogGeneral_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1DCC73000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Called set algorithm", buf, 0x16u);

  }
}

void __36__ARSCNView_setCompositorAlgorithm___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 960) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_updateOcclusionCompositor");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
}

- (void)setActualPreferredFramesPerSecond:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  -[ARSCNView setPreferredFramesPerSecond:](&v3, sel_setPreferredFramesPerSecond_, a3);
}

- (int64_t)actualPreferredFramesPerSecond
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  return -[ARSCNView preferredFramesPerSecond](&v3, sel_preferredFramesPerSecond);
}

- (void)_updateFramesPerSecondWithTarget:(int64_t)a3 shouldRestrictFrameRate:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[ARSCNView setTargetFramesPerSecond:](self, "setTargetFramesPerSecond:", a3);
  -[ARSCNView setShouldRestrictFrameRate:](self, "setShouldRestrictFrameRate:", v4);
  -[ARSCNView _updatePreferredFramesPerSecond](self, "_updatePreferredFramesPerSecond");
}

- (void)_updatePreferredFramesPerSecond
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  if (-[ARSCNView developerPreferredFramesPerSecond](self, "developerPreferredFramesPerSecond") < 0
    || -[ARSCNView shouldRestrictFrameRate](self, "shouldRestrictFrameRate"))
  {
    v3 = -[ARSCNView targetFramesPerSecond](self, "targetFramesPerSecond");
  }
  else
  {
    v3 = -[ARSCNView developerPreferredFramesPerSecond](self, "developerPreferredFramesPerSecond");
  }
  v4 = v3;
  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  if (v3 != (void *)-[ARSCNView preferredFramesPerSecond](&v6, sel_preferredFramesPerSecond))
  {
    v5.receiver = self;
    v5.super_class = (Class)ARSCNView;
    -[ARSCNView setPreferredFramesPerSecond:](&v5, sel_setPreferredFramesPerSecond_, v4);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARSCNView;
  -[ARSCNView didMoveToWindow](&v11, sel_didMoveToWindow);
  if (didMoveToWindow_onceToken != -1)
    dispatch_once(&didMoveToWindow_onceToken, &__block_literal_global_11);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CEBE58];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE58], 0);
  v5 = *MEMORY[0x1E0CEBE50];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE50], 0);
  v6 = *MEMORY[0x1E0CEBE18];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE18], 0);
  -[ARSCNView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ARSCNView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_windowWillRotateNotification_, v4, v8);

    -[ARSCNView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_windowWillAnimateRotateNotification_, v5, v9);

    -[ARSCNView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_windowDidRotateNotification_, v6, v10);

  }
  else
  {
    -[ARSCNView cleanupLingeringRotationState](self, "cleanupLingeringRotationState");
  }

}

void __28__ARSCNView_didMoveToWindow__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  int v5;
  void *v6;

  _alwaysRotateCounterclockwise = 0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    _alwaysRotateCounterclockwise = 1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("UIRequiresFullScreen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v6;
    if (v6)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v3 = v6;
      if ((isKindOfClass & 1) != 0)
      {
        v5 = objc_msgSend(v6, "BOOLValue");
        v3 = v6;
        if (v5)
          _alwaysRotateCounterclockwise = 0;
      }
    }

  }
}

- (void)windowWillRotateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  UIView *v13;
  UIView *rotationSnapshot;
  void *v15;
  int64_t interfaceOrientation;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  CGAffineTransform v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  ARSCNView *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    kdebug_trace();
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CEBE38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self->_lastInterfaceOrientation = self->_interfaceOrientation;
    self->_interfaceOrientation = objc_msgSend(v9, "integerValue");
    -[ARSCNView transform](self, "transform");
    if (CGAffineTransformIsIdentity(&v20))
    {
      _ARLogGeneral_2();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        v23 = 2048;
        v24 = self;
        _os_log_impl(&dword_1DCC73000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSCNViewRotationSnapshotStateSettingUp", buf, 0x16u);

      }
      -[ARSCNView setRotationSnapshotState:](self, "setRotationSnapshotState:", 1);
      -[ARSCNView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
      v13 = (UIView *)objc_claimAutoreleasedReturnValue();
      rotationSnapshot = self->_rotationSnapshot;
      self->_rotationSnapshot = v13;

      -[UIView setAutoresizingMask:](self->_rotationSnapshot, "setAutoresizingMask:", 45);
      -[UIView setUserInteractionEnabled:](self->_rotationSnapshot, "setUserInteractionEnabled:", 0);
      -[ARSCNView bounds](self, "bounds");
      -[UIView setFrame:](self->_rotationSnapshot, "setFrame:");
      -[ARSCNView addSubview:](self, "addSubview:", self->_rotationSnapshot);
      v18[4] = self;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __42__ARSCNView_windowWillRotateNotification___block_invoke;
      v19[3] = &unk_1EA586888;
      v19[4] = self;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __42__ARSCNView_windowWillRotateNotification___block_invoke_2;
      v18[3] = &unk_1EA586B18;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 50332162, v19, v18, 0.02, 0.0);
    }
    else
    {
      -[ARSCNView renderer](self, "renderer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setInterfaceOrientation:", self->_interfaceOrientation);

      interfaceOrientation = self->_interfaceOrientation;
      -[ARSCNView compositor](self, "compositor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCurrentOrientation:", interfaceOrientation);

    }
    kdebug_trace();

  }
}

uint64_t __42__ARSCNView_windowWillRotateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "setAlpha:", 0.99);
}

uint64_t __42__ARSCNView_windowWillRotateNotification___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_1DCC73000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSCNViewRotationSnapshotStateSetUp", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setRotationSnapshotState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_forceUpdateCamera");
  objc_msgSend(*(id *)(a1 + 32), "_updateBackingSize");
  objc_msgSend(*(id *)(a1 + 32), "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setInterfaceOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752));

  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[94];
  objc_msgSend(v7, "compositor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentOrientation:", v8);

  return objc_msgSend(*(id *)(a1 + 32), "setFrameToRemoveRotationSnapshotOn:", 0);
}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[7];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    kdebug_trace();
    v7 = ARCameraToDisplayRotation(self->_lastInterfaceOrientation);
    v8 = ARCameraToDisplayRotation(self->_interfaceOrientation);
    if (self->_rotationSnapshot)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke;
      v13[3] = &unk_1EA586B40;
      v13[5] = v8;
      v13[6] = v7;
      v13[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
      v10 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowRotationDuration");
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke_2;
      v12[3] = &unk_1EA586888;
      v12[4] = self;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v12, 0);

    }
    kdebug_trace();
  }
}

uint64_t __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke(_QWORD *a1)
{
  double v2;
  double v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v2 = (double)(uint64_t)(a1[5] - a1[6]) * 3.14159265 / 180.0;
  if (v2 > 3.14159253 && v2 < 3.14159277 || v2 > -3.14159277 && v2 < -3.14159253)
  {
    v3 = 1.0;
    if (_alwaysRotateCounterclockwise == 1)
    {
      v4 = *(_QWORD *)(a1[4] + 760);
      v5 = v4 == 4 || v4 == 1;
      v3 = -1.0;
      if (v5)
        v3 = 1.0;
    }
    v2 = v2 + v3 * 0.000000238418579;
  }
  CGAffineTransformMakeRotation(&v12, -v2);
  v6 = (void *)a1[4];
  v11 = v12;
  objc_msgSend(v6, "setTransform:", &v11);
  CGAffineTransformMakeRotation(&v10, v2);
  v7 = *(void **)(a1[4] + 792);
  v9 = v10;
  return objc_msgSend(v7, "setTransform:", &v9);
}

uint64_t __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)windowDidRotateNotification:(id)a3
{
  void *v4;
  UIView *rotationSnapshot;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ARSCNView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v4))
  {
    rotationSnapshot = self->_rotationSnapshot;

    if (rotationSnapshot)
      -[ARSCNView cleanupLingeringRotationState](self, "cleanupLingeringRotationState");
  }
  else
  {

  }
}

- (void)cleanupLingeringRotationState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__ARSCNView_cleanupLingeringRotationState__block_invoke;
  v2[3] = &unk_1EA586888;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

uint64_t __42__ARSCNView_cleanupLingeringRotationState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "setRotationSnapshotState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 792);
  *(_QWORD *)(v2 + 792) = 0;

  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v4, "setTransform:", v7);
}

- (void)_updateBackingSize
{
  objc_super v3;

  if (-[ARSCNView rotationSnapshotState](self, "rotationSnapshotState") != 1)
  {
    v3.receiver = self;
    v3.super_class = (Class)ARSCNView;
    -[ARSCNView _updateBackingSize](&v3, sel__updateBackingSize);
  }
}

- (void)_loadWarpKernalForLensType:(unint64_t)a3
{
  const __CFString *v5;
  CIWarpKernel *v6;
  CIWarpKernel *warpKernel;

  if (a3 == 1)
  {
    v5 = CFSTR("kernel vec2 rectification_warp_perspective(vec2 c, vec2 f, vec4 k, vec2 t) {\n    // params: (center, focal_length, radial_distortion, tangential_distortion)\n\n    vec2 p = destCoord();\n    float x = (p.x - c.x) / f.x;\n    float y = (p.y - c.y) / f.y;\n\n    float k1 = k[0];\n    float k2 = k[1];\n    float k3 = k[2];\n\n    float p1 = t[0];\n    float p2 = t[1];\n\n    vec2 xu;\n    xu[0] = x;\n    xu[1] = y;\n\n    int num_iterations = 3;\n    for (int i = 0; i < num_iterations; ++i) {\n        float r_2 =  xu[0]*xu[0]+xu[1]*xu[1];\n        float k_radial = 1.0 + k1 * r_2 + k2 * r_2 * r_2 + k3 * r_2 * r_2 * r_2;\n        float delta_x_0 = 2.0 * p1 * xu[0] * xu[1] + p2 * (r_2 + 2.0 * xu[0] * xu[0]);\n        float delta_x_1 = p1 * (r_2 + 2.0 * xu[1] * xu[1]) + 2.0 * p2 * xu[0] * xu[1];\n        xu[0] = (x - delta_x_0)/k_radial;\n        xu[1] = (y - delta_x_1)/k_radial;\n    }\n\n    float newX = f.x * xu[0] + c.x;\n    float newY = f.y * xu[1] + c.y;\n\n    return vec2(newX, newY);\n}\n");
  }
  else
  {
    if (a3 != 2)
      return;
    v5 = CFSTR("kernel vec2 rectification_warp(vec2 c, vec2 f, vec4 k) {\n    // params: (center, focal_length, radial_distortion)\n\n    vec2 p = destCoord();\n    float x = (p.x - c.x) / f.x;\n    float y = (p.y - c.y) / f.y;\n\n    float r = sqrt(x*x + y*y);\n    float theta = atan(r);\n\n    float theta2 = theta * theta;\n    float theta3 = theta2 * theta;\n    float theta5 = theta3 * theta2;\n    float theta7 = theta5 * theta2;\n    float theta9 = theta7 * theta2;\n\n    float theta_d = theta + k[0] * theta3 + k[1] * theta5 + k[2] * theta7 + k[3] * theta9;\n\n    float scale = (r < 1e-8) ? 1.0 : theta_d / r;\n\n    float newX = f.x * x * scale + c.x;\n    float newY = f.y * y * scale + c.y;\n\n    return vec2(newX, newY);\n}\n");
  }
  v6 = (CIWarpKernel *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DE00]), "initWithString:", v5);
  warpKernel = self->_warpKernel;
  self->_warpKernel = v6;

  self->_warpKernelLensType = a3;
}

- (__CVBuffer)_warpPixelBuffer:(__CVBuffer *)a3 withCamera:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unint64_t warpKernelLensType;
  void *v23;
  double v24;
  double v25;
  void *v26;
  CIWarpKernel *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  __CVBuffer *v38;
  CIWarpKernel *warpKernel;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[3];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v6, "focalLength");
  v10 = v9;
  objc_msgSend(v6, "focalLength");
  objc_msgSend(v8, "vectorWithX:Y:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v6, "principalPoint");
  v14 = v13;
  objc_msgSend(v6, "principalPoint");
  objc_msgSend(v12, "vectorWithX:Y:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C9DDF8];
  if (v6)
  {
    objc_msgSend(v6, "radialDistortion");
    v17 = v55;
    objc_msgSend(v6, "radialDistortion");
    v18 = v54;
    objc_msgSend(v6, "radialDistortion");
    v19 = v53;
    objc_msgSend(v6, "radialDistortion");
    v20 = v52;
  }
  else
  {
    v20 = 0.0;
    v19 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
  }
  objc_msgSend(v16, "vectorWithX:Y:Z:W:", v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_warpKernel
    || (warpKernelLensType = self->_warpKernelLensType, warpKernelLensType != objc_msgSend(v6, "lensType")))
  {
    -[ARSCNView _loadWarpKernalForLensType:](self, "_loadWarpKernalForLensType:", objc_msgSend(v6, "lensType"));
    if (!self->_warpKernel)
      goto LABEL_11;
  }
  if (objc_msgSend(v6, "lensType") != 1)
  {
    if (objc_msgSend(v6, "lensType") == 2)
    {
      warpKernel = self->_warpKernel;
      objc_msgSend(v7, "extent");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v56[0] = v15;
      v56[1] = v11;
      v56[2] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](warpKernel, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_104, v7, v48, v41, v43, v45, v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (__CVBuffer *)ARPixelBufferWithCIImage();
      goto LABEL_12;
    }
LABEL_11:
    v38 = CVPixelBufferRetain(a3);
    goto LABEL_12;
  }
  v23 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v6, "tangentialDistortion");
  v51 = v24;
  objc_msgSend(v6, "tangentialDistortion");
  objc_msgSend(v23, "vectorWithX:Y:", v51, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_warpKernel;
  objc_msgSend(v7, "extent");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v57[0] = v15;
  v57[1] = v11;
  v57[2] = v21;
  v57[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](v27, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_104, v7, v36, v29, v31, v33, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (__CVBuffer *)ARPixelBufferWithCIImage();
LABEL_12:

  return v38;
}

- (int64_t)compositorAlgorithm
{
  return self->_compositorAlgorithm;
}

- (BOOL)automaticallyUpdatesLighting
{
  return self->_automaticallyUpdatesLighting;
}

- (BOOL)rendersCameraGrain
{
  return self->_rendersCameraGrain;
}

- (void)setRendersCameraGrain:(BOOL)rendersCameraGrain
{
  self->_rendersCameraGrain = rendersCameraGrain;
}

- (BOOL)rendersMotionBlur
{
  return self->_rendersMotionBlur;
}

- (void)setRendersMotionBlur:(BOOL)rendersMotionBlur
{
  self->_rendersMotionBlur = rendersMotionBlur;
}

- (BOOL)providesOcclusionGeometry
{
  return self->_providesOcclusionGeometry;
}

- (BOOL)segmentationUseEstimatedDepthData
{
  return self->_segmentationUseEstimatedDepthData;
}

- (double)lastFrameTimestamp
{
  return self->_lastFrameTimestamp;
}

- (void)setLastFrameTimestamp:(double)a3
{
  self->_lastFrameTimestamp = a3;
}

- (BOOL)shouldRestrictFrameRate
{
  return self->_shouldRestrictFrameRate;
}

- (void)setShouldRestrictFrameRate:(BOOL)a3
{
  self->_shouldRestrictFrameRate = a3;
}

- (int64_t)targetFramesPerSecond
{
  return self->_targetFramesPerSecond;
}

- (void)setTargetFramesPerSecond:(int64_t)a3
{
  self->_targetFramesPerSecond = a3;
}

- (int64_t)developerPreferredFramesPerSecond
{
  return self->_developerPreferredFramesPerSecond;
}

- (void)setDeveloperPreferredFramesPerSecond:(int64_t)a3
{
  self->_developerPreferredFramesPerSecond = a3;
}

- (BOOL)drawsCameraImage
{
  return self->_drawsCameraImage;
}

- (void)setDrawsCameraImage:(BOOL)a3
{
  self->_drawsCameraImage = a3;
}

- (int64_t)frameToRemoveRotationSnapshotOn
{
  return self->_frameToRemoveRotationSnapshotOn;
}

- (void)setFrameToRemoveRotationSnapshotOn:(int64_t)a3
{
  self->_frameToRemoveRotationSnapshotOn = a3;
}

- (int64_t)rotationSnapshotState
{
  return self->_rotationSnapshotState;
}

- (void)setRotationSnapshotState:(int64_t)a3
{
  self->_rotationSnapshotState = a3;
}

- (BOOL)graduallyUpdateAnchors
{
  return self->_graduallyUpdateAnchors;
}

- (void)setGraduallyUpdateAnchors:(BOOL)a3
{
  self->_graduallyUpdateAnchors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositor, 0);
  objc_storeStrong((id *)&self->_environmentProbeNodesToRemove, 0);
  objc_storeStrong((id *)&self->_environmentProbeNodes, 0);
  objc_storeStrong((id *)&self->_warpKernel, 0);
  objc_storeStrong((id *)&self->_rotationSnapshot, 0);
  objc_storeStrong(&self->_originalBackgroundContents, 0);
  objc_storeStrong((id *)&self->_currentlyVisibleDebugPointerCloud, 0);
  objc_storeStrong((id *)&self->_featurePointNode, 0);
  objc_storeStrong((id *)&self->_worldOriginNode, 0);
  objc_storeStrong((id *)&self->_anchorsSemaphore, 0);
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
  objc_storeStrong((id *)&self->_addedAnchors, 0);
  objc_storeStrong((id *)&self->_nodesSemaphore, 0);
  objc_storeStrong((id *)&self->_occlusionGeometryNodesByAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_nodesByAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_lightNode, 0);
  objc_storeStrong((id *)&self->_captureDeviceOutputConsumer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
