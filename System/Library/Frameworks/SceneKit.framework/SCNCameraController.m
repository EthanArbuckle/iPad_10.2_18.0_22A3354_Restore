@implementation SCNCameraController

- (SCNNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3 updateUpTransform:(BOOL)a4
{
  if (self->_pointOfView != a3)
  {
    -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0, a4);

    self->_pointOfView = (SCNNode *)a3;
  }
}

- (void)setPointOfView:(SCNNode *)pointOfView
{
  -[SCNCameraController setPointOfView:updateUpTransform:](self, "setPointOfView:updateUpTransform:", pointOfView, 0);
}

- (void)setUp:(SCNVector3)a3
{
  float y;

  y = a3.y;
  -[SCNCameraController setSimdUp:](self, "setSimdUp:", *(double *)&a3.x);
}

- (void)setSimdUp:(SCNCameraController *)self
{
  float32x4_t v2;
  int32x4_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x4_t v7;

  v7 = v2;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  v4 = (int32x4_t)vmulq_f32(v7, v7);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  *(float32x4_t *)self->_up = vmulq_n_f32(v7, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
}

- (void)_setInertiaRunning:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD block[5];

  if (self->_inertia.inertiaRunning != a3)
  {
    if (a3)
    {
      -[SCNCameraController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__SCNCameraController__setInertiaRunning___block_invoke;
        block[3] = &unk_1EA59E288;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      if (!-[SCNCameraController drivenByDefaultNavigationCameraController](self, "drivenByDefaultNavigationCameraController"))
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __42__SCNCameraController__setInertiaRunning___block_invoke_2;
        v7[3] = &unk_1EA5A1198;
        v7[4] = self;
        *(_QWORD *)&self->_anon_e0[8] = objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v7, 0.0166666667);
      }
      self->_inertia.inertiaRunning = a3;
    }
    else
    {
      if (!-[SCNCameraController drivenByDefaultNavigationCameraController](self, "drivenByDefaultNavigationCameraController"))
      {
        v5 = *(void **)&self->_anon_e0[8];
        if (v5)
          objc_msgSend(v5, "invalidate");
        *(_QWORD *)&self->_anon_e0[8] = 0;
      }
      self->_inertia.inertiaRunning = a3;
      -[SCNCameraController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __42__SCNCameraController__setInertiaRunning___block_invoke_3;
        v6[3] = &unk_1EA59E288;
        v6[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v6);
      }
    }
  }
}

- (void)setSimdTarget:(SCNCameraController *)self
{
  __int128 v2;

  *(_OWORD *)self->_target = v2;
}

- (void)setDrivenByDefaultNavigationCameraController:(BOOL)a3
{
  self->_drivenBydefaultNavigationCameraController = a3;
}

- (void)setInteractionMode:(SCNInteractionMode)interactionMode
{
  if (self->_interactionMode != interactionMode)
  {
    -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
    self->_interactionMode = interactionMode;
  }
}

- (void)setInertiaEnabled:(BOOL)inertiaEnabled
{
  self->_inertia.inertiaEnabled = inertiaEnabled;
  if (-[SCNCameraController isInertiaRunning](self, "isInertiaRunning"))
  {
    if (!inertiaEnabled)
      -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  }
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (SCNCameraControllerDelegate *)delegate;
}

- (BOOL)isInertiaRunning
{
  return self->_inertia.inertiaRunning;
}

- (SCNCameraController)init
{
  SCNCameraController *v2;
  SCNCameraController *v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCameraController;
  v2 = -[SCNCameraController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_inertia.friction = 0x3F8000003D4CCCCDLL;
    v2->_inertia.translationSensitivity = 1.0;
    *(_OWORD *)v2->_up = xmmword_1DD007920;
    v2->_automaticTarget = 0;
    v4 = C3DWasLinkedBeforeMajorOSYear2017();
    v5 = 1;
    if (v4)
      v5 = 2;
    v3->_interactionMode = v5;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SCNCameraController;
  -[SCNCameraController dealloc](&v3, sel_dealloc);
}

- (SCNVector3)target
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNCameraController simdTarget](self, "simdTarget");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setTarget:(SCNVector3)target
{
  float y;

  y = target.y;
  -[SCNCameraController setSimdTarget:](self, "setSimdTarget:", *(double *)&target.x);
}

- (SCNVector3)up
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNCameraController simdUp](self, "simdUp");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldUp
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNCameraController simdUp](self, "simdUp");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setWorldUp:(SCNVector3)worldUp
{
  float y;

  y = worldUp.y;
  -[SCNCameraController setSimdUp:](self, "setSimdUp:", *(double *)&worldUp.x);
}

- (BOOL)inertiaEnabled
{
  return self->_inertia.inertiaEnabled;
}

- (float)inertiaFriction
{
  return self->_inertia.friction;
}

- (void)setInertiaFriction:(float)inertiaFriction
{
  self->_inertia.friction = inertiaFriction;
}

- (__n128)simdUp
{
  return a1[15];
}

- (__n128)simdTarget
{
  return a1[16];
}

- (float)minimumVerticalAngle
{
  return *(float *)&self->_minimumAngles[4];
}

- (float)minimumHorizontalAngle
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_minimumAngles;
  LODWORD(result) = v2;
  return result;
}

- (float)maximumVerticalAngle
{
  return *(float *)&self->_maximumAngles[4];
}

- (float)maximumHorizontalAngle
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_maximumAngles;
  LODWORD(result) = v2;
  return result;
}

- (void)setMinimumVerticalAngle:(float)minimumVerticalAngle
{
  double v3;
  float v4;

  v3 = minimumVerticalAngle / 180.0 * 3.14159265;
  if (v3 > 1.57079633)
    v3 = 1.57079633;
  v4 = fmax(v3, -1.57079633);
  *(float *)&self->_minimumAngles[4] = v4;
}

- (void)setMinimumHorizontalAngle:(float)minimumHorizontalAngle
{
  double v3;
  float v4;

  v3 = minimumHorizontalAngle / 180.0 * 3.14159265;
  if (v3 > 3.14159265)
    v3 = 3.14159265;
  v4 = fmax(v3, -3.14159265);
  *(float *)self->_minimumAngles = v4;
}

- (void)setMaximumVerticalAngle:(float)maximumVerticalAngle
{
  double v3;
  float v4;

  v3 = maximumVerticalAngle / 180.0 * 3.14159265;
  if (v3 > 1.57079633)
    v3 = 1.57079633;
  v4 = fmax(v3, -1.57079633);
  *(float *)&self->_maximumAngles[4] = v4;
}

- (void)setMaximumHorizontalAngle:(float)maximumHorizontalAngle
{
  double v3;
  float v4;

  v3 = maximumHorizontalAngle / 180.0 * 3.14159265;
  if (v3 > 3.14159265)
    v3 = 3.14159265;
  v4 = fmax(v3, -3.14159265);
  *(float *)self->_maximumAngles = v4;
}

- (void)translateInCameraSpaceByX:(float)deltaX Y:(float)deltaY Z:(float)deltaZ
{
  double v9;
  double v10;
  double v11;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  *(float *)&v9 = deltaX;
  *(float *)&v10 = deltaY;
  *(float *)&v11 = deltaZ;
  -[SCNCameraController _translateInCameraSpaceByX:Y:Z:](self, "_translateInCameraSpaceByX:Y:Z:", v9, v10, v11);
}

- (void)translateInScreenSpaceTo:(CGPoint)a3 viewport:(CGSize)a4
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v9;
  unsigned int v10;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  *(float *)&v9 = x - width * 0.5;
  *(float *)&v10 = height - y - height * 0.5;
  -[SCNNode simdLocalTranslateBy:](-[SCNCameraController pointOfView](self, "pointOfView"), "simdLocalTranslateBy:", COERCE_DOUBLE(__PAIR64__(v10, v9)));
}

- (void)rotateByX:(float)deltaX Y:(float)deltaY
{
  double v7;
  double v8;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  if (!self->_handlingInteraction)
    -[SCNCameraController _resetOrientationState](self, "_resetOrientationState");
  v7 = deltaX / 180.0 * 3.14159265;
  *(float *)&v7 = v7;
  v8 = deltaY / 180.0 * 3.14159265;
  *(float *)&v8 = v8;
  -[SCNCameraController _rotateByX:Y:](self, "_rotateByX:Y:", v7, v8);
}

- (void)rollCameraSpaceBy:(float)a3 withPoint:(CGPoint)a4 viewport:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  float32x2_t v16;
  float32x2_t v17;
  __int128 v18;
  float32x4_t v19;
  float32x4_t v20;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  v12 = v11;
  v13 = vmulq_f32(v11, v11);
  v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)));
  if (v14.f32[0] <= 0.000000001)
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  }
  else
  {
    v19 = v14;
    v15 = a3 / 180.0 * 3.14159265;
    v20 = v12;
    LODWORD(v18) = *(_QWORD *)&__sincosf_stret(v15 * 0.5);
    v16 = vrsqrte_f32((float32x2_t)v19.u32[0]);
    v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v16, v16)));
    *(_QWORD *)&v18 = vmulq_n_f32(vmulq_n_f32(v20, vmul_f32(v17, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v17, v17))).f32[0]), *(float *)&v18).u64[0];
  }
  -[SCNNode simdLocalRotateBy:](-[SCNCameraController pointOfView](self, "pointOfView", *(_OWORD *)&v19), "simdLocalRotateBy:", *(double *)&v18);
}

