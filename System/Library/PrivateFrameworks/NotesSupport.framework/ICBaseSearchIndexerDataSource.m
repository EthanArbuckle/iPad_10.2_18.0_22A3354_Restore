@implementation ICBaseSearchIndexerDataSource

- (NSURL)stateFileURL
{
  void *v3;
  void *v4;
  void *v5;

  +[ICPaths applicationDocumentsURL](ICPaths, "applicationDocumentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource stateFilename](self, "stateFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (id)moveIndexingTrackingFromUserDefaultsToFileIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  os_log_t v9;
  os_log_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource stateFilename](self, "stateFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ICBaseSearchIndexerDataSource stateFilename](self, "stateFilename");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl(&dword_1DDAA5000, v6, OS_LOG_TYPE_INFO, "Moving Indexing Tracking from UserDefaults to file for %@.", buf, 0xCu);

    }
    v38 = 0;
    v36 = 0;
    v37 = 0;
    v34 = 0;
    v35 = 0;
    -[ICBaseSearchIndexerDataSource _loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:](self, "_loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:", &v37, &v36, &v35, &v38, &v34);
    v8 = v37;
    v9 = (os_log_t)v36;
    v10 = (os_log_t)v35;
    v11 = v34;
    v12 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v12, "addEntriesFromDictionary:", v11);
    v13 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_1DDAA5000, v13, OS_LOG_TYPE_INFO, "Combined search indexer state dictionary: %@", buf, 0xCu);
    }

    v14 = -[ICBaseSearchIndexerDataSource saveStateDictionary:](self, "saveStateDictionary:", v12);
    -[NSObject path](v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v8, "fileExistsAtPath:", v15);

    if (v38 && !v10 && v14)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v16 = objc_claimAutoreleasedReturnValue();
      -[ICBaseSearchIndexerDataSource stateFilename](self, "stateFilename");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v16, "removeObjectForKey:", v17);

    }
    else
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ICBaseSearchIndexerDataSource moveIndexingTrackingFromUserDefaultsToFileIfNecessary].cold.1(&v38);
    }

    v28 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v25, "hasPrefix:", CFSTR("NotesIndexerState")))
            objc_msgSend(v8, "addObject:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      }
      while (v22);
    }

    v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[ICBaseSearchIndexerDataSource stateFilename](self, "stateFilename");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_1DDAA5000, v9, OS_LOG_TYPE_INFO, "Skipped moving index tracking data from user defaults: no data found for key %@. Other possibly related keys: %@", buf, 0x16u);

    }
    v28 = 0;
    v10 = v9;
  }

  return v28;
}

- (NSString)stateFilename
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICBaseSearchIndexerDataSource dataSourceIdentifier](self, "dataSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("NotesIndexerState-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)clearObjectIDsToIgnoreAndStageForReindexing
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a2, v3, "Observed %ld object IDs to ignore for %@ in NSArray format. Attempting to reindex these items", v4);
  OUTLINED_FUNCTION_13();
}

- (void)stopObservingChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Stopping observing changes %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setObservingChanges:(BOOL)a3
{
  self->_observingChanges = a3;
}

- (void)loadOrClearStateIfNecessary
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectIDsToProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(v4, "count");
  v9 = 1024;
  v10 = objc_msgSend(a1, "needsReindexing");
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Loaded indexing state for %@: objectIDs=%lu needsReindexing=%d", (uint8_t *)&v5, 0x1Cu);

}

- (id)loadStateDictionary
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  -[ICBaseSearchIndexerDataSource _loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:](self, "_loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:", &v11, &v10, 0, 0, &v9);
  v3 = v11;
  v4 = v10;
  v5 = v9;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource logFileSizeForFileAtPath:fileManager:](self, "logFileSizeForFileAtPath:fileManager:", v6, v3);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (void)logFileSizeForFileAtPath:(id)a3 fileManager:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(a4, "attributesOfItemAtPath:error:", a3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_1EA8321F0;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = os_log_create("com.apple.notes", "SearchIndexer");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      v12 = "Search indexer state dictionary file size: %@ bytes. error: %@";
      v13 = v10;
      v14 = 22;
LABEL_8:
      _os_log_impl(&dword_1DDAA5000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    v12 = "Search indexer state dictionary file size: %@ bytes.";
    v13 = v10;
    v14 = 12;
    goto LABEL_8;
  }

}

