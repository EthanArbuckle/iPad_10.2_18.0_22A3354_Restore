@implementation DSMotionStateListenerProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_proxy;
}

void __44__DSMotionStateListenerProxy_sharedInstance__block_invoke()
{
  DSMotionStateListenerProxy *v0;
  void *v1;

  v0 = objc_alloc_init(DSMotionStateListenerProxy);
  v1 = (void *)sharedInstance_proxy;
  sharedInstance_proxy = (uint64_t)v0;

}

- (DSMotionStateListenerProxy)init
{
  DSMotionStateListenerProxy *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  NSHashTable *pendingObservers;
  DSClientMotionDataOptions *v7;
  DSClientMotionDataOptions *options;
  NSError *error;
  NSData *cachedData;
  DSProviderDevice *cachedProvider;
  NSDate *previousIntervalStartTime;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DSMotionStateListenerProxy;
  v2 = -[DSListener initWithDispatchQueue:](&v14, sel_initWithDispatchQueue_, 0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingObservers = v2->_pendingObservers;
    v2->_pendingObservers = (NSHashTable *)v5;

    v2->_listenerState = 255;
    v7 = objc_alloc_init(DSClientMotionDataOptions);
    options = v2->_options;
    v2->_options = v7;

    -[DSClientMotionDataOptions setDataSubType:](v2->_options, "setDataSubType:", 1);
    -[DSClientMotionDataOptions setDeviceType:](v2->_options, "setDeviceType:", 1);
    error = v2->_error;
    v2->_error = 0;

    cachedData = v2->_cachedData;
    v2->_cachedData = 0;

    cachedProvider = v2->_cachedProvider;
    v2->_cachedProvider = 0;

    v2->_listenerCount = 0;
    previousIntervalStartTime = v2->_previousIntervalStartTime;
    v2->_previousIntervalStartTime = 0;

  }
  return v2;
}

- (void)startMotionStateListenerWithObserver:(id)a3
{
  id v4;
  DSMotionStateListenerProxy *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int listenerState;
  objc_super v17;
  uint8_t buf[4];
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
  switch(v6)
  {
    case 1:
      -[DSMotionStateListenerProxy _addObserver:](v5, "_addObserver:", v4);
      goto LABEL_18;
    case 2:
      -[DSMotionStateListenerProxy _addObserver:](v5, "_addObserver:", v4);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "startedListener");
      -[DSMotionStateListenerProxy _replyWithCachedDataToObserver:](v5, "_replyWithCachedDataToObserver:", v4);
      goto LABEL_18;
    case 3:
      -[DSMotionStateListenerProxy pendingObservers](v5, "pendingObservers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v4);

      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dsLogger");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[DSMotionStateListenerProxy pendingObservers](v5, "pendingObservers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v19 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] adding observer to pending list. Current pending count %lu\n", buf, 0xCu);

      }
      goto LABEL_17;
    case 4:
      goto LABEL_4;
    case 5:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[DSMotionStateListenerProxy error](v5, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failedToStartListenerWithError:", v14);

      }
      goto LABEL_18;
    default:
      if (v6 == 255)
      {
LABEL_4:
        -[DSMotionStateListenerProxy setListenerState:](v5, "setListenerState:", 1);
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dsLogger");
        v8 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v19[0] = 255;
          LOWORD(v19[1]) = 1024;
          *(_DWORD *)((char *)&v19[1] + 2) = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
          _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
        }

        -[DSMotionStateListenerProxy _addObserver:](v5, "_addObserver:", v4);
        -[DSMotionStateListenerProxy options](v5, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17.receiver = v5;
        v17.super_class = (Class)DSMotionStateListenerProxy;
        -[DSListener startMotionDataListenerWithOptions:](&v17, sel_startMotionDataListenerWithOptions_, v9);

      }
      else
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dsLogger");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          listenerState = v5->_listenerState;
          *(_DWORD *)buf = 67109120;
          v19[0] = listenerState;
          _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Invalid listener state %d\n", buf, 8u);
        }
LABEL_17:

      }
LABEL_18:
      objc_sync_exit(v5);

      return;
  }
}

