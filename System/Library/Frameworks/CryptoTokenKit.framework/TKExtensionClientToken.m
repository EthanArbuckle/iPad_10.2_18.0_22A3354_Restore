@implementation TKExtensionClientToken

- (id)SEPKeyEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:](self, "withError:getServerEndpoint:", 0, &__block_literal_global_66);
}

- (NSXPCConnection)serverConnection
{
  NSXPCConnection *serverConnection;
  NSXPCListenerEndpoint *serverEndpoint;
  NSXPCListenerEndpoint *v5;
  NSObject *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSNumber *targetUID;
  void *v10;
  NSObject *v12;
  NSXPCConnection *v13;
  NSXPCConnection *v14;

  serverConnection = self->_serverConnection;
  if (serverConnection)
    return serverConnection;
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
  {
    v5 = serverEndpoint;
  }
  else
  {
    provideEndpoint(2);
    v5 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (self->_targetUID)
      {
        TK_LOG_client_1();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[TKExtensionClientToken serverConnection].cold.1((id *)&self->_targetUID, v12);

      }
      self->_namedConnection = 1;
      v13 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ctkd.token-client"), 0);
      v14 = self->_serverConnection;
      self->_serverConnection = v13;

      v5 = 0;
      goto LABEL_8;
    }
  }
  TK_LOG_client_1();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TKExtensionClientToken serverConnection].cold.2(&self->_serverEndpoint, (uint64_t)self, v6);

  v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
  v8 = self->_serverConnection;
  self->_serverConnection = v7;

LABEL_8:
  targetUID = self->_targetUID;
  if (targetUID)
    -[NSXPCConnection _setTargetUserIdentifier:](self->_serverConnection, "_setTargetUserIdentifier:", -[NSNumber integerValue](targetUID, "integerValue"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237DB8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v10);

  -[NSXPCConnection resume](self->_serverConnection, "resume");
  serverConnection = self->_serverConnection;
  return serverConnection;
}

- (TKExtensionClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v9;
  id v10;
  id *v11;
  TKExtensionClientToken *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TKExtensionClientToken;
  v11 = -[TKClientToken _initWithTokenID:](&v14, sel__initWithTokenID_, a3);
  v12 = (TKExtensionClientToken *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong((id *)&v12->_targetUID, a5);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
  -[NSXPCConnection invalidate](self->_tokenConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKExtensionClientToken;
  -[TKExtensionClientToken dealloc](&v3, sel_dealloc);
}

+ (id)builtinTokenIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)withError:(id *)a3 getServerEndpoint:(id)a4
{
  id v4;
  void (**v7)(id, void *, id *);
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  __int128 v21;
  uint64_t v22;
  int v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint8_t v29[4];
  uint64_t v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, id *))a4;
  v23 = 0;
  v22 = *MEMORY[0x1E0CB28A8];
  *(_QWORD *)&v8 = 67109120;
  v21 = v8;
  do
  {
    v26 = 0;
    v27[0] = &v26;
    v27[1] = 0x3032000000;
    v27[2] = __Block_byref_object_copy__6;
    v27[3] = __Block_byref_object_dispose__6;
    v28 = 0;
    -[TKExtensionClientToken serverConnection](self, "serverConnection", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke;
    v25[3] = &unk_1E708A5A8;
    v25[4] = &v26;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    v7[2](v7, v10, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    v13 = *(void **)(v27[0] + 40);
    if (v13)
    {
      if (objc_msgSend(v13, "code") == 4097
        && ((objc_msgSend(*(id *)(v27[0] + 40), "domain"),
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v15 = objc_msgSend(v14, "isEqualToString:", v22),
             v23 < 8)
          ? (v16 = v15)
          : (v16 = 0),
            v14,
            v16))
      {
        TK_LOG_client_1();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          v32 = v23;
          _os_log_debug_impl(&dword_1B9768000, v17, OS_LOG_TYPE_DEBUG, "detected interruption on token-client connection, retrying %d", buf, 8u);
        }

        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", (double)v23++ * 0.1);
        v18 = 1;
      }
      else
      {
        if (a3)
          *a3 = objc_retainAutorelease(*(id *)(v27[0] + 40));
        TK_LOG_client_1();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[TKExtensionClientToken withError:getServerEndpoint:].cold.1(v29, (uint64_t)v27, &v30, v19);

        v18 = 0;
        v4 = 0;
      }
    }
    else
    {
      if (a3 && !v11)
        *a3 = objc_retainAutorelease(v12);
      v4 = v11;
      v18 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }
  while ((v18 & 1) != 0);

  return v4;
}

void __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)endpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:](self, "withError:getServerEndpoint:", 0, &__block_literal_global_18);
}

