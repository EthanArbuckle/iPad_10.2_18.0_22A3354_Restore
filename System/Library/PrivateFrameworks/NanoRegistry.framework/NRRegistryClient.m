@implementation NRRegistryClient

void __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)syncGrabRegistryWithReadBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  -[NRRegistry managementQueue](self, "managementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[NRRegistry managementQueue](self, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke;
  block[3] = &unk_1E44959F8;
  block[4] = self;
  v16 = &v17;
  v8 = v4;
  v15 = v8;
  dispatch_sync(v6, block);

  if (!*((_BYTE *)v18 + 24))
  {
    v9 = dispatch_semaphore_create(0);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_3;
    v11[3] = &unk_1E44954E0;
    v13 = v8;
    v10 = v9;
    v12 = v10;
    -[NRRegistryClient grabRegistryWithReadBlockAsync:](self, "grabRegistryWithReadBlockAsync:", v11);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  }
  _Block_object_dispose(&v17, 8);

}

void __55__NRRegistryClient_addDiffIndexObserverWithWriteBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend((id)objc_opt_class(), "_nextToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(a1[4] + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = v5;

  }
  v8 = (id)MEMORY[0x1A1B01DE4](a1[5]);
  objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

uint64_t __34__NRRegistryClient_setCollection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__NRRegistryClient_setCollection___block_invoke_2;
  v5[3] = &unk_1E4495C48;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "addObserverQueue:withBlock:", 0, v5);
  return objc_msgSend(*(id *)(a1 + 40), "setQueueCollection:", *(_QWORD *)(a1 + 32));
}

- (void)grabRegistryWithReadBlockAsync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NRRegistry managementQueue](self, "managementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__NRRegistryClient_grabRegistryWithReadBlockAsync___block_invoke;
  v7[3] = &unk_1E4495668;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NRRegistryClient)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  NRRegistryClient *v6;
  NSObject *v7;
  _QWORD block[4];
  NRRegistryClient *v10;
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("NRRegistryShouldCreateCollection"));
  v13.receiver = self;
  v13.super_class = (Class)NRRegistryClient;
  v6 = -[NRRegistry initWithParameters:](&v13, sel_initWithParameters_, v5);
  if (v6)
  {
    objc_initWeak(&location, v6);
    -[NRRegistry managementQueue](v6, "managementQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__NRRegistryClient_initWithParameters___block_invoke;
    block[3] = &unk_1E4495968;
    v10 = v6;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)addDiffIndexObserverWithWriteBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NRRegistryClient_addDiffIndexObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E4495A20;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__NRRegistryClient__wipeRegistryWith_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__NRRegistryClient__wipeRegistryWith_block___block_invoke_2;
  v17[3] = &unk_1E4495898;
  v2 = *(_QWORD *)(a1 + 48);
  v17[4] = *(_QWORD *)(a1 + 32);
  v17[5] = v2;
  v3 = (void (**)(_QWORD))MEMORY[0x1A1B01DE4](v17);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (!v4)
  {
    if (v5)
      v5[14] = *(_QWORD *)(a1 + 48);
    v3[2](v3);
    v15 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setCollection:", v15);

    goto LABEL_12;
  }
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      *(_QWORD *)(v16 + 112) = *(_QWORD *)(a1 + 48);
    v3[2](v3);
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "managementQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, *(dispatch_block_t *)(a1 + 40));
    goto LABEL_13;
  }
  v8 = objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    *(_QWORD *)(v11 + 112) = *(_QWORD *)(a1 + 48);
  v3[2](v3);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "applyDiff:", v10);

  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v14, *(dispatch_block_t *)(a1 + 40));

LABEL_13:
}

void __44__NRRegistryClient__wipeRegistryWith_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if ((*(_BYTE *)(a1 + 47) & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "secureProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setSecureProperties:", v3);

    }
  }
}

