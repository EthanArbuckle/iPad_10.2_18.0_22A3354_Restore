@implementation PFCloudKitHistoryAnalyzerContext

- (PFCloudKitHistoryAnalyzerContext)initWithOptions:(id)a3 managedObjectContext:(id)a4 store:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  PFCloudKitHistoryAnalyzerContext *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@");
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a3);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = a3;
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@", buf, 0xCu);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v17 = -[PFHistoryAnalyzerContext initWithOptions:](&v30, sel_initWithOptions_, a3);
  if (v17)
  {
    v17->_managedObjectContext = (NSManagedObjectContext *)a4;
    v17->_resetChangedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17->_entityIDToChangedPrimaryKeySet = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = (void *)MEMORY[0x18D76B4E4]();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(a5, "configurationName"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v24++), "name"));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v22);
    }
    v17->_configuredEntityNames = (NSSet *)objc_msgSend(v19, "copy");

    objc_autoreleasePoolPop(v18);
    v17->_store = (NSSQLCore *)a5;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  -[PFHistoryAnalyzerContext dealloc](&v3, sel_dealloc);
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  PFHistoryAnalyzerOptions *options;
  unsigned __int8 v8;
  BOOL result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[NSSet containsObject:](self->_configuredEntityNames, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "changedObjectID"), "entity"), "name")))
  {
    v10 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v11 = 9;
    else
      v11 = __ckLoggingOverride;
    v12 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Skipping change because its entity is not in the configured set of entities for this store: %@"));
    objc_msgSend(a3, "changedObjectID");
    _NSCoreDataLog(v11, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[PFCloudKitHistoryAnalyzerContext processChange:error:]");
    objc_autoreleasePoolPop(v10);
    return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  }
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import")) & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "contextName"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.reset")))
  {
    options = self->super._options;
    if (!options || !BYTE1(options[1].super.isa))
    {
      if (objc_msgSend(a3, "changeType") == 2
        && !-[PFCloudKitHistoryAnalyzerContext resetStateForObjectID:error:](self, "resetStateForObjectID:error:", objc_msgSend(a3, "changedObjectID"), a4))
      {
        return 0;
      }
      return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    }
  }
  else if (objc_msgSend(a3, "changeType") != 2 && objc_msgSend((id)objc_msgSend(a3, "updatedProperties"), "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = (void *)objc_msgSend(a3, "updatedProperties");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v20)
      return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    v21 = v20;
    v22 = *(_QWORD *)v26;
LABEL_25:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v22)
        objc_enumerationMutation(v19);
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23), "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue"))break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v21)
          goto LABEL_25;
        if (self)
          return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
              || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
        return 0;
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v8 = -[PFHistoryAnalyzerContext processChange:error:](&v24, sel_processChange_error_, a3, a4);
  result = 0;
  if (self && (v8 & 1) != 0)
    return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  return result;
}

