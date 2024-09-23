@implementation ARCoachingAnimationView

- (ARCoachingAnimationView)initWithFrame:(CGRect)a3
{
  ARCoachingAnimationView *v3;
  ARCoachingAnimationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCoachingAnimationView;
  v3 = -[ARCoachingAnimationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ARCoachingAnimationView setupView](v3, "setupView");
  return v4;
}

- (ARCoachingAnimationView)initWithCoder:(id)a3
{
  ARCoachingAnimationView *v3;
  ARCoachingAnimationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCoachingAnimationView;
  v3 = -[ARCoachingAnimationView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ARCoachingAnimationView setupView](v3, "setupView");
  return v4;
}

- (void)setupView
{
  self->_cubeAngle = 0.0;
}

- (void)setAnimationState:(int64_t)a3
{
  int64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int64_t currentCoachingGoal;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARCoachingAnimationView *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_animationState != a3)
  {
    self->_animationState = a3;
    if (!self->_isDeactivating)
    {
      v4 = 0;
      switch(a3)
      {
        case 0:
          v4 = 1;
          goto LABEL_16;
        case 2:
        case 4:
          v4 = a3;
          goto LABEL_16;
        case 3:
          -[ARCoachingRenderer state](self->_renderer, "state");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "snapState");

          if (v7 == 4)
          {
            self->_nextStateTime = -1.0;
LABEL_9:
            v4 = 4;
          }
          else
          {
            v4 = 3;
          }
LABEL_16:
          -[ARCoachingRenderer state](self->_renderer, "state");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "snapState");

          if (v14 != v4)
          {
            -[ARCoachingRenderer state](self->_renderer, "state");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setSnapState:", v4);

          }
          break;
        case 5:
          self->_nextStateTime = -1.0;
          -[ARCoachingRenderer state](self->_renderer, "state");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "snapState");

          goto LABEL_16;
        case 6:
          -[ARCoachingAnimationView clampCubeToQuarterRotation](self, "clampCubeToQuarterRotation");
          *(float *)&v5 = self->_cubeAngle;
          -[ARCoachingRenderer setOrientationAngle:](self->_renderer, "setOrientationAngle:", v5);
          goto LABEL_9;
        case 7:
          if (self->_currentCoachingGoal != 4)
          {
            _ARLogCoaching_1();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = (objc_class *)objc_opt_class();
              NSStringFromClass(v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              currentCoachingGoal = self->_currentCoachingGoal;
              *(_DWORD *)buf = 138543874;
              v17 = v11;
              v18 = 2048;
              v19 = self;
              v20 = 2048;
              v21 = currentCoachingGoal;
              _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Trying to set animation state to geo tracking but geo tracking is not the current goal, goal is: %ld", buf, 0x20u);

            }
          }
          return;
        default:
          goto LABEL_16;
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = ARCoachingLayoutScalar() * 600.0;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)startCoachingAnimation:(int64_t)a3
{
  double v3;
  void *v6;
  void *v7;
  CAMetalLayer *v8;
  CAMetalLayer *metalLayer;
  ARCoachingUpdateManager *v10;
  ARCoachingUpdateManager *updateManager;
  uint64_t v12;
  void *v13;
  __objc2_class *v14;
  ARCoachingRenderer *v15;
  ARCoachingRenderer *renderer;
  ARCoachingRenderer *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  _QWORD v22[5];

  self->_currentCoachingGoal = a3;
  if (!self->_renderer)
  {
    objc_msgSend(MEMORY[0x1E0CF2190], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27E0], "layer");
    v8 = (CAMetalLayer *)objc_claimAutoreleasedReturnValue();
    metalLayer = self->_metalLayer;
    self->_metalLayer = v8;

    -[CAMetalLayer setOpaque:](self->_metalLayer, "setOpaque:", 0);
    v10 = -[ARCoachingUpdateManager init:metalLayer:]([ARCoachingUpdateManager alloc], "init:metalLayer:", v7, self->_metalLayer);
    updateManager = self->_updateManager;
    self->_updateManager = v10;

    -[ARCoachingUpdateManager setDelegate:](self->_updateManager, "setDelegate:", self);
    v12 = 8;
    if ((objc_msgSend(v7, "supportsTextureSampleCount:", 8) & 1) == 0)
    {
      if (objc_msgSend(v7, "supportsTextureSampleCount:", 4))
        v12 = 4;
      else
        v12 = 1;
    }
    ARCoachingLoadDeviceGlyph();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 4)
      v14 = ARCoachingGeoTrackingRenderer;
    else
      v14 = ARCoachingGlyphRenderer;
    v15 = (ARCoachingRenderer *)objc_msgSend([v14 alloc], "initWithLayer:device:pixelFormat:sampleCount:deviceMaskImage:", self->_metalLayer, v7, -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"), v12, v13);
    renderer = self->_renderer;
    self->_renderer = v15;

    v17 = self->_renderer;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke;
    v22[3] = &unk_1EA5867B0;
    v22[4] = self;
    -[ARCoachingRenderer prepareWithCompletionHandler:](v17, "prepareWithCompletionHandler:", v22);
    -[ARCoachingAnimationView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", self->_metalLayer);

    -[ARCoachingAnimationView updateMetalLayer](self, "updateMetalLayer");
  }
  self->_cubeAngle = 0.0;
  LODWORD(v3) = 0;
  -[ARCoachingRenderer setOrientationAngle:](self->_renderer, "setOrientationAngle:", v3);
  -[ARCoachingRenderer state](self->_renderer, "state");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIsVertical:", a3 == 2);

  -[ARCoachingRenderer state](self->_renderer, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSnapState:", 1);

  v21 = 7;
  if (a3 != 4)
    v21 = 0;
  self->_animationState = v21;
}

void __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ARLogCoaching_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1DCC73000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create coaching renderer: %@", buf, 0x20u);

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke_18;
    block[3] = &unk_1EA586888;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "start");
}

