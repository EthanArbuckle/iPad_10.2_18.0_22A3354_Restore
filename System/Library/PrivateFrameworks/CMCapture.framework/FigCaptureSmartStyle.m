@implementation FigCaptureSmartStyle

+ (FigCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  return (FigCaptureSmartStyle *)-[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:]([FigCaptureSmartStyle alloc], a3, a4, a5, a6);
}

- (float)_initWithCast:(float)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:
{
  float *v9;
  float *v10;
  const __CFString *v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)FigCaptureSmartStyle;
  v9 = (float *)objc_msgSendSuper2(&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = CFSTR("intensity must be between 0.0 and 1.0");
    if (a3 >= 0.0 && a4 <= 1.0)
    {
      if (a4 < -1.0)
      {
        v11 = CFSTR("toneBias must be between -1.0 and 1.0");
      }
      else
      {
        v11 = CFSTR("colorBias must be between -1.0 and 1.0");
        if (a5 >= -1.0 && a5 <= 1.0)
        {
          *((_QWORD *)v9 + 1) = objc_msgSend(a2, "copy");
          v10[4] = a3;
          v10[5] = a4;
          v10[6] = a5;
          *((_QWORD *)v10 + 4) = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a3 * 10000.0) ^ (unint64_t)(float)(a5 * 10000.0);
          return v10;
        }
      }
    }

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  return v10;
}

+ (id)identityStyle
{
  FigCaptureSmartStyle *v2;
  __CFString *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = [FigCaptureSmartStyle alloc];
  if (v2)
  {
    v3 = FigSmartStyleCastTypeStandard;
    v6.receiver = v2;
    v6.super_class = (Class)FigCaptureSmartStyle;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
    {
      v4[1] = -[__CFString copy](v3, "copy");
      v4[2] = 1065353216;
      *((_DWORD *)v4 + 6) = 0;
      v4[4] = 10000;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSmartStyle;
  -[FigCaptureSmartStyle dealloc](&v3, sel_dealloc);
}

- (FigCaptureSmartStyle)initWithXPCEncoding:(id)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(a3, "cast"));
  v6 = xpc_dictionary_get_double(a3, "intensity");
  v7 = xpc_dictionary_get_double(a3, "toneBias");
  v8 = xpc_dictionary_get_double(a3, "colorBias");
  return (FigCaptureSmartStyle *)-[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](self, v5, v6, v7, v8);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cast", -[NSString UTF8String](self->_cast, "UTF8String"));
  xpc_dictionary_set_double(v3, "intensity", self->_intensity);
  xpc_dictionary_set_double(v3, "toneBias", self->_toneBias);
  xpc_dictionary_set_double(v3, "colorBias", self->_colorBias);
  return v3;
}

- (FigCaptureSmartStyle)initWithCoder:(id)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cast"));
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intensity"));
  v7 = v6;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias"));
  v9 = v8;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorBias"));
  return (FigCaptureSmartStyle *)-[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](self, v5, v7, v9, v10);
}

- (void)encodeWithCoder:(id)a3
{
  float intensity;
  uint64_t v6;
  double v7;
  float toneBias;
  uint64_t v9;
  double v10;
  float colorBias;
  uint64_t v12;
  double v13;

  objc_msgSend(a3, "encodeObject:forKey:", self->_cast, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cast"));
  intensity = self->_intensity;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intensity");
  *(float *)&v7 = intensity;
  objc_msgSend(a3, "encodeFloat:forKey:", v6, v7);
  toneBias = self->_toneBias;
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias");
  *(float *)&v10 = toneBias;
  objc_msgSend(a3, "encodeFloat:forKey:", v9, v10);
  colorBias = self->_colorBias;
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorBias");
  *(float *)&v13 = colorBias;
  objc_msgSend(a3, "encodeFloat:forKey:", v12, v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    v5 = -[NSString isEqualToString:](-[FigCaptureSmartStyle cast](self, "cast"), "isEqualToString:", objc_msgSend(a3, "cast"));
    if (v5)
    {
      -[FigCaptureSmartStyle intensity](self, "intensity");
      v7 = v6;
      objc_msgSend(a3, "intensity");
      if (v7 != v8)
        goto LABEL_6;
      -[FigCaptureSmartStyle toneBias](self, "toneBias");
      v10 = v9;
      objc_msgSend(a3, "toneBias");
      if (v10 != v11)
        goto LABEL_6;
      -[FigCaptureSmartStyle colorBias](self, "colorBias");
      v13 = v12;
      objc_msgSend(a3, "colorBias");
      LOBYTE(v5) = v13 == v14;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FigCaptureSmartStyle *v4;
  NSString *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  v4 = [FigCaptureSmartStyle alloc];
  v5 = -[FigCaptureSmartStyle cast](self, "cast");
  -[FigCaptureSmartStyle intensity](self, "intensity");
  v7 = v6;
  -[FigCaptureSmartStyle toneBias](self, "toneBias");
  v9 = v8;
  -[FigCaptureSmartStyle colorBias](self, "colorBias");
  return -[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](v4, v5, v7, v9, v10);
}

- (BOOL)isIdentity
{
  _BOOL4 v3;

  v3 = -[NSString isEqualToString:](self->_cast, "isEqualToString:", FigSmartStyleCastTypeStandard);
  if (v3)
    LOBYTE(v3) = self->_toneBias == 0.0 && self->_colorBias == 0.0;
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  double v3;
  double v4;
  double v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cast");
  v8[0] = (id)-[NSString copy](self->_cast, "copy");
  v7[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intensity");
  *(float *)&v3 = self->_intensity;
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v7[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias");
  *(float *)&v4 = self->_toneBias;
  v8[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorBias");
  *(float *)&v5 = self->_colorBias;
  v8[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
}

+ (id)createFromDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cast"));
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intensity"));
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias"));
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorBias"));
  if (!v11)
    return 0;
  v12 = (void *)v11;
  objc_msgSend(v8, "floatValue");
  v14 = v13;
  objc_msgSend(v10, "floatValue");
  v16 = v15;
  objc_msgSend(v12, "floatValue");
  LODWORD(v18) = v17;
  LODWORD(v19) = v14;
  LODWORD(v20) = v16;
  return (id)objc_msgSend(a1, "styleWithCast:intensity:toneBias:colorBias:", v6, v19, v20, v18);
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cast:%@ intensity:%.3f toneBias:%.3f colorBias:%.3f"), self->_cast, self->_intensity, self->_toneBias, self->_colorBias);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureSmartStyle debugDescription](self, "debugDescription"));
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

@end
