@implementation CloudSettingsManager

+ (id)sharedCloudSettingsManager
{
  if (sharedCloudSettingsManager_onceToken != -1)
    dispatch_once(&sharedCloudSettingsManager_onceToken, &__block_literal_global);
  return (id)sharedCloudSettingsManager_sharedCloudSettingsManager;
}

void __50__CloudSettingsManager_sharedCloudSettingsManager__block_invoke()
{
  CloudSettingsManager *v0;
  void *v1;

  v0 = objc_alloc_init(CloudSettingsManager);
  v1 = (void *)sharedCloudSettingsManager_sharedCloudSettingsManager;
  sharedCloudSettingsManager_sharedCloudSettingsManager = (uint64_t)v0;

}

- (void)setEnabled:(BOOL)a3 forStore:(id)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  int v16;
  _BYTE v17[14];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = _os_feature_enabled_impl();
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v8)
      goto LABEL_19;
    LOWORD(v16) = 0;
    v13 = MEMORY[0x24BDACB70];
    v14 = "[setEnabled: forStore] - cloudsettings feature disabled";
    v15 = 2;
LABEL_15:
    _os_log_impl(&dword_20DD2C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, v15);
    goto LABEL_19;
  }
  if (v8)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[setEnabled:forstore] - cloudsettings feature enabled, enter, calling isServiceKnown", (uint8_t *)&v16, 2u);
  }
  v9 = -[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v6);
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v10)
      goto LABEL_19;
    v16 = 138412290;
    *(_QWORD *)v17 = v6;
    v13 = MEMORY[0x24BDACB70];
    v14 = "ERROR | setEnabled - unknown service: %@";
    v15 = 12;
    goto LABEL_15;
  }
  if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[setEnabled:forstore] - is a known service, getting current state dict, and checking if setting is on/off", (uint8_t *)&v16, 2u);
  }
  -[CloudSettingsManager currentStateDictionary](self, "currentStateDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v6) == v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109378;
      *(_DWORD *)v17 = v4;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v6;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setEnabled is already set to %d for: %@", (uint8_t *)&v16, 0x12u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v6);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109634;
      *(_DWORD *)v17 = v4;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v6;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "in setEnabled: %d, for identifier: %@, new dictionary: %@", (uint8_t *)&v16, 0x1Cu);
    }
    -[CloudSettingsManager writeSettingsDictionaryToPrefs:](self, "writeSettingsDictionaryToPrefs:", v11);
  }

LABEL_19:
}