- (void)setCollection:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NRRegistryClient *v11;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "setCollection: nil collection", buf, 2u);
      }

    }
  }
  -[NRRegistryClient devicesUpdateCounter](self, "devicesUpdateCounter");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__NRRegistryClient_setCollection___block_invoke;
  v9[3] = &unk_1E4495030;
  v10 = v4;
  v11 = self;
  v8 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v9);

}

- (unint64_t)devicesUpdateCounter
{
  unint64_t v2;

  if (self)
    v2 = self->_tokenValue & 0x3FFFFFFFFFFFFFFFLL;
  else
    v2 = 0;
  objc_opt_self();
  return v2;
}

void __33__NRRegistryClient_rawConnection__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_connectToDaemon");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)_connectToDaemon
{
  NRNSXPCConnectionProtocol **p_connection;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  p_connection = &self->_connection;
  if (!self->_connection)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "machServiceName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "xpcConnectionClass")), "initWithMachServiceName:options:", v7, 4096);
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "clientRemoteObjectInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "clientExportedInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "setExportedInterface:", v6);
      objc_msgSend(v4, "setExportedObject:", self);
    }
    objc_storeStrong((id *)p_connection, v4);
    objc_msgSend(v4, "resume");

  }
}

+ (Class)xpcConnectionClass
{
  return (Class)objc_opt_class();
}

uint64_t __51__NRRegistryClient_grabRegistryWithReadBlockAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_grabRegistryWithReadBlock:", *(_QWORD *)(a1 + 40));
}

void __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

intptr_t __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __39__NRRegistryClient_initWithParameters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__NRRegistryClient_initWithParameters___block_invoke_2;
  v4[3] = &unk_1E4495940;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = objc_msgSend(v2, "registerNotifyTokenWithName:withQueue:withBlock:", CFSTR("com.apple.nanoregistry.NRDevicesUpdateCounterNotifyNotification"), v3, v4);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend((id)objc_opt_class(), "registerNotifyTokenWithName:withQueue:withBlock:", CFSTR("com.apple.nanoregistry.NRDevicesUpdateCounterNotifyNotification"), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_queryDataAsyncIfNeededWithBlock:", &__block_literal_global_24);
  objc_destroyWeak(&v5);
}

- (void)_grabRegistryWithReadBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke;
  v6[3] = &unk_1E4495668;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistryClient _queryDataAsyncIfNeededWithBlock:](self, "_queryDataAsyncIfNeededWithBlock:", v6);

}

- (void)_queryDataAsyncIfNeededWithBlock:(id)a3
{
  -[NRRegistryClient _queryDataAsyncForce:ifNeededWithBlock:]((uint64_t)self, 0, a3);
}

- (void)_finishQueryWithStaringToken:(uint64_t)a3 replacementToken:
{
  NSObject *v6;
  uint64_t DevicesUpdateCounterNotifyToken;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend((id)a1, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v26 = a2;
  if (objc_msgSend((id)a1, "supportsWatch"))
    DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](a1);
  else
    DevicesUpdateCounterNotifyToken = objc_msgSend((id)a1, "devicesUpdateCounter") | 0xC000000000000000;
  objc_opt_self();
  v8 = *(id *)(a1 + 136);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v10 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
        if (v16)
        {
          if (*(_QWORD *)(v16 + 16) > (a3 & 0x3FFFFFFFFFFFFFFFuLL))
          {
            objc_msgSend(v9, "addObject:");
            goto LABEL_15;
          }
          v17 = *(_QWORD *)(v16 + 8);
        }
        else
        {
          v17 = 0;
        }
        (*(void (**)(void))(v17 + 16))();
LABEL_15:
        ++v15;
      }
      while (v13 != v15);
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
      v13 = v18;
    }
    while (v18);
  }

  if (objc_msgSend(v9, "count"))
    objc_storeStrong((id *)(a1 + 136), v9);

  if (DevicesUpdateCounterNotifyToken == a3)
  {
    *(_QWORD *)(a1 + 128) = 0;
    *(_BYTE *)(a1 + 89) = 0;
    -[NRRegistryClient _fireAllQueryCompletionBlocks](a1);
    return;
  }
  if (v26 != a3)
  {
    *(_QWORD *)(a1 + 128) = 0;
    -[NRRegistryClient _queryDataAsyncForce:ifNeededWithBlock:](a1, 1, 0);
    return;
  }
  v19 = *(_QWORD *)(a1 + 128);
  if (!v19)
  {
    v19 = 1;
    goto LABEL_29;
  }
  if (v19 <= 0xFF)
  {
    v19 *= 2;
LABEL_29:
    *(_QWORD *)(a1 + 128) = v19;
  }
  v20 = (double)v19 * 0.1;
  nr_framework_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

  if (v22)
  {
    nr_framework_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v33 = v20;
      _os_log_error_impl(&dword_1A0BDB000, v23, OS_LOG_TYPE_ERROR, "_queryDataAsyncIfNeededWithBlock/finishQueryWithTokenValues: Failure to query daemon, backing off interval = %0.1f", buf, 0xCu);
    }

  }
  *(_BYTE *)(a1 + 88) = 0;
  v24 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
  objc_msgSend((id)a1, "managementQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NRRegistryClient__finishQueryWithStaringToken_replacementToken___block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = a1;
  dispatch_after(v24, v25, block);

}

