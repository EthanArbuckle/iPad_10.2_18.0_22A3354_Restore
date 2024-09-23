@implementation MFAccount

- (NSString)username
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Username"));
}

- (NSString)hostname
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Hostname"));
}

- (id)_objectForAccountInfoKey:(id)a3
{
  id v5;

  _MFLockGlobalLock();
  v5 = -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", a3);
  _MFUnlockGlobalLock();
  return v5;
}

- (id)accountPropertyForKey:(id)a3
{
  ACAccount *v5;
  ACAccount *v6;
  id result;

  v5 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (!v5)
    return (id)-[NSMutableDictionary objectForKey:](self->_unsavedAccountProperties, "objectForKey:", a3);
  v6 = v5;
  result = (id)objc_msgSend((id)objc_opt_class(), "_basicPropertyForKey:persistentAccount:", a3, v5);
  if (!result)
    return (id)-[ACAccount accountPropertyForKey:](v6, "accountPropertyForKey:", a3);
  return result;
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
  if (!a4)
    return 0;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C8EF30]))
    return (id)objc_msgSend(a4, "identifier");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Username")))
    return (id)objc_msgSend(a4, "username");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayName")))
    return (id)objc_msgSend(a4, "accountDescription");
  else
    return 0;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  ACAccount *v7;
  ACAccount *v8;
  NSMutableDictionary *unsavedAccountProperties;

  v7 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend((id)objc_opt_class(), "_setBasicProperty:forKey:persistentAccount:", a3, a4, v7) & 1) == 0)
      -[ACAccount setAccountProperty:forKey:](v8, "setAccountProperty:forKey:", a3, a4);
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    if (!unsavedAccountProperties)
    {
      unsavedAccountProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_unsavedAccountProperties = unsavedAccountProperties;
    }
    -[NSMutableDictionary setValue:forKey:](unsavedAccountProperties, "setValue:forKey:", a3, a4);
  }
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"))
    return -[MFAccount description](self, "description");
  else
    return (NSString *)-[MFAccount _privacySafeDescription](self, "_privacySafeDescription");
}

- (id)_privacySafeDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;

  v3 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", *MEMORY[0x1E0C8EF30]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[MFAccount isActive](self, "isActive");
  v7 = "not ";
  if (v6)
    v7 = "";
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> ID=%@ active=%sactive"), v5, self, v3, v7);
}

- (NSString)identifier
{
  return (NSString *)-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", *MEMORY[0x1E0C8EF30]);
}

- (MFAccount)initWithPersistentAccount:(id)a3
{
  id v3;
  MFAccount *v5;
  MFAccount *v6;
  objc_super v8;

  v3 = a3;
  if (!a3)
    v3 = (id)objc_msgSend((id)objc_opt_class(), "_newPersistentAccount");
  v8.receiver = self;
  v8.super_class = (Class)MFAccount;
  v5 = -[MFAccount init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_persistentAccountLock._os_unfair_lock_opaque = 0;
    -[MFAccount setPersistentAccount:](v5, "setPersistentAccount:", v3);
  }
  return v6;
}

+ (id)_newPersistentAccount
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "accountTypeIdentifier");
  v3 = +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v4 = (void *)objc_msgSend(v3, "newPersistentAccountWithAccountTypeIdentifier:", v2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(v3, "supportedDataclassesWithAccountTypeIdentifier:", v2, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = *MEMORY[0x1E0C8F3F8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "setProvisioned:forDataclass:", 1, v11);
        objc_msgSend(v4, "setEnabled:forDataclass:", objc_msgSend(v11, "isEqualToString:", v9) ^ 1, v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "setAuthenticated:", 1);
  return v4;
}

- (void)setPersistentAccount:(id)a3
{
  ACAccount *v5;

  if (a3 && self->_unsavedAccountProperties)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Account.m"), 255, CFSTR("Cannot set persistent account on account with unsaved account properties"));
  if (self->_persistentAccount != a3)
  {
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    os_unfair_lock_lock(&self->_persistentAccountLock);
    v5 = self->_persistentAccount;
    self->_persistentAccount = (ACAccount *)a3;
    os_unfair_lock_unlock(&self->_persistentAccountLock);
    -[MFAccount persistentAccountDidChange:previousAccount:](self, "persistentAccountDidChange:previousAccount:", a3, v5);

  }
}

- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4
{
  id v7;

  _MFLockGlobalLock();
  v7 = -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", a3);
  _MFUnlockGlobalLock();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      a4 = objc_msgSend(v7, "BOOLValue");

  }
  return a4;
}

