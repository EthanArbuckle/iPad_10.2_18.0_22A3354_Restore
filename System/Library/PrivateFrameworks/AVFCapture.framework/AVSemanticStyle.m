@implementation AVSemanticStyle

- (float)warmthBias
{
  return self->_warmthBias;
}

- (float)toneBias
{
  return self->_toneBias;
}

+ (AVSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4
{
  id v6;
  double v7;
  double v8;

  v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&v7 = a3;
  *(float *)&v8 = a4;
  return (AVSemanticStyle *)(id)objc_msgSend(v6, "_initWithToneBias:warmthBias:", v7, v8);
}

- (id)_initWithToneBias:(float)a3 warmthBias:(float)a4
{
  id result;
  void *v8;
  uint64_t v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVSemanticStyle;
  result = -[AVSemanticStyle init](&v12, sel_init);
  if (result)
  {
    if (a3 < -1.0 || a3 > 1.0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
    }
    else
    {
      if (a4 >= -1.0 && a4 <= 1.0)
      {
        *((float *)result + 2) = a3;
        *((float *)result + 3) = a4;
        *((_QWORD *)result + 2) = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a3 * 10000.0);
        return result;
      }
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
    }
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
    return 0;
  }
  return result;
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
  -[AVSemanticStyle toneBias](self, "toneBias");
  v6 = v5;
  objc_msgSend(a3, "toneBias");
  if (v6 != v7)
    return 0;
  -[AVSemanticStyle warmthBias](self, "warmthBias");
  v10 = v9;
  objc_msgSend(a3, "warmthBias");
  return v10 == v11;
}

+ (id)identityStyle
{
  id v2;
  double v3;
  double v4;

  v2 = objc_alloc((Class)objc_opt_class());
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  return (id)objc_msgSend(v2, "_initWithToneBias:warmthBias:", v3, v4);
}

- (float)sceneBias
{
  return self->_toneBias;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("toneBias:%.3f warmthBias:%.3f"), self->_toneBias, self->_warmthBias);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVSemanticStyle debugDescription](self, "debugDescription"));
}

- (unint64_t)hash
{
  return self->_hash;
}

- (float)subjectBias
{
  return self->_subjectBias;
}

@end
