@implementation DEDPersistence

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1)
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_23);
  return (id)sharedInstance_shared_2;
}

void __32__DEDPersistence_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_2;
  sharedInstance_shared_2 = v0;

}

- (BOOL)canProceedWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[DEDUtils isInternalInstall](DEDUtils, "isInternalInstall"))
  {
    -[DEDPersistence userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("blockDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "hashingKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[DEDPersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138543362;
          v12 = v7;
          _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "should not proceed with device [%{public}@]", (uint8_t *)&v11, 0xCu);
        }

        v9 = 0;
        goto LABEL_10;
      }

    }
    v9 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (DEDPersistence)init
{
  DEDPersistence *v2;
  void *v3;
  os_log_t v4;
  uint64_t v5;
  NSUserDefaults *userDefaults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DEDPersistence;
  v2 = -[DEDPersistence init](&v8, sel_init);
  if (v2)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create((const char *)objc_msgSend(v3, "loggingSubsystem"), "ded-persist");
    -[DEDPersistence setLog:](v2, "setLog:", v4);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v5;

  }
  return v2;
}

- (id)loadSavedSessionsFromPlist:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  void *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "objectForKey:", CFSTR("sessionIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v30;
    *(_QWORD *)&v12 = 138543362;
    v25 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        -[DEDPersistence _indexKeyForBugSessionIdentifier:](self, "_indexKeyForBugSessionIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD1620];
        +[DEDBugSession archivedClasses](DEDBugSession, "archivedClasses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v19, v17, &v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v28;

        if (v21)
        {
          -[DEDPersistence log](self, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v34 = v21;
            _os_log_error_impl(&dword_21469E000, v22, OS_LOG_TYPE_ERROR, "failed to load bug session from plist with error: [%{public}@]", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v26, "addObject:", v20);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)loadSavedBugSessions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  id obj;
  uint8_t v20;
  _BYTE v21[7];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[DEDPersistence bugSessionIdentifiers](self, "bugSessionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        -[DEDPersistence _indexKeyForBugSessionIdentifier:](self, "_indexKeyForBugSessionIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BDD1620];
        +[DEDBugSession archivedClasses](DEDBugSession, "archivedClasses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v9, &v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v22;

        if (v13)
        {
          -[DEDPersistence log](self, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v13;
            _os_log_error_impl(&dword_21469E000, v14, OS_LOG_TYPE_ERROR, "Failed to load Bug Session from disk with error [%{public}@]", buf, 0xCu);
          }
LABEL_9:

          goto LABEL_12;
        }
        if (!v12)
        {
          -[DEDPersistence log](self, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[DEDPersistence loadSavedBugSessions].cold.1(&v20, v21, v14);
          goto LABEL_9;
        }
        objc_msgSend(v18, "addObject:", v12);
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v5 = v15;
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)updateBugSession:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSUserDefaults *userDefaults;
  void *v22;
  id v23;

  v4 = a3;
  -[DEDPersistence log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDPersistence updateBugSession:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[DEDPersistence bugSessionIdentifiers](self, "bugSessionIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithSet:", v14);

  objc_msgSend(v4, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  -[DEDPersistence _indexKeyForBugSession:](self, "_indexKeyForBugSession:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v23;
  if (v19)
  {
    -[DEDPersistence log](self, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[DEDPersistence updateBugSession:].cold.1((uint64_t)v19, v20);

  }
  userDefaults = self->_userDefaults;
  objc_msgSend(v15, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v22, CFSTR("sessionIdentifiers"));

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v18, v17);
}

- (void)removeBugSession:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUserDefaults *userDefaults;
  void *v19;

  v4 = a3;
  -[DEDPersistence log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDPersistence removeBugSession:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[DEDPersistence bugSessionIdentifiers](self, "bugSessionIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithSet:", v14);

  objc_msgSend(v4, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v16);

  -[DEDPersistence _indexKeyForBugSession:](self, "_indexKeyForBugSession:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v17);
  userDefaults = self->_userDefaults;
  objc_msgSend(v15, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v19, CFSTR("sessionIdentifiers"));

}

- (id)_indexKeyForBugSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bugsession:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_indexKeyForBugSessionIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bugsession:%@"), a3);
}

- (id)bugSessionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("sessionIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  return v7;
}

- (void)validateSandboxAccess
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_7(&dword_21469E000, a1, a3, "CANNOT read/write from user defaults", v3);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)loadSavedBugSessions
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_7(&dword_21469E000, a3, (uint64_t)a3, "Failed to load Bug Session from disk with error: Bug Session is nil, no unarchive error", a1);
}

- (void)updateBugSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "failed to archive bug session with error: [%{public}@]", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)updateBugSession:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21469E000, a1, a3, "[%{public}s]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeBugSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21469E000, a1, a3, "[%{public}s]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