void __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "loadOrClearStateIfNecessary");
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    objc_msgSend(*v1, "objectIDsToProcess");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3)
    {
      v4 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICSearchIndexerDataSourceDidChangeNotification"), *v1);

    }
  }
}

- (NSMutableOrderedSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (BOOL)needsReindexing
{
  return self->_needsReindexing;
}

- (BOOL)_loadStateDictionaryWithFileManager:(id *)a3 fileURL:(id *)a4 NSError:(id *)a5 fileExists:(BOOL *)a6 savedDictionary:(id *)a7
{
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource stateFileURL](self, "stateFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

  v16 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = CFSTR("does not exist");
    if (v15)
      v17 = CFSTR("exists");
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_1DDAA5000, v16, OS_LOG_TYPE_INFO, "Search indexer saved state dictionary file %@.", buf, 0xCu);
  }

  if (!v15)
  {
    v19 = 0;
    v18 = (void *)MEMORY[0x1E0C9AA70];
LABEL_12:
    v21 = 1;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v13, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  if (!v19)
    goto LABEL_12;
  v20 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[ICBaseSearchIndexerDataSource _loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:].cold.1((uint64_t)v13);

  v21 = 0;
  if (a3)
LABEL_13:
    *a3 = objc_retainAutorelease(v12);
LABEL_14:
  if (a4)
    *a4 = objc_retainAutorelease(v13);
  if (a5)
    *a5 = objc_retainAutorelease(v19);
  if (a6)
    *a6 = v15;
  if (a7)
    *a7 = objc_retainAutorelease(v18);

  return v21;
}

- (void)startObservingChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Starting to observe changes %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)resetContextObservers
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C978B8];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C978B8], 0);

  if (-[ICBaseSearchIndexerDataSource isObservingChanges](self, "isObservingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contextWillSave_, v4, 0);

  }
}

- (BOOL)isObservingChanges
{
  return self->_observingChanges;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (ICBaseSearchIndexerDataSource)init
{
  ICBaseSearchIndexerDataSource *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICBaseSearchIndexerDataSource;
  v2 = -[ICBaseSearchIndexerDataSource init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseSearchIndexerDataSource setObjectIDsToProcess:](v2, "setObjectIDsToProcess:", v3);

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseSearchIndexerDataSource setObjectIDsBeingProcessed:](v2, "setObjectIDsBeingProcessed:", v4);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.notes.index.data-source", v5, v6);
    -[ICBaseSearchIndexerDataSource setProcessingQueue:](v2, "setProcessingQueue:", v7);

    -[ICBaseSearchIndexerDataSource setObservingChanges:](v2, "setObservingChanges:", 0);
    -[ICBaseSearchIndexerDataSource setNeedsReindexing:](v2, "setNeedsReindexing:", 0);
  }
  return v2;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setObjectIDsToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToProcess, a3);
}

- (void)setObjectIDsBeingProcessed:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsBeingProcessed, a3);
}

- (void)setNeedsReindexing:(BOOL)a3
{
  self->_needsReindexing = a3;
}

- (NSString)uuid
{
  NSString *uuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  uuid = self->_uuid;
  if (!uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)dataSourceIdentifier
{
  return CFSTR("Unknown");
}

- (unint64_t)indexingPriority
{
  return 0;
}

- (id)persistentStoreCoordinator
{
  return 0;
}

- (id)newManagedObjectContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  -[ICBaseSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreCoordinator:", v4);

  return v3;
}

- (id)objectForSearchableItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 *p_buf;
  uint8_t v24[4];
  void *v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__ICBaseSearchIndexerDataSource_objectForSearchableItem_context___block_invoke;
    v20[3] = &unk_1EA823EA8;
    p_buf = &buf;
    v21 = v7;
    v22 = v10;
    objc_msgSend(v21, "performBlockAndWait:", v20);
    v11 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "conformsToProtocol:", &unk_1F04165D0);
    v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
    {
      v13 = v12;
    }
    else
    {
      if (v12)
      {
        v16 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v24 = 138412290;
          v25 = v18;
          _os_log_impl(&dword_1DDAA5000, v16, OS_LOG_TYPE_INFO, "Trying to get object for a searchable item that is not indexable: %@", v24, 0xCu);

        }
      }
      v13 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1DDAA5000, v14, OS_LOG_TYPE_INFO, "Could not get object ID for searchable item %@", (uint8_t *)&buf, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

