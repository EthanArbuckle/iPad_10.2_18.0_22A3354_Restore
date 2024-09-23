@implementation HDAgeGatingManager

- (HDAgeGatingManager)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  HDAgeGatingManager *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CB7508]);
  HKCreateSerialDispatchQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDAgeGatingManager initWithProfile:userDefaults:queue:](self, "initWithProfile:userDefaults:queue:", v5, v7, v8);

  return v9;
}

- (HDAgeGatingManager)initWithProfile:(id)a3 userDefaults:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDAgeGatingManager *v12;
  id WeakRetained;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDAgeGatingManager;
  v12 = -[HDAgeGatingManager init](&v16, sel_init);
  if (v12)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("HDAgeGatingManager.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    }
    objc_storeWeak((id *)&v12->_profile, v9);
    objc_storeStrong((id *)&v12->_userDefaults, a4);
    objc_storeStrong((id *)&v12->_queue, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v12, 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self)
  {
    if (notify_is_valid_token(self->_significantTimeChangeNotificationToken))
      notify_cancel(self->_significantTimeChangeNotificationToken);
    if (notify_is_valid_token(self->_userCharacteristicsDidChangeNotificationToken))
      notify_cancel(self->_userCharacteristicsDidChangeNotificationToken);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)HDAgeGatingManager;
  -[HDAgeGatingManager dealloc](&v4, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  NSObject *queue;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17[2];
  uint64_t handler;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22[2];
  id location;

  if (self)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_opt_class();
    queue = self->_queue;
    v6 = MEMORY[0x1E0C809B0];
    handler = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __47__HDAgeGatingManager__registerForNotifications__block_invoke;
    v21 = &unk_1E6CEEC58;
    v22[1] = v4;
    objc_copyWeak(v22, &location);
    notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotificationToken, queue, &handler);
    v7 = (const char *)*MEMORY[0x1E0CB77F0];
    v8 = self->_queue;
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __47__HDAgeGatingManager__registerForNotifications__block_invoke_200;
    v16[3] = &unk_1E6CEEC58;
    v17[1] = v4;
    objc_copyWeak(v17, &location);
    notify_register_dispatch(v7, &self->_userCharacteristicsDidChangeNotificationToken, v8, v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_didReceiveDayChangeNotification_, *MEMORY[0x1E0C99690], 0);

    objc_destroyWeak(v17);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "-[HDAgeGatingManager _updateAgeGatingViaMaintenanceWorkCoordinator]", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_queue;
    handler = v6;
    v19 = 3221225472;
    v20 = __67__HDAgeGatingManager__updateAgeGatingViaMaintenanceWorkCoordinator__block_invoke;
    v21 = &unk_1E6CE80E8;
    v22[0] = self;
    +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v10, v11, &handler);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "maintenanceWorkCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueMaintenanceOperation:", v12);

  }
}

- (void)didReceiveDayChangeNotification:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2082;
    v9 = "-[HDAgeGatingManager didReceiveDayChangeNotification:]";
    v5 = v7;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] received day change notification", (uint8_t *)&v6, 0x16u);

  }
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)self);
}

- (void)_updateAgeGatingOnQueue
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HDAgeGatingManager__updateAgeGatingOnQueue__block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)unitTesting_updateAgeGates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HDAgeGatingManager_unitTesting_updateAgeGates__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __48__HDAgeGatingManager_unitTesting_updateAgeGates__block_invoke(uint64_t a1)
{
  -[HDAgeGatingManager _queue_updateAgeGating](*(_QWORD *)(a1 + 32));
}

