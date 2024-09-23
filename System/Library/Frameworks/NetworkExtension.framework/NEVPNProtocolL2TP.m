@implementation NEVPNProtocolL2TP

- (NEVPNProtocolL2TP)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEVPNProtocolL2TP;
  return -[NEVPNProtocolPPP initWithType:](&v3, sel_initWithType_, 2);
}

- (NEVPNProtocolL2TP)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocolL2TP *v5;
  uint64_t v6;
  NEKeychainItem *sharedSecretKeychainItem;
  uint64_t v8;
  NEIdentityKeychainItem *machineIdentity;
  uint64_t v10;
  NSData *machineIdentityDataInternal;
  uint64_t v12;
  NSString *localIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVPNProtocolL2TP;
  v5 = -[NEVPNProtocolPPP initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_machineAuthenticationMethod = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MachineAuthenticationMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSecret"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MachineIdentity"));
    v8 = objc_claimAutoreleasedReturnValue();
    machineIdentity = v5->_machineIdentity;
    v5->_machineIdentity = (NEIdentityKeychainItem *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MachineIdentityData"));
    v10 = objc_claimAutoreleasedReturnValue();
    machineIdentityDataInternal = v5->_machineIdentityDataInternal;
    v5->_machineIdentityDataInternal = (NSData *)v10;

    v5->_machineIdentityDataImported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MachineIdentityDataImported"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  SEL v7;
  _BOOL8 machineIdentityDataImported;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocolPPP encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"), CFSTR("MachineAuthenticationMethod"));
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SharedSecret"));

  if (self)
  {
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v6, 248, 1), CFSTR("MachineIdentity"));
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v7, 256, 1), CFSTR("MachineIdentityData"));
    machineIdentityDataImported = self->_machineIdentityDataImported;
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("MachineIdentity"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("MachineIdentityData"));
    machineIdentityDataImported = 0;
  }
  objc_msgSend(v4, "encodeBool:forKey:", machineIdentityDataImported, CFSTR("MachineIdentityDataImported"));
  -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("LocalIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  const char *v6;
  id Property;
  id v8;
  BOOL machineIdentityDataImported;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolL2TP;
  v4 = -[NEVPNProtocolPPP copyWithZone:](&v13, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMachineAuthenticationMethod:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"));
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedSecretKeychainItem:", v5);

  if (self)
  {
    Property = objc_getProperty(self, v6, 248, 1);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  Property = 0;
  if (v4)
LABEL_3:
    objc_setProperty_atomic(v4, v6, Property, 248);
LABEL_4:
  if (self)
  {
    v8 = objc_getProperty(self, v6, 256, 1);
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = 0;
  if (v4)
LABEL_6:
    objc_setProperty_atomic_copy(v4, v6, v8, 256);
LABEL_7:
  if (!self)
  {
    machineIdentityDataImported = 0;
    if (!v4)
      goto LABEL_10;
    goto LABEL_9;
  }
  machineIdentityDataImported = self->_machineIdentityDataImported;
  if (v4)
LABEL_9:
    v4[208] = machineIdentityDataImported;
LABEL_10:
  -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalIdentifier:", v10);

  -[NEVPNProtocolL2TP userPreferences](self, "userPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserPreferences:", v11);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  const char *v5;
  unsigned int v6;
  id v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEVPNProtocolL2TP;
  v6 = -[NEVPNProtocolPPP checkValidityAndCollectErrors:](&v19, sel_checkValidityAndCollectErrors_, v4);
  if (self
    && ((v7 = objc_getProperty(self, v5, 248, 1)) != 0
     || (v7 = objc_getProperty(self, v8, 256, 1)) != 0))
  {

  }
  else if (-[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod") == 2)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing machine identity"), v4);
    v6 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NEVPNProtocolL2TP userPreferences](self, "userPreferences", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v6 &= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "checkValidityAndCollectErrors:", v4);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v11);
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  SEL v12;
  _BOOL8 machineIdentityDataImported;
  void *v14;
  objc_super v16;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v16.receiver = self;
  v16.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocolPPP descriptionWithIndent:options:](&v16, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"), CFSTR("machineAuthenticationMethod"), v5, a4);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("sharedSecretReference"), v5, a4);

  if (self)
  {
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v11, 248, 1), CFSTR("machineIdentity"), v5, a4);
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v12, 256, 1), CFSTR("machineIdentityDataInternal"), v5, a4);
    machineIdentityDataImported = self->_machineIdentityDataImported;
  }
  else
  {
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("machineIdentity"), v5, a4);
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("machineIdentityDataInternal"), v5, a4);
    machineIdentityDataImported = 0;
  }
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", machineIdentityDataImported, CFSTR("machineIdentityDataImported"), v5, a4);
  -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("localIdentifier"), v5, a4 | 1);

  return v9;
}

