@implementation CAMOverlayContinuousFloatRange

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; min: %.3f; max: %.3f>"),
    v5,
    self,
    *(_QWORD *)&self->_minimum,
    *(_QWORD *)&self->_maximum);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CAMOverlayContinuousFloatRange)initWithMinimum:(double)a3 maximum:(double)a4
{
  CAMOverlayContinuousFloatRange *v6;
  CAMOverlayContinuousFloatRange *v7;
  CAMOverlayContinuousFloatRange *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMOverlayContinuousFloatRange;
  v6 = -[CAMOverlayContinuousFloatRange init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_minimum = fmin(a3, a4);
    v6->_maximum = fmax(a3, a4);
    v8 = v6;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayContinuousFloatRange)initWithCoder:(id)a3
{
  id v4;
  CAMOverlayContinuousFloatRange *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAMOverlayContinuousFloatRange;
  v5 = -[CAMOverlayContinuousFloatRange init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("minimum"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v9);
    v5->_minimum = v10;

    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("maximum"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v14);
    v5->_maximum = v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[CAMOverlayContinuousFloatRange minimum](self, "minimum");
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v9, CFSTR("minimum"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v10, v6);

  -[CAMOverlayContinuousFloatRange maximum](self, "maximum");
  v12 = v11;
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("maximum"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v15, v12);

}

- (unint64_t)rangeType
{
  return 1;
}

- (unint64_t)valueType
{
  return 0;
}

- (BOOL)isFloatingPoint
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 0;
}

- (BOOL)isEqualToRange:(id)a3
{
  CAMOverlayContinuousFloatRange *v4;
  CAMOverlayContinuousFloatRange *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (CAMOverlayContinuousFloatRange *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v12 = 1;
    }
    else
    {
      v5 = v4;
      -[CAMOverlayContinuousFloatRange minimum](v5, "minimum");
      v7 = v6;
      -[CAMOverlayContinuousFloatRange minimum](self, "minimum");
      if (v7 == v8)
      {
        -[CAMOverlayContinuousFloatRange maximum](v5, "maximum");
        v10 = v9;
        -[CAMOverlayContinuousFloatRange maximum](self, "maximum");
        v12 = v10 == v11;
      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)containsValue:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "doubleValue"), v6 = v5, -[CAMOverlayContinuousFloatRange minimum](self, "minimum"), v6 >= v7))
  {
    -[CAMOverlayContinuousFloatRange maximum](self, "maximum");
    v8 = v6 <= v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)valueClosestToValue:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[CAMOverlayContinuousFloatRange minimum](self, "minimum");
  v6 = v5;
  -[CAMOverlayContinuousFloatRange maximum](self, "maximum");
  return fmax(v6, fmin(v7, a3));
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end
