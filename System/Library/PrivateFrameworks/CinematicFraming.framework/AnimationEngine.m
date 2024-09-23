@implementation AnimationEngine

- (AnimationEngine)initWithInitialPosition:(float)a3
{
  char *v4;
  AnimationEngine *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AnimationEngine;
  v4 = -[AnimationEngine init](&v8, sel_init);
  v5 = (AnimationEngine *)v4;
  if (v4)
  {
    *((float *)v4 + 20) = a3;
    *((_DWORD *)v4 + 21) = 0;
    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v4 + 36) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v4 + 52) = *(_QWORD *)(v6 + 16);
    objc_msgSend(v4, "_resetAnimations");
  }
  return v5;
}

- (void)animateWithDuration:(double)a3 toTarget:(float)a4 options:(unint64_t)a5 atTime:(id *)a6
{
  __int128 v11;
  __int128 v12;
  CMTime v13;
  CMTime time1;

  -[AnimationEngine _resetAnimations](self, "_resetAnimations");
  v11 = *(_OWORD *)&a6->var0;
  *(_QWORD *)&self->_startTime.flags = a6->var3;
  *(_OWORD *)(&self->_targetPosition + 1) = v11;
  self->_animationDuration = a3;
  self->_targetPosition = a4;
  self->_animationOptions = a5;
  *(_OWORD *)&time1.value = *(_OWORD *)((char *)&self->_startTime.epoch + 4);
  time1.epoch = *(_QWORD *)&self->_lastAnimationDriveTime.flags;
  v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (!CMTimeCompare(&time1, &v13))
  {
    v12 = *(_OWORD *)&a6->var0;
    *(_QWORD *)&self->_lastAnimationDriveTime.flags = a6->var3;
    *(_OWORD *)((char *)&self->_startTime.epoch + 4) = v12;
  }
}

- (void)driveAnimationAtTime:(id *)a3 withConstraints:(AnimationEngineAnimationConstraints *)a4 withMultiplier:(float)a5
{
  double Seconds;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float position;
  float v18;
  float v19;
  float v20;
  __int128 v21;
  CMTime v22;
  CMTime time;

  time = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&time);
  *(_OWORD *)&time.value = *(_OWORD *)((char *)&self->_startTime.epoch + 4);
  time.epoch = *(_QWORD *)&self->_lastAnimationDriveTime.flags;
  v10 = Seconds - CMTimeGetSeconds(&time);
  if (v10 <= 0.1)
    v11 = v10;
  else
    v11 = 0.1;
  if (fabs(v11) >= 0.0001)
  {
    time = *(CMTime *)(&self->_targetPosition + 1);
    v22 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    if (CMTimeCompare(&time, &v22))
    {
      if ((self->_animationOptions & 6) != 0)
      {
        v12 = self->_animationDuration - v11;
        if (v12 < 0.00100000005)
          v12 = 0.00100000005;
        v13 = (float)(self->_targetPosition - self->_position) / v12 * a5;
        v14 = (float)(v13 - self->_velocity) / v11;
      }
      else
      {
        v14 = 0.0;
      }
      v15 = self->_velocity + ApplyMotionConstraints(v14, a4->var0.var0, a4->var0.var1) * v11;
      v16 = ApplyMotionConstraints(v15, a4->var1.var0, a4->var1.var1);
      position = self->_position;
      v18 = position + v16 * v11;
      self->_position = v18;
      v19 = ApplyMotionConstraints(v18, a4->var2.var0, a4->var2.var1);
      v20 = (float)(v19 - position) / v11;
      self->_position = v19;
      self->_velocity = v20;
    }
    v21 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&self->_lastAnimationDriveTime.flags = a3->var3;
    *(_OWORD *)((char *)&self->_startTime.epoch + 4) = v21;
  }
}

- (void)_resetAnimations
{
  uint64_t v2;

  v2 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)(&self->_targetPosition + 1) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&self->_startTime.flags = *(_QWORD *)(v2 + 16);
  self->_animationDuration = 0.0;
}

- (float)position
{
  return self->_position;
}

- (void)setPosition:(float)a3
{
  self->_position = a3;
}

- (float)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(float)a3
{
  self->_velocity = a3;
}

@end