- (void)setSharedSecretReference:(id)a3
{
  NEVPNProtocolL2TP *v4;
  void *v5;
  id v6;
  const char *v7;
  NEKeychainItem *v8;
  int64_t keychainDomain;
  id Property;
  NEKeychainItem *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](v4, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](v4, "sharedSecretKeychainItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistentReference:", v12);
  }
  else
  {
    v8 = [NEKeychainItem alloc];
    if (v4)
    {
      keychainDomain = v4->super.super._keychainDomain;
      Property = objc_getProperty(v4, v7, 88, 1);
    }
    else
    {
      keychainDomain = 0;
      Property = 0;
    }
    v6 = Property;
    v11 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v8, "initWithPersistentReference:domain:accessGroup:", v12, keychainDomain, v6);
    -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](v4, "setSharedSecretKeychainItem:", v11);

  }
  objc_sync_exit(v4);

}

- (NSData)sharedSecretReference
{
  NEVPNProtocolL2TP *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](v2, "sharedSecretKeychainItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](v2, "sharedSecretKeychainItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setMachineIdentityReference:(id)a3
{
  NEVPNProtocolL2TP *v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  NEIdentityKeychainItem *v9;
  int64_t keychainDomain;
  id Property;
  const char *v12;
  NEIdentityKeychainItem *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 248, 1))
    {
      v7 = objc_getProperty(v4, v6, 248, 1);
      objc_msgSend(v7, "setPersistentReference:", v14);
    }
    else
    {
      v9 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        keychainDomain = v4->super.super._keychainDomain;
        Property = objc_getProperty(v4, v8, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v7 = Property;
      v13 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v9, "initWithPersistentReference:domain:accessGroup:", v14, keychainDomain, v7);
      if (v4)
        objc_setProperty_atomic(v4, v12, v13, 248);

    }
  }
  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 248);
  }
  objc_sync_exit(v4);

}

- (NSData)machineIdentityReference
{
  NEVPNProtocolL2TP *v2;
  const char *v3;
  const char *v4;
  id v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 248, 1))
  {
    v5 = objc_getProperty(v2, v4, 248, 1);
    objc_msgSend(v5, "persistentReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  NEKeychainItem *v24;
  int64_t keychainDomain;
  id Property;
  id v27;
  NEKeychainItem *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_super v35;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".SS"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("SS");
  }
  v35.receiver = self;
  v35.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocol syncWithKeychainInDomain:configuration:suffix:](&v35, sel_syncWithKeychainInDomain_configuration_suffix_, a3, v8, v10);
  if (self)
  {
    v13 = objc_getProperty(self, v12, 248, 1);
    if (v13)
    {
      v15 = v13;
      v16 = objc_msgSend(objc_getProperty(self, v14, 248, 1), "domain");

      if (v16 == a3)
        objc_msgSend(objc_getProperty(self, v17, 248, 1), "sync");
    }
  }
  if (-[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod") == 1)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@"), v21, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = [NEKeychainItem alloc];
      if (self)
      {
        keychainDomain = self->super.super._keychainDomain;
        Property = objc_getProperty(self, v23, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v27 = Property;
      v28 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:](v24, "initWithIdentifier:domain:accessGroup:", v22, keychainDomain, v27);
      -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v28);

    }
  }
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "domain");

    if (v32 == a3)
    {
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v8, v34, 2, v11);

    }
  }

}

- (BOOL)needToUpdateKeychain
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolL2TP;
  if (-[NEVPNProtocol needToUpdateKeychain](&v10, sel_needToUpdateKeychain))
    return 1;
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "password");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "length") != 0;

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:](&v11, sel_removeKeychainItemsInDomain_keepIdentity_, a3, a4);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "domain");

    if (v9 == a3)
    {
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIdentifier:", 0);

    }
  }
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocol migratePasswordsFromPreferences:](&v6, sel_migratePasswordsFromPreferences_);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateFromPreferences:", a3);

}

- (id)copyLegacyIPSecDictionary
{
  id v3;
  void *v4;
  const char *v5;
  id Property;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEVPNProtocolL2TP machineIdentityReference](self, "machineIdentityReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (self)
      Property = objc_getProperty(self, v5, 248, 1);
    else
      Property = 0;
    objc_msgSend(Property, "persistentReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8C60]);

    v8 = (_QWORD *)MEMORY[0x1E0CE90B8];
  }
  else
  {
    v8 = (_QWORD *)MEMORY[0x1E0CE90C0];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v8, *MEMORY[0x1E0CE8C58]);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "password");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_13;
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;

    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CE8C80]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90D0], *MEMORY[0x1E0CE8C88]);

    }
  }
LABEL_13:
  -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CE8C68]);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90C8], *MEMORY[0x1E0CE8C70]);
  }
  return v3;
}

- (void)setIPSecSettingsFromLegacyDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  NEKeychainItem *v8;
  const char *v9;
  void *v10;
  int64_t keychainDomain;
  id Property;
  id v13;
  NEKeychainItem *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;

  v4 = a3;
  v5 = *MEMORY[0x1E0CE8C80];
  v29 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = isa_nsstring(v6);

  if (v7)
  {
    v8 = [NEKeychainItem alloc];
    objc_msgSend(v29, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      keychainDomain = self->super.super._keychainDomain;
      Property = objc_getProperty(self, v9, 88, 1);
    }
    else
    {
      keychainDomain = 0;
      Property = 0;
    }
    v13 = Property;
    v14 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](v8, "initWithLegacyIdentifier:domain:accessGroup:", v10, keychainDomain, v13);
    -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v14);

    v15 = 1;
  }
  else
  {
    v16 = *MEMORY[0x1E0CE8C60];
    objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C60]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = isa_nsdata(v17);

    if (!v18)
      goto LABEL_8;
    objc_msgSend(v29, "objectForKeyedSubscript:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolL2TP setMachineIdentityReference:](self, "setMachineIdentityReference:", v10);
    v15 = 2;
  }

  -[NEVPNProtocolL2TP setMachineAuthenticationMethod:](self, "setMachineAuthenticationMethod:", v15);
LABEL_8:
  v19 = *MEMORY[0x1E0CE8C68];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C68]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = isa_nsstring(v20);

  if (v21)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[NEVPNProtocolL2TP setLocalIdentifier:](self, "setLocalIdentifier:", v23);

  }
  v24 = *MEMORY[0x1E0CE8C58];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C58]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = isa_nsstring(v25);

  if (v26)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CE90C0]) & 1) != 0)
    {
      v28 = 1;
    }
    else
    {
      if (!objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CE90B8]))
      {
LABEL_16:

        goto LABEL_17;
      }
      v28 = 2;
    }
    -[NEVPNProtocolL2TP setMachineAuthenticationMethod:](self, "setMachineAuthenticationMethod:", v28);
    goto LABEL_16;
  }
LABEL_17:

}

- (__SCNetworkInterface)createInterface
{
  __SCNetworkInterface *result;
  __SCNetworkInterface *v3;
  __SCNetworkInterface *v4;

  result = SCNetworkInterfaceCreateWithInterface((SCNetworkInterfaceRef)*MEMORY[0x1E0CE8BB8], (CFStringRef)*MEMORY[0x1E0CE8BD0]);
  if (result)
  {
    v3 = result;
    v4 = SCNetworkInterfaceCreateWithInterface(result, (CFStringRef)*MEMORY[0x1E0CE8BD8]);
    CFRelease(v3);
    return v4;
  }
  return result;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  _BOOL4 v5;
  SCNetworkInterfaceRef Interface;
  const __SCNetworkInterface *v7;
  const __CFString *v8;
  const __CFDictionary *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  const char *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolL2TP;
  v5 = -[NEVPNProtocolPPP setServiceProtocolsInService:](&v17, sel_setServiceProtocolsInService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      v7 = Interface;
      v8 = (const __CFString *)*MEMORY[0x1E0CE8BC8];
      v9 = -[NEVPNProtocolL2TP copyLegacyIPSecDictionary](self, "copyLegacyIPSecDictionary");
      LODWORD(v7) = SCNetworkInterfaceSetExtendedConfiguration(v7, v8, v9);

      if ((_DWORD)v7)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        LOBYTE(v5) = 0;
        return v5;
      }
      v14 = SCError();
      v15 = SCErrorString(v14);
      *(_DWORD *)buf = 136315138;
      v19 = v15;
      v11 = "SCNetworkInterfaceSetExtendedConfiguration failed: %s";
      v12 = v10;
      v13 = 12;
    }
    else
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v11 = "Cannot set IPSec settings in service, interface is NULL";
      v12 = v10;
      v13 = 2;
    }
    _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_8;
  }
  return v5;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  _BOOL4 v5;
  const __SCNetworkInterface *Interface;
  CFDictionaryRef ExtendedConfiguration;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEVPNProtocolL2TP;
  v5 = -[NEVPNProtocolPPP updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      ExtendedConfiguration = SCNetworkInterfaceGetExtendedConfiguration(Interface, (CFStringRef)*MEMORY[0x1E0CE8BC8]);
      if (ExtendedConfiguration)
        -[NEVPNProtocolL2TP setIPSecSettingsFromLegacyDictionary:](self, "setIPSecSettingsFromLegacyDictionary:", ExtendedConfiguration);
    }
  }
  return v5;
}

- (int64_t)machineAuthenticationMethod
{
  return self->_machineAuthenticationMethod;
}

- (void)setMachineAuthenticationMethod:(int64_t)a3
{
  self->_machineAuthenticationMethod = a3;
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSArray)userPreferences
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUserPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineIdentityDataInternal, 0);
  objc_storeStrong((id *)&self->_machineIdentity, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedSecretKeychainItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
