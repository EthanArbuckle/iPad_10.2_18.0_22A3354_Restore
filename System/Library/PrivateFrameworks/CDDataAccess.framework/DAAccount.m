@implementation DAAccount

- (NSString)accountID
{
  return -[ACAccount identifier](self->_backingAccountInfo, "identifier");
}

- (void)dealloc
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  __CFURLStorageSession *storageSession;
  objc_super v7;
  uint8_t buf[4];
  DAAccount *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "DAAccount %p is going away...", buf, 0xCu);
  }

  +[DAAccountMonitor sharedMonitor](DAAccountMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unmonitorAccount:", self);

  -[DATaskManager shutdown](self->_taskManager, "shutdown");
  storageSession = self->_storageSession;
  if (storageSession)
  {
    CFRelease(storageSession);
    self->_storageSession = 0;
  }
  -[DAAccount removeXpcActivity](self, "removeXpcActivity");
  v7.receiver = self;
  v7.super_class = (Class)DAAccount;
  -[DAAccount dealloc](&v7, sel_dealloc);
}

- (int)daAccountVersion
{
  return -[DAAccount accountIntPropertyForKey:](self, "accountIntPropertyForKey:", CFSTR("DAAccountVersion2"));
}

- (BOOL)isDisabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ACAccount enabledDataclasses](self->_backingAccountInfo, "enabledDataclasses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((-[ACAccount isEnabledToSyncDataclass:](self->_backingAccountInfo, "isEnabledToSyncDataclass:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (NSString)accountDescription
{
  void *v2;
  void *v3;

  -[ACAccount displayAccount](self->_backingAccountInfo, "displayAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (DAAccount)initWithBackingAccountInfo:(id)a3
{
  id v5;
  DAAccount *v6;
  DAAccount *v7;
  DATrustHandler *v8;
  DATrustHandler *trustHandler;
  void *v10;
  const __CFUUID *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAAccount;
  v6 = -[DAAccount init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingAccountInfo, a3);
    v8 = -[DATrustHandler initWithDelegate:]([DATrustHandler alloc], "initWithDelegate:", v7);
    trustHandler = v7->_trustHandler;
    v7->_trustHandler = v8;

    -[DAAccount resetStatusReport](v7, "resetStatusReport");
    -[DAAccount persistentUUID](v7, "persistentUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = CFUUIDCreate(0);
      v12 = (__CFString *)CFUUIDCreateString(0, v11);
      CFRelease(v11);
      -[DAAccount _setPersistentUUID:](v7, "_setPersistentUUID:", v12);

    }
    -[DAAccount ingestBackingAccountInfoProperties](v7, "ingestBackingAccountInfoProperties");
    +[DAAccountMonitor sharedMonitor](DAAccountMonitor, "sharedMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "monitorAccount:", v7);

    *(_WORD *)&v7->_hasInitted = 257;
  }

  return v7;
}

+ (id)daAccountSubclassWithBackingAccountInfo:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = a3;
  +[DAAccountLoader sharedInstance](DAAccountLoader, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_msgSend(v4, "daemonAppropriateAccountClassForACAccount:", v3);

  v6 = (void *)objc_msgSend([v5 alloc], "initWithBackingAccountInfo:", v3);
  return v6;
}

- (void)setDAAccountVersion:(int)a3
{
  -[DAAccount setAccountIntProperty:forKey:](self, "setAccountIntProperty:forKey:", *(_QWORD *)&a3, CFSTR("DAAccountVersion2"));
}

- (BOOL)upgradeAccount
{
  -[DAAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("DAAccountUseTrustedSSLCertificate"));
  return 1;
}

- (void)resetAccountID
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccount.m"), 227, CFSTR("We shouldn't be resetting our account id, ever"));

}

- (NSString)scheduleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DAAccount persistentUUID](self, "persistentUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (void)_setPersistentUUID:(id)a3
{
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, CFSTR("DAAccountPersistentUUID"));
}

- (NSString)changeTrackingID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DAAccount persistentUUID](self, "persistentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.caldavsyncd-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAccountDescription:(id)a3
{
  ACAccount *backingAccountInfo;
  id v4;
  id v5;

  backingAccountInfo = self->_backingAccountInfo;
  v4 = a3;
  -[ACAccount displayAccount](backingAccountInfo, "displayAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountDescription:", v4);

}

- (NSString)username
{
  return -[ACAccount username](self->_backingAccountInfo, "username");
}

- (void)setUsername:(id)a3
{
  -[ACAccount setUsername:](self->_backingAccountInfo, "setUsername:", a3);
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  return -[ACAccount isEnabledForDataclass:](self->_backingAccountInfo, "isEnabledForDataclass:", a3);
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  -[ACAccount setEnabled:forDataclass:](self->_backingAccountInfo, "setEnabled:forDataclass:", a3, a4);
}

- (BOOL)enabledForAnyDADataclasses:(int64_t)a3
{
  return (a3 & 0x10) != 0 && -[DAAccount enabledForDADataclass:](self, "enabledForDADataclass:", 16);
}

- (BOOL)enabledForDADataclass:(int64_t)a3
{
  ACAccount *backingAccountInfo;
  void *v4;

  backingAccountInfo = self->_backingAccountInfo;
  acDataclassForDADataclass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(backingAccountInfo) = -[ACAccount isEnabledForDataclass:](backingAccountInfo, "isEnabledForDataclass:", v4);

  return (char)backingAccountInfo;
}

- (void)setEnabled:(BOOL)a3 forDADataclass:(int64_t)a4
{
  _BOOL8 v5;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ACAccount *backingAccountInfo;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    -[DAAccount displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount accountID](self, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1C1CD1000, v7, v8, "Account \"%@\" (%@) was toggled for a dataclass. Giving it another chance with the babysitter.", (uint8_t *)&v15, 0x16u);

  }
  +[DABabysitter sharedBabysitter](DABabysitter, "sharedBabysitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount accountID](self, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "giveAccountWithIDAnotherChance:", v12);

  backingAccountInfo = self->_backingAccountInfo;
  acDataclassForDADataclass(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setEnabled:forDataclass:](backingAccountInfo, "setEnabled:forDataclass:", v5, v14);

}

- (int64_t)enabledDataclassesBitmask
{
  void *v2;
  int64_t v3;

  -[ACAccount enabledDataclasses](self->_backingAccountInfo, "enabledDataclasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = daDataclassesForACDataclasses(v2);

  return v3;
}

- (id)dataclassProperties
{
  return (id)-[ACAccount dataclassProperties](self->_backingAccountInfo, "dataclassProperties");
}

- (id)spinnerIdentifiers
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountProperty:forKey:", v7, v6);

}

- (void)removeAccountPropertyForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountProperty:forKey:", 0, v4);

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountProperty:forKey:", v7, v6);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accountBoolPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (void)setAccountBoolProperty:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (int)accountIntPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (void)setAccountIntProperty:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)resumeMonitoringFoldersWithIDs:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

}

