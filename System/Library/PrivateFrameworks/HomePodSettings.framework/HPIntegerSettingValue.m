@implementation HPIntegerSettingValue

- (HPIntegerSettingValue)initWithKeyPath:(id)a3 numberValue:(id)a4
{
  id v7;
  HPIntegerSettingValue *v8;
  HPIntegerSettingValue *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HPIntegerSettingValue;
  v8 = -[HPSettingValue initWithKeyPath:](&v11, sel_initWithKeyPath_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_numberValue, a4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HPIntegerSettingValue *v4;
  HPIntegerSettingValue *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v4 = (HPIntegerSettingValue *)a3;
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
      v6 = -[HPIntegerSettingValue integerValue](v5, "integerValue");
      -[HPIntegerSettingValue numberValue](self, "numberValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "integerValue"))
      {
        v8 = 1;
      }
      else
      {
        -[HPIntegerSettingValue floatValue](v5, "floatValue");
        v10 = v9;
        -[HPIntegerSettingValue numberValue](self, "numberValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        if (v10 == v12)
        {
          v8 = 1;
        }
        else
        {
          -[HPIntegerSettingValue doubleValue](v5, "doubleValue");
          v14 = v13;
          -[HPIntegerSettingValue numberValue](self, "numberValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v8 = v14 == v16;

        }
      }

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

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HPIntegerSettingValue integerValue](self, "integerValue"));
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
  -[HPIntegerSettingValue numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setting.integerkey"));

  -[HPSettingValue keyPath](self, "keyPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("setting.keypath"));

}

- (HPIntegerSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HPIntegerSettingValue *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  objc_super v12;

  v4 = a3;
  -[HPSettingValue keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HPIntegerSettingValue;
  v6 = -[HPSettingValue initWithKeyPath:](&v12, sel_initWithKeyPath_, v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.integerkey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.keypath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSettingValue setKeyPath:](v6, "setKeyPath:", v8);

    v6->_integerValue = objc_msgSend(v7, "integerValue");
    objc_msgSend(v7, "floatValue");
    v6->_floatValue = v9;
    objc_msgSend(v7, "doubleValue");
    v6->_doubleValue = v10;

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
  int64_t v5;
  float v6;
  double v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HPSettingValue keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HPIntegerSettingValue integerValue](self, "integerValue");
  -[HPIntegerSettingValue floatValue](self, "floatValue");
  v7 = v6;
  -[HPIntegerSettingValue doubleValue](self, "doubleValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n KeyPath %@ \n IntegerValue %ld Float Value %f Double Value %f"), v4, v5, *(_QWORD *)&v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
  objc_storeStrong((id *)&self->_numberValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberValue, 0);
}

@end
