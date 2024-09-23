@implementation CHSToolServiceConnection

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance___sharedInstance;
}

void __42__CHSToolServiceConnection_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CHSToolServiceConnection _init]([CHSToolServiceConnection alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (CHSToolServiceConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSToolServiceConnection.m"), 42, CFSTR("use +sharedInstance"));

  return 0;
}

- (id)_init
{
  CHSToolServiceConnection *v2;
  NSMutableSet *v3;
  NSMutableSet *queue_clients;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHSToolServiceConnection;
  v2 = -[CHSToolServiceConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queue_clients = v2->_queue_clients;
    v2->_queue_clients = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesToolConnection", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)addClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CHSToolServiceConnection_addClient___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __38__CHSToolServiceConnection_addClient___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_createConnection");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addClient:", *(_QWORD *)(a1 + 40));
}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CHSToolServiceConnection_removeClient___block_invoke;
  block[3] = &unk_1E2A5A290;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __41__CHSToolServiceConnection_removeClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeClient:", *(_QWORD *)(a1 + 40));
}

- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A7B8;
    v3 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v2, "refreshDescriptorsForExtensionBundleIdentifier:completion:", v3, v8);
    v4 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

void __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke_2;
    v8[3] = &unk_1E2A5A7E0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v2, "allCachedSnapshotURLsWithCompletion:", v8);
    v3 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v3, v6);

  }
}

uint64_t __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke_2;
    v7[3] = &unk_1E2A5A7E0;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v2, "listStateCaptureIdentifiersWithCompletion:", v7);
    v3 = v8;
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v6, 2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);
  }

}

uint64_t __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke_2;
    v7[3] = &unk_1E2A5A830;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v2, "fetchStateWithCompletion:", v7);
    v3 = v8;
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v6, 2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, void *))(v5 + 16))(v5, CFSTR("<nil>"), v3);
  }

}

uint64_t __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A830;
    v3 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v2, "fetchStateForItemWithIdentifier:completion:", v3, v8);
    v4 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, void *))(v6 + 16))(v6, CFSTR("<nil>"), v4);
  }

}

uint64_t __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A858;
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v2, "extensionInfoForBundleIdentifier:completion:", v9, v8);

    v4 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Unable to obtain extension info for %@; unable to obtain the remote target",
        buf,
        0xCu);
    }

    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v4);
  }

}

void __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CHSLogChronoServices();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEBUG, "Received extension info (%@) for (%@), error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)extensionInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CHSToolServiceConnection_extensionInfo___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__CHSToolServiceConnection_extensionInfo___block_invoke_2;
    v7[3] = &unk_1E2A5A7E0;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v2, "extensionInfoWithCompletion:", v7);
    v3 = v8;
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "Unable to obtain extension info; unable to obtain the remote target",
        v6,
        2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v3);
  }

}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  CHSLogChronoServices();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __42__CHSToolServiceConnection_extensionInfo___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)v6, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)widgetsWithTimelines:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke_2;
    v7[3] = &unk_1E2A5A880;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v2, "widgetsWithTimelines:", v7);
    v3 = v8;
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "Unable to obtain widgets with timelines; unable to obtain the remote target",
        v6,
        2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v3);
  }

}

void __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "widgetKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);

}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = a1[5];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A8A8;
    v9 = v3;
    v10 = a1[6];
    objc_msgSend(v2, "timelineForWidgetKey:completion:", v9, v8);

    v4 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "widget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Unable to obtain timeline for widget (%@); unable to obtain the remote target",
        buf,
        0xCu);

    }
    v7 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v4);
  }

}

void __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CHSLogChronoServices();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "widget");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("Yes");
    v11 = 138412802;
    if (!v5)
      v10 = CFSTR("No");
    v12 = v10;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEBUG, "Received timeline (%@) for widget: %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (void)resetCaches:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CHSToolServiceConnection_resetCaches_completion___block_invoke;
  block[3] = &unk_1E2A5A8F8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A8D0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v2, "resetCaches:completion:", v3, v8);

    v4 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Unable to deliver cache reset request; unable to obtain the remote target",
        v7,
        2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }

}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke;
  block[3] = &unk_1E2A5A948;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A920;
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v2, "reloadControlsOfKind:containedIn:reason:completion:", v4, v9, v5, v8);

    v6 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "Unable to deliver controls reload request; unable to obtain the remote target",
        v7,
        2u);
    }
  }

}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke;
  block[3] = &unk_1E2A5A948;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2;
    v8[3] = &unk_1E2A5A920;
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v2, "reloadTimelinesOfKind:containedIn:reason:completion:", v4, v9, v5, v8);

    v6 = v9;
  }
  else
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "Unable to deliver timeline reload request; unable to obtain the remote target",
        v7,
        2u);
    }
  }

}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)expireLocationGracePeriods
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CHSToolServiceConnection_expireLocationGracePeriods__block_invoke;
  block[3] = &unk_1E2A5A2D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__CHSToolServiceConnection_expireLocationGracePeriods__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "expireLocationGracePeriods");
  }
  else
  {
    CHSLogChronoServices();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "notifying server to expire location grace periods failed; unable to obtain the remote target",
        v4,
        2u);
    }

  }
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "contentURLForActivityID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke_cold_1();

  }
}

