@implementation MLOptimizationHints

- (MLOptimizationHints)init
{
  MLOptimizationHints *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLOptimizationHints;
  result = -[MLOptimizationHints init](&v3, sel_init);
  if (result)
  {
    result->_reshapeFrequency = 0;
    result->_specializationStrategy = 0;
    result->_hotHandDuration = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLOptimizationHints *v4;

  v4 = -[MLOptimizationHints init](+[MLOptimizationHints allocWithZone:](MLOptimizationHints, "allocWithZone:", a3), "init");
  -[MLOptimizationHints setReshapeFrequency:](v4, "setReshapeFrequency:", -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency"));
  -[MLOptimizationHints hotHandDuration](self, "hotHandDuration");
  -[MLOptimizationHints setHotHandDuration:](v4, "setHotHandDuration:");
  -[MLOptimizationHints setSpecializationStrategy:](v4, "setSpecializationStrategy:", -[MLOptimizationHints specializationStrategy](self, "specializationStrategy"));
  return v4;
}

- (int64_t)reshapeFrequency
{
  return self->_reshapeFrequency;
}

- (void)setReshapeFrequency:(int64_t)a3
{
  self->_reshapeFrequency = a3;
}

- (BOOL)isEqual:(id)a3
{
  MLOptimizationHints *v4;
  MLOptimizationHints *v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (MLOptimizationHints *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency");
      if (v6 == -[MLOptimizationHints reshapeFrequency](v5, "reshapeFrequency"))
      {
        v7 = -[MLOptimizationHints specializationStrategy](self, "specializationStrategy");
        v8 = v7 == -[MLOptimizationHints specializationStrategy](v5, "specializationStrategy");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency");
  return -[MLOptimizationHints specializationStrategy](self, "specializationStrategy") ^ v3;
}

- (id)reshapeFrequencyToString:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("Infrequent");
  else
    return CFSTR("Frequent");
}

- (id)specializationStrategyToString:(int64_t)a3
{
  if (a3)
    return CFSTR("FastPrediction");
  else
    return CFSTR("Default");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:\n"), v5);

  -[MLOptimizationHints reshapeFrequencyToString:](self, "reshapeFrequencyToString:", -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" reshapeFrequency %@\n"), v6);

  -[MLOptimizationHints hotHandDuration](self, "hotHandDuration");
  objc_msgSend(v3, "appendFormat:", CFSTR(" hotHandDuration %4.2f seconds\n"), v7);
  -[MLOptimizationHints specializationStrategyToString:](self, "specializationStrategyToString:", -[MLOptimizationHints specializationStrategy](self, "specializationStrategy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" specializationStrategy %@\n"), v8);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency"), CFSTR("reshapeFrequency"));
  -[MLOptimizationHints hotHandDuration](self, "hotHandDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("hotHandDuration"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLOptimizationHints specializationStrategy](self, "specializationStrategy"), CFSTR("specializationStrategy"));

}

- (MLOptimizationHints)initWithCoder:(id)a3
{
  id v4;
  MLOptimizationHints *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MLOptimizationHints;
  v5 = -[MLOptimizationHints init](&v8, sel_init);
  if (v5)
  {
    v5->_reshapeFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reshapeFrequency"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hotHandDuration"));
    v5->_hotHandDuration = v6;
    v5->_specializationStrategy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("specializationStrategy"));
  }

  return v5;
}

- (int64_t)specializationStrategy
{
  return self->_specializationStrategy;
}

- (void)setSpecializationStrategy:(int64_t)a3
{
  self->_specializationStrategy = a3;
}

- (double)hotHandDuration
{
  return self->_hotHandDuration;
}

- (void)setHotHandDuration:(double)a3
{
  self->_hotHandDuration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
