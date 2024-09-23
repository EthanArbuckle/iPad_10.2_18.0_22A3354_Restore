@implementation BNPresentableQueue

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  BNPresentableQueue *v10;
  NSMutableArray *v11;
  NSMutableArray *postingContextQueue;
  BNPostingContext *v13;
  NSObject *v14;
  NSString *penderIdentifier;
  id v16;
  void *v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  int v21;
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    if (!v10->_postingContextQueue)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      postingContextQueue = v10->_postingContextQueue;
      v10->_postingContextQueue = v11;

    }
    v13 = -[BNPostingContext initWithPresentable:presentationOptions:userInfo:]([BNPostingContext alloc], "initWithPresentable:presentationOptions:userInfo:", v8, a4, v9);
    v14 = (id)BNLogPending;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      penderIdentifier = v10->_penderIdentifier;
      -[BNPostingContext pendingIdentifier](v13, "pendingIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      BNEffectivePresentableDescription(v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = penderIdentifier;
      v23 = 2114;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pending presentable: (%{public}@) %{public}@", (uint8_t *)&v21, 0x20u);

    }
    -[NSMutableArray addObject:](v10->_postingContextQueue, "addObject:", v13);
    v18 = (id)BNLogPending;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v10->_penderIdentifier;
      -[NSMutableArray bs_map:](v10->_postingContextQueue, "bs_map:", &__block_literal_global_1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2114;
      v24 = v20;
      _os_log_impl(&dword_1B9628000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Currently pended presentables: %{public}@", (uint8_t *)&v21, 0x16u);

    }
    objc_sync_exit(v10);

  }
}

id __62__BNPresentableQueue_enqueuePresentable_withOptions_userInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "pendingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BNEffectivePresentableDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@) %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)peekPresentable
{
  BNPresentableQueue *v3;
  void *v4;
  BNPendingDequeuePromise *v5;
  NSObject *v6;
  NSString *penderIdentifier;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  BNPendingDequeuePromise *v13;
  id v14;
  uint64_t v15;
  NSMapTable *postingContextsToDequeuePromises;
  NSObject *v17;
  NSString *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  BNPresentableQueue *v27;
  id v28[2];
  id location;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  -[NSMutableArray firstObject](v3->_postingContextQueue, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable objectForKey:](v3->_postingContextsToDequeuePromises, "objectForKey:", v4);
    v5 = (BNPendingDequeuePromise *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (id)BNLogPending;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        penderIdentifier = v3->_penderIdentifier;
        objc_msgSend(v4, "pendingIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "presentable");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        BNEffectivePresentableDescription(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = penderIdentifier;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Have existing dequeue promise for presentable: (%{public}@) %{public}@", buf, 0x20u);

      }
    }
    else
    {
      objc_initWeak(&location, v3);
      v13 = [BNPendingDequeuePromise alloc];
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __37__BNPresentableQueue_peekPresentable__block_invoke;
      v26 = &unk_1E70444E0;
      objc_copyWeak(v28, &location);
      v28[1] = (id)a2;
      v27 = v3;
      v5 = -[BNPendingDequeuePromise initWithPostingContext:dequeueBlock:](v13, "initWithPostingContext:dequeueBlock:", v4, &v23);
      if (!v3->_postingContextsToDequeuePromises)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3748]);
        v15 = objc_msgSend(v14, "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0, v23, v24, v25, v26);
        postingContextsToDequeuePromises = v3->_postingContextsToDequeuePromises;
        v3->_postingContextsToDequeuePromises = (NSMapTable *)v15;

      }
      v17 = (id)BNLogPending;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v3->_penderIdentifier;
        objc_msgSend(v4, "pendingIdentifier");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "presentable");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        BNEffectivePresentableDescription(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v18;
        v32 = 2114;
        v33 = v19;
        v34 = 2114;
        v35 = v21;
        _os_log_impl(&dword_1B9628000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) Adding new dequeue promise for presentable: (%{public}@) %{public}@", buf, 0x20u);

      }
      -[NSMapTable setObject:forKey:](v3->_postingContextsToDequeuePromises, "setObject:forKey:", v5, v4);
      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v11 = BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v3->_penderIdentifier;
      *(_DWORD *)buf = 138543362;
      v31 = v12;
      _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) No pending presentables", buf, 0xCu);
    }
    v5 = 0;
  }

  objc_sync_exit(v3);
  return v5;
}