void __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke_2;
  v4[3] = &unk_1E4494DE0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enqueue:", v4);

}

- (void)_queryDataAsyncForce:(void *)a3 ifNeededWithBlock:
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t DevicesUpdateCounterNotifyToken;
  NRRegistryQueryCompletionBlockEntry *v9;
  id v10;
  NRRegistryQueryCompletionBlockEntry *v11;
  uint64_t v12;
  id block;
  NRRegistryQueryCompletionBlockEntry *v14;
  NRRegistryQueryCompletionBlockEntry *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[6];
  _QWORD v28[7];
  _QWORD v29[6];
  objc_super v30;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;

  if (a1)
  {
    v5 = a3;
    objc_msgSend((id)a1, "managementQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = *(_QWORD *)(a1 + 112);
    if (objc_msgSend((id)a1, "supportsWatch"))
      DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](a1);
    else
      DevicesUpdateCounterNotifyToken = objc_msgSend((id)a1, "devicesUpdateCounter") | 0xC000000000000000;
    v9 = [NRRegistryQueryCompletionBlockEntry alloc];
    objc_opt_self();
    v10 = v5;
    if (v9)
    {
      v30.receiver = v9;
      v30.super_class = (Class)NRRegistryQueryCompletionBlockEntry;
      v11 = (NRRegistryQueryCompletionBlockEntry *)objc_msgSendSuper2(&v30, sel_init);
      v9 = v11;
      if (v11)
      {
        v11->_updateCounter = DevicesUpdateCounterNotifyToken & 0x3FFFFFFFFFFFFFFFLL;
        v12 = MEMORY[0x1A1B01DE4](v10);
        block = v9->_block;
        v9->_block = (id)v12;

      }
    }

    v14 = v9;
    v15 = v14;
    if (v14 && v14->_block)
    {
      v16 = *(void **)(a1 + 136);
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 136);
        *(_QWORD *)(a1 + 136) = v17;

        v16 = *(void **)(a1 + 136);
      }
      objc_msgSend(v16, "addObject:", v15);
    }

    if (*(_BYTE *)(a1 + 89) && !a2)
      goto LABEL_22;
    *(_BYTE *)(a1 + 89) = 1;
    if (DevicesUpdateCounterNotifyToken)
    {
      if (v7 == DevicesUpdateCounterNotifyToken)
      {
        *(_BYTE *)(a1 + 89) = 0;
        -[NRRegistryClient _fireAllQueryCompletionBlocks](a1);
LABEL_22:

        return;
      }
      if ((DevicesUpdateCounterNotifyToken & 0x8000000000000000) != 0)
      {
        v24 = (void *)MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_2;
        v28[3] = &unk_1E4495A98;
        v28[4] = a1;
        v28[5] = v7;
        v28[6] = DevicesUpdateCounterNotifyToken;
        v25 = v28;
        v30.receiver = v24;
        v30.super_class = (Class)3221225472;
        v31 = __44__NRRegistryClient__wipeRegistryWith_block___block_invoke;
        v32 = &unk_1E4495AC0;
        v35 = DevicesUpdateCounterNotifyToken;
        v33 = a1;
        v26 = v25;
        v34 = v26;
        objc_msgSend((id)a1, "enqueueBypassAsync:", &v30);

        goto LABEL_22;
      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_3;
      v27[3] = &unk_1E4495A70;
      v27[4] = a1;
      v27[5] = v7;
      v19 = v27;
      v20 = (void *)a1;
      v21 = v7;
      v22 = DevicesUpdateCounterNotifyToken;
      v23 = 0;
    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke;
      v29[3] = &unk_1E4495A70;
      v29[4] = a1;
      v29[5] = v7;
      v19 = v29;
      v20 = (void *)a1;
      v21 = v7;
      v22 = 0;
      v23 = 1;
    }
    -[NRRegistryClient _queryDaemonWithStartingTokenValue:currentTokenValue:syncXPC:withBlock:](v20, v21, v22, v23, v19);
    goto LABEL_22;
  }
}

