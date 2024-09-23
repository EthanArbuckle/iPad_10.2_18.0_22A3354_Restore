@implementation AVTAvatarEnvironment

- (id)defaultEnvironmentNode
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  +[AVTResourceLocator sharedResourceLocator]();
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForEnvironmentResource:ofType:isDirectory:](v2, (uint64_t)CFSTR("environment"), (uint64_t)CFSTR("scn"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CD5A10], "avt_rootNodeForSceneAtURL:options:error:", v4, 0, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v6)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTAvatarEnvironment defaultEnvironmentNode].cold.1((uint64_t)v3, v6);

  }
  -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v2, (uint64_t)CFSTR("cameras"), (uint64_t)CFSTR("scn"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CD5A10], "avt_nodeNamed:forSceneAtURL:options:error:", CFSTR("cameras"), v9, 0, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (v11)
    {
      avt_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AVTAvatarEnvironment defaultEnvironmentNode].cold.1((uint64_t)v8, v11);

    }
    if (v10)
      objc_msgSend(v5, "addChildNode:", v10);

  }
  objc_msgSend(v5, "childNodeWithName:recursively:", CFSTR("cameraWatchface"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setXFov:", 0.0);

  objc_msgSend(v5, "clone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", CFSTR("environment"));

  return v15;
}

- (id)initAndInstallInScene:(id)a3 renderer:(id)a4
{
  id v6;
  id v7;
  AVTAvatarEnvironment *v8;
  AVTAvatarEnvironment *v9;
  uint64_t v10;
  SCNNode *environmentNode;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  SCNNode *animojiCamera;
  uint64_t v16;
  SCNNode *memojiCameraGroup;
  uint64_t v18;
  SCNNode *defaultLightingNode;
  void *v20;
  uint64_t v21;
  NSString *framingMode;
  SCNNode *defaultPointOfView;
  id v24;
  NSObject *v25;
  uint64_t v26;
  SCNNode *whitePlane;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  SCNNode *trackingLostIndicator;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  SCNNode *arModeCamera;
  void *v52;
  void *v53;
  void *v54;
  objc_super v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)AVTAvatarEnvironment;
  v8 = -[AVTAvatarEnvironment init](&v56, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_renderer, v7);
    -[AVTAvatarEnvironment defaultEnvironmentNode](v9, "defaultEnvironmentNode");
    v10 = objc_claimAutoreleasedReturnValue();
    environmentNode = v9->_environmentNode;
    v9->_environmentNode = (SCNNode *)v10;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_scene);
    objc_msgSend(WeakRetained, "rootNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addChildNode:", v9->_environmentNode);

    -[SCNNode childNodeWithName:recursively:](v9->_environmentNode, "childNodeWithName:recursively:", CFSTR("camera"), 1);
    v14 = objc_claimAutoreleasedReturnValue();
    animojiCamera = v9->_animojiCamera;
    v9->_animojiCamera = (SCNNode *)v14;

    -[SCNNode childNodeWithName:recursively:](v9->_environmentNode, "childNodeWithName:recursively:", CFSTR("cameras"), 1);
    v16 = objc_claimAutoreleasedReturnValue();
    memojiCameraGroup = v9->_memojiCameraGroup;
    v9->_memojiCameraGroup = (SCNNode *)v16;

    -[SCNNode childNodeWithName:recursively:](v9->_environmentNode, "childNodeWithName:recursively:", CFSTR("lighting"), 1);
    v18 = objc_claimAutoreleasedReturnValue();
    defaultLightingNode = v9->_defaultLightingNode;
    v9->_defaultLightingNode = (SCNNode *)v18;

    objc_storeStrong((id *)&v9->_defaultPointOfView, v9->_animojiCamera);
    -[SCNNode camera](v9->_defaultPointOfView, "camera");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setXFov:", 0.0);

    -[SCNNode name](v9->_defaultPointOfView, "name");
    v21 = objc_claimAutoreleasedReturnValue();
    framingMode = v9->_framingMode;
    v9->_framingMode = (NSString *)v21;

    defaultPointOfView = v9->_defaultPointOfView;
    v24 = objc_loadWeakRetained((id *)&v9->_renderer);
    objc_msgSend(v24, "setPointOfView:", defaultPointOfView);

    if (!v9->_defaultPointOfView)
    {
      avt_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[AVTAvatarEnvironment initAndInstallInScene:renderer:].cold.1(v25);

    }
    objc_msgSend(MEMORY[0x1E0CD59D0], "node");
    v26 = objc_claimAutoreleasedReturnValue();
    whitePlane = v9->_whitePlane;
    v9->_whitePlane = (SCNNode *)v26;

    objc_msgSend(MEMORY[0x1E0CD59F8], "planeWithWidth:height:", 10.0, 10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode setGeometry:](v9->_whitePlane, "setGeometry:", v28);

    v29 = *MEMORY[0x1E0CD5AF8];
    -[SCNNode geometry](v9->_whitePlane, "geometry");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstMaterial");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLightingModelName:", v29);

    -[SCNNode setSimdPosition:](v9->_whitePlane, "setSimdPosition:", 0.0);
    -[SCNNode setRenderingOrder:](v9->_whitePlane, "setRenderingOrder:", 1000);
    -[SCNNode setOpacity:](v9->_whitePlane, "setOpacity:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD59D0], "node");
    v32 = objc_claimAutoreleasedReturnValue();
    trackingLostIndicator = v9->_trackingLostIndicator;
    v9->_trackingLostIndicator = (SCNNode *)v32;

    objc_msgSend(MEMORY[0x1E0CD59F8], "planeWithWidth:height:", 1.0, 1.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode setGeometry:](v9->_trackingLostIndicator, "setGeometry:", v34);

    -[SCNNode geometry](v9->_trackingLostIndicator, "geometry");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstMaterial");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWritesToDepthBuffer:", 0);

    -[SCNNode geometry](v9->_trackingLostIndicator, "geometry");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstMaterial");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setReadsFromDepthBuffer:", 0);

    -[SCNNode geometry](v9->_trackingLostIndicator, "geometry");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstMaterial");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLightingModelName:", v29);

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode geometry](v9->_trackingLostIndicator, "geometry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstMaterial");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "diffuse");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setContents:", v41);

    -[SCNNode setSimdPosition:](v9->_trackingLostIndicator, "setSimdPosition:", 3.52429132e-14);
    -[SCNNode setRenderingOrder:](v9->_trackingLostIndicator, "setRenderingOrder:", 100);
    -[SCNNode setOpacity:](v9->_trackingLostIndicator, "setOpacity:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "pathForResource:ofType:", CFSTR("trackingIndicator"), CFSTR("shader"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v46, 4, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode geometry](v9->_trackingLostIndicator, "geometry");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x1E0CD5BB0];
    v58[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShaderModifiers:", v49);

    -[SCNNode addChildNode:](v9->_defaultPointOfView, "addChildNode:", v9->_trackingLostIndicator);
    v50 = -[SCNNode copy](v9->_defaultPointOfView, "copy");
    arModeCamera = v9->_arModeCamera;
    v9->_arModeCamera = (SCNNode *)v50;

    -[SCNNode camera](v9->_defaultPointOfView, "camera");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    -[SCNNode setCamera:](v9->_arModeCamera, "setCamera:", v53);

    -[SCNNode setName:](v9->_arModeCamera, "setName:", CFSTR("cameraARMode"));
    -[SCNNode camera](v9->_arModeCamera, "camera");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setName:", CFSTR("cameraARMode"));

    -[SCNNode addChildNode:](v9->_environmentNode, "addChildNode:", v9->_arModeCamera);
    -[AVTAvatarEnvironment configureARCameraForReticle](v9, "configureARCameraForReticle");
    -[SCNNode addChildNode:](v9->_defaultPointOfView, "addChildNode:", v9->_whitePlane);

  }
  return v9;
}

