@implementation MFAccount

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MFAccount baseAccount](self, "baseAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForDataclass:", v4);

  return v6;
}

- (ECAccount)baseAccount
{
  return self->_baseAccount;
}

- (NSString)uniqueID
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0C8EF30];
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", *MEMORY[0x1E0C8EF30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFAccount mf_lock](self, "mf_lock");
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, v3);
    -[MFAccount mf_unlock](self, "mf_unlock");
  }
  return (NSString *)v4;
}

- (id)_objectForAccountInfoKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MFAccount mf_lock](self, "mf_lock");
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount mf_unlock](self, "mf_unlock");

  return v5;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_unsavedAccountProperties, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend((id)objc_opt_class(), "_basicPropertyForKey:persistentAccount:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "accountPropertyForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v7;
  }

  return v6;
}

- (ACAccount)persistentAccount
{
  os_unfair_lock_s *p_persistentAccountLock;
  ACAccount *v4;

  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  v4 = self->_persistentAccount;
  os_unfair_lock_unlock(p_persistentAccountLock);
  return v4;
}

+ (id)_basicPropertyForKey:(id)a3 persistentAccount:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  _MFLockGlobalLock();
  if (!v6)
    goto LABEL_9;
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8EF30]))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Username")))
    {
      objc_msgSend(v6, "username");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("DisplayName")))
    {
      objc_msgSend(v6, "accountDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = (void *)v7;
LABEL_10:
  _MFUnlockGlobalLock();

  return v8;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *unsavedAccountProperties;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_setBasicProperty:forKey:persistentAccount:", v11, v6, v7) & 1) == 0)
      objc_msgSend(v7, "setAccountProperty:forKey:", v11, v6);
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    if (!unsavedAccountProperties)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_unsavedAccountProperties;
      self->_unsavedAccountProperties = v9;

      unsavedAccountProperties = self->_unsavedAccountProperties;
    }
    -[NSMutableDictionary setValue:forKey:](unsavedAccountProperties, "setValue:forKey:", v11, v6);
  }

}

uint64_t __27__MFAccount__newConnection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isSyncingNotes
{
  return -[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3F8]);
}

- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MFAccount mf_lock](self, "mf_lock");
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount mf_unlock](self, "mf_unlock");
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      a4 = objc_msgSend(v7, "BOOLValue");
  }

  return a4;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    -[MFAccount description](self, "description");
  else
    -[MFAccount _privacySafeDescription](self, "_privacySafeDescription");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_privacySafeDescription
{
  NSString *cachedPrivacySafeDescription;
  NSString *v4;
  void *v5;

  -[MFAccount mf_lock](self, "mf_lock");
  cachedPrivacySafeDescription = self->_cachedPrivacySafeDescription;
  if (cachedPrivacySafeDescription)
  {
    v4 = cachedPrivacySafeDescription;
  }
  else
  {
    -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", *MEMORY[0x1E0C8EF30]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> ID=%@"), objc_opt_class(), self, v5);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&self->_cachedPrivacySafeDescription, v4);

  }
  -[MFAccount mf_unlock](self, "mf_unlock");
  return v4;
}

- (NSString)personaIdentifier
{
  void *v2;
  void *v3;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return (NSString *)-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", *MEMORY[0x1E0C8EF30]);
}

- (void)_queueAccountInfoDidChange
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_accountInfoDidChange, 0);
  -[MFAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_accountInfoDidChange, 0, 0.0);
}

- (NSString)hostname
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Hostname"));
}

