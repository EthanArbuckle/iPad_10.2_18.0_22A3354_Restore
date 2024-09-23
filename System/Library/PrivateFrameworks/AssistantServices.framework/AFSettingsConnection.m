@implementation AFSettingsConnection

- (AFSettingsConnection)init
{
  return -[AFSettingsConnection initWithInstanceContext:](self, "initWithInstanceContext:", 0);
}

- (void)fetchSupportedMultiUserLanguageCodes:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    AFPreferencesSupportedMultiUserLanguages();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v4, v5, 0);

  }
}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1)
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFSettingsConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFSettingsConnection dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  -[AFSettingsConnection _clearConnection](self, "_clearConnection");
  v4.receiver = self;
  v4.super_class = (Class)AFSettingsConnection;
  -[AFSettingsConnection dealloc](&v4, sel_dealloc);
}

- (void)_clearConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AFSettingsDelegate _settingsConnectionDidDisconnect](self->_delegate, "_settingsConnectionDidDisconnect");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_selectedVoice, 0);
  objc_storeStrong((id *)&self->_voices, 0);
  objc_storeStrong((id *)&self->_voicesQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (AFSettingsConnection)initWithInstanceContext:(id)a3
{
  id v5;
  AFSettingsConnection *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *voicesQueue;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  AFSettingsConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSettingsConnection;
  v6 = -[AFSettingsConnection init](&v12, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("SettingsVoices", v7);
    voicesQueue = v6->_voicesQueue;
    v6->_voicesQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_serialQueue, MEMORY[0x1E0C80D38]);
    objc_storeStrong((id *)&v6->_instanceContext, a3);
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFSettingsConnection initWithInstanceContext:]";
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFSettingsConnection;
  -[AFSettingsConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {instanceContext = %@}"), v4, self->_instanceContext);

  return v5;
}

- (void)setXPCConnectionManagementQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (id)_connection
{
  NSXPCConnection *connection;
  AFInstanceContext *instanceContext;
  AFInstanceContext *v5;
  AFInstanceContext *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSXPCConnection *v12;
  void *v13;
  NSXPCConnection *v14;
  void *v15;
  NSXPCConnection *v16;
  AFSettingsConnectionServiceDelegate *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (!instanceContext)
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v5 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
      v6 = self->_instanceContext;
      self->_instanceContext = v5;

      instanceContext = self->_instanceContext;
    }
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.settings"), 0);
    v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    v9 = self->_connection;
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__AFSettingsConnection__connection__block_invoke;
    v21[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v21);
    v11 = self->_connection;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __35__AFSettingsConnection__connection__block_invoke_10;
    v19[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v19);
    v12 = self->_connection;
    AFSettingsServiceXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v13);

    v14 = self->_connection;
    AFSettingsServiceDelegateXPCInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v14, "setExportedInterface:", v15);

    v16 = self->_connection;
    v17 = -[AFSettingsConnectionServiceDelegate initWithSettingsConnection:]([AFSettingsConnectionServiceDelegate alloc], "initWithSettingsConnection:", self);
    -[NSXPCConnection setExportedObject:](v16, "setExportedObject:", v17);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (id)_settingsServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFSettingsConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_synchronousSettingsServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFSettingsConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchSupportedLanguageCodes:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    AFPreferencesSupportedLanguages();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v4, v5, 0);

  }
}

- (void)isRecognizeMyVoiceAvailable:(id)a3
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  if (v3)
  {
    v6 = v3;
    AFPreferencesSupportedMultiUserLanguages();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((AFSupportsMultiUser() & 1) != 0)
    {
      _AFPreferencesValueForKeyWithContext(CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, objc_msgSend(v4, "containsObject:", v5));

    }
    else
    {
      v6[2](v6, 0);
    }

    v3 = v6;
  }

}

- (void)fetchAccountsSynchronously:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke;
    v17[3] = &unk_1E3A35B08;
    v9 = &v18;
    v18 = v6;
    -[AFSettingsConnection _synchronousSettingsServiceWithErrorHandler:](self, "_synchronousSettingsServiceWithErrorHandler:", v17);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_14;
    v15[3] = &unk_1E3A35B08;
    v9 = &v16;
    v16 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_15;
  v13[3] = &unk_1E3A31408;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "retrieveAccountMessageDictionariesWithReply:", v13);

}

- (void)fetchAccountsWithCompletion:(id)a3
{
  -[AFSettingsConnection fetchAccountsSynchronously:completion:](self, "fetchAccountsSynchronously:completion:", 0, a3);
}

- (void)fetchActiveAccount:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__AFSettingsConnection_fetchActiveAccount___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __43__AFSettingsConnection_fetchActiveAccount___block_invoke_19;
  v9[3] = &unk_1E3A34BD0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "fetchActiveAccount:", v9);

}

- (id)accounts
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__19718;
  v9 = __Block_byref_object_dispose__19719;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__AFSettingsConnection_accounts__block_invoke;
  v4[3] = &unk_1E3A31F10;
  v4[4] = &v5;
  -[AFSettingsConnection fetchAccountsSynchronously:completion:](self, "fetchAccountsSynchronously:completion:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)saveAccount:(id)a3 setActive:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSettingsConnection.m"), 252, CFSTR("Need an account to save"));

  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_19894);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveAccountWithMessageDictionary:setActive:", v8, v4);

}

- (void)deleteAccountWithIdentifier:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSettingsConnection.m"), 257, CFSTR("Need an identifier to delete"));

  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_29_19890);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAccountWithIdentifier:", v7);

}

- (void)setActiveAccountIdentifier:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSettingsConnection.m"), 262, CFSTR("Need an identifier to set active"));

  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_32_19885);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveAccountIdentifier:", v7);

}

- (void)setAssistantEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_33);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssistantEnabled:", v3);

}

- (void)setDictationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_34);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationEnabled:", v3);

}

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_35);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationAutoPunctuationEnabled:", v3);

}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_36);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suppressLowStorageNotificationForLanguage:suppress:", v6, v4);

}

- (void)setAssistantLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_37);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableAssistantLogging:", v3);

}

- (void)killDaemon
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_38);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_killDaemon");

}

- (void)shutdownSessionIfIdle
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[AFSettingsConnection shutdownSessionIfIdle]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_shutdownSessionIfIdle");

}

- (void)resetSessionsAtNextRequestBoundary
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[AFSettingsConnection resetSessionsAtNextRequestBoundary]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_resetSessionsAtNextRequestBoundary");

}

- (void)barrier
{
  id v2;

  -[AFSettingsConnection _synchronousSettingsServiceWithErrorHandler:](self, "_synchronousSettingsServiceWithErrorHandler:", &__block_literal_global_41);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barrierWithReply:", &__block_literal_global_43);

}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__AFSettingsConnection_disableAndDeleteCloudSyncWithCompletion___block_invoke;
  v9[3] = &unk_1E3A35B08;
  v10 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v5;
  else
    v8 = &__block_literal_global_45;
  objc_msgSend(v6, "disableAndDeleteCloudSyncWithCompletion:", v8);

}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__AFSettingsConnection_getDevicesWithAvailablePHSAssetsForLanguage_completion___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v8 = v6;
    v12 = v8;
    v9 = a3;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getDevicesWithAvailablePHSAssetsForLanguage:completion:", v9, v8);

  }
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__AFSettingsConnection_getDevicesWithAvailablePHSAssetsOnDeviceCheck___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getDevicesWithAvailablePHSAssetsOnDeviceCheck:", v6);

  }
}

- (void)setConfigOverrides:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AFSettingsConnection_setConfigOverrides_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConfigOverrides:completion:", v8, v7);

}

- (void)configOverrides:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_48_19865);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__AFSettingsConnection_configOverrides___block_invoke_49;
    v6[3] = &unk_1E3A31510;
    v7 = v4;
    objc_msgSend(v5, "configOverrides:", v6);

  }
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke;
    v15[3] = &unk_1E3A35B08;
    v11 = v8;
    v16 = v11;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke_51;
    v13[3] = &unk_1E3A31538;
    v14 = v11;
    objc_msgSend(v12, "forceMultiUserSync:download:completion:", v6, v5, v13);

  }
}

- (void)clearSpokenNotificationTemporarilyDisabledStatus
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_53_19862);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSpokenNotificationTemporarilyDisabledStatus");

}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_54_19860);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConversationAwarenessForCurrentlyRoutedDevice:withCompletion:", v4, v6);

}

- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_55);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getConversationAwarenessForCurrentlyRoutedDevice:", v4);

}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_56);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalVolumeForCurrentlyRoutedDevice:withCompletion:", v4, v6);

}

- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_57);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPersonalVolumeForCurrentlyRoutedDevice:", v4);

}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_58);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeadGesturesForCurrentlyRoutedDevice:withCompletion:", v4, v6);

}

- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_59_19854);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getHeadGesturesForCurrentlyRoutedDevice:", v4);

}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_60_19852);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSpokenNotificationIsAlwaysOpportuneWithCompletion:", v4);

}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_61);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationIsAlwaysOpportune:", v3);

}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_62_19849);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:", v4);

}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_63);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationShouldAnnounceAllNotifications:", v3);

}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_64_19846);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:", v4);

}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_65_19844);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationShouldSkipTriggerlessReplies:", v3);

}

