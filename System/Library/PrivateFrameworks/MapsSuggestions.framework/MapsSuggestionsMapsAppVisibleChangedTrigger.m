@implementation MapsSuggestionsMapsAppVisibleChangedTrigger

- (MapsSuggestionsMapsAppVisibleChangedTrigger)init
{
  MapsSuggestionsMapsAppVisibleChangedTrigger *v2;
  NSObject *v3;
  void *v4;
  MapsSuggestionsMapsAppVisibleChangedTrigger *v5;
  uint64_t v6;
  RBSProcessMonitor *processMonitor;
  _QWORD v9[4];
  MapsSuggestionsMapsAppVisibleChangedTrigger *v10;
  id v11;
  id buf[2];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsMapsAppVisibleChangedTrigger;
  v2 = -[MapsSuggestionsBaseTrigger initWithName:](&v13, sel_initWithName_, CFSTR("MapsSuggestionsMapsAppVisibleChangedTrigger"));
  if (v2)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Initializing", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v2->_isVisible = 0;
    v4 = (void *)MEMORY[0x1E0D87D90];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke;
    v9[3] = &unk_1E4BCFF40;
    objc_copyWeak(&v11, buf);
    v5 = v2;
    v10 = v5;
    objc_msgSend(v4, "monitorWithConfiguration:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    processMonitor = v5->_processMonitor;
    v5->_processMonitor = (RBSProcessMonitor *)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E4C09F78);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.Maps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke_2;
  v7[3] = &unk_1E4BCFF18;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setUpdateHandler:", v7);

  objc_destroyWeak(&v9);
}

void __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  _BYTE *WeakRetained;
  id v14;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  int v20;
  char *v21;
  __int16 v22;
  _WORD v23[17];

  *(_QWORD *)&v23[13] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endowmentNamespaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    if (WeakRetained[40] == v12)
    {
      objc_sync_exit(v14);

    }
    else
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = CFSTR("YES");
        if (WeakRetained[40])
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        if (!v12)
          v17 = CFSTR("NO");
        v20 = 138412546;
        v21 = (char *)v18;
        v22 = 2112;
        *(_QWORD *)v23 = v17;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Maps app visibility changed from %@ to %@", (uint8_t *)&v20, 0x16u);
      }

      WeakRetained[40] = v12;
      objc_sync_exit(v14);

      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Triggering observers", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(WeakRetained, "triggerMyObservers");
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446722;
      v21 = "MapsSuggestionsMapsAppVisibleChangedTrigger.mm";
      v22 = 1026;
      *(_DWORD *)v23 = 43;
      v23[2] = 2082;
      *(_QWORD *)&v23[3] = "-[MapsSuggestionsMapsAppVisibleChangedTrigger init]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v20, 0x1Cu);
    }

  }
}

- (BOOL)isTrue
{
  MapsSuggestionsMapsAppVisibleChangedTrigger *v2;
  BOOL isVisible;

  v2 = self;
  objc_sync_enter(v2);
  isVisible = v2->_isVisible;
  objc_sync_exit(v2);

  return isVisible;
}

- (id)objectForJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MapsSuggestionsBaseTrigger uniqueName](self, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  MSg::jsonFor((MSg *)-[MapsSuggestionsMapsAppVisibleChangedTrigger isTrue](self, "isTrue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end
