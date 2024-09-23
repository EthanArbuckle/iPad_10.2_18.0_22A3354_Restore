@implementation SCNCameraControlEventHandler

- (SCNCameraControlEventHandler)init
{
  SCNCameraControlEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  result = -[SCNEventHandler init](&v3, sel_init);
  if (result)
  {
    result->_zoomFactor = 1.0;
    *((_BYTE *)result + 312) |= 8u;
    *((_BYTE *)result + 312) &= ~2u;
    result->_friction = 0.05;
    result->_browseScaleFactor = 1.0;
    *((_BYTE *)result + 312) |= 0x20u;
    *((_BYTE *)result + 313) &= ~2u;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNNode removeFromParentNode](self->_freeViewCameraNode, "removeFromParentNode");

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  -[SCNEventHandler dealloc](&v3, sel_dealloc);
}

- (BOOL)enabled
{
  return *((_BYTE *)self + 312) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self + 312) = *((_BYTE *)self + 312) & 0xFE | a3;
  v4 = -[SCNCameraControlEventHandler gestureRecognizers](self, "gestureRecognizers");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", *((_BYTE *)self + 312) & 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (BOOL)allowsTranslation
{
  return (*((unsigned __int8 *)self + 312) >> 5) & 1;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 312) = *((_BYTE *)self + 312) & 0xDF | v3;
}

- (BOOL)enableInertia
{
  return (*((unsigned __int8 *)self + 312) >> 3) & 1;
}

- (void)setEnableInertia:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 312) = *((_BYTE *)self + 312) & 0xF7 | v3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (BOOL)gimbalLockMode
{
  return (*((unsigned __int8 *)self + 313) >> 1) & 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 313) = *((_BYTE *)self + 313) & 0xFD | v3;
}

- (SCNVector3)gimbalLockVector
{
  float v2;
  float v3;
  float v4;
  SCNVector3 result;

  v2 = 0.0;
  v3 = 1.0;
  v4 = 0.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setGimbalLockVector:(SCNVector3)a3
{
  NSLog(CFSTR("setGimbalLockVector is deprecated"), a2, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z);
}

- (BOOL)automaticCameraTarget
{
  return (*((unsigned __int8 *)self + 312) >> 1) & 1;
}

- (void)invalidateCameraTarget
{
  *((_BYTE *)self + 312) &= ~4u;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 312);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)self + 312) = v3 & 0xFD | v4;
    -[SCNCameraControlEventHandler invalidateCameraTarget](self, "invalidateCameraTarget");
  }
}

- (SCNVector3)cameraTarget
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_cameraTarget.x;
  y = self->_cameraTarget.y;
  z = self->_cameraTarget.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCameraTarget:(SCNVector3)a3
{
  self->_cameraTarget = a3;
}

- (id)freeCamera
{
  return self->_freeViewCameraNode;
}

- (void)focusNode:(id)a3
{
  float32x4_t v5;
  float originalFovX;
  float v7;
  unsigned int v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float v12;
  float v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  float32x4_t v20;
  uint64_t v21;
  __int32 v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  double v27;
  float v28;
  float32x4_t v29;
  __int32 v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float v34;
  float32x4_t v35;
  _OWORD v36[4];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[4];
  double v42;
  uint64_t v43;
  int v44;

  if (a3)
  {
    *((_BYTE *)self + 312) |= 0x10u;
    -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
    -[SCNCameraControlEventHandler setAutomaticCameraTarget:](self, "setAutomaticCameraTarget:", 0);
    v43 = 0;
    v44 = 0;
    -[SCNCameraControlEventHandler frontVector](self, "frontVector");
    v35 = v5;
    v42 = 0.0;
    if (objc_msgSend(a3, "getBoundingSphereCenter:radius:", &v43, &v42))
    {
      originalFovX = self->_originalFovX;
      if (originalFovX <= self->_originalFovY)
        originalFovX = self->_originalFovY;
      v7 = (float)(originalFovX * 0.5) / 180.0 * 3.14159265;
      memset(v41, 0, sizeof(v41));
      objc_msgSend(a3, "worldTransform");
      *(float *)&v8 = v42;
      v9.i64[0] = 0;
      v9.i64[1] = v8;
      v32 = v9;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      C3DMatrix4x4FromSCNMatrix4(&v37, (uint64_t)v41);
      v36[0] = v37;
      v36[1] = v38;
      v36[2] = v39;
      v36[3] = v40;
      *(float32x2_t *)v10.f32 = C3DVector3RotateAndScale((float32x2_t *)v36, v32);
      v11 = vmulq_f32(v10, v10);
      v12 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
      v42 = v12;
      v13 = tanf(v7);
      v14 = sqrt((float)((float)(v12 / v13) * (float)(v12 / v13)) + v12 * v12);
    }
    else
    {
      -[SCNCameraControlEventHandler _browseScale](self, "_browseScale");
      v14 = v15;
    }
    v16 = (void *)objc_msgSend(a3, "presentationNode");
    LODWORD(v18) = HIDWORD(v43);
    LODWORD(v17) = v43;
    LODWORD(v19) = v44;
    objc_msgSend(v16, "convertPosition:toNode:", 0, v17, v18, v19);
    v31 = v21;
    v33 = v20;
    v30 = v22;
    -[SCNCameraControlEventHandler setCameraTarget:](self, "setCameraTarget:");
    v23 = v35;
    v24 = vmulq_f32(v23, v23);
    v25 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
    if (v25 != 0.0)
    {
      v26 = v33;
      v26.i32[1] = v30;
      HIDWORD(v27) = HIDWORD(v31);
      v26.i32[2] = v31;
      v28 = v14;
      v34 = v28 / v25;
      v29 = vsubq_f32(v26, vmulq_n_f32(v35, v28 / v25));
      LODWORD(v27) = v29.i32[1];
      v23.i32[0] = v29.i32[2];
      -[SCNNode setPosition:](self->_freeViewCameraNode, "setPosition:", *(double *)v29.i64, v27, *(double *)v23.i64);
      self->_browseScaleFactor = v34;
    }
  }
  else
  {
    -[SCNCameraControlEventHandler setAutomaticCameraTarget:](self, "setAutomaticCameraTarget:", 1);
  }
}

- (unint64_t)stickyAxis
{
  return self->_stickyAxis;
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis = a3;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->super._enableFreeCamera = a3;
  if (!a3)
    -[SCNCameraControlEventHandler _resetFreeViewCamera](self, "_resetFreeViewCamera");
}

- (void)activateFreeCamera
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  -[SCNEventHandler activateFreeCamera](&v3, sel_activateFreeCamera);
  -[SCNCameraControlEventHandler _prepareFreeViewCamera](self, "_prepareFreeViewCamera");
}

- (void)_resetFreeViewCamera
{
  if (-[SCNNode sceneRef](self->_freeViewCameraNode, "sceneRef"))
    C3DRemoveSceneRef(-[SCNNode nodeRef](self->_freeViewCameraNode, "nodeRef"), (uint64_t)-[SCNNode sceneRef](self->_freeViewCameraNode, "sceneRef"));
  -[SCNNode removeFromParentNode](self->_freeViewCameraNode, "removeFromParentNode");

  self->_freeViewCameraNode = 0;
}