void __65__ICBaseSearchIndexerDataSource_objectForSearchableItem_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v10 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (v5)
  {
    v8 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = a1[5];
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1DDAA5000, v8, OS_LOG_TYPE_INFO, "Error fetching object with ID %@: %@", buf, 0x16u);
    }

  }
}

- (id)objectForManagedObjectIDURI:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  os_log_t v12;
  objc_class *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICBaseSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_managedObjectIDForURIString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v16 = 0;
    objc_msgSend(v7, "existingObjectWithID:error:", v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v10)
    {
      if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1F04165D0) & 1) != 0)
      {
        v12 = v10;
        if (!-[NSObject isHiddenFromIndexing](v12, "isHiddenFromIndexing"))
          goto LABEL_13;
      }
      else
      {
        v12 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v18 = v14;
          v19 = 2112;
          v20 = v6;
          _os_log_impl(&dword_1DDAA5000, v12, OS_LOG_TYPE_INFO, "Found %@ for objectIDURI %@, but it's not a search indexable object", buf, 0x16u);

        }
      }
    }
    else
    {
      v12 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1DDAA5000, v12, OS_LOG_TYPE_INFO, "No managed object for searchable item %@: %@", buf, 0x16u);
      }
    }

    v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)searchableItemResultForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  ICSearchableItemResult *v18;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URIRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class())
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("<ICSearchIndexable>");
  }
  v10 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICBaseSearchIndexerDataSource searchableItemResultForObject:].cold.3((uint64_t)v9);

  if (v5 && v7)
  {
    objc_msgSend(v4, "searchableItemAttributeSet");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
      objc_msgSend(v4, "searchIndexingIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUniqueIdentifier:", v13);

      objc_msgSend(v4, "searchDomainIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDomainIdentifier:", v14);

      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setExpirationDate:", v15);

      -[ICBaseSearchIndexerDataSource dataSourceIdentifier](self, "dataSourceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIc_dataSourceIdentifier:](v11, "setIc_dataSourceIdentifier:", v16);

      objc_msgSend(v12, "setAttributeSet:", v11);
      -[NSObject eligibleForPhotosProcessing](v11, "eligibleForPhotosProcessing");
      v17 = (os_log_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIsUpdate:", -[NSObject BOOLValue](v17, "BOOLValue"));
    }
    else
    {
      v17 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ICBaseSearchIndexerDataSource searchableItemResultForObject:].cold.1((uint64_t)v4, (uint64_t)v7, v17);

      v12 = 0;
    }

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICBaseSearchIndexerDataSource searchableItemResultForObject:].cold.2((uint64_t)v9);
    v12 = 0;
  }

  v18 = objc_alloc_init(ICSearchableItemResult);
  -[ICSearchableItemResult setSearchableItem:](v18, "setSearchableItem:", v12);

  return v18;
}

- (id)additionalItemsForObject:(id)a3
{
  return 0;
}

- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3
{
  return 0;
}

