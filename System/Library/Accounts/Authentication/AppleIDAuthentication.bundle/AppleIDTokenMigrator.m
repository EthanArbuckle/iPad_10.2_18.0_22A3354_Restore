@implementation AppleIDTokenMigrator

- (id)migrateAppleIDBasedCredentialForAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AppleIDTokenMigrator _potentialServiceNamesForTokenOfAccount:](self, "_potentialServiceNamesForTokenOfAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "username");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v8);

    }
    objc_msgSend(v4, "accountPropertyForKey:", *MEMORY[0x24BE04C40]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSObject addObject:](v6, "addObject:", v9);
    }
    else
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "ERROR, we've got a nil migratedAccountIdentifier - something went horribly wrong", buf, 2u);
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v5;
    v11 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v23 = v9;
      v14 = 0;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v13);
          -[AppleIDTokenMigrator _mostRecentTokenWithServiceName:matchingAccountNames:](self, "_mostRecentTokenWithServiceName:matchingAccountNames:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16), v6, v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (char *)v16 + 1;
          v17 = v14;
        }
        while (v11 != v16);
        v11 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);

      if (!v14)
      {
        v11 = 0;
        v9 = v23;
LABEL_31:

        goto LABEL_32;
      }
      v11 = objc_alloc_init(MEMORY[0x24BDB4388]);
      objc_msgSend(v11, "setToken:", v14);
      objc_msgSend(v4, "setCredential:", v11);
      v24 = 0;
      objc_msgSend(MEMORY[0x24BE00E88], "setCredentialForAccount:error:", v4, &v24);
      v18 = v24;
      _AALogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          objc_msgSend(v4, "shortDebugName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v21;
          _os_log_impl(&dword_230E5F000, v19, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator failed to save the new credential for account %@.", buf, 0xCu);

        }
      }
      else
      {
        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          v31 = v13;
          _os_log_impl(&dword_230E5F000, v19, OS_LOG_TYPE_DEFAULT, "Remove old Apple ID credential items: %@", buf, 0xCu);
        }

        -[AppleIDTokenMigrator _removeKeychainItemForUsernames:services:](self, "_removeKeychainItemForUsernames:services:", v6, v13);
      }
      v9 = v23;
    }
    else
    {
      v14 = 0;
      v18 = v13;
    }

    goto LABEL_31;
  }
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "shortDebugName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator could not figure out a service name for this account's token: %@", buf, 0xCu);

  }
  v11 = 0;
LABEL_32:

  return v11;
}

- (id)_potentialServiceNamesForTokenOfAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4060]) & 1) != 0)
  {
    v5 = &unk_24FF958D0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB40A0]))
  {
    v5 = &unk_24FF958E8;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_mostRecentTokenWithServiceName:(id)a3 matchingAccountNames:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *v15;
  OSStatus v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v37;
  uint64_t v38;
  AppleIDTokenMigrator *v39;
  id v40;
  uint64_t v41;
  id obj;
  __CFDictionary *v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE result[12];
  __int16 v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t v59[128];
  uint8_t buf[4];
  OSStatus v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v51;
    v12 = *MEMORY[0x24BDE9550];
    v13 = *MEMORY[0x24BDE90A8];
    *(_QWORD *)&v9 = 67109120;
    v37 = v9;
    v39 = self;
    v40 = v6;
    v38 = *(_QWORD *)v51;
    do
    {
      v14 = 0;
      v41 = v10;
      do
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(obj);
        v15 = -[AppleIDTokenMigrator _newKeychainQueryForAllItemsMatchingAccountName:serviceName:](self, "_newKeychainQueryForAllItemsMatchingAccountName:serviceName:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v14), v6, v37);
        *(_QWORD *)result = 0;
        v16 = SecItemCopyMatching(v15, (CFTypeRef *)result);
        _AALogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v37;
          v61 = v16;
          _os_log_impl(&dword_230E5F000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator: SecItemCopyMatching returned %d", buf, 8u);
        }

        if (v16)
          v18 = 1;
        else
          v18 = *(_QWORD *)result == 0;
        if (!v18)
        {
          v43 = v15;
          v44 = v14;
          v19 = *(id *)result;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v47 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                objc_msgSend(v24, "objectForKey:", v12);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKey:", v13);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v25, 4);
                v28 = (void *)v27;
                if (v27)
                  v29 = v26 == 0;
                else
                  v29 = 1;
                if (!v29)
                {
                  v57[0] = CFSTR("token");
                  v57[1] = CFSTR("date-last-modified");
                  v58[0] = v27;
                  v58[1] = v26;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "addObject:", v30);

                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
            }
            while (v21);
          }

          self = v39;
          v6 = v40;
          v11 = v38;
          v10 = v41;
          v15 = v43;
          v14 = v44;
        }
        CFRelease(v15);
        if (*(_QWORD *)result)
          CFRelease(*(CFTypeRef *)result);
        ++v14;
      }
      while (v14 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v10);
  }

  _AALogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v45, "count");
    *(_DWORD *)result = 134218242;
    *(_QWORD *)&result[4] = v32;
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_230E5F000, v31, OS_LOG_TYPE_DEFAULT, "AppleIDtokenMigrator found %ld tokens in the keychain with service name %@.", result, 0x16u);
  }

  if (objc_msgSend(v45, "count"))
  {
    v33 = (id)objc_msgSend(v45, "sortedArrayUsingComparator:", &unk_24FF93D48);
    objc_msgSend(v45, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("token"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (__CFDictionary)_newKeychainQueryForAllItemsMatchingAccountName:(id)a3 serviceName:(id)a4
{
  const __CFAllocator *v5;
  id v6;
  id v7;
  __CFDictionary *Mutable;
  const void *v9;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = a4;
  v7 = a3;
  Mutable = CFDictionaryCreateMutable(v5, 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v7);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v6);
  v9 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C8], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C0], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE93B0], (const void *)*MEMORY[0x24BDE93B8]);
  return Mutable;
}

- (void)_removeKeychainItemForUsernames:(id)a3 services:(id)a4
{
  id v5;
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const void *v15;
  __CFDictionary *Mutable;
  NSObject *v17;
  id v18;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *key;
  const __CFAllocator *allocator;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const void *v36;
  __int16 v37;
  const void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  if (objc_msgSend(v21, "count") && objc_msgSend(v5, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v5;
    obj = v5;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v32;
      key = (void *)*MEMORY[0x24BDE9220];
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v6 = (const void *)*MEMORY[0x24BDE9230];
      v7 = (const void *)*MEMORY[0x24BDE8FA8];
      v8 = (const void *)*MEMORY[0x24BDE9128];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(obj);
          v23 = v9;
          v10 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v24 = v21;
          v11 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v28 != v13)
                  objc_enumerationMutation(v24);
                v15 = *(const void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                Mutable = CFDictionaryCreateMutable(allocator, 0, 0, 0);
                CFDictionaryAddValue(Mutable, key, v6);
                CFDictionaryAddValue(Mutable, v7, v10);
                CFDictionaryAddValue(Mutable, v8, v15);
                if (SecItemDelete(Mutable))
                {
                  _AALogSystem();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v36 = v15;
                    v37 = 2112;
                    v38 = v10;
                    _os_log_impl(&dword_230E5F000, v17, OS_LOG_TYPE_DEFAULT, "We couldn't remove %@ for %@ from the keychain", buf, 0x16u);
                  }

                }
                CFRelease(Mutable);
              }
              v12 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v12);
          }

          v9 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v22);
    }

    v5 = v18;
  }

}

@end
