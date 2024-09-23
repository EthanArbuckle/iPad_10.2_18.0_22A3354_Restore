@implementation CVACLMotionTypeVector3

- (CVACLMotionTypeVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CVACLMotionTypeVector3 *v10;
  double v11;
  CVACLMotionTypeVector3 *v12;
  double v13;
  double v14;
  objc_super v16;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v16.receiver = self;
  v16.super_class = (Class)CVACLMotionTypeVector3;
  v10 = -[CVACLMotionTypeVector3 init](&v16, sel_init, a3);
  if (v10 == self)
  {
    *(float *)&v11 = v8;
    -[CVACLMotionTypeVector3 setX:](self, "setX:", v11);
    *(float *)&v13 = v7;
    -[CVACLMotionTypeVector3 setY:](self, "setY:", v13);
    *(float *)&v14 = v6;
    -[CVACLMotionTypeVector3 setZ:](self, "setZ:", v14);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
