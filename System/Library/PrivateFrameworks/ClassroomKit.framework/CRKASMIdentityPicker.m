@implementation CRKASMIdentityPicker

- (CRKASMIdentityPicker)initWithCredentialStore:(id)a3 userIdentifier:(id)a4
{
  id v7;
  id v8;
  CRKASMIdentityPicker *v9;
  CRKASMIdentityPicker *v10;
  uint64_t v11;
  NSString *userIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMIdentityPicker;
  v9 = -[CRKASMIdentityPicker init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credentialStore, a3);
    v11 = objc_msgSend(v8, "copy");
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = (NSString *)v11;

  }
  return v10;
}

- (CRKIdentity)identity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CRKASMIdentityPicker manifest](self, "manifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:", CFSTR("Process identity manifest contents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityPicker candidatePersistentIDsInManifest:](self, "candidatePersistentIDsInManifest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityPicker pickIdentityFromCandidates:manifest:](self, "pickIdentityFromCandidates:manifest:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogASM_9();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "stop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v10, 0xCu);

  }
  return (CRKIdentity *)v6;
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
  +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:", CFSTR("Read identity manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityPicker credentialStore](self, "credentialStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _CRKLogASM_9();
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

- (id)candidatePersistentIDsInManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "persistentIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "entryForPersistentID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CRKASMIdentityPicker isManifestEntryValid:manifest:](self, "isManifestEntryValid:manifest:", v12, v4))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (BOOL)isManifestEntryValid:(id)a3 manifest:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char v12;
  void *v13;
  char v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isFullyPopulated") & 1) != 0)
  {
    objc_msgSend(v6, "userIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[CRKASMIdentityPicker userIdentifier](self, "userIdentifier"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "userIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKASMIdentityPicker userIdentifier](self, "userIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9) ^ 1;

      if (v7)
      {
LABEL_11:

        objc_msgSend(v6, "validityInterval");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "crk_containsCurrentDate");

        v12 = v14 & ~(_BYTE)v10;
        goto LABEL_12;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }

    goto LABEL_11;
  }
  _CRKLogASM_9();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CRKASMIdentityPicker isManifestEntryValid:manifest:].cold.1(v11);

  v12 = 0;
LABEL_12:

  return v12;
}

- (id)pickIdentityFromCandidates:(id)a3 manifest:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CRKASMIdentityPicker arrayBySortingPersistentIDs:](self, "arrayBySortingPersistentIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMIdentityPicker pickIdentityFromOrderedCandidates:manifest:](self, "pickIdentityFromOrderedCandidates:manifest:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pickIdentityFromOrderedCandidates:(id)a3 manifest:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26 = a4;
  v25 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v29;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x219A22538]();
        objc_msgSend(v26, "entryForPersistentID:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKASMIdentityPicker credentialStore](self, "credentialStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identityWithPersistentID:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v9, "fingerprint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(v11, "certificate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "fingerprint");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

LABEL_19:
              objc_autoreleasePoolPop(v8);
              goto LABEL_20;
            }
          }
          objc_msgSend(v9, "fingerprint");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "certificate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fingerprint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "isEqual:", v15);

          if (v12)
          {

            if ((v16 & 1) != 0)
              goto LABEL_19;
          }
          else
          {

            if ((v16 & 1) != 0)
              goto LABEL_19;
          }
        }
        _CRKLogASM_9();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[CRKASMIdentityPicker pickIdentityFromOrderedCandidates:manifest:].cold.1(v32, self, &v33, v17);

        objc_msgSend(v25, "addObject:", v7);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v24 != v6);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v24)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_20:

  -[CRKASMIdentityPicker credentialStore](self, "credentialStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "forgetIdentitiesWithPersistentIDs:", v25);

  return v11;
}

- (id)arrayBySortingPersistentIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C0];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("crk_hexString"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
}

- (void)isManifestEntryValid:(os_log_t)log manifest:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Found a partially populated identity manifest entry. Skipping it...", v1, 2u);
}

- (void)pickIdentityFromOrderedCandidates:(_QWORD *)a3 manifest:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_218C99000, a4, OS_LOG_TYPE_ERROR, "Found a repointed persistent ID for user identifier %@. Forgetting it...", a1, 0xCu);

}

@end