id __34__TKExtensionClientToken_endpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__TKExtensionClientToken_endpoint__block_invoke_2;
  v5[3] = &unk_1E708A5F0;
  v5[4] = &v6;
  objc_msgSend(v2, "getEndpoint:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__TKExtensionClientToken_endpoint__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)configurationEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:](self, "withError:getServerEndpoint:", 0, &__block_literal_global_64);
}

id __47__TKExtensionClientToken_configurationEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2;
  v5[3] = &unk_1E708A5F0;
  v5[4] = &v6;
  objc_msgSend(v2, "getConfigurationEndpoint:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)watcherEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:](self, "withError:getServerEndpoint:", 0, &__block_literal_global_65);
}

id __41__TKExtensionClientToken_watcherEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2;
  v5[3] = &unk_1E708A5F0;
  v5[4] = &v6;
  objc_msgSend(v2, "getWatcherEndpoint:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2;
  v5[3] = &unk_1E708A5F0;
  v5[4] = &v6;
  objc_msgSend(v2, "getSEPKeyEndpoint:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)ensureConnectionWithError:(id *)a3
{
  char v3;
  __int128 v4;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSXPCConnection *v12;
  NSXPCConnection *tokenConnection;
  void *v14;
  char v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSXPCConnection *serverConnection;
  NSObject *v24;
  __int128 v26;
  uint64_t v27;
  uint8_t v29;
  _BYTE v30[7];
  _QWORD v31[6];
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (self->_tokenConnection)
  {
    v3 = 1;
    return v3 & 1;
  }
  v6 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v7 = MEMORY[0x1E0C809B0];
  v46 = __Block_byref_object_copy__6;
  v47 = __Block_byref_object_dispose__6;
  v48 = 0;
  v27 = *MEMORY[0x1E0CB28A8];
  *(_QWORD *)&v4 = 67109120;
  v26 = v4;
  while (v6 <= 7)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__6;
    v41 = __Block_byref_object_dispose__6;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    -[TKExtensionClientToken serverConnection](self, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke;
    v32[3] = &unk_1E708A618;
    v32[4] = self;
    v32[5] = &v37;
    v32[6] = &v33;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKClientToken tokenID](self, "tokenID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_67;
    v31[3] = &unk_1E708A640;
    v31[4] = &v43;
    v31[5] = &v37;
    objc_msgSend(v9, "getTokenEndpointForTokenID:reply:", v10, v31);

    if (v44[5])
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v12 = (NSXPCConnection *)objc_msgSend(v11, "initWithListenerEndpoint:", v44[5]);
      tokenConnection = self->_tokenConnection;
      self->_tokenConnection = v12;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF235888);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_tokenConnection, "setRemoteObjectInterface:", v14);

      ++self->_connectionIdentifier;
      -[NSXPCConnection resume](self->_tokenConnection, "resume");
      v15 = 0;
      v3 = 1;
    }
    else
    {
      if (objc_msgSend((id)v38[5], "code") == 4097
        && (objc_msgSend((id)v38[5], "domain"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqualToString:", v27),
            v16,
            v17))
      {
        TK_LOG_client_1();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          v50 = v6;
          _os_log_debug_impl(&dword_1B9768000, v18, OS_LOG_TYPE_DEBUG, "reconnecting ctkd after interrupt, try %d", buf, 8u);
        }

      }
      else
      {
        if (objc_msgSend((id)v38[5], "code", v26) != 4099)
          goto LABEL_21;
        objc_msgSend((id)v38[5], "domain");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v27);

        if (!v20)
          goto LABEL_21;
        if (*((_BYTE *)v34 + 24) && self->_namedConnection
          || -[TKClientToken _testing_noAutomaticReconnect](self, "_testing_noAutomaticReconnect"))
        {
          TK_LOG_client_1();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[TKExtensionClientToken ensureConnectionWithError:].cold.2(&v29, v30, v21);

LABEL_21:
          v15 = 0;
          v3 = 0;
          if (a3)
            *a3 = objc_retainAutorelease((id)v38[5]);
          goto LABEL_23;
        }
        TK_LOG_client_1();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          v50 = v6;
          _os_log_debug_impl(&dword_1B9768000, v22, OS_LOG_TYPE_DEBUG, "reconnecting ctkd after invalidate, try %d", buf, 8u);
        }

        -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
        serverConnection = self->_serverConnection;
        self->_serverConnection = 0;

        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", (double)v6++ * 0.1);
      }
      v15 = 1;
    }
