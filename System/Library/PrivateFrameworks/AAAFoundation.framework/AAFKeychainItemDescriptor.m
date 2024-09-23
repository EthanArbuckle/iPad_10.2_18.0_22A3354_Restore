@implementation AAFKeychainItemDescriptor

- (void)setItemAccessible:(unint64_t)a3
{
  self->_itemAccessible = a3;
}

- (void)setUseDataProtection:(unint64_t)a3
{
  self->_useDataProtection = a3;
}

- (void)setSynchronizable:(unint64_t)a3
{
  self->_synchronizable = a3;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setInvisible:(unint64_t)a3
{
  self->_invisible = a3;
}

- (unint64_t)itemClass
{
  return self->_itemClass;
}

- (void)setItemClass:(unint64_t)a3
{
  self->_itemClass = a3;
}

- (id)attributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AAFKeychainItemDescriptor _keychainClassWithClass:](self, "_keychainClassWithClass:", self->_itemClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD6C98]);

  -[AAFKeychainItemDescriptor _keychainAccessibleWithAccessible:](self, "_keychainAccessibleWithAccessible:", self->_itemAccessible);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD68A0]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_account, *MEMORY[0x1E0CD68F8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_service, *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_server, *MEMORY[0x1E0CD6B50]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_securityDomain, *MEMORY[0x1E0CD6B40]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_label, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accessGroup, *MEMORY[0x1E0CD6898]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sharingGroup, *MEMORY[0x1E0CD6B60]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemProtocol, *MEMORY[0x1E0CD6AD0]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_creator, *MEMORY[0x1E0CD6998]);
  -[AAFKeychainItemDescriptor _objectForOptionalBool:](self, "_objectForOptionalBool:", self->_invisible);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD69C0]);

  -[AAFKeychainItemDescriptor _objectForOptionalBool:](self, "_objectForOptionalBool:", self->_synchronizable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6B80]);

  -[AAFKeychainItemDescriptor _objectForOptionalBool:](self, "_objectForOptionalBool:", self->_useDataProtection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD70A8]);

  -[AAFKeychainItemDescriptor _objectForOptionalBool:](self, "_objectForOptionalBool:", self->_sysBound);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6B90]);

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_objectForOptionalBool:(unint64_t)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0C9AAB0];
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return (id)MEMORY[0x1E0C9AAA0];
  else
    return v3;
}

- (id)_keychainClassWithClass:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return **((id **)&unk_1E9946460 + a3 - 1);
}

- (id)_keychainAccessibleWithAccessible:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return **((id **)&unk_1E9946480 + a3 - 1);
}

- (AAFKeychainItemDescriptor)initWithAttributes:(id)a3
{
  id v4;
  AAFKeychainItemDescriptor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *account;
  uint64_t v10;
  NSString *service;
  uint64_t v12;
  NSString *server;
  uint64_t v14;
  NSString *securityDomain;
  uint64_t v16;
  NSString *label;
  uint64_t v18;
  NSString *accessGroup;
  uint64_t v20;
  NSString *sharingGroup;
  uint64_t v22;
  NSString *itemProtocol;
  uint64_t v24;
  NSString *creator;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AAFKeychainItemDescriptor;
  v5 = -[AAFKeychainItemDescriptor init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_itemClass = -[AAFKeychainItemDescriptor _classWithKeychainClass:](v5, "_classWithKeychainClass:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68A0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_itemAccessible = -[AAFKeychainItemDescriptor _accessibleWithKeychainAccessible:](v5, "_accessibleWithKeychainAccessible:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
    v8 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
    v10 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
    v12 = objc_claimAutoreleasedReturnValue();
    server = v5->_server;
    v5->_server = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B40]);
    v14 = objc_claimAutoreleasedReturnValue();
    securityDomain = v5->_securityDomain;
    v5->_securityDomain = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
    v16 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6898]);
    v18 = objc_claimAutoreleasedReturnValue();
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B60]);
    v20 = objc_claimAutoreleasedReturnValue();
    sharingGroup = v5->_sharingGroup;
    v5->_sharingGroup = (NSString *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AD0]);
    v22 = objc_claimAutoreleasedReturnValue();
    itemProtocol = v5->_itemProtocol;
    v5->_itemProtocol = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6998]);
    v24 = objc_claimAutoreleasedReturnValue();
    creator = v5->_creator;
    v5->_creator = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD69C0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_invisible = -[AAFKeychainItemDescriptor _optionalValueFromObject:](v5, "_optionalValueFromObject:", v26);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B80]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_synchronizable = -[AAFKeychainItemDescriptor _optionalValueFromObject:](v5, "_optionalValueFromObject:", v27);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70A8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useDataProtection = -[AAFKeychainItemDescriptor _optionalValueFromObject:](v5, "_optionalValueFromObject:", v28);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B90]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sysBound = -[AAFKeychainItemDescriptor _optionalValueFromObject:](v5, "_optionalValueFromObject:", v29);

  }
  return v5;
}

