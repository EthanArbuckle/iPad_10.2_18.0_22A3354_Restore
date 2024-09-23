@implementation AMSMediaTokenServiceStore

- (void)dealloc
{
  objc_super v3;

  -[AMSMediaTokenServiceStore _teardownKeychainNotifications](self, "_teardownKeychainNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AMSMediaTokenServiceStore;
  -[AMSMediaTokenServiceStore dealloc](&v3, sel_dealloc);
}

- (void)_teardownKeychainNotifications
{
  void *v3;
  id v4;

  -[AMSMediaTokenServiceStore _mediaTokenChangedNotificationName](self, "_mediaTokenChangedNotificationName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  }
}

- (id)retrieveToken
{
  os_unfair_lock_s *p_accessLock;
  AMSMediaToken *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  v4 = self->_memoryMediaToken;
  if (!v4)
  {
    -[AMSMediaTokenServiceKeychainStore retrieveToken](self->_keychainStore, "retrieveToken");
    v4 = (AMSMediaToken *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[AMSMediaTokenServiceStore _mediaTokenFromUserDefaults](self, "_mediaTokenFromUserDefaults");
      v4 = (AMSMediaToken *)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[AMSMediaTokenServiceKeychainStore storeToken:](self->_keychainStore, "storeToken:", v4);
    }
    -[AMSMediaTokenServiceStore _deleteMediaTokenFromUserDefaultsIfPresent](self, "_deleteMediaTokenFromUserDefaultsIfPresent");
    objc_storeStrong((id *)&self->_memoryMediaToken, v4);
  }
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (void)_deleteMediaTokenFromUserDefaultsIfPresent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AMSMediaTokens"), CFSTR("com.apple.AppleMediaServices"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
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
        -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v9;
        v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing previously stored media token from user defaults.", (uint8_t *)&v15, 0x16u);

      }
      v12 = (void *)objc_msgSend(v4, "mutableCopy");
      -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

      if (objc_msgSend(v12, "count"))
        v14 = v12;
      else
        v14 = 0;
      CFPreferencesSetAppValue(CFSTR("AMSMediaTokens"), v14, CFSTR("com.apple.AppleMediaServices"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));

    }
  }

}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4
{
  id v6;
  void *v7;
  AMSMediaTokenServiceKeychainStore *v8;
  AMSMediaTokenServiceStore *v9;

  v6 = a3;
  AMSMediaTokenServiceStoreEffectiveKeychainAccessGroup(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSMediaTokenServiceKeychainStore initWithClientIdentifier:keychainAccessGroup:]([AMSMediaTokenServiceKeychainStore alloc], "initWithClientIdentifier:keychainAccessGroup:", v6, v7);
  v9 = -[AMSMediaTokenServiceStore initWithClientIdentifier:keychainStore:](self, "initWithClientIdentifier:keychainStore:", v6, v8);

  return v9;
}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainStore:(id)a4
{
  id v6;
  id v7;
  AMSMediaTokenServiceStore *v8;
  AMSMediaTokenServiceStore *v9;
  uint64_t v10;
  NSString *clientIdentifier;
  uint64_t v12;
  NSString *keychainAccessGroup;
  void *v14;
  uint64_t v15;
  NSString *notificationObject;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSMediaTokenServiceStore;
  v8 = -[AMSMediaTokenServiceStore init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_accessLock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSString *)v10;

    objc_msgSend(v7, "keychainAccessGroup");
    v12 = objc_claimAutoreleasedReturnValue();
    keychainAccessGroup = v9->_keychainAccessGroup;
    v9->_keychainAccessGroup = (NSString *)v12;

    objc_storeStrong((id *)&v9->_keychainStore, a4);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    notificationObject = v9->_notificationObject;
    v9->_notificationObject = (NSString *)v15;

    -[AMSMediaTokenServiceStore _setupKeychainNotifications](v9, "_setupKeychainNotifications");
  }

  return v9;
}

- (void)_setupKeychainNotifications
{
  void *v3;
  id v4;

  -[AMSMediaTokenServiceStore _mediaTokenChangedNotificationName](self, "_mediaTokenChangedNotificationName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", self, sel__mediaTokenChanged_, v4, 0, 2);

  }
}

- (id)_mediaTokenChangedNotificationName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSMediaTokenServiceStore _keychainAccessGroup](self, "_keychainAccessGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.AppleMediaServices.mediaTokenChanged.%@.%@"), v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)_keychainAccessGroup
{
  return AMSMediaTokenServiceStoreEffectiveKeychainAccessGroup(self->_keychainAccessGroup);
}