- (void)contextWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  NSObject *v45;
  void *v46;
  char v47;
  void *v48;
  objc_class *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  id obj;
  ICBaseSearchIndexerDataSource *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD block[4];
  id v62;
  ICBaseSearchIndexerDataSource *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      v53 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertedObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        objc_msgSend(v5, "insertedObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v13);

      }
      objc_msgSend(v5, "updatedObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        objc_msgSend(v5, "updatedObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v16);

      }
      objc_msgSend(v5, "deletedObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        objc_msgSend(v5, "deletedObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v19);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v5);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      obj = v10;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v58)
      {
        v57 = *(_QWORD *)v71;
        v56 = self;
        do
        {
          for (i = 0; i != v58; ++i)
          {
            if (*(_QWORD *)v71 != v57)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            v22 = (void *)objc_opt_new();
            if (-[ICBaseSearchIndexerDataSource isFolderWithServerShareChanged:](self, "isFolderWithServerShareChanged:", v21))
            {
              objc_msgSend(v54, "addObject:", v21);
            }
            if (objc_msgSend(v21, "conformsToProtocol:", &unk_1F04166C8))
            {
              objc_msgSend(v21, "targetSearchIndexable");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "ic_addNonNilObject:", v23);

            }
            else if (objc_msgSend(v21, "conformsToProtocol:", &unk_1F04165D0))
            {
              objc_msgSend(v22, "ic_addNonNilObject:", v21);
            }
            if (objc_msgSend(v22, "count"))
            {
              objc_msgSend(v22, "firstObject");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_opt_respondsToSelector();

              if ((v25 & 1) != 0)
              {
                v26 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(v21, "changedValues");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "allKeys");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setWithArray:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "firstObject");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "additionalSearchIndexablesForChangedKeys:", v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v31, "count"))
                {
                  objc_msgSend(v31, "allObjects");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "ic_addObjectsFromNonNilArray:", v32);

                }
              }
              v59 = v22;
              v60 = i;
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v33 = v22;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v67;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v67 != v36)
                      objc_enumerationMutation(v33);
                    v38 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
                    objc_msgSend(v38, "objectID");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "isTemporaryID");

                    if (v40)
                    {
                      objc_msgSend(v38, "managedObjectContext");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = v38;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = 0;
                      v43 = objc_msgSend(v41, "obtainPermanentIDsForObjects:error:", v42, &v65);
                      v44 = v65;

                      if ((v43 & 1) == 0)
                      {
                        v45 = os_log_create("com.apple.notes", "SearchIndexer");
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
                          v49 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v49);
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v75 = v50;
                          v76 = 2112;
                          v77 = v44;
                          _os_log_error_impl(&dword_1DDAA5000, v45, OS_LOG_TYPE_ERROR, "Error obtaining permanent ID for %@: %@", buf, 0x16u);

                        }
                      }

                    }
                    objc_msgSend(v38, "objectID");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v46, "isTemporaryID");

                    if ((v47 & 1) == 0)
                    {
                      objc_msgSend(v38, "objectID");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "addObject:", v48);

                    }
                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
                }
                while (v35);
              }

              self = v56;
              v22 = v59;
              i = v60;
            }

          }
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        }
        while (v58);
      }

      if (objc_msgSend(v9, "count") || objc_msgSend(v54, "count"))
      {
        -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
        v51 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__ICBaseSearchIndexerDataSource_contextWillSave___block_invoke;
        block[3] = &unk_1EA823ED0;
        v62 = v54;
        v63 = self;
        v64 = v9;
        dispatch_async(v51, block);

      }
      v5 = v52;
      v4 = v53;
    }

  }
}

uint64_t __49__ICBaseSearchIndexerDataSource_contextWillSave___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[5], "addNotesFromSubtree:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "addObjectsFromArray:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  result = objc_msgSend(a1[6], "count");
  if (result)
  {
    result = objc_msgSend(a1[5], "addNewObjectsForProcessing:", a1[6]);
    if ((_DWORD)result)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICSearchIndexerDataSourceDidChangeNotification"), a1[5]);

      return objc_msgSend(a1[5], "saveStateIfNecessary");
    }
  }
  return result;
}

- (BOOL)addNewObjectsForProcessing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICBaseSearchIndexerDataSource objectIDsToProcess](self, "objectIDsToProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[ICBaseSearchIndexerDataSource objectIDsToProcess](self, "objectIDsToProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v4);

  -[ICBaseSearchIndexerDataSource objectIDsToProcess](self, "objectIDsToProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v4);

  -[ICBaseSearchIndexerDataSource objectIDsToProcess](self, "objectIDsToProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v9) ^ 1;

  return (char)v4;
}

- (id)addNotesFromSubtree:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  return 0;
}

