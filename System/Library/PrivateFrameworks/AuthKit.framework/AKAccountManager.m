@implementation AKAccountManager

void __34__AKAccountManager_sharedInstance__block_invoke()
{
  AKAccountManager *v0;
  void *v1;

  v0 = objc_alloc_init(AKAccountManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (AKAccountManager)init
{
  AKAccountManager *v2;
  AKAccountStore *v3;
  AKAccountStore *accountStore;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accountQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  uint64_t v11;
  AKTokenManager *tokenManager;
  uint64_t v13;
  NSMutableDictionary *accountTypeCache;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AKAccountManager;
  v2 = -[AKAccountManager init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AKAccountStore);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("AKAccountManagerQueue", v5);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("AKAccountManagerQueue.read.write", v8);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    +[AKTokenManager sharedInstance](AKTokenManager, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    tokenManager = v2->_tokenManager;
    v2->_tokenManager = (AKTokenManager *)v11;

    v2->_authKitAccountTypeLock._os_unfair_lock_opaque = 0;
    v2->_appleIDAccountTypeLock._os_unfair_lock_opaque = 0;
    v2->_iCloudAccountTypeLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v2->_iTunesAccountTypeLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    accountTypeCache = v2->_accountTypeCache;
    v2->_accountTypeCache = (NSMutableDictionary *)v13;

  }
  return v2;
}

+ (AKAccountManager)sharedInstance
{
  id v2;

  if (+[AKAccountManager isAccountsFrameworkAvailable](AKAccountManager, "isAccountsFrameworkAvailable"))
  {
    if (sharedInstance_onceToken_1 != -1)
      dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_20);
    v2 = (id)sharedInstance_sharedInstance_1;
  }
  else
  {
    v2 = 0;
  }
  return (AKAccountManager *)v2;
}

+ (BOOL)isAccountsFrameworkAvailable
{
  return objc_opt_class() != 0;
}

- (id)additionalInfoForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("additionalInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)securityLevelForAccount:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("security-level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (BOOL)userUnderAgeForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isUnderage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)canHaveBeneficiaryForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("canHaveBeneficiary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)canHaveCustodianForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("canHaveCustodian"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)primaryAuthKitAccount
{
  void *v3;
  void *v4;

  -[AKAccountManager altDSIDforPrimaryiCloudAccount](self, "altDSIDforPrimaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager authKitAccountWithAltDSID:](self, "authKitAccountWithAltDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)altDSIDforPrimaryiCloudAccount
{
  void *v3;
  void *v4;

  -[AKAccountManager primaryiCloudAccount](self, "primaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)primaryiCloudAccount
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager _iCloudAccounts](self, "_iCloudAccounts");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[AKAccountManager isPrimaryiCloudAccount:](self, "isPrimaryiCloudAccount:", v8, (_QWORD)v11))
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_iCloudAccounts
{
  void *v3;
  void *v4;

  -[AKAccountManager iCloudAccountType](self, "iCloudAccountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authKitAccountWithAltDSID:(id)a3
{
  return -[AKAccountManager authKitAccountWithAltDSID:error:](self, "authKitAccountWithAltDSID:error:", a3, 0);
}

- (ACAccountType)authKitAccountType
{
  return (ACAccountType *)-[AKAccountManager authKitAccountTypeWithError:](self, "authKitAccountTypeWithError:", 0);
}

- (ACAccountType)iCloudAccountType
{
  ACAccountType *iCloudAccountType;
  ACAccountType *v4;
  ACAccountType *v5;

  iCloudAccountType = self->_iCloudAccountType;
  if (!iCloudAccountType)
  {
    os_unfair_lock_lock(&self->_iCloudAccountTypeLock);
    if (!self->_iCloudAccountType)
    {
      -[AKAccountStore accountTypeWithAccountTypeIdentifier:error:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E0C8F038], 0);
      v4 = (ACAccountType *)objc_claimAutoreleasedReturnValue();
      v5 = self->_iCloudAccountType;
      self->_iCloudAccountType = v4;

    }
    os_unfair_lock_unlock(&self->_iCloudAccountTypeLock);
    iCloudAccountType = self->_iCloudAccountType;
  }
  return iCloudAccountType;
}

- (id)altDSIDForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("altDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isPrimaryiCloudAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("accountClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("primary")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountPropertyForKey:", CFSTR("primaryAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AKAccountManager isPrimaryiCloudAccount:].cold.2();

      v5 = 0;
    }
    else
    {
      v5 = objc_msgSend(v6, "BOOLValue");
    }

  }
  return v5;
}

- (BOOL)userIsSeniorForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isSenior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)telemetryDeviceSessionIDForAccount:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAccountManager telemetryDeviceSessionIDForAccount:].cold.1();
    goto LABEL_10;
  }
  if (!-[AKAccountManager accountAccessTelemetryOptInForAccount:](self, "accountAccessTelemetryOptInForAccount:", v4))
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager telemetryDeviceSessionIDForAccount:].cold.3();
LABEL_10:

    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "accountPropertyForKey:", CFSTR("telemetryDeviceSessionID"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("device_session_id_missing");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

LABEL_11:
  return v8;
}

- (id)isSOSNeededForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceSOSNeeded");

  if (v5)
  {
    v6 = &unk_1E2E9A2E0;
    if (v5 == -1)
      v6 = &unk_1E2E9A2C8;
    v7 = v6;
  }
  else
  {
    objc_msgSend(v3, "accountPropertyForKey:", CFSTR("SOSNeeded"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)isBeneficiaryForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("beneficiaryAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)hasSOSActiveDeviceForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceHasSOSActiveDevice");

  if (v5)
  {
    v6 = &unk_1E2E9A2E0;
    if (v5 == -1)
      v6 = &unk_1E2E9A2C8;
    v7 = v6;
  }
  else
  {
    objc_msgSend(v3, "accountPropertyForKey:", CFSTR("SOSCompatibilityOptInNeeded"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)demoAccountForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("demoAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (unint64_t)authenticationModeForAccount:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("auth-mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (BOOL)accountAccessTelemetryOptInForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldEnableTelemetryOptIn");

  if (v5 != 1)
  {
    objc_opt_class();
    objc_msgSend(v3, "accountPropertyForKey:", CFSTR("com.apple.idms.config.privacy.appleid.data.access"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");
  }

  return v5;
}

- (id)DSIDForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("DSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accountIsSignedIntoServices:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "servicesUsingAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "aaf_hasObjects");
  return (char)v3;
}

- (void)setInactiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("inActiveHMECount"));

}

- (void)setActiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("activeHMECount"));

}

- (void)setTelemetryDeviceSessionID:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("telemetryDeviceSessionID"));

}

- (BOOL)setAccountAccessTelemetryOptIn:(BOOL)a3 forAccount:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;

  v6 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountProperty:forKey:", v9, CFSTR("com.apple.idms.config.privacy.appleid.data.access"));

  -[AKAccountManager updateAccountAccessTelemetryOptInTimestampForAccount:withOptIn:](self, "updateAccountAccessTelemetryOptInTimestampForAccount:withOptIn:", v8, v6);
  v10 = -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v8, a5);
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      -[AKAccountManager setAccountAccessTelemetryOptIn:forAccount:error:].cold.1();
  }
  else if (v12)
  {
    -[AKAccountManager setAccountAccessTelemetryOptIn:forAccount:error:].cold.2();
  }

  return v10;
}

- (void)updateAccountAccessTelemetryOptInTimestampForAccount:(id)a3 withOptIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccountProperty:forKey:", v7, CFSTR("DataAccessAnalyticsOptInTimeStamp"));

  }
  else
  {
    objc_msgSend(v5, "setAccountProperty:forKey:", 0, CFSTR("DataAccessAnalyticsOptInTimeStamp"));
  }

}

- (id)accountAccessTelemetryOptInDateForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("DataAccessAnalyticsOptInTimeStamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)configDataVersionForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("configDataVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConfigDataVersion:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("configDataVersion"));

}

- (id)configValue:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "accountPropertyForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 forAccount:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "setAccountProperty:forKey:", v8, v9);
  -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v10, 0);

}

- (void)setAltDSID:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("altDSID"));
  }
  else
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKAccountManager setAltDSID:forAccount:].cold.1();

  }
}

- (void)setDSID:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAccountManager setDSID:forAccount:].cold.1();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAccountManager setDSID:forAccount:].cold.3((uint64_t)v5, v7);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("DSID"));
LABEL_9:

}

- (id)combinedAliasesAndReachableEmailsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[AKAccountManager aliasesForAccount:](self, "aliasesForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager reachableEmailAddressesForAccount:](self, "reachableEmailAddressesForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke;
  v18[3] = &unk_1E2E601E0;
  v9 = v7;
  v19 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
  v13 = v8;
  v14 = 3221225472;
  v15 = __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke_2;
  v16 = &unk_1E2E601E0;
  v17 = v9;
  v10 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

void __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)aliasesForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("aliases"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAliases:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("aliases"));

}

