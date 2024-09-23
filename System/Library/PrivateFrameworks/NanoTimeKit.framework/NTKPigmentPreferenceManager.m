@implementation NTKPigmentPreferenceManager

- (void)setSelectedPigments:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  NSSet *v6;
  NSSet *selectedPigments;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  v6 = (NSSet *)objc_msgSend(v5, "copy");

  selectedPigments = self->_selectedPigments;
  self->_selectedPigments = v6;

  pthread_rwlock_unlock(p_rwlock);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAutoSelectedPigments:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  NSSet *v6;
  NSSet *autoSelectedPigments;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  v6 = (NSSet *)objc_msgSend(v5, "copy");

  autoSelectedPigments = self->_autoSelectedPigments;
  self->_autoSelectedPigments = v6;

  pthread_rwlock_unlock(p_rwlock);
}

- (NTKPigmentPreferenceManager)init
{
  return -[NTKPigmentPreferenceManager initWithDomain:](self, "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
}

- (NTKPigmentPreferenceManager)initWithDomain:(id)a3
{
  id v5;
  NTKPigmentPreferenceManager *v6;
  NTKPigmentPreferenceManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *privateQueue;
  id v10;
  void *v11;
  uint64_t v12;
  NSUserDefaults *userDefault;
  id v14;
  void *v15;
  uint64_t v16;
  NPSDomainAccessor *npsDomainAccessor;
  NSObject *v18;
  NSSet *selectedPigments;
  NSObject *v20;
  NSSet *autoSelectedPigments;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;
  uint8_t buf[4];
  NSSet *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NTKPigmentPreferenceManager;
  v6 = -[NTKPigmentPreferenceManager init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domain, a3);
    v8 = dispatch_queue_create("com.apple.nanotimekit.NTKPigmentPreferenceManager", 0);
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = (OS_dispatch_queue *)v8;

    pthread_rwlock_init(&v7->_rwlock, 0);
    v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
    -[NTKPigmentPreferenceManager domain](v7, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithSuiteName:", v11);
    userDefault = v7->_userDefault;
    v7->_userDefault = (NSUserDefaults *)v12;

    v14 = objc_alloc(MEMORY[0x1E0D51610]);
    -[NTKPigmentPreferenceManager domain](v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithDomain:", v15);
    npsDomainAccessor = v7->_npsDomainAccessor;
    v7->_npsDomainAccessor = (NPSDomainAccessor *)v16;

    -[NTKPigmentPreferenceManager _loadVisibleOptions](v7, "_loadVisibleOptions");
    -[NTKPigmentPreferenceManager _loadAutoSelectedPigments](v7, "_loadAutoSelectedPigments");
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      selectedPigments = v7->_selectedPigments;
      *(_DWORD *)buf = 138543362;
      v36 = selectedPigments;
      _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_INFO, "#pref-sync Initializing with visible options: %{public}@", buf, 0xCu);
    }

    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      autoSelectedPigments = v7->_autoSelectedPigments;
      *(_DWORD *)buf = 138543362;
      v36 = autoSelectedPigments;
      _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_INFO, "#pref-sync Initializing with auto-selected pigments: %{public}@", buf, 0xCu);
    }

    v22 = CLKIsClockFaceApp();
    v23 = MEMORY[0x1E0C809B0];
    if ((v22 & 1) != 0 || CLKIsBridge())
    {
      objc_initWeak((id *)buf, v7);
      +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v23;
      v32[1] = 3221225472;
      v32[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke;
      v32[3] = &unk_1E6BCD7F0;
      objc_copyWeak(&v33, (id *)buf);
      objc_msgSend(v24, "addObserver:notificationName:usingBlock:", v7, CFSTR("com.apple.NanoTimeKit.NPS.NTKSelectedPigmentListDidChangeNotification"), v32);

      +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_21;
      v30[3] = &unk_1E6BCD7F0;
      objc_copyWeak(&v31, (id *)buf);
      objc_msgSend(v25, "addObserver:notificationName:usingBlock:", v7, CFSTR("com.apple.NanoTimeKit.NPS.NTKAutoSelectedPigmentListDidChangeNotification"), v30);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    if (CLKIsClockFaceApp())
    {
      objc_initWeak((id *)buf, v7);
      +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v23;
      v28[1] = 3221225472;
      v28[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_23;
      v28[3] = &unk_1E6BCD7F0;
      objc_copyWeak(&v29, (id *)buf);
      objc_msgSend(v26, "addObserver:notificationName:usingBlock:", v7, *MEMORY[0x1E0D51620], v28);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

  return v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)_loadVisibleOptions
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  v4 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
  -[NPSDomainAccessor objectForKey:](self->_npsDomainAccessor, "objectForKey:", CFSTR("SelectedPigmentList"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  v5 = v8;
  if (!v8 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5 = v8, (isKindOfClass & 1) == 0))
  {

    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPreferenceManager setSelectedPigments:](self, "setSelectedPigments:", v7);

}

- (void)_loadAutoSelectedPigments
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  v4 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
  -[NPSDomainAccessor objectForKey:](self->_npsDomainAccessor, "objectForKey:", CFSTR("AutoSelectedPigmentList"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  v5 = v8;
  if (!v8 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5 = v8, (isKindOfClass & 1) == 0))
  {

    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPreferenceManager setAutoSelectedPigments:](self, "setAutoSelectedPigments:", v7);

}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)NTKPigmentPreferenceManager;
  -[NTKPigmentPreferenceManager dealloc](&v3, sel_dealloc);
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = CFSTR("com.apple.NanoTimeKit.NPS.NTKSelectedPigmentListDidChangeNotification");
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync received darwin notification %{public}@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "privateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_19;
    block[3] = &unk_1E6BCD5F0;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadVisibleOptions");
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedPigments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Visible options after handling darwin notification: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pigmentPreferenceManagerDidUpdateSelectedColors:", *(_QWORD *)(a1 + 32));

}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = CFSTR("com.apple.NanoTimeKit.NPS.NTKAutoSelectedPigmentListDidChangeNotification");
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync received darwin notification %{public}@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "privateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_22;
    block[3] = &unk_1E6BCD5F0;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadAutoSelectedPigments");
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "autoSelectedPigments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigments after handling darwin notification: %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  char *WeakRetained;
  char *v4;
  __int16 v5[8];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Received darwin notification initial sync completed. Forcing sync.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(WeakRetained + 8));
    objc_msgSend(v4, "_threadunsafe_syncAllContent");
    pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 8));
  }

}