- (id)indexableObjectIDsWithURIs:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  ICBaseSearchIndexerDataSource *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ICBaseSearchIndexerDataSource_indexableObjectIDsWithURIs_context___block_invoke;
  v11[3] = &unk_1EA823DD8;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __68__ICBaseSearchIndexerDataSource_indexableObjectIDsWithURIs_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v2;

}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99D20]);
}

- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isDeleted") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isHiddenFromIndexing") ^ 1;

  return v4;
}

- (id)objectIDsNeedingProcessing
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICBaseSearchIndexerDataSource_objectIDsNeedingProcessing__block_invoke;
  v6[3] = &unk_1EA823D70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__ICBaseSearchIndexerDataSource_objectIDsNeedingProcessing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isPaperKitOrSynapseAttachment:(id)a3
{
  return 0;
}

- (int64_t)decisionOnObjectID:(id)a3 searchableItemToIndex:(id *)a4 additionalItemsToIndex:(id *)a5 objectIDURIToDelete:(id *)a6 additionalUniqueIdentifiersToDelete:(id *)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  _QWORD v20[4];
  id v21;
  id v22;
  ICBaseSearchIndexerDataSource *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v13 = a3;
  v14 = a8;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke;
  v20[3] = &unk_1EA823EF8;
  v15 = v14;
  v21 = v15;
  v16 = v13;
  v22 = v16;
  v23 = self;
  v24 = &v53;
  v25 = &v47;
  v26 = &v35;
  v27 = &v29;
  v28 = &v41;
  objc_msgSend(v15, "performBlockAndWait:", v20);
  if (a4)
    *a4 = objc_retainAutorelease((id)v48[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v36[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v30[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v42[5]);
  v17 = v54[3];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v17;
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v2 = (void *)MEMORY[0x1DF0E07C8]();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v30 = 0;
  objc_msgSend(v4, "existingObjectWithID:error:", v3, &v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v30;
  if (v5)
  {
    if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1F04165D0))
    {
      v7 = 0;
      goto LABEL_15;
    }
    v7 = v5;
    if (objc_msgSend(*(id *)(a1 + 48), "shouldIndexableObjectExistInIndexing:", v7))
    {
      v8 = objc_msgSend(*(id *)(a1 + 48), "isPaperKitOrSynapseAttachment:", v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v8)
        v10 = 3;
      else
        v10 = 1;
      goto LABEL_14;
    }
    v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_2((uint64_t *)(a1 + 40), v7, v12);

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_1();

    v7 = 0;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = 2;
LABEL_14:
  *(_QWORD *)(v9 + 24) = v10;
LABEL_15:
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v13 == 1)
  {
    if (!v7)
      goto LABEL_27;
    goto LABEL_22;
  }
  if (v13 == 3 && v7 != 0)
  {
LABEL_22:
    objc_msgSend(*(id *)(a1 + 48), "searchableItemResultForObject:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchableItem");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(v15, "additionalSearchableItems");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "additionalUniqueIdentifiersToDeleteForObject:", v7);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

    }
    objc_msgSend(*(id *)(a1 + 40), "URIRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "absoluteString");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
LABEL_27:
  objc_msgSend(v5, "managedObjectContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "refreshObject:mergeChanges:", v5, 0);

  objc_autoreleasePoolPop(v2);
}

- (void)searchIndexerWillIndexObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICBaseSearchIndexerDataSource_searchIndexerWillIndexObjectIDs___block_invoke;
  v7[3] = &unk_1EA823F20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__ICBaseSearchIndexerDataSource_searchIndexerWillIndexObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "objectIDsBeingProcessed");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

- (void)searchIndexerDidFinishIndexingObjectIDs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICBaseSearchIndexerDataSource_searchIndexerDidFinishIndexingObjectIDs_error___block_invoke;
    block[3] = &unk_1EA823ED0;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __79__ICBaseSearchIndexerDataSource_searchIndexerDidFinishIndexingObjectIDs_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectIDsBeingProcessed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObjects:atIndexes:", *(_QWORD *)(a1 + 40), v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "saveStateIfNecessary");
}

