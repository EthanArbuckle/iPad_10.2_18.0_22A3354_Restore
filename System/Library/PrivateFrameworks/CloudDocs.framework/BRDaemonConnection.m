@implementation BRDaemonConnection

+ (void)initialize
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v2, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.clouddocs.xpc", v3);

    v5 = (void *)gDaemonDefaultQueue;
    gDaemonDefaultQueue = (uint64_t)v4;

    v6 = objc_opt_new();
    v7 = (void *)gDaemonConnectionsByUUID;
    gDaemonConnectionsByUUID = v6;

    v8 = objc_opt_new();
    v9 = (void *)gDaemonDefaultConnectionsByKey;
    gDaemonDefaultConnectionsByKey = v8;

    v10 = objc_opt_new();
    v11 = (void *)gDaemonSecondaryConnectionsByKey;
    gDaemonSecondaryConnectionsByKey = v10;

    v12 = objc_opt_new();
    v13 = (void *)gCacheLock;
    gCacheLock = v12;

    v14 = objc_opt_new();
    v15 = (void *)g_homeDirectoryURLForPersona;
    g_homeDirectoryURLForPersona = v14;

    v16 = objc_opt_new();
    v17 = (void *)g_mobileDocumentsURLForPersona;
    g_mobileDocumentsURLForPersona = v16;

    v18 = objc_opt_new();
    v19 = (void *)g_cloudDocsAppSupportURLForPersona;
    g_cloudDocsAppSupportURLForPersona = v18;

    v20 = objc_opt_new();
    v21 = (void *)g_cloudDocsCachesURLForPersona;
    g_cloudDocsCachesURLForPersona = v20;

    v22 = objc_opt_new();
    v23 = (void *)g_syncedDocumentsURLForPersona;
    g_syncedDocumentsURLForPersona = v22;

    v24 = objc_opt_new();
    v25 = (void *)g_syncedDesktopURLForPersona;
    g_syncedDesktopURLForPersona = v24;

    v26 = objc_opt_new();
    v27 = (void *)g_syncedRootURLsForPersona;
    g_syncedRootURLsForPersona = v26;

    v28 = objc_opt_new();
    v29 = (void *)g_accountTokenDidChangeObserverForPersona;
    g_accountTokenDidChangeObserverForPersona = v28;

  }
}

+ (id)mobileDocumentsURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mobileDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_mobileDocumentsURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(0, v6, v4);
    objc_msgSend((id)g_mobileDocumentsURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

- (id)newSyncTokenProxy
{
  void *v4;
  NSObject *v5;

  if (!self->_isUsingTokenService)
  {
    brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newSyncTokenProxy]", 324);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRDaemonConnection newSyncTokenProxy].cold.1();

  }
  return -[BRXPCSyncProxy initWithXPCObject:]([BRXPCSyncProxy alloc], "initWithXPCObject:", self);
}

- (id)newSyncProxy
{
  void *v4;
  NSObject *v5;

  if (self->_isUsingTokenService)
  {
    brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newSyncProxy]", 285);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRDaemonConnection newSyncProxy].cold.1();

  }
  return -[BRXPCSyncProxy initWithXPCObject:]([BRXPCSyncProxy alloc], "initWithXPCObject:", self);
}

- (id)initUsingUserLocalDaemonTokenService
{
  BRDaemonConnection *v2;
  BRDaemonConnection *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRDaemonConnection;
  v2 = -[BRDaemonConnection initWithMachServiceName:options:](&v7, sel_initWithMachServiceName_options_, CFSTR("com.apple.bird.token"), 0);
  v3 = v2;
  if (v2)
  {
    v2->_isUsingTokenService = 1;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "br_currentPersonaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRDaemonConnection _setupAndResumeForKey:](v3, "_setupAndResumeForKey:", v5);

  }
  return v3;
}

- (id)initUsingUserLocalDaemon
{
  BRDaemonConnection *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRDaemonConnection;
  v2 = -[BRDaemonConnection initWithMachServiceName:options:](&v6, sel_initWithMachServiceName_options_, CFSTR("com.apple.bird"), 0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "br_currentPersonaID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRDaemonConnection _setupAndResumeForKey:](v2, "_setupAndResumeForKey:", v4);

  }
  return v2;
}