void __37__BNPresentableQueue_peekPresentable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained[2], "objectForKey:", v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v5[1], "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("BNPresentableQueue.m"), 90, CFSTR("Dequeueing posting context '%@' is not at the front of the queue: %@"), v5[4], v3, v5[1]);

    }
    v8 = (void *)BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v5[4];
      v10 = v8;
      objc_msgSend(v3, "pendingIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      BNEffectivePresentableDescription(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1B9628000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dequeueing presentable: (%{public}@) %{public}@", buf, 0x20u);

    }
    objc_msgSend(v5[1], "removeObjectAtIndex:", 0);
    objc_msgSend(v5[2], "removeObjectForKey:", v3);
    objc_msgSend(v5, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "pendingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentableQueue:didDequeuePresentableWithPendingIdentifier:", v5, v15);

    }
  }
  else
  {
    v16 = (void *)BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v5[4];
      v18 = v16;
      objc_msgSend(v3, "pendingIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentable");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      BNEffectivePresentableDescription(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v17;
      v25 = 2114;
      v26 = v19;
      v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_1B9628000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Not dequeueing presentable because promise for posting context already removed: (%{public}@) %{public}@", buf, 0x20u);

    }
    objc_msgSend(v5[1], "removeObject:", v3);
  }

}

- (id)_pullPresentablesPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  BNPresentableQueue *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  __int128 v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *penderIdentifier;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  BNPresentableQueue *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, void *))a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (void *)-[NSMutableArray copy](v5->_postingContextQueue, "copy");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v8)
    {
      v10 = 0;
      v28 = *(_QWORD *)v31;
      v29 = v8;
      *(_QWORD *)&v9 = 138543874;
      v25 = v9;
      v26 = v5;
      obj = v7;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v12, "presentable", v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4[2](v4, v13))
          {
            v14 = (id)BNLogPending;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              penderIdentifier = v5->_penderIdentifier;
              objc_msgSend(v12, "pendingIdentifier");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              BNEffectivePresentableDescription(v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v25;
              v35 = penderIdentifier;
              v36 = 2114;
              v37 = v16;
              v38 = 2114;
              v39 = v17;
              _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pulling presentable: (%{public}@) %{public}@", buf, 0x20u);

              v5 = v26;
            }

            -[NSMutableArray removeObject:](v5->_postingContextQueue, "removeObject:", v12);
            -[NSMapTable removeObjectForKey:](v5->_postingContextsToDequeuePromises, "removeObjectForKey:", v12);
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v10, "addObject:", v13);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "pendingIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "presentableQueue:didDequeuePresentableWithPendingIdentifier:", v5, v18);

            }
          }

        }
        v7 = obj;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v29);
    }
    else
    {
      v10 = 0;
    }

    v19 = (id)BNLogPending;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v5->_penderIdentifier;
      -[NSMutableArray bs_map:](v5->_postingContextQueue, "bs_map:", &__block_literal_global_15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2114;
      v37 = v21;
      _os_log_impl(&dword_1B9628000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Currently pended presentables: %{public}@", buf, 0x16u);

    }
    objc_sync_exit(v5);

  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v22 = v10;
  else
    v22 = (void *)MEMORY[0x1E0C9AA60];
  v23 = v22;

  return v23;
}

id __51__BNPresentableQueue__pullPresentablesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "pendingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BNEffectivePresentableDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@) %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pullPresentablesWithIdentification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__BNPresentableQueue_pullPresentablesWithIdentification___block_invoke;
  v8[3] = &unk_1E7044528;
  v9 = v4;
  v5 = v4;
  -[BNPresentableQueue _pullPresentablesPassingTest:](self, "_pullPresentablesPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __57__BNPresentableQueue_pullPresentablesWithIdentification___block_invoke(uint64_t a1, void *a2)
{
  return BNIsPresentableIdentifiedByIdentification(a2, *(void **)(a1 + 32), 0);
}

- (BOOL)isSuspended
{
  return -[BNSuspensionController isSuspended](self->_suspensionController, "isSuspended");
}

- (NSSet)activeSuspensionReasons
{
  return -[BNSuspensionController activeSuspensionReasons](self->_suspensionController, "activeSuspensionReasons");
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  BNSuspensionController *v7;
  BNSuspensionController *suspensionController;
  _BOOL4 v9;
  BNSuspensionController *v10;

  v4 = a3;
  v6 = a4;
  if (v6 && v4 && !self->_suspensionController)
  {
    v7 = objc_alloc_init(BNSuspensionController);
    suspensionController = self->_suspensionController;
    self->_suspensionController = v7;

    -[BNSuspensionController setIdentifier:](self->_suspensionController, "setIdentifier:", self->_penderIdentifier);
  }
  v9 = -[BNSuspensionController setSuspended:forReason:](self->_suspensionController, "setSuspended:forReason:", v4, v6);
  if (v9 && !-[BNSuspensionController isSuspended](self->_suspensionController, "isSuspended"))
  {
    v10 = self->_suspensionController;
    self->_suspensionController = 0;

  }
  return v9;
}

- (NSString)penderIdentifier
{
  return self->_penderIdentifier;
}

- (void)setPenderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BNPresentableQueueDelegate)delegate
{
  return (BNPresentableQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_penderIdentifier, 0);
  objc_storeStrong((id *)&self->_suspensionController, 0);
  objc_storeStrong((id *)&self->_postingContextsToDequeuePromises, 0);
  objc_storeStrong((id *)&self->_postingContextQueue, 0);
}

@end
