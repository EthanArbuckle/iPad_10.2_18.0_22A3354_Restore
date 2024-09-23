@implementation SSHBHIDSmartCoverSample

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
  v12.super_class = (Class)SSHBHIDSmartCoverSample;
  v8 = -[SSHBHIDSmartCoverSample description](&v12, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@"), v9);

  objc_msgSend(v7, "appendFormat:", CFSTR("\nlocation: %d"), -[SSHBHIDSmartCoverSample location](self, "location"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\ndownEvent: %d"), -[SSHBHIDSmartCoverSample isDownEvent](self, "isDownEvent"));
  -[SSHBHIDSmartCoverSample timestamp](self, "timestamp");
  objc_msgSend(v7, "appendFormat:", CFSTR("\ntimestamp: %f"), v10);
  return (NSString *)v7;
}

- (id)csv
{
  uint64_t v3;

  -[SSHBHIDSmartCoverSample timestamp](self, "timestamp");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%d,%d"), v3, -[SSHBHIDSmartCoverSample location](self, "location"), -[SSHBHIDSmartCoverSample isDownEvent](self, "isDownEvent"));
}

- (unsigned)location
{
  return self->_location;
}

- (void)setLocation:(unsigned int)a3
{
  self->_location = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)isDownEvent
{
  return self->_isDownEvent;
}

- (void)setIsDownEvent:(BOOL)a3
{
  self->_isDownEvent = a3;
}

@end