- (void)setSpokenNotificationProxCardSeen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_66_19842);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationProxCardSeen:", v3);

}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke;
  v9[3] = &unk_1E3A35B08;
  v10 = v6;
  v7 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:", a3, v7);

}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_67_19839);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnnounceNotificationsTemporarilyDisabledUntil:platform:", v6, a4);

}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke;
  v12[3] = &unk_1E3A35B08;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:", v10, a4, v9);

}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_68);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:", v9, v8, a5);

}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_69);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsInCarPlayTemporarilyDisabled:", v3);

}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__AFSettingsConnection_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v5);

}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_70);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAnnounceNotificationsInCarPlayTemporarilyDisabled");

}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAnnounceNotificationsInCarPlayTypeWithCompletion:", v5);

}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  id v4;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_71_19831);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsInCarPlayType:", a3);

}

- (void)clearAnnounceNotificationsInCarPlayType
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_72);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAnnounceNotificationsInCarPlayType");

}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_73);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsOnHearingAidsEnabled:", v3);

}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_74);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsOnHearingAidsSupported:", v3);

}

- (void)updateAnnounceNotificationsOnHearingAidSupportedStatus
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAnnounceNotificationsOnHearingAidSupportedStatus");

}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_76);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsOnBuiltInSpeakerEnabled:", v3);

}

- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__AFSettingsConnection_fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:", v5);

}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__AFSettingsConnection_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getMessageWithoutConfirmationEnabledWithCompletion:", v5);

}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_77);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageWithoutConfirmationEnabled:", v3);

}

- (void)clearMessageWithoutConfirmationEnabled
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_78_19821);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearMessageWithoutConfirmationEnabled");

}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__AFSettingsConnection_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:", v5);

}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_79);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageWithoutConfirmationInCarPlayEnabled:", v3);

}

- (void)clearMessageWithoutConfirmationInCarPlayEnabled
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_80);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearMessageWithoutConfirmationInCarPlayEnabled");

}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__AFSettingsConnection_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:", v5);

}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_81);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageWithoutConfirmationHeadphonesEnabled:", v3);

}

- (void)clearMessageWithoutConfirmationHeadphonesEnabled
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_82);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearMessageWithoutConfirmationHeadphonesEnabled");

}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getShowAppsBehindSiriInCarPlayEnabledWithCompletion:", v5);

}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_83_19812);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAppsBehindSiriInCarPlayEnabled:", v3);

}

- (void)clearShowAppsBehindSiriInCarPlayEnabled
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_84_19810);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearShowAppsBehindSiriInCarPlayEnabled");

}

- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3
{
  id v4;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_85_19808);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpportuneSpeakingEdgeDetectorSignalOverride:", a3);

}

- (void)clearOpportuneSpeakingEdgeDetectorSignalOverride
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_86_19806);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearOpportuneSpeakingEdgeDetectorSignalOverride");

}

- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AFSettingsConnection_fetchMultiUserVoiceIdentificationSetting___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchMultiUserVoiceIdentificationSetting:", v5);

}

- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__AFSettingsConnection_homeOnboardingFlowInvoked_completion___block_invoke;
  v9[3] = &unk_1E3A35B08;
  v10 = v6;
  v7 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeOnboardingFlowInvoked:completion:", v4, v7);

}

- (void)currectNWActivityId:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__AFSettingsConnection_currectNWActivityId___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __44__AFSettingsConnection_currectNWActivityId___block_invoke_87;
  v9[3] = &unk_1E3A31760;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getCurrentNWActivityIDWithCompletion:", v9);

}

- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3A31788;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getAudioSessionCoordinationSnapshotWithCompletion:", v9);

}

- (void)_setVoices:(id)a3
{
  id v4;
  NSObject *voicesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  voicesQueue = self->_voicesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AFSettingsConnection__setVoices___block_invoke;
  block[3] = &unk_1E3A36FC8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(voicesQueue, block);

}

- (id)_voices
{
  NSObject *voicesQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19718;
  v10 = __Block_byref_object_dispose__19719;
  v11 = 0;
  voicesQueue = self->_voicesQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AFSettingsConnection__voices__block_invoke;
  v5[3] = &unk_1E3A36F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(voicesQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_filterVoices:(id)a3 forLanguage:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "languageCode", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "isEqualToString:", v14);

          if (v15)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)_updateVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v8 = v6;
  v14 = v8;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke_2;
  v11[3] = &unk_1E3A36460;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "getAvailableVoicesIncludingAssetInfo:completion:", v4, v11);

}

- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 completion:(id)a4
{
  -[AFSettingsConnection getAvailableVoicesForRecognitionLanguage:includeAssetInfo:completion:](self, "getAvailableVoicesForRecognitionLanguage:includeAssetInfo:completion:", a3, 0, a4);
}

- (void)getAvailableVoicesForRecognitionLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a4;
  v8 = a5;
  if (a3)
  {
    AFOutputVoiceLanguageForRecognitionLanguage(a3);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AFSettingsConnection getAvailableVoicesForLanguage:includeAssetInfo:completion:](self, "getAvailableVoicesForLanguage:includeAssetInfo:completion:", a3, v5, v8);

}

- (void)getAvailableVoicesForSynthesisLanguage:(id)a3 completion:(id)a4
{
  -[AFSettingsConnection getAvailableVoicesForLanguage:includeAssetInfo:completion:](self, "getAvailableVoicesForLanguage:includeAssetInfo:completion:", a3, 0, a4);
}

- (void)getOfflineAssistantStatusWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getOfflineAssistantStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getOfflineAssistantStatusWithCompletion:", v5);

}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getOfflineDictationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getOfflineDictationStatusWithCompletion:", v5);

}

- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__AFSettingsConnection_createOfflineSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke;
  v16[3] = &unk_1E3A35B08;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createOfflineSpeechProfileWithLanguage:modelOverridePath:JSONData:completion:", v14, v13, v12, v11);

}

- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOfflineDictationProfileOverridePath:completion:", v7, v6);

}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSpeechProfileExternalOfflineModelRootPath:completion:", v7, v6);

}

- (void)getAvailableVoicesForLanguage:(id)a3 includeAssetInfo:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *);

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[AFSettingsConnection _voices](self, "_voices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
    {
      -[AFSettingsConnection _voices](self, "_voices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSettingsConnection _filterVoices:forLanguage:](self, "_filterVoices:forLanguage:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v12);

    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__AFSettingsConnection_getAvailableVoicesForLanguage_includeAssetInfo_completion___block_invoke;
    v13[3] = &unk_1E3A36E10;
    v15 = v9;
    v13[4] = self;
    v14 = v8;
    -[AFSettingsConnection _updateVoicesIncludingAssetInfo:completion:](self, "_updateVoicesIncludingAssetInfo:completion:", v6, v13);

  }
}

- (void)setOutputVoice:(id)a3
{
  -[AFSettingsConnection setOutputVoice:withCompletion:](self, "setOutputVoice:withCompletion:", a3, 0);
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSettingsConnection setOutputVoice:withCompletion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Setting Siri output voice: %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__AFSettingsConnection_setOutputVoice_withCompletion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v14 = v7;
  v9 = v7;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = &__block_literal_global_90_19799;
  objc_msgSend(v10, "setOutputVoice:withCompletion:", v6, v12);

}

- (void)setLanguage:(id)a3
{
  -[AFSettingsConnection setLanguage:withCompletion:](self, "setLanguage:withCompletion:", a3, 0);
}

- (void)setLanguage:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AFSettingsConnection setLanguage:withCompletion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Setting Siri language code: %@", buf, 0x16u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v10 = v7;
  v16 = v10;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke_2;
  v13[3] = &unk_1E3A36BB8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "setLanguage:withCompletion:", v6, v13);

}

- (void)setLanguage:(id)a3 outputVoice:(id)a4
{
  -[AFSettingsConnection setLanguage:outputVoice:withCompletion:](self, "setLanguage:outputVoice:withCompletion:", a3, a4, 0);
}

- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSettingsConnection setLanguage:outputVoice:withCompletion:]";
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s Setting Siri output voice:%@ language code: %@", buf, 0x20u);
  }
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke;
  v18[3] = &unk_1E3A35B08;
  v13 = v10;
  v19 = v13;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke_2;
  v16[3] = &unk_1E3A34BD0;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "setLanguage:outputVoice:withCompletion:", v8, v9, v16);

}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_91);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke_92;
    v6[3] = &unk_1E3A317D0;
    v7 = v4;
    objc_msgSend(v5, "getCurrentAccessoryInfoWithCompletion:", v6);

  }
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_94_19791);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecognizeMyVoiceEnabled:", v3);

}

- (void)availableLanguagesInTheHome:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFSettingsConnection availableLanguagesInTheHome:]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Retrieving home accessories Siri languages", buf, 0xCu);
    }
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v7 = v4;
    v12 = v7;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke_2;
    v9[3] = &unk_1E3A31408;
    v10 = v7;
    objc_msgSend(v8, "availableLanguagesInTheHome:", v9);

  }
}