- (id)formattedUsernameForAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKUsernameFormatter formattedUsernameFromUsername:](AKUsernameFormatter, "formattedUsernameFromUsername:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateVerifiedEmail:(BOOL)a3 forAccountWithAltDSID:(id)a4
{
  _BOOL8 v4;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager authKitAccountWithAltDSID:](self, "authKitAccountWithAltDSID:", a4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[AKAccountManager verifiedPrimaryEmailForAccount:](self, "verifiedPrimaryEmailForAccount:", v6) == v4)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v4)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = (void *)v11;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Account %@ already updated to reflect email verified is %@.", buf, 0x16u);
    }
  }
  else
  {
    -[AKAccountManager setVerifiedPrimaryEmail:forAccount:](self, "setVerifiedPrimaryEmail:forAccount:", v4, v6);
    v13 = 0;
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v6, &v13);
    v7 = v13;
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (v4)
          v10 = CFSTR("YES");
        v15 = v10;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v6;
        _os_log_error_impl(&dword_19202F000, v9, OS_LOG_TYPE_ERROR, "Failed to update verified email to %@ with error %@ after observing verified primary email for account %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if (v4)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Updated account %@ verified email to %@ after observing verified email followup tear down", buf, 0x16u);
    }

  }
}

- (void)updateUsername:(id)a3 forAccountsWithAltDSID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Requested to update username to %@ for altDSID: %@", (uint8_t *)&v12, 0x16u);
  }

  -[AKAccountManager authKitAccountWithAltDSID:](self, "authKitAccountWithAltDSID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && -[AKAccountManager _setUsername:forAccount:](self, "_setUsername:forAccount:", v6, v9))
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v9, 0);
  -[AKAccountManager appleIDAccountWithAltDSID:](self, "appleIDAccountWithAltDSID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && -[AKAccountManager _setUsername:forAccount:](self, "_setUsername:forAccount:", v6, v10))
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v10, 0);
  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && -[AKAccountManager _setUsername:forAccount:](self, "_setUsername:forAccount:", v6, v11))
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v11, 0);

}

- (BOOL)_setUsername:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && (objc_msgSend(v6, "username"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v5, "isEqualToString:", v8),
        v8,
        (v9 & 1) == 0))
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Updating username for: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v7, "setUsername:", v5);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)primaryEmailAddressForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("primaryEmail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPrimaryEmailAddress:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("primaryEmail"));

}

- (BOOL)verifiedPrimaryEmailForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("vettedPrimaryEmail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setVerifiedPrimaryEmail:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("vettedPrimaryEmail"));

}

- (BOOL)phoneAsAppleIDForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("phoneAsAppleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPhoneAsAppleID:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("phoneAsAppleID"));

}

- (void)setUserUnderage:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isUnderage"));

}

- (BOOL)isSiwaEnabledForChildAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isSiwaEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setIsSiwaEnabled:(BOOL)a3 forChildAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isSiwaEnabled"));

}

- (void)setUserIsSenior:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isSenior"));

}

- (void)setDemoAccount:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("demoAccount"));

}

- (id)ageOfMajorityForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("ageOfMajority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAgeOfMajority:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("ageOfMajority"));

}

- (id)appleIDCountryCodeForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("appleIDCountryCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAppleIDCountryCode:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("appleIDCountryCode"));

}

- (BOOL)authorizationUsedForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("appleIdSignInEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setAuthorizationUsed:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("appleIdSignInEnabled"));

}

- (BOOL)privateAttestationEnabledForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("privateAttestationEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (void)setPrivateAttestationEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("privateAttestationEnabled"));

}

- (BOOL)isProximityAuthEligible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isProximityAuthEligible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setIsProximityAuthEligible:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isProximityAuthEligible"));

}

- (BOOL)piggybackingApprovalEligible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("pbae"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setPiggybackingApprovalEligible:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("pbae"));

}

- (id)reachableEmailAddressesForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("reachableEmailAddresses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setReachableEmailAddresses:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("reachableEmailAddresses"));

}

- (id)givenNameForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("firstName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setGivenName:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("firstName"));

}

- (id)familyNameForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("lastName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setFamilyName:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("lastName"));

}

- (id)forwardingEmailForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("forwardingEmail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setForwardingEmail:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("forwardingEmail"));

}

- (BOOL)selectedPrivateEmailForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("privateEmailSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setSelectedPrivateEmail:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("privateEmailSelection"));

}

- (id)selectedAuthorizationEmailForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("authorizationEmailSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSelectedAuthorizationEmail:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("authorizationEmailSelection"));

}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = -[AKAccountManager _saveAccount:error:](self, "_saveAccount:error:", v6, &v12);
  v8 = v12;
  if (-[AKAccountStore isAccountDaemonConnectionError:](self->_accountStore, "isAccountDaemonConnectionError:", v8))
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "First attempt saving account %@ failed, retrying once...", buf, 0xCu);
    }

    v11 = 0;
    v7 = -[AKAccountManager _saveAccount:error:](self, "_saveAccount:error:", v6, &v11);
    v8 = v11;
  }
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)_saveAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Saving account %@...", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__AKAccountManager__saveAccount_error___block_invoke;
  v12[3] = &unk_1E2E60208;
  v14 = &v22;
  v12[4] = self;
  v13 = v6;
  v15 = &v16;
  +[AKAccountManager performWithinPersonaForAccount:withBlock:](AKAccountManager, "performWithinPersonaForAccount:withBlock:", v13, v12);

  if (*((_BYTE *)v23 + 24))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Saving of account %@ succeeed!", buf, 0xCu);
    }

  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAccountManager _saveAccount:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
  }
  v10 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __39__AKAccountManager__saveAccount_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "saveVerifiedAccount:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void)setSecurityLevel:(unint64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("security-level"));

}

- (void)setCredentialStorageOption:(unint64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("CredentialStorageLocation"));

}

- (BOOL)mdmInformationRequiredForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("mdm-info-required"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (void)setMDMInformationRequired:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("mdm-info-required"));

}

- (void)setDeviceRemovalReason:(int64_t)a3 onAccount:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = a3;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "AKAccountMAanger setDeviceRemovalReason:%ld onAccount:%@", (uint8_t *)&v11, 0x16u);

  }
  if (-[AKAccountManager deviceRemovalReasonForAccount:](self, "deviceRemovalReasonForAccount:", v6) == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccountProperty:forKey:", v10, CFSTR("AKRemoteDeviceRemovalReasonKey"));

  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAccountManager setDeviceRemovalReason:onAccount:].cold.2();

  }
}

- (void)clearDeviceRemovalReasonFromAccount:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "AKAccountMAanger clearDeviceRemovalReasonFromAccount", v5, 2u);
  }

  objc_msgSend(v3, "setAccountProperty:forKey:", &unk_1E2E9A2B0, CFSTR("AKRemoteDeviceRemovalReasonKey"));
}

- (int64_t)deviceRemovalReasonForAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("AKRemoteDeviceRemovalReasonKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    v7 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)shouldPerformSatoriWarmupVerificationForAccount:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("WarmUpVerificationTimeStamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Last Satori warmup occured %@ seconds ago", (uint8_t *)&v11, 0xCu);

    }
    v9 = v6 >= 3600.0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)updateSatoriWarmUpTimestampForAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountProperty:forKey:", v5, CFSTR("WarmUpVerificationTimeStamp"));

  -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v4, 0);
}

- (BOOL)needsRepairForAccount:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("repair-state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") > 1;

  return v5;
}

- (unint64_t)repairStateForAccount:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("repair-state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setRepairState:(unint64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("repair-state"));

}

- (id)webAccessEnabledForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("webAccessEnabled"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setWebAccessEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("webAccessEnabled"));

}

- (id)serverExperimentalFeaturesForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("serverExperimentalFeatures"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setServerExperimentalFeatures:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("serverExperimentalFeatures"));

}

- (id)markedForSignOutForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("markedForSignOut"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setMarkedForSignOut:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("markedForSignOut"));

}

- (void)setHasSOSActiveDevice:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("SOSCompatibilityOptInNeeded"));

}

- (void)setSOSNeeded:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("SOSNeeded"));

}

- (id)hasModernRecoveryKeyForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("hasRK"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setHasModernRecoveryKey:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("hasRK"));

}

- (id)get3PRegulatoryOverride:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("3PRegulatoryOverride"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)set3PRegulatoryOverride:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("3PRegulatoryOverride"));

}

- (id)adpCohortForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("adpCh"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)hearbeatTokenForAccount:(id)a3
{
  return -[AKAccountManager hearbeatTokenForAccount:error:](self, "hearbeatTokenForAccount:error:", a3, 0);
}

- (id)continuationTokenForAccount:(id)a3
{
  return -[AKAccountManager continuationTokenForAccount:error:](self, "continuationTokenForAccount:error:", a3, 0);
}

- (id)passwordResetTokenForAccount:(id)a3
{
  return -[AKAccountManager passwordResetTokenForAccount:error:](self, "passwordResetTokenForAccount:error:", a3, 0);
}

- (id)passwordResetTokenBackupForAccount:(id)a3
{
  return -[AKAccountManager passwordResetTokenBackupForAccount:error:](self, "passwordResetTokenBackupForAccount:error:", a3, 0);
}

