@implementation BMItem

+ (id)itemWithType:(id)a3 stringValue:(id)a4
{
  id v5;
  id v6;
  BMItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BMItem initWithType:value:]([BMItem alloc], "initWithType:value:", v6, v5);

  return v7;
}

+ (id)itemWithType:(id)a3 numberValue:(id)a4
{
  id v5;
  id v6;
  BMItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BMItem initWithType:value:]([BMItem alloc], "initWithType:value:", v6, v5);

  return v7;
}

+ (id)itemWithType:(id)a3 UUIDValue:(id)a4
{
  id v5;
  id v6;
  BMItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BMItem initWithType:value:]([BMItem alloc], "initWithType:value:", v6, v5);

  return v7;
}

- (BMItem)initWithType:(id)a3 value:(id)a4
{
  return -[BMItem initWithType:value:absoluteSupport:](self, "initWithType:value:absoluteSupport:", a3, a4, 0);
}

- (BMItem)initWithType:(id)a3 value:(id)a4 absoluteSupport:(unint64_t)a5
{
  id v9;
  id v10;
  BMItem *v11;
  BMItem *v12;
  uint64_t v13;
  NSString *normalizedValue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMItem;
  v11 = -[BMItem init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    v12->_absoluteSupport = a5;
    BMItemNormalizedValueFromValue(v10);
    v13 = objc_claimAutoreleasedReturnValue();
    normalizedValue = v12->_normalizedValue;
    v12->_normalizedValue = (NSString *)v13;

  }
  return v12;
}

- (BMItem)initWithType:(id)a3 normalizedValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BMItem *v9;

  v6 = a4;
  v7 = a3;
  BMItemValueFromNormalizedValue(v6, (void *)objc_msgSend(v7, "valueClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BMItem initWithType:value:](self, "initWithType:value:", v7, v8);
  return v9;
}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;

  -[BMItem normalizedValue](self, "normalizedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMItemValueFromNormalizedValue(v3, (void *)objc_msgSend(v4, "valueClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)uniformIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BMItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItem normalizedValue](self, "normalizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  BMItem *v4;
  BMItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (BMItem *)a3;
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
      -[BMItem type](self, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMItem type](v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[BMItem normalizedValue](self, "normalizedValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMItem normalizedValue](v5, "normalizedValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

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

  -[BMItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMItem normalizedValue](self, "normalizedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BMItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItem value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@: \"%@\"}"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BMItem type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItem value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithType:value:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMItem *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "itemWithType:stringValue:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "itemWithType:numberValue:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "itemWithType:UUIDValue:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (BMItem *)v7;

LABEL_8:
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  BMItemType *type;
  id v5;
  id v6;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  -[BMItem value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("value"));

}

- (BMItemType)type
{
  return self->_type;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (void)setAbsoluteSupport:(unint64_t)a3
{
  self->_absoluteSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