- (BOOL)_flushPendingAnalyzerStates:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL8 v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__56;
  v25 = __Block_byref_object_dispose__56;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v4 = *(void **)(a1 + 56);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke;
  v16[3] = &unk_1E1EDEE18;
  v16[4] = a1;
  v16[5] = &v17;
  v16[6] = &v21;
  objc_msgSend(v4, "performBlockAndWait:", v16);
  if (!*((_BYTE *)v18 + 24)
    || (objc_msgSend(*(id *)(a1 + 24), "removeAllObjects"),
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects"),
        objc_msgSend(*(id *)(a1 + 72), "removeAllObjects"),
        objc_msgSend(*(id *)(a1 + 80), "removeAllObjects"),
        !*((_BYTE *)v18 + 24)))
  {
    v5 = (id)v22[5];
    if (v5)
    {
      if (a2)
        *a2 = v5;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
        v29 = 1024;
        v30 = 198;
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  v14 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSFetchRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSManagedObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v1 = (_QWORD *)result;
  v67 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = *(_QWORD *)(result + 32);
    v3 = v2 ? *(void **)(v2 + 24) : 0;
    result = objc_msgSend(v3, "count");
    if (result)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = *(id *)(v1[4] + 80);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      v47 = result;
      if (result)
      {
        v46 = *(_QWORD *)v59;
        while (2)
        {
          v4 = 0;
          do
          {
            if (*(_QWORD *)v59 != v46)
              objc_enumerationMutation(obj);
            v5 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v4);
            v6 = objc_msgSend(*(id *)(v1[4] + 80), "objectForKey:", v5);
            v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"));
            -[NSFetchRequest setPredicate:](v7, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ AND entityPK in %@"), v5, v6));
            v8 = (void *)objc_msgSend(*(id *)(v1[4] + 56), "executeFetchRequest:error:", v7, *(_QWORD *)(v1[6] + 8) + 40);
            if (!v8)
            {
              *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = 0;
              result = (uint64_t)*(id *)(*(_QWORD *)(v1[6] + 8) + 40);
              goto LABEL_35;
            }
            v9 = v8;
            v48 = v4;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v55;
              do
              {
                v13 = 0;
                do
                {
                  if (*(_QWORD *)v55 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v13);
                  v15 = objc_msgSend(v14, "analyzedObjectID");
                  v16 = v1[4];
                  if (v16)
                    v17 = *(void **)(v16 + 24);
                  else
                    v17 = 0;
                  v18 = (id)objc_msgSend(v17, "objectForKey:", v15);
                  if (v18)
                  {
                    objc_msgSend(v14, "mergeWithState:", v18);
                    v19 = v1[4];
                    if (v19)
                      v20 = *(void **)(v19 + 24);
                    else
                      v20 = 0;
                    objc_msgSend(v20, "removeObjectForKey:", v15);
                  }
                  else if (objc_msgSend(*(id *)(v1[4] + 72), "containsObject:", v15))
                  {
                    objc_msgSend(*(id *)(v1[4] + 56), "deleteObject:", v14);
                  }
                  else
                  {
                    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "History parsing corruption detected. An existing analyzer state was fetched from the database for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache.");
                    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, v15);
                    v28 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v64 = v15;
                      _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: History parsing corruption detected. An existing analyzer state was fetched from the database for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache.", buf, 0xCu);
                    }
                  }

                  ++v13;
                }
                while (v11 != v13);
                v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
                v11 = v29;
              }
              while (v29);
            }
            v4 = v48 + 1;
          }
          while (v48 + 1 != v47);
          result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          v47 = result;
          if (result)
            continue;
          break;
        }
      }
    }
  }
LABEL_35:
  if (*(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v30 = v1[4];
    v31 = v30 ? *(void **)(v30 + 24) : 0;
    result = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (result)
    {
      v32 = result;
      v33 = *(_QWORD *)v51;
      v49 = v31;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v51 != v33)
            objc_enumerationMutation(v49);
          v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v34);
          v36 = v1[4];
          if (v36)
            v37 = *(void **)(v36 + 24);
          else
            v37 = 0;
          v38 = (id)objc_msgSend(v37, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v34));
          v39 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"), *(_QWORD *)(v1[4] + 56));
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", objc_msgSend(v38, "originalTransactionNumber"), CFSTR("originalTransactionNumber"));
          -[NSManagedObject setOriginalChangeTypeNum:](v39, "setOriginalChangeTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v38, "originalChangeType")));
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", objc_msgSend(v38, "finalTransactionNumber"), CFSTR("finalTransactionNumber"));
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", objc_msgSend(v38, "finalChangeAuthor"), CFSTR("finalChangeAuthor"));
          -[NSManagedObject setFinalChangeTypeNum:](v39, "setFinalChangeTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v38, "finalChangeType")));
          v40 = _sqlEntityForEntityDescription(objc_msgSend(*(id *)(v1[4] + 88), "model"), (_QWORD *)objc_msgSend(v35, "entity"));
          if (v40)
            v41 = *(unsigned int *)(v40 + 184);
          else
            v41 = 0;
          -[NSManagedObject setEntityId:](v39, "setEntityId:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41));
          -[NSManagedObject setEntityPK:](v39, "setEntityPK:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v35, "_referenceData64")));
          objc_msgSend(*(id *)(v1[4] + 56), "assignObject:toPersistentStore:", v39, *(_QWORD *)(v1[4] + 88));

          ++v34;
        }
        while (v32 != v34);
        result = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        v32 = result;
      }
      while (result);
    }
  }
  v42 = v1[5];
  if (*(_BYTE *)(*(_QWORD *)(v42 + 8) + 24))
  {
    v43 = v1[4];
    if (v43)
    {
      v44 = *(_QWORD *)(v43 + 48);
      if (v44)
      {
        result = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), v44, *(_QWORD *)(v43 + 88), *(void **)(v43 + 56), (_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40));
        v42 = v1[5];
        if (!result)
        {
          *(_BYTE *)(*(_QWORD *)(v42 + 8) + 24) = 0;
          result = (uint64_t)*(id *)(*(_QWORD *)(v1[6] + 8) + 40);
          v42 = v1[5];
        }
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(v42 + 8) + 24))
  {
    result = objc_msgSend(*(id *)(v1[4] + 56), "save:", *(_QWORD *)(v1[6] + 8) + 40);
    if ((result & 1) == 0)
      return (uint64_t)*(id *)(*(_QWORD *)(v1[6] + 8) + 40);
  }
  return result;
}

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_super v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v18 = 0;
  v7 = -[PFHistoryAnalyzerContext resetStateForObjectID:error:](&v17, sel_resetStateForObjectID_error_, a3, &v18);
  if (v7)
  {
    -[NSMutableSet addObject:](self->_resetChangedObjectIDs, "addObject:", a3);
  }
  else if (v18)
  {
    if (a4)
      *a4 = v18;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
    v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      v21 = 1024;
      v22 = 220;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v7;
}

