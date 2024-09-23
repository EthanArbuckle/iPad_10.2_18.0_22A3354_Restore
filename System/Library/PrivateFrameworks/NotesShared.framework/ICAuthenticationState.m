@implementation ICAuthenticationState

+ (ICAuthenticationState)sharedState
{
  if (sharedState_onceToken != -1)
    dispatch_once(&sharedState_onceToken, &__block_literal_global_23);
  return (ICAuthenticationState *)(id)_sharedState;
}

- (BOOL)isAuthenticated
{
  ICAuthenticationState *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ICAuthenticationState hasAuthenticatedObject](v2, "hasAuthenticatedObject"))
    v3 = 1;
  else
    v3 = -[ICAuthenticationState isAuthenticatedWithDevicePassword](v2, "isAuthenticatedWithDevicePassword");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isAuthenticatedWithDevicePassword
{
  ICAuthenticationState *v2;
  BOOL authenticatedWithDevicePassword;

  v2 = self;
  objc_sync_enter(v2);
  authenticatedWithDevicePassword = v2->_authenticatedWithDevicePassword;
  objc_sync_exit(v2);

  return authenticatedWithDevicePassword;
}

- (BOOL)hasAuthenticatedObject
{
  ICAuthenticationState *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ICAuthenticationState objectIDsToMainKey](v2, "objectIDsToMainKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableDictionary)objectIDsToMainKey
{
  return self->_objectIDsToMainKey;
}

void __60__ICAuthenticationState_defaultDeauthenticationTimeInterval__block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("TimeIntervalBeforeClearingCachedKeys");
  v3[0] = &unk_1E771A510;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

void __36__ICAuthenticationState_sharedState__block_invoke()
{
  ICAuthenticationState *v0;
  void *v1;

  if (_sharedState)
    v0 = (ICAuthenticationState *)(id)_sharedState;
  else
    v0 = objc_alloc_init(ICAuthenticationState);
  v1 = (void *)_sharedState;
  _sharedState = (uint64_t)v0;

}

- (ICAuthenticationState)init
{
  ICAuthenticationState *v2;
  uint64_t v3;
  NSMutableDictionary *objectIDsToMainKey;
  double v5;
  uint64_t v6;
  NSArray *deauthenticationTimerRunLoopModes;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *passphraseChangeObserver;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)ICAuthenticationState;
  v2 = -[ICAuthenticationState init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    objectIDsToMainKey = v2->_objectIDsToMainKey;
    v2->_objectIDsToMainKey = (NSMutableDictionary *)v3;

    objc_msgSend((id)objc_opt_class(), "defaultDeauthenticationTimeInterval");
    v2->_deauthenticationTimeInterval = v5;
    v21[0] = *MEMORY[0x1E0C99748];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    deauthenticationTimerRunLoopModes = v2->_deauthenticationTimerRunLoopModes;
    v2->_deauthenticationTimerRunLoopModes = (NSArray *)v6;

    objc_initWeak(&location, v2);
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "crossProcessChangeCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __29__ICAuthenticationState_init__block_invoke;
    v17 = &unk_1E76C7940;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "registerForCrossProcessNotificationName:block:", CFSTR("ICAccountWillChangePassphraseNotification"), &v14);
    v10 = objc_claimAutoreleasedReturnValue();
    passphraseChangeObserver = v2->_passphraseChangeObserver;
    v2->_passphraseChangeObserver = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_localAuthenticationDidChangeBiometricsPolicyState_, CFSTR("ICLocalAuthenticationDidChangeBiometricsPolicyStateNotification"), objc_opt_class());

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (double)defaultDeauthenticationTimeInterval
{
  void *v2;
  double v3;
  double v4;

  if (defaultDeauthenticationTimeInterval_onceToken != -1)
    dispatch_once(&defaultDeauthenticationTimeInterval_onceToken, &__block_literal_global_49);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("TimeIntervalBeforeClearingCachedKeys"));
  v4 = v3;

  return v4;
}