- (void)suspendMonitoringFoldersWithIDs:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  int v7;
  const char *Name;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    Name = sel_getName(a2);
    v9 = 2112;
    v10 = (id)objc_opt_class();
    v6 = v10;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)stopMonitoringFolderWithID:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  int v7;
  const char *Name;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    Name = sel_getName(a2);
    v9 = 2112;
    v10 = (id)objc_opt_class();
    v6 = v10;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);

  }
}

- (id)stateString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[DAAccount waiterID](self, "waiterID");
  else
    -[DAAccount accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DABabysitter sharedBabysitter](DABabysitter, "sharedBabysitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accountWithIDShouldContinue:", v3);
  -[DAAccount statusReport](self, "statusReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSyncingAllowed:", v5);

  -[DAAccount protocolVersion](self, "protocolVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount statusReport](self, "statusReport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtocolVersion:", v7);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[DAAccount accountID](self, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount statusReport](self, "statusReport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager stateString](self->_taskManager, "stateString");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("No Task Manager initted yet");
  if (v13)
    v15 = (const __CFString *)v13;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("AccountID: %@ (\"%@\")\nStats %@\n%@"), v10, v11, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setConsumer:(id)a3 forTask:(id)a4
{
  id v6;
  id v7;
  NSMapTable *consumers;
  NSMapTable *v9;
  NSMapTable *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSUInteger v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  DAAccount *v19;
  __int16 v20;
  NSUInteger v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  consumers = self->_consumers;
  if (!consumers)
  {
    v9 = (NSMapTable *)objc_opt_new();
    v10 = self->_consumers;
    self->_consumers = v9;

    consumers = self->_consumers;
  }
  -[NSMapTable setObject:forKey:](consumers, "setObject:forKey:", v6, v7);
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = -[NSMapTable count](self->_consumers, "count");
    v14 = 134218752;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2048;
    v19 = self;
    v20 = 2048;
    v21 = v13;
    _os_log_impl(&dword_1C1CD1000, v11, v12, "Added consumer %p for task %p to DAAccount %p, count: %lu", (uint8_t *)&v14, 0x2Au);
  }

}

- (id)consumerForTask:(id)a3
{
  return -[NSMapTable objectForKey:](self->_consumers, "objectForKey:", a3);
}

- (void)removeConsumerForTask:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  NSUInteger v7;
  int v8;
  id v9;
  __int16 v10;
  DAAccount *v11;
  __int16 v12;
  NSUInteger v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_consumers, "removeObjectForKey:", v4);
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = -[NSMapTable count](self->_consumers, "count");
    v8 = 134218496;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Removed consumer for task %p from DAAccount %p, count: %lu", (uint8_t *)&v8, 0x20u);
  }

}

- (NSString)clientToken
{
  void *v2;
  void *v3;

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)clientTokenRequestedByServer
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[DAAccount clientToken](self, "clientToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "da_newGUID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addClientToken:", v6);

  }
}

- (id)passwordWithExpected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ACAccount credential](self->_backingAccountInfo, "credential", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (-[DAAccount accountBoolPropertyForKey:](self, "accountBoolPropertyForKey:", CFSTR("DAAcountWasUpgradedFromLegacyAccount")))
    {
      +[DAKeychain sharedKeychain](DAKeychain, "sharedKeychain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "migratePasswordForAccount:", self);

      -[DAAccount setAccountBoolProperty:forKey:](self, "setAccountBoolProperty:forKey:", 0, CFSTR("DAAcountWasUpgradedFromLegacyAccount"));
      -[ACAccount credential](self->_backingAccountInfo, "credential");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "password");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (NSString)password
{
  void *v3;
  void *v4;

  -[DAAccount identityPersist](self, "identityPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount passwordWithExpected:](self, "passwordWithExpected:", v3 == 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setPassword:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  -[ACAccount credential](self->_backingAccountInfo, "credential");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      -[NSObject setPassword:](v6, "setPassword:", v4);
    }
    else
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v4);
      -[ACAccount setCredential:](self->_backingAccountInfo, "setCredential:", v7);
    }
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v9, v10))
    {
      -[ACAccount identifier](self->_backingAccountInfo, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACAccount username](self->_backingAccountInfo, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1C1CD1000, v9, v10, "Calling _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v13, 0x16u);

    }
    -[ACAccount setAuthenticated:](self->_backingAccountInfo, "setAuthenticated:", 1);
  }
  else
  {
    -[NSObject setPassword:](v6, "setPassword:", 0);

    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1C1CD1000, v7, v8, "Someone wanted to set a nil password, we're editing the live ACAccountCredential", (uint8_t *)&v13, 2u);
    }
  }

}

- (id)urlFromDataclassPropertiesForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  DAAccount *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *dataclassPropertyURLsByDataclass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataclassProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if (!self->_dataclassPropertyURLsByDataclass)
    {
      v9 = self;
      objc_sync_enter(v9);
      if (!self->_dataclassPropertyURLsByDataclass)
      {
        v10 = (NSMutableDictionary *)objc_opt_new();
        dataclassPropertyURLsByDataclass = self->_dataclassPropertyURLsByDataclass;
        self->_dataclassPropertyURLsByDataclass = v10;

      }
      objc_sync_exit(v9);

    }
    -[DAAccount dataclassPropertyURLsByDataclass](self, "dataclassPropertyURLsByDataclass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v12);
    -[DAAccount dataclassPropertyURLsByDataclass](self, "dataclassPropertyURLsByDataclass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[DAAccount backingAccountInfo](self, "backingAccountInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parentAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataclassProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("url")),
            (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
        || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            !v14))
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[DAAccount dataclassPropertyURLsByDataclass](self, "dataclassPropertyURLsByDataclass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v4);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v14 = 0;
    }
    objc_sync_exit(v12);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)hostFromDataclassPropertiesForDataclass:(id)a3
{
  void *v3;
  void *v4;

  -[DAAccount urlFromDataclassPropertiesForDataclass:](self, "urlFromDataclassPropertiesForDataclass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)useSSLFromDataclassPropertiesForDataclass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[DAAccount urlFromDataclassPropertiesForDataclass:](self, "urlFromDataclassPropertiesForDataclass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("https"));

  return v6;
}

- (int64_t)portFromDataclassPropertiesForDataclass:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[DAAccount urlFromDataclassPropertiesForDataclass:](self, "urlFromDataclassPropertiesForDataclass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "port");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (id)domainOnly
{
  return 0;
}

- (NSString)host
{
  return (NSString *)-[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
}

- (void)setHost:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    -[DAAccount host](self, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Changing Host From %@ to %@", (uint8_t *)&v8, 0x16u);

  }
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("DAAccountHost"));

}

- (BOOL)useSSL
{
  void *v2;
  void *v3;
  char v4;

  -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setUseSSL:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("DAAccountUseSSL"));

}

