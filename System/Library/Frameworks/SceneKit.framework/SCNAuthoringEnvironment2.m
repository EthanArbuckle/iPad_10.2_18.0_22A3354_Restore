@implementation SCNAuthoringEnvironment2

+ (id)authoringEnvironmentForScene:(id)a3
{
  return (id)objc_msgSend(a1, "authoringEnvironmentForScene:createIfNeeded:", a3, 1);
}

+ (id)authoringEnvironmentForScene:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  SCNAuthoringEnvironment2 *v7;
  SCNAuthoringEnvironment2 *AuthoringEnvironment2;

  v4 = a4;
  +[SCNTransaction lock](SCNTransaction, "lock");
  v6 = objc_msgSend(a3, "sceneRef");
  if (v6)
  {
    v7 = (SCNAuthoringEnvironment2 *)v6;
    C3DSceneLock(v6);
    AuthoringEnvironment2 = C3DSceneGetAuthoringEnvironment2(v7, v4);
    C3DSceneUnlock((uint64_t)v7);
  }
  else
  {
    AuthoringEnvironment2 = 0;
  }
  +[SCNTransaction unlock](SCNTransaction, "unlock");
  return AuthoringEnvironment2;
}

- (SCNAuthoringEnvironment2)initWithScene:(id)a3
{
  SCNAuthoringEnvironment2 *v4;
  SCNAuthoringEnvironment2 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNAuthoringEnvironment2;
  v4 = -[SCNAuthoringEnvironment2 init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SCNAuthoringEnvironment2 prepareScene:](v4, "prepareScene:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_lightsDictionary);
  CFRelease(self->_camerasDictionary);
  CFRelease(self->_particlesDictionary);
  CFRelease(self->_physicsFieldsDictionary);

  v3.receiver = self;
  v3.super_class = (Class)SCNAuthoringEnvironment2;
  -[SCNAuthoringEnvironment2 dealloc](&v3, sel_dealloc);
}

- (void)prepareScene:(id)a3
{
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  SCNNode *v7;
  double BoundingSphere;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  uint64_t v16;
  float v17;
  double v18;
  double v19;
  SCNCamera *v20;
  char *v21;
  SCNNode *v22;
  double v23;
  double v24;
  double v25;
  float32x4_t *v26;
  SCNNode *v27;
  double v28;
  float v29;
  double v30;
  float32x2_t v31;
  double v32;
  float32x2_t v33;
  double v34;
  float v35;
  double v36;
  float32x2_t v37;
  double v38;
  float v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  _OWORD v52[8];
  _OWORD v53[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  self->_scene = (__C3DScene *)objc_msgSend(a3, "sceneRef");
  self->_manipulator = objc_alloc_init(SCNManipulator);
  self->_selection = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  self->_lightsDictionary = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  self->_camerasDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_particlesDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_physicsFieldsDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_layerRoot = +[SCNNode node](SCNNode, "node");
  self->_overlayLayerRoot = +[SCNNode node](SCNNode, "node");
  self->_lightRoot = +[SCNNode node](SCNNode, "node");
  self->_cameraRoot = +[SCNNode node](SCNNode, "node");
  self->_particlesRoot = +[SCNNode node](SCNNode, "node");
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  Mesh::AppendWireframeSphere((Mesh *)&v59, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
  v7 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateLineGeometry((Mesh *)&v59));
  self->_cameraTarget = v7;
  -[SCNNode setHidden:](v7, "setHidden:", 1);
  if ((_QWORD)v62)
  {
    *((_QWORD *)&v62 + 1) = v62;
    operator delete((void *)v62);
  }
  if (*((_QWORD *)&v60 + 1))
  {
    *(_QWORD *)&v61 = *((_QWORD *)&v60 + 1);
    operator delete(*((void **)&v60 + 1));
  }
  if ((_QWORD)v59)
  {
    *((_QWORD *)&v59 + 1) = v59;
    operator delete((void *)v59);
  }
  self->_physicsFieldsRoot = +[SCNNode node](SCNNode, "node");
  self->_pointsOfViewRoot = +[SCNNode node](SCNNode, "node");
  -[SCNNode setName:](self->_layerRoot, "setName:", CFSTR("_layerRoot"));
  -[SCNNode setName:](self->_overlayLayerRoot, "setName:", CFSTR("_overlayLayerRoot"));
  -[SCNNode setName:](self->_lightRoot, "setName:", CFSTR("_lightRoot"));
  -[SCNNode setName:](self->_cameraRoot, "setName:", CFSTR("_cameraRoot"));
  -[SCNNode setName:](self->_particlesRoot, "setName:", CFSTR("_particlesRoot"));
  -[SCNNode setName:](self->_physicsFieldsRoot, "setName:", CFSTR("_physicsFieldRoot"));
  -[SCNNode setName:](self->_pointsOfViewRoot, "setName:", CFSTR("_pointsOfViewRoot"));
  self->_paleGreen = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorPaleGreen);
  self->_paleBlue = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorPaleBlue);
  self->_red = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed);
  self->_green = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen);
  self->_blue = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue);
  self->_cyan = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorCyan);
  self->_yellow = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorYellow);
  self->_orange = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorOrange);
  self->_pink = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorPink);
  self->_grayLight = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayLight);
  self->_grayMedium = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayMedium);
  self->_grayDark = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayDark);
  self->_white = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorWhite);
  -[SCNNode setAuthoringEnvironmentNode:](self->_layerRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_overlayLayerRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_lightRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_cameraRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_particlesRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_physicsFieldsRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_cameraTarget, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setAuthoringEnvironmentNode:](self->_pointsOfViewRoot, "setAuthoringEnvironmentNode:", 1);
  -[SCNNode setHidden:](self->_lightRoot, "setHidden:", 1);
  -[SCNNode setHidden:](self->_cameraRoot, "setHidden:", 1);
  -[SCNNode setHidden:](self->_particlesRoot, "setHidden:", 1);
  objc_msgSend(a3, "setRootNode:forLayer:", self->_layerRoot, 1);
  objc_msgSend(a3, "setRootNode:forLayer:", self->_overlayLayerRoot, 2);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_lightRoot);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_cameraRoot);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_particlesRoot);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_physicsFieldsRoot);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_cameraTarget);
  -[SCNNode addChildNode:](self->_layerRoot, "addChildNode:", self->_pointsOfViewRoot);
  v47 = (void *)objc_msgSend(a3, "rootNode");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __41__SCNAuthoringEnvironment2_prepareScene___block_invoke;
  v58[3] = &unk_1EA59E6D8;
  v58[4] = self;
  objc_msgSend(v47, "enumerateChildNodesUsingBlock:", v58);
  +[SCNTransaction commit](SCNTransaction, "commit");
  v64[0] = objc_msgSend(a3, "rootNode");
  BoundingSphere = SCNNodeGetBoundingSphere((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1), 0x10000);
  v10 = v9;
  v12 = v11;
  +[SCNNode simdLocalUp](SCNNode, "simdLocalUp", BoundingSphere);
  v50 = v13;
  +[SCNNode simdLocalRight](SCNNode, "simdLocalRight");
  v49 = v14;
  +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
  v48 = v15;
  v16 = 0;
  v15.i64[0] = v10;
  v15.i64[1] = v12;
  v51 = v15;
  v17 = *((float *)&v12 + 1) * 1.33;
  if (*((float *)&v12 + 1) <= 0.0)
    v17 = 1.0;
  v18 = v17;
  v19 = *((float *)&v12 + 1);
  do
  {
    v20 = +[SCNCamera camera](SCNCamera, "camera");
    v21 = -[SCNAuthoringEnvironment2 prepareScene:]::camNames[v16];
    -[SCNCamera setName:](v20, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_authoringCamera%s"), v21));
    -[SCNCamera setUsesOrthographicProjection:](v20, "setUsesOrthographicProjection:", v16 != 0);
    -[SCNCamera setAutomaticallyAdjustsZRange:](v20, "setAutomaticallyAdjustsZRange:", 1);
    -[SCNCamera setOrthographicScale:](v20, "setOrthographicScale:", v18);
    v22 = +[SCNNode node](SCNNode, "node");
    -[SCNNode setCamera:](v22, "setCamera:", v20);
    -[SCNNode setName:](v22, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21));
    -[SCNNode setAuthoringEnvironmentNode:](v22, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setAuthoringCameraType:](v22, "setAuthoringCameraType:", v16);
    switch((int)v16)
    {
      case 0:
        -[SCNCamera setZNear:](-[SCNNode camera](v22, "camera"), "setZNear:", 0.1);
        if (self->_scene
          && (+[SCNTransaction lock](SCNTransaction, "lock"),
              C3DSceneLock((uint64_t)self->_scene),
              v26 = C3DCreateDefaultCameraNode((__n128 *)self->_scene, 1),
              C3DSceneUnlock((uint64_t)self->_scene),
              +[SCNTransaction unlock](SCNTransaction, "unlock"),
              v26))
        {
          v27 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", v26);
          if (v27)
          {
            -[SCNNode transform](v27, "transform");
          }
          else
          {
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
          }
          v53[0] = v54;
          v53[1] = v55;
          v53[2] = v56;
          v53[3] = v57;
          -[SCNNode setTransform:](v22, "setTransform:", v53);
          CFRelease(v26);
        }
        else
        {
          v40 = (void *)objc_msgSend((id)objc_msgSend(v47, "childNodesWithAttribute:recursively:", objc_opt_class(), 1), "firstObject");
          if (v40)
          {
            objc_msgSend(v40, "transform");
            v52[0] = v52[4];
            v52[1] = v52[5];
            v52[2] = v52[6];
            v52[3] = v52[7];
            -[SCNNode setTransform:](v22, "setTransform:", v52);
          }
          else
          {
            LODWORD(v43) = 0;
            LODWORD(v42) = 1061628640;
            LODWORD(v41) = -1094336732;
            -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v41, v42, v43);
            LODWORD(v44) = 1075302105;
            LODWORD(v45) = 1069321028;
            LODWORD(v46) = 1075415351;
            -[SCNNode setPosition:](v22, "setPosition:", v44, v45, v46);
          }
        }
        break;
      case 1:
        LODWORD(v24) = 0;
        LODWORD(v25) = 0;
        LODWORD(v23) = -1077342245;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v29 = v28 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlaq_n_f32(v51, v50, v29).i64);
        break;
      case 2:
        LODWORD(v24) = 0;
        LODWORD(v25) = 0;
        LODWORD(v23) = 1070141403;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v31.f32[0] = v30 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlsq_lane_f32(v51, v50, v31, 0).i64);
        break;
      case 3:
        LODWORD(v23) = 0;
        LODWORD(v25) = 0;
        LODWORD(v24) = -1077342245;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v33.f32[0] = v32 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlsq_lane_f32(v51, v49, v33, 0).i64);
        break;
      case 4:
        LODWORD(v23) = 0;
        LODWORD(v25) = 0;
        LODWORD(v24) = 1070141403;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v35 = v34 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlaq_n_f32(v51, v49, v35).i64);
        break;
      case 5:
        LODWORD(v23) = 0;
        LODWORD(v24) = 0;
        LODWORD(v25) = 0;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v37.f32[0] = v36 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlsq_lane_f32(v51, v48, v37, 0).i64);
        break;
      case 6:
        LODWORD(v23) = 0;
        LODWORD(v25) = 0;
        LODWORD(v24) = -1068953637;
        -[SCNNode setEulerAngles:](v22, "setEulerAngles:", v23, v24, v25);
        -[SCNCamera zNear](v20, "zNear");
        v39 = v38 + v19;
        -[SCNNode setSimdWorldPosition:](v22, "setSimdWorldPosition:", *(double *)vmlaq_n_f32(v51, v48, v39).i64);
        break;
      default:
        break;
    }
    -[SCNNode addChildNode:](self->_pointsOfViewRoot, "addChildNode:", v22);
    ++v16;
  }
  while (v16 != 7);
  -[SCNAuthoringEnvironment2 setDisplayMask:](self, "setDisplayMask:", 0);
}

