@implementation SGSuggestionsWorkGroupManager

- (id)_init
{
  SGSuggestionsWorkGroupManager *v2;
  void *v3;
  uint64_t v4;
  _PASLock *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGSuggestionsWorkGroupManager;
  v2 = -[SGSuggestionsWorkGroupManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v4;

  }
  return v2;
}

- (void)waitForUniqueIdentifierToProcess:(id)a3
{
  -[SGSuggestionsWorkGroupManager waitForUniqueIdentifierToProcess:withTimeout:](self, "waitForUniqueIdentifierToProcess:withTimeout:", a3, 10.0);
}

- (void)waitForUniqueIdentifierToProcess:(id)a3 withTimeout:(double)a4
{
  id v7;
  _PASLock *lock;
  id v9;
  int v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint8_t buf[16];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsWorkGroupManager.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  v18 = 0;
  v19 = &v18;
  if (a4 == 0.0)
    a4 = 10.0;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8606;
  v22 = __Block_byref_object_dispose__8607;
  v23 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__SGSuggestionsWorkGroupManager_waitForUniqueIdentifierToProcess_withTimeout___block_invoke;
  v15[3] = &unk_1E4762990;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  if (v19[5])
  {
    v10 = objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", a4);
    if (v10 == 1)
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "SGSuggestionsWorkGroupManager - Timeout waiting for suggestions group leave status. Continuing...";
        goto LABEL_12;
      }
LABEL_13:

      goto LABEL_14;
    }
    if (!v10)
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "SGSuggestionsWorkGroupManager - Acquired leave group. Continuing...";
LABEL_12:
        _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
LABEL_14:

  _Block_object_dispose(&v18, 8);
}

- (void)finishProcessingForUniqueIdentifier:(id)a3
{
  id v5;
  _PASLock *lock;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsWorkGroupManager.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SGSuggestionsWorkGroupManager_finishProcessingForUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E47629B8;
  v10 = v5;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __69__SGSuggestionsWorkGroupManager_finishProcessingForUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addToProcessedIds:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "groupForUniqueId:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "leaveGroupForUniqueId:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "removeGroupFromProcessedIds:", *(_QWORD *)(a1 + 32));
  }

}

void __78__SGSuggestionsWorkGroupManager_waitForUniqueIdentifierToProcess_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "isProcessedUniqueId:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v9, "groupForUniqueId:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(v9, "createGroupForUniqueId:", *(_QWORD *)(a1 + 32));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      objc_msgSend(v9, "enterGroupForUniqueId:", *(_QWORD *)(a1 + 32));
    }
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_8614);
  return (id)sharedInstance__pasExprOnceResult;
}

void __47__SGSuggestionsWorkGroupManager_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = -[SGSuggestionsWorkGroupManager _init]([SGSuggestionsWorkGroupManager alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