- (void)rollAroundTarget:(float)delta
{
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float v8;
  float32x2_t v9;
  float32x2_t v10;
  __int128 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  simd_float4x4 v15;
  simd_float4x4 v16;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  -[SCNCameraController simdTarget](self, "simdTarget");
  v13 = v5;
  -[SCNNode simdWorldTransform](-[SCNCameraController pointOfView](self, "pointOfView"), "simdWorldTransform");
  v16 = __invert_f4(v15);
  v6 = vaddq_f32((float32x4_t)v16.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v16.columns[0], v13.f32[0]), (float32x4_t)v16.columns[1], *(float32x2_t *)v13.f32, 1), (float32x4_t)v16.columns[2], v13, 2));
  v16.columns[0] = (simd_float4)vmulq_f32(v6, v6);
  v7 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16.columns[0], 2), vaddq_f32((float32x4_t)v16.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.columns[0].f32, 1)));
  if (v7.f32[0] <= 0.000000001)
  {
    v11 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  }
  else
  {
    v12 = v7;
    v8 = delta / 180.0 * 3.14159265;
    v14 = v6;
    LODWORD(v11) = *(_QWORD *)&__sincosf_stret(v8 * 0.5);
    v9 = vrsqrte_f32((float32x2_t)v12.u32[0]);
    v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v9, v9)));
    *(_QWORD *)&v11 = vmulq_n_f32(vmulq_n_f32(v14, vmul_f32(v10, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v10, v10))).f32[0]), *(float *)&v11).u64[0];
  }
  -[SCNNode simdLocalRotateBy:](-[SCNCameraController pointOfView](self, "pointOfView", *(_OWORD *)&v12), "simdLocalRotateBy:", *(double *)&v11);
}

- (void)dollyToTarget:(float)delta
{
  SCNNode *v5;
  int8x16_t v6;
  __int32 v7;
  simd_float4x4 v8;
  __int32 v9;
  int8x16_t v10;
  int8x16_t v11;
  float32x4_t v12;
  SCNNode *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float32x4_t v18;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  simd_float4 v23;
  int64x2_t v24;
  int32x4_t v25;
  int8x16_t v26;
  simd_float4x4 v27;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  v5 = -[SCNCameraController pointOfView](self, "pointOfView");
  if (v5)
  {
    -[SCNNode transform](v5, "transform");
    v8.columns[0] = v23;
    v8.columns[1].i32[0] = v24.i32[0];
    v7 = v23.i32[3];
    v8.columns[2].i32[0] = v24.i32[1];
    v9 = v25.i32[0];
    v8.columns[3] = (simd_float4)v26;
    v10 = vextq_s8(v26, (int8x16_t)vtrn2q_s32(v25, (int32x4_t)v26), 4uLL);
    v11 = (int8x16_t)vzip2q_s64((int64x2_t)v25, v24);
    v6 = vextq_s8((int8x16_t)v8.columns[0], (int8x16_t)v8.columns[0], 8uLL);
    *(int8x8_t *)v6.i8 = vext_s8(*(int8x8_t *)v23.f32, *(int8x8_t *)v6.i8, 4uLL);
  }
  else
  {
    v8.columns[3] = 0uLL;
    v6.i64[0] = 0;
    v8.columns[2].i32[0] = 0;
    v9 = 0;
    v8.columns[1].i32[0] = 0;
    v7 = 0;
    v8.columns[0] = 0uLL;
    v10 = 0uLL;
    v11 = 0uLL;
  }
  v8.columns[0] = (simd_float4)vextq_s8(vextq_s8((int8x16_t)v8.columns[0], (int8x16_t)v8.columns[0], 4uLL), v6, 0xCuLL);
  v8.columns[0].i32[3] = v7;
  v8.columns[1].i32[1] = v8.columns[2].i32[0];
  v8.columns[1].i64[1] = v11.i64[1];
  v8.columns[2] = (simd_float4)vextq_s8(v10, v11, 8uLL);
  v8.columns[2].i32[0] = v9;
  v8.columns[3] = (simd_float4)vextq_s8(vextq_s8((int8x16_t)v8.columns[3], (int8x16_t)v8.columns[3], 4uLL), v10, 0xCuLL);
  v27 = __invert_f4(v8);
  v27.columns[0] = (simd_float4)vaddq_f32((float32x4_t)v27.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v27.columns[0], COERCE_FLOAT(*(_OWORD *)self->_target)), (float32x4_t)v27.columns[1], *(float32x2_t *)self->_target, 1), (float32x4_t)v27.columns[2], *(float32x4_t *)self->_target, 2));
  v27.columns[1] = (simd_float4)vmulq_f32((float32x4_t)v27.columns[0], (float32x4_t)v27.columns[0]);
  v27.columns[1].i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v27.columns[1], 2), vadd_f32(*(float32x2_t *)v27.columns[1].f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.columns[1].f32, 1))).u32[0];
  *(float32x2_t *)v27.columns[2].f32 = vrsqrte_f32((float32x2_t)v27.columns[1].u32[0]);
  *(float32x2_t *)v27.columns[2].f32 = vmul_f32(*(float32x2_t *)v27.columns[2].f32, vrsqrts_f32((float32x2_t)v27.columns[1].u32[0], vmul_f32(*(float32x2_t *)v27.columns[2].f32, *(float32x2_t *)v27.columns[2].f32)));
  v21 = *(float32x4_t *)self->_target;
  v22 = vmulq_n_f32(vnegq_f32((float32x4_t)v27.columns[0]), vmul_f32(*(float32x2_t *)v27.columns[2].f32, vrsqrts_f32((float32x2_t)v27.columns[1].u32[0], vmul_f32(*(float32x2_t *)v27.columns[2].f32, *(float32x2_t *)v27.columns[2].f32))).f32[0]);
  -[SCNNode simdWorldPosition](-[SCNCameraController pointOfView](self, "pointOfView"), "simdWorldPosition");
  v20 = v12;
  v13 = -[SCNCameraController pointOfView](self, "pointOfView");
  +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
  -[SCNNode simdConvertVector:toNode:](v13, "simdConvertVector:toNode:", 0);
  v14 = vsubq_f32(v21, v20);
  v16 = vmulq_f32(v14, v15);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0] <= 0.0)v17 = -1.0;
  else
    v17 = 1.0;
  v18 = vmulq_f32(v14, v14);
  if ((float)(v17
             * vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0]) < 0.0&& delta < 0.0)
  {
    delta = 0.0;
  }
  -[SCNNode simdLocalTranslateBy:](-[SCNCameraController pointOfView](self, "pointOfView"), "simdLocalTranslateBy:", *(double *)vmulq_n_f32(v22, v17 * delta).i64);
}

