@implementation SSHBHIDAtmosphericPressureSensorSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  float v9;
  uint64_t v10;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  -[SSHBHIDAtmosphericPressureSensorSample timestamp](self, "timestamp");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nt: %f"), v8);
  -[SSHBHIDAtmosphericPressureSensorSample level](self, "level");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nlevel: %f"), v9);
  objc_msgSend(v7, "appendFormat:", CFSTR("\nsequence: %u"), -[SSHBHIDAtmosphericPressureSensorSample sequence](self, "sequence"));
  -[SSHBHIDAtmosphericPressureSensorSample temperature](self, "temperature");
  objc_msgSend(v7, "appendFormat:", CFSTR("\ntemperature: %f"), v10);
  return (NSString *)v7;
}

- (id)csv
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  -[SSHBHIDAtmosphericPressureSensorSample timestamp](self, "timestamp");
  v4 = v3;
  -[SSHBHIDAtmosphericPressureSensorSample level](self, "level");
  v6 = v5;
  v7 = -[SSHBHIDAtmosphericPressureSensorSample sequence](self, "sequence");
  -[SSHBHIDAtmosphericPressureSensorSample temperature](self, "temperature");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f,%u,%f"), v4, *(_QWORD *)&v6, v7, v8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

@end
