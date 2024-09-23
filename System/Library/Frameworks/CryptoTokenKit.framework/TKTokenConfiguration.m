@implementation TKTokenConfiguration

+ (NSXPCInterface)interfaceForProtocol
{
  if (interfaceForProtocol_onceToken != -1)
    dispatch_once(&interfaceForProtocol_onceToken, &__block_literal_global_84);
  return (NSXPCInterface *)(id)interfaceForProtocol_interface;
}

void __44__TKTokenConfiguration_interfaceForProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237C38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceForProtocol_interface;
  interfaceForProtocol_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)interfaceForProtocol_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getTokenIDsForClassID_reply_, 0, 1);

}

+ (NSXPCInterface)interfaceForChangeProtocol
{
  if (interfaceForChangeProtocol_onceToken != -1)
    dispatch_once(&interfaceForChangeProtocol_onceToken, &__block_literal_global_114);
  return (NSXPCInterface *)(id)interfaceForChangeProtocol_interface;
}

void __50__TKTokenConfiguration_interfaceForChangeProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF2325D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceForChangeProtocol_interface;
  interfaceForChangeProtocol_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)interfaceForChangeProtocol_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_tokenConfigurationChanged_, 0, 0);

}

- (TKTokenConfiguration)initWithTokenID:(id)a3 configurationConnection:(id)a4
{
  id v7;
  id v8;
  TKTokenConfiguration *v9;
  TKTokenConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKTokenConfiguration;
  v9 = -[TKTokenConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationConnection, a4);
    objc_msgSend(v8, "registerForConfigurationChange:", v10);
    objc_storeStrong((id *)&v10->_tokenID, a3);
  }

  return v10;
}

- (TKTokenInstanceID)instanceID
{
  return -[TKTokenID instanceID](self->_tokenID, "instanceID");
}

- (void)tokenConfigurationChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  TKTokenConfiguration *v9;
  NSArray *keychainItems;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[TKTokenID isEqual:](self->_tokenID, "isEqual:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = self;
          objc_sync_enter(v9);
          keychainItems = v9->_keychainItems;
          v9->_keychainItems = 0;

          objc_sync_exit(v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)beginTransaction
{
  void *v3;

  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTransactionWithReply:", &__block_literal_global_117);

  return -[TKTokenConfigurationTransaction initWithConfigurationConnection:]([TKTokenConfigurationTransaction alloc], "initWithConfigurationConnection:", self->_configurationConnection);
}

- (NSData)configurationData
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenConfiguration tokenID](self, "tokenID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__TKTokenConfiguration_configurationData__block_invoke;
  v7[3] = &unk_1E7089880;
  v7[4] = &v8;
  objc_msgSend(v3, "readDataForTokenID:reply:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

void __41__TKTokenConfiguration_configurationData__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setConfigurationData:(NSData *)configurationData
{
  TKTokenConfigurationConnection *configurationConnection;
  NSData *v5;
  void *v6;
  id v7;

  configurationConnection = self->_configurationConnection;
  v5 = configurationData;
  -[TKTokenConfigurationConnection configurationProtocol](configurationConnection, "configurationProtocol");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TKTokenConfiguration tokenID](self, "tokenID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTokenID:data:reply:", v6, v5, &__block_literal_global_120);

}

- (NSArray)keychainItems
{
  TKTokenConfiguration *v2;
  NSArray *keychainItems;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[4];
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  keychainItems = v2->_keychainItems;
  if (!keychainItems)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    -[TKTokenConfigurationConnection configurationProtocol](v2->_configurationConnection, "configurationProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenConfiguration tokenID](v2, "tokenID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__TKTokenConfiguration_keychainItems__block_invoke;
    v12[3] = &unk_1E70898C8;
    v7 = v4;
    v13 = v7;
    objc_msgSend(v5, "getKeychainItemsForTokenID:reply:", v6, v12);

    v8 = objc_msgSend(v7, "copy");
    v9 = v2->_keychainItems;
    v2->_keychainItems = (NSArray *)v8;

    keychainItems = v2->_keychainItems;
  }
  v10 = keychainItems;
  objc_sync_exit(v2);

  return v10;
}

void __37__TKTokenConfiguration_keychainItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        +[TKTokenKeychainItem keychainItemWithInfo:](TKTokenKeychainItem, "keychainItemWithInfo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (BOOL)_hasSeparateKeysAndCertificatesObjectIDSpace
{
  BOOL result;

  if (_hasSeparateKeysAndCertificatesObjectIDSpaceIsSet == 1)
    return _hasSeparateKeysAndCertificatesObjectIDSpace != 0;
  result = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpace = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSet = 1;
  return result;
}

+ (void)set_hasSeparateKeysAndCertificatesObjectIDSpace:(BOOL)a3
{
  _hasSeparateKeysAndCertificatesObjectIDSpace = a3;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSet = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally = 1;
}

- (void)setKeychainItems:(NSArray *)keychainItems
{
  NSArray *v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  TKTokenConfiguration *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = keychainItems;
  TK_LOG_tokencfg();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TKTokenConfiguration setKeychainItems:].cold.1((uint64_t)v3, v4);

  if (-[NSArray count](v3, "count"))
  {
    v5 = 0;
    v6 = *MEMORY[0x1E0C99768];
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = ++v5;
      if (v5 < -[NSArray count](v3, "count"))
        break;
LABEL_23:

      if (v5 >= -[NSArray count](v3, "count"))
        goto LABEL_24;
    }
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = CFSTR("Detected duplicate objectID for objects %@ and %@");
          if ((_hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally & 1) == 0)
          {
            TK_LOG_tokencfg();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v7;
              v38 = 2114;
              v39 = v9;
              v15 = v14;
              v16 = "Detected duplicate objectID for objects %{public}@ and %{public}@";
              goto LABEL_22;
            }
            goto LABEL_17;
          }
          goto LABEL_18;
        }
        if ((objc_msgSend((id)objc_opt_class(), "_hasSeparateKeysAndCertificatesObjectIDSpace") & 1) == 0)
        {
          v13 = CFSTR("Detected duplicate objectID for key %@ and certificate %@. This is allowed only for token extensions built for macOS 10.16 or newer. Either change build options to target newer OS version or avoid sharing same objectID for key and certificate.");
          if ((_hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally & 1) == 0)
          {
            TK_LOG_tokencfg();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v7;
              v38 = 2114;
              v39 = v9;
              v15 = v14;
              v16 = "Detected duplicate objectID for key %{public}@ and certificate %{public}@. This is allowed only for "
                    "token extensions built for macOS 10.16 or newer. Either change build options to target newer OS vers"
                    "ion or avoid sharing same objectID for key and certificate.";
LABEL_22:
              _os_log_fault_impl(&dword_1B9768000, v15, OS_LOG_TYPE_FAULT, v16, buf, 0x16u);
            }
LABEL_17:

          }