- (id)hearbeatTokenForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  AKTokenManager *tokenManager;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTokenCacheEnabled");

  if (v8)
  {
    tokenManager = self->_tokenManager;
    v10 = *MEMORY[0x1E0C8F200];
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:](tokenManager, "tokenWithIdentifier:altDSID:forAccount:error:", v10, v11, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", *MEMORY[0x1E0C8F200], v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)continuationTokenForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  AKTokenManager *tokenManager;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTokenCacheEnabled");

  if (v8)
  {
    tokenManager = self->_tokenManager;
    v10 = *MEMORY[0x1E0C8F198];
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:](tokenManager, "tokenWithIdentifier:altDSID:forAccount:error:", v10, v11, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", *MEMORY[0x1E0C8F198], v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)passwordResetTokenForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  AKTokenManager *tokenManager;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTokenCacheEnabled");

  if (v8)
  {
    tokenManager = self->_tokenManager;
    v10 = *MEMORY[0x1E0C8F230];
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:](tokenManager, "tokenWithIdentifier:altDSID:forAccount:error:", v10, v11, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", *MEMORY[0x1E0C8F230], v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)passwordResetTokenBackupForAccount:(id)a3 error:(id *)a4
{
  return -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", *MEMORY[0x1E0C8F228], a3, a4);
}

- (id)allTokensForAccount:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v20 = 0;
  objc_msgSend(v4, "credentialWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  objc_msgSend(v6, "keysForCredentialItems");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "credentialItemForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)buildCredentialWithTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setCredentialItem:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)masterTokenForAccount:(id)a3
{
  void *v3;
  void *v4;

  -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", *MEMORY[0x1E0C8F280], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AKMasterToken tokenWithExternalizedVersionString:](AKMasterToken, "tokenWithExternalizedVersionString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)settingsServiceTokenForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AKAccountManager store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialForAccount:serviceID:", v4, CFSTR("com.apple.gs.appleid.auth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dependentAuthTokenForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AKAccountManager store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialForAccount:serviceID:", v4, CFSTR("com.apple.gs.idms.dependent.auth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeMasterTokenForAccount:(id)a3
{
  -[AKAccountManager _removeTokenKey:forAccount:](self, "_removeTokenKey:forAccount:", *MEMORY[0x1E0C8F280], a3);
}

- (id)tokenCreationDateWithIdentifier:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  void *v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:].cold.3();

  if (v9)
  {
    -[AKAccountManager _creationKeyForTokenWithName:](self, "_creationKeyForTokenWithName:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[AKAccountManager _tokenWithName:forAccount:error:](self, "_tokenWithName:forAccount:error:", v11, v9, a5);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        -[NSObject doubleValue](v12, "doubleValue");
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v14 / 1000.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:].cold.2();
    }
    v15 = 0;
    goto LABEL_14;
  }
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:].cold.1();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7022);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)setToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCredentialItem:forKey:", v14, v12);

  -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:](self, "_setTokenCreationTimeForToken:tokenID:account:credential:", v13, v12, v11, v10);
  objc_msgSend(v11, "setCredential:", v10);

  v17 = 0;
  LOBYTE(v10) = -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v11, &v17);

  v15 = v17;
  if ((v10 & 1) == 0)
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKAccountManager setToken:tokenID:account:credential:].cold.1();

  }
}

- (void)_setTokenCreationTimeForToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTokenCreationTimeEnabled");

  if ((v15 & 1) != 0)
  {
    if (v13)
    {
      -[AKAccountManager _creationKeyForTokenWithName:](self, "_creationKeyForTokenWithName:", v11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        _AKLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:].cold.2();
        goto LABEL_20;
      }
      if (v10)
      {
        -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:](self, "tokenCreationDateWithIdentifier:forAccount:error:", v11, v12, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "creationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          if (v17 && objc_msgSend(v18, "compare:", v17) != 1)
          {
            _AKLogSystem();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:].cold.3();
          }
          else
          {
            objc_msgSend(v10, "creationDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "timeIntervalSince1970");
            v22 = v21;

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), v22 * 1000.0);
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setCredentialItem:forKey:", v23, v16);
          }

        }
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v13, "setCredentialItem:forKey:", 0, v16);
    }
    else
    {
      _AKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:].cold.1();
    }
  }
  else
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:].cold.4();
  }
LABEL_21:

}

- (id)_creationKeyForTokenWithName:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((id)*MEMORY[0x1E0C8F198] == v3)
  {
    v4 = CFSTR("continuation-key-creation");
  }
  else if ((id)*MEMORY[0x1E0C8F230] == v3)
  {
    v4 = CFSTR("password-reset-token-creation");
  }
  else if ((id)*MEMORY[0x1E0C8F200] == v3)
  {
    v4 = CFSTR("heartbeat-token-creation");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (id)_tokenWithName:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  AKAccountManager *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKAccountManager _tokenWithName:forAccount:error:].cold.4();

  if (v9)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    v35 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __52__AKAccountManager__tokenWithName_forAccount_error___block_invoke;
    v23 = &unk_1E2E60230;
    v27 = &v36;
    v24 = self;
    v11 = v9;
    v25 = v11;
    v28 = &v42;
    v29 = &v30;
    v12 = v8;
    v26 = v12;
    +[AKAccountManager performWithinPersonaForAccount:withBlock:](AKAccountManager, "performWithinPersonaForAccount:withBlock:", v11, &v20);
    if (v37[5])
    {
      if (v31[5])
      {
LABEL_16:
        v18 = (void *)v43[5];
        if (v18)
        {
          if (a5)
          {
            *a5 = objc_retainAutorelease(v18);
            v18 = (void *)v43[5];
          }
          -[AKAccountManager _reportTokenWithName:forAccount:error:](self, "_reportTokenWithName:forAccount:error:", v12, v11, v18, v20, v21, v22, v23, v24, v25);
        }
        v17 = (id)v31[5];

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(&v42, 8);
        goto LABEL_21;
      }
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v37[5];
        *(_DWORD *)buf = 138412802;
        v49 = v12;
        v50 = 2112;
        v51 = v11;
        v52 = 2112;
        v53 = v14;
        _os_log_error_impl(&dword_19202F000, v13, OS_LOG_TYPE_ERROR, "AuthKit %@ token is missing! Account: %@. Credential: %@.", buf, 0x20u);
      }
    }
    else
    {
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AKAccountManager _tokenWithName:forAccount:error:].cold.3();
    }

    goto LABEL_16;
  }
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[AKAccountManager _tokenWithName:forAccount:error:].cold.1();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7022);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v16;
    -[AKAccountManager _reportTokenWithName:forAccount:error:](self, "_reportTokenWithName:forAccount:error:", v8, 0, v16);
  }
  v17 = 0;
LABEL_21:

  return v17;
}

void __52__AKAccountManager__tokenWithName_forAccount_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "credentialForAccount:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "credentialItemForKey:", a1[6]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)_reportTokenWithName:(id)a3 forAccount:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  __CFString **v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((id)*MEMORY[0x1E0C8F198] == v8)
  {
    v12 = kAKAnalyticsEventContinuationTokenFetch;
LABEL_9:
    v11 = *v12;
    -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:](self, "_reportTokenWithTelemetryID:account:telemetryFlowID:error:", v11, v9, 0, v10);
    goto LABEL_10;
  }
  if ((id)*MEMORY[0x1E0C8F230] == v8)
  {
    v12 = kAKAnalyticsEventPasswordResetTokenFetch;
    goto LABEL_9;
  }
  if ((id)*MEMORY[0x1E0C8F200] == v8)
  {
    v12 = kAKAnalyticsEventHeartbeatTokenFetch;
    goto LABEL_9;
  }
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAccountManager _reportTokenWithName:forAccount:error:].cold.1();
LABEL_10:

}

- (id)authKitAccountTypeWithError:(id *)a3
{
  ACAccountType *authKitAccountType;
  ACAccountType *v6;
  ACAccountType *v7;

  authKitAccountType = self->_authKitAccountType;
  if (!authKitAccountType)
  {
    os_unfair_lock_lock(&self->_authKitAccountTypeLock);
    if (!self->_authKitAccountType)
    {
      -[AKAccountStore accountTypeWithAccountTypeIdentifier:error:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E0C8F0C0], a3);
      v6 = (ACAccountType *)objc_claimAutoreleasedReturnValue();
      v7 = self->_authKitAccountType;
      self->_authKitAccountType = v6;

    }
    os_unfair_lock_unlock(&self->_authKitAccountTypeLock);
    authKitAccountType = self->_authKitAccountType;
  }
  return authKitAccountType;
}

- (id)accountEligibleForUpdate
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[16];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[AKAccountManager _serviceTypesForSecurityUpgrade](self, "_serviceTypesForSecurityUpgrade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AKAccountManager_accountEligibleForUpdate__block_invoke;
  v9[3] = &unk_1E2E60280;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v4 = (void *)v11[5];
  if (!v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "No account is eligible for security upgrade.", v8, 2u);
    }

    v4 = (void *)v11[5];
  }
  v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__AKAccountManager_accountEligibleForUpdate__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_serviceTypeForServiceNameString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "accountsUsingService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__AKAccountManager_accountEligibleForUpdate__block_invoke_2;
  v12[3] = &unk_1E2E60258;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = v7;
  objc_msgSend(v9, "aaf_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Account of service type \"%@\" is eligible for security upgrade.", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
    *a4 = 1;
  }

}

