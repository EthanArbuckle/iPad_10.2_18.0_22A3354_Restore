@implementation _EXPromiseManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstance;
}

- (_EXPromiseManager)init
{
  _EXPromiseManager *v2;
  uint64_t v3;
  NSMapTable *promises;
  uint64_t v5;
  NSXPCListener *listener;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EXPromiseManager;
  v2 = -[_EXPromiseManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    promises = v2->_promises;
    v2->_promises = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v5 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (id)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id result;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  if (!v11)
  {
    _EXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:].cold.1();
    goto LABEL_17;
  }
  if (!v10)
  {
    _EXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:].cold.2();
    goto LABEL_17;
  }
  v12 = v11;
  if (objc_msgSend(v9, "containsObject:", objc_opt_class()))
  {
    _EXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:].cold.3();
LABEL_17:

    __break(1u);
    return result;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v12);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE212CD0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_resolvePromiseWithIdentifier_reply_, 0, 1);
  objc_msgSend(v13, "setRemoteObjectInterface:", v14);
  objc_msgSend(v13, "resume");
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke;
  v25[3] = &unk_1E2CFD038;
  v25[4] = &v32;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke_2;
  v24[3] = &unk_1E2CFD060;
  v24[4] = &v26;
  objc_msgSend(v16, "resolvePromiseWithIdentifier:reply:", v10, v24);
  v17 = v33;
  if (!v27[5] && !v33[5])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 9, MEMORY[0x1E0C9AA70]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v33[5];
    v33[5] = v18;

    v17 = v33;
  }
  if (a6)
  {
    v20 = (void *)v17[5];
    if (v20)
      *a6 = objc_retainAutorelease(v20);
  }
  v21 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (void)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    if (v10)
    {
      v13 = v12;
      if ((objc_msgSend(v9, "containsObject:", objc_opt_class()) & 1) != 0)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v11);
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE212CD0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_resolvePromiseWithIdentifier_reply_, 0, 1);
        objc_msgSend(v14, "setRemoteObjectInterface:", v15);
        objc_msgSend(v14, "resume");
        v16 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke;
        v23[3] = &unk_1E2CFC660;
        v17 = v13;
        v24 = v17;
        objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v16;
        v21[1] = 3221225472;
        v21[2] = __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke_2;
        v21[3] = &unk_1E2CFD088;
        v22 = v17;
        v19 = v17;
        objc_msgSend(v18, "resolvePromiseWithIdentifier:reply:", v10, v21);

        return;
      }
      _EXDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:].cold.3();
    }
    else
    {
      _EXDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:].cold.2();
    }
  }
  else
  {
    _EXDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:].cold.1();
  }

  __break(1u);
}

- (void)registerPromise:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _EXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_EXPromiseManager registerPromise:].cold.3();

  objc_msgSend(v4, "promiseBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (v5)
  {
    if (v8)
    {
      -[NSMapTable setObject:forKey:](self->_promises, "setObject:forKey:", v4, v5);

      return;
    }
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager registerPromise:].cold.2();
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager registerPromise:].cold.1();
  }

  __break(1u);
}

- (void)unregisterPromise:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_EXPromiseManager unregisterPromise:].cold.2(v4, v5);

  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NSMapTable removeObjectForKey:](self->_promises, "removeObjectForKey:", v6);

  }
  else
  {
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_EXPromiseManager unregisterPromise:].cold.1();

    __break(1u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EE212CD0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)resolvePromiseWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  NSMapTable *promises;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v6 = a3;
  promises = self->_promises;
  v8 = (void (**)(id, void *))a4;
  -[NSMapTable objectForKey:](promises, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v9, "resolveObjectOfClasses:error:", v10, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (!v11)
    {
      _EXDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_EXPromiseManager resolvePromiseWithIdentifier:reply:].cold.2();

    }
  }
  else
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_EXPromiseManager resolvePromiseWithIdentifier:reply:].cold.1();
    v11 = 0;
  }

  v8[2](v8, v11);
}

- (NSMapTable)promises
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_promises, 0);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: endpoint is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: endpoint is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

- (void)registerPromise:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)registerPromise:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: promiseBlock is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)registerPromise:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)unregisterPromise:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)unregisterPromise:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();

  OUTLINED_FUNCTION_7();
}

- (void)resolvePromiseWithIdentifier:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Failed to resolve, no promise with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)resolvePromiseWithIdentifier:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Failed to resolve promise: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