- (NSSet)selectedPigments
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  v4 = (void *)-[NSSet copy](self->_selectedPigments, "copy");
  pthread_rwlock_unlock(p_rwlock);
  return (NSSet *)v4;
}

- (NSSet)autoSelectedPigments
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  v4 = (void *)-[NSSet copy](self->_autoSelectedPigments, "copy");
  pthread_rwlock_unlock(p_rwlock);
  return (NSSet *)v4;
}

- (BOOL)isOptionVisible:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_rwlock;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isAddable"))
  {
    p_rwlock = &self->_rwlock;
    pthread_rwlock_rdlock(&self->_rwlock);
    v6 = -[NTKPigmentPreferenceManager _threadunsafe_isOptionVisible:](self, "_threadunsafe_isOptionVisible:", v4);
    pthread_rwlock_unlock(p_rwlock);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setOption:(id)a3 visible:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  objc_msgSend(v7, "fullname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPreferenceManager _threadunsafe_setOptionName:visible:](self, "_threadunsafe_setOptionName:visible:", v6, v4);

  -[NTKPigmentPreferenceManager _threadunsafe_syncAllContent](self, "_threadunsafe_syncAllContent");
  pthread_rwlock_unlock(&self->_rwlock);

}

- (void)setAutoSelectedPigments:(id)a3 forCollectionName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSSet *selectedPigments;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  NTKPigmentPreferenceManager *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  NSSet *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  pthread_rwlock_wrlock(&self->_rwlock);
  v7 = (void *)objc_opt_class();
  -[NTKPigmentPreferenceManager userDefault](self, "userDefault");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_shouldSaveAutoSelectedPigments:forCollectionName:userDefault:", v31, v6, v8);

  if ((_DWORD)v7)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "#pref-sync Starting auto-selection for domain: %{public}@", buf, 0xCu);
    }

    -[NTKPigmentPreferenceManager userDefault](self, "userDefault");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("DefaultSelectedPigmentsByDomain"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v30, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "count"))
    {
      v13 = (void *)-[NSSet copy](self->_autoSelectedPigments, "copy");
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __73__NTKPigmentPreferenceManager_setAutoSelectedPigments_forCollectionName___block_invoke;
      v36[3] = &unk_1E6BCF4C8;
      v37 = v28;
      v38 = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v36);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v31;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "fullname", v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          if (!-[NTKPigmentPreferenceManager _threadunsafe_isOptionVisible:](self, "_threadunsafe_isOptionVisible:", v20))objc_msgSend(v14, "addObject:", v20);
          objc_msgSend(v20, "fullname");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKPigmentPreferenceManager _threadunsafe_setOptionName:visible:manual:](self, "_threadunsafe_setOptionName:visible:manual:", v22, 1, 0);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v17);
    }

    v23 = (void *)objc_msgSend(v30, "mutableCopy");
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, v6, v28);
    -[NTKPigmentPreferenceManager userDefault](self, "userDefault");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v23, CFSTR("DefaultSelectedPigmentsByDomain"));

    -[NTKPigmentPreferenceManager userDefault](self, "userDefault");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "synchronize");

    -[NTKPigmentPreferenceManager _threadunsafe_appendAutoSelectPigments:](self, "_threadunsafe_appendAutoSelectPigments:", v14);
    -[NTKPigmentPreferenceManager _threadunsafe_syncAllContent](self, "_threadunsafe_syncAllContent");
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      selectedPigments = self->_selectedPigments;
      *(_DWORD *)buf = 138543618;
      v40 = v6;
      v41 = 2114;
      v42 = selectedPigments;
      _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "#pref-sync Finished auto-selection for domain: %{public}@ - selections: %{public}@", buf, 0x16u);
    }

  }
  pthread_rwlock_unlock(&self->_rwlock);

}

