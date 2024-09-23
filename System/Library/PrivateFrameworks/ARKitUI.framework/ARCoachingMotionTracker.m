@implementation ARCoachingMotionTracker

- (ARCoachingMotionTracker)init
{
  ARCoachingMotionTracker *v2;
  ARCoachingMotionTracker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARCoachingMotionTracker;
  v2 = -[ARCoachingMotionTracker init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ARCoachingMotionTracker clear](v2, "clear");
  return v3;
}

- (BOOL)didStartMoving
{
  return self->_isMoving && !self->_wasMoving;
}

- (BOOL)didStopMoving
{
  return !self->_isMoving && self->_wasMoving;
}

- (double)calcAverageVelocity
{
  float32x4_t v1;
  uint64_t i;
  double result;

  v1 = 0uLL;
  for (i = 16; i != 96; i += 16)
    v1 = vaddq_f32(v1, *(float32x4_t *)(a1 + i));
  __asm { FMOV            V1.4S, #5.0 }
  *(_QWORD *)&result = vdivq_f32(v1, _Q1).u64[0];
  return result;
}

- (void)updateWithFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float32x4_t v7;
  double lastTime;
  double v9;
  int velocityIndex;
  float32x4_t v11;
  float32x4_t v12;
  double v13;
  int v14;
  float32x4_t v15;
  float32x4_t v16;
  int thresholdBreakCount;
  int v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  objc_class *v23;
  float32x4_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARCoachingMotionTracker *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transform");
    v24 = v7;

    objc_msgSend(v5, "timestamp");
    v9 = lastTime;
    velocityIndex = self->_velocityIndex;
    if (velocityIndex < 0)
    {
      self->_lastThresholdBreakTime = lastTime;
      v12 = v24;
      v11 = v24;
    }
    else
    {
      v11 = *(float32x4_t *)self->_lastPosition;
      lastTime = self->_lastTime;
      v12 = v24;
    }
    self->_wasMoving = self->_isMoving;
    *(float32x4_t *)self->_lastPosition = v12;
    v13 = v9 - lastTime;
    self->_lastTime = v9;
    *(float *)&v13 = v13;
    v14 = (velocityIndex + 1) % 5;
    self->_velocityIndex = v14;
    *(float32x4_t *)&self->_velocities[16 * v14] = vdivq_f32(vsubq_f32(v12, v11), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0));
    -[ARCoachingMotionTracker calcAverageVelocity](self, "calcAverageVelocity", *(_OWORD *)&v24);
    v16 = vmulq_f32(v15, v15);
    thresholdBreakCount = self->_thresholdBreakCount;
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0] <= 0.01)
    {
      if (thresholdBreakCount <= 1)
        thresholdBreakCount = 1;
      v18 = thresholdBreakCount - 1;
      self->_thresholdBreakCount = v18;
    }
    else
    {
      v18 = thresholdBreakCount + 1;
      self->_thresholdBreakCount = v18;
      self->_lastThresholdBreakTime = v9;
    }
    if (self->_wasMoving)
    {
      if (v9 - self->_lastThresholdBreakTime > 0.5)
      {
        self->_isMoving = 0;
        self->_thresholdBreakCount = 0;
        _ARLogCoaching_5();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v21;
          v27 = 2048;
          v28 = self;
          v22 = "%{public}@ <%p>: Coaching view stopped moving";
LABEL_17:
          _os_log_impl(&dword_1DCC73000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v18 >= 16)
        self->_isMoving = 1;
    }
    else if (v18 > 15)
    {
      self->_isMoving = 1;
      _ARLogCoaching_5();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        v27 = 2048;
        v28 = self;
        v22 = "%{public}@ <%p>: Coaching view started moving";
        goto LABEL_17;
      }
LABEL_18:

    }
  }

}

- (void)clear
{
  *(_OWORD *)&self->_velocities[48] = 0u;
  *(_OWORD *)&self->_velocities[64] = 0u;
  *(_OWORD *)&self->_velocities[16] = 0u;
  *(_OWORD *)&self->_velocities[32] = 0u;
  *(_OWORD *)self->_velocities = 0u;
  *(_QWORD *)&self->_lastPosition[8] = 0;
  self->_lastTime = 0.0;
  *(_QWORD *)self->_lastPosition = 0;
  self->_velocityIndex = -1;
  self->_lastThresholdBreakTime = 0.0;
  *(double *)((char *)&self->_lastThresholdBreakTime + 6) = 0.0;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

@end
