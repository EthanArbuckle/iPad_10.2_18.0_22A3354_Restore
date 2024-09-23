@implementation ATXFavoriteContactDataSource

- (ATXFavoriteContactDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXFavoriteContactDataSource *v6;
  ATXFavoriteContactDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFavoriteContactDataSource;
  v6 = -[ATXFavoriteContactDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)favoritesWithContacts:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ATXHeuristicDevice *device;
  _QWORD v9[4];
  id v10;
  ATXFavoriteContactDataSource *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5518) & 1) != 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__14;
    v17 = __Block_byref_object_dispose__14;
    v18 = 0;
    device = self->_device;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke;
    v9[3] = &unk_1E82C5518;
    v10 = v6;
    v11 = self;
    v12 = &v13;
    -[ATXHeuristicDevice accessFavoriteContacts:](device, "accessFavoriteContacts:", v9);
    v7[2](v7, v14[5], 0);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7[2](v7, MEMORY[0x1E0C9AA60], 0);
  }

}

void __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "entriesForContact:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(v3, "entries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        +[ATXFavoriteContactDataSource _entryToDict:device:](ATXFavoriteContactDataSource, "_entryToDict:device:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  __atxlog_handle_heuristic();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke_cold_1(v11, v18);

  v19 = objc_msgSend(v11, "copy");
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

+ (id)_entryToDict:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "wrap:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("CNFavoritesEntry"));

  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  objc_msgSend(v6, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("handle"));

  objc_msgSend(v6, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("actionType"));

  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("bundleIdentifier"));

  objc_msgSend(v6, "contactProperty");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "dictContactForCNContact:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("contact"));

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "Found %lu favorite(s) for query", (uint8_t *)&v3, 0xCu);
}

@end
