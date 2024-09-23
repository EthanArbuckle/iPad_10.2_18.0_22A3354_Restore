@implementation ASUSQLiteTransporter

- (ASUSQLiteTransporter)initWithDatabasePath:(id)a3
{
  id v5;
  ASUSQLiteTransporter *v6;
  ASUSQLiteTransporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteTransporter;
  v6 = -[ASUSQLiteTransporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_databasePath, a3);

  return v7;
}

- (BOOL)canBeginTransportation
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSString *databasePath;
  const char *v12;
  void *v13;
  char v14;
  NSString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  ASUSQLiteConnectionOptions *v21;
  ASUSQLiteConnection *v22;
  ASUSQLiteConnection *connection;
  BOOL v24;
  NSString *v25;
  int v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = self->_databasePath;
  objc_opt_self();
  os_unfair_lock_lock(&_configurationLock);
  +[ASUDefaultsManager transporterConfiguration]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("knownPaths")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (void *)objc_msgSend(v6, "mutableCopy"),
        v6,
        v7))
  {
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v7, "removeObjectsAtIndexes:", v8);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("knownPaths"));
      +[ASUDefaultsManager setTransporterConfiguration:]((uint64_t)ASUDefaultsManager, v5);
    }
    v9 = objc_msgSend(v7, "containsObject:", v3);

    os_unfair_lock_unlock(&_configurationLock);
    if (v9)
    {
      ASULogHandleForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        databasePath = self->_databasePath;
        v26 = 138543362;
        v27 = databasePath;
        v12 = "Refusing to begin transportation for known path: %{public}@";
LABEL_20:
        _os_log_error_impl(&dword_236337000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v26, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    os_unfair_lock_unlock(&_configurationLock);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", self->_databasePath);

  if ((v14 & 1) == 0)
  {
    ASULogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_databasePath;
      v26 = 138543362;
      v27 = v25;
      v12 = "Refusing to begin transportation as path does not exist: %{public}@";
      goto LABEL_20;
    }
LABEL_14:

    return 0;
  }
  v15 = self->_databasePath;
  objc_opt_self();
  os_unfair_lock_lock(&_configurationLock);
  +[ASUDefaultsManager transporterConfiguration]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "mutableCopy");

  if (!v17)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_16;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("knownPaths"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (!v19)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v19, "addObject:", v15);
LABEL_17:
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("knownPaths"));
  +[ASUDefaultsManager setTransporterConfiguration:]((uint64_t)ASUDefaultsManager, v17);
  os_unfair_lock_unlock(&_configurationLock);

  v21 = -[ASUSQLiteConnectionOptions initWithDatabasePath:]([ASUSQLiteConnectionOptions alloc], "initWithDatabasePath:", self->_databasePath);
  -[ASUSQLiteConnectionOptions setReadOnly:](v21, "setReadOnly:", 1);
  v22 = -[ASUSQLiteConnection initWithOptions:]([ASUSQLiteConnection alloc], "initWithOptions:", v21);
  connection = self->_connection;
  self->_connection = v22;

  v24 = -[ASUSQLiteConnection open](self->_connection, "open");
  return v24;
}

- (BOOL)endTransportationAndRemoveDatabase
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSString *databasePath;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[ASUSQLiteConnection close](self->_connection, "close")
    && ASUSQLiteDeleteDatabase(self->_databasePath, 0))
  {
    v3 = self->_databasePath;
    objc_opt_self();
    os_unfair_lock_lock(&_configurationLock);
    +[ASUDefaultsManager transporterConfiguration]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("knownPaths"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      if (v7)
      {
        objc_msgSend(v7, "removeObject:", v3);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("knownPaths"));
        +[ASUDefaultsManager setTransporterConfiguration:]((uint64_t)ASUDefaultsManager, v5);
      }

    }
    os_unfair_lock_unlock(&_configurationLock);

    return 1;
  }
  else
  {
    ASULogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      databasePath = self->_databasePath;
      v11 = 138543362;
      v12 = databasePath;
      _os_log_error_impl(&dword_236337000, v9, OS_LOG_TYPE_ERROR, "Remembering path after ending transportation: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    return 0;
  }
}

- (void)performTransportationUsingBlock:(id)a3
{
  id v4;
  ASUSQLiteConnection *connection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ASUSQLiteTransporter_performTransportationUsingBlock___block_invoke;
  v7[3] = &unk_2507A95B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v7, 0);

}

uint64_t __56__ASUSQLiteTransporter_performTransportationUsingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  return 1;
}

uint64_t __45__ASUSQLiteTransporter__isKnownDatabasePath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = (void *)MEMORY[0x24BDD1580];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
