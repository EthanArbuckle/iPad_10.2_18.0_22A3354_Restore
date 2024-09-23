@implementation CBALSHotspotLocation

- (id)description
{
  float v2;
  float v3;
  double v5;
  id v6;
  SEL v7;
  CBALSHotspotLocation *v8;

  v8 = self;
  v7 = a2;
  v6 = (id)MEMORY[0x1E0CB3940];
  -[CBALSHotspotLocation x](self, "x");
  v5 = v2;
  -[CBALSHotspotLocation y](v8, "y");
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("x:%f y:%f"), *(_QWORD *)&v5, v3);
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

@end