- (BOOL)_freeCameraActivated
{
  SCNNode *freeViewCameraNode;

  freeViewCameraNode = self->_freeViewCameraNode;
  return freeViewCameraNode
      && freeViewCameraNode == (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
}

- (void)_prepareFreeViewCamera
{
  SCNNode *v3;
  SCNNode *v4;
  SCNNode *v5;
  double v6;
  double v7;
  float v8;
  double v10;
  SCNNode *freeViewCameraNode;
  SCNNode *v12;
  SCNCamera *v13;
  SCNCamera *v14;
  _BOOL8 v15;
  SCNLight *v16;
  SCNNode *v17;
  double v18;
  __C3DCamera *v19;
  __C3DScene *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  SCNMatrix4 v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28[4];
  SCNMatrix4 v29;

  v3 = (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  v4 = v3;
  if (v3 && v3 == self->_freeViewCameraNode)
    return;
  v5 = -[SCNNode presentationNode](v3, "presentationNode");
  -[SCNCamera xFov](-[SCNNode camera](v5, "camera"), "xFov");
  *(float *)&v6 = v6;
  self->_originalFovX = *(float *)&v6;
  -[SCNCamera yFov](-[SCNNode camera](v5, "camera"), "yFov");
  v8 = v7;
  self->_originalFovY = v8;
  if (v8 == 0.0 && self->_originalFovX == 0.0)
    v8 = 60.0;
  self->_originalFovY = v8;
  -[SCNCamera orthographicScale](-[SCNNode camera](v5, "camera"), "orthographicScale");
  *(float *)&v10 = v10;
  self->_originalOrthoScale = *(float *)&v10;
  self->_zoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v4)
  {
    if (freeViewCameraNode)
      goto LABEL_15;
    v12 = +[SCNNode node](SCNNode, "node");
    goto LABEL_14;
  }
  if (v4 == freeViewCameraNode)
  {
    memset(&v29, 0, sizeof(v29));
LABEL_24:
    v17 = -[SCNNode presentationNode](v4, "presentationNode");
    if (v17)
      -[SCNNode worldTransform](v17, "worldTransform");
    else
      memset(&v29, 0, sizeof(v29));
    goto LABEL_27;
  }
  if (!freeViewCameraNode)
  {
    v12 = -[SCNNode copy](v4, "copy");
LABEL_14:
    self->_freeViewCameraNode = v12;
  }
LABEL_15:
  if (-[SCNNode camera](v4, "camera"))
  {
    v13 = (SCNCamera *)-[SCNCamera copy](-[SCNNode camera](v4, "camera"), "copy");
LABEL_17:
    v14 = v13;
    goto LABEL_18;
  }
  if (!-[SCNNode light](v4, "light"))
  {
    v13 = +[SCNCamera camera](SCNCamera, "camera");
    goto LABEL_17;
  }
  v16 = -[SCNNode light](v4, "light");
  v14 = +[SCNCamera camera](SCNCamera, "camera");
  if (v16)
  {
    -[SCNLight spotOuterAngle](v16, "spotOuterAngle");
    -[SCNCamera setFieldOfView:](v14, "setFieldOfView:");
    -[SCNCamera setFieldOfViewOrientation:](v14, "setFieldOfViewOrientation:", 0);
    -[SCNLight zNear](v16, "zNear");
    -[SCNCamera setZNear:](v14, "setZNear:");
    -[SCNLight zFar](v16, "zFar");
    -[SCNCamera setZFar:](v14, "setZFar:");
  }
LABEL_18:
  -[SCNNode setCamera:](self->_freeViewCameraNode, "setCamera:", v14);
  -[SCNNode setLight:](self->_freeViewCameraNode, "setLight:", 0);
  -[SCNNode setGeometry:](self->_freeViewCameraNode, "setGeometry:", 0);
  v15 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNNode removeAllAnimations](self->_freeViewCameraNode, "removeAllAnimations");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v15);
  memset(&v29, 0, sizeof(v29));
  if (v4)
    goto LABEL_24;
  v29 = SCNMatrix4Identity;
LABEL_27:
  memset(v28, 0, sizeof(v28));
  C3DMatrix4x4FromSCNMatrix4(v28, (uint64_t)&v29);
  v18 = C3DMatrix4x4Determinant3x3((uint64_t)v28);
  if (fabs(*(float *)&v18 + -1.0) > 0.00001)
  {
    v27.i32[2] = 0;
    v27.i64[0] = 0;
    v26.i32[2] = 0;
    v26.i64[0] = 0;
    v25 = 0uLL;
    C3DMatrix4x4GetAffineTransforms((uint64_t)v28, &v27, (int8x16_t *)&v25, &v26);
    C3DQuaternionNormalize(&v25);
    C3DMatrix4x4MakeAffine(v28, &v27, &v25, (float32x2_t *)&v26);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v28, &v29);
  }
  v24 = v29;
  -[SCNNode setTransform:](self->_freeViewCameraNode, "setTransform:", &v24);
  -[SCNNode setName:](self->_freeViewCameraNode, "setName:", CFSTR("kSCNFreeViewCameraName"));
  -[SCNCamera setName:](-[SCNNode camera](self->_freeViewCameraNode, "camera"), "setName:", objc_msgSend(CFSTR("kSCNFreeViewCameraName"), "stringByAppendingString:", CFSTR("Camera")));
  if (-[SCNView _showsAuthoringEnvironment](-[SCNEventHandler view](self, "view"), "_showsAuthoringEnvironment"))
  {
    -[SCNCamera setAutomaticallyAdjustsZRange:](-[SCNNode camera](self->_freeViewCameraNode, "camera"), "setAutomaticallyAdjustsZRange:", 1);
    v19 = -[SCNCamera cameraRef](-[SCNNode camera](self->_freeViewCameraNode, "camera"), "cameraRef");
    *((_BYTE *)v19 + 64) |= 4u;
  }
  v20 = -[SCNScene sceneRef](-[SCNView scene](-[SCNEventHandler view](self, "view"), "scene"), "sceneRef");
  if (v20)
  {
    v21 = (uint64_t)v20;
    if (!C3DGetSceneRef((uint64_t)-[SCNNode nodeRef](self->_freeViewCameraNode, "nodeRef")))
      C3DAddSceneRef((uint64_t *)-[SCNNode nodeRef](self->_freeViewCameraNode, "nodeRef"), v21);
  }
  -[SCNCameraControlEventHandler viewedObjectSphere](self, "viewedObjectSphere");
  *(_QWORD *)&self->_cameraTarget.x = v22;
  self->_cameraTarget.z = v23;
}

- (void)_installFreeViewCameraIfNeeded
{
  id v3;

  if (-[SCNEventHandler enableFreeCamera](self, "enableFreeCamera"))
  {
    v3 = -[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer");
    if ((SCNNode *)objc_msgSend(v3, "pointOfView") != self->_freeViewCameraNode)
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      objc_msgSend(v3, "setPointOfView:", self->_freeViewCameraNode);
      -[SCNCameraControlEventHandler updateBrowseScaleFactor](self, "updateBrowseScaleFactor");
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if (-[SCNEventHandler enableFreeCamera](self, "enableFreeCamera"))
  {
    if (!-[SCNCameraControlEventHandler _freeCameraActivated](self, "_freeCameraActivated"))
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      -[SCNCameraControlEventHandler _prepareFreeViewCamera](self, "_prepareFreeViewCamera");
      -[SCNCameraControlEventHandler _installFreeViewCameraIfNeeded](self, "_installFreeViewCameraIfNeeded");
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
  }
}

- (SCNVector3)cameraAutomaticTargetPoint
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  if ((*((_BYTE *)self + 312) & 4) == 0)
    -[SCNCameraControlEventHandler computeAutomaticTargetPoint](self, "computeAutomaticTargetPoint");
  x = self->_autoCameraTarget.x;
  y = self->_autoCameraTarget.y;
  z = self->_autoCameraTarget.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)computeAutomaticTargetPoint
{
  void *v3;
  double v4;
  double v5;
  float32x4_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  float32x4_t v11;
  __int32 v12;
  float v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float v20;
  float v21;
  float32x4_t v22;
  float v23;
  __int32 v24;
  float32x4_t v25;

  *((_BYTE *)self + 312) |= 4u;
  v3 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  -[SCNCameraControlEventHandler _browseScale](self, "_browseScale");
  v5 = v4;
  -[SCNCameraControlEventHandler frontVector](self, "frontVector");
  v22 = v6;
  v7 = (void *)objc_msgSend(v3, "presentationInstance");
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  objc_msgSend(v7, "convertPosition:toNode:", 0, v8, v9, v10);
  v24 = v12;
  v25 = v11;
  v23 = v13;
  if ((*((_BYTE *)self + 312) & 0x10) != 0)
  {
    v17 = v22;
  }
  else
  {
    -[SCNCameraControlEventHandler viewedObjectSphere](self, "viewedObjectSphere");
    v14 = v25;
    v14.i32[1] = v24;
    v14.f32[2] = v23;
    v16 = vsubq_f32(v15, v14);
    v17 = v22;
    v18 = vmulq_f32(v22, v16);
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0] > 0.5)
    {
      v19 = vmulq_f32(v16, v16);
      v5 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
    }
  }
  v20 = v5;
  *(float32x2_t *)&self->_autoCameraTarget.x = vadd_f32((float32x2_t)__PAIR64__(v24, v25.u32[0]), COERCE_FLOAT32X2_T(C3DVector3Rescale(v17, v20)));
  self->_autoCameraTarget.z = v23 + v21;
}

