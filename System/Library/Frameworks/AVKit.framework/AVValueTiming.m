@implementation AVValueTiming

+ (double)currentTimeStamp
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  return v4;
}

+ (AVValueTiming)valueTimingWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  return (AVValueTiming *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAnchorValue:anchorTimeStamp:rate:", a3, a4, a5);
}

+ (AVValueTiming)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (AVValueTiming *)+[AVValueTiming allocWithZone:](AVConcreteValueTiming, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVValueTiming;
  return (AVValueTiming *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (unint64_t)hash
{
  double v2;
  double v3;

  -[AVValueTiming _timing](self, "_timing");
  return vcvtd_n_u64_f64(v2, 0x1EuLL) ^ vcvtd_n_u64_f64(v3, 8uLL);
}

- (BOOL)isEqual:(id)a3
{
  AVValueTiming *v4;
  BOOL v5;

  v4 = (AVValueTiming *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AVValueTiming isEqualToValueTiming:](self, "isEqualToValueTiming:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVValueTiming initWithValueTiming:](+[AVValueTiming allocWithZone:](AVValueTiming, "allocWithZone:", a3), "initWithValueTiming:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AVValueTiming initWithValueTiming:](+[AVMutableValueTiming allocWithZone:](AVMutableValueTiming, "allocWithZone:", a3), "initWithValueTiming:", self);
}

- (AVValueTiming)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("value"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time stamp"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rate"));
  v10 = v9;

  return -[AVValueTiming initWithAnchorValue:anchorTimeStamp:rate:](self, "initWithAnchorValue:anchorTimeStamp:rate:", v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[AVValueTiming anchorValue](self, "anchorValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("value"));
  -[AVValueTiming anchorTimeStamp](self, "anchorTimeStamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("time stamp"));
  -[AVValueTiming rate](self, "rate");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rate"));

}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[AVValueTiming anchorValue](self, "anchorValue");
  v4 = v3;
  -[AVValueTiming anchorTimeStamp](self, "anchorTimeStamp");
  v6 = v5;
  -[AVValueTiming rate](self, "rate");
  v8 = 0.0;
  if (v7 != 0.0)
  {
    v4 = v6 - v4 / v7;
    v8 = v7;
  }
  v9 = v4;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (double)anchorValue
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

- (double)anchorTimeStamp
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

- (double)rate
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("*** initialization method -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!"), v8, v10);

  return 0;
}

- (AVValueTiming)initWithValueTiming:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "anchorValue");
  v6 = v5;
  objc_msgSend(v4, "anchorTimeStamp");
  v8 = v7;
  objc_msgSend(v4, "rate");
  v10 = v9;

  return -[AVValueTiming initWithAnchorValue:anchorTimeStamp:rate:](self, "initWithAnchorValue:anchorTimeStamp:rate:", v6, v8, v10);
}

- (double)currentValue
{
  double result;

  objc_msgSend((id)objc_opt_class(), "currentTimeStamp");
  -[AVValueTiming valueForTimeStamp:](self, "valueForTimeStamp:");
  return result;
}

- (double)valueForTimeStamp:(double)a3
{
  double result;
  double v5;

  -[AVValueTiming _timing](self, "_timing");
  if (v5 != 0.0)
    return v5 * (a3 - result);
  return result;
}

- (double)timeStampForValue:(double)a3
{
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double result;

  -[AVValueTiming _timing](self, "_timing");
  v5 = v4 == 0.0;
  v7 = v6 + a3 / v4;
  result = 0.0 / (a3 - v6);
  if (!v5)
    return v7;
  return result;
}

- (BOOL)isEqualToValueTiming:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  BOOL v12;

  v4 = a3;
  if (v4)
  {
    -[AVValueTiming _timing](self, "_timing");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "_timing");
    v10 = v6 == v9;
    if (v8 != v11)
      v10 = 0;
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
