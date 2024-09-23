@implementation GEOOfflineRemoteDataAccess

- (GEOOfflineRemoteDataAccess)init
{
  GEOOfflineRemoteDataAccess *v2;
  GEOOfflineRemoteDataAccess *v3;
  GEOOfflineRemoteDataAccess *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOOfflineRemoteDataAccess;
  v2 = -[GEOOfflineRemoteDataAccess init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_createdConnection.lock._os_unfair_lock_opaque = 0;
    v2->_createdConnection.didRun = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_ensureConnection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__GEOOfflineRemoteDataAccess__ensureConnection__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_createdConnection, v2);
}

void __47__GEOOfflineRemoteDataAccess__ensureConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id global_queue;

  global_queue = (id)geo_get_global_queue();
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:eventHandler:", 22, CFSTR("OfflineData"), global_queue, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOOfflineDataFetchRequest *v11;
  GEOXPCConnection *connection;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v11 = -[GEOOfflineDataFetchRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineDataFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineDataFetchRequest setKey:](v11, "setKey:", v10);

  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__GEOOfflineRemoteDataAccess_getDataForKey_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E1C13F68;
  v15 = v8;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", connection, v9, v14);

}

void __67__GEOOfflineRemoteDataAccess_getDataForKey_callbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v10, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v6);

}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineDataFetchRequest *v7;
  GEOXPCConnection *connection;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v7 = -[GEOOfflineDataFetchRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineDataFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineDataFetchRequest setKey:](v7, "setKey:", v6);

  connection = self->_connection;
  v15 = 0;
  -[GEOXPCRequest sendSync:error:](v7, "sendSync:error:", connection, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (!v10)
  {
    objc_msgSend(v9, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v10);
  objc_msgSend(v9, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOOfflineDataCheckExistenceRequest *v11;
  GEOXPCConnection *connection;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v11 = -[GEOOfflineDataCheckExistenceRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineDataCheckExistenceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineDataCheckExistenceRequest setKey:](v11, "setKey:", v10);

  -[GEOOfflineDataCheckExistenceRequest setSync:](v11, "setSync:", 0);
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__GEOOfflineRemoteDataAccess_hasDataForKey_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E1C13F90;
  v15 = v8;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", connection, v9, v14);

}

void __67__GEOOfflineRemoteDataAccess_hasDataForKey_callbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "exists");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineDataCheckExistenceRequest *v7;
  GEOXPCConnection *connection;
  void *v9;
  id v10;
  char v11;
  char v12;
  id v14;

  v6 = a3;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v7 = -[GEOOfflineDataCheckExistenceRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineDataCheckExistenceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineDataCheckExistenceRequest setKey:](v7, "setKey:", v6);

  -[GEOOfflineDataCheckExistenceRequest setSync:](v7, "setSync:", 1);
  connection = self->_connection;
  v14 = 0;
  -[GEOXPCRequest sendSync:error:](v7, "sendSync:error:", connection, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = objc_msgSend(v9, "exists");
  if (a4 && (v11 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v9, "exists");

  return v12;
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOOfflineDataFetchAvailableKeysRequest *v10;
  GEOXPCConnection *connection;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v10 = -[GEOOfflineDataFetchAvailableKeysRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineDataFetchAvailableKeysRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineDataFetchAvailableKeysRequest setLayer:](v10, "setLayer:", v6);
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__GEOOfflineRemoteDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke;
  v13[3] = &unk_1E1C13FB8;
  v14 = v8;
  v12 = v8;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", connection, v9, v13);

}

void __78__GEOOfflineRemoteDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "keys");
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v3;
    if (v3)
      v4 = v3;
    else
      v4 = MEMORY[0x1E0C9AA60];
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  GEOOfflineVersionMetadataFetchRequest *v8;
  GEOXPCConnection *connection;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v8 = -[GEOOfflineVersionMetadataFetchRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineVersionMetadataFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__GEOOfflineRemoteDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke;
  v11[3] = &unk_1E1C13FE0;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", connection, v7, v11);

}

void __82__GEOOfflineRemoteDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  GEOOfflineTileConfigurationFetchRequest *v7;
  void *v8;
  void *v9;

  -[GEOOfflineRemoteDataAccess _ensureConnection](self, "_ensureConnection");
  v7 = -[GEOOfflineTileConfigurationFetchRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineTileConfigurationFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOOfflineTileConfigurationFetchRequest setState:](v7, "setState:", a3.var0);
  -[GEOXPCRequest sendSync:error:](v7, "sendSync:error:", self->_connection, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