LABEL_23:
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);

    if ((v15 & 1) == 0)
      goto LABEL_33;
  }
  TK_LOG_client_1();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    -[TKExtensionClientToken ensureConnectionWithError:].cold.1((uint64_t)self, v24);

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
    v3 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
LABEL_33:
  _Block_object_dispose(&v43, 8);

  return v3 & 1;
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  TK_LOG_client_1();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)withError:(id *)a3 invoke:(id)a4
{
  id v4;
  void (**v7)(id, void *, _QWORD, id *);
  TKExtensionClientToken *v8;
  int v9;
  double v10;
  __int128 v11;
  void *v12;
  void *v13;
  int64_t connectionIdentifier;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  char v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSXPCConnection *tokenConnection;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  __int128 v33;
  uint64_t v34;
  uint8_t v35;
  _BYTE v36[15];
  id v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, _QWORD, id *))a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = 0;
  v34 = *MEMORY[0x1E0CB28A8];
  v10 = 0.0;
  *(_QWORD *)&v11 = 138543618;
  v33 = v11;
  while (-[TKExtensionClientToken ensureConnectionWithError:](v8, "ensureConnectionWithError:", a3, v33))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__6;
    v47 = __Block_byref_object_dispose__6;
    v48 = 0;
    -[TKExtensionClientToken tokenConnection](v8, "tokenConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __43__TKExtensionClientToken_withError_invoke___block_invoke;
    v38[3] = &unk_1E708A5A8;
    v38[4] = &v43;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    connectionIdentifier = v8->_connectionIdentifier;
    v37 = 0;
    v7[2](v7, v13, connectionIdentifier, &v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v37;
    v17 = (void *)v44[5];
    if (!v17)
    {
      if (a3 && !v15)
      {
        if (!v16)
        {
          TK_LOG_client_1();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            -[TKExtensionClientToken withError:invoke:].cold.2(&v35, v36, v22);

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = objc_retainAutorelease(v16);
        *a3 = v16;
      }
LABEL_22:
      v4 = v15;
      v20 = 0;
      v21 = 0;
      goto LABEL_23;
    }
    if (objc_msgSend(v17, "code") == 4099 || objc_msgSend((id)v44[5], "code") == 4097)
    {
      objc_msgSend((id)v44[5], "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v34) & 1) != 0)
      {
        v19 = -[TKClientToken _testing_noAutomaticReconnect](v8, "_testing_noAutomaticReconnect");

        if (!v19)
        {
          if (v10 <= 30.0)
          {
            TK_LOG_client_1();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              -[TKClientToken tokenID](v8, "tokenID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v33;
              v40 = v29;
              v41 = 1024;
              LODWORD(v42) = v9;
              _os_log_debug_impl(&dword_1B9768000, v24, OS_LOG_TYPE_DEBUG, "reconnecting connection to %{public}@, try %d", buf, 0x12u);

            }
            -[NSXPCConnection invalidate](v8->_tokenConnection, "invalidate");
            tokenConnection = v8->_tokenConnection;
            v8->_tokenConnection = 0;

            if ((double)v9 * 0.1 <= 1.0)
              v26 = (double)v9 * 0.1;
            else
              v26 = 1.0;
            objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v26);
            v21 = 0;
            v10 = v10 + v26;
            v20 = 1;
          }
          else
          {
            v20 = 0;
            v21 = 1;
          }
          goto LABEL_23;
        }
      }
      else
      {

      }
    }
    TK_LOG_client_1();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[TKClientToken tokenID](v8, "tokenID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v44[5];
      *(_DWORD *)buf = v33;
      v40 = v27;
      v41 = 2114;
      v42 = v28;
      _os_log_error_impl(&dword_1B9768000, v23, OS_LOG_TYPE_ERROR, "Failed to send request to token %{public}@, error: %{public}@", buf, 0x16u);

    }
    if (!a3)
      goto LABEL_22;
    v20 = 0;
    v21 = 0;
    v4 = 0;
    *a3 = objc_retainAutorelease((id)v44[5]);
LABEL_23:

    _Block_object_dispose(&v43, 8);
    ++v9;
    if ((v20 & 1) == 0)
    {
      if (!v21)
        goto LABEL_37;
      TK_LOG_client_1();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        -[TKClientToken tokenID](v8, "tokenID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKExtensionClientToken withError:invoke:].cold.1(v31, (uint64_t)&v43, v30);
      }

      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
        v4 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      break;
    }
  }
  v4 = 0;
LABEL_37:
  objc_sync_exit(v8);

  return v4;
}

void __43__TKExtensionClientToken_withError_invoke___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSXPCConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenConnection, 0);
  objc_storeStrong((id *)&self->_targetUID, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
}