uint64_t __41__SCNAuthoringEnvironment2_prepareScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addedNode:", a2);
}

- (id)authoringCameraNodes
{
  return -[SCNNode childNodes](self->_pointsOfViewRoot, "childNodes");
}

- (SCNManipulator)manipulator
{
  return self->_manipulator;
}

- (id)geometryForLightType:(id)a3
{
  SCNGeometry *lightGeometry;
  id v6;
  void *v7[2];
  void *v8[2];
  __int128 v9;
  void *__p[2];
  __int128 v11;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("probe")) & 1) != 0)
    return 0;
  lightGeometry = self->_lightGeometry;
  if (!lightGeometry)
  {
    *(_OWORD *)__p = 0u;
    v11 = 0u;
    *(_OWORD *)v8 = 0u;
    v9 = 0u;
    *(_OWORD *)v7 = 0u;
    Mesh::AppendWireframeSphere((Mesh *)v7, 0.5, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    self->_lightGeometry = Mesh::CreateLineGeometry((Mesh *)v7);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v8[1])
    {
      *(void **)&v9 = v8[1];
      operator delete(v8[1]);
    }
    if (v7[0])
    {
      v7[1] = v7[0];
      operator delete(v7[0]);
    }
    lightGeometry = self->_lightGeometry;
  }
  v6 = -[SCNGeometry copy](lightGeometry, "copy");
  objc_msgSend(v6, "setFirstMaterial:", -[SCNMaterial copy](-[SCNGeometry firstMaterial](self->_lightGeometry, "firstMaterial"), "copy"));
  return v6;
}

- (void)addLightNode:(id)a3
{
  NSObject *v5;
  SCNNode *v6;

  if (CFDictionaryContainsKey(self->_lightsDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNAuthoringEnvironment2 addLightNode:].cold.1();
  }
  else
  {
    v6 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 geometryForLightType:](self, "geometryForLightType:", objc_msgSend((id)objc_msgSend(a3, "light"), "type")));
    -[SCNNode setName:](v6, "setName:", CFSTR("lightAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v6, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setAuthoringEnvironmentCompanionNode:](v6, "setAuthoringEnvironmentCompanionNode:", a3);
    objc_msgSend(a3, "setAuthoringEnvironmentPresentationNode:", v6);
    -[SCNNode addChildNode:](self->_lightRoot, "addChildNode:", v6);
    CFDictionaryAddValue(self->_lightsDictionary, a3, v6);
  }
}

- (id)particlesGeometry
{
  SCNGeometry *particlesGeometry;
  id v4;
  unint64_t v6;
  int v7;
  void *v8[2];
  void *v9[2];
  __int128 v10;
  void *__p[2];
  __int128 v12;

  particlesGeometry = self->_particlesGeometry;
  if (!particlesGeometry)
  {
    *(_OWORD *)__p = 0u;
    v12 = 0u;
    *(_OWORD *)v9 = 0u;
    v10 = 0u;
    *(_OWORD *)v8 = 0u;
    v6 = 0x3EB33333BCF5C28FLL;
    v7 = 1027101164;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    v6 = 0xBE6B851FBE4CCCCDLL;
    v7 = 1052602532;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    v6 = 0xBE6B851F3E99999ALL;
    v7 = -1094881116;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    self->_particlesGeometry = Mesh::CreateLineGeometry((Mesh *)v8);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v9[1])
    {
      *(void **)&v10 = v9[1];
      operator delete(v9[1]);
    }
    if (v8[0])
    {
      v8[1] = v8[0];
      operator delete(v8[0]);
    }
    particlesGeometry = self->_particlesGeometry;
  }
  v4 = -[SCNGeometry copy](particlesGeometry, "copy");
  objc_msgSend(v4, "setFirstMaterial:", -[SCNMaterial copy](-[SCNGeometry firstMaterial](self->_particlesGeometry, "firstMaterial"), "copy"));
  return v4;
}

- (void)setupParticleMeshEmitter:(id)a3 authoringNode:(id)a4
{
  uint64_t v7;
  const __CFArray *ParticleSystems;
  const __CFArray *v9;
  const void *ValueAtIndex;
  const void *EmitterShape;
  const void *Copy;
  SCNGeometry *v13;
  SCNMaterial *v14;
  SCNNode *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a4, "childNodes"), "count") == 2)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "childNodes"), "objectAtIndexedSubscript:", 1), "removeFromParentNode");
  v7 = objc_msgSend(a3, "nodeRef");
  if (v7)
  {
    ParticleSystems = C3DNodeGetParticleSystems(v7);
    if (ParticleSystems)
    {
      v9 = ParticleSystems;
      if (CFArrayGetCount(ParticleSystems))
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, 0);
        EmitterShape = (const void *)C3DParticleSystemGetEmitterShape((uint64_t)ValueAtIndex);
        if (EmitterShape)
        {
          Copy = (const void *)C3DGeometryCreateCopy(EmitterShape);
          v13 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", Copy);
          CFRelease(Copy);
          v14 = +[SCNMaterial material](SCNMaterial, "material");
          -[SCNMaterial setLightingModelName:](v14, "setLightingModelName:", CFSTR("SCNLightingModelConstant"));
          -[SCNMaterialProperty setContents:](-[SCNMaterial diffuse](v14, "diffuse"), "setContents:", self->_yellow);
          -[SCNMaterial setFillMode:](v14, "setFillMode:", 1);
          v16[0] = v14;
          -[SCNGeometry setMaterials:](v13, "setMaterials:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
          v15 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v13);
          -[SCNNode setAuthoringEnvironmentNode:](v15, "setAuthoringEnvironmentNode:", 1);
          -[SCNNode setAuthoringEnvironmentCompanionNode:](v15, "setAuthoringEnvironmentCompanionNode:", a3);
          objc_msgSend(a3, "setAuthoringEnvironmentPresentationNode:", v15);
          objc_msgSend(a4, "addChildNode:", v15);
        }
      }
    }
  }
}

- (void)addParticlesNode:(id)a3
{
  NSObject *v5;
  SCNNode *v6;
  SCNNode *v7;

  if (CFDictionaryContainsKey(self->_particlesDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNAuthoringEnvironment2 addParticlesNode:].cold.1();
  }
  else
  {
    v6 = +[SCNNode node](SCNNode, "node");
    v7 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 particlesGeometry](self, "particlesGeometry"));
    -[SCNNode setName:](v7, "setName:", CFSTR("particlesAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v7, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setAuthoringEnvironmentCompanionNode:](v7, "setAuthoringEnvironmentCompanionNode:", a3);
    objc_msgSend(a3, "setAuthoringEnvironmentPresentationNode:", v7);
    -[SCNNode setAuthoringEnvironmentNode:](v6, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode addChildNode:](v6, "addChildNode:", v7);
    -[SCNNode addChildNode:](self->_particlesRoot, "addChildNode:", v6);
    CFDictionaryAddValue(self->_particlesDictionary, a3, v6);
  }
}

