@implementation MBTargetDeviceTransferTask

- (int64_t)taskType
{
  return 2;
}

- (MBTargetDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBTargetDeviceTransferTask;
  return -[MBDeviceTransferTask initWithFileTransferSession:](&v4, sel_initWithFileTransferSession_, a3);
}

- (BOOL)_startWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint8_t buf[4];
  MBTargetDeviceTransferTask *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  MBGetDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting the device transfer task", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the device transfer task", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }

  v13 = (void *)objc_opt_new();
  -[MBDeviceTransferTask fileTransferSession](self, "fileTransferSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFileTransferSession:", v14);

  -[MBDeviceTransferTask manager](self, "manager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    -[MBTargetDeviceTransferTask _startWithError:].cold.1();
  v16 = v15;
  v17 = objc_msgSend(v15, "startDeviceTransferWithTaskType:sessionInfo:error:", -[MBTargetDeviceTransferTask taskType](self, "taskType"), v13, a3);

  return v17;
}

- (void)start
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBTargetDeviceTransferTask;
  -[MBDeviceTransferTask start](&v2, sel_start);
}

- (void)_cancel
{
  __assert_rtn("-[MBTargetDeviceTransferTask _cancel]", "MBTargetDeviceTransferTask.m", 61, "manager");
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBTargetDeviceTransferTask;
  -[MBDeviceTransferTask cancel](&v2, sel_cancel);
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MBDeviceTransferTask setProgressHandler:](self, "setProgressHandler:", 0);
  -[MBTargetDeviceTransferTask setKeychainTransferCompletionHandler:](self, "setKeychainTransferCompletionHandler:", 0);
  v6.receiver = self;
  v6.super_class = (Class)MBTargetDeviceTransferTask;
  -[MBDeviceTransferTask _finishWithError:](&v6, sel__finishWithError_, v4);

}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  id v4;
  BOOL *p_startedPreflight;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  __int128 *v22;
  _QWORD *v23;
  _QWORD block[5];
  NSObject *v25;
  _QWORD *v26;
  __int128 *p_buf;
  _QWORD v28[5];
  id v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_startedPreflight = &self->_startedPreflight;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_startedPreflight))
    {
      __clrex();
      -[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:].cold.1();
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_startedPreflight));
  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the preflight", (uint8_t *)&buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the preflight", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v29 = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  -[MBDeviceTransferTask queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke;
  block[3] = &unk_1E995D898;
  block[4] = self;
  v26 = v28;
  v17 = v14;
  v25 = v17;
  p_buf = &buf;
  dispatch_async(v15, block);

  -[MBDeviceTransferTask queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E995D8C0;
  v22 = &buf;
  v23 = v28;
  v20[4] = self;
  v21 = v4;
  v19 = v4;
  dispatch_group_notify(v17, v18, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&buf, 8);

}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  int8x16_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  v3 = objc_msgSend(v2, "_handleCompletionWithError:", &v11);
  v4 = v11;
  v5 = v11;
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) == 0)
      __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_1();
    v7 = (void *)v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E995D870;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "startPreflightWithCompletionHandler:", v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (!v2)
    {
      MBGetDefaultLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = a1[4];
        v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "%@: Finished the preflight: %@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the preflight: %@", v6, v7, v8, v9, v10, v11, a1[4]);
      }
      goto LABEL_8;
    }
  }
  else if (!v2)
  {
    __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3_cold_1();
  }
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v12 = a1[4];
    v13 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_ERROR, "%@: Failed the preflight: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the preflight: %@", v14, v15, v16, v17, v18, v19, a1[4]);
  }
