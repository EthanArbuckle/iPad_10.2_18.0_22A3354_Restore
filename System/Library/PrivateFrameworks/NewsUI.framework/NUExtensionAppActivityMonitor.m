@implementation NUExtensionAppActivityMonitor

- (NUExtensionAppActivityMonitor)initWithNotificationCenter:(id)a3
{
  id v5;
  NUExtensionAppActivityMonitor *v6;
  uint64_t v7;
  NSHashTable *observers;
  NSMutableSet *v9;
  NSMutableSet *backgroundObserverBlocks;
  NSMutableSet *v11;
  NSMutableSet *foregroundObserverBlocks;
  NSMutableSet *v13;
  NSMutableSet *windowBackgroundObserverBlocks;
  NSMutableSet *v15;
  NSMutableSet *windowForegroundObserverBlocks;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUExtensionAppActivityMonitor;
  v6 = -[NUExtensionAppActivityMonitor init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    backgroundObserverBlocks = v6->_backgroundObserverBlocks;
    v6->_backgroundObserverBlocks = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    foregroundObserverBlocks = v6->_foregroundObserverBlocks;
    v6->_foregroundObserverBlocks = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    windowBackgroundObserverBlocks = v6->_windowBackgroundObserverBlocks;
    v6->_windowBackgroundObserverBlocks = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    windowForegroundObserverBlocks = v6->_windowForegroundObserverBlocks;
    v6->_windowForegroundObserverBlocks = v15;

    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    -[NSNotificationCenter addObserver:selector:name:object:](v6->_notificationCenter, "addObserver:selector:name:object:", v6, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x24BDD0C20], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v6->_notificationCenter, "addObserver:selector:name:object:", v6, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDD0C18], 0);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NUExtensionAppActivityMonitor notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NUExtensionAppActivityMonitor;
  -[NUExtensionAppActivityMonitor dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUExtensionAppActivityMonitor observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUExtensionAppActivityMonitor observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NUExtensionAppActivityMonitor foregroundObserverBlocks](self, "foregroundObserverBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NUExtensionAppActivityMonitor backgroundObserverBlocks](self, "backgroundObserverBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NUExtensionAppActivityMonitor windowBackgroundObserverBlocks](self, "windowBackgroundObserverBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x2199FC190](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NUExtensionAppActivityMonitor windowForegroundObserverBlocks](self, "windowForegroundObserverBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x2199FC190](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[NUExtensionAppActivityMonitor observers](self, "observers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "activityObservingApplicationDidBecomeActive");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v7);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NUExtensionAppActivityMonitor observers](self, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "activityObservingApplicationWillEnterForeground");
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v14);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NUExtensionAppActivityMonitor observers](self, "observers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v24, "activityObservingApplicationWindowDidBecomeForeground");
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v21);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NUExtensionAppActivityMonitor windowForegroundObserverBlocks](self, "windowForegroundObserverBlocks", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v30++) + 16))();
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v28);
  }

}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NUExtensionAppActivityMonitor observers](self, "observers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "activityObservingApplicationDidEnterBackground");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "activityObservingApplicationWindowDidBecomeBackground");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NUExtensionAppActivityMonitor windowBackgroundObserverBlocks](self, "windowBackgroundObserverBlocks", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 16))();
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableSet)foregroundObserverBlocks
{
  return self->_foregroundObserverBlocks;
}

- (NSMutableSet)backgroundObserverBlocks
{
  return self->_backgroundObserverBlocks;
}

- (NSMutableSet)windowForegroundObserverBlocks
{
  return self->_windowForegroundObserverBlocks;
}

- (NSMutableSet)windowBackgroundObserverBlocks
{
  return self->_windowBackgroundObserverBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowBackgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowForegroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_backgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_foregroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
