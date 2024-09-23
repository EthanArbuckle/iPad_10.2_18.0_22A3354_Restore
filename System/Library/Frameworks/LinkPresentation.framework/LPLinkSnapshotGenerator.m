@implementation LPLinkSnapshotGenerator

- (LPLinkSnapshotGenerator)init
{
  LPLinkSnapshotGenerator *v2;
  uint64_t v3;
  NSXPCConnection *connectionToService;
  void *v5;
  uint64_t v6;
  LPLinkSnapshotGenerator *v7;
  LPLinkSnapshotGenerator *v8;
  LPLinkSnapshotGenerator *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  LPLinkSnapshotGenerator *v15;
  _QWORD v16[4];
  LPLinkSnapshotGenerator *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)LPLinkSnapshotGenerator;
  v2 = -[LPLinkSnapshotGenerator init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.LinkPresentation.LinkSnapshotGeneratorService"));
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5ED908);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connectionToService, "setRemoteObjectInterface:", v5);

    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __31__LPLinkSnapshotGenerator_init__block_invoke;
    v16[3] = &unk_1E44A7CE8;
    v7 = v2;
    v17 = v7;
    -[NSXPCConnection setInvalidationHandler:](v2->_connectionToService, "setInvalidationHandler:", v16);
    v11 = v6;
    v12 = 3221225472;
    v13 = __31__LPLinkSnapshotGenerator_init__block_invoke_5;
    v14 = &unk_1E44A7CE8;
    v8 = v7;
    v15 = v8;
    -[NSXPCConnection setInterruptionHandler:](v2->_connectionToService, "setInterruptionHandler:", &v11);
    -[NSXPCConnection resume](v2->_connectionToService, "resume", v11, v12, v13, v14);
    v8->_active = 1;
    v9 = v8;

  }
  return v2;
}

void __31__LPLinkSnapshotGenerator_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v1 = LPLogChannelSnapshotGenerator();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __31__LPLinkSnapshotGenerator_init__block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_5(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v1 = LPLogChannelSnapshotGenerator();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __31__LPLinkSnapshotGenerator_init__block_invoke_5_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LPLinkSnapshotGenerator;
  -[LPLinkSnapshotGenerator dealloc](&v3, sel_dealloc);
}

- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (self->_active)
  {
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "setShowDebugIndicators:", 1, (_QWORD)v17);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
    -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy", (_QWORD)v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "snapshotForMetadata:configurations:completionHandler:", v8, v9, v10);

  }
  else
  {
    makeLPError(1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v16, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_1A0C41000, a1, a3, "Link Snapshot Generator Service: connection invalidated", a5, a6, a7, a8, 0);
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_5_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_1A0C41000, a1, a3, "Link Snapshot Generator Service: connection interrupted", a5, a6, a7, a8, 0);
}

@end
