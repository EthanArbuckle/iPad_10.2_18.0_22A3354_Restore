@implementation NEFilterManager

- (NEFilterManager)init
{
  __assert_rtn("-[NEFilterManager init]", "NEFilterManager.m", 98, "0");
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  if (self && self->_statusObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = self->_statusObserver;
    objc_msgSend(v3, "removeObserver:name:object:", v4, CFSTR("com.apple.networkextension.statuschanged"), self->_connection);

  }
  v5.receiver = self;
  v5.super_class = (Class)NEFilterManager;
  -[NEFilterManager dealloc](&v5, sel_dealloc);
}

- (id)initPrivate
{
  NEFilterManager *v2;
  uint64_t v3;
  NEConfigurationManager *configurationManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFilterManager;
  v2 = -[NEFilterManager init](&v6, sel_init);
  if (v2)
  {
    +[NEFilterManager appConfigurationManager]();
    v3 = objc_claimAutoreleasedReturnValue();
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = (NEConfigurationManager *)v3;

    -[NEFilterManager createEmptyConfiguration](v2);
    v2->_hasLoaded = 1;
  }
  return v2;
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEFilterManager *v5;
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
    v11[2] = __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke;
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
  NEFilterManager *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  id *v10;
  NSObject *v11;
  _QWORD *v12;
  id Property;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  id v23;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  -[NEFilterManager configuration](v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEFilterManager configuration](v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (v5)
        Property = objc_getProperty(v5, v9, 16, 1);
      else
        Property = 0;
      v14 = Property;
      -[NEFilterManager configuration](v5, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_1E3CC2648;
      v19 = v4;
      objc_msgSend(v14, "removeConfiguration:withCompletionQueue:handler:", v15, v16, v18);
      v10 = &v19;

      goto LABEL_11;
    }
    if (v4)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_1E3CC4720;
      v10 = &v21;
      v21 = v4;
      v11 = MEMORY[0x1E0C80D38];
      v12 = v20;
LABEL_7:
      dispatch_async(v11, v12);
LABEL_11:

    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v10 = &v23;
    v23 = v4;
    v11 = MEMORY[0x1E0C80D38];
    v12 = block;
    goto LABEL_7;
  }
  objc_sync_exit(v5);

}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEFilterManager *v5;
  id *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  int v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  void *v32;
  const char *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD block[4];
  id v44;
  _QWORD v45[4];
  id v46;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "filterSockets");

      if (v11)
      {
        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "filterDataProviderBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dataProviderURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v16 = v13;

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFilterDataProviderBundleIdentifier:", v16);

        -[NEFilterManager configuration](v5, "configuration");
        v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v18)
          v18[20] = 0;

      }
      -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "filterPackets");

      if (v20)
      {
        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "filterPacketProviderBundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "packetProviderURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v26 = v23;

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFilterPacketProviderBundleIdentifier:", v26);

        -[NEFilterManager configuration](v5, "configuration");
        v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (!v28 || (v29 = v28[20], v28, !v29))
        {
          -[NEFilterManager configuration](v5, "configuration");
          v30 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v30)
            v30[20] = 0;

        }
      }
      v31 = objc_getProperty(v5, v21, 16, 1);
      objc_msgSend(v31, "pluginType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v34 = objc_getProperty(v5, v33, 16, 1);
        objc_msgSend(v34, "pluginType");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPluginType:", v35);

      }
      v37 = objc_getProperty(v5, v33, 16, 1);
      -[NEFilterManager configuration](v5, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x1E0C80D38];
      v40 = MEMORY[0x1E0C80D38];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v41[3] = &unk_1E3CC2648;
      v42 = v4;
      objc_msgSend(v37, "saveConfiguration:withCompletionQueue:handler:", v38, v39, v41);
      v6 = &v42;

      goto LABEL_23;
    }
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E3CC4720;
      v6 = &v44;
      v44 = v4;
      v7 = MEMORY[0x1E0C80D38];
      v8 = block;
      goto LABEL_22;
    }
  }
  else if (v4)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke;
    v45[3] = &unk_1E3CC4720;
    v6 = &v46;
    v46 = v4;
    v7 = MEMORY[0x1E0C80D38];
    v8 = v45;
LABEL_22:
    dispatch_async(v7, v8);
LABEL_23:

  }
  objc_sync_exit(v5);

}

- (NEFilterProviderConfiguration)providerConfiguration
{
  NEFilterManager *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEFilterProviderConfiguration *)v5;
}

