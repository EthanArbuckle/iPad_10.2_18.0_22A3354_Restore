@implementation SKRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRange)init
{
  return -[SKRange initWithLowerLimit:upperLimit:](self, "initWithLowerLimit:upperLimit:", -1.79769313e308, 1.79769313e308);
}

- (SKRange)initWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper
{
  SKRange *v6;
  SKRange *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKRange;
  v6 = -[SKRange init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SKRange setLowerLimit:](v6, "setLowerLimit:", lower);
    -[SKRange setUpperLimit:](v7, "setUpperLimit:", upper);
  }
  return v7;
}

- (SKRange)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  SKRange *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_lowerLimit"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_upperLimit"));
  v8 = -[SKRange initWithLowerLimit:upperLimit:](self, "initWithLowerLimit:upperLimit:", v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SKRange lowerLimit](self, "lowerLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_lowerLimit"));
  -[SKRange upperLimit](self, "upperLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_upperLimit"));

}

+ (SKRange)rangeWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper
{
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", lower, upper);
}

+ (SKRange)rangeWithNoLimits
{
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", -1.79769313e308, 1.79769313e308);
}

+ (SKRange)rangeWithLowerLimit:(CGFloat)lower
{
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", lower, 1.79769313e308);
}

+ (SKRange)rangeWithUpperLimit:(CGFloat)upper
{
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", -1.79769313e308, upper);
}

+ (SKRange)rangeWithConstantValue:(CGFloat)value
{
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", value, value);
}

+ (SKRange)rangeWithValue:(CGFloat)value variance:(CGFloat)variance
{
  double v4;

  v4 = fabs(variance);
  return (SKRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerLimit:upperLimit:", value - v4, v4 + value);
}

- (id)description
{
  double v3;
  __CFString *v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  __CFString *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[SKRange lowerLimit](self, "lowerLimit");
  if (v3 == 1.79769313e308)
  {
    v4 = CFSTR("inf");
  }
  else
  {
    -[SKRange lowerLimit](self, "lowerLimit");
    if (v5 == -1.79769313e308)
    {
      v4 = CFSTR("-inf");
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[SKRange lowerLimit](self, "lowerLimit");
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%.2f"), v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[SKRange upperLimit](self, "upperLimit");
  if (v8 == 1.79769313e308)
  {
    v9 = CFSTR("inf");
  }
  else
  {
    -[SKRange upperLimit](self, "upperLimit");
    if (v10 == -1.79769313e308)
    {
      v9 = CFSTR("-inf");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[SKRange upperLimit](self, "upperLimit");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%.2f"), v12);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SKRange> lowerLimit:%@ upperLimit:%@"), v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4;
  double v5;
  double v6;

  -[SKRange lowerLimit](self, "lowerLimit", a3);
  v5 = v4;
  -[SKRange upperLimit](self, "upperLimit");
  +[SKRange rangeWithLowerLimit:upperLimit:](SKRange, "rangeWithLowerLimit:upperLimit:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqualToRange:(id)a3
{
  return 1;
}

- (CGFloat)lowerLimit
{
  return self->_lowerLimit;
}

- (void)setLowerLimit:(CGFloat)lowerLimit
{
  self->_lowerLimit = lowerLimit;
}

- (CGFloat)upperLimit
{
  return self->_upperLimit;
}

- (void)setUpperLimit:(CGFloat)upperLimit
{
  self->_upperLimit = upperLimit;
}

@end
