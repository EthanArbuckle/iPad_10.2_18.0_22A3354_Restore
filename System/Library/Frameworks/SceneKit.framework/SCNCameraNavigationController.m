@implementation SCNCameraNavigationController

- (void)sceneWillChange
{
  *(_WORD *)&self->_isSceneBoundingSphereComputed = 0;
  -[SCNCameraController setSimdTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setSimdTarget:", 0.0);
  -[SCNCameraNavigationController _resetFreeViewCamera](self, "_resetFreeViewCamera");
}

- (SCNCameraNavigationController)initWithView:(id)a3
{
  SCNCameraNavigationController *v4;
  SCNCameraNavigationController *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNCameraNavigationController;
  v4 = -[SCNCameraNavigationController init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_freeViewCameraNode = (SCNNode *)a3;
    v4->_delegate = (SCNCameraNavigationControllerDelegate *)objc_alloc_init(SCNCameraController);
    -[SCNCameraNavigationControllerDelegate setPointOfView:](v5->_delegate, "setPointOfView:", objc_msgSend(a3, "pointOfView"));
    -[SCNCameraNavigationControllerDelegate setInertiaEnabled:](v5->_delegate, "setInertiaEnabled:", 1);
    if (C3DWasLinkedBeforeMajorOSYear2017())
      v6 = 2;
    else
      v6 = 1;
    -[SCNCameraNavigationControllerDelegate setInteractionMode:](v5->_delegate, "setInteractionMode:", v6);
    -[SCNCameraNavigationControllerDelegate setDrivenByDefaultNavigationCameraController:](v5->_delegate, "setDrivenByDefaultNavigationCameraController:", 1);
    -[SCNCameraNavigationControllerDelegate setDelegate:](v5->_delegate, "setDelegate:", v5);
    LODWORD(v5->_keyboard.keyCodeConfiguration) = 0;
    v5->_drawAtTimeLock._os_unfair_lock_opaque = 0;
    v5->_orthographicZoomFactor = 1.0;
    WORD1(v5->_cameraController) = 257;
    v5->_translationAllowed = 1;
    BYTE1(v5->_inertia.lastDragLocation.x) = C3DWasLinkedBeforeMajorOSYear2017();
    *(_WORD *)&v5->_pinchShouldMoveCamera = 257;
    *(_OWORD *)&v5->_flyModeVelocity = xmmword_1DD02C3D0;
    *(_OWORD *)&v5->_truckSensitivity = xmmword_1DD02C3E0;
    -[SCNCameraNavigationController sceneDidChange](v5, "sceneDidChange");
    -[SCNCameraNavigationController cameraDidChange](v5, "cameraDidChange");
  }
  return v5;
}

- (void)_setupUpVector
{
  id v3;
  float32x4_t v4;
  uint64_t v5;
  double v6;
  double v7;
  __int32 v8;
  __int32 v9;
  float32x4_t v10;
  uint64_t v11;
  SCNCameraNavigationControllerDelegate *delegate;
  float32x4_t v13;
  int32x2_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int8x16_t v18;
  int32x4_t v19;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int8x16_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  double v50;
  double v51;
  float32x4_t v52;

  v3 = -[SCNScene attributeForKey:](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "attributeForKey:", CFSTR("kSceneUpAxisAttributeKey"));
  if (v3)
  {
    objc_msgSend(v3, "SCNVector3Value");
    v49.i64[0] = v5;
    v50 = v6;
    v51 = v7;
  }
  else
  {
    v4.i32[0] = 1.0;
    v50 = *(double *)v4.i64;
    v4.i32[0] = 0;
    v51 = *(double *)v4.i64;
    v4.i32[0] = 0;
    v49 = v4;
  }
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "convertVector:fromNode:", 0, *(double *)v49.i64, v50, v51);
  v10.i32[1] = v8;
  v10.i32[2] = v9;
  v11 = 2;
  if (*(float *)&v50 == 0.0)
    v11 = 1;
  v52 = v10;
  *(_DWORD *)((unint64_t)&v52 | (4 * v11)) = 0;
  if (fabsf(v52.f32[0]) < 0.001 && fabsf(v52.f32[2]) < 0.001 && fabsf(v52.f32[1]) < 0.001)
  {
    delegate = self->_delegate;
LABEL_14:
    -[SCNCameraNavigationControllerDelegate setUp:](delegate, "setUp:");
    return;
  }
  v13 = vmulq_f32(v52, v52);
  v14 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u64[0];
  v15 = (float32x4_t)vdupq_lane_s32(v14, 0);
  v16 = vrsqrteq_f32(v15);
  v17 = vmulq_f32(v16, vrsqrtsq_f32(v15, vmulq_f32(v16, v16)));
  v18 = (int8x16_t)vmulq_f32(v17, vrsqrtsq_f32(v15, vmulq_f32(v17, v17)));
  v19 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v14.i32 != 0.0)), 0x1FuLL));
  v19.i32[3] = 0;
  __asm { FMOV            V17.4S, #1.0 }
  v25 = vmulq_f32(v52, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v19), v18, _Q17));
  v26 = v49;
  v26.i32[1] = LODWORD(v50);
  v26.i32[2] = LODWORD(v51);
  v27 = vmulq_f32(v26, v25);
  LODWORD(v28) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).u32[0];
  if (fabsf(v28) > 0.99)
  {
    delegate = self->_delegate;
    goto LABEL_14;
  }
  v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26), (int8x16_t)v26, 0xCuLL);
  v30 = (int32x4_t)vmlaq_f32(vmulq_f32(v29, vnegq_f32(v25)), v26, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL));
  v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v30, v30), (int8x16_t)v30, 0xCuLL);
  v32 = vmulq_f32(v25, v25);
  v33 = vmulq_f32(v26, v26);
  v31.f32[3] = v28
             + sqrtf(vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).f32[0], vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0]));
  v34 = (int8x16_t)vmulq_f32(v31, v31);
  *(float32x2_t *)v34.i8 = vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL));
  v35 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1)), 0);
  v36 = vrsqrteq_f32(v35);
  v37 = vmulq_f32(v36, vrsqrtsq_f32(v35, vmulq_f32(v36, v36)));
  v38 = vmulq_f32(v31, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v35), _Q17, (int8x16_t)vmulq_f32(v37, vrsqrtsq_f32(v35, vmulq_f32(v37, v37)))));
  v39 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38), (int8x16_t)v38, 0xCuLL);
  v40 = vnegq_f32(v38);
  v41 = vmlaq_f32(vmulq_f32(v29, v40), v26, v39);
  v42 = (int32x4_t)vaddq_f32(v41, v41);
  v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v42, v42), (int8x16_t)v42, 0xCuLL);
  v44 = vmlaq_laneq_f32(v26, v43, v38, 3);
  v45 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL), v40), v43, v39);
  v48 = vaddq_f32(v44, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v45, v45), (int8x16_t)v45, 0xCuLL));
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "simdWorldRight");
  v47 = vmulq_f32(v46, v48);
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]) > 0.70711)
  {
    delegate = self->_delegate;
    goto LABEL_14;
  }
  -[SCNCameraNavigationControllerDelegate setSimdUp:](self->_delegate, "setSimdUp:", *(double *)v48.i64);
}

- (SCNView)view
{
  return (SCNView *)self->_freeViewCameraNode;
}

- (id)pointOfView
{
  return -[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView");
}

- (void)cameraDidChange
{
  -[SCNCameraController setPointOfView:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setPointOfView:", objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView"));
  -[SCNCameraNavigationController _setupUpVector](self, "_setupUpVector");
}