void __73__NTKPigmentPreferenceManager_setAutoSelectedPigments_forCollectionName___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "_threadunsafe_setOptionName:visible:manual:", v3, 0, 1);

}

- (void)_threadunsafe_syncAllContent
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if ((NPSHasCompletedInitialSync() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#pref-sync Trying to sync preferences, but NPS has not completed initial sync yet", v6, 2u);
    }

  }
  v4 = (void *)-[NSSet copy](self->_autoSelectedPigments, "copy");
  -[NTKPigmentPreferenceManager _threadunsafe_syncAutoSelectedPigments:](self, "_threadunsafe_syncAutoSelectedPigments:", v4);

  v5 = (void *)-[NSSet copy](self->_selectedPigments, "copy");
  -[NTKPigmentPreferenceManager _threadunsafe_syncVisibleOptionsByCollection:](self, "_threadunsafe_syncVisibleOptionsByCollection:", v5);

}

- (void)resetContent
{
  id obj;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  obj = (id)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_wrlock(&self->_rwlock);
  -[NTKPigmentPreferenceManager _threadunsafe_removeAllAutoSelectPigments](self, "_threadunsafe_removeAllAutoSelectPigments");
  objc_storeStrong((id *)&self->_selectedPigments, obj);
  pthread_rwlock_unlock(&self->_rwlock);
  -[NTKPigmentPreferenceManager _threadunsafe_syncVisibleOptionsByCollection:](self, "_threadunsafe_syncVisibleOptionsByCollection:", obj);

}

- (void)handlePairedDeviceChanged
{
  NSObject *v3;
  id v4;
  void *v5;
  NPSDomainAccessor *v6;
  NPSDomainAccessor *npsDomainAccessor;
  uint8_t v8[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#pref-sync Recreating domain accessor because paired device changed", v8, 2u);
  }

  pthread_rwlock_wrlock(&self->_rwlock);
  v4 = objc_alloc(MEMORY[0x1E0D51610]);
  -[NTKPigmentPreferenceManager domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NPSDomainAccessor *)objc_msgSend(v4, "initWithDomain:", v5);
  npsDomainAccessor = self->_npsDomainAccessor;
  self->_npsDomainAccessor = v6;

  pthread_rwlock_unlock(&self->_rwlock);
}

- (BOOL)_threadunsafe_isOptionVisible:(id)a3
{
  id v4;
  NSSet *selectedPigments;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isAddable"))
  {
    selectedPigments = self->_selectedPigments;
    objc_msgSend(v4, "fullname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSSet containsObject:](selectedPigments, "containsObject:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4
{
  -[NTKPigmentPreferenceManager _threadunsafe_setOptionName:visible:manual:](self, "_threadunsafe_setOptionName:visible:manual:", a3, a4, 1);
}

- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4 manual:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  NSSet *v9;
  NSSet *selectedPigments;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  v8 = (void *)-[NSSet mutableCopy](self->_selectedPigments, "mutableCopy");
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
    objc_msgSend(v8, "addObject:", v11);
  else
    objc_msgSend(v8, "removeObject:", v11);
  v9 = (NSSet *)objc_msgSend(v8, "copy");
  selectedPigments = self->_selectedPigments;
  self->_selectedPigments = v9;

  if (v5)
    -[NTKPigmentPreferenceManager _threadunsafe_removeAutoSelectionWithOptionName:](self, "_threadunsafe_removeAutoSelectionWithOptionName:", v11);

}

+ (BOOL)_shouldSaveAutoSelectedPigments:(id)a3 forCollectionName:(id)a4 userDefault:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "identifier", (_QWORD)v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("AutoSelectionIdentifiersByDomain"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20
      && (objc_msgSend(v20, "objectForKeyedSubscript:", v8),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "isEqualToNumber:", v19),
          v22,
          (v23 & 1) != 0))
    {
      v11 = 0;
    }
    else
    {
      v24 = (void *)objc_msgSend(v21, "mutableCopy", (_QWORD)v26);
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v8);
      objc_msgSend(v10, "setObject:forKey:", v24, CFSTR("AutoSelectionIdentifiersByDomain"));

      v11 = 1;
    }

  }
  return v11;
}