LABEL_8:

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  id v4;
  BOOL *p_startedKeychainTransfer;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  uint8_t buf[4];
  MBTargetDeviceTransferTask *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_startedKeychainTransfer = &self->_startedKeychainTransfer;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_startedKeychainTransfer))
    {
      __clrex();
      -[MBTargetDeviceTransferTask startKeychainTransferWithCompletionHandler:].cold.1();
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_startedKeychainTransfer));
  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain transfer", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the keychain transfer", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  -[MBDeviceTransferTask queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke;
  block[3] = &unk_1E995D090;
  block[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_async(v14, block);

}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  v3 = objc_msgSend(v2, "_handleCompletionWithError:", &v11);
  v4 = v11;
  v5 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(v5, "started") & 1) == 0)
      __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_1();
    v7 = (void *)v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E995D8E8;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v7, "startKeychainTransferWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(v5, "_finishKeychainTransferWithError:completionHandler:", v4, *(_QWORD *)(a1 + 40));
  }

}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E995D688;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishKeychainTransferWithError:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_finishKeychainTransferWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint8_t buf[4];
  MBTargetDeviceTransferTask *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[MBDeviceTransferTask queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  MBGetDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_ERROR, "%@: Failed the keychain transfer: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the keychain transfer: %@", v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain transfer", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the keychain transfer", v17, v18, v19, v20, v21, v22, (uint64_t)self);
  }

  v23 = atomic_load((unsigned __int8 *)&self->_startedKeychainTransfer);
  if ((v23 & 1) == 0)
    -[MBTargetDeviceTransferTask _finishKeychainTransferWithError:completionHandler:].cold.1();
  if (v7)
    v7[2](v7, v6);

}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  id v4;
  BOOL *p_startedKeychainDataTransfer;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  __int128 *v22;
  _QWORD *v23;
  _QWORD block[5];
  NSObject *v25;
  _QWORD *v26;
  __int128 *p_buf;
  _QWORD v28[5];
  id v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_startedKeychainDataTransfer = &self->_startedKeychainDataTransfer;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_startedKeychainDataTransfer))
    {
      __clrex();
      -[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:].cold.1();
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_startedKeychainDataTransfer));
  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain data transfer", (uint8_t *)&buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the keychain data transfer", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v29 = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  -[MBDeviceTransferTask queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke;
  block[3] = &unk_1E995D898;
  block[4] = self;
  v26 = v28;
  v17 = v14;
  v25 = v17;
  p_buf = &buf;
  dispatch_async(v15, block);

  -[MBDeviceTransferTask queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E995D8C0;
  v22 = &buf;
  v23 = v28;
  v20[4] = self;
  v21 = v4;
  v19 = v4;
  dispatch_group_notify(v17, v18, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&buf, 8);

}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  int8x16_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  v3 = objc_msgSend(v2, "_handleCompletionWithError:", &v11);
  v4 = v11;
  v5 = v11;
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) == 0)
      __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_1();
    v7 = (void *)v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E995D910;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "startKeychainDataTransferWithCompletionHandler:", v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (!v2)
    {
      MBGetDefaultLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = a1[4];
        v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain data transfer: %@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the keychain data transfer: %@", v6, v7, v8, v9, v10, v11, a1[4]);
      }
      goto LABEL_8;
    }
  }
  else if (!v2)
  {
    __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3_cold_1();
  }
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v12 = a1[4];
    v13 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_ERROR, "%@: Failed the keychain data transfer: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the keychain data transfer: %@", v14, v15, v16, v17, v18, v19, a1[4]);
  }
