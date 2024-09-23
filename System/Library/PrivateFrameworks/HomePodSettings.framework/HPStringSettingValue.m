@implementation HPStringSettingValue

- (HPStringSettingValue)initWithKeyPath:(id)a3 settingStringValue:(id)a4
{
  id v7;
  HPStringSettingValue *v8;
  HPStringSettingValue *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HPStringSettingValue;
  v8 = -[HPSettingValue initWithKeyPath:](&v11, sel_initWithKeyPath_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_stringValue, a4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HPStringSettingValue *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (HPStringSettingValue *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HPStringSettingValue stringValue](v4, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPStringSettingValue stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5 == v6;

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
  void *v2;
  unint64_t v3;

  -[HPStringSettingValue stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HPStringSettingValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setting.stringkey"));

  -[HPSettingValue keyPath](self, "keyPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("setting.keypath"));

}

- (HPStringSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HPStringSettingValue *v6;
  uint64_t v7;
  NSString *stringValue;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[HPSettingValue keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HPStringSettingValue;
  v6 = -[HPSettingValue initWithKeyPath:](&v11, sel_initWithKeyPath_, v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.stringkey"));
    v7 = objc_claimAutoreleasedReturnValue();
    stringValue = v6->_stringValue;
    v6->_stringValue = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.keypath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSettingValue setKeyPath:](v6, "setKeyPath:", v9);

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HPSettingValue keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPStringSettingValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n KeyPath %@ \n StringValue %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
