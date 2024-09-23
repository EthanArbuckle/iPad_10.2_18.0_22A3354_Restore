@implementation BWSpringSimulation

- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5 convergedSpeed:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  self->_completed = 0;
  self->_updateCount = 0;
  v6 = a4 - a3;
  self->_convergedSpeed = a6;
  self->_inputValue = a3;
  v7 = a6 * 1.1;
  if (a6 * 1.1 >= a5)
    v8 = a6 * 1.1;
  else
    v8 = a5;
  v9 = -v7;
  if (v9 > a5)
    v9 = a5;
  if (v6 >= 0.0)
    v9 = v8;
  v10 = a4 + v6 * self->_tension * 0.02 * -0.02 + v9 * 0.0166666667 / fmax(self->_friction * -0.02 + 1.0, 0.0);
  self->_velocity = v9;
  self->_previousForce = v10;
  self->_outputValue = a4;
}

- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5
{
  -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:convergedSpeed:](self, "resetWithInput:initialOutput:initialVelocity:convergedSpeed:", a3, a4, a5, 0.01);
}

- (BWSpringSimulation)init
{
  BWSpringSimulation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSpringSimulation;
  result = -[BWSpringSimulation init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_tension = xmmword_1A32B0EF0;
    result->_previousForce = 0.0;
    result->_inputValue = 0.0;
    result->_outputValue = 0.0;
  }
  return result;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)update
{
  double convergedSpeed;
  double v3;
  double v4;

  if (!self->_completed)
  {
    convergedSpeed = self->_convergedSpeed;
    v3 = self->_outputValue + (self->_outputValue - self->_inputValue) * self->_tension * 0.02 * -0.02;
    v4 = fmax(self->_friction * -0.02 + 1.0, 0.0) * (v3 - self->_previousForce) / 0.0166666667;
    self->_velocity = v4;
    if (fabs(v4) < convergedSpeed)
      self->_completed = 1;
    self->_previousForce = v3;
    self->_outputValue = v3 + v4 * 0.02;
    ++self->_updateCount;
  }
}

- (int)updateCount
{
  return self->_updateCount;
}

+ (void)initialize
{
  objc_opt_class();
}

- (double)input
{
  return self->_inputValue;
}

- (void)setInput:(double)a3
{
  self->_inputValue = a3;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)output
{
  return self->_outputValue;
}

- (double)velocity
{
  return self->_velocity;
}

@end
