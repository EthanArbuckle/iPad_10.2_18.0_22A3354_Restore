@implementation AVCaptureSmartStyle

+ (AVCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  id v10;
  double v11;
  double v12;
  double v13;

  v10 = objc_alloc((Class)objc_opt_class());
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  return (AVCaptureSmartStyle *)(id)objc_msgSend(v10, "_initWithCast:intensity:toneBias:colorBias:", a3, v11, v12, v13);
}

- (id)_initWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  AVCaptureSmartStyle *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVCaptureSmartStyle;
  v10 = -[AVCaptureSmartStyle init](&v16, sel_init);
  if (v10)
  {
    if (a5 < -1.0 || a5 > 1.0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
    }
    else if (a4 < 0.0 || a4 > 1.0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
    }
    else
    {
      if (a6 >= -1.0 && a6 <= 1.0)
      {
        v10->_cast = (NSString *)objc_msgSend(a3, "copy");
        v10->_intensity = a4;
        v10->_toneBias = a5;
        v10->_colorBias = a6;
        v10->_hash = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a5 * 10000.0) ^ (unint64_t)(float)(a6 * 10000.0) ^ 0x2710;
        v10->_version = 1;
        return v10;
      }
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
    }
    v14 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return 0;
  }
  return v10;
}

+ (id)identityStyle
{
  id v2;
  double v3;
  double v4;
  double v5;

  v2 = objc_alloc((Class)objc_opt_class());
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  return (id)objc_msgSend(v2, "_initWithCast:intensity:toneBias:colorBias:", AVSmartStyleCastTypeStandard[0], v3, v4, v5);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  int64_t v15;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      LOBYTE(v5) = 0;
      return v5;
    }
    v5 = -[NSString isEqualToString:](-[AVCaptureSmartStyle cast](self, "cast"), "isEqualToString:", objc_msgSend(a3, "cast"));
    if (v5)
    {
      -[AVCaptureSmartStyle intensity](self, "intensity");
      v7 = v6;
      objc_msgSend(a3, "intensity");
      if (v7 != v8)
        goto LABEL_7;
      -[AVCaptureSmartStyle toneBias](self, "toneBias");
      v10 = v9;
      objc_msgSend(a3, "toneBias");
      if (v10 != v11)
        goto LABEL_7;
      -[AVCaptureSmartStyle colorBias](self, "colorBias");
      v13 = v12;
      objc_msgSend(a3, "colorBias");
      if (v13 != v14)
        goto LABEL_7;
      v15 = -[AVCaptureSmartStyle version](self, "version");
      LOBYTE(v5) = v15 == objc_msgSend(a3, "version");
    }
  }
  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cast:%@ intensity:%.3f toneBias:%.3f colorBias:%.3f version:%ld"), self->_cast, self->_intensity, self->_toneBias, self->_colorBias, self->_version);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureSmartStyle debugDescription](self, "debugDescription"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSmartStyle;
  -[AVCaptureSmartStyle dealloc](&v3, sel_dealloc);
}

- (NSString)cast
{
  return self->_cast;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (float)colorBias
{
  return self->_colorBias;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (int64_t)version
{
  return self->_version;
}

@end