- (void)sceneDidChange
{
  uint64_t v3;

  -[SCNCameraNavigationController invalidateCameraTarget](self, "invalidateCameraTarget");
  v3 = objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    -[SCNCameraController setPointOfView:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setPointOfView:", v3);
    self->_cameraTargetComputed = 0;
    -[SCNCameraController setSimdTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setSimdTarget:", 0.0);
    -[SCNCameraNavigationController _computeAutomaticTargetPointIfNeeded](self, "_computeAutomaticTargetPointIfNeeded");
  }
}

- (SCNCameraController)cameraController
{
  return (SCNCameraController *)self->_delegate;
}

- (void)invalidateCameraTarget
{
  LOBYTE(self->_inertia.lastDragLocation.x) = 0;
}

- (void)_resetFreeViewCamera
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[objc_class sceneRef](self[1].super.isa, "sceneRef");
  if (v3)
  {
    v4 = v3;
    C3DSceneLock(v3);
    C3DRemoveSceneRef((void *)-[objc_class nodeRef](self[1].super.isa, "nodeRef"), -[objc_class sceneRef](self[1].super.isa, "sceneRef"));
    C3DSceneUnlock(v4);
  }
  -[objc_class removeFromParentNode](self[1].super.isa, "removeFromParentNode");

  self[1].super.isa = 0;
}

- (void)_computeAutomaticTargetPointIfNeeded
{
  id v3;
  float32x4_t v4;
  float v5;
  float32x4_t v6;
  float v7;
  float32x4_t v8;
  uint64_t v9;
  float32x4_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  BOOL v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float32x4_t v18;

  if (BYTE1(self->_inertia.lastDragLocation.x)
    && !LOBYTE(self->_inertia.lastDragLocation.x)
    && !-[SCNCameraController automaticTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "automaticTarget"))
  {
    LOBYTE(self->_inertia.lastDragLocation.x) = 1;
    v3 = -[SCNCameraNavigationController pointOfView](self, "pointOfView");
    -[SCNCameraNavigationController worldFront](self, "worldFront");
    v16 = v4;
    -[SCNCameraNavigationController _targetDistance](self, "_targetDistance");
    v17 = v5;
    objc_msgSend((id)objc_msgSend(v3, "presentationNode"), "simdWorldPosition");
    if (self->_didEverFocusNode)
    {
      v8 = v16;
      v7 = v17;
    }
    else
    {
      v18 = v6;
      v9 = -[SCNCameraNavigationController _sceneBoundingSphere](self, "_sceneBoundingSphere");
      v6 = v18;
      v10.i64[0] = v9;
      v10.i64[1] = v11;
      v12 = vsubq_f32(v10, v18);
      v13 = vmulq_f32(v16, v12);
      v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0] <= 0.5;
      v8 = v16;
      v7 = v17;
      if (!v14)
      {
        v15 = vmulq_f32(v12, v12);
        v7 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
      }
    }
    -[SCNCameraController setSimdTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setSimdTarget:", *(double *)vmlaq_n_f32(v6, v8, v7).i64);
  }
}

- (void)setDelegate:(id)a3
{
  self->_view = (SCNView *)a3;
}

