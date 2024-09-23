@implementation EFStoppableScheduler

- (void)performSyncBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", v5);

}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  EFCancelationToken *v7;
  void *v8;
  EFCancelationToken *v9;
  id v10;
  void *v11;
  EFCancelationToken *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  EFCancelationToken *v18;
  id v19;
  id v20;
  id location;

  v6 = a4;
  v7 = objc_alloc_init(EFCancelationToken);
  -[EFStoppableScheduler _addCancelationToken:](self, "_addCancelationToken:", v7);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __48__EFStoppableScheduler_afterDelay_performBlock___block_invoke;
  v17 = &unk_1E62A7618;
  objc_copyWeak(&v20, &location);
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v8, "afterDelay:performBlock:", &v14, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[EFCancelationToken addCancelable:](v9, "addCancelable:", v11, v14, v15, v16, v17, v18);
    v12 = v9;
  }
  else
  {
    -[EFStoppableScheduler _removeCancelationToken:](self, "_removeCancelationToken:", v9, v14, v15, v16, v17, v18);
    v12 = 0;
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_addCancelationToken:(id)a3
{
  id v4;
  EFLocked *tokens;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  tokens = self->_tokens;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__EFStoppableScheduler__addCancelationToken___block_invoke;
  v13[3] = &unk_1E62A7668;
  v7 = v4;
  v14 = v7;
  -[EFLocked performWhileLocked:](tokens, "performWhileLocked:", v13);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __45__EFStoppableScheduler__addCancelationToken___block_invoke_2;
  v8[3] = &unk_1E62A7690;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  objc_msgSend(v7, "addCancelationBlock:", v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __45__EFStoppableScheduler__addCancelationToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)assertIsExecuting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertIsExecuting:", v3);

}

- (void)performBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performBlock:", v5);

}

+ (id)suspendableSchedulerWithScheduler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduler:", v4);

  return v5;
}

+ (id)assertableSchedulerWithScheduler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduler:", v4);

  return v5;
}

- (EFStoppableScheduler)initWithScheduler:(id)a3
{
  id v4;
  EFStoppableScheduler *v5;
  EFStoppableScheduler *v6;
  id v7;
  EFLocked *v8;
  id v9;
  uint64_t v10;
  EFLocked *tokens;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFStoppableScheduler;
  v5 = -[EFStoppableScheduler init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = EFAtomicObjectSetIfNil((unint64_t *)&v5->_scheduler, v4);
    v8 = [EFLocked alloc];
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = -[EFLocked initWithObject:](v8, "initWithObject:", v9);
    tokens = v6->_tokens;
    v6->_tokens = (EFLocked *)v10;

  }
  return v6;
}

- (void)suspend
{
  id v2;

  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (void)resume
{
  id v2;

  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (EFScheduler)scheduler
{
  return (EFScheduler *)EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = EFAtomicObjectRelease((unint64_t *)&self->_scheduler);
  v4.receiver = self;
  v4.super_class = (Class)EFStoppableScheduler;
  -[EFStoppableScheduler dealloc](&v4, sel_dealloc);
}

void __48__EFStoppableScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeCancelationToken:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  EFCancelationToken *v5;
  void *v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  EFCancelationToken *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  EFCancelationToken *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(EFCancelationToken);
  -[EFStoppableScheduler _addCancelationToken:](self, "_addCancelationToken:", v5);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __47__EFStoppableScheduler_performCancelableBlock___block_invoke;
  v15 = &unk_1E62A7640;
  objc_copyWeak(&v18, &location);
  v7 = v5;
  v16 = v7;
  v8 = v4;
  v17 = v8;
  objc_msgSend(v6, "performCancelableBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[EFCancelationToken addCancelable:](v7, "addCancelable:", v9, v12, v13, v14, v15, v16);
    v10 = v7;
  }
  else
  {
    -[EFStoppableScheduler _removeCancelationToken:](self, "_removeCancelationToken:", v7, v12, v13, v14, v15, v16);
    v10 = 0;
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __47__EFStoppableScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeCancelationToken:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)performSyncBarrierBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBarrierBlock:", v5);

}

- (void)performVoucherPreservingBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performVoucherPreservingBlock:", v5);

}

- (id)performWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)stopAndWait
{
  id v3;

  EFAtomicObjectRelease((unint64_t *)&self->_scheduler);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EFStoppableScheduler _cancelAllTokens](self, "_cancelAllTokens");
  objc_msgSend(v3, "performSyncBarrierBlock:", &__block_literal_global_37);

}

void __45__EFStoppableScheduler__addCancelationToken___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeCancelationToken:", v2);

}

- (void)_removeCancelationToken:(id)a3
{
  id v4;
  EFLocked *tokens;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  tokens = self->_tokens;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EFStoppableScheduler__removeCancelationToken___block_invoke;
  v7[3] = &unk_1E62A7668;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](tokens, "performWhileLocked:", v7);

}

uint64_t __48__EFStoppableScheduler__removeCancelationToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_cancelAllTokens
{
  EFLocked *tokens;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  tokens = self->_tokens;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__EFStoppableScheduler__cancelAllTokens__block_invoke;
  v11[3] = &unk_1E62A76B8;
  v11[4] = &v12;
  -[EFLocked performWhileLocked:](tokens, "performWhileLocked:", v11);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __40__EFStoppableScheduler__cancelAllTokens__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v6, "removeAllObjects");
}

@end
