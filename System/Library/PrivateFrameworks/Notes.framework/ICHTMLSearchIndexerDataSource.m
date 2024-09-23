@implementation ICHTMLSearchIndexerDataSource

- (id)dataSourceIdentifier
{
  return CFSTR("Legacy");
}

- (unint64_t)indexingPriority
{
  return 1;
}

- (id)persistentStoreCoordinator
{
  return +[NoteContext persistentStoreCoordinator](NoteContext, "persistentStoreCoordinator");
}

- (id)newManagedObjectContext
{
  return +[NoteContext newManagedObjectContext](NoteContext, "newManagedObjectContext");
}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke;
  v10 = &unk_1E81EAD88;
  v4 = v3;
  v11 = v4;
  v12 = &v13;
  objc_msgSend(v4, "performBlockAndWait:", &v7);
  v5 = (void *)objc_msgSend((id)v14[5], "copy", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("store != nil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[NoteContext visibleNotesPredicate](NoteContext, "visibleNotesPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Note"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(v6, "setPredicate:", v5);
  v9 = *(void **)(a1 + 32);
  v27 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v6, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3();

  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Store"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account.didChooseToMigrate != YES"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  v15 = *(void **)(a1 + 32);
  v26 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v13, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (v17)
  {
    v18 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2();

  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Account"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("didChooseToMigrate != YES"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredicate:", v20);

  v21 = *(void **)(a1 + 32);
  v25 = 0;
  objc_msgSend(v21, "executeFetchRequest:error:", v19, &v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v25;
  if (v23)
  {
    v24 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v22);

}

- (void)contextWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICHTMLSearchIndexerDataSource;
  -[ICBaseSearchIndexerDataSource contextWillSave:](&v33, sel_contextWillSave_, v4);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHTMLSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v5, "updatedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v27 = v5;
      v28 = v4;
      v12 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          ICDynamicCast();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v14, "changedValues");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("didChooseToMigrate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              if (objc_msgSend(v15, "didChooseToMigrate"))
              {
                v18 = (void *)MEMORY[0x1E0D641A8];
                objc_msgSend(v15, "accountIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v18) = objc_msgSend(v18, "isAccountReindexedForMigration:", v19);

                if ((v18 & 1) == 0)
                {
                  v21 = os_log_create("com.apple.notes", "SearchIndexer");
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                    -[ICHTMLSearchIndexerDataSource contextWillSave:].cold.2(v15, v21);

                  v22 = (void *)MEMORY[0x1E0D641A8];
                  objc_msgSend(v15, "accountIdentifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "markAccountReindexedForMigration:", v23);

                  v20 = 0;
                  goto LABEL_17;
                }
              }
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v11)
          continue;
        break;
      }
      v20 = 1;
LABEL_17:
      v4 = v28;
      v5 = v27;
    }
    else
    {
      v20 = 1;
    }

    v24 = ICUseCoreDataCoreSpotlightIntegration();
    if ((v20 & 1) == 0 && (v24 & 1) == 0)
    {
      v25 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[ICHTMLSearchIndexerDataSource contextWillSave:].cold.1(v25);

      -[ICBaseSearchIndexerDataSource setNeedsReindexing:](self, "setNeedsReindexing:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "postNotificationName:object:", *MEMORY[0x1E0D64108], self);

    }
  }

}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  return 0;
}

- (id)addNotesFromSubtree:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error fetching HTML accounts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error fetching HTML folders: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error fetching HTML notes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)contextWillSave:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C88D8000, log, OS_LOG_TYPE_DEBUG, "A legacy account's migration state changed, so let's re-index everything.", v1, 2u);
}

- (void)contextWillSave:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1C88D8000, a2, OS_LOG_TYPE_DEBUG, "legacy account %@ migration state changed to YES, so let's re-index everything.", v4, 0xCu);

}

@end