- (id)cameraGeometry
{
  id result;

  result = self->_cameraGeometry;
  if (!result)
  {
    result = Mesh::CreateCameraGeometry(0);
    self->_cameraGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraFrustumGeometry
{
  id result;

  result = self->_cameraFrustumGeometry;
  if (!result)
  {
    result = Mesh::CreateCameraFrustumGeometry(0);
    self->_cameraFrustumGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraOrthographicFrustumGeometry
{
  id result;

  result = self->_cameraOrthographicFrustumGeometry;
  if (!result)
  {
    result = Mesh::CreateOrthographicCameraFrustumGeometry(0);
    self->_cameraOrthographicFrustumGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraNearPlaneGeometry
{
  id result;

  result = self->_cameraNearPlaneGeometry;
  if (!result)
  {
    result = Mesh::CreateCameraNearPlaneGeometry(0);
    self->_cameraNearPlaneGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)fieldGeometry
{
  id result;

  result = self->_fieldGeometry;
  if (!result)
  {
    result = Mesh::CreatePhysicsFieldGeometry(0);
    self->_fieldGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (void)addCameraNode:(id)a3
{
  NSObject *v5;
  SCNNode *v6;
  id v7;
  SCNNode *v8;
  SCNNode *v9;

  if (CFDictionaryContainsKey(self->_camerasDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNAuthoringEnvironment2 addCameraNode:].cold.1();
  }
  else if ((!objc_msgSend(a3, "name")
          || objc_msgSend((id)objc_msgSend(a3, "name"), "compare:", CFSTR("kSCNFreeViewCameraName")))
         && (objc_msgSend(a3, "authoringEnvironmentNode") & 1) == 0)
  {
    v6 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 cameraGeometry](self, "cameraGeometry"));
    -[SCNNode setName:](v6, "setName:", CFSTR("cameraAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v6, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setAuthoringEnvironmentCompanionNode:](v6, "setAuthoringEnvironmentCompanionNode:", a3);
    objc_msgSend(a3, "setAuthoringEnvironmentPresentationNode:", v6);
    if (objc_msgSend((id)objc_msgSend(a3, "camera"), "usesOrthographicProjection"))
      v7 = -[SCNAuthoringEnvironment2 cameraOrthographicFrustumGeometry](self, "cameraOrthographicFrustumGeometry");
    else
      v7 = -[SCNAuthoringEnvironment2 cameraFrustumGeometry](self, "cameraFrustumGeometry");
    v8 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v7);
    -[SCNNode setName:](v8, "setName:", CFSTR("cameraFrustumAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v8, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setHittable:](v8, "setHittable:", 0);
    v9 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 cameraNearPlaneGeometry](self, "cameraNearPlaneGeometry"));
    -[SCNNode setName:](v9, "setName:", CFSTR("cameraNearPlaneAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v9, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setHittable:](v9, "setHittable:", 0);
    -[SCNNode addChildNode:](self->_cameraRoot, "addChildNode:", v6);
    -[SCNNode addChildNode:](v6, "addChildNode:", v8);
    -[SCNNode addChildNode:](v8, "addChildNode:", v9);
    CFDictionaryAddValue(self->_camerasDictionary, a3, v6);
  }
}

- (void)removeCameraNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_camerasDictionary, a3), "removeFromParentNode");
  CFDictionaryRemoveValue(self->_camerasDictionary, a3);
}

- (void)addPhysicsFieldNode:(id)a3
{
  NSObject *v5;
  SCNNode *v6;

  if (CFDictionaryContainsKey(self->_physicsFieldsDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNAuthoringEnvironment2 addPhysicsFieldNode:].cold.1();
  }
  else
  {
    v6 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 fieldGeometry](self, "fieldGeometry"));
    -[SCNNode setName:](v6, "setName:", CFSTR("fieldAuth"));
    -[SCNNode setAuthoringEnvironmentNode:](v6, "setAuthoringEnvironmentNode:", 1);
    -[SCNNode setAuthoringEnvironmentCompanionNode:](v6, "setAuthoringEnvironmentCompanionNode:", a3);
    objc_msgSend(a3, "setAuthoringEnvironmentPresentationNode:", v6);
    -[SCNNode addChildNode:](self->_physicsFieldsRoot, "addChildNode:", v6);
    CFDictionaryAddValue(self->_physicsFieldsDictionary, a3, v6);
  }
}

- (void)removePhysicsFieldNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_physicsFieldsDictionary, a3), "removeFromParentNode");
  CFDictionaryRemoveValue(self->_physicsFieldsDictionary, a3);
}

- (void)removeLightNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_lightsDictionary, a3), "removeFromParentNode");
  CFDictionaryRemoveValue(self->_lightsDictionary, a3);
}

- (void)removeParticlesNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_particlesDictionary, a3), "removeFromParentNode");
  CFDictionaryRemoveValue(self->_particlesDictionary, a3);
}

- (void)addedNode:(id)a3
{
  if ((objc_msgSend(a3, "authoringEnvironmentNode") & 1) == 0)
  {
    if (objc_msgSend(a3, "light"))
      -[SCNAuthoringEnvironment2 addLightNode:](self, "addLightNode:", a3);
    if (objc_msgSend(a3, "particleSystems"))
      -[SCNAuthoringEnvironment2 addParticlesNode:](self, "addParticlesNode:", a3);
    if (objc_msgSend(a3, "camera"))
      -[SCNAuthoringEnvironment2 addCameraNode:](self, "addCameraNode:", a3);
    if (objc_msgSend(a3, "physicsField"))
      -[SCNAuthoringEnvironment2 addPhysicsFieldNode:](self, "addPhysicsFieldNode:", a3);
  }
}

- (void)removedNode:(id)a3
{
  id v4;

  if ((objc_msgSend(a3, "authoringEnvironmentNode") & 1) == 0)
  {
    v4 = a3;
    if (objc_msgSend(a3, "light"))
      -[SCNAuthoringEnvironment2 removeLightNode:](self, "removeLightNode:", a3);
    if (objc_msgSend(a3, "particleSystems"))
      -[SCNAuthoringEnvironment2 removeParticlesNode:](self, "removeParticlesNode:", a3);
    if (objc_msgSend(a3, "camera"))
      -[SCNAuthoringEnvironment2 removeCameraNode:](self, "removeCameraNode:", a3);
    if (objc_msgSend(a3, "physicsField"))
      -[SCNAuthoringEnvironment2 removePhysicsFieldNode:](self, "removePhysicsFieldNode:", a3);

  }
}

- (void)selectNode:(id)a3
{
  objc_sync_enter(self);
  if ((objc_msgSend(a3, "authoringEnvironmentNode") & 1) == 0)
  {
    -[NSMutableSet removeAllObjects](self->_selection, "removeAllObjects");
    if (a3)
      -[NSMutableSet addObject:](self->_selection, "addObject:", a3);
  }
  objc_sync_exit(self);
}

- (void)addNodeToSelection:(id)a3
{
  char v5;
  char v6;

  objc_sync_enter(self);
  v5 = objc_msgSend(a3, "authoringEnvironmentNode");
  if (a3)
    v6 = v5;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    -[NSMutableSet addObject:](self->_selection, "addObject:", a3);
  objc_sync_exit(self);
}

- (void)selectNodes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  -[NSMutableSet removeAllObjects](self->_selection, "removeAllObjects");
  if (a3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(a3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if ((objc_msgSend(v8, "authoringEnvironmentNode") & 1) == 0)
            -[NSMutableSet addObject:](self->_selection, "addObject:", v8);
        }
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  objc_sync_exit(self);
}

- (void)cancelSelection
{
  objc_sync_enter(self);
  -[NSMutableSet removeAllObjects](self->_selection, "removeAllObjects");
  objc_sync_exit(self);
}

- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(id)a4 light:(id)a5
{
  SCNNode *v9;
  SCNNode *v10;
  SCNNode *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SCNNode *v18;
  SCNNode *v19;
  SCNSphere *v20;
  SCNNode *v21;
  double v22;
  SCNGeometry *v23;
  uint64_t v24;
  SCNProgram *v25;
  uint64_t v26;
  SCNNode *v27;
  SCNGeometry *LineGeometry;
  SCNNode *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  SCNNode *v35;
  SCNGeometry *v36;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  SCNNode *v49;
  SCNVector3 v50;
  SCNVector3 v51;
  SCNVector3 v52;
  SCNVector3 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  void *v57[2];
  void *v58[2];
  __int128 v59;
  void *__p[2];
  __int128 v61;
  SCNVector3 v62;
  SCNVector3 v63;

  objc_msgSend(a3, "removeAllChilds");
  objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a5, "type"), CFSTR("SCNDebugLightTypeKey"));
  objc_msgSend(a3, "setValue:forKey:", 0, CFSTR("SCNDebugLightSubTypeKey"));
  if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("ambient")) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("omni")))
    {
      *(_OWORD *)__p = 0u;
      v61 = 0u;
      *(_OWORD *)v58 = 0u;
      v59 = 0u;
      *(_OWORD *)v57 = 0u;
      Mesh::AppendWireframeSphere((Mesh *)v57, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
      v9 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateLineGeometry((Mesh *)v57));
      -[SCNNode setName:](v9, "setName:", CFSTR("lightInnerAuth"));
      -[SCNNode setAuthoringEnvironmentNode:](v9, "setAuthoringEnvironmentNode:", 1);
      -[SCNNode setHittable:](v9, "setHittable:", 0);
      objc_msgSend(a3, "addChildNode:", v9);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v58[1])
      {
        *(void **)&v59 = v58[1];
        operator delete(v58[1]);
      }
      if (v57[0])
      {
        v57[1] = v57[0];
        operator delete(v57[0]);
      }
      *(_OWORD *)__p = 0u;
      v61 = 0u;
      *(_OWORD *)v58 = 0u;
      v59 = 0u;
      *(_OWORD *)v57 = 0u;
      Mesh::AppendWireframeSphere((Mesh *)v57, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
      v10 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateLineGeometry((Mesh *)v57));
      -[SCNNode setName:](v10, "setName:", CFSTR("lightOuterAuth"));
      -[SCNNode setAuthoringEnvironmentNode:](v10, "setAuthoringEnvironmentNode:", 1);
      -[SCNNode setHittable:](v10, "setHittable:", 0);
      objc_msgSend(a3, "addChildNode:", v10);
    }
    else
    {
      if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("directional")) & 1) == 0
        && !objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("ies")))
      {
        if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("spot")))
        {
          v19 = +[SCNNode node](SCNNode, "node");
          -[SCNNode setName:](v19, "setName:", CFSTR("lightSpotAuth"));
          -[SCNNode setAuthoringEnvironmentNode:](v19, "setAuthoringEnvironmentNode:", 1);
          -[SCNNode setHittable:](v19, "setHittable:", 0);
          objc_msgSend(a3, "addChildNode:", v19);
          return;
        }
        if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("probe")))
        {
          v20 = +[SCNSphere sphereWithRadius:](SCNSphere, "sphereWithRadius:", dbl_1DD02A990[objc_msgSend(a5, "probeType") == 1]);
          -[SCNGeometry setName:](v20, "setName:", CFSTR("probeGeometry"));
          if (objc_msgSend(a5, "probeType"))
          {
            *(_OWORD *)__p = 0u;
            v61 = 0u;
            *(_OWORD *)v58 = 0u;
            v59 = 0u;
            *(_OWORD *)v57 = 0u;
            v63.x = 1.0;
            v63.y = 1.0;
            v63.z = 1.0;
            Mesh::AppendWireframeBox((Mesh *)v57, &SCNVector3Zero, v63, (const C3DColor4 *)C3DAuthoringEnvironmentColorRed);
            v21 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateLineGeometry((Mesh *)v57));
            -[SCNNode setName:](v21, "setName:", CFSTR("lightProbeExtents"));
            -[SCNNode setAuthoringEnvironmentNode:](v21, "setAuthoringEnvironmentNode:", 1);
            -[SCNNode setHittable:](v21, "setHittable:", 0);
            objc_msgSend(a3, "addChildNode:", v21);
            vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v57);
            -[SCNMaterial setColorBufferWriteMask:](-[SCNGeometry firstMaterial](v20, "firstMaterial"), "setColorBufferWriteMask:", 0);
          }
          else
          {
            v24 = objc_msgSend(a5, "_sphericalHarmonics");
            objc_msgSend((id)objc_msgSend(-[SCNGeometry material](v20, "material"), "diffuse"), "setColor:", self->_white);
            objc_msgSend(-[SCNGeometry material](v20, "material"), "setLightingModelName:", CFSTR("SCNLightingModelConstant"));
            if (v24)
            {
              v25 = +[SCNProgram program](SCNProgram, "program");
              v26 = -[SCNMTLRenderContext resourceManager]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"));
              -[SCNProgram setLibrary:](v25, "setLibrary:", objc_msgSend((id)-[SCNMTLResourceManager libraryManager](v26), "frameworkLibrary"));
              -[SCNProgram setVertexFunctionName:](v25, "setVertexFunctionName:", CFSTR("scn_probesphere_from_sh_vertex"));
              -[SCNProgram setFragmentFunctionName:](v25, "setFragmentFunctionName:", CFSTR("scn_probesphere_from_sh_fragment"));
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke;
              v56[3] = &unk_1EA5A2BA8;
              v56[4] = a5;
              -[SCNProgram handleBindingOfBufferNamed:frequency:usingBlock:](v25, "handleBindingOfBufferNamed:frequency:usingBlock:", CFSTR("sh"), 1, v56);
              objc_msgSend(-[SCNGeometry material](v20, "material"), "setProgram:", v25);
            }
          }
          v27 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v20);
          -[SCNNode setName:](v27, "setName:", CFSTR("probe"));
          -[SCNNode setAuthoringEnvironmentNode:](v27, "setAuthoringEnvironmentNode:", 1);
          -[SCNNode setAuthoringEnvironmentCompanionNode:](v27, "setAuthoringEnvironmentCompanionNode:", a4);
          objc_msgSend(a4, "setAuthoringEnvironmentPresentationNode:", v27);
          -[SCNNode setHittable:](v27, "setHittable:", 1);
          objc_msgSend(a3, "addChildNode:", v27);
          *(_OWORD *)__p = 0u;
          v61 = 0u;
          *(_OWORD *)v58 = 0u;
          v59 = 0u;
          *(_OWORD *)v57 = 0u;
          Mesh::AppendWireframeSphere((Mesh *)v57, 1.0, 3u, &C3DAuthoringEnvironmentColorGrayMedium);
          LineGeometry = Mesh::CreateLineGeometry((Mesh *)v57);
          vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v57);
          v29 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", LineGeometry);
          -[SCNNode setName:](v29, "setName:", CFSTR("lightInnerAuth"));
          -[SCNNode setAuthoringEnvironmentNode:](v29, "setAuthoringEnvironmentNode:", 1);
          -[SCNNode setHittable:](v29, "setHittable:", 0);
          objc_msgSend(a5, "zFar");
          v30 = 0.5;
          v32 = v31 * 0.5;
          *(float *)&v32 = v32;
          LODWORD(v30) = LODWORD(v32);
          LODWORD(v33) = LODWORD(v32);
          -[SCNNode setScale:](v29, "setScale:", v32, v30, v33);
          v34 = a3;
          v35 = v29;
        }
        else
        {
          if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("area")))
            return;
          v54 = 0u;
          v55 = 0u;
          *(_QWORD *)&v22 = C3DLightGetAreaDescription(objc_msgSend(a5, "lightRef"), &v54).n128_u64[0];
          objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v54, v22), CFSTR("SCNDebugLightSubTypeKey"));
          switch((char)v54)
          {
            case 0:
              *(_OWORD *)__p = 0u;
              v61 = 0u;
              *(_OWORD *)v58 = 0u;
              v59 = 0u;
              *(_OWORD *)v57 = 0u;
              *(_QWORD *)&v53.x = 3212836864;
              v53.z = 0.0;
              *(_QWORD *)&v52.x = 1065353216;
              v52.z = 0.0;
              Mesh::AppendSegment((Mesh *)v57, &v53, &v52, &C3DAuthoringEnvironmentColorOrange, &C3DAuthoringEnvironmentColorOrange);
              v23 = Mesh::CreateLineGeometry((Mesh *)v57);
              goto LABEL_48;
            case 1:
              *(_OWORD *)__p = 0u;
              v61 = 0u;
              *(_OWORD *)v58 = 0u;
              v59 = 0u;
              *(_OWORD *)v57 = 0u;
              *(_QWORD *)&v53.x = 0x3F800000BF800000;
              v53.z = 0.0;
              __asm { FMOV            V0.2S, #1.0 }
              *(_QWORD *)&v52.x = _D0;
              v52.z = 0.0;
              *(_QWORD *)&v51.x = 0xBF8000003F800000;
              v51.z = 0.0;
              __asm { FMOV            V0.2S, #-1.0 }
              *(_QWORD *)&v50.x = _D0;
              v50.z = 0.0;
              Mesh::AppendQuad((Mesh *)v57, &v53, &v52, &v51, &v50, &C3DAuthoringEnvironmentColorOrange);
              v23 = Mesh::CreateLineGeometry((Mesh *)v57);
              goto LABEL_48;
            case 2:
              *(_OWORD *)__p = 0u;
              v61 = 0u;
              *(_OWORD *)v58 = 0u;
              v59 = 0u;
              *(_OWORD *)v57 = 0u;
              Mesh::AppendWireframeXYDisk((Mesh *)v57, 1.0, &C3DAuthoringEnvironmentColorOrange);
              v23 = Mesh::CreateLineGeometry((Mesh *)v57);
              goto LABEL_48;
            case 3:
              *(_OWORD *)__p = 0u;
              v61 = 0u;
              *(_OWORD *)v58 = 0u;
              v59 = 0u;
              *(_OWORD *)v57 = 0u;
              Mesh::AppendWireframeSphere((Mesh *)v57, 1.0, 3u, &C3DAuthoringEnvironmentColorOrange);
              v23 = Mesh::CreateLineGeometry((Mesh *)v57);
              goto LABEL_48;
            case 4:
              *(_OWORD *)__p = 0u;
              v61 = 0u;
              *(_OWORD *)v58 = 0u;
              v59 = 0u;
              *(_OWORD *)v57 = 0u;
              v43 = v55;
              if ((_BYTE)v55)
              {
                v44 = 0;
                v45 = v55 - 1;
                do
                {
                  v46 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v44);
                  if (v45 == (_DWORD)v44)
                    v47 = 0;
                  else
                    v47 = v44 + 1;
                  v48 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v47);
                  v53.x = -*(float *)&v46;
                  v53.y = *((float *)&v46 + 1);
                  v53.z = 0.0;
                  v52.x = -*(float *)&v48;
                  v52.y = *((float *)&v48 + 1);
                  v52.z = 0.0;
                  Mesh::AppendSegment((Mesh *)v57, &v53, &v52, &C3DAuthoringEnvironmentColorOrange, &C3DAuthoringEnvironmentColorOrange);
                  ++v44;
                }
                while (v43 != v44);
              }
              v23 = Mesh::CreateLineGeometry((Mesh *)v57);
LABEL_48:
              v36 = v23;
              vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v57);
              break;
            default:
              v36 = 0;
              break;
          }
          v49 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v36);
          -[SCNNode setName:](v49, "setName:", CFSTR("lightAreaAuth"));
          -[SCNNode setAuthoringEnvironmentNode:](v49, "setAuthoringEnvironmentNode:", 1);
          -[SCNNode setAuthoringEnvironmentCompanionNode:](v49, "setAuthoringEnvironmentCompanionNode:", a4);
          v34 = a3;
          v35 = v49;
        }
        objc_msgSend(v34, "addChildNode:", v35);
        return;
      }
      *(_OWORD *)__p = 0u;
      v61 = 0u;
      *(_OWORD *)v58 = 0u;
      v59 = 0u;
      *(_OWORD *)v57 = 0u;
      Mesh::AppendZUpArrow((Mesh *)v57, &C3DAuthoringEnvironmentColorOrange);
      v11 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateTriangleGeometry((Mesh *)v57));
      -[SCNNode setName:](v11, "setName:", CFSTR("lightArrowAuth"));
      -[SCNNode setAuthoringEnvironmentNode:](v11, "setAuthoringEnvironmentNode:", 1);
      LODWORD(v12) = 1078530011;
      LODWORD(v13) = 0;
      LODWORD(v14) = 0;
      -[SCNNode setEulerAngles:](v11, "setEulerAngles:", v12, v13, v14);
      LODWORD(v15) = 10.0;
      LODWORD(v16) = 10.0;
      LODWORD(v17) = 10.0;
      -[SCNNode setScale:](v11, "setScale:", v15, v16, v17);
      -[SCNNode setHittable:](v11, "setHittable:", 0);
      objc_msgSend(a3, "addChildNode:", v11);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v58[1])
      {
        *(void **)&v59 = v58[1];
        operator delete(v58[1]);
      }
      if (v57[0])
      {
        v57[1] = v57[0];
        operator delete(v57[0]);
      }
      *(_OWORD *)__p = 0u;
      v61 = 0u;
      *(_OWORD *)v58 = 0u;
      v59 = 0u;
      *(_OWORD *)v57 = 0u;
      *(_QWORD *)&v54 = 0;
      DWORD2(v54) = 0;
      v62.x = 1.0;
      v62.y = 1.0;
      v62.z = 0.5;
      Mesh::AppendWireframeBox((Mesh *)v57, (const SCNVector3 *)&v54, v62, &C3DAuthoringEnvironmentColorOrange);
      v18 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", Mesh::CreateLineGeometry((Mesh *)v57));
      -[SCNNode setSimdPivot:](v18, "setSimdPivot:", *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), 0.0);
      -[SCNNode setName:](v18, "setName:", CFSTR("lightShadowAuth"));
      -[SCNNode setAuthoringEnvironmentNode:](v18, "setAuthoringEnvironmentNode:", 1);
      -[SCNNode setHittable:](v18, "setHittable:", 0);
      objc_msgSend(a3, "addChildNode:", v18);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v58[1])
    {
      *(void **)&v59 = v58[1];
      operator delete(v58[1]);
    }
    if (v57[0])
    {
      v57[1] = v57[0];
      operator delete(v57[0]);
    }
  }
}

