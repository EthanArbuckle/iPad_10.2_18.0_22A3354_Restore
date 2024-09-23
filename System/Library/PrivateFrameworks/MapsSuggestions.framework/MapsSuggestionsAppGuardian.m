@implementation MapsSuggestionsAppGuardian

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  MapsSuggestionsAppGuardian *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMapTable *sources;
  uint64_t v11;
  MapsSuggestionsAppProtectionConnector *connector;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsAppGuardian;
  v5 = -[MapsSuggestionsAppGuardian init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("MapsSuggestionsAppGuardianQueue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    sources = v5->_sources;
    v5->_sources = (NSMapTable *)v9;

    objc_msgSend(v4, "oneAppProtectionConnector");
    v11 = objc_claimAutoreleasedReturnValue();
    connector = v5->_connector;
    v5->_connector = (MapsSuggestionsAppProtectionConnector *)v11;

    -[MapsSuggestionsAppProtectionConnector setDelegate:](v5->_connector, "setDelegate:", v5);
    -[MapsSuggestionsAppProtectionConnector addMonitor:](v5->_connector, "addMonitor:", v5);
  }

  return v5;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)_add:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMapTable objectForKey:](self->_sources, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v7, "addObject:", v8);
  -[NSMapTable setObject:forKey:](self->_sources, "setObject:forKey:", v7, v6);

}

- (void)_remove:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMapTable objectForKey:](self->_sources, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "removeObject:", v6);
    if (objc_msgSend(v9, "count"))
    {
      -[NSMapTable setObject:forKey:](self->_sources, "setObject:forKey:", v9, v7);
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "uniqueName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "No more bundleIDs to monitor for %@", (uint8_t *)&v12, 0xCu);

      }
      -[NSMapTable removeObjectForKey:](self->_sources, "removeObjectForKey:", v7);
    }
  }

}

- (void)_removeAllBundleIDsForSource:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMapTable objectForKey:](self->_sources, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMapTable removeObjectForKey:](self->_sources, "removeObjectForKey:", v4);
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Removed all bundleIDs for %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)registerBundleID:(id)a3 withSource:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__MapsSuggestionsAppGuardian_registerBundleID_withSource___block_invoke;
  v11[3] = &unk_1E4BCE020;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__MapsSuggestionsAppGuardian_registerBundleID_withSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(char **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      *(_QWORD *)v11 = v6;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Registering:%@ for %@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "_add:source:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsAppGuardian.m";
      v10 = 1026;
      *(_DWORD *)v11 = 105;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsAppGuardian registerBundleID:withSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)unregisterBundleID:(id)a3 withSource:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MapsSuggestionsAppGuardian_unregisterBundleID_withSource___block_invoke;
  v11[3] = &unk_1E4BCE020;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__MapsSuggestionsAppGuardian_unregisterBundleID_withSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(char **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      *(_QWORD *)v11 = v6;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Unregistering:%@ for %@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "_remove:source:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsAppGuardian.m";
      v10 = 1026;
      *(_DWORD *)v11 = 116;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsAppGuardian unregisterBundleID:withSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)unregisterAllBundleIDsForSource:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsAppGuardian_unregisterAllBundleIDsForSource___block_invoke;
  block[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MapsSuggestionsAppGuardian_unregisterAllBundleIDsForSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Unregistering all bundleIDs for %@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(WeakRetained, "_removeAllBundleIDsForSource:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsAppGuardian.m";
      v9 = 1026;
      v10 = 126;
      v11 = 2082;
      v12 = "-[MapsSuggestionsAppGuardian unregisterAllBundleIDsForSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (BOOL)isBundleIDLocked:(id)a3 forSource:(id)a4
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "AppGuardian is not enabled. Not checking for App Protection.", (uint8_t *)&v9, 2u);
    }
    goto LABEL_9;
  }
  appForBundleID(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isLocked](v5, "isLocked") & 1) == 0 && !-[NSObject isHidden](v5, "isHidden"))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 1024;
    v12 = -[NSObject isLocked](v5, "isLocked");
    v13 = 1024;
    v14 = -[NSObject isHidden](v5, "isHidden");
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "%@ is protected. Locked = %d, Hidden = %d", (uint8_t *)&v9, 0x18u);
  }

  v7 = 1;