- (unint64_t)_optionalValueFromObject:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "BOOLValue"))
    return 2;
  return 1;
}

- (unint64_t)_classWithKeychainClass:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD6CA8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD6CB8]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD6CC0]) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD6CB0]))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_accessibleWithKeychainAccessible:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD68E8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD68A8]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD68E0]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD68F0]) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD68B0]))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_itemProtocol, 0);
  objc_storeStrong((id *)&self->_sharingGroup, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAFKeychainItemDescriptor *v4;
  uint64_t v5;
  NSString *account;
  uint64_t v7;
  NSString *service;
  uint64_t v9;
  NSString *server;
  uint64_t v11;
  NSString *securityDomain;
  uint64_t v13;
  NSString *label;
  uint64_t v15;
  NSString *accessGroup;
  uint64_t v17;
  NSString *sharingGroup;
  uint64_t v19;
  NSString *itemProtocol;
  uint64_t v21;
  NSString *creator;

  v4 = objc_alloc_init(AAFKeychainItemDescriptor);
  v4->_itemClass = self->_itemClass;
  v4->_itemAccessible = self->_itemAccessible;
  v5 = -[NSString copy](self->_account, "copy");
  account = v4->_account;
  v4->_account = (NSString *)v5;

  v7 = -[NSString copy](self->_service, "copy");
  service = v4->_service;
  v4->_service = (NSString *)v7;

  v9 = -[NSString copy](self->_server, "copy");
  server = v4->_server;
  v4->_server = (NSString *)v9;

  v11 = -[NSString copy](self->_securityDomain, "copy");
  securityDomain = v4->_securityDomain;
  v4->_securityDomain = (NSString *)v11;

  v13 = -[NSString copy](self->_label, "copy");
  label = v4->_label;
  v4->_label = (NSString *)v13;

  v15 = -[NSString copy](self->_accessGroup, "copy");
  accessGroup = v4->_accessGroup;
  v4->_accessGroup = (NSString *)v15;

  v17 = -[NSString copy](self->_sharingGroup, "copy");
  sharingGroup = v4->_sharingGroup;
  v4->_sharingGroup = (NSString *)v17;

  v19 = -[NSString copy](self->_itemProtocol, "copy");
  itemProtocol = v4->_itemProtocol;
  v4->_itemProtocol = (NSString *)v19;

  v21 = -[NSString copy](self->_creator, "copy");
  creator = v4->_creator;
  v4->_creator = (NSString *)v21;

  v4->_invisible = self->_invisible;
  v4->_synchronizable = self->_synchronizable;
  v4->_useDataProtection = self->_useDataProtection;
  v4->_sysBound = self->_sysBound;
  return v4;
}

- (unint64_t)itemAccessible
{
  return self->_itemAccessible;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)service
{
  return self->_service;
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (void)setSharingGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)itemProtocol
{
  return self->_itemProtocol;
}

- (void)setItemProtocol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)invisible
{
  return self->_invisible;
}

- (unint64_t)synchronizable
{
  return self->_synchronizable;
}

- (unint64_t)useDataProtection
{
  return self->_useDataProtection;
}

- (unint64_t)sysBound
{
  return self->_sysBound;
}

- (void)setSysBound:(unint64_t)a3
{
  self->_sysBound = a3;
}

@end
