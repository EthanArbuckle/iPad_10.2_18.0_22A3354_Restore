@implementation CAFResponse

- (CAFResponse)initWithError:(id)a3
{
  return -[CAFResponse initWithValuesAndError:error:](self, "initWithValuesAndError:error:", 0, a3);
}

- (CAFResponse)initWithValues:(id)a3
{
  return -[CAFResponse initWithValuesAndError:error:](self, "initWithValuesAndError:error:", a3, 0);
}

- (CAFResponse)initWithValuesAndError:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  CAFResponse *v9;
  CAFResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAFResponse;
  v9 = -[CAFResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_values, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFResponse)initWithCoder:(id)a3
{
  id v4;
  CAFResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *values;
  uint64_t v13;
  NSError *error;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFResponse;
  v5 = -[CAFResponse init](&v16, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CAFResponseValuesKey")))
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("CAFResponseValuesKey"));
      v11 = objc_claimAutoreleasedReturnValue();
      values = v5->_values;
      v5->_values = (NSDictionary *)v11;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CAFResponseErrorKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFResponseErrorKey"));
      v13 = objc_claimAutoreleasedReturnValue();
      error = v5->_error;
      v5->_error = (NSError *)v13;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *values;
  NSError *error;
  id v7;

  v4 = a3;
  values = self->_values;
  v7 = v4;
  if (values)
  {
    objc_msgSend(v4, "encodeObject:forKey:", values, CFSTR("CAFResponseValuesKey"));
    v4 = v7;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v7, "encodeObject:forKey:", error, CFSTR("CAFResponseErrorKey"));
    v4 = v7;
  }

}

- (NSDictionary)values
{
  return self->_values;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