+ (void)setShouldHealAccounts:(BOOL)a3
{
  _shouldHealAccount = a3;
}

+ (BOOL)shouldHealAccounts
{
  return _shouldHealAccount;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  unsigned int v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  _BOOL4 v11;

  v4 = objc_msgSend(a3, "code");
  v5 = (void *)objc_msgSend(a3, "domain");
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);
  v7 = (0x4601u >> (v4 - 51)) & 1;
  if ((unint64_t)(v4 - 51) > 0xE)
    v7 = 0;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MFMessageErrorDomain")))
    v8 = v4 == 1034;
  v9 = (void *)objc_msgSend(a3, "domain");
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C930A8]);
  v11 = (unint64_t)(v4 - 1) < 2;
  if (!v10)
    v11 = v8;
  if (v11)
    return objc_msgSend((id)objc_opt_class(), "shouldHealAccounts");
  else
    return 0;
}

+ (id)newAccountWithDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "accountWithProperties:", a3);
}

+ (id)excludedAccountPropertyKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Password"), CFSTR("OAuth2Token"), CFSTR("OAuth2RefreshToken"), 0);
}

+ (id)accountWithProperties:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperties:", a3);
}

+ (id)authSchemesForAccountClass
{
  _QWORD v4[5];

  if (authSchemesForAccountClass_onceToken != -1)
    dispatch_once(&authSchemesForAccountClass_onceToken, &__block_literal_global_0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MFAccount_authSchemesForAccountClass__block_invoke_2;
  v4[3] = &unk_1E81C9E38;
  v4[4] = a1;
  return (id)objc_msgSend((id)authSchemesForAccountClass_knownSchemes, "ef_filter:", v4);
}

id __39__MFAccount_authSchemesForAccountClass__block_invoke()
{
  id result;

  result = +[MFAuthScheme knownSchemes](MFAuthScheme, "knownSchemes");
  authSchemesForAccountClass_knownSchemes = (uint64_t)result;
  return result;
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
  MFAccount *v4;
  void *v5;

  v4 = -[MFAccount initWithPersistentAccount:](self, "initWithPersistentAccount:", 0);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "mutableCopy");
    if (!v5)
      v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_opt_class(), "_accountClass"), CFSTR("Class"));
    -[MFAccount _setAccountProperties:](v4, "_setAccountProperties:", v5);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAccount;
  -[MFAccount dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(a3, "uniqueId"), "isEqualToString:", -[MFAccount uniqueId](self, "uniqueId"));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](-[MFAccount uniqueId](self, "uniqueId"), "hash");
}

+ (id)accountWithPersistentAccount:(id)a3
{
  return (id)objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "existingAccountWithPersistentAccount:", a3);
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (void)savePersistentAccount
{
  objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "savePersistentAccountWithAccount:", self);
}

- (void)removePersistentAccount
{
  objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "removePersistentAccountWithAccount:", self);
}

- (ACAccount)parentAccount
{
  return (ACAccount *)-[ACAccount parentAccount](-[MFAccount persistentAccount](self, "persistentAccount"), "parentAccount");
}

- (NSString)parentAccountIdentifier
{
  return (NSString *)-[ACAccount parentAccountIdentifier](-[MFAccount persistentAccount](self, "persistentAccount"), "parentAccountIdentifier");
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

- (NSString)description
{
  return (NSString *)objc_msgSend(-[MFAccount _privacySafeDescription](self, "_privacySafeDescription"), "stringByAppendingFormat:", CFSTR(" displayName=%@"), objc_msgSend((id)objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName")), "ef_sha256Digest"), "ef_hexString"));
}

- (NSDictionary)properties
{
  ACAccount *v3;

  v3 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (v3)
    return (NSDictionary *)-[ACAccount accountProperties](v3, "accountProperties");
  else
    return &self->_unsavedAccountProperties->super;
}

+ (id)propertiesWhichRequireValidation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Hostname"), CFSTR("PortNumber"), CFSTR("Username"), CFSTR("Password"), CFSTR("SSLEnabled"), CFSTR("AuthenticationScheme"), 0);
}

- (void)removeAccountPropertyForKey:(id)a3
{
  ACAccount *v5;
  ACAccount *v6;

  v5 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend((id)objc_opt_class(), "_setBasicProperty:forKey:persistentAccount:", 0, a3, v5) & 1) == 0)
      -[ACAccount setAccountProperty:forKey:](v6, "setAccountProperty:forKey:", 0, a3);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_unsavedAccountProperties, "removeObjectForKey:", a3);
  }
}

