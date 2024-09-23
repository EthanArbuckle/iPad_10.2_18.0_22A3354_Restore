@implementation ICSearchIndexer

void __62__ICSearchIndexer_App__mainContextObjectForObjectIDURIString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_managedObjectIDForURIString:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 48);
    v11 = 0;
    objc_msgSend(v4, "existingObjectWithID:error:", v3, &v11);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (v6)
    {
      v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_1DD7B0000, v9, OS_LOG_TYPE_INFO, "Error fetching object with ID %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1DD7B0000, v6, OS_LOG_TYPE_INFO, "No objectID corresponding to objectIDURI: %@", buf, 0xCu);
    }
  }

}

void __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke_cold_1(v4);

    objc_msgSend(MEMORY[0x1E0D64270], "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D64458]);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DD7B0000, v4, OS_LOG_TYPE_INFO, "App completed reindexing", v5, 2u);
    }

  }
}

void __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "App failed to clean up the search index. Will try again on next open", v1, 2u);
}

@end
