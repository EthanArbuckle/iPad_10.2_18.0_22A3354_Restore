@implementation ACDKeychainMigrator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ACDKeychainMigrator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __37__ACDKeychainMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (ACDKeychainMigrator)init
{
  ACDKeychainMigrator *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDKeychainMigrator;
  v2 = -[ACDKeychainMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  return v2;
}

- (void)migrateAllKeychainItems
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ACDKeychainMigrator allKeychainItems](self, "allKeychainItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    *(_QWORD *)&v5 = 138412290;
    v11 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasCustomAccessControl", v11))
        {
          _ACDKeychainLogSystem();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v11;
            v17 = v9;
            _os_log_debug_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEBUG, "Keychain item (%@) has custom access control, skipping...", buf, 0xCu);
          }

        }
        else
        {
          -[ACDKeychainMigrator migrateKeychainItem:toKeybag:](self, "migrateKeychainItem:toKeybag:", v9, 1);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

}

- (BOOL)migrateKeychainItem:(id)a3 toKeybag:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "version");
  if (v6 > 6)
  {
    v9 = 1;
    goto LABEL_22;
  }
  v7 = v6;
  _ACDKeychainLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDKeychainMigrator migrateKeychainItem:toKeybag:].cold.3((uint64_t)v5, v7, v8);

  if (v7 <= 0)
  {
    -[ACDKeychainMigrator _validateKeychainItemClass:](self, "_validateKeychainItemClass:", v5);
    goto LABEL_12;
  }
  if (v7 == 1)
  {
LABEL_12:
    -[ACDKeychainMigrator _validateKeychainItemClass:](self, "_validateKeychainItemClass:", v5);
    goto LABEL_13;
  }
  if ((unint64_t)v7 <= 2)
  {
LABEL_13:
    -[ACDKeychainMigrator _migrateUUIDKeychainItems:](self, "_migrateUUIDKeychainItems:", v5);
    goto LABEL_14;
  }
  if ((unint64_t)v7 > 4)
  {
    if (v7 != 5)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_14:
  -[ACDKeychainMigrator _validateKeychainItemClass:](self, "_validateKeychainItemClass:", v5);
LABEL_15:
  -[ACDKeychainMigrator _validateKeychainItemClass:](self, "_validateKeychainItemClass:", v5);
LABEL_16:
  -[ACDKeychainMigrator _validateKeychainItemClass:](self, "_validateKeychainItemClass:", v5);
  objc_msgSend(v5, "setVersion:", 7);
  v14 = 0;
  v9 = objc_msgSend(v5, "save:", &v14);
  v10 = v14;
  _ACDKeychainLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACDKeychainMigrator migrateKeychainItem:toKeybag:].cold.2();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ACDKeychainMigrator migrateKeychainItem:toKeybag:].cold.1();
  }

LABEL_22:
  return v9;
}

- (void)_validateKeychainItemClass:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke;
  v6[3] = &unk_24C7E2AD0;
  v7 = v3;
  v5 = v3;
  +[ACDKeychainManager componentsFromKeychainServiceName:handler:](ACDKeychainManager, "componentsFromKeychainServiceName:handler:", v4, v6);

}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v8);

      if ((v12 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDB4388], "credentialPolicyForAccountTypeIdentifier:key:clientID:", v8, v10, v7);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "accessibility");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v13);

          if ((v15 & 1) == 0)
          {
            _ACDKeychainLogSystem();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = *(_QWORD *)(a1 + 32);
              v23 = 138412546;
              v24 = v17;
              v25 = 2112;
              v26 = v13;
              _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "Found mismatched keychain item accessibility: %@ :: expected: %@", (uint8_t *)&v23, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "setAccessibility:", v13);
          }
          objc_msgSend(*(id *)(a1 + 32), "accessibility");
          v18 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject isEqualToString:](v18, "isEqualToString:", *MEMORY[0x24BDE8F70]))
          {
            v19 = objc_msgSend(*(id *)(a1 + 32), "synchronizable");

            if (v19)
            {
              _ACDKeychainLogSystem();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = *(_QWORD *)(a1 + 32);
                v23 = 138412290;
                v24 = v21;
                _os_log_impl(&dword_20D8CB000, v20, OS_LOG_TYPE_DEFAULT, "Found keychain item with accessibility kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly marked as syncable: %@", (uint8_t *)&v23, 0xCu);
              }

              objc_msgSend(*(id *)(a1 + 32), "setSynchronizable:", 0);
            }
            goto LABEL_23;
          }
        }
        else
        {
          _ACDKeychainLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_3(a1, v18, v22);
        }

        goto LABEL_23;
      }
      _ACDKeychainLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_4();
    }
    else
    {
      _ACDKeychainLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_2(a1, v13);
    }
  }
  else
  {
    _ACDKeychainLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_1(a1, v13);
  }
LABEL_23:

}