+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5
{
  int v8;

  if (a5)
  {
    if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0C8EF30]))
    {
      objc_msgSend(a5, "setIdentifier:", a3);
LABEL_9:
      LOBYTE(v8) = 1;
      return v8;
    }
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("Username")))
    {
      objc_msgSend(a5, "setUsername:", a3);
      goto LABEL_9;
    }
    v8 = objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayName"));
    if (v8)
    {
      objc_msgSend(a5, "setAccountDescription:", a3);
      goto LABEL_9;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (id)accountTypeString
{
  return CFSTR("Account");
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E0CD6B28];
}

- (void)_queueAccountInfoDidChange
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_accountInfoDidChange, 0);
  -[MFAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_accountInfoDidChange, 0, 0.0);
}

- (void)_setAccountProperties:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _MFLockGlobalLock();
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  v6 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("Password"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", objc_msgSend(v5, "objectForKey:", CFSTR("Password")), 1);
  else
    v7 = v6;
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("Password"));
  _MFUnlockGlobalLock();
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("OAuth2Token"));
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("OAuth2RefreshToken"));
  if (v8)
    -[MFAccount setOAuth2Token:refreshToken:error:](self, "setOAuth2Token:refreshToken:error:", v8, v9, 0);
  -[MFAccount uniqueId](self, "uniqueId");
  v10 = (void *)objc_msgSend((id)objc_opt_class(), "excludedAccountPropertyKeys");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v5);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v15) & 1) == 0)
          -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(v5, "objectForKey:", v15), v15);
      }
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }
  if (v6)
  {
    -[MFAccount setPassword:](self, "setPassword:", v6);

  }
}

+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("EmailAddresses")))
    return (id)objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", a4);
  else
    return a4;
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  if (objc_msgSend(a4, "isEqual:", CFSTR("Password")))
    -[MFAccount setPassword:](self, "setPassword:", a3);
  else
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, a4);
  -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
}

- (void)removeValueInAccountPropertiesForKey:(id)a3
{
  _MFLockGlobalLock();
  -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", a3);
  _MFUnlockGlobalLock();
}

- (id)valueInAccountPropertiesForKey:(id)a3
{
  id v6;
  void *v7;

  if (objc_msgSend(a3, "isEqual:", CFSTR("SSLEnabled")))
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFAccount usesSSL](self, "usesSSL"));
  _MFLockGlobalLock();
  v6 = -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", a3);
  _MFUnlockGlobalLock();
  if (objc_msgSend(a3, "isEqual:", CFSTR("Password")))
    return -[MFAccount password](self, "password");
  if (!objc_msgSend(a3, "isEqual:", CFSTR("EmailAddresses")))
    return v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = (void *)objc_msgSend(v6, "allKeys");
  return (id)objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
}

- (BOOL)isActive
{
  ACAccount *v2;

  v2 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (v2)
    return -[ACAccount isActive](v2, "isActive");
  else
    return 1;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MFAccount persistentAccount](self, "persistentAccount"))
    -[ACAccount setActive:](-[MFAccount persistentAccount](self, "persistentAccount"), "setActive:", v3);
}

- (BOOL)canGoOffline
{
  return 0;
}

- (NSString)displayName
{
  NSString *v3;
  NSString *v5;
  NSString *v6;

  v3 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName"));
  if (!v3)
  {
    v5 = -[MFAccount username](self, "username");
    v6 = -[MFAccount hostname](self, "hostname");
    v3 = v6;
    if (v6)
    {
      if (-[NSString isEqualToString:](v6, "isEqualToString:", &stru_1E81CBE50))
      {
        return 0;
      }
      else if (!v5
             || -[NSString isEqualToString:](v5, "isEqualToString:", &stru_1E81CBE50)
             || (v3 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@@%@"), objc_msgSend((id)objc_opt_class(), "accountTypeString"), v5, v3)) != 0)
      {
        _MFLockGlobalLock();
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v3, CFSTR("DisplayName"));
        _MFUnlockGlobalLock();
      }
    }
  }
  return v3;
}

- (void)setDisplayName:(id)a3
{
  NSString *v5;
  const __CFString *v6;

  v5 = -[MFAccount displayName](self, "displayName");
  if (v5 != a3)
  {
    if (v5)
      v6 = (const __CFString *)v5;
    else
      v6 = &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("DisplayName"));
      _MFUnlockGlobalLock();
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }
}

