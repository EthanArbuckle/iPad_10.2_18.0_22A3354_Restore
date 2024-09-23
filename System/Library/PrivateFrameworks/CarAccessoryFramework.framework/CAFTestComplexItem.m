@implementation CAFTestComplexItem

- (CAFTestComplexItem)initWithDictionary:(id)a3
{
  id v4;
  CAFTestComplexItem *v5;
  id v6;
  NSString *v7;
  NSString *key;
  id v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAFTestComplexItem;
  v5 = -[CAFTestComplexItem init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("key"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    key = v5->_key;
    v5->_key = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v5->_value = objc_msgSend(v10, "unsignedIntValue");
  }

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("key");
  -[CAFTestComplexItem key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[1] = CFSTR("value");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CAFTestComplexItem value](self, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFTestComplexItem key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %@, %@: %u }>"), v4, self, CFSTR("key"), v5, CFSTR("value"), -[CAFTestComplexItem value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (unsigned)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