- (id)gestureRecognizers
{
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *pressGesture;
  UIGestureRecognizer *pinchGesture;
  UIGestureRecognizer *panGesture;
  UIGestureRecognizer *rotateGesture;

  tapGesture = self->_tapGesture;
  if (tapGesture)
  {
    pressGesture = self->_pressGesture;
    pinchGesture = self->_pinchGesture;
    panGesture = self->_panGesture;
    rotateGesture = self->_rotateGesture;
  }
  else
  {
    pressGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA730]);
    -[UIGestureRecognizer setMinimumPressDuration:](pressGesture, "setMinimumPressDuration:", 0.0);
    tapGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
    pinchGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA840]);
    panGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA7F8]);
    -[UIGestureRecognizer setAllowedScrollTypesMask:](panGesture, "setAllowedScrollTypesMask:", 3);
    rotateGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEA910]);
    -[UIGestureRecognizer setNumberOfTapsRequired:](tapGesture, "setNumberOfTapsRequired:", 2);
    -[UIGestureRecognizer addTarget:action:](pinchGesture, "addTarget:action:", self, sel__handlePinch_);
    -[UIGestureRecognizer addTarget:action:](panGesture, "addTarget:action:", self, sel__handlePan_);
    -[UIGestureRecognizer addTarget:action:](pressGesture, "addTarget:action:", self, sel__handlePress_);
    -[UIGestureRecognizer addTarget:action:](rotateGesture, "addTarget:action:", self, sel__handleRotation_);
    -[UIGestureRecognizer addTarget:action:](tapGesture, "addTarget:action:", self, sel__handleDoubleTap_);
    -[UIGestureRecognizer setDelegate:](pressGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](panGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](pinchGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](rotateGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelegate:](tapGesture, "setDelegate:", self);
    -[UIGestureRecognizer setDelaysTouchesBegan:](pinchGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](rotateGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](panGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](tapGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](pressGesture, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](pinchGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](rotateGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](panGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](tapGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](pressGesture, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setEnabled:](pinchGesture, "setEnabled:", -[SCNCameraNavigationController enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](rotateGesture, "setEnabled:", -[SCNCameraNavigationController enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](panGesture, "setEnabled:", -[SCNCameraNavigationController enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](tapGesture, "setEnabled:", -[SCNCameraNavigationController enabled](self, "enabled"));
    -[UIGestureRecognizer setEnabled:](pressGesture, "setEnabled:", -[SCNCameraNavigationController enabled](self, "enabled"));
    self->_pinchGesture = pinchGesture;
    self->_panGesture = panGesture;
    self->_rotateGesture = rotateGesture;
    self->_pressGesture = pressGesture;
    self->_tapGesture = tapGesture;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", pressGesture, panGesture, tapGesture, pinchGesture, rotateGesture, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 47) = (char *)self + 384;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNCameraNavigationControllerDelegate setDelegate:](self->_delegate, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraNavigationController;
  -[SCNCameraNavigationController dealloc](&v3, sel_dealloc);
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
  self->_enabled = a3;
  v4 = -[SCNCameraNavigationController gestureRecognizers](self, "gestureRecognizers");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", self->_enabled);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (BOOL)allowsTranslation
{
  return self->_translationAllowed;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  self->_translationAllowed = a3;
}

- (BOOL)enableInertia
{
  return -[SCNCameraController inertiaEnabled](-[SCNCameraNavigationController cameraController](self, "cameraController"), "inertiaEnabled");
}

- (void)setEnableInertia:(BOOL)a3
{
  -[SCNCameraController setInertiaEnabled:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setInertiaEnabled:", a3);
}

- (double)friction
{
  float v2;

  -[SCNCameraController inertiaFriction](-[SCNCameraNavigationController cameraController](self, "cameraController"), "inertiaFriction");
  return v2;
}

- (void)setFriction:(double)a3
{
  float v3;
  SCNCameraController *v4;
  double v5;

  v3 = a3;
  v4 = -[SCNCameraNavigationController cameraController](self, "cameraController");
  *(float *)&v5 = v3;
  -[SCNCameraController setInertiaFriction:](v4, "setInertiaFriction:", v5);
}

- (BOOL)automaticCameraTarget
{
  return BYTE1(self->_inertia.lastDragLocation.x);
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  if (BYTE1(self->_inertia.lastDragLocation.x) != a3)
  {
    BYTE1(self->_inertia.lastDragLocation.x) = a3;
    -[SCNCameraNavigationController invalidateCameraTarget](self, "invalidateCameraTarget");
  }
}

- (SCNVector3)cameraTarget
{
  float v3;
  float v4;
  float v5;
  SCNVector3 result;

  -[SCNCameraNavigationController _computeAutomaticTargetPointIfNeeded](self, "_computeAutomaticTargetPointIfNeeded");
  -[SCNCameraController target](-[SCNCameraNavigationController cameraController](self, "cameraController"), "target");
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setCameraTarget:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  SCNCameraController *v7;
  double v8;
  double v9;
  double v10;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  -[SCNCameraNavigationController setAutomaticCameraTarget:](self, "setAutomaticCameraTarget:", 0);
  v7 = -[SCNCameraNavigationController cameraController](self, "cameraController");
  *(float *)&v8 = x;
  *(float *)&v9 = y;
  *(float *)&v10 = z;
  -[SCNCameraController setTarget:](v7, "setTarget:", v8, v9, v10);
}

- (BOOL)gimbalLockMode
{
  return -[SCNCameraController interactionMode](-[SCNCameraNavigationController cameraController](self, "cameraController"), "interactionMode") == SCNInteractionModeOrbitTurntable;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 3;
  -[SCNCameraController setInteractionMode:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setInteractionMode:", v3);
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
  NSObject *v3;

  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNCameraNavigationController setGimbalLockVector:].cold.1(v3);
}

- (BOOL)wantsRedraw
{
  unsigned __int16 *begin;
  BOOL v5;

  if (-[SCNCameraController isInertiaRunning](-[SCNCameraNavigationController cameraController](self, "cameraController"), "isInertiaRunning"))
  {
    return 1;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&self->_keyboard.keyCodeConfiguration);
  begin = self->_keyboard.forward.__begin_;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_keyboard.keyCodeConfiguration);
  if (-[SCNCameraController interactionMode](-[SCNCameraNavigationController cameraController](self, "cameraController"), "interactionMode"))
  {
    v5 = 1;
  }
  else
  {
    v5 = begin == 0;
  }
  return !v5;
}

- (void)focusNode:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  -[SCNCameraNavigationController focusNodes:](self, "focusNodes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

- (void)focusNodes:(id)a3
{
  _BOOL8 v5;
  float originalOrthoScale;
  float v7;

  if (a3)
  {
    self->_didEverFocusNode = 1;
    -[SCNCameraNavigationController setAutomaticCameraTarget:](self, "setAutomaticCameraTarget:", 0);
    -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
    v5 = -[SCNCameraController automaticTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "automaticTarget");
    -[SCNCameraController setAutomaticTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setAutomaticTarget:", 1);
    -[SCNCameraController frameNodes:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "frameNodes:", a3);
    -[SCNCameraController setAutomaticTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setAutomaticTarget:", v5);
    if (-[SCNCameraNavigationController _pointOfViewUsesOrthographicProjection](self, "_pointOfViewUsesOrthographicProjection"))
    {
      originalOrthoScale = self->_originalOrthoScale;
      -[SCNCameraNavigationController _pointOfViewOrthographicScale](self, "_pointOfViewOrthographicScale");
      -[SCNCameraNavigationController setZoomFactor:](self, "setZoomFactor:", (float)(originalOrthoScale / v7));
    }
  }
}

- (unint64_t)stickyAxis
{
  return *(_QWORD *)&self->_anon_119[27];
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_anon_119[3] = a3 == 0;
  *(_QWORD *)&self->_anon_119[27] = a3;
}

- (unint64_t)_effectiveStickyAxis
{
  unint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->_anon_119[27];
  if (!v2)
  {
    v3 = 296;
    if (!self->_anon_119[3])
      v3 = 304;
    return *(unint64_t *)((char *)&self->super.isa + v3);
  }
  return v2;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  BYTE2(self->_cameraController) = a3;
  if (!a3)
    -[SCNCameraNavigationController _resetFreeViewCamera](self, "_resetFreeViewCamera");
}

- (BOOL)_freeCameraActivated
{
  Class isa;

  isa = self[1].super.isa;
  return isa
      && isa == (Class)objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
}

- (void)_prepareFreeViewCamera
{
  objc_class *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  double v7;
  Class isa;
  SCNNode *v9;
  SCNCamera *v10;
  SCNCamera *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  __C3DScene *v17;
  uint64_t v18;
  SCNMatrix4 v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23[4];
  SCNMatrix4 v24;

  v3 = (objc_class *)objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
  v4 = v3;
  if (v3 && v3 == self[1].super.isa)
    return;
  v5 = (void *)-[objc_class presentationNode](v3, "presentationNode");
  if (objc_msgSend(v5, "camera"))
    v6 = (void *)objc_msgSend(v5, "camera");
  else
    v6 = (void *)objc_msgSend(v5, "light");
  objc_msgSend(v6, "orthographicScale");
  *(float *)&v7 = v7;
  self->_originalOrthoScale = *(float *)&v7;
  self->_orthographicZoomFactor = 1.0;
  isa = self[1].super.isa;
  if (!v4)
  {
    if (isa)
      goto LABEL_13;
    v9 = +[SCNNode node](SCNNode, "node");
    goto LABEL_12;
  }
  if (v4 == isa)
  {
    memset(&v24, 0, sizeof(v24));
LABEL_22:
    v14 = (void *)-[objc_class presentationNode](v4, "presentationNode");
    if (v14)
      objc_msgSend(v14, "worldTransform");
    else
      memset(&v24, 0, sizeof(v24));
    goto LABEL_25;
  }
  if (!isa)
  {
    v9 = (SCNNode *)-[objc_class copy](v4, "copy");
LABEL_12:
    self[1].super.isa = (Class)v9;
  }
LABEL_13:
  if (-[objc_class camera](v4, "camera"))
  {
    v10 = (SCNCamera *)(id)objc_msgSend((id)-[objc_class camera](v4, "camera"), "copy");
LABEL_15:
    v11 = v10;
    goto LABEL_16;
  }
  if (!-[objc_class light](v4, "light"))
  {
    v10 = +[SCNCamera camera](SCNCamera, "camera");
    goto LABEL_15;
  }
  v13 = (void *)-[objc_class light](v4, "light");
  v11 = +[SCNCamera camera](SCNCamera, "camera");
  if (v13)
  {
    objc_msgSend(v13, "spotOuterAngle");
    -[SCNCamera setFieldOfView:](v11, "setFieldOfView:");
    -[SCNCamera setFieldOfViewOrientation:](v11, "setFieldOfViewOrientation:", 0);
    objc_msgSend(v13, "zNear");
    -[SCNCamera setZNear:](v11, "setZNear:");
    objc_msgSend(v13, "zFar");
    -[SCNCamera setZFar:](v11, "setZFar:");
  }
LABEL_16:
  -[objc_class setCamera:](self[1].super.isa, "setCamera:", v11);
  -[objc_class setLight:](self[1].super.isa, "setLight:", 0);
  -[objc_class setGeometry:](self[1].super.isa, "setGeometry:", 0);
  -[objc_class setConstraints:](self[1].super.isa, "setConstraints:", 0);
  v12 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[objc_class removeAllAnimations](self[1].super.isa, "removeAllAnimations");
  -[objc_class removeAllActions](self[1].super.isa, "removeAllActions");
  -[objc_class setConstraints:](self[1].super.isa, "setConstraints:", 0);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v12);
  memset(&v24, 0, sizeof(v24));
  if (v4)
    goto LABEL_22;
  v24 = SCNMatrix4Identity;
LABEL_25:
  C3DMatrix4x4FromSCNMatrix4(v23, (uint64_t)&v24);
  v15 = C3DMatrix4x4Determinant3x3((uint64_t)v23);
  if (fabs(*(float *)&v15 + -1.0) > 0.00001)
  {
    v22.i32[2] = 0;
    v22.i64[0] = 0;
    v21.i32[2] = 0;
    v21.i64[0] = 0;
    v20 = 0uLL;
    C3DMatrix4x4GetAffineTransforms((uint64_t)v23, &v22, (int8x16_t *)&v20, &v21);
    C3DQuaternionNormalize(&v20);
    C3DMatrix4x4MakeAffine(v23, &v22, &v20, (float32x2_t *)&v21);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v23, &v24);
  }
  v19 = v24;
  -[objc_class setTransform:](self[1].super.isa, "setTransform:", &v19);
  -[objc_class setName:](self[1].super.isa, "setName:", CFSTR("kSCNFreeViewCameraName"));
  objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "setName:", objc_msgSend(CFSTR("kSCNFreeViewCameraName"), "stringByAppendingString:", CFSTR("Camera")));
  if (-[SCNView _showsAuthoringEnvironment](-[SCNCameraNavigationController view](self, "view"), "_showsAuthoringEnvironment"))
  {
    objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "setAutomaticallyAdjustsZRange:", 1);
    v16 = objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "cameraRef");
    *(_BYTE *)(v16 + 64) |= 4u;
  }
  v17 = -[SCNScene sceneRef](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "sceneRef");
  if (v17)
  {
    v18 = (uint64_t)v17;
    if (!C3DGetSceneRef(-[objc_class nodeRef](self[1].super.isa, "nodeRef")))
    {
      C3DSceneLock(v18);
      C3DAddSceneRef((uint64_t *)-[objc_class nodeRef](self[1].super.isa, "nodeRef"), v18);
      C3DSceneUnlock(v18);
    }
  }
}

- (void)_installFreeViewCameraIfNeeded
{
  id v3;

  if (-[SCNCameraNavigationController enableFreeCamera](self, "enableFreeCamera"))
  {
    v3 = -[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer");
    if ((Class)objc_msgSend(v3, "pointOfView") != self[1].super.isa)
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      objc_msgSend(v3, "setPointOfView:", self[1].super.isa);
      -[SCNCameraController setPointOfView:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setPointOfView:", self[1].super.isa);
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if (-[SCNCameraNavigationController enableFreeCamera](self, "enableFreeCamera"))
  {
    if (!-[SCNCameraNavigationController _freeCameraActivated](self, "_freeCameraActivated"))
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      -[SCNCameraNavigationController _prepareFreeViewCamera](self, "_prepareFreeViewCamera");
      -[SCNCameraNavigationController _installFreeViewCameraIfNeeded](self, "_installFreeViewCameraIfNeeded");
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
  }
  else
  {
    -[SCNCameraController setPointOfView:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setPointOfView:", objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView"));
  }
}

- (float)_cappedTranslationDelta:(float)a3
{
  float v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float v12;
  float32x4_t v15;
  float32x4_t v16;

  -[SCNCameraNavigationController _targetDistance](self, "_targetDistance");
  if (v5 >= 10000000.0)
  {
    -[SCNCameraController simdTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "simdTarget");
    v15 = v6;
    objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "presentationNode"), "simdWorldPosition");
    v16 = vsubq_f32(v15, v7);
    -[SCNNode simdWorldFront](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "simdWorldFront");
    v9 = vmulq_f32(v16, v8);
    v10 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0];
    if (v10 >= 0.0 && a3 < 0.0)
      v12 = 0.0;
    else
      v12 = a3;
    if (v12 > 0.0 && v10 < 0.0)
      return 0.0;
    else
      return v12;
  }
  return a3;
}