void __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_sphericalHarmonics");
  v4 = C3DDeduceSphericalHarmonicsOrderFromDataLength(objc_msgSend(v3, "length"));
  v5 = objc_msgSend(v3, "bytes");
  if (v4 == 3)
  {
    objc_msgSend(a2, "writeBytes:length:", v5, objc_msgSend(v3, "length"));
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke_cold_1(v4, v6);
  }
}

- (void)updateLightTypeForNode:(id)a3 source:(id)a4 light:(id)a5 screenspaceScalingFactor:(float)a6
{
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int32x2_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  float v35;
  double v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  void *v43;
  void *v44;
  uint64_t v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  double v51;
  float64x2_t v52;
  float64_t v53;
  int v54;
  uint64_t v56;
  float v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  float32x4_t v63;
  uint64_t v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  int v78;
  double v79;
  void *v80;
  float32x4_t v81;
  float32x4_t v86;
  float32x4_t v87;
  int v88;
  float64_t v89;
  double v90;
  uint64_t v91;
  int32x2_t v92;
  id v93;
  double v94;
  double v95;
  float32x4_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[6];
  char v100;
  SCNVector3 v101;
  SCNVector3 v102;
  void *v103[2];
  void *v104[2];
  __int128 v105;
  __int128 __p;
  __int128 v107;

  v11 = objc_msgSend(a3, "valueForKey:", CFSTR("SCNDebugLightTypeKey"));
  v12 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("SCNDebugLightSubTypeKey"));
  v13 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("disabled")), "BOOLValue");
  v14 = 0;
  if (-[NSMutableSet count](self->_selection, "count") && a4)
  {
    v15 = a4;
    do
    {
      v14 = -[NSMutableSet containsObject:](self->_selection, "containsObject:", v15);
      v16 = objc_msgSend(v15, "parentNode");
      if ((v14 & 1) != 0)
        break;
      v15 = (id)v16;
    }
    while (v16);
  }
  v93 = a4;
  v17 = objc_msgSend(a4, "isHidden") & (v14 ^ 1);
  v18 = v13 ^ v17;
  if ((v13 ^ v17) == 1)
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17), CFSTR("disabled"));
  if (objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count")
    && objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("probe")))
  {
    if (((v14 | v18) & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      v91 = objc_msgSend(a5, "_sphericalHarmonics");
      v97 = objc_msgSend((id)objc_msgSend(a5, "probeEnvironment"), "contents");
      v19 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "childNodeWithName:recursively:", CFSTR("probe"), 1), "geometry"), "firstMaterial");
      v20 = v19;
      if (v19)
      {
        v21 = objc_msgSend(v19, "program") != 0;
        LODWORD(v20) = objc_msgSend((id)objc_msgSend(v20, "reflective"), "contents") != 0;
      }
      else
      {
        v21 = 0;
      }
      if (objc_msgSend(a5, "probeType"))
      {
        v18 = (v97 != 0) ^ v20;
      }
      else if (a5)
      {
        v18 = (v91 != 0) ^ v21;
      }
      else
      {
        v18 = 0;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("area")))
  {
    v23 = objc_msgSend(a5, "areaType");
    if (v23 != objc_msgSend(v12, "integerValue"))
      v18 = 1;
  }
  v24 = v93;
  *(float *)&v22 = fmaxf(a6, 0.001);
  v98 = v22;
  if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", v11) || v18)
    -[SCNAuthoringEnvironment2 _resetLightAuthoringWithContainerNode:source:light:](self, "_resetLightAuthoringWithContainerNode:source:light:", a3, v93, a5);
  v25.i32[1] = HIDWORD(v98);
  *(float *)v25.i32 = 1.0 / *(float *)&v98;
  v92 = v25;
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("omni")))
  {
    v26 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    objc_msgSend(a5, "attenuationStartDistance");
    v28 = v27 * *(float *)v92.i32;
    *(float *)&v28 = v28;
    if (*(float *)&v28 < 0.0)
      *(float *)&v28 = 0.0;
    v94 = v28;
    objc_msgSend(v26, "setSimdScale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v28, 0).i64);
    objc_msgSend(v26, "setHidden:", *(float *)&v94 == 0.0, v94);
    v29 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 1);
    objc_msgSend(a5, "attenuationEndDistance");
    v31 = v30 * *(float *)v92.i32;
    *(float *)&v31 = v31;
    if (*(float *)&v31 < 0.0)
      *(float *)&v31 = 0.0;
    v95 = v31;
    objc_msgSend(v29, "setSimdScale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v31, 0).i64);
    objc_msgSend(v29, "setHidden:", *(float *)&v95 == 0.0, v95);
    if (objc_msgSend(v24, "isHidden"))
    {
      v32 = 272;
      if (v14)
        v32 = 256;
      v33 = *(uint64_t *)((char *)&self->super.isa + v32);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
    }
    else
    {
      v47 = 240;
      if (v14)
      {
        v47 = 256;
        v48 = 256;
      }
      else
      {
        v48 = 248;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v47));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v48));
      v33 = *(uint64_t *)((char *)&self->super.isa + v48);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
    goto LABEL_85;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("spot")))
  {
    objc_msgSend(a5, "spotOuterAngle");
    v35 = fmin(v34 / 180.0 * 3.14159265, 3.13159265);
    objc_msgSend(a5, "spotInnerAngle");
    v37 = v36 / 180.0 * 3.14159265;
    if (v37 >= v35)
      v38 = v35;
    else
      v38 = v37;
    objc_msgSend(a5, "attenuationStartDistance");
    v40 = v39;
    objc_msgSend(a5, "attenuationEndDistance");
    v42 = v41;
    v43 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("oa:%f ia:%f s:%f e:%f"), v35, v38, v40, v42);
    v45 = objc_msgSend(v43, "valueForKey:", CFSTR("AuthEnvHash"));
    if (!v45 || objc_msgSend(v44, "compare:", v45))
    {
      __p = 0u;
      v107 = 0u;
      *(_OWORD *)v104 = 0u;
      v105 = 0u;
      *(_OWORD *)v103 = 0u;
      v102.z = 0.0;
      *(_QWORD *)&v102.x = 0;
      *(_QWORD *)&v101.x = 0;
      v101.z = -1.0;
      if (v40 > 0.0 || v42 > 0.0)
      {
        if (v40 > 0.0)
          Mesh::AppendSphericalCap((Mesh *)v103, v40, v35 * 0.5, &C3DAuthoringEnvironmentColorGrayMedium);
        if (v42 > 0.0)
          Mesh::AppendSphericalCap((Mesh *)v103, v42, v35 * 0.5, &C3DAuthoringEnvironmentColorGrayMedium);
      }
      else
      {
        v46 = tanf(v35 * 0.5);
        Mesh::AppendCone((Mesh *)v103, &v102, &v101, 20.0, v46 * 20.0, &C3DAuthoringEnvironmentColorOrange);
      }
      if (v38 > 0.0)
      {
        if (v42 <= 0.0)
          v42 = 20.0;
        v57 = tanf(v38 * 0.5);
        Mesh::AppendCone((Mesh *)v103, &v102, &v101, v42, v42 * v57, &C3DAuthoringEnvironmentColorOrange);
      }
      objc_msgSend(v43, "setGeometry:", Mesh::CreateLineGeometry((Mesh *)v103));
      objc_msgSend(v43, "setValue:forKey:", v44, CFSTR("AuthEnvHash"));
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      if (v104[1])
      {
        *(void **)&v105 = v104[1];
        operator delete(v104[1]);
      }
      if (v103[0])
      {
        v103[1] = v103[0];
        operator delete(v103[0]);
      }
    }
    objc_msgSend(v43, "setSimdScale:", *(double *)vdupq_lane_s32(v92, 0).i64);
    if (objc_msgSend(v93, "isHidden"))
    {
      if (v14)
        v58 = 256;
      else
        v58 = 272;
      v59 = *(uint64_t *)((char *)&self->super.isa + v58);
    }
    else
    {
      v60 = 240;
      if (v14)
        v60 = 256;
      v59 = *(uint64_t *)((char *)&self->super.isa + v60);
      if (v14)
        v58 = 256;
      else
        v58 = 288;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v59);
    v61 = *(uint64_t *)((char *)&self->super.isa + v58);
    v62 = v43;