- (BOOL)isEnabledForStore:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v12;
  _DWORD v13[7];

  *(_QWORD *)&v13[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isEnabledForStore enter", (uint8_t *)&v12, 2u);
  }
  v5 = _os_feature_enabled_impl();
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isEnabledForStore os_feature_enabled = YES", (uint8_t *)&v12, 2u);
    }
    if (-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v4))
    {
      -[CloudSettingsManager currentStateDictionary](self, "currentStateDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(v8, "BOOLValue");

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412290;
          *(_QWORD *)v13 = v4;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "State dictionary did not locate a state for: %@, returning YES by default", (uint8_t *)&v12, 0xCu);
        }

        v10 = 1;
      }
    }
    else
    {
      v10 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        *(_QWORD *)v13 = v4;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | isEnabledForStore - unknown store:  %@", (uint8_t *)&v12, 0xCu);
        v10 = 0;
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109378;
      v13[0] = v10;
      LOWORD(v13[1]) = 2112;
      *(_QWORD *)((char *)&v13[1] + 2) = v4;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isEnabledForStore returning: %d, for identifier: %@", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[isEnabledForStore] - cloudsettings feature disabled, returning: NO", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setConflict:(int64_t)a3 forStore:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (_os_feature_enabled_impl())
  {
    if (-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v6))
    {
      if ((unint64_t)a3 < 5)
      {
        -[CloudSettingsManager currentConflictDictionary](self, "currentConflictDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, v6);

        -[CloudSettingsManager writeConflictsDictionaryToPrefs:](self, "writeConflictsDictionaryToPrefs:", v10);
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v6;
        v14 = 2048;
        v15 = a3;
        v7 = MEMORY[0x24BDACB70];
        v8 = "ERROR | setConflict: %@ - out of range: %ld, exit without setting";
        v9 = 22;
LABEL_10:
        _os_log_impl(&dword_20DD2C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v9);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      v7 = MEMORY[0x24BDACB70];
      v8 = "ERROR | setConflict - unknown store:  %@";
      v9 = 12;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[conflictStateForStore] - cloudsettings feature disabled, returning: not evaluated";
    v9 = 2;
    goto LABEL_10;
  }
LABEL_12:

}

- (int64_t)conflictStateForStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  int v15;
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if (-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v4))
    {
      -[CloudSettingsManager currentConflictDictionary](self, "currentConflictDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "intValue");
        v8 = (int)v7;
        if (v7 < 5)
        {
LABEL_17:

          goto LABEL_18;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412546;
          v16 = v4;
          v17 = 2048;
          v18 = v8;
          v9 = MEMORY[0x24BDACB70];
          v10 = "ERROR | conflictStateForStore: %@ - out of range: %ld, returning 0";
LABEL_15:
          _os_log_impl(&dword_20DD2C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0x16u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = (int64_t)v6;
        v9 = MEMORY[0x24BDACB70];
        v10 = "ERROR | conflictStateForStore: %@ - value: %@ does not respond to intValue";
        goto LABEL_15;
      }
      v8 = 0;
      goto LABEL_17;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      v11 = MEMORY[0x24BDACB70];
      v12 = "ERROR | conflictStateForStore - unknown store:  %@";
      v13 = 12;
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "[conflictStateForStore] - cloudsettings feature disabled, returning: not evaluated";
    v13 = 2;
LABEL_11:
    _os_log_impl(&dword_20DD2C000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v13);
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)isServiceKnownForStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v9;
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[CloudSettingsManager knownServiceNames](self, "knownServiceNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[isServiceKnownForStore] - cloudsettings feature disabled, returning: NO", (uint8_t *)&v9, 2u);
      v7 = 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 1024;
    v12 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[isServiceKnownForStore] - %@ - returning: %d", (uint8_t *)&v9, 0x12u);
  }

  return v7;
}

- (void)performFirstTimeSetup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  NSObject *v19;
  const char *v20;
  id v21;
  unsigned int v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  unsigned int v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v21 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("newDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v5, "BOOLValue");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v22;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - isNewDevice: %d, dispatching to all enabled services", buf, 8u);
    }
    -[CloudSettingsManager knownServiceNames](self, "knownServiceNames");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = MEMORY[0x24BDACB70];
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v11;
            _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - Checking service: %@", buf, 0xCu);
          }
          v12 = -[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v11);
          v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v13)
            {
              *(_DWORD *)buf = 138412290;
              v29 = v11;
              _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - setting: %@ first time setup being called", buf, 0xCu);
            }
            -[CloudSettingsManager activeXPCConnectionForStore:](self, "activeXPCConnectionForStore:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "remoteObjectProxy");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "ERROR | remoteObjectProxy returned nil", buf, 2u);
              }
              v17 = objc_opt_respondsToSelector();
              v18 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
              if ((v17 & 1) != 0)
              {
                if (v18)
                {
                  *(_DWORD *)buf = 138412290;
                  v29 = v11;
                  v19 = v8;
                  v20 = "%@ responds to selector";
                  goto LABEL_27;
                }
              }
              else if (v18)
              {
                *(_DWORD *)buf = 138412290;
                v29 = v11;
                v19 = v8;
                v20 = "%@ DOES NOT respond to selector";
LABEL_27:
                _os_log_impl(&dword_20DD2C000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v29 = v11;
                v30 = 1024;
                v31 = v22;
                _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "In framework - [performFirstTimeSetup] have a service, calling performFirstTimeSetupForStore for: %@, with isNewDevice: %d", buf, 0x12u);
              }
              objc_msgSend(v16, "performFirstTimeSetupForStore:newDevice:", v11, v22);
              objc_msgSend(v15, "invalidate");

            }
            else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v11;
              _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "ERROR | performFirstTimeSetup unable to get connection for: %@", buf, 0xCu);
            }

            continue;
          }
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            v29 = v11;
            _os_log_impl(&dword_20DD2C000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - setting: %@ is disabled skip first time setup", buf, 0xCu);
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v7);
    }

    v4 = v21;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - cloudsettings feature disabled", buf, 2u);
  }

}

- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  id v18;
  __int16 v19;
  _WORD v20[9];

  *(_QWORD *)&v20[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v17) = 0;
    v14 = MEMORY[0x24BDACB70];
    v15 = "[applyCloudSettingsToDevice:forStore] - cloudsettings feature disabled";
    v16 = 2;
LABEL_14:
    _os_log_impl(&dword_20DD2C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_18;
  }
  v8 = !-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v7);
  v9 = !-[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v7);
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || (v9 & 1) != 0)
  {
    if (!v10)
      goto LABEL_18;
    v17 = 138412802;
    v18 = v7;
    v19 = 1024;
    *(_DWORD *)v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    v14 = MEMORY[0x24BDACB70];
    v15 = "ERROR | applyCloudSettingsToDevice for store: %@, unknown store: %d, or store is disabled: %d";
    v16 = 24;
    goto LABEL_14;
  }
  if (v10)
  {
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    *(_QWORD *)v20 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - applyCloudSettingsToDevice array: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  -[CloudSettingsManager activeXPCConnectionForStore:](self, "activeXPCConnectionForStore:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling applyCloudSettingsToDevice", (uint8_t *)&v17, 2u);
    }
    objc_msgSend(v11, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applyCloudSettingsToDevice:forStore:", 0, v7);

    objc_msgSend(v11, "invalidate");
  }
  else if (v12)
  {
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_18:
}

- (void)writeToCloudSettings:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  id v18;
  __int16 v19;
  _WORD v20[9];

  *(_QWORD *)&v20[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v17) = 0;
    v14 = MEMORY[0x24BDACB70];
    v15 = "[writeToCloudSettings:forStore] - cloudsettings feature disabled";
    v16 = 2;
LABEL_14:
    _os_log_impl(&dword_20DD2C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_18;
  }
  v8 = !-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v7);
  v9 = !-[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v7);
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || (v9 & 1) != 0)
  {
    if (!v10)
      goto LABEL_18;
    v17 = 138412802;
    v18 = v7;
    v19 = 1024;
    *(_DWORD *)v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    v14 = MEMORY[0x24BDACB70];
    v15 = "ERROR | writeToCloudSettings for store: %@, unknown store: %d, or store is disabled: %d";
    v16 = 24;
    goto LABEL_14;
  }
  if (v10)
  {
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    *(_QWORD *)v20 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - writeToCloudSettings array: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  -[CloudSettingsManager activeXPCConnectionForStore:](self, "activeXPCConnectionForStore:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling writeToCloudSettings", (uint8_t *)&v17, 2u);
    }
    objc_msgSend(v11, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeToCloudSettings:forStore:", v6, v7);

    objc_msgSend(v11, "invalidate");
  }
  else if (v12)
  {
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_18:
}