LABEL_10:

  return v7;
}

- (void)appProtectionStatusChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsAppGuardian_appProtectionStatusChanged___block_invoke;
  block[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__MapsSuggestionsAppGuardian_appProtectionStatusChanged___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t i;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
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
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  char *v41;
  __int16 v42;
  _BYTE v43[14];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = *(id *)(a1 + 32);
    v23 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v23)
    {
      v4 = *(_QWORD *)v34;
      v24 = v3;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v4)
            objc_enumerationMutation(v3);
          v6 = *(char **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v7 = WeakRetained[3];
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v30 != v10)
                  objc_enumerationMutation(v7);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "didChangeProtectionStatusForBundleId:", v6);
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
            }
            while (v9);
          }

          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(WeakRetained[2], "keyEnumerator");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v26;
            while (2)
            {
              for (k = 0; k != v14; ++k)
              {
                if (*(_QWORD *)v26 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * k);
                objc_msgSend(WeakRetained[2], "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EE71B5B8))
                  v19 = v6 == 0;
                else
                  v19 = 1;
                if (!v19 && objc_msgSend(v18, "containsObject:", v6))
                {
                  GEOFindOrCreateLog();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v17, "uniqueName");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v41 = v6;
                    v42 = 2112;
                    *(_QWORD *)v43 = v21;
                    _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Received App Protection change notification for %@. Refreshing %@", buf, 0x16u);

                  }
                  objc_msgSend(v17, "updateSuggestionEntriesWithHandler:", 0);

                  v3 = v24;
                  goto LABEL_35;
                }

              }
              v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
              if (v14)
                continue;
              break;
            }
          }

          v3 = v24;
          v4 = v22;
        }
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v23);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "MapsSuggestionsAppGuardian.m";
      v42 = 1026;
      *(_DWORD *)v43 = 153;
      *(_WORD *)&v43[4] = 2082;
      *(_QWORD *)&v43[6] = "-[MapsSuggestionsAppGuardian appProtectionStatusChanged:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v3 = v12;
LABEL_35:

  }
}

- (void)registerAppTracker:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MapsSuggestionsAppGuardian_registerAppTracker___block_invoke;
  block[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsAppGuardian_registerAppTracker___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[3];
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v6 = (void *)v3[3];
      v3[3] = v5;

      v4 = (void *)v3[3];
    }
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsAppGuardian.m";
      v10 = 1026;
      v11 = 179;
      v12 = 2082;
      v13 = "-[MapsSuggestionsAppGuardian registerAppTracker:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)unregisterAppTracker:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MapsSuggestionsAppGuardian_unregisterAppTracker___block_invoke;
  block[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsAppGuardian_unregisterAppTracker___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsAppGuardian.m";
      v7 = 1026;
      v8 = 192;
      v9 = 2082;
      v10 = "-[MapsSuggestionsAppGuardian unregisterAppTracker:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

+ (int64_t)protectionStatusForBundleID:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int64_t v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((GEOConfigGetBOOL() & 1) != 0)
  {
    appForBundleID(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isHidden](v4, "isHidden"))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%@ is hidden", (uint8_t *)&v8, 0xCu);
      }
      v6 = 3;
    }
    else
    {
      if (!-[NSObject isLocked](v4, "isLocked"))
      {
        v6 = 1;
        goto LABEL_14;
      }
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 2;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8 = 138412290;
        v9 = v3;
        v6 = 2;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%@ is locked", (uint8_t *)&v8, 0xCu);
      }
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "AppGuardian is not enabled. Not checking for App Protection.", (uint8_t *)&v8, 2u);
    }
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->uniqueName, 0);
  objc_storeStrong((id *)&self->_appStatusTrackers, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
