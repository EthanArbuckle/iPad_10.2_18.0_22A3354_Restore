@implementation CloudSettingsStore

- (CloudSettingsStore)initWithStoreIdentifier:(id)a3
{
  id v5;
  void *v6;
  int v7;
  CloudSettingsStore *v8;
  CloudSettingsStore **v9;
  uint64_t v10;
  CloudSettingsStore *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v5)
    {
      +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isServiceKnownForStore:", v5);

      if (v7)
      {
        v16.receiver = self;
        v16.super_class = (Class)CloudSettingsStore;
        v8 = -[CloudSettingsStore init](&v16, sel_init);
        v9 = (CloudSettingsStore **)v8;
        if (!v8)
        {
LABEL_16:
          self = v9;
          v11 = self;
          goto LABEL_17;
        }
        objc_storeStrong((id *)&v8->_serviceIdentifier, a3);
        v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1888]), "_initWithStoreIdentifier:usingEndToEndEncryption:", v5, 1);
        self = v9[2];
        v9[2] = (CloudSettingsStore *)v10;
LABEL_15:

        goto LABEL_16;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        v12 = MEMORY[0x24BDACB70];
        v13 = "ERROR | CloudSettingsStore attempt to init with unknown identifier: %@";
        v14 = 12;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | CloudSettingsStore init attempted with nil identifier";
      v14 = 2;
LABEL_13:
      _os_log_impl(&dword_20DD2C000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
    }
    v9 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[initWithStoreIdentifier] - cloudsettings feature disabled, returning nil", buf, 2u);
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (int)keyExists:(id)a3 andIsOfType:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  char isKindOfClass;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  NSString *serviceIdentifier;
  NSString *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _BYTE v28[24];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      v18 = MEMORY[0x24BDACB70];
      v19 = "[keyExists:andIsOfType] - cloudsettings feature disabled, returning param error";
      v20 = 2;
LABEL_18:
      _os_log_impl(&dword_20DD2C000, v18, OS_LOG_TYPE_DEFAULT, v19, v28, v20);
    }
LABEL_19:
    v17 = 3;
    goto LABEL_20;
  }
  if (!v6 || !v7 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      *(_DWORD *)v28 = 67109632;
      *(_DWORD *)&v28[4] = v6 == 0;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = v7 == 0;
      *(_WORD *)&v28[14] = 1024;
      *(_DWORD *)&v28[16] = serviceIdentifier == 0;
      v18 = MEMORY[0x24BDACB70];
      v19 = "ERROR | keyExists andIsOfType attempted with nil, key: %d, type: %d identifier: %d";
      v20 = 20;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412546;
    *(_QWORD *)&v28[4] = v6;
    *(_WORD *)&v28[12] = 2112;
    *(_QWORD *)&v28[14] = objc_opt_class();
    v8 = *(id *)&v28[14];
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "key: %@, inType: %@", v28, 0x16u);

  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager", *(_OWORD *)v28, *(_QWORD *)&v28[16]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEnabledForStore:", self->_serviceIdentifier);

  v13 = v10 ^ 1;
  if ((v13 & 1) != 0 || ((v12 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v23 = self->_serviceIdentifier;
    *(_DWORD *)v28 = 138412802;
    *(_QWORD *)&v28[4] = v23;
    *(_WORD *)&v28[12] = 1024;
    *(_DWORD *)&v28[14] = v13;
    *(_WORD *)&v28[18] = 1024;
    *(_DWORD *)&v28[20] = v12 ^ 1;
    v18 = MEMORY[0x24BDACB70];
    v19 = "ERROR | keyExists:andIsOfType for store: %@, unknown store: %d, or store is disabled: %d";
    v20 = 24;
    goto LABEL_18;
  }
  -[NSUbiquitousKeyValueStore objectForKey:](self->_kvsStore, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v16)
      {
        *(_DWORD *)v28 = 67109120;
        *(_DWORD *)&v28[4] = 0;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Object found and is correct class, setting (success) result: %d", v28, 8u);
      }
      v17 = 0;
    }
    else
    {
      v17 = 2;
      if (v16)
      {
        v24 = (void *)objc_opt_class();
        v25 = v24;
        v26 = (void *)objc_opt_class();
        *(_DWORD *)v28 = 138412802;
        *(_QWORD *)&v28[4] = v24;
        *(_WORD *)&v28[12] = 2112;
        *(_QWORD *)&v28[14] = v26;
        *(_WORD *)&v28[22] = 1024;
        v29 = 2;
        v27 = v26;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Object found, but wrong class, expected: %@, got: %@, setting (wrong class) result: %d", v28, 0x1Cu);

      }
    }
  }
  else
  {
    v17 = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v28 = 67109120;
      *(_DWORD *)&v28[4] = 1;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Object not found in store, setting (not found) result: %d", v28, 8u);
    }
  }