- (id)missingPasswordErrorWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("NO_PASSWORD_PROVIDED_FOR_ACCOUNT_FORMAT"), CFSTR("No password provided for “%@”.\n\nPlease go to Mail Account Settings and enter a password."), CFSTR("Message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1055, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_newConnection
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(-[MFAccount connectionClass](self, "connectionClass"));
  if (v3)
  {
    -[MFAccount currentConnections](self, "currentConnections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__MFAccount__newConnection__block_invoke;
    v6[3] = &unk_1E4E88940;
    v7 = v3;
    objc_msgSend(v4, "performWhileLocked:", v6);

  }
  return v3;
}

- (EFLocked)currentConnections
{
  return self->_currentConnections;
}

- (unint64_t)credentialAccessibility
{
  void *v2;
  id v3;
  unint64_t v4;
  id v6;

  v6 = 0;
  -[MFAccount _passwordWithError:](self, "_passwordWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (objc_msgSend(v2, "length"))
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "mf_isInaccessibleAccountCredentialError"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_passwordWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  MFAccount *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  MFAccount *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[MFAccount persistentAccount](self, "persistentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v7, "credentialWithError:", &v18);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (v9)
  {
    MFAccountsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = "NOT ";
      *(_DWORD *)buf = 138412802;
      v20 = self;
      if (v5)
        v17 = "";
      v21 = 2080;
      v22 = v17;
      v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_ERROR, "Encountered error while fetching credential for %@ (will %screate new credential): %{public}@", buf, 0x20u);

    }
  }
  if (!v8 && v5)
  {
    MFAccountsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v12 = (MFAccount *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Creating new credential for account %{public}@", buf, 0xCu);

    }
    v8 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
    -[MFAccount mf_lock](self, "mf_lock");
    -[MFAccount persistentAccount](self, "persistentAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCredential:", v8);

    -[MFAccount mf_unlock](self, "mf_unlock");
  }
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (NSString)parentAccountIdentifier
{
  os_unfair_lock_s *p_persistentAccountLock;
  void *v4;
  void *v5;
  void *v6;

  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  -[MFAccount baseAccount](self, "baseAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (NSString *)v6;
}

+ (BOOL)usesSSL
{
  return 0;
}

+ (id)hostname
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFAccount uniqueID](self, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)_newPersistentAccount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newPersistentAccountWithAccountTypeIdentifier:", v2);
  objc_msgSend(v3, "supportedDataclassesWithAccountTypeIdentifier:", v2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x1E0C8F3F8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "setProvisioned:forDataclass:", 1, v10, (_QWORD)v12);
        objc_msgSend(v4, "setEnabled:forDataclass:", objc_msgSend(v10, "isEqualToString:", v8) ^ 1, v10);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "setAuthenticated:", 1);
  return v4;
}

- (BOOL)primaryiCloudAccount
{
  void *v2;
  void *v3;
  char v4;

  -[MFAccount persistentAccount](self, "persistentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);

  return v4;
}

- (MFAccount)initWithPersistentAccount:(id)a3
{
  id v4;
  MFAccount *v5;
  MFAccount *v6;
  uint64_t v7;
  ECAccount *baseAccount;
  id v9;
  void *v10;
  uint64_t v11;
  EFLocked *currentConnections;
  objc_super v14;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_msgSend((id)objc_opt_class(), "_newPersistentAccount");
  v14.receiver = self;
  v14.super_class = (Class)MFAccount;
  v5 = -[MFAccount init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_persistentAccountLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D1E678], "accountWithSystemAccount:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    baseAccount = v6->_baseAccount;
    v6->_baseAccount = (ECAccount *)v7;

    -[MFAccount setPersistentAccount:](v6, "setPersistentAccount:", v4);
    v9 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithObject:", v10);
    currentConnections = v6->_currentConnections;
    v6->_currentConnections = (EFLocked *)v11;

    v6->_allowsTrustPrompt = 1;
  }

  return v6;
}

- (void)setPersistentAccount:(id)a3
{
  ACAccount *v6;
  ACAccount *persistentAccount;
  void *v8;
  void *v9;
  ACAccount *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = (ACAccount *)a3;
  if (v6 && self->_unsavedAccountProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Account.m"), 262, CFSTR("Cannot set persistent account on account with unsaved account properties"));

  }
  persistentAccount = self->_persistentAccount;
  if (persistentAccount != v6)
  {
    if (persistentAccount)
    {
      MFUserAgent();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        objc_msgSend((id)objc_opt_class(), "releaseAllConnectionsScheduler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __34__MFAccount_setPersistentAccount___block_invoke;
        v13[3] = &unk_1E4E888C8;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v9, "performBlock:", v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
    os_unfair_lock_lock(&self->_persistentAccountLock);
    v10 = self->_persistentAccount;
    objc_storeStrong((id *)&self->_persistentAccount, a3);
    if (v6)
    {
      -[MFAccount baseAccount](self, "baseAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSystemAccount:", v6);

    }
    os_unfair_lock_unlock(&self->_persistentAccountLock);
    -[MFAccount persistentAccountDidChange:previousAccount:](self, "persistentAccountDidChange:previousAccount:", v6, v10);

  }
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v4;

  -[MFAccount baseAccount](self, "baseAccount", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

}

+ (id)releaseAllConnectionsScheduler
{
  if (releaseAllConnectionsScheduler_onceToken != -1)
    dispatch_once(&releaseAllConnectionsScheduler_onceToken, &__block_literal_global_89);
  return (id)releaseAllConnectionsScheduler_scheduler;
}

+ (void)setShouldHealAccounts:(BOOL)a3
{
  sShouldHealAccount = a3;
}

+ (BOOL)isCommonPortNumber:(unsigned int)a3
{
  return objc_msgSend(a1, "defaultPortNumber") == a3
      || objc_msgSend(a1, "defaultSecurePortNumber") == a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  NSString *cachedDescription;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MFAccount mf_lock](self, "mf_lock");
  cachedDescription = self->_cachedDescription;
  if (cachedDescription)
  {
    v4 = cachedDescription;
  }
  else
  {
    -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_sha256Digest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_hexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFAccount _privacySafeDescription](self, "_privacySafeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" displayName=%@"), v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v5 && v7)
      objc_storeStrong((id *)&self->_cachedDescription, v4);

  }
  -[MFAccount mf_unlock](self, "mf_unlock");
  return v4;
}

+ (BOOL)accountSourceIsManaged:(id)a3
{
  return objc_msgSend(a3, "MCIsManaged");
}

void __43__MFAccount_releaseAllConnectionsScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.Message.ReleaseAllConnections"), 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)releaseAllConnectionsScheduler_scheduler;
  releaseAllConnectionsScheduler_scheduler = v0;

}

- (void)accountInfoDidChange
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAccount properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AccountInfoDidChange"), self, v3);

}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;

  -[MFAccount persistentAccount](self, "persistentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFAccount baseAccount](self, "baseAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_unsavedAccountProperties;
  }

  return (NSDictionary *)v5;
}

