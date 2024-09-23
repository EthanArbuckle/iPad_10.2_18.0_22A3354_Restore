@implementation DCDevice

+ (DCDevice)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  return (DCDevice *)(id)currentDevice_currentDevice;
}

void __25__DCDevice_currentDevice__block_invoke()
{
  DCDevice *v0;
  void *v1;

  v0 = objc_alloc_init(DCDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

}

- (void)generateTokenWithCompletionHandler:(void *)completion
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  DCDeviceMetadataDaemonConnection *v19;

  v3 = completion;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  v4 = (void *)v15[5];
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__DCDevice_generateTokenWithCompletionHandler___block_invoke;
  v12[3] = &unk_24F1E99B8;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v4, "remoteObjectProxy:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__DCDevice_generateTokenWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_24F1E9AD8;
  v8 = v6;
  v10 = v8;
  v11 = &v14;
  objc_msgSend(v7, "fetchOpaqueBlobWithCompletion:", v9);

  _Block_object_dispose(&v14, 8);
}

void __47__DCDevice_generateTokenWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __47__DCDevice_generateTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)_isSupportedReturningError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__DCDevice__isSupportedReturningError___block_invoke;
  v10[3] = &unk_24F1E9968;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxy:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __39__DCDevice__isSupportedReturningError___block_invoke_5;
  v9[3] = &unk_24F1E9B00;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "isSupportedDeviceWithCompletion:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __39__DCDevice__isSupportedReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  _DCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__DCDevice__isSupportedReturningError___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __39__DCDevice__isSupportedReturningError___block_invoke_5(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isSupported
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v2 = -[DCDevice _isSupportedReturningError:](self, "_isSupportedReturningError:", &v12);
  v3 = v12;
  if (v3)
  {
    _DCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DCDevice isSupported].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2;
}

void __39__DCDevice__isSupportedReturningError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229232000, a2, a3, "XPCConnection failed with error: %@", a5, a6, a7, a8, 2u);
}

- (void)isSupported
{
  OUTLINED_FUNCTION_0(&dword_229232000, a2, a3, "isSupported error: %@", a5, a6, a7, a8, 2u);
}

@end