- (void)_migrateUUIDKeychainItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ACAccountStore *accountStore;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 == 36)
  {
    accountStore = self->_accountStore;
    objc_msgSend(v4, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccountStore accountWithIdentifier:](accountStore, "accountWithIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSObject username](v9, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      _ACDKeychainLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject username](v9, "username");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "account");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = v14;
          v18 = 2112;
          v19 = v15;
          _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "Updating keychain item acct: %@ old: %@", (uint8_t *)&v16, 0x16u);

        }
        -[NSObject username](v9, "username");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAccount:", v13);
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[ACDKeychainMigrator _migrateUUIDKeychainItems:].cold.2();
      }
    }
    else
    {
      _ACDKeychainLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ACDKeychainMigrator _migrateUUIDKeychainItems:].cold.1(v4, v13);
    }

  }
  else
  {
    _ACDKeychainLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACDKeychainMigrator _migrateUUIDKeychainItems:].cold.3(v9);
  }

}

- (id)allKeychainItems
{
  void *v3;
  void *v4;

  -[ACAccountStore accounts](self->_accountStore, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainMigrator keychainItemsForAccounts:](self, "keychainItemsForAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)keychainItemsForAccounts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "accountType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v9, "qualifiedUsername");
          v12 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v12, "length"))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "addObject:", v11);
            }
            else
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v11, 0);
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v12);

            }
          }
          objc_msgSend(v9, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              objc_msgSend(v17, "addObject:", v11);
            }
            else
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v11, 0);
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v16);

            }
          }

        }
        else
        {
          _ACDKeychainLogSystem();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_ERROR, "Account (%@) has and empty accountType identifier!", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v6);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__ACDKeychainMigrator_keychainItemsForAccounts___block_invoke;
  v23[3] = &unk_24C7E2AF8;
  v23[4] = self;
  v23[5] = &buf;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v23);
  v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
  _Block_object_dispose(&buf, 8);

  return v20;
}

void __48__ACDKeychainMigrator_keychainItemsForAccounts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_keychainItemsForAccount:accountTypeIdentifiers:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v4);
    v4 = v5;
  }

}

- (id)_keychainItemsForAccount:(id)a3 accountTypeIdentifiers:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *Mutable;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  CFTypeRef result;

  v6 = a3;
  v7 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v6);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], CFSTR("apple"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9140], (const void *)*MEMORY[0x24BDE9148]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE93B0], (const void *)*MEMORY[0x24BDE93B8]);
  v9 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C0], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94D0], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9508], (const void *)*MEMORY[0x24BDE9518]);
  result = 0;
  v10 = SecItemCopyMatching(Mutable, &result);
  if ((_DWORD)v10)
  {
    v11 = v10;
    _ACDKeychainLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACDKeychainMigrator _keychainItemsForAccount:accountTypeIdentifiers:].cold.1((uint64_t)v6, v11, v12);

    v13 = 0;
  }
  else
  {
    -[ACDKeychainMigrator _keychainItemFromAttributesArray:](self, "_keychainItemFromAttributesArray:", result);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (result)
    CFRelease(result);
  if (Mutable)
    CFRelease(Mutable);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke;
  v21 = &unk_24C7E2B48;
  v22 = v7;
  v14 = v7;
  objc_msgSend(v13, "indexesOfObjectsPassingTest:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectsAtIndexes:", v15, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke_2;
  v7[3] = &unk_24C7E2B20;
  v8 = *(id *)(a1 + 32);
  v9 = &v10;
  +[ACDKeychainManager componentsFromKeychainServiceName:handler:](ACDKeychainManager, "componentsFromKeychainServiceName:handler:", v4, v7);

  v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3))
  {
    objc_msgSend(MEMORY[0x24BDB4388], "allSupportedKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v8);

    if (v7)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)_keychainItemFromAttributes:(id)a3
{
  id v3;
  ACDKeychainItem *v4;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDE9558]);
  v4 = (ACDKeychainItem *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4 = -[ACDKeychainItem initWithPersistentRef:properties:]([ACDKeychainItem alloc], "initWithPersistentRef:properties:", v4, v3);

  return v4;
}

- (id)_keychainItemFromAttributesArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[ACDKeychainMigrator _keychainItemFromAttributes:](self, "_keychainItemFromAttributes:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)migrateKeychainItem:toKeybag:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, v0, v1, "Successfully migrated keychain item %@.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)migrateKeychainItem:toKeybag:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v1, (uint64_t)v1, "Failed to migrate keychain item %@: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)migrateKeychainItem:(NSObject *)a3 toKeybag:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  __int16 v5;
  uint8_t v6[22];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  v7 = v5;
  v8 = &unk_24C7EF1D0;
  _os_log_debug_impl(&dword_20D8CB000, a3, OS_LOG_TYPE_DEBUG, "Attempting to migrate keychain item %@ from %@ to %@", v6, 0x20u);

}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();

  OUTLINED_FUNCTION_2_3();
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();

  OUTLINED_FUNCTION_2_3();
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, a3, "Could not determine expected accessibility for %@.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, v0, v1, "Could not find account type for identifier %@.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_migrateUUIDKeychainItems:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v4, "Could not find an account with identifier %@, assuming item already username-based.", v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)_migrateUUIDKeychainItems:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_ERROR, "Found account %@ is missing username, will not update item.", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_migrateUUIDKeychainItems:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "Keychain item 'acct' did not match Account UUID format", v1, 2u);
}

- (void)_keychainItemsForAccount:(NSObject *)a3 accountTypeIdentifiers:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a3, v5, "Failed to query keychain for account: %@, errno %@", v6);

}

@end