void __34__MFAccount_setPersistentAccount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "releaseAllConnections");

}

- (NSString)username
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Username"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnections, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_baseAccount, 0);
  objc_storeStrong((id *)&self->emailAddressStrings, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_cachedPrivacySafeDescription, 0);
  objc_storeStrong((id *)&self->_unsavedAccountProperties, 0);
  objc_storeStrong((id *)&self->_persistentAccount, 0);
}

- (NSString)displayName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFAccount username](self, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || (objc_msgSend(v5, "isEqualToString:", &stru_1E4F1C8F8) & 1) != 0)
    {
      v3 = 0;
LABEL_10:

      return (NSString *)v3;
    }
    if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "accountTypeString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@@%@"), v8, v4, v6);
      v3 = (id)objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_10;
    }
    else
    {
      v3 = v6;
    }
    -[MFAccount mf_lock](self, "mf_lock");
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v3, CFSTR("DisplayName"));
    -[MFAccount mf_unlock](self, "mf_unlock");
    goto LABEL_10;
  }
  return (NSString *)v3;
}

+ (BOOL)shouldHealAccounts
{
  return sShouldHealAccount;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  char v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  v7 = (0x4601u >> (v4 - 51)) & 1;
  if ((unint64_t)(v4 - 51) >= 0xF)
    LOBYTE(v7) = 0;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  objc_msgSend(v3, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MFMessageErrorDomain"));

  if (v10)
    v8 = v4 == 1034;
  objc_msgSend(v3, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  v13 = (unint64_t)(v4 - 1) < 2;
  if (!v12)
    v13 = v8;
  if (v13)
    v14 = objc_msgSend((id)objc_opt_class(), "shouldHealAccounts");
  else
    v14 = 0;

  return v14;
}

+ (id)newAccountWithDictionary:(id)a3
{
  objc_msgSend(a1, "accountWithProperties:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)excludedAccountPropertyKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Password"), CFSTR("OAuth2Token"), CFSTR("OAuth2RefreshToken"), 0);
}

+ (id)accountWithProperties:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperties:", v3);

  return v4;
}

+ (id)authSchemesForAccountClass
{
  _QWORD v4[5];

  if (authSchemesForAccountClass_onceToken != -1)
    dispatch_once(&authSchemesForAccountClass_onceToken, &__block_literal_global);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MFAccount_authSchemesForAccountClass__block_invoke_2;
  v4[3] = &__block_descriptor_40_e32_B16__0__ECAuthenticationScheme_8l;
  v4[4] = a1;
  objc_msgSend((id)authSchemesForAccountClass_knownSchemes, "ef_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __39__MFAccount_authSchemesForAccountClass__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1E688], "knownSchemes");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)authSchemesForAccountClass_knownSchemes;
  authSchemesForAccountClass_knownSchemes = v0;

}

uint64_t __39__MFAccount_authSchemesForAccountClass__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canAuthenticateAccountClass:connection:", *(_QWORD *)(a1 + 32), 0);
}

- (MFAccount)init
{
  return -[MFAccount initWithProperties:](self, "initWithProperties:", 0);
}

- (MFAccount)initWithProperties:(id)a3
{
  id v4;
  MFAccount *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[MFAccount initWithPersistentAccount:](self, "initWithPersistentAccount:", 0);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_opt_new();
    v9 = v8;

    objc_msgSend((id)objc_opt_class(), "_accountClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("Class"));

    v5->_allowsTrustPrompt = 1;
    -[MFAccount _setAccountProperties:](v5, "_setAccountProperties:", v9);

  }
  return v5;
}

