@implementation MapsSuggestionsNavigationStateChangedTrigger

- (MapsSuggestionsNavigationStateChangedTrigger)init
{
  MapsSuggestionsNavigationStateChangedTrigger *v2;
  id v3;
  void *v4;
  uint64_t v5;
  GEONavigationListener *navigationListener;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsNavigationStateChangedTrigger;
  v2 = -[MapsSuggestionsBaseTrigger initWithName:](&v8, sel_initWithName_, CFSTR("MapsSuggestionsNavigationStateChangedTrigger"));
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D27278]);
    -[MapsSuggestionsBaseTrigger dispatchQueue](v2, "dispatchQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = (GEONavigationListener *)v5;

    -[GEONavigationListener setDelegate:](v2->_navigationListener, "setDelegate:", v2);
  }
  return v2;
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  NSObject *v7;
  _QWORD block[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__MapsSuggestionsNavigationStateChangedTrigger_navigationListener_didChangeNavigationState_transportType___block_invoke;
  block[3] = &unk_1E4BCE5F0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  dispatch_async(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __106__MapsSuggestionsNavigationStateChangedTrigger_navigationListener_didChangeNavigationState_transportType___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4] == 2;
    WeakRetained[4] = *(_QWORD *)(a1 + 40);
    if (((v4 ^ (*(_QWORD *)(a1 + 40) == 2)) & 1) != 0)
      objc_msgSend(WeakRetained, "triggerMyObservers");
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsNavigationStateChangedTrigger.mm";
      v8 = 1026;
      v9 = 56;
      v10 = 2082;
      v11 = "-[MapsSuggestionsNavigationStateChangedTrigger navigationListener:didChangeNavigationState:transportType:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (BOOL)isTrue
{
  MapsSuggestionsNavigationStateChangedTrigger *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v2 = self;
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MapsSuggestionsNavigationStateChangedTrigger_isTrue__block_invoke;
  v7[3] = &unk_1E4BCEA88;
  v7[4] = v2;
  v5 = v7;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___ZN3MSg13dispatch_syncIbEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  block[3] = &unk_1E4BCDE48;
  v9 = v5;
  v10 = &v11;
  dispatch_sync(v3, block);
  LOBYTE(v2) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v2;
}

BOOL __54__MapsSuggestionsNavigationStateChangedTrigger_isTrue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "navigationState") == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end
