@implementation CAFPairedDevice

- (CAFPairedDevice)initWithDictionary:(id)a3
{
  id v4;
  CAFPairedDevice *v5;
  id v6;
  NSString *v7;
  NSString *identifier;
  id v9;
  NSString *v10;
  NSString *name;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAFPairedDevice;
  v5 = -[CAFPairedDevice init](&v17, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = (NSString *)v9;
    else
      v10 = 0;

    name = v5->_name;
    v5->_name = v10;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("sortOrder"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v5->_sortOrder = objc_msgSend(v13, "unsignedShortValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("state"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v5->_state = objc_msgSend(v15, "unsignedCharValue");
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
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("identifier");
  -[CAFPairedDevice identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("name");
  -[CAFPairedDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("sortOrder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[CAFPairedDevice sortOrder](self, "sortOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("state");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFPairedDevice state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFPairedDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFPairedDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %@, %@: %@, %@: %hu, %@: %hhu }>"), v4, self, CFSTR("identifier"), v5, CFSTR("name"), v6, CFSTR("sortOrder"), -[CAFPairedDevice sortOrder](self, "sortOrder"), CFSTR("state"), -[CAFPairedDevice state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
