@implementation CVACLMotionTypeDoubleVector3

- (CVACLMotionTypeDoubleVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CVACLMotionTypeDoubleVector3 *v10;
  CVACLMotionTypeDoubleVector3 *v11;
  objc_super v13;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v13.receiver = self;
  v13.super_class = (Class)CVACLMotionTypeDoubleVector3;
  v10 = -[CVACLMotionTypeDoubleVector3 init](&v13, sel_init, a3);
  if (v10 == self)
  {
    -[CVACLMotionTypeDoubleVector3 setX:](self, "setX:", v8);
    -[CVACLMotionTypeDoubleVector3 setY:](self, "setY:", v7);
    -[CVACLMotionTypeDoubleVector3 setZ:](self, "setZ:", v6);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
