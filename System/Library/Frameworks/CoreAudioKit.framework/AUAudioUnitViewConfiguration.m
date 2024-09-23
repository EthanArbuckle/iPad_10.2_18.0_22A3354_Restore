@implementation AUAudioUnitViewConfiguration

- (AUAudioUnitViewConfiguration)initWithWidth:(CGFloat)width height:(CGFloat)height hostHasController:(BOOL)hostHasController
{
  AUAudioUnitViewConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewConfiguration;
  result = -[AUAudioUnitViewConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_width = width;
    result->_height = height;
    result->_hostHasController = hostHasController;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  AUAudioUnitViewConfiguration *v4;
  AUAudioUnitViewConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v4 = (AUAudioUnitViewConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AUAudioUnitViewConfiguration width](self, "width");
      v7 = v6;
      -[AUAudioUnitViewConfiguration width](v5, "width");
      if (v7 == v8
        && (-[AUAudioUnitViewConfiguration height](self, "height"),
            v10 = v9,
            -[AUAudioUnitViewConfiguration height](v5, "height"),
            v10 == v11))
      {
        v12 = -[AUAudioUnitViewConfiguration hostHasController](self, "hostHasController");
        v13 = v12 ^ -[AUAudioUnitViewConfiguration hostHasController](v5, "hostHasController") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  return (self->_height + self->_hostHasController) ^ self->_width;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  id v5;

  width = self->_width;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("width"), width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("height"), self->_height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hostHasController, CFSTR("hostHasController"));

}

- (AUAudioUnitViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  AUAudioUnitViewConfiguration *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewConfiguration;
  v5 = -[AUAudioUnitViewConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    v5->_width = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    v5->_height = v7;
    v5->_hostHasController = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hostHasController"));
  }

  return v5;
}

- (CGFloat)width
{
  return self->_width;
}

- (CGFloat)height
{
  return self->_height;
}

- (BOOL)hostHasController
{
  return self->_hostHasController;
}

@end
