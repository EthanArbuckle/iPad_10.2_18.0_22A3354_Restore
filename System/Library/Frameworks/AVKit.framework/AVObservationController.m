@implementation AVObservationController

- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 includeChanges:(BOOL)a6 observationHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AVProxyKVOObserver *v17;
  void *v18;
  BOOL v19;
  void *v20;
  AVProxyKVOObserver *v21;
  uint64_t v22;
  id v23;
  id v24;
  _BOOL8 v25;
  id v26;
  AVProxyKVOObserver *v27;
  void *v28;
  id v30;
  _BOOL4 v31;
  _QWORD v32[5];
  AVProxyKVOObserver *v33;
  uint64_t *v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  BOOL v39;
  id location;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id WeakRetained;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  kdebug_trace();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4448;
  v47 = __Block_byref_object_dispose__4449;
  WeakRetained = objc_loadWeakRetained(&self->_owner);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__4448;
  v41[4] = __Block_byref_object_dispose__4449;
  v15 = v12;
  v16 = v15;
  v17 = 0;
  v42 = v15;
  v18 = (void *)v44[5];
  if (v18)
    v19 = v15 == 0;
  else
    v19 = 1;
  if (!v19)
  {
    v31 = v9;
    objc_initWeak(&location, v18);
    v30 = v14;
    v20 = (void *)objc_msgSend(v14, "copy");
    v21 = [AVProxyKVOObserver alloc];
    v22 = v44[5];
    v23 = objc_loadWeakRetained(&self->_owner);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke;
    v36[3] = &unk_1E5BB1228;
    objc_copyWeak(&v38, &location);
    v39 = v8;
    v24 = v20;
    v25 = v8;
    v26 = v24;
    v37 = v24;
    v27 = -[AVProxyKVOObserver initWithObservedObject:observer:keyPaths:retainingObservedObject:includeInitialValue:includeChanges:changesBlock:](v21, "initWithObservedObject:observer:keyPaths:retainingObservedObject:includeInitialValue:includeChanges:changesBlock:", v16, v22, v13, v23 != v16, v31, v25, v36);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_3;
    v32[3] = &unk_1E5BB1250;
    v32[4] = self;
    v17 = v27;
    v33 = v17;
    v34 = &v43;
    v35 = v41;
    -[AVProxyKVOObserver startObserving:completion:](v17, "startObserving:completion:", v16, v32);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    v14 = v30;
  }
  kdebug_trace();
  -[AVProxyKVOObserver token](v17, "token");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  return v28;
}

void __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  objc_msgSend(v2, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  AVKeyValueChange *v18;
  _QWORD v19[4];
  id v20;
  AVKeyValueChange *v21;
  id v22;
  id v23;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v17 = WeakRetained;
  if (v11 && WeakRetained && (!v14 || v13 != v14 || !*(_BYTE *)(a1 + 48)))
  {
    v18 = -[AVKeyValueChange initWithValue:oldValue:keyPath:observationToken:]([AVKeyValueChange alloc], "initWithValue:oldValue:keyPath:observationToken:", v13, v14, v12, v15);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_2;
      v19[3] = &unk_1E5BB1200;
      objc_copyWeak(&v23, (id *)(a1 + 40));
      v22 = *(id *)(a1 + 32);
      v20 = v11;
      v21 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], v19);

      objc_destroyWeak(&v23);
    }

  }
}

- (void)startObservingNotificationForName:(id)a3 object:(id)a4 notificationCenter:(id)a5 observationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  id location;
  id to;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationObservers, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_unfairLock);
  if (!v14)
  {
    v15 = (void *)objc_msgSend(v13, "copy");

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_copyWeak(&to, &self->_owner);
    objc_initWeak(&location, v11);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke;
    v20 = &unk_1E5BB12A0;
    objc_copyWeak(&v22, &to);
    objc_copyWeak(&v23, &location);
    v24 = v11 == 0;
    v13 = v15;
    v21 = v13;
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v10, v11, 0, &v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_unfairLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_notificationObservers, "setObject:forKeyedSubscript:", v16, v10, v17, v18, v19, v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_notificationCenters, "setObject:forKeyedSubscript:", v12, v10);
    os_unfair_lock_unlock(&self->_unfairLock);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak(&to);
  }

}