- (BOOL)daemonIdle
{
  _BOOL8 v3;

  if (-[NRRegistry supportsWatch](self, "supportsWatch"))
    return -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue]((uint64_t)self) >> 63;
  else
    LOBYTE(v3) = 1;
  return v3;
}

void __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t DevicesUpdateCounterNotifyToken;
  BOOL v5;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_14;
  v3 = *(_QWORD *)(v2 + 112);
  if (objc_msgSend(*(id *)(a1 + 32), "supportsWatch"))
    DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](v2);
  else
    DevicesUpdateCounterNotifyToken = objc_msgSend((id)v2, "devicesUpdateCounter") | 0xC000000000000000;
  if (*(_BYTE *)(v2 + 89))
    v5 = 1;
  else
    v5 = DevicesUpdateCounterNotifyToken == 0;
  if (!v5 && v3 == DevicesUpdateCounterNotifyToken)
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_14:
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_2;
    v8[3] = &unk_1E4494DE0;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)v2, "enqueueUnlessSuspended:", v8);

  }
}

- (uint64_t)_getDevicesUpdateCounterNotifyTokenValue
{
  uint64_t v1;
  uint64_t v2;
  int check;

  if (result)
  {
    v1 = result;
    check = 1;
    notify_check(*(_DWORD *)(result + 96), &check);
    if (!check && *(_BYTE *)(v1 + 88))
      return *(_QWORD *)(v1 + 120);
    v2 = 0;
    if (notify_get_state(*(_DWORD *)(v1 + 96), &v2))
    {
      return *(_QWORD *)(v1 + 120);
    }
    else
    {
      *(_BYTE *)(v1 + 88) = 1;
      result = v2;
      *(_QWORD *)(v1 + 120) = v2;
    }
  }
  return result;
}

- (void)_fireAllQueryCompletionBlocks
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 136);
  v3 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (v9)
          v10 = *(_QWORD *)(v9 + 8);
        else
          v10 = 0;
        (*(void (**)(uint64_t))(v10 + 16))(v10);
        ++v8;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v11;
    }
    while (v11);
  }

}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_2(uint64_t a1)
{
  -[NRRegistryClient _finishQueryWithStaringToken:replacementToken:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NRNSXPCConnectionProtocol)rawConnection
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__NRRegistryClient_rawConnection__block_invoke;
  v4[3] = &unk_1E4494F20;
  v4[4] = self;
  v4[5] = &v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRNSXPCConnectionProtocol *)v2;
}

void __39__NRRegistryClient_initWithParameters___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryDataAsyncIfNeededWithBlock:", 0);

}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

