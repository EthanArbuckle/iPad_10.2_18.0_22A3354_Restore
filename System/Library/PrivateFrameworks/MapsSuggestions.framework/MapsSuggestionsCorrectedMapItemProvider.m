@implementation MapsSuggestionsCorrectedMapItemProvider

- (MapsSuggestionsCorrectedMapItemProvider)initWithMeCardReader:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsCorrectedMapItemProvider *v9;
  void *v10;
  id updateHandler;
  MapsSuggestionsMeCardReader *meCardReader;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsCorrectedMapItemProvider;
  v9 = -[MapsSuggestionsCorrectedMapItemProvider init](&v17, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    updateHandler = v9->_updateHandler;
    v9->_updateHandler = v10;

    objc_storeStrong((id *)&v9->_meCardReader, a3);
    -[MapsSuggestionsMeCardReader registerMeCardObserver:](v9->_meCardReader, "registerMeCardObserver:", v9);
    objc_initWeak(&location, v9);
    meCardReader = v9->_meCardReader;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__MapsSuggestionsCorrectedMapItemProvider_initWithMeCardReader_handler___block_invoke;
    v14[3] = &unk_1E4BCE918;
    objc_copyWeak(&v15, &location);
    -[MapsSuggestionsMeCardReader readMeCardWithHandler:](meCardReader, "readMeCardWithHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __72__MapsSuggestionsCorrectedMapItemProvider_initWithMeCardReader_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id *v10;
  id v11;
  void (**v12)(void);
  NSObject *v13;
  int v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (id *)WeakRetained;
    objc_sync_enter(v10);
    if (v7)
    {
      v11 = v10[1];
      v10[1] = 0;

    }
    objc_storeStrong(v10 + 1, a2);
    v12 = (void (**)(void))v10[3];
    if (v12)
      v12[2]();
    objc_sync_exit(v10);

  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446722;
      v15 = "MapsSuggestionsCorrectedMapItemProvider.m";
      v16 = 1026;
      v17 = 38;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCorrectedMapItemProvider initWithMeCardReader:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsMeCardReader unregisterMeCardObserver:](self->_meCardReader, "unregisterMeCardObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsCorrectedMapItemProvider;
  -[MapsSuggestionsCorrectedMapItemProvider dealloc](&v3, sel_dealloc);
}

- (id)mapItemFormShortcutForCNIdentifier:(id)a3
{
  id v4;
  MapsSuggestionsCorrectedMapItemProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MapsSuggestionsMeCard shortcutForCNPostalAddressIdentifier:](v5->_meCard, "shortcutForCNPostalAddressIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MapsSuggestionsMeCard shortcutsForAll](v5->_meCard, "shortcutsForAll", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v7, "isEqualToString:", v13);

          if (v14)
          {
            objc_msgSend(v12, "geoMapItem");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v6;
  MapsSuggestionsCorrectedMapItemProvider *v7;
  void *v8;
  void (**updateHandler)(void);
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_meCard, a4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("CorrectedMapItemsUpdated"), 0);

  updateHandler = (void (**)(void))v7->_updateHandler;
  if (updateHandler)
    updateHandler[2]();
  objc_sync_exit(v7);

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_meCardReader, 0);
  objc_storeStrong((id *)&self->_meCard, 0);
}

@end
