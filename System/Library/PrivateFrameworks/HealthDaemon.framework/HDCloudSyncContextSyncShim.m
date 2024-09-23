@implementation HDCloudSyncContextSyncShim

- (HDCloudSyncContextSyncShim)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncContextSyncShim *v6;
  HDCloudSyncContextSyncShim *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncContextSyncShim;
  v6 = -[HDCloudSyncContextSyncShim init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)lookupOrCreateLocalDeviceContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *queue;
  id *v12;
  id *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v4 = a3;
  -[HDProfile deviceContextManager](self->_profile, "deviceContextManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "lookupOrCreateLocalDeviceContextWithError:", &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  v8 = v7;
  if (v6)
  {
    v21 = v7;
    v9 = objc_msgSend(v5, "updateSoftwareVersionForCurrentSyncIdentityWithError:", &v21);
    v10 = v21;

    queue = self->_queue;
    if ((v9 & 1) != 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_3;
      v15[3] = &unk_1E6CE8C48;
      v12 = &v17;
      v17 = v4;
      v13 = &v16;
      v16 = v6;
      v14 = v15;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_2;
      block[3] = &unk_1E6CE8C48;
      v12 = &v20;
      v20 = v4;
      v13 = &v19;
      v10 = v10;
      v19 = v10;
      v14 = block;
    }
  }
  else
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke;
    v22[3] = &unk_1E6CE8C48;
    v12 = &v24;
    v24 = v4;
    v13 = &v23;
    v10 = v8;
    v23 = v10;
    v14 = v22;
  }
  dispatch_async(queue, v14);

}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)ingestRemoteDeviceContexts:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[HDProfile database](self->_profile, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke;
  v20[3] = &unk_1E6CE7950;
  v20[4] = self;
  v21 = v6;
  v10 = v6;
  v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceContextEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, &v22, v20);
  v12 = v22;
  queue = self->_queue;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke_2;
  v16[3] = &unk_1E6CEBC78;
  v19 = v11;
  v17 = v12;
  v18 = v7;
  v14 = v12;
  v15 = v7;
  dispatch_async(queue, v16);

}

uint64_t __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v5, "deviceContextManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ingestRemoteDeviceContexts:transaction:error:", *(_QWORD *)(a1 + 40), v6, a3);

  return v8;
}

uint64_t __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)fetchLocalKeyValueForProtectionCategory:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[HDProfile deviceKeyValueStoreManager](self->_profile, "deviceKeyValueStoreManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile syncIdentityManager](self->_profile, "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentSyncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke;
  v24[3] = &unk_1E6D00380;
  v13 = v7;
  v25 = v13;
  LOBYTE(a3) = objc_msgSend(v8, "enumerateAllEntriesForSyncIdentity:protectionCategory:error:enumerationHandler:", v11, a3, &v26, v24);
  v14 = v26;

  queue = self->_queue;
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke_2;
  v19[3] = &unk_1E6D003A8;
  v21 = v14;
  v22 = v6;
  v23 = a3;
  v20 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v6;
  dispatch_async(queue, v19);

}

uint64_t __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));
}

- (void)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 completion:(id)a5
{
  id v8;
  HDProfile *profile;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;
  id v22;

  v8 = a5;
  profile = self->_profile;
  v10 = a4;
  v11 = a3;
  -[HDProfile deviceKeyValueStoreManager](profile, "deviceKeyValueStoreManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = objc_msgSend(v12, "updateKeyValuePairsForRemoteEntries:deviceContexts:error:", v11, v10, &v22);

  v14 = v22;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__HDCloudSyncContextSyncShim_updateKeyValuePairsForRemoteEntries_deviceContexts_completion___block_invoke;
  v18[3] = &unk_1E6CEBC78;
  v21 = v13;
  v19 = v14;
  v20 = v8;
  v16 = v14;
  v17 = v8;
  dispatch_async(queue, v18);

}

uint64_t __92__HDCloudSyncContextSyncShim_updateKeyValuePairsForRemoteEntries_deviceContexts_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
