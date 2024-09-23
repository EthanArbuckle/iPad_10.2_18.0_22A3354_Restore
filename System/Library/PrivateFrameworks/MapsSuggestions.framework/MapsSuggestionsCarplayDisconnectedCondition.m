@implementation MapsSuggestionsCarplayDisconnectedCondition

- (MapsSuggestionsCarplayDisconnectedCondition)initWithDisconnectDelay:(double)a3
{
  MapsSuggestionsCarplayDisconnectedCondition *v4;
  MapsSuggestionsCarplayDisconnectedCondition *v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsCarplayDisconnectedCondition;
  v4 = -[MapsSuggestionsBaseCondition initWithName:](&v11, sel_initWithName_, CFSTR("MapsSuggestionsCarplayDisconnectedCondition"));
  v5 = v4;
  if (v4)
  {
    v4->_disconnectDelay = a3;
    v4->_isInitialized = 0;
    objc_initWeak(&location, v4);
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__MapsSuggestionsCarplayDisconnectedCondition_initWithDisconnectDelay___block_invoke;
    v8[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __71__MapsSuggestionsCarplayDisconnectedCondition_initWithDisconnectDelay___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE buf[32];
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v2 = (void *)_MergedGlobals_1_0;
    v11 = _MergedGlobals_1_0;
    if (!_MergedGlobals_1_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCARSessionStatusClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E4BD05D0;
      v13 = &v8;
      __getCARSessionStatusClass_block_invoke((uint64_t)buf);
      v2 = (void *)v9[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v8, 8);
    v4 = [v3 alloc];
    v5 = objc_msgSend(v4, "initAndWaitUntilSessionUpdated", v8);
    v6 = WeakRetained[2];
    WeakRetained[2] = (id)v5;

    objc_msgSend(WeakRetained[2], "addSessionObserver:", WeakRetained);
    v7 = WeakRetained;
    objc_sync_enter(v7);
    LOBYTE(v7[4].isa) = 1;
    objc_sync_exit(v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsCarplayDisconnectedCondition.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 41;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsCarplayDisconnectedCondition initWithDisconnectDelay:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (BOOL)isTrue
{
  MapsSuggestionsCarplayDisconnectedCondition *v2;
  void *v3;
  MapsSuggestionsCarplayDisconnectedCondition *v4;
  BOOL v5;
  NSObject *v6;
  NSDate *disconnectTime;
  NSObject *v8;
  NSDate *v9;
  int v11;
  NSDate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_isInitialized)
  {
    objc_sync_exit(v2);

    -[CARSessionStatus currentSession](v2->_carSessionStatus, "currentSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      GEOFindOrCreateLog();
      v4 = (MapsSuggestionsCarplayDisconnectedCondition *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A427D000, &v4->super.super, OS_LOG_TYPE_DEBUG, "Failed because still connected to carplay", (uint8_t *)&v11, 2u);
      }
      v5 = 0;
    }
    else
    {
      v4 = v2;
      objc_sync_enter(v4);
      disconnectTime = v4->_disconnectTime;
      if (disconnectTime && MapsSuggestionsSecondsSince(disconnectTime) <= v4->_disconnectDelay)
      {
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = v4->_disconnectTime;
          v11 = 138412290;
          v12 = v9;
          _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Failed because disconnected only at %@", (uint8_t *)&v11, 0xCu);
        }

        v5 = 0;
      }
      else
      {
        v5 = 1;
      }
      objc_sync_exit(v4);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Carplay session not yet initialized", (uint8_t *)&v11, 2u);
    }

    objc_sync_exit(v2);
    v5 = 0;
    v4 = v2;
  }

  return v5;
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  MapsSuggestionsCarplayDisconnectedCondition *v6;
  uint64_t v7;
  NSDate *disconnectTime;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "-[MapsSuggestionsCarplayDisconnectedCondition sessionDidDisconnect:]";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  MapsSuggestionsNow();
  v7 = objc_claimAutoreleasedReturnValue();
  disconnectTime = v6->_disconnectTime;
  v6->_disconnectTime = (NSDate *)v7;

  objc_sync_exit(v6);
}

- (NSDate)disconnectTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisconnectTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectTime, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end