- (void)isJustSiriEnabledInTheHome:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke_2;
  v9[3] = &unk_1E3A31538;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "isJustSiriEnabledInTheHome:", v9);

}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v8 = v6;
  v14 = v8;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke_2;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "setAllowJustSiriHomeKitSetting:withCompletion:", v4, v11);

}

- (void)startUIRequest:(id)a3
{
  AFSpeechRequestOptions *v4;
  id v5;
  void *v6;
  AFRequestInfo *v7;

  if (a3)
  {
    -[AFSettingsConnection startUIRequestWithText:](self, "startUIRequestWithText:");
  }
  else
  {
    v7 = objc_alloc_init(AFRequestInfo);
    v4 = -[AFSpeechRequestOptions initWithActivationEvent:]([AFSpeechRequestOptions alloc], "initWithActivationEvent:", 19);
    -[AFSpeechRequestOptions setEndpointerOperationMode:](v4, "setEndpointerOperationMode:", 3);
    -[AFRequestInfo setSpeechRequestOptions:](v7, "setSpeechRequestOptions:", v4);
    v5 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:](AFAnalyticsTurnBasedInstrumentationContext, "newTurnBasedContextWithPreviousTurnID:", 0);
    objc_msgSend(v5, "turnIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFRequestInfo setTurnIdentifier:](v7, "setTurnIdentifier:", v6);

    -[AFSettingsConnection startUIRequestWithInfo:](self, "startUIRequestWithInfo:", v7);
  }
}

- (void)startUIRequestWithText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_98_19784);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startUIRequestWithText:completion:", v4, &__block_literal_global_100_19785);

}

- (void)startUIRequestWithInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_101_19782);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startUIRequestWithInfo:completion:", v4, &__block_literal_global_103);

}

- (void)startUIRequestWithSpeechAudioFileURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_104);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startUIRequestWithSpeechAudioFileURL:", v4);

}

- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_105_19779);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startUIMockServerRequestWithReplayFileURL:completion:", v7, v6);

}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_106);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startUIRequestWithText:completion:", v7, v6);

}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_107);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startUIRequestWithInfo:completion:", v7, v6);

}

- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_108);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startMultiUserUIRequestWithText:expectedSpeakerSharedUserID:expectedSpeakerConfidenceScore:nonspeakerConfidenceScores:completion:", v15, v14, a5, v13, v12);

}

- (void)dismissUI
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_109);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissUI");

}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__AFSettingsConnection_startRemoteRequest_onPeer_completion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v16 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    v14 = v9;
  else
    v14 = &__block_literal_global_110_19774;
  objc_msgSend(v12, "startRemoteRequest:onPeer:completion:", v11, v10, v14);

}

- (void)getPeerIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AFSettingsConnection_getPeerIdentifiers___block_invoke;
  v9[3] = &unk_1E3A35B08;
  v10 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v5;
  else
    v8 = &__block_literal_global_111;
  objc_msgSend(v6, "getPeerIdentifiers:", v8);

}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__AFSettingsConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v15 = v8;
  v9 = v8;
  v10 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    v13 = v9;
  else
    v13 = &__block_literal_global_112;
  objc_msgSend(v11, "startAudioPlaybackRequest:options:completion:", v10, a4, v13);

}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_113);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAudioPlaybackRequest:immediately:", v6, v4);

}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_114);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllAudioPlaybackRequests:", v3);

}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_115_19770);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postTestResultCandidateWithRcId:recognitionSausage:", v7, v6);

}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_116);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postTestResultSelectedWithRcId:", v4);

}

- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__AFSettingsConnection_setSupplementalLanguageDictionary_forProduct_completion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v16 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    v14 = v9;
  else
    v14 = &__block_literal_global_117;
  objc_msgSend(v12, "setSupplementalLanguageDictionary:forProduct:completion:", v11, v10, v14);

}

- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__AFSettingsConnection_setSupplementalLanguages_forProduct_forBuildVersion_completion___block_invoke;
  v18[3] = &unk_1E3A35B08;
  v19 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
    v17 = v11;
  else
    v17 = &__block_literal_global_118;
  objc_msgSend(v15, "setSupplementalLanguages:forProduct:forBuildVersion:completion:", v14, v13, v12, v17);

}

- (void)getSupplementalLanguagesDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__AFSettingsConnection_getSupplementalLanguagesDictionary___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getSupplementalLanguagesDictionary:", v6);

  }
}

- (void)getSupplementalLanguagesModificationDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__AFSettingsConnection_getSupplementalLanguagesModificationDate___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getSupplementalLanguagesModificationDate:", v6);

  }
}

- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__AFSettingsConnection_getSupplementalLanguageDictionaryForProduct_completion___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v8 = v6;
    v12 = v8;
    v9 = a3;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getSupplementalLanguageDictionaryForProduct:completion:", v9, v8);

  }
}

- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__AFSettingsConnection_getSupplementalLanguagesForProduct_forBuildVersion_completion___block_invoke;
    v14[3] = &unk_1E3A35B08;
    v10 = v8;
    v15 = v10;
    v11 = a4;
    v12 = a3;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getSupplementalLanguagesForProduct:forBuildVersion:completion:", v12, v11, v10);

  }
}

- (void)getHorsemanSupplementalLanguageDictionary:(id)a3
{
  if (a3)
    -[AFSettingsConnection getSupplementalLanguageDictionaryForProduct:completion:](self, "getSupplementalLanguageDictionaryForProduct:completion:", *MEMORY[0x1E0D892F8], a3);
}

- (void)setHorsemanSupplementalLanguageDictionary:(id)a3 completion:(id)a4
{
  -[AFSettingsConnection setSupplementalLanguageDictionary:forProduct:completion:](self, "setSupplementalLanguageDictionary:forProduct:completion:", a3, *MEMORY[0x1E0D892F8], a4);
}

- (void)getMeCard:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (v4)
  {
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman && (AFSupportsMultiUser() & 1) == 0)
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[AFSettingsConnection getMeCard:]";
        _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Can not get meCard on this device", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 1010, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v7);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __34__AFSettingsConnection_getMeCard___block_invoke;
      v9[3] = &unk_1E3A35B08;
      v5 = v4;
      v10 = v5;
      -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getMeCard:", v5);

      v7 = v10;
    }

  }
}

- (void)getStereoPartnerLastMyriadWinDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__AFSettingsConnection_getStereoPartnerLastMyriadWinDate___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getStereoPartnerLastMyriadWinDate:", v6);

  }
}

- (void)getStereoPairState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__AFSettingsConnection_getStereoPairState___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getStereoPairState:", v6);

  }
}

- (void)publishFeedbackArbitrationParticipation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_120_19765);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishFeedbackArbitrationParticipation:", v4);

}

- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoAssistantEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoDictationEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoDictationAutoPunctuationEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoPhraseSpotterEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoRaiseToSpeakEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFSettingsConnection setNanoUseDeviceSpeakerForTTS:withCompletion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    v6[2](v6);

}

- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFSettingsConnection setNanoTTSSpeakerVolume:withCompletion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    v6[2](v6);

}

- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFSettingsConnection setNanoOutputVoice:withCompletion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    v6[2](v6);

}

- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFSettingsConnection setNanoLanguage:withCompletion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    v6[2](v6);

}

- (void)setNanoCrownActivationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoCrownActivationEnabled:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoSiriResponseShouldAlwaysPrint:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setNanoAlwaysShowRecognizedSpeech:withCompletion:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  if (v5)
    v5[2](v5);

}

- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AFSettingsConnection_fetchEventRecordsFromAnalyticsStoreAtPath_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchEventRecordsFromAnalyticsStoreAtPath:completion:", v8, v7);

}

- (void)purgeAnalyticsStoreWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAnalyticsStoreWithCompletion:", v4);

}

- (void)resetAnalyticsStoreWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetAnalyticsStoreWithCompletion:", v4);

}

- (void)sendMetricsToServerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMetricsToServerWithCompletion:", v4);

}

- (void)fetchExperimentConfigurationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__AFSettingsConnection_fetchExperimentConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchExperimentConfigurationsWithCompletion:", v5);

}

- (void)fetchExperimentContextWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_fetchExperimentContextWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchExperimentContextWithCompletion:", v5);

}

- (void)getSiriOutputVolumeWithCompletion:(id)a3
{
  -[AFSettingsConnection getSiriOutputVolumeForAudioRoute:completion:](self, "getSiriOutputVolumeForAudioRoute:completion:", 0, a3);
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__AFSettingsConnection_getSiriOutputVolumeForAudioRoute_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getSiriOutputVolumeForAudioRoute:completion:", v8, v7);

}

- (void)setSiriOutputVolume:(float)a3 completion:(id)a4
{
  -[AFSettingsConnection setSiriOutputVolume:forAudioRoute:completion:](self, "setSiriOutputVolume:forAudioRoute:completion:", 0, a4);
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  objc_msgSend(v11, "setSiriOutputVolume:forAudioRoute:completion:", v9, v8, v10);

}

- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke_2;
  v12[3] = &unk_1E3A31938;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getBluetoothDeviceInfoWithAddress:completion:", v9, v12);

}

- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke_2;
  v12[3] = &unk_1E3A31938;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getBluetoothDeviceInfoWithUID:completion:", v9, v12);

}

- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3A31408;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getConnectedBluetoothDeviceInfoArrayWithCompletion:", v9);

}

- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3A31408;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getPairedBluetoothDeviceInfoArrayWithCompletion:", v9);

}

- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3A31960;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getBluetoothWirelessSplitterSessionInfoWithCompletion:", v9);

}

- (void)startObservingWirelessSplitterSession
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_123);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startObservingBluetoothWirelessSplitterSession");

}

- (void)stopObservingWirelessSplitterSession
{
  id v2;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_124);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopObservingBluetoothWirelessSplitterSession");

}

- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke_2;
  v12[3] = &unk_1E3A319A8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getInEarDetectionStateForBTAddress:withCompletion:", v9, v12);

}

- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__AFSettingsConnection_startObservingBluetoothInEarDetectionStateForBTAddress_forObserverID___block_invoke;
  v9[3] = &unk_1E3A36A00;
  v10 = v6;
  v7 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:", v7, a4);

}

- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3
{
  id v4;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_126);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopObservingBluetoothInEarDetectionStateForObserverID:", a3);

}

- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__AFSettingsConnection_postJSDiscoveryNotificationForBTDeviceWithInfo_withCompletion___block_invoke;
  v10[3] = &unk_1E3A36A00;
  v11 = v6;
  v7 = v6;
  v8 = a4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:", v7, v8);

}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AFSettingsConnection_getHomeUserIdForSharedUserId_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getHomeUserIdForSharedUserId:completion:", v8, v7);

}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AFSettingsConnection_getSharedUserIdForHomeUserId_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getSharedUserIdForHomeUserId:completion:", v8, v7);

}

- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke;
    v12[3] = &unk_1E3A35B08;
    v7 = v4;
    v13 = v7;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[AFSettingsConnection getPersonalMultiUserDeviceIdentifiers:]";
        _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Setting services handle is missing", buf, 0xCu);
      }
    }
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke_127;
    v10[3] = &unk_1E3A31408;
    v11 = v7;
    objc_msgSend(v8, "getPersonalMultiUserDeviceIdentifiers:", v10);

  }
}

- (void)multiUserCompanionDeviceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke;
    v12[3] = &unk_1E3A35B08;
    v7 = v4;
    v13 = v7;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = AFSiriLogContextConnection;
    if (!v8 && os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]";
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Setting services handle is missing", buf, 0xCu);
      v9 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]";
      _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s Calling Settings service", buf, 0xCu);
    }
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke_128;
    v10[3] = &unk_1E3A31408;
    v11 = v7;
    objc_msgSend(v8, "multiUserCompanionDeviceIdentifiers:", v10);

  }
}

- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;

  v9 = a8;
  v16 = a9;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __117__AFSettingsConnection_addMultiUserUser_sharedId_loggableSharedId_iCloudAltDSID_enrollmentName_isPrimary_completion___block_invoke;
  v27 = &unk_1E3A35B08;
  v28 = v16;
  v17 = v16;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addMultiUserUser:sharedId:loggableSharedId:iCloudAltDSID:enrollmentName:isPrimary:completion:", v22, v21, v20, v19, v18, v9, v17, v24, v25, v26, v27);

}

- (void)removeMultiUserUser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__AFSettingsConnection_removeMultiUserUser_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeMultiUserUser:completion:", v8, v7);

}

- (void)removeMultiUserWithSharedUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AFSettingsConnection_removeMultiUserWithSharedUserID_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeMultiUserUserWithSharedUserId:completion:", v8, v7);

}

- (void)showMultiUsers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__AFSettingsConnection_showMultiUsers___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showMultiUsers:", v5);

}

- (void)showMultiUserCompanionInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AFSettingsConnection_showMultiUserCompanionInfo___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showMultiUserCompanionInfo:", v5);

}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AFSettingsConnection_showPrimaryUserSharedUserIDWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showPrimaryUserSharedUserIDWithCompletion:", v5);

}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_showMultiUserSharedUserIDsCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showMultiUserSharedUserIDsCompletion:", v5);

}

- (void)showLocalProfileNamesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_showLocalProfileNamesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showLocalProfileNamesWithCompletion:", v5);

}

- (void)showHomeProfileNamesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__AFSettingsConnection_showHomeProfileNamesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showHomeProfileNamesWithCompletion:", v5);

}

- (void)resetProfileNames:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__AFSettingsConnection_resetProfileNames_completion___block_invoke;
  v9[3] = &unk_1E3A35B08;
  v10 = v6;
  v7 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetProfileNames:completion:", v4, v7);

}

- (void)getSharedUserID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AFSettingsConnection_getSharedUserID___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSharedUserID:", v5);

}

- (void)setSiriGradingEnabled:(BOOL)a3 completion:(id)a4
{
  uint64_t v4;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  -[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:](self, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", v4, 0, 0, CFSTR("Legacy Setter"), a4);
}

- (void)siriGradingIsEnabled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AFSettingsConnection_siriGradingIsEnabled___block_invoke;
  v6[3] = &unk_1E3A319D0;
  v7 = v4;
  v5 = v4;
  -[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:](self, "getSiriDataSharingOptInStatusWithCompletion:", v6);

}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  __CFString *v19;
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  AFSettingsConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A35998[a3];
  v8 = v7;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s Setting siri data sharing optin status to = %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__19718;
  v24 = __Block_byref_object_dispose__19719;
  v25 = self;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke;
  v18[3] = &unk_1E3A319F8;
  v11 = v8;
  v19 = v11;
  v12 = v6;
  v20 = v12;
  v21 = buf;
  v13 = (void *)MEMORY[0x1A1AC0C3C](v18);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_settingsServiceWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke_132;
  v16[3] = &unk_1E3A36BB8;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "setSiriDataSharingOptInStatus:completion:", a3, v16);

  _Block_object_dispose(buf, 8);
}

- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Getting siri data sharing optin status", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke;
  v12[3] = &unk_1E3A35B08;
  v7 = v4;
  v13 = v7;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke_133;
  v10[3] = &unk_1E3A31A20;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getSiriDataSharingOptInStatusWithCompletion:", v10);

}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  _BYTE *v24;
  _BYTE buf[24];
  int64_t v26;
  __int128 v27;
  uint64_t v28;

  v9 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  if ((unint64_t)a3 > 3)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A35998[a3];
  v15 = v14;
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316163;
    *(_QWORD *)&buf[4] = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    v26 = a5;
    LOWORD(v27) = 2113;
    *(_QWORD *)((char *)&v27 + 2) = v12;
    WORD5(v27) = 1024;
    HIDWORD(v27) = v9;
    _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d", buf, 0x30u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = (int64_t)__Block_byref_object_copy__19718;
  *(_QWORD *)&v27 = __Block_byref_object_dispose__19719;
  *((_QWORD *)&v27 + 1) = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__AFSettingsConnection_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke;
  v21[3] = &unk_1E3A319F8;
  v17 = v15;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v24 = buf;
  v19 = (void *)MEMORY[0x1A1AC0C3C](v21);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_settingsServiceWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", a3, v9, a5, v12, v19);

  _Block_object_dispose(buf, 8);
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSettingsConnection setSiriDataSharingOptInAlertPresented:completion:]";
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s status = %d", buf, 0x12u);
  }
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v9 = v6;
  v15 = v9;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke_135;
  v12[3] = &unk_1E3A36BB8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "setSiriDataSharingOptInAlertPresented:completion:", v4, v12);

}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSettingsConnection setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing HomePod Setup Device isValid to = %d", buf, 0x12u);
  }
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v9 = v6;
  v15 = v9;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke_136;
  v12[3] = &unk_1E3A36BB8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "setSiriDataSharingHomePodSetupDeviceIsValid:completion:", v4, v12);

}

- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSettingsConnection setIsHomePodInHH2Mode:completion:]";
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Setting isHomePodInHH2Mode = %d", buf, 0x12u);
  }
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke;
  v14[3] = &unk_1E3A35B08;
  v9 = v6;
  v15 = v9;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke_137;
  v12[3] = &unk_1E3A36BB8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "setIsHomePodInHH2Mode:completion:", v4, v12);

}

- (void)sendSampledAudioToServerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AFSettingsConnection_sendSampledAudioToServerWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendSampledAudioToServerWithCompletion:", v5);

}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFSettingsConnection setOnDeviceDictationAvailableAlertPresented:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s presented = %d", (uint8_t *)&v7, 0x12u);
  }
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_138);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnDeviceDictationAvailableAlertPresented:", v3);

}

- (void)shouldSuppressSiriDataSharingOptInAlert:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke_139;
  v9[3] = &unk_1E3A31538;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "shouldSuppressSiriDataSharingOptInAlertWithCompletion:", v9);

}

- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v10 = v7;
  v16 = v10;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke_140;
  v13[3] = &unk_1E3A35B08;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "deleteSiriHistoryWithContext:withCompletion:", v6, v13);

}

- (void)deleteSiriHistoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFSettingsConnection deleteSiriHistoryWithCompletion:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:](self, "deleteSiriHistoryWithContext:withCompletion:", 0, v4);

}

- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v8 = v6;
  v14 = v8;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke_141;
  v11[3] = &unk_1E3A36BB8;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "setSiriDesignModeEnabled:completion:", v4, v11);

}