- (BOOL)useOrbitInteractionMode
{
  SCNInteractionMode v3;

  if (-[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitArcball
    || -[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitCenteredArcball)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[SCNCameraController interactionMode](self, "interactionMode");
    if (v3 != SCNInteractionModeOrbitTurntable)
      LOBYTE(v3) = -[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitAngleMapping;
  }
  return v3;
}

- (double)unrolledWorldOrientation:(float *)a3
{
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float v9;
  double result;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int8x16_t v14;
  uint32x4_t v15;
  int32x4_t v16;
  float32x2_t v17;
  float32x2_t v18;
  int v19;
  unsigned int v20;
  float32x4_t v21;
  float v22;
  int8x16_t v28;
  int8x16_t v29;
  float32x4_t v30;
  int8x16_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  int32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  int32x4_t v71;
  float32x4_t v72;
  int8x16_t v73;
  float32x4_t v74;
  float v75;
  float v76;
  float32x4_t v77;
  float v78;
  float32x4_t v79;
  float v80;
  float32x4_t v81;
  __float2 v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  int8x16_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  int8x16_t v102;
  int8x16_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float v110;
  int8x16_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  int8x16_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;

  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  v118 = v5;
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldFront");
  v113 = v6;
  objc_msgSend(a1, "simdUp");
  v8 = vmulq_f32(v113, v7);
  v9 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0];
  if (v9 >= 1.0)
    v9 = 1.0;
  if (v9 <= -1.0)
    v9 = -1.0;
  if (fabsf(fabsf(v9) + -1.0) >= 0.01)
  {
    objc_msgSend(a1, "simdTarget");
    v114 = v11;
    objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldPosition");
    v115 = vsubq_f32(v114, v12);
    if (objc_msgSend(a1, "useOrbitInteractionMode"))
    {
      v14 = (int8x16_t)v115;
      v13 = v118;
      v15 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3C23D70Au), vabdq_f32((float32x4_t)0, v115));
      v15.i32[3] = v15.i32[2];
      if ((vminvq_u32(v15) & 0x80000000) != 0)
      {
        v19 = 0;
      }
      else
      {
        v16 = (int32x4_t)vmulq_f32(v115, v115);
        v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
        v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
        v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
        v14 = (int8x16_t)vmulq_n_f32(v115, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
        v19 = 1;
      }
    }
    else
    {
      v19 = 0;
      v14 = (int8x16_t)v115;
      v13 = v118;
    }
    v20 = 0;
    v21 = (float32x4_t)v14;
    v21.i32[3] = v14.i32[0];
    v96 = v21;
    v94 = vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), v14, 0xCuLL));
    v95 = (float32x4_t)vextq_s8(vextq_s8(v14, v14, 0xCuLL), v14, 8uLL);
    v101 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v22 = 0.0;
    __asm { FMOV            V0.4S, #1.0 }
    v102 = _Q0;
    do
    {
      v116 = (int8x16_t)vnegq_f32(v13);
      v119 = v13;
      objc_msgSend(a1, "simdUp", *(_OWORD *)&v94, *(_OWORD *)&v95, *(_OWORD *)&v96);
      v29 = v116;
      v30 = v119;
      v31 = v28;
      v32 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v119, 3);
      v33 = (float32x4_t)vzip1q_s32((int32x4_t)v30, (int32x4_t)v30);
      v33.i32[0] = v119.i32[2];
      v34 = (float32x4_t)vextq_s8((int8x16_t)v32, (int8x16_t)v119, 4uLL);
      v35 = vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30);
      v36 = (float32x4_t)v35;
      v36.i32[0] = v119.i32[1];
      v37 = (float32x4_t)v116;
      v37.i32[3] = v116.i32[0];
      v38 = (float32x4_t)vextq_s8(vextq_s8(v29, v29, 0xCuLL), v29, 8uLL);
      v39 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), v116, 0xCuLL);
      v112 = v32;
      v111 = (int8x16_t)v35;
      if (v19)
      {
        v40 = (float32x4_t)xmmword_1DD007D20;
        v41 = 0uLL;
        v42 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v96, v34), (float32x4_t)xmmword_1DD007D20), (float32x4_t)0, v119), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v95, v33)), v36, v94);
        v43 = (float32x4_t)vzip1q_s32((int32x4_t)v42, (int32x4_t)v42);
        v43.i32[0] = v42.i32[2];
        v44 = vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v37, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v42, 3), (int8x16_t)v42, 4uLL)), (float32x4_t)xmmword_1DD007D20), v42, v32), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v38, v43));
        v45 = (float32x4_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42);
        v45.i32[0] = v42.i32[1];
        v117 = vmlaq_f32(v44, v45, vnegq_f32(v39));
      }
      else
      {
        v105 = v38;
        v108 = v39;
        v103 = v28;
        v99 = v36;
        v100 = v37;
        v97 = v34;
        v98 = v33;
        +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
        v34 = v97;
        v33 = v98;
        v36 = v99;
        v37 = v100;
        v31 = v103;
        v38 = v105;
        v39 = v108;
        v30 = v119;
        v117 = v46;
        v40 = (float32x4_t)xmmword_1DD007D20;
        v41 = 0uLL;
      }
      v47 = (float32x4_t)v31;
      v47.i32[3] = v31.i32[0];
      v48 = vmlsq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v47, v34), v40), v41, v30), v40, vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v31, v31, 0xCuLL), v31, 8uLL), v33)), v36, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31), v31, 0xCuLL));
      v49 = (float32x4_t)vzip1q_s32((int32x4_t)v48, (int32x4_t)v48);
      v49.i32[0] = v48.i32[2];
      v50 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v37, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v48, 3), (int8x16_t)v48, 4uLL)), v40), v48, v30, 3), v40, vmulq_f32(v38, v49));
      v51 = (float32x4_t)vuzp1q_s32((int32x4_t)v48, (int32x4_t)v48);
      v51.i32[0] = v48.i32[1];
      v104 = vmlsq_f32(v50, v51, v39);
      +[SCNNode simdLocalUp](SCNNode, "simdLocalUp");
      v106 = v52;
      +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
      v54 = vmulq_f32(v104, v53);
      v55 = vmlsq_lane_f32(v104, v53, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))), 0);
      v56 = v53;
      v57 = vmulq_f32(v55, v55);
      v57.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).u64[0];
      v58 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 0);
      v59 = vrsqrteq_f32(v58);
      v60 = vmulq_f32(v59, vrsqrtsq_f32(v58, vmulq_f32(v59, v59)));
      v61 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v57.f32[0] != 0.0)), 0x1FuLL));
      v61.i32[3] = 0;
      v62 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v61), (int8x16_t)vmulq_f32(v60, vrsqrtsq_f32(v58, vmulq_f32(v60, v60))), v102);
      v109 = v56;
      v63 = vmulq_f32(v106, v56);
      v64 = vmulq_f32(v55, v62);
      v65 = vmlsq_lane_f32(v106, v56, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))), 0);
      v66 = vmulq_f32(v65, v65);
      v67 = v65;
      v66.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v66, 2), vaddq_f32(v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 1))).u64[0];
      v68 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 0);
      v69 = vrsqrteq_f32(v68);
      v70 = vmulq_f32(v69, vrsqrtsq_f32(v68, vmulq_f32(v69, v69)));
      v71 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v66.f32[0] != 0.0)), 0x1FuLL));
      v71.i32[3] = 0;
      v72 = vmulq_f32(v67, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v71), (int8x16_t)vmulq_f32(v70, vrsqrtsq_f32(v68, vmulq_f32(v70, v70))), v102));
      v73 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL), vnegq_f32(v64)), v72, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v64, (int32x4_t)v64), (int8x16_t)v64, 0xCuLL));
      v107 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v73, (int32x4_t)v73), v73, 0xCuLL);
      v74 = vmulq_f32(v72, v64);
      v75 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v74, 2), vaddq_f32(v74, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v74.f32, 1))).f32[0];
      if (v75 >= 1.0)
        v75 = 1.0;
      if (v75 <= -1.0)
        v75 = -1.0;
      v76 = acosf(v75);
      v77 = vmulq_f32(v109, v107);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).f32[0] <= 0.0)v78 = -v76;
      else
        v78 = v76;
      v79 = vmulq_f32(v117, v117);
      v80 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 2), vaddq_f32(v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 1))).f32[0];
      v81 = v101;
      if (v80 > 0.000000001)
      {
        v110 = v80;
        v82 = __sincosf_stret(v78 * -0.5);
        v83 = vrsqrte_f32((float32x2_t)LODWORD(v110));
        v84 = vmul_f32(v83, vrsqrts_f32((float32x2_t)LODWORD(v110), vmul_f32(v83, v83)));
        v81 = vmulq_n_f32(vmulq_n_f32(v117, vmul_f32(v84, vrsqrts_f32((float32x2_t)LODWORD(v110), vmul_f32(v84, v84))).f32[0]), v82.__sinval);
        v81.i32[3] = LODWORD(v82.__cosval);
      }
      v85 = v119;
      v86 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v85, (int8x16_t)v85, 0xCuLL), (int8x16_t)v119, 8uLL);
      v85.i32[3] = v119.i32[0];
      v87 = (float32x4_t)vzip1q_s32((int32x4_t)v81, (int32x4_t)v81);
      v87.i32[0] = v81.i32[2];
      v88 = vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v85, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v81, 3), (int8x16_t)v81, 4uLL)), (float32x4_t)xmmword_1DD007D20), v81, v112), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v86, v87));
      v89 = (float32x4_t)vuzp1q_s32((int32x4_t)v81, (int32x4_t)v81);
      v89.i32[0] = v81.i32[1];
      v13 = vmlsq_f32(v88, v89, (float32x4_t)vextq_s8(v111, (int8x16_t)v119, 0xCuLL));
      v22 = v22 + v78;
      if (fabsf(v76) <= 0.001)
        break;
    }
    while (v20++ < 0x63);
    if (a3)
      *a3 = v22;
    v90 = (int8x16_t)vmulq_f32(v13, v13);
    *(float32x2_t *)v90.i8 = vadd_f32(*(float32x2_t *)v90.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v90, v90, 8uLL));
    v91 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v90.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v90.i8, 1)), 0);
    v92 = vrsqrteq_f32(v91);
    v93 = vmulq_f32(v92, vrsqrtsq_f32(v91, vmulq_f32(v92, v92)));
    *(_QWORD *)&result = vmulq_f32(v13, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v91), v102, (int8x16_t)vmulq_f32(v93, vrsqrtsq_f32(v91, vmulq_f32(v93, v93))))).u64[0];
  }
  else
  {
    if (a3)
      *a3 = 0.0;
    objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  }
  return result;
}

- (void)clearRoll
{
  double v3;

  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  -[SCNCameraController unrolledWorldOrientation:](self, "unrolledWorldOrientation:", 0);
  -[SCNNode setSimdWorldOrientation:](-[SCNCameraController pointOfView](self, "pointOfView"), "setSimdWorldOrientation:", v3);
}

- (void)stopInertia
{
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
}

- (void)frameNodes:(NSArray *)nodes
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  float32x4_t v10;
  float v11;
  uint64_t v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  float32x4_t v24;
  int32x4_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  if (-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"))
  {
    v5 = -[SCNNode scene](-[SCNCameraController pointOfView](self, "pointOfView"), "scene");
    if (v5)
    {
      v6 = v5;
      SCNNodeGetBoundingSphere(nodes, 16843009);
      v8 = v7;
      *(double *)v10.i64 = v7;
      v10.i64[1] = v9;
      v11 = *((float *)&v9 + 1);
      if (*((float *)&v9 + 1) != 0.0)
      {
        v29 = v10;
        if (-[SCNCamera usesOrthographicProjection](-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"), "usesOrthographicProjection"))
        {
          v30[0] = objc_msgSend(v6, "rootNode");
          SCNNodeGetBoundingSphere((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1), 0x10000);
          v13.i64[0] = v12;
          v13.i64[1] = v14;
          v15 = vsubq_f32(v29, v13);
          v16 = vmulq_f32(v15, v15);
          v17 = (float)(*((float *)&v14 + 1)
                      + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0]));
          -[SCNCamera zNear](-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"), "zNear");
          v19 = v18 + v17;
          -[SCNCamera setOrthographicScale:](-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"), "setOrthographicScale:", (float)(v11 * 1.33));
        }
        else
        {
          -[SCNCamera fieldOfView](-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"), "fieldOfView");
          *(float *)&v22 = v22;
          *(float *)&v22 = (float)(*(float *)&v22 * 0.5) / 180.0 * 3.14159265;
          v23 = (float)(v11 / sinf(*(float *)&v22));
          -[SCNCamera zNear](-[SCNNode camera](-[SCNCameraController pointOfView](self, "pointOfView"), "camera"), "zNear");
          v19 = v20 + v23;
        }
        *(float *)&v20 = v19;
        -[SCNNode simdWorldFront](-[SCNCameraController pointOfView](self, "pointOfView", *(_QWORD *)&v20, v21), "simdWorldFront");
        v25 = (int32x4_t)vmulq_f32(v24, v24);
        v25.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2), vadd_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v25.i8, 1))).u32[0];
        v26 = vrsqrte_f32((float32x2_t)v25.u32[0]);
        v27 = vmul_f32(v26, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v26, v26)));
        -[SCNNode setSimdPosition:](-[SCNCameraController pointOfView](self, "pointOfView"), "setSimdPosition:", *(double *)vmlsq_lane_f32(v29, vmulq_n_f32(v24, vmul_f32(v27, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v27, v27))).f32[0]), v28, 0).i64);
        if (-[SCNCameraController automaticTarget](self, "automaticTarget"))
          -[SCNCameraController setSimdTarget:](self, "setSimdTarget:", v8);
      }
    }
  }
}

