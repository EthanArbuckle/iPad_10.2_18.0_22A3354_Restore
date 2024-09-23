@implementation DAKeychain

+ (id)sharedKeychain
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_sharedDAKeychain;
  if (!_sharedDAKeychain)
  {
    v3 = objc_opt_new();
    v4 = (void *)_sharedDAKeychain;
    _sharedDAKeychain = v3;

    v2 = (void *)_sharedDAKeychain;
  }
  return v2;
}

- (BOOL)canAccessCredentialsWithAccessibility:(int)a3
{
  if (a3 == 1)
    return MKBGetDeviceLockState() != 0;
  if (a3 == 2)
    return MKBDeviceUnlockedSinceBoot() == 1;
  return 1;
}

- (void)_secAccessibilityForDAKeychainAccessibility:(int)a3
{
  void **v3;

  switch(a3)
  {
    case 3:
      v3 = (void **)MEMORY[0x1E0CD68B8];
      return *v3;
    case 2:
      v3 = (void **)MEMORY[0x1E0CD68A8];
      return *v3;
    case 1:
      v3 = (void **)MEMORY[0x1E0CD68E8];
      return *v3;
  }
  return 0;
}

- (int)_daKeychainAccessibilityForSecAccessibility:(void *)a3
{
  if (!a3)
    return 2;
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68B8]))
    return 3;
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68A8]) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68E8]))
    return 1;
  else
    return 2;
}

- (__CFDictionary)_DACopyMutableQueryForAccountWithPersistentUUID:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  const void *v5;
  void *v6;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = (const void *)*MEMORY[0x1E0CD68F8];
  objc_msgSend(CFSTR("DataAccess-"), "stringByAppendingString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionaryAddValue(Mutable, v5, v6);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB8]);
  return Mutable;
}

- (__CFDictionary)_DACopyMutableAttributesForAccountWithPersistentUUID:(id)a3 accessibility:(int)a4
{
  uint64_t v4;
  __CFDictionary *v6;

  v4 = *(_QWORD *)&a4;
  v6 = -[DAKeychain _DACopyMutableQueryForAccountWithPersistentUUID:](self, "_DACopyMutableQueryForAccountWithPersistentUUID:", a3);
  CFDictionarySetValue(v6, (const void *)*MEMORY[0x1E0CD68A0], -[DAKeychain _secAccessibilityForDAKeychainAccessibility:](self, "_secAccessibilityForDAKeychainAccessibility:", v4));
  return v6;
}

- (id)passwordForAccountWithPersistentUUID:(id)a3 expectedAccessibility:(int)a4 shouldSetAccessibility:(BOOL)a5 passwordExpected:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  __CFDictionary *v14;
  const void *v15;
  OSStatus v16;
  OSStatus v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  __CFDictionary *Mutable;
  __CFDictionary *v30;
  OSStatus v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v34;
  void *key;
  CFTypeRef result;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  OSStatus v40;
  uint64_t v41;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0D1C448];
  v13 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v10;
    _os_log_impl(&dword_1B51E4000, v11, v13, "Loading password for %@", buf, 0xCu);
  }

  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("unit-test")) & 1) != 0 || !objc_msgSend(v10, "length"))
  {
    v22 = 0;
  }
  else
  {
    v14 = -[DAKeychain _DACopyMutableQueryForAccountWithPersistentUUID:](self, "_DACopyMutableQueryForAccountWithPersistentUUID:", v10);
    v15 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD7010], v15);
    result = 0;
    v16 = SecItemCopyMatching(v14, &result);
    if (v16)
    {
      v17 = v16;
      DALoggingwithCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = 6;
      if (v6)
        v20 = 4;
      v21 = *(_BYTE *)(v12 + v20);
      if (os_log_type_enabled(v18, v21))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 1024;
        v40 = v17;
        _os_log_impl(&dword_1B51E4000, v19, v21, "Could not find a password in the keychain for %@, error %d", buf, 0x12u);
      }
      v22 = 0;
      v23 = 0;
    }
    else
    {
      v23 = (void *)result;
      key = (void *)*MEMORY[0x1E0CD70D8];
      objc_msgSend((id)result, "objectForKeyedSubscript:");
      v19 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 4);
      v34 = (void *)*MEMORY[0x1E0CD68A0];
      objc_msgSend(v23, "objectForKeyedSubscript:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[DAKeychain _daKeychainAccessibilityForSecAccessibility:](self, "_daKeychainAccessibilityForSecAccessibility:", v25);

      if ((_DWORD)v26 != (_DWORD)v8 && v7)
      {
        DALoggingwithCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v10;
          v39 = 1024;
          v40 = v8;
          _os_log_impl(&dword_1B51E4000, v27, v28, "Securing ur sekretz: moving credential for account %@ to accessibility %d", buf, 0x12u);
        }

        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(Mutable, key, v19);
        CFDictionarySetValue(Mutable, v34, -[DAKeychain _secAccessibilityForDAKeychainAccessibility:](self, "_secAccessibilityForDAKeychainAccessibility:", v8));
        v30 = -[DAKeychain _DACopyMutableAttributesForAccountWithPersistentUUID:accessibility:](self, "_DACopyMutableAttributesForAccountWithPersistentUUID:accessibility:", v10, v26);
        v31 = SecItemUpdate(v30, Mutable);
        CFRelease(v30);
        if (v31)
        {
          DALoggingwithCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v38) = v31;
            _os_log_impl(&dword_1B51E4000, v32, v33, "Couldn't change password accessibility, error %d", buf, 8u);
          }

        }
        if (Mutable)
          CFRelease(Mutable);
      }
    }

    if (v14)
      CFRelease(v14);

  }
  return v22;
}

