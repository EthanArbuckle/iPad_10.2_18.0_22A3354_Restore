@implementation FigCaptureSemanticStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_double(v3, "toneBias", self->_toneBias);
  xpc_dictionary_set_double(v3, "warmthBias", self->_warmthBias);
  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("toneBias:%.3f warmthBias:%.3f (mappedToneBias: %.3f, mappedWarmthBias: %.3f)"), self->_toneBias, self->_warmthBias, self->_mappedToneBias, self->_mappedWarmthBias);
}

- (BOOL)isEqual:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[FigCaptureSemanticStyle toneBias](self, "toneBias");
  v6 = v5;
  objc_msgSend(a3, "toneBias");
  if (v6 != v7)
    return 0;
  -[FigCaptureSemanticStyle warmthBias](self, "warmthBias");
  v10 = v9;
  objc_msgSend(a3, "warmthBias");
  return v10 == v11;
}

- (float)warmthBias
{
  return self->_warmthBias;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (FigCaptureSemanticStyle)initWithCoder:(id)a3
{
  float v5;
  float v6;
  float v7;

  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias"));
  v6 = v5;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "warmthBias"));
  return (FigCaptureSemanticStyle *)-[FigCaptureSemanticStyle _initWithToneBias:warmthBias:](self, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  float toneBias;
  uint64_t v6;
  double v7;
  float warmthBias;
  uint64_t v9;
  double v10;

  toneBias = self->_toneBias;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toneBias");
  *(float *)&v7 = toneBias;
  objc_msgSend(a3, "encodeFloat:forKey:", v6, v7);
  warmthBias = self->_warmthBias;
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "warmthBias");
  *(float *)&v10 = warmthBias;
  objc_msgSend(a3, "encodeFloat:forKey:", v9, v10);
}

- (BOOL)isIdentity
{
  return self->_toneBias == 0.0 && self->_warmthBias == 0.0;
}

+ (FigCaptureSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4
{
  return (FigCaptureSemanticStyle *)-[FigCaptureSemanticStyle _initWithToneBias:warmthBias:]([FigCaptureSemanticStyle alloc], a3, a4);
}

- (id)_initWithToneBias:(float)a3 warmthBias:
{
  float v7;
  float v8;
  float v9;
  float v10;
  const __CFString *v11;
  objc_super v12;

  if (!result)
    return result;
  v12.receiver = result;
  v12.super_class = (Class)FigCaptureSemanticStyle;
  result = objc_msgSendSuper2(&v12, sel_init);
  if (!result)
    return result;
  if (a2 < -1.0 || a2 > 1.0)
  {
    v11 = CFSTR("toneBias must be between -1.0 and 1.0");
    goto LABEL_29;
  }
  if (a3 < -1.0 || a3 > 1.0)
  {
    v11 = CFSTR("warmthBias must be between -1.0 and 1.0");
LABEL_29:

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  *((float *)result + 2) = a2;
  *((float *)result + 4) = a3;
  if (a2 <= 0.0)
  {
    v8 = 0.0;
    v7 = 1.0;
  }
  else
  {
    v7 = 1.3333;
    if (a2 > 0.5)
      v7 = 0.66667;
    v8 = 0.33333;
    if (a2 <= 0.5)
      v8 = 0.0;
  }
  *((float *)result + 3) = v8 + (float)(v7 * a2);
  if (a3 <= -0.5)
  {
    v9 = 0.3;
    v10 = 1.3;
  }
  else if (a3 > 0.0)
  {
    v10 = *(float *)"333?cnpm";
    if (a3 > 0.5)
      v10 = 1.3;
    v9 = -0.3;
    if (a3 <= 0.5)
      v9 = 0.0;
  }
  else
  {
    v9 = 0.0;
    v10 = *(float *)"333?cnpm";
  }
  *((float *)result + 5) = v9 + (float)(v10 * a3);
  *((_QWORD *)result + 3) = (unint64_t)(float)(a3 * 10000.0) ^ (unint64_t)(float)(a2 * 10000.0);
  return result;
}

- (FigCaptureSemanticStyle)initWithXPCEncoding:(id)a3
{
  float v5;
  float v6;

  v5 = xpc_dictionary_get_double(a3, "toneBias");
  v6 = xpc_dictionary_get_double(a3, "warmthBias");
  return (FigCaptureSemanticStyle *)-[FigCaptureSemanticStyle _initWithToneBias:warmthBias:](self, v5, v6);
}

+ (id)identityStyle
{
  FigCaptureSemanticStyle *v2;
  objc_super v4;

  v2 = [FigCaptureSemanticStyle alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)FigCaptureSemanticStyle;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
    {
      *(_QWORD *)&v2->_toneBias = 0;
      *(_QWORD *)&v2->_warmthBias = 0;
      v2->_hash = 0;
    }
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureSemanticStyle debugDescription](self, "debugDescription"));
}

- (unint64_t)hash
{
  return self->_hash;
}

- (float)mappedToneBias
{
  return self->_mappedToneBias;
}

- (float)mappedWarmthBias
{
  return self->_mappedWarmthBias;
}

@end
