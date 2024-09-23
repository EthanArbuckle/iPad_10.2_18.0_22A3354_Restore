@implementation _DPUniformNoiseGenerator

- (_DPUniformNoiseGenerator)init
{

  return 0;
}

- (_DPUniformNoiseGenerator)initWithValueRange:(id)a3
{
  id v4;
  _DPUniformNoiseGenerator *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DPUniformNoiseGenerator;
  v5 = -[_DPUniformNoiseGenerator init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "minPossible");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_minValue = v7;

    objc_msgSend(v4, "range");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_range = v9;

  }
  return v5;
}

+ (id)generatorWithValueRange:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValueRange:", v4);

  return v5;
}

- (double)sample
{
  return uniformRandomProbability() * self->_range - fabs(self->_minValue);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { minValue=%.16g ; range=%.16g }"),
    v5,
    *(_QWORD *)&self->_minValue,
    *(_QWORD *)&self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)range
{
  return self->_range;
}

@end
