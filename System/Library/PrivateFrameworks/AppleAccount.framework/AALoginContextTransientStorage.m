@implementation AALoginContextTransientStorage

+ (id)sharedStorage
{
  if (sharedStorage_onceToken != -1)
    dispatch_once(&sharedStorage_onceToken, &__block_literal_global_30);
  return (id)sharedStorage_storage;
}

void __47__AALoginContextTransientStorage_sharedStorage__block_invoke()
{
  AALoginContextTransientStorage *v0;
  void *v1;

  v0 = objc_alloc_init(AALoginContextTransientStorage);
  v1 = (void *)sharedStorage_storage;
  sharedStorage_storage = (uint64_t)v0;

}

- (AALoginContextTransientStorage)init
{
  AALoginContextTransientStorage *v2;
  NSLock *v3;
  NSLock *clearLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AALoginContextTransientStorage;
  v2 = -[AALoginContextTransientStorage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    clearLock = v2->_clearLock;
    v2->_clearLock = v3;

  }
  return v2;
}

- (void)save:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_clearLock, "lock");
  self->_hasBeenCleared = 0;
  -[NSLock unlock](self->_clearLock, "unlock");
  objc_msgSend(v4, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: saving tokens for Apple ID %@...", buf, 0xCu);
    }

    v25 = CFSTR("AKTransientAppleID");
    v26 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v4, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("AKTransientAltDSID"));
    }
    else
    {
      _AALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: no altDSID in login context!", buf, 2u);
      }

    }
    objc_msgSend(v4, "DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "DSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("AKTransientDSID"));

    }
    if (objc_msgSend(v4, "isBeneficiaryLogin"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBeneficiaryLogin"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, CFSTR("AKTransientIsBeneficiaryLogin"));

    }
    objc_msgSend(v4, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "firstName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, CFSTR("AKTransientFirstName"));

    }
    objc_msgSend(v4, "middleName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "middleName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, CFSTR("AKTransientMiddleName"));

    }
    objc_msgSend(v4, "lastName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "lastName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v19, CFSTR("AKTransientLastName"));

    }
    -[AALoginContextTransientStorage _saveNonsensitiveParameters:](self, "_saveNonsensitiveParameters:", v6);
    _AALogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: saving tokens for Apple ID %@...", buf, 0xCu);
    }

    objc_msgSend(v4, "rawPassword");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AALoginContextTransientStorage _saveKeychainItem:forUsername:service:](self, "_saveKeychainItem:forUsername:service:", v21, v5, CFSTR("com.apple.transient.rp"));

    objc_msgSend(v4, "continuationKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AALoginContextTransientStorage _saveKeychainItem:forUsername:service:](self, "_saveKeychainItem:forUsername:service:", v22, v5, CFSTR("com.apple.transient.ck"));

    objc_msgSend(v4, "passwordResetKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AALoginContextTransientStorage _saveKeychainItem:forUsername:service:](self, "_saveKeychainItem:forUsername:service:", v23, v5, CFSTR("com.apple.transient.prk"));

    objc_msgSend(v4, "cloudKitToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AALoginContextTransientStorage _saveKeychainItem:forUsername:service:](self, "_saveKeychainItem:forUsername:service:", v24, v5, CFSTR("com.apple.transient.ckt"));

  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: fatal error! No Apple ID in login context!", buf, 2u);
  }

}

- (id)storedContext
{
  _BOOL4 hasBeenCleared;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  AAStorableLoginContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_clearLock, "lock");
  hasBeenCleared = self->_hasBeenCleared;
  -[NSLock unlock](self->_clearLock, "unlock");
  if (hasBeenCleared)
    return 0;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: retrieving stored login response parameters...", (uint8_t *)&v22, 2u);
  }

  -[AALoginContextTransientStorage _readNonsensitiveParameters](self, "_readNonsensitiveParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AKTransientAppleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientAltDSID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: found stored login response parameters for %@!", (uint8_t *)&v22, 0xCu);
    }

    v11 = -[AAStorableLoginContext initWithAppleID:altDSID:]([AAStorableLoginContext alloc], "initWithAppleID:altDSID:", v8, v9);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setDSID:](v11, "setDSID:", v12);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientIsBeneficiaryLogin"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AAStorableLoginContext setBeneficiaryLogin:](v11, "setBeneficiaryLogin:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientFirstName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setFirstName:](v11, "setFirstName:", v14);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientMiddleName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setMiddleName:](v11, "setMiddleName:", v15);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AKTransientLastName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setLastName:](v11, "setLastName:", v16);

    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: retrieving temporary keychain items Apple ID %@!", (uint8_t *)&v22, 0xCu);
    }

    -[AALoginContextTransientStorage _keychainItemForUsername:service:](self, "_keychainItemForUsername:service:", v8, CFSTR("com.apple.transient.rp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setRawPassword:](v11, "setRawPassword:", v18);

    -[AALoginContextTransientStorage _keychainItemForUsername:service:](self, "_keychainItemForUsername:service:", v8, CFSTR("com.apple.transient.ck"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setContinuationKey:](v11, "setContinuationKey:", v19);

    -[AALoginContextTransientStorage _keychainItemForUsername:service:](self, "_keychainItemForUsername:service:", v8, CFSTR("com.apple.transient.prk"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setPasswordResetKey:](v11, "setPasswordResetKey:", v20);

    -[AALoginContextTransientStorage _keychainItemForUsername:service:](self, "_keychainItemForUsername:service:", v8, CFSTR("com.apple.transient.ckt"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setCloudKitToken:](v11, "setCloudKitToken:", v21);

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: no known stored Apple ID.", (uint8_t *)&v22, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)clear
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_clearLock, "lock");
  self->_hasBeenCleared = 1;
  -[NSLock unlock](self->_clearLock, "unlock");
  -[AALoginContextTransientStorage _readNonsensitiveParameters](self, "_readNonsensitiveParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AKTransientAppleID"));
    v5 = objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: removing stored login response parameters for Apple ID %@...", (uint8_t *)&v8, 0xCu);
    }

    -[AALoginContextTransientStorage _saveNonsensitiveParameters:](self, "_saveNonsensitiveParameters:", 0);
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: removing temporary keychain items...", (uint8_t *)&v8, 2u);
    }

    -[AALoginContextTransientStorage _deleteKeychainItemForUsername:service:](self, "_deleteKeychainItemForUsername:service:", v5, CFSTR("com.apple.transient.rp"));
    -[AALoginContextTransientStorage _deleteKeychainItemForUsername:service:](self, "_deleteKeychainItemForUsername:service:", v5, CFSTR("com.apple.transient.ck"));
    -[AALoginContextTransientStorage _deleteKeychainItemForUsername:service:](self, "_deleteKeychainItemForUsername:service:", v5, CFSTR("com.apple.transient.prk"));
    -[AALoginContextTransientStorage _deleteKeychainItemForUsername:service:](self, "_deleteKeychainItemForUsername:service:", v5, CFSTR("com.apple.transient.ckt"));
  }
  else
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: nothing to clear.", (uint8_t *)&v8, 2u);
    }
  }

}