- (void)setUsername:(id)a3
{
  const __CFString *v5;
  __CFString *v6;

  v5 = -[MFAccount username](self, "username");
  if (v5 != a3)
  {
    v6 = v5 ? (__CFString *)v5 : &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && objc_msgSend(a3, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("Username"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Username"));
      _MFUnlockGlobalLock();
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }
}

+ (id)hostname
{
  return 0;
}

- (void)setHostname:(id)a3
{
  const __CFString *v5;
  __CFString *v6;

  v5 = -[MFAccount hostname](self, "hostname");
  if (objc_msgSend(a3, "length"))
    a3 = (id)objc_msgSend(a3, "mf_stringWithNoExtraSpaces");
  if (v5 != a3)
  {
    v6 = v5 ? (__CFString *)v5 : &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && objc_msgSend(a3, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("Hostname"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Hostname"));
      _MFUnlockGlobalLock();
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }
}

- (BOOL)isManaged
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("mcProfileUUID")), "length") != 0;
}

- (BOOL)supportsMailDrop
{
  return !-[MFAccount isManaged](self, "isManaged")
      || -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("MFAccountSupportsMailDrop"), 0);
}

- (id)_credential
{
  return -[MFAccount _credentialCreateIfNecessary:](self, "_credentialCreateIfNecessary:", 0);
}

- (id)_credentialCreateIfNecessary:(BOOL)a3
{
  return -[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", a3, 0);
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  const char *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  MFAccount *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v7 = (id)-[ACAccount credentialWithError:](-[MFAccount persistentAccount](self, "persistentAccount"), "credentialWithError:", &v14);
  if (v14 && (v8 = MFLogGeneral(), os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)))
  {
    if (v5)
      v12 = "";
    else
      v12 = "NOT ";
    v13 = objc_msgSend(v14, "ef_publicDescription");
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2080;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    _os_log_error_impl(&dword_1C8839000, v8, OS_LOG_TYPE_ERROR, "Encountered error while fetching credential for %@ (will %screate new credential): %{public}@", buf, 0x20u);
    if (v7)
      goto LABEL_8;
  }
  else if (v7)
  {
    goto LABEL_8;
  }
  if (v5)
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      v16 = (MFAccount *)v10;
      _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_INFO, "Creating new credential for account %{public}@", buf, 0xCu);
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
    _MFLockGlobalLock();
    -[ACAccount setCredential:](-[MFAccount persistentAccount](self, "persistentAccount"), "setCredential:", v7);
    _MFUnlockGlobalLock();

  }
LABEL_8:
  if (a4 && !v7)
    *a4 = v14;
  return v7;
}

- (void)setPassword:(id)a3
{
  const __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = -[MFAccount _password](self, "_password");
  if (v5 != a3)
  {
    v6 = v5 ? (__CFString *)v5 : &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      v7 = -[MFAccount _credentialCreateIfNecessary:](self, "_credentialCreateIfNecessary:", 1);
      v8 = v7;
      if (a3)
      {
        v9 = objc_msgSend(a3, "length");
        if (v9)
          v10 = a3;
        else
          v10 = 0;
        objc_msgSend(v8, "setPassword:", v10);
        if (v9)
        {
          -[ACAccount setAuthenticated:](-[MFAccount persistentAccount](self, "persistentAccount"), "setAuthenticated:", 1);
LABEL_15:
          -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
          return;
        }
      }
      else
      {
        objc_msgSend(v7, "setPassword:", 0);
      }
      _MFLockGlobalLock();
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Password"));
      _MFUnlockGlobalLock();
      goto LABEL_15;
    }
  }
}

- (id)_password
{
  return -[MFAccount _passwordWithError:](self, "_passwordWithError:", 0);
}

- (id)_passwordWithError:(id *)a3
{
  return (id)objc_msgSend(-[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 0, a3), "password");
}

- (id)password
{
  id v3;

  v3 = -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  if (v3 && objc_msgSend(v3, "requiresPassword"))
    return -[MFAccount _password](self, "_password");
  else
    return &stru_1E81CBE50;
}

- (unint64_t)credentialAccessibility
{
  uint64_t v2;
  unint64_t result;
  id v4;

  v4 = 0;
  v2 = objc_msgSend(-[MFAccount _passwordWithError:](self, "_passwordWithError:", &v4), "length");
  result = 0;
  if (!v2)
  {
    if (objc_msgSend(v4, "mf_isInaccessibleAccountCredentialError"))
      return 2;
    else
      return 1;
  }
  return result;
}

