@implementation ATXFaceSuggestionRecentlyViewedSignal

- (ATXFaceSuggestionRecentlyViewedSignal)init
{
  ATXFaceSuggestionRecentlyViewedSignal *v2;
  uint64_t v3;
  NSCountedSet *recentlyViewedFeaturedDescriptorKeys;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSCountedSet *v12;
  _QWORD v14[4];
  ATXFaceSuggestionRecentlyViewedSignal *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSCountedSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceSuggestionRecentlyViewedSignal;
  v2 = -[ATXFaceSuggestionRecentlyViewedSignal init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recentlyViewedFeaturedDescriptorKeys = v2->_recentlyViewedFeaturedDescriptorKeys;
    v2->_recentlyViewedFeaturedDescriptorKeys = (NSCountedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -7, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "publisherFromStartTime:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_11;
    v14[3] = &unk_1E82DB0C8;
    v15 = v2;
    v10 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_232, v14);
    __atxlog_handle_lock_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v2->_recentlyViewedFeaturedDescriptorKeys;
      *(_DWORD *)buf = 136315394;
      v18 = "-[ATXFaceSuggestionRecentlyViewedSignal init]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "%s: recently viewed descriptors: %@", buf, 0x16u);
    }

  }
  return v2;
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  if (!v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[ATXFaceSuggestionRecentlyViewedSignal init]_block_invoke";
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: successfully sinked face gallery biome stream publisher", (uint8_t *)&v5, 0xCu);
    }
    goto LABEL_7;
  }
  if (v3 == 1)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_cold_1(v2, v4);
LABEL_7:

  }
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "eventType");

  if (v5 == 1)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "source") == 1)
    {
      v21 = v7;
      objc_msgSend(v7, "sections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_13_4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = v9;
      objc_msgSend(v9, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
            objc_msgSend(v15, "extensionBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "descriptorIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            descriptorKey(v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v19);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

      v7 = v21;
    }

  }
}

BOOL __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "semanticType") == 1;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSCountedSet *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  descriptorKey(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NSCountedSet countForObject:](self->_recentlyViewedFeaturedDescriptorKeys, "countForObject:", v7);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_recentlyViewedFeaturedDescriptorKeys;
  v10 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
  {

LABEL_11:
    v15 = 0.0;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v9);
      v12 += -[NSCountedSet countForObject:](self->_recentlyViewedFeaturedDescriptorKeys, "countForObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
    }
    v11 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v11);

  if (!v12)
    goto LABEL_11;
  v15 = (double)v8 / (double)v12;
LABEL_12:

  return v15;
}

- (double)weight
{
  return -50.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyViewedFeaturedDescriptorKeys, 0);
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[ATXFaceSuggestionRecentlyViewedSignal init]_block_invoke";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: error while sinking face gallery biome stream publisher: %@", (uint8_t *)&v4, 0x16u);

}

@end