LABEL_84:
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v61);
    goto LABEL_85;
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("directional")) & 1) != 0
    || objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("ies")))
  {
    v49 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0), "setHidden:", v17);
    v50 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", v49 - 1);
    objc_msgSend(v50, "setHidden:", objc_msgSend(a5, "automaticallyAdjustsShadowProjection"));
    if ((objc_msgSend(a5, "automaticallyAdjustsShadowProjection") & 1) == 0)
    {
      objc_msgSend(a5, "zNear");
      objc_msgSend(v50, "setSimdPosition:", 0.0);
      objc_msgSend(a5, "orthographicScale");
      v89 = v51;
      objc_msgSend(a5, "orthographicScale");
      v52.f64[0] = v89;
      v52.f64[1] = v53;
      v90 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(v52, *(float *)v92.i32)));
      objc_msgSend(a5, "zFar");
      objc_msgSend(a5, "zNear");
      objc_msgSend(v50, "setSimdScale:", v90);
    }
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __89__SCNAuthoringEnvironment2_updateLightTypeForNode_source_light_screenspaceScalingFactor___block_invoke;
    v99[3] = &unk_1EA5A2BD0;
    v100 = v14;
    v99[4] = v93;
    v99[5] = self;
    objc_msgSend(a3, "enumerateChildNodesUsingBlock:", v99);
    v54 = objc_msgSend(v93, "isHidden");
    _ZF = v14 == 0;
    if (v54)
      v56 = 272;
    else
      v56 = 240;
LABEL_81:
    if (!_ZF)
      v56 = 256;
    v61 = *(uint64_t *)((char *)&self->super.isa + v56);
    v62 = a3;
    goto LABEL_84;
  }
  if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("probe")))
  {
    if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("area")))
      goto LABEL_85;
    *(_OWORD *)v103 = 0u;
    *(_OWORD *)v104 = 0u;
    v80 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes", C3DLightGetAreaDescription(objc_msgSend(a5, "lightRef"), (__int128 *)v103).n128_f64[0]), "objectAtIndexedSubscript:", 0);
    objc_msgSend(v80, "setSimdScale:", *(double *)vdupq_lane_s32(v92, 0).i64);
    switch(LOBYTE(v103[0]))
    {
      case 0:
        __asm { FMOV            V0.4S, #1.0 }
        _Q0.i32[0] = (__int32)v104[0];
        v96 = _Q0;
        goto LABEL_97;
      case 1:
      case 2:
        v81 = *(float32x4_t *)v104;
        v81.i32[2] = 1.0;
        v96 = v81;
LABEL_97:
        objc_msgSend(v80, "simdScale");
        v87 = v96;
        goto LABEL_99;
      case 3:
        objc_msgSend(v80, "simdScale");
        v87 = *(float32x4_t *)v104;
LABEL_99:
        objc_msgSend(v80, "setSimdScale:", *(double *)vmulq_f32(v86, v87).i64);
        break;
      default:
        break;
    }
    v88 = objc_msgSend(v24, "isHidden");
    v56 = 240;
    if (v88)
      v56 = 272;
    _ZF = v14 == 0;
    goto LABEL_81;
  }
  v64 = 288;
  if (v14)
    v64 = 256;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v64));
  objc_msgSend(a3, "setHidden:", (self->_displayMask & 0x200) == 0);
  v65 = (void *)objc_msgSend(a3, "childNodeWithName:recursively:", CFSTR("lightInnerAuth"), 0);
  objc_msgSend(v65, "setHidden:", v14 ^ 1u);
  objc_msgSend(a5, "zFar");
  v66 = 0.5;
  v68 = v67 * 0.5;
  *(float *)&v68 = v68;
  LODWORD(v66) = LODWORD(v68);
  LODWORD(v69) = LODWORD(v68);
  objc_msgSend(v65, "setScale:", v68, v66, v69);
  v70 = (void *)objc_msgSend(a3, "childNodeWithName:recursively:", CFSTR("lightProbeExtents"), 0);
  objc_msgSend(a5, "probeExtents");
  v71.i64[0] = 0x3F0000003F000000;
  v71.i64[1] = 0x3F0000003F000000;
  v73 = vmulq_f32(v72, v71);
  v71.i32[0] = v73.i32[1];
  LODWORD(v74) = v73.i32[2];
  objc_msgSend(v70, "setScale:", *(double *)v73.i64, *(double *)v71.i64, v74);
  v75 = (void *)objc_msgSend(a3, "childNodeWithName:recursively:", CFSTR("probe"), 0);
  objc_msgSend(a5, "probeOffset");
  LODWORD(v77) = HIDWORD(v76);
  LODWORD(v79) = v78;
  objc_msgSend(v75, "setPosition:", v76, v77, v79);
LABEL_85:
  if (a5)
  {
    if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", CFSTR("probe")) & 1) == 0)
    {
      objc_msgSend(a3, "simdScale");
      objc_msgSend(a3, "setSimdScale:", *(double *)vmulq_n_f32(v63, *(float *)&v98).i64);
      objc_msgSend(a3, "setHidden:", (self->_displayMask & 0x20) == 0);
    }
  }
}

uint64_t __89__SCNAuthoringEnvironment2_updateLightTypeForNode_source_light_screenspaceScalingFactor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(a2, "authoringEnvironmentNode");
  if ((_DWORD)result)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isHidden");
    v6 = 288;
    if (v5)
      v6 = 272;
    v7 = 256;
    if (!*(_BYTE *)(a1 + 48))
      v7 = v6;
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + v7));
  }
  return result;
}

- (void)updateLightNode:(id)a3 withSourceNode:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;

  v7 = objc_msgSend(a4, "light");
  if (v7)
  {
    v8 = (void *)v7;
    if (-[SCNRenderer pointOfView](self->_renderer, "pointOfView") == a4)
      v9 = 1;
    else
      v9 = objc_msgSend(a4, "isHidden");
    objc_msgSend(a3, "setHidden:", v9);
    if ((objc_msgSend(a3, "isHidden") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a4, "presentationNode"), "simdWorldTransform");
      objc_msgSend(a3, "setSimdWorldTransform:");
      v10 = objc_msgSend((id)objc_msgSend(v8, "type"), "isEqualToString:", CFSTR("probe"));
      C3DSizeForScreenSpaceSizeAndTransform((__n128 *)-[SCNRenderer _engineContext](self->_renderer, "_engineContext"));
      -[SCNAuthoringEnvironment2 updateLightTypeForNode:source:light:screenspaceScalingFactor:](self, "updateLightTypeForNode:source:light:screenspaceScalingFactor:", a3, a4, v8);
      if (v10)
        objc_msgSend(a3, "setHidden:", (self->_displayMask & 0x200) == 0);
    }
  }
  else
  {
    -[SCNAuthoringEnvironment2 removeLightNode:](self, "removeLightNode:", a4);
  }
}

