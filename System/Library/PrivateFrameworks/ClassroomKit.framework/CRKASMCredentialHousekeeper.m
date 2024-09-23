@implementation CRKASMCredentialHousekeeper

- (CRKASMCredentialHousekeeper)initWithRoster:(id)a3 credentialStore:(id)a4
{
  id v7;
  id v8;
  CRKASMCredentialHousekeeper *v9;
  CRKASMCredentialHousekeeper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMCredentialHousekeeper;
  v9 = -[CRKASMCredentialHousekeeper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_roster, a3);
    objc_storeStrong((id *)&v10->_credentialStore, a4);
  }

  return v10;
}

- (void)housekeep
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:", CFSTR("Housekeep ASM credentials"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialHousekeeper housekeepUserIdentities](self, "housekeepUserIdentities");
  -[CRKASMCredentialHousekeeper housekeepTrustedUserCertificates](self, "housekeepTrustedUserCertificates");
  _CRKLogASM_18();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "stop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)housekeepUserIdentities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[CRKASMCredentialHousekeeper credentialStore](self, "credentialStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMCredentialHousekeeper roster](self, "roster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "courses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[CRKASMCredentialHousekeeper knownUserIdentifiers](self, "knownUserIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "persistentIDs", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v4, "entryForPersistentID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[CRKASMCredentialHousekeeper isEntryValid:allowedUserIdentifiers:](self, "isEntryValid:allowedUserIdentifiers:", v17, v9))objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    -[CRKASMCredentialHousekeeper removeUserIdentities:manifest:](self, "removeUserIdentities:manifest:", v10, v4);
  }
  else
  {
    -[CRKASMCredentialHousekeeper removeAllUserIdentitiesInManifest:](self, "removeAllUserIdentitiesInManifest:", v4);
  }

}

- (id)knownUserIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[CRKASMCredentialHousekeeper roster](self, "roster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)removeAllUserIdentitiesInManifest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "persistentIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialHousekeeper removeUserIdentities:manifest:](self, "removeUserIdentities:manifest:", v5, v4);

}

- (void)removeUserIdentities:(id)a3 manifest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[CRKASMCredentialHousekeeper entriesInManifest:forPersistentIDs:](self, "entriesInManifest:forPersistentIDs:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CRKLogASM_18();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CRKASMCredentialHousekeeper removeUserIdentities:manifest:].cold.1(v6);

    -[CRKASMCredentialHousekeeper credentialStore](self, "credentialStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeIdentitiesWithPersistentIDs:", v6);

  }
}

- (void)housekeepTrustedUserCertificates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CRKASMCredentialHousekeeper knownTrustedUserIdentifiers](self, "knownTrustedUserIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[CRKASMCredentialHousekeeper credentialStore](self, "credentialStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "certificateManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "persistentIDs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "entryForPersistentID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[CRKASMCredentialHousekeeper isEntryValid:allowedUserIdentifiers:](self, "isEntryValid:allowedUserIdentifiers:", v13, v3))objc_msgSend(v4, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[CRKASMCredentialHousekeeper removeTrustedUserCertificates:manifest:](self, "removeTrustedUserCertificates:manifest:", v4, v6);
}

- (void)removeTrustedUserCertificates:(id)a3 manifest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[CRKASMCredentialHousekeeper entriesInManifest:forPersistentIDs:](self, "entriesInManifest:forPersistentIDs:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CRKLogASM_18();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CRKASMCredentialHousekeeper removeTrustedUserCertificates:manifest:].cold.1(v6);

    -[CRKASMCredentialHousekeeper credentialStore](self, "credentialStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeCertificatesWithPersistentIDs:", v6);

  }
}

- (id)knownTrustedUserIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CRKASMCredentialHousekeeper roster](self, "roster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "courses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "trustedUsers", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

- (id)entriesInManifest:(id)a3 forPersistentIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "entryForPersistentID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (__CFString *)v14;
        else
          v16 = CFSTR("no_entry_found");
        v17 = v16;

        objc_msgSend(v7, "addObject:", v17);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  return v18;
}

- (BOOL)isEntryValid:(id)a3 allowedUserIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isFullyPopulated"))
  {
    objc_msgSend(v5, "validityInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "crk_containsCurrentDate"))
    {
      objc_msgSend(v5, "userIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "containsObject:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_roster, 0);
}

- (void)removeUserIdentities:(void *)a1 manifest:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v1, v2, "Housekeeping %lu user identities. Manifest entries: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)removeTrustedUserCertificates:(void *)a1 manifest:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v1, v2, "Housekeeping %lu trusted user certificates. Manifest entries: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

@end
