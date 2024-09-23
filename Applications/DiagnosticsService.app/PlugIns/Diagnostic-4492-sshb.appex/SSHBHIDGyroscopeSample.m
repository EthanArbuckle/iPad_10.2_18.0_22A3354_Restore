@implementation SSHBHIDGyroscopeSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  v12.receiver = self;
  v12.super_class = (Class)SSHBHIDGyroscopeSample;
  v8 = -[SSHBHIDMotionSample description](&v12, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@"), v9);

  -[SSHBHIDGyroscopeSample temperature](self, "temperature");
  objc_msgSend(v7, "appendFormat:", CFSTR("\ntemperature: %f"), v10);
  return (NSString *)v7;
}

- (id)csv
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSHBHIDGyroscopeSample;
  v3 = -[SSHBHIDMotionSample csv](&v9, "csv");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SSHBHIDGyroscopeSample temperature](self, "temperature");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",%f"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v6));

  return v7;
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