- (float)_translationCoef
{
  float v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;

  -[SCNCameraNavigationController _targetDistance](self, "_targetDistance");
  v3 = v2;
  if (v3 > 10000000.0)
    v3 = 10000000.0;
  v4 = v3 * 0.00999999978;
  v5 = v3 <= 0.1;
  v6 = 0.000999999978;
  if (!v5)
    return v4;
  return v6;
}

- (float)_targetDistance
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float result;
  float32x4_t v8;

  -[SCNCameraController simdTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "simdTarget");
  v8 = v3;
  objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "presentationNode"), "simdWorldPosition");
  v5 = vsubq_f32(v4, v8);
  v6 = vmulq_f32(v5, v5);
  result = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
  if (result <= 0.1)
    return 0.1;
  return result;
}

- (void)rotateOf:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SCNCameraController *v11;
  double v12;

  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  if (BYTE3(self->_cameraController))
    -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v5 * 0.5;
  v10 = v7 * 0.5;
  v11 = -[SCNCameraNavigationController cameraController](self, "cameraController");
  *(float *)&v12 = a3;
  -[SCNCameraController rollBy:aroundScreenPoint:viewport:](v11, "rollBy:aroundScreenPoint:viewport:", v12, v9, v10, v6, v8);
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  SCNCameraController *v7;
  double v8;
  double v9;
  double v10;
  SCNCameraController *v11;
  double v12;
  double v13;
  double v14;

  v4 = a4;
  if (-[SCNCameraNavigationController autoSwitchToFreeCamera](self, "autoSwitchToFreeCamera"))
    -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  if (-[SCNCameraNavigationController pointOfView](self, "pointOfView"))
  {
    if (v4)
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.3);
      v7 = -[SCNCameraNavigationController cameraController](self, "cameraController");
      *(float *)&v8 = a3 * -100.0;
      LODWORD(v9) = 0;
      LODWORD(v10) = 0;
      -[SCNCameraController translateInCameraSpaceByX:Y:Z:](v7, "translateInCameraSpaceByX:Y:Z:", v9, v10, v8);
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
    else
    {
      v11 = -[SCNCameraNavigationController cameraController](self, "cameraController");
      *(float *)&v12 = a3 * -100.0;
      LODWORD(v13) = 0;
      LODWORD(v14) = 0;
      -[SCNCameraController translateInCameraSpaceByX:Y:Z:](v11, "translateInCameraSpaceByX:Y:Z:", v13, v14, v12);
    }
  }
}

- (void)zoomBy:(float)a3
{
  -[SCNCameraNavigationController zoomBy:animate:](self, "zoomBy:animate:", 1);
}

- (double)zoomFactor
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[SCNCameraNavigationController _pointOfViewUsesOrthographicProjection](self, "_pointOfViewUsesOrthographicProjection");
  v4 = 76;
  if (v3)
    v4 = 84;
  return *(float *)((char *)&self->super.isa + v4);
}

- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;
  float originalOrthoScale;
  double v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;

  -[SCNCameraNavigationController _orthographicScaleForZoomFactor:](self, "_orthographicScaleForZoomFactor:");
  v6 = v5;
  -[SCNCameraNavigationController _sceneBoundingSphere](self, "_sceneBoundingSphere");
  v8 = v7;
  if (v7 == 0.0)
    return self->_orthographicZoomFactor;
  -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
  v10 = v9;
  -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
  v12 = v11;
  if (v12 >= v10)
    v13 = v11;
  else
    v13 = v10;
  if (v12 >= v10)
    v12 = v10;
  v14 = v12 / fmaxf(v13, 1.0);
  originalOrthoScale = self->_originalOrthoScale;
  v16 = v8 * 10000000.0;
  if (v16 <= originalOrthoScale)
  {
    v18 = self->_originalOrthoScale;
  }
  else
  {
    v17 = v16;
    v18 = v17;
  }
  v19 = v8 * 0.00001 * v14;
  if (v19 <= originalOrthoScale)
  {
    v20 = v19;
    v21 = v20;
  }
  else
  {
    v21 = self->_originalOrthoScale;
  }
  if (v6 > v18)
    return originalOrthoScale / v18;
  if (v6 < v21)
    return originalOrthoScale / v21;
  return a3;
}

- (float)_orthographicScaleForZoomFactor:(float)a3
{
  return self->_originalOrthoScale / a3;
}