LABEL_8:

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL *p_startedKeychainDataImport;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  __int128 *v27;
  _QWORD block[5];
  NSObject *v29;
  id v30;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    -[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:].cold.1();
  v8 = v7;
  p_startedKeychainDataImport = &self->_startedKeychainDataImport;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_startedKeychainDataImport))
    {
      __clrex();
      -[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:].cold.2();
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_startedKeychainDataImport));
  MBGetDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain data import", (uint8_t *)&buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the keychain data import", v12, v13, v14, v15, v16, v17, (uint64_t)self);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  -[MBDeviceTransferTask queue](self, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke;
  block[3] = &unk_1E995D938;
  block[4] = self;
  p_buf = &buf;
  v21 = v18;
  v29 = v21;
  v22 = v6;
  v30 = v22;
  dispatch_async(v19, block);

  -[MBDeviceTransferTask queue](self, "queue");
  v23 = objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_3;
  v25[3] = &unk_1E995D960;
  v26 = v8;
  v27 = &buf;
  v25[4] = self;
  v24 = v8;
  dispatch_group_notify(v21, v23, v25);

  _Block_object_dispose(&buf, 8);
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_handleCompletionWithError:", &v12);
  v4 = v12;
  v5 = v12;
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) == 0)
      __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_1();
    v7 = (void *)v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_2;
    v9[3] = &unk_1E995D6B0;
    v8 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "startKeychainDataImportWithKeychainInfo:completionHandler:", v8, v9);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_ERROR, "%@: Failed the keychain data import: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the keychain data import: %@", v7, v8, v9, v10, v11, v12, a1[4]);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = a1[4];
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain data import", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the keychain data import", v14, v15, v16, v17, v18, v19, a1[4]);
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL *p_startedDataTransfer;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  __int128 *v27;
  _QWORD block[5];
  NSObject *v29;
  id v30;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    -[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:].cold.1();
  v8 = v7;
  p_startedDataTransfer = &self->_startedDataTransfer;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_startedDataTransfer))
    {
      __clrex();
      -[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:].cold.2();
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_startedDataTransfer));
  MBGetDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting the data transfer", (uint8_t *)&buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the data transfer", v12, v13, v14, v15, v16, v17, (uint64_t)self);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  -[MBDeviceTransferTask queue](self, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke;
  block[3] = &unk_1E995D938;
  block[4] = self;
  p_buf = &buf;
  v21 = v18;
  v29 = v21;
  v22 = v6;
  v30 = v22;
  dispatch_async(v19, block);

  -[MBDeviceTransferTask queue](self, "queue");
  v23 = objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_3;
  v25[3] = &unk_1E995D960;
  v26 = v8;
  v27 = &buf;
  v25[4] = self;
  v24 = v8;
  dispatch_group_notify(v21, v23, v25);

  _Block_object_dispose(&buf, 8);
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_handleCompletionWithError:", &v12);
  v4 = v12;
  v5 = v12;
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) == 0)
      __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_1();
    v7 = (void *)v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_2;
    v9[3] = &unk_1E995D6B0;
    v8 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "startDataTransferWithPreflightInfo:completionHandler:", v8, v9);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_ERROR, "%@: Failed the data transfer: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the data transfer: %@", v7, v8, v9, v10, v11, v12, a1[4]);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = a1[4];
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_DEFAULT, "%@: Finished the data transfer", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the data transfer", v14, v15, v16, v17, v18, v19, a1[4]);
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  MBTargetDeviceTransferTask *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!-[MBDeviceTransferTask finished](self, "finished"))
  {
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = self;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_ERROR, "%@: Failed the target transfer task: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the target transfer task: %@", v8, v9, v10, v11, v12, v13, (uint64_t)self);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "%@: Finished the target transfer task", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the target transfer task", v14, v15, v16, v17, v18, v19, (uint64_t)self);
    }

    -[MBTargetDeviceTransferTask _finishWithError:](self, "_finishWithError:", v5);
  }

}

- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!-[MBDeviceTransferTask finished](self, "finished"))
  {
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "Updated progress: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Updated progress: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }

    -[MBDeviceTransferTask progressHandler](self, "progressHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MBDeviceTransferTask progressHandler](self, "progressHandler");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v14)[2](v14, v5);

    }
  }

}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)keychainTransferCompletionHandler
{
  return self->_keychainTransferCompletionHandler;
}

- (void)setKeychainTransferCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keychainTransferCompletionHandler, 0);
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
}

- (void)_startWithError:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask _startWithError:]", "MBTargetDeviceTransferTask.m", 48, "manager");
}

- (void)startPreflightWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:]", "MBTargetDeviceTransferTask.m", 91, "result");
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 108, "manager");
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 106, "self.started");
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:]_block_invoke_3", "MBTargetDeviceTransferTask.m", 116, "preflightInfo || preflightError");
}

- (void)startKeychainTransferWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainTransferWithCompletionHandler:]", "MBTargetDeviceTransferTask.m", 130, "result");
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainTransferWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 143, "manager");
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainTransferWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 140, "self.started");
}

- (void)_finishKeychainTransferWithError:completionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask _finishKeychainTransferWithError:completionHandler:]", "MBTargetDeviceTransferTask.m", 163, "started");
}

- (void)startKeychainDataTransferWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:]", "MBTargetDeviceTransferTask.m", 170, "result");
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 187, "manager");
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 185, "self.started");
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:]_block_invoke_3", "MBTargetDeviceTransferTask.m", 195, "keychainInfo || transferError");
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]", "MBTargetDeviceTransferTask.m", 206, "keychainInfo");
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]", "MBTargetDeviceTransferTask.m", 209, "result");
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 225, "manager");
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 223, "self.started");
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]", "MBTargetDeviceTransferTask.m", 242, "preflightInfo");
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]", "MBTargetDeviceTransferTask.m", 245, "result");
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 261, "manager");
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]_block_invoke", "MBTargetDeviceTransferTask.m", 259, "self.started");
}

@end
