@implementation SSHBHIDMotionSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  -[SSHBHIDMotionSample timestamp](self, "timestamp");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nt: %f"), v8);
  -[SSHBHIDMotionSample x](self, "x");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nx: %f"), v9);
  -[SSHBHIDMotionSample y](self, "y");
  objc_msgSend(v7, "appendFormat:", CFSTR("\ny: %f"), v10);
  -[SSHBHIDMotionSample z](self, "z");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nz: %f"), v11);
  objc_msgSend(v7, "appendFormat:", CFSTR("\ns: %u"), -[SSHBHIDMotionSample sequence](self, "sequence"));
  return (NSString *)v7;
}

- (id)csv
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;

  -[SSHBHIDMotionSample timestamp](self, "timestamp");
  v4 = v3;
  -[SSHBHIDMotionSample x](self, "x");
  v6 = v5;
  -[SSHBHIDMotionSample y](self, "y");
  v8 = v7;
  -[SSHBHIDMotionSample z](self, "z");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f,%f,%f,%d"), v4, *(_QWORD *)&v6, *(_QWORD *)&v8, v9, -[SSHBHIDMotionSample sequence](self, "sequence"));
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (float)z
{
  return self->_z;
}

- (void)setZ:(float)a3
{
  self->_z = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unsigned int)a3
{
  self->_subtype = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

@end
