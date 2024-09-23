@implementation MSPauseManager

- (MSPauseManager)init
{
  MSPauseManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *UUIDToTimerMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPauseManager;
  v2 = -[MSPauseManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    UUIDToTimerMap = v2->_UUIDToTimerMap;
    v2->_UUIDToTimerMap = v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_UUIDToTimerMap, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MSPauseManager;
  -[MSPauseManager dealloc](&v8, sel_dealloc);
}

- (BOOL)isPaused
{
  return -[NSMutableDictionary count](self->_UUIDToTimerMap, "count") != 0;
}

- (void)_addPauseUUID:(id)a3
{
  NSMutableDictionary *UUIDToTimerMap;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  UUIDToTimerMap = self->_UUIDToTimerMap;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](UUIDToTimerMap, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v10, "invalidate");
  v6 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, sel__timerDidFire_, v5, 0, 0.0);

  -[NSMutableDictionary setObject:forKey:](self->_UUIDToTimerMap, "setObject:forKey:", v8, v5);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99748]);

}

- (void)pingPauseUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pause manager received an invalid UUID. Making up a new one: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pause timer ping for UUID %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v6 = -[NSMutableDictionary count](self->_UUIDToTimerMap, "count");
  -[MSPauseManager _addPauseUUID:](self, "_addPauseUUID:", v5);
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "pauseManagerDidPause:", self);

    }
  }

}

- (void)_removeTimerUUID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = -[NSMutableDictionary count](self->_UUIDToTimerMap, "count");
  -[NSMutableDictionary objectForKey:](self->_UUIDToTimerMap, "objectForKey:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_UUIDToTimerMap, "removeObjectForKey:", v12);
  }
  v7 = -[NSMutableDictionary count](self->_UUIDToTimerMap, "count");
  if (v4)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "pauseManagerDidUnpause:", self);

    }
  }

}

- (void)_timerDidFire:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pause timer UUID %{public}@ expired.", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MSPauseManager__timerDidFire___block_invoke;
  v6[3] = &unk_1E994DD00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (MSPauseManagerDelegate)delegate
{
  return (MSPauseManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUIDToTimerMap, 0);
}

uint64_t __32__MSPauseManager__timerDidFire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTimerUUID:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedManager
{
  void *v2;
  MSPauseManager *v3;
  void *v4;

  v2 = (void *)sharedManager_manager;
  if (!sharedManager_manager)
  {
    v3 = objc_alloc_init(MSPauseManager);
    v4 = (void *)sharedManager_manager;
    sharedManager_manager = (uint64_t)v3;

    v2 = (void *)sharedManager_manager;
  }
  return v2;
}

@end
