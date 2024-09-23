@implementation ASDProperty

- (ASDProperty)initWithAddress:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  ASDProperty *v9;
  ASDProperty *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDProperty;
  v9 = -[ASDProperty init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_address, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (ASDProperty)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASDPropertyAddress *v7;
  ASDProperty *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[ASDPropertyAddress initWithDictionary:]([ASDPropertyAddress alloc], "initWithDictionary:", v5);
    v8 = -[ASDProperty initWithAddress:value:](self, "initWithAddress:value:", v7, v6);
    self = (ASDProperty *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ASDProperty address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDProperty value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithAddress:value:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ASDProperty *v4;
  ASDProperty *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (ASDProperty *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ASDProperty address](v5, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDProperty address](self, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[ASDProperty value](v5, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDProperty value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ASDProperty address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ASDProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (ASDPropertyAddress)address
{
  return self->_address;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
