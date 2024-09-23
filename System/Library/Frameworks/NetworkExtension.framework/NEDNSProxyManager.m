@implementation NEDNSProxyManager

- (NEDNSProxyManager)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "MDM must be used to create NEDNSProxyProvider configurations", v5, 2u);
  }

  return 0;
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
  v5.super_class = (Class)NEDNSProxyManager;
  -[NEDNSProxyManager dealloc](&v5, sel_dealloc);
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEDNSProxyManager *v5;
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
    v11[2] = __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
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
  NEDNSProxyManager *v5;
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
  -[NEDNSProxyManager configuration](v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEDNSProxyManager configuration](v5, "configuration");
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
      -[NEDNSProxyManager configuration](v5, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
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
      v20[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
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
    block[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke;
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
  NEDNSProxyManager *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SEL v11;
  id v12;
  void *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  SEL v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  id v29;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providerBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      v6 = v9;

      -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProviderBundleIdentifier:", v6);

      v12 = objc_getProperty(v5, v11, 16, 1);
      objc_msgSend(v12, "pluginType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v15 = objc_getProperty(v5, v14, 16, 1);
        objc_msgSend(v15, "pluginType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPluginType:", v16);

      }
      -[NEDNSProxyManager configuration](v5, "configuration");
      v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v18[20] = 0;

      v20 = objc_getProperty(v5, v19, 16, 1);
      -[NEDNSProxyManager configuration](v5, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C80D38];
      v23 = MEMORY[0x1E0C80D38];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v24[3] = &unk_1E3CC2648;
      v25 = v4;
      objc_msgSend(v20, "saveConfiguration:withCompletionQueue:handler:", v21, v22, v24);

      goto LABEL_13;
    }
    if (v4)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      v26[3] = &unk_1E3CC4720;
      v27 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v26);
      v6 = v27;
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v29 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v29;
LABEL_13:

  }
  objc_sync_exit(v5);

}

- (NEDNSProxyProviderProtocol)providerProtocol
{
  NEDNSProxyManager *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEDNSProxyManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dnsProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEDNSProxyProviderProtocol *)v5;
}

- (void)setProviderProtocol:(NEDNSProxyProviderProtocol *)providerProtocol
{
  NEDNSProxyManager *v4;
  void *v5;
  void *v6;
  NEDNSProxyProviderProtocol *v7;

  v7 = providerProtocol;
  v4 = self;
  objc_sync_enter(v4);
  -[NEDNSProxyManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dnsProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocol:", v7);

  objc_sync_exit(v4);
}

- (BOOL)isEnabled
{
  NEDNSProxyManager *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEDNSProxyManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dnsProxy");
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
  NEDNSProxyManager *obj;

  v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  -[NEDNSProxyManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dnsProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  NEDNSProxyManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NEDNSProxyManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  NEDNSProxyManager *v4;
  void *v5;
  NSString *v6;

  v6 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  -[NEDNSProxyManager configuration](v4, "configuration");
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
  -[NEDNSProxyManager localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("localizedDescription"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSProxyManager isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEDNSProxyManager providerProtocol](self, "providerProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("providerProtocol"), v5, a4);

  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

- (id)description
{
  return -[NEDNSProxyManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[NEDNSProxyManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[NEDNSProxyManager configuration](self, "configuration");
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

  -[NEDNSProxyManager configuration](self, "configuration");
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

  if (!-[NEDNSProxyManager isFromProfile](self, "isFromProfile"))
    return 0;
  -[NEDNSProxyManager configuration](self, "configuration");
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

  -[NEDNSProxyManager configuration](self, "configuration");
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
  v7[2] = __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke;
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

- (NEDNSProxyManagerDelegate)delegate
{
  return (NEDNSProxyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

uint64_t __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSProxyErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSProxyErrorDomain"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[NEDNSProxyManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_29;
    v7[3] = &unk_1E3CC46A8;
    v9 = v6;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSProxyErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEDNSProxyErrorDomain"), 4, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
      v10 = "-[NEDNSProxyManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
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
    v6[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_25;
    v6[3] = &unk_1E3CC46A8;
    v8 = v5;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
    goto LABEL_22;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v20;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v8)
  {

LABEL_18:
    -[NEDNSProxyManager createEmptyConfiguration](*(void **)(a1 + 32));
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v12, "dnsProxy");
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
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
      continue;
    break;
  }
LABEL_15:

  if (!v9)
    goto LABEL_18;
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v9);
LABEL_19:
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    *(_BYTE *)(v18 + 8) = 1;

LABEL_22:
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC46A8;
    v23 = v19;
    v22 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_sync_exit(v6);

}

- (void)createEmptyConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  NEConfiguration *v5;
  NEDNSProxy *v6;
  void *v7;
  NEDNSProxyProviderProtocol *v8;
  SEL v9;
  void *v10;
  NEDNSProxyProviderProtocol *v11;
  void *v12;
  void *v13;
  SEL v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v18, 1);
    objc_msgSend(a1, "setConfiguration:", v5);

    v6 = objc_alloc_init(NEDNSProxy);
    objc_msgSend(a1, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDnsProxy:", v6);

    v8 = [NEDNSProxyProviderProtocol alloc];
    objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NEDNSProxyProviderProtocol initWithPluginType:](v8, "initWithPluginType:", v10);
    objc_msgSend(a1, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dnsProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProtocol:", v11);

    objc_msgSend(objc_getProperty(a1, v14, 16, 1), "pluginType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setApplication:", v15);

    objc_msgSend(a1, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setApplicationName:", v18);

  }
}

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (NEDNSProxyManager)sharedManager
{
  void *v2;
  id v3;

  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1378);
  v2 = (void *)sharedManager_gDNSProxyManager;
  if (sharedManager_gDNSProxyManager)
    v3 = (id)sharedManager_gDNSProxyManager;
  return (NEDNSProxyManager *)v2;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    +[NEDNSProxyManager globalConfigurationManager]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E3CC4630;
    v6 = v3;
    objc_msgSend(v4, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v5);

  }
}

+ (id)globalConfigurationManager
{
  objc_opt_self();
  if (globalConfigurationManager_onceToken != -1)
    dispatch_once(&globalConfigurationManager_onceToken, &__block_literal_global_15);
  return (id)globalConfigurationManager_gConfigurationManager;
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  NEDNSProxyManager *v15;
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
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id obj;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  _QWORD v41[5];
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id location;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = dispatch_group_create();
  v35 = v5;
  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

  }
  else
  {
    v34 = a1;
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (v12)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dnsProxy");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              dispatch_group_enter(v6);
              v15 = [NEDNSProxyManager alloc];
              v16 = v12;
              if (v15
                && (v47.receiver = v15,
                    v47.super_class = (Class)NEDNSProxyManager,
                    v17 = (id *)objc_msgSendSuper2(&v47, sel_init),
                    (v18 = v17) != 0))
              {
                objc_storeStrong(v17 + 5, v12);
                +[NEDNSProxyManager globalConfigurationManager]();
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = v18[2];
                v18[2] = (id)v19;

                v21 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 6);
                v22 = v18[3];
                v18[3] = v21;

                *((_BYTE *)v18 + 8) = 1;
              }
              else
              {

                v18 = 0;
              }
              v41[0] = MEMORY[0x1E0C809B0];
              v41[1] = 3221225472;
              v41[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v41[3] = &unk_1E3CC25F8;
              v41[4] = v16;
              v42 = v6;
              v23 = v41;
              if (v18)
              {
                objc_initWeak(&location, v18);
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v18[3];
                objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v47.receiver = (id)MEMORY[0x1E0C809B0];
                v47.super_class = (Class)3221225472;
                v48 = __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke;
                v49 = &unk_1E3CC2620;
                objc_copyWeak(&v50, &location);
                objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.networkextension.statuschanged"), v25, v26, &v47);
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = v18[4];
                v18[4] = (id)v27;

                v29 = v18[3];
                objc_msgSend(v18, "configuration");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v29, v31, 0, v23);

                objc_destroyWeak(&v50);
                objc_destroyWeak(&location);
              }

              objc_msgSend(v37, "addObject:", v18);
            }
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20;
    block[3] = &unk_1E3CC46A8;
    v32 = *(id *)(v34 + 32);
    v39 = v37;
    v40 = v32;
    v33 = v37;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

  }
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to create a DNS proxy session for configuration %@ (%@): %@", (uint8_t *)&v7, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
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
      objc_msgSend(v2, "dnsProxyStatusDidChange:", v4);

    WeakRetained = v4;
  }

}

