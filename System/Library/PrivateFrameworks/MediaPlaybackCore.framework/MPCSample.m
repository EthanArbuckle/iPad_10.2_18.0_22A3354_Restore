@implementation MPCSample

- (MPCSample)initWithLevel:(double)a3 time:(double)a4 state:(int64_t)a5
{
  MPCSample *result;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPCSample;
  result = -[MPCSample init](&v10, sel_init);
  v9 = initWithLevel_time_state__number;
  if (result)
  {
    result->_level = a3;
    result->_time = a4;
    result->_number = v9;
    result->_state = a5;
  }
  initWithLevel_time_state__number = v9 + 1;
  return result;
}

- (void)setThermalLevel:(int)a3
{
  self->_thermalLevel = a3;
}

- (int)number
{
  return self->_number;
}

- (double)level
{
  return self->_level;
}

- (double)time
{
  return self->_time;
}

- (int64_t)state
{
  return self->_state;
}

- (int)thermalLevel
{
  return self->_thermalLevel;
}

@end
