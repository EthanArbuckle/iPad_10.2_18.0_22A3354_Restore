@implementation ASDRepairService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3928B0);
}

+ (id)defaultService
{
  if (qword_1ECFFABA8 != -1)
    dispatch_once(&qword_1ECFFABA8, &__block_literal_global_29);
  return (id)_MergedGlobals_54;
}

void __34__ASDRepairService_defaultService__block_invoke()
{
  ASDRepairService *v0;
  void *v1;
  ASDRepairService *v2;
  void *v3;
  id v4;
  objc_super v5;

  v0 = [ASDRepairService alloc];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDRepairService;
    v2 = (ASDRepairService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2)
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
  }

  v3 = (void *)_MergedGlobals_54;
  _MergedGlobals_54 = (uint64_t)v0;

}

- (void)refreshKeybagWithReplyHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD);
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v5 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke;
  v9[3] = &unk_1E37BDFB0;
  v9[4] = &v10;
  -[ASDRepairService _asynchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11[5])
  {
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke_2;
    v7[3] = &unk_1E37BDB88;
    v8 = v4;
    objc_msgSend(v6, "refreshKeybagWithReplyHandler:", v7);

  }
  _Block_object_dispose(&v10, 8);

}

void __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (v7)
  {
    v8 = v4;
    objc_storeStrong(v6, a2);
    v4 = v8;
  }

}

- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1
{
  void (**v3)(id, id);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v9 = 0;
    objc_msgSend(v4, "getRepairServiceWithError:", &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v5)
    {
      objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3[2](v3, v6);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 buf;
  void (*v17)(uint64_t, uint64_t, void *, void *);
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke;
    v14[3] = &unk_1E37BDB60;
    v10 = v7;
    v15 = v10;
    -[ASDRepairService _asynchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      ASDLogHandleForCategory(12);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = -[ASDRepairOptions copyUserInfoDictionary](v6);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_19A03B000, v12, OS_LOG_TYPE_DEFAULT, "(RepairService) Calling repair service with options: %@", (uint8_t *)&buf, 0xCu);

      }
      *(_QWORD *)&buf = v9;
      *((_QWORD *)&buf + 1) = 3221225472;
      v17 = __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke_12;
      v18 = &unk_1E37C0050;
      v19 = v10;
      objc_msgSend(v11, "repairAppWithOptions:replyHandler:", v6, &buf);

    }
  }

}

- (BOOL)isCoastGuardUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4
{
  ASDCoastGuard *v6;

  v6 = objc_alloc_init(ASDCoastGuard);
  LOBYTE(a4) = -[ASDCoastGuard isUnrepairableAppWithItemID:externalVersionID:](v6, "isUnrepairableAppWithItemID:externalVersionID:", a3, a4);

  return a4;
}

void __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "(RepairService) Repair service call failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

void __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  ASDLogHandleForCategory(12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19A03B000, v10, OS_LOG_TYPE_DEFAULT, "(RepairService) Repair service call completed sucessfully", (uint8_t *)&v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543362;
    v13 = v8;
    _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "(RepairService) Repair service call returned error: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
