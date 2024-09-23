@implementation CRKASMIdentityVendor

- (CRKASMIdentityVendor)initWithUserIdentifier:(id)a3 commonNamePrefix:(id)a4 credentialStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKASMIdentityVendor *v11;
  uint64_t v12;
  NSString *userIdentifier;
  uint64_t v14;
  NSString *commonNamePrefix;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMIdentityVendor;
  v11 = -[CRKASMIdentityVendor init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    commonNamePrefix = v11->_commonNamePrefix;
    v11->_commonNamePrefix = (NSString *)v14;

    objc_storeStrong((id *)&v11->_credentialStore, a5);
  }

  return v11;
}

- (CRKIdentity)identity
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CRKASMIdentityVendor existingIdentity](self, "existingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CRKASMIdentityVendor makeIdentityAndAddToKeychain](self, "makeIdentityAndAddToKeychain");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (CRKIdentity *)v6;
}

- (id)existingIdentity
{
  CRKASMIdentityPicker *v3;
  void *v4;
  void *v5;
  CRKASMIdentityPicker *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = [CRKASMIdentityPicker alloc];
  -[CRKASMIdentityVendor credentialStore](self, "credentialStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKASMIdentityPicker initWithCredentialStore:userIdentifier:](v3, "initWithCredentialStore:userIdentifier:", v4, v5);

  -[CRKASMIdentityPicker identity](v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _CRKLogASM_8();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Found existing ASM identity for user identifier %@", (uint8_t *)&v11, 0xCu);

    }
  }

  return v7;
}

- (id)makeIdentityAndAddToKeychain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;

  -[CRKASMIdentityVendor makeIdentity](self, "makeIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CRKASMIdentityVendor credentialStore](self, "credentialStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addIdentity:forUserIdentifier:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _CRKLogASM_8();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CRKASMIdentityVendor makeIdentityAndAddToKeychain].cold.1(v7);

    }
    v8 = v3;

  }
  return v3;
}

- (id)makeIdentity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CRKLogASM_8();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Creating new identity for ASM user identifier %@", (uint8_t *)&v10, 0xCu);

  }
  -[CRKASMIdentityVendor credentialStore](self, "credentialStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityVendor commonNamePrefix](self, "commonNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeIdentityWithCommonNamePrefix:userIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMIdentityVendor commonNamePrefix](self, "commonNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKASMIdentityVendor credentialStore](self, "credentialStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMIdentityVendor *v8;
  CRKASMIdentityVendor *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMIdentityVendor *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("userIdentifier, commonNamePrefix, credentialStore"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_8;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMIdentityVendor *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMIdentityVendor isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKASMIdentityVendor valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMIdentityVendor valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKASMIdentityVendor userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityVendor commonNamePrefix](self, "commonNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityVendor credentialStore](self, "credentialStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { userIdentifier = %@, commonNamePrefix = %@, credentialStore = %@ }>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)commonNamePrefix
{
  return self->_commonNamePrefix;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_commonNamePrefix, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)makeIdentityAndAddToKeychain
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Failed to add ASM user identity to keychain", v1, 2u);
}

@end