+ (BOOL)_hasAppleGroupEnabled
{
  if (qword_1ECEAD5F8 != -1)
    dispatch_once(&qword_1ECEAD5F8, &__block_literal_global_79);
  return _MergedGlobals_123;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong((id *)&self->_memoryMediaToken, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

void __50__AMSMediaTokenServiceStore__hasAppleGroupEnabled__block_invoke()
{
  void *v0;
  id v1;

  +[AMSProcessInfo valueForEntitlement:](AMSProcessInfo, "valueForEntitlement:", CFSTR("keychain-access-groups"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = v0;
  else
    v1 = 0;

  _MergedGlobals_123 = objc_msgSend(v1, "containsObject:", CFSTR("apple"));
}

- (void)storeToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  objc_storeStrong((id *)&self->_memoryMediaToken, a3);
  if (-[AMSMediaTokenServiceKeychainStore storeToken:](self->_keychainStore, "storeToken:", v5))
  {
    -[AMSMediaTokenServiceStore _deleteMediaTokenFromUserDefaultsIfPresent](self, "_deleteMediaTokenFromUserDefaultsIfPresent");
    -[AMSMediaTokenServiceStore _mediaTokenChangedNotificationName](self, "_mediaTokenChangedNotificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_accessLock);
    if (v6)
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
        -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting media token changed notification.", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:", v6, self->_notificationObject);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_accessLock);
  }

}

- (void)_mediaTokenChanged:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  AMSMediaToken *memoryMediaToken;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", self->_notificationObject);
  if ((v5 & 1) == 0)
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
      -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received media token changed notification.", (uint8_t *)&v13, 0x16u);

    }
    os_unfair_lock_lock_with_options();
    memoryMediaToken = self->_memoryMediaToken;
    self->_memoryMediaToken = 0;

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 usingAccessControlIdentifier:(BOOL)a5
{
  AMSMediaTokenServiceStore *result;

  result = -[AMSMediaTokenServiceStore initWithClientIdentifier:keychainAccessGroup:](self, "initWithClientIdentifier:keychainAccessGroup:", a3, a4);
  if (result)
    result->_usingAccessControlIdentifier = a5;
  return result;
}

- (void)setKeychainAccessGroup:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  NSString *v7;
  NSString *keychainAccessGroup;
  void *v9;
  AMSMediaToken *memoryMediaToken;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock_with_options();
  -[AMSMediaTokenServiceStore _keychainAccessGroup](self, "_keychainAccessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTokenServiceStore _teardownKeychainNotifications](self, "_teardownKeychainNotifications");
  v7 = (NSString *)objc_msgSend(v5, "copy");

  keychainAccessGroup = self->_keychainAccessGroup;
  self->_keychainAccessGroup = v7;

  -[AMSMediaTokenServiceStore _keychainAccessGroup](self, "_keychainAccessGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTokenServiceKeychainStore setKeychainAccessGroup:](self->_keychainStore, "setKeychainAccessGroup:", v9);
  memoryMediaToken = self->_memoryMediaToken;
  self->_memoryMediaToken = 0;

  -[AMSMediaTokenServiceStore _setupKeychainNotifications](self, "_setupKeychainNotifications");
  os_unfair_lock_unlock(p_accessLock);
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v13;
    v18 = 2114;
    v19 = v15;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Changed keychain access group from %@ to %@.", (uint8_t *)&v16, 0x2Au);

  }
}

- (void)deleteToken
{
  os_unfair_lock_s *p_accessLock;
  AMSMediaToken *memoryMediaToken;
  BOOL v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  memoryMediaToken = self->_memoryMediaToken;
  self->_memoryMediaToken = 0;

  v5 = -[AMSMediaTokenServiceKeychainStore deleteToken](self->_keychainStore, "deleteToken");
  -[AMSMediaTokenServiceStore _deleteMediaTokenFromUserDefaultsIfPresent](self, "_deleteMediaTokenFromUserDefaultsIfPresent");
  if (v5)
  {
    -[AMSMediaTokenServiceStore _mediaTokenChangedNotificationName](self, "_mediaTokenChangedNotificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_accessLock);
    if (v6)
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
        -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting media token changed notification.", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:", v6, self->_notificationObject);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (id)_mediaTokenFromUserDefaults
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AMSMediaTokens"), CFSTR("com.apple.AppleMediaServices"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v22;
      if (!v7)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v21 = v8;
          v11 = (void *)objc_opt_class();
          v20 = v11;
          -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = v11;
          v8 = v21;
          v25 = 2114;
          v26 = v12;
          v27 = 2114;
          v28 = v21;
          _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive media token data. Error: %{public}@", buf, 0x20u);

        }
      }
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v8;
        v16 = (void *)objc_opt_class();
        v17 = v16;
        -[AMSMediaTokenServiceStore clientIdentifier](self, "clientIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v8 = v15;
        v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning media token loaded from user defaults.", buf, 0x16u);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (BOOL)usingAccessControlIdentifier
{
  return self->_usingAccessControlIdentifier;
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (AMSMediaToken)memoryMediaToken
{
  return self->_memoryMediaToken;
}

- (void)setMemoryMediaToken:(id)a3
{
  objc_storeStrong((id *)&self->_memoryMediaToken, a3);
}

- (AMSMediaTokenServiceKeychainStore)keychainStore
{
  return self->_keychainStore;
}

- (NSString)notificationObject
{
  return self->_notificationObject;
}

@end