- (void)grabRegistryWithReadBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NRRegistry managementQueue](self, "managementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NRRegistryClient_grabRegistryWithReadBlock___block_invoke;
  v7[3] = &unk_1E4495668;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__NRRegistryClient_grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_grabRegistryWithReadBlock:", *(_QWORD *)(a1 + 40));
}

- (void)grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NRRegistry managementQueue](self, "managementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[NRRegistry managementQueue](self, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NRRegistryClient_grabRegistryWithWriteBlockAsync___block_invoke;
  v8[3] = &unk_1E4495668;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __52__NRRegistryClient_grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_grabRegistryWithWriteBlockAsync:", *(_QWORD *)(a1 + 40));
}

- (void)_grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[NRRegistry managementQueue](self, "managementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  v11 = (id)os_transaction_create();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke;
  v7[3] = &unk_1E44959F8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NRRegistryClient _queryDataAsyncIfNeededWithBlock:](self, "_queryDataAsyncIfNeededWithBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke_2;
  v4[3] = &unk_1E44959D0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "enqueueAsync:", v4);

}

void __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getReferencedSecureProperties:fromDiff:", v6, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "supportsWatch");
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "rawConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "xpcApplyDiff:withSecureProperties:block:", v15, v7, &__block_literal_global_32);

  }
  else
  {
    objc_msgSend(v9, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "applyDiff:", v15);
  }

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

- (void)removeDiffIndexObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__NRRegistryClient_removeDiffIndexObserver___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