- (void)runReaper
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CHSToolServiceConnection_runReaper__block_invoke;
  block[3] = &unk_1E2A5A2D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__CHSToolServiceConnection_runReaper__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "runReaper");
  }
  else
  {
    CHSLogChronoServices();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__CHSToolServiceConnection_runReaper__block_invoke_cold_1();

  }
}

- (void)fetchWidgetSceneInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fetchWidgetSceneInfoWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke_cold_1();

  }
}

- (void)runMigrationReaper
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CHSToolServiceConnection_runMigrationReaper__block_invoke;
  block[3] = &unk_1E2A5A2D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__CHSToolServiceConnection_runMigrationReaper__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "runMigrationReaper");
  }
  else
  {
    CHSLogChronoServices();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__CHSToolServiceConnection_runMigrationReaper__block_invoke_cold_1();

  }
}

- (id)_queue_remoteTarget
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CHSToolServiceConnection _queue_createConnection](self, "_queue_createConnection");
    -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_queue_createConnection
{
  void *v3;
  void *v4;
  BSServiceConnection *v5;
  BSServiceConnection *queue_connection;
  BSServiceConnection *v7;
  id v8;
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1E0D03458];
  +[CHSToolServiceSpecification identifier](CHSToolServiceSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", CFSTR("com.apple.chronoservices"), v4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CHSToolServiceConnection _queue_invalidateConnection](self, "_queue_invalidateConnection");
  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v8);
  v5 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  queue_connection = self->_queue_connection;
  self->_queue_connection = v5;

  v7 = self->_queue_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__CHSToolServiceConnection__queue_createConnection__block_invoke;
  v9[3] = &unk_1E2A5A790;
  v9[4] = self;
  -[BSServiceConnection configureConnection:](v7, "configureConnection:", v9);
  -[BSServiceConnection activate](self->_queue_connection, "activate");

}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[CHSToolServiceSpecification serviceQuality](CHSToolServiceSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[CHSToolServiceSpecification interface](CHSToolServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_29);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_31);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_33);

}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  CHSLogChronoServices();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FB18000, v0, OS_LOG_TYPE_DEFAULT, "chrono tool service (service-side) connection activated", v1, 2u);
  }

}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_30()
{
  NSObject *v0;
  uint8_t v1[16];

  CHSLogChronoServices();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FB18000, v0, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection interrupted", v1, 2u);
  }

}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_32()
{
  NSObject *v0;
  uint8_t v1[16];

  CHSLogChronoServices();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FB18000, v0, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection invalidated", v1, 2u);
  }

}

- (void)_queue_invalidateConnection
{
  BSServiceConnection *queue_connection;
  BSServiceConnection *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    -[BSServiceConnection invalidate](queue_connection, "invalidate");
    v4 = self->_queue_connection;
    self->_queue_connection = 0;

  }
}

- (void)_queue_addClient:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSToolServiceConnection.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_queue_clients, "addObject:", v5);

}

- (void)_queue_removeClient:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSToolServiceConnection.m"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->_queue_clients, "removeObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_clients, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_18FB18000, log, OS_LOG_TYPE_DEBUG, "Received extension info (%@), error: %@", (uint8_t *)&v3, 0x16u);
}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18FB18000, a2, OS_LOG_TYPE_DEBUG, "Received cache reset request, error: %@", (uint8_t *)&v2, 0xCu);
}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_18FB18000, v0, v1, "Received controls reload request for (%@) of kind (%@) with reason (%@), error: %@");
}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_18FB18000, v0, v1, "Received timeline reload request for (%@) of kind (%@) with reason (%@), error: %@");
}

void __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Unable to get session content urls; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __37__CHSToolServiceConnection_runReaper__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Unable to run reaper; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Unable to fetch widget scene info; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __46__CHSToolServiceConnection_runMigrationReaper__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Unable to run migration reaper; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

@end