- (void)extendDeauthenticationTimer
{
  ICAuthenticationState *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id location;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[ICAuthenticationState deauthenticationTimer](v2, "deauthenticationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  if (-[ICAuthenticationState isAuthenticated](v2, "isAuthenticated"))
  {
    -[ICAuthenticationState deauthenticationTimeInterval](v2, "deauthenticationTimeInterval");
    if (v4 != 0.0)
    {
      objc_initWeak(&location, v2);
      v5 = (void *)MEMORY[0x1E0C99E88];
      -[ICAuthenticationState deauthenticationTimeInterval](v2, "deauthenticationTimeInterval");
      v7 = v6;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke;
      v20[3] = &unk_1E76C9D70;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 0, v20, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationState setDeauthenticationTimer:](v2, "setDeauthenticationTimer:", v8);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[ICAuthenticationState deauthenticationTimerRunLoopModes](v2, "deauthenticationTimerRunLoopModes", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAuthenticationState deauthenticationTimer](v2, "deauthenticationTimer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addTimer:forMode:", v15, v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
        }
        while (v10);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v2);

}

- (NSTimer)deauthenticationTimer
{
  return self->_deauthenticationTimer;
}

- (BOOL)authenticateObjectWithKeychain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  ICAuthenticationState *obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  obj = self;
  objc_sync_enter(obj);
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainKeyFromKeychainForObject:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "setCachedMainKey:forObject:", v5, v23),
        v6,
        (v7 & 1) != 0))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v23, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState", obj);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mainKeyFromKeychainForObject:cipherVersion:", v13, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setCachedMainKey:forObject:", v15, v13);

          }
          +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mainKeyFromKeychainForObject:cipherVersion:", v13, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setCachedMainKey:forObject:", v18, v13);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v20 = 1;
  }
  else
  {
    v20 = 0;
  }

  objc_sync_exit(obj);
  return v20;
}

- (BOOL)checkSupportsBiometrics
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if (+[ICLocalAuthentication biometricsAvailable](ICLocalAuthentication, "biometricsAvailable"))
  {
    if (+[ICLocalAuthentication biometricsEnrolled](ICLocalAuthentication, "biometricsEnrolled"))
      return 1;
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 0;
      v5 = "Biometrics are not enrolled — deleting all Keychain items";
      v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 0;
      v5 = "Biometrics are not available — deleting all Keychain items";
      v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }

  -[ICAuthenticationState removeAllMainKeysFromKeychain](self, "removeAllMainKeysFromKeychain");
  return 0;
}

- (id)touchIDEnabledKeyForAccountIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("ICPasswordTouchIDEnabledKey"), a3);
}

- (id)faceIDEnabledKeyForAccountIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("ICPasswordFaceIDEnabledKey"), a3);
}

- (BOOL)biometricsEnabledForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[ICAuthenticationState touchIDEnabledKeyForAccountIdentifier:](self, "touchIDEnabledKeyForAccountIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICKeychain BOOLeanForIdentifier:account:](ICKeychain, "BOOLeanForIdentifier:account:", v6, 0);

    if (v7)
    {
      v8 = 1;
    }
    else
    {
      -[ICAuthenticationState faceIDEnabledKeyForAccountIdentifier:](self, "faceIDEnabledKeyForAccountIdentifier:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[ICKeychain BOOLeanForIdentifier:account:](ICKeychain, "BOOLeanForIdentifier:account:", v10, 0);

    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) biometricsEnabledForAccount:].cold.1(v4);

    v8 = 0;
  }

  return v8;
}

- (void)setBiometricsEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[ICAuthenticationState touchIDEnabledKeyForAccountIdentifier:](self, "touchIDEnabledKeyForAccountIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICKeychain setBoolean:forIdentifier:account:shouldSync:error:](ICKeychain, "setBoolean:forIdentifier:account:shouldSync:error:", v4, v8, 0, 0, 0);

    -[ICAuthenticationState faceIDEnabledKeyForAccountIdentifier:](self, "faceIDEnabledKeyForAccountIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICKeychain setBoolean:forIdentifier:account:shouldSync:error:](ICKeychain, "setBoolean:forIdentifier:account:shouldSync:error:", v4, v9, 0, 0, 0);

  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) setBiometricsEnabled:forAccount:].cold.1(v6);

  }
}