uint64_t __44__AKAccountManager_accountEligibleForUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAccountEligibleForSecurityUpgrade:ofServiceType:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_serviceTypesForSecurityUpgrade
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "securityUpgradeServiceNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
    -[AKAccountManager _defaultSecurityUpgradeServiceNames](self, "_defaultSecurityUpgradeServiceNames");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)_defaultSecurityUpgradeServiceNames
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("itunesstore");
  v3[1] = CFSTR("icloud");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_serviceTypeForServiceNameString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("itunesstore")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("icloud")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("imessage")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("facetime")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("gamecenter")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_accountTypeForServiceType:(int64_t)a3
{
  _QWORD *v3;
  NSObject *v4;
  id result;
  uint8_t v6[16];

  switch(a3)
  {
    case 1:
      v3 = (_QWORD *)MEMORY[0x1E0C8F038];
      goto LABEL_9;
    case 2:
      v3 = (_QWORD *)MEMORY[0x1E0C8F178];
      goto LABEL_9;
    case 4:
    case 5:
      v3 = (_QWORD *)MEMORY[0x1E0C8F0F0];
      goto LABEL_9;
    case 6:
      v3 = (_QWORD *)MEMORY[0x1E0C8F0A0];
LABEL_9:
      -[AKAccountManager accountTypeForTypeIdentifier:](self, "accountTypeForTypeIdentifier:", *v3);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      _AKLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Servicetype is not supported.", v6, 2u);
      }

      result = 0;
      break;
  }
  return result;
}

- (BOOL)_isAccountEligibleForSecurityUpgrade:(id)a3 ofServiceType:(int64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  v6 = a3;
  if (-[AKAccountManager securityLevelForAccount:](self, "securityLevelForAccount:", v6) != 2)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager _isAccountEligibleForSecurityUpgrade:ofServiceType:].cold.2();
    goto LABEL_8;
  }
  -[AKAccountManager _matchingServiceAccountForAuthKitAccount:service:](self, "_matchingServiceAccountForAuthKitAccount:service:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager _isAccountEligibleForSecurityUpgrade:ofServiceType:].cold.1((uint64_t)v6, a4);
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)removeAllPasswordResetTokens
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  AKTokenManager *tokenManager;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager allAuthKitAccounts](self, "allAuthKitAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Found %@ IDMS accounts for which PRK might need to be cleared.", buf, 0xCu);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v19 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0C8F230];
    v8 = *MEMORY[0x1E0C8F228];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isTokenCacheEnabled");

        if (v12)
        {
          tokenManager = self->_tokenManager;
          -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKAccountManager _credentialForAccount:](self, "_credentialForAccount:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:](tokenManager, "updateToken:identifier:altDSID:account:credential:error:", 0, v7, v14, v10, v15, 0);

          -[AKAccountManager _removeTokenKey:forAccount:](self, "_removeTokenKey:forAccount:", v8, v10);
        }
        else
        {
          v24[0] = v7;
          v24[1] = v8;
          v24[2] = CFSTR("password-reset-token-creation");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKAccountManager _removeTokenForKeys:forAccount:](self, "_removeTokenForKeys:forAccount:", v16, v10);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7080);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:](self, "_reportTokenWithTelemetryID:account:telemetryFlowID:error:", CFSTR("com.apple.authkit.token.prk.delete"), v10, 0, v17);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

}

- (void)removeContinuationTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  AKTokenManager *tokenManager;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  uint8_t buf[4];
  AKAccountManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "%@: Attempting to remove continuation key for account (%@)", buf, 0x16u);
  }

  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTokenCacheEnabled");

  if (v13)
  {
    tokenManager = self->_tokenManager;
    v15 = *MEMORY[0x1E0C8F198];
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _credentialForAccount:](self, "_credentialForAccount:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:](tokenManager, "updateToken:identifier:altDSID:account:credential:error:", 0, v15, v16, v8, v17, 0);

  }
  else
  {
    v18[0] = *MEMORY[0x1E0C8F198];
    v18[1] = CFSTR("continuation-key-creation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _removeTokenForKeys:forAccount:](self, "_removeTokenForKeys:forAccount:", v16, v8);
  }

  -[AKAccountManager _triggerSilentTTRFor:](self, "_triggerSilentTTRFor:", 1);
  -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:](self, "_reportTokenWithTelemetryID:account:telemetryFlowID:error:", CFSTR("com.apple.authkit.token.ck.delete"), v8, v10, v9);

}

- (id)_credentialForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  v6 = 0;
  objc_msgSend(v3, "credentialWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removePasswordResetTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  AKTokenManager *tokenManager;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  uint8_t buf[4];
  AKAccountManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "%@: Attempting to remove PRK for account (%@)", buf, 0x16u);
  }

  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTokenCacheEnabled");

  if (v13)
  {
    tokenManager = self->_tokenManager;
    v15 = *MEMORY[0x1E0C8F230];
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _credentialForAccount:](self, "_credentialForAccount:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:](tokenManager, "updateToken:identifier:altDSID:account:credential:error:", 0, v15, v16, v8, v17, 0);

  }
  else
  {
    v18[0] = *MEMORY[0x1E0C8F230];
    v18[1] = CFSTR("password-reset-token-creation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _removeTokenForKeys:forAccount:](self, "_removeTokenForKeys:forAccount:", v16, v8);
  }

  -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:](self, "_reportTokenWithTelemetryID:account:telemetryFlowID:error:", CFSTR("com.apple.authkit.token.prk.delete"), v8, v10, v9);
}

- (void)_removeTokenKey:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _removeTokenForKeys:forAccount:](self, "_removeTokenForKeys:forAccount:", v8, v7);
  }
  else
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKAccountManager _removeTokenKey:forAccount:].cold.1();
  }

}

- (void)_removeTokenForKeys:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  NSObject *v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  v34 = 0;
  v28 = 0;
  objc_msgSend(v7, "credentialWithError:", &v28);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v28;
  v10 = (void *)v30[5];
  v30[5] = v8;

  if (v30[5])
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v6;
      v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Clearing %{public}@ for account %@...", buf, 0x16u);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend((id)v30[5], "setCredentialItem:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v13);
    }

    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __51__AKAccountManager__removeTokenForKeys_forAccount___block_invoke;
    v21 = &unk_1E2E602A8;
    v16 = v7;
    v22 = v16;
    v23 = &v29;
    +[AKAccountManager performWithinPersonaForAccount:withBlock:](AKAccountManager, "performWithinPersonaForAccount:withBlock:", v16, &v18);
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v16, 0, v18, v19, v20, v21);
    v17 = v22;
  }
  else
  {
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Nil credential for account %@. Odd, but no clearing is necessary.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __51__AKAccountManager__removeTokenForKeys_forAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCredential:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_triggerSilentTTRFor:(unint64_t)a3
{
  NSObject *v3;

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AKAccountManager _triggerSilentTTRFor:].cold.1();

}

- (void)_reportTokenWithTelemetryID:(id)a3 account:(id)a4 telemetryFlowID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:].cold.3();

  +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "IDMSEnvironment");

  if (v16)
  {
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:].cold.2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF0E68], "ak_analyticsEventWithEventName:account:error:", v10, v11, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AKAccountManager securityLevelForAccount:](self, "securityLevelForAccount:", v11));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, CFSTR("securityLevel"));

    if (v12)
      -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CF0EE8]);
    if (objc_msgSend(CFSTR("com.apple.authkit.token.ck.delete"), "isEqualToString:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AKAccountManager deviceRemovalReasonForAccount:](self, "deviceRemovalReasonForAccount:", v11));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, CFSTR("deviceRemovalReason"));

    }
    +[AKAnalyticsReporterRTC rtcAnalyticsReporter](AKAnalyticsReporterRTC, "rtcAnalyticsReporter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendEvent:", v17);
    _AKLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:].cold.1();

  }
}

- (void)setAccount:(id)a3 inUse:(BOOL)a4 byService:(int64_t)a5
{
  id v8;
  NSObject *accountQueue;
  id v10;
  _QWORD block[4];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a3;
  accountQueue = self->_accountQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AKAccountManager_setAccount_inUse_byService___block_invoke;
  block[3] = &unk_1E2E602D0;
  v14 = a4;
  v12 = v8;
  v13 = a5;
  v10 = v8;
  dispatch_barrier_sync(accountQueue, block);

}

void __47__AKAccountManager_setAccount_inUse_byService___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:", CFSTR("retaining-services"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAccountProperty:forKey:", v5, CFSTR("retaining-services"));
}

