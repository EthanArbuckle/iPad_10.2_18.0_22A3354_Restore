@implementation HPSBooleanSetting

- (HPSBooleanSetting)initWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  HPSBooleanSetting *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HPSSetting initWithKeyPath:value:](self, "initWithKeyPath:value:", v7, v8);

  return v9;
}

+ (id)settingWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "settingWithKeyPath:value:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)BOOLeanValue
{
  void *v2;
  char v3;

  -[HPSSetting value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = v2 != 0;

  return v3;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)homeAdapterLegacySettingValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPSBooleanSetting BOOLeanValue](self, "BOOLeanValue"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSetting keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HPSBooleanSetting BOOLeanValue](self, "BOOLeanValue"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  -[HPSSetting lastModifiedDescription](self, "lastModifiedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ = %@%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