- (void)_queue_updateAgeGating
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BOOL8 v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[4];
  void *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  _BOOL4 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  void *v63;
  _QWORD v64[11];
  _QWORD v65[14];

  v65[11] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v45 = 0;
    objc_msgSend((id)a1, "ageInYearsWithError:", &v45);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v45;
    v4 = v3;
    v44 = v2;
    if (v2 || !v3)
    {
      v42 = v3;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeProtectedDataObserver:", a1);

      v13 = v2;
      v64[0] = *MEMORY[0x1E0CB7520];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB76C0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v14;
      v64[1] = *MEMORY[0x1E0CB7528];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB7780]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v43;
      v64[2] = *MEMORY[0x1E0CB7518];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB7568]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v41;
      v64[3] = *MEMORY[0x1E0CB51F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB75C8]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] = v40;
      v64[4] = *MEMORY[0x1E0CB5200];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB7788]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v65[4] = v39;
      v64[5] = *MEMORY[0x1E0CB7538];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB77C8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v65[5] = v15;
      v64[6] = *MEMORY[0x1E0CB7540];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB77D0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v65[6] = v16;
      v64[7] = *MEMORY[0x1E0CB7510];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB74F8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v65[7] = v17;
      v64[8] = *MEMORY[0x1E0CB7548];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB77F8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v65[8] = v18;
      v64[9] = *MEMORY[0x1E0CB7530];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB77A8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v65[9] = v19;
      v64[10] = *MEMORY[0x1E0CB5210];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB7840]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v65[10] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v47 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v22, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              v29 = objc_msgSend(v13, "integerValue");
              v30 = v29 < objc_msgSend(v28, "integerValue");
            }
            else
            {
              v30 = 0;
            }
            objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", v30, v27);
            _HKInitializeLogging();
            HKLogInfrastructure();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = (void *)objc_opt_class();
              *(_DWORD *)v50 = 138544130;
              v51 = v32;
              v52 = 2082;
              v53 = "-[HDAgeGatingManager _updateUserDefaultsWithAge:]";
              v54 = 2114;
              v55 = v27;
              v56 = 1026;
              v57 = v30;
              v33 = v32;
              _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] %{public}@ age gating enabled: %{public}d", v50, 0x26u);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
        }
        while (v24);
      }

      _HKInitializeLogging();
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v59 = v34;
        v60 = 2082;
        v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
        v35 = v34;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] processed", buf, 0x16u);

      }
      v4 = v42;
    }
    else
    {
      v5 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          v8 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v59 = v8;
          v60 = 2082;
          v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
          v9 = v8;
          _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] Protected data not accessible. Adding observer.", buf, 0x16u);

        }
        v6 = objc_loadWeakRetained((id *)(a1 + 8));
        -[NSObject database](v6, "database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addProtectedDataObserver:", a1);

      }
      else if (v7)
      {
        v36 = (void *)objc_opt_class();
        v37 = v36;
        objc_msgSend(v4, "localizedDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v36;
        v60 = 2082;
        v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
        v62 = 2114;
        v63 = v38;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] While fetching date of birth components, received error: %{public}@", buf, 0x20u);

      }
    }

  }
}

- (id)ageInYearsWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "userCharacteristicForType:error:", v5, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (v10)
  {
    v11 = 0;
    if (self && v8)
    {
      v12 = (void *)MEMORY[0x1E0C99D48];
      v13 = v8;
      objc_msgSend(v12, "hk_gregorianCalendarWithLocalTimeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_dateOfBirthDateComponentsWithDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "components:fromDateComponents:toDateComponents:options:", 4, v13, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "year"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a3)
  {
    v11 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v11 = 0;
  }

  return v11;
}

void __67__HDAgeGatingManager__updateAgeGatingViaMaintenanceWorkCoordinator__block_invoke(uint64_t a1)
{
  -[HDAgeGatingManager _queue_updateAgeGating](*(_QWORD *)(a1 + 32));
}

void __45__HDAgeGatingManager__updateAgeGatingOnQueue__block_invoke(uint64_t a1)
{
  -[HDAgeGatingManager _queue_updateAgeGating](*(_QWORD *)(a1 + 32));
}

void __47__HDAgeGatingManager__registerForNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to significant time change.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)WeakRetained);

}

void __47__HDAgeGatingManager__registerForNotifications__block_invoke_200(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to user characteristics change.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)WeakRetained);

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
    -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
