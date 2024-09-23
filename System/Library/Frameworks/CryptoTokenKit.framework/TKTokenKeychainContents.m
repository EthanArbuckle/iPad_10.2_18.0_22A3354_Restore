@implementation TKTokenKeychainContents

- (TKTokenKeychainContents)initWithConfiguration:(id)a3
{
  id v5;
  TKTokenKeychainContents *v6;
  TKTokenKeychainContents *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeychainContents;
  v6 = -[TKTokenKeychainContents init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (TKTokenKeychainContents)initWithTokenID:(id)a3
{
  id v5;
  TKTokenID *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TKTokenKeychainContents *v14;
  void *v16;

  v5 = a3;
  v6 = -[TKTokenID initWithTokenID:]([TKTokenID alloc], "initWithTokenID:", v5);

  +[TKTokenDriverConfiguration driverConfigurations](TKTokenDriverConfiguration, "driverConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenID classID](v6, "classID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenKeychainItem.m"), 522, CFSTR("Failed to get driver configuration for %@"), v6);

  }
  objc_msgSend(v9, "tokenConfigurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenID instanceID](v6, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[TKTokenID instanceID](v6, "instanceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTokenConfigurationForTokenInstanceID:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = -[TKTokenKeychainContents initWithConfiguration:](self, "initWithConfiguration:", v12);

  return v14;
}

- (void)fillWithItems:(NSArray *)items
{
  NSArray *v4;
  void *v5;
  NSArray *v6;

  v4 = items;
  -[TKTokenKeychainContents configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeychainItems:", v4);

  v6 = self->_items;
  self->_items = v4;

}

- (NSArray)items
{
  NSArray *items;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  items = self->_items;
  if (!items)
  {
    -[TKTokenKeychainContents configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keychainItems");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_items;
    self->_items = v5;

    items = self->_items;
  }
  return items;
}

- (NSDictionary)certificates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TKTokenKeychainContents items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v11;
}

- (NSDictionary)keys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TKTokenKeychainContents items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v11;
}

- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v6 = objectID;
  -[TKTokenKeychainContents certificates](self, "certificates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    TK_LOG_token_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TKTokenConfiguration keyForObjectID:error:].cold.1((uint64_t)v6, self);

    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, MEMORY[0x1E0C9AA70]);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (TKTokenKeychainCertificate *)v8;
}

- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v6 = objectID;
  -[TKTokenKeychainContents keys](self, "keys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    TK_LOG_token_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TKTokenConfiguration certificateForObjectID:error:].cold.1((uint64_t)v6, self);

    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, MEMORY[0x1E0C9AA70]);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (TKTokenKeychainKey *)v8;
}

- (id)certificateForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TKTokenKeychainContents items](self, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "publicKeyHash");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "publicKeyHash");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToData:", v11);

          if ((v12 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (TKTokenConfiguration)configuration
{
  return (TKTokenConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tokenID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
