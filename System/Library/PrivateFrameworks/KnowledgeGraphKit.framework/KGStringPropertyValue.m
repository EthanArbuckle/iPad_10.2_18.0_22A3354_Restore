@implementation KGStringPropertyValue

- (KGStringPropertyValue)initWithValue:(id)a3
{
  id v4;
  KGStringPropertyValue *v5;
  uint64_t v6;
  NSString *value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGStringPropertyValue;
  v5 = -[KGPropertyValue initForSubclasses](&v9, sel_initForSubclasses);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)dataType
{
  return 3;
}

- (id)kgPropertyValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  KGStringPropertyValue *v4;
  NSString *value;
  void *v6;
  char v7;

  v4 = (KGStringPropertyValue *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      value = self->_value;
      -[KGStringPropertyValue value](v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](value, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_value, "hash");
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
