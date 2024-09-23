@implementation PHPhotoLibraryObserverRegistrar

- (void)registerFetchResult:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = v3;
    PLRunWithUnfairLock();

    v3 = v4;
  }

}

uint64_t __55__PHPhotoLibraryObserverRegistrar_registerFetchResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_lock_resumeChangeHandlingIfNeeded");
}

uint64_t __68__PHPhotoLibraryObserverRegistrar_addObservers_authorizationStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 36))
  {
    if ((unint64_t)(*(_QWORD *)(a1 + 48) - 3) > 1)
    {
      PLChangeHandlingGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 48) - 1;
        if (v4 > 3)
          v5 = CFSTR("not determined");
        else
          v5 = off_1E35D9C10[v4];
        v6 = v5;
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "_addObserver:authorizationStatus: waiting for authorization (%@)", buf, 0xCu);

      }
    }
    else
    {
      *(_BYTE *)(v2 + 36) = 1;
    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[PHPhotoLibraryObserverRegistrar _isInternalObserver:](PHPhotoLibraryObserverRegistrar, "_isInternalObserver:", v12, (_QWORD)v15))
        {
          v13 = 48;
        }
        else
        {
          v13 = 56;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_lock_resumeChangeHandlingIfNeeded");
}

- (void)_lock_resumeChangeHandlingIfNeeded
{
  NSObject *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _BOOL4 lock_isChangeHandlingActive;
  _BOOL4 lock_isChangeHandlingAuthorized;
  _BOOL4 v9;
  int v10;
  NSUInteger v11;
  __int16 v12;
  NSUInteger v13;
  __int16 v14;
  NSUInteger v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = -[NSHashTable count](self->_lock_internalChangeObservers, "count");
    v5 = -[NSHashTable count](self->_lock_externalChangeObservers, "count");
    v6 = -[NSHashTable count](self->_lock_fetchResults, "count");
    lock_isChangeHandlingActive = self->_lock_isChangeHandlingActive;
    lock_isChangeHandlingAuthorized = self->_lock_isChangeHandlingAuthorized;
    v10 = 134219008;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 1024;
    v17 = lock_isChangeHandlingActive;
    v18 = 1024;
    v19 = lock_isChangeHandlingAuthorized;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "_resumeChangeHandlingIfNeeded - internal: %tu external: %tu fetchResults: %tu isActive: %d authorized: %d", (uint8_t *)&v10, 0x2Cu);
  }

  if (!self->_lock_isChangeHandlingActive)
  {
    if (-[PHPhotoLibraryObserverRegistrar _lock_hasChangeObservers](self, "_lock_hasChangeObservers"))
    {
      if (self->_lock_isChangeHandlingAuthorized
        || (v9 = +[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:suppressPrompt:](PHPhotoLibrary, "checkAuthorizationStatusForAPIAccessLevel:suppressPrompt:", 2, 1), self->_lock_isChangeHandlingAuthorized = v9, v9))
      {
        -[PLPhotoLibraryBundle beginObservingChanges](self->_photoLibraryBundle, "beginObservingChanges");
        self->_lock_isChangeHandlingActive = 1;
        -[PHChangeHandlingDebugger changeHandlingActiveStateDidChange:](self->_changeHandlingDebugger, "changeHandlingActiveStateDidChange:", 1);
      }
    }
  }
}

- (BOOL)_lock_hasChangeObservers
{
  NSUInteger v3;
  NSUInteger v4;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = -[NSHashTable count](self->_lock_internalChangeObservers, "count");
  v4 = -[NSHashTable count](self->_lock_externalChangeObservers, "count") + v3;
  return v4
       + -[NSHashTable count](self->_lock_fetchResults, "count")
       + self->_lock_postsPersistentHistoryChangedNotifications != 0;
}