- (void)serverConnection
{
  id v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*a1)
    v5 = "external";
  else
    v5 = "EP-provided";
  v6 = *(_QWORD *)(a2 + 80);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (targetUID=%d)"), objc_msgSend(*(id *)(a2 + 80), "integerValue"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v3, "UTF8String");
  }
  else
  {
    v7 = "";
  }
  *(_DWORD *)buf = 136446466;
  v9 = v5;
  v10 = 2082;
  v11 = v7;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "creating connection to %{public}s endpoint%{public}s", buf, 0x16u);
  if (v6)

}

- (void)withError:(_QWORD *)a3 getServerEndpoint:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, _QWORD *a3, os_log_t log)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)buf = 138543362;
  *a3 = v4;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "get*Endpoint on token-client connection failed with connection error %{public}@", buf, 0xCu);
}

- (void)ensureConnectionWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = 138543618;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_1B9768000, a2, OS_LOG_TYPE_FAULT, "Unable to connect to tokenServer even after retries. (ep=%{public}@, uid=%@)", (uint8_t *)&v4, 0x16u);
}

- (void)ensureConnectionWithError:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "failed to connect to named ctkd port, aborting (probably system shutdown in progress)", buf, 2u);
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tokenID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "Failed to get connection for tokenID=%{public}@ (error %{public}@)", (uint8_t *)&v6, 0x16u);

}

- (void)withError:(NSObject *)a3 invoke:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1B9768000, a3, (uint64_t)a3, "Unable to connect to %{public}@ even after retries.", (uint8_t *)a2);

}

- (void)withError:(os_log_t)log invoke:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B9768000, log, OS_LOG_TYPE_FAULT, "TKClientToken operation failed but did not fill any error, substituting TKErrorCodeCommunicationError", buf, 2u);
}

@end