- (void)_saveNonsensitiveParameters:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("AAStoredLoginContext"), a3, CFSTR("com.apple.appleaccount.notbackedup"));
  CFPreferencesSynchronize(CFSTR("com.apple.appleaccount.notbackedup"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (id)_readNonsensitiveParameters
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.appleaccount.notbackedup"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("AAStoredLoginContext"), CFSTR("com.apple.appleaccount.notbackedup"), v2, v3);
}

- (void)_saveKeychainItem:(id)a3 forUsername:(id)a4 service:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFDictionary *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[7];
  _QWORD v37[8];

  v37[7] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = *MEMORY[0x1E0CD68B0];
        v14 = *MEMORY[0x1E0CD68F8];
        v36[0] = *MEMORY[0x1E0CD68A0];
        v36[1] = v14;
        v37[0] = v13;
        v37[1] = v8;
        v15 = *MEMORY[0x1E0CD6C98];
        v36[2] = *MEMORY[0x1E0CD6B58];
        v36[3] = v15;
        v16 = *MEMORY[0x1E0CD6CA8];
        v37[2] = v10;
        v37[3] = v16;
        v17 = *MEMORY[0x1E0CD6B80];
        v36[4] = *MEMORY[0x1E0CD6B90];
        v36[5] = v17;
        v37[4] = &unk_1E41A6A50;
        v37[5] = MEMORY[0x1E0C9AAA0];
        v18 = *MEMORY[0x1E0CD70D8];
        v36[6] = *MEMORY[0x1E0CD70D8];
        v37[6] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
        v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v20 = SecItemAdd(v19, 0);
        _AALogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v31 = v8;
          v32 = 2112;
          v33 = v10;
          v34 = 2112;
          v35 = v22;
          _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemAdd (u: %@, s: %@) result: %@", buf, 0x20u);

        }
        if ((_DWORD)v20 == -25299)
        {
          v29 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary dictionaryWithValuesForKeys:](v19, "dictionaryWithValuesForKeys:", v23);
          v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)-[__CFDictionary mutableCopy](v19, "mutableCopy");
          objc_msgSend(v25, "removeObjectForKey:", v18);
          v26 = SecItemUpdate((CFDictionaryRef)v25, v24);
          _AALogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v8;
            v32 = 2112;
            v33 = v10;
            v34 = 2112;
            v35 = v28;
            _os_log_impl(&dword_19EACA000, v27, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemUpdate (u: %@, s: %@) result: %@", buf, 0x20u);

          }
        }
      }
      else
      {
        _AALogSystem();
        v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: save error - could not encode item data", buf, 2u);
        }
      }

    }
    else
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: save error - given nil service!", buf, 2u);
      }
    }

  }
}