+ (id)accountWithPersistentAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingAccountWithPersistentAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (void)savePersistentAccount
{
  id v3;

  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savePersistentAccountWithAccount:", self);

}

- (void)removePersistentAccount
{
  id v3;

  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePersistentAccountWithAccount:", self);

}

- (NSString)altDSID
{
  return (NSString *)-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("altDSID"));
}

- (ACAccount)parentAccount
{
  os_unfair_lock_s *p_persistentAccountLock;
  void *v4;
  void *v5;
  void *v6;

  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  -[MFAccount baseAccount](self, "baseAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (ACAccount *)v6;
}

- (NSString)type
{
  return (NSString *)-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("Type"));
}

- (id)accountClass
{
  return -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("Class"));
}

+ (id)existingAccountForUniqueID:(id)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

+ (id)predefinedValueForKey:(id)a3
{
  return 0;
}

+ (id)propertiesWhichRequireValidation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Hostname"), CFSTR("PortNumber"), CFSTR("Username"), CFSTR("Password"), CFSTR("SSLEnabled"), CFSTR("AuthenticationScheme"), 0);
}

- (void)removeAccountPropertyForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_setBasicProperty:forKey:persistentAccount:", 0, v5, v4) & 1) == 0)
      objc_msgSend(v4, "setAccountProperty:forKey:", 0, v5);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_unsavedAccountProperties, "removeObjectForKey:", v5);
  }

}

+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    _MFLockGlobalLock();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8EF30]))
    {
      objc_msgSend(v9, "setIdentifier:", v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Username")))
    {
      objc_msgSend(v9, "setUsername:", v7);
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("DisplayName")))
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v9, "setAccountDescription:", v7);
    }
    v10 = 1;
LABEL_10:
    _MFUnlockGlobalLock();
    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (NSString)accountTypeString
{
  return (NSString *)CFSTR("Account");
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E0CD6B28];
}

- (void)_setAccountProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v16, "objectForKey:", CFSTR("Password"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v16, "objectForKey:", CFSTR("Password"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 1);

  }
  else
  {
    v18 = v4;
  }
  objc_msgSend(v16, "removeObjectForKey:", CFSTR("Password"));
  objc_msgSend(v17, "objectForKey:", CFSTR("OAuth2Token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("OAuth2RefreshToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount mf_lock](self, "mf_lock");
  if (v7)
    -[MFAccount setOAuth2Token:refreshToken:](self, "setOAuth2Token:refreshToken:", v7, v8);
  -[MFAccount uniqueID](self, "uniqueID");

  objc_msgSend((id)objc_opt_class(), "excludedAccountPropertyKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v16;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v10, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v15, v14);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  if (v18)
    -[MFAccount setPassword:](self, "setPassword:", v18);
  -[MFAccount mf_unlock](self, "mf_unlock");

}

+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (objc_msgSend(v5, "isEqual:", CFSTR("EmailAddresses")))
  {
    objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqual:", CFSTR("Password")))
    -[MFAccount setPassword:](self, "setPassword:", v7);
  else
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, v6);
  -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");

}

- (void)removeValueInAccountPropertiesForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[MFAccount mf_lock](self, "mf_lock");
  -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", v4);
  -[MFAccount mf_unlock](self, "mf_unlock");

}

- (id)valueInAccountPropertiesForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("SSLEnabled")))
  {
    -[MFAccount mf_lock](self, "mf_lock");
    -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount mf_unlock](self, "mf_unlock");
    if (objc_msgSend(v4, "isEqual:", CFSTR("Password")))
    {
      -[MFAccount password](self, "password");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isEqual:", CFSTR("EmailAddresses")))
        goto LABEL_10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v5, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = v9;
        goto LABEL_6;
      }
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
LABEL_6:

    v5 = (void *)v7;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFAccount usesSSL](self, "usesSSL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (BOOL)isActive
{
  void *v2;
  void *v3;
  char v4;

  -[MFAccount persistentAccount](self, "persistentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isActive");
  else
    v4 = 1;

  return v4;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MFAccount persistentAccount](self, "persistentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActive:", v3);

  }
}

- (BOOL)canGoOffline
{
  return 0;
}

- (void)setDisplayName:(id)a3
{
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v6 = (__CFString *)a3;
  -[MFAccount displayName](self, "displayName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
  {
    if (v4)
      v5 = v4;
    else
      v5 = &stru_1E4F1C8F8;
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v5) & 1) == 0)
    {
      -[MFAccount mf_lock](self, "mf_lock");
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("DisplayName"));
      -[MFAccount mf_unlock](self, "mf_unlock");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }

}

