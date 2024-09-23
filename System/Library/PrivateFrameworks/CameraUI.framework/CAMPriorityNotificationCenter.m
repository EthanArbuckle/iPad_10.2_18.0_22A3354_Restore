@implementation CAMPriorityNotificationCenter

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_14);
  return (id)defaultCenter_defaultCenter;
}

void __46__CAMPriorityNotificationCenter_defaultCenter__block_invoke()
{
  CAMPriorityNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(CAMPriorityNotificationCenter);
  v1 = (void *)defaultCenter_defaultCenter;
  defaultCenter_defaultCenter = (uint64_t)v0;

}

- (CAMPriorityNotificationCenter)init
{
  CAMPriorityNotificationCenter *v2;
  uint64_t v3;
  NSNotificationCenter *notificationCenter;
  NSMutableDictionary *v5;
  NSMutableDictionary *observersByNameHighPriority;
  NSMutableDictionary *v7;
  NSMutableDictionary *observersByNameNormalPriority;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *mutexQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMPriorityNotificationCenter;
  v2 = -[CAMPriorityNotificationCenter init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->__notificationCenter;
    v2->__notificationCenter = (NSNotificationCenter *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByNameHighPriority = v2->__observersByNameHighPriority;
    v2->__observersByNameHighPriority = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByNameNormalPriority = v2->__observersByNameNormalPriority;
    v2->__observersByNameNormalPriority = v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.camera.priority-notification-center.mutex-queue", v9);
    mutexQueue = v2->__mutexQueue;
    v2->__mutexQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  -[CAMPriorityNotificationCenter addObserver:priority:selector:name:object:](self, "addObserver:priority:selector:name:object:", a3, 1, a4, a5, a6);
}

- (void)addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  SEL v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CAMPriorityNotificationCenter_addObserver_priority_selector_name_object___block_invoke;
  block[3] = &unk_1EA32B5D8;
  block[4] = self;
  v20 = v12;
  v23 = a4;
  v24 = a5;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_sync(v15, block);

}

- (NSMutableDictionary)_observersByNameHighPriority
{
  return self->__observersByNameHighPriority;
}

- (NSMutableDictionary)_observersByNameNormalPriority
{
  return self->__observersByNameNormalPriority;
}

- (id)_entriesByName:(id)a3 forPriority:(unint64_t)a4 creatingEmptyIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a3;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[CAMPriorityNotificationCenter _observersForPriority:](self, "_observersForPriority:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11 && v5)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "setValue:forKey:", v11, v8);
  }

  return v11;
}

- (id)_observersForPriority:(unint64_t)a3
{
  NSObject *v5;
  void *v6;

  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3 == 1)
  {
    -[CAMPriorityNotificationCenter _observersByNameNormalPriority](self, "_observersByNameNormalPriority");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    -[CAMPriorityNotificationCenter _observersByNameHighPriority](self, "_observersByNameHighPriority");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSNotificationCenter)_notificationCenter
{
  return self->__notificationCenter;
}

- (void)_notificationReceiver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  CAMPriorityNotificationCenter *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0B55E8]();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CAMPriorityNotificationCenter _notificationReceiver:].cold.3(v4, v7);

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__7;
  v44 = __Block_byref_object_dispose__7;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  v39 = 0;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __55__CAMPriorityNotificationCenter__notificationReceiver___block_invoke;
  v29 = &unk_1EA32B5B0;
  v32 = &v40;
  v30 = self;
  v9 = v6;
  v31 = v9;
  v33 = &v34;
  dispatch_sync(v8, &v26);

  if (objc_msgSend((id)v41[5], "count", v26, v27, v28, v29, v30))
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CAMPriorityNotificationCenter _notificationReceiver:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

    -[CAMPriorityNotificationCenter _postNotification:forEntries:](self, "_postNotification:forEntries:", v4, v41[5]);
  }
  if (objc_msgSend((id)v35[5], "count"))
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CAMPriorityNotificationCenter _notificationReceiver:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    -[CAMPriorityNotificationCenter _postNotification:forEntries:](self, "_postNotification:forEntries:", v4, v35[5]);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  objc_autoreleasePoolPop(v5);
}