- (float)_translationCoef
{
  double v2;

  -[SCNCameraControlEventHandler _browseScale](self, "_browseScale");
  return v2 * 0.01;
}

- (double)_browseScale
{
  return self->_browseScaleFactor;
}

- (void)_resetBrowseScaleFactor
{
  void *v3;
  void *v4;
  float32x4_t v5;
  int8x8_t v6;
  float32x4_t v7;

  self->_browseScaleFactor = 1.0;
  v3 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "presentationNode", 0, 0, 0, 0, 0, 0);
    if (v4)
    {
      objc_msgSend(v4, "worldTransform");
      v5 = 0u;
      v6 = vext_s8(0, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v5, (int8x16_t)v5, 8uLL), 4uLL);
    }
    else
    {
      v6 = 0;
      v5.i32[0] = 0;
      v5.i32[3] = 0;
    }
    *(int8x8_t *)&v5.i32[1] = v6;
    v7 = vmulq_f32(v5, v5);
    self->_browseScaleFactor = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
  }
}

- (void)updateBrowseScaleFactor
{
  uint64_t v3;
  uint64_t v4;
  __int32 v5;
  void *v6;
  void *v7;
  float32x4_t v8;
  int8x8_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float v13;
  double v14;
  __int32 v15;
  __int32 v16;
  float32x4_t v17;

  if ((*((_BYTE *)self + 312) & 2) != 0)
    -[SCNCameraControlEventHandler cameraAutomaticTargetPoint](self, "cameraAutomaticTargetPoint");
  else
    -[SCNCameraControlEventHandler cameraTarget](self, "cameraTarget");
  v17.i64[0] = v3;
  v16 = v5;
  v6 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", v4), "renderer"), "pointOfView");
  v7 = (void *)objc_msgSend(v6, "presentationNode");
  if (v7)
  {
    objc_msgSend(v7, "worldTransform");
    v8 = 0u;
    v9 = vext_s8(0, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL), 4uLL);
  }
  else
  {
    v8.i32[0] = 0;
    v8.i32[3] = 0;
    v9 = 0;
  }
  v10 = v17;
  v10.i32[1] = v15;
  v10.i32[2] = v16;
  *(int8x8_t *)&v8.i32[1] = v9;
  v11 = vsubq_f32(v8, v10);
  v12 = vmulq_f32(v11, v11);
  v13 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
  v14 = v13;
  if (v13 <= 0.1)
    v13 = 0.1;
  self->_browseScaleFactor = v13;
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
  objc_msgSend((id)objc_msgSend(v6, "camera"), "setFocalDistance:", v14);
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (void)rotateOf:(double)a3
{
  void *v5;
  void *v6;
  float v7;
  _OWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];
  float32x4_t v14[4];

  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  *((_BYTE *)self + 313) &= ~1u;
  v5 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v5)
  {
    v6 = v5;
    memset(v14, 0, sizeof(v14));
    memset(v13, 0, sizeof(v13));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(v5, "transform");
    C3DMatrix4x4FromSCNMatrix4(v14, (uint64_t)&v9);
    v7 = a3 * -3.14159265 / 180.0;
    C3DMatrix4x4MakeRotationZ(v13, v7);
    C3DMatrix4x4Mult((uint64_t)v13, v14, v14);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v14, &v9);
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    objc_msgSend(v6, "setTransform:", v8);
  }
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  __n128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __n128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  float32x4_t v20[4];
  _OWORD v21[4];

  v4 = a4;
  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  v7 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v7)
  {
    v8 = v7;
    memset(v21, 0, sizeof(v21));
    memset(v20, 0, sizeof(v20));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "transform");
    v9.n128_u64[0] = 0;
    v9.n128_u32[3] = 0;
    v9.n128_f32[2] = a3 * -100.0;
    v15 = v9;
    C3DMatrix4x4MakeTranslation((uint64_t)v21, &v15);
    C3DMatrix4x4FromSCNMatrix4(v20, (uint64_t)&v16);
    v10 = C3DMatrix4x4Mult((uint64_t)v21, v20, v21);
    if (v4)
    {
      +[SCNTransaction begin](SCNTransaction, "begin", v10);
      +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.3);
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v21, &v16);
      v11 = v16;
      v12 = v17;
      v13 = v18;
      v14 = v19;
      objc_msgSend(v8, "setTransform:", &v11);
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
    else
    {
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v21, &v16);
      v11 = v16;
      v12 = v17;
      v13 = v18;
      v14 = v19;
      objc_msgSend(v8, "setTransform:", &v11);
    }
  }
}