- (void)siriDesignModeIsEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke_142;
  v9[3] = &unk_1E3A31538;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "siriDesignModeIsEnabled:", v9);

}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_1E3A33DD0[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315395;
    v20 = "-[AFSettingsConnection setSearchQueriesDataSharingStatus:completion:]";
    v21 = 2113;
    v22 = v10;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Setting Search Queries Data Sharing option to = %{private}@", buf, 0x16u);

  }
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke;
  v17[3] = &unk_1E3A35B08;
  v12 = v6;
  v18 = v12;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke_143;
  v15[3] = &unk_1E3A36BB8;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "setSearchQueriesDataSharingStatus:completion:", a3, v15);

}

- (void)getSearchQueriesDataSharingStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Getting Search Queries Data Sharing", buf, 0xCu);
  }
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v7 = v4;
    v12 = v7;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke_144;
    v9[3] = &unk_1E3A31A20;
    v10 = v7;
    objc_msgSend(v8, "getSearchQueriesDataSharingStatus:", v9);

  }
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__AFSettingsConnection_getCrossDeviceContextWithCompletion___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getCrossDeviceContextWithCompletion:", v6);

  }
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_getCurrentContextSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentContextSnapshotWithCompletion:", v5);

}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AFSettingsConnection_getOriginDeviceInfoForContextIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getOriginDeviceInfoForContextIdentifier:completion:", v8, v7);

}

- (void)getContextCollectorsInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AFSettingsConnection_getContextCollectorsInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getContextCollectorsInfoWithCompletion:", v5);

}

- (void)setHardcodedBluetoothProximity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_145);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHardcodedBluetoothProximity:", v4);

}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AFSettingsConnection_getManagedLocalAndRemotePeerInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getManagedLocalAndRemotePeerInfoWithCompletion:", v5);

}

- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__AFSettingsConnection_getCapabilitiesDataFromReachableDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCapabilitiesDataFromReachableDevicesWithCompletion:", v5);

}

- (void)getProximityTuplesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AFSettingsConnection_getProximityTuplesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getProximityTuplesWithCompletion:", v5);

}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AFSettingsConnection_getExperimentForConfigurationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getExperimentForConfigurationIdentifier:completion:", v8, v7);

}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__AFSettingsConnection_synchronizeExperimentConfigurationsIfApplicableWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronizeExperimentConfigurationsIfApplicableWithCompletion:", v5);

}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AFSettingsConnection_resetExperimentForConfigurationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetExperimentForConfigurationIdentifier:completion:", v8, v7);

}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__AFSettingsConnection_accessRecordedAudioWithIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessRecordedAudioWithIdentifier:completion:", v8, v7);

}

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v12 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__AFSettingsConnection_trimRecordedAudioWithIdentifier_offset_duration_outputFileType_completion___block_invoke;
  v16[3] = &unk_1E3A35B08;
  v17 = v12;
  v13 = v12;
  v14 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:", v14, a6, v13, a4, a5);

}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AFSettingsConnection_getRecordedAudioDirectoryPathsWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRecordedAudioDirectoryPathsWithCompletion:", v5);

}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AFSettingsConnection_hasEverSetLanguageCodeWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hasEverSetLanguageCodeWithCompletion:", v5);

}

- (void)areSiriUODAssetsAvailable:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AFSettingsConnection_areSiriUODAssetsAvailable___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "areSiriUODAssetsAvailable:", v5);

}

- (void)areSiriSAEAssetsAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke_146;
  v9[3] = &unk_1E3A31538;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "areSiriSAEAssetsAvailable:", v9);

}

- (void)dumpAssistantState:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__AFSettingsConnection_dumpAssistantState___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __43__AFSettingsConnection_dumpAssistantState___block_invoke_147;
  v9[3] = &unk_1E3A31510;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dumpAssistantState:", v9);

}

- (void)fetchSharedUserIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v7 = v4;
    v12 = v7;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke_2;
    v9[3] = &unk_1E3A31A48;
    v10 = v7;
    objc_msgSend(v8, "fetchSharedUserIdentifier:", v9);

  }
}

- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__AFSettingsConnection_getAssetStatusForLanguage_completionHandler___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAssetStatusForLanguage:completionHandler:", v8, v7);

}

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AFSettingsConnection_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentRequestIsWatchAuthenticatedWithCompletion:", v5);

}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__AFSettingsConnection_pushMyriadAdvertisementContext_completionHandler___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushMyriadAdvertisementContext:completionHandler:", v8, v7);

}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AFSettingsConnection_pushSCDAAdvertisementContext_completionHandler___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushSCDAAdvertisementContext:completionHandler:", v8, v7);

}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__AFSettingsConnection_getSpeakerCapabilityForAccessoryWithUUID_completionHandler___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getSpeakerCapabilityForAccessoryWithUUID:completionHandler:", v8, v7);

}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__AFSettingsConnection_getAccessoryInfoForAccessoryWithUUID_completionHandler___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAccessoryInfoForAccessoryWithUUID:completionHandler:", v8, v7);

}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AFSettingsConnection_getTrialEnables_doubleFactors_withCompletion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getTrialEnables:doubleFactors:withCompletion:", v11, v10, v9);

}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_getSidekickBoostsFileWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSidekickBoostsFileWithCompletion:", v5);

}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__AFSettingsConnection_triggerABCForType_subType_context_completionHandler___block_invoke;
  v16[3] = &unk_1E3A35B08;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "triggerABCForType:subType:context:completionHandler:", v14, v13, v12, v11);

}

- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__AFSettingsConnection_getAssistantIsEnabledForDeviceWithSiriInfo_withCompletion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:", v8, v7);

}

- (void)getActiveASRLanguagesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFSettingsConnection_getActiveASRLanguagesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentActiveLanguageCodesWithCompletion:", v5);

}

- (void)_createRadarWithReason:(id)a3 room:(id)a4 process:(id)a5 crash:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  AFSettingsConnection *v18;
  uint64_t v19;
  id v20;
  AFSettingsConnection *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD);
  _QWORD v28[4];
  AFSettingsConnection *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v8 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = a5;
  v15 = a7;
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v17 = CFSTR("entire home");
    *(_DWORD *)buf = 136315650;
    v32 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]";
    v33 = 2112;
    if (v13)
      v17 = v13;
    v34 = v17;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s Filing a radar in %@ with reason %@", buf, 0x20u);
  }
  v18 = self;
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke;
  v28[3] = &unk_1E3A32F48;
  v20 = v15;
  v30 = v20;
  v21 = v18;
  v29 = v21;
  v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v28);
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](v21, "_settingsServiceWithErrorHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v25 = CFSTR("Not an internal build");
LABEL_10:
    +[AFError errorWithCode:description:](AFError, "errorWithCode:description:", 1010, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v22)[2](v22, v24);
    goto LABEL_11;
  }
  if (!v8)
  {
    v25 = CFSTR("Not a supported configuration");
    goto LABEL_10;
  }
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke_154;
  v26[3] = &unk_1E3A35B08;
  v27 = v22;
  objc_msgSend(v23, "createRadarForCrashWithReason:process:completion:", v12, v14, v26);
  v24 = v27;
LABEL_11:

}

- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5
{
  -[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:](self, "_createRadarWithReason:room:process:crash:completion:", a3, CFSTR("local crashing device"), a4, 1, a5);
}

- (void)getODDDeviceProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AFSettingsConnection_getODDDeviceProperties___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getODDDeviceProperties:", v5);

}

uint64_t __47__AFSettingsConnection_getODDDeviceProperties___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed to file a radar - error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFSettingsConnection _createRadarWithReason:room:process:crash:completion:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Radar is filed", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __77__AFSettingsConnection__createRadarWithReason_room_process_crash_completion___block_invoke_154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__AFSettingsConnection_getActiveASRLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getActiveASRLanguagesWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __82__AFSettingsConnection_getAssistantIsEnabledForDeviceWithSiriInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __76__AFSettingsConnection_triggerABCForType_subType_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection triggerABCForType:subType:context:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __60__AFSettingsConnection_getSidekickBoostsFileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getSidekickBoostsFileWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__AFSettingsConnection_getTrialEnables_doubleFactors_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getTrialEnables:doubleFactors:withCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

void __79__AFSettingsConnection_getAccessoryInfoForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAccessoryInfoForAccessoryWithUUID:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