- (BOOL)addMainKeyToKeychainForObject:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;

  v4 = a3;
  -[ICAuthenticationState cachedMainKeyForObject:](self, "cachedMainKeyForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ICAuthenticationState setMainKeyInKeychain:forObject:](self, "setMainKeyInKeychain:forObject:", v5, v4);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICAuthenticationState(Keychain) addMainKeyToKeychainForObject:].cold.1(v4);

    v6 = 0;
  }

  return v6;
}

- (BOOL)removeMainKeyFromKeychainForObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v6;
    v11 = 2080;
    v12 = "-[ICAuthenticationState(Keychain) removeMainKeyFromKeychainForObject:]";
    v13 = 1024;
    v14 = 146;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Removing main key from Keychain… {object: %@}%s:%d", (uint8_t *)&v9, 0x1Cu);

  }
  v7 = -[ICAuthenticationState setMainKeyInKeychain:forObject:](self, "setMainKeyInKeychain:forObject:", 0, v4);

  return v7;
}

- (BOOL)removeMainKeysFromKeychainForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[ICAuthenticationState setMainKeyInKeychain:forObject:](self, "setMainKeyInKeychain:forObject:", 0, v4);
    objc_msgSend(v4, "accountData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationState setMainKeyInKeychain:forObject:](self, "setMainKeyInKeychain:forObject:", 0, v6);

    v13 = 0;
    +[ICKeychain deleteItemsOfType:account:error:](ICKeychain, "deleteItemsOfType:account:error:", 1, v5, &v13);
    v7 = v13;
    v8 = v7;
    if (v7 && -[NSObject code](v7, "code") != -25300)
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:].cold.2(v4);
      v11 = 0;
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "shortLoggingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v15 = v10;
        v16 = 2080;
        v17 = "-[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:]";
        v18 = 1024;
        v19 = 170;
        _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Removed main keys from Keychain {account: %@}%s:%d", buf, 0x1Cu);

      }
      v11 = 1;
    }

  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:].cold.1(v4);
    v11 = 0;
    v8 = v9;
  }

  return v11;
}

- (BOOL)removeAllMainKeysFromKeychain
{
  id v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  +[ICKeychain deleteItemsOfType:account:error:](ICKeychain, "deleteItemsOfType:account:error:", 1, 0, &v7);
  v2 = v7;
  v3 = v2;
  if (v2 && objc_msgSend(v2, "code") != -25300)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) removeAllMainKeysFromKeychain].cold.1(v4);
    v5 = 0;
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[ICAuthenticationState(Keychain) removeAllMainKeysFromKeychain]";
      v10 = 1024;
      v11 = 184;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEFAULT, "Removed main keys from Keychain%s:%d", buf, 0x12u);
    }
    v5 = 1;
  }

  return v5;
}

- (BOOL)setMainKeyInKeychain:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](self, "mainKeyIdentifierForKeyObject:cipherVersion:", v7, objc_msgSend(v8, "cipherVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") && objc_msgSend(v11, "length"))
  {
    if (!-[ICAuthenticationState checkSupportsBiometrics](self, "checkSupportsBiometrics"))
      goto LABEL_18;
    objc_msgSend(v7, "cloudAccount");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12
      || (v13 = (void *)v12,
          objc_msgSend(v7, "cloudAccount"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = -[ICAuthenticationState biometricsEnabledForAccount:](self, "biometricsEnabledForAccount:", v14),
          v14,
          v13,
          !v15))
    {
LABEL_18:
      v23 = 0;
      goto LABEL_19;
    }
    +[ICKeychain deleteItemsForIdentifier:account:error:](ICKeychain, "deleteItemsForIdentifier:account:error:", v9, v11, 0);
    if (!v6)
    {
      v21 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:].cold.2(v7);
      v23 = 1;
      goto LABEL_16;
    }
    objc_msgSend(v7, "cryptoStrategy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mainKeyDecryptsPrimaryData:", v6);

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v6, "serializedData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ICGroupContainerIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      +[ICKeychain setData:forIdentifier:account:type:shouldSync:accessFlags:accessGroup:error:](ICKeychain, "setData:forIdentifier:account:type:shouldSync:accessFlags:accessGroup:error:", v18, v9, v11, 1, 0, 0, v19, &v25);
      v20 = v25;

      if (v20 && -[NSObject code](v20, "code") != -25299)
      {
        v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:].cold.3(v7, (uint64_t)v20, v21);
        v23 = 0;
      }
      else
      {
        v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "shortLoggingDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v27 = v22;
          v28 = 2080;
          v29 = "-[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:]";
          v30 = 1024;
          v31 = 237;
          _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_DEFAULT, "Added main key to Keychain {object: %@}%s:%d", buf, 0x1Cu);

        }
        v23 = 1;
      }

      goto LABEL_17;
    }
    v21 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:].cold.4(v7);
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:].cold.1(v7);
  }
  v23 = 0;