- (void)killCoachingAnimation
{
  ARCoachingRenderer *renderer;
  ARCoachingUpdateManager *updateManager;
  CAMetalLayer *metalLayer;

  renderer = self->_renderer;
  self->_renderer = 0;

  -[ARCoachingUpdateManager stop](self->_updateManager, "stop");
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  -[CAMetalLayer removeFromSuperlayer](self->_metalLayer, "removeFromSuperlayer");
  metalLayer = self->_metalLayer;
  self->_metalLayer = 0;

}

- (void)updateWithFrame:(id)a3 motionTracker:(id)a4
{
  double v5;

  -[ARCoachingAnimationView updateCubeRotation:motionTracker:](self, "updateCubeRotation:motionTracker:", a3, a4);
  if (*(_WORD *)&self->_isRotating)
  {
    *(float *)&v5 = self->_cubeAngle;
    -[ARCoachingRenderer setOrientationAngle:](self->_renderer, "setOrientationAngle:", v5);
  }
}

- (void)updateCubeRotation:(id)a3 motionTracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  void *v17;
  __int128 v18;
  int v19;
  float32x4_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  float32x4_t v27;
  int32x4_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  ARCoachingAnimationView *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "camera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewMatrixForOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  v34 = v9;
  v35 = v10;
  v32 = v11;
  v33 = v12;

  v13 = vzip1q_s32(v34, v32);
  v14 = vzip2q_s32(v34, v32);
  v15 = vzip1q_s32(v35, v33);
  v16 = vzip2q_s32(v35, v33);
  *(float32x4_t *)self->_lastCameraRight = vmlaq_f32(vmlaq_f32(vmlaq_f32((float32x4_t)vzip1q_s32(v13, v15), (float32x4_t)0, (float32x4_t)vzip2q_s32(v13, v15)), (float32x4_t)0, (float32x4_t)vzip1q_s32(v14, v16)), (float32x4_t)0, (float32x4_t)vzip2q_s32(v14, v16));
  objc_msgSend(v7, "camera");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "transform");
  *(_OWORD *)self->_lastCameraTranslation = v18;

  self->_wasRotating = self->_isRotating;
  if (self->_animationState == 4)
  {
    v19 = objc_msgSend(v6, "isMoving");
    self->_isRotating = v19;
    if (v19)
    {
      if (self->_wasRotating)
      {
        v20 = *(float32x4_t *)self->_rotationStartCameraTranslation;
LABEL_13:
        v27 = vsubq_f32(*(float32x4_t *)self->_lastCameraTranslation, v20);
        v28 = (int32x4_t)vmulq_f32(v27, v27);
        v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
        v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
        v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
        v31 = vmulq_f32(*(float32x4_t *)self->_rotationStartCameraRight, vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]));
        self->_cubeAngle = self->_cubeAngle
                         + fminf(fmaxf((float)(5.0* vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0])- self->_cubeAngle, -0.05), 0.05);
        goto LABEL_14;
      }
      _ARLogCoaching_1();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        v38 = 2048;
        v39 = self;
        _os_log_impl(&dword_1DCC73000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching animation began rotation", buf, 0x16u);

      }
      *(_OWORD *)self->_rotationStartCameraRight = *(_OWORD *)self->_lastCameraRight;
      v20 = *(float32x4_t *)self->_lastCameraTranslation;
      *(float32x4_t *)self->_rotationStartCameraTranslation = v20;
      if (self->_isRotating)
        goto LABEL_13;
    }
  }
  else
  {
    self->_isRotating = 0;
  }
  if (self->_wasRotating)
  {
    _ARLogCoaching_1();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1DCC73000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching animation ended rotation", buf, 0x16u);

    }
    -[ARCoachingAnimationView clampCubeToQuarterRotation](self, "clampCubeToQuarterRotation");
  }
