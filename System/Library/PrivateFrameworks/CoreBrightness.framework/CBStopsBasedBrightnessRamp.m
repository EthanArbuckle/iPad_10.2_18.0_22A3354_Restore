@implementation CBStopsBasedBrightnessRamp

- (CBStopsBasedBrightnessRamp)initWithStartingBrightness:(float)a3 targetBrightness:(float)a4 rampSpeed:(float)a5 andCurrentTime:(float)a6
{
  float v6;
  float v7;
  objc_super v9;
  float v10;
  float v11;
  float v12;
  float v13;
  SEL v14;
  CBStopsBasedBrightnessRamp *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  v11 = a5;
  v10 = a6;
  v9.receiver = self;
  v9.super_class = (Class)CBStopsBasedBrightnessRamp;
  v15 = -[CBStopsBasedBrightnessRamp init](&v9, sel_init);
  if (!v15)
    return 0;
  if (v13 == 0.0 || v11 == 0.0 || v13 == v12)
  {

    v15 = 0;
    return 0;
  }
  else
  {
    v15->_start = v13;
    v15->_target = v12;
    v15->_current = v13;
    v15->_rampSpeed = v11;
    v6 = log2f(v15->_target / v15->_start);
    v7 = fabs(v6) * v15->_rampSpeed;
    v15->_rampTime = v7;
    v15->_startTime = v10;
    v15->_timeOfLastUpdate = v10;
    return v15;
  }
}

- (float)currentBrightness
{
  return self->_current;
}

- (float)timeOfLastUpdate
{
  return self->_timeOfLastUpdate;
}

- (int)updateRampWithTimestamp:(float)a3
{
  double v3;

  *(float *)&v3 = (float)(a3 - self->_startTime) / self->_rampTime;
  return -[CBStopsBasedBrightnessRamp updateRampWithProgress:](self, "updateRampWithProgress:", v3);
}

- (int)updateRampWithProgress:(float)a3
{
  float start;
  float v5;
  float v6;

  if (a3 >= 1.0)
  {
    self->_current = self->_target;
    return 1;
  }
  else
  {
    v6 = a3 * self->_rampTime;
    self->_timeOfLastUpdate = self->_startTime + v6;
    v5 = 2.0;
    if (self->_start > self->_target)
      v5 = 1.0 / 2.0;
    start = self->_start;
    self->_current = start * powf(v5, v6 / self->_rampSpeed);
    return 0;
  }
}

- (float)target
{
  return self->_target;
}

@end