LABEL_16:
  v20 = v21;
LABEL_17:

LABEL_19:
  return v23;
}

- (id)mainKeyFromKeychainForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while (1)
    {
      -[ICAuthenticationState mainKeyFromKeychainForKeyObject:decryptingObject:cipherVersion:](self, "mainKeyFromKeychainForKeyObject:decryptingObject:cipherVersion:", v6, v5, +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v5));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
        break;
      objc_msgSend(v6, "parentEncryptableObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v8;
      if (!v8)
        goto LABEL_8;
    }
    v8 = (void *)v7;

  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)mainKeyFromKeychainForObject:(id)a3 cipherVersion:(int64_t)a4
{
  return -[ICAuthenticationState mainKeyFromKeychainForKeyObject:decryptingObject:cipherVersion:](self, "mainKeyFromKeychainForKeyObject:decryptingObject:cipherVersion:", a3, a3, a4);
}

- (id)mainKeyFromKeychainForKeyObject:(id)a3 decryptingObject:(id)a4 cipherVersion:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICEncryptionKey *v16;
  ICEncryptionKey *v17;
  void *v18;
  int v19;

  v8 = a4;
  -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](self, "mainKeyIdentifierForKeyObject:cipherVersion:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[ICKeychain dataForIdentifier:account:](ICKeychain, "dataForIdentifier:account:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v16 = 0;
      goto LABEL_12;
    }
    if (+[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v8)|| objc_msgSend(v10, "length") != 16)
    {
      v16 = -[ICEncryptionKey initWithSerializedData:]([ICEncryptionKey alloc], "initWithSerializedData:", v10);
      if (!v16)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cryptoSalt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "cryptoIterationCount");
      objc_msgSend(v8, "passwordHint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:", v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", v10, v15);
      else
        v16 = 0;

      if (!v16)
        goto LABEL_12;
    }
    objc_msgSend(v8, "cryptoStrategy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mainKeyDecryptsPrimaryData:", v16);

    if (v19)
    {
      v16 = v16;
      v17 = v16;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v17 = 0;
LABEL_14:

  return v17;
}

void __29__ICAuthenticationState_init__block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  performBlockOnMainThread();
  objc_destroyWeak(&v1);
}