- (void)removePersistentCredentials
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__DAKeychain_removePersistentCredentials__block_invoke;
  v5[3] = &unk_1E68CB768;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __41__DAKeychain_removePersistentCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    v13 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    *(_QWORD *)&v10 = 138412290;
    v17 = v10;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((objc_msgSend(v5, "isProxy", v17, (_QWORD)v18) & 1) == 0 && objc_msgSend(v15, "persistence") == 1)
        {
          DALoggingwithCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, v13))
          {
            *(_DWORD *)buf = v17;
            v23 = v15;
            _os_log_impl(&dword_1B51E4000, v16, v13, "Removing credential %@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "removeCredential:forProtectionSpace:", v15, v5);
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 withPersistentUUID:(id)a5 withAccessibility:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  os_log_type_t v15;
  __CFDictionary *v16;
  const void *v17;
  OSStatus v18;
  __CFDictionary *Mutable;
  const void *Value;
  const void *v21;
  const void *v22;
  BOOL v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  CFTypeRef result;
  uint8_t buf[4];
  _DWORD v30[7];

  v6 = *(_QWORD *)&a6;
  *(_QWORD *)&v30[5] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "length"))
  {
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0D1C448];
    v15 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v13, v15))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v30 = v12;
      _os_log_impl(&dword_1B51E4000, v13, v15, "Setting password for account with UUID %@", buf, 0xCu);
    }

    v16 = -[DAKeychain _DACopyMutableAttributesForAccountWithPersistentUUID:accessibility:](self, "_DACopyMutableAttributesForAccountWithPersistentUUID:accessibility:", v12, v6);
    v17 = (const void *)*MEMORY[0x1E0CD70D8];
    CFDictionarySetValue(v16, (const void *)*MEMORY[0x1E0CD70D8], (const void *)objc_msgSend(v10, "dataUsingEncoding:", 4));
    result = 0;
    v18 = SecItemAdd(v16, &result);
    if (v18 == -25299)
    {
      Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      Value = CFDictionaryGetValue(v16, v17);
      CFDictionaryAddValue(Mutable, v17, Value);
      v21 = (const void *)*MEMORY[0x1E0CD68A0];
      v22 = CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E0CD68A0]);
      CFDictionaryAddValue(Mutable, v21, v22);
      v18 = SecItemUpdate(v16, Mutable);
      if (Mutable)
        CFRelease(Mutable);
    }
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
    if (v16)
      CFRelease(v16);
    v23 = v18 == 0;
    if (v18)
    {
      DALoggingwithCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_BYTE *)(v14 + 3);
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109378;
        v30[0] = v18;
        LOWORD(v30[1]) = 2112;
        *(_QWORD *)((char *)&v30[1] + 2) = v12;
        _os_log_impl(&dword_1B51E4000, v24, v25, "Error %d, Can't update password for account %@", buf, 0x12u);
      }

    }
    else
    {
      -[DAKeychain removePersistentCredentials](self, "removePersistentCredentials");
    }
  }
  else
  {
    objc_msgSend(v11, "persistentUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[DAKeychain removePasswordForAccount:withPersistentUUID:](self, "removePasswordForAccount:withPersistentUUID:", v11, v26);

  }
  return v23;
}