- (void)setZoomFactor:(double)a3
{
  double v5;
  id v7;
  double v8;
  float v9;
  long double v10;
  long double v11;
  double v12;
  float v13;
  float v14;

  -[SCNCameraNavigationController zoomFactor](self, "zoomFactor");
  if (a3 > 0.0 && v5 != a3)
  {
    if (BYTE3(self->_cameraController))
      -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
    v7 = -[SCNCameraNavigationController pointOfView](self, "pointOfView");
    if (-[SCNCameraNavigationController _pointOfViewUsesOrthographicProjection](self, "_pointOfViewUsesOrthographicProjection"))
    {
      *(float *)&v8 = a3;
      -[SCNCameraNavigationController _orthographicZoomFactorForProposedZoomFactor:](self, "_orthographicZoomFactorForProposedZoomFactor:", v8);
      self->_orthographicZoomFactor = v9;
      -[SCNCameraNavigationController _orthographicScaleForZoomFactor:](self, "_orthographicScaleForZoomFactor:");
      -[SCNCameraNavigationController _setPointOfViewOrthographicScale:](self, "_setPointOfViewOrthographicScale:");
    }
    else
    {
      v10 = tan(self->_cameraOriginalFieldOfView * 0.5 / 180.0 * 3.14159265);
      v11 = atan(v10 / a3);
      *(float *)&v11 = v11 / 3.14159265 * 180.0 + v11 / 3.14159265 * 180.0;
      v12 = fmin(*(float *)&v11, 120.0);
      if (v12 < 1.0)
        v12 = 1.0;
      v13 = v12;
      objc_msgSend((id)objc_msgSend(v7, "camera"), "setFieldOfView:", v13);
      v14 = a3;
      self->_fieldOfViewZoomFactor = v14;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  double v7;
  float32x4_t v8;
  __int32 v9;
  float v10;
  SCNCameraController *v11;
  double v12;
  double v13;
  uint64_t v14;
  __int32 v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;

  v14 = *(_QWORD *)&a4;
  v16.i64[0] = *(_QWORD *)&a3;
  if (BYTE3(self->_cameraController))
    -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  if (-[SCNCameraNavigationController pointOfView](self, "pointOfView", v14))
  {
    *(float *)&v7 = a5;
    -[SCNCameraNavigationController _cappedTranslationDelta:](self, "_cappedTranslationDelta:", v7);
    v8 = v16;
    v8.i32[1] = v15;
    v8.i32[2] = v9;
    v17 = v8;
    -[SCNCameraNavigationController _translationCoef](self, "_translationCoef");
    v18 = vmulq_n_f32(v17, v10);
    v11 = -[SCNCameraNavigationController cameraController](self, "cameraController");
    LODWORD(v12) = v18.i32[1];
    *(float *)&v13 = -v18.f32[2];
    -[SCNCameraController translateInCameraSpaceByX:Y:Z:](v11, "translateInCameraSpaceByX:Y:Z:", *(double *)v18.i64, v12, v13);
  }
}

- (void)viewWillDrawAtTime:(double)a3
{
  _BOOL8 v5;
  __C3DScene *v6;
  uint64_t v7;

  v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  if (-[SCNCameraController isInertiaRunning](-[SCNCameraNavigationController cameraController](self, "cameraController"), "isInertiaRunning"))
  {
    v6 = -[SCNScene sceneRef](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "sceneRef");
    if (v6)
    {
      v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      -[SCNCameraController updateInertiaAtTime:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "updateInertiaAtTime:", a3);
      C3DSceneUnlock(v7);
    }
    else
    {
      -[SCNCameraController updateInertiaAtTime:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "updateInertiaAtTime:", a3);
    }
  }
  os_unfair_lock_unlock(&self->_drawAtTimeLock);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
}

- (void)_willBeginInteraction
{
  float32x4_t v3;
  uint32x4_t v4;
  double v5;
  SCNCamera *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;

  if (!self->_cameraTargetComputed
    && !-[SCNCameraController automaticTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "automaticTarget"))
  {
    -[SCNCameraController simdTarget](-[SCNCameraNavigationController cameraController](self, "cameraController"), "simdTarget");
    v4 = (uint32x4_t)vceqzq_f32(v3);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) != 0)
    {
      self->_cameraTargetComputed = 1;
      -[SCNCameraNavigationController _defaultTargetForScene:](self, "_defaultTargetForScene:", -[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"));
      -[SCNCameraController setSimdTarget:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setSimdTarget:", v5);
    }
  }
  -[SCNCameraNavigationController _stopInertia](self, "_stopInertia");
  v6 = -[SCNNode camera](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "camera");
  if (-[SCNCamera useLegacyFov](v6, "useLegacyFov"))
  {
    -[SCNCamera xFov](v6, "xFov");
    if (v7 != 0.0)
    {
      -[SCNCamera yFov](v6, "yFov");
      if (v8 != 0.0)
      {
        -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
        v11 = v10 / fmax(v9, 1.0);
        -[SCNCamera xFov](v6, "xFov");
        v13 = v12;
        -[SCNCamera yFov](v6, "yFov");
        *(float *)&v13 = v13 / v14;
        -[SCNCamera fieldOfView](v6, "fieldOfView");
        -[SCNCamera setFieldOfView:](v6, "setFieldOfView:");
        -[SCNCamera setProjectionDirection:](v6, "setProjectionDirection:", *(float *)&v13 > v11);
      }
    }
  }
  objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "camera"), "fieldOfView");
  *(float *)&v15 = v15;
  self->_cameraOriginalFieldOfView = *(float *)&v15;
  self->_fieldOfViewZoomFactor = 1.0;
  -[SCNCameraNavigationController _pointOfViewOrthographicScale](self, "_pointOfViewOrthographicScale");
  self->_originalOrthoScale = v16;
  self->_orthographicZoomFactor = 1.0;
}

- (void)_stopInertia
{
  os_unfair_lock_s *p_drawAtTimeLock;
  _QWORD block[5];

  p_drawAtTimeLock = &self->_drawAtTimeLock;
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  -[SCNCameraController stopInertia](-[SCNCameraNavigationController cameraController](self, "cameraController"), "stopInertia");
  os_unfair_lock_unlock(p_drawAtTimeLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SCNCameraNavigationController__stopInertia__block_invoke;
  block[3] = &unk_1EA59E288;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __45__SCNCameraNavigationController__stopInertia__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__didChangePointOfView");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _BOOL4 v7;
  UIGestureRecognizer *pressGesture;
  BOOL v9;
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *panGesture;

  v7 = -[SCNCameraNavigationController enabled](self, "enabled");
  if (v7)
  {
    pressGesture = self->_pressGesture;
    v9 = pressGesture == a3 || pressGesture == a4;
    LOBYTE(v7) = v9
              || (tapGesture = self->_tapGesture, panGesture = self->_panGesture, tapGesture == a3)
              && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)
              || tapGesture == a4 && panGesture == a3
              || tapGesture == a4 && self->_pinchGesture == a3;
  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _BOOL4 v5;

  v5 = -[SCNCameraNavigationController enabled](self, "enabled");
  if (v5)
    -[SCNCameraNavigationController beginGesture:](self, "beginGesture:", a3);
  return v5;
}

- (void)_handlePinch:(id)a3
{
  if (-[SCNCameraNavigationController enabled](self, "enabled"))
    -[SCNCameraNavigationController pinchWithGestureRecognizer:](self, "pinchWithGestureRecognizer:", a3);
}

- (void)_handlePan:(id)a3
{
  if (-[SCNCameraNavigationController enabled](self, "enabled"))
    -[SCNCameraNavigationController panWithGestureRecognizer:](self, "panWithGestureRecognizer:", a3);
}

- (void)_handleRotation:(id)a3
{
  if (-[SCNCameraNavigationController enabled](self, "enabled"))
    -[SCNCameraNavigationController rotateWithGestureRecognizer:](self, "rotateWithGestureRecognizer:", a3);
}

- (void)_handleDoubleTap:(id)a3
{
  if (-[SCNCameraNavigationController enabled](self, "enabled", a3))
    -[SCNCameraNavigationControllerDelegate switchToNextCamera](-[SCNCameraNavigationController delegate](self, "delegate"), "switchToNextCamera");
}

- (void)beginGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;

  if (BYTE3(self->_cameraController))
    -[SCNCameraNavigationController _switchToFreeViewCamera](self, "_switchToFreeViewCamera");
  -[SCNCameraNavigationController _willBeginInteraction](self, "_willBeginInteraction");
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend(a3, "numberOfTouches"))
  {
    objc_msgSend(a3, "locationInView:", -[SCNCameraNavigationController view](self, "view"));
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = 0.0;
    v8 = 0.0;
  }
  self->_lastInputLocation.x = v6;
  self->_lastInputLocation.y = v8;
  self->_lastRotationAngle = 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNCameraNavigationController _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v8);
    v9 = 2;