- (SCNNode)environmentNode
{
  return self->_environmentNode;
}

- (SCNNode)defaultPointOfView
{
  return self->_defaultPointOfView;
}

- (SCNNode)currentPointOfView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  objc_msgSend(WeakRetained, "pointOfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SCNNode *)v3;
}

- (void)avatarDidChange:(id)a3 presentationConfiguration:(id)a4
{
  id v6;
  id WeakRetained;
  id obj;

  obj = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_avatar, obj);
    -[AVTAvatarEnvironment updateCustomCameras](self, "updateCustomCameras");
    -[AVTAvatarEnvironment updateSpecializedLighting](self, "updateSpecializedLighting");
  }
  -[AVTAvatarEnvironment updateWithPresentationConfiguration:](self, "updateWithPresentationConfiguration:", v6);
  -[AVTAvatarEnvironment updatePointOfViewFromFramingMode](self, "updatePointOfViewFromFramingMode");

}

- (void)updateCustomCameras
{
  id WeakRetained;
  void *v4;
  SCNNode *v5;
  SCNNode *customCamera;

  -[SCNNode removeFromParentNode](self->_customCamera, "removeFromParentNode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  objc_msgSend(WeakRetained, "cameraNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clone");
  v5 = (SCNNode *)objc_claimAutoreleasedReturnValue();
  customCamera = self->_customCamera;
  self->_customCamera = v5;

  if (self->_customCamera)
    -[SCNNode addChildNode:](self->_environmentNode, "addChildNode:");
}

- (void)updateSpecializedLighting
{
  id WeakRetained;
  void *v4;
  SCNNode *v5;
  SCNNode *specializedLightingNode;
  SCNNode *v7;
  id v8;
  void *v9;

  -[SCNNode removeFromParentNode](self->_specializedLightingNode, "removeFromParentNode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  objc_msgSend(WeakRetained, "lightingNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clone");
  v5 = (SCNNode *)objc_claimAutoreleasedReturnValue();
  specializedLightingNode = self->_specializedLightingNode;
  self->_specializedLightingNode = v5;

  v7 = self->_specializedLightingNode;
  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v8, "rootNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addChildNode:", self->_specializedLightingNode);

  }
  -[SCNNode setHidden:](self->_defaultLightingNode, "setHidden:", v7 != 0);
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (void)setFramingMode:(id)a3
{
  -[AVTAvatarEnvironment setFramingMode:animationDuration:](self, "setFramingMode:animationDuration:", a3, 0.0);
}

- (void)setFramingMode:(id)a3 animationDuration:(double)a4
{
  NSString *v6;
  NSString *framingMode;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_framingMode, "isEqualToString:"))
  {
    v6 = (NSString *)objc_msgSend(v8, "copy");
    framingMode = self->_framingMode;
    self->_framingMode = v6;

    if (a4 <= 0.0)
    {
      -[AVTAvatarEnvironment updatePointOfViewFromFramingMode](self, "updatePointOfViewFromFramingMode");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
      objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", a4);
      -[AVTAvatarEnvironment updatePointOfViewFromFramingMode](self, "updatePointOfViewFromFramingMode");
      objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
    }
  }

}

