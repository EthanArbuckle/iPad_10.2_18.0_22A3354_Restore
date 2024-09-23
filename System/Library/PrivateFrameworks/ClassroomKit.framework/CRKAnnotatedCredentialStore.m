@implementation CRKAnnotatedCredentialStore

+ (id)certificateStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  CRKAnnotatedCredentialStore *v15;
  CRKAnnotatedCredentialStore *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a3;
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke;
  v23[3] = &unk_24D9C6C38;
  v9 = v7;
  v24 = v9;
  v10 = a5;
  v11 = a4;
  v12 = (void *)MEMORY[0x219A226E8](v23);
  v18 = v8;
  v19 = 3221225472;
  v20 = __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2;
  v21 = &unk_24D9C6C60;
  v22 = v9;
  v13 = v9;
  v14 = (void *)MEMORY[0x219A226E8](&v18);
  v15 = [CRKAnnotatedCredentialStore alloc];
  v16 = -[CRKAnnotatedCredentialStore initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:](v15, "initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:", v13, v11, v10, v12, v14, v18, v19, v20, v21);

  return v16;
}

uint64_t __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCertificate:toAccessGroup:", a2, a3);
}

uint64_t __91__CRKAnnotatedCredentialStore_certificateStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "certificateWithPersistentID:", a2);
}

+ (id)identityStoreWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  CRKAnnotatedCredentialStore *v15;
  CRKAnnotatedCredentialStore *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a3;
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke;
  v23[3] = &unk_24D9C6C88;
  v9 = v7;
  v24 = v9;
  v10 = a5;
  v11 = a4;
  v12 = (void *)MEMORY[0x219A226E8](v23);
  v18 = v8;
  v19 = 3221225472;
  v20 = __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2;
  v21 = &unk_24D9C6CB0;
  v22 = v9;
  v13 = v9;
  v14 = (void *)MEMORY[0x219A226E8](&v18);
  v15 = [CRKAnnotatedCredentialStore alloc];
  v16 = -[CRKAnnotatedCredentialStore initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:](v15, "initWithKeychain:accessGroup:manifestStorageKey:addBlock:fetchBlock:", v13, v11, v10, v12, v14, v18, v19, v20, v21);

  return v16;
}

uint64_t __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIdentity:toAccessGroup:", a2, a3);
}

uint64_t __88__CRKAnnotatedCredentialStore_identityStoreWithKeychain_accessGroup_manifestStorageKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "identityWithPersistentID:", a2);
}

- (CRKAnnotatedCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 manifestStorageKey:(id)a5 addBlock:(id)a6 fetchBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CRKAnnotatedCredentialStore *v18;
  CRKAnnotatedCredentialStore *v19;
  uint64_t v20;
  NSString *accessGroup;
  uint64_t v22;
  NSString *manifestStorageKey;
  uint64_t v24;
  id addBlock;
  uint64_t v26;
  id fetchBlock;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CRKAnnotatedCredentialStore;
  v18 = -[CRKAnnotatedCredentialStore init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_keychain, a3);
    v20 = objc_msgSend(v14, "copy");
    accessGroup = v19->_accessGroup;
    v19->_accessGroup = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    manifestStorageKey = v19->_manifestStorageKey;
    v19->_manifestStorageKey = (NSString *)v22;

    v24 = MEMORY[0x219A226E8](v16);
    addBlock = v19->_addBlock;
    v19->_addBlock = (id)v24;

    v26 = MEMORY[0x219A226E8](v17);
    fetchBlock = v19->_fetchBlock;
    v19->_fetchBlock = (id)v26;

  }
  return v19;
}

- (NSDictionary)debugInfo
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Manifest");
  -[CRKAnnotatedCredentialStore manifest](self, "manifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (CRKAnnotatedCredentialManifest)manifest
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[CRKAnnotatedCredentialStore storedManifest](self, "storedManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return (CRKAnnotatedCredentialManifest *)v5;
}

- (id)addCredentials:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[CRKAnnotatedCredentialStore manifest](self, "manifest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[CRKAnnotatedCredentialStore addCredential:manifest:](self, "addCredential:manifest:", v12, v6, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "credential");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v13, v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "modified"))
      -[CRKAnnotatedCredentialStore setStoredManifest:](self, "setStoredManifest:", v6);

  }
  return v5;
}

- (id)credentialWithPersistentID:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[CRKAnnotatedCredentialStore fetchBlock](self, "fetchBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeCredentialsWithPersistentIDs:(id)a3
{
  id v4;

  v4 = a3;
  -[CRKAnnotatedCredentialStore removePersistentIDsFromKeychain:](self, "removePersistentIDsFromKeychain:", v4);
  -[CRKAnnotatedCredentialStore forgetCredentialsWithPersistentIDs:](self, "forgetCredentialsWithPersistentIDs:", v4);

}

- (void)forgetCredentialsWithPersistentIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CRKAnnotatedCredentialStore storedManifest](self, "storedManifest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "removePersistentID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "modified"))
      -[CRKAnnotatedCredentialStore setStoredManifest:](self, "setStoredManifest:", v5);

  }
}

- (id)addCredential:(id)a3 manifest:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CRKAnnotatedCredentialStore addBlock](self, "addBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKAnnotatedCredentialStore accessGroup](self, "accessGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v8)[2](v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPersistentID:withAnnotation:", v11, v12);

    v13 = v11;
  }

  return v11;
}

- (void)removePersistentIDsFromKeychain:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[CRKAnnotatedCredentialStore keychain](self, "keychain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeItemWithPersistentID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)storedManifest
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[CRKAnnotatedCredentialStore storedManifestData](self, "storedManifestData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CRKAnnotatedCredentialManifest manifestWithData:](CRKAnnotatedCredentialManifest, "manifestWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (_CRKLogASM_onceToken != -1)
        dispatch_once(&_CRKLogASM_onceToken, &__block_literal_global);
      v5 = _CRKLogASM_logObj;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj, OS_LOG_TYPE_ERROR))
        -[CRKAnnotatedCredentialStore storedManifest].cold.1(v5);
      -[CRKAnnotatedCredentialStore setStoredManifestData:](self, "setStoredManifestData:", 0);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStoredManifest:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKAnnotatedCredentialStore setStoredManifestData:](self, "setStoredManifestData:", v4);

}

- (id)storedManifestData
{
  void *v3;
  void *v4;

  -[CRKAnnotatedCredentialStore manifestStorageKey](self, "manifestStorageKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKAnnotatedCredentialStore dataForStorageKey:](self, "dataForStorageKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setStoredManifestData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKAnnotatedCredentialStore manifestStorageKey](self, "manifestStorageKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKAnnotatedCredentialStore setData:forStorageKey:](self, "setData:forStorageKey:", v4, v5);

}

- (void)setData:(id)a3 forStorageKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CRKAnnotatedCredentialStore keychain](self, "keychain");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKAnnotatedCredentialStore accessGroup](self, "accessGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPassword:forService:accessGroup:", v7, v6, v8);

}

- (id)dataForStorageKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKAnnotatedCredentialStore keychain](self, "keychain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)manifestStorageKey
{
  return self->_manifestStorageKey;
}

- (id)addBlock
{
  return self->_addBlock;
}

- (id)fetchBlock
{
  return self->_fetchBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchBlock, 0);
  objc_storeStrong(&self->_addBlock, 0);
  objc_storeStrong((id *)&self->_manifestStorageKey, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)storedManifest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize stored manifest data. Deleting stored data...", v1, 2u);
}

@end