- (void)setUsername:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v6 = (__CFString *)a3;
  -[MFAccount username](self, "username");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
  {
    v5 = v4 ? v4 : &stru_1E4F1C8F8;
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v5) & 1) == 0)
    {
      -[MFAccount mf_lock](self, "mf_lock");
      if (v6 && -[__CFString length](v6, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("Username"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Username"));
      -[MFAccount mf_unlock](self, "mf_unlock");
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }

}

- (void)setHostname:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v8 = (__CFString *)a3;
  -[MFAccount hostname](self, "hostname");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
  {
    -[__CFString mf_stringWithNoExtraSpaces](v8, "mf_stringWithNoExtraSpaces");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v5;
  }
  else
  {
    v6 = v8;
  }
  v9 = v6;
  if (v4 != v6)
  {
    v7 = v4 ? v4 : &stru_1E4F1C8F8;
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v7) & 1) == 0)
    {
      -[MFAccount mf_lock](self, "mf_lock");
      if (v9 && -[__CFString length](v9, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v9, CFSTR("Hostname"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Hostname"));
      -[MFAccount mf_unlock](self, "mf_unlock");
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }

}

+ (BOOL)accountIsManaged:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", *MEMORY[0x1E0C8EFC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountPropertyForKey:", CFSTR("mcProfileUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "accountPropertyForKey:", CFSTR("ManagedTag"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "length") != 0;

    }
  }

  return v5;
}

+ (BOOL)accountIsPreventedFromSendingFromExternalProcesses:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("MFRestrictSendingFromExternalProcesses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)accountIsRestrictedFromTransfersToOtherAccounts:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("MFRestrictMessageTransfersToOtherAccounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)accountRestrictsRecentsSyncing:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("Prevent Recents Syncing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isManaged
{
  return +[MFAccount accountIsManaged:](MFAccount, "accountIsManaged:", self);
}

- (NSString)managedTag
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("ManagedTag"));
}

- (NSString)statisticsKind
{
  return 0;
}

- (BOOL)supportsMailDrop
{
  return !-[MFAccount isManaged](self, "isManaged")
      || -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("MFAccountSupportsMailDrop"), 0);
}

- (id)_credential
{
  void *v2;
  void *v3;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_credentialCreateIfNecessary:(BOOL)a3
{
  return -[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", a3, 0);
}

- (void)setPassword:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFAccount baseAccount](self, "baseAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassword:", v6);

  if (v6 && objc_msgSend(v6, "length"))
  {
    -[MFAccount persistentAccount](self, "persistentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthenticated:", 1);

  }
  else
  {
    -[MFAccount mf_lock](self, "mf_lock");
    -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Password"));
    -[MFAccount mf_unlock](self, "mf_unlock");
  }
  -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");

}

- (id)_password
{
  void *v2;
  void *v3;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)password
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "requiresPassword") & 1) != 0)
  {
    -[MFAccount _password](self, "_password");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E4F1C8F8;
  }

  return (NSString *)v5;
}

- (NSString)oauth2Token
{
  void *v2;
  void *v3;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oauthToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFAccount baseAccount](self, "baseAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOAuth2Token:refreshToken:", v8, v6);

}

- (NSString)sourceApplicationBundleIdentifier
{
  NSString *v2;
  void *v3;

  v2 = self->_sourceApplicationBundleIdentifier;
  if (!v2)
  {
    MFUserAgent();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "sourceApplicationBundleIdentifier");
      v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[MFAccount accountForRenewingCredentials](self, "accountForRenewingCredentials");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke;
    v12[3] = &unk_1E4E888F0;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v10, "renewCredentialsForAccount:options:completion:", v8, v13, v12);

  }
  return v8 != 0;
}

void __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke(uint64_t a1, __CFString *a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MFAccountsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR(", error:");
    v8 = &stru_1E4F1C8F8;
    *(_DWORD *)buf = 134218498;
    v16 = a2;
    if (!v5)
      v7 = &stru_1E4F1C8F8;
    v17 = 2112;
    if (v5)
      v8 = v5;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Credential renewal result: %ld%@%@", buf, 0x20u);
  }

  if (a2)
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a2 = v5;
      }
      else
      {
        v13 = *MEMORY[0x1E0CB3388];
        v14 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, 0, 0, v11);
        a2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0C8F310]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, v10, 0, 0);
      a2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, v9, a2);

}

- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MFAccount primaryiCloudAccount](self, "primaryiCloudAccount"))
  {
    v9 = *MEMORY[0x1E0C8F330];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C8F330]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v9);
    v11 = *MEMORY[0x1E0C8F320];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C8F320]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v11);
  }
  MFAccountsLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount uniqueID](self, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F330]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F320]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Renewing credential for account: %{public}@ with force:%{public}@ avoidUI:%{public}@", (uint8_t *)&v19, 0x20u);

  }
  v17 = -[MFAccount _renewCredentialsWithOptions:completion:](self, "_renewCredentialsWithOptions:completion:", v8, v7);

  return v17;
}

- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ACAccount *persistentAccount;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[MFAccount accountForRenewingCredentials](self, "accountForRenewingCredentials");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistentStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    persistentAccount = self->_persistentAccount;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke;
    v15[3] = &unk_1E4E88918;
    v16 = v9;
    objc_msgSend(v12, "openAuthenticationURL:forAccount:shouldConfirm:completion:", v8, persistentAccount, v6, v15);

  }
  return v10 != 0;
}

void __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MFAccountsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("failure");
    if (a2)
      v7 = CFSTR("success");
    *(_DWORD *)buf = 138412802;
    v15 = v7;
    if (v5)
      v8 = CFSTR(", error:");
    else
      v8 = &stru_1E4F1C8F8;
    v16 = 2112;
    v17 = v8;
    if (v5)
      v9 = v5;
    else
      v9 = &stru_1E4F1C8F8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Web login result: %@%@%@", buf, 0x20u);
  }

  if ((a2 & 1) != 0)
  {
    v10 = 0;
  }
  else if (v5)
  {
    v12 = *MEMORY[0x1E0CB3388];
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, 0, 0, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)fetchTokensIfNecessary:(id *)a3
{
  return 1;
}

- (ACAccount)systemAccount
{
  os_unfair_lock_s *p_persistentAccountLock;
  void *v4;
  void *v5;

  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  -[MFAccount baseAccount](self, "baseAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (ACAccount *)v5;
}

- (BOOL)canAuthenticateWithCurrentCredentials
{
  void *v2;
  BOOL v3;

  -[MFAccount authenticatedConnection](self, "authenticatedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPasswordCredential
{
  void *v2;
  void *v3;
  char v4;

  -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1E668]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E4F1C8F8);

  return v4;
}

- (unsigned)portNumber
{
  void *v3;
  unsigned int v4;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("PortNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4)
    return v4;
  if (-[MFAccount usesSSL](self, "usesSSL")
    && (v4 = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber")) != 0)
  {
    return v4;
  }
  else
  {
    return -[MFAccount defaultPortNumber](self, "defaultPortNumber");
  }
}

- (unsigned)defaultPortNumber
{
  return objc_msgSend((id)objc_opt_class(), "defaultPortNumber");
}

+ (unsigned)defaultPortNumber
{
  return 0;
}

- (unsigned)defaultSecurePortNumber
{
  return objc_msgSend((id)objc_opt_class(), "defaultSecurePortNumber");
}

+ (unsigned)defaultSecurePortNumber
{
  return 0;
}

- (void)setPortNumber:(unsigned int)a3
{
  unsigned int v5;
  unsigned int v6;
  void *v7;

  if (-[MFAccount portNumber](self, "portNumber") != a3)
  {
    if (a3)
    {
      if (-[MFAccount usesSSL](self, "usesSSL"))
        v5 = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
      else
        v5 = -[MFAccount defaultPortNumber](self, "defaultPortNumber");
      v6 = v5;
      -[MFAccount mf_lock](self, "mf_lock");
      if (v6 != a3)
      {
        EFStringWithInt();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, CFSTR("PortNumber"));

        goto LABEL_10;
      }
    }
    else
    {
      -[MFAccount mf_lock](self, "mf_lock");
    }
    -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("PortNumber"));
LABEL_10:
    -[MFAccount mf_unlock](self, "mf_unlock");
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

- (id)serviceName
{
  return 0;
}

- (id)secureServiceName
{
  return 0;
}

- (__CFString)connectionServiceType
{
  return 0;
}

- (BOOL)usesSSL
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("SSLEnabled"), objc_msgSend((id)objc_opt_class(), "usesSSL"));
}

- (void)setUsesSSL:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (-[MFAccount usesSSL](self, "usesSSL") != a3)
  {
    -[MFAccount mf_lock](self, "mf_lock");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("SSLEnabled"));

    }
    else
    {
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SSLEnabled"));
    }
    -[MFAccount mf_unlock](self, "mf_unlock");
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

+ (BOOL)isSSLEditable
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "predefinedValueForKey:", CFSTR("SSLEnabledIsEditable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MFAccount _shouldTryDirectSSLConnectionOnPort:](self, "_shouldTryDirectSSLConnectionOnPort:", -[MFAccount portNumber](self, "portNumber")) != a3)
  {
    -[MFAccount mf_lock](self, "mf_lock");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("SSLIsDirect"));

    -[MFAccount mf_unlock](self, "mf_unlock");
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

- (NSString)domain
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Domain"));
}

- (void)setDomain:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v6 = (__CFString *)a3;
  -[MFAccount domain](self, "domain");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
  {
    v5 = v4 ? v4 : &stru_1E4F1C8F8;
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v5) & 1) == 0)
    {
      -[MFAccount mf_lock](self, "mf_lock");
      if (v6 && -[__CFString length](v6, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("Domain"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Domain"));
      -[MFAccount mf_unlock](self, "mf_unlock");
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }

}

- (id)clientCertificates
{
  void *v3;
  __SecIdentity *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLClientIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFAccount hostname](self, "hostname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[MFMessageKeychainManager copyClientSSLIdentityForHostName:error:](MFMessageKeychainManager, "copyClientSSLIdentityForHostName:error:", v6, 0);

    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", v3, 0);
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
LABEL_6:

  return v5;
}

- (void)setClientCertificates:(id)a3
{
  const void *v4;
  CFTypeID v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v4 = (const void *)objc_msgSend(v7, "objectAtIndex:", 0);
    v5 = CFGetTypeID(v4);
    if (v5 == SecIdentityGetTypeID())
    {
      +[MFMessageKeychainManager persistentReferenceForIdentity:error:](MFMessageKeychainManager, "persistentReferenceForIdentity:error:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount mf_lock](self, "mf_lock");
      if (v6)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("SSLClientIdentity"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SSLClientIdentity"));
      -[MFAccount mf_unlock](self, "mf_unlock");

    }
  }

}

- (ECAuthenticationScheme)preferredAuthScheme
{
  void *v3;
  id v4;
  void *v5;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("AuthenticationScheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length") && -[MFAccount requiresAuthentication](self, "requiresAuthentication"))
  {
    v4 = (id)*MEMORY[0x1E0D1E668];

    v3 = v4;
  }
  objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ECAuthenticationScheme *)v5;
}

- (void)setPreferredAuthScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    objc_msgSend(v7, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount mf_lock](self, "mf_lock");
    if (v6)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("AuthenticationScheme"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("AuthenticationScheme"));
    -[MFAccount mf_unlock](self, "mf_unlock");

    v5 = v7;
  }

}