- (void)setFramingModeForcingPointOfViewUpdate:(id)a3
{
  NSString *v4;
  NSString *framingMode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  framingMode = self->_framingMode;
  self->_framingMode = v4;

  -[AVTAvatarEnvironment updatePointOfViewFromFramingMode](self, "updatePointOfViewFromFramingMode");
}

- (id)pointOfViewForFramingMode:(id)a3
{
  __CFString *v4;
  id WeakRetained;
  char isKindOfClass;
  void *v7;

  v4 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("cameraGrid")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {

      v4 = CFSTR("cameraGridMemoji");
    }
  }
  -[SCNNode childNodeWithName:recursively:](self->_environmentNode, "childNodeWithName:recursively:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updatePointOfViewFromFramingMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1DD1FA000, v2, v3, "Error: Failed to find the \"%@\" camera, using the default one instead (\"%@\")", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)updateWithPresentationConfiguration:(id)a3
{
  AVTAvatar **p_avatar;
  id v5;
  id WeakRetained;
  char isKindOfClass;
  char v8;
  char v9;
  SCNNode *environmentNode;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  char v16;
  char v17;

  p_avatar = &self->_avatar;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_avatar);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (updateWithPresentationConfiguration__onceToken != -1)
    dispatch_once(&updateWithPresentationConfiguration__onceToken, &__block_literal_global_13);
  v8 = isKindOfClass & 1;
  v9 = objc_msgSend(v5, "usesAR");

  environmentNode = self->_environmentNode;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke_2;
  v15[3] = &__block_descriptor_34_e21_v24__0__SCNNode_8_B16l;
  v16 = v8;
  v17 = v9;
  -[SCNNode enumerateHierarchyUsingBlock:](environmentNode, "enumerateHierarchyUsingBlock:", v15);
  v14 = objc_loadWeakRetained((id *)p_avatar);
  objc_msgSend(v14, "rootJointNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNNode parentNode](self->_arModeCamera, "parentNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "simdConvertTransform:toNode:", v13, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");

}

