@implementation KGDoublePropertyValue

- (KGDoublePropertyValue)initWithValue:(double)a3
{
  KGDoublePropertyValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KGDoublePropertyValue;
  result = -[KGPropertyValue initForSubclasses](&v5, sel_initForSubclasses);
  if (result)
    result->_value = a3;
  return result;
}

- (unint64_t)dataType
{
  return 2;
}

- (id)kgPropertyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double value;
  double v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    value = self->_value;
    objc_msgSend(v4, "value");
    v7 = vabdd_f64(value, v6) <= 2.22044605e-16;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)value
{
  return self->_value;
}

@end