+ (BOOL)_isInternalObserver:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PHPhotoLibraryObserverRegistrar)initWithLibraryBundle:(id)a3 changeHandlingDebugger:(id)a4 uniqueObjectIDCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHPhotoLibraryObserverRegistrar *v12;
  PHPhotoLibraryObserverRegistrar *v13;
  uint64_t v14;
  NSHashTable *lock_fetchResults;
  uint64_t v16;
  NSHashTable *lock_internalChangeObservers;
  uint64_t v18;
  NSHashTable *lock_externalChangeObservers;
  NSObject *v20;
  uint64_t v21;
  PHPhotoLibraryObserverRegistrar *v22;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  PHPhotoLibraryObserverRegistrar *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PHPhotoLibraryObserverRegistrar;
  v12 = -[PHPhotoLibraryObserverRegistrar init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibraryBundle, a3);
    objc_storeStrong((id *)&v13->_changeHandlingDebugger, a4);
    objc_storeStrong((id *)&v13->_uniqueObjectIDCache, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v13->_lock_isChangeHandlingAuthorized = 0;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    lock_fetchResults = v13->_lock_fetchResults;
    v13->_lock_fetchResults = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    lock_internalChangeObservers = v13->_lock_internalChangeObservers;
    v13->_lock_internalChangeObservers = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    lock_externalChangeObservers = v13->_lock_externalChangeObservers;
    v13->_lock_externalChangeObservers = (NSHashTable *)v18;

    v13->_pendingLock._os_unfair_lock_opaque = 0;
    v13->_pendingLock_isChangeProcessingPending = 0;
    -[PHChangeHandlingDebugger changeHandlingActiveStateDidChange:](v13->_changeHandlingDebugger, "changeHandlingActiveStateDidChange:", v13->_lock_isChangeHandlingActive);
    PLPhotosObjectLifecycleGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138413314;
      v26 = v21;
      v27 = 2048;
      v28 = v13;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@ changeHandlingDebugger:%@ uniqueObjectIDCache:%@", buf, 0x34u);
    }

    v22 = v13;
  }

  return v13;
}

- (void)addObservers:(id)a3 authorizationStatus:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  PLRunWithUnfairLock();

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PHPhotoLibraryObserverRegistrar *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PHPhotoLibraryObserverRegistrar;
  -[PHPhotoLibraryObserverRegistrar dealloc](&v4, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3
{
  PLRunWithUnfairLock();
}

- (BOOL)postsPersistentHistoryChangedNotifications
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3
{
  PLRunWithUnfairLock();
}

- (BOOL)clearsOIDCacheAfterFetchResultDealloc
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)unregisterFetchResult:(id)a3
{
  if (a3)
    PLRunWithUnfairLock();
}

- (unint64_t)countOfRegisteredFetchResults
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)_lock_clearOIDCache
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSHashTable allObjects](self->_lock_fetchResults, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_36262);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NSHashTable count](self->_lock_fetchResults, "count");
  if (v6 == objc_msgSend(v5, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "fetchedObjectIDs", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PHUniqueObjectIDCache uniquedOIDs:](self->_uniqueObjectIDCache, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)getObserversWithBlock:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__36259;
  v20 = __Block_byref_object_dispose__36260;
  v21 = (id)MEMORY[0x1E0C9AA60];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__36259;
  v14 = __Block_byref_object_dispose__36260;
  v15 = (id)MEMORY[0x1E0C9AA60];
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__36259;
  v8 = __Block_byref_object_dispose__36260;
  v9 = (id)MEMORY[0x1E0C9AA60];
  PLRunWithUnfairLock();
  v3[2](v3, v17[5], v11[5], v5[5]);
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

}

- (void)_lock_pauseChangeHandlingIfNeeded
{
  NSObject *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _BOOL4 lock_isChangeHandlingActive;
  int v8;
  NSUInteger v9;
  __int16 v10;
  NSUInteger v11;
  __int16 v12;
  NSUInteger v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = -[NSHashTable count](self->_lock_internalChangeObservers, "count");
    v5 = -[NSHashTable count](self->_lock_externalChangeObservers, "count");
    v6 = -[NSHashTable count](self->_lock_fetchResults, "count");
    lock_isChangeHandlingActive = self->_lock_isChangeHandlingActive;
    v8 = 134218752;
    v9 = v4;
    v10 = 2048;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    v14 = 1024;
    v15 = lock_isChangeHandlingActive;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "_pauseChangeHandlingIfNeeded - internal: %tu external: %tu fetchResults: %tu isActive: %d", (uint8_t *)&v8, 0x26u);
  }

  if (self->_lock_isChangeHandlingActive
    && !-[PHPhotoLibraryObserverRegistrar _lock_hasChangeObservers](self, "_lock_hasChangeObservers"))
  {
    -[PLPhotoLibraryBundle endObservingChanges](self->_photoLibraryBundle, "endObservingChanges");
    self->_lock_isChangeHandlingActive = 0;
    -[PHChangeHandlingDebugger changeHandlingActiveStateDidChange:](self->_changeHandlingDebugger, "changeHandlingActiveStateDidChange:", 0);
  }
}