- (id)_keychainItemForUsername:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  CFTypeRef v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  CFTypeRef result;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "AALoginContextTransientStorage: fetch error - given nil service!";
LABEL_12:
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  if (!v5)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "AALoginContextTransientStorage: fetch error - given nil username!";
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  v8 = *MEMORY[0x1E0CD6B58];
  v28[0] = *MEMORY[0x1E0CD68F8];
  v28[1] = v8;
  v29[0] = v5;
  v29[1] = v6;
  v9 = *MEMORY[0x1E0CD6CA8];
  v10 = *MEMORY[0x1E0CD7018];
  v28[2] = *MEMORY[0x1E0CD6C98];
  v28[3] = v10;
  v29[2] = v9;
  v29[3] = MEMORY[0x1E0C9AAB0];
  v28[4] = *MEMORY[0x1E0CD7090];
  v29[4] = *MEMORY[0x1E0CD70A0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v11 = objc_claimAutoreleasedReturnValue();
  result = 0;
  v12 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  v13 = result;
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v12 || !v13)
  {
    if ((_DWORD)v12)
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v5;
        v24 = 2112;
        v25 = v7;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemCopyMatching (u: %@, s: %@) failed: %@", buf, 0x20u);

      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemCopyMatching (u: %@, s: %@) returned noErr and nil data!", buf, 0x16u);
    }

    goto LABEL_19;
  }
  if (v15)
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: successfully read keychain item %@", buf, 0xCu);
  }

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = (void *)objc_msgSend(v16, "initWithData:encoding:", result, 4);
  CFRelease(result);
LABEL_20:

  return v17;
}

- (void)_deleteKeychainItemForUsername:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v15) = 0;
    v14 = "AALoginContextTransientStorage: delete error - given nil service!";
LABEL_10:
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 2u);
    goto LABEL_11;
  }
  if (!v5)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v15) = 0;
    v14 = "AALoginContextTransientStorage: delete error - given nil username!";
    goto LABEL_10;
  }
  v8 = *MEMORY[0x1E0CD6CA8];
  v9 = *MEMORY[0x1E0CD68F8];
  v21[0] = *MEMORY[0x1E0CD6C98];
  v21[1] = v9;
  v22[0] = v8;
  v22[1] = v5;
  v21[2] = *MEMORY[0x1E0CD6B58];
  v22[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = SecItemDelete((CFDictionaryRef)v10);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemDelete (u: %@, s: %@) result: %@", (uint8_t *)&v15, 0x20u);

  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearLock, 0);
}

@end