- (NSString)emailAddress
{
  return (NSString *)-[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress"));
}

- (void)setEmailAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("DAAccountEmailAddress"));
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("ACUIDisplayUsername"));

}

- (NSArray)emailAddresses
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[DAAccount emailAddress](self, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)accountContainsEmailAddress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[DAAccount emailAddresses](self, "emailAddresses", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(v4, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSData)signingIdentityPersistentReference
{
  return (NSData *)-[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DASigningIdentityPersistentReference"));
}

- (void)setSigningIdentityPersistentReference:(id)a3
{
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, CFSTR("DASigningIdentityPersistentReference"));
}

- (NSData)encryptionIdentityPersistentReference
{
  return (NSData *)-[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAEncryptionIdentityPersistentReference"));
}

- (void)setEncryptionIdentityPersistentReference:(id)a3
{
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, CFSTR("DAEncryptionIdentityPersistentReference"));
}

- (int64_t)port
{
  void *v2;
  int64_t v3;

  -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPort:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("DAAccountPort"));

}

- (NSString)principalPath
{
  void *v2;
  void *v3;

  -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountPrincipalPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "da_appendSlashIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPrincipalPath:(id)a3
{
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, CFSTR("DAAccountPrincipalPath"));
}

- (NSString)scheme
{
  if (-[DAAccount useSSL](self, "useSSL"))
    return (NSString *)CFSTR("https");
  else
    return (NSString *)CFSTR("http");
}

- (NSURL)principalURL
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[DAAccount scheme](self, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DAAccount port](self, "port");
  -[DAAccount principalPath](self, "principalPath");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("/");
  objc_msgSend(v3, "da_URLWithScheme:host:port:uri:", v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (void)setPrincipalURL:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v15, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount setUseSSL:](self, "setUseSSL:", objc_msgSend(v6, "isEqualToString:", CFSTR("http")) ^ 1);

  }
  objc_msgSend(v15, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v15, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount setHost:](self, "setHost:", v9);

  }
  objc_msgSend(v15, "port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v15, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount setPort:](self, "setPort:", objc_msgSend(v11, "integerValue"));

  }
  objc_msgSend(v15, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("/");
  -[DAAccount setPrincipalPath:](self, "setPrincipalPath:", v14);

}

- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  dataaccess_get_global_queue();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount checkValidityOnAccountStore:withConsumer:inQueue:](self, "checkValidityOnAccountStore:withConsumer:inQueue:", v7, v6, v8);

}

- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4 inQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[DAAccount setIsValidating:](self, "setIsValidating:", 1);
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke;
  v14[3] = &unk_1E7B921E8;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v10, "verifyCredentialsForAccount:saveWhenAuthorized:withHandler:", v11, 0, v14);

}

void __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  dataaccess_get_global_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_2;
  block[3] = &unk_1E7B921C0;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setIsValidating:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "backingAccountInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "takeValuesFromModifiedAccount:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "removeFromCoreDAVLoggingDelegates");
    objc_msgSend(*(id *)(a1 + 32), "ingestBackingAccountInfoProperties");
    objc_msgSend(*(id *)(a1 + 32), "addToCoreDAVLoggingDelegates");
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_3;
  block[3] = &unk_1E7B92198;
  v3 = *(NSObject **)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 64);
  dispatch_async(v3, block);

}

uint64_t __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "account:isValid:validationError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) == 0);
}

- (BOOL)saveModifiedPropertiesOnBackingAccount
{
  return 0;
}

- (void)discoverInitialPropertiesWithConsumer:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

}

- (BOOL)autodiscoverAccountConfigurationWithConsumer:(id)a3
{
  return 0;
}

- (BOOL)shouldDoInitialAutodiscovery
{
  return !-[DAAccount accountBoolPropertyForKey:](self, "accountBoolPropertyForKey:", CFSTR("DAAccountDidAutodiscover"));
}

- (void)setShouldDoInitialAutodiscovery:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("DAAccountDidAutodiscover"));

}

- (BOOL)shouldAutodiscoverAccountProperties
{
  char v3;
  void *v4;
  void *v5;

  if (-[DAAccount shouldDoInitialAutodiscovery](self, "shouldDoInitialAutodiscovery"))
    return 1;
  -[DAAccount principalPath](self, "principalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[DAAccount principalPath](self, "principalPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("/"));

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (id)onBehalfOfBundleIdentifier
{
  void *v4;
  const char *Name;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Name = sel_getName(a2);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccount.m"), 715, CFSTR("%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@"), Name, objc_opt_class());

  return 0;
}

- (BOOL)shouldRemoveDBSyncDataOnAccountChange
{
  void *v2;
  void *v3;

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 == 0;
}

- (void)accountDidChangeFromOldAccountInfo:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  ACAccount *backingAccountInfo;
  int v8;
  id v9;
  __int16 v10;
  ACAccount *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[DAAccount accountHasSignificantPropertyChangesFromOldAccountInfo:](self, "accountHasSignificantPropertyChangesFromOldAccountInfo:", v4))
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v5, v6))
    {
      backingAccountInfo = self->_backingAccountInfo;
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = backingAccountInfo;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "Account had significant property change, going to flush local data.\n\nOldProperties %@\n\nNewProperties %@", (uint8_t *)&v8, 0x16u);
    }

    -[DAAccount removeDBSyncData](self, "removeDBSyncData");
    -[DAAccount cleanupAccountFiles](self, "cleanupAccountFiles");
  }

}

- (NSString)serverRoot
{
  return 0;
}

- (NSSet)serverComplianceClasses
{
  return 0;
}

- (BOOL)handleCertificateError:(id)a3
{
  return 0;
}

- (id)additionalHeaderValues
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  os_log_type_t v11;
  uint8_t buf[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "credentialType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F1B8]);

  if (v5)
  {
    objc_msgSend(v3, "credentialItemForKey:", *MEMORY[0x1E0C8F290]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "credentialItemForKey:", *MEMORY[0x1E0C8F288]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Y=%@; T=%@"), v6, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = 0;
        goto LABEL_11;
      }
      v14 = CFSTR("Cookie");
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      DALoggingwithCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
      if (os_log_type_enabled(v9, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CD1000, v9, v11, "Couldn't get a Yahoo cookie. Not setting authentication headers", buf, 2u);
      }
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)customConnectionProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0C932C0];
  v8[0] = *MEMORY[0x1E0C93280];
  -[DAAccount onBehalfOfBundleIdentifier](self, "onBehalfOfBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0C931C8];
  -[DAAccount accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)oauth2Token
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "Fetching OAuth Crednetials for Backing Account %@", (uint8_t *)&v18, 0xCu);

  }
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "credential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "credentialType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8F1A0]))
    {

LABEL_7:
      objc_msgSend(v8, "oauthToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v8, "credentialType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C8F1A8]);

    if (v11)
      goto LABEL_7;
  }
  v12 = 0;