- (double)lookAtWith:(float32x4_t)a3 target:
{
  float32x4_t v3;
  int32x4_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  double result;

  objc_msgSend(a1, "simdUp");
  v3 = vsubq_f32(a3, a2);
  v4 = (int32x4_t)vmulq_f32(v3, v3);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  v7 = vmulq_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  v8 = (int8x16_t)vnegq_f32(v7);
  v10 = vmlsq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), v8, 0xCuLL), vnegq_f32(v9)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), v7);
  v11 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10, (int32x4_t)v10), (int8x16_t)v10, 0xCuLL);
  v12 = (int32x4_t)vmulq_f32(v10, v10);
  v12.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), *(float32x2_t *)v12.i8)).u32[0];
  v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  *(_QWORD *)&result = vmulq_n_f32(v11, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]).u64[0];
  return result;
}

- (void)beginInteraction:(CGPoint)location withViewport:(CGSize)viewport
{
  float64x2_t v5;
  __C3DScene *v6;
  __n128 *v7;
  float64x2_t v8;
  float32x2_t v9;
  const void *HitTestResultsAtPoint;
  id v11;
  float64x2_t v12;
  __int128 v13;
  __n128 v14;
  float64x2_t v15;
  double x;
  double y;
  double width;
  double height;

  height = viewport.height;
  y = location.y;
  width = viewport.width;
  x = location.x;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  v5.f64[0] = width;
  v5.f64[1] = height;
  v15 = v5;
  self->_handlingInteraction = 1;
  if (-[SCNCameraController automaticTarget](self, "automaticTarget"))
  {
    v6 = -[SCNNode sceneRef](-[SCNCameraController pointOfView](self, "pointOfView"), "sceneRef");
    if (!v6)
      return;
    v7 = (__n128 *)v6;
    v14 = (__n128)vcvt_hight_f32_f64(0, v15);
    v8.f64[0] = x;
    v8.f64[1] = y;
    v9 = vcvt_f32_f64(v8);
    C3DSceneLock((uint64_t)v6);
    HitTestResultsAtPoint = (const void *)C3DSceneCreateHitTestResultsAtPoint(v7, (float32x4_t *)-[SCNNode nodeRef](-[SCNCameraController pointOfView](self, "pointOfView"), "nodeRef"), 0, *(double *)&v9, v14);
    C3DSceneUnlock((uint64_t)v7);
    if (HitTestResultsAtPoint)
    {
      v11 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:](SCNHitTestResult, "hitTestResultsFromHitTestResultRef:", HitTestResultsAtPoint);
      CFRelease(HitTestResultsAtPoint);
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "worldCoordinates");
        -[SCNCameraController setTarget:](self, "setTarget:");
      }
    }
  }
  else
  {
    v12.f64[0] = x;
    v12.f64[1] = y;
    v9 = vcvt_f32_f64(v12);
  }
  *(float32x2_t *)self->_anon_70 = v9;
  *(float32x2_t *)&self->_anon_70[16] = v9;
  -[SCNCameraController _resetOrientationState](self, "_resetOrientationState", *(_OWORD *)&v14);
  if (-[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitCenteredArcball
    || -[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitArcball)
  {
    *(float32x2_t *)self->_anon_90 = vmla_f32(vneg_f32(*(float32x2_t *)self->_anon_70), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v15));
    -[SCNCameraController _mapToSphere:inViewport:](self, "_mapToSphere:inViewport:", x, y, width, height);
    *(_OWORD *)&self->_anon_90[16] = v13;
  }
}

- (void)continueInteraction:(CGPoint)location withViewport:(CGSize)viewport sensitivity:(CGFloat)sensitivity
{
  double height;
  double width;
  CGFloat y;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  float32x2_t v16;
  float32x2_t v17;
  SCNCameraController *v18;
  double v20;
  __int128 v21;
  double v22;

  height = viewport.height;
  width = viewport.width;
  v21 = *(__int128 *)&location.y;
  y = location.y;
  *(float32x2_t *)&self->_anon_70[8] = vcvt_f32_f64((float64x2_t)location);
  if (viewport.width >= viewport.height)
    v9 = viewport.width;
  else
    v9 = viewport.height;
  v10 = 360.0 / v9 * sensitivity;
  v11 = sensitivity;
  self->_inertia.rotationSensitivity = v10;
  self->_inertia.translationSensitivity = v11;
  if (-[SCNCameraController interactionMode](self, "interactionMode", location, v21) == SCNInteractionModeFly
    || -[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitTurntable
    || -[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModeOrbitAngleMapping)
  {
    v12 = *(double *)&self->_anon_70[8];
    v13 = COERCE_DOUBLE(vmul_n_f32(vsub_f32(*(float32x2_t *)self->_anon_70, *(float32x2_t *)&v12), self->_inertia.rotationSensitivity));
    LODWORD(v12) = HIDWORD(v13);
    -[SCNCameraController rotateByX:Y:](self, "rotateByX:Y:", v13, v12);
    *(_QWORD *)self->_anon_70 = *(_QWORD *)&self->_anon_70[8];
  }
  else
  {
    if (-[SCNCameraController interactionMode](self, "interactionMode") != SCNInteractionModeOrbitCenteredArcball
      && -[SCNCameraController interactionMode](self, "interactionMode") != SCNInteractionModeOrbitArcball)
    {
      if (-[SCNCameraController interactionMode](self, "interactionMode") == SCNInteractionModePan)
      {
        v16 = vsub_f32(*(float32x2_t *)&self->_anon_70[8], *(float32x2_t *)&self->_anon_70[16]);
        v17 = vmul_n_f32(v16, self->_inertia.translationSensitivity);
        v16.f32[0] = -v17.f32[0];
        v17.i32[0] = v17.i32[1];
        LODWORD(v15) = 0;
        v18 = self;
      }
      else
      {
        if (-[SCNCameraController interactionMode](self, "interactionMode") != SCNInteractionModeTruck)
          goto LABEL_8;
        v17 = *(float32x2_t *)&self->_anon_70[16];
        v16 = vmul_n_f32(vsub_f32(*(float32x2_t *)&self->_anon_70[8], v17), self->_inertia.translationSensitivity);
        *(float *)&v15 = -v16.f32[1];
        v17.i32[0] = 0;
        v18 = self;
      }
      -[SCNCameraController _translateInCameraSpaceByX:Y:Z:](v18, "_translateInCameraSpaceByX:Y:Z:", *(double *)&v16, *(double *)&v17, v15);
      goto LABEL_8;
    }
    -[SCNCameraController _mapToSphere:inViewport:](self, "_mapToSphere:inViewport:", v20, v22, width, height);
    *(_OWORD *)&self->_anon_90[32] = v14;
    -[SCNCameraController _updateArcballOrientation](self, "_updateArcballOrientation");
  }
LABEL_8:
  *(_QWORD *)&self->_anon_70[16] = *(_QWORD *)&self->_anon_70[8];
}

- (void)endInteraction:(CGPoint)location withViewport:(CGSize)viewport velocity:(CGPoint)velocity
{
  self->_handlingInteraction = 0;
  -[SCNCameraController _endDraggingWithVelocity:](self, "_endDraggingWithVelocity:", velocity.x, velocity.y, viewport.width, viewport.height);
}

- (void)rollBy:(float)delta aroundScreenPoint:(CGPoint)point viewport:(CGSize)viewport
{
  double height;
  double width;
  double y;
  double x;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  __float2 v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;

  height = viewport.height;
  width = viewport.width;
  y = point.y;
  x = point.x;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  v12 = v11;
  v13 = vmulq_f32(v11, v11);
  v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)));
  if (v14.f32[0] <= 0.000000001)
  {
    v19 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  }
  else
  {
    v26 = v14;
    v15 = delta / 180.0 * 3.14159265;
    v27 = v12;
    v16 = __sincosf_stret(v15 * 0.5);
    v17 = vrsqrte_f32((float32x2_t)v26.u32[0]);
    v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v17, v17)));
    v19 = vmulq_n_f32(vmulq_n_f32(v27, vmul_f32(v18, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v18, v18))).f32[0]), v16.__sinval);
    v19.i32[3] = LODWORD(v16.__cosval);
  }
  v28 = v19;
  -[SCNNode simdOrientation](-[SCNCameraController pointOfView](self, "pointOfView", *(_OWORD *)&v26), "simdOrientation");
  v21 = v20;
  v21.i32[3] = v20.i32[0];
  v22 = (int32x4_t)v28;
  v23 = (float32x4_t)vzip1q_s32(v22, v22);
  v23.i32[0] = v28.i32[2];
  v24 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v28, 3), (int8x16_t)v28, 4uLL), v21), (float32x4_t)xmmword_1DD007D20), v28, v20, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v23, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v20, (int8x16_t)v20, 0xCuLL), (int8x16_t)v20, 8uLL)));
  v25 = (float32x4_t)vuzp1q_s32(v22, v22);
  v25.i32[0] = v28.i32[1];
  -[SCNNode setSimdOrientation:](-[SCNCameraController pointOfView](self, "pointOfView"), "setSimdOrientation:", *(double *)vmlsq_f32(v24, v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL)).i64);
}

