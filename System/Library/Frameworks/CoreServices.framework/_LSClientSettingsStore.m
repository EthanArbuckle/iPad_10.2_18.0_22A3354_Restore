@implementation _LSClientSettingsStore

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4;
  NSObject *internalQueue;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  unsigned __int8 v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD block[7];
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__28;
  v29 = __Block_byref_object_dispose__28;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__28;
  v23[4] = __Block_byref_object_dispose__28;
  v24 = 0;
  internalQueue = self->_internalQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_1E103FED0;
  block[4] = self;
  block[5] = &v25;
  block[6] = v23;
  dispatch_sync(internalQueue, block);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v7 = (void *)v26[5];
  if (v7)
  {
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2;
    v16[3] = &unk_1E10400E0;
    v8 = v4;
    v17 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198;
    v13[3] = &unk_1E10442B0;
    v14 = v8;
    v15 = &v18;
    objc_msgSend(v9, "userElectionForExtensionKey:reply:", v14, v13);

    v10 = v17;
  }
  else
  {
    _LSExtensionsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_LSClientSettingsStore userElectionForExtensionKey:].cold.1();
  }

  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (id)__internalQueue_xpcConnectionWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSXPCConnection **p_xpcConnection;
  void *xpcConnection;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[6];
  void (*v18[5])(_QWORD, _QWORD);
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__28;
  v23 = __Block_byref_object_dispose__28;
  v24 = 0;
  -[_LSClientSettingsStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_configuration)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v18[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v18[2] = (void (*)(_QWORD, _QWORD))__65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke;
    v18[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
    v18[4] = (void (*)(_QWORD, _QWORD))&v19;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_195;
    v17[3] = &unk_1E1044288;
    v17[4] = self;
    v17[5] = &v19;
    objc_msgSend(v7, "getSettingsStoreConfigurationWithCompletionHandler:", v17);

  }
  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    xpcConnection = self->_configuration;
    if (xpcConnection)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3B38]);
      -[LSSettingsStoreConfiguration endpoint](self->_configuration, "endpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithListenerEndpoint:", v11);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCEDA10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRemoteObjectInterface:", v13);

      objc_msgSend(v12, "_setQueue:", self->_internalQueue);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_197;
      v16[3] = &unk_1E10418C8;
      v16[4] = self;
      objc_msgSend(v12, "setInterruptionHandler:", v16);
      objc_storeStrong((id *)&self->_xpcConnection, v12);
      objc_msgSend(v12, "resume");

      xpcConnection = *p_xpcConnection;
    }
    if (a3 && !xpcConnection)
    {
      *a3 = objc_retainAutorelease((id)v20[5]);
      xpcConnection = *p_xpcConnection;
    }
  }
  v14 = xpcConnection;
  _Block_object_dispose(&v19, 8);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSClientSettingsStore)init
{
  _LSClientSettingsStore *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LSClientSettingsStore;
  v2 = -[LSSettingsStore _init](&v7, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_LSClientSettingsStore;
  -[_LSClientSettingsStore dealloc](&v3, sel_dealloc);
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSObject *internalQueue;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  char v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD block[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v6 = a3;
  v8 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__28;
  v46 = __Block_byref_object_dispose__28;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__28;
  v40 = __Block_byref_object_dispose__28;
  v41 = 0;
  internalQueue = self->_internalQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke;
  block[3] = &unk_1E103FED0;
  block[4] = self;
  block[5] = &v42;
  block[6] = &v36;
  dispatch_sync(internalQueue, block);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v11 = (void *)v43[5];
  if (v11)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__28;
    v29 = __Block_byref_object_dispose__28;
    v30 = 0;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2;
    v21[3] = &unk_1E10442D8;
    v12 = v8;
    v22 = v12;
    v23 = &v25;
    v24 = &v31;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_200;
    v17[3] = &unk_1E10442D8;
    v18 = v12;
    v19 = &v25;
    v20 = &v31;
    objc_msgSend(v13, "setUserElection:forExtensionKey:reply:", v6, v18, v17);
    if (a5 && !*((_BYTE *)v32 + 24))
      *a5 = objc_retainAutorelease((id)v26[5]);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v34 = 0;
    _LSExtensionsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_LSClientSettingsStore setUserElection:forExtensionKey:error:].cold.1();

    if (a5)
      *a5 = objc_retainAutorelease((id)v37[5]);
  }
  v15 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v15;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  NSObject *internalQueue;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD block[7];
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__28;
  v32 = __Block_byref_object_dispose__28;
  v33 = 0;
  v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x3032000000;
  v26[2] = __Block_byref_object_copy__28;
  v26[3] = __Block_byref_object_dispose__28;
  v27 = 0;
  internalQueue = self->_internalQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke;
  block[3] = &unk_1E103FED0;
  block[4] = self;
  block[5] = &v28;
  block[6] = &v25;
  dispatch_sync(internalQueue, block);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v6 = (void *)v29[5];
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__28;
    v18 = __Block_byref_object_dispose__28;
    v19 = 0;
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2;
    v13[3] = &unk_1E1044300;
    v13[4] = &v14;
    v13[5] = &v20;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_201;
    v12[3] = &unk_1E1044300;
    v12[4] = &v14;
    v12[5] = &v20;
    objc_msgSend(v7, "resetUserElectionsWithReply:", v12);
    if (a3 && !*((_BYTE *)v21 + 24))
      *a3 = objc_retainAutorelease((id)v15[5]);

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v23 = 0;
    _LSExtensionsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_LSClientSettingsStore resetUserElectionsWithError:].cold.1((uint64_t)v26, v8, v9);

    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(v26[0] + 40));
  }
  v10 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v28, 8);
  return v10;
}

- (LSSettingsStoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)userElectionForExtensionKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to determine user election for extension key %@: failure creating connection: %@");
  OUTLINED_FUNCTION_1();
}

- (void)setUserElection:forExtensionKey:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to set user election for extension key %@: failure creating connection: %@");
  OUTLINED_FUNCTION_1();
}

- (void)resetUserElectionsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "Failed to reset user elections, failure creating connection: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