- (void)zoomBy:(float)a3
{
  -[SCNCameraControlEventHandler zoomBy:animate:](self, "zoomBy:animate:", 1);
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  void *v5;
  float zoomFactor;
  float originalOrthoScale;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  float originalFovX;
  long double v24;
  long double v25;
  float v26;
  float originalFovY;
  long double v28;
  double v29;
  float v30;
  double v31;
  float v32;

  if (self->_zoomFactor == a3)
    return;
  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  v5 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (objc_msgSend((id)objc_msgSend(v5, "camera"), "usesOrthographicProjection"))
  {
    zoomFactor = self->_zoomFactor;
    if (zoomFactor != 0.0)
    {
      originalOrthoScale = self->_originalOrthoScale;
      -[SCNCameraControlEventHandler viewedObjectSphere](self, "viewedObjectSphere");
      v9 = v8;
      if (v8 == 0.0)
        return;
      v10 = (float)(originalOrthoScale / zoomFactor);
      -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
      v12 = v11;
      -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
      v14 = v9;
      v15 = v14 + v14;
      v16 = self->_originalOrthoScale;
      if (v14 + v14 <= v16)
        v15 = self->_originalOrthoScale;
      if (v15 <= v10)
      {
        if (self->_zoomFactor >= a3)
          return;
      }
      else
      {
        v17 = v14 * 0.1;
        v18 = v13;
        v19 = v12;
        if (v18 >= v19)
          v20 = v12;
        else
          v20 = v18;
        v21 = v20;
        if (v18 < v19)
          v18 = v12;
        v22 = v17 * (v21 / fmax(v18, 1.0));
        if (v22 <= v16)
          v16 = v22;
        if (v16 >= v10)
        {
          if (self->_zoomFactor <= a3)
            return;
        }
        else
        {
          objc_msgSend((id)objc_msgSend(v5, "camera"), "setOrthographicScale:", v10);
        }
      }
    }
LABEL_31:
    v32 = a3;
    self->_zoomFactor = v32;
    return;
  }
  originalFovX = self->_originalFovX;
  v24 = tan(originalFovX * 0.0174532925 * 0.5);
  v25 = atan(v24 / a3);
  v26 = (v25 + v25) / 3.14159265 * 180.0;
  originalFovY = self->_originalFovY;
  v28 = tan(originalFovY * 0.0174532925 * 0.5);
  v29 = atan(v28 / a3);
  if ((originalFovX <= 0.0 || v26 > 1.0) && v26 < 120.0)
  {
    v30 = (v29 + v29) / 3.14159265 * 180.0;
    if ((originalFovY <= 0.0 || v30 > 1.0) && v30 < 120.0)
    {
      if (v5)
      {
        v31 = v30;
        objc_msgSend((id)objc_msgSend(v5, "camera"), "setXFov:", v26);
        objc_msgSend((id)objc_msgSend(v5, "camera"), "setYFov:", v31);
      }
      goto LABEL_31;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  uint64_t v9;
  void *v10;
  float v11;
  float browseScaleFactor;
  float v14;
  double v15;
  float v17;
  SCNMatrix4 v18;
  SCNMatrix4 b;
  SCNMatrix4 a;
  SCNMatrix4 v21;
  SCNMatrix4 v22;

  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  v9 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v9)
  {
    v10 = (void *)v9;
    -[SCNCameraControlEventHandler cameraAutomaticTargetPoint](self, "cameraAutomaticTargetPoint");
    memset(&v22, 0, sizeof(v22));
    objc_msgSend(v10, "transform");
    -[SCNCameraControlEventHandler _translationCoef](self, "_translationCoef");
    browseScaleFactor = self->_browseScaleFactor;
    if (browseScaleFactor >= 100000.0 && a5 < 0.0)
      v14 = 0.0;
    else
      v14 = a5;
    v15 = browseScaleFactor;
    *(_QWORD *)&a.m14 = 0;
    *(_QWORD *)&a.m12 = 0;
    if (v14 > 0.0 && v15 < 0.1)
      v17 = 0.0;
    else
      v17 = v14;
    a.m11 = 1.0;
    a.m22 = 1.0;
    *(_QWORD *)&a.m23 = 0;
    *(_QWORD *)&a.m31 = 0;
    *(_QWORD *)&a.m33 = 1065353216;
    a.m41 = -(float)(a3 * v11);
    a.m42 = -(float)(a4 * v11);
    a.m43 = -(float)(v17 * v11);
    a.m44 = 1.0;
    b = v22;
    SCNMatrix4Mult(&v21, &a, &b);
    v22 = v21;
    v18 = v21;
    objc_msgSend(v10, "setTransform:", &v18);
    if (a3 != 0.0 || a4 != 0.0)
      -[SCNCameraControlEventHandler invalidateCameraTarget](self, "invalidateCameraTarget");
    -[SCNCameraControlEventHandler focusNode:](self, "focusNode:", 0);
    -[SCNCameraControlEventHandler updateBrowseScaleFactor](self, "updateBrowseScaleFactor");
  }
}

- (void)sceneWillChange
{
  *((_BYTE *)self + 304) &= ~1u;
  *((_BYTE *)self + 313) &= ~1u;
  -[SCNCameraControlEventHandler _resetFreeViewCamera](self, "_resetFreeViewCamera");
  -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
}

- (void)sceneDidChange
{
  -[SCNCameraControlEventHandler invalidateCameraTarget](self, "invalidateCameraTarget");
  -[SCNCameraControlEventHandler _resetBrowseScaleFactor](self, "_resetBrowseScaleFactor");
}

- (void)cameraWillChange
{
  *((_BYTE *)self + 313) &= ~1u;
  -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
}

- (void)cameraDidChange
{
  -[SCNCameraControlEventHandler _resetBrowseScaleFactor](self, "_resetBrowseScaleFactor");
  -[SCNCameraControlEventHandler invalidateCameraTarget](self, "invalidateCameraTarget");
}

- (void)_onInertiaTimer
{
  CFTimeInterval v3;
  double lastSimulationTime;
  int v5;
  CGPoint *p_inertiaVelocity;
  double friction;
  double x;
  double y;
  CGFloat v10;

  v3 = CACurrentMediaTime();
  lastSimulationTime = self->_lastSimulationTime;
  v5 = (int)((v3 - lastSimulationTime) * 60.0);
  self->_lastSimulationTime = lastSimulationTime + (double)v5 / 60.0;
  if (v5 >= 1)
  {
    p_inertiaVelocity = &self->_inertiaVelocity;
    do
    {
      friction = self->_friction;
      x = p_inertiaVelocity->x;
      y = self->_inertiaVelocity.y;
      if (friction != 0.0)
      {
        x = (1.0 - friction) * x;
        p_inertiaVelocity->x = x;
        y = y * (1.0 - self->_friction);
        self->_inertiaVelocity.y = y;
      }
      v10 = y + self->_totalDragWithInertia.y;
      self->_totalDragWithInertia.x = x + self->_totalDragWithInertia.x;
      self->_totalDragWithInertia.y = v10;
      --v5;
    }
    while (v5);
  }
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  -[SCNCameraControlEventHandler _rotateWithDrag:mode:stickyAxis:](self, "_rotateWithDrag:mode:stickyAxis:", self->_browseMode, self->_stickyAxis, self->_totalDragWithInertia.x, self->_totalDragWithInertia.y);
  +[SCNTransaction commit](SCNTransaction, "commit");
  if (self->_inertiaVelocity.y * self->_inertiaVelocity.y + self->_inertiaVelocity.x * self->_inertiaVelocity.x < 0.001)
    -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
}

- (void)rotateWithVector:(int64_t)a3 mode:
{
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v6[4];
  float32x4_t v7[4];
  float32x4_t v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v13 = v3;
  v4 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", a3), "renderer"), "pointOfView");
  v5 = v4;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (v4)
    objc_msgSend(v4, "transform");
  memset(v8, 0, sizeof(v8));
  C3DMatrix4x4FromSCNMatrix4(v8, (uint64_t)&v9);
  memset(v7, 0, sizeof(v7));
  C3DMatrix4x4MakeEulerRotation(v7, &v13);
  C3DMatrix4x4Mult((uint64_t)v7, v8, v8);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)v8, &v9);
  v6[0] = v9;
  v6[1] = v10;
  v6[2] = v11;
  v6[3] = v12;
  objc_msgSend(v5, "setTransform:", v6);
}

- (void)viewWillDrawAtTime:(double)a3
{
  if (-[SCNCameraControlEventHandler _isInertiaRunning](self, "_isInertiaRunning", a3))
    -[SCNCameraControlEventHandler _onInertiaTimer](self, "_onInertiaTimer");
}

