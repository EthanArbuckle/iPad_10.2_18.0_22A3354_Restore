@implementation MRColorComponents

- (MRColorComponents)initWithProtobuf:(id)a3
{
  id v4;
  MRColorComponents *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  MRColorComponents *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRColorComponents;
    v5 = -[MRColorComponents init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "red");
      v5->_red = v6;
      objc_msgSend(v4, "green");
      v5->_green = v7;
      objc_msgSend(v4, "blue");
      v5->_blue = v8;
      objc_msgSend(v4, "alpha");
      v5->_alpha = v9;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MRColorProtobuf)protobuf
{
  _MRColorProtobuf *v3;

  v3 = objc_alloc_init(_MRColorProtobuf);
  -[MRColorComponents red](self, "red");
  -[_MRColorProtobuf setRed:](v3, "setRed:");
  -[MRColorComponents green](self, "green");
  -[_MRColorProtobuf setGreen:](v3, "setGreen:");
  -[MRColorComponents blue](self, "blue");
  -[_MRColorProtobuf setBlue:](v3, "setBlue:");
  -[MRColorComponents alpha](self, "alpha");
  -[_MRColorProtobuf setAlpha:](v3, "setAlpha:");
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRColorComponents red](self, "red");
  v6 = v5;
  -[MRColorComponents green](self, "green");
  v8 = v7;
  -[MRColorComponents blue](self, "blue");
  v10 = v9;
  -[MRColorComponents alpha](self, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p red = %f, green = %f, blue = %f, alpha = %f>"), v4, self, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10, v11);
}

- (BOOL)isEqual:(id)a3
{
  MRColorComponents *v4;
  MRColorComponents *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v17;
  float v18;
  float v19;

  v4 = (MRColorComponents *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRColorComponents red](v5, "red");
      v7 = v6;
      -[MRColorComponents red](self, "red");
      if (vabds_f32(v7, v8) <= 0.00000011921
        && (-[MRColorComponents green](v5, "green"),
            v10 = v9,
            -[MRColorComponents green](self, "green"),
            vabds_f32(v10, v11) <= 0.00000011921)
        && (-[MRColorComponents blue](v5, "blue"),
            v13 = v12,
            -[MRColorComponents blue](self, "blue"),
            vabds_f32(v13, v14) <= 0.00000011921))
      {
        -[MRColorComponents alpha](v5, "alpha");
        v18 = v17;
        -[MRColorComponents alpha](self, "alpha");
        v15 = vabds_f32(v18, v19) <= 0.00000011921;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRColorComponents red](self, "red");
  objc_msgSend(v4, "setRed:");
  -[MRColorComponents green](self, "green");
  objc_msgSend(v4, "setGreen:");
  -[MRColorComponents blue](self, "blue");
  objc_msgSend(v4, "setBlue:");
  -[MRColorComponents alpha](self, "alpha");
  objc_msgSend(v4, "setAlpha:");
  return v4;
}

- (float)red
{
  return self->_red;
}

- (void)setRed:(float)a3
{
  self->_red = a3;
}

- (float)green
{
  return self->_green;
}

- (void)setGreen:(float)a3
{
  self->_green = a3;
}

- (float)blue
{
  return self->_blue;
}

- (void)setBlue:(float)a3
{
  self->_blue = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

@end
