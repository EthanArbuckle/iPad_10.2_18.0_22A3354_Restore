@implementation NEDNSSettingsManager

- (NEDNSSettingsManager)init
{
  __assert_rtn("-[NEDNSSettingsManager init]", "NEDNSSettingsManager.m", 39, "0");
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEDNSSettingsManager *v5;
  const char *v6;
  id Property;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5)
      Property = objc_getProperty(v5, v6, 16, 1);
    else
      Property = 0;
    v8 = Property;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E3CC46D0;
    v11[4] = v5;
    v12 = v4;
    objc_msgSend(v8, "loadConfigurationsWithCompletionQueue:handler:", v9, v11);

    objc_sync_exit(v5);
  }

}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEDNSSettingsManager *v5;
  const char *v6;
  const char *v7;
  id v8;
  void *v9;
  const char *v10;
  id *v11;
  NSObject *v12;
  _QWORD *v13;
  id v14;
  SEL v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 40, 1))
  {
    v8 = objc_getProperty(v5, v7, 40, 1);
    objc_msgSend(v8, "payloadInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v14 = objc_getProperty(v5, v10, 16, 1);
      v16 = objc_getProperty(v5, v15, 40, 1);
      v17 = MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v19[3] = &unk_1E3CC2648;
      v20 = v4;
      objc_msgSend(v14, "removeConfiguration:withCompletionQueue:handler:", v16, v17, v19);
      v11 = &v20;

      goto LABEL_10;
    }
    if (v4)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v21[3] = &unk_1E3CC4720;
      v11 = &v22;
      v22 = v4;
      v12 = MEMORY[0x1E0C80D38];
      v13 = v21;
LABEL_8:
      dispatch_async(v12, v13);
LABEL_10:

    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v11 = &v24;
    v24 = v4;
    v12 = MEMORY[0x1E0C80D38];
    v13 = block;
    goto LABEL_8;
  }
  objc_sync_exit(v5);

}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEDNSSettingsManager *v5;
  const char *v6;
  id *v7;
  id v8;
  SEL v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    v8 = objc_getProperty(v5, v6, 16, 1);
    v10 = objc_getProperty(v5, v9, 40, 1);
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E3CC2648;
    v14 = v4;
    objc_msgSend(v8, "saveConfiguration:withCompletionQueue:handler:", v10, v11, v13);
    v7 = &v14;

    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v7 = &v16;
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_6:

  }
  objc_sync_exit(v5);

}

