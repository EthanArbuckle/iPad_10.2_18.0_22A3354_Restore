@implementation ICSearchIndexer(App)

- (id)mainContextObjectForObjectIDURIString:()App
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "mainThreadContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __62__ICSearchIndexer_App__mainContextObjectForObjectIDURIString___block_invoke;
          v18[3] = &unk_1EA7DDAE0;
          v12 = v10;
          v19 = v12;
          v20 = v4;
          v22 = &v27;
          v13 = v11;
          v21 = v13;
          objc_msgSend(v13, "performBlockAndWait:", v18);
          v14 = v28[5] == 0;

          if (!v14)
            goto LABEL_14;
        }
        else
        {
          v15 = os_log_create("com.apple.notes", "SearchIndexer");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v9;
            _os_log_impl(&dword_1DD7B0000, v15, OS_LOG_TYPE_INFO, "Indexer data source does not vend main thread context: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v6);
  }
LABEL_14:

  v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)reindexIfNecessary
{
  void *v0;
  int v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", *MEMORY[0x1E0D64458]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLValue");

  if (v1)
  {
    v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DD7B0000, v2, OS_LOG_TYPE_INFO, "App needs to clean up the search index", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D63C38], "reindexer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reindexAllSearchableItemsWithCompletionHandler:", &__block_literal_global_9);

  }
}

@end
