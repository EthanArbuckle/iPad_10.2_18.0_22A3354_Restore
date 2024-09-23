@implementation HLPHelpItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HLPHelpItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[HLPHelpItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[HLPHelpItem parent](self, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", v7);

  objc_msgSend(v4, "setLevel:", -[HLPHelpItem level](self, "level"));
  -[HLPHelpItem iconURL](self, "iconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconURL:", v8);

  return v4;
}

- (HLPHelpItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5
{
  id v8;
  id v9;
  HLPHelpItem *v10;
  HLPHelpItem *v11;
  uint64_t v12;
  void *name;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSURL *iconURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HLPHelpItem;
  v10 = -[HLPHelpItem init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_serverType = a5;
    if (a5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
      v12 = objc_claimAutoreleasedReturnValue();
      name = v11->_name;
      v11->_name = (NSString *)v12;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v11->_name;
      v11->_name = (NSString *)v14;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("icon"));
      name = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(name, "length"))
      {
        objc_msgSend(v9, "URLByAppendingPathComponent:", name);
        v16 = objc_claimAutoreleasedReturnValue();
        iconURL = v11->_iconURL;
        v11->_iconURL = (NSURL *)v16;

      }
    }

  }
  return v11;
}

- (NSString)decodedName
{
  NSString *v3;
  NSString *decodedName;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  v3 = self->_name;
  if (self->_serverType == 1)
  {
    decodedName = self->_decodedName;
    if (!decodedName)
    {
      -[NSString htmlDecodedString](self->_name, "htmlDecodedString");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_decodedName;
      self->_decodedName = v5;

      decodedName = self->_decodedName;
    }
    v7 = decodedName;

    v3 = v7;
  }
  return v3;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24D32F538);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@\n"), v4);

  -[HLPHelpItem parent](self, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("parent: %@\n"), v5);

  -[HLPHelpItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("name: %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("level: %ld\n"), -[HLPHelpItem level](self, "level"));
  return v3;
}

- (HLPHelpItem)parent
{
  return (HLPHelpItem *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_decodedName, 0);
}

@end
