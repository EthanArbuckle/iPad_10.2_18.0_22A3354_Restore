@implementation SSHBHIDHumiditySensorSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  -[SSHBHIDHumiditySensorSample timestamp](self, "timestamp");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nt: %f"), v8);
  objc_msgSend(v7, "appendFormat:", CFSTR("\nsequence: %u"), -[SSHBHIDHumiditySensorSample sequence](self, "sequence"));
  -[SSHBHIDHumiditySensorSample humidity](self, "humidity");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nhumidity: %f"), v9);
  return (NSString *)v7;
}

- (id)csv
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[SSHBHIDHumiditySensorSample timestamp](self, "timestamp");
  v4 = v3;
  v5 = -[SSHBHIDHumiditySensorSample sequence](self, "sequence");
  -[SSHBHIDHumiditySensorSample humidity](self, "humidity");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%u,%f"), v4, v5, v6);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

- (double)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(double)a3
{
  self->_humidity = a3;
}

@end