- (id)deviceSettingsForStore:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  _BYTE v21[18];
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = !-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v4);
    v6 = !-[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v4);
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) == 0 && (v6 & 1) == 0)
    {
      if (v7)
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v4;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - deviceSettingsForStore: %@", v21, 0xCu);
      }
      -[CloudSettingsManager activeXPCConnectionForStore:](self, "activeXPCConnectionForStore:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 138412290;
          *(_QWORD *)&v21[4] = v4;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", v21, 0xCu);
        }
        v13 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v8, "remoteObjectProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_opt_respondsToSelector();
        v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if ((v11 & 1) != 0)
        {
          if (v12)
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - service responds to deviceSettings", v21, 2u);
          }
          objc_msgSend(v10, "deviceSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        if (v12)
        {
          *(_WORD *)v21 = 0;
          v17 = MEMORY[0x24BDACB70];
          v18 = "Service does not support deviceSettings, return nil";
          v19 = 2;
          goto LABEL_25;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v4;
        v17 = MEMORY[0x24BDACB70];
        v18 = "ERROR | deviceSettingsForStore unable to get connection for: %@";
        v19 = 12;
LABEL_25:
        _os_log_impl(&dword_20DD2C000, v17, OS_LOG_TYPE_DEFAULT, v18, v21, v19);
      }
      v13 = 0;
LABEL_27:
      objc_msgSend(v9, "invalidate", *(_OWORD *)v21);

LABEL_28:
      goto LABEL_29;
    }
    if (v7)
    {
      *(_DWORD *)v21 = 138412802;
      *(_QWORD *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = v5;
      v22 = 1024;
      v23 = v6;
      v14 = MEMORY[0x24BDACB70];
      v15 = "ERROR | deviceSettingsForStore for store: %@, unknown store: %d, or store is disabled: %d";
      v16 = 24;
      goto LABEL_16;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    v14 = MEMORY[0x24BDACB70];
    v15 = "[deviceSettingsForStore] - cloudsettings feature disabled, returning nil";
    v16 = 2;
LABEL_16:
    _os_log_impl(&dword_20DD2C000, v14, OS_LOG_TYPE_DEFAULT, v15, v21, v16);
  }
  v13 = 0;
LABEL_29:

  return v13;
}

- (void)applySettingsToDevice:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  id v18;
  __int16 v19;
  _WORD v20[9];

  *(_QWORD *)&v20[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    LOWORD(v17) = 0;
    v14 = MEMORY[0x24BDACB70];
    v15 = "[applySettingsToDevice:forStore] - cloudsettings feature disabled";
    v16 = 2;
LABEL_16:
    _os_log_impl(&dword_20DD2C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_23;
  }
  v8 = !-[CloudSettingsManager isServiceKnownForStore:](self, "isServiceKnownForStore:", v7);
  v9 = !-[CloudSettingsManager isEnabledForStore:](self, "isEnabledForStore:", v7);
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || (v9 & 1) != 0)
  {
    if (!v10)
      goto LABEL_23;
    v17 = 138412802;
    v18 = v7;
    v19 = 1024;
    *(_DWORD *)v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    v14 = MEMORY[0x24BDACB70];
    v15 = "ERROR | applySettingsToDevice for store: %@, unknown store: %d, or store is disabled: %d";
    v16 = 24;
    goto LABEL_16;
  }
  if (v10)
  {
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    *(_QWORD *)v20 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - applySettingsToDevice settings: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  -[CloudSettingsManager activeXPCConnectionForStore:](self, "activeXPCConnectionForStore:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling writeToCloudSettings", (uint8_t *)&v17, 2u);
        }
        objc_msgSend(v13, "applySettingsToDevice:", v6);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Service does not support applySettingsToDevice - exit", (uint8_t *)&v17, 2u);
    }
    objc_msgSend(v12, "invalidate");

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_23:
}

- (id)knownServiceNames
{
  uint8_t v3[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
    return &unk_24C870B20;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[knownServiceNames] - cloudsettings feature disabled", v3, 2u);
  }
  return 0;
}