- (id)credentialItemForKey:(id)a3
{
  return -[MFAccount credentialItemForKey:error:](self, "credentialItemForKey:error:", a3, 0);
}

- (id)credentialItemForKey:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 0, a4), "credentialItemForKey:", a3);
}

- (void)setCredentialItem:(id)a3 forKey:(id)a4
{
  -[MFAccount setCredentialItem:forKey:error:](self, "setCredentialItem:forKey:error:", a3, a4, 0);
}

- (BOOL)setCredentialItem:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;

  v7 = -[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 1, a5);
  objc_msgSend(v7, "setCredentialItem:forKey:", a3, a4);
  return v7 != 0;
}

- (id)oauth2Token
{
  return (id)objc_msgSend(-[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 0, 0), "oauthToken");
}

- (BOOL)setOAuth2Token:(id)a3 refreshToken:(id)a4 error:(id *)a5
{
  id v7;

  v7 = -[MFAccount _credentialCreateIfNecessary:error:](self, "_credentialCreateIfNecessary:error:", 1, a5);
  objc_msgSend(v7, "setOauthToken:", a3);
  objc_msgSend(v7, "setOauthRefreshToken:", a4);
  return v7 != 0;
}

- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  ACAccount *v6;
  void *v7;
  _QWORD v9[5];

  v6 = -[MFAccount accountForRenewingCredentials](self, "accountForRenewingCredentials");
  if (v6)
  {
    v7 = (void *)objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "persistentStore");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke;
    v9[3] = &unk_1E81C9E60;
    v9[4] = a4;
    objc_msgSend(v7, "renewCredentialsForAccount:options:completion:", v6, a3, v9);
  }
  return v6 != 0;
}

uint64_t __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, MFError *a3)
{
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t result;
  uint64_t v10;
  MFError *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR(", error:");
    v8 = &stru_1E81CBE50;
    *(_DWORD *)buf = 134218498;
    v13 = a2;
    if (!a3)
      v7 = &stru_1E81CBE50;
    v14 = 2112;
    if (a3)
      v8 = (const __CFString *)a3;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "Credential renewal result: %ld%@%@", buf, 0x20u);
  }
  if (a2)
  {
    if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = *MEMORY[0x1E0CB3388];
      v11 = a3;
      a2 = 1;
      a3 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, 0, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    }
    else
    {
      a2 = 1;
    }
  }
  else
  {
    a3 = 0;
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, MFError *))(result + 16))(result, a2, a3);
  return result;
}

- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3)
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  else
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = v6;
  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F330]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C8F320]);
  return -[MFAccount _renewCredentialsWithOptions:completion:](self, "_renewCredentialsWithOptions:completion:", v7, a4);
}

- (BOOL)promptUserForPasswordWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F330]);
  if (a4)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0C8F310]);
  return -[MFAccount _renewCredentialsWithOptions:completion:](self, "_renewCredentialsWithOptions:completion:", v8, a5);
}

- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  ACAccount *v9;
  void *v10;
  ACAccount *persistentAccount;
  _QWORD v13[5];

  v6 = a4;
  v9 = -[MFAccount accountForRenewingCredentials](self, "accountForRenewingCredentials");
  if (v9)
  {
    v10 = (void *)objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "persistentStore");
    persistentAccount = self->_persistentAccount;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke;
    v13[3] = &unk_1E81C9E88;
    v13[4] = a5;
    objc_msgSend(v10, "openAuthenticationURL:forAccount:shouldConfirm:completion:", a3, persistentAccount, v6, v13);
  }
  return v9 != 0;
}

uint64_t __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke(uint64_t a1, int a2, const __CFString *a3)
{
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("failure");
    if (a2)
      v7 = CFSTR("success");
    *(_DWORD *)buf = 138412802;
    v14 = v7;
    if (a3)
      v8 = CFSTR(", error:");
    else
      v8 = &stru_1E81CBE50;
    v15 = 2112;
    v16 = v8;
    if (a3)
      v9 = a3;
    else
      v9 = &stru_1E81CBE50;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "Web login result: %@%@%@", buf, 0x20u);
  }
  if ((a2 & 1) == 0 && a3)
  {
    v11 = *MEMORY[0x1E0CB3388];
    v12 = a3;
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, 0, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)managedTag
{
  return (NSString *)-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("ManagedTag"));
}

- (BOOL)fetchTokensIfNecessary:(id *)a3
{
  return 1;
}

