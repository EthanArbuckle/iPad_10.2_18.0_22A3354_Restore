@implementation ATXUpcomingMediaQuery

+ (id)getAllUpcomingMedia
{
  return (id)objc_msgSend(a1, "getUpcomingMediaForBundle:isInternalApplication:", 0, 0);
}

+ (id)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a4;
  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__24;
  v20 = __Block_byref_object_dispose__24;
  v21 = (id)objc_opt_new();
  v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication___block_invoke;
  v13[3] = &unk_1E4D5D5A8;
  v15 = &v16;
  v8 = v7;
  v14 = v8;
  objc_msgSend(a1, "getUpcomingMediaForBundle:isInternalApplication:completionHandler:", v6, v4, v13);
  v9 = v8;
  v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __73__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("(domainIdentifier == '%@')"), *MEMORY[0x1E0CBD6D8]);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setInternal:", 1);
  if (v7)
  {
    v35[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBundleIDs:", v12);

  }
  v34 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProtectionClasses:", v13);

  v33[0] = *MEMORY[0x1E0CBD518];
  v33[1] = CFSTR("kMDItemRankingHint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchAttributes:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v10, v11);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__24;
  v31[4] = __Block_byref_object_dispose__24;
  v16 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v32 = v16;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke;
  v28[3] = &unk_1E4D5A4A0;
  v30 = v31;
  v18 = v7;
  v29 = v18;
  objc_msgSend(v15, "setFoundItemsHandler:", v28);
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12;
  v22[3] = &unk_1E4D5D5D0;
  v19 = v10;
  v23 = v19;
  v20 = v8;
  v25 = v20;
  v26 = v31;
  v27 = a4;
  v21 = v18;
  v24 = v21;
  objc_msgSend(v15, "setCompletionHandler:", v22);
  objc_msgSend(v15, "start");

  _Block_object_dispose(v31, 8);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = a2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    v6 = *MEMORY[0x1E0CBD518];
    do
    {
      v7 = 0;
      v23 = v4;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A85A4F90]();
        objc_msgSend(v8, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "attributeForKey:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3710];
          v13 = objc_opt_class();
          v25 = 0;
          objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v11, &v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v25;
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              objc_msgSend(v8, "attributeSet");
              v16 = objc_claimAutoreleasedReturnValue();
              -[NSObject rankingHint](v16, "rankingHint");
              v17 = v6;
              v18 = v5;
              v19 = v2;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addUpcomingMediaIntent:withRank:", v14, v20);

              v2 = v19;
              v5 = v18;
              v6 = v17;
              v4 = v23;
              goto LABEL_12;
            }
          }
          else
          {
            __atxlog_handle_default();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v15;
              _os_log_error_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_ERROR, "Could not unarchive intent: %@", buf, 0xCu);
            }
LABEL_12:

          }
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v4);
  }

  __atxlog_handle_default();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_cold_1(v2, a1, v21);

}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12_cold_2(a1, (uint64_t)v3, v4);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsInternalApplication:", *(unsigned __int8 *)(a1 + 64));
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12_cold_1(a1, v4);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = *(_QWORD *)(a2 + 32);
  v7 = 134218242;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "Found %lu upcoming media items for %@ in Spotlight.", (uint8_t *)&v7, 0x16u);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "Completed recovery of upcoming media items for %@ from Spotlight.", (uint8_t *)&v3, 0xCu);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_12_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ERROR in completion handler for CSSearchQuery: %@ - ERROR:%@", (uint8_t *)&v4, 0x16u);
}

@end