LABEL_9:
  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, v4))
  {
    if (v12)
      v14 = CFSTR("Valid");
    else
      v14 = CFSTR("InValid");
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v14;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1C1CD1000, v13, v4, "Account Store Returned A %@ OAuth-token From Crednetials Object %@ AccountID: %@", (uint8_t *)&v18, 0x20u);

  }
  return v12;
}

- (void)tearDown
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  int v6;
  const char *Name;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315394;
    Name = sel_getName(a2);
    v8 = 2112;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)monitorFoldersWithIDs:(id)a3
{
  return 0;
}

- (BOOL)monitorFolderWithID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[DAAccount monitorFoldersWithIDs:](self, "monitorFoldersWithIDs:", v6, v8, v9);
  return (char)self;
}

- (void)stopMonitoringFoldersWithIDs:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  int v7;
  const char *Name;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    Name = sel_getName(a2);
    v9 = 2112;
    v10 = (id)objc_opt_class();
    v6 = v10;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)stopMonitoringFolders
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  int v6;
  const char *Name;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315394;
    Name = sel_getName(a2);
    v8 = 2112;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);

  }
}

- (id)defaultContainerIdentifierForDADataclass:(int64_t)a3
{
  return 0;
}

- (void)removeClientCertificateData
{
  void *v3;
  id v4;

  -[DAAccount identityPersist](self, "identityPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if (!-[DAAccount _isIdentityManagedByProfile](self, "_isIdentityManagedByProfile"))
      _DASecDeleteIdentityByPersistentRef(v4);
    -[DAAccount setIdentityCertificatePersistentID:managedByProfile:](self, "setIdentityCertificatePersistentID:managedByProfile:", 0, 0);
    v3 = v4;
  }

}

- (void)saveAccountPropertiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
  if (os_log_type_enabled(v5, v6))
  {
    -[DAAccount accountDescription](self, "accountDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount accountID](self, "accountID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    *(_QWORD *)v18 = v7;
    *(_WORD *)&v18[8] = 2112;
    *(_QWORD *)&v18[10] = v8;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Saving account \"%@\" (%@)", (uint8_t *)&v17, 0x16u);

  }
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, v6))
  {
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAuthenticated");
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "username");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67109634;
    *(_DWORD *)v18 = v11;
    *(_WORD *)&v18[4] = 2112;
    *(_QWORD *)&v18[6] = v13;
    *(_WORD *)&v18[14] = 2112;
    *(_QWORD *)&v18[16] = v15;
    _os_log_impl(&dword_1C1CD1000, v9, v6, " _backingAccountInfo.authenticated is %d for Account identifier %@ and username %@", (uint8_t *)&v17, 0x1Cu);

  }
  sharedDAAccountStore();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "saveVerifiedAccount:withCompletionHandler:", self->_backingAccountInfo, v4);

}

- (void)saveAccountProperties
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__DAAccount_saveAccountProperties__block_invoke;
  v2[3] = &unk_1E7B92210;
  v2[4] = self;
  -[DAAccount saveAccountPropertiesWithCompletionHandler:](self, "saveAccountPropertiesWithCompletionHandler:", v2);
}

void __34__DAAccount_saveAccountProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "Error saving account %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)updateExistingAccountProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  ACAccount *backingAccountInfo;
  int v10;
  ACAccount *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sharedDAAccountStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DAAccount saveAccountProperties](self, "saveAccountProperties");
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    if (os_log_type_enabled(v7, v8))
    {
      backingAccountInfo = self->_backingAccountInfo;
      v10 = 138412290;
      v11 = backingAccountInfo;
      _os_log_impl(&dword_1C1CD1000, v7, v8, "Not updating non-existing account: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (int)keychainAccessibilityType
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ACAccount accountType](self->_backingAccountInfo, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAKeychain sharedKeychain](DAKeychain, "sharedKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialProtectionPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_daKeychainAccessibilityForSecAccessibility:", v4);

  return v5;
}

- (id)addUsernameToURL:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  if (!v7)
  {
    -[DAAccount username](self, "username");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {

LABEL_8:
      -[DAAccount username](self, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "da_stringByAddingPercentEscapesForUsername");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "da_urlBySettingUsername:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
      return v5;
    }
  }
  objc_msgSend(v5, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount username](self, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v7)
  if ((v10 & 1) == 0)
    goto LABEL_8;
  return v5;
}

- (NSData)identityPersist
{
  return (NSData *)-[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAIdentityPersist"));
}

- (void)setIdentityCertificatePersistentID:(id)a3 managedByProfile:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = CFSTR("No");
    if (v4)
      v9 = CFSTR("Yes");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1C1CD1000, v7, v8, "Setting identity certificate. Managed by profile? %@", (uint8_t *)&v11, 0xCu);
  }

  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("DAIdentityPersist"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v10, CFSTR("DAIdentityPersistIsManagedByProfile"));

}

- (BOOL)_isIdentityManagedByProfile
{
  void *v2;
  char v3;

  -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAIdentityPersistIsManagedByProfile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)exceptionsDict
{
  return -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DATrustSettingsExceptions"));
}

- (__CFData)exceptionsForDigest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[DAAccount exceptionsDict](self, "exceptionsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "da_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFData *)v7;
}