- (unsigned)portNumber
{
  unsigned int result;

  result = objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("PortNumber")), "intValue");
  if (!result)
  {
    if (!-[MFAccount usesSSL](self, "usesSSL"))
      return -[MFAccount defaultPortNumber](self, "defaultPortNumber");
    result = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
    if (!result)
      return -[MFAccount defaultPortNumber](self, "defaultPortNumber");
  }
  return result;
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

  if (-[MFAccount portNumber](self, "portNumber") != a3)
  {
    if (a3)
    {
      if (-[MFAccount usesSSL](self, "usesSSL"))
        v5 = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
      else
        v5 = -[MFAccount defaultPortNumber](self, "defaultPortNumber");
      v6 = v5;
      _MFLockGlobalLock();
      if (v6 != a3)
      {
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", EFStringWithInt(), CFSTR("PortNumber"));
        goto LABEL_10;
      }
    }
    else
    {
      _MFLockGlobalLock();
    }
    -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("PortNumber"));
LABEL_10:
    _MFUnlockGlobalLock();
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

+ (BOOL)isCommonPortNumber:(unsigned int)a3
{
  return objc_msgSend(a1, "defaultPortNumber") == a3
      || objc_msgSend(a1, "defaultSecurePortNumber") == a3;
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

+ (BOOL)usesSSL
{
  return 0;
}

- (void)setUsesSSL:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[MFAccount usesSSL](self, "usesSSL") != a3)
  {
    _MFLockGlobalLock();
    if (v3)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("SSLEnabled"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SSLEnabled"));
    _MFUnlockGlobalLock();
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

+ (BOOL)isSSLEditable
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "predefinedValueForKey:", CFSTR("SSLEnabledIsEditable"));
  if (v2)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 1;
}

- (BOOL)allowsTrustPrompt
{
  return 1;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MFAccount _shouldTryDirectSSLConnectionOnPort:](self, "_shouldTryDirectSSLConnectionOnPort:", -[MFAccount portNumber](self, "portNumber")) != a3)
  {
    _MFLockGlobalLock();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("SSLIsDirect"));
    _MFUnlockGlobalLock();
    -[MFAccount releaseAllConnections](self, "releaseAllConnections");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

- (id)domain
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("Domain"));
}

- (void)setDomain:(id)a3
{
  const __CFString *v5;
  __CFString *v6;

  v5 = -[MFAccount domain](self, "domain");
  if (v5 != a3)
  {
    v6 = v5 ? (__CFString *)v5 : &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && objc_msgSend(a3, "length"))
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("Domain"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("Domain"));
      _MFUnlockGlobalLock();
      -[MFAccount releaseAllConnections](self, "releaseAllConnections");
      -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
    }
  }
}

- (id)clientCertificates
{
  id v3;
  __SecIdentity *v4;
  __SecIdentity *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLClientIdentity"));
  if (v3)
    v4 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", v3, 0);
  else
    v4 = +[MFMessageKeychainManager copyClientSSLIdentityForHostName:error:](MFMessageKeychainManager, "copyClientSSLIdentityForHostName:error:", -[MFAccount hostname](self, "hostname"), 0);
  v5 = v4;
  if (!v4)
    return 0;
  v8[0] = v4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  CFRelease(v5);
  return v6;
}

- (void)setClientCertificates:(id)a3
{
  const void *v5;
  CFTypeID v6;
  id v7;

  if (objc_msgSend(a3, "count"))
  {
    v5 = (const void *)objc_msgSend(a3, "objectAtIndex:", 0);
    v6 = CFGetTypeID(v5);
    if (v6 == SecIdentityGetTypeID())
    {
      v7 = +[MFMessageKeychainManager persistentReferenceForIdentity:error:](MFMessageKeychainManager, "persistentReferenceForIdentity:error:", v5, 0);
      _MFLockGlobalLock();
      if (v7)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, CFSTR("SSLClientIdentity"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SSLClientIdentity"));
      _MFUnlockGlobalLock();
    }
  }
}

- (void)accountInfoDidChange
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AccountInfoDidChange"), self, -[MFAccount properties](self, "properties"));
}

- (id)preferredAuthScheme
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("AuthenticationScheme"));
  if (objc_msgSend(CFSTR("PLAIN"), "isEqualToString:", v3))
    v4 = &stru_1E81CBE50;
  else
    v4 = v3;
  if (!v4)
  {
    if (-[MFAccount requiresAuthentication](self, "requiresAuthentication"))
      v4 = &stru_1E81CBE50;
    else
      v4 = 0;
  }
  return +[MFAuthScheme schemeWithName:](MFAuthScheme, "schemeWithName:", v4);
}