void __70__AVObservationController_startObserving_keyPaths_observationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (AVObservationController)initWithOwner:(id)a3
{
  id v4;
  AVObservationController *v5;
  AVObservationController *v6;
  uint64_t v7;
  NSMutableDictionary *proxyObserversByTokens;
  uint64_t v9;
  NSMutableDictionary *notificationObservers;
  uint64_t v11;
  NSMutableDictionary *notificationCenters;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVObservationController;
  v5 = -[AVObservationController init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_unfairLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    proxyObserversByTokens = v6->_proxyObserversByTokens;
    v6->_proxyObserversByTokens = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    notificationObservers = v6->_notificationObservers;
    v6->_notificationObservers = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    notificationCenters = v6->_notificationCenters;
    v6->_notificationCenters = (NSMutableDictionary *)v11;

    objc_storeWeak(&v6->_owner, v4);
  }

  return v6;
}

- (id)startObserving:(id)a3 keyPath:(id)a4 observationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVObservationController startObserving:keyPaths:observationHandler:](self, "startObserving:keyPaths:observationHandler:", v11, v12, v9, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)startObserving:(id)a3 keyPath:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v6 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVObservationController startObserving:keyPaths:includeInitialValue:observationHandler:](self, "startObserving:keyPaths:includeInitialValue:observationHandler:", v13, v14, v6, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6
{
  return -[AVObservationController startObserving:keyPaths:includeInitialValue:includeChanges:observationHandler:](self, "startObserving:keyPaths:includeInitialValue:includeChanges:observationHandler:", a3, a4, a5, 1, a6);
}

- (id)startObserving:(id)a3 keyPaths:(id)a4 observationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id to;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_copyWeak(&to, &self->_owner);
  v11 = (void *)objc_msgSend(v10, "copy");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__AVObservationController_startObserving_keyPaths_observationHandler___block_invoke;
  v15[3] = &unk_1E5BB1278;
  objc_copyWeak(&v17, &to);
  v12 = v11;
  v16 = v12;
  -[AVObservationController startObserving:keyPaths:includeInitialValue:includeChanges:observationHandler:](self, "startObserving:keyPaths:includeInitialValue:includeChanges:observationHandler:", v8, v9, 0, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&to);

  return v13;
}

void __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 64))
      v4 = 0;
    else
      v4 = WeakRetained == 0;
    if (!v4)
    {
      v5 = WeakRetained;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v3 = v5;
    }
  }

}

void __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = v5;
  if (WeakRetained && (*(_BYTE *)(a1 + 56) || v5))
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB37C0]);
      objc_msgSend(v3, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithName:object:userInfo:", v8, v9, v10);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke_2;
      block[3] = &unk_1E5BB26B0;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      v15 = WeakRetained;
      v19 = *(_BYTE *)(a1 + 56);
      v12 = *(id *)(a1 + 32);
      v16 = v11;
      v17 = v12;
      v13 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v18);
    }
  }

}

- (void)stopAllObservation
{
  os_unfair_lock_s *p_unfairLock;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[AVObservationController _stopAllObservation](self, "_stopAllObservation");
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)_stopAllObservation
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_proxyObserversByTokens, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_proxyObserversByTokens, "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "stopObserving");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_notificationObservers, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationCenters, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationObservers, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObserver:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeAllObjects](self->_notificationObservers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_notificationCenters, "removeAllObjects");

}

void __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  os_unfair_lock_s *p_unfairLock;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v4 = -[NSMutableDictionary count](self->_proxyObserversByTokens, "count");
  if (v4 | -[NSMutableDictionary count](self->_notificationObservers, "count"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "You must call -[AVObservationController stopAllObservation] before destroying it, perhaps in its owner's dealloc. %@", buf, 0xCu);

    }
    -[AVObservationController _stopAllObservation](self, "_stopAllObservation");
  }
  os_unfair_lock_unlock(p_unfairLock);
  v7.receiver = self;
  v7.super_class = (Class)AVObservationController;
  -[AVObservationController dealloc](&v7, sel_dealloc);
}

- (void)stopObserving:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_unfairLock = &self->_unfairLock;
    v5 = a3;
    os_unfair_lock_lock(p_unfairLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_proxyObserversByTokens, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopObserving");

    -[NSMutableDictionary removeObjectForKey:](self->_proxyObserversByTokens, "removeObjectForKey:", v5);
    os_unfair_lock_unlock(p_unfairLock);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_notificationCenters, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_proxyObserversByTokens, 0);
}

@end