LABEL_14:

}

- (void)clampCubeToQuarterRotation
{
  float cubeAngle;
  int v4;
  float v5;
  void *v6;
  int v7;
  double v8;
  int v9;
  float v10;

  cubeAngle = self->_cubeAngle;
  v4 = (int)(fabs(cubeAngle / 1.57079633) + 0.5);
  if (cubeAngle < 0.0)
    v4 = -v4;
  v5 = (float)v4 * 1.57079633;
  self->_cubeAngle = v5;
  -[ARCoachingRenderer state](self->_renderer, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVertical");

  if (v7)
  {
    v8 = self->_cubeAngle;
    v9 = llround(fmod(v8 / 1.57079633, 4.0));
    if (((v9 + (v9 < 0 ? 4 : 0)) | 2) == 3)
    {
      v10 = v8 + -1.57079633;
      self->_cubeAngle = v10;
    }
  }
}

- (double)calcNextAnimationSwitchTime:(double)a3 forState:(unint64_t)a4
{
  double v5;
  long double v6;
  long double v7;

  v5 = dbl_1DCCA0F60[a4 == 3];
  -[ARCoachingRenderer currentAnimationTime](self->_renderer, "currentAnimationTime");
  v7 = fmod(v6, 6.28318531);
  return fmod(v5 - v7 + 6.28318531, 6.28318531) + a3;
}

- (void)updateAlternatingPlanes:(double)a3
{
  double nextStateTime;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (self->_animationState == 5)
  {
    nextStateTime = self->_nextStateTime;
    if (nextStateTime >= 0.0)
      goto LABEL_9;
    -[ARCoachingRenderer state](self->_renderer, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "snapState");

    if (v7 == 2)
    {
      v8 = 3;
    }
    else
    {
      nextStateTime = a3;
      if (v7 != 3)
      {
LABEL_8:
        self->_nextStateTime = nextStateTime;
LABEL_9:
        if (nextStateTime > a3)
          return;
        -[ARCoachingRenderer state](self->_renderer, "state");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "snapState");

        if (v10 == 3)
        {
          -[ARCoachingAnimationView calcNextAnimationSwitchTime:forState:](self, "calcNextAnimationSwitchTime:forState:", 3, a3);
          v12 = 0;
        }
        else
        {
          if (v10 == 2)
            goto LABEL_20;
          -[ARCoachingRenderer state](self->_renderer, "state");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isVertical");

          if ((_DWORD)v12)
          {
            if (self->_lastUpdateState == 4)
            {
              v13 = a3 + 0.5;
              v12 = 1;
              v14 = 4;
LABEL_21:
              self->_nextStateTime = v13;
              -[ARCoachingRenderer state](self->_renderer, "state");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setIsVertical:", v12);

              -[ARCoachingRenderer state](self->_renderer, "state");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSnapState:", v14);

              return;
            }
            -[ARCoachingRenderer resetAnimationTime:](self->_renderer, "resetAnimationTime:", 5.98318531);
LABEL_20:
            -[ARCoachingAnimationView calcNextAnimationSwitchTime:forState:](self, "calcNextAnimationSwitchTime:forState:", 2, a3);
            v12 = 1;
            v14 = 3;
            goto LABEL_21;
          }
          -[ARCoachingRenderer resetAnimationTime:](self->_renderer, "resetAnimationTime:", 2.84159265);
          -[ARCoachingAnimationView calcNextAnimationSwitchTime:forState:](self, "calcNextAnimationSwitchTime:forState:", 3, a3);
        }
        v14 = 2;
        goto LABEL_21;
      }
      v8 = 2;
    }
    -[ARCoachingAnimationView calcNextAnimationSwitchTime:forState:](self, "calcNextAnimationSwitchTime:forState:", v8, a3);
    goto LABEL_8;
  }
}

