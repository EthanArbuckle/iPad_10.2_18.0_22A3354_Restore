@implementation BWRamp

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWRamp;
  -[BWRamp dealloc](&v3, sel_dealloc);
}

- (BOOL)isRamping
{
  return self->_isRamping;
}

- (float)updateRampForNextIteration
{
  int v3;
  float targetValue;
  float startValue;
  float v6;
  double v7;
  double v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float result;

  if (!self->_isRamping)
    return self->_currentValue;
  v3 = self->_currentIteration + 1;
  self->_currentIteration = v3;
  startValue = self->_startValue;
  targetValue = self->_targetValue;
  v6 = (float)v3 / (float)self->_durationInIterations;
  switch(self->_shape)
  {
    case 0:
      break;
    case 1:
      v7 = pow((float)(1.0 - self->_exponentialConvergenceFraction), (float)(1.0 - v6));
      goto LABEL_15;
    case 2:
      v8 = pow((float)(1.0 - self->_exponentialConvergenceFraction), v6);
      if (v6 <= self->_exponentialSnapFraction)
      {
        v7 = 1.0 - v8;
LABEL_15:
        v6 = v7;
      }
      else
      {
        v6 = 1.0;
      }
      break;
    case 3:
      v9 = FigCaptureRoundFloatToMultipleOf(1, (float)((float)v3 / self->_frameRate) * 60.0);
      v10 = -[BWSpringSimulation updateCount](self->_spring, "updateCount");
      v11 = __OFSUB__(v9, v10);
      v12 = v9 - v10;
      if (!((v12 < 0) ^ v11 | (v12 == 0)))
      {
        do
        {
          -[BWSpringSimulation update](self->_spring, "update");
          --v12;
        }
        while (v12);
      }
      -[BWSpringSimulation output](self->_spring, "output");
      v14 = v13;
      v6 = 1.0;
      if (!-[BWSpringSimulation isCompleted](self->_spring, "isCompleted"))
      {
        v6 = v14;
        if (self->_exponentialSnapFraction > 0.0)
        {
          -[BWSpringSimulation output](self->_spring, "output");
          if (v15 >= 1.0 - self->_exponentialSnapFraction)
            v6 = 1.0;
        }
      }
      break;
    default:
      v6 = 0.0;
      break;
  }
  v16 = vabds_f32(targetValue, startValue);
  v17 = self->_startValue;
  if (self->_isRampingUp)
  {
    result = v17 + (float)(v6 * v16);
    if (result >= self->_targetValue)
      result = self->_targetValue;
  }
  else
  {
    result = v17 - (float)(v6 * v16);
    if (result <= self->_targetValue)
      result = self->_targetValue;
  }
  self->_currentValue = result;
  self->_isRamping = v6 < 1.0;
  return result;
}

- (BWRamp)initWithName:(id)a3
{
  BWRamp *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWRamp;
  v4 = -[BWRamp init](&v6, sel_init);
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend(a3, "copy");
    *(int32x2_t *)&v4->_exponentialConvergenceFraction = vdup_n_s32(0x3F7AE148u);
  }
  return v4;
}

- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6 exponentialConvergenceFraction:(float)a7
{
  BOOL v7;

  if (a6 == 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Use -startSpringRampFrom: for BWRampShapeSpring"), 0));
  if (a3 == a4)
  {
    v7 = 0;
  }
  else
  {
    self->_startValue = a3;
    self->_targetValue = a4;
    self->_durationInIterations = a5;
    self->_shape = a6;
    self->_exponentialConvergenceFraction = a7;
    self->_exponentialSnapFraction = a7;
    self->_isRampingUp = a3 < a4;
    self->_currentIteration = 0;
    v7 = 1;
  }
  self->_currentValue = a3;
  self->_isRamping = v7;
}

- (float)currentValue
{
  return self->_currentValue;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWRamp)init
{
  return -[BWRamp initWithName:](self, "initWithName:", 0);
}

- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6
{
  -[BWRamp startRampFrom:to:iterations:shape:exponentialConvergenceFraction:](self, "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (void)startSpringRampFrom:(float)a3 to:(float)a4 withTension:(float)a5 friction:(float)a6 snapFraction:(float)a7 frameRate:(float)a8
{
  BOOL v11;
  BWSpringSimulation *v15;
  uint64_t v16;

  if (a8 <= 0.0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid frame rate"), 0));
  if (a3 == a4)
  {
    v11 = 0;
  }
  else
  {
    self->_startValue = a3;
    self->_targetValue = a4;
    self->_shape = 3;
    self->_exponentialSnapFraction = a7;

    v15 = objc_alloc_init(BWSpringSimulation);
    self->_spring = v15;
    -[BWSpringSimulation setTension:](v15, "setTension:", a5);
    -[BWSpringSimulation setFriction:](self->_spring, "setFriction:", a6);
    -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:convergedSpeed:](self->_spring, "resetWithInput:initialOutput:initialVelocity:convergedSpeed:", 1.0, 0.0, 0.0, 0.001);
    v16 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&self->_springPTS.value = *MEMORY[0x1E0CA2E68];
    self->_springPTS.epoch = *(_QWORD *)(v16 + 16);
    self->_frameRate = a8;
    self->_isRampingUp = a3 < a4;
    self->_currentIteration = 0;
    v11 = 1;
  }
  self->_currentValue = a3;
  self->_isRamping = v11;
}

- (void)reset
{
  *(_QWORD *)&self->_startValue = 0;
  *(_QWORD *)&self->_currentValue = 0;
  *(_QWORD *)&self->_durationInIterations = 0;
  *(int32x2_t *)&self->_exponentialConvergenceFraction = vdup_n_s32(0x3F7AE148u);

  self->_spring = 0;
  self->_isRamping = 0;
  self->_isRampingUp = 0;
}

- (BOOL)isRampingUp
{
  return self->_isRampingUp;
}

@end