void __29__ICAuthenticationState_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD918000, v2, OS_LOG_TYPE_INFO, "Deauthenticating because another process will change a passphrase", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deauthenticate");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[ICAuthenticationState deauthenticationTimer](self, "deauthenticationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossProcessChangeCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationState passphraseChangeObserver](self, "passphraseChangeObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCrossProcessNotificationObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)ICAuthenticationState;
  -[ICAuthenticationState dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationState isAuthenticated](self, "isAuthenticated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationState hasAuthenticatedObject](self, "hasAuthenticatedObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationState isAuthenticatedWithDevicePassword](self, "isAuthenticatedWithDevicePassword"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationState isBlockingDeauthentication](self, "isBlockingDeauthentication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, isAuthenticated: %@, hasAuthenticatedObject: %@, isAuthenticatedWithDevicePassword: %@, isBlockingDeauthentication: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAuthenticationState objectIDsToMainKey](self, "objectIDsToMainKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectIDsToMainKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[ICAuthenticationState isAuthenticatedWithDevicePassword](self, "isAuthenticatedWithDevicePassword");
      v9 = v8 ^ objc_msgSend(v5, "isAuthenticatedWithDevicePassword") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[ICAuthenticationState objectIDsToMainKey](self, "objectIDsToMainKey");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = ICHashWithObject(v12);
        v6 = ICHashWithObject(v13) + v6 - v14 + 32 * v14;

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v15 = -[ICAuthenticationState isAuthenticatedWithDevicePassword](self, "isAuthenticatedWithDevicePassword");
  v23 = ICHashWithHashKeys(v6, v16, v17, v18, v19, v20, v21, v22, v15);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICAuthenticationState *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[ICAuthenticationState init](+[ICAuthenticationState allocWithZone:](ICAuthenticationState, "allocWithZone:"), "init");
  -[ICAuthenticationState objectIDsToMainKey](self, "objectIDsToMainKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  -[ICAuthenticationState setObjectIDsToMainKey:](v5, "setObjectIDsToMainKey:", v7);

  -[ICAuthenticationState setAuthenticatedWithDevicePassword:](v5, "setAuthenticatedWithDevicePassword:", -[ICAuthenticationState isAuthenticatedWithDevicePassword](self, "isAuthenticatedWithDevicePassword"));
  -[ICAuthenticationState setBlockingDeauthenticationCount:](v5, "setBlockingDeauthenticationCount:", -[ICAuthenticationState blockingDeauthenticationCount](self, "blockingDeauthenticationCount"));
  -[ICAuthenticationState setDidAttemptToDeauthenticateWhileBlocked:](v5, "setDidAttemptToDeauthenticateWhileBlocked:", -[ICAuthenticationState didAttemptToDeauthenticateWhileBlocked](self, "didAttemptToDeauthenticateWhileBlocked"));
  -[ICAuthenticationState deauthenticationTimeInterval](self, "deauthenticationTimeInterval");
  -[ICAuthenticationState setDeauthenticationTimeInterval:](v5, "setDeauthenticationTimeInterval:");
  -[ICAuthenticationState deauthenticationTimerRunLoopModes](self, "deauthenticationTimerRunLoopModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationState setDeauthenticationTimerRunLoopModes:](v5, "setDeauthenticationTimerRunLoopModes:", v8);

  return v5;
}

+ (void)setSharedState:(id)a3
{
  objc_storeStrong((id *)&_sharedState, a3);
}

- (void)deauthenticate
{
  ICAuthenticationState *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthenticationState deauthenticate]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (-[ICAuthenticationState isBlockingDeauthentication](v2, "isBlockingDeauthentication"))
  {
    -[ICAuthenticationState setDidAttemptToDeauthenticateWhileBlocked:](v2, "setDidAttemptToDeauthenticateWhileBlocked:", 1);
    v3 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Not deauthenticating because deauthentication is blocked", v5, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAuthenticationStateWillDeauthenticateNotification"), v2);

    -[ICAuthenticationState deauthenticateAllObjects](v2, "deauthenticateAllObjects");
    -[ICAuthenticationState deauthenticateWithDevicePassword](v2, "deauthenticateWithDevicePassword");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v3, "postNotificationName:object:", CFSTR("ICAuthenticationStateDidDeauthenticateNotification"), v2);
  }

  objc_sync_exit(v2);
}

- (BOOL)isBlockingDeauthentication
{
  ICAuthenticationState *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[ICAuthenticationState blockingDeauthenticationCount](v2, "blockingDeauthenticationCount") > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)beginBlockingDeauthentication
{
  ICAuthenticationState *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICAuthenticationState setBlockingDeauthenticationCount:](obj, "setBlockingDeauthenticationCount:", -[ICAuthenticationState blockingDeauthenticationCount](obj, "blockingDeauthenticationCount") + 1);
  objc_sync_exit(obj);

}