- (BOOL)removePasswordForAccount:(id)a3 withPersistentUUID:(id)a4
{
  id v5;
  __CFDictionary *v6;
  NSObject *v7;
  uint64_t v8;
  os_log_type_t v9;
  OSStatus v10;
  OSStatus v11;
  BOOL v12;
  BOOL v13;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[DAKeychain _DACopyMutableQueryForAccountWithPersistentUUID:](self, "_DACopyMutableQueryForAccountWithPersistentUUID:", v5);
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0D1C448];
  v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v7, v9))
  {
    v17 = 138412290;
    *(_QWORD *)v18 = v5;
    _os_log_impl(&dword_1B51E4000, v7, v9, "Removing password for account with UUID %@", (uint8_t *)&v17, 0xCu);
  }

  v10 = SecItemDelete(v6);
  v11 = v10;
  if (v10 == -25300 || !v10)
  {
    -[DAKeychain removePersistentCredentials](self, "removePersistentCredentials");
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  DALoggingwithCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_BYTE *)(v8 + 3);
  if (os_log_type_enabled(v15, v16))
  {
    v17 = 67109378;
    v18[0] = v11;
    LOWORD(v18[1]) = 2112;
    *(_QWORD *)((char *)&v18[1] + 2) = v5;
    _os_log_impl(&dword_1B51E4000, v15, v16, "Error %d, Couldn't delete password from keychain for account %@", (uint8_t *)&v17, 0x12u);
  }

  if (v6)
LABEL_6:
    CFRelease(v6);
LABEL_7:
  if (v11)
    v12 = v11 == -25300;
  else
    v12 = 1;
  v13 = v12;

  return v13;
}

- (void)migratePasswordForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAKeychain passwordForAccountWithPersistentUUID:expectedAccessibility:shouldSetAccessibility:passwordExpected:](self, "passwordForAccountWithPersistentUUID:expectedAccessibility:shouldSetAccessibility:passwordExpected:", v4, 3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "persistentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAKeychain passwordForAccountWithPersistentUUID:expectedAccessibility:shouldSetAccessibility:passwordExpected:](self, "passwordForAccountWithPersistentUUID:expectedAccessibility:shouldSetAccessibility:passwordExpected:", v6, 3, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DAOldKeychainURLs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v5)
          {
            +[DAKeychain sharedKeychain](DAKeychain, "sharedKeychain");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "guessPasswordForURL:", v13);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

          }
          +[DAKeychain sharedKeychain](DAKeychain, "sharedKeychain");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeKeychainInformationsForURL:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v10);
    }

  }
  if (v5)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v5);
    objc_msgSend(v3, "backingAccountInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCredential:", v16);

    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v18 = dispatch_semaphore_create(0);
    DALoggingwithCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 4);
    if (os_log_type_enabled(v19, v20))
    {
      v21 = v16;
      objc_msgSend(v3, "backingAccountInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "backingAccountInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "username");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v23;
      v46 = 2112;
      v47 = v25;
      _os_log_impl(&dword_1B51E4000, v19, v20, "During Migration, password present. Setting _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", buf, 0x16u);

      v16 = v21;
    }

    objc_msgSend(v3, "backingAccountInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAuthenticated:", 1);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("DAOldKeychainURLs"));
    sharedDAAccountStore();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backingAccountInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __40__DAKeychain_migratePasswordForAccount___block_invoke;
    v33[3] = &unk_1E68CB790;
    v35 = &v36;
    v29 = v18;
    v34 = v29;
    objc_msgSend(v27, "saveVerifiedAccount:withCompletionHandler:", v28, v33);

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v37 + 24))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DAAccountPersistentUUID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAKeychain removePasswordForAccount:withPersistentUUID:](self, "removePasswordForAccount:withPersistentUUID:", v3, v30);

      objc_msgSend(v3, "persistentUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAKeychain removePasswordForAccount:withPersistentUUID:](self, "removePasswordForAccount:withPersistentUUID:", v3, v31);

    }
    _Block_object_dispose(&v36, 8);

  }
}