- (id)servicesUsingAccount:(id)a3
{
  id v4;
  NSObject *accountQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  accountQueue = self->_accountQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AKAccountManager_servicesUsingAccount___block_invoke;
  v9[3] = &unk_1E2E602F8;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accountQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__AKAccountManager_servicesUsingAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:", CFSTR("retaining-services"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accountsUsingService:(int64_t)a3
{
  void *v5;
  NSObject *accountQueue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v11;
  int64_t v12;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accountQueue = self->_accountQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AKAccountManager_accountsUsingService___block_invoke;
  block[3] = &unk_1E2E60348;
  v11 = v5;
  v12 = a3;
  block[4] = self;
  v7 = v5;
  dispatch_sync(accountQueue, block);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

void __41__AKAccountManager_accountsUsingService___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "allAuthKitAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AKAccountManager_accountsUsingService___block_invoke_2;
  v5[3] = &unk_1E2E60320;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v6 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __41__AKAccountManager_accountsUsingService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "servicesUsingAccount:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)activeServiceNamesForAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[AKAccountManager servicesUsingAccount:](self, "servicesUsingAccount:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aaf_map:", &__block_literal_global_153_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __49__AKAccountManager_activeServiceNamesForAccount___block_invoke(uint64_t a1, void *a2)
{
  return +[AKAccountManager stringRepresentationForService:](AKAccountManager, "stringRepresentationForService:", objc_msgSend(a2, "integerValue"));
}

+ (id)stringRepresentationForService:(int64_t)a3
{
  __CFString *v3;
  __CFString **v4;
  id result;

  v3 = CFSTR("piggybacking");
  switch(a3)
  {
    case 1:
      v4 = AKServiceNameiCloud;
      goto LABEL_8;
    case 2:
      v4 = AKServiceNameiTunesStore;
      goto LABEL_8;
    case 4:
      v4 = AKServiceNameiMessage;
      goto LABEL_8;
    case 5:
      v4 = AKServiceNameFaceTime;
      goto LABEL_8;
    case 6:
      v4 = AKServiceNameGameCenter;
LABEL_8:
      v3 = *v4;
      goto LABEL_9;
    case 7:
LABEL_9:
      result = v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)hasPrimaryiCloudAccountForAppleID:(id)a3
{
  AKAccountManager *v3;
  void *v4;

  v3 = self;
  -[AKAccountManager iCloudAccountForAppleID:](self, "iCloudAccountForAppleID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[AKAccountManager isPrimaryiCloudAccount:](v3, "isPrimaryiCloudAccount:", v4);

  return (char)v3;
}

- (BOOL)hasPrimaryiCloudAccountForAltDSID:(id)a3
{
  AKAccountManager *v3;
  void *v4;

  v3 = self;
  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[AKAccountManager isPrimaryiCloudAccount:](v3, "isPrimaryiCloudAccount:", v4);

  return (char)v3;
}

- (BOOL)isPrimaryiCloudAccountEmailVerified:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("primaryEmailVerified"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAccountManager isPrimaryiCloudAccountEmailVerified:].cold.2();

    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }

  return v5;
}

- (id)transportableAuthKitAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTokenCacheEnabled");

  if (v7)
  {
    -[AKTokenManager synchronizedCredentialForAccount:](self->_tokenManager, "synchronizedCredentialForAccount:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCredential:", v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v5, "setAccountProperty:forKey:", v9, CFSTR("retaining-services"));

  objc_msgSend(v5, "setAccountProperty:forKey:", 0, CFSTR("telemetryDeviceSessionID"));
  return v5;
}

- (id)_aliasesForiCloudAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("appleIdAliases"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAccountManager _aliasesForiCloudAccount:].cold.1();

    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (BOOL)isFulliCloudAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("accountClass"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("full"));
  return v6;
}

- (id)_altDSIDForiCloudAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("altDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAccountManager _altDSIDForiCloudAccount:].cold.1();

    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (ACAccountType)appleIDAccountType
{
  ACAccountType *appleIDAccountType;
  AKAccountStore *accountStore;
  uint64_t v5;
  ACAccountType *v6;
  id v7;
  ACAccountType *v8;
  id v10;

  appleIDAccountType = self->_appleIDAccountType;
  if (!appleIDAccountType)
  {
    os_unfair_lock_lock(&self->_appleIDAccountTypeLock);
    if (!self->_appleIDAccountType)
    {
      accountStore = self->_accountStore;
      v5 = *MEMORY[0x1E0C8F048];
      v10 = 0;
      -[AKAccountStore accountTypeWithAccountTypeIdentifier:error:](accountStore, "accountTypeWithAccountTypeIdentifier:error:", v5, &v10);
      v6 = (ACAccountType *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v8 = self->_appleIDAccountType;
      self->_appleIDAccountType = v6;

    }
    os_unfair_lock_unlock(&self->_appleIDAccountTypeLock);
    appleIDAccountType = self->_appleIDAccountType;
  }
  return appleIDAccountType;
}

- (id)accountTypeForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_accountTypeCache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke;
      v7[3] = &unk_1E2E603D8;
      v7[4] = self;
      v8 = v4;
      os_unfair_lock_lock(&self->_accountTypeCacheLock);
      __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke((uint64_t)v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_accountTypeCacheLock);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = 0;
  objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:error:", v2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)setAdditionalInfo:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("additionalInfo"));

}

- (id)trustedPhoneNumbersForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("trustedPhoneNumbers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTrustedPhoneNumbers:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("trustedPhoneNumbers"));

}

- (id)securityKeysForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("securityKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSecurityKeys:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("securityKeys"));

}

- (id)loginHandlesForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("loginHandles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLoginHandles:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("loginHandles"));

}

- (void)_removeAllRawPasswordCaches
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager _iCloudAccounts](self, "_iCloudAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Found %@ iCloud accounts for which password cache might need to be cleared.", buf, 0xCu);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[AKAccountManager _clearRawPasswordForAccount:](self, "_clearRawPasswordForAccount:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_clearRawPasswordForAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  objc_msgSend(v3, "credentialWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *MEMORY[0x1E0C8F260];
  objc_msgSend(v4, "credentialItemForKey:", *MEMORY[0x1E0C8F260]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Found a cached raw password for %@... removing...", buf, 0xCu);
    }

    objc_msgSend(v4, "setCredentialItem:forKey:", 0, v6);
  }

}

- (void)setNextLivenessNonce:(id)a3 nonce:(id)a4
{
  objc_msgSend(a3, "setAccountProperty:forKey:", a4, CFSTR("nextLivenessNonce"));
}

- (id)nextLivenessNonce:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("nextLivenessNonce"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allAuthKitAccountsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v10 = 0;
  -[AKAccountManager authKitAccountTypeWithError:](self, "authKitAccountTypeWithError:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v8;
}

- (id)authKitAccountWithAltDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v25 = 0;
    -[AKAccountManager allAuthKitAccountsWithError:](self, "allAuthKitAccountsWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    v9 = v8;
    if (v8)
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = v7;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v16, "accountPropertyForKey:", CFSTR("altDSID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v6);

            if ((v18 & 1) != 0)
            {
              v10 = v16;

              goto LABEL_18;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v13)
            continue;
          break;
        }
      }

      v10 = 0;
LABEL_18:
      v7 = v20;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7025);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)authKitAccountWithAppleID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7022);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_23;
  }
  v27 = 0;
  -[AKAccountManager allAuthKitAccountsWithError:](self, "allAuthKitAccountsWithError:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = v8;
  if (v8)
  {
    if (!a4)
      goto LABEL_17;
    v10 = 0;
    *a4 = objc_retainAutorelease(v8);
    goto LABEL_22;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  v14 = *(_QWORD *)v24;
  v22 = v7;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v11);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v10, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v6);

      if (v17)
      {
        v19 = v10;
LABEL_21:

        v7 = v22;
        goto LABEL_22;
      }
      -[AKAccountManager aliasesForAccount:](self, "aliasesForAccount:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "containsObject:", v6))
      {
        v20 = v10;

        goto LABEL_21;
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    v7 = v22;
    if (v13)
      continue;
    break;
  }
LABEL_16:

LABEL_17:
  v10 = 0;
LABEL_22:

LABEL_23:
  return v10;
}

- (id)allAuthKitAccounts
{
  void *v3;
  void *v4;

  -[AKAccountManager authKitAccountType](self, "authKitAccountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authKitAccountWithDSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager allAuthKitAccounts](self, "allAuthKitAccounts");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "accountPropertyForKey:", CFSTR("DSID"), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)authKitAccountWithAppleID:(id)a3
{
  return -[AKAccountManager authKitAccountWithAppleID:error:](self, "authKitAccountWithAppleID:error:", a3, 0);
}

- (id)appleIDAccountWithAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager appleIDAccountType](self, "appleIDAccountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "accountPropertyForKey:", CFSTR("altDSID"), (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "accountPropertyForKey:", CFSTR("adsid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if ((v16 & 1) == 0)
            continue;
        }
        v17 = v12;
        goto LABEL_13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_13:

  return v17;
}

- (id)appleIDAccountWithAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager appleIDAccountType](self, "appleIDAccountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "username", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_matchingServiceAccountForAuthKitAccount:(id)a3 service:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  AKAccountManager *v17;
  id v18;

  v6 = a3;
  -[AKAccountManager _accountTypeForServiceType:](self, "_accountTypeForServiceType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AKAccountManager _fetchAllAccountsWithType:error:](self, "_fetchAllAccountsWithType:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__AKAccountManager__matchingServiceAccountForAuthKitAccount_service___block_invoke;
      v15[3] = &unk_1E2E60400;
      v16 = v9;
      v17 = self;
      v18 = v10;
      v11 = v10;
      v12 = v9;
      objc_msgSend(v8, "aaf_firstObjectPassingTest:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

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

  return v13;
}

uint64_t __69__AKAccountManager__matchingServiceAccountForAuthKitAccount_service___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "altDSIDForAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v3, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v6;
}

- (id)mostRecentlyUsedAuthKitAccount
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager allAuthKitAccounts](self, "allAuthKitAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(v3, "creationDate", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "creationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "compare:", v11);

        if (v12 == -1)
        {
          v13 = v9;

          v3 = v13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)iCloudAccountForAppleID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager _iCloudAccounts](self, "_iCloudAccounts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "username", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v14 = v10;
          goto LABEL_14;
        }
        -[AKAccountManager _aliasesForiCloudAccount:](self, "_aliasesForiCloudAccount:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v4))
        {
          v14 = v10;

          goto LABEL_14;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)iCloudAccountForAltDSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager _iCloudAccounts](self, "_iCloudAccounts");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[AKAccountManager _altDSIDForiCloudAccount:](self, "_altDSIDForiCloudAccount:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_fetchAllAccountsWithType:(id)a3 error:(id *)a4
{
  id v6;
  AKAccountStore *accountStore;
  void *v8;
  id v9;
  NSObject *v10;
  AKAccountStore *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  accountStore = self->_accountStore;
  v17 = 0;
  -[AKAccountStore accountsWithAccountType:options:error:](accountStore, "accountsWithAccountType:options:error:", v6, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (-[AKAccountStore isAccountDaemonConnectionError:](self->_accountStore, "isAccountDaemonConnectionError:", v9))
  {

    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "First attempt fetching accounts of type %@ failed, retrying once...", buf, 0xCu);
    }

    v11 = self->_accountStore;
    v16 = 0;
    -[AKAccountStore accountsWithAccountType:options:error:](v11, "accountsWithAccountType:options:error:", v6, 0, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v16;

    v8 = (void *)v12;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKAccountManager _fetchAllAccountsWithType:error:].cold.1();
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "Fetching accounts of type %@ succeeed!", buf, 0xCu);
  }

  return v8;
}