- (BOOL)isEnabled
{
  NEDNSSettingsManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 40, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "dnsSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  id Property;
  id v6;
  void *v7;
  NEDNSSettingsManager *selfa;

  v3 = a3;
  selfa = self;
  objc_sync_enter(selfa);
  Property = selfa;
  if (selfa)
    Property = objc_getProperty(selfa, v4, 40, 1);
  v6 = Property;
  objc_msgSend(v6, "dnsSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  objc_sync_exit(selfa);
}

- (NEDNSSettings)dnsSettings
{
  NEDNSSettingsManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 40, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "dnsSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEDNSSettings *)v7;
}

- (void)setDnsSettings:(NEDNSSettings *)dnsSettings
{
  NEDNSSettingsManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NEDNSSettings *v9;

  v9 = dnsSettings;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 40, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "dnsSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSettings:", v9);

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  NEDNSSettingsManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 40, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "dnsSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDemandRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  NEDNSSettingsManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 40, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "dnsSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnDemandRules:", v9);

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  NEDNSSettingsManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 40, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v6;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  NEDNSSettingsManager *v4;
  const char *v5;
  id Property;
  id v7;
  NSString *v8;

  v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 40, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "setName:", v8);

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEDNSSettingsManager localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("localizedDescription"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettingsManager isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEDNSSettingsManager dnsSettings](self, "dnsSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("dnsSettings"), v5, a4);

  -[NEDNSSettingsManager onDemandRules](self, "onDemandRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("onDemandRules"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEDNSSettingsManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (NSUUID)identifier
{
  if (self)
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  return -[NEDNSSettingsManager identifier](self, "identifier");
}

- (NSString)appBundleIdentifier
{
  if (self)
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  return (NSString *)-[NEDNSSettingsManager application](self, "application");
}

- (BOOL)isFromProfile
{
  void *v2;
  BOOL v3;

  if (self)
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  -[NEDNSSettingsManager payloadInfo](self, "payloadInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  if (self)
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  return (NEProfileIngestionPayloadInfo *)-[NEDNSSettingsManager payloadInfo](self, "payloadInfo");
}

- (BOOL)isConfigurationGradeEnterprise
{
  if (self)
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40, 1);
  return -[NEDNSSettingsManager grade](self, "grade") == 1;
}

- (void)fetchStatusWithCompletionHandler:(id)a3
{
  id v4;
  NEVPNConnection *connection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    connection = self->_connection;
  else
    connection = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3CC4218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1, 0, v7);

}

- (NEDNSSettingsManagerDelegate)delegate
{
  return (NEDNSSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

uint64_t __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "status");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSSettingsErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[NEDNSSettingsManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }

    if (objc_msgSend(v4, "code") == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSSettingsErrorDomain"), 3, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_26;
    v8[3] = &unk_1E3CC46A8;
    v10 = v7;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSSettingsErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSSettingsErrorDomain"), 4, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[NEDNSSettingsManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_25;
    v6[3] = &unk_1E3CC46A8;
    v8 = v5;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  id v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (!v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v22;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = 0;
      v10 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v12, "dnsSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (!v14)
          {
            objc_msgSend(v12, "payloadInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (!v16)
            {
              v17 = v12;

              v9 = v17;
              goto LABEL_15;
            }
            if (!v9)
              v9 = v12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v8)
          continue;
        break;
      }
LABEL_15:

      if (v9)
      {
        v19 = *(void **)(a1 + 32);
        if (!v19)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_setProperty_atomic(v19, v18, v9, 40);
LABEL_20:
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
          *(_BYTE *)(v20 + 8) = 1;
        goto LABEL_22;
      }
    }
    else
    {

    }
    -[NEDNSSettingsManager createEmptyConfigurationWithGrade:](*(void **)(a1 + 32));
    v9 = 0;
    goto LABEL_20;
  }
LABEL_23:
  v21 = *(void **)(a1 + 40);
  if (v21)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC46A8;
    v25 = v21;
    v24 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_sync_exit(v6);

}

- (void)createEmptyConfigurationWithGrade:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NEConfiguration *v8;
  SEL v9;
  NEDNSSettingsBundle *v10;
  SEL v11;
  SEL v12;
  SEL v13;
  id v14;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "infoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C9AE88]);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v8 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v14, 2);
    objc_setProperty_atomic(a1, v9, v8, 40);

    v10 = objc_alloc_init(NEDNSSettingsBundle);
    objc_msgSend(objc_getProperty(a1, v11, 40, 1), "setDnsSettings:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 40, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 40, 1), "setApplicationName:", v14);

  }
}

