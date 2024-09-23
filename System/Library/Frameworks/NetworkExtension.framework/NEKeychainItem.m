@implementation NEKeychainItem

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithPassword:domain:accessGroup:](self, "initWithPassword:domain:accessGroup:", a3, a4, 0);
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithData:domain:accessGroup:](self, "initWithData:domain:accessGroup:", a3, a4, 0);
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithIdentifier:domain:accessGroup:](self, "initWithIdentifier:domain:accessGroup:", a3, a4, 0);
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](self, "initWithPersistentReference:domain:accessGroup:", a3, a4, 0);
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](self, "initWithLegacyIdentifier:domain:accessGroup:", a3, a4, 0);
}

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NEKeychainItem *v12;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NEKeychainItem initWithData:domain:accessGroup:](self, "initWithData:domain:accessGroup:", v11, a4, v10);

  if (v12)
    objc_storeStrong((id *)&v12->_password, a3);

  return v12;
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  NEKeychainItem *v10;
  CFDataRef v11;
  NSData *data;
  uint64_t v13;
  NSString *accessGroup;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    v11 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v8);
    data = v10->_data;
    v10->_data = (NSData *)v11;

    v10->_domain = a4;
    v13 = objc_msgSend(v9, "copy");
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;

  }
  return v10;
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  NEKeychainItem *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *accessGroup;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_domain = a4;
    v13 = objc_msgSend(v9, "copy");
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;

  }
  return v10;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  NEKeychainItem *v10;
  uint64_t v11;
  NSData *persistentReference;
  uint64_t v13;
  NSString *accessGroup;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    persistentReference = v10->_persistentReference;
    v10->_persistentReference = (NSData *)v11;

    v10->_domain = a4;
    v13 = objc_msgSend(v9, "copy");
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;

  }
  return v10;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 keyReference:(id)a4 isModernSystem:(BOOL)a5 domain:(int64_t)a6 accessGroup:(id)a7
{
  id v12;
  id v13;
  id v14;
  NEKeychainItem *v15;
  uint64_t v16;
  NSData *persistentReference;
  uint64_t v18;
  NSData *keyPersistentReference;
  uint64_t v20;
  NSString *accessGroup;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NEKeychainItem;
  v15 = -[NEKeychainItem init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    persistentReference = v15->_persistentReference;
    v15->_persistentReference = (NSData *)v16;

    v18 = objc_msgSend(v13, "copy");
    keyPersistentReference = v15->_keyPersistentReference;
    v15->_keyPersistentReference = (NSData *)v18;

    v15->_isModernSystem = a5;
    v15->_domain = a6;
    v20 = objc_msgSend(v14, "copy");
    accessGroup = v15->_accessGroup;
    v15->_accessGroup = (NSString *)v20;

  }
  return v15;
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  NEKeychainItem *result;

  result = -[NEKeychainItem initWithIdentifier:domain:accessGroup:](self, "initWithIdentifier:domain:accessGroup:", a3, a4, a5);
  if (result)
    result->_legacy = 1;
  return result;
}