- (void)dollyBy:(float)delta onScreenPoint:(CGPoint)point viewport:(CGSize)viewport
{
  double height;
  double width;
  double y;
  double x;
  float32x4_t v10;

  height = viewport.height;
  width = viewport.width;
  y = point.y;
  x = point.x;
  -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  -[SCNNode simdLocalTranslateBy:](-[SCNCameraController pointOfView](self, "pointOfView"), "simdLocalTranslateBy:", *(double *)vmulq_n_f32(v10, delta).i64);
}

- (void)_resetOrientationState
{
  float32x4_t v3;
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  __int128 v7;
  float32x4_t v8;
  int32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x4_t v14;
  float v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  BOOL v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32_t v23;
  float32x4_t v24;
  float32x4_t v25;
  uint32x2_t v26;
  float32x4_t v27;
  uint32x2_t v28;
  SCNInteractionMode v29;
  SCNNode *v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int8x16_t v46;
  int32x4_t v47;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  int32x4_t v61;
  float32x4_t v62;
  int8x16_t v63;
  float32x4_t v64;
  float v65;
  float v66;
  float32x4_t v67;
  float32x4_t v68;
  float v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;

  -[SCNNode simdWorldTransform](-[SCNCameraController pointOfView](self, "pointOfView"), "simdWorldTransform");
  v4 = (int32x4_t)vmulq_f32(v3, v3);
  *(float32x4_t *)&self->_anon_10[16] = v3;
  *(float32x4_t *)&self->_anon_10[32] = v5;
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  *(float32x4_t *)&self->_anon_10[48] = v6;
  *(_OWORD *)&self->_anon_10[64] = v7;
  *(float32x2_t *)&v7 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  *(float32x2_t *)&v7 = vmul_f32(*(float32x2_t *)&v7, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(*(float32x2_t *)&v7, *(float32x2_t *)&v7)));
  v8 = vmulq_n_f32(v3, vmul_f32(*(float32x2_t *)&v7, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(*(float32x2_t *)&v7, *(float32x2_t *)&v7))).f32[0]);
  v9 = (int32x4_t)vmulq_f32(v5, v5);
  v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
  *(float32x2_t *)v4.i8 = vrsqrte_f32((float32x2_t)v9.u32[0]);
  *(float32x2_t *)v4.i8 = vmul_f32(*(float32x2_t *)v4.i8, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(*(float32x2_t *)v4.i8, *(float32x2_t *)v4.i8)));
  v10 = vmulq_n_f32(v5, vmul_f32(*(float32x2_t *)v4.i8, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(*(float32x2_t *)v4.i8, *(float32x2_t *)v4.i8))).f32[0]);
  v11 = (int32x4_t)vmulq_f32(v6, v6);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v14 = vmulq_n_f32(v6, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
  v15 = (float)(v8.f32[0] + v10.f32[1]) + v14.f32[2];
  if (v15 <= 0.0)
  {
    v19 = v8.f32[0] <= v10.f32[1] || v8.f32[0] <= v14.f32[2];
    if (v19)
    {
      if (v10.f32[1] <= v14.f32[2])
      {
        v25.i64[0] = v14.i64[0];
        v25.f32[2] = (float)(v14.f32[2] + 1.0) - v8.f32[0];
        v25.i32[3] = v8.i32[1];
        v18 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v10, (int32x4_t)v8), (int8x16_t)v10, 8uLL));
        v17.i64[0] = vaddq_f32(v14, v18).u64[0];
        v17.i64[1] = vsubq_f32(v25, v18).i64[1];
        v18.i32[0] = v17.i32[2];
      }
      else
      {
        v20 = v10;
        v20.f32[1] = (float)(v10.f32[1] + 1.0) - v8.f32[0];
        v20.i32[3] = v14.i32[0];
        v21 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v8, (int32x4_t)v14), vtrn1q_s32((int32x4_t)v14, (int32x4_t)v8));
        v22 = (int32x4_t)vaddq_f32(v10, v21);
        v18 = vsubq_f32(v20, v21);
        v17 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v22), (int32x4_t)v18);
        v18.i32[0] = v18.i32[1];
      }
    }
    else
    {
      v23 = (float)(v8.f32[0] + 1.0) - v10.f32[1];
      v24 = (float32x4_t)vextq_s8((int8x16_t)v10, (int8x16_t)vtrn1q_s32((int32x4_t)v10, (int32x4_t)v14), 0xCuLL);
      v17 = vaddq_f32(v24, v8);
      v24.f32[0] = v23;
      v8.i32[0] = v14.i32[2];
      v8.i32[3] = v14.i32[1];
      v18 = vsubq_f32(v24, v8);
      v17.i32[0] = v18.i32[0];
      v17.i32[3] = v18.i32[3];
    }
  }
  else
  {
    v16 = (float32x4_t)vzip2q_s32((int32x4_t)v10, vuzp1q_s32((int32x4_t)v10, (int32x4_t)v14));
    v16.i32[2] = v8.i32[1];
    v18 = (float32x4_t)vtrn2q_s32((int32x4_t)v14, vzip2q_s32((int32x4_t)v14, (int32x4_t)v8));
    v18.i32[2] = v10.i32[0];
    v17 = vsubq_f32(v16, v18);
    v18.i32[3] = 1.0;
    v16.f32[3] = v15;
    v17.i32[3] = vaddq_f32(v16, v18).i32[3];
    v18.i32[0] = v17.i32[3];
  }
  *(float32x4_t *)&self->_anon_10[80] = vmulq_n_f32(v17, 0.5 / sqrtf(v18.f32[0]));
  *(_QWORD *)self->_anon_10 = 0;
  v26 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)self->_minimumAngles));
  if ((vpmax_u32(v26, v26).u32[0] & 0x80000000) != 0
    || (v27.i64[0] = 0,
        v28 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)self->_maximumAngles)),
        (vpmax_u32(v28, v28).u32[0] & 0x80000000) != 0))
  {
    v29 = -[SCNCameraController interactionMode](self, "interactionMode");
    v30 = -[SCNCameraController pointOfView](self, "pointOfView");
    if (v29)
    {
      -[SCNNode simdWorldPosition](v30, "simdWorldPosition");
      v70 = v31;
      -[SCNCameraController simdTarget](self, "simdTarget");
      v33 = vsubq_f32(v70, v32);
    }
    else
    {
      -[SCNNode simdWorldFront](v30, "simdWorldFront");
      v33 = vnegq_f32(v34);
    }
    v71 = v33;
    -[SCNCameraController simdUp](self, "simdUp");
    v36 = vmulq_f32(v71, v35);
    v67 = vmlsq_lane_f32(v71, v35, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))), 0);
    v69 = atan2f(v67.f32[0], v67.f32[2]);
    -[SCNNode simdWorldRight](-[SCNCameraController pointOfView](self, "pointOfView"), "simdWorldRight");
    v38 = vmulq_f32(v37, v67);
    v39 = vmlsq_lane_f32(v67, v37, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))), 0);
    v40 = v37;
    v41 = vmulq_f32(v39, v39);
    v42 = v39;
    v41.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).u64[0];
    v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
    v44 = vrsqrteq_f32(v43);
    v45 = vmulq_f32(v44, vrsqrtsq_f32(v43, vmulq_f32(v44, v44)));
    v46 = (int8x16_t)vmulq_f32(v45, vrsqrtsq_f32(v43, vmulq_f32(v45, v45)));
    v47 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v41.f32[0] != 0.0)), 0x1FuLL));
    v47.i32[3] = 0;
    __asm { FMOV            V2.4S, #1.0 }
    v53 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v47), v46, _Q2);
    v68 = v40;
    v54 = vmulq_f32(v71, v40);
    v55 = vmlsq_lane_f32(v71, v40, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))), 0);
    v56 = vmulq_f32(v55, v55);
    v56.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).u64[0];
    v57 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 0);
    v58 = vmulq_f32(v42, v53);
    v59 = vrsqrteq_f32(v57);
    v60 = vmulq_f32(v59, vrsqrtsq_f32(v57, vmulq_f32(v59, v59)));
    v61 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v56.f32[0] != 0.0)), 0x1FuLL));
    v61.i32[3] = 0;
    v62 = vmulq_f32(v55, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v61), (int8x16_t)vmulq_f32(v60, vrsqrtsq_f32(v57, vmulq_f32(v60, v60))), _Q2));
    v63 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v62, (int32x4_t)v62), (int8x16_t)v62, 0xCuLL), vnegq_f32(v58)), v62, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v58, (int32x4_t)v58), (int8x16_t)v58, 0xCuLL));
    v72 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v63, (int32x4_t)v63), v63, 0xCuLL);
    v64 = vmulq_f32(v62, v58);
    v65 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v64, 2), vaddq_f32(v64, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 1))).f32[0];
    if (v65 >= 1.0)
      v65 = 1.0;
    if (v65 <= -1.0)
      v65 = -1.0;
    v66 = acosf(v65);
    v27 = vmulq_f32(v68, v72);
    v19 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0] <= 0.0;
    v27.f32[0] = v69;
    if (v19)
      v66 = -v66;
    v27.f32[1] = v66;
  }
  *(_QWORD *)&self->_anon_10[8] = v27.i64[0];
}

