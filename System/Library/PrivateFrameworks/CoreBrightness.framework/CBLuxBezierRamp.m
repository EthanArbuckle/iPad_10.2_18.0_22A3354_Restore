@implementation CBLuxBezierRamp

- (float)lux
{
  return self->_lux;
}

- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4
{
  float rampDownLuxDeltaThreshold;

  if (float_equal(a3, a4))
    return 0;
  if (-[CBLuxBezierRamp rampIsRunning](self, "rampIsRunning") && float_equal(a4, self->_targetLux))
    return 0;
  if (-[CBLuxBezierRamp rampIsRunning](self, "rampIsRunning")
    && (float)((float)(a4 - self->_lux) * (float)(self->_targetLux - self->_lux)) < 0.0)
  {
    return 1;
  }
  rampDownLuxDeltaThreshold = self->_rampDownLuxDeltaThreshold;
  if (a4 > a3)
    rampDownLuxDeltaThreshold = self->_rampUpLuxDeltaThreshold;
  return vabds_f32(a4, a3) >= rampDownLuxDeltaThreshold;
}

- (int)updateTimedRamp:(float)a3
{
  double v3;
  float v5;

  if (self->_duration == 0.0)
    return self->_state;
  v5 = (float)(a3 - self->_startTime) / self->_duration;
  if (a3 > (float)((float)(self->_startTime + self->_duration) + 0.05))
    v5 = 1.0;
  *(float *)&v3 = v5;
  return -[CBLuxBezierRamp updateRampWithProgress:](self, "updateRampWithProgress:", v3);
}

- (int)updateRampWithProgress:(float)a3
{
  BOOL v4;
  _BOOL4 v5;

  if (!-[CBLuxBezierRamp rampIsRunning](self, "rampIsRunning"))
    return self->_state;
  self->_lux = self->_startLux
             + (float)(clamp((float)((float)(a3 * (float)(1.0 - a3))* (float)((float)((float)((float)(6.0 * (float)(a3 * (float)(1.0 - a3)))* self->bezierAnchors[1])+ (float)((float)(4.0 * (float)((float)(1.0 - a3) * (float)(1.0 - a3)))* self->bezierAnchors[0]))+ (float)((float)(4.0 * (float)(a3 * a3)) * self->bezierAnchors[2])))+ (float)((float)(a3 * a3) * (float)(a3 * a3)), 0.0, 1.0)* (float)(self->_targetLux - self->_startLux));
  if (self->_targetLux <= self->_startLux)
    v5 = self->_lux <= self->_targetLux;
  else
    v5 = self->_lux >= self->_targetLux;
  v4 = 1;
  if (!v5)
    v4 = a3 >= 1.0;
  if (!v4)
    return 0;
  self->_startTime = 0.0;
  self->_state = 1;
  return 3;
}

- (BOOL)rampIsRunning
{
  return self->_state == 0;
}

- (CBLuxBezierRamp)initWithParams:(id)a3 andPolicy:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t, double);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t (*v23)(uint64_t, double);
  void *v24;
  id v25;
  uint64_t *v26;
  unsigned int i;
  objc_super v28;
  id v29;
  id v30;
  SEL v31;
  CBLuxBezierRamp *v32;

  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CBLuxBezierRamp;
  v32 = -[CBLuxBezierRamp init](&v28, sel_init);
  if (v32)
  {
    -[CBLuxBezierRamp commonInit](v32, "commonInit");
    for (i = 0; i < 3; ++i)
    {
      objc_msgSend((id)objc_msgSend(v30, "rampBezierAnchors"), "get:", i);
      v32->bezierAnchors[i] = v4;
    }
    objc_msgSend(v30, "rampDownLuxDeltaThreshold");
    v32->_rampDownLuxDeltaThreshold = v5;
    objc_msgSend(v30, "rampUpLuxDeltaThreshold");
    v32->_rampUpLuxDeltaThreshold = v6;
    objc_msgSend(v30, "rampDownDuration");
    v32->_rampDownDuration = v7;
    objc_msgSend(v30, "rampUpDuration");
    v32->_rampUpDuration = v8;
    v12 = MEMORY[0x1E0C809B0];
    v20 = MEMORY[0x1E0C809B0];
    v21 = -1073741824;
    v22 = 0;
    v23 = __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke;
    v24 = &unk_1E68EA5B8;
    v25 = v29;
    v26 = &v20;
    v9 = objc_msgSend(&v20, "copy");
    v32->_cappedRampStartLux = (id)v9;
    v13 = v12;
    v14 = -1073741824;
    v15 = 0;
    v16 = __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke_2;
    v17 = &unk_1E68EA5B8;
    v18 = v29;
    v19 = &v13;
    v10 = objc_msgSend(&v13, "copy");
    v32->_cappedRampTargetLux = (id)v10;
  }
  return v32;
}

uint64_t __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cappedRampStartLux:", a2);
}

uint64_t __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke_2(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cappedRampTargetLux:", a2);
}

