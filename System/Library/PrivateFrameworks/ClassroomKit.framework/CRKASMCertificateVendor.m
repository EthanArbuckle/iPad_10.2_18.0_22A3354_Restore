@implementation CRKASMCertificateVendor

- (CRKASMCertificateVendor)initWithCredentialStore:(id)a3
{
  id v5;
  CRKASMCertificateVendor *v6;
  CRKASMCertificateVendor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMCertificateVendor;
  v6 = -[CRKASMCertificateVendor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_credentialStore, a3);

  return v7;
}

- (id)certificatesForUserIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCertificateVendor certificatesForUserIdentifiers:](self, "certificatesForUserIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)certificatesForUserIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CRKASMCertificateVendor *v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  v37 = self;
  -[CRKASMCertificateVendor manifest](self, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process certificate manifest contents for %lu user identifiers"), objc_msgSend(v4, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v5, "persistentIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  v35 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    v34 = v4;
    do
    {
      v9 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x219A22538]();
        objc_msgSend(v5, "entryForPersistentID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isFullyPopulated"))
        {
          objc_msgSend(v12, "userIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v4, "containsObject:", v13);

          objc_msgSend(v12, "validityInterval");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "crk_containsCurrentDate");

          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (v17)
          {
            v7 = v38;
            goto LABEL_24;
          }
          -[CRKASMCertificateVendor credentialStore](v37, "credentialStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "certificateWithPersistentID:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v12, "fingerprint");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20 || (objc_msgSend(v19, "fingerprint"), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v12, "fingerprint");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "fingerprint");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isEqual:", v22);

              if (v20)
              else

              v4 = v34;
              v5 = v35;
              if ((v23 & 1) == 0)
                goto LABEL_20;
            }
            else
            {
              v33 = 0;
            }
            v24 = v32;
            v25 = v19;
          }
          else
          {
LABEL_20:
            v24 = v36;
            v25 = v10;
          }
          objc_msgSend(v24, "addObject:", v25);
          v7 = v38;

        }
LABEL_24:

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v7);
  }

  -[CRKASMCertificateVendor forgetPersistentIDs:](v37, "forgetPersistentIDs:", v36);
  _CRKLogASM_17();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v30, "stop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v27;
    _os_log_impl(&dword_218C99000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v28 = (void *)objc_msgSend(v32, "copy");

  return v28;
}

- (id)manifest
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:", CFSTR("Read certificate manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCertificateVendor credentialStore](self, "credentialStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "certificateManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _CRKLogASM_17();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "stop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v9, 0xCu);

  }
  return v5;
}

- (void)forgetPersistentIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    _CRKLogASM_17();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRKASMCertificateVendor forgetPersistentIDs:].cold.1(v4, v5);

    -[CRKASMCertificateVendor credentialStore](self, "credentialStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forgetCertificatesWithPersistentIDs:", v4);

  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRKASMCertificateVendor credentialStore](self, "credentialStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMCertificateVendor *v8;
  CRKASMCertificateVendor *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMCertificateVendor *v17;
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
  objc_msgSend(CFSTR("credentialStore"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_15;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMCertificateVendor *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMCertificateVendor isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKASMCertificateVendor valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMCertificateVendor valueForKey:](v17, "valueForKey:", v16);
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

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialStore, 0);
}

- (void)forgetPersistentIDs:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Found %lu invalid trusted user certificates", (uint8_t *)&v3, 0xCu);
}

@end
