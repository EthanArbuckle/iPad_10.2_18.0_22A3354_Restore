@implementation IKLink

- (IKLink)initWithNode:(id)a3
{
  id v5;
  IKLink *v6;
  IKLink *v7;
  double v8;
  double v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKLink;
  v6 = -[IKLink init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_node, a3);
    v7->_position = 0;
    objc_msgSend(v5, "zRotation");
    *(float *)&v8 = v8;
    v7->_angleInitial = *(float *)&v8;
    objc_msgSend(v5, "zRotation");
    *(float *)&v9 = v9;
    v7->_angle = *(float *)&v9;
    v7->_length = 0.0;
  }

  return v7;
}

- (double)normalizeAngle:(double)result
{
  float v3;

  if (result < 0.0 || result > 6.28318531)
  {
    v3 = result / 6.28318531;
    return result - (double)(int)vcvtms_s32_f32(v3) * 6.28318531;
  }
  return result;
}

- (void)rotateByAngle:(float)a3
{
  void *v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  float v11;
  float angleInitial;
  float v13;
  float v14;
  float v15;
  float v16;

  -[SKNode reachConstraints](self->_node, "reachConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKNode reachConstraints](self->_node, "reachConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowerAngleLimit");
    v8 = v7;
    if (v8 < 0.0 || v8 > 6.2832)
      v8 = v8 - (float)((float)(int)floorf(v8 / 6.2832) * 6.2832);

    -[SKNode reachConstraints](self->_node, "reachConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "upperAngleLimit");
    *(float *)&v10 = v10;
    v11 = *(float *)&v10 - v8;
    if ((float)(*(float *)&v10 - v8) < 0.0 || v11 > 6.2832)
      v11 = v11 - (float)((float)(int)floorf(v11 / 6.2832) * 6.2832);

  }
  else
  {
    v8 = 0.0;
    v11 = 6.2832;
  }
  angleInitial = self->_angleInitial;
  v13 = angleInitial - v8;
  if ((float)(angleInitial - v8) < 0.0 || v13 > 6.2832)
    v13 = v13 - (float)((float)(int)floorf(v13 / 6.2832) * 6.2832);
  v14 = (float)(self->_angle + a3) - v8;
  if (v14 < 0.0 || v14 > 6.2832)
    v14 = v14 - (float)((float)(int)floorf(v14 / 6.2832) * 6.2832);
  v15 = 0.0;
  if ((float)(v14 - v11) < (float)(6.2832 - v14))
    v15 = v11;
  if (v14 > v11)
    v14 = v15;
  v16 = v14 - v13;
  if (v11 >= 6.2832)
  {
    if (v16 <= 3.14159265)
    {
      if (v16 <= -3.14159265)
        v16 = v16 + 6.2832;
    }
    else
    {
      v16 = v16 + -6.2832;
    }
  }
  self->_angle = angleInitial + v16;
}

- (SKNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (_GLKVector2)position
{
  return (_GLKVector2)self;
}

- (void)setPosition:(_GLKVector2)a3
{
  float v3;
  float v4;

  self->_position.x = v3;
  self->_position.y = v4;
}

- (float)angleInitial
{
  return self->_angleInitial;
}

- (void)setAngleInitial:(float)a3
{
  self->_angleInitial = a3;
}

- (float)angle
{
  return self->_angle;
}

- (float)length
{
  return self->_length;
}

- (void)setLength:(float)a3
{
  self->_length = a3;
}

- (_GLKVector2)size
{
  return (_GLKVector2)self;
}

- (void)setSize:(_GLKVector2)a3
{
  float v3;
  float v4;

  self->_size.x = v3;
  self->_size.y = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

@end
