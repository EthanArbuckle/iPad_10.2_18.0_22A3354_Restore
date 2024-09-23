@implementation MTGCDTaskScheduler

- (void)_scheduleTask:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  double v13;
  double v14;
  id v15;
  _QWORD *v16;
  void (*v17)(_QWORD *, _QWORD *);
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  MTGCDTaskScheduler *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "delay");
  v9 = v8;
  MTLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 <= 0.0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ executing %{public}@ immediately", buf, 0x16u);
    }

    objc_msgSend(v6, "completableBlock");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke;
    v21[3] = &unk_1E39CC398;
    v22 = v7;
    v17 = (void (*)(_QWORD *, _QWORD *))v16[2];
    v12 = v7;
    v17(v16, v21);

    v15 = v22;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
    }

    v12 = (id)objc_opt_new();
    objc_msgSend(v6, "delay");
    v14 = v13;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_12;
    v18[3] = &unk_1E39CB880;
    v19 = v6;
    v20 = v7;
    v15 = v7;
    objc_msgSend(v12, "startTimer:block:", v18, v14);

  }
}

uint64_t __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_12(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "completableBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_2;
  v3[3] = &unk_1E39CC398;
  v4 = *(id *)(a1 + 40);
  ((void (**)(_QWORD, _QWORD *))v2)[2](v2, v3);

}

uint64_t __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scheduleTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  MTGCDTaskScheduler *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
  }

  MTLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opening transaction for %{public}@", buf, 0x16u);
  }

  v7 = (void *)os_transaction_create();
  objc_initWeak((id *)buf, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__MTGCDTaskScheduler_scheduleTask___block_invoke;
  v9[3] = &unk_1E39CDC30;
  objc_copyWeak(&v11, (id *)buf);
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[MTGCDTaskScheduler _scheduleTask:withCompletion:](self, "_scheduleTask:withCompletion:", v4, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __35__MTGCDTaskScheduler_scheduleTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  MTLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543618;
    v6 = v4;
    v7 = 2114;
    v8 = WeakRetained;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ closing transaction for %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)scheduleTaskGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  MTGCDTaskScheduler *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  MTLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      v33 = 2114;
      v34 = v4;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
    }

    v9 = (uint64_t)dispatch_group_create();
    MTLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      v33 = 2114;
      v34 = v4;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ opening transaction for %{public}@", buf, 0x16u);
    }

    v19 = (void *)os_transaction_create();
    v20 = v4;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "tasks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16);
          dispatch_group_enter((dispatch_group_t)v9);
          v24[0] = v13;
          v24[1] = 3221225472;
          v24[2] = __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke;
          v24[3] = &unk_1E39CB858;
          v25 = (id)v9;
          -[MTGCDTaskScheduler _scheduleTask:withCompletion:](self, "_scheduleTask:withCompletion:", v17, v24);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke_2;
    block[3] = &unk_1E39CB828;
    block[4] = self;
    v4 = v20;
    v22 = v20;
    v23 = v19;
    v18 = v19;
    dispatch_group_notify((dispatch_group_t)v9, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      v33 = 2114;
      v34 = v4;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ has no tasks", buf, 0x16u);
    }

    objc_msgSend(v4, "completionBlock");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v9 + 16))();
  }

}

void __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(void);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ completed", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "completionBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

  MTLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ closing transaction for %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

@end