LABEL_12:
    self->_browseMode = v9;
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNCameraNavigationController _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v8);
    if (self->_translationAllowed)
    {
      self->_browseMode = 3;
      -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
      -[SCNCameraNavigationController _computeTranslationOrigin3DFromPoint:](self, "_computeTranslationOrigin3DFromPoint:", v6, v10 - v8);
    }
    v9 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNCameraNavigationController zoomFactor](self, "zoomFactor");
    *(float *)&v11 = v11;
    self->_initialZoom = *(float *)&v11;
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  double v5;
  double v6;

  objc_msgSend(a3, "rotation");
  v6 = v5;
  -[SCNCameraNavigationController _stopInertia](self, "_stopInertia");
  if (objc_msgSend(a3, "state") == 1)
    -[SCNCameraNavigationController __willChangePointOfView](self, "__willChangePointOfView");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  -[SCNCameraNavigationController rotateOf:](self, "rotateOf:", (v6 - self->_lastRotationAngle) / 3.14159265 * -180.0);
  +[SCNTransaction commit](SCNTransaction, "commit");
  self->_lastRotationAngle = v6;
  if (objc_msgSend(a3, "state") == 4 || objc_msgSend(a3, "state") == 3)
    -[SCNCameraNavigationController __didChangePointOfView](self, "__didChangePointOfView");
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  double v5;
  double v6;

  -[SCNCameraNavigationController _stopInertia](self, "_stopInertia");
  if (objc_msgSend(a3, "state") == 1)
    -[SCNCameraNavigationController __willChangePointOfView](self, "__willChangePointOfView");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  v5 = fmax(self->_initialZoom, 0.001);
  objc_msgSend(a3, "scale");
  -[SCNCameraNavigationController setZoomFactor:](self, "setZoomFactor:", v6 * v5);
  +[SCNTransaction commit](SCNTransaction, "commit");
  if (objc_msgSend(a3, "state") == 4 || objc_msgSend(a3, "state") == 3)
    -[SCNCameraNavigationController __didChangePointOfView](self, "__didChangePointOfView");
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SCNCameraController *v11;
  SCNCameraController *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float v22;
  SCNCameraController *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SCNCameraController *v28;

  v5 = objc_msgSend(a3, "numberOfTouches");
  if (self->_browseMode != 2)
  {
    v6 = v5;
    objc_msgSend(a3, "locationInView:", -[SCNCameraNavigationController view](self, "view"));
    v8 = v7;
    v10 = v9;
    -[SCNCameraNavigationController _stopInertia](self, "_stopInertia");
    if (objc_msgSend(a3, "state") == 1)
      -[SCNCameraNavigationController __willChangePointOfView](self, "__willChangePointOfView");
    +[SCNTransaction begin](SCNTransaction, "begin");
    +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
    if (objc_msgSend(a3, "state") == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        objc_msgSend(a3, "velocityInView:", -[SCNCameraNavigationController view](self, "view"));
        if (-[SCNView preferredFramesPerSecond](-[SCNCameraNavigationController view](self, "view"), "preferredFramesPerSecond"))
        {
          -[SCNView preferredFramesPerSecond](-[SCNCameraNavigationController view](self, "view"), "preferredFramesPerSecond");
        }
        v11 = -[SCNCameraNavigationController cameraController](self, "cameraController");
        -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
        -[SCNCameraController endInteraction:withViewport:velocity:](v11, "endInteraction:withViewport:velocity:", v8, v10);
        if (!-[SCNCameraController isInertiaRunning](-[SCNCameraNavigationController cameraController](self, "cameraController"), "isInertiaRunning"))-[SCNCameraNavigationController __didChangePointOfView](self, "__didChangePointOfView");
      }
    }
    else
    {
      switch(v6)
      {
        case 3:
          if (self->_lastGestureFingerCount != 3)
          {
            -[SCNCameraNavigationController beginGesture:](self, "beginGesture:", a3);
            self->_lastGestureFingerCount = 3;
          }
          -[SCNCameraNavigationController _translationCoef](self, "_translationCoef");
          v19 = v18;
          v20 = v10 - self->_lastInputLocation.y;
          *(float *)&v20 = v20;
          -[SCNCameraNavigationController _cappedTranslationDelta:](self, "_cappedTranslationDelta:", v20);
          v22 = v21;
          v23 = -[SCNCameraNavigationController cameraController](self, "cameraController");
          *(float *)&v24 = -(float)(v19 * v22);
          LODWORD(v25) = 0;
          LODWORD(v26) = 0;
          -[SCNCameraController translateInCameraSpaceByX:Y:Z:](v23, "translateInCameraSpaceByX:Y:Z:", v25, v26, v24);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            -[SCNCameraNavigationController beginGesture:](self, "beginGesture:", a3);
            self->_lastGestureFingerCount = 2;
          }
          -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
          v10 = v27 - v10;
          -[SCNCameraNavigationController _translateToViewPoint:](self, "_translateToViewPoint:", v8, v10);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            v12 = -[SCNCameraNavigationController cameraController](self, "cameraController");
            -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
            v14 = v13;
            v16 = v15;
            -[SCNCameraNavigationController _modeSensitivity](self, "_modeSensitivity");
            -[SCNCameraController continueInteraction:withViewport:sensitivity:](v12, "continueInteraction:withViewport:sensitivity:", v8, v10, v14, v16, v17);
          }
          else
          {
            -[SCNCameraNavigationController beginGesture:](self, "beginGesture:", a3);
            v28 = -[SCNCameraNavigationController cameraController](self, "cameraController");
            -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
            -[SCNCameraController beginInteraction:withViewport:](v28, "beginInteraction:withViewport:", v8, v10);
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
    +[SCNTransaction commit](SCNTransaction, "commit");
    self->_lastInputLocation.x = v8;
    self->_lastInputLocation.y = v10;
  }
}

- (double)_modeSensitivity
{
  SCNInteractionMode v3;
  double result;

  v3 = -[SCNCameraController interactionMode](-[SCNCameraNavigationController cameraController](self, "cameraController"), "interactionMode");
  if ((unint64_t)v3 >= SCNInteractionModePan)
  {
    if (v3 == SCNInteractionModeTruck)
    {
      -[SCNCameraNavigationController truckSensitivity](self, "truckSensitivity");
    }
    else if (v3 == SCNInteractionModePan)
    {
      -[SCNCameraNavigationController panSensitivity](self, "panSensitivity");
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    -[SCNCameraNavigationController rotationSensitivity](self, "rotationSensitivity");
  }
  return result;
}

- (uint64_t)worldFront
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "cameraController"), "pointOfView"), "simdWorldFront");
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  Class v6;
  __int128 v7;
  float v8;

  y = a3.y;
  x = a3.x;
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  v6 = -[SCNCameraNavigationController pointOfView](self, "pointOfView");
  if (BYTE3(self->_cameraController))
    -[SCNCameraNavigationController _prepareFreeViewCamera](self, "_prepareFreeViewCamera");
  if (!-[objc_class parentNode](v6, "parentNode") && v6 != self[1].super.isa)
    -[SCNCameraNavigationController _installFreeViewCameraIfNeeded](self, "_installFreeViewCameraIfNeeded");
  +[SCNTransaction commit](SCNTransaction, "commit");
  self->_initialInputLocation.x = x;
  self->_initialInputLocation.y = y;
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "simdConvertPosition:toNode:", 0, 0.0);
  *(_OWORD *)self->_initialPointOfViewWorldPosition = v7;
  -[SCNCameraNavigationController _pointOfViewOrthographicScale](self, "_pointOfViewOrthographicScale");
  self->_originalOrthoScale = v8;
  self->_orthographicZoomFactor = 1.0;
}

