@implementation NTKDarwinNotificationCenter

void __44__NTKDarwinNotificationCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_instance;
  defaultCenter_instance = (uint64_t)v1;

}

- (void)setObserversByNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_observersByNotificationName, a3);
}

- (NSMutableDictionary)observersByNotificationName
{
  return self->_observersByNotificationName;
}

- (NTKDarwinNotificationCenter)init
{
  NTKDarwinNotificationCenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDarwinNotificationCenter;
  result = -[NTKDarwinNotificationCenter init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)addObserver:(id)a3 notificationName:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (v11 && v8)
  {
    -[NTKDarwinNotificationCenter _registerForNotificationName:](self, "_registerForNotificationName:", v8);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setNotificationName:", v8);
    objc_msgSend(v10, "setObserverObject:", v11);
    objc_msgSend(v10, "setBlock:", v9);
    -[NTKDarwinNotificationCenter _addObserver:](self, "_addObserver:", v10);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_registerForNotificationName:(id)a3
{
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

}

- (void)_addObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[NTKDarwinNotificationCenter setObserversByNotificationName:](self, "setObserversByNotificationName:", v5);

  }
  -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v8, "removeObject:", v11);
  objc_msgSend(v8, "addObject:", v11);

}

+ (id)defaultCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NTKDarwinNotificationCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, block);
  return (id)defaultCenter_instance;
}

+ (void)postNotification:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (void)addObserver:(id)a3 notificationName:(id)a4 selector:(SEL)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v10 && v8 && a5)
  {
    -[NTKDarwinNotificationCenter _registerForNotificationName:](self, "_registerForNotificationName:", v8);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setNotificationName:", v8);
    objc_msgSend(v9, "setObserverObject:", v10);
    objc_msgSend(v9, "setSelector:", a5);
    -[NTKDarwinNotificationCenter _addObserver:](self, "_addObserver:", v9);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    if (v7)
    {
      -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      obj = v11;
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v42;
LABEL_5:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
          objc_msgSend(v16, "observerObject");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17 == v6)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
            if (v13)
              goto LABEL_5;
            v11 = obj;
            goto LABEL_14;
          }
        }
        v11 = v16;

        if (!v11)
          goto LABEL_15;
        objc_msgSend(obj, "removeObject:", v11);
      }
LABEL_14:

LABEL_15:
      -[NTKDarwinNotificationCenter _unregisterForNotificationNameIfNeeded:](self, "_unregisterForNotificationNameIfNeeded:", v7);
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v19;
      v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v22 = (void *)objc_msgSend(v21, "copy");
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v34 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                  objc_msgSend(v27, "observerObject");
                  v28 = (id)objc_claimAutoreleasedReturnValue();

                  if (v28 == v6)
                  {
                    objc_msgSend(v21, "removeObject:", v27);
                    objc_msgSend(v27, "notificationName");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NTKDarwinNotificationCenter _unregisterForNotificationNameIfNeeded:](self, "_unregisterForNotificationNameIfNeeded:", v29);

                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
              }
              while (v24);
            }

          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v32);
        p_lock = &self->_lock;
        v7 = 0;
      }
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)handleDarwinNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_msgSend(v13, "observerObject", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "block");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v13, "block");
            v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v16[2]();
LABEL_9:

            goto LABEL_11;
          }
          v17 = objc_msgSend(v13, "selector");
          if (v17)
          {
            v18 = v17;
            objc_msgSend(v13, "observerObject");
            v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
              ((void (*)(void (**)(void), uint64_t))objc_msgSend(v16, "methodForSelector:", v18))(v16, v18);
            goto LABEL_9;
          }
        }
        else
        {
          os_unfair_lock_lock(&self->_lock);
          objc_msgSend(v6, "removeObject:", v13);
          -[NTKDarwinNotificationCenter _unregisterForNotificationNameIfNeeded:](self, "_unregisterForNotificationNameIfNeeded:", v4);
          os_unfair_lock_unlock(&self->_lock);
        }
LABEL_11:
        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v10 = v19;
    }
    while (v19);
  }

}

- (void)_unregisterForNotificationNameIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  -[NTKDarwinNotificationCenter observersByNotificationName](self, "observersByNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, name, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByNotificationName, 0);
}

@end
