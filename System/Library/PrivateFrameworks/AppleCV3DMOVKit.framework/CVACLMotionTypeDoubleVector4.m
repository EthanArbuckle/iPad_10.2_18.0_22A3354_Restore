@implementation CVACLMotionTypeDoubleVector4

- (CVACLMotionTypeDoubleVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CVACLMotionTypeDoubleVector4 *v12;
  CVACLMotionTypeDoubleVector4 *v13;
  objc_super v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v15.receiver = self;
  v15.super_class = (Class)CVACLMotionTypeDoubleVector4;
  v12 = -[CVACLMotionTypeDoubleVector4 init](&v15, sel_init, a3);
  if (v12 == self)
  {
    -[CVACLMotionTypeDoubleVector4 setX:](self, "setX:", v10);
    -[CVACLMotionTypeDoubleVector4 setY:](self, "setY:", v9);
    -[CVACLMotionTypeDoubleVector4 setZ:](self, "setZ:", v8);
    -[CVACLMotionTypeDoubleVector4 setW:](self, "setW:", v7);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)w
{
  return self->_w;
}

- (void)setW:(double)a3
{
  self->_w = a3;
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