uint64_t __44__NRRegistryClient_removeDiffIndexObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __94__NRRegistryClient__notifyDiffIndexObserversWithDiff_deviceCollection_secureProperties_index___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __66__NRRegistryClient__finishQueryWithStaringToken_replacementToken___block_invoke(uint64_t a1)
{
  return -[NRRegistryClient _queryDataAsyncForce:ifNeededWithBlock:](*(_QWORD *)(a1 + 32), 1, 0);
}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  -[NRRegistryClient _finishQueryWithStaringToken:replacementToken:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (void)_queryDaemonWithStartingTokenValue:(uint64_t)a3 currentTokenValue:(int)a4 syncXPC:(void *)a5 withBlock:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  uint8_t buf[16];

  v9 = a5;
  objc_msgSend(a1, "rawConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "secureProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "rawConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a2 | 0x4000000000000000) != a3 || v12)
      {
        v26 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_48;
        v38[3] = &unk_1E4495B88;
        v38[4] = a1;
        v27 = v9;
        v39 = v27;
        v40 = a2;
        objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v38);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v26;
        v36[1] = 3221225472;
        v36[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_50;
        v36[3] = &unk_1E4495C00;
        v36[4] = a1;
        v37 = v27;
        objc_msgSend(v28, "xpcGetDiffSinceTokenValue:getSecureProperties:withBlock:", a2, 1, v36);

        v17 = v39;
      }
      else
      {
        v14 = MEMORY[0x1E0C809B0];
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_42;
        v44[3] = &unk_1E4495B88;
        v44[4] = a1;
        v15 = v9;
        v45 = v15;
        v46 = a2;
        objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v44);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v14;
        v41[1] = 3221225472;
        v41[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_44;
        v41[3] = &unk_1E4495BD8;
        v41[4] = a1;
        v43 = a2;
        v42 = v15;
        objc_msgSend(v16, "xpcRetrieveSecureProperties:block:", 0, v41);

        v17 = v45;
      }
    }
    else if (a4)
    {
      nr_framework_log();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        nr_framework_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0BDB000, v21, OS_LOG_TYPE_DEFAULT, "Using synchronous remote object for xpcGetDeviceCollectionWithBlock", buf, 2u);
        }

      }
      objc_msgSend(a1, "rawConnection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke;
      v54[3] = &unk_1E4495AE8;
      v24 = v9;
      v55 = v24;
      v56 = a2;
      objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v54);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v23;
      v52[1] = 3221225472;
      v52[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_37;
      v52[3] = &unk_1E4495B60;
      v52[4] = a1;
      v53 = v24;
      objc_msgSend(v25, "xpcGetDeviceCollectionWithBlock:", v52);

      v17 = v55;
    }
    else
    {
      objc_msgSend(a1, "rawConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4;
      v49[3] = &unk_1E4495B88;
      v49[4] = a1;
      v31 = v9;
      v50 = v31;
      v51 = a2;
      objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v49);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v30;
      v47[1] = 3221225472;
      v47[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_39;
      v47[3] = &unk_1E4495B60;
      v47[4] = a1;
      v48 = v31;
      objc_msgSend(v32, "xpcGetDeviceCollectionWithBlock:", v47);

      v17 = v50;
    }
  }
  else
  {
    objc_msgSend(a1, "managementQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_54;
    v33[3] = &unk_1E4495B10;
    v34 = v9;
    v35 = a2;
    dispatch_async(v18, v33);

    v17 = v34;
  }

}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[NRRegistryClient _finishQueryWithStaringToken:replacementToken:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CB28A8];
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 == 4097)
      goto LABEL_9;
  }
  else
  {

  }
  nr_daemon_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    nr_daemon_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "nr_safeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1A0BDB000, v9, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValueSync/xpcGetDeviceCollectionWithBlock: XPC error %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_37(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a3;
  if ((a5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_warnAboutMissingEntitlement");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2;
  v15[3] = &unk_1E4495B38;
  v12 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v16 = v10;
  v17 = v12;
  v18 = v9;
  v20 = a4;
  v19 = v11;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v12, "enqueueBypassAsync:", v15);

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setSecureProperties:");
  objc_msgSend(*(id *)(a1 + 48), "setParentDelegate:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(v2 + 112) = *(_QWORD *)(a1 + 64);
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setCollection:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3;
  v7[3] = &unk_1E4495B10;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, v7);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5;
  block[3] = &unk_1E4495AC0;
  v9 = v3;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0CB28A8];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v4 == 4097)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {

  }
  nr_daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    nr_daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "nr_safeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcGetDeviceCollectionWithBlock: XPC error %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_39(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a3;
  if ((a5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_warnAboutMissingEntitlement");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_40;
  v15[3] = &unk_1E4495B38;
  v12 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v16 = v10;
  v17 = v12;
  v18 = v9;
  v20 = a4;
  v19 = v11;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v12, "enqueueBypassAsync:", v15);

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setSecureProperties:");
  objc_msgSend(*(id *)(a1 + 48), "setParentDelegate:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(v2 + 112) = *(_QWORD *)(a1 + 64);
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setCollection:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_41;
  v7[3] = &unk_1E4495B10;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, v7);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CB28A8];
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 == 4097)
      goto LABEL_9;
  }
  else
  {

  }
  nr_daemon_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    nr_daemon_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "nr_safeDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_error_impl(&dword_1A0BDB000, v9, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcRetrieveSecureProperties: XPC error %{public}@", buf, 0xCu);

    }
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_43;
  v14[3] = &unk_1E4495B10;
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v15 = v11;
  v16 = v12;
  dispatch_async(v10, v14);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_44(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_45;
  v7[3] = &unk_1E4495BB0;
  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v8 = v3;
  v9 = v5;
  v11 = a1[6];
  v10 = v4;
  v6 = v3;
  objc_msgSend(v5, "enqueueBypassAsync:", v7);

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_45(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "secureProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "forceImportSecureProperties:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "secureProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(*(id *)(a1 + 40), "setSecureProperties:", v2);

  }
  v4 = *(_QWORD *)(a1 + 56) | 0x4000000000000000;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    *(_QWORD *)(v5 + 112) = v4;
    v6 = *(void **)(a1 + 40);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "managementQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_46;
  v8[3] = &unk_1E4495B10;
  v9 = *(id *)(a1 + 48);
  v10 = v4;
  dispatch_async(v7, v8);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_6;
  v10[3] = &unk_1E4495BB0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v9 = v3;
  dispatch_async(v4, v10);

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0CB28A8];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v4 == 4097)
      goto LABEL_9;
  }
  else
  {

  }
  nr_daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    nr_daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "nr_safeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcGetDiffSinceIndex: XPC error %{public}@", buf, 0xCu);

    }
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "managementQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_49;
  v12[3] = &unk_1E4495B10;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v13 = v9;
  v14 = v10;
  dispatch_async(v8, v12);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_50(uint64_t a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NRMutableDeviceCollection *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v9 = a2;
  v10 = a3;
  v11 = v9;
  v12 = v11;
  if (a4)
  {
    v13 = (void *)MEMORY[0x1A1B01C40]();
    v14 = objc_alloc_init(NRMutableDeviceCollection);
    v15 = -[NRMutableStateBase applyDiff:](v14, "applyDiff:", v11);
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:", v16, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v13);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_51;
  v20[3] = &unk_1E4495B38;
  v17 = *(void **)(a1 + 40);
  v21 = *(id *)(a1 + 32);
  v22 = v10;
  v25 = a5;
  v23 = v12;
  v24 = v17;
  v18 = v12;
  v19 = v10;
  objc_msgSend(v21, "enqueueBypassAsync:", v20);

}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_51(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "forceImportSecureProperties:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "setSecureProperties:", v2);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    *(_QWORD *)(v4 + 112) = *(_QWORD *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "applyDiff:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "managementQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_52;
  v11[3] = &unk_1E4495B10;
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v12 = v9;
  v13 = v10;
  dispatch_async(v8, v11);

}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_warnAboutMissingEntitlement
{
  if (_NRIsInternalInstall___onceToken != -1)
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  if (_NRIsInternalInstall___internalInstall)
  {
    if (_warnAboutMissingEntitlement_onceToken != -1)
      dispatch_once(&_warnAboutMissingEntitlement_onceToken, &__block_literal_global_55);
  }
}

void __48__NRRegistryClient__warnAboutMissingEntitlement__block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  nr_framework_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    nr_framework_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0BDB000, v2, OS_LOG_TYPE_ERROR, "** WARNING ** - Process does not have any entitlements to access NanoRegistry, you will receive a nil collection", buf, 2u);
    }

  }
  nr_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1A0BDB000, v3, OS_LOG_TYPE_FAULT, "Process is not entitled to access NanoRegistry - All NanoRegistry access is gated by entitlement, you have received a nil collection", v4, 2u);
  }

}

