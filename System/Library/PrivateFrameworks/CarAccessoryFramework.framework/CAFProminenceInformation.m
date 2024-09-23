@implementation CAFProminenceInformation

- (CAFProminenceInformation)initWithDictionary:(id)a3
{
  id v4;
  CAFProminenceInformation *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *userVisibleLabel;
  id v15;
  NSString *v16;
  NSString *userVisibleValue;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAFProminenceInformation;
  v5 = -[CAFProminenceInformation init](&v19, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("color"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v5->_color = objc_msgSend(v7, "unsignedCharValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("prominenceLevel"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v5->_prominenceLevel = objc_msgSend(v9, "unsignedLongLongValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("sortOrder"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    v5->_sortOrder = objc_msgSend(v11, "unsignedCharValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("userVisibleLabel"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = (NSString *)v12;
    else
      v13 = 0;

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v13;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("userVisibleValue"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0)
      v16 = (NSString *)v15;
    else
      v16 = 0;

    userVisibleValue = v5->_userVisibleValue;
    v5->_userVisibleValue = v16;

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
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("color");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFProminenceInformation color](self, "color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("prominenceLevel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CAFProminenceInformation prominenceLevel](self, "prominenceLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("sortOrder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFProminenceInformation sortOrder](self, "sortOrder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("userVisibleLabel");
  -[CAFProminenceInformation userVisibleLabel](self, "userVisibleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v7;
  v12[4] = CFSTR("userVisibleValue");
  -[CAFProminenceInformation userVisibleValue](self, "userVisibleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v6)
  return (NSDictionary *)v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CAFProminenceInformation color](self, "color");
  v6 = -[CAFProminenceInformation prominenceLevel](self, "prominenceLevel");
  v7 = -[CAFProminenceInformation sortOrder](self, "sortOrder");
  -[CAFProminenceInformation userVisibleLabel](self, "userVisibleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFProminenceInformation userVisibleValue](self, "userVisibleValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %hhu, %@: %llu, %@: %hhu, %@: %@, %@: %@ }>"), v4, self, CFSTR("color"), v5, CFSTR("prominenceLevel"), v6, CFSTR("sortOrder"), v7, CFSTR("userVisibleLabel"), v8, CFSTR("userVisibleValue"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)color
{
  return self->_color;
}

- (unint64_t)prominenceLevel
{
  return self->_prominenceLevel;
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (NSString)userVisibleValue
{
  return self->_userVisibleValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleValue, 0);
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
}

@end