- (void)setPreferredAuthScheme:(id)a3
{
  uint64_t v5;

  if (-[MFAccount preferredAuthScheme](self, "preferredAuthScheme") != a3)
  {
    v5 = objc_msgSend(a3, "name");
    _MFLockGlobalLock();
    if (v5)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("AuthenticationScheme"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("AuthenticationScheme"));
    _MFUnlockGlobalLock();
  }
}

+ (id)saslProfileName
{
  return 0;
}

- (id)_newConnection
{
  return objc_alloc_init(-[MFAccount connectionClass](self, "connectionClass"));
}

- (Class)connectionClass
{
  return (Class)objc_msgSend(-[MFAccount preferredAuthScheme](self, "preferredAuthScheme"), "connectionClassForAccountClass:", objc_opt_class());
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

- (id)certUIService
{
  __assert_rtn("-[MFAccount certUIService]", "Account.m", 1204, "0 && \"Must be implemented by subclass\");
}

- (id)defaultConnectionSettings
{
  MFConnectionSettings *v3;
  _BOOL8 v4;
  id v5;
  NSString *v6;

  v3 = objc_alloc_init(MFConnectionSettings);
  -[MFConnectionSettings setUsesSSL:](v3, "setUsesSSL:", -[MFAccount usesSSL](self, "usesSSL"));
  -[MFConnectionSettings setHostname:](v3, "setHostname:", -[MFAccount hostname](self, "hostname"));
  -[MFConnectionSettings setPortNumber:](v3, "setPortNumber:", -[MFAccount portNumber](self, "portNumber"));
  -[MFConnectionSettings setCertUIService:](v3, "setCertUIService:", -[MFAccount certUIService](self, "certUIService"));
  if (-[MFConnectionSettings usesSSL](v3, "usesSSL"))
    -[MFConnectionSettings setClientCertificates:](v3, "setClientCertificates:", -[MFAccount clientCertificates](self, "clientCertificates"));
  if (-[MFConnectionSettings usesSSL](v3, "usesSSL"))
    v4 = -[MFAccount _shouldTryDirectSSLConnectionOnPort:](self, "_shouldTryDirectSSLConnectionOnPort:", -[MFConnectionSettings portNumber](v3, "portNumber"));
  else
    v4 = 0;
  -[MFConnectionSettings setTryDirectSSL:](v3, "setTryDirectSSL:", v4);
  if (-[MFConnectionSettings tryDirectSSL](v3, "tryDirectSSL"))
    v5 = -[MFAccount secureServiceName](self, "secureServiceName");
  else
    v5 = -[MFAccount serviceName](self, "serviceName");
  -[MFConnectionSettings setServiceName:](v3, "setServiceName:", v5);
  -[MFConnectionSettings setConnectionServiceType:](v3, "setConnectionServiceType:", -[MFAccount connectionServiceType](self, "connectionServiceType"));
  -[MFConnectionSettings setAllowsTrustPrompt:](v3, "setAllowsTrustPrompt:", -[MFAccount allowsTrustPrompt](self, "allowsTrustPrompt"));
  -[MFConnectionSettings setAccountIdentifier:](v3, "setAccountIdentifier:", -[MFAccount uniqueId](self, "uniqueId"));
  -[MFConnectionSettings setNetworkAccountIdentifier:](v3, "setNetworkAccountIdentifier:", -[MFAccount networkAccountIdentifier](self, "networkAccountIdentifier"));
  v6 = -[MFAccount sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  if (-[NSString length](v6, "length"))
    -[MFConnectionSettings setSourceApplicationBundleIdentifier:](v3, "setSourceApplicationBundleIdentifier:", v6);
  return v3;
}

- (void)applySettingsAsDefault:(id)a3
{
  -[MFAccount setUsesSSL:](self, "setUsesSSL:", objc_msgSend(a3, "usesSSL"));
  -[MFAccount setPortNumber:](self, "setPortNumber:", objc_msgSend(a3, "portNumber"));
  -[MFAccount setTryDirectSSL:](self, "setTryDirectSSL:", objc_msgSend(a3, "tryDirectSSL"));
}

- (id)alternateConnectionSettings
{
  return 0;
}

- (id)insecureConnectionSettings
{
  id v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  objc_msgSend(v2, "setUsesSSL:", 0);
  objc_msgSend(v2, "setTryDirectSSL:", 0);
  v4[0] = v2;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

- (id)secureConnectionSettings
{
  id v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  objc_msgSend(v3, "setUsesSSL:", 1);
  objc_msgSend(v3, "setTryDirectSSL:", 1);
  objc_msgSend(v3, "setPortNumber:", -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber"));
  v5[0] = v3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  unsigned int v5;
  id v6;
  uint64_t v7;

  v5 = -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
  v6 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLIsDirect"));
  if (v6)
    LOBYTE(v7) = objc_msgSend(v6, "BOOLValue");
  else
    return v5 == a3;
  return v7;
}

- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5
{
  if (-[MFAccount credentialAccessibility](self, "credentialAccessibility", a3, a4) == 1
    && objc_msgSend(a3, "code") == 1032)
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("NO_PASSWORD_PROVIDED_FOR_USER_FORMAT"), (uint64_t)CFSTR("No password provided for user “%@” on server “%@”.\n\nPlease go to Mail Account Settings and enter a password."), 0), -[MFAccount username](self, "username"), -[MFAccount hostname](self, "hostname"));
  }
  else
  {
    return a5;
  }
}

- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4
{
  id v7;

  v7 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_msgSend(a3, "setLocalizedDescription:", -[MFAccount customDescriptionForError:authScheme:defaultDescription:](self, "customDescriptionForError:authScheme:defaultDescription:", a3, a4, objc_msgSend(a3, "localizedDescription")));
  objc_msgSend(v7, "setError:", a3);
}

- (BOOL)_connectAndAuthenticate:(id)a3
{
  id v5;
  id v6;
  int v7;

  v5 = -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
  v6 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  if ((objc_msgSend(v6, "shouldCancel") & 1) != 0)
    goto LABEL_6;
  v7 = objc_msgSend(a3, "connectUsingFallbacksForAccount:", self);
  if (v7)
  {
    if ((objc_msgSend(a3, "authenticateUsingAccount:", self) & 1) != 0)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    objc_msgSend(a3, "disconnect");
    -[MFAccount reportAuthenticationError:authScheme:](self, "reportAuthenticationError:authScheme:", objc_msgSend(v6, "error"), v5);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (NSString)uniqueId
{
  uint64_t v3;
  __CFString *v4;
  const __CFAllocator *v5;
  const __CFUUID *v6;
  const __CFUUID *v7;
  __CFString *v8;

  v3 = *MEMORY[0x1E0C8EF30];
  v4 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", *MEMORY[0x1E0C8EF30]);
  if (!v4)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v6)
    {
      v7 = v6;
      v8 = (__CFString *)CFUUIDCreateString(v5, v6);
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    v4 = v8;
    _MFLockGlobalLock();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, v3);
    _MFUnlockGlobalLock();
  }
  return &v4->isa;
}

- (id)nameForMailboxUid:(id)a3
{
  return (id)objc_msgSend(a3, "name");
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

- (id)missingPasswordErrorWithTitle:(id)a3
{
  return +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1055, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("NO_PASSWORD_PROVIDED_FOR_ACCOUNT_FORMAT"), (uint64_t)CFSTR("No password provided for “%@”.\n\nPlease go to Mail Account Settings and enter a password."), 0), -[MFAccount displayName](self, "displayName")), a3, 0);
}

