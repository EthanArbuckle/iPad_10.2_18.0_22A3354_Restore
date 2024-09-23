@implementation CRKASMCredentialStore

- (CRKASMCredentialStore)initWithKeychain:(id)a3 accessGroup:(id)a4 certificateManifestStorageKey:(id)a5 identityManifestStorageKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRKASMCredentialStore *v15;
  CRKASMCredentialStore *v16;
  uint64_t v17;
  CRKAnnotatedCredentialStore *certificateAnnotatedStore;
  uint64_t v19;
  CRKAnnotatedCredentialStore *identityAnnotatedStore;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKASMCredentialStore;
  v15 = -[CRKASMCredentialStore init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keychain, a3);
    +[CRKAnnotatedCredentialStore certificateStoreWithKeychain:accessGroup:manifestStorageKey:](CRKAnnotatedCredentialStore, "certificateStoreWithKeychain:accessGroup:manifestStorageKey:", v11, v12, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    certificateAnnotatedStore = v16->_certificateAnnotatedStore;
    v16->_certificateAnnotatedStore = (CRKAnnotatedCredentialStore *)v17;

    +[CRKAnnotatedCredentialStore identityStoreWithKeychain:accessGroup:manifestStorageKey:](CRKAnnotatedCredentialStore, "identityStoreWithKeychain:accessGroup:manifestStorageKey:", v11, v12, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    identityAnnotatedStore = v16->_identityAnnotatedStore;
    v16->_identityAnnotatedStore = (CRKAnnotatedCredentialStore *)v19;

  }
  return v16;
}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("Certificates");
  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("Identities");
  v10[0] = v4;
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (CRKASMCredentialManifest)certificateManifest
{
  CRKASMCredentialManifest *v3;
  void *v4;
  void *v5;
  CRKASMCredentialManifest *v6;

  v3 = [CRKASMCredentialManifest alloc];
  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKASMCredentialManifest initWithAnnotatedManifest:](v3, "initWithAnnotatedManifest:", v5);

  return v6;
}

- (id)certificateWithPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialWithPersistentID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeCertificatesWithPersistentIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCredentialsWithPersistentIDs:", v4);

}

- (void)forgetCertificatesWithPersistentIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forgetCredentialsWithPersistentIDs:", v4);

}