- (void)_threadunsafe_removeAutoSelectionWithOptionName:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *autoSelectedPigments;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSSet containsObject:](self->_autoSelectedPigments, "containsObject:", v4))
  {
    v5 = (void *)-[NSSet mutableCopy](self->_autoSelectedPigments, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v4);
    v6 = (NSSet *)objc_msgSend(v5, "copy");
    autoSelectedPigments = self->_autoSelectedPigments;
    self->_autoSelectedPigments = v6;

    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigment removed: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_threadunsafe_appendAutoSelectPigments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSSet *v13;
  NSSet *autoSelectedPigments;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)-[NSSet mutableCopy](self->_autoSelectedPigments, "mutableCopy");
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "fullname", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }

    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigments added: %{public}@ Synchronizing.", buf, 0xCu);
    }

    v13 = (NSSet *)objc_msgSend(v5, "copy");
    autoSelectedPigments = self->_autoSelectedPigments;
    self->_autoSelectedPigments = v13;

  }
}

- (void)_threadunsafe_removeAllAutoSelectPigments
{
  NSSet *v3;
  NSSet *autoSelectedPigments;
  NSSet *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  autoSelectedPigments = self->_autoSelectedPigments;
  self->_autoSelectedPigments = v3;
  v5 = v3;

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "#pref-sync Removed all auto-selected pigments.", v7, 2u);
  }

  -[NTKPigmentPreferenceManager _threadunsafe_syncAutoSelectedPigments:](self, "_threadunsafe_syncAutoSelectedPigments:", v5);
}

- (void)_threadunsafe_syncAutoSelectedPigments:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NTKPigmentPreferenceManager privateQueue](self, "privateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NTKPigmentPreferenceManager__threadunsafe_syncAutoSelectedPigments___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__NTKPigmentPreferenceManager__threadunsafe_syncAutoSelectedPigments___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("AutoSelectedPigmentList"));

  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = CFSTR("AutoSelectedPigmentList");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeNanoDomain:keys:cloudEnabled:", v9, v12, 1);

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_INFO, "#pref-sync Synchronizing auto-selected pigments: %{public}@", (uint8_t *)&v15, 0xCu);
  }

}

- (void)_threadunsafe_syncVisibleOptionsByCollection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NTKPigmentPreferenceManager privateQueue](self, "privateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__NTKPigmentPreferenceManager__threadunsafe_syncVisibleOptionsByCollection___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __76__NTKPigmentPreferenceManager__threadunsafe_syncVisibleOptionsByCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("SelectedPigmentList"));

  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "npsDomainAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = CFSTR("SelectedPigmentList");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeNanoDomain:keys:cloudEnabled:", v9, v12, 1);

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "#pref-sync Pigment preferences changed. Synchronizing.", (uint8_t *)&v16, 2u);
  }

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_INFO, "#pref-sync Visible options: %{public}@", (uint8_t *)&v16, 0xCu);
  }

}

- (NTKPigmentPreferenceManagerDelegate)delegate
{
  return (NTKPigmentPreferenceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSUserDefaults)userDefault
{
  return self->_userDefault;
}

- (void)setUserDefault:(id)a3
{
  objc_storeStrong((id *)&self->_userDefault, a3);
}

- (NPSDomainAccessor)npsDomainAccessor
{
  return self->_npsDomainAccessor;
}

- (void)setNpsDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_npsDomainAccessor, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_userDefault, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPigments, 0);
  objc_storeStrong((id *)&self->_autoSelectedPigments, 0);
}

- (void)setAutoSelectedPigments:(uint64_t)a1 forCollectionName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#pref-sync setAutoSelectedPigments triggered exception: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