- (float32x4_t)_directionForScreenPoint:(double)a3 viewport:(float64_t)a4
{
  float32x4_t *result;
  float32x4_t *v6;
  uint64_t v7;
  uint64_t v8;
  float64x2_t v9;
  uint64_t v15;
  uint64_t v16;
  float32x4_t v19;
  _OWORD v20[14];
  simd_float4x4 v21;

  result = (float32x4_t *)objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "nodeRef");
  if (result)
  {
    v6 = result;
    result = (float32x4_t *)C3DGetScene(result);
    if (result)
    {
      v7 = (uint64_t)result;
      v8 = C3DGetScene(v6);
      C3DSceneLock(v8);
      memset(v20, 0, sizeof(v20));
      if ((C3DNodeGetProjectionInfos((uint64_t)v6, (uint64_t)v20) & 1) != 0)
      {
        if ((v20[0] & 2) != 0)
          C3DAdjustZRangeOfProjectionInfos((uint64_t)v20, v6, 0, v7);
        v9.f64[0] = a4;
        v9.f64[1] = a5;
        v19 = vcvt_hight_f32_f64(0, v9);
        v21 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v20, (uint64_t)&v19, 0);
        __invert_f4(v21);
        __asm { FMOV            V1.4S, #-1.0 }
        v15 = C3DGetScene(v6);
        return (float32x4_t *)C3DSceneUnlock(v15);
      }
      else
      {
        v16 = C3DGetScene(v6);
        return (float32x4_t *)C3DSceneUnlock(v16);
      }
    }
  }
  return result;
}

- (void)_updateInertiaAtTime:(double)a3
{
  float v4;
  int v5;
  float friction;
  float v7;
  float32x2_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;
  double v14;
  float32x4_t v15;
  float32x2_t v16;
  double v17;
  double v18;
  SCNCameraController *v19;

  if (self->_inertia.inertiaRunning)
  {
    v4 = (a3 - self->_inertia.lastSimulationTime) * 60.0;
    v5 = (int)fmaxf(v4, 1.0);
    self->_inertia.lastSimulationTime = a3;
    if (v5 >= 1)
    {
      friction = self->_inertia.friction;
      do
      {
        if (friction != 0.0)
        {
          if (v4 <= 1.0)
            v7 = v4;
          else
            v7 = 1.0;
          *(float32x2_t *)self->_anon_e0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)self->_anon_e0), 1.0 - (float)(fmaxf(v7, 0.0) * friction)));
        }
        v4 = v4 + -1.0;
        --v5;
      }
      while (v5);
    }
    if (!-[SCNCameraController drivenByDefaultNavigationCameraController](self, "drivenByDefaultNavigationCameraController"))
    {
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
    }
    v8 = *(float32x2_t *)self->_anon_e0;
    v9 = (float32x4_t)vmulq_f64(vcvtq_f64_f32(v8), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL));
    *(float32x2_t *)v9.f32 = vcvt_f32_f64((float64x2_t)v9);
    v9.i32[2] = 0;
    v10 = vaddq_f32(*(float32x4_t *)&self->_anon_90[32], vaddq_f32(*(float32x4_t *)&self->_anon_90[16], v9));
    v11 = (int32x4_t)vmulq_f32(v10, v10);
    v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
    v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    v14 = COERCE_DOUBLE(vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))));
    v15 = vmulq_n_f32(v10, *(float *)&v14);
    *(float32x4_t *)&self->_anon_90[32] = v15;
    switch(self->_interactionMode)
    {
      case 0:
      case 1:
      case 2:
        v16 = vmul_n_f32(v8, self->_inertia.rotationSensitivity);
        v17 = (float)-v16.f32[0] / 180.0 * 3.14159265;
        *(float *)&v17 = v17;
        v18 = v16.f32[1] / 180.0 * 3.14159265;
        *(float *)&v18 = v18;
        -[SCNCameraController _rotateByX:Y:](self, "_rotateByX:Y:", v17, v18);
        break;
      case 3:
      case 4:
        -[SCNCameraController _updateArcballOrientation](self, "_updateArcballOrientation");
        break;
      case 5:
        *(float32x2_t *)v15.f32 = vmul_n_f32(v8, self->_inertia.translationSensitivity);
        v8.f32[0] = -v15.f32[0];
        v15.f32[0] = -v15.f32[1];
        LODWORD(v14) = 0;
        v19 = self;
        goto LABEL_17;
      case 6:
        v8 = vmul_n_f32(v8, self->_inertia.translationSensitivity);
        LODWORD(v14) = v8.i32[1];
        v15.i32[0] = 0;
        v19 = self;
LABEL_17:
        -[SCNCameraController _translateInCameraSpaceByX:Y:Z:](v19, "_translateInCameraSpaceByX:Y:Z:", *(double *)&v8, *(double *)v15.i64, v14);
        break;
      default:
        break;
    }
    if (!-[SCNCameraController drivenByDefaultNavigationCameraController](self, "drivenByDefaultNavigationCameraController"))+[SCNTransaction commit](SCNTransaction, "commit");
    if (vaddv_f32(vmul_f32(*(float32x2_t *)self->_anon_e0, *(float32x2_t *)self->_anon_e0)) < 0.1)
      -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0);
  }
}

- (__n128)_targetRelativeToPointOfViewParent
{
  __n128 result;

  if (objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "parentNode"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "parentNode"), "simdConvertPosition:fromNode:", 0, a1[32]);
  else
    return *(__n128 *)(a1 + 32);
  return result;
}

- (void)_translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  -[SCNNode simdLocalTranslateBy:](-[SCNCameraController pointOfView](self, "pointOfView"), "simdLocalTranslateBy:", COERCE_DOUBLE(__PAIR64__(LODWORD(a4), LODWORD(a3))));
}

- (void)_rotateByX:(float)a3 Y:(float)a4
{
  uint32x2_t v5;
  int8x8_t v6;
  unsigned int v7;
  int8x8_t v8;
  unsigned int v9;
  int8x8_t v10;
  double v11;
  __int32 v12;
  __int32 v13;

  v5 = (uint32x2_t)vceqz_f32(*(float32x2_t *)&a3);
  if ((vpmin_u32(v5, v5).u32[0] & 0x80000000) == 0)
  {
    v6 = (int8x8_t)vadd_f32(*(float32x2_t *)&a3, *(float32x2_t *)self->_anon_10);
    *(float *)&v7 = *(float *)v6.i32 + -6.28318531;
    v8 = vbsl_s8((int8x8_t)vcgtd_f64(*(float *)v6.i32, 6.28318531), (int8x8_t)__PAIR64__(v6.u32[1], v7), v6);
    *(float *)&v9 = *(float *)v8.i32 + 6.28318531;
    v10 = vbsl_s8((int8x8_t)vcgtd_f64(-6.28318531, *(float *)v8.i32), (int8x8_t)__PAIR64__(v8.u32[1], v9), v8);
    v11 = *(float *)&v10.i32[1];
    if (*(float *)&v10.i32[1] > 6.28318531)
    {
      *(float *)&v12 = v11 + -6.28318531;
      v10.i32[1] = v12;
      v11 = *(float *)&v12;
    }
    if (v11 < -6.28318531)
    {
      *(float *)&v13 = v11 + 6.28318531;
      v10.i32[1] = v13;
    }
    *(int8x8_t *)self->_anon_10 = v10;
    -[SCNCameraController _updateRotation](self, "_updateRotation");
  }
}