void __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    updateWithPresentationConfiguration__shadowSamples = 1;
    updateWithPresentationConfiguration__shadowSize = 1;
  }
}

void __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  uint64_t v7;
  double v8;
  id v9;

  objc_msgSend(a2, "light");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v3, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD5AD0]);

    if (v5)
    {
      objc_msgSend(v9, "setCastsShadow:", 1);
      v6 = 512.0;
      if (updateWithPresentationConfiguration__shadowSize)
        v6 = 1024.0;
      objc_msgSend(v9, "setShadowMapSize:", v6, v6);
      if (updateWithPresentationConfiguration__shadowSamples)
        v7 = 32;
      else
        v7 = 16;
      objc_msgSend(v9, "setShadowSampleCount:", v7);
      objc_msgSend(v9, "setShadowRadius:", 0.0);
      v8 = 0.1;
      if (!*(_BYTE *)(a1 + 33))
        v8 = 1.0;
      objc_msgSend(v9, "setZNear:", v8);
      objc_msgSend(v9, "setZFar:", 100.0);
      objc_msgSend(v9, "setAutomaticallyAdjustsShadowProjection:", *(unsigned __int8 *)(a1 + 33));
      objc_msgSend(v9, "setOrthographicScale:", 25.0);
    }
  }
  else
  {
    objc_msgSend(v3, "setCastsShadow:", 0);
  }

}

- (void)setEnablePhysicsSimulation:(BOOL)a3
{
  _BOOL4 v3;
  SCNScene **p_scene;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a3;
  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "physicsWorld");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "speed");
  if ((((v6 != 4.0) ^ v3) & 1) == 0)
  {
    v7 = 0.0;
    if (v3)
      v7 = 4.0;
    objc_msgSend(v14, "setSpeed:", v7);
    if (v3)
    {
      v8 = objc_loadWeakRetained((id *)p_scene);
      v9 = objc_msgSend(v8, "isPaused") ^ 1;
      v10 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v10, "setPaused:", v9);

      v11 = objc_loadWeakRetained((id *)p_scene);
      v12 = objc_msgSend(v11, "isPaused") ^ 1;
      v13 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v13, "setPaused:", v12);

    }
  }

}

- (void)setShowReticle:(BOOL)a3
{
  if (self->_trackingLostIndicatorVisible != a3)
  {
    if (a3)
    {
      -[AVTAvatarEnvironment configureARCameraForReticle](self, "configureARCameraForReticle");
      -[AVTAvatarEnvironment showTrackingLossIndicator](self, "showTrackingLossIndicator");
    }
    else
    {
      -[AVTAvatarEnvironment configureARCameraForFaceTracking](self, "configureARCameraForFaceTracking");
      -[AVTAvatarEnvironment hideTrackingLossIndicator](self, "hideTrackingLossIndicator");
    }
  }
}

- (BOOL)showReticle
{
  return self->_trackingLostIndicatorVisible;
}

