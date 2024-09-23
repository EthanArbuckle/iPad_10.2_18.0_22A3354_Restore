@implementation ARCoachingBasicSpring

- (float)output
{
  return self->_position;
}

- (float)input
{
  return self->_target;
}

- (void)setInput:(float)a3
{
  self->_target = a3;
}

- (ARCoachingBasicSpring)initWithTension:(float)a3 friction:(float)a4
{
  ARCoachingBasicSpring *v6;
  double v7;
  ARCoachingBasicSpring *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARCoachingBasicSpring;
  v6 = -[ARCoachingBasicSpring init](&v11, sel_init);
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = a3;
    -[ARCoachingBasicSpring setTension:](v6, "setTension:", v7);
    *(float *)&v9 = a4;
    -[ARCoachingBasicSpring setFriction:](v8, "setFriction:", v9);
    *(_QWORD *)&v8->_target = 0;
    v8->_position = 0.0;
  }
  return v8;
}

- (void)stepWithDeltaTime:(double)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  -[ARCoachingBasicSpring tension](self, "tension");
  v6 = v5;
  v7 = self->_position - self->_target;
  -[ARCoachingBasicSpring friction](self, "friction");
  v9 = self->_velocity + (float)((float)-(float)(v8 * self->_velocity) - (float)(v6 * v7)) * a3;
  v10 = self->_position + v9 * a3;
  self->_velocity = v9;
  self->_position = v10;
}

- (void)setInput:(float)a3 velocity:(float)a4
{
  self->_velocity = a4;
  self->_position = a3;
  self->_target = a3;
}

- (float)tension
{
  return self->_tension;
}

- (void)setTension:(float)a3
{
  self->_tension = a3;
}

- (float)friction
{
  return self->_friction;
}

- (void)setFriction:(float)a3
{
  self->_friction = a3;
}

@end