- (void)setProviderConfiguration:(NEFilterProviderConfiguration *)providerConfiguration
{
  NEFilterManager *v4;
  void *v5;
  void *v6;
  NEFilterProviderConfiguration *v7;

  v7 = providerConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  -[NEFilterManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProvider:", v7);

  objc_sync_exit(v4);
}

- (BOOL)isEnabled
{
  NEFilterManager *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  objc_sync_exit(v2);
  return v5;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NEFilterManager *obj;

  v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  -[NEFilterManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  objc_sync_exit(obj);
}

- (BOOL)disableEncryptedDNSSettings
{
  NEFilterManager *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableEncryptedDNSSettings");

  objc_sync_exit(v2);
  return v5;
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NEFilterManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[NEFilterManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisableEncryptedDNSSettings:", v3);

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  NEFilterManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  NEFilterManager *v4;
  void *v5;
  NSString *v6;

  v6 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  -[NEFilterManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v7, "appendString:", CFSTR("{"));
  -[NEFilterManager localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("localizedDescription"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterManager isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEFilterManager providerConfiguration](self, "providerConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("providerConfiguration"), v5, a4);

  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

- (id)description
{
  return -[NEFilterManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (NEFilterManagerGrade)grade
{
  NEFilterManager *v2;
  void *v3;
  void *v4;
  NEFilterManagerGrade v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "grade");

  objc_sync_exit(v2);
  return v5;
}

- (void)setGrade:(NEFilterManagerGrade)grade
{
  void *v4;
  void *v5;
  NEFilterManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NEFilterManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGrade:", grade);

  objc_sync_exit(obj);
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[NEFilterManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[NEFilterManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFromProfile
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NEFilterManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isFromMDM
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[NEFilterManager isFromProfile](self, "isFromProfile"))
    return 0;
  -[NEFilterManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "profileSource") == 2;

  return v5;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  void *v2;
  void *v3;

  -[NEFilterManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEProfileIngestionPayloadInfo *)v3;
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
  v7[2] = __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3CC4218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1, 0, v7);

}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NEFilterManagerDelegate)delegate
{
  return (NEFilterManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

uint64_t __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
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
  if (v3)
  {
    v4 = v3;
    NEFilterMapError(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[NEFilterManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
        v13 = 2112;
        v14 = v5;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
    v8[3] = &unk_1E3CC46A8;
    v10 = v7;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 4, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
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
  if (v3)
  {
    v4 = v3;
    NEFilterMapError(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[NEFilterManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
        v13 = 2112;
        v14 = v5;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_31;
    v8[3] = &unk_1E3CC46A8;
    v10 = v7;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    NEFilterMapError(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
  {

LABEL_19:
    -[NEFilterManager createEmptyConfiguration](*(_BYTE **)(a1 + 32));
    v11 = 0;
    goto LABEL_20;
  }
  v11 = 0;
  v12 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v14, "contentFilter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        objc_msgSend(v14, "payloadInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          v19 = v14;

          v11 = v19;
          goto LABEL_16;
        }
        if (!v11)
          v11 = v14;
      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  if (!v11)
    goto LABEL_19;
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v11);
LABEL_20:
  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
    *(_BYTE *)(v20 + 8) = 1;

  v8 = 0;
LABEL_23:
  v21 = *(void **)(a1 + 40);
  if (v21)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E3CC46A8;
    v24 = v21;
    v23 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

  }
  objc_sync_exit(v7);

}

- (void)createEmptyConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NEConfiguration *v6;
  NEContentFilter *v7;
  void *v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((a1[9] & 1) != 0)
      v5 = 3;
    else
      v5 = 1;
    v6 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v13, v5);
    objc_msgSend(a1, "setConfiguration:", v6);

    v7 = objc_alloc_init(NEContentFilter);
    objc_msgSend(a1, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentFilter:", v7);

    objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setApplication:", v10);

    objc_msgSend(a1, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setApplicationName:", v13);

  }
}

uint64_t __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)appConfigurationManager
{
  objc_opt_self();
  if (appConfigurationManager_onceToken != -1)
    dispatch_once(&appConfigurationManager_onceToken, &__block_literal_global_20);
  return (id)appConfigurationManager_gAppConfgurationManager;
}

void __42__NEFilterManager_appConfigurationManager__block_invoke()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;
  NEConfigurationManager *v3;
  void *v4;
  id v5;

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("filter config app manager change queue", 0);
  v2 = (void *)appConfigurationManager_gChangeQueue;
  appConfigurationManager_gChangeQueue = (uint64_t)v1;

  v3 = -[NEConfigurationManager initWithPluginType:]([NEConfigurationManager alloc], "initWithPluginType:", v5);
  v4 = (void *)appConfigurationManager_gAppConfgurationManager;
  appConfigurationManager_gAppConfgurationManager = (uint64_t)v3;

  objc_msgSend((id)appConfigurationManager_gAppConfgurationManager, "setChangedQueue:andHandler:", appConfigurationManager_gChangeQueue, &__block_literal_global_22);
}

void __42__NEFilterManager_appConfigurationManager__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.networkextension.filter-configuration-changed"), 0);

}

+ (NEFilterManager)sharedManager
{
  if (sharedManager_onceToken_5307 != -1)
    dispatch_once(&sharedManager_onceToken_5307, &__block_literal_global_5308);
  return (NEFilterManager *)(id)sharedManager_gFilterManager;
}

+ (id)sharedManagerWithSystemFilter
{
  if (sharedManagerWithSystemFilter_onceToken != -1)
    dispatch_once(&sharedManagerWithSystemFilter_onceToken, &__block_literal_global_16);
  return (id)sharedManagerWithSystemFilter_gFilterManager;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[NEFilterManager globalConfigurationManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3CC4630;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

}

+ (void)loadMyFiltersFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[NEFilterManager appConfigurationManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3CC4630;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NEFilterManager *v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[5];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = dispatch_group_create();
  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

  }
  else
  {
    v21 = v5;
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "contentFilter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              dispatch_group_enter(v6);
              v16 = [NEFilterManager alloc];
              +[NEFilterManager appConfigurationManager]();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18)
                *((_BYTE *)v18 + 8) = 1;
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_1E3CC25F8;
              v26[4] = v14;
              v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              objc_msgSend(v22, "addObject:", v18);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_27;
    block[3] = &unk_1E3CC46A8;
    v19 = *(id *)(a1 + 32);
    v24 = v22;
    v25 = v19;
    v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

    v5 = v21;
  }

}

- (id)initWithConfiguration:(void *)a3 configurationManager:
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEFilterManager;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 5, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 4);
      v10 = a1[3];
      a1[3] = v9;

    }
  }

  return a1;
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to create a content filter session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)setupSessionWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 24);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke;
    v15 = &unk_1E3CC2620;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.networkextension.statuschanged"), v5, v6, &v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v7;

    v9 = *(id *)(a1 + 24);
    objc_msgSend((id)a1, "configuration", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v9, v11, 0, v3);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
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
      objc_msgSend(v2, "filterStatusDidChange:", v4);

    WeakRetained = v4;
  }

}