- (void)endBlockingDeauthentication
{
  ICAuthenticationState *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  if (!-[ICAuthenticationState isBlockingDeauthentication](v2, "isBlockingDeauthentication"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isBlockingDeauthentication", "-[ICAuthenticationState endBlockingDeauthentication]", 1, 0, CFSTR("Unbalanced calls to begin/end blocking deauthentication"));
  v3 = -[ICAuthenticationState blockingDeauthenticationCount](v2, "blockingDeauthenticationCount");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  -[ICAuthenticationState setBlockingDeauthenticationCount:](v2, "setBlockingDeauthenticationCount:", v4 - 1);
  objc_sync_exit(v2);

  performBlockOnMainThread();
}

uint64_t __52__ICAuthenticationState_endBlockingDeauthentication__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBlockingDeauthentication");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "didAttemptToDeauthenticateWhileBlocked");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 32), "deauthenticate");
      return objc_msgSend(*(id *)(a1 + 32), "setDidAttemptToDeauthenticateWhileBlocked:", 0);
    }
  }
  return result;
}

- (BOOL)authenticateObject:(id)a3 withPassphrase:(id)a4
{
  id v6;
  id v7;
  ICAuthenticationState *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ICCryptoConvergenceControllerConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_msgSend(v6, "isPassphraseCorrect:", v7);
  objc_msgSend(v6, "cloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPassphraseCorrect:", v7);

  if (((v9 | v11) & 1) != 0)
  {
    if (v9)
    {
      objc_msgSend(v6, "cryptoStrategy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v12, "authenticateWithPassphrase:", v7);

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v6, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v18, "isAuthenticated") & 1) == 0
            && objc_msgSend(v18, "isPassphraseCorrect:", v7))
          {
            objc_msgSend(v18, "cryptoStrategy");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "authenticateWithPassphrase:", v7);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }

    objc_sync_exit(v8);
    objc_opt_class();
    ICDynamicCast();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc_init(ICCryptoConvergenceControllerConfiguration);
      -[ICCryptoConvergenceControllerConfiguration setPassphrase:](v22, "setPassphrase:", v7);
      +[ICCryptoConvergenceController sharedController](ICCryptoConvergenceController, "sharedController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "convergeAttachmentsInNoteWithID:configuration:", v21, v22);

    }
    objc_opt_class();
    ICDynamicCast();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && (objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests") & 1) == 0)
    {
      dispatch_get_global_queue(-32768, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __59__ICAuthenticationState_authenticateObject_withPassphrase___block_invoke;
      v28[3] = &unk_1E76C73B0;
      v29 = v7;
      v30 = v25;
      dispatch_async(v26, v28);

    }
  }
  else
  {
    objc_sync_exit(v8);

    LOBYTE(v9) = 0;
  }

  return v9;
}

void __59__ICAuthenticationState_authenticateObject_withPassphrase___block_invoke(uint64_t a1)
{
  void *v2;
  ICCryptoConvergenceControllerConfiguration *v3;

  v3 = objc_alloc_init(ICCryptoConvergenceControllerConfiguration);
  -[ICCryptoConvergenceControllerConfiguration setPassphrase:](v3, "setPassphrase:", *(_QWORD *)(a1 + 32));
  +[ICCryptoConvergenceController sharedController](ICCryptoConvergenceController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convergeNotesInAccountWithID:configuration:progress:", *(_QWORD *)(a1 + 40), v3, 0);

}

- (BOOL)authenticateAllNotesInAccount:(id)a3 withPassphrase:(id)a4
{
  id v6;
  id v7;
  ICAuthenticationState *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationState authenticateAllNotesInAccount:withPassphrase:].cold.1(v10, buf, v9);
  }

  if (objc_msgSend(v6, "isPassphraseCorrect:", v7))
    -[ICAuthenticationState authenticateObject:withPassphrase:](v8, "authenticateObject:withPassphrase:", v6, v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "passwordProtectedNotes", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isAuthenticated") & 1) == 0
          && objc_msgSend(v15, "isPassphraseCorrect:", v7))
        {
          objc_msgSend(v15, "cryptoStrategy");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "authenticateWithPassphrase:", v7);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = objc_msgSend(v6, "isAuthenticated");
  objc_sync_exit(v8);

  return v17;
}