- (void)stopMotionStateListenerWithObserver:(id)a3
{
  id v4;
  DSMotionStateListenerProxy *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  NSObject *v21;
  objc_super v22;
  uint8_t buf[4];
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DSMotionStateListenerProxy observers](v5, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
  {
    -[DSMotionStateListenerProxy _removeObserver:](v5, "_removeObserver:", v4);
    -[DSMotionStateListenerProxy observers](v5, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "stoppedListener");
    }
    else
    {
      v19 = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
      -[DSMotionStateListenerProxy setListenerState:](v5, "setListenerState:", 3);
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dsLogger");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v24[0] = v19;
        LOWORD(v24[1]) = 1024;
        *(_DWORD *)((char *)&v24[1] + 2) = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
        _os_log_impl(&dword_217E3C000, v21, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
      }

      -[DSMotionStateListenerProxy setLastobserver:](v5, "setLastobserver:", v4);
      v22.receiver = v5;
      v22.super_class = (Class)DSMotionStateListenerProxy;
      -[DSListener stopMotionDataListener](&v22, sel_stopMotionDataListener);
    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dsLogger");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v11, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Listener has not called start\n", buf, 2u);
    }

    -[DSMotionStateListenerProxy pendingObservers](v5, "pendingObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v4);

    if (v13)
    {
      -[DSMotionStateListenerProxy pendingObservers](v5, "pendingObservers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v4);

      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dsLogger");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[DSMotionStateListenerProxy pendingObservers](v5, "pendingObservers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v24 = v18;
        _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] removed listener from pending start list since it called stop. Current pending count %lu\n", buf, 0xCu);

      }
    }
  }
  objc_sync_exit(v5);

}

- (void)requestMotionState
{
  DSMotionStateListenerProxy *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[16];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[DSMotionStateListenerProxy cachedData](v2, "cachedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[DSMotionStateListenerProxy cachedProvider](v2, "cachedProvider"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[DSMotionStateListenerProxy observers](v2, "observers", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[DSMotionStateListenerProxy cachedData](v2, "cachedData");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DSMotionStateListenerProxy cachedProvider](v2, "cachedProvider");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "receivedData:fromProvider:", v10, v11);

          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dsLogger");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] No data available\n", buf, 2u);
    }
  }

  objc_sync_exit(v2);
}

- (void)stoppedListener
{
  DSMotionStateListenerProxy *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  _BYTE v32[10];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
  -[DSMotionStateListenerProxy setListenerState:](v2, "setListenerState:", 4);
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsLogger");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v32 = v3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  -[DSMotionStateListenerProxy lastobserver](v2, "lastobserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[DSMotionStateListenerProxy lastobserver](v2, "lastobserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stoppedListener");

  }
  -[DSMotionStateListenerProxy _clearCache](v2, "_clearCache");
  -[DSMotionStateListenerProxy setLastobserver:](v2, "setLastobserver:", 0);
  -[DSMotionStateListenerProxy pendingObservers](v2, "pendingObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  if (!v10)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dsLogger");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[DSMotionStateListenerProxy pendingObservers](v2, "pendingObservers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v32 = v14;
      _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Current pending observer count: %lu. Restarting listener\n", buf, 0xCu);

    }
    v15 = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
    -[DSMotionStateListenerProxy setListenerState:](v2, "setListenerState:", 1);
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dsLogger");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v32 = v15;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v18;
      _os_log_impl(&dword_217E3C000, v17, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[DSMotionStateListenerProxy pendingObservers](v2, "pendingObservers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v19);
          -[DSMotionStateListenerProxy _addObserver:](v2, "_addObserver:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[DSMotionStateListenerProxy pendingObservers](v2, "pendingObservers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllObjects");

    -[DSMotionStateListenerProxy options](v2, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = v2;
    v25.super_class = (Class)DSMotionStateListenerProxy;
    -[DSListener startMotionDataListenerWithOptions:](&v25, sel_startMotionDataListenerWithOptions_, v24);

  }
  objc_sync_exit(v2);

}

- (void)failedToStartListenerWithError:(id)a3
{
  id v4;
  DSMotionStateListenerProxy *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
  -[DSMotionStateListenerProxy setListenerState:](v5, "setListenerState:", 5);
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dsLogger");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v21 = v6;
    v22 = 1024;
    v23 = -[DSMotionStateListenerProxy listenerState](v5, "listenerState");
    _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  -[DSMotionStateListenerProxy setError:](v5, "setError:", v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DSMotionStateListenerProxy observers](v5, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "failedToStartListenerWithError:", v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[DSMotionStateListenerProxy observers](v5, "observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  objc_sync_exit(v5);
}

- (void)startedListener
{
  DSMotionStateListenerProxy *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
  -[DSMotionStateListenerProxy setListenerState:](v2, "setListenerState:", 2);
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsLogger");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v20 = v3;
    v21 = 1024;
    v22 = -[DSMotionStateListenerProxy listenerState](v2, "listenerState");
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dsLogger");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[DSListener maxListenerClients](v2, "maxListenerClients");
    *(_DWORD *)buf = 67109120;
    v20 = v8;
    _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "max listener clients %u\n", buf, 8u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DSMotionStateListenerProxy observers](v2, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "startedListener");
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v2);
}

- (void)receivedData:(id)a3 fromProvider:(id)a4
{
  id v6;
  id v7;
  DSMotionStateListenerProxy *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[DSMotionStateListenerProxy setCachedData:](v8, "setCachedData:", v6);
  -[DSMotionStateListenerProxy setCachedProvider:](v8, "setCachedProvider:", v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DSMotionStateListenerProxy observers](v8, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "receivedData:fromProvider:", v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)updateProviders:(id)a3
{
  id v4;
  DSMotionStateListenerProxy *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DSMotionStateListenerProxy observers](v5, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "updateProviders:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_addObserver:(id)a3
{
  id v4;
  unsigned int listenerCount;
  NSDate *v6;
  NSDate *v7;
  NSDate *previousIntervalStartTime;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  _DWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    listenerCount = self->_listenerCount;
    self->_listenerCount = listenerCount + 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    previousIntervalStartTime = self->_previousIntervalStartTime;
    if (listenerCount)
    {
      -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", previousIntervalStartTime);
      v10 = v9;
      -[DSListener avgListenerStartInterval](self, "avgListenerStartInterval");
      -[DSListener setAvgListenerStartInterval:](self, "setAvgListenerStartInterval:", (v10 + v11 * (double)(self->_listenerCount - 2)) / (double)(self->_listenerCount - 1));
      previousIntervalStartTime = self->_previousIntervalStartTime;
    }
    self->_previousIntervalStartTime = v7;

    v12 = self->_listenerCount;
    if (v12 > -[DSListener maxListenerClients](self, "maxListenerClients"))
      -[DSListener setMaxListenerClients:](self, "setMaxListenerClients:", self->_listenerCount);
    -[DSMotionStateListenerProxy observers](self, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v4);

    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dsLogger");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_listenerCount;
      v21[0] = 67109120;
      v21[1] = v16;
      v17 = "[DSListenerProxy] observer added. Current Listener client count %u\n";
      v18 = v15;
      v19 = 8;
LABEL_10:
      _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v21, v19);
    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dsLogger");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21[0]) = 0;
      v17 = "[DSListenerProxy] observer not found\n";
      v18 = v15;
      v19 = 2;
      goto LABEL_10;
    }
  }

}

- (void)_removeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned int listenerCount;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  --self->_listenerCount;
  v4 = a3;
  -[DSMotionStateListenerProxy observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dsLogger");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    listenerCount = self->_listenerCount;
    v9[0] = 67109120;
    v9[1] = listenerCount;
    _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] observer removed. Current Listener client count %u\n", (uint8_t *)v9, 8u);
  }

}