- (NEKeychainItem)initWithCoder:(id)a3
{
  id v4;
  NEKeychainItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSData *persistentReference;
  uint64_t v10;
  NSData *keyPersistentReference;
  void *v12;
  void *v13;
  CFDataRef v14;
  NSData *data;
  NSData *password;
  CFDataRef v17;
  uint64_t v18;
  NEKeychainItem *oldItem;
  uint64_t v20;
  NSString *accessGroup;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEKeychainItem;
  v5 = -[NEKeychainItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersistentReference"));
    v8 = objc_claimAutoreleasedReturnValue();
    persistentReference = v5->_persistentReference;
    v5->_persistentReference = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeyPersistentReference"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyPersistentReference = v5->_keyPersistentReference;
    v5->_keyPersistentReference = (NSData *)v10;

    v5->_isModernSystem = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsModernSystem"));
    v5->_domain = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Domain"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Password")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v13);
      data = v5->_data;
      v5->_data = (NSData *)v14;

      password = (NSData *)v5->_password;
      v5->_password = (NSString *)v12;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v13);
      password = v5->_data;
      v5->_data = (NSData *)v17;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OldItem"));
    v18 = objc_claimAutoreleasedReturnValue();
    oldItem = v5->_oldItem;
    v5->_oldItem = (NEKeychainItem *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessGroup"));
    v20 = objc_claimAutoreleasedReturnValue();
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NEKeychainItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  -[NEKeychainItem persistentReference](self, "persistentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("PersistentReference"));

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("KeyPersistentReference"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NEKeychainItem isModernSystem](self, "isModernSystem"), CFSTR("IsModernSystem"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[NEKeychainItem domain](self, "domain"), CFSTR("Domain"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v8, "encodeObject:forKey:", self->_data, CFSTR("Data"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_oldItem, CFSTR("OldItem"));
  -[NEKeychainItem accessGroup](self, "accessGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("AccessGroup"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CFDataRef v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NEKeychainItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEKeychainItem domain](self, "domain");
  -[NEKeychainItem accessGroup](self, "accessGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "initWithIdentifier:domain:accessGroup:", v5, v6, v7);

  -[NEKeychainItem persistentReference](self, "persistentReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v10;

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v13;

  *(_BYTE *)(v8 + 48) = -[NEKeychainItem isModernSystem](self, "isModernSystem");
  v15 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], self->_data);
  v16 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v15;

  *(_BYTE *)(v8 + 49) = self->_legacy;
  return (id)v8;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[NEKeychainItem identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("identifier"), v5, isKindOfClass & 1 | a4);

  -[NEKeychainItem persistentReference](self, "persistentReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("persistentReference"), v5, a4);

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("keyPersistentReference"), v5, a4);

  }
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEKeychainItem isModernSystem](self, "isModernSystem"), CFSTR("isModernSystem"), v5, a4);
  if (-[NEKeychainItem domain](self, "domain"))
    v13 = CFSTR("user");
  else
    v13 = CFSTR("system");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("domain"), v5, a4);
  -[NEKeychainItem accessGroup](self, "accessGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("accessGroup"), v5, a4);

  return v7;
}

- (NSString)identifier
{
  NEKeychainItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identifier;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIdentifier:(id)a3
{
  id v4;
  NEKeychainItem *v5;
  NSString *identifier;
  NSObject *v7;
  uint64_t v8;
  NEKeychainItem *oldItem;
  uint64_t v10;
  NSString *v11;
  NSData *persistentReference;
  NSData *data;
  NSString *password;
  NSString *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  identifier = v5->_identifier;
  if (v4 && !identifier || identifier && !-[NSString isEqualToString:](identifier, "isEqualToString:", v4))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = v5->_identifier;
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v4;
      _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "setIdentifier: old %@, new %@", (uint8_t *)&v16, 0x16u);
    }

    if (v5->_identifier)
    {
      v8 = -[NEKeychainItem copy](v5, "copy");
      oldItem = v5->_oldItem;
      v5->_oldItem = (NEKeychainItem *)v8;

    }
    if (v4)
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v4);
    else
      v10 = 0;
    v11 = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    persistentReference = v5->_persistentReference;
    v5->_persistentReference = 0;

    data = v5->_data;
    v5->_data = 0;

    password = v5->_password;
    v5->_password = 0;

  }
  objc_sync_exit(v5);

}

