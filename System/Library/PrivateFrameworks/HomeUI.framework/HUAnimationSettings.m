@implementation HUAnimationSettings

+ (HUAnimationSettings)settingsWithDuration:(double)a3
{
  return (HUAnimationSettings *)objc_msgSend(a1, "settingsWithDuration:curve:", 0, a3);
}

+ (HUAnimationSettings)settingsWithDuration:(double)a3 curve:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(MEMORY[0x1E0CD27D0], "hu_functionWithAnimationCurve:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v7);

  return (HUAnimationSettings *)v6;
}

- (HUAnimationSettings)init
{
  HUAnimationSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnimationSettings;
  result = -[HUAnimationSettings init](&v3, sel_init);
  if (result)
  {
    result->_duration = 0.25;
    result->_speed = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HUAnimationSettings *v4;
  void *v5;

  v4 = -[HUAnimationSettings init](+[HUAnimationSettings allocWithZone:](HUAnimationSettings, "allocWithZone:", a3), "init");
  -[HUAnimationSettings duration](self, "duration");
  -[HUAnimationSettings setDuration:](v4, "setDuration:");
  -[HUAnimationSettings timingFunction](self, "timingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnimationSettings setTimingFunction:](v4, "setTimingFunction:", v5);

  -[HUAnimationSettings speed](self, "speed");
  -[HUAnimationSettings setSpeed:](v4, "setSpeed:");
  -[HUAnimationSettings delay](self, "delay");
  -[HUAnimationSettings setDelay:](v4, "setDelay:");
  -[HUAnimationSettings repeatCount](self, "repeatCount");
  -[HUAnimationSettings setRepeatCount:](v4, "setRepeatCount:");
  return v4;
}

- (void)setSpeed:(double)a3
{
  void *v6;

  if (a3 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnimationSettings.m"), 78, CFSTR("Speed must be a non-zero value"));

  }
  self->_speed = a3;
}

- (double)durationWithSpeed
{
  double v3;
  double v4;
  double v5;

  -[HUAnimationSettings duration](self, "duration");
  v4 = v3;
  -[HUAnimationSettings speed](self, "speed");
  return v4 / v5;
}

- (double)interpolatedProgressForProgress:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  float v8;

  -[HUAnimationSettings timingFunction](self, "timingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUAnimationSettings timingFunction](self, "timingFunction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = a3;
    objc_msgSend(v6, "_solveForInput:", v7);
    a3 = v8;

  }
  return a3;
}

- (double)interpolatedProgressForTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[HUAnimationSettings duration](self, "duration");
  v6 = v5;
  v7 = 1.0;
  if (v6 >= 0.00000011920929)
  {
    -[HUAnimationSettings durationWithSpeed](self, "durationWithSpeed", 1.0);
    v7 = a3 / v8;
  }
  -[HUAnimationSettings interpolatedProgressForProgress:](self, "interpolatedProgressForProgress:", v7);
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnimationSettings duration](self, "duration");
  objc_msgSend(v5, "setDuration:");
  -[HUAnimationSettings delay](self, "delay");
  objc_msgSend(v5, "setBeginTime:");
  -[HUAnimationSettings speed](self, "speed");
  *(float *)&v6 = v6;
  objc_msgSend(v5, "setSpeed:", v6);
  -[HUAnimationSettings repeatCount](self, "repeatCount");
  objc_msgSend(v5, "setRepeatCount:");
  return v5;
}

- (id)settingsSpedUpByFactor:(double)a3
{
  void *v4;
  double v5;

  v4 = (void *)-[HUAnimationSettings copy](self, "copy");
  objc_msgSend(v4, "speed");
  objc_msgSend(v4, "setSpeed:", v5 * a3);
  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)speed
{
  return self->_speed;
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
