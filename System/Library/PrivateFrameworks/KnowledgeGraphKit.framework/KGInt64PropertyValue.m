@implementation KGInt64PropertyValue

- (KGInt64PropertyValue)initWithValue:(int64_t)a3
{
  KGInt64PropertyValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KGInt64PropertyValue;
  result = -[KGPropertyValue initForSubclasses](&v5, sel_initForSubclasses);
  if (result)
    result->_value = a3;
  return result;
}

- (unint64_t)dataType
{
  return 0;
}

- (id)kgPropertyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_value);
}

- (BOOL)isEqual:(id)a3
{
  KGInt64PropertyValue *v4;
  int64_t value;
  BOOL v6;

  v4 = (KGInt64PropertyValue *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      value = self->_value;
      v6 = value == -[KGInt64PropertyValue value](v4, "value");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)value
{
  return self->_value;
}

@end