void __34__NRRegistryClient_setCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v2, "devicesUpdateCounter");
  v6 = *v3;
  objc_msgSend(*v3, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "secureProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v17 = v7;
  v10 = v8;
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__NRRegistryClient__notifyDiffIndexObserversWithDiff_deviceCollection_secureProperties_index___block_invoke;
    v22[3] = &unk_1E4495A48;
    v22[4] = v6;
    v22[5] = &v23;
    objc_msgSend(v6, "performUnderCollectionLock:", v22);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (id)v24[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend((id)v24[5], "objectForKeyedSubscript:", v15);
          v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, id, id, uint64_t, uint64_t))v16)[2](v16, v9, v17, v10, v15, v5);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
      }
      while (v12);
    }

    _Block_object_dispose(&v23, 8);
  }

}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[NRRegistry managementQueue](self, "managementQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NRRegistryClient_invalidate__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)NRRegistryClient;
  -[NRRegistry invalidate](&v4, sel_invalidate);
}

uint64_t __30__NRRegistryClient_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "rawConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend((id)v3, "rawConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), 0);
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 92) != -1)
  {
    notify_cancel(*(_DWORD *)(v3 + 92));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = -1;
    v3 = *(_QWORD *)(a1 + 32);
  }
  result = *(unsigned int *)(v3 + 96);
  if ((_DWORD)result != -1)
  {
    result = notify_cancel(result);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = -1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryQueryCompletionBlockEntries, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_diffIndexObservers, 0);
}

@end
