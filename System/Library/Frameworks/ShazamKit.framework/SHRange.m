@implementation SHRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHRange)initWithCoder:(id)a3
{
  id v4;
  SHRange *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRange;
  v5 = -[SHRange init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lowerBound"));
    v5->_lowerBound = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("upperBound"));
    v5->_upperBound = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SHRange lowerBound](self, "lowerBound");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lowerBound"));
  -[SHRange upperBound](self, "upperBound");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("upperBound"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SHRange lowerBound](self, "lowerBound");
  v6 = v5;
  -[SHRange upperBound](self, "upperBound");
  return (id)objc_msgSend(v4, "initWithLowerBound:upperBound:", v6, v7);
}

+ (SHRange)rangeWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  return (SHRange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLowerBound:upperBound:", lowerBound, upperBound);
}

- (SHRange)initWithRange:(_NSRange)a3
{
  return -[SHRange initWithStart:duration:](self, "initWithStart:duration:", (double)a3.location, (double)(a3.length - 1));
}

- (SHRange)initWithStart:(double)a3 duration:(double)a4
{
  return -[SHRange initWithLowerBound:upperBound:](self, "initWithLowerBound:upperBound:", a3, a3 + a4);
}

- (SHRange)initWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  SHRange *result;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SHRange;
  result = -[SHRange init](&v11, sel_init);
  if (result)
  {
    if (upperBound < lowerBound)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A time range start %f must come before the end %f"), *(_QWORD *)&lowerBound, *(_QWORD *)&upperBound);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v10);
    }
    result->_lowerBound = lowerBound;
    result->_upperBound = upperBound;
  }
  return result;
}

- (SHRange)initWithSerializedRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  SHRange *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (v5 != 2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("A range must have a start and end not %@"), v4);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7 || !v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("%@ %@ is not a valid start and end"), v7, v8);
  objc_msgSend(v7, "doubleValue");
  v11 = v10;
  objc_msgSend(v9, "doubleValue");
  v13 = -[SHRange initWithLowerBound:upperBound:](self, "initWithLowerBound:upperBound:", v11, v12);

  return v13;
}

- (BOOL)isEqualToRange:(id)a3 withTolerance:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v6 = a3;
  -[SHRange lowerBound](self, "lowerBound");
  v8 = v7;
  objc_msgSend(v6, "lowerBound");
  if (vabdd_f64(v8, v9) >= a4)
  {
    v13 = 0;
  }
  else
  {
    -[SHRange upperBound](self, "upperBound");
    v11 = v10;
    objc_msgSend(v6, "upperBound");
    v13 = vabdd_f64(v11, v12) < a4;
  }

  return v13;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SHRange lowerBound](self, "lowerBound");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SHRange upperBound](self, "upperBound");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)contains:(double)a3
{
  double v5;
  double v7;

  -[SHRange lowerBound](self, "lowerBound");
  if (v5 > a3)
    return 0;
  -[SHRange upperBound](self, "upperBound");
  return v7 > a3;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;

  -[SHRange upperBound](self, "upperBound");
  v4 = v3;
  -[SHRange lowerBound](self, "lowerBound");
  return v4 - v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SHRange lowerBound](self, "lowerBound");
  v5 = v4;
  -[SHRange upperBound](self, "upperBound");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%2.f - %2.f)"), v5, v6);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

@end
