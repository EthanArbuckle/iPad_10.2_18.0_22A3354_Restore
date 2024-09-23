@implementation NSManagedObjectContext(IC)

- (uint64_t)ic_existingObjectWithID:()IC
{
  return objc_msgSend(MEMORY[0x1E0C97B80], "ic_existingObjectWithID:context:", a3, a1);
}

- (id)ic_objectIDFromURL:()IC
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_managedObjectIDForURIRepresentation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)ic_refreshObject:()IC mergeChanges:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;

  v6 = a3;
  objc_msgSend(a1, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStores");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistentStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "containsObject:", v10);

  if (v11)
  {
    objc_msgSend(a1, "refreshObject:mergeChanges:", v6, a4);
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[NSManagedObjectContext(IC) ic_refreshObject:mergeChanges:].cold.1(v6, v12);

  }
}

- (uint64_t)ic_saveWithLogDescription:()IC arguments:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, a4);
  else
    v7 = 0;
  objc_msgSend(a1, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    if ((objc_msgSend(a1, "hasChanges") & 1) != 0)
    {
      v15 = 0;
      v11 = objc_msgSend(a1, "save:", &v15);
      v12 = v15;
      if ((v11 & 1) != 0)
      {
        v13 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:].cold.2();
      }
      else
      {
        +[ICTelemetryManager postBasicEvent:](ICTelemetryManager, "postBasicEvent:", 5);
        v13 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:].cold.3();
      }

    }
    else
    {
      v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:].cold.4();
      v11 = 1;
    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NSManagedObjectContext(IC) ic_saveWithLogDescription:arguments:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (uint64_t)ic_saveWithLogDescription:()IC
{
  return objc_msgSend(a1, "ic_saveWithLogDescription:arguments:", a3, &a9);
}

- (id)ic_debugName
{
  return objc_getAssociatedObject(a1, (const void *)ICNSManagedObjectContextDebugNameKey);
}

- (void)setIc_debugName:()IC
{
  objc_setAssociatedObject(a1, (const void *)ICNSManagedObjectContextDebugNameKey, a3, (void *)0x301);
}

- (BOOL)ic_isMainThreadContext
{
  return objc_msgSend(a1, "concurrencyType") == 2;
}

- (uint64_t)ic_save
{
  return objc_msgSend(a1, "ic_saveWithLogDescription:", 0);
}

- (void)ic_performBlock:()IC andPerformBlockOnMainThread:
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__NSManagedObjectContext_IC__ic_performBlock_andPerformBlockOnMainThread___block_invoke;
  v10[3] = &unk_1EA824F80;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "performBlock:", v10);

}

- (void)ic_performBlockAndWait:()IC andPerformBlockAndWaitOnMainThread:
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__NSManagedObjectContext_IC__ic_performBlockAndWait_andPerformBlockAndWaitOnMainThread___block_invoke;
  v9[3] = &unk_1EA8249D8;
  v10 = v6;
  v8 = v6;
  v7 = a4;
  objc_msgSend(a1, "performBlockAndWait:", v9);
  performBlockOnMainThreadAndWait(v7);

}

- (id)ic_objectsWithIDs:()IC
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_FAULT, "Cannot save context because it doesn't have any persistent stores {description: %@}", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Saved context {description: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DDAA5000, v1, OS_LOG_TYPE_ERROR, "Cannot save context {error: %@, description: %@}", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)ic_saveWithLogDescription:()IC arguments:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Not saving context because it has no changes {description: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ic_refreshObject:()IC mergeChanges:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Not refreshing object because persistent store is not reachable {objectID: %@, persistentStore: %@}", (uint8_t *)&v7, 0x16u);

}

@end