- (void)_setInertiaRunning:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_stateLock;
  char v6;

  v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (v3)
    v6 = 4;
  else
    v6 = 0;
  *((_BYTE *)self + 313) = *((_BYTE *)self + 313) & 0xFB | v6;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)_isInertiaRunning
{
  SCNCameraControlEventHandler *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = (*((unsigned __int8 *)v2 + 313) >> 2) & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_3DConnexionIsPressed
{
  return 0;
}

- (BOOL)wantsRedraw
{
  return -[SCNCameraControlEventHandler _isInertiaRunning](self, "_isInertiaRunning")
      || -[SCNCameraControlEventHandler _3DConnexionIsPressed](self, "_3DConnexionIsPressed");
}

- (void)endDraggingWithVelocity:(CGPoint)a3
{
  double v3;
  CGFloat y;
  CGPoint v7;

  if ((*((_BYTE *)self + 312) & 8) != 0)
  {
    v3 = fabs(a3.y);
    if (fabs(a3.x) >= 10.0 || v3 >= 10.0)
    {
      y = a3.y;
      v7 = (CGPoint)vdivq_f64((float64x2_t)a3, (float64x2_t)xmmword_1DD02C3B0);
      self->_inertiaVelocity = v7;
      if (self->_friction == 0.0)
      {
        __asm
        {
          FMOV            V2.2D, #-20.0
          FMOV            V4.2D, #20.0
        }
        self->_inertiaVelocity = (CGPoint)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v7), (int8x16_t)vminnmq_f64((float64x2_t)v7, _Q4), vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)v7), (int8x16_t)_Q2, (int8x16_t)v7));
      }
      -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 1);
      self->_lastSimulationTime = CACurrentMediaTime();
      -[SCNView eventHandlerWantsRedraw](-[SCNEventHandler view](self, "view"), "eventHandlerWantsRedraw");
    }
  }
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  SCNNode *v6;
  SCNNode *v7;
  double v8;
  double v9;
  float v10;
  double v12;
  SCNNode *freeViewCameraNode;
  __int128 v14;

  y = a3.y;
  x = a3.x;
  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  v6 = (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  if (self->super._autoSwitchToFreeCamera)
    -[SCNCameraControlEventHandler _prepareFreeViewCamera](self, "_prepareFreeViewCamera");
  if (-[SCNNode parentNode](v6, "parentNode") || v6 == self->_freeViewCameraNode)
  {
    v7 = -[SCNNode presentationNode](v6, "presentationNode");
    -[SCNCamera xFov](-[SCNNode camera](v7, "camera"), "xFov");
    *(float *)&v8 = v8;
    self->_originalFovX = *(float *)&v8;
    -[SCNCamera yFov](-[SCNNode camera](v7, "camera"), "yFov");
    v10 = v9;
    self->_originalFovY = v10;
    if (v10 == 0.0 && self->_originalFovX == 0.0)
      v10 = 60.0;
    self->_originalFovY = v10;
    -[SCNCamera orthographicScale](-[SCNNode camera](v7, "camera"), "orthographicScale");
    *(float *)&v12 = v12;
    self->_originalOrthoScale = *(float *)&v12;
    self->_zoomFactor = 1.0;
  }
  else
  {
    -[SCNCameraControlEventHandler _installFreeViewCameraIfNeeded](self, "_installFreeViewCameraIfNeeded");
  }
  +[SCNTransaction commit](SCNTransaction, "commit");
  -[SCNCameraControlEventHandler computeAutomaticTargetPoint](self, "computeAutomaticTargetPoint");
  freeViewCameraNode = self->_freeViewCameraNode;
  if (freeViewCameraNode)
  {
    -[SCNNode transform](freeViewCameraNode, "transform", 0, 0, 0, 0, 0, 0, 0, 0);
    C3DMatrix4x4FromSCNMatrix4((C3DMatrix4x4 *)self->_initialMatrix.components, (uint64_t)&v14);
    self->_initialPoint.x = x;
    self->_initialPoint.y = y;
    *((_BYTE *)self + 313) &= ~1u;
  }
}

- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = MEMORY[0x1E0C809B0];
  *(_OWORD *)a4 = xmmword_1DD008490;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __82__SCNCameraControlEventHandler_computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke;
  v7[3] = &__block_descriptor_40_e20_q16__0____C3DNode__8l;
  v7[4] = a4;
  C3DNodeApplyHierarchy((uint64_t)a3, (uint64_t)v7);
  return *((float *)a4 + 3) >= 0.0;
}

uint64_t __82__SCNCameraControlEventHandler_computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke(uint64_t a1, float32x4_t *a2)
{
  const void *Geometry;
  float32x4_t *WorldMatrix;
  float32x4_t v7;

  if ((C3DNodeIsHidden((uint64_t)a2) & 1) != 0)
    return 1;
  if (!C3DNodeGetFloor((uint64_t)a2))
  {
    v7 = 0uLL;
    Geometry = (const void *)C3DNodeGetGeometry((uint64_t)a2);
    if (Geometry)
    {
      if (C3DGetBoundingSphere(Geometry, 0, (uint64_t)&v7))
      {
        WorldMatrix = C3DNodeGetWorldMatrix(a2);
        C3DSphereXFormMatrix4x4(&v7, WorldMatrix, (uint64_t)&v7);
        C3DSphereMakeByMergingSpheres(*(float32x4_t **)(a1 + 32), *(float32x4_t **)(a1 + 32), &v7);
      }
    }
  }
  return 0;
}

- (__n128)viewedObjectSphere
{
  float32x4_t v2;
  unsigned __int32 v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v15;

  if ((a1[19].i8[0] & 1) == 0)
  {
    v15 = 0uLL;
    if (-[float32x4_t computeBoundingSphereOmittingFloorsForNode:sphere:](a1, "computeBoundingSphereOmittingFloorsForNode:sphere:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[float32x4_t view](a1, "view"), "scene"), "rootNode"), "nodeRef"), &v15))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      C3DNodeComputeWorldMatrix((float32x4_t *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[float32x4_t view](a1, "view"), "scene"), "rootNode"), "nodeRef"), (uint64_t)&v11);
      v7 = v11;
      v8 = v12;
      v9 = v13;
      v10 = v14;
      *(double *)v2.i64 = C3DVector3MultMatrix4x4(&v7, v15);
      v3 = v15.u32[3];
      v2.i32[3] = v15.i32[3];
      v15 = v2;
      v2.i64[0] = 0;
      v2.i64[1] = v3;
      v7 = v11;
      v8 = v12;
      v9 = v13;
      v10 = v14;
      *(float32x2_t *)v4.f32 = C3DVector3RotateAndScale((float32x2_t *)&v7, v2);
      v5 = vmulq_f32(v4, v4);
      v15.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
      a1[18] = v15;
    }
    else
    {
      a1[18] = (float32x4_t)xmmword_1DD007610;
    }
    a1[19].i8[0] |= 1u;
  }
  return (__n128)a1[18];
}

+ (double)frontVectorWithPointOfView:(void *)a3
{
  float32x4_t v4;
  __int128 v5;
  float32x4_t v7;
  _OWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];

  objc_msgSend((id)objc_msgSend(a3, "camera"), "cameraRef");
  *(double *)v4.i64 = C3DCameraGetFrontDirection();
  v7 = v4;
  v5 = 0uLL;
  memset(v13, 0, sizeof(v13));
  if (a3)
  {
    objc_msgSend(a3, "worldTransform", *(_OWORD *)&v7);
    v5 = 0uLL;
  }
  v11 = v5;
  v12 = v5;
  v9 = v5;
  v10 = v5;
  C3DMatrix4x4FromSCNMatrix4(&v9, (uint64_t)v13);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  return C3DVector3Rotate((float32x2_t *)v8, v7);
}

- (uint64_t)frontVector
{
  return objc_msgSend((id)objc_opt_class(), "frontVectorWithPointOfView:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "view"), "renderer"), "pointOfView"));
}

- (void)_beginTranslateAtLocation:(CGPoint)a3
{
  double v4;
  double v5;
  void *v6;
  float64x2_t v7;
  double v8;
  __int128 v9;
  float32x4_t v10;
  int v11;
  __int128 v12;
  NSObject *v13;
  float64_t v14;
  CGFloat x;
  CGFloat y;
  float64_t v17;
  __n128 v18;
  __n128 buf;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  x = a3.x;
  y = a3.y;
  -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
  v17 = v4;
  -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
  v14 = v5;
  v6 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  v7.f64[0] = v17;
  v7.f64[1] = v14;
  v18 = (__n128)vcvt_hight_f32_f64(0, v7);
  v7.f64[0] = x;
  v7.f64[1] = y;
  v8 = COERCE_DOUBLE(vcvt_f32_f64(v7));
  -[SCNCameraControlEventHandler viewedObjectSphere](self, "viewedObjectSphere");
  *(_OWORD *)self->_clickOrigin = v9;
  -[SCNCameraControlEventHandler frontVector](self, "frontVector");
  v22 = v10;
  v20 = 0u;
  v21 = 0u;
  _C3DHitTestComputeHitSegment((float32x4_t *)objc_msgSend(v6, "nodeRef"), (uint64_t)-[SCNScene sceneRef](-[SCNView scene](-[SCNEventHandler view](self, "view"), "scene"), "sceneRef"), &v20, &v21, v18, v8);
  if (v11)
  {
    buf = 0uLL;
    C3DPlaneMakeWithVectors(&buf, (float32x4_t *)self->_clickOrigin, &v22);
    if (!C3DIntersectionSegment3Plane(&v20, (float *)&buf, (float32x4_t *)self->_clickOrigin))
    {
      *(double *)&v12 = C3DVector3MidVector(v20, v21);
      *(_OWORD *)self->_clickOrigin = v12;
    }
  }
  else
  {
    v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl(&dword_1DCCB8000, v13, OS_LOG_TYPE_DEFAULT, "Warning: _beginTranslateAtLocation: invalid zRange", (uint8_t *)&buf, 2u);
    }
  }
}