- (void)updateVerticalClamp:(double)a3
{
  void *v5;
  uint64_t v6;
  double nextStateTime;
  void *v8;
  uint64_t v9;
  id v10;

  if (self->_animationState == 3)
  {
    -[ARCoachingRenderer state](self->_renderer, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "snapState");

    if (v6 != 3)
    {
      nextStateTime = self->_nextStateTime;
      if (nextStateTime < 0.0)
      {
        -[ARCoachingRenderer state](self->_renderer, "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "snapState");

        nextStateTime = a3 + 0.5;
        if (v9 != 4)
          nextStateTime = a3;
        self->_nextStateTime = nextStateTime;
      }
      if (nextStateTime <= a3)
      {
        -[ARCoachingRenderer state](self->_renderer, "state");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSnapState:", 3);

      }
    }
  }
}

- (void)resizeForDrawable:(id)a3
{
  -[ARCoachingRenderer resizeIfNeeded:](self->_renderer, "resizeIfNeeded:", a3);
}

- (void)updateForCurrentTime:(double)a3 timeDelta:(double)a4
{
  -[ARCoachingAnimationView updateAlternatingPlanes:](self, "updateAlternatingPlanes:", a3, a4);
  -[ARCoachingAnimationView updateVerticalClamp:](self, "updateVerticalClamp:", a3);
  self->_lastUpdateState = self->_animationState;
}

- (void)drawInDrawable:(id)a3 withCommandBuffer:(id)a4 timeDelta:(double)a5
{
  -[ARCoachingRenderer drawWithTimeDelta:drawable:commandBuffer:](self->_renderer, "drawWithTimeDelta:drawable:commandBuffer:", a3, a4, a5);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARCoachingAnimationView;
  -[ARCoachingAnimationView layoutSubviews](&v3, sel_layoutSubviews);
  -[ARCoachingAnimationView updateMetalLayer](self, "updateMetalLayer");
}

- (void)updateMetalLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (self->_metalLayer)
  {
    v3 = ARCoachingLayoutScalar();
    -[ARCoachingAnimationView intrinsicContentSize](self, "intrinsicContentSize");
    -[CAMetalLayer setBounds:](self->_metalLayer, "setBounds:", 0.0, 0.0, v4, v5);
    -[CAMetalLayer bounds](self->_metalLayer, "bounds");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v7 * v9;
    -[CAMetalLayer bounds](self->_metalLayer, "bounds");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", v10, v12 * v14);

    -[ARCoachingAnimationView bounds](self, "bounds");
    v16 = v15;
    -[ARCoachingAnimationView bounds](self, "bounds");
    v18 = v16 + v17 * 0.5;
    -[ARCoachingAnimationView bounds](self, "bounds");
    v20 = v19;
    -[ARCoachingAnimationView bounds](self, "bounds");
    v22 = v20 + v21 * 0.5;
    -[CAMetalLayer bounds](self->_metalLayer, "bounds");
    v24 = v3 * 230.0 - v23 * 0.5;
    if (self->_currentCoachingGoal == 4)
      v24 = v24 + 85.0;
    -[CAMetalLayer setPosition:](self->_metalLayer, "setPosition:", v18, v22 + v24);
  }
}

- (int64_t)animationState
{
  return self->_animationState;
}

- (BOOL)isDeactivating
{
  return self->_isDeactivating;
}

- (void)setIsDeactivating:(BOOL)a3
{
  self->_isDeactivating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end