uint64_t __47__NEDNSProxyManager_globalConfigurationManager__block_invoke()
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
  v1 = dispatch_queue_create("dns proxy config manager change queue", v0);
  v2 = (void *)globalConfigurationManager_gChangeQueue;
  globalConfigurationManager_gChangeQueue = (uint64_t)v1;

  v3 = -[NEConfigurationManager initForAllUsers]([NEConfigurationManager alloc], "initForAllUsers");
  v4 = (void *)globalConfigurationManager_gConfigurationManager;
  globalConfigurationManager_gConfigurationManager = (uint64_t)v3;

  return objc_msgSend((id)globalConfigurationManager_gConfigurationManager, "setChangedQueue:andHandler:", globalConfigurationManager_gChangeQueue, &__block_literal_global_17);
}

void __47__NEDNSProxyManager_globalConfigurationManager__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.networkextension.dns-proxy-configuration-changed"), 0);

}

void __34__NEDNSProxyManager_sharedManager__block_invoke()
{
  void *v0;
  void *v1;
  NEDNSProxyManager *v2;
  id v3;
  NEConfigurationManager *v4;
  NEConfigurationManager *configurationManager;
  NEConfigurationManager *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v1 = v10;
  if (v10)
  {
    v2 = [NEDNSProxyManager alloc];
    v3 = v10;
    if (v2)
    {
      v14.receiver = v2;
      v14.super_class = (Class)NEDNSProxyManager;
      v2 = (NEDNSProxyManager *)objc_msgSendSuper2(&v14, sel_init);
      if (v2)
      {
        objc_initWeak(&location, v2);
        v4 = -[NEConfigurationManager initWithPluginType:]([NEConfigurationManager alloc], "initWithPluginType:", v3);
        configurationManager = v2->_configurationManager;
        v2->_configurationManager = v4;

        v6 = v2->_configurationManager;
        v7 = MEMORY[0x1E0C80D38];
        v8 = MEMORY[0x1E0C80D38];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke;
        v11[3] = &unk_1E3CC3BF0;
        objc_copyWeak(&v12, &location);
        -[NEConfigurationManager setChangedQueue:andHandler:](v6, "setChangedQueue:andHandler:", v7, v11);

        -[NEDNSProxyManager createEmptyConfiguration](v2);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }

    v9 = (void *)sharedManager_gDNSProxyManager;
    sharedManager_gDNSProxyManager = (uint64_t)v2;

    v1 = v10;
  }

}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_1E3CC3148;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "loadFromPreferencesWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.networkextension.dns-proxy-configuration-changed"), WeakRetained);

}

@end
