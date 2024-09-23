@implementation CAFHistoricalNotificationUserAction

- (CAFHistoricalNotificationUserAction)initWithDictionary:(id)a3
{
  id v4;
  CAFHistoricalNotificationUserAction *v5;
  id v6;
  NSString *v7;
  NSString *contentURLAction;
  id v9;
  NSString *v10;
  NSString *symbolName;
  id v12;
  NSString *v13;
  NSString *userVisibleLabel;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFHistoricalNotificationUserAction;
  v5 = -[CAFHistoricalNotificationUserAction init](&v16, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("contentURLAction"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    contentURLAction = v5->_contentURLAction;
    v5->_contentURLAction = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("symbolName"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = (NSString *)v9;
    else
      v10 = 0;

    symbolName = v5->_symbolName;
    v5->_symbolName = v10;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("userVisibleLabel"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = (NSString *)v12;
    else
      v13 = 0;

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v13;

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
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("contentURLAction");
  -[CAFHistoricalNotificationUserAction contentURLAction](self, "contentURLAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("symbolName");
  -[CAFHistoricalNotificationUserAction symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("userVisibleLabel");
  -[CAFHistoricalNotificationUserAction userVisibleLabel](self, "userVisibleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return (NSDictionary *)v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFHistoricalNotificationUserAction contentURLAction](self, "contentURLAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFHistoricalNotificationUserAction symbolName](self, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFHistoricalNotificationUserAction userVisibleLabel](self, "userVisibleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %@, %@: %@, %@: %@ }>"), v4, self, CFSTR("contentURLAction"), v5, CFSTR("symbolName"), v6, CFSTR("userVisibleLabel"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)contentURLAction
{
  return self->_contentURLAction;
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
  objc_storeStrong((id *)&self->_contentURLAction, 0);
}

@end