- (void)updateParticlesNode:(id)a3 withSourceNode:(id)a4
{
  void *v7;
  __C3DEngineContext *v8;
  int v9;
  int v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  __int128 v25;
  _OWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  if (!objc_msgSend(a4, "particleSystems") || !objc_msgSend((id)objc_msgSend(a4, "particleSystems"), "count"))
  {
    -[SCNAuthoringEnvironment2 removeParticlesNode:](self, "removeParticlesNode:", a4);
    return;
  }
  objc_msgSend(a3, "setHidden:", objc_msgSend(a4, "isHidden"));
  if ((objc_msgSend(a3, "isHidden") & 1) != 0)
    return;
  v7 = (void *)objc_msgSend(a4, "presentationNode");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  if (v7)
    objc_msgSend(v7, "worldTransform");
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  v26[3] = v30;
  objc_msgSend(a3, "setTransform:", v26);
  v8 = -[SCNRenderer _engineContext](self->_renderer, "_engineContext", C3DMatrix4x4FromSCNMatrix4(&v25, (uint64_t)&v27).n128_f64[0]);
  C3DSizeForScreenSpaceSizeAndTransform((__n128 *)v8);
  v10 = v9;
  if (a4)
  {
    v11 = a4;
    do
    {
      v12 = -[NSMutableSet containsObject:](self->_selection, "containsObject:", v11);
      v13 = objc_msgSend(v11, "parentNode");
      if ((v12 & 1) != 0)
        break;
      v11 = (id)v13;
    }
    while (v13);
  }
  else
  {
    v12 = 0;
  }
  v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
  v15 = objc_msgSend(v14, "isHidden");
  v16 = 240;
  if (v15)
    v16 = 272;
  if (v12)
    v16 = 256;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v16));
  v17 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count");
  v18 = 0;
  if (v17 == 2)
    v18 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 1);
  v19 = v12 ^ 1u;
  objc_msgSend(v18, "setHidden:", v19);
  if ((v19 & 1) != 0)
  {
    v24 = 0;
    goto LABEL_23;
  }
  v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "particleSystems"), "firstObject"), "presentationInstance"), "emitterShape");
  if (v20 != objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("sourceShape")), "unsignedLongValue"))
  {
    -[SCNAuthoringEnvironment2 setupParticleMeshEmitter:authoringNode:](self, "setupParticleMeshEmitter:authoringNode:", a4, a3);
    v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20);
LABEL_23:
    objc_msgSend(a3, "setValue:forKey:", v24, CFSTR("sourceShape"));
  }
  LODWORD(v21) = v10;
  LODWORD(v22) = v10;
  LODWORD(v23) = v10;
  objc_msgSend(v14, "setScale:", v21, v22, v23);
}

- (void)updateCameraNode:(id)a3 withSourceNode:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __C3DEngineContext *v15;
  double v16;
  float v17;
  double v18;
  double v19;
  uint64_t v20;
  float ZNear;
  float ZFar;
  int UsesOrthographicProjection;
  void *v24;
  long double OrthographicScale;
  double v26;
  void *v27;
  double v28;
  __n128 Viewport;
  float v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  _BOOL8 v40;
  uint64_t v41;
  __int128 v42;
  _OWORD v43[4];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v7 = objc_msgSend(a4, "camera");
  if (!v7)
  {
    -[SCNAuthoringEnvironment2 removeCameraNode:](self, "removeCameraNode:", a4);
    return;
  }
  v8 = (void *)v7;
  if (-[SCNRenderer pointOfView](self->_renderer, "pointOfView") == a4)
    v9 = 1;
  else
    v9 = objc_msgSend(a4, "isHidden");
  objc_msgSend(a3, "setHidden:", v9);
  if ((objc_msgSend(a3, "isHidden") & 1) == 0)
  {
    if (a4)
    {
      v10 = a4;
      do
      {
        v11 = -[NSMutableSet containsObject:](self->_selection, "containsObject:", v10);
        v12 = objc_msgSend(v10, "parentNode");
        if ((v11 & 1) != 0)
          break;
        v10 = (id)v12;
      }
      while (v12);
      if (v11)
        v13 = 256;
      else
        v13 = 200;
    }
    else
    {
      v13 = 200;
    }
    v14 = (void *)objc_msgSend(a4, "presentationNode");
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    if (v14)
      objc_msgSend(v14, "worldTransform");
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    v43[3] = v47;
    objc_msgSend(a3, "setTransform:", v43);
    v15 = -[SCNRenderer _engineContext](self->_renderer, "_engineContext", C3DMatrix4x4FromSCNMatrix4(&v42, (uint64_t)&v44).n128_f64[0]);
    C3DSizeForScreenSpaceSizeAndTransform((__n128 *)v15);
    v17 = *(float *)&v16;
    LODWORD(v18) = LODWORD(v16);
    LODWORD(v19) = LODWORD(v16);
    objc_msgSend(a3, "setScale:", v16, v18, v19);
    v20 = objc_msgSend(v8, "cameraRef");
    ZNear = C3DCameraGetZNear(v20);
    ZFar = C3DCameraGetZFar(v20);
    UsesOrthographicProjection = C3DCameraGetUsesOrthographicProjection(v20);
    v24 = (void *)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    if (UsesOrthographicProjection)
    {
      objc_msgSend(v24, "setGeometry:", -[SCNAuthoringEnvironment2 cameraOrthographicFrustumGeometry](self, "cameraOrthographicFrustumGeometry"));
      OrthographicScale = C3DCameraGetOrthographicScale(v20);
      *(float *)&OrthographicScale = OrthographicScale;
      *(float *)&OrthographicScale = *(float *)&OrthographicScale / v17;
      *(float *)&v26 = ZFar / v17;
      v27 = v24;
      LODWORD(v28) = LODWORD(OrthographicScale);
    }
    else
    {
      objc_msgSend(v24, "setGeometry:", -[SCNAuthoringEnvironment2 cameraFrustumGeometry](self, "cameraFrustumGeometry"));
      v41 = 0;
      Viewport = C3DEngineContextGetViewport((__n128 *)-[SCNRenderer _engineContext](self->_renderer, "_engineContext"));
      __asm { FMOV            V1.2S, #1.0 }
      Viewport.n128_u64[0] = (unint64_t)vmaxnm_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)Viewport, (int8x16_t)Viewport, 8uLL), _D1);
      C3DCameraGetEffectiveFovForAspectRatio(v20, (float *)&v41 + 1, (float *)&v41, vdiv_f32((float32x2_t)Viewport.n128_u64[0], (float32x2_t)vdup_lane_s32((int32x2_t)Viewport.n128_u64[0], 1)).f32[0]);
      if (v17 == 0.0)
      {
LABEL_22:
        v36 = (void *)objc_msgSend((id)objc_msgSend(v24, "childNodes"), "objectAtIndexedSubscript:", 0);
        *(float *)&v37 = ZNear / ZFar;
        *(float *)&v38 = ZNear / ZFar;
        *(float *)&v39 = ZNear / ZFar;
        objc_msgSend(v36, "setScale:", v37, v38, v39);
        v40 = (self->_displayMask & 4) == 0;
        objc_msgSend(v24, "setHidden:", v40);
        objc_msgSend(v36, "setHidden:", v40);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", self->_grayMedium);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v13));
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v13));
        return;
      }
      v35 = tan(*(float *)&v41 * 0.5 / 180.0 * 3.14159265) * ZFar;
      OrthographicScale = tan(*((float *)&v41 + 1) * 0.5 / 180.0 * 3.14159265) * ZFar;
      *(float *)&OrthographicScale = OrthographicScale;
      *(float *)&OrthographicScale = *(float *)&OrthographicScale / v17;
      *(float *)&v28 = v35 / v17;
      *(float *)&v26 = ZFar / v17;
      v27 = v24;
    }
    objc_msgSend(v27, "setScale:", (double)OrthographicScale, v28, v26);
    goto LABEL_22;
  }
}

- (void)updateFieldNode:(id)a3 withSourceNode:(id)a4
{
  id v4;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a4;
  if (objc_msgSend(a4, "physicsField"))
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(v4, "isHidden"));
    if ((objc_msgSend(a3, "isHidden") & 1) == 0)
    {
      v7 = (void *)objc_msgSend(v4, "presentationNode");
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      if (v7)
        objc_msgSend(v7, "worldTransform");
      v11[0] = v12;
      v11[1] = v13;
      v11[2] = v14;
      v11[3] = v15;
      objc_msgSend(a3, "setTransform:", v11);
      if (v4)
      {
        do
        {
          v8 = -[NSMutableSet containsObject:](self->_selection, "containsObject:", v4);
          v9 = objc_msgSend(v4, "parentNode");
          if ((v8 & 1) != 0)
            break;
          v4 = (id)v9;
        }
        while (v9);
        v10 = 200;
        if (v8)
          v10 = 256;
      }
      else
      {
        v10 = 200;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v10));
    }
  }
  else
  {
    -[SCNAuthoringEnvironment2 removePhysicsFieldNode:](self, "removePhysicsFieldNode:", v4);
  }
}