- (double)_orientationForMode
{
  float32x4_t v2;
  void *v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  __float2 v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  __float2 v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float v22;
  float32x4_t v23;
  __float2 v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  int8x16_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  double result;
  float32x4_t v41;
  float v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;

  v46 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  if (objc_msgSend((id)a1, "interactionMode"))
  {
    if (objc_msgSend((id)a1, "interactionMode") == 1)
    {
      objc_msgSend((id)a1, "simdUp");
    }
    else
    {
      if (objc_msgSend((id)a1, "interactionMode") != 2)
      {
        v30 = v46;
        goto LABEL_15;
      }
      objc_msgSend((id)objc_msgSend((id)a1, "pointOfView"), "simdWorldUp");
    }
    v13 = v2;
    v14 = vmulq_f32(v2, v2);
    v15 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1)));
    v16 = v46;
    if (v15.f32[0] > 0.000000001)
    {
      v41 = v15;
      v45 = v13;
      v17 = __sincosf_stret(0.5 * COERCE_FLOAT(*(_QWORD *)(a1 + 16)));
      v18 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v18, v18)));
      v16 = vmulq_n_f32(vmulq_n_f32(v45, vmul_f32(v19, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v19, v19))).f32[0]), v17.__sinval);
      v16.i32[3] = LODWORD(v17.__cosval);
    }
    v44 = v16;
    objc_msgSend((id)objc_msgSend((id)a1, "pointOfView", *(_OWORD *)&v41), "simdWorldRight");
  }
  else
  {
    v3 = (void *)objc_msgSend((id)a1, "pointOfView");
    objc_msgSend((id)a1, "simdUp");
    objc_msgSend(v3, "simdConvertVector:fromNode:", 0);
    v5 = v4;
    v6 = vmulq_f32(v4, v4);
    v7 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1)));
    v8 = v46;
    if (v7.f32[0] > 0.000000001)
    {
      v41 = v7;
      v43 = v5;
      v9 = __sincosf_stret(0.5 * COERCE_FLOAT(*(_QWORD *)(a1 + 16)));
      v10 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v10, v10)));
      v8 = vmulq_n_f32(vmulq_n_f32(v43, vmul_f32(v11, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v11, v11))).f32[0]), v9.__sinval);
      v8.i32[3] = LODWORD(v9.__cosval);
    }
    v44 = v8;
    +[SCNNode simdLocalRight](SCNNode, "simdLocalRight", *(_OWORD *)&v41);
  }
  v20 = v12;
  v21 = vmulq_f32(v12, v12);
  v22 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).f32[0];
  v23 = v46;
  if (v22 > 0.000000001)
  {
    v42 = v22;
    v47 = v20;
    v24 = __sincosf_stret(*(float *)(a1 + 20) * 0.5);
    v25 = vrsqrte_f32((float32x2_t)LODWORD(v42));
    v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v42), vmul_f32(v25, v25)));
    v23 = vmulq_n_f32(vmulq_n_f32(v47, vmul_f32(v26, vrsqrts_f32((float32x2_t)LODWORD(v42), vmul_f32(v26, v26))).f32[0]), v24.__sinval);
    v23.i32[3] = LODWORD(v24.__cosval);
  }
  v27 = v44;
  v27.i32[3] = v44.i32[0];
  v28 = (float32x4_t)vzip1q_s32((int32x4_t)v23, (int32x4_t)v23);
  v28.i32[0] = v23.i32[2];
  v29 = (float32x4_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23);
  v29.i32[0] = v23.i32[1];
  v30 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v27, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v23, 3), (int8x16_t)v23, 4uLL)), (float32x4_t)xmmword_1DD007D20), v23, v44, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v44, (int8x16_t)v44, 0xCuLL), (int8x16_t)v44, 8uLL), v28)), v29, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v44, (int32x4_t)v44), (int8x16_t)v44, 0xCuLL));
LABEL_15:
  v31 = (int8x16_t)vmulq_f32(v30, v30);
  *(float32x2_t *)v31.i8 = vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
  v32 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.i8, 1)), 0);
  v33 = vrsqrteq_f32(v32);
  v34 = vmulq_f32(v33, vrsqrtsq_f32(v32, vmulq_f32(v33, v33)));
  __asm { FMOV            V2.4S, #1.0 }
  *(_QWORD *)&result = vmulq_f32(v30, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v32), _Q2, (int8x16_t)vmulq_f32(v34, vrsqrtsq_f32(v32, vmulq_f32(v34, v34))))).u64[0];
  return result;
}

- (void)_capOrientationAnglesToMaximum
{
  unint64_t interactionMode;
  float32x2_t v3;
  float32x2_t v4;
  int8x8_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float v8;
  float32x2_t v9;
  float v10;
  float v11;
  float v12;
  float v13;

  interactionMode = self->_interactionMode;
  if (interactionMode > 1)
    return;
  v3 = *(float32x2_t *)self->_anon_10;
  v4 = vadd_f32(*(float32x2_t *)&self->_anon_10[8], v3);
  v5.i32[0] = v4.i32[0];
  v5.i32[1] = vneg_f32(v4).i32[1];
  v6 = (float32x2_t)vbsl_s8((int8x8_t)vceqd_s64(interactionMode, 0), (int8x8_t)v4, v5);
  v7 = *(float32x2_t *)self->_maximumAngles;
  if (v7.f32[0] != 0.0 || COERCE_FLOAT(*(_QWORD *)self->_minimumAngles) != 0.0)
  {
    if ((vcgt_f32(v6, v7).u8[0] & 1) != 0 && v3.f32[0] > 0.0)
    {
      v8 = fmaxf(vsub_f32(v3, vsub_f32(v6, v7)).f32[0], 0.0);
LABEL_11:
      v3.f32[0] = v8;
      *(float32x2_t *)self->_anon_10 = v3;
      goto LABEL_12;
    }
    v9 = *(float32x2_t *)self->_minimumAngles;
    if ((vcgt_f32(v9, v6).u8[0] & 1) != 0 && v3.f32[0] < 0.0)
    {
      v8 = vsub_f32(v3, vsub_f32(v6, v9)).f32[0];
      if (v8 > 0.0)
        v8 = 0.0;
      goto LABEL_11;
    }
  }
LABEL_12:
  if (v7.f32[1] != 0.0 || *(float *)&self->_minimumAngles[4] != 0.0)
  {
    if (interactionMode)
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] < 0.0)
      {
        v10 = (float)(v6.f32[1] - v7.f32[1]) + v3.f32[1];
        goto LABEL_28;
      }
      v11 = *(float *)&self->_minimumAngles[4];
      if (v6.f32[1] < v11 && v3.f32[1] > 0.0)
      {
        v12 = (float)(v6.f32[1] - v11) + v3.f32[1];
LABEL_24:
        v10 = fmaxf(v12, 0.0);
LABEL_30:
        v3.f32[1] = v10;
        *(float32x2_t *)self->_anon_10 = v3;
      }
    }
    else
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] > 0.0)
      {
        v12 = v3.f32[1] - (float)(v6.f32[1] - v7.f32[1]);
        goto LABEL_24;
      }
      v13 = *(float *)&self->_minimumAngles[4];
      if (v6.f32[1] < v13 && v3.f32[1] < 0.0)
      {
        v10 = v3.f32[1] - (float)(v6.f32[1] - v13);
LABEL_28:
        if (v10 > 0.0)
          v10 = 0.0;
        goto LABEL_30;
      }
    }
  }
}

- (void)_updateRotation
{
  SCNNode *v3;
  double v4;
  double v5;
  SCNNode *v6;
  double v7;

  if (self->_interactionMode <= 2uLL)
  {
    -[SCNCameraController _capOrientationAnglesToMaximum](self, "_capOrientationAnglesToMaximum");
    if (-[SCNCameraController useOrbitInteractionMode](self, "useOrbitInteractionMode"))
    {
      -[SCNNode setSimdWorldTransform:](-[SCNCameraController pointOfView](self, "pointOfView"), "setSimdWorldTransform:", *(double *)&self->_anon_10[16], *(double *)&self->_anon_10[32], *(double *)&self->_anon_10[48], *(double *)&self->_anon_10[64]);
      v3 = -[SCNCameraController pointOfView](self, "pointOfView");
      -[SCNCameraController _orientationForMode](self, "_orientationForMode");
      v7 = v4;
      -[SCNCameraController simdTarget](self, "simdTarget");
      -[SCNNode simdRotateBy:aroundTarget:](v3, "simdRotateBy:aroundTarget:", v7, v5);
    }
    else
    {
      -[SCNNode setSimdWorldOrientation:](-[SCNCameraController pointOfView](self, "pointOfView"), "setSimdWorldOrientation:", *(double *)&self->_anon_10[80]);
      v6 = -[SCNCameraController pointOfView](self, "pointOfView");
      -[SCNCameraController _orientationForMode](self, "_orientationForMode");
      -[SCNNode simdLocalRotateBy:](v6, "simdLocalRotateBy:");
    }
  }
}

- (double)_convertRotationFromWorldToPointOfView:(void *)a1
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  int8x16_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  double result;
  float32x4_t v16;

  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  v16 = v3;
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  v5 = vnegq_f32(v4);
  v6 = (float32x4_t)vzip1q_s32((int32x4_t)v5, (int32x4_t)v5);
  v6.i32[0] = v5.i32[2];
  v7 = (float32x4_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5);
  v7.i32[0] = v5.i32[1];
  v5.i32[3] = v4.i32[3];
  v8 = a2;
  v8.i32[3] = a2.i32[0];
  v9 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v8, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v5, 3), (int8x16_t)v5, 4uLL)), (float32x4_t)xmmword_1DD007D20), v5, a2, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)a2, (int8x16_t)a2, 0xCuLL), (int8x16_t)a2, 8uLL), v6)), v7, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a2, (int32x4_t)a2), (int8x16_t)a2, 0xCuLL));
  v10 = (int8x16_t)v16;
  v11 = v16;
  v11.i32[3] = v16.i32[0];
  v12 = (float32x4_t)vzip1q_s32((int32x4_t)v9, (int32x4_t)v9);
  v12.i32[0] = v9.i32[2];
  v13 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v11, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v9, 3), (int8x16_t)v9, 4uLL)), (float32x4_t)xmmword_1DD007D20), v9, v16, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v10, v10, 0xCuLL), (int8x16_t)v16, 8uLL), v12));
  v14 = (float32x4_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9);
  v14.i32[0] = v9.i32[1];
  *(_QWORD *)&result = vmlsq_f32(v13, v14, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10, (int32x4_t)v10), (int8x16_t)v16, 0xCuLL)).u64[0];
  return result;
}