+ (id)globalConfigurationManager
{
  objc_opt_self();
  if (globalConfigurationManager_onceToken_5302 != -1)
    dispatch_once(&globalConfigurationManager_onceToken_5302, &__block_literal_global_17_5303);
  return (id)globalConfigurationManager_gConfigurationManager_5304;
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NEFilterManager *v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[5];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = dispatch_group_create();
  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

  }
  else
  {
    v21 = v5;
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "contentFilter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              dispatch_group_enter(v6);
              v16 = [NEFilterManager alloc];
              +[NEFilterManager globalConfigurationManager]();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18)
                *((_BYTE *)v18 + 8) = 1;
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_1E3CC25F8;
              v26[4] = v14;
              v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              objc_msgSend(v22, "addObject:", v18);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_25;
    block[3] = &unk_1E3CC46A8;
    v19 = *(id *)(a1 + 32);
    v24 = v22;
    v25 = v19;
    v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

    v5 = v21;
  }

}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to create a content filter session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __45__NEFilterManager_globalConfigurationManager__block_invoke()
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
  v1 = dispatch_queue_create("filter config manager change queue", v0);
  v2 = (void *)globalConfigurationManager_gChangeQueue_5306;
  globalConfigurationManager_gChangeQueue_5306 = (uint64_t)v1;

  v3 = -[NEConfigurationManager initForAllUsers]([NEConfigurationManager alloc], "initForAllUsers");
  v4 = (void *)globalConfigurationManager_gConfigurationManager_5304;
  globalConfigurationManager_gConfigurationManager_5304 = (uint64_t)v3;

  return objc_msgSend((id)globalConfigurationManager_gConfigurationManager_5304, "setChangedQueue:andHandler:", globalConfigurationManager_gChangeQueue_5306, &__block_literal_global_19);
}

void __45__NEFilterManager_globalConfigurationManager__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.networkextension.filter-configuration-changed"), 0);

}

void __48__NEFilterManager_sharedManagerWithSystemFilter__block_invoke()
{
  void *v0;
  NEFilterManager *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  if (v3)
  {
    v1 = [NEFilterManager alloc];
    if (v1)
    {
      v1->_isSystemGradeFilter = 1;
      v1 = (NEFilterManager *)-[NEFilterManager initFilterManagerWithPluginType:](v1, v3);
    }
    v2 = (void *)sharedManagerWithSystemFilter_gFilterManager;
    sharedManagerWithSystemFilter_gFilterManager = (uint64_t)v1;

  }
}

- (_QWORD)initFilterManagerWithPluginType:(_QWORD *)a1
{
  id v3;
  NEConfigurationManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NEFilterManager;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      objc_initWeak(&location, a1);
      v4 = -[NEConfigurationManager initWithPluginType:]([NEConfigurationManager alloc], "initWithPluginType:", v3);
      v5 = (void *)a1[2];
      a1[2] = v4;

      v6 = (void *)a1[2];
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke;
      v10[3] = &unk_1E3CC3BF0;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v6, "setChangedQueue:andHandler:", v7, v10);

      -[NEFilterManager createEmptyConfiguration](a1);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_1E3CC3148;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "loadFromPreferencesWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.networkextension.filter-configuration-changed"), WeakRetained);

}

void __32__NEFilterManager_sharedManager__block_invoke()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v1 = v4;
  if (v4)
  {
    v2 = -[NEFilterManager initFilterManagerWithPluginType:]([NEFilterManager alloc], v4);
    v3 = (void *)sharedManager_gFilterManager;
    sharedManager_gFilterManager = (uint64_t)v2;

    v1 = v4;
  }

}

@end