- (void)updateWithRenderer:(id)a3
{
  uint64_t v5;
  uint64_t RendererContextGL;
  int ShowsAuthoringEnvironment;
  uint64_t RenderContext;
  void *v9;
  void *v10;
  void *v11;
  NSOrderedSet *v12;
  uint64_t v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;

  objc_sync_enter(self);
  self->_renderer = (SCNRenderer *)a3;
  v5 = objc_msgSend(a3, "_engineContext");
  RendererContextGL = C3DEngineContextGetRendererContextGL(v5);
  if (RendererContextGL)
    ShowsAuthoringEnvironment = C3DRendererContextGetShowsAuthoringEnvironment(RendererContextGL);
  else
    ShowsAuthoringEnvironment = 0;
  RenderContext = C3DEngineContextGetRenderContext(v5);
  if (RenderContext)
    ShowsAuthoringEnvironment = -[SCNMTLRenderContext showsAuthoringEnvironment](RenderContext);
  if (ShowsAuthoringEnvironment)
  {
    if (!-[SCNNode isHidden](self->_lightRoot, "isHidden"))
      CFDictionaryApplyFunction(self->_lightsDictionary, (CFDictionaryApplierFunction)__UpdateLight, self);
    if (!-[SCNNode isHidden](self->_cameraRoot, "isHidden"))
      CFDictionaryApplyFunction(self->_camerasDictionary, (CFDictionaryApplierFunction)__UpdateCamera, self);
    if (!-[SCNNode isHidden](self->_particlesRoot, "isHidden"))
      CFDictionaryApplyFunction(self->_particlesDictionary, (CFDictionaryApplierFunction)__UpdateParticles, self);
    if (!-[SCNNode isHidden](self->_physicsFieldsRoot, "isHidden"))
      CFDictionaryApplyFunction(self->_physicsFieldsDictionary, (CFDictionaryApplierFunction)__UpdateFields, self);
    v9 = (void *)objc_msgSend(a3, "privateRendererOwner");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v9, "defaultCameraController"), "target");
      -[SCNNode setPosition:](self->_cameraTarget, "setPosition:");
    }
    -[SCNNode setHidden:](self->_cameraTarget, "setHidden:", 1);
  }
  -[SCNManipulator updateManipulatorPosition:](self->_manipulator, "updateManipulatorPosition:", v5);
  v10 = (void *)objc_msgSend(a3, "privateRendererOwner");
  v11 = v10;
  if (v10 && objc_msgSend(v10, "pointOfView"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v18 = -[NSOrderedSet count](-[SCNManipulator targets](self->_manipulator, "targets"), "count") == 0;
    v12 = -[SCNManipulator targets](self->_manipulator, "targets");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__SCNAuthoringEnvironment2_updateWithRenderer___block_invoke;
    v14[3] = &unk_1EA59F8D0;
    v14[4] = v11;
    v14[5] = &v15;
    -[NSOrderedSet enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v14);
    -[SCNNode setHidden:](-[SCNManipulator manipulatorNode](self->_manipulator, "manipulatorNode"), "setHidden:", *((unsigned __int8 *)v16 + 24) != 0);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    -[SCNNode setHidden:](-[SCNManipulator manipulatorNode](self->_manipulator, "manipulatorNode"), "setHidden:", 1);
  }
  if (ShowsAuthoringEnvironment == -[SCNNode isHidden](self->_layerRoot, "isHidden"))
  {
    v13 = ShowsAuthoringEnvironment ^ 1u;
    -[SCNNode setHidden:](self->_layerRoot, "setHidden:", v13);
    -[SCNNode setHidden:](self->_overlayLayerRoot, "setHidden:", v13);
  }
  self->_renderer = 0;
  objc_sync_exit(self);
}

uint64_t __47__SCNAuthoringEnvironment2_updateWithRenderer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = objc_msgSend(*(id *)(a1 + 32), "pointOfView");
  result = objc_msgSend(a2, "node");
  if (v7 == result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (SCNNode)authoringLayer
{
  return self->_layerRoot;
}

- (SCNNode)authoringOverlayLayer
{
  return self->_overlayLayerRoot;
}

- (int64_t)displayMask
{
  return self->_displayMask;
}

- (void)_updateRootsVisibility
{
  -[SCNNode setHidden:](self->_lightRoot, "setHidden:", (self->_displayMask & 0x228) == 0);
  -[SCNNode setHidden:](self->_particlesRoot, "setHidden:", (self->_displayMask & 0x28) == 0);
  -[SCNNode setHidden:](self->_cameraRoot, "setHidden:", (self->_displayMask & 0x14) == 0);
}

- (void)setDisplayMask:(int64_t)a3
{
  self->_displayMask = a3;
  -[SCNAuthoringEnvironment2 _updateRootsVisibility](self, "_updateRootsVisibility");
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4
{
  float32x4_t v7;
  id v8;
  double BoundingSphere;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  float32x4_t v16;
  float32x4_t v17;
  double v18;
  float32x4_t v19;
  float32x4_t v20;
  double v21;
  float32x4_t v22;
  float32x4_t v23;
  double v24;
  void *v25;
  void *v26;
  float32x4_t v27;
  float32x2_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  float32x4_t v32;
  unint64_t v33;
  float32x4_t v34;
  float32x4_t v35;
  double v36;
  float32x4_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "scene"))
  {
    objc_msgSend((id)objc_msgSend(a4, "defaultCameraController"), "simdTarget");
    v37 = v7;
    v8 = -[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_pointsOfViewRoot, "childNodes"), "objectAtIndexedSubscript:", a3);
    v38[0] = objc_msgSend((id)objc_msgSend(a4, "scene"), "rootNode");
    BoundingSphere = SCNNodeGetBoundingSphere((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1), 0x10000);
    v11 = v10;
    v13 = v12;
    objc_msgSend((id)objc_msgSend(v8, "camera", BoundingSphere), "zNear");
    v15 = v14;
    +[SCNNode simdLocalUp](SCNNode, "simdLocalUp");
    v35 = v16;
    +[SCNNode simdLocalRight](SCNNode, "simdLocalRight");
    v34 = v17;
    +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
    v20 = v19;
    v19.i64[0] = v11;
    v19.i64[1] = v13;
    *(float *)&v21 = v15;
    v22 = vsubq_f32(v37, v19);
    v23 = vmulq_f32(v22, v22);
    *(_QWORD *)&v24 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).u64[0];
    *(float *)&v24 = (float)(*((float *)&v13 + 1) + sqrtf(*(float *)&v24)) + *(float *)&v21;
    v36 = v24;
    switch(a3)
    {
      case 1:
        LODWORD(v24) = -1077342245;
        LODWORD(v18) = 0;
        LODWORD(v21) = 0;
        v25 = v8;
        goto LABEL_11;
      case 2:
        LODWORD(v24) = 1070141403;
        LODWORD(v18) = 0;
        LODWORD(v21) = 0;
        v26 = v8;
        goto LABEL_8;
      case 3:
        LODWORD(v18) = -1077342245;
        LODWORD(v24) = 0;
        LODWORD(v21) = 0;
        objc_msgSend(v8, "setEulerAngles:", v24, v18, v21);
        v28 = *(float32x2_t *)&v36;
        v27 = v37;
        v29 = v34;
        goto LABEL_9;
      case 4:
        LODWORD(v18) = 1070141403;
        LODWORD(v24) = 0;
        LODWORD(v21) = 0;
        objc_msgSend(v8, "setEulerAngles:", v24, v18, v21);
        v31 = *(float *)&v36;
        v30 = v37;
        v32 = v34;
        goto LABEL_12;
      case 5:
        LODWORD(v24) = 0;
        LODWORD(v18) = 0;
        LODWORD(v21) = 0;
        v26 = v8;
        v35 = v20;
LABEL_8:
        objc_msgSend(v26, "setEulerAngles:", v24, v18, v21);
        v28 = *(float32x2_t *)&v36;
        v27 = v37;
        v29 = v35;
LABEL_9:
        v33 = vmlsq_lane_f32(v27, v29, v28, 0).u64[0];
        goto LABEL_13;
      case 6:
        LODWORD(v18) = -1068953637;
        LODWORD(v24) = 0;
        LODWORD(v21) = 0;
        v25 = v8;
        v35 = v20;
LABEL_11:
        objc_msgSend(v25, "setEulerAngles:", v24, v18, v21);
        v31 = *(float *)&v36;
        v30 = v37;
        v32 = v35;
LABEL_12:
        v33 = vmlaq_n_f32(v30, v32, v31).u64[0];
LABEL_13:
        objc_msgSend(v8, "setSimdWorldPosition:", *(double *)&v33);
        break;
      default:
        break;
    }
    objc_msgSend(a4, "setPointOfView:", v8);
    objc_msgSend((id)objc_msgSend(a4, "defaultCameraController"), "setPointOfView:", v8);
  }
}

- (id)authoringCamera:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_pointsOfViewRoot, "childNodes"), "objectAtIndexedSubscript:", a3);
}

- (void)addLightNode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: light node already has an authoring node - skip", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addParticlesNode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: particle node already has an authoring node - skip", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addCameraNode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: camera node already has an authoring node - skip", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addPhysicsFieldNode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: physicsField node already has an authoring node - skip", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: SH order unsupported : %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

@end
