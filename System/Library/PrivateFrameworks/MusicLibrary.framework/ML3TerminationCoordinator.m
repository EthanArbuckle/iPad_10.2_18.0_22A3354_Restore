@implementation ML3TerminationCoordinator

uint64_t __37__ML3TerminationCoordinator_isSigned__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

+ (ML3TerminationCoordinator)sharedCoordinator
{
  if (sharedCoordinator___once != -1)
    dispatch_once(&sharedCoordinator___once, &__block_literal_global_3632);
  return (ML3TerminationCoordinator *)(id)sharedCoordinator___sharedCoordinator;
}

- (BOOL)isSigned
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ML3TerminationCoordinator_isSigned__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)signForReason:(int64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ML3TerminationCoordinator_signForReason___block_invoke;
  v4[3] = &unk_1E5B5F8C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __43__ML3TerminationCoordinator_signForReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __46__ML3TerminationCoordinator_sharedCoordinator__block_invoke()
{
  ML3TerminationCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(ML3TerminationCoordinator);
  v1 = (void *)sharedCoordinator___sharedCoordinator;
  sharedCoordinator___sharedCoordinator = (uint64_t)v0;

}

- (ML3TerminationCoordinator)init
{
  ML3TerminationCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  NSMutableSet *v5;
  NSMutableSet *signatures;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ML3TerminationCoordinator;
  v2 = -[ML3TerminationCoordinator init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ML3TerminationCoordinator", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    signatures = v2->_signatures;
    v2->_signatures = v5;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__ML3TerminationCoordinator_init__block_invoke;
    v10[3] = &unk_1E5B65A28;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.MusicLibrary.execute-coordinated-termination", &v2->_notifyToken, v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)ML3TerminationCoordinator;
  -[ML3TerminationCoordinator dealloc](&v3, sel_dealloc);
}

- (void)secedeForReason:(int64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ML3TerminationCoordinator_secedeForReason___block_invoke;
  v4[3] = &unk_1E5B5F8C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (BOOL)isSignedForReason:(int64_t)a3
{
  NSObject *serialQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ML3TerminationCoordinator_isSignedForReason___block_invoke;
  block[3] = &unk_1E5B655D8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)execute
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ is requesting coordinated termination", (uint8_t *)&v5, 0xCu);

  }
  notify_post("com.apple.MusicLibrary.execute-coordinated-termination");
}

- (void)_performTermination
{
  NSObject *v3;
  NSMutableSet *signatures;
  int v5;
  NSMutableSet *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    signatures = self->_signatures;
    v5 = 138543362;
    v6 = signatures;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Received notification to perform coordinated termination. Reasons signed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  exit(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __47__ML3TerminationCoordinator_isSignedForReason___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2, "containsObject:", v3);

}

void __45__ML3TerminationCoordinator_secedeForReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", v2);

}

void __33__ML3TerminationCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isSigned");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_performTermination");
      v2 = v4;
    }
  }

}

@end