+ (SCNMatrix4)matrixWithNoRoll:(SEL)a3
{
  float32x4_t v6;
  int32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  float v20;
  SCNMatrix4 *result;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4x4 v30;
  simd_float4x4 v31;

  memset(&v31, 0, sizeof(v31));
  memset(&v30, 0, sizeof(v30));
  C3DMatrix4x4FromSCNMatrix4(&v31, (uint64_t)a4);
  C3DMatrix4x4Invert(&v31, &v30);
  v26 = (float32x4_t)v31.columns[0];
  v27 = v31.columns[1];
  v28 = v31.columns[2];
  v29 = v31.columns[3];
  *(double *)v6.i64 = C3DVector3Rotate((float32x2_t *)&v26, (float32x4_t)xmmword_1DD007920);
  v24 = v6;
  v26 = (float32x4_t)v31.columns[0];
  v27 = v31.columns[1];
  v28 = v31.columns[2];
  v29 = v31.columns[3];
  *(double *)v7.i64 = C3DVector3Rotate((float32x2_t *)&v26, (float32x4_t)xmmword_1DD007960);
  v8.i32[0] = 0;
  v9 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1)), 0), (int8x16_t)xmmword_1DD007A00, (int8x16_t)xmmword_1DD007920);
  v10 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v7, v7), (int8x16_t)v7, 0xCuLL);
  v11 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), vnegq_f32((float32x4_t)v7)), v9, v10);
  v12 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL);
  v13 = vmlaq_f32(vmulq_f32(v10, vnegq_f32(v12)), (float32x4_t)v7, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL));
  v14 = (int32x4_t)vmulq_f32(v13, v13);
  v14.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2), *(float32x2_t *)v14.i8)).u32[0];
  v15 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL);
  *(float32x2_t *)v13.f32 = vrsqrte_f32((float32x2_t)v14.u32[0]);
  *(float32x2_t *)v13.f32 = vmul_f32(*(float32x2_t *)v13.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32)));
  v16 = vmulq_n_f32(v15, vmul_f32(*(float32x2_t *)v13.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32))).f32[0]);
  v17 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), (int8x16_t)v24, 0xCuLL), vnegq_f32(v16)), v24, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v16, (int32x4_t)v16), (int8x16_t)v16, 0xCuLL));
  v18 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
  v19 = (int32x4_t)vmulq_f32(v17, v17);
  v19.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v19.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2), *(float32x2_t *)v19.i8)).u32[0];
  *(float32x2_t *)v11.i8 = vrsqrte_f32((float32x2_t)v19.u32[0]);
  *(float32x2_t *)v11.i8 = vmul_f32(*(float32x2_t *)v11.i8, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v11.i8, *(float32x2_t *)v11.i8)));
  v25 = vmulq_n_f32(v18, vmul_f32(*(float32x2_t *)v11.i8, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v11.i8, *(float32x2_t *)v11.i8))).f32[0]);
  v20 = C3DVector3Angle(v16, v24);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  C3DMatrix4x4MakeAxisAngleRotation(&v26, &v25, v20);
  C3DMatrix4x4Mult((uint64_t)&v31, &v26, &v31);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v31, a4);
  v22 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&retstr->m21 = v22;
  v23 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&retstr->m41 = v23;
  return result;
}

- (void)clearRoll
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    objc_msgSend(v3, "worldTransform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
  }
  v4 = (void *)objc_opt_class();
  if (v4)
  {
    v6[0] = v11;
    v6[1] = v12;
    v6[2] = v13;
    v6[3] = v14;
    objc_msgSend(v4, "matrixWithNoRoll:", v6);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v5 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
  objc_msgSend(v5, "setWorldTransform:", &v7);
}

- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5
{
  double y;
  double x;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  C3DMatrix4x4 *p_initialMatrix;
  double v15;
  float32x4_t v16;
  __int32 v17;
  __int32 v18;
  __int128 v19;
  __int128 v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  int32x4_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x4_t v35;
  double v36;
  double v37;
  float32x2_t v38;
  float32x4_t v39;
  int32x4_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  double v47;
  float32x4_t v48;
  float32x4_t v49;
  _OWORD v50[4];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55[4];
  float32x4_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  float32x4_t v60;
  float32x4_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  float32x4_t v66;

  y = a3.y;
  x = a3.x;
  v66.i32[2] = 0;
  v66.i64[0] = 0;
  DWORD2(v65) = 0;
  *(_QWORD *)&v65 = 0;
  self->_totalDragWithInertia = a3;
  v10 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if ((*((_BYTE *)self + 313) & 1) == 0)
  {
    *(_OWORD *)self->_upDir = xmmword_1DD007920;
    v11 = *(_OWORD *)&self->_initialMatrix.components[4];
    v61 = *(float32x4_t *)self->_initialMatrix.components;
    v62 = v11;
    v12 = *(_OWORD *)&self->_initialMatrix.components[12];
    v63 = *(_OWORD *)&self->_initialMatrix.components[8];
    v64 = v12;
    *(double *)&v13 = C3DVector3Rotate((float32x2_t *)&v61, (float32x4_t)xmmword_1DD007920);
    *(_OWORD *)self->_upDir = v13;
    *((_BYTE *)self + 313) |= 1u;
  }
  *(uint64_t *)((char *)v60.i64 + 4) = 0;
  p_initialMatrix = &self->_initialMatrix;
  v60.i32[0] = 0;
  *(_QWORD *)&v15 = C3DMatrix4x4GetTranslation((__n128 *)&self->_initialMatrix, (__n128 *)&v60).n128_u64[0];
  if (a4 == 1)
  {
    if ((*((_BYTE *)self + 312) & 2) != 0)
      -[SCNCameraControlEventHandler cameraAutomaticTargetPoint](self, "cameraAutomaticTargetPoint", v15);
    else
      -[SCNCameraControlEventHandler cameraTarget](self, "cameraTarget", v15);
    v16.i32[1] = v17;
    v16.i32[2] = v18;
    v49 = v16;
    v21 = vsubq_f32(v16, v60);
  }
  else
  {
    v19 = *(_OWORD *)&self->_initialMatrix.components[4];
    v61 = *(float32x4_t *)p_initialMatrix->components;
    v62 = v19;
    v20 = *(_OWORD *)&self->_initialMatrix.components[12];
    v63 = *(_OWORD *)&self->_initialMatrix.components[8];
    v64 = v20;
    *(double *)v21.i64 = C3DVector3Rotate((float32x2_t *)&v61, (float32x4_t)xmmword_1DD007960);
    x = -x;
    y = -y;
    v49 = 0u;
  }
  v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  v23 = vnegq_f32(v21);
  v24 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)self->_upDir, *(int32x4_t *)self->_upDir), *(int8x16_t *)self->_upDir, 0xCuLL), v23), *(float32x4_t *)self->_upDir, v22);
  v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), (int8x16_t)v24, 0xCuLL);
  v26 = (int32x4_t)vmulq_f32(v24, v24);
  v26.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), *(float32x2_t *)v26.i8)).u32[0];
  v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
  v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
  v29 = vmulq_n_f32(v25, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
  v66 = v29;
  if ((*((_BYTE *)self + 313) & 2) != 0)
  {
    v64 = 0u;
    v65 = xmmword_1DD007A00;
    v62 = 0u;
    v63 = 0u;
    v61 = 0u;
    *(_QWORD *)&v47 = C3DMatrix4x4MakeIdentity((uint64_t)&v61).n128_u64[0];
    if (a5 <= 1)
      C3DMatrix4x4MakeAxisAngleRotation(&v61, &v66, y * -0.00872664626);
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      C3DMatrix4x4MakeAxisAngleRotation(&v56, (float32x4_t *)&v65, x * -0.00872664626);
      v47 = C3DMatrix4x4Mult((uint64_t)&v61, &v56, &v61);
    }
  }
  else
  {
    v30 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), (int8x16_t)v29, 0xCuLL), v23), v29, v22);
    v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL);
    v32 = (int32x4_t)vmulq_f32(v30, v30);
    v32.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), *(float32x2_t *)v32.i8)).u32[0];
    v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
    v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
    v35 = vmulq_n_f32(v31, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
    v64 = 0u;
    v65 = (__int128)v35;
    v62 = 0u;
    v63 = 0u;
    v61 = 0u;
    v36 = 0.0;
    if (a5 == 2)
      v37 = 0.0;
    else
      v37 = y;
    if (a5 == 1)
      v37 = y;
    else
      v36 = x;
    *(float *)&v37 = v37;
    v38.f32[0] = v36;
    v39 = vmlsq_lane_f32(vmulq_n_f32(v29, v38.f32[0]), v35, *(float32x2_t *)&v37, 0);
    v40 = (int32x4_t)vmulq_f32(v39, v39);
    v40.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1))).u32[0];
    v41 = vrsqrte_f32((float32x2_t)v40.u32[0]);
    v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v41, v41)));
    v43 = vmulq_n_f32(v39, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v42, v42))).f32[0]);
    v44 = vmlaq_f32(vmulq_f32(v22, vnegq_f32(v43)), v21, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL));
    v45 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v44, (int32x4_t)v44), (int8x16_t)v44, 0xCuLL);
    v46 = (int32x4_t)vmulq_f32(v44, v44);
    v46.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v46.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v46, 2), *(float32x2_t *)v46.i8)).u32[0];
    *(float32x2_t *)v43.f32 = vrsqrte_f32((float32x2_t)v46.u32[0]);
    *(float32x2_t *)v43.f32 = vmul_f32(*(float32x2_t *)v43.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v43.f32, *(float32x2_t *)v43.f32)));
    v56 = vmulq_n_f32(v45, vmul_f32(*(float32x2_t *)v43.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v43.f32, *(float32x2_t *)v43.f32))).f32[0]);
    v38.i32[1] = LODWORD(v37);
    C3DMatrix4x4MakeAxisAngleRotation(&v61, &v56, sqrtf(vaddv_f32(vmul_f32(v38, v38))) * 0.00872664626);
  }
  if (a4 == 2)
  {
    -[SCNCameraControlEventHandler invalidateCameraTarget](self, "invalidateCameraTarget", v47);
  }
  else
  {
    v60 = vsubq_f32(v60, v49);
    v56 = v61;
    v57 = v62;
    v58 = v63;
    v59 = v64;
    *(double *)v48.i64 = C3DVector3Rotate((float32x2_t *)&v56, v60);
    v60 = vaddq_f32(v49, v48);
  }
  C3DMatrix4x4Mult3x3((uint64_t)p_initialMatrix, &v61, (uint64_t)&v61);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  memset(v55, 0, sizeof(v55));
  C3DMatrix4x4MakeTranslation((uint64_t)v55, (__n128 *)&v60);
  C3DMatrix4x4Mult((uint64_t)&v61, v55, &v56);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v56, &v51);
  v50[0] = v51;
  v50[1] = v52;
  v50[2] = v53;
  v50[3] = v54;
  objc_msgSend(v10, "setTransform:", v50);
}

- (void)_translateTo:(CGPoint)a3
{
  void *v4;
  double v5;
  float64x2_t v6;
  float64_t v7;
  int v8;
  float32x4_t *v9;
  float32x4_t v10;
  void *v11;
  NSObject *v12;
  float64_t v13;
  __n128 v14;
  CGFloat x;
  CGFloat y;
  _OWORD v17[4];
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[4];
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  __n128 v31;
  float32x4_t v32;
  float32x4_t v33[2];
  float32x4_t v34;
  float32x4_t v35;

  x = a3.x;
  y = a3.y;
  v34 = 0u;
  v35 = 0u;
  memset(v33, 0, sizeof(v33));
  *(uint64_t *)((char *)v32.i64 + 4) = 0;
  v32.i32[0] = 0;
  v31 = 0uLL;
  v4 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
  v13 = v5;
  -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
  v6.f64[0] = v13;
  v6.f64[1] = v7;
  v14 = (__n128)vcvt_hight_f32_f64(0, v6);
  v6.f64[0] = x;
  v6.f64[1] = y;
  _C3DHitTestComputeHitSegment((float32x4_t *)objc_msgSend(v4, "nodeRef"), (uint64_t)-[SCNScene sceneRef](-[SCNView scene](-[SCNEventHandler view](self, "view"), "scene"), "sceneRef"), &v35, &v34, v14, COERCE_DOUBLE(vcvt_f32_f64(v6)));
  if (v8)
  {
    *(uint64_t *)((char *)v30.i64 + 4) = 0;
    v30.i32[0] = 0;
    v9 = (float32x4_t *)objc_msgSend(v4, "nodeRef", *(double *)C3DRay3MakeWithSegment(v33, &v34).i64);
    C3DNodeGetWorldPosition(v9, (__n128 *)&v30);
    v34 = v30;
    -[SCNCameraControlEventHandler frontVector](self, "frontVector");
    v29 = v10;
    C3DPlaneMakeWithVectors(&v31, (float32x4_t *)self->_clickOrigin, &v29);
    if ((C3DIntersectionRay3Plane((uint64_t)v33, (float *)&v31, &v32) & 1) != 0)
    {
      v28 = vnegq_f32(vsubq_f32(v32, *(float32x4_t *)self->_clickOrigin));
      v26 = 0u;
      v27 = 0u;
      *(_OWORD *)buf = 0u;
      v25 = 0u;
      memset(v23, 0, sizeof(v23));
      C3DMatrix4x4MakeTranslation((uint64_t)buf, (__n128 *)&v28);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = (void *)objc_msgSend(v4, "presentationNode");
      if (v11)
      {
        objc_msgSend(v11, "transform");
      }
      else
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
      }
      memset(v18, 0, sizeof(v18));
      C3DMatrix4x4FromSCNMatrix4(v18, (uint64_t)&v19);
      C3DMatrix4x4Mult((uint64_t)v18, (float32x4_t *)buf, v23);
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v23, &v19);
      v17[0] = v19;
      v17[1] = v20;
      v17[2] = v21;
      v17[3] = v22;
      objc_msgSend(v4, "setTransform:", v17);
      -[SCNCameraControlEventHandler focusNode:](self, "focusNode:", 0);
    }
    else
    {
      v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCCB8000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Warning: no C3DIntersectionRay3Plane", buf, 2u);
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIGestureRecognizer *pressGesture;
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *panGesture;

  pressGesture = self->_pressGesture;
  if (pressGesture == a3 || pressGesture == a4)
    return 1;
  tapGesture = self->_tapGesture;
  panGesture = self->_panGesture;
  if (tapGesture == a3 && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4))
    return 1;
  if (tapGesture == a4 && panGesture == a3)
    return 1;
  return tapGesture == a4 && self->_pinchGesture == a3;
}

