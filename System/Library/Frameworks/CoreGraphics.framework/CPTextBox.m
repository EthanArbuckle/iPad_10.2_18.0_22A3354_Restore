@implementation CPTextBox

- (CPTextBox)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPTextBox;
  return -[CPChunk init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPTextBox;
  return -[CPRegion copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isBoxRegion
{
  return 1;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitTextBox:", self);
}

- (void)setRotationAngle:(double)a3
{
  float v3;

  v3 = a3;
  self->rotationAngle = fmodf(v3, 360.0);
}

- (double)rotationAngle
{
  return self->rotationAngle;
}

- (BOOL)isRotated
{
  double rotationAngle;

  rotationAngle = self->rotationAngle;
  return 360.0 - rotationAngle > 0.1 && rotationAngle > 0.1;
}

- (CGRect)bounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  __double2 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)CPTextBox;
  -[CPChunk bounds](&v17, sel_bounds);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[CPTextBox isRotated](self, "isRotated"))
  {
    v11 = __sincos_stret(self->rotationAngle * 0.0174532925);
    v16.a = v11.__cosval;
    v16.b = v11.__sinval;
    v16.c = -v11.__sinval;
    v16.d = v11.__cosval;
    v16.tx = 0.0;
    v16.ty = 0.0;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectApplyAffineTransform(v18, &v16);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TextBox[%@...]"), objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description"));
}

@end