- (void)_setupAndResumeForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int active_platform;
  int v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  if (self->_uuid)
    -[BRDaemonConnection _setUUID:](self, "_setUUID:");
  if (self->_isUsingTokenService)
    BRCXPCTokenInterface();
  else
    BRCXPCInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRDaemonConnection setRemoteObjectInterface:](self, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke;
  v16[3] = &unk_1E3DA5870;
  objc_copyWeak(&v17, &location);
  -[BRDaemonConnection setInterruptionHandler:](self, "setInterruptionHandler:", v16);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_2;
  v13[3] = &unk_1E3DA74A0;
  objc_copyWeak(&v15, &location);
  v7 = v4;
  v14 = v7;
  -[BRDaemonConnection setInvalidationHandler:](self, "setInvalidationHandler:", v13);
  v8 = -[BRDaemonConnection resume](self, "resume");
  if (!self->_isUsingTokenService && (BRIsFPFSEnabled(v8, v9) & 1) == 0)
  {
    -[BRDaemonConnection remoteObjectProxy](self, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
    {
      v12 = dyld_program_sdk_at_least();
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
      v12 = 1;
    }
    objc_msgSend(v10, "checkinAskClientIfUsingUbiquity:", v12 ^ 1u);

  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

+ (id)defaultConnection
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultConnectionForKey:initializer:", v4, &__block_literal_global_32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultConnectionForKey:(id)a3 initializer:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  v7 = gDaemonDefaultQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BRDaemonConnection_defaultConnectionForKey_initializer___block_invoke;
  block[3] = &unk_1E3DA5090;
  v14 = v6;
  v15 = &v16;
  v13 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)secondaryConnectionIfExists
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryConnectionIfExistsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)secondaryConnectionIfExistsForKey:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v4 = gDaemonDefaultQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__BRDaemonConnection_secondaryConnectionIfExistsForKey___block_invoke;
  v8[3] = &unk_1E3DA5708;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)defaultConnectionIfExists
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultConnectionIfExistsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultConnectionIfExistsForKey:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v4 = gDaemonDefaultQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__BRDaemonConnection_defaultConnectionIfExistsForKey___block_invoke;
  v8[3] = &unk_1E3DA5708;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __58__BRDaemonConnection_defaultConnectionForKey_initializer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)gDaemonDefaultConnectionsByKey, "objectForKeyedSubscript:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)gDaemonDefaultConnectionsByKey, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
  }
}

id __39__BRDaemonConnection_defaultConnection__block_invoke()
{
  return -[BRDaemonConnection initUsingUserLocalDaemon]([BRDaemonConnection alloc], "initUsingUserLocalDaemon");
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = gDaemonDefaultQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_3;
  v3[3] = &unk_1E3DA74A0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend((id)gDaemonDefaultConnectionsByKey, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
      objc_msgSend((id)gDaemonDefaultConnectionsByKey, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    objc_msgSend((id)gDaemonSecondaryConnectionsByKey, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v5 == v4)
    {
      objc_msgSend((id)gDaemonSecondaryConnectionsByKey, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
    if (WeakRetained[20])
    {
      objc_msgSend((id)gDaemonConnectionsByUUID, "removeObjectForKey:");
      WeakRetained = v5;
    }
  }

}

void __56__BRDaemonConnection_secondaryConnectionIfExistsForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)gDaemonSecondaryConnectionsByKey, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__BRDaemonConnection_defaultConnectionIfExistsForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)gDaemonDefaultConnectionsByKey, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__BRDaemonConnection_secondaryConnectionForKey_initializer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)gDaemonSecondaryConnectionsByKey, "objectForKeyedSubscript:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)gDaemonSecondaryConnectionsByKey, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
  }
}

id __41__BRDaemonConnection_secondaryConnection__block_invoke()
{
  return -[BRDaemonConnection initUsingUserLocalDaemon]([BRDaemonConnection alloc], "initUsingUserLocalDaemon");
}