- (id)inaccessiblePasswordErrorWithTitle:(id)a3
{
  return +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1056, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("PASSWORD_INACCESSIBLE_FOR_ACCOUNT_FORMAT"), (uint64_t)CFSTR("The password for “%@” cannot be used at this time."), 0), -[MFAccount displayName](self, "displayName")), a3, 0);
}

- (id)loginDisabledErrorWithTitle:(id)a3
{
  return +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1059, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("LOGIN_DISABLED_FOR_ACCOUNT_FORMAT"), (uint64_t)CFSTR("Logins are disabled for “%@”."), 0), -[MFAccount displayName](self, "displayName")), a3, 0);
}

+ (id)supportedDataclasses
{
  return (id)objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "supportedDataclassesWithAccountTypeIdentifier:", objc_msgSend(a1, "accountTypeIdentifier"));
}

- (id)enabledDataclasses
{
  return (id)objc_msgSend((id)-[ACAccount enabledDataclasses](-[MFAccount persistentAccount](self, "persistentAccount"), "enabledDataclasses"), "allObjects");
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  return -[ACAccount isEnabledForDataclass:](-[MFAccount persistentAccount](self, "persistentAccount"), "isEnabledForDataclass:", a3);
}

- (BOOL)isSyncingNotes
{
  return -[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3F8]);
}

- (id)copyDiagnosticInformation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("  account : %@\n"), self);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
