@implementation ASTIdentity

- (ASTIdentity)init
{
  return -[ASTIdentity initWithIdentityAliases:](self, "initWithIdentityAliases:", MEMORY[0x24BDBD1A8]);
}

- (ASTIdentity)initWithIdentityAliases:(id)a3
{
  id v5;
  ASTIdentity *v6;
  ASTIdentity *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASTIdentity;
  v6 = -[ASTIdentity init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    -[ASTIdentity _dictionariesFromIdentityAliases:](v6, "_dictionariesFromIdentityAliases:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v8))
    {
      objc_storeStrong((id *)&v7->_aliases, a3);
      objc_storeStrong((id *)&v7->_json, v8);
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "infoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (__CFString *)v11;
      else
        v13 = CFSTR("unknown");
      objc_storeStrong((id *)&v7->_hostAppVersion, v13);

      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "infoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (__CFString *)v16;
      else
        v18 = CFSTR("unknown");
      objc_storeStrong((id *)&v7->_hostAppBuild, v18);

    }
    else
    {
      v14 = v7;
      v7 = 0;
    }

  }
  return v7;
}

+ (ASTIdentity)identityWithIdentityAliases:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentityAliases:", v4);

  return (ASTIdentity *)v5;
}

+ (ASTIdentity)identityWithSerialNumber:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  +[ASTIdentityAlias identityAliasWithSerialNumber:](ASTIdentityAlias, "identityAliasWithSerialNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentityAliases:", v6);

  return (ASTIdentity *)v7;
}

- (id)userAgent
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__ASTIdentity_userAgent__block_invoke;
  block[3] = &unk_24F969AE0;
  block[4] = self;
  if (userAgent_onceToken != -1)
    dispatch_once(&userAgent_onceToken, block);
  return (id)userAgent_userAgent;
}

void __24__ASTIdentity_userAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = (id)MGCopyAnswer();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleExecutable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MGCopyAnswer();
  v11 = (void *)MGCopyAnswer();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "hostAppVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("AST/%@ (%@; CPU %@ %@ like Mac OS X) Version/%@ Mobile/%@ %@/%@"),
    CFSTR("1.6"),
    v10,
    v11,
    v2,
    v16,
    v3,
    v8,
    v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)userAgent_userAgent;
  userAgent_userAgent = v14;

}

- (ASTIdentity)initWithCoder:(id)a3
{
  id v4;
  ASTIdentity *v5;
  uint64_t v6;
  NSString *hostAppVersion;
  uint64_t v8;
  NSString *hostAppBuild;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *aliases;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASTIdentity;
  v5 = -[ASTIdentity init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostAppVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    hostAppVersion = v5->_hostAppVersion;
    v5->_hostAppVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostAppBuild"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostAppBuild = v5->_hostAppBuild;
    v5->_hostAppBuild = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("aliases"));
    v14 = objc_claimAutoreleasedReturnValue();
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v14;

    -[ASTIdentity _dictionariesFromIdentityAliases:](v5, "_dictionariesFromIdentityAliases:", v5->_aliases);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v16))
    {
      objc_storeStrong((id *)&v5->_json, v16);
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ASTIdentity hostAppVersion](self, "hostAppVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hostAppVersion"));

  -[ASTIdentity hostAppBuild](self, "hostAppBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("hostAppBuild"));

  -[ASTIdentity aliases](self, "aliases");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("aliases"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_hostAppVersion, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_hostAppBuild, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSArray copyWithZone:](self->_aliases, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (id)_dictionariesFromIdentityAliases:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionary", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
  objc_storeStrong((id *)&self->_aliases, a3);
}

- (NSArray)json
{
  return self->_json;
}

- (void)setJson:(id)a3
{
  objc_storeStrong((id *)&self->_json, a3);
}

- (NSString)hostAppVersion
{
  return self->_hostAppVersion;
}

- (void)setHostAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppVersion, a3);
}

- (NSString)hostAppBuild
{
  return self->_hostAppBuild;
}

- (void)setHostAppBuild:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppBuild, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAppBuild, 0);
  objc_storeStrong((id *)&self->_hostAppVersion, 0);
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
}

@end