- (id)gestureRecognizers
{
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *pressGesture;
  UIGestureRecognizer *v5;
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  UIGestureRecognizer *v8;

  tapGesture = self->_tapGesture;
  if (tapGesture)
  {
    pressGesture = self->_pressGesture;
  }
  else
  {
    pressGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA730]);
    -[UIGestureRecognizer setMinimumPressDuration:](pressGesture, "setMinimumPressDuration:", 0.0);
    v5 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
    v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA840]);
    v7 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA7F8]);
    v8 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA910]);
    -[UIGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2);
    -[UIGestureRecognizer addTarget:action:](v6, "addTarget:action:", self, sel__handlePinch_);
    -[UIGestureRecognizer addTarget:action:](v7, "addTarget:action:", self, sel__handlePan_);
    -[UIGestureRecognizer addTarget:action:](pressGesture, "addTarget:action:", self, sel__handlePress_);
    -[UIGestureRecognizer addTarget:action:](v8, "addTarget:action:", self, sel__handleRotation_);
    -[UIGestureRecognizer addTarget:action:](v5, "addTarget:action:", self, sel__handleDoubleTap_);
    -[UIGestureRecognizer setDelegate:](pressGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](v6, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](v8, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v6, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v8, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v7, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](pressGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v6, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v8, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v7, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](pressGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setEnabled:](v6, "setEnabled:", -[SCNCameraControlEventHandler enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](v8, "setEnabled:", -[SCNCameraControlEventHandler enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](v7, "setEnabled:", -[SCNCameraControlEventHandler enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](v5, "setEnabled:", -[SCNCameraControlEventHandler enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](pressGesture, "setEnabled:", -[SCNCameraControlEventHandler enabled](self, "enabled"));
    self->_tapGesture = v5;
    self->_panGesture = v7;
    self->_pinchGesture = v6;
    self->_rotateGesture = v8;
    self->_pressGesture = pressGesture;
    tapGesture = self->_tapGesture;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", pressGesture, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  -[SCNCameraControlEventHandler beginGesture:](self, "beginGesture:", a3);
  return 1;
}

- (void)_handlePinch:(id)a3
{
  if ((*((_BYTE *)self + 312) & 1) != 0)
    -[SCNCameraControlEventHandler pinchWithGestureRecognizer:](self, "pinchWithGestureRecognizer:", a3);
}

- (void)_handlePan:(id)a3
{
  if ((*((_BYTE *)self + 312) & 1) != 0)
    -[SCNCameraControlEventHandler panWithGestureRecognizer:](self, "panWithGestureRecognizer:", a3);
}

- (void)_handleRotation:(id)a3
{
  if ((*((_BYTE *)self + 312) & 1) != 0)
    -[SCNCameraControlEventHandler rotateWithGestureRecognizer:](self, "rotateWithGestureRecognizer:", a3);
}

- (void)_handleDoubleTap:(id)a3
{
  if ((*((_BYTE *)self + 312) & 1) != 0)
    -[SCNView switchToNextCamera](-[SCNEventHandler view](self, "view", a3), "switchToNextCamera");
}

- (void)beginGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend(a3, "numberOfTouches"))
  {
    objc_msgSend(a3, "locationOfTouch:inView:", 0, -[SCNEventHandler view](self, "view"));
    v6 = v5;
    v8 = v7;
    -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
    v10 = v9 - v8;
  }
  else
  {
    v10 = 0.0;
    v6 = 0.0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_roll = 0.0;
    -[SCNCameraControlEventHandler _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v10);
    v11 = *(_OWORD *)&self->_initialMatrix.components[12];
    v13 = *(_OWORD *)self->_initialMatrix.components;
    v12 = *(_OWORD *)&self->_initialMatrix.components[4];
    *(_OWORD *)&self->_initialMatrixForRoll.components[9] = *(_OWORD *)&self->_initialMatrix.components[8];
    *(_OWORD *)&self->_initialMatrixForRoll.components[13] = v11;
    *(_OWORD *)&self->_initialMatrixForRoll.components[1] = v13;
    *(_OWORD *)&self->_initialMatrixForRoll.components[5] = v12;
    self->_browseMode = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SCNCameraControlEventHandler _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v10);
      if ((*((_BYTE *)self + 312) & 0x20) != 0)
      {
        self->_browseMode = 4;
        -[SCNCameraControlEventHandler _beginTranslateAtLocation:](self, "_beginTranslateAtLocation:", v6, v10);
      }
      self->_browseMode = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        self->_initialZoom = self->_zoomFactor;
    }
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  _OWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];

  -[SCNCameraControlEventHandler _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  *((_BYTE *)self + 313) &= ~1u;
  v5 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v5)
  {
    v6 = (void *)v5;
    memset(v13, 0, sizeof(v13));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(a3, "rotation");
    *(float *)&v7 = v7;
    self->_roll = *(float *)&v7;
    C3DMatrix4x4MakeRotationZ(v13, *(float *)&v7);
    C3DMatrix4x4Mult((uint64_t)v13, (float32x4_t *)&self->_initialMatrixForRoll.components[1], v13);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v13, &v9);
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    objc_msgSend(v6, "setTransform:", v8);
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  double v4;
  double v5;

  v4 = fmax(self->_initialZoom, 0.001);
  objc_msgSend(a3, "scale");
  -[SCNCameraControlEventHandler setZoomFactor:](self, "setZoomFactor:", v5 * v4);
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  __n128 v10;
  float v11;
  unsigned int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SCNView *v19;
  _OWORD v20[4];
  __n128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[4];

  v5 = objc_msgSend(a3, "numberOfTouches");
  if (self->_browseMode != 3)
  {
    v6 = v5;
    if (objc_msgSend(a3, "state") == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        objc_msgSend(a3, "velocityInView:", -[SCNEventHandler view](self, "view"));
        -[SCNCameraControlEventHandler endDraggingWithVelocity:](self, "endDraggingWithVelocity:");
      }
    }
    else
    {
      objc_msgSend(a3, "translationInView:", -[SCNEventHandler view](self, "view"));
      switch(v6)
      {
        case 3:
          v9 = -v8;
          if (self->_lastGestureFingerCount != 3)
          {
            -[SCNCameraControlEventHandler beginGesture:](self, "beginGesture:", a3);
            self->_lastGestureFingerCount = 3;
          }
          -[SCNCameraControlEventHandler _translationCoef](self, "_translationCoef");
          v10.n128_u64[0] = 0;
          memset(v26, 0, sizeof(v26));
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          *(float *)&v12 = v9 * v11;
          v10.n128_u64[1] = v12;
          v21 = v10;
          C3DMatrix4x4MakeTranslation((uint64_t)v26, &v21);
          v13 = (void *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", C3DMatrix4x4Mult((uint64_t)v26, (float32x4_t *)&self->_initialMatrix, v26)), "renderer"), "pointOfView");
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v26, &v22);
          v20[0] = v22;
          v20[1] = v23;
          v20[2] = v24;
          v20[3] = v25;
          objc_msgSend(v13, "setTransform:", v20);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            -[SCNCameraControlEventHandler beginGesture:](self, "beginGesture:", a3);
            self->_lastGestureFingerCount = 2;
          }
          objc_msgSend(a3, "locationOfTouch:inView:", 0, -[SCNEventHandler view](self, "view"));
          v15 = v14;
          v17 = v16;
          -[SCNView bounds](-[SCNEventHandler view](self, "view"), "bounds");
          -[SCNCameraControlEventHandler _translateTo:](self, "_translateTo:", v15, v18 - v17);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            -[SCNCameraControlEventHandler _rotateWithDrag:mode:stickyAxis:](self, "_rotateWithDrag:mode:stickyAxis:", self->_browseMode, self->_stickyAxis, v7 + v7, v8 * -2.0);
          }
          else
          {
            -[SCNCameraControlEventHandler beginGesture:](self, "beginGesture:", a3);
            v19 = -[SCNEventHandler view](self, "view");
            objc_msgSend(a3, "setTranslation:inView:", v19, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
  }
}

@end
