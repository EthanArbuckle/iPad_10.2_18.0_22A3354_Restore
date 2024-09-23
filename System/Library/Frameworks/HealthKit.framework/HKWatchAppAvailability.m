@implementation HKWatchAppAvailability

- (HKWatchAppAvailability)initWithBundleID:(id)a3
{
  id v5;
  HKWatchAppAvailability *v6;
  HKWatchAppAvailability *v7;
  HKObserverSet *v8;
  uint64_t v9;
  HKWatchAppAvailabilityObserver *observers;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWatchAppAvailability;
  v6 = -[HKWatchAppAvailability init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_installState = -1;
    v8 = [HKObserverSet alloc];
    v9 = -[HKObserverSet initWithName:loggingCategory:](v8, "initWithName:loggingCategory:", CFSTR("AppAvailabilityObservers"), HKLogDefault);
    observers = v7->_observers;
    v7->_observers = (HKWatchAppAvailabilityObserver *)v9;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKWatchAppAvailability query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObserver:", 0);

  v4.receiver = self;
  v4.super_class = (Class)HKWatchAppAvailability;
  -[HKWatchAppAvailability dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKWatchAppAvailabilityObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HKWatchAppAvailabilityObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)appInstallStateOnWatch:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18[2];
  id location[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a3;
  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v9 = (void *)getASDAppQueryClass_softClass;
  v23 = getASDAppQueryClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getASDAppQueryClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __getASDAppQueryClass_block_invoke;
    location[3] = &unk_1E37E8690;
    location[4] = &v20;
    __getASDAppQueryClass_block_invoke((uint64_t)location);
    v9 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v11, "queryForSystemAppsOnPairedDevice:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWatchAppAvailability setQuery:](self, "setQuery:", v12);

  -[HKWatchAppAvailability query](self, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObserver:", self);

  objc_initWeak(location, self);
  -[HKWatchAppAvailability query](self, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__HKWatchAppAvailability_appInstallStateOnWatch_completion___block_invoke;
  v16[3] = &unk_1E37F3098;
  objc_copyWeak(v18, location);
  v15 = v8;
  v17 = v15;
  v18[1] = (id)a2;
  objc_msgSend(v14, "executeQueryWithResultHandler:", v16);

  objc_destroyWeak(v18);
  objc_destroyWeak(location);

}

void __60__HKWatchAppAvailability_appInstallStateOnWatch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, _QWORD);
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("%@ deallocated"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 3, v12);
LABEL_17:

    goto LABEL_18;
  }
  if (!v6
    || (objc_msgSend(WeakRetained, "_test_apps"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    objc_msgSend(v8, "_test_apps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "_test_apps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "findApplicationIn:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "findApplicationIn:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v12)
    {
      if ((objc_msgSend(v12, "isInstalled") & 1) != 0)
      {
        v14 = 2;
      }
      else
      {
        objc_msgSend(v12, "progress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v23 != 0;

      }
      objc_msgSend(v8, "setInstallState:", v14);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void (**)(uint64_t, uint64_t, _QWORD))(v20 + 16);
      v22 = v14;
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(const char **)(a1 + 48);
        v17 = v15;
        NSStringFromSelector(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v8;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v19;
        _os_log_impl(&dword_19A0E6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Application (%{public}@) was not found on watch", buf, 0x20u);

      }
      objc_msgSend(v8, "setInstallState:", 0);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void (**)(uint64_t, uint64_t, _QWORD))(v20 + 16);
      v22 = 0;
    }
    v21(v20, v22, 0);
    goto LABEL_17;
  }
  _HKInitializeLogging();
  v24 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
  {
    v25 = *(const char **)(a1 + 48);
    v26 = v24;
    NSStringFromSelector(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v8;
    v31 = 2114;
    v32 = v27;
    v33 = 2114;
    v34 = v28;
    v35 = 2114;
    v36 = v6;
    _os_log_error_impl(&dword_19A0E6000, v26, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to fetch install state for application (%{public}@) with error: %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v8, "setInstallState:", 3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_18:

}

- (id)findApplicationIn:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  -[HKWatchAppAvailability bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("bundleID == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HKWatchAppAvailabilityObserver *observers;
  void *v20;
  void *v21;
  HKWatchAppAvailabilityObserver *v22;
  NSObject *v23;
  void *v24;
  HKWatchAppAvailabilityObserver *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[6];
  uint8_t buf[4];
  HKWatchAppAvailability *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HKWatchAppAvailability query](self, "query");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[HKWatchAppAvailability _test_apps](self, "_test_apps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HKWatchAppAvailability _test_apps](self, "_test_apps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKWatchAppAvailability findApplicationIn:](self, "findApplicationIn:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HKWatchAppAvailability findApplicationIn:](self, "findApplicationIn:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v12)
    {
      if ((objc_msgSend(v12, "isInstalled") & 1) != 0)
      {
        v13 = 2;
      }
      else
      {
        objc_msgSend(v12, "progress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18 != 0;

      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKWatchAppAvailability bundleID](self, "bundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = self;
        v31 = 2114;
        v32 = v16;
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Application (%{public}@) was not found on watch", buf, 0x20u);

      }
      v13 = 0;
    }
    if (-[HKWatchAppAvailability installState](self, "installState") == v13)
    {
      if (v13 == 1)
      {
        observers = self->_observers;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke_2;
        v26[3] = &unk_1E37F30E8;
        v26[4] = self;
        v27 = v12;
        -[HKWatchAppAvailabilityObserver notifyObservers:](observers, "notifyObservers:", v26);

      }
    }
    else
    {
      -[HKWatchAppAvailability setInstallState:](self, "setInstallState:", v13);
      _HKInitializeLogging();
      v20 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = self->_observers;
        v23 = v20;
        objc_msgSend(v21, "numberWithUnsignedInteger:", -[HKWatchAppAvailabilityObserver count](v22, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);

      }
      v25 = self->_observers;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke;
      v28[3] = &unk_1E37F30C0;
      v28[4] = self;
      v28[5] = v13;
      -[HKWatchAppAvailabilityObserver notifyObservers:](v25, "notifyObservers:", v28);
    }

  }
}

uint64_t __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "watchAppAvailability:appInstallStateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fractionCompleted");
    objc_msgSend(v3, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "watchAppAvailability:appInstallProgressDidUpdate:", v4, v6);

  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (ASDAppQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSArray)_test_apps
{
  return self->__test_apps;
}

- (void)set_test_apps:(id)a3
{
  objc_storeStrong((id *)&self->__test_apps, a3);
}

- (HKWatchAppAvailabilityObserver)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(int64_t)a3
{
  self->_installState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->__test_apps, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