LABEL_20:
  return v17;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _BOOL4 v16;
  NSString *serviceIdentifier;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setBool forKey] - cloudsettings feature disabled";
    v15 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v6 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = self->_serviceIdentifier == 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v6 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setBoolForKey attempted with a nil, key: %d, identifier: %d";
    v15 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabledForStore:", self->_serviceIdentifier);

  v11 = v8 ^ 1;
  if ((v11 & 1) != 0 || ((v10 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v18 = 138412802;
    *(_QWORD *)v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    v20 = v11;
    v21 = 1024;
    v22 = v10 ^ 1;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setBool:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v15 = 24;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudSettingsStore setObject:forKey:](self, "setObject:forKey:", v12, v6);

LABEL_14:
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  _BOOL4 v13;
  NSString *serviceIdentifier;
  int v16;
  _BYTE v17[10];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    v9 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v16) = 0;
    v10 = MEMORY[0x24BDACB70];
    v11 = "[BOOLForKey] - cloudsettings feature disabled, returning NO";
    v12 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v12);
    v9 = 0;
    goto LABEL_14;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    v9 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v13 = self->_serviceIdentifier == 0;
    v16 = 67109376;
    *(_DWORD *)v17 = v4 == 0;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v13;
    v10 = MEMORY[0x24BDACB70];
    v11 = "ERROR | BOOLForKey attempted with a nil, key: %d, identifier: %d";
    v12 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  if (((v6 ^ 1) & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    v9 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v16 = 138412802;
    *(_QWORD *)v17 = serviceIdentifier;
    *(_WORD *)&v17[8] = 1024;
    v18 = v6 ^ 1;
    v19 = 1024;
    v20 = v8 ^ 1;
    v10 = MEMORY[0x24BDACB70];
    v11 = "ERROR | BOOLForKey for store: %@, unknown store: %d, or store is disabled: %d";
    v12 = 24;
    goto LABEL_13;
  }
  v9 = -[NSUbiquitousKeyValueStore BOOLForKey:](self->_kvsStore, "BOOLForKey:", v4);
LABEL_14:

  return v9;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _BOOL4 v16;
  NSString *serviceIdentifier;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setNumber forKey] - cloudsettings feature disabled";
    v15 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = self->_serviceIdentifier == 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setBoolForKey attempted with a nil, key: %d, identifier: %d";
    v15 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForStore:", self->_serviceIdentifier);

  v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || ((v11 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v18 = 138412802;
    *(_QWORD *)v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    v20 = v12;
    v21 = 1024;
    v22 = v11 ^ 1;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setNumber:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v15 = 24;
    goto LABEL_13;
  }
  -[CloudSettingsStore setObject:forKey:](self, "setObject:forKey:", v6, v7);
LABEL_14:

}

- (id)numberForKey:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSString *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  NSString *serviceIdentifier;
  NSString *v16;
  int v18;
  NSString *v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "[numberForKey] - cloudsettings feature disabled";
LABEL_15:
      v14 = 2;
LABEL_20:
      _os_log_impl(&dword_20DD2C000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      *(_QWORD *)v21 = serviceIdentifier;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_serviceIdentifier;
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | numberForKey for store: %@, unknown store: %d, or store is disabled: %d";
      v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  -[CloudSettingsStore objectForKey:](self, "objectForKey:", v4);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11)
      goto LABEL_21;
    LOWORD(v18) = 0;
    v12 = MEMORY[0x24BDACB70];
    v13 = "ERROR | numberForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "numberForKey - found a value: %@, checking if it is an NSNumber", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | numberForKey - returned value is not a number: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _BOOL4 v16;
  NSString *serviceIdentifier;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setString forKey] - cloudsettings feature disabled";
    v15 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = self->_serviceIdentifier == 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setStringForKey attempted with a nil, key: %d, identifier: %d";
    v15 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForStore:", self->_serviceIdentifier);

  v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || ((v11 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v18 = 138412802;
    *(_QWORD *)v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    v20 = v12;
    v21 = 1024;
    v22 = v11 ^ 1;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setString:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v15 = 24;
    goto LABEL_13;
  }
  -[CloudSettingsStore setObject:forKey:](self, "setObject:forKey:", v6, v7);
LABEL_14:

}

