@implementation ICCDCSIReindexer

+ (id)sharedReindexer
{
  id v2;

  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    if (sharedReindexer_onceToken != -1)
      dispatch_once(&sharedReindexer_onceToken, &__block_literal_global_3);
    v2 = (id)sharedReindexer_sSharedReindexer;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __35__ICCDCSIReindexer_sharedReindexer__block_invoke()
{
  ICCDCSIReindexer *v0;
  void *v1;

  v0 = objc_alloc_init(ICCDCSIReindexer);
  v1 = (void *)sharedReindexer_sSharedReindexer;
  sharedReindexer_sSharedReindexer = (uint64_t)v0;

}

- (ICCDCSIReindexer)init
{
  ICCDCSIReindexer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICCDCSIReindexer;
  v2 = -[ICCDCSIReindexer init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[ICCDCSIReindexer setRegisteredDelegates:](v2, "setRegisteredDelegates:", v3);

  }
  return v2;
}

- (void)registerCoreDataCoreSpotlightDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCDCSIReindexer registeredDelegates](self, "registeredDelegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterCoreDataCoreSpotlightDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCDCSIReindexer registeredDelegates](self, "registeredDelegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)stopIndexing
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICCDCSIReindexer registeredDelegates](self, "registeredDelegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stopSpotlightIndexing");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)searchableIndex
{
  if (searchableIndex_s_token_for_searchable_index != -1)
    dispatch_once(&searchableIndex_s_token_for_searchable_index, &__block_literal_global_2);
  return (id)searchableIndex_s_instance;
}

void __35__ICCDCSIReindexer_searchableIndex__block_invoke()
{
  ICSearchIndexImplementation *v0;
  void *v1;

  v0 = objc_alloc_init(ICSearchIndexImplementation);
  v1 = (void *)searchableIndex_s_instance;
  searchableIndex_s_instance = (uint64_t)v0;

}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  -[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:](self, "_reindexSearchableItemsWithIdentifiers:completionHandler:", 0, a3);
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICCDCSIReindexer deleteAllSearchableItemsWithCompletionHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend((id)objc_opt_class(), "searchableIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v14[3] = &unk_1EA823FC0;
  v15 = v3;
  v13 = v3;
  objc_msgSend(v12, "deleteAllSearchableItemsWithCompletionHandler:", v14);

}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

- (void)_reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD aBlock[4];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[4];
  _QWORD v42[3];
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  -[ICCDCSIReindexer registeredDelegates](self, "registeredDelegates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v43 = v9;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v10 = os_log_create("com.apple.notes", "SearchIndexer");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v11)
      -[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:].cold.2((uint64_t)v6, v10, v13, v14, v15, v16, v17, v18);
  }
  else if (v11)
  {
    -[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
  }

  -[ICCDCSIReindexer registeredDelegates](self, "registeredDelegates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1EA824008;
  v39 = v41;
  v40 = v42;
  v31 = v7;
  v38 = v31;
  v21 = _Block_copy(aBlock);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v20;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
        v26 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v25;
          _os_log_debug_impl(&dword_1DDAA5000, v26, OS_LOG_TYPE_DEBUG, "reindexing with ICCoreDataCoreSpotlightDelegate: %@", buf, 0xCu);
        }

        v27 = objc_opt_class();
        objc_msgSend((id)objc_opt_class(), "searchableIndex");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast(v27, (uint64_t)v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v29, "searchableIndex");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            objc_msgSend(v25, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v30, v6, v21);
          else
            objc_msgSend(v25, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:", v30, v21);

        }
        else
        {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:]", 1, 0, CFSTR("Searchable index of %@ is unexpectately not of type %@."), self, objc_opt_class());
        }

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v22);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);

}

BOOL __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "indexingPriority");
  v6 = objc_msgSend(v4, "indexingPriority");

  return v5 < v6;
}

void __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t)(a1 + 5);
  if (++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) && a1[4])
  {
    v3 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("non-nil");
      if (!a1[4])
        v11 = CFSTR("nil");
      v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v14 = 138412802;
      v15 = v11;
      v16 = 2048;
      v17 = v12;
      v18 = 2048;
      v19 = v13;
      _os_log_debug_impl(&dword_1DDAA5000, v10, OS_LOG_TYPE_DEBUG, "completionHandler is %@, completedReindexes = %lu, countOfRegisteredDelegates = %lu", (uint8_t *)&v14, 0x20u);
    }

  }
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (void)setRegisteredDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDelegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDelegates, 0);
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Deleting all searchable items", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Finished deleting all searchable items", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Error deleting all searchable items: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_reindexSearchableItemsWithIdentifiers:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "About to reindex all searchable items", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)_reindexSearchableItemsWithIdentifiers:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "About to reindex searchable items: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "completedReindexes = %lu, triggering completionHandler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