intptr_t __40__DAKeychain_migratePasswordForAccount___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)saveKeychainInformationsForURL:(id)a3 andPassword:(id)a4 withAccessibility:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  BOOL v25;
  const __CFString *v26;
  const void **v28;
  const void *v29;
  __CFDictionary *v30;
  const void *v31;
  void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  void *v36;
  NSObject *v37;
  const void *v38;
  NSObject *v39;
  OSStatus v40;
  OSStatus v41;
  __CFDictionary *Mutable;
  const void *v43;
  const void *v44;
  const void *v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_type_t v50;
  void *value;
  void *valuea;
  os_log_type_t valueb;
  NSObject *log;
  __CFDictionary *loga;
  os_log_t logb;
  _BYTE buf[22];
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  uint8_t v62[4];
  OSStatus v63;
  uint64_t v64;

  v5 = *(_QWORD *)&a5;
  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0D1C448];
  v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v10, v12))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1B51E4000, v10, v12, "Saving password for %@", buf, 0xCu);
  }

  objc_msgSend(v8, "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0) & 1) == 0
    && v13
    && (objc_msgSend(v13, "isEqualToString:", &stru_1E68CCDC0) & 1) == 0
    && v14
    && (objc_msgSend(v14, "isEqualToString:", &stru_1E68CCDC0) & 1) == 0
    && v15
    && !objc_msgSend(v15, "isEqualToString:", &stru_1E68CCDC0))
  {
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("unit-test")) & 1) != 0)
    {
      v25 = 0;
      goto LABEL_29;
    }
    loga = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("ftp")))
    {
      v28 = (const void **)MEMORY[0x1E0CD6AD8];
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("http")))
      {
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("https")))
          v29 = (const void *)*MEMORY[0x1E0CD6B00];
        else
          v29 = 0;