- (void)searchIndexerWillDeleteSearchableItemsWithObjectIDURIs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICBaseSearchIndexerDataSource *v9;

  v4 = a3;
  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__ICBaseSearchIndexerDataSource_searchIndexerWillDeleteSearchableItemsWithObjectIDURIs___block_invoke;
  v7[3] = &unk_1EA823F20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __88__ICBaseSearchIndexerDataSource_searchIndexerWillDeleteSearchableItemsWithObjectIDURIs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v19;
    *(_QWORD *)&v4 = 138412290;
    v17 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", v17, (_QWORD)v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectIDsBeingProcessed");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v10);

          objc_msgSend(*(id *)(a1 + 40), "objectIDsToProcess");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v10);

          v13 = os_log_create("com.apple.notes", "SearchIndexer");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            goto LABEL_10;
          *(_DWORD *)buf = v17;
          v23 = v10;
          v14 = v13;
          v15 = "About to delete item from index: %@";
        }
        else
        {
          v13 = os_log_create("com.apple.notes", "SearchIndexer");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            goto LABEL_10;
          *(_DWORD *)buf = v17;
          v23 = v8;
          v14 = v13;
          v15 = "About to delete an objectIDURI from the index, but we cannot retrieve its object ID: %@";
        }
        _os_log_debug_impl(&dword_1DDAA5000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 0xCu);
LABEL_10:

        ++v7;
      }
      while (v5 != v7);
      v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v5 = v16;
    }
    while (v16);
  }

}

- (void)searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  ICBaseSearchIndexerDataSource *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__ICBaseSearchIndexerDataSource_searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs_error___block_invoke;
    block[3] = &unk_1EA823ED0;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __101__ICBaseSearchIndexerDataSource_searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs_error___block_invoke(uint64_t a1)
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_managedObjectIDForURIString:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectIDsBeingProcessed");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeObject:", v9);

          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(*(id *)(a1 + 40), "objectIDsToProcess");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "insertObject:atIndex:", v9, 0);

          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "saveStateIfNecessary");
}

- (void)stageForReindexingWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (ICVerboseSearchLogging())
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICBaseSearchIndexerDataSource stageForReindexingWithContext:].cold.1();

  }
  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke;
  v8[3] = &unk_1EA823F20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;

  if (ICVerboseSearchLogging())
  {
    v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_4();

  }
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICVerboseSearchLogging())
  {
    v7 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_3();

  }
  if (v6)
  {
    v8 = objc_msgSend(*v5, "addNewObjectsForProcessing:", v6);
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_2();

    v8 = 0;
  }
  v10 = objc_msgSend(*v5, "needsReindexing");
  objc_msgSend(*v5, "setNeedsReindexing:", 0);
  if (ICVerboseSearchLogging())
  {
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_1();

  }
  if ((v10 | v8) == 1)
    objc_msgSend(*v5, "saveStateIfNecessary");

}

- (void)clearObjectIDsToProcess
{
  NSObject *v3;
  _QWORD block[5];

  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICBaseSearchIndexerDataSource_clearObjectIDsToProcess__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __56__ICBaseSearchIndexerDataSource_clearObjectIDsToProcess__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "saveStateIfNecessary");
  }
}

- (void)stageObjectIDURIsForIndexing:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICBaseSearchIndexerDataSource processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke;
  block[3] = &unk_1EA823ED0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "indexableObjectIDsWithURIs:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(*v1, "addNewObjectsForProcessing:", v2))
      objc_msgSend(*v1, "saveStateIfNecessary");
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke_cold_1();

  }
}

- (id)objectIDsFromSearchableItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICBaseSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_managedObjectIDForURIString:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v5, "addObject:", v14);
        }
        else
        {
          v15 = os_log_create("com.apple.notes", "SearchIndexer");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[ICBaseSearchIndexerDataSource objectIDsFromSearchableItems:].cold.1(v21, v11, &v22, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)saveStateIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "saveStateIfNecessary: started for data source %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__ICBaseSearchIndexerDataSource_saveStateIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertObject:atIndex:", v5, a3);

}

void __53__ICBaseSearchIndexerDataSource_saveStateIfNecessary__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertObject:atIndex:", v5, a3);

}

void __60__ICBaseSearchIndexerDataSource_loadOrClearStateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_managedObjectIDForURIString:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

