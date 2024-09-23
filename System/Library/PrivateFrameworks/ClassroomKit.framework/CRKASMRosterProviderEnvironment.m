@implementation CRKASMRosterProviderEnvironment

- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3
{
  id v4;
  CRKASMCertificateVendor *v5;
  void *v6;
  CRKASMCertificateVendor *v7;
  CRKASMUserFactory *v8;
  CRKASMRosterProviderEnvironment *v9;

  v4 = a3;
  v5 = [CRKASMCertificateVendor alloc];
  objc_msgSend(v4, "credentialStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKASMCertificateVendor initWithCredentialStore:](v5, "initWithCredentialStore:", v6);

  v8 = -[CRKASMUserFactory initWithConfiguration:certificateVendor:]([CRKASMUserFactory alloc], "initWithConfiguration:certificateVendor:", v4, v7);
  v9 = -[CRKASMRosterProviderEnvironment initWithConfiguration:certificateVendor:userFactory:](self, "initWithConfiguration:certificateVendor:userFactory:", v4, v7, v8);

  return v9;
}

- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3 certificateVendor:(id)a4 userFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKASMRosterProviderEnvironment *v12;
  CRKASMRosterProviderEnvironment *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKASMRosterProviderEnvironment;
  v12 = -[CRKASMRosterProviderEnvironment init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_certificateVendor, a4);
    objc_storeStrong((id *)&v13->_userFactory, a5);
  }

  return v13;
}

- (id)identityVendorForUserIdentifier:(id)a3
{
  id v4;
  CRKASMIdentityVendor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRKASMIdentityVendor *v10;

  v4 = a3;
  v5 = [CRKASMIdentityVendor alloc];
  -[CRKASMRosterProviderEnvironment configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userCommonNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderEnvironment configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKASMIdentityVendor initWithUserIdentifier:commonNamePrefix:credentialStore:](v5, "initWithUserIdentifier:commonNamePrefix:credentialStore:", v4, v7, v9);

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CRKASMRosterProviderEnvironment configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMRosterProviderEnvironment certificateVendor](self, "certificateVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKASMRosterProviderEnvironment userFactory](self, "userFactory");
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
  CRKASMRosterProviderEnvironment *v8;
  CRKASMRosterProviderEnvironment *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMRosterProviderEnvironment *v17;
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
  objc_msgSend(CFSTR("configuration, certificateVendor, userFactory"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_2;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMRosterProviderEnvironment *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMRosterProviderEnvironment isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKASMRosterProviderEnvironment valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMRosterProviderEnvironment valueForKey:](v17, "valueForKey:", v16);
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

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (CRKASMUserFactory)userFactory
{
  return self->_userFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFactory, 0);
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