- (void)setAuthenticationMode:(unint64_t)a3 forAccount:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountProperty:forKey:", v7, CFSTR("auth-mode"));

  -[AKAccountManager updateAuthModeTimestampForAccount:](self, "updateAuthModeTimestampForAccount:", v6);
}

- (BOOL)shouldUpdateAuthModeForAccount:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("AuthModeTimeStamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Last Authentication mode fetch occured %@ seconds ago", (uint8_t *)&v11, 0xCu);

    }
    v9 = v6 >= 86400.0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)updateAuthModeTimestampForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountProperty:forKey:", v4, CFSTR("AuthModeTimeStamp"));

}

- (BOOL)isManagedAppleIDForAccount:(id)a3
{
  return -[AKAccountManager securityLevelForAccount:](self, "securityLevelForAccount:", a3) == 5;
}

- (unint64_t)managedOrganizationTypeForAccount:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("managedOrganizationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setManagedOrganizationType:(unint64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("managedOrganizationType"));

}

- (id)managedOrganizationNameForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("managedOrganizationName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setManagedOrganizationName:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("managedOrganizationName"));

}

- (BOOL)isNotificationEmailAvailableForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isNotificationEmailAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setIsNotificationEmailAvailable:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isNotificationEmailAvailable"));

}

- (id)notificationEmailForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("notificationEmail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setNotificationEmail:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("notificationEmail"));

}

- (BOOL)canBeCustodianForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("canBeCustodian"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setCanBeCustodian:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("canBeCustodian"));

}

- (void)setCanHaveCustodian:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("canHaveCustodian"));

}

- (BOOL)custodianEnabledForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("custodianEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setCustodianEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("custodianEnabled"));

}

- (id)custodianListVersionForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("custodianListVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCustodianListVersion:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("custodianListVersion"));

}

- (id)custodianLastModifiedForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("custodianLastModified"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCustodianLastModified:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("custodianLastModified"));

}

- (id)custodianInfosForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("custodianInfos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numberOfApprovedRecoveryContactsForAltDSID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[AKAccountManager authKitAccountWithAltDSID:](self, "authKitAccountWithAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager custodianInfosForAccount:](self, "custodianInfosForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aaf_filter:", &__block_literal_global_169);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

uint64_t __63__AKAccountManager_numberOfApprovedRecoveryContactsForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("APPROVED"));

  return v3;
}

- (void)setCustodianInfos:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("custodianInfos"));

}

- (id)beneficiaryInfoForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("beneficiaryInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBeneficiaryInfo:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("beneficiaryInfo"));

}

- (void)setBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("beneficiaryAccount"));

}

- (BOOL)canBeBeneficiaryForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("canBeBeneficiary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setCanBeBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("canBeBeneficiary"));

}

- (void)setCanHaveBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("canHaveBeneficiary"));

}

- (id)beneficiaryListVersionForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("beneficiaryListVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBeneficiaryListVersion:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("beneficiaryListVersion"));

}

- (id)beneficiaryLastModifiedForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("beneficiaryLastModified"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBeneficiaryLastModified:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("beneficiaryLastModified"));

}

- (BOOL)hasMDMForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("hasMDM"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setHasMDM:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("hasMDM"));

}

- (id)isSilentEscrowRecordRepairEnabledForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;

  v4 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceSilentEscrowRecordRepairEnabled");

  if (v6 == 1)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccount:].cold.2();

    self = (AKAccountManager *)MEMORY[0x1E0C9AAB0];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccount:].cold.1();

      self = (AKAccountManager *)MEMORY[0x1E0C9AAA0];
    }
  }
  else
  {
    -[AKAccountManager _isSilentEscrowRecordRepairEnabledForAccount:](self, "_isSilentEscrowRecordRepairEnabledForAccount:", v4);
    self = (AKAccountManager *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_isSilentEscrowRecordRepairEnabledForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("silentEscrowRecordRepairEnabled"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)setSilentEscrowRecordRepairEnabled:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("silentEscrowRecordRepairEnabled"));
  v13 = (void *)objc_msgSend(v12, "copy");
  -[AKAccountManager setAdditionalInfo:forAccount:](self, "setAdditionalInfo:forAccount:", v13, v7);

}

- (id)isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;

  v4 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceSilentEscrowRecordRepairEnabledV2");

  if (v6 == 1)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccountV2:].cold.2();

    self = (AKAccountManager *)MEMORY[0x1E0C9AAB0];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccountV2:].cold.1();

      self = (AKAccountManager *)MEMORY[0x1E0C9AAA0];
    }
  }
  else
  {
    -[AKAccountManager _isSilentEscrowRecordRepairEnabledForAccountV2:](self, "_isSilentEscrowRecordRepairEnabledForAccountV2:", v4);
    self = (AKAccountManager *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("silentEscrowRecordRepairEnabledV2"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("silentEscrowRecordRepairEnabledV2"));
  v13 = (void *)objc_msgSend(v12, "copy");
  -[AKAccountManager setAdditionalInfo:forAccount:](self, "setAdditionalInfo:forAccount:", v13, v7);

}

- (id)isSilentBurnCDPRepairEnabledForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;

  v4 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceSilentBurnCDPRepairEnabled");

  if (v6 == 1)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager isSilentBurnCDPRepairEnabledForAccount:].cold.2();

    self = (AKAccountManager *)MEMORY[0x1E0C9AAB0];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[AKAccountManager isSilentBurnCDPRepairEnabledForAccount:].cold.1();

      self = (AKAccountManager *)MEMORY[0x1E0C9AAA0];
    }
  }
  else
  {
    -[AKAccountManager _isSilentBurnCDPRepairEnabledForAccount:](self, "_isSilentBurnCDPRepairEnabledForAccount:", v4);
    self = (AKAccountManager *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_isSilentBurnCDPRepairEnabledForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("silenBurnMiniBuddyEnabled"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)setSilentBurnCDPRepairEnabled:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[AKAccountManager additionalInfoForAccount:](self, "additionalInfoForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("silenBurnMiniBuddyEnabled"));
  v13 = (void *)objc_msgSend(v12, "copy");
  -[AKAccountManager setAdditionalInfo:forAccount:](self, "setAdditionalInfo:forAccount:", v13, v7);

}

- (BOOL)isFidoForAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("fidoAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setFido:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("fidoAccount"));

}

- (unint64_t)signInPartitionForLivenessWithAltDSID:(id)a3
{
  void *v4;
  unint64_t v5;

  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  if (!-[AKAccountManager isPrimaryiCloudAccount:](self, "isPrimaryiCloudAccount:", v4))
  {
    if (-[AKAccountManager isFulliCloudAccount:](self, "isFulliCloudAccount:", v4))
    {
      v5 = 2;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = 1;
LABEL_7:

  return v5;
}

- (BOOL)isDataSeparatedAccountForAltDSID:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && (objc_msgSend(v3, "isDataSeparatedAccount") & 1) != 0;

  return v5;
}

- (id)personaUniqueStringForAltDSID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8EFD0];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasPersonaAvailableForAltDSID:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *UMUserManagerClass;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AKAccountManager iCloudAccountForAltDSID:](self, "iCloudAccountForAltDSID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Account has a persona id, checking for existence of persona.", buf, 2u);
    }

    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass)
      UMUserManagerClass = getUMUserManagerClass();
    objc_msgSend(UMUserManagerClass, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listAllPersonaWithAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAccountManager hasPersonaAvailableForAltDSID:].cold.1();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "userPersonaUniqueString", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v4);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v11) = 1;
            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_18:

  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)altDSIDForAuthKitAccountRequestingAuthorization
{
  void *v3;
  void *v4;

  -[AKAccountManager authKitAccountRequestingAuthorization](self, "authKitAccountRequestingAuthorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)authKitAccountRequestingAuthorization
{
  void *v3;
  void *v4;
  void *v5;

  -[AKAccountManager _iCloudAccountRequestingAuthorization](self, "_iCloudAccountRequestingAuthorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager altDSIDForAccount:](self, "altDSIDForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountManager authKitAccountWithAltDSID:](self, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_iCloudAccountRequestingAuthorization
{
  void *UMUserManagerClass;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t v13[16];
  uint8_t buf[16];

  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass)
    UMUserManagerClass = getUMUserManagerClass();
  objc_msgSend(UMUserManagerClass, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isDataSeparatedPersona");
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "DS:Persona requesting authorization is of Data Separated Type, we will find and give them the \"secondary\" iCloud Account.", buf, 2u);
    }

    objc_msgSend(v5, "userPersonaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAccountManager _iCloudAccountFromPersonaUniqueIdentifier:](self, "_iCloudAccountFromPersonaUniqueIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AKAccountManager _shouldBlockAuthorizationForPersona:](self, "_shouldBlockAuthorizationForPersona:", v5))
      v11 = 0;
    else
      v11 = v10;

  }
  else
  {
    if (v8)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "DS:Supports Data Separation but persona is not Data Separated - falling back to assuming primary iCloud account is desired.", v13, 2u);
    }

    -[AKAccountManager primaryiCloudAccount](self, "primaryiCloudAccount");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_iCloudAccountFromPersonaUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AKAccountManager _iCloudAccounts](self, "_iCloudAccounts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0C8EFD0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v9, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_shouldBlockAuthorizationForPersona:(id)a3
{
  int v4;
  void *v5;
  NSObject *v6;

  v4 = objc_msgSend(a3, "isDataSeparatedPersona");
  if (v4)
  {
    -[AKAccountManager primaryiCloudAccount](self, "primaryiCloudAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AKAccountManager isManagedAppleIDForAccount:](self, "isManagedAppleIDForAccount:", v5))
    {
      _AKLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AKAccountManager _shouldBlockAuthorizationForPersona:].cold.1();

      LOBYTE(v4) = 1;
    }
    else
    {

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)personaIDIfCurrentPersonaIsDataSeparated
{
  void *UMUserManagerClass;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass)
    UMUserManagerClass = getUMUserManagerClass();
  objc_msgSend(UMUserManagerClass, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEnterprisePersona") & 1) != 0 || objc_msgSend(v4, "isGuestPersona"))
  {
    objc_msgSend(v4, "userPersonaUniqueString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated].cold.1((uint64_t)v5, v4, v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4
{
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  void *UMUserManagerClass;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0C8EFD0];
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v8;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to perform block in persona: %@", buf, 0xCu);
  }

  if (v8 && objc_msgSend(v8, "length"))
  {
    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass)
      UMUserManagerClass = getUMUserManagerClass();
    objc_msgSend(UMUserManagerClass, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPersona");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    v13 = (void *)objc_msgSend(v12, "copyCurrentPersonaContextWithError:", &v33);
    v14 = v33;
    objc_msgSend(v5, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      _AKLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[AKAccountManager performWithinPersonaForAccount:withBlock:].cold.1();
      v16 = v14;
      goto LABEL_22;
    }
    objc_msgSend(v12, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_23;
    objc_msgSend(v16, "domain");
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v17, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v18 = objc_msgSend(v16, "code");

      if (v18 != 1)
        goto LABEL_14;
      _AKLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[AKAccountManager performWithinPersonaForAccount:withBlock:].cold.2();
    }

LABEL_14:
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v8;
      v36 = 2112;
      v37 = v15;
      v38 = 2112;
      v39 = v16;
      _os_log_error_impl(&dword_19202F000, v19, OS_LOG_TYPE_ERROR, "Failed to set persona ID (%@) context for account %@ with error %@", buf, 0x20u);
    }
LABEL_22:

    goto LABEL_23;
  }
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "No persona ID on account proceeding without setting context.", buf, 2u);
  }
  v13 = 0;
  v12 = 0;
  v16 = 0;
LABEL_23:

  _AKLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)UserManagementLibraryCore();
    if (v21)
      v21 = getUMUserManagerClass();
    objc_msgSend(v21, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentPersona");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userPersonaNickName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v24;
    _os_log_impl(&dword_19202F000, v20, OS_LOG_TYPE_DEFAULT, "Performing block within persona %@", buf, 0xCu);

  }
  v7[2](v7);

  if (v12 && v13 && !v16)
  {
    _AKLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v25, OS_LOG_TYPE_DEFAULT, "Restoring persona for current context", buf, 2u);
    }

    v26 = (id)objc_msgSend(v12, "restorePersonaWithSavedPersonaContext:", v13);
    _AKLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v27, OS_LOG_TYPE_DEFAULT, "Restored persona for current context", buf, 2u);
    }

  }
  _AKLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)UserManagementLibraryCore();
    if (v29)
      v29 = getUMUserManagerClass();
    objc_msgSend(v29, "sharedManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentPersona");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "userPersonaNickName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v32;
    _os_log_impl(&dword_19202F000, v28, OS_LOG_TYPE_DEFAULT, "Performed block within persona %@", buf, 0xCu);

  }
}