- (BOOL)saveStateDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13[2];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource stateFileURL](self, "stateFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v7 = objc_msgSend(v4, "writeToURL:error:", v6, v13);
  v8 = v13[0];
  v9 = os_log_create("com.apple.notes", "SearchIndexer");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1DDAA5000, v10, OS_LOG_TYPE_INFO, "Wrote search indexer saved state dictionary to file: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ICBaseSearchIndexerDataSource saveStateDictionary:].cold.2();
  }

  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseSearchIndexerDataSource logFileSizeForFileAtPath:fileManager:](self, "logFileSizeForFileAtPath:fileManager:", v11, v5);

  return v7;
}

+ (id)didReindexForMigrationUserDefaultKeyForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DidReindexForMigration-%@"), a3);
}

+ (BOOL)isAccountReindexedForMigration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "didReindexForMigrationUserDefaultKeyForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ICBaseSearchIndexerDataSource isAccountReindexedForMigration:].cold.1();

  return v8;
}

+ (void)markAccountReindexedForMigration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ICBaseSearchIndexerDataSource markAccountReindexedForMigration:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "didReindexForMigrationUserDefaultKeyForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v7);

}

- (NSMutableOrderedSet)objectIDsBeingProcessed
{
  return self->_objectIDsBeingProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsBeingProcessed, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)searchableItemResultForObject:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a3, v6, "Skipping creation of searchable item with no attribute set %@, (%@)", v7);

  OUTLINED_FUNCTION_11();
}

- (void)searchableItemResultForObject:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v1, v2, "Skipping creation of searchable item without object ID %@ (%@)", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)searchableItemResultForObject:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v1, v2, "Creating searchable item for %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "We have object IDs to process after starting to observe changes %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v1, v2, "Cannot fetch object for objectID when evaluating if we should delete the object %@. Error = %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_2(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isDeleted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isHiddenFromIndexing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1DDAA5000, a3, OS_LOG_TYPE_DEBUG, "Will delete indexing for objectID because it is deleted from database or is hidden from indexing %@, deleted=%@, isHiddenFromIndexing=%@", (uint8_t *)&v8, 0x20u);

}

- (void)stageForReindexingWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "stageForReindexingWithContext: dispatching to processing queue from data source %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "stageForReindexingWithContext: changed = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "%@ Error fetching allIndexableObjectIDsInReversedReindexingOrder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v1, v2, "stageForReindexingWithContext: data source %@ retrieved objectIDsToProcess %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "stageForReindexingWithContext: begin staging for data source %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "%@ Error fetching through indexableObjectIDsWithURIs:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)objectIDsFromSearchableItems:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1DDAA5000, a4, OS_LOG_TYPE_DEBUG, "No object ID for searchable item: %@", a1, 0xCu);

}

- (void)moveIndexingTrackingFromUserDefaultsToFileIfNecessary
{
  const __CFString *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = CFSTR("File exists");
  if (!*a1)
    v1 = CFSTR("File doesn't exist");
  LODWORD(v4) = 138412546;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_1DDAA5000, v2, v3, "Failed to write state dictionary to file. %@ (error: %@)", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

- (void)_loadStateDictionaryWithFileManager:(uint64_t)a1 fileURL:NSError:fileExists:savedDictionary:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_1DDAA5000, v1, v2, "Error loading saved state dictionary from url: %@ Error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)saveStateDictionary:(_QWORD *)a3 .cold.1(void *a1, uint64_t a2, _QWORD *a3, NSObject **a4)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = objc_begin_catch(a1);
  *a3 = v6;
  v7 = v6;
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  *a4 = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_error_impl(&dword_1DDAA5000, v8, OS_LOG_TYPE_ERROR, "An exception is thrown when writing search indexer saved state dictionary to file: %@", (uint8_t *)&v9, 0xCu);
  }
  OUTLINED_FUNCTION_11();
}

- (void)saveStateDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Could not write search indexer saved state dictionary to file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isAccountReindexedForMigration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v0, v1, "Evaluating account for reindexed after migration: %@. result: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)markAccountReindexedForMigration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Adding account for reindexed after migration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