- (void)setExceptions:(__CFData *)a3 forDigest:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[DAAccount exceptionsDict](self, "exceptionsDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (a3)
  {
    if (!v7)
      v7 = (void *)objc_opt_new();
    objc_msgSend(v10, "da_hexString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v8);
  }
  else
  {
    if (!v7)
      goto LABEL_8;
    objc_msgSend(v10, "da_hexString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);
  }

LABEL_8:
  if (objc_msgSend(v7, "count"))
    v9 = v7;
  else
    v9 = 0;
  -[DAAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v9, CFSTR("DATrustSettingsExceptions"));
  -[DAAccount saveAccountProperties](self, "saveAccountProperties");

}

- (void)cleanupAccountFiles
{
  __CFURLStorageSession *v2;
  __CFURLStorageSession *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;

  v2 = -[DAAccount copyStorageSession](self, "copyStorageSession");
  if (v2)
  {
    v3 = v2;
    v4 = _CFURLStorageSessionCopyCookieStorage();
    if (v4)
    {
      v5 = (const void *)v4;
      CFHTTPCookieStorageDeleteAllCookies();
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  v6 = CFURLCacheCopySharedURLCache();
  if (v6)
  {
    v7 = (const void *)v6;
    CFURLCacheRemoveAllCachedResponses();
    CFRelease(v7);
  }
}

- (BOOL)isChildAccount
{
  void *v2;
  void *v3;
  BOOL v4;

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)resetCertWarnings
{
  void *v2;
  char v3;

  -[DAAccount trustHandler](self, "trustHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resetCertWarnings");

  return v3;
}

- (void)resetStatusReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_opt_new();
  -[DAAccount setStatusReport:](self, "setStatusReport:", v3);

  -[DAAccount persistentUUID](self, "persistentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setPersistentUUID:](self->_statusReport, "setPersistentUUID:", v4);

  -[ACAccount accountType](self->_backingAccountInfo, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setAccountType:](self->_statusReport, "setAccountType:", v6);

  -[DAAccount accountDescription](self, "accountDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setDisplayName:](self->_statusReport, "setDisplayName:", v7);

  -[DAAccount protocolVersion](self, "protocolVersion");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setProtocolVersion:](self->_statusReport, "setProtocolVersion:", v8);

}

- (BOOL)shouldFailAllTasks
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  objc_class *v9;
  DAAccount *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  os_log_type_t v16;
  objc_class *v17;
  BOOL v18;
  os_log_type_t v19;
  void *v20;
  int v21;
  DAAccount *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "supportsAuthentication"))
    goto LABEL_5;
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAuthenticated") & 1) != 0 || -[DAAccount isValidating](self, "isValidating"))
  {

LABEL_5:
    goto LABEL_6;
  }
  v18 = -[DAAccount wasUserInitiated](self, "wasUserInitiated");

  if (!v18)
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v7, v19))
    {
      -[DAAccount backingAccountInfo](self, "backingAccountInfo");
      v10 = (DAAccount *)objc_claimAutoreleasedReturnValue();
      -[DAAccount identifier](v10, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = self;
      v23 = 2114;
      v24 = v20;
      _os_log_impl(&dword_1C1CD1000, v7, v19, "Not attempting request for account %@ because the backing account credential isn't authed %{public}@", (uint8_t *)&v21, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_6:
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "aa_isSuspended");

  if (v6)
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (DAAccount *)objc_claimAutoreleasedReturnValue();
      -[DAAccount backingAccountInfo](self, "backingAccountInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_1C1CD1000, v7, v8, "Not attempting request for account %{public}@ because the backing account needs to verify terms or is suspended. %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_16:
    }
  }
  else
  {
    +[DAKeychain sharedKeychain](DAKeychain, "sharedKeychain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "canAccessCredentialsWithAccessibility:", -[DAAccount keychainAccessibilityType](self, "keychainAccessibilityType"));

    if ((v14 & 1) != 0)
      return 0;
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
    if (os_log_type_enabled(v7, v16))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v10 = (DAAccount *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v10;
      v23 = 1024;
      LODWORD(v24) = -[DAAccount keychainAccessibilityType](self, "keychainAccessibilityType");
      _os_log_impl(&dword_1C1CD1000, v7, v16, "Not attempting request for account %{public}@ because we don't have access to keychain items with accessibility %d right now", (uint8_t *)&v21, 0x12u);
      goto LABEL_16;
    }
  }
LABEL_17:

  return 1;
}

- (BOOL)isEqualToAccount:(id)a3
{
  void *v5;
  const char *Name;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Name = sel_getName(a2);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccount.m"), 1009, CFSTR("%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@"), Name, objc_opt_class());

  return 0;
}

- (BOOL)accountHasSignificantPropertyChangesFromOldAccountInfo:(id)a3
{
  void *v3;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  DAAccount *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40[0] = CFSTR("DAAccountHost");
  v40[1] = CFSTR("DAAccountEmailAddress");
  v40[2] = CFSTR("DAAccountPrincipalPath");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v34)
  {
    obj = v5;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[DAAccount backingAccountInfo](self, "backingAccountInfo", obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");
        if (v10
          || (objc_msgSend(v35, "objectForKeyedSubscript:", v7),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "length")))
        {
          v11 = self;
          -[DAAccount backingAccountInfo](self, "backingAccountInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if (v10)
          {

            self = v11;
            if (!v15)
              goto LABEL_29;
          }
          else
          {

            self = v11;
            if ((v15 & 1) == 0)
              goto LABEL_29;
          }
        }
        else
        {

        }
      }
      v5 = obj;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v34);
  }

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");
  if (v18
    || (objc_msgSend(v35, "username"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "length")))
  {
    -[DAAccount backingAccountInfo](self, "backingAccountInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "username");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "username");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if (v18)
    {

      if (v22)
        goto LABEL_24;
LABEL_22:
      v23 = 1;
      goto LABEL_31;
    }

    if ((v22 & 1) == 0)
      goto LABEL_22;
  }
  else
  {

  }
LABEL_24:
  v24 = -[DAAccount useSSL](self, "useSSL");
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    v27 = objc_msgSend(v25, "BOOLValue");
  else
    v27 = 1;
  obj = v26;
  if (v27 == v24)
  {
    -[DAAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountPort"), v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "intValue");
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29 != objc_msgSend(v30, "intValue");

  }
  else
  {
LABEL_29:
    v23 = 1;
  }

LABEL_31:
  return v23;
}

- (BOOL)isActiveSyncAccount
{
  return 0;
}

- (BOOL)isLDAPAccount
{
  return 0;
}

- (BOOL)isCalDAVAccount
{
  return 0;
}

- (BOOL)isCardDAVAccount
{
  return 0;
}

- (BOOL)isCalDAVChildAccount
{
  return 0;
}

- (BOOL)isHotmailAccount
{
  return 0;
}

- (BOOL)isGoogleAccount
{
  return 0;
}

- (BOOL)isSubscribedCalendarAccount
{
  return 0;
}

- (__CFURLStorageSession)copyStorageSession
{
  _QWORD block[5];

  if (copyStorageSession_once != -1)
    dispatch_once(&copyStorageSession_once, &__block_literal_global);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__DAAccount_copyStorageSession__block_invoke_2;
  block[3] = &unk_1E7B92278;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)copyStorageSession_storageSessionSetupQueue, block);
  return (__CFURLStorageSession *)CFRetain(self->_storageSession);
}

void __31__DAAccount_copyStorageSession__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.dataaccess.StorageSessionSetup", v2);
  v1 = (void *)copyStorageSession_storageSessionSetupQueue;
  copyStorageSession_storageSessionSetupQueue = (uint64_t)v0;

}

void __31__DAAccount_copyStorageSession__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[5])
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "persistentUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.dataaccessd.%@"), v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = _CFURLStorageSessionCreate();
    v5 = (const void *)_CFURLStorageSessionCopyCookieStorage();
    CFHTTPCookieStorageSetCookieAcceptPolicy();
    CFRelease(v5);
    v6 = _CFURLStorageSessionCopyCache();
    if (v6)
    {
      v7 = (const void *)v6;
      CFURLCacheSetMemoryCapacity();
      CFURLCacheSetDiskCapacity();
      CFURLCacheRemoveAllCachedResponses();
      CFRelease(v7);
    }

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)DAAccount;
  -[DAAccount description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount persistentUUID](self, "persistentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: accountID %@ persistentUUID %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shutdown
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "Shutting down the task manager", v5, 2u);
  }

  -[DATaskManager shutdown](self->_taskManager, "shutdown");
}