- (id)newFPFSSyncProxy
{
  void *v3;
  void *v4;
  NSObject *v5;
  BRXPCAutomaticErrorProxy *v6;
  void *v7;
  void *v8;
  BRXPCAutomaticErrorProxy *v9;
  void *v11;
  NSObject *v12;

  if ((BRIsFPFSEnabled(self, a2) & 1) != 0)
  {
    if (self->_isUsingTokenService)
    {
      brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newFPFSSyncProxy]", 317);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRDaemonConnection newSyncProxy].cold.1();

    }
    return -[BRXPCSyncProxy initWithXPCObject:]([BRXPCSyncProxy alloc], "initWithXPCObject:", self);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newFPFSSyncProxy]", 308);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRDaemonConnection newFPFSSyncProxy].cold.2();

    v6 = [BRXPCAutomaticErrorProxy alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("broken FPFS proxy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v6, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EE4572A0, v7, v8, 0);

    -[FPXPCAutomaticErrorProxy synchronousRemoteObjectProxy](v9, "synchronousRemoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)secondaryConnection
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryConnectionForKey:initializer:", v4, &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)secondaryConnectionForKey:(id)a3 initializer:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  v7 = gDaemonDefaultQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BRDaemonConnection_secondaryConnectionForKey_initializer___block_invoke;
  block[3] = &unk_1E3DA5090;
  v14 = v6;
  v15 = &v16;
  v13 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)cloudDocsAppSupportURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cloudDocsAppSupportURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_cloudDocsAppSupportURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    objc_msgSend((id)g_cloudDocsAppSupportURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)newLegacySyncProxy
{
  void *v3;
  NSObject *v4;
  BRXPCAutomaticErrorProxy *v5;
  void *v6;
  void *v7;
  BRXPCAutomaticErrorProxy *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  if (BRIsFPFSEnabled(self, a2))
  {
    brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newLegacySyncProxy]", 292);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRDaemonConnection newLegacySyncProxy].cold.1();

    v5 = [BRXPCAutomaticErrorProxy alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("broken legacy proxy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v5, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EE457300, v6, v7, 0);

    -[FPXPCAutomaticErrorProxy synchronousRemoteObjectProxy](v8, "synchronousRemoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self->_isUsingTokenService)
    {
      brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newLegacySyncProxy]", 301);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRDaemonConnection newSyncProxy].cold.1();

    }
    return -[BRXPCSyncProxy initWithXPCObject:]([BRXPCSyncProxy alloc], "initWithXPCObject:", self);
  }
  return v9;
}

+ (id)homeDirectoryURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_homeDirectoryURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    objc_msgSend((id)g_homeDirectoryURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

+ (id)cloudDocsCachesURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_cloudDocsCachesURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    objc_msgSend((id)g_cloudDocsCachesURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

+ (id)syncedDesktopURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_syncedDesktopURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    objc_msgSend((id)g_syncedDesktopURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

+ (id)syncedDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_syncedDocumentsURLForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    objc_msgSend((id)g_syncedDocumentsURLForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

+ (id)syncedRootURLsForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = CFSTR("__defaultPersonaID__");
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  objc_msgSend((id)gCacheLock, "lock");
  objc_msgSend((id)g_syncedRootURLsForPersona, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _preComputeURLSForPersona(0, v6, v4);
    objc_msgSend((id)g_syncedRootURLsForPersona, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)gCacheLock, "unlock");

  return v7;
}

+ (id)homeDirectoryURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeDirectoryURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)syncedDesktopURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncedDesktopURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)syncedDocumentsURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncedDocumentsURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)syncedRootURLs
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncedRootURLsForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cloudDocsCachesURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudDocsCachesURLForPersonaID:needsPersonaSwitch:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)invalidateCachedURLProperties
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "invalidateCachedURLPropertiesForPersonaID:", v3);

}

+ (void)invalidateCachedURLPropertiesForPersonaID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)gCacheLock;
  v4 = a3;
  objc_msgSend(v3, "lock");
  objc_msgSend((id)g_homeDirectoryURLForPersona, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllCachedResourceValues");

  objc_msgSend((id)g_mobileDocumentsURLForPersona, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllCachedResourceValues");

  objc_msgSend((id)g_cloudDocsAppSupportURLForPersona, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllCachedResourceValues");

  objc_msgSend((id)g_cloudDocsCachesURLForPersona, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllCachedResourceValues");

  objc_msgSend((id)g_syncedDocumentsURLForPersona, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllCachedResourceValues");

  objc_msgSend((id)g_syncedDesktopURLForPersona, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeAllCachedResourceValues");
  objc_msgSend((id)gCacheLock, "unlock");
}

+ (void)clearURLCache
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clearURLCacheForPersonaID:", v3);

}

+ (void)clearURLCacheForPersonaID:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)gCacheLock;
  v5 = a3;
  objc_msgSend(v4, "lock");
  objc_msgSend(a1, "invalidateCachedURLPropertiesForPersonaID:", v5);
  objc_msgSend((id)g_homeDirectoryURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_mobileDocumentsURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_cloudDocsAppSupportURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_cloudDocsCachesURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_syncedDocumentsURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_syncedDesktopURLForPersona, "removeObjectForKey:", v5);
  objc_msgSend((id)g_syncedRootURLsForPersona, "removeObjectForKey:", v5);

  objc_msgSend((id)gCacheLock, "unlock");
}

- (void)newSyncProxy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _isUsingTokenService == NO%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)newLegacySyncProxy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Can't use the legacy sync proxy when fpfs is enabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)newFPFSSyncProxy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Can't use the fpfs sync proxy when fpfs isn't enabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)newSyncTokenProxy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _isUsingTokenService%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