- (NSData)persistentReference
{
  NEKeychainItem *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_persistentReference;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPersistentReference:(id)a3
{
  NEKeychainItem *v4;
  NSData *persistentReference;
  uint64_t v6;
  NSData *v7;
  NSString *identifier;
  NSData *data;
  NSString *password;
  uint64_t v11;
  NEKeychainItem *oldItem;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  persistentReference = v4->_persistentReference;
  if (v13 && !persistentReference)
  {
LABEL_3:
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v13);
LABEL_4:
    v7 = v4->_persistentReference;
    v4->_persistentReference = (NSData *)v6;

    identifier = v4->_identifier;
    v4->_identifier = 0;

    data = v4->_data;
    v4->_data = 0;

    password = v4->_password;
    v4->_password = 0;

    goto LABEL_7;
  }
  if (persistentReference && (-[NSData isEqual:](persistentReference, "isEqual:", v13) & 1) == 0)
  {
    if (v4->_persistentReference)
    {
      v11 = -[NEKeychainItem copy](v4, "copy");
      oldItem = v4->_oldItem;
      v4->_oldItem = (NEKeychainItem *)v11;

    }
    v6 = (uint64_t)v13;
    if (!v13)
      goto LABEL_4;
    goto LABEL_3;
  }
LABEL_7:
  objc_sync_exit(v4);

}

- (void)setPassword:(id)a3
{
  NEKeychainItem *v4;
  void *v5;
  CFDataRef v6;
  NSData *data;
  uint64_t v8;
  NSString *password;
  NSData *v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v5);
    data = v4->_data;
    v4->_data = (NSData *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v11);
    password = v4->_password;
    v4->_password = (NSString *)v8;

  }
  else
  {
    v10 = v4->_data;
    v4->_data = 0;

    v5 = v4->_password;
    v4->_password = 0;
  }

  objc_sync_exit(v4);
}

- (NSString)password
{
  NEKeychainItem *v2;
  NSData *password;
  uint64_t v4;
  NSString *v5;
  NSData *v6;

  v2 = self;
  objc_sync_enter(v2);
  password = (NSData *)v2->_password;
  if (!password)
  {
    password = v2->_data;
    if (password)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2->_data, 4);
      v5 = v2->_password;
      v2->_password = (NSString *)v4;

      password = (NSData *)v2->_password;
    }
  }
  v6 = password;
  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setData:(id)a3
{
  NEKeychainItem *v4;
  CFDataRef v5;
  NSData *data;
  NSString *password;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v8);
  data = v4->_data;
  v4->_data = (NSData *)v5;

  password = v4->_password;
  v4->_password = 0;

  objc_sync_exit(v4);
}

- (NSData)data
{
  NEKeychainItem *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_data;
  objc_sync_exit(v2);

  return v3;
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  -[NEKeychainItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEKeychainItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)MEMORY[0x1E0CD6B58];
  }
  else
  {
    -[NEKeychainItem persistentReference](self, "persistentReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    -[NEKeychainItem persistentReference](self, "persistentReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)MEMORY[0x1E0CD70E0];
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *v8);

LABEL_6:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    v14 = MEMORY[0x1E0C9AAB0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  return v5;
}

- (id)copyPassword
{
  id v2;
  void *v3;

  v2 = -[NEKeychainItem copyData](self, "copyData");
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

- (id)copyData
{
  id v3;

  v3 = 0;
  -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](self, (const __CFData **)&v3, 0, 0);
  return v3;
}

- (void)remove
{
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  OSStatus v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NEKeychainItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[NEKeychainItem persistentReference](self, "persistentReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  v5 = -[NEKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", 0);
  v6 = SecItemDelete(v5);
  if (v6)
  {
    v7 = v6;
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NEKeychainItem identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 1024;
      v13 = v7;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@: SecItemDelete failed: %d", (uint8_t *)&v10, 0x12u);

    }
  }
  -[NEKeychainItem setIdentifier:](self, "setIdentifier:", 0);
  -[NEKeychainItem setPersistentReference:](self, "setPersistentReference:", 0);

}

