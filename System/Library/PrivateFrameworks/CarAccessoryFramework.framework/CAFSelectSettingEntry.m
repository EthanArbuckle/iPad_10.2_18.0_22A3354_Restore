@implementation CAFSelectSettingEntry

- (CAFSelectSettingEntry)initWithDictionary:(id)a3
{
  id v4;
  CAFSelectSettingEntry *v5;
  id v6;
  id v7;
  id v8;
  NSString *v9;
  NSString *symbolName;
  id v11;
  NSString *v12;
  NSString *userVisibleLabel;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAFSelectSettingEntry;
  v5 = -[CAFSelectSettingEntry init](&v15, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("disabled"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v5->_disabled = objc_msgSend(v7, "BOOLValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("symbolName"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = (NSString *)v8;
    else
      v9 = 0;

    symbolName = v5->_symbolName;
    v5->_symbolName = v9;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("userVisibleLabel"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
      v12 = (NSString *)v11;
    else
      v12 = 0;

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v12;

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("disabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CAFSelectSettingEntry disabled](self, "disabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("symbolName");
  -[CAFSelectSettingEntry symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v5;
  v10[2] = CFSTR("userVisibleLabel");
  -[CAFSelectSettingEntry userVisibleLabel](self, "userVisibleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (!v4)
  return (NSDictionary *)v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CAFSelectSettingEntry disabled](self, "disabled");
  -[CAFSelectSettingEntry symbolName](self, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFSelectSettingEntry userVisibleLabel](self, "userVisibleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %d, %@: %@, %@: %@ }>"), v4, self, CFSTR("disabled"), v5, CFSTR("symbolName"), v6, CFSTR("userVisibleLabel"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