void __83__AFSettingsConnection_getSpeakerCapabilityForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getSpeakerCapabilityForAccessoryWithUUID:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __71__AFSettingsConnection_pushSCDAAdvertisementContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection pushSCDAAdvertisementContext:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __73__AFSettingsConnection_pushMyriadAdvertisementContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection pushMyriadAdvertisementContext:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __76__AFSettingsConnection_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getCurrentRequestIsWatchAuthenticatedWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __68__AFSettingsConnection_getAssetStatusForLanguage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAssetStatusForLanguage:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__AFSettingsConnection_fetchSharedUserIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__AFSettingsConnection_dumpAssistantState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection dumpAssistantState:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __43__AFSettingsConnection_dumpAssistantState___block_invoke_147(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection areSiriSAEAssetsAvailable:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __50__AFSettingsConnection_areSiriSAEAssetsAvailable___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__AFSettingsConnection_areSiriUODAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection areSiriUODAssetsAvailable:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __61__AFSettingsConnection_hasEverSetLanguageCodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection hasEverSetLanguageCodeWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__AFSettingsConnection_getRecordedAudioDirectoryPathsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getRecordedAudioDirectoryPathsWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __98__AFSettingsConnection_trimRecordedAudioWithIdentifier_offset_duration_outputFileType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__AFSettingsConnection_accessRecordedAudioWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection accessRecordedAudioWithIdentifier:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __77__AFSettingsConnection_resetExperimentForConfigurationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection resetExperimentForConfigurationIdentifier:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __86__AFSettingsConnection_synchronizeExperimentConfigurationsIfApplicableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection synchronizeExperimentConfigurationsIfApplicableWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __75__AFSettingsConnection_getExperimentForConfigurationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getExperimentForConfigurationIdentifier:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __57__AFSettingsConnection_getProximityTuplesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getProximityTuplesWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __78__AFSettingsConnection_getCapabilitiesDataFromReachableDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getCapabilitiesDataFromReachableDevicesWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __71__AFSettingsConnection_getManagedLocalAndRemotePeerInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getManagedLocalAndRemotePeerInfoWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

void __55__AFSettingsConnection_setHardcodedBluetoothProximity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setHardcodedBluetoothProximity:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_getContextCollectorsInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getContextCollectorsInfoWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

void __75__AFSettingsConnection_getOriginDeviceInfoForContextIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getOriginDeviceInfoForContextIdentifier:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __64__AFSettingsConnection_getCurrentContextSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getCurrentContextSnapshotWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __60__AFSettingsConnection_getCrossDeviceContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getCrossDeviceContextWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v3, 2);

}

uint64_t __58__AFSettingsConnection_getSearchQueriesDataSharingStatus___block_invoke_144(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t result;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    if (a2 > 2)
      v6 = CFSTR("(unknown)");
    else
      v6 = off_1E3A33DD0[a2];
    v7 = v6;
    v9 = 136315395;
    v10 = "-[AFSettingsConnection getSearchQueriesDataSharingStatus:]_block_invoke";
    v11 = 2113;
    v12 = v7;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s optin status = %{private}@", (uint8_t *)&v9, 0x16u);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, unint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setSearchQueriesDataSharingStatus:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __69__AFSettingsConnection_setSearchQueriesDataSharingStatus_completion___block_invoke_143(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection siriDesignModeIsEnabled:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v3, 1);

}

uint64_t __48__AFSettingsConnection_siriDesignModeIsEnabled___block_invoke_142(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setSiriDesignModeEnabled:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __60__AFSettingsConnection_setSiriDesignModeEnabled_completion___block_invoke_141(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __68__AFSettingsConnection_deleteSiriHistoryWithContext_withCompletion___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed with error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFSettingsConnection deleteSiriHistoryWithContext:withCompletion:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection shouldSuppressSiriDataSharingOptInAlert:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, 0);

}

uint64_t __64__AFSettingsConnection_shouldSuppressSiriDataSharingOptInAlert___block_invoke_139(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection shouldSuppressSiriDataSharingOptInAlert:]_block_invoke";
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s status = %d", (uint8_t *)&v6, 0x12u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __68__AFSettingsConnection_setOnDeviceDictationAvailableAlertPresented___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setOnDeviceDictationAvailableAlertPresented:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_sendSampledAudioToServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection sendSampledAudioToServerWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setIsHomePodInHH2Mode:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __57__AFSettingsConnection_setIsHomePodInHH2Mode_completion___block_invoke_137(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setSiriDataSharingHomePodSetupDeviceIsValid:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __79__AFSettingsConnection_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke_136(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setSiriDataSharingOptInAlertPresented:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __73__AFSettingsConnection_setSiriDataSharingOptInAlertPresented_completion___block_invoke_135(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __106__AFSettingsConnection_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error while attempting to set Siri data sharing optin status %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)a1[4];
    v9 = 136315394;
    v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Siri data sharing optin status is set to %@ and propagation (if required) has been kicked off", (uint8_t *)&v9, 0x16u);
  }
  v6 = a1[5];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, 0);

}

uint64_t __68__AFSettingsConnection_getSiriDataSharingOptInStatusWithCompletion___block_invoke_133(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t result;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    if (a2 > 3)
      v6 = CFSTR("(unknown)");
    else
      v6 = off_1E3A35998[a2];
    v7 = v6;
    v9 = 136315394;
    v10 = "-[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s optin status = %@", (uint8_t *)&v9, 0x16u);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, unint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed to set Siri data sharing optin status %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)a1[4];
    v9 = 136315394;
    v10 = "-[AFSettingsConnection setSiriDataSharingOptInStatus:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Siri data sharing optin status is set to %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = a1[5];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

uint64_t __65__AFSettingsConnection_setSiriDataSharingOptInStatus_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__AFSettingsConnection_siriGradingIsEnabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, BOOL))(result + 16))(result, a2, a3 == 1);
  return result;
}

uint64_t __40__AFSettingsConnection_getSharedUserID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __53__AFSettingsConnection_resetProfileNames_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection resetProfileNames:completion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object is %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __59__AFSettingsConnection_showHomeProfileNamesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showHomeProfileNamesWithCompletion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object - %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __60__AFSettingsConnection_showLocalProfileNamesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showLocalProfileNamesWithCompletion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error creating remote object - %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __61__AFSettingsConnection_showMultiUserSharedUserIDsCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showMultiUserSharedUserIDsCompletion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
  }

}

void __66__AFSettingsConnection_showPrimaryUserSharedUserIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showPrimaryUserSharedUserIDWithCompletion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __51__AFSettingsConnection_showMultiUserCompanionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showMultiUserCompanionInfo:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __39__AFSettingsConnection_showMultiUsers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFSettingsConnection showMultiUsers:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s error is %@", (uint8_t *)&v6, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

uint64_t __67__AFSettingsConnection_removeMultiUserWithSharedUserID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __55__AFSettingsConnection_removeMultiUserUser_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __117__AFSettingsConnection_addMultiUserUser_sharedId_loggableSharedId_iCloudAltDSID_enrollmentName_isPrimary_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFSettingsConnection multiUserCompanionDeviceIdentifiers:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Received error while finding multi user companion rapport identifiers %@", (uint8_t *)&v8, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __60__AFSettingsConnection_multiUserCompanionDeviceIdentifiers___block_invoke_128(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    objc_msgSend(a2, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFSettingsConnection getPersonalMultiUserDeviceIdentifiers:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Received error while finding multi user device rapport identifiers %@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__AFSettingsConnection_getPersonalMultiUserDeviceIdentifiers___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AFSettingsConnection_getSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __64__AFSettingsConnection_getHomeUserIdForSharedUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __86__AFSettingsConnection_postJSDiscoveryNotificationForBTDeviceWithInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFSettingsConnection postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect and post JS discovery notification for BT Device %@, error: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __79__AFSettingsConnection_stopObservingBluetoothInEarDetectionStateForObserverID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection stopObservingBluetoothInEarDetectionStateForObserverID:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and stop observing in-ear detection state: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __93__AFSettingsConnection_startObservingBluetoothInEarDetectionStateForBTAddress_forObserverID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFSettingsConnection startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect and start observing in-ear detection state for %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

uint64_t __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __74__AFSettingsConnection_getInEarDetectionStateForBTAddress_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __60__AFSettingsConnection_stopObservingWirelessSplitterSession__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection stopObservingWirelessSplitterSession]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and stop observing wireless splitter session: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __61__AFSettingsConnection_startObservingWirelessSplitterSession__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startObservingWirelessSplitterSession]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed to connect and start observing wireless splitter session: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __78__AFSettingsConnection_getBluetoothWirelessSplitterSessionInfoWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __72__AFSettingsConnection_getPairedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __75__AFSettingsConnection_getConnectedBluetoothDeviceInfoArrayWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __65__AFSettingsConnection_getBluetoothDeviceInfoWithUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __69__AFSettingsConnection_getBluetoothDeviceInfoWithAddress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __68__AFSettingsConnection_getSiriOutputVolumeForAudioRoute_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(float))(result + 16))(0.0);
  return result;
}