- (void)syncUsingConfiguration:(id)a3 accountName:(id)a4 passwordType:(int64_t)a5 identifierSuffix:(id)a6
{
  NEKeychainItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSData *data;
  NSString *identifier;
  NSData *persistentReference;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSData *v26;
  id v27;
  NEKeychainItem *v28;
  int v29;
  id v30;
  id v31;
  NSData *v32;
  id v33;
  const __CFString *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *v41;
  NSObject *p_super;
  void *v43;
  void *v44;
  BOOL v45;
  int v46;
  const void *v47;
  uint64_t v48;
  void *v49;
  const __CFDictionary *v50;
  OSStatus v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  uint64_t v60;
  const __CFDictionary *v61;
  OSStatus v62;
  NSObject *v63;
  OSStatus v64;
  NSObject *v65;
  NSObject *v66;
  const char *v67;
  id v68;
  void *v69;
  SEL v70;
  id v71;
  SEL v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  CFDictionaryRef query;
  const __CFDictionary *querya;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _BYTE buf[24];
  NSData *v90;
  uint64_t v91;
  void *v92;
  _BYTE v93[24];
  CFTypeRef result;
  id v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v86 = a3;
  v84 = a4;
  v85 = a6;
  v10 = self;
  objc_sync_enter(v10);
  if (!v10 || !v10->_legacy)
  {
    -[NEKeychainItem identifier](v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NEKeychainItem identifier](v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "hasPrefix:", v14);

      if ((v15 & 1) == 0)
      {
        if (!v10->_data)
        {
          v16 = -[NEKeychainItem copyData](v10, "copyData");
          data = v10->_data;
          v10->_data = (NSData *)v16;

        }
        identifier = v10->_identifier;
        v10->_identifier = 0;

        persistentReference = v10->_persistentReference;
        v10->_persistentReference = 0;

      }
    }
  }
  if (!v10->_data)
  {
    -[NEKeychainItem identifier](v10, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      -[NEKeychainItem persistentReference](v10, "persistentReference");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_63;
    }
  }
  ne_log_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[NEKeychainItem identifier](v10, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEKeychainItem persistentReference](v10, "persistentReference");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10->_data;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2048;
    v90 = v26;
    _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEFAULT, "Adding/Updating keychain item with identifier %@, persistentReference %@, data %p", buf, 0x20u);

  }
  v83 = v86;
  v27 = v84;
  v82 = v85;
  v28 = v10;
  objc_sync_enter(v28);
  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v87 = 0;
  v88 = 0;
  v29 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](v28, 0, &v88, &v87);
  v30 = v88;
  v31 = v88;
  v32 = (NSData *)v87;
  if (!v29)
  {
    ne_log_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      -[NEKeychainItem identifier](v28, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v43;
      _os_log_error_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve keychain item from the keychain", buf, 0xCu);

    }
    goto LABEL_61;
  }
  if (v10->_data)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = CFSTR("VPN Password");
    if (a5 == 1)
      v34 = CFSTR("IPSec XAuth Password");
    if (a5 == 2)
      v34 = CFSTR("IPSec Shared Secret");
    query = (CFDictionaryRef)v34;
    -[NEKeychainItem identifier](v28, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35 == 0;

    if (v36)
    {
      if (objc_msgSend(v82, "length"))
      {
        v37 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v83, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v37, "initWithFormat:", CFSTR("%@.%@"), v39, v82);
        v41 = v28->_identifier;
        v28->_identifier = (NSString *)v40;

      }
      else
      {
        objc_msgSend(v83, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v53 = objc_claimAutoreleasedReturnValue();
        v39 = v28->_identifier;
        v28->_identifier = (NSString *)v53;
      }

    }
    -[NEKeychainItem identifier](v28, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)*MEMORY[0x1E0CD6B58];
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0CD6B58]);

    objc_msgSend(v83, "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0CD6A90]);

    objc_msgSend(v33, "setObject:forKeyedSubscript:", query, *MEMORY[0x1E0CD69A0]);
    if (v27)
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CD68F8]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v10->_data, *MEMORY[0x1E0CD70D8]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD68A8], *MEMORY[0x1E0CD68A0]);
    -[NEKeychainItem accessGroup](v28, "accessGroup");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57 == 0;

    if (!v58)
    {
      -[NEKeychainItem accessGroup](v28, "accessGroup");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0CD6898]);

    }
    if (v31)
    {
      v60 = *MEMORY[0x1E0CD6CA8];
      result = (CFTypeRef)*MEMORY[0x1E0CD6C98];
      v95 = v55;
      *(_QWORD *)buf = v60;
      *(_QWORD *)&buf[8] = v31;
      v96 = *MEMORY[0x1E0CD70C0];
      *(_QWORD *)&buf[16] = *MEMORY[0x1E0C9AE50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &result, 3);
      v61 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v62 = SecItemUpdate(v61, (CFDictionaryRef)v33);
      if (v62)
      {
        ne_log_obj();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          -[NEKeychainItem identifier](v28, "identifier");
          v74 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v93 = 138412546;
          *(_QWORD *)&v93[4] = v74;
          *(_WORD *)&v93[12] = 1024;
          *(_DWORD *)&v93[14] = v62;
          v75 = (void *)v74;
          _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "%@: SecItemUpdate failed: %d", v93, 0x12u);

        }
      }
      else
      {
        -[NEKeychainItem setData:](v28, "setData:", 0);
      }

    }
    else
    {
      result = 0;

      objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7020]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD70C0]);
      v64 = SecItemAdd((CFDictionaryRef)v33, &result);
      if (v64)
      {
        ne_log_obj();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          -[NEKeychainItem identifier](v28, "identifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v64;
          _os_log_error_impl(&dword_19BD16000, v65, OS_LOG_TYPE_ERROR, "%@: SecItemAdd failed: %d", buf, 0x12u);

        }
        v32 = 0;
      }
      else
      {
        if (result && (v73 = CFDATA_TYPE, CFGetTypeID(result) == v73))
        {
          if (CFDataGetLength((CFDataRef)result) <= 0)
            v32 = 0;
          else
            v32 = (NSData *)result;
        }
        else
        {
          v32 = 0;
        }
        -[NEKeychainItem setData:](v28, "setData:", 0);
      }
    }