- (void)deauthenticateAllObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Deauthenticated all objects with custom password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)authenticateWithDevicePassword
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Authenticated with device password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deauthenticateWithDevicePassword
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Deauthenticated with device password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (id)mainKeyIdentifierForKeyObject:(id)a3 cipherVersion:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a4 == 2)
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v12;

  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)setCachedMainKey:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  ICAuthenticationState *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  char v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](v8, "mainKeyIdentifierForKeyObject:cipherVersion:", v7, objc_msgSend(v9, "cipherVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    if (v6)
    {
      objc_msgSend(v7, "cryptoStrategy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "mainKeyDecryptsPrimaryData:", v6);

      if ((v12 & 1) == 0)
      {
        v22 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "shortLoggingDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAuthenticationState setCachedMainKey:forObject:].cold.1(v23, (uint8_t *)&v36, v22);
        }
        v21 = 0;
        v13 = v22;
        goto LABEL_34;
      }
    }
    -[ICAuthenticationState cachedMainKeyForIdentifier:](v8, "cachedMainKeyForIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((id)*MEMORY[0x1E0C9B0D0] == v6)
      v15 = 0;
    else
      v15 = v6;
    v16 = v15;
    if (v14 == v13)
      v17 = 0;
    else
      v17 = v13;
    v18 = v17;
    if (v16 | v18)
    {
      v19 = (void *)v18;
      if (v16 && v18)
      {
        v20 = objc_msgSend((id)v16, "isEqual:", v18);

        if ((v20 & 1) != 0)
          goto LABEL_27;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v48 = CFSTR("ICAuthenticationStateKeyObjectID");
        objc_msgSend(v7, "objectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("ICAuthenticationStateWillAuthenticateNotification"), v8, v26);
      }
      else
      {
        v46 = CFSTR("ICAuthenticationStateKeyObjectID");
        objc_msgSend(v7, "objectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("ICAuthenticationStateWillDeauthenticateNotification"), v8, v26);
      }

      -[ICAuthenticationState setCachedMainKey:forIdentifier:](v8, "setCachedMainKey:forIdentifier:", v6, v10);
      -[ICAuthenticationState setMainKeyInKeychain:forObject:](v8, "setMainKeyInKeychain:forObject:", v6, v7);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v44 = CFSTR("ICAuthenticationStateKeyObjectID");
        objc_msgSend(v7, "objectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("ICAuthenticationStateDidAuthenticateNotification"), v8, v29);
      }
      else
      {
        v42 = CFSTR("ICAuthenticationStateKeyObjectID");
        objc_msgSend(v7, "objectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("ICAuthenticationStateDidDeauthenticateNotification"), v8, v29);
      }

    }
LABEL_27:
    objc_msgSend(v7, "parentEncryptableObject");
    v30 = objc_claimAutoreleasedReturnValue();
    v22 = v30;
    if (v6)
    {
      if (v30)
      {
        -[NSObject cryptoStrategy](v30, "cryptoStrategy");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "mainKeyDecryptsPrimaryData:", v6);

        if (v32)
          -[ICAuthenticationState setCachedMainKey:forObject:](v8, "setCachedMainKey:forObject:", v6, v22);
      }
    }
    -[ICAuthenticationState extendDeauthenticationTimer](v8, "extendDeauthenticationTimer");
    v33 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "shortLoggingDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412802;
      v37 = v35;
      v38 = 2112;
      v39 = v13;
      v40 = 2112;
      v41 = v6;
      _os_log_debug_impl(&dword_1BD918000, v33, OS_LOG_TYPE_DEBUG, "Set cached main key for object {object: %@, oldMainKey: %@, newMainKey: %@}", (uint8_t *)&v36, 0x20u);

    }
    v21 = 1;
LABEL_34:

    goto LABEL_35;
  }
  v21 = 0;
LABEL_35:

  objc_sync_exit(v8);
  return v21;
}

- (id)cachedMainKeyForObject:(id)a3
{
  id v4;
  ICAuthenticationState *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    while (1)
    {
      -[ICAuthenticationState cachedMainKeyForKeyObject:decryptingObject:](v5, "cachedMainKeyForKeyObject:decryptingObject:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        break;
      objc_msgSend(v8, "parentEncryptableObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
      if (!v10)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(v7, "primaryEncryptedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v7, "unappliedEncryptedRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v9 = 0;
        goto LABEL_10;
      }
    }
    -[ICAuthenticationState objectIDsToMainKey](v5, "objectIDsToMainKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__ICAuthenticationState_cachedMainKeyForObject___block_invoke;
    v15[3] = &unk_1E76C9D28;
    v16 = v7;
    objc_msgSend(v13, "ic_objectPassingTest:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:
  objc_sync_exit(v5);

  return v9;
}

uint64_t __48__ICAuthenticationState_cachedMainKeyForObject___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "cryptoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mainKeyDecryptsPrimaryData:", v3);

  return v5;
}

- (id)cachedMainKeyForKeyObject:(id)a3 decryptingObject:(id)a4
{
  id v6;
  id v7;
  ICAuthenticationState *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](v8, "mainKeyIdentifierForKeyObject:cipherVersion:", v6, +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[ICAuthenticationState cachedMainKeyForIdentifier:](v8, "cachedMainKeyForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(v7, "cryptoStrategy"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "mainKeyDecryptsPrimaryData:", v10),
          v11,
          (v12 & 1) != 0))
    {
      v13 = v10;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v8);
  return v13;
}

- (void)setCachedMainKey:(id)a3 forIdentifier:(id)a4
{
  id v6;
  ICAuthenticationState *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ICAuthenticationState objectIDsToMainKey](v7, "objectIDsToMainKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

  objc_sync_exit(v7);
}

- (id)cachedMainKeyForIdentifier:(id)a3
{
  id v4;
  ICAuthenticationState *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ICAuthenticationState objectIDsToMainKey](v5, "objectIDsToMainKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)setDeauthenticationTimeInterval:(double)a3
{
  self->_deauthenticationTimeInterval = a3;
  -[ICAuthenticationState extendDeauthenticationTimer](self, "extendDeauthenticationTimer");
}

- (void)setDeauthenticationTimerRunLoopModes:(id)a3
{
  objc_storeStrong((id *)&self->_deauthenticationTimerRunLoopModes, a3);
  -[ICAuthenticationState extendDeauthenticationTimer](self, "extendDeauthenticationTimer");
}

void __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deauthenticate");

  objc_msgSend(v3, "invalidate");
}

- (void)localAuthenticationDidChangeBiometricsPolicyState:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Cached biometrics policy state became invalid — deleting all Keychain items", v5, 2u);
  }

  -[ICAuthenticationState removeAllMainKeysFromKeychain](self, "removeAllMainKeysFromKeychain");
}

- (void)setAuthenticatedWithDevicePassword:(BOOL)a3
{
  self->_authenticatedWithDevicePassword = a3;
}

- (double)deauthenticationTimeInterval
{
  return self->_deauthenticationTimeInterval;
}

- (NSArray)deauthenticationTimerRunLoopModes
{
  return self->_deauthenticationTimerRunLoopModes;
}

- (void)setObjectIDsToMainKey:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToMainKey, a3);
}