- (void)_postNotification:(id)a3 forEntries:(id)a4
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  void (*v24)(NSObject *, uint64_t, id);
  _BOOL4 v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  __int128 v35;
  id v36;
  id v37;
  id obj;
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v42;
    *(_QWORD *)&v6 = 138544130;
    v35 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v9, "observer", v35);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v10);

        v11 = objc_msgSend(v9, "selector");
        objc_msgSend(v9, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12
          || (objc_msgSend(v39, "object"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = v12 == v13,
              v13,
              v14))
        {
          v21 = objc_loadWeakRetained(&location);
          v22 = objc_opt_respondsToSelector();

          if ((v22 & 1) != 0)
          {
            v23 = objc_loadWeakRetained(&location);
            v24 = (void (*)(NSObject *, uint64_t, id))objc_msgSend(v23, "methodForSelector:", v11);

            v15 = os_log_create("com.apple.camera", "Camera");
            v25 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v25)
              {
                objc_msgSend(v39, "name");
                v37 = (id)objc_claimAutoreleasedReturnValue();
                v29 = objc_loadWeakRetained(&location);
                v30 = (void *)objc_opt_class();
                v36 = v30;
                v31 = objc_loadWeakRetained(&location);
                *(_DWORD *)buf = v35;
                v46 = v37;
                v47 = 2114;
                v48 = v30;
                v49 = 2048;
                v50 = v31;
                v51 = 2048;
                v52 = v12;
                _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Forwarding notification %{public}@ to <%{public}@: %p>/%p", buf, 0x2Au);

              }
              v15 = objc_loadWeakRetained(&location);
              v24(v15, v11, v39);
            }
            else if (v25)
            {
              v32 = objc_loadWeakRetained(&location);
              v33 = (id)objc_opt_class();
              objc_msgSend(v39, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v33;
              v47 = 2114;
              v48 = v34;
              _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Observer %{public}@ has an invalid selector for receiving notifications for %{public}@!", buf, 0x16u);

            }
          }
          else
          {
            v15 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v26 = objc_loadWeakRetained(&location);
              v27 = (id)objc_opt_class();
              objc_msgSend(v39, "name");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v27;
              v47 = 2114;
              v48 = v28;
              _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Observer %{public}@ does not have a compatible selector for receiving notifications for %{public}@!", buf, 0x16u);

            }
          }
        }
        else
        {
          v15 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v39, "name");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = objc_loadWeakRetained(&location);
            v18 = (id)objc_opt_class();
            v19 = objc_loadWeakRetained(&location);
            objc_msgSend(v39, "object");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v46 = v16;
            v47 = 2114;
            v48 = v18;
            v49 = 2048;
            v50 = v19;
            v51 = 2048;
            v52 = v12;
            v53 = 2048;
            v54 = v20;
            _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Not forwarding notification %{public}@ to <%{public}@: %p>/%p because notification object %p did not match", buf, 0x34u);

          }
        }

        objc_destroyWeak(&location);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->__notificationCenter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CAMPriorityNotificationCenter;
  -[CAMPriorityNotificationCenter dealloc](&v3, sel_dealloc);
}