LABEL_40:
        valuea = -[DAKeychain _secAccessibilityForDAKeychainAccessibility:](self, "_secAccessibilityForDAKeychainAccessibility:", v5);
        v30 = loga;
        CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E0CD68F8], v13);
        v31 = (const void *)*MEMORY[0x1E0CD6C98];
        if (v29)
        {
          CFDictionaryAddValue(loga, v31, (const void *)*MEMORY[0x1E0CD6CB8]);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E0CD6B50], v14);
          objc_msgSend(v8, "port");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = (const void *)*MEMORY[0x1E0CD6AC8];
          if (v32)
            v34 = (const void *)objc_msgSend(v8, "port");
          else
            v34 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0C99E98], "da_classicPortForScheme:", v15));
          v30 = loga;
          CFDictionaryAddValue(loga, v33, v34);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E0CD6AD0], v29);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E0CD6AC0], (const void *)objc_msgSend(v8, "uri"));
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E0CD6910], (const void *)*MEMORY[0x1E0CD6918]);
        }
        else
        {
          CFDictionaryAddValue(loga, v31, (const void *)*MEMORY[0x1E0CD6CA8]);
          v35 = (const void *)*MEMORY[0x1E0CD6B58];
          objc_msgSend(v8, "URLWithoutUsername");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          CFDictionaryAddValue(loga, v35, (const void *)objc_msgSend(v36, "absoluteString"));

        }
        if (valuea)
          CFDictionaryAddValue(v30, (const void *)*MEMORY[0x1E0CD68A0], valuea);
        objc_msgSend(v9, "dataUsingEncoding:", 4, valuea);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (const void *)*MEMORY[0x1E0CD70D8];
        logb = v37;
        CFDictionaryAddValue(v30, (const void *)*MEMORY[0x1E0CD70D8], v37);
        DALoggingwithCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, v12))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B51E4000, v39, v12, "Setting password for account", buf, 2u);
        }

        *(_QWORD *)buf = 0;
        v40 = SecItemAdd(v30, (CFTypeRef *)buf);
        if (v40 == -25299)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v43 = v38;
          v16 = logb;
          CFDictionaryAddValue(Mutable, v43, logb);
          v44 = (const void *)*MEMORY[0x1E0CD68A0];
          v45 = CFDictionaryGetValue(v30, (const void *)*MEMORY[0x1E0CD68A0]);
          if (v45)
            CFDictionaryAddValue(Mutable, v44, v45);
          CFDictionaryRemoveValue(v30, v44);
          v41 = SecItemUpdate(v30, Mutable);
          if (v41)
          {
            DALoggingwithCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            valueb = *(_BYTE *)(v11 + 3);
            if (os_log_type_enabled(v46, valueb))
            {
              *(_DWORD *)v62 = 67109120;
              v63 = v41;
              _os_log_impl(&dword_1B51E4000, v46, valueb, "Couldn't set password, error %d", v62, 8u);
            }

            v16 = logb;
          }
          if (Mutable)
            CFRelease(Mutable);
        }
        else
        {
          v41 = v40;
          if (!v40)
          {
            v25 = 1;
            goto LABEL_68;
          }
          DALoggingwithCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = *(_BYTE *)(v11 + 3);
          if (os_log_type_enabled(v47, v48))
          {
            *(_DWORD *)v62 = 67109120;
            v63 = v41;
            _os_log_impl(&dword_1B51E4000, v47, v48, "Couldn't add password, error %d", v62, 8u);
          }

          v16 = logb;
        }
        if (!v41)
        {
          v25 = 1;
LABEL_70:
          if (v30)
            CFRelease(v30);
          goto LABEL_28;
        }
        DALoggingwithCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = *(_BYTE *)(v11 + 3);
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v41;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v30;
          _os_log_impl(&dword_1B51E4000, v49, v50, "Error %d while trying to add a password: %@", buf, 0x12u);
        }

        v25 = 0;
LABEL_68:
        v16 = logb;
        goto LABEL_70;
      }
      v28 = (const void **)MEMORY[0x1E0CD6AF0];
    }
    v29 = *v28;
    goto LABEL_40;
  }
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(v11 + 3);
  if (os_log_type_enabled(v16, v17))
  {
    v18 = CFSTR("Password ");
    log = v16;
    if (v9 && !objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0))
      v18 = &stru_1E68CCDC0;
    value = v8;
    v19 = CFSTR("Login ");
    v20 = v15;
    v21 = v9;
    if (v13 && !objc_msgSend(v13, "isEqualToString:", &stru_1E68CCDC0))
      v19 = &stru_1E68CCDC0;
    v22 = v13;
    v23 = CFSTR("Host ");
    if (v14)
    {
      v24 = v14;
      if (!objc_msgSend(v14, "isEqualToString:", &stru_1E68CCDC0))
        v23 = &stru_1E68CCDC0;
    }
    else
    {
      v24 = 0;
    }
    v26 = CFSTR("Scheme ");
    if (v20 && !objc_msgSend(v20, "isEqualToString:", &stru_1E68CCDC0))
      v26 = &stru_1E68CCDC0;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    v58 = 2112;
    v59 = v23;
    v60 = 2112;
    v61 = v26;
    v16 = log;
    _os_log_impl(&dword_1B51E4000, log, v17, "Refusing to save password in keychain because one or more of the necessary fields are null: %@%@%@%@", buf, 0x2Au);
    v25 = 0;
    v14 = v24;
    v13 = v22;
    v9 = v21;
    v8 = value;
    v15 = v20;
  }
  else
  {
    v25 = 0;
  }
LABEL_28:

LABEL_29:
  return v25;
}