- (void)reload
{
  void *v3;
  void *v4;

  -[DAAccount dataclassPropertyURLsByDataclass](self, "dataclassPropertyURLsByDataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reload");

  -[DAAccount removeFromCoreDAVLoggingDelegates](self, "removeFromCoreDAVLoggingDelegates");
  -[DAAccount ingestBackingAccountInfoProperties](self, "ingestBackingAccountInfoProperties");
  -[DAAccount addToCoreDAVLoggingDelegates](self, "addToCoreDAVLoggingDelegates");
}

- (id)protocolVersion
{
  return 0;
}

- (id)accountTypeIdentifier
{
  void *v2;
  void *v3;

  -[ACAccount accountType](self->_backingAccountInfo, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldCancelTaskDueToOnPowerFetchMode
{
  OS_xpc_object *xpcActivity;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v6[16];

  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    LODWORD(xpcActivity) = xpc_activity_should_defer(xpcActivity);
    if ((_DWORD)xpcActivity)
    {
      DALoggingwithCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1C1CD1000, v3, v4, "Canceling task because conditions for on-power mode no longer exist (xpc_activity)", v6, 2u);
      }

      LOBYTE(xpcActivity) = 1;
    }
  }
  return (char)xpcActivity;
}

- (void)saveXpcActivity:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *xpcActivity;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (OS_xpc_object *)a3;
  -[DAAccount removeXpcActivity](self, "removeXpcActivity");
  xpcActivity = self->_xpcActivity;
  self->_xpcActivity = v4;

  self->_continueCount = 0;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v6, v7))
  {
    -[DAAccount accountID](self, "accountID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1C1CD1000, v6, v7, "XPC: Saved XPC activity for account %@", (uint8_t *)&v9, 0xCu);

  }
}

- (BOOL)hasXpcActivity
{
  return self->_xpcActivity != 0;
}

- (void)incrementXpcActivityContinueCount
{
  NSObject *v3;
  os_log_type_t v4;
  int continueCount;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_xpcActivity)
  {
    ++self->_continueCount;
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
    if (os_log_type_enabled(v3, v4))
    {
      continueCount = self->_continueCount;
      -[DAAccount accountID](self, "accountID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = 67109378;
      v7[1] = continueCount;
      v8 = 2112;
      v9 = v6;
      _os_log_impl(&dword_1C1CD1000, v3, v4, "XPC: Increment XPC activity continue count to %d for account %@", (uint8_t *)v7, 0x12u);

    }
  }
}

- (void)decrementXpcActivityContinueCount
{
  NSObject *v3;
  os_log_type_t v4;
  int continueCount;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_xpcActivity)
  {
    --self->_continueCount;
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
    if (os_log_type_enabled(v3, v4))
    {
      continueCount = self->_continueCount;
      -[DAAccount accountID](self, "accountID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = 67109378;
      v7[1] = continueCount;
      v8 = 2112;
      v9 = v6;
      _os_log_impl(&dword_1C1CD1000, v3, v4, "XPC: Decrement XPC activity continue count to %d for account %@", (uint8_t *)v7, 0x12u);

    }
    if (self->_continueCount <= 0)
      -[DAAccount removeXpcActivity](self, "removeXpcActivity");
  }
}

- (void)removeXpcActivity
{
  OS_xpc_object *xpcActivity;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  const char *v9;
  OS_xpc_object *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    v4 = xpc_activity_set_state(xpcActivity, 5);
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      LOBYTE(v7) = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
      if (os_log_type_enabled(v5, (os_log_type_t)v7))
      {
        -[DAAccount accountID](self, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        v9 = "XPC: Successfully set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %@";
LABEL_7:
        _os_log_impl(&dword_1C1CD1000, v6, (os_log_type_t)v7, v9, (uint8_t *)&v11, 0xCu);

      }
    }
    else
    {
      v7 = *(unsigned __int8 *)(MEMORY[0x1E0D03918] + 3);
      if (os_log_type_enabled(v5, *(os_log_type_t *)(MEMORY[0x1E0D03918] + 3)))
      {
        -[DAAccount accountID](self, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        v9 = "XPC: Failed to set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %@";
        goto LABEL_7;
      }
    }

    v10 = self->_xpcActivity;
    self->_xpcActivity = 0;

    self->_continueCount = 0;
  }
}

- (void)saveFetchingAutomaticallyState:(BOOL)a3
{
  self->_isFetchingAutomatically = a3;
}

- (BOOL)getFetchingAutomaticallyState
{
  return self->_isFetchingAutomatically;
}

- (ACAccount)backingAccountInfo
{
  return self->_backingAccountInfo;
}

- (DAStatusReport)statusReport
{
  return self->_statusReport;
}

- (void)setStatusReport:(id)a3
{
  objc_storeStrong((id *)&self->_statusReport, a3);
}

- (BOOL)shouldUseOpportunisticSockets
{
  return self->_shouldUseOpportunisticSockets;
}

- (void)setShouldUseOpportunisticSockets:(BOOL)a3
{
  self->_shouldUseOpportunisticSockets = a3;
}

- (BOOL)wasUserInitiated
{
  return self->_wasUserInitiated;
}

- (void)setWasUserInitiated:(BOOL)a3
{
  self->_wasUserInitiated = a3;
}

- (DATaskManager)taskManager
{
  return self->_taskManager;
}

- (DATrustHandler)trustHandler
{
  return self->_trustHandler;
}

- (void)setTrustHandler:(id)a3
{
  objc_storeStrong((id *)&self->_trustHandler, a3);
}

- (NSArray)appIdsForPasswordPrompt
{
  return self->_appIdsForPasswordPrompt;
}

- (BOOL)isValidating
{
  return self->_isValidating;
}

- (void)setIsValidating:(BOOL)a3
{
  self->_isValidating = a3;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSMutableDictionary)dataclassPropertyURLsByDataclass
{
  return self->_dataclassPropertyURLsByDataclass;
}

- (void)setDataclassPropertyURLsByDataclass:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassPropertyURLsByDataclass, a3);
}

- (NSMutableArray)pendingQueries
{
  return self->_pendingQueries;
}

- (void)setPendingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQueries, a3);
}

- (OS_dispatch_queue)pendingQueryQueue
{
  return self->_pendingQueryQueue;
}

- (void)setPendingQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQueryQueue, a3);
}

- (NSDate)lastQueryStartedTime
{
  return self->_lastQueryStartedTime;
}

- (void)setLastQueryStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryStartedTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryStartedTime, 0);
  objc_storeStrong((id *)&self->_pendingQueryQueue, 0);
  objc_storeStrong((id *)&self->_pendingQueries, 0);
  objc_storeStrong((id *)&self->_dataclassPropertyURLsByDataclass, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdsForPasswordPrompt, 0);
  objc_storeStrong((id *)&self->_trustHandler, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_statusReport, 0);
  objc_storeStrong((id *)&self->_backingAccountInfo, 0);
}

- (BOOL)handleTrustChallenge:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DAAccount trustHandler](self, "trustHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "handleTrustChallenge:forAccount:", v4, self);

  return (char)self;
}

- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[DAAccount trustHandler](self, "trustHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "handleTrustChallenge:forAccount:completionHandler:", v7, self, v6);

  return (char)self;
}

- (id)getAppleIDSession
{
  return 0;
}

- (id)localizedIdenticalAccountFailureMessage
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccount.m"), 1220, CFSTR("Account class %@ MUST implement %s"), v5, sel_getName(a2));

  return 0;
}

- (id)localizedInvalidPasswordMessage
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccount.m"), 1225, CFSTR("Account class %@ MUST implement %s"), v5, sel_getName(a2));

  return 0;
}

- (void)dropAssertionsAndRenewCredentialsInQueue:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  objc_class *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DAAccount wasUserInitiated](self, "wasUserInitiated");
    v13 = CFSTR("NO");
    if (v12)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "DataAccess is renewing credentials for account %{public}@ by forcing-prompt: %{public}@", buf, 0x16u);

  }
  -[DAAccount persistentUUID](self, "persistentUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dropPowerAssertionsForGroupIdentifier:", v14);

  sharedDAAccountStore();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[DAAccount wasUserInitiated](self, "wasUserInitiated");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke;
  v22[3] = &unk_1E7B922C8;
  v22[4] = self;
  v23 = v6;
  v24 = v14;
  v25 = v7;
  v19 = v7;
  v20 = v14;
  v21 = v6;
  objc_msgSend(v16, "renewCredentialsForAccount:force:reason:completion:", v17, v18, 0, v22);

}

void __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setWasUserInitiated:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke_2;
  block[3] = &unk_1E7B922A0;
  v6 = *(NSObject **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v16 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = v9;
  v10 = v5;
  dispatch_async(v6, block);

}

uint64_t __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  objc_class *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  objc_class *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;
  int v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reattainPowerAssertionsForGroupIdentifier:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 64);
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  v6 = os_log_type_enabled(v4, v5);
  if (v3)
  {
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 40), "wasUserInitiated");
      v10 = CFSTR("NO");
      v11 = *(_QWORD *)(a1 + 64);
      v21 = 138543874;
      v22 = v8;
      if (v9)
        v10 = CFSTR("YES");
      v23 = 2114;
      v24 = v10;
      v25 = 2048;
      v26 = v11;
      v12 = "DataAccess failed to renew credentials for account %{public}@ by forcing-prompt: %{public}@ - renewalResult = %ld";
      v13 = v4;
      v14 = v5;
      v15 = 32;
LABEL_10:
      _os_log_impl(&dword_1C1CD1000, v13, v14, v12, (uint8_t *)&v21, v15);

    }
  }
  else if (v6)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 40), "wasUserInitiated");
    v18 = CFSTR("NO");
    if (v17)
      v18 = CFSTR("YES");
    v21 = 138543618;
    v22 = v8;
    v23 = 2114;
    v24 = v18;
    v12 = "DataAccess successfully renewed credentials for account %{public}@ by forcing-prompt: %{public}@";
    v13 = v4;
    v14 = v5;
    v15 = 22;
    goto LABEL_10;
  }

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v19);
}

- (void)_webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v9 = a5;
  v10 = a6;
  v11 = a3;
  -[DAAccount persistentUUID](self, "persistentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dropPowerAssertionsForGroupIdentifier:", v12);

  sharedDAAccountStore();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccount backingAccountInfo](self, "backingAccountInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke;
  v19[3] = &unk_1E7B92318;
  v19[4] = self;
  v20 = v9;
  v21 = v12;
  v22 = v10;
  v16 = v10;
  v17 = v12;
  v18 = v9;
  objc_msgSend(v14, "openAuthenticationURL:forAccount:shouldConfirm:completion:", v11, v15, 1, v19);

}

void __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setWasUserInitiated:", 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke_2;
  v9[3] = &unk_1E7B922F0;
  v6 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;

  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reattainPowerAssertionsForGroupIdentifier:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__DAAccount_AuthenticationExtensions__webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke;
  v12[3] = &unk_1E7B92340;
  v13 = v10;
  v11 = v10;
  -[DAAccount _webLoginRequestedAtURL:reasonString:inQueue:completionBlock:](self, "_webLoginRequestedAtURL:reasonString:inQueue:completionBlock:", a3, a4, a5, v12);

}

void __99__DAAccount_AuthenticationExtensions__webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)handleValidationError:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v20, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DAAccountValidationDomain")))
  {
    v8 = objc_msgSend(v20, "code");

    if (v8 == 102)
    {
      objc_msgSend(v20, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D15808]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x1E0D15800]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        CDVExtractValuesFromRedirectString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D15858]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D15850]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[DAAccount principalURL](self, "principalURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "CDVIsSafeRedirectForRequestURL:", v17);

          if (v18)
          {
            dataaccess_get_global_queue();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DAAccount _webLoginRequestedAtURL:reasonString:inQueue:completionBlock:](self, "_webLoginRequestedAtURL:reasonString:inQueue:completionBlock:", v15, v16, v19, v6);
LABEL_11:

            goto LABEL_12;
          }
        }
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      dataaccess_get_global_queue();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAAccount dropAssertionsAndRenewCredentialsInQueue:withHandler:](self, "dropAssertionsAndRenewCredentialsInQueue:withHandler:", v19, v6);
      goto LABEL_11;
    }
  }
  else
  {

  }
  v6[2](v6, 2, 0);
LABEL_12:

}

+ (id)_leafAccountTypes
{
  if (_leafAccountTypes_onceToken != -1)
    dispatch_once(&_leafAccountTypes_onceToken, &__block_literal_global_438);
  return (id)_leafAccountTypes__sLeafAccountTypes;
}

void __56__DAAccount_AuthenticationExtensions___leafAccountTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0C8F058]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_leafAccountTypes__sLeafAccountTypes;
  _leafAccountTypes__sLeafAccountTypes = v0;

}

+ (id)oneshotListOfAccountIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[DAAccount _leafAccountTypes](DAAccount, "_leafAccountTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v16 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v3, "accountsWithAccountType:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v18;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v18 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "identifier");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13)
                  objc_msgSend(v2, "addObject:", v13);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v10);
          }

        }
        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  return v2;
}

+ (void)reacquireClientRestrictions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47240], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "oneshotListOfAccountIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v9 = MEMORY[0x1E0C9AA70];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setUserInfo:forClientUUID:", v9, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)defaultEventsFolder
{
  return 0;
}

- (id)eventsFolders
{
  return 0;
}

- (BOOL)sendEmailsForCalEvents:(id)a3 consumer:(id)a4
{
  return 0;
}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    -[DAAccount accountID](self, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "Downloading attachments is not supported on account ID %@. AttachmentUUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 70, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadFinishedError:", v11);

  return 0;
}

- (id)requestCalendarAvailabilityForStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 consumer:(id)a7
{
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    -[DAAccount accountID](self, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1C1CD1000, v9, v10, "Requesting calendar availability is not supported on account with ID [%@].", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 81, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarAvailabilityRequestFinishedWithError:", v12);

  return 0;
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    -[DAAccount accountID](self, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "Cancelling calendar availability requests is not supported on account with ID [%@].", (uint8_t *)&v7, 0xCu);

  }
}

- (id)performCalendarDirectorySearchForTerms:(id)a3 recordTypes:(id)a4 resultLimit:(unint64_t)a5 consumer:(id)a6
{
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    -[DAAccount accountID](self, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "Performing a calendar directory search is not supported on account with ID [%@].", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 83, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarDirectorySearchFinishedWithError:exceededResultLimit:", v11, 0);

  return 0;
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    -[DAAccount accountID](self, "accountID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Cancelling calendar directory searches is not supported on account with ID [%@].  searchID: [%@]", (uint8_t *)&v8, 0x16u);

  }
}

- (id)respondToShareRequestForCalendar:(id)a3 withResponse:(int64_t)a4 consumer:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    -[DAAccount accountID](self, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1C1CD1000, v9, v10, "Responding to calendar shares is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 76, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareResponseFinishedWithError:", v12);

  return 0;
}

- (id)reportShareRequestAsJunkForCalendar:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    -[DAAccount accountID](self, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "Reporting calendar shares as junk is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 76, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shareResponseFinishedWithError:", v11);

  return 0;
}

- (id)inboxFolder
{
  return 0;
}

- (id)sentItemsFolder
{
  return 0;
}

- (id)deletedItemsFolder
{
  return 0;
}

- (id)draftsFolder
{
  return 0;
}

- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4
{
  return 0;
}

- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5
{
  if (a5)
    *a5 = 0;
  return 0;
}

- (id)getPendingQueryQueue
{
  DAAccount *v2;
  void *v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[DAAccount pendingQueries](v2, "pendingQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[DAAccount setPendingQueries:](v2, "setPendingQueries:", v4);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.dataaccess.queryqueue", v5);
    -[DAAccount setPendingQueryQueue:](v2, "setPendingQueryQueue:", v6);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccount setLastQueryStartedTime:](v2, "setLastQueryStartedTime:", v7);

  }
  objc_sync_exit(v2);

  return -[DAAccount pendingQueryQueue](v2, "pendingQueryQueue");
}

- (void)_dequeueQuery
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[DAAccount getPendingQueryQueue](self, "getPendingQueryQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[DAAccount pendingQueryQueue](self, "pendingQueryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__DAAccount_Searching___dequeueQuery__block_invoke;
  v7[3] = &unk_1E7B924F8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  if (*((_BYTE *)v9 + 24))
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 134217984;
      v13 = 0x4000000000000000;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "Delay pending search for %f seconds", buf, 0xCu);
    }

    -[DAAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dequeueQuery, 0, 2.0);
  }
  _Block_object_dispose(&v8, 8);
}

void __37__DAAccount_Searching___dequeueQuery__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "consumer");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
        v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

      if (v7)
        break;
      ++v4;
      objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v4 >= v10)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastQueryStartedTime:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_reallyPerformSearchQuery:", v7);
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)performSearchQuery:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  os_log_type_t v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[DAAccount getPendingQueryQueue](self, "getPendingQueryQueue");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[DAAccount pendingQueryQueue](self, "pendingQueryQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DAAccount_Searching__performSearchQuery___block_invoke;
  block[3] = &unk_1E7B92520;
  block[4] = self;
  v17 = &v18;
  v7 = v4;
  v16 = v7;
  dispatch_sync(v6, block);

  if (*((_BYTE *)v19 + 24))
  {
    -[DAAccount lastQueryStartedTime](self, "lastQueryStartedTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = v9;

    v11 = v10 + 2.0;
    v12 = 0.0;
    if (v11 >= 0.0)
    {
      v12 = v11;
      if (v11 > 2.0)
        v12 = 2.0;
    }
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v12;
      _os_log_impl(&dword_1C1CD1000, v13, v14, "Delay new search for %f seconds", buf, 0xCu);
    }

    -[DAAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dequeueQuery, 0, v12);
  }

  _Block_object_dispose(&v18, 8);
}

void __43__DAAccount_Searching__performSearchQuery___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)cancelSearchQuery:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = -[DAAccount getPendingQueryQueue](self, "getPendingQueryQueue");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[DAAccount pendingQueryQueue](self, "pendingQueryQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__DAAccount_Searching__cancelSearchQuery___block_invoke;
  block[3] = &unk_1E7B92548;
  block[4] = self;
  v7 = v4;
  v9 = v7;
  v10 = &v11;
  dispatch_sync(v6, block);

  if (*((_BYTE *)v12 + 24))
    -[DAAccount _reallyCancelPendingSearchQuery:](self, "_reallyCancelPendingSearchQuery:", v7);
  else
    -[DAAccount _reallyCancelSearchQuery:](self, "_reallyCancelSearchQuery:", v7);

  _Block_object_dispose(&v11, 8);
}

void __42__DAAccount_Searching__cancelSearchQuery___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v7)
        break;
      ++v4;
      objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v4 >= v9)
        return;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", v4);

  }
}

- (void)cancelAllSearchQueries
{
  id v3;
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
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[DAAccount getPendingQueryQueue](self, "getPendingQueryQueue");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  -[DAAccount pendingQueryQueue](self, "pendingQueryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__DAAccount_Searching__cancelAllSearchQueries__block_invoke;
  block[3] = &unk_1E7B924A8;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(v4, block);

  v5 = (void *)v16[5];
  if (v5)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
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
          -[DAAccount _reallyCancelPendingSearchQuery:](self, "_reallyCancelPendingSearchQuery:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
      }
      while (v7);
    }

  }
  -[DAAccount _reallyCancelAllSearchQueries](self, "_reallyCancelAllSearchQueries", (_QWORD)v10);
  _Block_object_dispose(&v15, 8);

}

void __46__DAAccount_Searching__cancelAllSearchQueries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (BOOL)searchQueriesRunning
{
  NSObject *v3;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[DAAccount pendingQueryQueue](self, "pendingQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__DAAccount_Searching__searchQueriesRunning__block_invoke;
  v6[3] = &unk_1E7B924F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (*((_BYTE *)v8 + 24))
    v4 = 1;
  else
    v4 = -[DAAccount _reallySearchQueriesRunning](self, "_reallySearchQueriesRunning");
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__DAAccount_Searching__searchQueriesRunning__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (int)supportsMailboxSearch
{
  return 0;
}

- (int)supportsEmailFlagging
{
  return 0;
}

- (void)_reallyPerformSearchQuery:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v9;
  DAAccount *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Search requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v4, "consumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D038E8], 10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchQuery:finishedWithError:", v4, v8);

}

- (BOOL)_reallySearchQueriesRunning
{
  return 0;
}

@end