LABEL_57:
    if (!v31)
      goto LABEL_59;
    goto LABEL_58;
  }
  -[NEKeychainItem accessGroup](v28, "accessGroup");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    v45 = v31 == 0;
  else
    v45 = 1;
  v46 = !v45;

  if (!v46)
    goto LABEL_57;
  v47 = (const void *)*MEMORY[0x1E0CD6CA8];
  v48 = *MEMORY[0x1E0CD6B58];
  *(_QWORD *)v93 = *MEMORY[0x1E0CD6C98];
  *(_QWORD *)&v93[8] = v48;
  result = v47;
  v95 = v31;
  *(_QWORD *)&v93[16] = *MEMORY[0x1E0CD70C0];
  v96 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &result, v93, 3);
  querya = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v91 = *MEMORY[0x1E0CD6898];
  -[NEKeychainItem accessGroup](v28, "accessGroup");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
  v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v51 = SecItemUpdate(querya, v50);
  if (v51)
  {
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      -[NEKeychainItem identifier](v28, "identifier");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEKeychainItem accessGroup](v28, "accessGroup");
      v77 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v77;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v90) = v51;
      v78 = (void *)v77;
      _os_log_error_impl(&dword_19BD16000, v52, OS_LOG_TYPE_ERROR, "%@: SecItemUpdate failed while updating the keychain access group to %@: %d", buf, 0x1Cu);

    }
  }
  -[NEKeychainItem setAccessGroup:](v28, "setAccessGroup:", 0);

LABEL_58:
  objc_storeStrong((id *)&v28->_identifier, v30);
LABEL_59:
  if (v32)
  {
    p_super = &v28->_persistentReference->super;
    v28->_persistentReference = v32;
    v32 = v32;
LABEL_61:

  }
  objc_sync_exit(v28);

LABEL_63:
  if (objc_getProperty(v10, v22, 72, 1))
  {
    ne_log_obj();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v68 = objc_getProperty(v10, v67, 72, 1);
      objc_msgSend(v68, "identifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v69;
      _os_log_impl(&dword_19BD16000, v66, OS_LOG_TYPE_DEFAULT, "%@: Removing keychain item", buf, 0xCu);

    }
    v71 = objc_getProperty(v10, v70, 72, 1);
    objc_msgSend(v71, "remove");

  }
  -[NEKeychainItem setData:](v10, "setData:", 0);
  objc_setProperty_atomic_copy(v10, v72, 0, 72);
  objc_sync_exit(v10);

}

