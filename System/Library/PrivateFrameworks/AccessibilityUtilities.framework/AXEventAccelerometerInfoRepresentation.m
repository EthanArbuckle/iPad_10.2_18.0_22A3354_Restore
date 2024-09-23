@implementation AXEventAccelerometerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventAccelerometerInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventAccelerometerInfoRepresentation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXEventAccelerometerInfoRepresentation;
  v5 = -[AXEventAccelerometerInfoRepresentation init](&v7, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x"));
    -[AXEventAccelerometerInfoRepresentation setX:](v5, "setX:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y"));
    -[AXEventAccelerometerInfoRepresentation setY:](v5, "setY:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("z"));
    -[AXEventAccelerometerInfoRepresentation setZ:](v5, "setZ:");
    -[AXEventAccelerometerInfoRepresentation setType:](v5, "setType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventAccelerometerInfoRepresentation *v4;

  v4 = objc_alloc_init(AXEventAccelerometerInfoRepresentation);
  -[AXEventAccelerometerInfoRepresentation x](self, "x");
  -[AXEventAccelerometerInfoRepresentation setX:](v4, "setX:");
  -[AXEventAccelerometerInfoRepresentation y](self, "y");
  -[AXEventAccelerometerInfoRepresentation setY:](v4, "setY:");
  -[AXEventAccelerometerInfoRepresentation z](self, "z");
  -[AXEventAccelerometerInfoRepresentation setZ:](v4, "setZ:");
  -[AXEventAccelerometerInfoRepresentation setType:](v4, "setType:", -[AXEventAccelerometerInfoRepresentation type](self, "type"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventAccelerometerInfoRepresentation type](self, "type"), CFSTR("type"));
  -[AXEventAccelerometerInfoRepresentation x](self, "x");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("x"));
  -[AXEventAccelerometerInfoRepresentation y](self, "y");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("y"));
  -[AXEventAccelerometerInfoRepresentation z](self, "z");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("z"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)AXEventAccelerometerInfoRepresentation;
  -[AXEventAccelerometerInfoRepresentation description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventAccelerometerInfoRepresentation x](self, "x");
  v6 = v5;
  -[AXEventAccelerometerInfoRepresentation y](self, "y");
  v8 = v7;
  -[AXEventAccelerometerInfoRepresentation z](self, "z");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%f %f %f]"), v4, *(_QWORD *)&v6, *(_QWORD *)&v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
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

@end
