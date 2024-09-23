@implementation ATXSuggestedPagesWidgetAggregator

- (ATXSuggestedPagesWidgetAggregator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXSuggestedPagesWidgetAggregator *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10[0] = v3;
  v4 = (void *)objc_opt_new();
  v10[1] = v4;
  v5 = (void *)objc_opt_new();
  v10[2] = v5;
  v6 = (void *)objc_opt_new();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXSuggestedPagesWidgetAggregator initWithSources:](self, "initWithSources:", v7);

  return v8;
}

- (ATXSuggestedPagesWidgetAggregator)initWithSources:(id)a3
{
  id v4;
  ATXSuggestedPagesWidgetAggregator *v5;
  uint64_t v6;
  NSArray *sources;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesWidgetAggregator;
  v5 = -[ATXSuggestedPagesWidgetAggregator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sources = v5->_sources;
    v5->_sources = (NSArray *)v6;

  }
  return v5;
}

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = self->_sources;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    v12 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "provideWidgetsForPageType:environment:", a3, v6);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = v14;
        else
          v16 = v12;
        objc_msgSend(v7, "addObjectsFromArray:", v16);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v23, "intent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v17, "setObject:forKey:", v24, v23);
          objc_msgSend(v23, "setIntent:", 0);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v20);
  }

  v37 = v18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setWidgetUniqueId:", v34);

        objc_msgSend(v17, "objectForKey:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setIntent:", v35);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v29);
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
