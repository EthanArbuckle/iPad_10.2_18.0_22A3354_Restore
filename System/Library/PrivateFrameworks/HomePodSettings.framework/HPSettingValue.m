@implementation HPSettingValue

- (HPSettingValue)initWithKeyPath:(id)a3
{
  id v5;
  HPSettingValue *v6;
  HPSettingValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSettingValue;
  v6 = -[HPSettingValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyPath, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HPSettingValue *v4;
  HPSettingValue *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HPSettingValue *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HPSettingValue keyPath](self, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSettingValue keyPath](v5, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HPSettingValue keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HPSettingValue keyPath](self, "keyPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setting.keypath"));

}

- (HPSettingValue)initWithCoder:(id)a3
{
  id v4;
  HPSettingValue *v5;
  uint64_t v6;
  NSString *keyPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSettingValue;
  v5 = -[HPSettingValue init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.keypath"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
