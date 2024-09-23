@implementation HDClientDataCollectionObservationStateMonitor

- (HDClientDataCollectionObservationStateMonitor)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDClientDataCollectionObservationStateMonitor)initWithClient:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HDClientDataCollectionObservationStateMonitor *v9;
  HDClientDataCollectionObservationStateMonitor *v10;
  void *v11;
  NSLock *v12;
  NSLock *lock;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDClientDataCollectionObservationStateMonitor;
  v9 = -[HDClientDataCollectionObservationStateMonitor init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_msgSend(v7, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_profile, v11);

    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v10->_lock;
    v10->_lock = v12;

    WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processStateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHealthStoreClient process](v10->_client, "process");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerObserver:forBundleIdentifier:", v10, v18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel_workoutManagerDidChangeState_, CFSTR("HDWorkoutManagerStateDidChange"), 0);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[HDClientDataCollectionObservationStateMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDClientDataCollectionObservationStateMonitor;
  -[HDClientDataCollectionObservationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  BOOL *p_invalidated;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  p_invalidated = &self->_invalidated;
  while (!__ldaxr((unsigned __int8 *)p_invalidated))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_invalidated))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "daemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processStateManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHealthStoreClient process](self->_client, "process");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unregisterObserver:forBundleIdentifier:", self, v9);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", self);

      return;
    }
  }
  __clrex();
}

- (id)currentObserverState
{
  void *v3;
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;

  -[HDHealthStoreClient process](self->_client, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processStateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isApplicationStateForegroundForBundleIdentifier:", v8);

  v10 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v10, "workoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentWorkoutClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "process");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {
    v21 = 1;
  }
  else
  {
    objc_msgSend(v3, "applicationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v27 = v16;
      v26 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v26, "workoutManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "currentWorkoutClient");
      v29 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "process");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "applicationIdentifier");
      v28 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "applicationIdentifier");
      v19 = v11;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqualToString:", v20);

      v11 = v19;
      v9 = v28;

      v10 = v29;
      v16 = v27;
    }
    else
    {
      v21 = 0;
    }

  }
  +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", v9 ^ 1u, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (uint64_t)_componentStateDidChange
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 8);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __73__HDClientDataCollectionObservationStateMonitor__componentStateDidChange__block_invoke;
    v2[3] = &unk_1E6CE80E8;
    v2[4] = result;
    return objc_msgSend(v1, "hk_withLock:", v2);
  }
  return result;
}

void __73__HDClientDataCollectionObservationStateMonitor__componentStateDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "dataCollectionObservationStateDidChangeForClient:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDClientDataCollectionObservationStateMonitorDelegate)delegate
{
  return (HDClientDataCollectionObservationStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