- (BOOL)reset:(id *)a3
{
  NSBatchDeleteRequest *v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_super v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v18 = 0;
  if (!-[PFHistoryAnalyzerContext reset:](&v17, sel_reset_, &v18)
    || (-[NSMutableDictionary removeAllObjects](self->_entityIDToChangedPrimaryKeySet, "removeAllObjects"),
        -[NSMutableSet removeAllObjects](self->_resetChangedObjectIDs, "removeAllObjects"),
        v5 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"))), -[NSBatchDeleteRequest setResultType:](v5, "setResultType:", 0), v6 = objc_msgSend((id)-[NSPersistentStoreResult result](-[NSManagedObjectContext executeRequest:error:](self->_managedObjectContext, "executeRequest:error:", v5, &v18), "result"), "BOOLValue"), v5, !v6))
  {
    if (v18)
    {
      if (a3)
      {
        LOBYTE(v7) = 0;
        *a3 = v18;
        return v7;
      }
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      v15 = __pflogFaultLog;
      v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v7)
        return v7;
      *(_DWORD *)buf = 136315394;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      v21 = 1024;
      v22 = 243;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v7) = 0;
    return v7;
  }
  -[NSManagedObjectContext reset](self->_managedObjectContext, "reset");
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)finishProcessing:(id *)a3
{
  PFHistoryAnalyzerOptions *options;
  NSFetchRequest *v6;
  NSBatchDeleteRequest *v7;
  char v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v20 = 0;
  if (!-[PFHistoryAnalyzerContext finishProcessing:](&v19, sel_finishProcessing_, &v20)
    || !-[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, &v20)
    || self
    && (options = self->super._options) != 0
    && options->_automaticallyPruneTransientRecords
    && (v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath")), -[NSFetchRequest setPredicate:](v6, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("originalChangeTypeNum = %@ AND finalChangeTypeNum = %@"), &unk_1E1F4B7F8, &unk_1E1F4B810)), v7 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v6), -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0), v8 = objc_msgSend((id)-[NSPersistentStoreResult result](
                     -[NSManagedObjectContext executeRequest:error:](self->_managedObjectContext, "executeRequest:error:", v7, &v20), "result"), "BOOLValue"), v7, (v8 & 1) == 0))
  {
    if (v20)
    {
      if (a3)
      {
        LOBYTE(v9) = 0;
        *a3 = v20;
        return v9;
      }
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      v17 = __pflogFaultLog;
      v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9)
        return v9;
      *(_DWORD *)buf = 136315394;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      v23 = 1024;
      v24 = 268;
      _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v9) = 0;
    return v9;
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (id)fetchSortedStates:(id *)a3
{
  NSFetchRequest *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"));
  v7[0] = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("finalTransactionNumber"), 1);
  -[NSFetchRequest setSortDescriptors:](v5, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  -[NSFetchRequest setFetchBatchSize:](v5, "setFetchBatchSize:", 200);
  return -[NSManagedObjectContext executeFetchRequest:error:](self->_managedObjectContext, "executeFetchRequest:error:", v5, a3);
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSMutableDictionary *entityIDToChangedPrimaryKeySet;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v5 = -[PFHistoryAnalyzerContext newAnalyzerStateForChange:error:](&v12, sel_newAnalyzerStateForChange_error_, a3, a4);
  if (v5)
  {
    v6 = _sqlEntityForEntityDescription((uint64_t)-[NSSQLCore model](self->_store, "model"), (_QWORD *)objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "entity"));
    if (v6)
      v7 = *(unsigned int *)(v6 + 184);
    else
      v7 = 0;
    v8 = (id)-[NSMutableDictionary objectForKey:](self->_entityIDToChangedPrimaryKeySet, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      entityIDToChangedPrimaryKeySet = self->_entityIDToChangedPrimaryKeySet;
      if (v6)
        v10 = *(unsigned int *)(v6 + 184);
      else
        v10 = 0;
      -[NSMutableDictionary setObject:forKey:](entityIDToChangedPrimaryKeySet, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
    }
    objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "_referenceData64")));

  }
  return v5;
}

@end