- (id)stringForKey:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSString *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  NSString *serviceIdentifier;
  NSString *v16;
  int v18;
  NSString *v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "[stringForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      v14 = 2;
LABEL_20:
      _os_log_impl(&dword_20DD2C000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      *(_QWORD *)v21 = serviceIdentifier;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_serviceIdentifier;
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | stringForKey for store: %@, unknown store: %d, or store is disabled: %d";
      v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  -[CloudSettingsStore objectForKey:](self, "objectForKey:", v4);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11)
      goto LABEL_21;
    LOWORD(v18) = 0;
    v12 = MEMORY[0x24BDACB70];
    v13 = "ERROR | stringForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "stringForKey - found a value: %@, checking if it is an NSString", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | stringForKey - returned value is not a string: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _BOOL4 v16;
  NSString *serviceIdentifier;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setArray forKey] - cloudsettings feature disabled";
    v15 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = self->_serviceIdentifier == 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setArrayForKey attempted with a nil, key: %d, identifier: %d";
    v15 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForStore:", self->_serviceIdentifier);

  v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || ((v11 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v18 = 138412802;
    *(_QWORD *)v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    v20 = v12;
    v21 = 1024;
    v22 = v11 ^ 1;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setArray:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v15 = 24;
    goto LABEL_13;
  }
  -[CloudSettingsStore setObject:forKey:](self, "setObject:forKey:", v6, v7);
LABEL_14:

}

- (id)arrayForKey:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSString *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  NSString *serviceIdentifier;
  NSString *v16;
  int v18;
  NSString *v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "[arrayForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      v14 = 2;
LABEL_20:
      _os_log_impl(&dword_20DD2C000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      *(_QWORD *)v21 = serviceIdentifier;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_serviceIdentifier;
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | arrayForKey for store: %@, unknown store: %d, or store is disabled: %d";
      v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  -[CloudSettingsStore objectForKey:](self, "objectForKey:", v4);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11)
      goto LABEL_21;
    LOWORD(v18) = 0;
    v12 = MEMORY[0x24BDACB70];
    v13 = "ERROR | arrayForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "arrayForKey - found a value: %@, checking if it is an NSArray", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | arrayForKey - returned value is not an array: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _BOOL4 v16;
  NSString *serviceIdentifier;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setData forKey] - cloudsettings feature disabled";
    v15 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = self->_serviceIdentifier == 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setData attempted with a nil, key: %d, identifier: %d";
    v15 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForStore:", self->_serviceIdentifier);

  v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || ((v11 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    serviceIdentifier = self->_serviceIdentifier;
    v18 = 138412802;
    *(_QWORD *)v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    v20 = v12;
    v21 = 1024;
    v22 = v11 ^ 1;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setData:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v15 = 24;
    goto LABEL_13;
  }
  -[CloudSettingsStore setObject:forKey:](self, "setObject:forKey:", v6, v7);
LABEL_14:

}

- (id)dataForKey:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSString *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  NSString *serviceIdentifier;
  NSString *v16;
  int v18;
  NSString *v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "[dataForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      v14 = 2;
LABEL_20:
      _os_log_impl(&dword_20DD2C000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      *(_QWORD *)v21 = serviceIdentifier;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | dataForKey, key: %@, returned nil for service: %@";
      v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_serviceIdentifier;
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      v12 = MEMORY[0x24BDACB70];
      v13 = "ERROR | dataForKey for store: %@, unknown store: %d, or store is disabled: %d";
      v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  -[CloudSettingsStore objectForKey:](self, "objectForKey:", v4);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11)
      goto LABEL_21;
    LOWORD(v18) = 0;
    v12 = MEMORY[0x24BDACB70];
    v13 = "ERROR | dataForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "dataForKey - found a value: %@, checking if it is an NSData", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | dataForKey - returned value is not NSData: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  _BOOL4 v17;
  NSString *serviceIdentifier;
  int v19;
  _BYTE v20[10];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    LOWORD(v19) = 0;
    v14 = MEMORY[0x24BDACB70];
    v15 = "[setDictionary forKey] - cloudsettings feature disabled";
    v16 = 2;