- (id)defaultSettingsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[16];
  _QWORD v7[17];

  v7[16] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("com.apple.cloudsettings.general");
  v6[1] = CFSTR("com.apple.cloudsettings.appearance");
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = CFSTR("com.apple.cloudsettings.sound");
  v6[3] = CFSTR("com.apple.cloudsettings.keyboard");
  v7[2] = v2;
  v7[3] = v2;
  v6[4] = CFSTR("com.apple.cloudsettings.mouse");
  v6[5] = CFSTR("com.apple.cloudsettings.trackpad");
  v7[4] = v2;
  v7[5] = v2;
  v6[6] = CFSTR("com.apple.cloudsettings.pencil");
  v6[7] = CFSTR("com.apple.cloudsettings.desktop");
  v7[6] = v2;
  v7[7] = v2;
  v6[8] = CFSTR("com.apple.cloudsettings.controlcenter");
  v6[9] = CFSTR("com.apple.cloudsettings.homescreen");
  v7[8] = v2;
  v7[9] = v2;
  v6[10] = CFSTR("com.apple.cloudsettings.screensaver");
  v6[11] = CFSTR("com.apple.cloudsettings.languageregion");
  v7[10] = v2;
  v7[11] = v2;
  v6[12] = CFSTR("com.apple.cloudsettings.displays");
  v6[13] = CFSTR("com.apple.cloudsettings.gamecontroller");
  v7[12] = v2;
  v7[13] = v2;
  v6[14] = CFSTR("com.apple.cloudsettings.international");
  v6[15] = CFSTR("com.apple.cloudsettings.datetime");
  v7[14] = v2;
  v7[15] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeSettingsDictionaryToPrefs:(id)a3
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "writesettings enter, with: %@", (uint8_t *)&v4, 0xCu);
  }
  CFPreferencesSetValue(CFSTR("CloudSettingsState"), v3, CFSTR("com.apple.cloudsettings"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);

}

- (id)currentStateDictionary
{
  CFPropertyListRef v2;
  CFTypeID v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentStateDictionary enter, calling copy pref", (uint8_t *)&v7, 2u);
  }
  v2 = CFPreferencesCopyValue(CFSTR("CloudSettingsState"), CFSTR("com.apple.cloudsettings"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentStateDictionary return from copy pref", (uint8_t *)&v7, 2u);
  }
  if (v2)
  {
    v3 = CFGetTypeID(v2);
    if (v3 == CFDictionaryGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v2);
      if (v4)
        goto LABEL_13;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsState storage is not a dictionary", (uint8_t *)&v7, 2u);
      }
      CFRelease(v2);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentStateDictionary returning: %@", (uint8_t *)&v7, 0xCu);

  }
  return v4;
}

- (id)activeXPCConnectionForStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", v3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7BE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    objc_msgSend(v4, "resume");
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | could not init service with identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)currentConflictDictionary
{
  CFPropertyListRef v2;
  CFTypeID v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentConflictDictionary enter, calling copy pref", (uint8_t *)&v7, 2u);
  }
  v2 = CFPreferencesCopyValue(CFSTR("CloudSettingsConflict"), CFSTR("com.apple.cloudsettings"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentConflictDictionary return from copy pref", (uint8_t *)&v7, 2u);
  }
  if (v2)
  {
    v3 = CFGetTypeID(v2);
    if (v3 == CFDictionaryGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v2);
      if (v4)
        goto LABEL_13;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | currentConflictDictionary storage is not a dictionary", (uint8_t *)&v7, 2u);
      }
      CFRelease(v2);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "currentConflictDictionary returning: %@", (uint8_t *)&v7, 0xCu);

  }
  return v4;
}

- (void)writeConflictsDictionaryToPrefs:(id)a3
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "writeconflicts enter, with: %@", (uint8_t *)&v4, 0xCu);
  }
  CFPreferencesSetValue(CFSTR("CloudSettingsConflict"), v3, CFSTR("com.apple.cloudsettings"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);

}

@end