- (void)setPasskeyEligible:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("passkeyEligible"));

}

- (id)passkeyEligibleForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passkeyEligible"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPasskeyPresent:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("passkeyPresent"));

}

- (id)passkeyPresentForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passkeyPresent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPasskeysInKeychainCount:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("passkeysCount"));

}

- (id)passkeysInKeychainCountForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passkeysCount"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPasskeyRegistrationAttemptDateForAccount:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("passkeyRegistrationAttemptDate"));

}

- (id)passkeyRegistrationAttemptDateForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passkeyRegistrationAttemptDate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPasskeysDeletionAttemptDate:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("passkeysDeletionAttemptDate"));

}

- (id)passkeysDeletionAttemptDateForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passkeysDeletionAttemptDate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)groupKitEligibilityForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("groupkitEligibilityInd"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setGroupKitEligibility:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("groupkitEligibilityInd"));

}

- (void)setPasscodeAuthEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("passcodeAuthEnabled"));

}

- (BOOL)isPasscodeAuthEnabledForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("passcodeAuthEnabled"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (void)setPasscodeAuth:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("isPasscodeAuth"));

}

- (BOOL)isPasscodeAuthForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("isPasscodeAuth"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (void)setAskToBuy:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", v6, CFSTR("askToBuy"));

}

- (BOOL)isAskToBuyForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("askToBuy"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)deviceListVersionForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("deviceListVersion"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setDeviceListVersion:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("deviceListVersion"));

}

- (id)deletedDevicesCacheExpiryOffsetForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("deletedDevicesCacheExpiryOffset"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setDeletedDevicesCacheExpiryOffset:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("deletedDevicesCacheExpiryOffset"));

}

- (id)birthYearForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("yob"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setBirthYear:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("yob"));

}

- (void)setADPCohort:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ((objc_msgSend(v6, "intValue") & 0x80000000) != 0 || (int)objc_msgSend(v6, "intValue") >= 11)
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[AKAccountManager setADPCohort:forAccount:].cold.1((uint64_t)self, v6, v8);

    }
    else
    {
      objc_msgSend(v7, "setAccountProperty:forKey:", v6, CFSTR("adpCh"));
    }
  }

}

- (id)activeiCloudPrivateEmailCountForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("activeHMECount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inactiveiCloudPrivateEmailCountForAccount:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("inActiveHMECount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeiCloudPrivateEmailCount
{
  void *v3;
  void *v4;

  -[AKAccountManager primaryAuthKitAccount](self, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager activeiCloudPrivateEmailCountForAccount:](self, "activeiCloudPrivateEmailCountForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inactiveiCloudPrivateEmailCount
{
  void *v3;
  void *v4;

  -[AKAccountManager primaryAuthKitAccount](self, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager inactiveiCloudPrivateEmailCountForAccount:](self, "inactiveiCloudPrivateEmailCountForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSharingGroupLastNotificationDate:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("signInWithAppleSharingGroupLastNotificationDate"));

}

- (id)sharingGroupLastNotificationDateForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("signInWithAppleSharingGroupLastNotificationDate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setAccountProperty:forKey:", v5, CFSTR("previousAccountInfoRefreshDate"));

}

- (id)previousAccountInfoRefreshDateForAccount:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("previousAccountInfoRefreshDate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (ACAccountStore)store
{
  return &self->_accountStore->super;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (ACAccountType)iTunesAccountType
{
  return self->_iTunesAccountType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTypeCache, 0);
  objc_storeStrong((id *)&self->_iTunesAccountType, 0);
  objc_storeStrong((id *)&self->_iCloudAccountType, 0);
  objc_storeStrong((id *)&self->_appleIDAccountType, 0);
  objc_storeStrong((id *)&self->_authKitAccountType, 0);
  objc_storeStrong((id *)&self->_tokenManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)altDSIDForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)telemetryDeviceSessionIDForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Attempting to fetch device session ID without an account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)telemetryDeviceSessionIDForAccount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Client is attempting to access session identifier without opt-in!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setAccountAccessTelemetryOptIn:forAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Successfully set account telemetry opt-in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setAccountAccessTelemetryOptIn:forAccount:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Failed to set account telemetry opt-in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setAltDSID:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Will not allow nil altDSID to be set!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setDSID:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Will not allow nil DSID to be set!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setDSID:(uint64_t)a1 forAccount:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "DSID *must* be an NSNumber, but we got: %@", v5, 0xCu);

  OUTLINED_FUNCTION_13();
}

- (void)primaryEmailAddressForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching primary email address: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setPrimaryEmailAddress:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exeption caught when setting primery email address: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)verifiedPrimaryEmailForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching primary verified email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setVerifiedPrimaryEmail:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting primary verified email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)phoneAsAppleIDForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching phone as AppleID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userUnderAgeForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching underage property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setUserUnderage:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting underage property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isSiwaEnabledForChildAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching SiwA enabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setIsSiwaEnabled:forChildAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting SiwA enabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userIsSeniorForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching isSenior property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setUserIsSenior:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting isSenior property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)demoAccountForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching demoAccount property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDemoAccount:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting demoAccount property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ageOfMajorityForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching ageOfMajority property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAgeOfMajority:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting ageOfMajority property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)appleIDCountryCodeForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching Apple ID country code property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAppleIDCountryCode:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting Apple ID country code property %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)authorizationUsedForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching authorization used: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAuthorizationUsed:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting authorization used: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)privateAttestationEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching private attestation enabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setPrivateAttestationEnabled:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting private attestation enabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProximityAuthEligible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching proximity auth eligible enabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setIsProximityAuthEligible:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting proximity auth eligible enabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)piggybackingApprovalEligible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching pbae: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setPiggybackingApprovalEligible:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting pbae: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reachableEmailAddressesForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching reachable emails: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setReachableEmailAddresses:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting reachable emails: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)givenNameForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching given name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setGivenName:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exeption caught when setting given name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)familyNameForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching family name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setFamilyName:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting last name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)forwardingEmailForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching forwarding email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setForwardingEmail:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting forwarding email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectedPrivateEmailForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching private email selected: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSelectedPrivateEmail:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting private email selection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectedAuthorizationEmailForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching slected email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSelectedAuthorizationEmail:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting selected email: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveAccount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Could not save %@ due to %@");
  OUTLINED_FUNCTION_1();
}