uint64_t __61__AFSettingsConnection_fetchExperimentContextWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __68__AFSettingsConnection_fetchExperimentConfigurationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __77__AFSettingsConnection_fetchEventRecordsFromAnalyticsStoreAtPath_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __64__AFSettingsConnection_publishFeedbackArbitrationParticipation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection publishFeedbackArbitrationParticipation:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __43__AFSettingsConnection_getStereoPairState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__AFSettingsConnection_getStereoPartnerLastMyriadWinDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__AFSettingsConnection_getMeCard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFSettingsConnection getMeCard:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Hit error %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __86__AFSettingsConnection_getSupplementalLanguagesForProduct_forBuildVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__AFSettingsConnection_getSupplementalLanguageDictionaryForProduct_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__AFSettingsConnection_getSupplementalLanguagesModificationDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__AFSettingsConnection_getSupplementalLanguagesDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__AFSettingsConnection_setSupplementalLanguages_forProduct_forBuildVersion_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__AFSettingsConnection_setSupplementalLanguageDictionary_forProduct_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__AFSettingsConnection_postTestResultSelectedWithRcId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection postTestResultSelectedWithRcId:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __75__AFSettingsConnection_postTestResultCandidateWithRcId_recognitionSausage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection postTestResultCandidateWithRcId:recognitionSausage:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __53__AFSettingsConnection_stopAllAudioPlaybackRequests___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection stopAllAudioPlaybackRequests:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __61__AFSettingsConnection_stopAudioPlaybackRequest_immediately___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection stopAudioPlaybackRequest:immediately:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __69__AFSettingsConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __43__AFSettingsConnection_getPeerIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __61__AFSettingsConnection_startRemoteRequest_onPeer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __33__AFSettingsConnection_dismissUI__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection dismissUI]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __153__AFSettingsConnection_startMultiUserUIRequestWithText_expectedSpeakerSharedUserID_expectedSpeakerConfidenceScore_nonspeakerConfidenceScores_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startMultiUserUIRequestWithText:expectedSpeakerSharedUserID:expectedSpeakerConfidenceSco"
         "re:nonspeakerConfidenceScores:completion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__AFSettingsConnection_startUIRequestWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIRequestWithInfo:completion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__AFSettingsConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIRequestWithText:completion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __77__AFSettingsConnection_startUIMockServerRequestWithReplayFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIMockServerRequestWithReplayFileURL:completion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __61__AFSettingsConnection_startUIRequestWithSpeechAudioFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIRequestWithSpeechAudioFileURL:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __47__AFSettingsConnection_startUIRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIRequestWithInfo:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __47__AFSettingsConnection_startUIRequestWithText___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection startUIRequestWithText:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__AFSettingsConnection_setAllowJustSiriHomeKitSetting_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__AFSettingsConnection_isJustSiriEnabledInTheHome___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__AFSettingsConnection_availableLanguagesInTheHome___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__AFSettingsConnection_setRecognizeMyVoiceEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setRecognizeMyVoiceEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__AFSettingsConnection_getCurrentAccessoryInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getCurrentAccessoryInfoWithCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __63__AFSettingsConnection_setLanguage_outputVoice_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

uint64_t __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__AFSettingsConnection_setLanguage_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__AFSettingsConnection_setOutputVoice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__AFSettingsConnection_getAvailableVoicesForLanguage_includeAssetInfo_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v1 = a1[6];
  if (v1)
  {
    v3 = (void *)a1[4];
    objc_msgSend(v3, "_voices");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_filterVoices:forLanguage:", v5, a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

  }
}

uint64_t __101__AFSettingsConnection_createOfflineSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __64__AFSettingsConnection_getOfflineDictationStatusWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AFSettingsConnection_getOfflineAssistantStatusWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__AFSettingsConnection__updateVoicesIncludingAssetInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setVoices:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __31__AFSettingsConnection__voices__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __35__AFSettingsConnection__setVoices___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __74__AFSettingsConnection_getAudioSessionCoordinationSnapshotWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __44__AFSettingsConnection_currectNWActivityId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection currectNWActivityId:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __44__AFSettingsConnection_currectNWActivityId___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__AFSettingsConnection_homeOnboardingFlowInvoked_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection homeOnboardingFlowInvoked:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __65__AFSettingsConnection_fetchMultiUserVoiceIdentificationSetting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFSettingsConnection fetchMultiUserVoiceIdentificationSetting:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_4:

}

void __72__AFSettingsConnection_clearOpportuneSpeakingEdgeDetectorSignalOverride__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearOpportuneSpeakingEdgeDetectorSignalOverride]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__AFSettingsConnection_setOpportuneSpeakingEdgeDetectorSignalOverride___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setOpportuneSpeakingEdgeDetectorSignalOverride:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_clearShowAppsBehindSiriInCarPlayEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearShowAppsBehindSiriInCarPlayEnabled]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __62__AFSettingsConnection_setShowAppsBehindSiriInCarPlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setShowAppsBehindSiriInCarPlayEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__AFSettingsConnection_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getShowAppsBehindSiriInCarPlayEnabledWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __72__AFSettingsConnection_clearMessageWithoutConfirmationHeadphonesEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationHeadphonesEnabled]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__AFSettingsConnection_setMessageWithoutConfirmationHeadphonesEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setMessageWithoutConfirmationHeadphonesEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __85__AFSettingsConnection_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __71__AFSettingsConnection_clearMessageWithoutConfirmationInCarPlayEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationInCarPlayEnabled]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__AFSettingsConnection_setMessageWithoutConfirmationInCarPlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setMessageWithoutConfirmationInCarPlayEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __84__AFSettingsConnection_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __62__AFSettingsConnection_clearMessageWithoutConfirmationEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearMessageWithoutConfirmationEnabled]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __61__AFSettingsConnection_setMessageWithoutConfirmationEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setMessageWithoutConfirmationEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __75__AFSettingsConnection_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getMessageWithoutConfirmationEnabledWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __75__AFSettingsConnection_fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __72__AFSettingsConnection_setAnnounceNotificationsOnBuiltInSpeakerEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsOnBuiltInSpeakerEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __78__AFSettingsConnection_updateAnnounceNotificationsOnHearingAidSupportedStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection updateAnnounceNotificationsOnHearingAidSupportedStatus]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__AFSettingsConnection_setAnnounceNotificationsOnHearingAidsSupported___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsOnHearingAidsSupported:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __69__AFSettingsConnection_setAnnounceNotificationsOnHearingAidsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsOnHearingAidsEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_clearAnnounceNotificationsInCarPlayType__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearAnnounceNotificationsInCarPlayType]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __62__AFSettingsConnection_setAnnounceNotificationsInCarPlayType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsInCarPlayType:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__AFSettingsConnection_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAnnounceNotificationsInCarPlayTypeWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __78__AFSettingsConnection_clearAnnounceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearAnnounceNotificationsInCarPlayTemporarilyDisabled]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __91__AFSettingsConnection_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);

}

void __77__AFSettingsConnection_setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsInCarPlayTemporarilyDisabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __89__AFSettingsConnection_setAnnounceNotificationsTemporarilyDisabledUntil_forApp_platform___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __101__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __82__AFSettingsConnection_setAnnounceNotificationsTemporarilyDisabledUntil_platform___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:platform:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __97__AFSettingsConnection_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __58__AFSettingsConnection_setSpokenNotificationProxCardSeen___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setSpokenNotificationProxCardSeen:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __74__AFSettingsConnection_setSpokenNotificationShouldSkipTriggerlessReplies___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setSpokenNotificationShouldSkipTriggerlessReplies:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __88__AFSettingsConnection_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__AFSettingsConnection_setSpokenNotificationShouldAnnounceAllNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setSpokenNotificationShouldAnnounceAllNotifications:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __90__AFSettingsConnection_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_setSpokenNotificationIsAlwaysOpportune___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setSpokenNotificationIsAlwaysOpportune:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __77__AFSettingsConnection_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getSpokenNotificationIsAlwaysOpportuneWithCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __64__AFSettingsConnection_getHeadGesturesForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getHeadGesturesForCurrentlyRoutedDevice:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __79__AFSettingsConnection_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setHeadGesturesForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __66__AFSettingsConnection_getPersonalVolumeForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getPersonalVolumeForCurrentlyRoutedDevice:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __81__AFSettingsConnection_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setPersonalVolumeForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __73__AFSettingsConnection_getConversationAwarenessForCurrentlyRoutedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection getConversationAwarenessForCurrentlyRoutedDevice:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __88__AFSettingsConnection_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setConversationAwarenessForCurrentlyRoutedDevice:withCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __72__AFSettingsConnection_clearSpokenNotificationTemporarilyDisabledStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection clearSpokenNotificationTemporarilyDisabledStatus]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFSettingsConnection forceMultiUserSync:download:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_4:

}

uint64_t __63__AFSettingsConnection_forceMultiUserSync_download_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__AFSettingsConnection_configOverrides___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__AFSettingsConnection_configOverrides___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection configOverrides:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __54__AFSettingsConnection_setConfigOverrides_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection setConfigOverrides:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __70__AFSettingsConnection_getDevicesWithAvailablePHSAssetsOnDeviceCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getDevicesWithAvailablePHSAssetsOnDeviceCheck:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __79__AFSettingsConnection_getDevicesWithAvailablePHSAssetsForLanguage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection getDevicesWithAvailablePHSAssetsForLanguage:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __64__AFSettingsConnection_disableAndDeleteCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection disableAndDeleteCloudSyncWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __31__AFSettingsConnection_barrier__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection barrier]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__AFSettingsConnection_resetSessionsAtNextRequestBoundary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection resetSessionsAtNextRequestBoundary]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __45__AFSettingsConnection_shutdownSessionIfIdle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection shutdownSessionIfIdle]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __34__AFSettingsConnection_killDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection killDaemon]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __51__AFSettingsConnection_setAssistantLoggingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAssistantLoggingEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __75__AFSettingsConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection suppressLowStorageNotificationForLanguage:suppress:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __59__AFSettingsConnection_setDictationAutoPunctuationEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setDictationAutoPunctuationEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __44__AFSettingsConnection_setDictationEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setDictationEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __44__AFSettingsConnection_setAssistantEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setAssistantEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __51__AFSettingsConnection_setActiveAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection setActiveAccountIdentifier:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __52__AFSettingsConnection_deleteAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection deleteAccountWithIdentifier:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __46__AFSettingsConnection_saveAccount_setActive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection saveAccount:setActive:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __32__AFSettingsConnection_accounts__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__AFSettingsConnection_fetchActiveAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection fetchActiveAccount:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __43__AFSettingsConnection_fetchActiveAccount___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  AFAccount *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
    v6 = -[AFAccount initWithMessageDictionary:]([AFAccount alloc], "initWithMessageDictionary:", v8);
  else
    v6 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, AFAccount *, id))(v7 + 16))(v7, v6, v5);

}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection fetchAccountsSynchronously:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection fetchAccountsSynchronously:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __62__AFSettingsConnection_fetchAccountsSynchronously_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  AFAccount *v11;
  AFAccount *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = [AFAccount alloc];
          v12 = -[AFAccount initWithMessageDictionary:](v11, "initWithMessageDictionary:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v4, 0);

}

