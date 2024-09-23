@implementation AVSecondScreenController

- (AVSecondScreenController)init
{
  AVSecondScreenController *v2;
  uint64_t v3;
  NSMutableOrderedSet *connections;
  uint64_t v5;
  NSMutableOrderedSet *secondScreens;
  AVObservationController *v7;
  AVObservationController *observationController;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVSecondScreen *v14;
  _QWORD v16[4];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)AVSecondScreenController;
  v2 = -[AVSecondScreenController init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    secondScreens = v2->_secondScreens;
    v2->_secondScreens = (NSMutableOrderedSet *)v5;

    v7 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    observationController = v2->_observationController;
    v2->_observationController = v7;

    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5358], 0, 0, &__block_literal_global_3654);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC4750], 0, 0, &__block_literal_global_3654);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5328], 0, 0, &__block_literal_global_5);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenDidDisconnectNotification"), 0, 0, &__block_literal_global_8);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenConnectionDidBecomePossibleNotification"), 0, 0, &__block_literal_global_10);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenConnectionReadyDidChangeNotification"), 0, 0, &__block_literal_global_12);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v2->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenConnectionPlayingDidChangeNotification"), 0, 0, &__block_literal_global_14);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(MEMORY[0x1E0DC3BC0], "avkit_secondScreenScenes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
          v14 = -[AVSecondScreen initWithScene:]([AVSecondScreen alloc], "initWithScene:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
          -[AVSecondScreenController addSecondScreen:](v2, "addSecondScreen:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    -[AVSecondScreenController setAllowsUpdatingActiveConnection:](v2, "setAllowsUpdatingActiveConnection:", 1);
    objc_initWeak(&location, v2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __32__AVSecondScreenController_init__block_invoke_2;
    v16[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v17, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setAllowsUpdatingActiveConnection:(BOOL)a3
{
  self->_allowsUpdatingActiveConnection = a3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVSecondScreenController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __32__AVSecondScreenController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateActiveConnection");

}

- (void)addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVSecondScreenController addConnection:]";
    v10 = 1024;
    v11 = 138;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  if (objc_msgSend(v4, "isReadyToConnect")
    && ((objc_msgSend(v4, "isPlaying") & 1) != 0
     || (-[AVSecondScreenController activeConnection](self, "activeConnection"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v6,
         !v6)))
  {
    -[AVSecondScreenController connections](self, "connections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenController _insertConnection:atIndex:](self, "_insertConnection:atIndex:", v4, objc_msgSend(v7, "count"));

  }
  else
  {
    -[AVSecondScreenController _insertConnection:atIndex:](self, "_insertConnection:atIndex:", v4, 0);
  }
  -[AVSecondScreenController _updateActiveConnection](self, "_updateActiveConnection");

}

- (void)_updateActiveConnection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[AVSecondScreenController allowsUpdatingActiveConnection](self, "allowsUpdatingActiveConnection"))
  {
    -[AVSecondScreenController _targetScreen](self, "_targetScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__AVSecondScreenController__updateActiveConnection__block_invoke;
      v18[3] = &unk_1E5BB0EA0;
      v5 = v3;
      v19 = v5;
      -[AVSecondScreenController connectionPassingTest:](self, "connectionPassingTest:", v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "-[AVSecondScreenController _updateActiveConnection]";
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
      }

      objc_msgSend(v5, "connectWithSecondScreenConnection:", v6);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[AVSecondScreenController secondScreens](self, "secondScreens", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if (v13 != v4)
            objc_msgSend(v13, "connectWithSecondScreenConnection:", 0);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)allowsUpdatingActiveConnection
{
  return self->_allowsUpdatingActiveConnection;
}

- (id)_targetScreen
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AVSecondScreenController secondScreens](self, "secondScreens", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isAvailable"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AVSecondScreenController _targetScreen]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  return v4;
}

- (NSMutableOrderedSet)secondScreens
{
  return self->_secondScreens;
}

- (void)_insertConnection:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[AVSecondScreenController _insertConnection:atIndex:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %ld", (uint8_t *)&v9, 0x20u);
  }

  -[AVSecondScreenController connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v6, a4);

}

- (NSMutableOrderedSet)connections
{
  return self->_connections;
}

void __42__AVSecondScreenController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[AVSecondScreenController setAllowsUpdatingActiveConnection:](self, "setAllowsUpdatingActiveConnection:", 0);
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenController;
  -[AVSecondScreenController dealloc](&v3, sel_dealloc);
}

- (id)addConnectionForPlayer:(id)a3 playerLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVSecondScreenConnection *v9;

  v6 = a3;
  v7 = a4;
  if (AVSecondScreenTVSupportEnabled_onceToken != -1)
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_100);
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled
    && (-[AVSecondScreenController _connectionForPlayer:](self, "_connectionForPlayer:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v9 = -[AVSecondScreenConnection initWithPlayer:playerLayer:]([AVSecondScreenConnection alloc], "initWithPlayer:playerLayer:", v6, v7);
    -[AVSecondScreenController addConnection:](self, "addConnection:", v9);
    -[AVSecondScreenConnection startUpdates](v9, "startUpdates");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVSecondScreenController removeConnection:]";
    v9 = 1024;
    v10 = 153;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  -[AVSecondScreenController connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(v4, "connectWithScreen:active:", 0, 0);
  -[AVSecondScreenController _updateActiveConnection](self, "_updateActiveConnection");
}

- (id)connectionPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVSecondScreenController connections](self, "connections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (v10 && v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)))
        {
          v7 = v10;
          goto LABEL_12;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)preferredConnection
{
  void *v2;
  void *v3;

  -[AVSecondScreenController connections](self, "connections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPreferredConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVSecondScreenController preferredConnection](self, "preferredConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {

  }
  else
  {
    -[AVSecondScreenController connections](self, "connections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      _AVLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315394;
        v16 = "-[AVSecondScreenController setPreferredConnection:]";
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
      }

      -[AVSecondScreenController connections](self, "connections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v4);

      -[AVSecondScreenController connections](self, "connections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") - 1;

      if (v10 != v12)
      {
        -[AVSecondScreenController connections](self, "connections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "moveObjectsAtIndexes:toIndex:", v14, v12);

        -[AVSecondScreenController _updateActiveConnection](self, "_updateActiveConnection");
      }
    }
  }

}

- (void)addSecondScreen:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVSecondScreenController addSecondScreen:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
    }

    v6 = objc_msgSend(v4, "isTVOutScreen");
    -[AVSecondScreenController secondScreens](self, "secondScreens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "addObject:", v4);
    else
      objc_msgSend(v7, "insertObject:atIndex:", v4, 0);

    -[AVSecondScreenController _updateActiveConnection](self, "_updateActiveConnection");
  }

}

- (void)removeSecondScreen:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVSecondScreenController removeSecondScreen:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[AVSecondScreenController secondScreens](self, "secondScreens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[AVSecondScreenController _updateActiveConnection](self, "_updateActiveConnection");
}

- (id)activeConnection
{
  return -[AVSecondScreenController connectionPassingTest:](self, "connectionPassingTest:", &__block_literal_global_21);
}

- (id)_connectionForPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVSecondScreenController connections](self, "connections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "player");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_secondScreens, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
}

uint64_t __51__AVSecondScreenController__updateActiveConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isReadyToConnect"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isTVOutScreen") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "requiresTVOutScreen") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __44__AVSecondScreenController_activeConnection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

void __32__AVSecondScreenController_init__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPlaying") && objc_msgSend(v5, "isReadyToConnect"))
    objc_msgSend(v6, "setPreferredConnection:", v5);

}

void __32__AVSecondScreenController_init__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[AVSecondScreenController init]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(v8, "_updateActiveConnection");
}

void __32__AVSecondScreenController_init__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[AVSecondScreenController init]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(v8, "_updateActiveConnection");
}

void __32__AVSecondScreenController_init__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a2;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVSecondScreenController init]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeSecondScreen:", v8);

}

void __32__AVSecondScreenController_init__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  AVSecondScreen *v8;
  void *v9;
  AVSecondScreen *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a2;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[AVSecondScreenController init]_block_invoke";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = [AVSecondScreen alloc];
  objc_msgSend(v5, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVSecondScreen initWithScene:](v8, "initWithScene:", v9);
  objc_msgSend(v6, "addSecondScreen:", v10);

}

void __32__AVSecondScreenController_init__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVSecondScreenController init]_block_invoke";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "activeConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v5, "_updateActiveConnection");

}

@end
