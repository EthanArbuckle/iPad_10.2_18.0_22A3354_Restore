@implementation NUApplicationAppActivityMonitorMacOS

- (NUApplicationAppActivityMonitorMacOS)initWithNotificationCenter:(id)a3 windowBecameFrontmostNotificationName:(id)a4 windowLostFrontmostNotificationName:(id)a5
{
  id v7;
  id v8;
  NUApplicationAppActivityMonitorMacOS *v9;
  uint64_t v10;
  NSHashTable *observers;
  NSMutableSet *v12;
  NSMutableSet *backgroundObserverBlocks;
  NSMutableSet *v14;
  NSMutableSet *foregroundObserverBlocks;
  NSMutableSet *v16;
  NSMutableSet *windowBackgroundObserverBlocks;
  NSMutableSet *v18;
  NSMutableSet *windowForegroundObserverBlocks;
  objc_super v21;

  v7 = a4;
  v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NUApplicationAppActivityMonitorMacOS;
  v9 = -[NUApplicationAppActivityMonitorMacOS init](&v21, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    backgroundObserverBlocks = v9->_backgroundObserverBlocks;
    v9->_backgroundObserverBlocks = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    foregroundObserverBlocks = v9->_foregroundObserverBlocks;
    v9->_foregroundObserverBlocks = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    windowBackgroundObserverBlocks = v9->_windowBackgroundObserverBlocks;
    v9->_windowBackgroundObserverBlocks = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    windowForegroundObserverBlocks = v9->_windowForegroundObserverBlocks;
    v9->_windowForegroundObserverBlocks = v18;

    -[NSNotificationCenter addObserver:selector:name:object:](v9->_notificationCenter, "addObserver:selector:name:object:", v9, sel__applicationWillTerminate, *MEMORY[0x24BDF75E0], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v9->_notificationCenter, "addObserver:selector:name:object:", v9, sel__markWindowAsForeground, v7, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v9->_notificationCenter, "addObserver:selector:name:object:", v9, sel__markWindowAsBackground, v8, 0);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NUApplicationAppActivityMonitorMacOS notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NUApplicationAppActivityMonitorMacOS;
  -[NUApplicationAppActivityMonitorMacOS dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)sceneDidEnterBackground
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[NUApplicationAppActivityMonitorMacOS _markWindowAsBackground](self, "_markWindowAsBackground");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NUApplicationAppActivityMonitorMacOS backgroundObserverBlocks](self, "backgroundObserverBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "activityObservingApplicationDidEnterBackground");
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

- (void)sceneDidEnterBackgroundWithSceneID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NUApplicationAppActivityMonitorMacOS _markWindowAsBackground](self, "_markWindowAsBackground");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NUApplicationAppActivityMonitorMacOS backgroundObserverBlocks](self, "backgroundObserverBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++) + 16))();
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
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "activityObservingApplicationDidEnterBackgroundWithSceneID:", v4);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)sceneDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NUApplicationAppActivityMonitorMacOS *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = self;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "activityObservingApplicationDidBecomeActiveWithURL:sourceApplication:sceneID:", v8, v9, v10);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if (-[NUApplicationAppActivityMonitorMacOS isBecomingActive](v18, "isBecomingActive"))
  {
    -[NUApplicationAppActivityMonitorMacOS setBecomingActive:](v18, "setBecomingActive:", 0);
    -[NUApplicationAppActivityMonitorMacOS _markWindowAsForeground](v18, "_markWindowAsForeground");
  }

}

- (void)sceneDidBecomeActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationDidBecomeActive");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (-[NUApplicationAppActivityMonitorMacOS isBecomingActive](self, "isBecomingActive"))
  {
    -[NUApplicationAppActivityMonitorMacOS setBecomingActive:](self, "setBecomingActive:", 0);
    -[NUApplicationAppActivityMonitorMacOS _markWindowAsForeground](self, "_markWindowAsForeground");
  }
}

- (void)sceneWillEnterForeground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "activityObservingApplicationWillEnterForeground");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NUApplicationAppActivityMonitorMacOS foregroundObserverBlocks](self, "foregroundObserverBlocks", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  -[NUApplicationAppActivityMonitorMacOS setBecomingActive:](self, "setBecomingActive:", 1);
}

- (void)sceneWillConnect
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "activityObservingApplicationDidFinishLaunching");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)sceneWillResignActiveWithSceneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "activityObservingApplicationWillResignActiveWithSceneID:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NUApplicationAppActivityMonitorMacOS foregroundObserverBlocks](self, "foregroundObserverBlocks");
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
    -[NUApplicationAppActivityMonitorMacOS backgroundObserverBlocks](self, "backgroundObserverBlocks");
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
    -[NUApplicationAppActivityMonitorMacOS windowBackgroundObserverBlocks](self, "windowBackgroundObserverBlocks");
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
    -[NUApplicationAppActivityMonitorMacOS windowForegroundObserverBlocks](self, "windowForegroundObserverBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x2199FC190](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)_markWindowAsForeground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!-[NUApplicationAppActivityMonitorMacOS isWindowForeground](self, "isWindowForeground")
    && !-[NUApplicationAppActivityMonitorMacOS isBecomingActive](self, "isBecomingActive"))
  {
    -[NUApplicationAppActivityMonitorMacOS setWindowIsForeground:](self, "setWindowIsForeground:", 1);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v32;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "activityObservingApplicationWindowWillBecomeForeground");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v6);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "activityObservingApplicationWindowDidBecomeForeground");
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v13);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NUApplicationAppActivityMonitorMacOS windowForegroundObserverBlocks](self, "windowForegroundObserverBlocks", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++) + 16))();
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v20);
    }

  }
}

- (void)_markWindowAsBackground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[NUApplicationAppActivityMonitorMacOS isWindowForeground](self, "isWindowForeground"))
  {
    -[NUApplicationAppActivityMonitorMacOS setWindowIsForeground:](self, "setWindowIsForeground:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NUApplicationAppActivityMonitorMacOS observers](self, "observers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "activityObservingApplicationWindowDidBecomeBackground");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v6);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NUApplicationAppActivityMonitorMacOS windowBackgroundObserverBlocks](self, "windowBackgroundObserverBlocks", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (void)_applicationWillTerminate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NUApplicationAppActivityMonitorMacOS observers](self, "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "activityObservingApplicationWillTerminate");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
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

- (NSString)windowBecameFrontmostNotificationName
{
  return self->_windowBecameFrontmostNotificationName;
}

- (NSString)windowLostFrontmostNotificationName
{
  return self->_windowLostFrontmostNotificationName;
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

- (BOOL)isWindowForeground
{
  return self->_windowIsForeground;
}

- (void)setWindowIsForeground:(BOOL)a3
{
  self->_windowIsForeground = a3;
}

- (BOOL)isBecomingActive
{
  return self->_becomingActive;
}

- (void)setBecomingActive:(BOOL)a3
{
  self->_becomingActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowBackgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowForegroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_backgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_foregroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowLostFrontmostNotificationName, 0);
  objc_storeStrong((id *)&self->_windowBecameFrontmostNotificationName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