- (id)loadKeychainInformationsForURL:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  __CFDictionary *Mutable;
  const void **v18;
  const void *v19;
  const void *v20;
  void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  CFTypeRef result;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0D1C448];
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v4, v6))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_impl(&dword_1B51E4000, v4, v6, "Loading password for %@", buf, 0xCu);
  }

  -[__CFString user](v3, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString host](v3, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString scheme](v3, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v7, "isEqualToString:", &stru_1E68CCDC0) & 1) != 0
    || !v8
    || (objc_msgSend(v8, "isEqualToString:", &stru_1E68CCDC0) & 1) != 0
    || !v9
    || objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0))
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(v5 + 3);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = CFSTR("Login ");
      if (v7 && !objc_msgSend(v7, "isEqualToString:", &stru_1E68CCDC0))
        v12 = &stru_1E68CCDC0;
      v13 = CFSTR("Host ");
      if (v8 && !objc_msgSend(v8, "isEqualToString:", &stru_1E68CCDC0))
        v13 = &stru_1E68CCDC0;
      v14 = CFSTR("Scheme ");
      if (v9 && !objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0))
        v14 = &stru_1E68CCDC0;
      *(_DWORD *)buf = 138412802;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_1B51E4000, v10, v11, "Refusing to retrieve password from keychain because one or more of the necessary fields are null: %@%@%@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("unit-test")) & 1) != 0)
  {
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  result = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("ftp")))
  {
    v18 = (const void **)MEMORY[0x1E0CD6AD8];
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("http")))
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("https")))
        v19 = (const void *)*MEMORY[0x1E0CD6B00];
      else
        v19 = 0;
      goto LABEL_32;
    }
    v18 = (const void **)MEMORY[0x1E0CD6AF0];
  }
  v19 = *v18;
LABEL_32:
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  v20 = (const void *)*MEMORY[0x1E0CD6C98];
  if (v19)
  {
    CFDictionaryAddValue(Mutable, v20, (const void *)*MEMORY[0x1E0CD6CB8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AD0], v19);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B50], v8);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6910], (const void *)*MEMORY[0x1E0CD6918]);
    -[__CFString port](v3, "port");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (const void *)*MEMORY[0x1E0CD6AC8];
    if (v21)
      v23 = (const void *)-[__CFString port](v3, "port");
    else
      v23 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0C99E98], "da_classicPortForScheme:", v9));
    CFDictionaryAddValue(Mutable, v22, v23);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AC0], (const void *)-[__CFString uri](v3, "uri"));
  }
  else
  {
    CFDictionaryAddValue(Mutable, v20, (const void *)*MEMORY[0x1E0CD6CA8]);
    v24 = (const void *)*MEMORY[0x1E0CD6B58];
    -[__CFString URLWithoutUsername](v3, "URLWithoutUsername");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(Mutable, v24, (const void *)objc_msgSend(v25, "absoluteString"));

  }
  if (SecItemCopyMatching(Mutable, &result))
  {
    DALoggingwithCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_BYTE *)(v5 + 6);
    if (os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_1B51E4000, v26, v27, "Could not find a password in the keychain for %@", buf, 0xCu);
    }

    v15 = 0;
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (void *)objc_msgSend(v28, "initWithData:encoding:", result, 4);
  }
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
LABEL_22:

  return v15;
}

