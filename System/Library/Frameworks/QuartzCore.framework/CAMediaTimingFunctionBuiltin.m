@implementation CAMediaTimingFunctionBuiltin

- (void)_getPoints:(double *)a3
{
  float32x2_t *v3;

  v3 = (float32x2_t *)((char *)&function_values + 16 * self->_index);
  *(float64x2_t *)a3 = vcvtq_f64_f32(*v3);
  a3[2] = v3[1].f32[0];
  a3[3] = 1.0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t index;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  index = self->_index;
  if (index < 5)
    return (id)*((_QWORD *)&off_1E159CE98 + index);
  v4.receiver = self;
  v4.super_class = (Class)CAMediaTimingFunctionBuiltin;
  return -[CAMediaTimingFunction description](&v4, sel_description);
}

- (CAMediaTimingFunctionBuiltin)initWithCoder:(id)a3
{
  unsigned int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("index")))
  {
    v5 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("index"));

    return builtin_function(v5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMediaTimingFunctionBuiltin;
    return -[CAMediaTimingFunction initWithCoder:](&v7, sel_initWithCoder_, a3);
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  objc_msgSend(a3, "setElementContent:", -[CAMediaTimingFunctionBuiltin description](self, "description"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