- (void)_defaultTargetForScene:(void *)a3
{
  void *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  uint64_t v9;
  double v10;
  float v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x4_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;

  v5 = (void *)objc_msgSend(a1, "pointOfView");
  objc_msgSend(a1, "worldFront");
  v25 = v6;
  objc_msgSend((id)objc_msgSend(v5, "presentationInstance"), "simdConvertPosition:toNode:", 0, 0.0);
  v26 = v7;
  v8.i64[0] = objc_msgSend(a1, "_sceneBoundingSphere");
  v8.i64[1] = v9;
  v23 = vsubq_f32(v8, v26);
  objc_msgSend((id)objc_msgSend(v5, "camera"), "fieldOfView");
  *(float *)&v10 = v10 * 3.14159265 / 180.0;
  v11 = cosf(*(float *)&v10);
  v12 = (int32x4_t)vmulq_f32(v23, v23);
  v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
  v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  v15 = vmulq_f32(v25, vmulq_n_f32(v23, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]));
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0] <= v11)
  {
    objc_msgSend((id)objc_msgSend(v5, "camera"), "zFar");
    *(float *)&v16 = v16;
    v24 = vmlaq_n_f32(v26, v25, *(float *)&v16);
    v17 = (void *)objc_msgSend(a3, "rootNode");
    LODWORD(v19) = v26.i32[2];
    LODWORD(v18) = v26.i32[1];
    LODWORD(v21) = v24.i32[2];
    LODWORD(v20) = v24.i32[1];
    v22 = (void *)objc_msgSend(v17, "hitTestWithSegmentFromPoint:toPoint:options:", 0, *(double *)v26.i64, v18, v19, *(double *)v24.i64, v20, v21);
    if (objc_msgSend(v22, "count"))
      objc_msgSend((id)objc_msgSend(v22, "firstObject"), "worldCoordinates");
    else
      objc_msgSend(a1, "_targetDistance");
  }
}

- (SCNVector3)cameraAutomaticTargetPoint
{
  float v3;
  float v4;
  float v5;
  SCNVector3 result;

  -[SCNCameraNavigationController _computeAutomaticTargetPointIfNeeded](self, "_computeAutomaticTargetPointIfNeeded");
  -[SCNCameraController target](-[SCNCameraNavigationController cameraController](self, "cameraController"), "target");
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- ($9BBE2667FA0C53BBDA0194B766E02F4A)_sceneBoundingSphere
{
  double BoundingSphere;
  float v4;
  float v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  $9BBE2667FA0C53BBDA0194B766E02F4A result;

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->_isSceneBoundingSphereComputed
    && -[SCNScene rootNode](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "rootNode"))
  {
    v9[0] = -[SCNScene rootNode](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "rootNode");
    BoundingSphere = SCNNodeGetBoundingSphere((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), 0);
    *(_QWORD *)self->_anon_70 = v7;
    *(_QWORD *)&self->_anon_70[8] = v8;
    self->_isSceneBoundingSphereComputed = 1;
  }
  result.var0.var0 = *(float *)&BoundingSphere;
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  return result;
}

- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = MEMORY[0x1E0C809B0];
  *(_OWORD *)a4 = xmmword_1DD008490;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __84__SCNCameraNavigationController__computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke;
  v7[3] = &__block_descriptor_40_e20_q16__0____C3DNode__8l;
  v7[4] = a4;
  C3DNodeApplyHierarchy((uint64_t)a3, (uint64_t)v7);
  return *((float *)a4 + 3) >= 0.0;
}

uint64_t __84__SCNCameraNavigationController__computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke(uint64_t a1, float32x4_t *a2)
{
  const void *Geometry;
  float32x4_t *WorldMatrix;
  float32x4_t v7;

  if ((C3DNodeIsHidden((uint64_t)a2) & 1) != 0)
    return 1;
  if (!C3DNodeGetFloor((uint64_t)a2))
  {
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

- (void)_computeStickyAxisIfNeeded:(CGPoint)a3
{
  CGFloat y;
  float32x2_t v4;
  int32x2_t v5;
  int8x16_t v6;
  int64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  uint64_t v10;

  if (self->_anon_119[3])
  {
    if (!*(_QWORD *)&self->_anon_119[19])
    {
      y = a3.y;
      v4 = vcvt_f32_f64(vaddq_f64((float64x2_t)a3, vcvtq_f64_f32(*(float32x2_t *)&self->_anon_119[11])));
      *(float32x2_t *)&self->_anon_119[11] = v4;
      if (vaddv_f32(vmul_f32(v4, v4)) > 1.0)
      {
        v5 = vdup_n_s32(self->_browseMode == 3);
        v6 = (int8x16_t)vcvtq_f64_f32(v4);
        v7.i64[0] = v5.u32[0];
        v7.i64[1] = v5.u32[1];
        v8 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), v6, vextq_s8(v6, v6, 8uLL));
        v9 = vabsq_f64(v8);
        if ((vmovn_s64(vcgeq_f64(v9, (float64x2_t)vdupq_laneq_s64((int64x2_t)v9, 1))).u8[0] & 1) != 0
          && v8.f64[0] != 0.0)
        {
          v10 = 1;
LABEL_10:
          *(_QWORD *)&self->_anon_119[19] = v10;
          return;
        }
        if (v8.f64[1] != 0.0)
        {
          v10 = 2;
          goto LABEL_10;
        }
      }
    }
  }
}

- (float)_pointOfViewOrthographicScale
{
  SCNCamera *v3;
  SCNLight *v4;
  double v5;

  v3 = -[SCNNode camera](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "camera");
  v4 = -[SCNNode light](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "light");
  if (!v3)
  {
    v3 = (SCNCamera *)v4;
    if (!v4)
      return 1.0;
  }
  -[SCNCamera orthographicScale](v3, "orthographicScale");
  return v5;
}

- (void)_setPointOfViewOrthographicScale:(float)a3
{
  SCNCamera *v5;
  SCNLight *v6;

  v5 = -[SCNNode camera](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "camera");
  v6 = -[SCNNode light](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "light");
  if (v5 || (v5 = (SCNCamera *)v6) != 0)
    -[SCNCamera setOrthographicScale:](v5, "setOrthographicScale:", a3);
}

- (BOOL)_pointOfViewUsesOrthographicProjection
{
  SCNCamera *v3;
  SCNLight *v4;

  v3 = -[SCNNode camera](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "camera");
  v4 = -[SCNNode light](-[SCNCameraController pointOfView](-[SCNCameraNavigationController cameraController](self, "cameraController"), "pointOfView"), "light");
  if (v3)
  {
    LOBYTE(v4) = -[SCNCamera usesOrthographicProjection](v3, "usesOrthographicProjection");
  }
  else if (v4)
  {
    LOBYTE(v4) = -[NSString isEqualToString:](-[SCNLight type](v4, "type"), "isEqualToString:", CFSTR("directional"));
  }
  return (char)v4;
}

- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3
{
  float64x2_t v4;
  double v5;
  float64_t v6;
  float64x2_t v7;
  id v8;
  uint64_t v9;
  __C3DScene *v10;
  uint64_t v11;
  double v12;
  int v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x2_t v18;
  float32x4_t v19;
  int8x16_t v20;
  float v21;
  float32x4_t v22;
  int8x16_t v23;
  float v24;
  BOOL v25;
  float32x4_t v26;
  float32x4_t v27;
  NSObject *v28;
  CGFloat x;
  CGFloat y;
  __n128 v31;
  uint8_t buf[16];
  float32x4_t v33;
  float32x4_t v34;

  x = a3.x;
  y = a3.y;
  -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
  v4.f64[0] = x;
  v4.f64[1] = y;
  v5 = COERCE_DOUBLE(vcvt_f32_f64(v4));
  v7.f64[1] = v6;
  v31 = (__n128)vcvt_hight_f32_f64(0, v7);
  v8 = -[SCNCameraNavigationController pointOfView](self, "pointOfView");
  *(_QWORD *)self->_translationOrigin = -[SCNCameraNavigationController _sceneBoundingSphere](self, "_sceneBoundingSphere");
  *(_QWORD *)&self->_translationOrigin[8] = v9;
  v10 = -[SCNScene sceneRef](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "sceneRef");
  v11 = (uint64_t)v10;
  if (v10)
    C3DSceneLock((uint64_t)v10);
  v12 = _C3DHitTestComputeHitSegment((float32x4_t *)objc_msgSend(v8, "nodeRef"), v11, &v33, &v34, v31, v5);
  if (v13)
  {
    -[SCNCameraNavigationController worldFront](self, "worldFront", v12);
    v14 = vmulq_f32(*(float32x4_t *)self->_translationOrigin, v15);
    v15.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0];
    v16 = vsubq_f32(v34, v33);
    v17 = vmulq_f32(v16, v16);
    v18 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
    *(float *)v18.i32 = sqrtf(*(float *)v18.i32);
    v19 = vdivq_f32(v16, (float32x4_t)vdupq_lane_s32(v18, 0));
    v19.i32[3] = 0;
    v20 = (int8x16_t)vmulq_f32(v15, v19);
    v21 = vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)));
    if (v21 != 0.0
      && ((v22 = v33,
           v22.i32[3] = 1.0,
           v23 = (int8x16_t)vmulq_f32(v22, v15),
           v24 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL)))
               / v21,
           v24 >= 0.0)
        ? (v25 = v24 <= *(float *)v18.i32)
        : (v25 = 0),
          v25))
    {
      v27 = vmlaq_n_f32(v22, v19, v24);
    }
    else
    {
      v26.i64[0] = 0x3F0000003F000000;
      v26.i64[1] = 0x3F0000003F000000;
      v27 = vmulq_f32(vaddq_f32(v33, v34), v26);
    }
    *(float32x4_t *)self->_translationOrigin = v27;
  }
  else
  {
    v28 = scn_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCB8000, v28, OS_LOG_TYPE_DEFAULT, "Warning: _computeTranslationOrigin3DFromPoint: invalid zRange", buf, 2u);
    }
  }
  if (v11)
    C3DSceneUnlock(v11);
}

