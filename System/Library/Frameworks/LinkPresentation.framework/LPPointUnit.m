@implementation LPPointUnit

- (LPPointUnit)initWithValue:(double)a3
{
  LPPointUnit *v4;
  LPPointUnit *v5;
  LPPointUnit *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPPointUnit;
  v4 = -[LPPointUnit init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)zero
{
  void *v2;
  LPPointUnit *v3;
  void *v4;

  v2 = (void *)zero_zeroPoint;
  if (!zero_zeroPoint)
  {
    v3 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 0.0);
    v4 = (void *)zero_zeroPoint;
    zero_zeroPoint = (uint64_t)v3;

    v2 = (void *)zero_zeroPoint;
  }
  return v2;
}

- (id)_lp_CSSText
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LPPointUnit value](self, "value");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%gpx"), v3);
}

- (id)_lp_HTMLAttributeText
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LPPointUnit value](self, "value");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%g"), v3);
}

- (double)value
{
  return self->_value;
}

@end