void __55__CAMPriorityNotificationCenter__notificationReceiver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_entriesByName:forPriority:creatingEmptyIfNeeded:", *(_QWORD *)(a1 + 40), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_entriesByName:forPriority:creatingEmptyIfNeeded:", *(_QWORD *)(a1 + 40), 1, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __75__CAMPriorityNotificationCenter_addObserver_priority_selector_name_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutexQueue_addObserver:priority:selector:name:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_mutexQueue_addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  CAMPriorityNotificationCenterEntry *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;

  v12 = a6;
  v13 = a7;
  v14 = a3;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  -[CAMPriorityNotificationCenter _observersByNameHighPriority](self, "_observersByNameHighPriority");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    -[CAMPriorityNotificationCenter _observersByNameNormalPriority](self, "_observersByNameNormalPriority");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20 == 0;

  }
  -[CAMPriorityNotificationCenter _entriesByName:forPriority:creatingEmptyIfNeeded:](self, "_entriesByName:forPriority:creatingEmptyIfNeeded:", v12, a4, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CAMPriorityNotificationCenterEntry initWithObserver:selector:object:]([CAMPriorityNotificationCenterEntry alloc], "initWithObserver:selector:object:", v14, a5, v13);

  objc_msgSend(v21, "addObject:", v22);
  if (v18)
  {
    v23 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[CAMPriorityNotificationCenter _mutexQueue_addObserver:priority:selector:name:object:].cold.1((uint64_t)v12, v23, v24);

    -[CAMPriorityNotificationCenter _notificationCenter](self, "_notificationCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__notificationReceiver_, v12, 0);

  }
}

- (void)_removeObserver:(id)a3 fromObserversByName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v23 = v7;
  objc_msgSend(v7, "allKeys");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "observer");
              v19 = (id)objc_claimAutoreleasedReturnValue();

              if (v19 == v6)
                objc_msgSend(v12, "addIndex:", v16 + j);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            v16 += j;
          }
          while (v15);
        }

        objc_msgSend(v13, "removeObjectsAtIndexes:", v12);
        if (!objc_msgSend(v13, "count"))
          objc_msgSend(v23, "removeObjectForKey:", v10);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

}

- (id)_allSubscriptions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CAMPriorityNotificationCenter _observersByNameHighPriority](self, "_observersByNameHighPriority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPriorityNotificationCenter _observersByNameNormalPriority](self, "_observersByNameNormalPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  objc_msgSend(v10, "unionSet:", v9);

  return v10;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CAMPriorityNotificationCenter_removeObserver___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __48__CAMPriorityNotificationCenter_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutexQueue_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_mutexQueue_removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMPriorityNotificationCenter _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CAMPriorityNotificationCenter _allSubscriptions](self, "_allSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPriorityNotificationCenter _observersByNameHighPriority](self, "_observersByNameHighPriority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPriorityNotificationCenter _removeObserver:fromObserversByName:](self, "_removeObserver:fromObserversByName:", v4, v7);

  -[CAMPriorityNotificationCenter _observersByNameNormalPriority](self, "_observersByNameNormalPriority");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  -[CAMPriorityNotificationCenter _removeObserver:fromObserversByName:](self, "_removeObserver:fromObserversByName:", v4, v8);

  -[CAMPriorityNotificationCenter _allSubscriptions](self, "_allSubscriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:");
  v9 = v6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v14;
          _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Unsubscribing from notification %{public}@", buf, 0xCu);
        }

        -[CAMPriorityNotificationCenter _notificationCenter](self, "_notificationCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObserver:name:object:", self, v14, 0);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutexQueue, 0);
  objc_storeStrong((id *)&self->__observersByNameNormalPriority, 0);
  objc_storeStrong((id *)&self->__observersByNameHighPriority, 0);
  objc_storeStrong((id *)&self->__notificationCenter, 0);
}

- (void)_notificationReceiver:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, a1, a3, "Forwarding notification to normal priority receivers...", a5, a6, a7, a8, 0);
}

- (void)_notificationReceiver:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, a1, a3, "Forwarding notification to high priority receivers...", a5, a6, a7, a8, 0);
}

- (void)_notificationReceiver:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, a2, v4, "Received notification: %{public}@", (uint8_t *)&v5);

}

- (void)_mutexQueue_addObserver:(uint64_t)a3 priority:selector:name:object:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, a2, a3, "Subscribing to notification %{public}@", (uint8_t *)&v3);
}

@end