uint64_t __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (NEDNSSettingsManager)sharedManager
{
  void *v2;
  id v3;

  if (sharedManager_onceToken_15983 != -1)
    dispatch_once(&sharedManager_onceToken_15983, &__block_literal_global_15984);
  v2 = (void *)sharedManager_gDNSSettingsManager;
  if (sharedManager_gDNSSettingsManager)
    v3 = (id)sharedManager_gDNSSettingsManager;
  return (NEDNSSettingsManager *)v2;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[NEDNSSettingsManager globalConfigurationManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3CC4630;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

}

+ (id)globalConfigurationManager
{
  objc_opt_self();
  if (globalConfigurationManager_onceToken_15976 != -1)
    dispatch_once(&globalConfigurationManager_onceToken_15976, &__block_literal_global_15_15977);
  return (id)globalConfigurationManager_gConfigurationManager_15978;
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  NEDNSSettingsManager *v15;
  id v16;
  id *v17;
  id *v18;
  uint64_t v19;
  id v20;
  id *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  SEL v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *group;
  _QWORD block[4];
  id v40;
  id v41;
  _QWORD v42[5];
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id location;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  group = dispatch_group_create();
  v36 = v5;
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
  else
  {
    v35 = a1;
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "dnsSettings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              dispatch_group_enter(group);
              v15 = [NEDNSSettingsManager alloc];
              v16 = v12;
              if (v15
                && (v48.receiver = v15,
                    v48.super_class = (Class)NEDNSSettingsManager,
                    v17 = (id *)objc_msgSendSuper2(&v48, sel_init),
                    (v18 = v17) != 0))
              {
                objc_storeStrong(v17 + 5, v12);
                +[NEDNSSettingsManager globalConfigurationManager]();
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = v18[2];
                v18[2] = (id)v19;

                v21 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 7);
                v22 = v18[3];
                v18[3] = v21;

                *((_BYTE *)v18 + 8) = 1;
              }
              else
              {

                v18 = 0;
              }
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v42[3] = &unk_1E3CC25F8;
              v42[4] = v16;
              v43 = group;
              v23 = v42;
              if (v18)
              {
                objc_initWeak(&location, v18);
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v18[3];
                objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v48.receiver = (id)MEMORY[0x1E0C809B0];
                v48.super_class = (Class)3221225472;
                v49 = __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke;
                v50 = &unk_1E3CC2620;
                objc_copyWeak(&v51, &location);
                objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.networkextension.statuschanged"), v25, v26, &v48);
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = v18[4];
                v18[4] = (id)v27;

                v29 = v18[3];
                v31 = objc_getProperty(v18, v30, 40, 1);
                objc_msgSend(v31, "identifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v29, v32, 0, v23);

                objc_destroyWeak(&v51);
                objc_destroyWeak(&location);
              }

              objc_msgSend(v37, "addObject:", v18);
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20;
    block[3] = &unk_1E3CC46A8;
    v33 = *(id *)(v35 + 32);
    v40 = v37;
    v41 = v33;
    v34 = v37;
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  }
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to create a DNS settings session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "dnsSettingsStatusDidChange:", v4);

    WeakRetained = v4;
  }

}

uint64_t __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  id v3;
  void *v4;

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("DNS settings config manager change queue", v0);
  v2 = (void *)globalConfigurationManager_gChangeQueue_15980;
  globalConfigurationManager_gChangeQueue_15980 = (uint64_t)v1;

  v3 = -[NEConfigurationManager initForAllUsers]([NEConfigurationManager alloc], "initForAllUsers");
  v4 = (void *)globalConfigurationManager_gConfigurationManager_15978;
  globalConfigurationManager_gConfigurationManager_15978 = (uint64_t)v3;

  return objc_msgSend((id)globalConfigurationManager_gConfigurationManager_15978, "setChangedQueue:andHandler:", globalConfigurationManager_gChangeQueue_15980, &__block_literal_global_17_15982);
}

void __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.networkextension.dns-settings-configuration-changed"), 0);

}

void __37__NEDNSSettingsManager_sharedManager__block_invoke()
{
  NEDNSSettingsManager *v0;
  _QWORD *v1;
  NSObject *v2;
  NEConfigurationManager *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id location;
  objc_super v11;
  __int128 buf;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v0 = [NEDNSSettingsManager alloc];
  if (!v0)
  {
LABEL_9:
    v1 = 0;
    goto LABEL_11;
  }
  v11.receiver = v0;
  v11.super_class = (Class)NEDNSSettingsManager;
  v1 = objc_msgSendSuper2(&v11, sel_init);
  if (v1)
  {
    if (!+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
    {
      objc_initWeak(&location, v1);
      v3 = objc_alloc_init(NEConfigurationManager);
      v4 = (void *)v1[2];
      v1[2] = v3;

      v5 = (void *)v1[2];
      v6 = MEMORY[0x1E0C80D38];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v13 = __38__NEDNSSettingsManager_initWithGrade___block_invoke;
      v14 = &unk_1E3CC3BF0;
      objc_copyWeak(v15, &location);
      objc_msgSend(v5, "setChangedQueue:andHandler:", MEMORY[0x1E0C80D38], &buf);

      -[NEDNSSettingsManager createEmptyConfigurationWithGrade:](v1);
      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      v9 = v8;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_9;
  }
LABEL_11:
  v7 = (void *)sharedManager_gDNSSettingsManager;
  sharedManager_gDNSSettingsManager = (uint64_t)v1;

}

void __38__NEDNSSettingsManager_initWithGrade___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__NEDNSSettingsManager_initWithGrade___block_invoke_2;
  v6[3] = &unk_1E3CC3148;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "loadFromPreferencesWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
}

void __38__NEDNSSettingsManager_initWithGrade___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.networkextension.dns-settings-configuration-changed"), WeakRetained);

}

@end