LABEL_16:
    _os_log_impl(&dword_20DD2C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v16);
    goto LABEL_17;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = self->_serviceIdentifier == 0;
    v19 = 67109376;
    *(_DWORD *)v20 = v7 == 0;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v17;
    v14 = MEMORY[0x24BDACB70];
    v15 = "ERROR | setDictionaryForKey attempted with a nil, key: %d, identifier: %d";
    v16 = 14;
    goto LABEL_16;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForStore:", self->_serviceIdentifier);

  v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || ((v11 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    serviceIdentifier = self->_serviceIdentifier;
    v19 = 138412802;
    *(_QWORD *)v20 = serviceIdentifier;
    *(_WORD *)&v20[8] = 1024;
    v21 = v12;
    v22 = 1024;
    v23 = v11 ^ 1;
    v14 = MEMORY[0x24BDACB70];
    v15 = "ERROR | setDictionary:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    v16 = 24;
    goto LABEL_16;
  }
  -[NSUbiquitousKeyValueStore setDictionary:forKey:](self->_kvsStore, "setDictionary:forKey:", v6, v7);
  -[NSUbiquitousKeyValueStore objectForKey:](self->_kvsStore, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setDictionary - check of set value returned nil", (uint8_t *)&v19, 2u);
  }

LABEL_17:
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  _BOOL4 v14;
  NSString *serviceIdentifier;
  int v17;
  _BYTE v18[10];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v17) = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "[dictionaryForKey] - cloudsettings feature disabled";
    v13 = 2;
LABEL_13:
    _os_log_impl(&dword_20DD2C000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v13);
    goto LABEL_14;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v14 = self->_serviceIdentifier == 0;
    v17 = 67109376;
    *(_DWORD *)v18 = v4 == 0;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v14;
    v11 = MEMORY[0x24BDACB70];
    v12 = "ERROR | dictionaryForKey attempted with a nil, key: %d, identifier: %d";
    v13 = 14;
    goto LABEL_13;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      v17 = 138412802;
      *(_QWORD *)v18 = serviceIdentifier;
      *(_WORD *)&v18[8] = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = v8 ^ 1;
      v11 = MEMORY[0x24BDACB70];
      v12 = "ERROR | dictionaryForKey for store: %@, unknown store: %d, or store is disabled: %d";
      v13 = 24;
      goto LABEL_13;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  -[NSUbiquitousKeyValueStore dictionaryForKey:](self->_kvsStore, "dictionaryForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  _BOOL4 v14;
  NSString *serviceIdentifier;
  int v16;
  _BYTE v17[10];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    LOWORD(v16) = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "[removeObjectForKey] - cloudsettings feature disabled";
    v13 = 2;
LABEL_16:
    _os_log_impl(&dword_20DD2C000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v13);
    goto LABEL_17;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v14 = self->_serviceIdentifier == 0;
    v16 = 67109376;
    *(_DWORD *)v17 = v4 == 0;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v14;
    v11 = MEMORY[0x24BDACB70];
    v12 = "ERROR | removeObjectForKey attempted with a nil, key: %d, or identifier: %d";
    v13 = 14;
    goto LABEL_16;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForStore:", self->_serviceIdentifier);

  v9 = v6 ^ 1;
  if ((v9 & 1) != 0 || ((v8 ^ 1) & 1) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    serviceIdentifier = self->_serviceIdentifier;
    v16 = 138412802;
    *(_QWORD *)v17 = serviceIdentifier;
    *(_WORD *)&v17[8] = 1024;
    v18 = v9;
    v19 = 1024;
    v20 = v8 ^ 1;
    v11 = MEMORY[0x24BDACB70];
    v12 = "ERROR | removeObjectForKey for store: %@, unknown store: %d, or store is disabled: %d";
    v13 = 24;
    goto LABEL_16;
  }
  -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvsStore, "removeObjectForKey:", v4);
  -[NSUbiquitousKeyValueStore objectForKey:](self->_kvsStore, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removeObjectForKey - check of set value did NOT return nil", (uint8_t *)&v16, 2u);
  }