- (CBLuxBezierRamp)initWithBezierAnchors:(id)a3 rampDownLuxThreshold:(float)a4 rampUpLuxThreshold:(float)a5 rampDownDuration:(float)a6 rampUpDuration:(float)a7 rampStartLuxCapping:(id)a8 rampTargetLuxCapping:(id)a9
{
  float v9;
  id v10;
  id v11;
  unsigned int i;
  objc_super v14;
  id v15;
  id v16;
  float v17;
  float v18;
  float v19;
  float v20;
  id v21;
  SEL v22;
  CBLuxBezierRamp *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v18 = a6;
  v17 = a7;
  v16 = a8;
  v15 = a9;
  v14.receiver = self;
  v14.super_class = (Class)CBLuxBezierRamp;
  v23 = -[CBLuxBezierRamp init](&v14, sel_init);
  if (!v23)
    return 0;
  -[CBLuxBezierRamp commonInit](v23, "commonInit");
  for (i = 0; i < 3; ++i)
  {
    objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", i), "floatValue");
    v23->bezierAnchors[i] = v9;
  }
  v23->_rampDownLuxDeltaThreshold = v20;
  v23->_rampUpLuxDeltaThreshold = v19;
  v23->_rampDownDuration = v18;
  v23->_rampUpDuration = v17;
  v10 = v16;
  v23->_cappedRampStartLux = v10;
  v11 = v15;
  v23->_cappedRampTargetLux = v11;
  return v23;
}

- (void)commonInit
{
  self->_lux = NAN;
  self->_startTime = 0.0;
  self->_duration = 0.0;
  self->_targetLux = NAN;
  self->_startLux = NAN;
  self->_state = 1;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBLuxBezierRamp *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBLuxBezierRamp;
  -[CBLuxBezierRamp dealloc](&v2, sel_dealloc);
}

- (float)targetLux
{
  if (-[CBLuxBezierRamp rampIsRunning](self, "rampIsRunning"))
    return self->_targetLux;
  else
    return self->_lux;
}

- (void)forceLux:(float)a3
{
  self->_lux = a3;
  self->_targetLux = a3;
  self->_startLux = a3;
  self->_duration = 0.0;
}

- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5
{
  return -[CBLuxBezierRamp rampTimedFromLux:toLux:atTime:forceRamp:](self, "rampTimedFromLux:toLux:atTime:forceRamp:", 0, *(double *)&a3, *(double *)&a4, *(double *)&a5);
}

- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5 forceRamp:(BOOL)a6
{
  float rampDownDuration;
  float v10;
  float v12;

  if (!a6
    && !-[CBLuxBezierRamp shouldRampFromStartLux:toTargetLux:](self, "shouldRampFromStartLux:toTargetLux:", *(double *)&a3, *(double *)&a4))
  {
    return self->_state;
  }
  v12 = (*((float (**)(float))self->_cappedRampStartLux + 2))(a3);
  v10 = (*((float (**)(float))self->_cappedRampTargetLux + 2))(a4);
  if (v10 <= v12)
    rampDownDuration = self->_rampDownDuration;
  else
    rampDownDuration = self->_rampUpDuration;
  self->_duration = rampDownDuration;
  if (-[CBLuxBezierRamp rampIsRunning](self, "rampIsRunning")
    && vabds_f32(v10, v12) <= vabds_f32(self->_targetLux, self->_lux))
  {
    self->_duration = rampDownDuration
                    * (float)(vabds_f32(self->_targetLux, self->_lux) / vabds_f32(self->_targetLux, self->_startLux));
  }
  self->_startTime = a5;
  self->_lux = v12;
  self->_startLux = v12;
  self->_targetLux = v10;
  self->_state = 0;
  return 2;
}

- (int)rampFromLux:(float)a3 toLux:(float)a4
{
  return -[CBLuxBezierRamp rampFromLux:toLux:forceRamp:](self, "rampFromLux:toLux:forceRamp:", 0, *(double *)&a3, *(double *)&a4);
}

- (int)rampFromLux:(float)a3 toLux:(float)a4 forceRamp:(BOOL)a5
{
  float v7;
  float v9;

  if (!a5
    && !-[CBLuxBezierRamp shouldRampFromStartLux:toTargetLux:](self, "shouldRampFromStartLux:toTargetLux:", *(double *)&a3, *(double *)&a4))
  {
    return self->_state;
  }
  v9 = (*((float (**)(float))self->_cappedRampStartLux + 2))(a3);
  v7 = (*((float (**)(float))self->_cappedRampTargetLux + 2))(a4);
  self->_lux = v9;
  self->_startLux = v9;
  self->_targetLux = v7;
  self->_state = 0;
  return 2;
}

+ (id)luxRampStateToString:(int)a3
{
  if (a3 <= 3uLL)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

- (float)duration
{
  return self->_duration;
}

- (float)startLux
{
  return self->_startLux;
}

- (float)startTime
{
  return self->_startTime;
}

- (float)targetTime
{
  return self->_targetTime;
}

@end
