@implementation CalDistributedNotificationCenter

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_25);
  return (id)defaultCenter_center;
}

void __49__CalDistributedNotificationCenter_defaultCenter__block_invoke()
{
  CalDistributedNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(CalDistributedNotificationCenter);
  v1 = (void *)defaultCenter_center;
  defaultCenter_center = (uint64_t)v0;

}

- (CalDistributedNotificationCenter)init
{
  CalDistributedNotificationCenter *v2;
  uint64_t v3;
  NSMutableDictionary *handlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalDistributedNotificationCenter;
  v2 = -[CalDistributedNotificationCenter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  id v8;
  void *v9;
  CalDistributedNotificationHandler *v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a5;
  v8 = a3;
  +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CalDistributedNotificationHandler initWithObserver:selector:]([CalDistributedNotificationHandler alloc], "initWithObserver:selector:", v8, a4);
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  objc_msgSend(a1, "_addHandler:toObserver:", v10, v8);

  objc_msgSend(v9, "handlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, name);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter"), (CFNotificationCallback)_notificationCallback, name, 0, (CFNotificationSuspensionBehavior)0);
  }
  objc_msgSend(v12, "addObject:", v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
}

+ (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *context;
  void *v24;
  __CFNotificationCenter *center;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x194009F94]();
  center = CFNotificationCenterGetDarwinNotifyCenter();
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  objc_msgSend(a1, "_clearHandlersForObserver:", v4);
  v24 = v5;
  objc_msgSend(v5, "handlers");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(obj);
        v7 = *(const __CFString **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v8, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v15, "observer");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              if (v16)
                v17 = v16 == v4;
              else
                v17 = 1;
              if (v17)
                objc_msgSend(v9, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v12);
        }

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = v9;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v31;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v20);
        }

        if (!objc_msgSend(v8, "count"))
        {
          objc_msgSend(v29, "removeObjectForKey:", v7);
          CFNotificationCenterRemoveObserver(center, +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter"), v7, 0);
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v28);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
  objc_autoreleasePoolPop(context);

}

+ (void)removeObserver:(id)a3 name:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  __CFNotificationCenter *center;
  void *context;
  void *v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x194009F94]();
  center = CFNotificationCenterGetDarwinNotifyCenter();
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  v29 = v8;
  objc_msgSend(v8, "handlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v17, "observer", center, context);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
          v19 = v18 == v6;
        else
          v19 = 1;
        if (v19)
        {
          objc_msgSend(a1, "_removeHandler:fromObserver:", v17, v6);
          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v10, "removeObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), center);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(v10, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (!v26)
  {
    objc_msgSend(v9, "removeObjectForKey:", v30);
    CFNotificationCenterRemoveObserver(center, v29, v30, 0);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
  objc_autoreleasePoolPop(context);

}

+ (void)_handleNotification:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  +[CalDistributedNotificationCenter defaultCenter](CalDistributedNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  objc_msgSend(v4, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_13;
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v4, "handlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v3);

    goto LABEL_13;
  }
  if (!v7)
  {
LABEL_13:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v4, v3, 0);

    os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
    goto LABEL_14;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "handleNotification:", v3, (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

LABEL_14:
}

+ (void)_addHandler:(id)a3 toObserver:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  objc_getAssociatedObject(v5, &handlersForObserverKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, &handlersForObserverKey, v6, (void *)1);
  }
  objc_msgSend(v6, "addObject:", v7);

}

+ (void)_removeHandler:(id)a3 fromObserver:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  objc_getAssociatedObject(v6, &handlersForObserverKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removeObject:", v9);
    if (!objc_msgSend(v8, "count"))
      objc_msgSend(a1, "_clearHandlersForObserver:", v6);
  }

}

+ (void)_clearHandlersForObserver:(id)a3
{
  id object;

  object = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  objc_setAssociatedObject(object, &handlersForObserverKey, 0, (void *)1);

}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
