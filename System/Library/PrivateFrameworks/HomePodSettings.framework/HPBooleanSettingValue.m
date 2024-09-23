@implementation HPBooleanSettingValue

- (HPBooleanSettingValue)initWithKeyPath:(id)a3 BOOLValue:(BOOL)a4
{
  HPBooleanSettingValue *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HPBooleanSettingValue;
  result = -[HPSettingValue initWithKeyPath:](&v6, sel_initWithKeyPath_, a3);
  if (result)
    result->_BOOLeanValue = a4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HPBooleanSettingValue *v4;
  _BOOL4 v5;
  int v6;

  v4 = (HPBooleanSettingValue *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[HPBooleanSettingValue BOOLeanValue](v4, "BOOLeanValue");
      v6 = v5 ^ -[HPBooleanSettingValue BOOLeanValue](self, "BOOLeanValue") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPBooleanSettingValue BOOLeanValue](self, "BOOLeanValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[HPBooleanSettingValue BOOLeanValue](self, "BOOLeanValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("setting.BOOLkey"));

  -[HPSettingValue keyPath](self, "keyPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("setting.keypath"));

}

- (HPBooleanSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HPBooleanSettingValue *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[HPSettingValue keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HPBooleanSettingValue;
  v6 = -[HPSettingValue initWithKeyPath:](&v10, sel_initWithKeyPath_, v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.BOOLkey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_BOOLeanValue = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.keypath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSettingValue setKeyPath:](v6, "setKeyPath:", v8);

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
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HPSettingValue keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HPBooleanSettingValue BOOLeanValue](self, "BOOLeanValue");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n KeyPath %@ \n Boolean Value %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

@end