- (void)_saveAccount:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught while saving account: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceRemovalReason:(uint64_t)a1 onAccount:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v2, v3, "Failed to setDeviceRemovalReason to: %ld. Exception:\n%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceRemovalReason:onAccount:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "AKAccountManager setDeviceRemovalReason, there is already a removal reason set! Old reason: %ld. New reason: %ld", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)clearDeviceRemovalReasonFromAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to clearDeviceRemovalReasonFromAccount. Exception:\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deviceRemovalReasonForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to get deviceRemovalReasonForAccount. Exception caught: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasSOSActiveDeviceForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching hasSOSActiveDevice property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHasSOSActiveDevice:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting hasSOSActiveDevice property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isSOSNeededForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching SOSNeeded property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSOSNeeded:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting SOSNeeded property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasModernRecoveryKeyForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching hasModernRecoveryKey property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHasModernRecoveryKey:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting hasModernRecoveryKey property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)get3PRegulatoryOverride:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching AK3PRegulatoryOverride property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)set3PRegulatoryOverride:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting AK3PRegulatoryOverride property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)adpCohortForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching adpCohort property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Nil account cannot possibly have a %@ token creation date!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Token creation key not found. Skipping fetching token creation date.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "Fetching token creation date: %@ for account %@");
  OUTLINED_FUNCTION_1();
}

- (void)setToken:tokenID:account:credential:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to save account with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Credential is nil, skip token creation time update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Token creation key not found. Skipping token creation time update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Valid CK exists - Ignoring server response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Token creation time is not enabled. Skipping token creation time update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_tokenWithName:forAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Nil account cannot possibly have a %@ token!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_tokenWithName:forAccount:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "AuthKit credential is completely MIA! Account: %@. Fetch error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_tokenWithName:forAccount:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "Fetching token: %@ for account %@");
  OUTLINED_FUNCTION_1();
}

- (void)_reportTokenWithName:forAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Reporting not supported for token - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_isAccountEligibleForSecurityUpgrade:(uint64_t)a1 ofServiceType:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v2, v3, "There is no matching service account for service type (%li). (%@) may be abandoned authkit account, but still on device.", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

- (void)_isAccountEligibleForSecurityUpgrade:ofServiceType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "AuthKit account (%@) that is not an SA account is not eligible for security upgrade.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_removeTokenKey:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Attempted to remove a token for nil key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_triggerSilentTTRFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "SilentTTR not triggered - supported only on TvOS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "Finish reporting %@ for account: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Reporting  %@ is not supported for non-prod environments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "Begin reporting %@ for account: %@");
  OUTLINED_FUNCTION_1();
}

- (void)isPrimaryiCloudAccount:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Invalid type for value of primaryAccount account property: %@. Account: %@");
  OUTLINED_FUNCTION_1();
}

- (void)isPrimaryiCloudAccountEmailVerified:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = CFSTR("primaryEmailVerified");
  OUTLINED_FUNCTION_11_0();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_19202F000, v2, OS_LOG_TYPE_ERROR, "Invalid type for value of %@ account property: %@. Account: %@", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_13();
}

- (void)_aliasesForiCloudAccount:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Invalid type for value of appleIdAliases %@. Account: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_altDSIDForiCloudAccount:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Invalid type for altDSID %@. Account: %@");
  OUTLINED_FUNCTION_1();
}

- (void)trustedPhoneNumbersForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching trusted phone numbers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setTrustedPhoneNumbers:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting trusted phone numbers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)securityKeysForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching security keys: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSecurityKeys:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting security keys: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loginHandlesForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching login handles: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setLoginHandles:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting login handles: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)nextLivenessNonce:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching nextLivenessNonce: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchAllAccountsWithType:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Could not fetch accounts of type %@ due to %@");
  OUTLINED_FUNCTION_1();
}

- (void)isNotificationEmailAvailableForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching isNotificationEmailAvailable property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setIsNotificationEmailAvailable:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting isNotificationEmailAvailable: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canBeCustodianForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching canBeCustodian property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCanBeCustodian:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting canBeCustodian: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canHaveCustodianForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching canHaveCustodian property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCanHaveCustodian:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting canHaveCustodian: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)custodianEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching custodianEnabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCustodianEnabled:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting custodianEnabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)custodianListVersionForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching custodianListVersion property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCustodianListVersion:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting custodianListVersion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)custodianLastModifiedForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching custodianLastModified property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCustodianLastModified:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting custodianLastModified: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)custodianInfosForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching custodianInfos property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCustodianInfos:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting custodianInfos: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beneficiaryInfoForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching beneficiaryInfo property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setBeneficiaryInfo:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting beneficiaryInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isBeneficiaryForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching beneficiary property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setBeneficiary:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting beneficiary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canBeBeneficiaryForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching canBeBeneficiary property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCanBeBeneficiary:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting canBeBeneficiary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canHaveBeneficiaryForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching canHaveBeneficiary property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCanHaveBeneficiary:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting canHaveBeneficiary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beneficiaryListVersionForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching beneficiaryListVersion property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setBeneficiaryListVersion:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting beneficiaryListVersion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beneficiaryLastModifiedForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching beneficaryLastModified property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setBeneficiaryLastModified:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting beneficaryLastModified: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasMDMForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching hasMDMForAccount property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHasMDM:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting hasMDMForAccount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isSilentEscrowRecordRepairEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent escrow record repair is force disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isSilentEscrowRecordRepairEnabledForAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent escrow record repair is force enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_isSilentEscrowRecordRepairEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching silentEscrowRecordRepairEnabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSilentEscrowRecordRepairEnabled:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting silentEscrowRecordRepairDisabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isSilentEscrowRecordRepairEnabledForAccountV2:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent escrow record repair V2 is force disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isSilentEscrowRecordRepairEnabledForAccountV2:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent escrow record repair V2 is force enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_isSilentEscrowRecordRepairEnabledForAccountV2:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching silentEscrowRecordRepairEnabledV2 property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSilentEscrowRecordRepairEnabledV2:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting silentEscrowRecordRepairEnabledV2 property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isSilentBurnCDPRepairEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent burn in mini-buddy is force disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isSilentBurnCDPRepairEnabledForAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Silent burn in mini-buddy is force enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_isSilentBurnCDPRepairEnabledForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching silenBurnCDPRepairEnabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSilentBurnCDPRepairEnabled:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting silenBurnCDPRepairEnabled property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isFidoForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching fido property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setFido:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting fido property: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasPersonaAvailableForAltDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "personaAttributes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldBlockAuthorizationForPersona:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "DS: Data Separated account is requesting authorization while primary account is already enteprise! Show Error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)personaIDIfCurrentPersonaIsDataSeparated
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "userPersonaNickName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2048;
  v12 = objc_msgSend(a2, "userPersonaType");
  _os_log_debug_impl(&dword_19202F000, a3, OS_LOG_TYPE_DEBUG, "Running within data separated persona. {uniqueString=%{public}@, nickname=%@, type=%ld}", (uint8_t *)&v7, 0x20u);

}

+ (void)performWithinPersonaForAccount:withBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Could not get current persona context for account %@, with error %@");
  OUTLINED_FUNCTION_1();
}

+ (void)performWithinPersonaForAccount:withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "This process needs entitlement com.apple.usermanagerd.persona.background", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setADPCohort:(NSObject *)a3 forAccount:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "intValue");
  _os_log_fault_impl(&dword_19202F000, a3, OS_LOG_TYPE_FAULT, "%@: ADP cohort value %d obtained from IdMS outside the allowed range, rejected.", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_13();
}

- (void)activeiCloudPrivateEmailCountForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting activeiCloudPrivateEmailCount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)inactiveiCloudPrivateEmailCountForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting inactiveiCloudPrivateEmailCount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSharingGroupLastNotificationDate:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when setting sharingGroupLastNotificationDate : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sharingGroupLastNotificationDateForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Exception caught when fetching sharingGroupLastNotificationDate : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