- (void)migrateFromPreferences:(__SCPreferences *)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[NEKeychainItem copyData](self, "copyData");
  if (!v4)
  {
    -[NEKeychainItem identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)_SCPreferencesSystemKeychainPasswordItemCopy();

    if (v4)
    {
      -[NEKeychainItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = _SCPreferencesSystemKeychainPasswordItemRemove();

      if (v7)
      {
        -[NEKeychainItem setData:](self, "setData:", v4);
      }
      else
      {
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          -[NEKeychainItem identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = SCError();
          v11 = 138412546;
          v12 = v9;
          v13 = 2080;
          v14 = SCErrorString(v10);
          _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@: _SCPreferencesSystemKeychainPasswordItemRemove failed: %s", (uint8_t *)&v11, 0x16u);

        }
      }
    }
  }

}

- (NSData)keyPersistentReference
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyPersistentReference:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isModernSystem
{
  return self->_isModernSystem;
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldItem, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_keyPersistentReference, 0);
  objc_storeStrong((id *)&self->_persistentReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (uint64_t)copyDataFromKeychainItem:(void *)a1 outData:(const __CFData *)a2 outIdentifier:(_QWORD *)a3 outPersistentReference:(_QWORD *)a4
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFData *v17;
  void *v18;
  const __CFData *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  CFTypeRef result;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  OSStatus v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  result = 0;
  objc_msgSend(a1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    goto LABEL_5;
  }
  objc_msgSend(a1, "persistentReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_5:
    if (a2)
      objc_msgSend(v8, "addObject:", *MEMORY[0x1E0CD7018]);
    if (a3)
      objc_msgSend(v8, "addObject:", *MEMORY[0x1E0CD7010]);
    if (a4)
      objc_msgSend(v8, "addObject:", *MEMORY[0x1E0CD7020]);
    v11 = (void *)objc_msgSend(a1, "copyQueryWithReturnTypes:", v8);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F40], *MEMORY[0x1E0CD6F30]);
    v12 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
    v13 = v12;
    if (v12)
    {
      if (v12 == -25300)
      {
LABEL_56:
        if (result)
          CFRelease(result);
        if (v13)
          v25 = v13 == -25300;
        else
          v25 = 1;
        v20 = v25;

        goto LABEL_65;
      }
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v15;
        v30 = 1024;
        v31 = v13;
        _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@: SecItemCopyMatching failed: %d", buf, 0x12u);

      }
    }
    else if (objc_msgSend(v8, "count") == 1)
    {
      if (a2)
      {
        v16 = (id)result;
        if (isa_nsdata(v16))
        {
          if (+[NSData isSensitiveDataInstance:](MEMORY[0x1E0C99D50], v16))
            v17 = objc_retainAutorelease(v16);
          else
            v17 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v16);
          *a2 = v17;
        }

      }
      if (a3)
      {
        v21 = (id)result;
        if (isa_nsdictionary(v21))
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v22) && objc_msgSend(v22, "length"))
            *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v22);

        }
      }
      if (!a4)
        goto LABEL_56;
      v14 = (id)result;
      if (isa_nsdata(v14) && -[NSObject length](v14, "length"))
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v14);
    }
    else
    {
      v14 = (id)result;
      if (isa_nsdictionary(v14))
      {
        if (a2)
        {
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsdata(v18) && objc_msgSend(v18, "length") && isa_nsdata(v18))
          {
            if (+[NSData isSensitiveDataInstance:](MEMORY[0x1E0C99D50], v18))
              v19 = objc_retainAutorelease(v18);
            else
              v19 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v18);
            *a2 = v19;
          }

        }
        if (a3)
        {
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v23) && objc_msgSend(v23, "length"))
            *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v23);

        }
        if (a4)
        {
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsdata(v24) && objc_msgSend(v24, "length"))
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v24);

        }
      }
    }

    goto LABEL_56;
  }
  v20 = 1;
LABEL_65:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