void __35__AFSettingsConnection__connection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AFSettingsConnection__connection__block_invoke_2;
    block[3] = &unk_1E3A36F30;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __35__AFSettingsConnection__connection__block_invoke_10(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AFSettingsConnection__connection__block_invoke_2_11;
    block[3] = &unk_1E3A36F30;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __35__AFSettingsConnection__connection__block_invoke_2_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearConnection");
}

uint64_t __35__AFSettingsConnection__connection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processIdentifier"))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[AFSettingsConnection _connection]_block_invoke_2";
      _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s Because pid=0, most likely a connection could never be established to begin with. Likely you are missing an entitlement and/or privilege to look up a mach port.", (uint8_t *)&v4, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearConnection");
}

+ (AFSettingsConnection)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AFSettingsConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_19924 != -1)
    dispatch_once(&sharedInstance_onceToken_19924, block);
  return (AFSettingsConnection *)(id)sharedInstance_singleton;
}

void __38__AFSettingsConnection_sharedInstance__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[AFSettingsConnection sharedInstance]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v3;

}

- (void)_setSyncNeededForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_441);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSyncNeededForReason:", v4);

}

- (void)_clearSyncNeededForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_442);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_clearSyncNeededForKey:", v4);

}

- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__AFSettingsConnection_Internal___syncDataWithAnchorKeys_forceReset_reason_completion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v16 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_syncDataWithAnchorKeys:forceReset:reason:reply:", v13, v7, v12, v11);

}

- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabledByTrial___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_isInactiveDeviceSyncDisabledByTrial:", v5);

}

- (void)_isInactiveDeviceSyncDisabled:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabled___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_isInactiveDeviceSyncDisabled:", v5);

}

- (void)_fetchPeerData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_443);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fetchPeerData:", v4);

}

- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __114__AFSettingsConnection_Internal___setSyncVerificationNeededAndFullReportNeeded_shouldPostNotification_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setSyncVerificationNeededAndFullReportNeeded:shouldPostNotification:completion:", v6, v5, v9);

}

- (void)_runServiceMaintenance
{
  void *v3;

  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", &__block_literal_global_444);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_runServiceMaintenance");

  -[AFSettingsConnection barrier](self, "barrier");
}

- (void)_getSharedCompanionInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__AFSettingsConnection_Internal___getSharedCompanionInfo___block_invoke;
    v8[3] = &unk_1E3A35B08;
    v6 = v4;
    v9 = v6;
    -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getSharedCompanionInfo:", v6);

  }
}

- (void)_updateMultiUserInfoForUser:(id)a3 score:(id)a4 companionInfo:(id)a5 reset:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  AFSettingsConnection *v28;
  _QWORD block[4];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD *v43;
  _QWORD v44[4];
  NSObject *v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v15)
  {
    v28 = self;
    v16 = dispatch_group_create();
    v17 = v16;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__19718;
    v47[4] = __Block_byref_object_dispose__19719;
    v48 = 0;
    v18 = MEMORY[0x1E0C809B0];
    if (v13 || v8)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = v12;
      dispatch_group_enter(v16);
      v44[0] = v19;
      v44[1] = 3221225472;
      v44[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke;
      v44[3] = &unk_1E3A31AF0;
      v46 = v47;
      v21 = v17;
      v45 = v21;
      -[AFSettingsConnection _settingsServiceWithErrorHandler:](v28, "_settingsServiceWithErrorHandler:", v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_2;
      v41[3] = &unk_1E3A31AF0;
      v43 = v47;
      v42 = v21;
      objc_msgSend(v22, "updateVoiceIdScoreToUser:score:reset:completion:", v20, v13, v8, v41);

      v12 = v20;
      v18 = MEMORY[0x1E0C809B0];
    }
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__19718;
    v39[4] = __Block_byref_object_dispose__19719;
    v40 = 0;
    objc_msgSend(v14, "assistantID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v14, "speechID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        dispatch_group_enter(v17);
        v36[0] = v18;
        v36[1] = 3221225472;
        v36[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_3;
        v36[3] = &unk_1E3A31AF0;
        v38 = v39;
        v25 = v17;
        v37 = v25;
        -[AFSettingsConnection _settingsServiceWithErrorHandler:](v28, "_settingsServiceWithErrorHandler:", v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v18;
        v33[1] = 3221225472;
        v33[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_4;
        v33[3] = &unk_1E3A31AF0;
        v35 = v39;
        v34 = v25;
        objc_msgSend(v26, "updateMultiUserWithSharedUserId:companionInfo:completion:", v12, v14, v33);

      }
    }
    dispatch_get_global_queue(0, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_5;
    block[3] = &unk_1E3A31B18;
    v31 = v47;
    v30 = v15;
    v32 = v39;
    dispatch_group_notify(v17, v27, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v47, 8);

  }
}

- (void)_handleCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Sending %@", buf, 0x16u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke;
  v15[3] = &unk_1E3A35B08;
  v10 = v6;
  v16 = v10;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke_445;
  v13[3] = &unk_1E3A34BD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "handleCommand:completion:", v7, v13);

}

- (void)_setSyncToken:(id)a3 forAceHost:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke;
  v17[3] = &unk_1E3A35B08;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke_447;
  v15[3] = &unk_1E3A36BB8;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "setSyncToken:forAceHost:completion:", v12, v11, v15);

}

- (void)_sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke_448;
  v9[3] = &unk_1E3A36BB8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:", v9);

}

- (void)_readSyncTokenForAceHost:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__AFSettingsConnection_Internal___readSyncTokenForAceHost_completion___block_invoke;
  v10[3] = &unk_1E3A35B08;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[AFSettingsConnection _settingsServiceWithErrorHandler:](self, "_settingsServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readSyncTokenForAceHost:completion:", v8, v7);

}

- (AFSettingsDelegate)_delegate
{
  return self->_delegate;
}

- (void)_setDelegate:(id)a3
{
  id v5;
  AFSettingsDelegate **p_delegate;
  AFSettingsDelegate *delegate;
  id v8;

  v5 = a3;
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  v8 = v5;
  if ((-[AFSettingsDelegate isEqual:](delegate, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_delegate, a3);

}

- (void)_tellDelegatePartialVerificationResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _delegate](self, "_delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_settingsConnectionPartialVerificationResult:", v4);

}

- (void)_tellDelegateServerVerificationReport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFSettingsConnection _delegate](self, "_delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_settingsConnectionServerVerificationReport:", v4);

}

void __70__AFSettingsConnection_Internal___readSyncTokenForAceHost_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _readSyncTokenForAceHost:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __99__AFSettingsConnection_Internal___sendSyncTokenToPersonalRequestsEnabledAccessoriesWithCompletion___block_invoke_448(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _setSyncToken:forAceHost:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __70__AFSettingsConnection_Internal___setSyncToken_forAceHost_completion___block_invoke_447(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Interrupted %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __60__AFSettingsConnection_Internal___handleCommand_completion___block_invoke_445(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[AFSettingsConnection(Internal) _handleCommand:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Received %@ %@", (uint8_t *)&v9, 0x20u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D87F40], "aceObjectWithDictionary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __99__AFSettingsConnection_Internal___updateMultiUserInfoForUser_score_companionInfo_reset_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__AFSettingsConnection_Internal___getSharedCompanionInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __56__AFSettingsConnection_Internal___runServiceMaintenance__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection(Internal) _runServiceMaintenance]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __114__AFSettingsConnection_Internal___setSyncVerificationNeededAndFullReportNeeded_shouldPostNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __49__AFSettingsConnection_Internal___fetchPeerData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection(Internal) _fetchPeerData:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __64__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _isInactiveDeviceSyncDisabled:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __71__AFSettingsConnection_Internal___isInactiveDeviceSyncDisabledByTrial___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[AFSettingsConnection(Internal) _isInactiveDeviceSyncDisabledByTrial:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __87__AFSettingsConnection_Internal___syncDataWithAnchorKeys_forceReset_reason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__AFSettingsConnection_Internal___clearSyncNeededForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection(Internal) _clearSyncNeededForKey:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__AFSettingsConnection_Internal___setSyncNeededForReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFSettingsConnection(Internal) _setSyncNeededForReason:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s settingsService got error: %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
