@implementation QLPXVelocityNumberFilter

+ (id)gestureVelocityFilter
{
  _QWORD *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[14] = 0x3F80624DE0000000;
  v2[15] = 0x3FE8000000000000;
  return v2;
}

- (QLPXVelocityNumberFilter)initWithInput:(double)a3
{
  QLPXVelocityNumberFilter *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLPXVelocityNumberFilter;
  result = -[QLPXNumberFilter initWithInput:](&v4, sel_initWithInput_, a3);
  if (result)
    result->_minimumSampleInterval = 0.00000011920929;
  return result;
}

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double lastTime;
  double v7;
  double velocity;
  double v9;

  -[QLPXNumberFilter input](self, "input");
  v4 = v3;
  -[QLPXNumberFilter currentTime](self, "currentTime");
  lastTime = self->_lastTime;
  if (v5 < lastTime + self->_minimumSampleInterval)
    return self->_filteredVelocity;
  velocity = self->_velocity;
  v9 = (v4 - self->_lastValue) / (v5 - lastTime);
  v7 = velocity * self->_previousVelocityWeight + (1.0 - self->_previousVelocityWeight) * v9;
  self->_lastValue = v4;
  self->_lastTime = v5;
  self->_velocity = v9;
  self->_previousVelocity = velocity;
  self->_filteredVelocity = v7;
  return v7;
}

@end