- (int64_t)blockingDeauthenticationCount
{
  return self->_blockingDeauthenticationCount;
}

- (void)setBlockingDeauthenticationCount:(int64_t)a3
{
  self->_blockingDeauthenticationCount = a3;
}

- (void)setDeauthenticationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deauthenticationTimer, a3);
}

- (BOOL)didAttemptToDeauthenticateWhileBlocked
{
  return self->_didAttemptToDeauthenticateWhileBlocked;
}

- (void)setDidAttemptToDeauthenticateWhileBlocked:(BOOL)a3
{
  self->_didAttemptToDeauthenticateWhileBlocked = a3;
}

- (NSObject)passphraseChangeObserver
{
  return self->_passphraseChangeObserver;
}

- (void)setPassphraseChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_passphraseChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passphraseChangeObserver, 0);
  objc_storeStrong((id *)&self->_deauthenticationTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToMainKey, 0);
  objc_storeStrong((id *)&self->_deauthenticationTimerRunLoopModes, 0);
}

- (void)authenticateAllNotesInAccount:(os_log_t)log withPassphrase:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Authenticating all notes… {account: %@}", buf, 0xCu);

}

- (void)setCachedMainKey:(os_log_t)log forObject:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Cannot set main key because it doesn't decrypt object {object: %@}", buf, 0xCu);

}

void __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Deauthenticating after timer expired…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
