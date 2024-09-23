@implementation SSHBHIDTemperatureSensorSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  float v10;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDTemperatureSensorSample identifier](self, "identifier"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nidentifier: %@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDTemperatureSensorSample name](self, "name"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nname: %@"), v9);

  -[SSHBHIDTemperatureSensorSample temperature](self, "temperature");
  objc_msgSend(v7, "appendFormat:", CFSTR("\ntemperature: %f"), v10);
  return (NSString *)v7;
}

- (id)csv
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDTemperatureSensorSample identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDTemperatureSensorSample name](self, "name"));
  -[SSHBHIDTemperatureSensorSample temperature](self, "temperature");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,%@,%f"), v3, v4, v5));

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