- (void)removeKeychainInformationsForURL:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFDictionary *Mutable;
  const void **v16;
  const void *v17;
  const void *v18;
  void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  void *v23;
  OSStatus v24;
  OSStatus v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  _BYTE v29[18];
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0D1C448];
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v4, v6))
  {
    v28 = 138412290;
    *(_QWORD *)v29 = v3;
    _os_log_impl(&dword_1B51E4000, v4, v6, "Removing password for %@", (uint8_t *)&v28, 0xCu);
  }

  objc_msgSend(v3, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v7, "isEqualToString:", &stru_1E68CCDC0) & 1) != 0
    || !v8
    || (objc_msgSend(v8, "isEqualToString:", &stru_1E68CCDC0) & 1) != 0
    || !v9
    || objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0))
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(v5 + 3);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = CFSTR("Login ");
      if (v7 && !objc_msgSend(v7, "isEqualToString:", &stru_1E68CCDC0))
        v12 = &stru_1E68CCDC0;
      v13 = CFSTR("Host ");
      if (v8 && !objc_msgSend(v8, "isEqualToString:", &stru_1E68CCDC0))
        v13 = &stru_1E68CCDC0;
      v14 = CFSTR("Scheme ");
      if (v9 && !objc_msgSend(v9, "isEqualToString:", &stru_1E68CCDC0))
        v14 = &stru_1E68CCDC0;
      v28 = 138412802;
      *(_QWORD *)v29 = v12;
      *(_WORD *)&v29[8] = 2112;
      *(_QWORD *)&v29[10] = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_1B51E4000, v10, v11, "Refusing to delete password from keychain because one or more of the necessary fields are null: %@%@%@", (uint8_t *)&v28, 0x20u);
    }

    goto LABEL_21;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("unit-test")) & 1) != 0)
    goto LABEL_21;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("ftp")))
  {
    v16 = (const void **)MEMORY[0x1E0CD6AD8];
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("http")))
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("https")))
        v17 = (const void *)*MEMORY[0x1E0CD6B00];
      else
        v17 = 0;
      goto LABEL_31;
    }
    v16 = (const void **)MEMORY[0x1E0CD6AF0];
  }
  v17 = *v16;
LABEL_31:
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  v18 = (const void *)*MEMORY[0x1E0CD6C98];
  if (v17)
  {
    CFDictionaryAddValue(Mutable, v18, (const void *)*MEMORY[0x1E0CD6CB8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AD0], v17);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B50], v8);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6910], (const void *)*MEMORY[0x1E0CD6918]);
    objc_msgSend(v3, "port");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (const void *)*MEMORY[0x1E0CD6AC8];
    if (v19)
      v21 = (const void *)objc_msgSend(v3, "port");
    else
      v21 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0C99E98], "da_classicPortForScheme:", v9));
    CFDictionaryAddValue(Mutable, v20, v21);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AC0], (const void *)objc_msgSend(v3, "uri"));
  }
  else
  {
    CFDictionaryAddValue(Mutable, v18, (const void *)*MEMORY[0x1E0CD6CA8]);
    v22 = (const void *)*MEMORY[0x1E0CD6B58];
    objc_msgSend(v3, "URLWithoutUsername");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(Mutable, v22, (const void *)objc_msgSend(v23, "absoluteString"));

  }
  v24 = SecItemDelete(Mutable);
  if (v24)
  {
    v25 = v24;
    DALoggingwithCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_BYTE *)(v5 + 3);
    if (os_log_type_enabled(v26, v27))
    {
      v28 = 67109378;
      *(_DWORD *)v29 = v25;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v3;
      _os_log_impl(&dword_1B51E4000, v26, v27, "error %d: Could not delete password for %@", (uint8_t *)&v28, 0x12u);
    }

  }
  if (Mutable)
    CFRelease(Mutable);
LABEL_21:

}

- (id)guessPasswordForURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  -[DAKeychain loadKeychainInformationsForURL:](self, "loadKeychainInformationsForURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = v4;
  }
  else
  {
    objc_msgSend(v4, "port");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v8 = v4;
    if (!v11)
      goto LABEL_7;
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "da_URLWithScheme:host:port:uri:", v13, v14, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLWithUsername:withPassword:", v17, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DAKeychain loadKeychainInformationsForURL:](self, "loadKeychainInformationsForURL:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
    }
    else
    {
LABEL_7:
      v7 = 0;
      if (v8)
      {
        while (1)
        {
          objc_msgSend(v7, "absoluteString");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
            break;
          objc_msgSend(v8, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "absoluteString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if ((v21 & 1) != 0)
            goto LABEL_13;
          -[DAKeychain loadKeychainInformationsForURL:](self, "loadKeychainInformationsForURL:", v8);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v6 = (void *)v22;
            break;
          }
          v23 = v8;

          objc_msgSend(v23, "URLByRemovingLastPathComponent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v23;
          if (!v8)
          {
            v6 = 0;
            v7 = v23;
            break;
          }
        }
      }
      else
      {
LABEL_13:
        v6 = 0;
      }
    }
  }

  return v6;
}

@end