- (id)makeCertificateWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4
{
  void *v4;
  void *v5;

  -[CRKASMCredentialStore makeIdentityWithCommonNamePrefix:userIdentifier:](self, "makeIdentityWithCommonNamePrefix:userIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "certificate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearCertificates
{
  void *v3;
  id v4;

  -[CRKASMCredentialStore certificateManifest](self, "certificateManifest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialStore removeCertificatesWithPersistentIDs:](self, "removeCertificatesWithPersistentIDs:", v3);

}

- (id)addCertificate:(id)a3 forUserIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialStore addCertificates:forUserIdentifier:](self, "addCertificates:forUserIdentifier:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)addCertificates:(id)a3 forUserIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:](self, "makeEntryWithCertificate:userIdentifier:", v15, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v9, "setObject:forKey:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[CRKASMCredentialStore addEntriesByCertificate:](self, "addEntriesByCertificate:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)addCertificate:(id)a3 entry:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v7);
  -[CRKASMCredentialStore addEntriesByCertificate:](self, "addEntriesByCertificate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)addEntriesByCertificate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CRKAnnotatedCredential *v14;
  void *v15;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "dictionaryValue");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = -[CRKAnnotatedCredential initWithCredential:annotation:]([CRKAnnotatedCredential alloc], "initWithCredential:annotation:", v10, v13);
          objc_msgSend(v4, "addObject:", v14);

        }
        else
        {
          _CRKLogASM_6();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v10;
            _os_log_error_impl(&dword_218C99000, v13, OS_LOG_TYPE_ERROR, "No entry found for certificate %@", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  -[CRKASMCredentialStore certificateAnnotatedStore](self, "certificateAnnotatedStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addCredentials:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CRKASMCredentialManifest)identityManifest
{
  CRKASMCredentialManifest *v3;
  void *v4;
  void *v5;
  CRKASMCredentialManifest *v6;

  v3 = [CRKASMCredentialManifest alloc];
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKASMCredentialManifest initWithAnnotatedManifest:](v3, "initWithAnnotatedManifest:", v5);

  return v6;
}

- (id)identityWithPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialWithPersistentID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeIdentitiesWithPersistentIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCredentialsWithPersistentIDs:", v4);

}

- (void)forgetIdentitiesWithPersistentIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forgetCredentialsWithPersistentIDs:", v4);

}

- (id)makeIdentityWithCommonNamePrefix:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  CRKASMCertificateCommonName *v8;
  CRKIdentityConfiguration *v9;
  void *v10;
  CRKIdentityConfiguration *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKASMCertificateCommonName initWithPrefix:userIdentifier:]([CRKASMCertificateCommonName alloc], "initWithPrefix:userIdentifier:", v7, v6);

  v9 = [CRKIdentityConfiguration alloc];
  -[CRKASMCertificateCommonName stringValue](v8, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRKIdentityConfiguration initWithCommonName:](v9, "initWithCommonName:", v10);

  -[CRKASMCredentialStore keychain](self, "keychain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeIdentityWithConfiguration:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)clearIdentities
{
  void *v3;
  id v4;

  -[CRKASMCredentialStore identityManifest](self, "identityManifest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialStore removeIdentitiesWithPersistentIDs:](self, "removeIdentitiesWithPersistentIDs:", v3);

}

- (id)addIdentity:(id)a3 forUserIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userIdentifier"));

LABEL_3:
  objc_msgSend(v7, "certificate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:](self, "makeEntryWithCertificate:userIdentifier:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CRKASMCredentialStore addIdentity:entry:](self, "addIdentity:entry:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)addIdentity:(id)a3 entry:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CRKAnnotatedCredential *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMCredentialStore.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "dictionaryValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRKAnnotatedCredential initWithCredential:annotation:]([CRKAnnotatedCredential alloc], "initWithCredential:annotation:", v7, v10);
  -[CRKASMCredentialStore identityAnnotatedStore](self, "identityAnnotatedStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addCredentials:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makeEntryWithCertificate:(id)a3 userIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CRKASMCredentialManifestEntry *v10;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _CRKLogASM_6();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:].cold.1();
    goto LABEL_13;
  }
  if (!v5)
  {
    _CRKLogASM_6();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:].cold.2();
LABEL_13:
    v10 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v5, "validityDateInterval");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "fingerprint");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _CRKLogASM_6();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:].cold.4();

    }
    v10 = -[CRKASMCredentialManifestEntry initWithUserIdentifier:validityInterval:fingerprint:]([CRKASMCredentialManifestEntry alloc], "initWithUserIdentifier:validityInterval:fingerprint:", v6, v7, v8);
  }
  else
  {
    _CRKLogASM_6();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CRKASMCredentialStore makeEntryWithCertificate:userIdentifier:].cold.3();
    v10 = 0;
  }

LABEL_18:
  return v10;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (CRKAnnotatedCredentialStore)certificateAnnotatedStore
{
  return self->_certificateAnnotatedStore;
}

- (CRKAnnotatedCredentialStore)identityAnnotatedStore
{
  return self->_identityAnnotatedStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityAnnotatedStore, 0);
  objc_storeStrong((id *)&self->_certificateAnnotatedStore, 0);
  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_218C99000, v0, v1, "Could not create manifest entry: nil user identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_218C99000, v0, v1, "Could not create manifest entry: nil certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_218C99000, v0, v1, "Could not create manifest entry: nil certificate validity interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)makeEntryWithCertificate:userIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_218C99000, v0, v1, "Could not create manifest entry: nil certificate fingerprint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