- (void)_translateToViewPoint:(CGPoint)a3
{
  float64_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  id v8;
  __C3DScene *v9;
  uint64_t v10;
  int v11;
  int v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int8x16_t v19;
  float v20;
  float32x4_t v21;
  int8x16_t v22;
  float v23;
  BOOL v24;
  NSObject *v25;
  SCNCameraController *v26;
  double v27;
  double v28;
  CGFloat x;
  float v30;
  CGFloat y;
  float32x4_t v32;
  __n128 v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  uint8_t buf[16];
  float32x4_t v38;
  float32x4_t v39;
  simd_float4x4 v40;
  simd_float4x4 v41;

  x = a3.x;
  y = a3.y;
  -[SCNView bounds](-[SCNCameraNavigationController view](self, "view"), "bounds");
  v5.f64[1] = v4;
  v33 = (__n128)vcvt_hight_f32_f64(0, v5);
  v6.f64[0] = x;
  v6.f64[1] = y;
  v7 = COERCE_DOUBLE(vcvt_f32_f64(v6));
  v8 = -[SCNCameraNavigationController pointOfView](self, "pointOfView");
  v9 = -[SCNScene sceneRef](-[SCNView scene](-[SCNCameraNavigationController view](self, "view"), "scene"), "sceneRef");
  v10 = (uint64_t)v9;
  if (v9)
    C3DSceneLock((uint64_t)v9);
  _C3DHitTestComputeHitSegment((float32x4_t *)objc_msgSend(v8, "nodeRef"), v10, &v38, &v39, v33, v7);
  v12 = v11;
  if (v10)
    C3DSceneUnlock(v10);
  if (v12)
  {
    v32 = v38;
    v13 = vsubq_f32(v39, v38);
    v14 = vmulq_f32(v13, v13);
    v14.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u64[0];
    v14.f32[0] = sqrtf(v14.f32[0]);
    v30 = v14.f32[0];
    v15 = vdivq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
    v15.i32[3] = 0;
    v34 = v15;
    -[SCNCameraNavigationController worldFront](self, "worldFront");
    v16 = *(float32x4_t *)self->_translationOrigin;
    v17 = vmulq_f32(v16, v18);
    v18.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0];
    v19 = (int8x16_t)vmulq_f32(v18, v34);
    v20 = vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)));
    if (v20 != 0.0
      && ((v21 = v32,
           v21.i32[3] = 1.0,
           v22 = (int8x16_t)vmulq_f32(v21, v18),
           v23 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))
               / v20,
           v23 >= 0.0)
        ? (v24 = v23 <= v30)
        : (v24 = 0),
          v24))
    {
      v35 = vsubq_f32(v16, vmlaq_n_f32(v21, v34, v23));
      objc_msgSend(v8, "simdWorldTransform");
      v41 = __invert_f4(v40);
      v36 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v41.columns[1], *(float32x2_t *)v35.f32, 1), (float32x4_t)v41.columns[0], v35.f32[0]), (float32x4_t)v41.columns[2], v35, 2);
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      v26 = -[SCNCameraNavigationController cameraController](self, "cameraController");
      LODWORD(v28) = v36.i32[2];
      LODWORD(v27) = v36.i32[1];
      -[SCNCameraController translateInCameraSpaceByX:Y:Z:](v26, "translateInCameraSpaceByX:Y:Z:", *(double *)v36.i64, v27, v28);
      +[SCNTransaction commit](SCNTransaction, "commit");
    }
    else
    {
      v25 = scn_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCCB8000, v25, OS_LOG_TYPE_DEFAULT, "Warning: Warning: no C3DIntersectionRay3Plane", buf, 2u);
      }
    }
  }
}

- (void)__willChangePointOfView
{
  if (!self->_recordingPointOfViewEvents)
  {
    self->_recordingPointOfViewEvents = 1;
    -[SCNCameraNavigationController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SCNCameraNavigationControllerDelegate willChangePointOfView](-[SCNCameraNavigationController delegate](self, "delegate"), "willChangePointOfView");
  }
}

- (void)__didChangePointOfView
{
  if (self->_recordingPointOfViewEvents)
  {
    -[SCNCameraNavigationController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SCNCameraNavigationControllerDelegate didChangePointOfView](-[SCNCameraNavigationController delegate](self, "delegate"), "didChangePointOfView");
    self->_recordingPointOfViewEvents = 0;
  }
}

- (SCNCameraNavigationControllerDelegate)delegate
{
  return (SCNCameraNavigationControllerDelegate *)self->_view;
}

- (void)setView:(id)a3
{
  self->_freeViewCameraNode = (SCNNode *)a3;
}

- (SCNNode)freeCamera
{
  return (SCNNode *)self[1].super.isa;
}

- (BOOL)enableFreeCamera
{
  return BYTE2(self->_cameraController);
}

- (BOOL)autoSwitchToFreeCamera
{
  return BYTE3(self->_cameraController);
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  BYTE3(self->_cameraController) = a3;
}

- (double)flyModeVelocity
{
  return self->_flyModeVelocity;
}

- (void)setFlyModeVelocity:(double)a3
{
  self->_flyModeVelocity = a3;
}

- (double)panSensitivity
{
  return self->_panSensitivity;
}

- (void)setPanSensitivity:(double)a3
{
  self->_panSensitivity = a3;
}

- (double)truckSensitivity
{
  return self->_truckSensitivity;
}

- (void)setTruckSensitivity:(double)a3
{
  self->_truckSensitivity = a3;
}

- (double)rotationSensitivity
{
  return self->_rotationSensitivity;
}

- (void)setRotationSensitivity:(double)a3
{
  self->_rotationSensitivity = a3;
}

- (void).cxx_destruct
{
  unsigned __int16 *end;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;

  end = self->_keyboard.right.__end_;
  if (end)
  {
    self->_keyboard.right.__end_cap_.__value_ = end;
    operator delete(end);
  }
  v4 = self->_keyboard.left.__end_;
  if (v4)
  {
    self->_keyboard.left.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
  v5 = self->_keyboard.backward.__end_;
  if (v5)
  {
    self->_keyboard.backward.__end_cap_.__value_ = v5;
    operator delete(v5);
  }
  v6 = self->_keyboard.forward.__end_;
  if (v6)
  {
    self->_keyboard.forward.__end_cap_.__value_ = v6;
    operator delete(v6);
  }
  std::__tree<char>::destroy((uint64_t)&self->_keyboard.keyDown.__tree_.__pair1_, (_QWORD *)self->_keyboard.keyDown.__tree_.__pair3_.__value_);
}

- (void)setGimbalLockVector:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: setGimbalLockVector is deprecated", v1, 2u);
}

@end