LABEL_18:
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v6, v13, v7, v9);
        }
      }

      if (++v8 >= -[NSArray count](v3, "count"))
        goto LABEL_23;
    }
  }
LABEL_24:
  v17 = self;
  objc_sync_enter(v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v3, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v3;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[TKTokenConfiguration tokenID](v17, "tokenID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTokenID:", v24);

        objc_msgSend(v23, "keychainAttributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  -[TKTokenConfigurationConnection configurationProtocol](v17->_configurationConnection, "configurationProtocol");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenConfiguration tokenID](v17, "tokenID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateKeychainItemsForTokenID:items:reply:", v27, v18, &__block_literal_global_131);

  v28 = -[NSArray copy](v19, "copy");
  v29 = v17->_keychainItems;
  v17->_keychainItems = (NSArray *)v28;

  objc_sync_exit(v17);
}

- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objectID;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TKTokenConfiguration keychainItems](self, "keychainItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v5);

          if ((v13 & 1) != 0)
          {
            v15 = v11;

            goto LABEL_16;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  TK_LOG_tokencfg();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[TKTokenConfiguration keyForObjectID:error:].cold.1((uint64_t)v5, self);

  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, MEMORY[0x1E0C9AA70]);
    v15 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return (TKTokenKeychainKey *)v15;
}

- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objectID;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TKTokenConfiguration keychainItems](self, "keychainItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v5);

          if ((v13 & 1) != 0)
          {
            v15 = v11;

            goto LABEL_16;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  TK_LOG_tokencfg();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[TKTokenConfiguration certificateForObjectID:error:].cold.1((uint64_t)v5, self);

  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, MEMORY[0x1E0C9AA70]);
    v15 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return (TKTokenKeychainCertificate *)v15;
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_keychainItems, 0);
  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

- (void)setKeychainItems:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1B9768000, a2, OS_LOG_TYPE_DEBUG, "Configuration got items: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)keyForObjectID:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "tokenID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1B9768000, v3, v4, "Cannot find requested key %{public}@ on token %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)certificateForObjectID:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "tokenID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1B9768000, v3, v4, "Cannot find requested certificate %{public}@ on token %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
