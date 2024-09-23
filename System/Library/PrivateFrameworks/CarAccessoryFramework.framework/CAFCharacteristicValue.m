@implementation CAFCharacteristicValue

- (CAFCharacteristicValue)initWithValue:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  CAFCharacteristicValue *v9;
  CAFCharacteristicValue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAFCharacteristicValue;
  v9 = -[CAFCharacteristicValue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong(&v10->_value, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFCharacteristicValue)initWithCoder:(id)a3
{
  id v4;
  CAFCharacteristicValue *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id value;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAFCharacteristicValue;
  v5 = -[CAFCharacteristicValue init](&v17, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CAFCharacteristicValueValueKey")))
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("CAFCharacteristicValueValueKey"));
      v12 = objc_claimAutoreleasedReturnValue();
      value = v5->_value;
      v5->_value = (id)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CAFCharacteristicValueErrorKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFCharacteristicValueErrorKey"));
      v14 = objc_claimAutoreleasedReturnValue();
      error = v5->_error;
      v5->_error = (NSError *)v14;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id value;
  NSError *error;
  id v7;

  v4 = a3;
  value = self->_value;
  v7 = v4;
  if (value)
  {
    objc_msgSend(v4, "encodeObject:forKey:", value, CFSTR("CAFCharacteristicValueValueKey"));
    v4 = v7;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v7, "encodeObject:forKey:", error, CFSTR("CAFCharacteristicValueErrorKey"));
    v4 = v7;
  }

}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