- (void)showTrackingLossIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v11;
  id v12;

  self->_trackingLostIndicatorVisible = 1;
  -[SCNNode geometry](self->_trackingLostIndicator, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", &unk_1EA70EB18, CFSTR("hold"));

  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.23);
  -[SCNNode geometry](self->_trackingLostIndicator, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", &unk_1EA70EB28, CFSTR("hold"));

  -[SCNNode setOpacity:](self->_trackingLostIndicator, "setOpacity:", 1.0);
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("scale"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", 30.0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", 0.00718750152);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v5);

  __asm { FMOV            V0.4S, #1.0 }
  objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)&_Q0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v11);

  -[SCNNode addAnimation:forKey:](self->_trackingLostIndicator, "addAnimation:forKey:", v12, CFSTR("pulse"));
}

- (void)hideTrackingLossIndicator
{
  void *v3;
  _QWORD v4[5];

  self->_trackingLostIndicatorVisible = 0;
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.23);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke;
  v4[3] = &unk_1EA61DBF8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CD5A38], "setCompletionBlock:", v4);
  -[SCNNode geometry](self->_trackingLostIndicator, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", &unk_1EA70EB18, CFSTR("hold"));

  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
}

uint64_t __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.3);
  v2 = (void *)MEMORY[0x1E0CD5A38];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnimationTimingFunction:", v3);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke_2;
  v5[3] = &unk_1EA61DBF8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD5A38], "setCompletionBlock:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setOpacity:", 0.0);
  return objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
}

uint64_t __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
    return objc_msgSend(*(id *)(v1 + 32), "removeAnimationForKey:", CFSTR("pulse"));
  return result;
}

- (void)configureARCameraForFaceTracking
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  objc_msgSend(WeakRetained, "rootJointNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNNode parentNode](self->_arModeCamera, "parentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simdConvertTransform:toNode:", v5, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");

}

- (void)configureARCameraForReticle
{
  void *v3;
  SCNNode *defaultPointOfView;
  void *v5;
  id v6;

  -[SCNNode camera](self->_defaultPointOfView, "camera");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SCNNode camera](self->_arModeCamera, "camera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focalLength");
  objc_msgSend(v3, "setFocalLength:");
  objc_msgSend(v6, "sensorHeight");
  objc_msgSend(v3, "setSensorHeight:");
  objc_msgSend(v3, "setProjectionDirection:", objc_msgSend(v6, "projectionDirection"));
  defaultPointOfView = self->_defaultPointOfView;
  -[SCNNode parentNode](self->_arModeCamera, "parentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNNode simdConvertTransform:toNode:](defaultPointOfView, "simdConvertTransform:toNode:", v5, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");

}

- (void)willSnapshot
{
  -[SCNNode setHidden:](self->_trackingLostIndicator, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
}

- (void)didSnapshot
{
  -[SCNNode setHidden:](self->_trackingLostIndicator, "setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
}

- (void)setFadeFactor:(float)a3
{
  -[SCNNode setOpacity:](self->_whitePlane, "setOpacity:", a3);
}

- (float)fadeFactor
{
  double v2;

  -[SCNNode opacity](self->_whitePlane, "opacity");
  return v2;
}

- (BOOL)faceIsFullyVisible
{
  void *v2;
  double v3;
  BOOL v4;

  -[SCNNode presentationNode](self->_whitePlane, "presentationNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 == 0.0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLightingNode, 0);
  objc_storeStrong((id *)&self->_specializedLightingNode, 0);
  objc_storeStrong((id *)&self->_arModeCamera, 0);
  objc_storeStrong((id *)&self->_customCamera, 0);
  objc_storeStrong((id *)&self->_memojiCameraGroup, 0);
  objc_storeStrong((id *)&self->_animojiCamera, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
  objc_storeStrong((id *)&self->_defaultPointOfView, 0);
  objc_storeStrong((id *)&self->_environmentNode, 0);
  objc_storeStrong((id *)&self->_whitePlane, 0);
  objc_storeStrong((id *)&self->_shadowPlaneMaterial, 0);
  objc_storeStrong((id *)&self->_trackingLostIndicator, 0);
  objc_destroyWeak((id *)&self->_avatar);
  objc_destroyWeak((id *)&self->_renderer);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)defaultEnvironmentNode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0(&dword_1DD1FA000, v3, v4, "Error: could not load scene at %@ with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)initAndInstallInScene:(os_log_t)log renderer:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Could not find the default point of view", v1, 2u);
}

@end