- (void)_replyWithCachedDataToObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSMotionStateListenerProxy;
  -[DSListener activeProviders](&v11, sel_activeProviders);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "updateProviders:", v5);
    -[DSMotionStateListenerProxy cachedData](self, "cachedData");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[DSMotionStateListenerProxy cachedProvider](self, "cachedProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[DSMotionStateListenerProxy cachedData](self, "cachedData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSMotionStateListenerProxy cachedProvider](self, "cachedProvider");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "receivedData:fromProvider:", v9, v10);

        }
      }
    }
  }

}

- (void)_clearCache
{
  void *v3;
  NSObject *v4;
  NSError *error;
  NSData *cachedData;
  DSProviderDevice *cachedProvider;
  NSDate *previousIntervalStartTime;
  uint8_t v9[16];

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy]  resetting proxy cache\n", v9, 2u);
  }

  error = self->_error;
  self->_error = 0;

  cachedData = self->_cachedData;
  self->_cachedData = 0;

  cachedProvider = self->_cachedProvider;
  self->_cachedProvider = 0;

  self->_listenerCount = 0;
  previousIntervalStartTime = self->_previousIntervalStartTime;
  self->_previousIntervalStartTime = 0;

  -[DSListener setMaxListenerClients:](self, "setMaxListenerClients:", 0);
  -[DSListener setAvgListenerStartInterval:](self, "setAvgListenerStartInterval:", 0.0);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 128, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSHashTable)pendingObservers
{
  return (NSHashTable *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPendingObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (DSClientMotionDataOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (int)listenerState
{
  return self->_listenerState;
}

- (void)setListenerState:(int)a3
{
  self->_listenerState = a3;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedData, a3);
}

- (DSProviderDevice)cachedProvider
{
  return self->_cachedProvider;
}

- (void)setCachedProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cachedProvider, a3);
}

- (DSListenerClientProtocol)lastobserver
{
  return (DSListenerClientProtocol *)objc_loadWeakRetained((id *)&self->_lastobserver);
}

- (void)setLastobserver:(id)a3
{
  objc_storeWeak((id *)&self->_lastobserver, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_lastobserver);
  objc_storeStrong((id *)&self->_cachedProvider, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pendingObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previousIntervalStartTime, 0);
}

@end
