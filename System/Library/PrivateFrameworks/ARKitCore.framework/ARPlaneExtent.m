@implementation ARPlaneExtent

- (ARPlaneExtent)init
{
  ARPlaneExtent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARPlaneExtent;
  result = -[ARPlaneExtent init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_rotationOnYAxis = 0xBF80000000000000;
    result->_height = -1.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float rotationOnYAxis;
  double v5;
  double v6;
  double v7;
  id v8;

  rotationOnYAxis = self->_rotationOnYAxis;
  v8 = a3;
  *(float *)&v5 = rotationOnYAxis;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("rotationOnYAxis"), v5);
  *(float *)&v6 = self->_width;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("width"), v6);
  *(float *)&v7 = self->_height;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("height"), v7);

}

- (ARPlaneExtent)initWithCoder:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotationOnYAxis"));
  self->_rotationOnYAxis = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("width"));
  self->_width = v6;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("height"));
  v8 = v7;

  self->_height = v8;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (float *)v4;
    v6 = vabds_f32(self->_rotationOnYAxis, v5[2]) < 0.00000011921
      && vabds_f32(self->_width, v5[3]) < 0.00000011921
      && vabds_f32(self->_height, v5[4]) < 0.00000011921;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  int v5;
  int v6;
  int v7;

  v4 = (_DWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARPlaneExtent rotationOnYAxis](self, "rotationOnYAxis");
  v4[2] = v5;
  -[ARPlaneExtent width](self, "width");
  v4[3] = v6;
  -[ARPlaneExtent height](self, "height");
  v4[4] = v7;
  return v4;
}

- (float)rotationOnYAxis
{
  return self->_rotationOnYAxis;
}

- (void)setRotationOnYAxis:(float)a3
{
  self->_rotationOnYAxis = a3;
}

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

@end