- (void)publishChangesToObserversOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke;
  v10[3] = &unk_1E35DE1D0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PHPhotoLibraryObserverRegistrar throttlePendingChangesWithBlock:](self, "throttlePendingChangesWithBlock:", v10);

}

- (void)throttlePendingChangesWithBlock:(id)a3
{
  void (**v3)(_QWORD, double);
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = (void (**)(_QWORD, double))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  if (!*((_BYTE *)v9 + 24))
    v3[2](v3, v5[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);

}

- (void)throttlePendingChangesTimerFiredWithBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[PHPhotoLibraryObserverRegistrar clearIsChangeProcessingPending](self, "clearIsChangeProcessingPending");
  v4[2]();

}

- (void)clearIsChangeProcessingPending
{
  PLRunWithUnfairLock();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_externalChangeObservers, 0);
  objc_storeStrong((id *)&self->_lock_internalChangeObservers, 0);
  objc_storeStrong((id *)&self->_lock_fetchResults, 0);
  objc_storeStrong((id *)&self->_uniqueObjectIDCache, 0);
  objc_storeStrong((id *)&self->_changeHandlingDebugger, 0);
  objc_storeStrong((id *)&self->_photoLibraryBundle, 0);
}

void __65__PHPhotoLibraryObserverRegistrar_clearIsChangeProcessingPending__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 68);
  *(_BYTE *)(v2 + 68) = 0;
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "processPendingChangesStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 68));
}

_QWORD *__67__PHPhotoLibraryObserverRegistrar_throttlePendingChangesWithBlock___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[4] + 68);
  *(_BYTE *)(result[4] + 68) = 1;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 72);
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 16), "processPendingChangesStateDidChange:", 1);
  return result;
}

void __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  int64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v3 = CFAbsoluteTimeGetCurrent() - a2;
  if (v3 <= 0.0)
    v4 = 0.3;
  else
    v4 = 0.3 - v3;
  v5 = v4 * 1000000000.0;
  v6 = v4 <= 0.0;
  v7 = 0.0;
  if (!v6)
    v7 = v5;
  v8 = (uint64_t)v7;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = dispatch_time(0, v8);
  v10 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke_2;
  block[3] = &unk_1E35DE1A8;
  objc_copyWeak(&v13, &location);
  v12 = *(id *)(a1 + 48);
  dispatch_after(v9, v10, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "throttlePendingChangesTimerFiredWithBlock:", *(_QWORD *)(a1 + 32));

}

void __57__PHPhotoLibraryObserverRegistrar_getObserversWithBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1[4] + 48), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 56), "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1[4] + 40), "allObjects");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __54__PHPhotoLibraryObserverRegistrar__lock_clearOIDCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preventsClearingOIDCache") ^ 1;
}

uint64_t __64__PHPhotoLibraryObserverRegistrar_countOfRegisteredFetchResults__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__PHPhotoLibraryObserverRegistrar_unregisterFetchResult___block_invoke(uint64_t a1)
{
  _BYTE *v2;

  NSHashRemove(*(NSHashTable **)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 40));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[39])
  {
    objc_msgSend(v2, "_lock_clearOIDCache");
    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "_lock_pauseChangeHandlingIfNeeded");
}

uint64_t __72__PHPhotoLibraryObserverRegistrar_clearsOIDCacheAfterFetchResultDealloc__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 39);
  return result;
}

uint64_t __76__PHPhotoLibraryObserverRegistrar_setClearsOIDCacheAfterFetchResultDealloc___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 39) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __77__PHPhotoLibraryObserverRegistrar_postsPersistentHistoryChangedNotifications__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 38);
  return result;
}

uint64_t __81__PHPhotoLibraryObserverRegistrar_setPostsPersistentHistoryChangedNotifications___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 38) != v2)
  {
    *(_BYTE *)(v1 + 38) = v2;
    v3 = *(_BYTE **)(result + 32);
    if (v3[38])
      return objc_msgSend(v3, "_lock_resumeChangeHandlingIfNeeded");
    else
      return objc_msgSend(v3, "_lock_pauseChangeHandlingIfNeeded");
  }
  return result;
}

uint64_t __50__PHPhotoLibraryObserverRegistrar_removeObserver___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = +[PHPhotoLibraryObserverRegistrar _isInternalObserver:](PHPhotoLibraryObserverRegistrar, "_isInternalObserver:", *(_QWORD *)(a1 + 32));
  v3 = 56;
  if (v2)
    v3 = 48;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + v3), "removeObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_lock_pauseChangeHandlingIfNeeded");
}

@end
