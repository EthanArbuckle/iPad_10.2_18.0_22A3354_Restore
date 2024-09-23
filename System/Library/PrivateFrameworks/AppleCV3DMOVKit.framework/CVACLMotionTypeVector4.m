@implementation CVACLMotionTypeVector4

- (CVACLMotionTypeVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CVACLMotionTypeVector4 *v12;
  double v13;
  CVACLMotionTypeVector4 *v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v19.receiver = self;
  v19.super_class = (Class)CVACLMotionTypeVector4;
  v12 = -[CVACLMotionTypeVector4 init](&v19, sel_init, a3);
  if (v12 == self)
  {
    *(float *)&v13 = v10;
    -[CVACLMotionTypeVector4 setX:](self, "setX:", v13);
    *(float *)&v15 = v9;
    -[CVACLMotionTypeVector4 setY:](self, "setY:", v15);
    *(float *)&v16 = v8;
    -[CVACLMotionTypeVector4 setZ:](self, "setZ:", v16);
    *(float *)&v17 = v7;
    -[CVACLMotionTypeVector4 setW:](self, "setW:", v17);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (float)w
{
  return self->_w;
}

- (void)setW:(float)a3
{
  self->_w = a3;
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