- (void)_updateArcballOrientation
{
  float32x4_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  float32x4_t v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  float32x2_t v12;
  float32x2_t v13;
  __int128 v14;
  float32x4_t v15;
  SCNNode *v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  double v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;

  if (self->_interactionMode >= 2uLL)
  {
    v4 = *(float32x4_t *)&self->_anon_90[16];
    v3 = *(float32x4_t *)&self->_anon_90[32];
    v5 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32(v4, v3));
    v5.i32[3] = v5.i32[2];
    if ((vminvq_u32(v5) & 0x80000000) == 0)
    {
      v6 = vmulq_f32(v4, v3);
      LODWORD(v7) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).u32[0];
      if (fabsf(v7) < 1.0)
      {
        v8 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL), vnegq_f32(v4)), v3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL));
        v9 = vmulq_f32(v8, v8);
        v10 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), v9));
        if (v10.f32[0] <= 0.000000001)
        {
          v14 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
        }
        else
        {
          v27 = v10;
          v28 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL);
          v11 = acosf(v7);
          LODWORD(v14) = *(_QWORD *)&__sincosf_stret((float)(v11 * -2.0) * 0.5);
          v12 = vrsqrte_f32((float32x2_t)v27.u32[0]);
          v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v12, v12)));
          *(_QWORD *)&v14 = vmulq_n_f32(vmulq_n_f32(v28, vmul_f32(v13, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v13, v13))).f32[0]), *(float *)&v14).u64[0];
        }
        -[SCNCameraController _convertRotationFromWorldToPointOfView:](self, "_convertRotationFromWorldToPointOfView:", *(double *)&v14, *(_OWORD *)&v27);
        v29 = v15;
        v16 = -[SCNCameraController pointOfView](self, "pointOfView");
        v17 = (int8x16_t)vmulq_f32(v29, v29);
        *(float32x2_t *)v17.i8 = vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
        v18 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1)), 0);
        v19 = vrsqrteq_f32(v18);
        v20 = vmulq_f32(v19, vrsqrtsq_f32(v18, vmulq_f32(v19, v19)));
        __asm { FMOV            V2.4S, #1.0 }
        v29.i64[0] = vmulq_f32(v29, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v18), _Q2, (int8x16_t)vmulq_f32(v20, vrsqrtsq_f32(v18, vmulq_f32(v20, v20))))).u64[0];
        -[SCNCameraController simdTarget](self, "simdTarget");
        -[SCNNode simdRotateBy:aroundTarget:](v16, "simdRotateBy:aroundTarget:", *(double *)v29.i64, v26);
        v3 = *(float32x4_t *)&self->_anon_90[32];
      }
      *(float32x4_t *)&self->_anon_90[16] = v3;
    }
  }
}

- (BOOL)_isLocationValid:(CGPoint)a3 inViewport:(CGSize)a4
{
  BOOL v4;

  v4 = a3.x <= a4.width;
  if (a3.y < 0.0)
    v4 = 0;
  if (a3.y > a4.height)
    v4 = 0;
  return a3.x >= 0.0 && v4;
}

- (double)_mapToSphere:(float64_t)a3 inViewport:(double)a4
{
  double v5;
  float32x4_t v6;
  float v7;
  BOOL v8;
  float v9;
  float v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;

  a2.f64[1] = a3;
  if (*(_QWORD *)&a1[39] == 3)
    a2 = vaddq_f64(a2, vcvtq_f64_f32(a1[18]));
  if (a4 >= a5)
    v5 = a4;
  else
    v5 = a5;
  *(float *)&v5 = v5;
  v6 = (float32x4_t)vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(*(float *)&v5 * 0.5)), 0));
  *(float32x2_t *)v6.f32 = vdiv_f32(vcvt_f32_f64((float64x2_t)v6), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v5, 0));
  v7 = vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v6, *(float32x2_t *)&v6).i32[1]), v6.f32[0], v6.f32[0]);
  v8 = v7 < 0.125;
  v9 = 0.125 / sqrtf(v7);
  v10 = sqrtf(0.25 - v7);
  if (!v8)
    v10 = v9;
  v6.f32[2] = v10;
  v11 = (int32x4_t)vmulq_f32(v6, v6);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v6.i64[0] = vmulq_n_f32(v6, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]).u64[0];
  return *(double *)v6.i64;
}

- (void)_endDraggingWithVelocity:(CGPoint)a3
{
  CGFloat y;
  float32x2_t v4;
  uint32x2_t v5;
  float32x2_t v7;
  float32x2_t v8;
  int8x8_t v9;
  float v10;
  float v11;
  int8x8_t v12;
  float v13;
  float v14;

  if (self->_inertia.inertiaEnabled)
  {
    y = a3.y;
    v4 = vcvt_f32_f64((float64x2_t)a3);
    v5 = (uint32x2_t)vcge_f32(vabs_f32(v4), (float32x2_t)vdup_n_s32(0x3DCCCCCDu));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      v7 = (float32x2_t)vdup_n_s32(0x42700000u);
      v8 = vdiv_f32(v4, v7);
      *(float32x2_t *)self->_anon_e0 = v8;
      if (self->_inertia.friction == 0.0)
      {
        v7.i32[0] = 0;
        v9 = (int8x8_t)vdup_lane_s32(vcgt_f32(v8, v7), 0);
        v10 = -20.0;
        if (v8.f32[0] >= -20.0)
          v11 = v8.f32[0];
        else
          v11 = -20.0;
        v8.i32[0] = fminf(v8.f32[0], 20.0);
        v12 = vbsl_s8(v9, (int8x8_t)v8, (int8x8_t)__PAIR64__(v8.u32[1], LODWORD(v11)));
        v13 = fminf(*(float *)&v12.i32[1], 20.0);
        if (*(float *)&v12.i32[1] >= -20.0)
          v10 = *(float *)&v12.i32[1];
        if (*(float *)&v12.i32[1] <= 0.0)
          v14 = v10;
        else
          v14 = v13;
        *(float *)&v12.i32[1] = v14;
        *(int8x8_t *)self->_anon_e0 = v12;
      }
      else
      {
        v14 = v8.f32[1];
      }
      *(float *)&self->_anon_e0[4] = -v14;
      -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 1);
      self->_inertia.lastSimulationTime = CACurrentMediaTime();
    }
  }
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "cameraInertiaWillStartForController:", *(_QWORD *)(a1 + 32));
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInertiaAtTime:", CACurrentMediaTime());
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "cameraInertiaDidEndForController:", *(_QWORD *)(a1 + 32));
}

- (id)delegate
{
  return self->_delegate;
}

- (SCNInteractionMode)interactionMode
{
  return self->_interactionMode;
}

- (BOOL)automaticTarget
{
  return self->_automaticTarget;
}

- (void)setAutomaticTarget:(BOOL)automaticTarget
{
  self->_automaticTarget = automaticTarget;
}

- (double)_orthographicViewSpaceTranslationForZoomAtScreenPoint:(float)a3 scaleDelta:(float64_t)a4 viewport:(float64_t)a5
{
  float32x4_t *v6;
  double v7;
  float32x4_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float64x2_t v13;
  float v14;
  float v15;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x2_t v28;
  float32x4_t v32;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  simd_float4x4 v45;
  simd_float4x4 v46;
  simd_float4x4 v47;
  simd_float4x4 v48;

  v6 = (float32x4_t *)objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "nodeRef");
  v7 = 0.0;
  if (v6)
  {
    v8 = v6;
    v9 = C3DGetScene(v6);
    if (v9)
    {
      v10 = v9;
      v11 = C3DGetScene(v8);
      C3DSceneLock(v11);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      memset(v33, 0, sizeof(v33));
      if ((C3DNodeGetProjectionInfos((uint64_t)v8, (uint64_t)v33) & 1) != 0)
      {
        if ((v33[0] & 8) != 0)
        {
          v22 = C3DGetScene(v8);
          C3DSceneUnlock(v22);
          v23 = scn_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[SCNCameraController(SPI) _orthographicViewSpaceTranslationForZoomAtScreenPoint:scaleDelta:viewport:].cold.1(v23);
        }
        else
        {
          if ((v33[0] & 2) != 0)
            C3DAdjustZRangeOfProjectionInfos((uint64_t)v33, v8, 0, v10);
          v12 = C3DGetScene(v8);
          C3DSceneUnlock(v12);
          v13.f64[0] = a4;
          v13.f64[1] = a5;
          v32 = vcvt_hight_f32_f64(0, v13);
          v45 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v33, (uint64_t)&v32, 0);
          v46 = __invert_f4(v45);
          v25 = (float32x4_t)v46.columns[0];
          v26 = (float32x4_t)v46.columns[1];
          v27 = (float32x4_t)v46.columns[2];
          v28 = *(float32x2_t *)v46.columns[3].f32;
          *(double *)&v34 = *(double *)&v34 + a3;
          v47 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v33, (uint64_t)&v32, 0);
          v48 = __invert_f4(v47);
          v14 = (float)(*(float *)&a2 + *(float *)&a2) / a4 + -1.0;
          v15 = (float)(*((float *)&a2 + 1) + *((float *)&a2 + 1)) / a5 + -1.0;
          __asm { FMOV            V7.4S, #-1.0 }
          return COERCE_DOUBLE(vsub_f32(vadd_f32(v28, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v25, v14), v26, v15), _Q7, v27)), vadd_f32(*(float32x2_t *)v48.columns[3].f32, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v48.columns[0], v14), (float32x4_t)v48.columns[1], v15), _Q7, (float32x4_t)v48.columns[2]))));
        }
      }
      else
      {
        v21 = C3DGetScene(v8);
        C3DSceneUnlock(v21);
      }
    }
  }
  return v7;
}

- (BOOL)drivenByDefaultNavigationCameraController
{
  return self->_drivenBydefaultNavigationCameraController;
}

@end