+ (id)saslProfileName
{
  return 0;
}

- (Class)connectionClass
{
  void *v2;
  void *v3;

  -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionClassForAccountClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)requiresAuthentication
{
  return 0;
}

- (id)authenticatedConnection
{
  id v3;

  v3 = -[MFAccount _newConnection](self, "_newConnection");
  if (v3 && !-[MFAccount _connectAndAuthenticate:](self, "_connectAndAuthenticate:", v3))
  {

    v3 = 0;
  }
  return v3;
}

- (BOOL)connectionsAreConstrained
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[MFAccount currentConnections](self, "currentConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MFAccount_connectionsAreConstrained__block_invoke;
  v12[3] = &unk_1E4E88968;
  v12[4] = &v13;
  objc_msgSend(v3, "performWhileLocked:", v12);

  v4 = (void *)v14[5];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D1EF20], "external");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isConstrained");

    if ((v10 & 1) != 0)
      goto LABEL_3;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isConstrained"))
    goto LABEL_7;
LABEL_3:
  MFAccountsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount ef_publicDescription](self, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14[5];
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Connections constrained for account %{public}@ with connection %@", buf, 0x16u);

  }
  v8 = 1;
LABEL_8:
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__MFAccount_connectionsAreConstrained__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isValid", (_QWORD)v8))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)certUIService
{
  __assert_rtn("-[MFAccount certUIService]", "Account.m", 1334, "0 && \"Must be implemented by subclass\");
}

- (id)defaultConnectionSettings
{
  MFConnectionSettings *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MFConnectionSettings);
  -[MFConnectionSettings setUsesSSL:](v3, "setUsesSSL:", -[MFAccount usesSSL](self, "usesSSL"));
  -[MFAccount hostname](self, "hostname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConnectionSettings setHostname:](v3, "setHostname:", v4);

  -[MFConnectionSettings setPortNumber:](v3, "setPortNumber:", -[MFAccount portNumber](self, "portNumber"));
  -[MFAccount certUIService](self, "certUIService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConnectionSettings setCertUIService:](v3, "setCertUIService:", v5);

  if (-[MFConnectionSettings usesSSL](v3, "usesSSL"))
  {
    -[MFAccount clientCertificates](self, "clientCertificates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConnectionSettings setClientCertificates:](v3, "setClientCertificates:", v6);

  }
  if (-[MFConnectionSettings usesSSL](v3, "usesSSL"))
    v7 = -[MFAccount _shouldTryDirectSSLConnectionOnPort:](self, "_shouldTryDirectSSLConnectionOnPort:", -[MFConnectionSettings portNumber](v3, "portNumber"));
  else
    v7 = 0;
  -[MFConnectionSettings setTryDirectSSL:](v3, "setTryDirectSSL:", v7);
  if (-[MFConnectionSettings tryDirectSSL](v3, "tryDirectSSL"))
    -[MFAccount secureServiceName](self, "secureServiceName");
  else
    -[MFAccount serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConnectionSettings setServiceName:](v3, "setServiceName:", v8);

  -[MFConnectionSettings setConnectionServiceType:](v3, "setConnectionServiceType:", -[MFAccount connectionServiceType](self, "connectionServiceType"));
  -[MFConnectionSettings setAllowsTrustPrompt:](v3, "setAllowsTrustPrompt:", -[MFAccount allowsTrustPrompt](self, "allowsTrustPrompt"));
  -[MFAccount uniqueID](self, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConnectionSettings setAccountIdentifier:](v3, "setAccountIdentifier:", v9);

  -[MFAccount networkAccountIdentifier](self, "networkAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConnectionSettings setNetworkAccountIdentifier:](v3, "setNetworkAccountIdentifier:", v10);

  -[MFAccount sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    -[MFConnectionSettings setSourceApplicationBundleIdentifier:](v3, "setSourceApplicationBundleIdentifier:", v11);
  -[MFConnectionSettings setIsNonAppInitiated:](v3, "setIsNonAppInitiated:", 1);

  return v3;
}

- (void)applySettingsAsDefault:(id)a3
{
  id v4;

  v4 = a3;
  -[MFAccount setUsesSSL:](self, "setUsesSSL:", objc_msgSend(v4, "usesSSL"));
  -[MFAccount setPortNumber:](self, "setPortNumber:", objc_msgSend(v4, "portNumber"));
  -[MFAccount setTryDirectSSL:](self, "setTryDirectSSL:", objc_msgSend(v4, "tryDirectSSL"));

}

- (id)alternateConnectionSettings
{
  return 0;
}

- (id)insecureConnectionSettings
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsesSSL:", 0);
  objc_msgSend(v2, "setTryDirectSSL:", 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)secureConnectionSettings
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsesSSL:", 1);
  objc_msgSend(v3, "setTryDirectSSL:", 1);
  objc_msgSend(v3, "setPortNumber:", -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber"));
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  char v4;
  void *v5;
  void *v6;

  v4 = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber") == a3;
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLIsDirect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v4 = objc_msgSend(v5, "BOOLValue");

  return v4;
}

- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (-[MFAccount credentialAccessibility](self, "credentialAccessibility") == 1)
  {
    v9 = v8;
    if (objc_msgSend(v7, "code") == 1032)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("NO_PASSWORD_PROVIDED_FOR_USER_FORMAT"), CFSTR("No password provided for user “%@” on server “%@”.\n\nPlease go to Mail Account Settings and enter a password."), CFSTR("Message"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount username](self, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount hostname](self, "hostname");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount customDescriptionForError:authScheme:defaultDescription:](self, "customDescriptionForError:authScheme:defaultDescription:", v10, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLocalizedDescription:", v9);
  objc_msgSend(v7, "setError:", v10);

}

- (BOOL)_connectAndAuthenticate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "shouldCancel") & 1) != 0
    || !objc_msgSend(v4, "connectUsingFallbacksForAccount:", self))
  {
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "authenticateUsingAccount:", self) & 1) == 0)
  {
    objc_msgSend(v4, "disconnect");
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount reportAuthenticationError:authScheme:](self, "reportAuthenticationError:authScheme:", v8, v5);

LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (id)nameForMailboxUid:(id)a3
{
  objc_msgSend(a3, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldEnableAfterError:(id)a3
{
  return 0;
}

- (BOOL)enableAccount
{
  return 0;
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 1;
}

- (id)inaccessiblePasswordErrorWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("PASSWORD_INACCESSIBLE_FOR_ACCOUNT_FORMAT"), CFSTR("The password for “%@” cannot be used at this time."), CFSTR("Message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1056, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)loginDisabledErrorWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("LOGIN_DISABLED_FOR_ACCOUNT_FORMAT"), CFSTR("Logins are disabled for “%@”."), CFSTR("Message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1059, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)supportedDataclasses
{
  void *v3;
  void *v4;
  void *v5;

  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedDataclassesWithAccountTypeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)enabledDataclasses
{
  void *v2;
  void *v3;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyDiagnosticInformation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("  account : %@\n"), self);
}

- (void)setMissingPasswordError
{
  void *v2;
  id v3;

  -[MFAccount missingPasswordErrorWithTitle:](self, "missingPasswordErrorWithTitle:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

- (NSArray)emailAddressStrings
{
  return self->emailAddressStrings;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
