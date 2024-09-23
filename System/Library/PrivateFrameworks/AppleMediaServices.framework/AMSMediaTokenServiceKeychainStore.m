@implementation AMSMediaTokenServiceKeychainStore

- (BOOL)_removeTokenFromKeychain
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v5;
    v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Trying to remove media token data from keychain", buf, 0x16u);

  }
  v8 = -[AMSMediaTokenServiceKeychainStore _copyKeychainQuery](self, "_copyKeychainQuery");
  v9 = SecItemDelete(v8);
  CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
  v10 = SecItemDelete(v8);
  CFRelease(v8);
  if ((_DWORD)v9 != -25303 && (_DWORD)v9 != -25300 && (_DWORD)v9)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      v25 = v13;
      -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2114;
      v29 = v14;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove media token data stored with 'after first unlock' attribute from keychain. Status: %{public}@", buf, 0x20u);

    }
  }
  if ((_DWORD)v10 != -25303 && (_DWORD)v10 != -25300 && (_DWORD)v10)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v21 = (void *)objc_opt_class();
    v19 = v21;
    -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    v28 = 2114;
    v29 = v20;
    v30 = 2114;
    v31 = v22;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove media token data stored with 'when unlocked' attribute from keychain. Status: %{public}@", buf, 0x20u);

    goto LABEL_27;
  }
  if ((_DWORD)v9 != -25303 && (_DWORD)v9 && (_DWORD)v9 != -25300)
    return !(_DWORD)v9 || (_DWORD)v10 == 0;
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v18;
    v28 = 2114;
    v29 = v20;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removed media token data from keychain", buf, 0x16u);
LABEL_27:

  }
LABEL_28:

  return !(_DWORD)v9 || (_DWORD)v10 == 0;
}

- (id)retrieveToken
{
  __CFDictionary *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  NSObject *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = -[AMSMediaTokenServiceKeychainStore _copyKeychainQuery](self, "_copyKeychainQuery");
  v4 = (const void *)*MEMORY[0x1E0CD7018];
  CFDictionaryAddValue(v3, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  if (!SecItemCopyMatching(v3, &result))
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  v5 = (const void *)*MEMORY[0x1E0CD68A0];
  CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
  v6 = SecItemCopyMatching(v3, &result);
  if (!(_DWORD)v6)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = (uint64_t)v9;
      v57 = 2114;
      v58 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Media token previously stored with 'when unlocked' attribute found, attempting to re-save with 'after first unlock' and then return it.", buf, 0x16u);

    }
    CFDictionaryRemoveValue(v3, v4);
    v12 = SecItemDelete(v3);
    if ((_DWORD)v12)
    {
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = (uint64_t)v15;
        v57 = 2114;
        v58 = v17;
        v59 = 2114;
        v60 = v18;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete media token previously stored with 'when unlocked' attribute. Status: %{public}@", buf, 0x20u);

      }
    }
    CFDictionarySetValue(v3, v5, (const void *)*MEMORY[0x1E0CD68A8]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x1E0CD70D8], result);
    if (SecItemAdd(v3, 0))
    {
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_opt_class();
        v22 = v21;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = (uint64_t)v21;
        v57 = 2114;
        v58 = v23;
        v59 = 2114;
        v60 = v24;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to re-save media token data with 'after first unlock' attribute. Status: %{public}@", buf, 0x20u);

      }
    }
    goto LABEL_19;
  }
LABEL_20:
  CFRelease(v3);
  if ((_DWORD)v6 || (v25 = (void *)result) == 0)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_opt_class();
      v38 = v37;
      -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v40 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = (uint64_t)v37;
      v57 = 2114;
      v58 = v39;
      v59 = 2114;
      v60 = v40;
      _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch media token data from keychain. Status: %{public}@", buf, 0x20u);

    }
    if (soft_MKBDeviceUnlockedSinceBoot())
      return 0;
    v42 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v43 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v43;
    if (v42)
    {
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_opt_class();
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v45;
        v57 = 2114;
        v58 = v46;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected attempt to retrieve token before first unlock", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v27, 0);
    }
    else
    {
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v51 = objc_opt_class();
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v51;
        v57 = 2114;
        v58 = v52;
        _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Unexpected attempt to retrieve token before first unlock", buf, 0x16u);

      }
    }
    v34 = 0;
  }
  else
  {
    v53 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), result, &v53);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v53;
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v27)
    {
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_opt_class();
        v32 = v31;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = (uint64_t)v31;
        v57 = 2114;
        v58 = v33;
        v59 = 2114;
        v60 = v27;
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive media token data. Error: %{public}@", buf, 0x20u);

      }
      v34 = 0;
    }
    else
    {
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = (void *)objc_opt_class();
        v49 = v48;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = (uint64_t)v48;
        v57 = 2114;
        v58 = v50;
        _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieved media token data from keychain", buf, 0x16u);

      }
      v34 = v26;
    }

  }
  return v34;
}

- (AMSMediaTokenServiceKeychainStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4
{
  id v6;
  id v7;
  AMSMediaTokenServiceKeychainStore *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  uint64_t v11;
  NSString *keychainAccessGroup;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaTokenServiceKeychainStore;
  v8 = -[AMSMediaTokenServiceKeychainStore init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    keychainAccessGroup = v8->_keychainAccessGroup;
    v8->_keychainAccessGroup = (NSString *)v11;

  }
  return v8;
}

- (__CFDictionary)_copyKeychainQuery
{
  __CFDictionary *Mutable;
  const void *v4;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v4 = (const void *)*MEMORY[0x1E0CD68F8];
  -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryAddValue(Mutable, v4, v5);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70A8], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("com.apple.AppleMediaServices.mediaToken"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68A8]);
  -[AMSMediaTokenServiceKeychainStore keychainAccessGroup](self, "keychainAccessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (const void *)*MEMORY[0x1E0CD6898];
    -[AMSMediaTokenServiceKeychainStore keychainAccessGroup](self, "keychainAccessGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(Mutable, v7, v8);

  }
  return Mutable;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (BOOL)storeToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v36;
  _QWORD block[5];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSMediaTokenServiceKeychainStore _removeTokenFromKeychain](self, "_removeTokenFromKeychain");
  if (v4)
  {
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v38);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v38;
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_opt_class();
        v11 = v10;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = (uint64_t)v10;
        v41 = 2114;
        v42 = v12;
        v43 = 2114;
        v44 = v6;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive media token. Error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v14 = -[AMSMediaTokenServiceKeychainStore _copyKeychainQuery](self, "_copyKeychainQuery");
      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD70D8], v5);
      v15 = SecItemAdd(v14, 0);
      CFRelease(v14);
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (!(_DWORD)v15)
      {
        if (!v16)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_opt_class();
          v31 = v30;
          -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = (uint64_t)v30;
          v41 = 2114;
          v42 = v32;
          _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saved media token data to keychain.", buf, 0x16u);

        }
        v13 = 1;
        goto LABEL_40;
      }
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class();
        v36 = v19;
        -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = (uint64_t)v19;
        v41 = 2114;
        v42 = v20;
        v43 = 2114;
        v44 = v21;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to save media token data to keychain. Status: %{public}@", buf, 0x20u);

      }
      if (!soft_MKBDeviceUnlockedSinceBoot())
      {
        v22 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v22)
        {
          if (!v23)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v24, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = objc_opt_class();
            -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v26;
            v41 = 2114;
            v42 = v27;
            _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected attempt to store token before first unlock", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v28, 0);
        }
        else
        {
          if (!v23)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v24, "OSLogObject");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            v33 = objc_opt_class();
            -[AMSMediaTokenServiceKeychainStore clientIdentifier](self, "clientIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v33;
            v41 = 2114;
            v42 = v34;
            _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Unexpected attempt to store token before first unlock", buf, 0x16u);

          }
        }

      }
      if ((_DWORD)v15 == -34018)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __48__AMSMediaTokenServiceKeychainStore_storeToken___block_invoke;
        block[3] = &unk_1E253DBD8;
        block[4] = self;
        if (storeToken__logOnceToken__COUNTER__ == -1)
        {
          v13 = 0;
LABEL_40:

          goto LABEL_41;
        }
        dispatch_once(&storeToken__logOnceToken__COUNTER__, block);
      }
    }
    v13 = 0;
    goto LABEL_40;
  }
  v13 = 1;
LABEL_41:

  return v13;
}

void __48__AMSMediaTokenServiceKeychainStore_storeToken___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Failed to save media token to keychain, it will be refetched for every request (performance concern)", (uint8_t *)&v6, 0x16u);

  }
}

- (void)setKeychainAccessGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