LABEL_17:
}

- (id)dictionaryRepresentation
{
  return -[NSUbiquitousKeyValueStore dictionaryRepresentation](self->_kvsStore, "dictionaryRepresentation");
}

- (void)syncNow:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  NSString *serviceIdentifier;
  int v13;
  NSString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v13) = 0;
    v9 = MEMORY[0x24BDACB70];
    v10 = "[syncNow] - cloudsettings feature disabled";
LABEL_10:
    v11 = 2;
LABEL_11:
    _os_log_impl(&dword_20DD2C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
    return;
  }
  if (!self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v13) = 0;
    v9 = MEMORY[0x24BDACB70];
    v10 = "ERROR | syncNow attempted with a nil identifier";
    goto LABEL_10;
  }
  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServiceKnownForStore:", self->_serviceIdentifier);

  +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabledForStore:", self->_serviceIdentifier);

  v8 = v5 ^ 1;
  if ((v8 & 1) == 0 && ((v7 ^ 1) & 1) == 0)
  {
    -[NSUbiquitousKeyValueStore synchronize](self->_kvsStore, "synchronize");
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    v13 = 138412802;
    v14 = serviceIdentifier;
    v15 = 1024;
    v16 = v8;
    v17 = 1024;
    v18 = v7 ^ 1;
    v9 = MEMORY[0x24BDACB70];
    v10 = "ERROR | syncNow for store: %@, unknown store: %d, or store is disabled: %d";
    v11 = 24;
    goto LABEL_11;
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSUbiquitousKeyValueStore *kvsStore;
  void *v11;
  NSString *serviceIdentifier;
  int v13;
  _BYTE v14[10];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSUbiquitousKeyValueStore *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7 && self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[CloudSettingsStore serviceIdentifier](self, "serviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      kvsStore = self->_kvsStore;
      v13 = 138413058;
      *(_QWORD *)v14 = v9;
      *(_WORD *)&v14[8] = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = kvsStore;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IN FRAMEWORK, likely from service, writing to store: %@ value: %@, for key: %@, to store: %@", (uint8_t *)&v13, 0x2Au);

    }
    -[NSUbiquitousKeyValueStore setObject:forKey:](self->_kvsStore, "setObject:forKey:", v6, v8);
    -[NSUbiquitousKeyValueStore objectForKey:](self->_kvsStore, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setObject - check of set value returned nil", (uint8_t *)&v13, 2u);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    v13 = 67109632;
    *(_DWORD *)v14 = v6 == 0;
    *(_WORD *)&v14[4] = 1024;
    *(_DWORD *)&v14[6] = v8 == 0;
    LOWORD(v15) = 1024;
    *(_DWORD *)((char *)&v15 + 2) = serviceIdentifier == 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | setObject attempted with a nil, value:%d, key:%d, identifier:%d", (uint8_t *)&v13, 0x14u);
  }

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v13;
  _BYTE v14[10];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_kvsStore)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v9 = MEMORY[0x24BDACB70];
      v10 = "ERROR | _kvsStore is nil";
      v11 = 2;
      goto LABEL_11;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_serviceIdentifier == 0;
      v13 = 67109376;
      *(_DWORD *)v14 = v5 == 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v8;
      v9 = MEMORY[0x24BDACB70];
      v10 = "ERROR | objectForKey attempted with a nil, key: %d, identifier: %d";
      v11 = 14;
LABEL_11:
      _os_log_impl(&dword_20DD2C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[CloudSettingsStore serviceIdentifier](self, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    *(_QWORD *)v14 = v5;
    *(_WORD *)&v14[8] = 2112;
    v15 = v6;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "_kvsStore getting:%@, for store: %@", (uint8_t *)&v13, 0x16u);

  }
  -[NSUbiquitousKeyValueStore objectForKey:](self->_kvsStore, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v7;
}

- (NSString)serviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUbiquitousKeyValueStore)kvsStore
{
  return (NSUbiquitousKeyValueStore *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsStore, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
