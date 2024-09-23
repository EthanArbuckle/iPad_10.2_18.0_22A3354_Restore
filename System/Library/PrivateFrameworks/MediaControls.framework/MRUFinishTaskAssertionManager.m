@implementation MRUFinishTaskAssertionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_38);
  return (id)sharedManager___shared;
}

void __46__MRUFinishTaskAssertionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager___shared;
  sharedManager___shared = v0;

}

- (MRUFinishTaskAssertionManager)init
{
  MRUFinishTaskAssertionManager *v2;
  uint64_t v3;
  NSMapTable *tokenMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUFinishTaskAssertionManager;
  v2 = -[MRUFinishTaskAssertionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    tokenMap = v2->_tokenMap;
    v2->_tokenMap = (NSMapTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSAssertion invalidate](self->_taskAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRUFinishTaskAssertionManager;
  -[MRUFinishTaskAssertionManager dealloc](&v3, sel_dealloc);
}

- (void)acquireForTaskToken:(id)a3 withReason:(id)a4 invalidationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRUFinishTaskAssertionManager tokenMap](self, "tokenMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _Block_copy(v10);
  objc_msgSend(v11, "setObject:forKey:", v12, v8);

  MCLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "[MRUFinishTaskAssertionManager] Acquiring for token: %p with reason: %@", buf, 0x16u);
  }

  -[MRUFinishTaskAssertionManager taskAssertion](self, "taskAssertion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D87C98]);
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithExplanation:target:attributes:", CFSTR("MediaRemote UI pre-suspend cleanup."), v17, v19);
    -[MRUFinishTaskAssertionManager setTaskAssertion:](self, "setTaskAssertion:", v20);

    -[MRUFinishTaskAssertionManager taskAssertion](self, "taskAssertion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v21, "acquireWithError:", &v28);
    v22 = v28;

    if (v22)
    {
      MCLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl(&dword_1AA991000, v23, OS_LOG_TYPE_ERROR, "[MRUFinishTaskAssertionManager] FinishTask assertion acquisition failed with error: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_initWeak((id *)buf, self);
      v24 = (void *)MEMORY[0x1E0D4D110];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __84__MRUFinishTaskAssertionManager_acquireForTaskToken_withReason_invalidationHandler___block_invoke;
      v26[3] = &unk_1E5818E18;
      objc_copyWeak(&v27, (id *)buf);
      objc_msgSend(v24, "timerWithInterval:repeats:queue:block:", 0, MEMORY[0x1E0C80D38], v26, 5.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUFinishTaskAssertionManager setAutoInvalidationTimer:](self, "setAutoInvalidationTimer:", v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __84__MRUFinishTaskAssertionManager_acquireForTaskToken_withReason_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(void);
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "tokenMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      MCLogCategoryDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "keyEnumerator");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "[MRUFinishTaskAssertionManager] Task tokens after timeout: %@", buf, 0xCu);

      }
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
            v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v12[2]();

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      objc_msgSend(v7, "removeAllObjects");
    }
    objc_msgSend(v2, "taskAssertion", (_QWORD)v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    objc_msgSend(v2, "setTaskAssertion:", 0);
  }

}

- (void)releaseForTaskToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRUFinishTaskAssertionManager tokenMap](self, "tokenMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MCLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v4;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[MRUFinishTaskAssertionManager] Releasing for token: %p", (uint8_t *)&v13, 0xCu);
    }

    -[MRUFinishTaskAssertionManager tokenMap](self, "tokenMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

    -[MRUFinishTaskAssertionManager tokenMap](self, "tokenMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      -[MRUFinishTaskAssertionManager autoInvalidationTimer](self, "autoInvalidationTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[MRUFinishTaskAssertionManager setAutoInvalidationTimer:](self, "setAutoInvalidationTimer:", 0);
      -[MRUFinishTaskAssertionManager taskAssertion](self, "taskAssertion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      -[MRUFinishTaskAssertionManager setTaskAssertion:](self, "setTaskAssertion:", 0);
    }
  }

}

- (NSMapTable)tokenMap
{
  return self->_tokenMap;
}

- (RBSAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_taskAssertion, a3);
}

- (MSVTimer)autoInvalidationTimer
{
  return self->_autoInvalidationTimer;
}

- (void)setAutoInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoInvalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_tokenMap, 0);
}

@end
