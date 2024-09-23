@implementation NSPersistentCloudKitContainer

- (NSPersistentCloudKitContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  NSPersistentCloudKitContainer *v4;
  NSPersistentCloudKitContainer *v5;
  void *v6;
  id v7;
  NSPersistentCloudKitContainerOptions *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSPersistentCloudKitContainer;
  v4 = -[NSPersistentContainer initWithName:managedObjectModel:](&v10, sel_initWithName_managedObjectModel_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_operationTimeout = 30;
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = +[NSPersistentCloudKitContainer discoverDefaultContainerIdentifier](NSPersistentCloudKitContainer, "discoverDefaultContainerIdentifier");
    if (v7)
    {
      v8 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]([NSPersistentCloudKitContainerOptions alloc], "initWithContainerIdentifier:", v7);
      objc_msgSend(-[NSArray lastObject](-[NSPersistentContainer persistentStoreDescriptions](v5, "persistentStoreDescriptions"), "lastObject"), "setCloudKitContainerOptions:", v8);

    }
    v5->_metadataContext = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v5->_metadataContext, "setPersistentStoreCoordinator:", -[NSPersistentContainer persistentStoreCoordinator](v5, "persistentStoreCoordinator"));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v5->_metadataContext, "_setAllowAncillaryEntities:", 1);
    -[NSManagedObjectContext setMergePolicy:](v5->_metadataContext, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    objc_autoreleasePoolPop(v6);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainer;
  -[NSPersistentContainer dealloc](&v3, sel_dealloc);
}

- (void)setPersistentStoreDescriptions:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "containerIdentifier");
        v11 = v10;
        if (v10 && objc_msgSend(v10, "length"))
        {
          v12 = (void *)objc_msgSend(v5, "objectForKey:", v11);
          if (v12)
          {
            v13 = objc_msgSend((id)objc_msgSend(v12, "cloudKitContainerOptions"), "databaseScope");
            if (v13 == objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "databaseScope"))
            {
              v14 = (void *)MEMORY[0x1E0C99DA0];
              v21 = CFSTR("storeURL");
              v22 = objc_msgSend(v9, "URL");
              v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
              objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot assign the same iCloud Container Identifier to multiple persistent stores with the same database scope."), v15));
            }
          }
          else
          {
            objc_msgSend(v5, "setObject:forKey:", v9, v11);
          }
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  v16.receiver = self;
  v16.super_class = (Class)NSPersistentCloudKitContainer;
  -[NSPersistentContainer setPersistentStoreDescriptions:](&v16, sel_setPersistentStoreDescriptions_, a3);
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char isKindOfClass;
  void *v12;
  NSCloudKitMirroringDelegate *v13;
  NSCloudKitMirroringDelegate *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  NSString *v20;
  objc_class *v21;
  uint64_t v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v10, "cloudKitContainerOptions"))
        {
          objc_msgSend(v10, "cloudKitContainerOptions");
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v12 = (void *)objc_msgSend(v10, "cloudKitContainerOptions");
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v15 = (void *)MEMORY[0x1E0C99DA0];
              v16 = *MEMORY[0x1E0C99778];
              v17 = (void *)MEMORY[0x1E0CB3940];
              v18 = (objc_class *)objc_opt_class();
              v19 = NSStringFromClass(v18);
              v20 = NSStringFromSelector(sel_cloudKitContainerOptions);
              v21 = (objc_class *)objc_opt_class();
              v22 = objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@ must be of type '%@'"), v19, v20, NSStringFromClass(v21));
              v29 = CFSTR("offendingObject");
              v30 = objc_msgSend(v10, "cloudKitContainerOptions");
              objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v22, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1)));
            }
            v12 = (void *)objc_msgSend(v10, "cloudKitContainerOptions");
          }
          objc_msgSend(v12, "setProgressProvider:", self);
          v13 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]([NSCloudKitMirroringDelegate alloc], "initWithCloudKitContainerOptions:", objc_msgSend(v10, "cloudKitContainerOptions"));
          objc_msgSend(v10, "setMirroringDelegate:", v13);
          if (!objc_msgSend((id)objc_msgSend(v10, "options"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
            objc_msgSend(v10, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"));
LABEL_17:

          continue;
        }
        if (objc_msgSend(v10, "mirroringDelegate"))
        {
          objc_msgSend(v10, "mirroringDelegate");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (NSCloudKitMirroringDelegate *)(id)objc_msgSend(v10, "mirroringDelegate");
            v13 = v14;
            if (v14)
              v14 = (NSCloudKitMirroringDelegate *)v14->_options;
            -[NSCloudKitMirroringDelegate setProgressProvider:](v14, "setProgressProvider:", self);
            goto LABEL_17;
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }
  v24.receiver = self;
  v24.super_class = (Class)NSPersistentCloudKitContainer;
  -[NSPersistentContainer _loadStoreDescriptions:withCompletionHandler:](&v24, sel__loadStoreDescriptions_withCompletionHandler_, a3, a4);
}

+ (id)discoverDefaultContainerIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(CFSTR("com.apple.developer.icloud-container-identifiers"), "UTF8String");
  v2 = xpc_copy_entitlement_for_self();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (objc_msgSend(v4, "count"))
    v5 = (id)objc_msgSend(v4, "objectAtIndex:", 0);
  else
    v5 = 0;

  xpc_release(v3);
  return v5;
}

- (BOOL)initializeCloudKitSchemaWithOptions:(NSPersistentCloudKitContainerSchemaInitializationOptions)options error:(NSError *)error
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  NSCloudKitMirroringInitializeSchemaRequest *v22;
  uint64_t v23;
  NSCloudKitMirroringInitializeSchemaRequest *v24;
  NSManagedObjectContext *v25;
  dispatch_time_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  NSError *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSPersistentCloudKitContainerSchemaInitializationOptions v48;
  NSObject *group;
  _QWORD v51[8];
  _QWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  const __CFString *v73;
  id v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__20;
  v61 = __Block_byref_object_dispose__20;
  v62 = 0;
  group = dispatch_group_create();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v5 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v53, v79, 16);
  v48 = options;
  v7 = 0;
  if (v6)
  {
    v8 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v54 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "isCloudKitEnabled"))
        {
          v10 = (void *)MEMORY[0x18D76B4E4]();
          v11 = __ckLoggingOverride;
          v12 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: will initialize cloudkit schema for store: %@"));
          if (v11 >= 3)
            v19 = 3;
          else
            v19 = v11;
          _NSCoreDataLog(v19, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]");
          objc_autoreleasePoolPop(v10);
          dispatch_group_enter(group);
          ++v7;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v53, v79, 16);
    }
    while (v6);
  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v7)
  {
    *((_BYTE *)v64 + 24) = 0;
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v71 = *MEMORY[0x1E0CB2D68];
    v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't initialize CloudKit schema because no stores in the coordinator are configured to use CloudKit: %@"), -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores"));
    v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v34 = objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v33);
    v58[5] = v34;
    goto LABEL_26;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = [NSCloudKitMirroringInitializeSchemaRequest alloc];
  v23 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke;
  v52[3] = &unk_1E1EDF040;
  v52[4] = v20;
  v52[5] = v21;
  v52[7] = &v63;
  v52[6] = group;
  v24 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v22, "initWithOptions:completionBlock:", 0, v52);
  -[NSCloudKitMirroringInitializeSchemaRequest setSchemaInitializationOptions:](v24, "setSchemaInitializationOptions:", v48);
  v25 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v51[0] = v23;
  v51[1] = 3221225472;
  v51[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_40;
  v51[3] = &unk_1E1EDD7B8;
  v51[4] = v25;
  v51[5] = v24;
  v51[6] = &v63;
  v51[7] = &v57;
  -[NSManagedObjectContext performBlockAndWait:](v25, "performBlockAndWait:", v51);
  if (*((_BYTE *)v64 + 24))
  {
    v26 = dispatch_time(0, 1000000000 * self->_operationTimeout);
    if (dispatch_group_wait(group, v26))
    {
      *((_BYTE *)v64 + 24) = 0;
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v77 = *MEMORY[0x1E0CB2D68];
      v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize CloudKit schema because the requests timed out (a %lds wait failed)."), self->_operationTimeout);
      v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v29 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v28);
      objc_msgSend(v21, "addObject:", v29);

    }
    if (!*((_BYTE *)v64 + 24))
      goto LABEL_35;
    if (v7 == objc_msgSend(v20, "count"))
    {
      *((_BYTE *)v64 + 24) = 0;
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v75[0] = *MEMORY[0x1E0CB2D68];
      v75[1] = CFSTR("NSDetailedErrors");
      v76[0] = CFSTR("Couldn't initialize CloudKit schema because no stores were able to succesfully initialize.");
      v76[1] = v20;
      v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
LABEL_24:
      v35 = objc_msgSend(v30, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v31);
      v58[5] = v35;
      goto LABEL_25;
    }
    if (!*((_BYTE *)v64 + 24))
    {
LABEL_35:
      if (objc_msgSend(v21, "count"))
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = CFSTR("encounteredErrors");
        v74 = v21;
        v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        goto LABEL_24;
      }
    }
  }
LABEL_25:

LABEL_26:
  if (!*((_BYTE *)v64 + 24))
  {
    v38 = (NSError *)(id)v58[5];
    if (v38)
    {
      if (error)
        *error = v38;
    }
    else
    {
      v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v46 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        v69 = 1024;
        v70 = 307;
        _os_log_fault_impl(&dword_18A253000, v46, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  dispatch_release(group);
  v58[5] = 0;
  v36 = *((_BYTE *)v64 + 24);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  return v36;
}

void __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "success"))
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v5 = 16;
    else
      v5 = __ckLoggingOverride;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished initialize schema with result: %@"));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
    objc_autoreleasePoolPop(v4);
    goto LABEL_15;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
  {
    v13 = *(void **)(a1 + 32);
    v14 = objc_msgSend(a2, "error");
    goto LABEL_13;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v15 + 24))
    *(_BYTE *)(v15 + 24) = 0;
  v16 = (void *)MEMORY[0x18D76B4E4]();
  v17 = __ckLoggingOverride != 0;
  v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Initialize schema request failed: %@"));
  _NSCoreDataLog(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
  objc_autoreleasePoolPop(v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  if (objc_msgSend(a2, "error"))
  {
    v25 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "userInfo");
    v26 = *MEMORY[0x1E0CB3388];
    v27 = objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v13 = *(void **)(a1 + 40);
    v28 = (void *)objc_msgSend(a2, "error");
    v29 = v28;
    if (!v27)
    {
LABEL_14:
      objc_msgSend(v13, "addObject:", v29);
      goto LABEL_15;
    }
    v14 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", v26);
LABEL_13:
    v29 = (void *)v14;
    goto LABEL_14;
  }
  v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Initialize schema failed but did not set an error: %@");
  _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)a2);
  v37 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = a2;
    _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Initialize schema failed but did not set an error: %@", buf, 0xCu);
  }
LABEL_15:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_40(uint64_t a1)
{
  id result;
  id v3;

  v3 = 0;
  result = (id)objc_msgSend(*(id *)(a1 + 32), "executeRequest:error:", *(_QWORD *)(a1 + 40), &v3);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    result = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (CKRecord)recordForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  NSManagedObjectContext *v4;
  _PFRequestExecutor *v5;
  NSCloudKitMirroringDelegateSerializationRequest *v6;
  NSCloudKitMirroringDelegateSerializationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CKRecord *v25;
  uint64_t v27;
  uint8_t buf[16];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;

  v36 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__20;
  v34 = __Block_byref_object_dispose__20;
  v35 = 0;
  v4 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v5 = objc_alloc_init(_PFRequestExecutor);
  v6 = [NSCloudKitMirroringDelegateSerializationRequest alloc];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke;
  v29[3] = &unk_1E1EDF068;
  v29[5] = v5;
  v29[6] = &v30;
  v29[4] = managedObjectID;
  v7 = -[NSCloudKitMirroringDelegateSerializationRequest initWithOptions:completionBlock:](v6, "initWithOptions:completionBlock:", 0, v29);
  -[NSCloudKitMirroringDelegateSerializationRequest setResultType:](v7, "setResultType:", 1);
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:](v7, "setObjectIDsToSerialize:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", managedObjectID));
  if (-[_PFRequestExecutor executeRequest:inContext:error:](v5, "executeRequest:inContext:error:", v7, v4, &v36))
  {
    if (!-[_PFRequestExecutor wait](v5, "wait"))
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Wait timed out during call to recordForManagedObjectID");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v27);
      v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Wait timed out during call to recordForManagedObjectID", buf, 2u);
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x18D76B4E4]();
    v17 = __ckLoggingOverride;
    v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to retrieve record for object '%@'\n%@"));
    _NSCoreDataLog(v17 != 0, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]");
    objc_autoreleasePoolPop(v16);

    v31[5] = 0;
  }

  v25 = (CKRecord *)(id)v31[5];
  _Block_object_dispose(&v30, 8);
  return v25;
}

uint64_t __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v23;
  uint8_t buf[16];

  if (objc_msgSend(a2, "success"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", *(_QWORD *)(a1 + 32));
      if (v4)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v4;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the record for a managed object id.");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v23);
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the record for a managed object id.", buf, 2u);
      }
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = __ckLoggingOverride != 0;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Record serialization failed with error: %@"));
    objc_msgSend(a2, "error");
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]_block_invoke");
    objc_autoreleasePoolPop(v5);
  }
  return objc_msgSend(*(id *)(a1 + 40), "requestFinished");
}

- (NSDictionary)recordsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  id v5;
  NSManagedObjectContext *v6;
  _PFRequestExecutor *v7;
  NSCloudKitMirroringDelegateSerializationRequest *v8;
  NSCloudKitMirroringDelegateSerializationRequest *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint8_t buf[8];
  _QWORD v30[6];
  uint64_t v31;

  v31 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v7 = objc_alloc_init(_PFRequestExecutor);
  v8 = [NSCloudKitMirroringDelegateSerializationRequest alloc];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke;
  v30[3] = &unk_1E1EDF090;
  v30[4] = v5;
  v30[5] = v7;
  v9 = -[NSCloudKitMirroringDelegateSerializationRequest initWithOptions:completionBlock:](v8, "initWithOptions:completionBlock:", 0, v30);
  -[NSCloudKitMirroringDelegateSerializationRequest setResultType:](v9, "setResultType:", 1);
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:](v9, "setObjectIDsToSerialize:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", managedObjectIDs));
  if (-[_PFRequestExecutor executeRequest:inContext:error:](v7, "executeRequest:inContext:error:", v9, v6, &v31))
  {
    if (!-[_PFRequestExecutor wait](v7, "wait"))
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Wait timed out during call to recordsForManagedObjectIDs");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, v28);
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Wait timed out during call to recordsForManagedObjectIDs", buf, 2u);
      }
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x18D76B4E4]();
    v19 = __ckLoggingOverride != 0;
    v20 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to retrieve records for objects %@"));
    _NSCoreDataLog(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]");
    objc_autoreleasePoolPop(v18);

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  return (NSDictionary *)v5;
}

uint64_t __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "success"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "request"), "objectIDsToSerialize");
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v32 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v10 = objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", v9);
            if (v10)
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v6);
      }
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the records for a group of managed object ids.");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, v29);
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the records for a group of managed object ids.", buf, 2u);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x18D76B4E4]();
    v12 = __ckLoggingOverride != 0;
    v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Record serialization failed with error: %@"));
    objc_msgSend(a2, "error");
    _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]_block_invoke");
    objc_autoreleasePoolPop(v11);
  }
  return objc_msgSend(*(id *)(a1 + 40), "requestFinished");
}

- (CKRecordID)recordIDForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  return -[CKRecord recordID](-[NSPersistentCloudKitContainer recordForManagedObjectID:](self, "recordForManagedObjectID:", managedObjectID), "recordID");
}

- (NSDictionary)recordIDsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  NSDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[NSPersistentCloudKitContainer recordsForManagedObjectIDs:](self, "recordsForManagedObjectIDs:", managedObjectIDs);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v4, "setObject:forKey:", objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)), "recordID"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return (NSDictionary *)v4;
}

- (BOOL)canUpdateRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  BOOL v5;
  NSPersistentStore *v6;
  NSPersistentStore *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  NSManagedObjectContext *metadataContext;
  NSManagedObjectContext *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[9];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  NSManagedObjectID *v30;
  __int16 v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (!-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID"))
  {
    v6 = -[NSManagedObjectID persistentStore](objectID, "persistentStore");
    v7 = v6;
    if (!v6
      || !-[NSString isEqualToString:](-[NSPersistentStore type](v6, "type"), "isEqualToString:", CFSTR("SQLite")))
    {
      *((_BYTE *)v26 + 24) = 1;
LABEL_20:

      v5 = *((_BYTE *)v26 + 24) != 0;
      goto LABEL_21;
    }
    v8 = -[NSPersistentStore mirroringDelegate](v7, "mirroringDelegate");
    v9 = v8;
    if (v8)
    {
      v10 = (void *)v8[1];
      if (*((_BYTE *)v9 + 89))
      {
        if (objc_msgSend(v10, "databaseScope") == 1)
        {
          if (*((_QWORD *)v9 + 19))
          {
            if (self)
              metadataContext = self->_metadataContext;
            else
              metadataContext = 0;
            v12 = metadataContext;
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke;
            v24[3] = &unk_1E1EDF388;
            v24[4] = objectID;
            v24[5] = v7;
            v24[6] = v12;
            v24[7] = v9;
            v24[8] = &v25;
            -[NSManagedObjectContext performBlockAndWait:](v12, "performBlockAndWait:", v24);

          }
          goto LABEL_19;
        }
        if (objc_msgSend(*((id *)v9 + 1), "databaseScope") == 3)
        {
          v23 = 0;
          v33[0] = objectID;
          v13 = -[NSDictionary objectForKey:](-[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:](self, "fetchSharesMatchingObjectIDs:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1), &v23), "objectForKey:", objectID);
          if (!v13)
          {
            v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch the CKShare for an object in the shared database: %@ - %@");
            _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)objectID);
            v22 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = objectID;
              v31 = 2112;
              v32 = v23;
              _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@", buf, 0x16u);
            }
            goto LABEL_19;
          }
          if (objc_msgSend((id)objc_msgSend(v13, "currentUserParticipant"), "permission") != 3)
          {
LABEL_19:

            goto LABEL_20;
          }
        }
      }
      else if (objc_msgSend(v10, "databaseScope") != 2)
      {
        goto LABEL_19;
      }
    }
    *((_BYTE *)v26 + 24) = 1;
    goto LABEL_19;
  }
  v5 = 1;
  *((_BYTE *)v26 + 24) = 1;
LABEL_21:
  _Block_object_dispose(&v25, 8);
  return v5;
}

void __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v23[0] = *(_QWORD *)(a1 + 32);
  v2 = (void *)objc_msgSend(+[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), &v18), "lastObject");
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "createRecordFromSystemFields");
    v4 = v3;
    if (!v3
      || (v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "creatorUserRecordID"), "recordName"),
          (objc_msgSend(v5, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]()) & 1) != 0)
      || ((v6 = (void *)objc_msgSend((id)objc_msgSend(v4, "creatorUserRecordID"), "recordName"),
           (v7 = *(_QWORD *)(a1 + 56)) == 0)
        ? (v8 = 0)
        : (v8 = *(void **)(v7 + 152)),
          objc_msgSend(v6, "isEqualToString:", objc_msgSend(v8, "recordName"))))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  else if (v18)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@");
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@", buf, 0x16u);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (BOOL)canDeleteRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  id *v5;
  id *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[4];
  NSManagedObjectID *v20;
  __int16 v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (id *)-[NSPersistentStore mirroringDelegate](-[NSManagedObjectID persistentStore](objectID, "persistentStore"), "mirroringDelegate");
  v6 = v5;
  if (!v5)
  {
    if (objc_msgSend(0, "databaseScope") != 1)
    {
      v7 = objc_msgSend(0, "databaseScope") != 3;
      goto LABEL_11;
    }
    goto LABEL_3;
  }
  if (objc_msgSend(v5[1], "databaseScope") != 1)
  {
    if (objc_msgSend(v6[1], "databaseScope") == 3)
    {
      if (!*((_BYTE *)v6 + 89))
        goto LABEL_3;
      v18 = 0;
      v23[0] = objectID;
      v8 = -[NSDictionary objectForKey:](-[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:](self, "fetchSharesMatchingObjectIDs:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1), &v18), "objectForKey:", objectID);
      if (v8)
      {
        v7 = objc_msgSend((id)objc_msgSend(v8, "currentUserParticipant"), "permission") == 3;
        goto LABEL_11;
      }
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch the CKShare for an object in the shared database: %@ - %@");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)objectID);
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = objectID;
        v21 = 2112;
        v22 = v18;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@", buf, 0x16u);
      }
    }
    v7 = 1;
    goto LABEL_11;
  }
LABEL_3:
  v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)canModifyManagedObjectsInStore:(NSPersistentStore *)store
{
  unsigned __int8 *v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  BOOL v8;

  if (-[NSString isEqualToString:](-[NSPersistentStore type](store, "type"), "isEqualToString:", CFSTR("SQLite")))
  {
    v4 = (unsigned __int8 *)-[NSPersistentStore mirroringDelegate](store, "mirroringDelegate");
    v5 = v4;
    if (!v4)
      goto LABEL_7;
    v6 = v4[89];
    v7 = objc_msgSend(*((id *)v4 + 1), "databaseScope");
    if (!v6)
    {
      v8 = v7 == 2;
      goto LABEL_9;
    }
    if (v7 == 1)
      v8 = v5[19] != 0;
    else
LABEL_7:
      v8 = 1;
LABEL_9:

    return v8;
  }
  return 1;
}

- (void)eventUpdated:(id)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = CFSTR("event");
  v8[0] = a3;
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("NSPersistentCloudKitContainerEventChangedNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  objc_autoreleasePoolPop(v5);
}

- (void)publishActivity:(id)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(a3, "createDictionaryRepresentation");
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("activityDictionary"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentCloudKitContainerActivityChangedNotificationName"), self, v6);

  objc_autoreleasePoolPop(v5);
}

- (BOOL)assignManagedObjects:(id)a3 toCloudKitRecordZone:(id)a4 inPersistentStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[9];
  _QWORD v26[10];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__20;
  v31 = __Block_byref_object_dispose__20;
  v32 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext");
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke;
  v26[3] = &unk_1E1EDF0B8;
  v26[4] = v12;
  v26[5] = a3;
  v26[6] = v10;
  v26[7] = v11;
  v26[8] = &v33;
  v26[9] = &v27;
  objc_msgSend(v12, "performBlockAndWait:", v26);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_77;
  v25[3] = &unk_1E1EDF130;
  v25[4] = v11;
  v25[5] = a4;
  v25[6] = v10;
  v25[7] = &v33;
  v25[8] = &v27;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v25);

  if (!*((_BYTE *)v34 + 24))
  {
    v16 = (id)v28[5];
    if (v16)
    {
      if (a6)
        *a6 = v16;
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        v39 = 1024;
        v40 = 710;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v28[5] = 0;
  v14 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v14;
}

id __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke(uint64_t a1)
{
  id result;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  _PFObjectCKRecordZoneLink *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  id v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "obtainPermanentIDsForObjects:error:", *(_QWORD *)(a1 + 40), &v31))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(a1 + 40);
    result = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v25 = result;
    if (result)
    {
      v24 = *(_QWORD *)v28;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v3);
          if (objc_msgSend(v4, "managedObjectContext") != *(_QWORD *)(a1 + 32))
          {
            v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Client passed in objects from multiple contexts, this should return an error.");
            _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v22);
            v12 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Client passed in objects from multiple contexts, this should return an error.", buf, 2u);
            }
          }
          v13 = (id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "persistentStore");
          v14 = (id)objc_msgSend(v13, "identifier");
          v15 = (id)objc_msgSend(v13, "mirroringDelegate");
          v16 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v14);
          if (!v16)
          {
            v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v16, v14);
          }
          v17 = (id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v14);
          if (!v17)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v17, v14);
          }
          objc_msgSend(v16, "addObject:", objc_msgSend(v4, "objectID"));

          v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "entity"), "attributesByName"), "objectForKey:", CFSTR("ckRecordID"));
          if (!v18 || (v19 = (id)objc_msgSend(v4, "valueForKey:", CFSTR("ckRecordID"))) == 0)
          {
            v19 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
            if (v18)
            {
              if (v15)
                v20 = (void *)v15[1];
              else
                v20 = 0;
              if (objc_msgSend(v20, "preserveLegacyRecordMetadataBehavior"))
                objc_msgSend(v4, "setValue:forKey:", v19, CFSTR("ckRecordID"));
            }
          }
          v21 = -[_PFObjectCKRecordZoneLink initWithObjectID:recordName:]([_PFObjectCKRecordZoneLink alloc], "initWithObjectID:recordName:", objc_msgSend(v4, "objectID"), v19);
          objc_msgSend(v17, "addObject:", v21);

          v3 = (char *)v3 + 1;
        }
        while (v25 != v3);
        result = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        v25 = result;
      }
      while (result);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = v31;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

uint64_t __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_77(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[6];
  __int128 v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2;
  v4[3] = &unk_1E1EDF0E0;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = a2;
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSManagedObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  NSManagedObject *v38;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneClass[0]()), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  v45 = 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "persistentStoreForIdentifier:", a2);
  if (v7)
  {
    v8 = v7;
    v9 = (id *)(id)objc_msgSend(v7, "mirroringDelegate");
    v10 = v9;
    if (v9)
    {
      v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), objc_msgSend(v9[1], "databaseScope"), (uint64_t)v8, *(void **)(a1 + 40), (uint64_t)&v45);
      if (v38)
      {
        v11 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2), v8, *(void **)(a1 + 40), &v45);
        if (!v11)
          goto LABEL_24;
        v35 = v10;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v42;
          v37 = *MEMORY[0x1E0CB28A8];
          v36 = *MEMORY[0x1E0CB2D60];
LABEL_7:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(a3);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
            v17 = (void *)objc_msgSend(v11, "objectForKey:", objc_msgSend(v16, "objectID"));
            if (v17)
            {
              v18 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(v17, "recordZone"));
              if ((objc_msgSend(v18, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v50 = v36;
                v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The object %@ is already assigned to the zone '%@' and cannot be moved to '%@'."), objc_msgSend(v16, "objectID"), v18, *(_QWORD *)(a1 + 32));
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v19, "initWithDomain:code:userInfo:", v37, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
                *a4 = 1;
              }

            }
            else
            {
              v20 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"), *(_QWORD *)(a1 + 40));
              objc_msgSend(*(id *)(a1 + 40), "assignObject:toPersistentStore:", v20, v8);
              -[NSManagedObject setCkRecordName:](v20, "setCkRecordName:", objc_msgSend(v16, "recordName"));
              v21 = (void *)MEMORY[0x1E0CB37E8];
              v22 = _sqlEntityForEntityDescription(objc_msgSend(v8, "model"), (_QWORD *)objc_msgSend((id)objc_msgSend(v16, "objectID"), "entity"));
              v23 = v22 ? *(unsigned int *)(v22 + 184) : 0;
              -[NSManagedObject setEntityId:](v20, "setEntityId:", objc_msgSend(v21, "numberWithUnsignedInt:", v23));
              -[NSManagedObject setEntityPK:](v20, "setEntityPK:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(v16, "objectID"), "_referenceData64")));
              -[NSManagedObject setRecordZone:](v20, "setRecordZone:", v38);
              -[NSManagedObject setNeedsUpload:](v20, "setNeedsUpload:", 1);
            }
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
              break;
            if (v13 == ++v15)
            {
              v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
              v13 = v24;
              if (v24)
                goto LABEL_7;
              break;
            }
          }
        }
        v10 = v35;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "save:", &v45) & 1) == 0)
          {
LABEL_24:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            *a4 = 1;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v45;
          }
        }

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v45;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = *MEMORY[0x1E0CB28A8];
      v48 = *MEMORY[0x1E0CB2D60];
      v49 = CFSTR("Target store has no mirroring delegate.");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Target store has no mirroring delegate: %@");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v8);
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v8;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Target store has no mirroring delegate: %@", buf, 0xCu);
      }
    }

  }
}

- (void)doWorkOnMetadataContext:(uint64_t)a3 withBlock:
{
  id v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  if (a1)
  {
    v5 = *(id *)(a1 + 48);
    v6 = v5;
    if (a2)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke;
      v8[3] = &unk_1E1EDDAE0;
      v8[4] = v5;
      v8[5] = a3;
      objc_msgSend(v5, "performBlock:", v8);
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_170;
      v7[3] = &unk_1E1EDDAE0;
      v7[4] = v5;
      v7[5] = a3;
      objc_msgSend(v5, "performBlockAndWait:", v7);
    }

  }
}

- (void)acceptShareInvitationsFromMetadata:(NSArray *)metadata intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  -[NSPersistentCloudKitContainer _acceptShareInvitationsWithURLs:shareMetadatas:forPersistentStore:completion:]((uint64_t)self, MEMORY[0x1E0C9AA60], metadata, persistentStore, (uint64_t)completion);
}

- (void)_acceptShareInvitationsWithURLs:(void *)a3 shareMetadatas:(void *)a4 forPersistentStore:(uint64_t)a5 completion:
{
  NSPersistentStoreResult *v9;
  NSPersistentStoreResult *v10;
  NSCloudKitMirroringAcceptShareInvitationsRequest *v11;
  NSCloudKitMirroringAcceptShareInvitationsRequest *v12;
  const char *v13;
  NSCloudKitMirroringAcceptShareInvitationsRequest *v14;
  SEL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v9 = (NSPersistentStoreResult *)(id)objc_msgSend(a4, "mirroringDelegate");
  v10 = v9;
  if (!v9)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0CB3308];
    v25 = objc_msgSend(a4, "URL");
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v18 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Provided persistent store is not backed by CloudKit."), v17);
    goto LABEL_11;
  }
  if (-[objc_class databaseScope](v9[1].super.isa, "databaseScope") != 3)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provided persistent store is not set to the shared database scope and cannot accept share invitation."));
    v26[0] = *MEMORY[0x1E0CB3308];
    v27[0] = objc_msgSend(a4, "URL");
    v26[1] = CFSTR("databaseScope");
    v27[1] = softLinkCKDatabaseScopeString(-[objc_class databaseScope](v10[1].super.isa, "databaseScope"));
    v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v18 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, v21);
LABEL_11:
    objc_exception_throw(v18);
  }
  v11 = [NSCloudKitMirroringAcceptShareInvitationsRequest alloc];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke;
  v23[3] = &unk_1E1EDF108;
  v23[4] = a5;
  v12 = -[NSCloudKitMirroringAcceptShareInvitationsRequest initWithOptions:completionBlock:](v11, "initWithOptions:completionBlock:", 0, v23);
  v14 = v12;
  if (v12)
  {
    v12->super._isContainerRequest = 1;
    objc_setProperty_nonatomic_copy(v12, v13, a2, 80);
    objc_setProperty_nonatomic_copy(v14, v15, a3, 88);
  }
  v22 = 0;
  if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](v10, v14, &v22))
    (*(void (**)(uint64_t, _QWORD, uint64_t))(a5 + 16))(a5, 0, v22);

}

- (void)acceptShareInvitationsFromURLs:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5
{
  -[NSPersistentCloudKitContainer _acceptShareInvitationsWithURLs:shareMetadatas:forPersistentStore:completion:]((uint64_t)self, a3, MEMORY[0x1E0C9AA60], a4, (uint64_t)a5);
}

void __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "success"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(a2, "acceptedShareMetadatas"), objc_msgSend(a2, "error"));
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@");
      v7 = objc_msgSend(a2, "request");
      _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, v7);
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = objc_msgSend(a2, "request");
        _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@", buf, 0xCu);
      }
      v15 = *(_QWORD *)(a1 + 32);
      if (v15)
      {
        v16 = *MEMORY[0x1E0CB28A8];
        v17 = *MEMORY[0x1E0CB2D68];
        v18 = CFSTR("Share acceptance succeeded but did not return an acceptance result.");
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 16))(v15, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v16, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
      }
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, objc_msgSend(a2, "error"));
  }
}

- (void)persistUpdatedShare:(CKShare *)share inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  id v8;
  unint64_t v9;
  void *v10;
  _PFRequestExecutor *v11;
  NSString *v12;
  uint64_t v13;
  NSCloudKitMirroringExportRequest *v14;
  uint64_t v15;
  void *v16;
  _QWORD v19[9];
  id v20;
  id location;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[9];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__20;
  v32 = __Block_byref_object_dispose__20;
  v33 = 0;
  v8 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke;
  v27[3] = &unk_1E1EDF130;
  v27[4] = share;
  v27[5] = persistentStore;
  v27[6] = v8;
  v27[7] = &v28;
  v27[8] = &v34;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
  if (completion && *((_BYTE *)v35 + 24))
  {
    v9 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    do
    {
      *((_BYTE *)v35 + 24) = 1;
      v10 = (void *)v29[5];
      if (v10)
      {

        v29[5] = 0;
      }
      v22 = 0;
      v11 = objc_alloc_init(_PFRequestExecutor);
      objc_initWeak(&location, self);
      v12 = -[NSPersistentStore identifier](persistentStore, "identifier");
      v13 = -[CKShare recordID](share, "recordID");
      v14 = [NSCloudKitMirroringExportRequest alloc];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2;
      v19[3] = &unk_1E1EDF158;
      v19[4] = v12;
      objc_copyWeak(&v20, &location);
      v19[7] = completion;
      v19[8] = &v23;
      v19[5] = v13;
      v19[6] = v11;
      v15 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v14, "initWithOptions:completionBlock:", 0, v19);
      v16 = (void *)v15;
      if (v15)
        *(_BYTE *)(v15 + 56) = 1;
      if (*((_BYTE *)v35 + 24))
      {
        if (-[_PFRequestExecutor executeRequest:inContext:error:](v11, "executeRequest:inContext:error:", v15, self->_metadataContext, &v22))
        {
          if (!-[_PFRequestExecutor wait](v11, "wait"))
          {
            *((_BYTE *)v24 + 24) = 1;
            v22 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:]((uint64_t)self, (uint64_t)v16, (uint64_t)CFSTR("Persist-Share-Export"));
            (*((void (**)(void *, _QWORD, id))completion + 2))(completion, 0, v22);

            v22 = 0;
          }
        }
        else
        {
          *((_BYTE *)v35 + 24) = 0;
          (*((void (**)(void *, _QWORD, id))completion + 2))(completion, 0, v22);
          *((_BYTE *)v24 + 24) = 1;
        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      if (*((_BYTE *)v24 + 24))
        break;
    }
    while (v9++ < 9);
    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *v5;
  NSManagedObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSManagedObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordID"), "zoneID");
  v5 = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "mirroringDelegate");
  if (v5)
    v5 = (_QWORD *)v5[7];
  v6 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v4, objc_msgSend(v5, "databaseScope"), *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    return;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7
    && (v8 = *(_QWORD *)(v7 + 8)) != 0
    && (v9 = v6, (v10 = *(_QWORD *)(v8 + 136)) != 0)
    && (v11 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v10, *(_QWORD *)(a1 + 32), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))) != 0)
  {
    v14 = v11;
    -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v11);
    -[NSManagedObject setNeedsShareUpdate:](v9, "setNeedsShareUpdate:", 1);
    if ((objc_msgSend(a2, "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) & 1) != 0)
      goto LABEL_13;
  }
  else
  {
    v14 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
LABEL_13:

}

uint64_t __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;

  if (objc_msgSend((id)objc_msgSend(a2, "storeIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    if (objc_msgSend(a2, "success"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v5 = WeakRetained;
      if (WeakRetained)
      {
        v6 = *(_QWORD *)(a1 + 56);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke;
        v10[3] = &unk_1E1EDF180;
        v11 = *(_OWORD *)(a1 + 32);
        v12 = v6;
        -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)WeakRetained, 0, (uint64_t)v10);
      }

    }
    else
    {
      v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB28A8])
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        v8 = 0;
LABEL_11:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v8;
        return objc_msgSend(*(id *)(a1 + 48), "requestFinished");
      }
      (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, objc_msgSend(a2, "error"));
    }
    v8 = 1;
    goto LABEL_11;
  }
  return objc_msgSend(*(id *)(a1 + 48), "requestFinished");
}

- (uint64_t)createTimeoutErrorForRequest:(uint64_t)a3 withLabel:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPersistentCloudKitContainer timed out waiting for request: %@ - %@");
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = a3;
      v19 = 2112;
      v20 = a2;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer timed out waiting for request: %@ - %@", buf, 0x16u);
    }
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0CB28A8];
    v15[0] = CFSTR("request");
    v15[1] = CFSTR("label");
    v16[0] = a2;
    v16[1] = a3;
    return objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  }
  return result;
}

void __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _QWORD *v24;
  NSManagedObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "persistentStoreForIdentifier:", *(_QWORD *)(a1 + 32));
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unsupported store type for CloudKit request %@");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v5;
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unsupported store type for CloudKit request %@", buf, 0xCu);
      }
    }
    v14 = objc_msgSend(v5, "mirroringDelegate");
    if (!v14)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Store is not mirrored %@");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v5);
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v5;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Store is not mirrored %@", buf, 0xCu);
      }
    }
    *(_QWORD *)buf = 0;
    v23 = (void *)objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v24 = (_QWORD *)objc_msgSend(v5, "mirroringDelegate");
    if (v24)
      v24 = (_QWORD *)v24[1];
    v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v23, objc_msgSend(v24, "databaseScope"), (uint64_t)v5, a2, (uint64_t)buf);
    if (v25)
    {
      if (v14 && (v26 = *(_QWORD *)(v14 + 8)) != 0)
        v27 = *(_QWORD *)(v26 + 136);
      else
        v27 = 0;
      v28 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v27, (void *)-[NSManagedObject encodedShareData](v25, "encodedShareData"), (char *)objc_msgSend(*(id *)(a1 + 40), "zoneID"), buf);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
}

- (void)fetchParticipantsMatchingLookupInfos:(NSArray *)lookupInfos intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[5];
  NSPersistentStore *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](lookupInfos, "count"))
  {
    v8 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKFetchShareParticipantsOperationClass[0]()), "initWithUserIdentityLookupInfos:", lookupInfos);
      v11 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke;
      v16[3] = &unk_1E1EDF1A8;
      v16[4] = v9;
      objc_msgSend(v10, "setPerShareParticipantCompletionBlock:", v16);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2;
      v15[3] = &unk_1E1EDF1D0;
      v15[4] = v9;
      v15[5] = completion;
      objc_msgSend(v10, "setFetchShareParticipantsCompletionBlock:", v15);
      v12 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
      if (v12)
        v12 = (_QWORD *)v12[6];
      objc_msgSend(v12, "addOperation:", v10);

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB28A8];
      v18 = CFSTR("NSAffectedStoresErrorKey");
      if (!persistentStore)
        persistentStore = (NSPersistentStore *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = persistentStore;
      v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      (*((void (**)(void *, _QWORD, uint64_t))completion + 2))(completion, 0, objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 134091, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1)));
    }

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))completion + 2))(completion, MEMORY[0x1E0C9AA60], 0);
  }
}

void __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  else
  {
    v3 = (void *)MEMORY[0x18D76B4E4]();
    v4 = __ckLoggingOverride != 0;
    v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch participant with lookup info: %@\n%@"));
    _NSCoreDataLog(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[NSPersistentCloudKitContainer fetchParticipantsMatchingLookupInfos:intoPersistentStore:completion:]_block_invoke");
    objc_autoreleasePoolPop(v3);
  }
}

uint64_t __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)purgeObjectsAndRecordsInZoneWithID:(CKRecordZoneID *)zoneID inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  id v9;
  NSString *v10;
  uint64_t v11;
  _QWORD *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  _QWORD *v24;
  _QWORD v25[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  NSURL *v32;
  _QWORD v33[4];
  _QWORD v34[6];

  v34[4] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = -[CKRecordZoneID ownerName](zoneID, "ownerName");
  if (-[NSString isEqualToString:](v10, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]()))
    v11 = 2;
  else
    v11 = 3;
  if (persistentStore)
  {
    if (-[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate"))
    {
      v12 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
      if (v12)
        v12 = (_QWORD *)v12[1];
      if (v11 == objc_msgSend(v12, "databaseScope"))
      {
        objc_msgSend(v9, "addObject:", persistentStore);
        goto LABEL_22;
      }
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v33[0] = CFSTR("storeURL");
      v34[0] = -[NSPersistentStore URL](persistentStore, "URL");
      v33[1] = CFSTR("databaseScope");
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v24 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
      if (v24)
        v24 = (_QWORD *)v24[1];
      v34[1] = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "databaseScope"));
      v33[2] = CFSTR("requiredDatabaseScope");
      v33[3] = CFSTR("zoneID");
      v34[2] = softLinkCKDatabaseScopeString(v11);
      v34[3] = zoneID;
      v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
      v21 = *MEMORY[0x1E0C99778];
      v22 = CFSTR("Illegal attempt to purge a zone from the wrong store");
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v31 = *MEMORY[0x1E0CB3308];
      v32 = -[NSPersistentStore URL](persistentStore, "URL");
      v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = *MEMORY[0x1E0C99778];
      v22 = CFSTR("Provided persistent store is not backed by CloudKit.");
    }
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v21, v22, v20));
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v17, "mirroringDelegate"))
        {
          v18 = (_QWORD *)objc_msgSend(v17, "mirroringDelegate");
          if (v18)
            v18 = (_QWORD *)v18[1];
          if (v11 == objc_msgSend(v18, "databaseScope"))
            objc_msgSend(v9, "addObject:", v17);
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }
LABEL_22:
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke;
  v25[3] = &unk_1E1EDF1F8;
  v25[4] = v9;
  v25[5] = self;
  v25[6] = zoneID;
  v25[7] = completion;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 1, (uint64_t)v25);

}

uint64_t __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  _PFRequestExecutor *v10;
  NSCloudKitMirroringExportRequest *v11;
  NSCloudKitMirroringResetZoneRequest *v12;
  NSCloudKitMirroringResetZoneRequest *v13;
  NSCloudKitMirroringResetZoneRequest *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char v24;
  NSCloudKitMirroringResetZoneRequest *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  id obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[7];
  _QWORD v62[7];
  id v63;
  _QWORD v64[7];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  BOOL v75;
  _BYTE v76[128];
  _BYTE buf[12];
  __int16 v78;
  int v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[4];

  v83[1] = *MEMORY[0x1E0C80C00];
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)a1[4];
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v3)
  {
    v56 = 0;
    v4 = *(_QWORD *)v58;
    v52 = *MEMORY[0x1E0CB28A8];
    v53 = *MEMORY[0x1E0CB3388];
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v4)
        objc_enumerationMutation(obj);
      v6 = a1[5];
      if (!v6)
      {
LABEL_49:
        result = a1[7];
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD, id))(result + 16))(result, 0, v56);
        return result;
      }
      v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v5);
      v8 = (void *)a1[6];
      v71 = 0;
      v72 = &v71;
      v73 = 0x2020000000;
      v74 = 1;
      v65 = 0;
      v66 = &v65;
      v67 = 0x3052000000;
      v68 = __Block_byref_object_copy__20;
      v69 = __Block_byref_object_dispose__20;
      v70 = 0;
      v9 = (id *)(id)objc_msgSend(v7, "mirroringDelegate");
      if (v9)
        break;
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v7);
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@", buf, 0xCu);
      }
      v24 = 0;
      v75 = *((_BYTE *)v72 + 24) != 0;
LABEL_35:

      if ((v24 & 1) != 0)
      {
        if (*((_BYTE *)v72 + 24))
          goto LABEL_37;
        v40 = (id)v66[5];
        if (!v40)
        {
          v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
          v49 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
            v78 = 1024;
            v79 = 1134;
            _os_log_fault_impl(&dword_18A253000, v49, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
LABEL_37:
          v40 = v56;
        }

        v66[5] = 0;
        v41 = *((_BYTE *)v72 + 24) != 0;
        v56 = v40;
        goto LABEL_41;
      }
      v41 = v75;
LABEL_41:
      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v71, 8);
      if (!v41)
        goto LABEL_49;
      if (v3 == ++v5)
      {
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
        v3 = v50;
        if (v50)
          goto LABEL_3;
        goto LABEL_47;
      }
    }
    v10 = objc_alloc_init(_PFRequestExecutor);
    if (objc_msgSend(v9[1], "databaseScope") != 3)
    {
      v25 = [NSCloudKitMirroringResetZoneRequest alloc];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_3;
      v61[3] = &unk_1E1EDF220;
      v61[6] = &v65;
      v61[4] = v10;
      v61[5] = &v71;
      v12 = -[NSCloudKitMirroringResetZoneRequest initWithOptions:completionBlock:](v25, "initWithOptions:completionBlock:", 0, v61);
      v80 = v8;
      -[NSCloudKitMirroringResetZoneRequest setRecordZoneIDsToReset:]((uint64_t)v12, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1));
      *(_QWORD *)buf = 0;
      if (-[_PFRequestExecutor executeRequest:onMirroringDelegate:error:](v10, "executeRequest:onMirroringDelegate:error:", v12, v9, buf))
      {
        if (-[_PFRequestExecutor wait](v10, "wait"))
          goto LABEL_33;
        *((_BYTE *)v72 + 24) = 0;
        v26 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v6, (uint64_t)v12, (uint64_t)CFSTR("Zone-Purge-Reset"));
      }
      else
      {
        *((_BYTE *)v72 + 24) = 0;
        v26 = *(id *)buf;
      }
      v66[5] = (uint64_t)v26;
      goto LABEL_33;
    }
    *(_QWORD *)buf = 0;
    -[NSManagedObject setNeedsShareDelete:](+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v8, objc_msgSend(v9[1], "databaseScope"), (uint64_t)v7, a2, (uint64_t)buf), "setNeedsShareDelete:", 1);
    if (!objc_msgSend(a2, "save:", buf))
    {
      v27 = (void *)MEMORY[0x18D76B4E4]();
      v28 = __ckLoggingOverride;
      v29 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Encountered an error trying to update the store metadata while attempting to purge zone '%@': %@"));
      _NSCoreDataLog(v28 != 0, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[NSPersistentCloudKitContainer _doPurgeForObjectsAndRecordsInZoneWithID:inPersistentStore:withContext:error:]");
      objc_autoreleasePoolPop(v27);
      *((_BYTE *)v72 + 24) = 0;
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v81 = v53;
      v37 = *(_QWORD *)buf;
      if (!*(_QWORD *)buf)
        v37 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v82 = v37;
      v38 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v52, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      v66[5] = v38;
      goto LABEL_34;
    }
    v11 = [NSCloudKitMirroringExportRequest alloc];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke;
    v64[3] = &unk_1E1EDF220;
    v64[6] = &v65;
    v64[4] = v10;
    v64[5] = &v71;
    v12 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v11, "initWithOptions:completionBlock:", 0, v64);
    v63 = 0;
    if (-[_PFRequestExecutor executeRequest:onMirroringDelegate:error:](v10, "executeRequest:onMirroringDelegate:error:", v12, v9, &v63))
    {
      if (-[_PFRequestExecutor wait](v10, "wait"))
      {
        v13 = [NSCloudKitMirroringResetZoneRequest alloc];
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_2;
        v62[3] = &unk_1E1EDF220;
        v62[6] = &v65;
        v62[4] = v10;
        v62[5] = &v71;
        v14 = -[NSCloudKitMirroringResetZoneRequest initWithOptions:completionBlock:](v13, "initWithOptions:completionBlock:", 0, v62);
        v83[0] = v8;
        -[NSCloudKitMirroringResetZoneRequest setRecordZoneIDsToReset:]((uint64_t)v14, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1));
        if (-[_PFRequestExecutor executeRequest:onMirroringDelegate:error:](v10, "executeRequest:onMirroringDelegate:error:", v14, v9, &v63))
        {
          if (-[_PFRequestExecutor wait](v10, "wait"))
          {
LABEL_32:

            goto LABEL_33;
          }
          *((_BYTE *)v72 + 24) = 0;
          v15 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v6, (uint64_t)v14, (uint64_t)CFSTR("Zone-Purge-PostExportReset"));
        }
        else
        {
          *((_BYTE *)v72 + 24) = 0;
          v15 = v63;
        }
        v66[5] = (uint64_t)v15;
        goto LABEL_32;
      }
      *((_BYTE *)v72 + 24) = 0;
      v39 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v6, (uint64_t)v12, (uint64_t)CFSTR("Zone-Purge-Export"));
    }
    else
    {
      *((_BYTE *)v72 + 24) = 0;
      v39 = v63;
    }
    v66[5] = (uint64_t)v39;
LABEL_33:

LABEL_34:
    v24 = 1;
    goto LABEL_35;
  }
LABEL_47:
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], 0);
  return result;
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "success") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(a2, "error");
  }
  return objc_msgSend(*(id *)(a1 + 32), "requestFinished");
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "success") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(a2, "error");
  }
  return objc_msgSend(*(id *)(a1 + 32), "requestFinished");
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "success") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(a2, "error");
  }
  return objc_msgSend(*(id *)(a1 + 32), "requestFinished");
}

- (NSDictionary)fetchSharesMatchingObjectIDs:(NSArray *)objectIDs error:(NSError *)error
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSError *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSDictionary *v31;
  uint64_t v33;
  _QWORD v36[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__20;
  v51 = __Block_byref_object_dispose__20;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__20;
  v45 = __Block_byref_object_dispose__20;
  v46 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](objectIDs, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(objectIDs);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v10 = (id)objc_msgSend(v9, "persistentStore");
        if (objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", CFSTR("SQLite")))
        {
          if (objc_msgSend((id)objc_msgSend(v10, "ancillaryModels"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey")))
          {
            v11 = objc_msgSend(v10, "mirroringDelegate");
            if (v11)
            {
              if (*(_BYTE *)(v11 + 144))
              {
                v12 = (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(v10, "identifier"));
                if (!v12)
                {
                  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v10, "identifier"));
                }
                objc_msgSend(v12, "addObject:", v9);

              }
            }
          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](objectIDs, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v5, "count"))
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke;
    v36[3] = &unk_1E1EDF248;
    v36[4] = v5;
    v36[5] = &v41;
    v36[6] = &v47;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v36);
    v13 = (id)v48[5];
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v48[5] = (uint64_t)v13;
  }
  if (!v13)
  {
    v14 = (NSError *)(id)v42[5];
    if (v14)
    {
      if (error)
        *error = v14;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        v55 = 1024;
        v56 = 1218;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    if (!v42[5])
    {
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fetchSharesMatchingObjectIDs failed but did not set an error.");
      _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, v33);
      v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: fetchSharesMatchingObjectIDs failed but did not set an error.", buf, 2u);
      }
    }
  }

  v42[5] = 0;
  v31 = (NSDictionary *)(id)v48[5];
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v31;
}

void __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 32);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v38;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v29)
        objc_enumerationMutation(obj);
      v32 = v4;
      v5 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v4);
      v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
      v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "persistentStoreForIdentifier:", v5);
      v8 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v6, (uint64_t)v7, a2, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      if (v8)
      {
        v9 = v8;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v34;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
              v15 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(v14, "recordZone"));
              v16 = objc_msgSend((id)objc_msgSend(v14, "recordZone"), "encodedShareData");
              if (v16)
              {
                v17 = (void *)v16;
                v18 = objc_msgSend(v7, "mirroringDelegate");
                if (v18)
                {
                  v19 = *(_QWORD *)(v18 + 8);
                  if (v19)
                    v18 = *(_QWORD *)(v19 + 136);
                  else
                    v18 = 0;
                }
                v20 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v18, v17, v15, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
                if (v20)
                {
                  v21 = v20;
                  v22 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v14);
                  objc_msgSend(v3, "setObject:forKey:", v21, v22);

                }
                else
                {
                  v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                  if (v23)
                  {
                    v27 = v23;

                    goto LABEL_27;
                  }
                }
              }

              ++v13;
            }
            while (v11 != v13);
            v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            v11 = v24;
          }
          while (v24);
        }
      }
      else
      {
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        if (v25)
          v26 = v25;
      }
LABEL_27:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        break;
      v4 = v32 + 1;
      if (v32 + 1 == v30)
      {
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v30)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v3, "copy");

}

- (NSArray)fetchSharesInPersistentStore:(NSPersistentStore *)persistentStore error:(NSError *)error
{
  NSArray *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSArray *v14;
  NSError *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__20;
  v48 = __Block_byref_object_dispose__20;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__20;
  v42 = __Block_byref_object_dispose__20;
  v43 = 0;
  if (persistentStore)
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", persistentStore, 0);
  else
    v4 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores");
  v5 = v4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", CFSTR("SQLite")))
        {
          if (objc_msgSend((id)objc_msgSend(v10, "ancillaryModels"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey")))
          {
            v11 = objc_msgSend(v10, "mirroringDelegate");
            if (v11)
            {
              if (*(_BYTE *)(v11 + 144))
                objc_msgSend(v6, "addObject:", v10);
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v7);
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__20;
  v32 = __Block_byref_object_dispose__20;
  v33 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke;
    v27[3] = &unk_1E1EDF270;
    v27[4] = v6;
    v27[5] = &v38;
    v27[6] = &v44;
    v27[7] = &v28;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
    if (v45[5])
      goto LABEL_21;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v45[5] = (uint64_t)v12;
    if (v12)
      goto LABEL_21;
  }
  if (!v29[5])
  {
    v16 = (NSError *)(id)v39[5];
    if (v16)
    {
      if (error)
        *error = v16;
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        v52 = 1024;
        v53 = 1303;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
LABEL_21:

  v39[5] = 0;
  v13 = (void *)v45[5];
  if (v29[5])
  {

    v45[5] = 0;
    objc_exception_throw((id)v29[5]);
  }
  v14 = v13;
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v14;
}

void __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke(_QWORD *a1, void *a2)
{
  NSFetchRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("encodedShareData != nil")));
  -[NSFetchRequest setAffectedStores:](v4, "setAffectedStores:", a1[4]);
  v5 = (void *)objc_msgSend(a2, "executeFetchRequest:error:", v4, *(_QWORD *)(a1[5] + 8) + 40);
  v6 = v5;
  if (v5)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
          v11 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v10);
          v12 = (id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "persistentStore");
          v13 = objc_msgSend(v12, "mirroringDelegate");
          if (v13)
          {
            v14 = *(_QWORD **)(v13 + 8);
            if (v14)
              v14 = (_QWORD *)v14[17];
          }
          else
          {
            v14 = 0;
          }
          v15 = v14;
          if (!v15)
          {
            v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have an associated mirroring delegate: %@ - %@");
            _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v12);
            v23 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v12;
              v36 = 2112;
              v37 = v10;
              _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have an associated mirroring delegate: %@ - %@", buf, 0x16u);
            }
          }
          v24 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]((uint64_t)v15, (void *)objc_msgSend(v10, "encodedShareData"), v11, (_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

          if (v24)
          {
            objc_msgSend(v29, "addObject:", v24);

          }
          else
          {
            v25 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
            if (v25)
            {
              v28 = v25;
              goto LABEL_23;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        v7 = v26;
      }
      while (v26);
    }
LABEL_23:
    if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(v29, "copy");
  }
  else
  {
    v27 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  }

}

- (void)shareManagedObjects:(NSArray *)managedObjects toShare:(CKShare *)share completion:(void *)completion
{
  void *v7;
  int v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CKShare *v32;
  id v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSDictionary *v39;
  NSDictionary *v40;
  id v41;
  id v42;
  id v43;
  unint64_t v44;
  void *v45;
  _PFRequestExecutor *v46;
  NSCloudKitMirroringExportRequest *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  NSUInteger v61;
  CKShare *v62;
  id v64;
  id v65;
  uint64_t v67;
  _QWORD v68[11];
  _QWORD v69[11];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  _QWORD v74[13];
  _QWORD v75[13];
  _QWORD v76[10];
  _QWORD v77[11];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  const __CFString *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = (id)objc_msgSend(-[NSArray lastObject](managedObjects, "lastObject"), "managedObjectContext");
  if (share)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)-[CKShare recordID](share, "recordID"), "zoneID"), "ownerName");
    v8 = objc_msgSend(v7, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]());
    v9 = 2;
    if (!v8)
      v9 = 3;
  }
  else
  {
    v9 = 2;
  }
  v67 = v9;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v10 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v107;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v107 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v13);
      v15 = (_QWORD *)objc_msgSend(v14, "mirroringDelegate");
      if (v15)
        v15 = (_QWORD *)v15[1];
      if (objc_msgSend(v15, "databaseScope") == v67)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v14 = 0;
  }
  v16 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v17 = 16;
  else
    v17 = __ckLoggingOverride;
  v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Sharing %lu objects from store: %@ to share: %@"));
  v62 = share;
  v61 = -[NSArray count](managedObjects, "count");
  _NSCoreDataLog(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]");
  objc_autoreleasePoolPop(v16);
  v25 = (id)objc_msgSend(v14, "mirroringDelegate");
  v26 = v25;
  if (v25)
    v27 = (void *)*((_QWORD *)v25 + 6);
  else
    v27 = 0;
  v28 = v27;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3052000000;
  v103 = __Block_byref_object_copy__20;
  v104 = __Block_byref_object_dispose__20;
  v105 = 0;
  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 1;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3052000000;
  v93 = __Block_byref_object_copy__20;
  v94 = __Block_byref_object_dispose__20;
  v95 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3052000000;
  v87 = __Block_byref_object_copy__20;
  v88 = __Block_byref_object_dispose__20;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3052000000;
  v81 = __Block_byref_object_copy__20;
  v82 = __Block_byref_object_dispose__20;
  v83 = 0;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!v14)
  {
    *((_BYTE *)v97 + 24) = 0;
    v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v110 = *MEMORY[0x1E0CB2D68];
    v111 = CFSTR("Could not locate private store in which to share.");
    v36 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
    v37 = objc_msgSend(v35, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v36);
    v101[5] = v37;
    goto LABEL_38;
  }
  v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke;
  v77[3] = &unk_1E1EDF360;
  v77[4] = managedObjects;
  v77[5] = v65;
  v77[6] = v31;
  v77[7] = v14;
  v77[8] = v30;
  v77[9] = &v96;
  v77[10] = &v100;
  objc_msgSend(v65, "performBlockAndWait:", v77);
  if (*((_BYTE *)v97 + 24))
  {
    if (share)
    {
      v32 = share;
      v85[5] = (uint64_t)v32;
      v33 = (id)objc_msgSend((id)-[CKShare recordID](v32, "recordID"), "zoneID");
      v34 = v79;
    }
    else
    {
      if (objc_msgSend(v30, "count"))
      {
        v38 = objc_msgSend(v30, "allObjects");
        v39 = -[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:](self, "fetchSharesMatchingObjectIDs:error:", v38, v101 + 5);
        v40 = v39;
        if (v39)
        {
          if (-[NSDictionary count](v39, "count"))
          {
            v41 = -[NSDictionary objectForKey:](v40, "objectForKey:", -[NSArray lastObject](-[NSDictionary allKeys](v40, "allKeys"), "lastObject"));
            v85[5] = (uint64_t)v41;
            v42 = (id)objc_msgSend((id)objc_msgSend(v41, "recordID"), "zoneID");
            v79[5] = (uint64_t)v42;
          }
        }
        else
        {
          *((_BYTE *)v97 + 24) = 0;
          v43 = (id)v101[5];
        }
        if (*((_BYTE *)v97 + 24) && !v79[5])
        {
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_147;
          v76[3] = &unk_1E1EDF298;
          v76[4] = v30;
          v76[5] = v14;
          v76[6] = &v78;
          v76[7] = &v84;
          v76[8] = &v96;
          v76[9] = &v100;
          -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v76);
        }
      }
      if (v85[5])
        goto LABEL_37;
      v57 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
      v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.coredata.cloudkit.share."), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), self, v61, v14, v62);
      v59 = objc_msgSend(v57, "initWithZoneName:ownerName:", v58, getCloudKitCKCurrentUserDefaultName[0]());
      v79[5] = v59;
      v60 = objc_alloc((Class)getCloudKitCKShareClass[0]());
      v33 = (id)objc_msgSend(v60, "initWithRecordZoneID:", v79[5]);
      v34 = v85;
    }
    v34[5] = (uint64_t)v33;
  }
LABEL_37:

  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_2;
  v75[3] = &unk_1E1EDF2C0;
  v75[4] = self;
  v75[5] = v31;
  v75[9] = v65;
  v75[10] = &v96;
  v75[11] = &v84;
  v75[6] = v14;
  v75[7] = managedObjects;
  v75[12] = &v100;
  v75[8] = v64;
  objc_msgSend(v65, "performBlockAndWait:", v75);

  if (!*((_BYTE *)v97 + 24))
    goto LABEL_57;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_3;
  v74[3] = &unk_1E1EDF2E8;
  v74[10] = &v96;
  v74[11] = &v100;
  v74[12] = v67;
  v74[4] = v14;
  v74[5] = v64;
  v74[6] = self;
  v74[7] = v29;
  v74[8] = v26;
  v74[9] = &v84;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v74);
  if (!*((_BYTE *)v97 + 24))
    goto LABEL_57;
LABEL_38:
  v44 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  do
  {
    *((_BYTE *)v97 + 24) = 1;
    v45 = (void *)v101[5];
    if (v45)
    {

      v101[5] = 0;
    }
    v46 = objc_alloc_init(_PFRequestExecutor);
    v47 = [NSCloudKitMirroringExportRequest alloc];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_4;
    v69[3] = &unk_1E1EDF310;
    v69[4] = v14;
    v69[5] = self;
    v69[9] = &v100;
    v69[10] = v44 + 1;
    v69[7] = &v70;
    v69[8] = &v96;
    v69[6] = v46;
    v48 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v47, "initWithOptions:completionBlock:", 0, v69);
    v49 = (void *)v48;
    if (v48)
      *(_BYTE *)(v48 + 56) = 1;
    if (*((_BYTE *)v97 + 24))
    {
      if (-[_PFRequestExecutor executeRequest:inContext:error:](v46, "executeRequest:inContext:error:", v48, v65, v101 + 5))
      {
        if (-[_PFRequestExecutor wait](v46, "wait"))
        {
          if (*((_BYTE *)v97 + 24))
          {
            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v68[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_5;
            v68[3] = &unk_1E1EDF338;
            v68[9] = &v100;
            v68[10] = v67;
            v68[6] = &v78;
            v68[7] = &v90;
            v68[8] = &v96;
            v68[4] = v14;
            v68[5] = v26;
            -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v68);
          }
        }
        else
        {
          *((_BYTE *)v97 + 24) = 0;
          v51 = -[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:]((uint64_t)self, (uint64_t)v49, (uint64_t)CFSTR("Share-Export"));
          v101[5] = v51;
          *((_BYTE *)v71 + 24) = 1;
        }
      }
      else
      {
        *((_BYTE *)v97 + 24) = 0;
        v50 = (id)v101[5];
      }
    }

    if (*((_BYTE *)v71 + 24))
      break;
  }
  while (v44++ < 9);
  _Block_object_dispose(&v70, 8);
  if (*((_BYTE *)v97 + 24))
  {
    v53 = 0;
    v54 = v91[5];
    v55 = v29;
    v56 = v28;
  }
  else
  {
LABEL_57:
    v53 = (id)v101[5];
    v55 = 0;
    v54 = 0;
    v56 = 0;
  }
  (*((void (**)(void *, id, uint64_t, id, id))completion + 2))(completion, v55, v54, v56, v53);

  v91[5] = 0;
  v101[5] = 0;

  v85[5] = 0;
  v79[5] = 0;

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
}

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  uint64_t v25;
  id v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v40;
    v31 = *MEMORY[0x1E0CB2D68];
    v32 = *MEMORY[0x1E0CB28A8];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        if (objc_msgSend(v6, "managedObjectContext") != *(_QWORD *)(a1 + 40))
        {
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Client attempting to share objects from multiple contexts, this should return an error.");
          _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, v30);
          v14 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Client attempting to share objects from multiple contexts, this should return an error.", buf, 2u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(v6, "objectID"), "isTemporaryID"))
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
          objc_msgSend(*(id *)(a1 + 40), "assignObject:toPersistentStore:", v6, *(_QWORD *)(a1 + 56));
          v15 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v6);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v35 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                if ((objc_msgSend(v20, "isTemporaryID") & 1) == 0)
                  objc_msgSend(*(id *)(a1 + 64), "addObject:", v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
            }
            while (v17);
          }

        }
        else
        {
          v21 = *(_QWORD *)(a1 + 56);
          if (v21 == objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"))
          {
            objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v6, "objectID"));
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v22 = (void *)MEMORY[0x1E0CB3940];
            v23 = (objc_class *)objc_opt_class();
            v24 = NSStringFromClass(v23);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_assignObject_toPersistentStore_);
            v30 = (uint64_t)v24;
            v25 = objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ does not support sharing objects across persistent stores. %@ needs to be called with objects that are either inserted (with temporary objectIDs) or objects assigned to the correct desination store. Objects that exist in the 'wrong' store must be cloned (and their originals deleted) after which they can be assigned to the correct store by %@ or %@."));
            v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44[0] = v25;
            v43[0] = v31;
            v43[1] = CFSTR("offendingObject");
            if (objc_msgSend(v6, "objectID"))
              v27 = (const __CFString *)objc_msgSend(v6, "objectID");
            else
              v27 = CFSTR("nil");
            v44[1] = v27;
            v43[2] = CFSTR("destinationStoreURL");
            if (objc_msgSend(*(id *)(a1 + 56), "URL"))
              v28 = (const __CFString *)objc_msgSend(*(id *)(a1 + 56), "URL");
            else
              v28 = CFSTR("nil");
            v44[2] = v28;
            v43[3] = CFSTR("storeURL");
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"), "URL"))
              v29 = (const __CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"), "URL");
            else
              v29 = CFSTR("nil");
            v44[3] = v29;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(v26, "initWithDomain:code:userInfo:", v32, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4));
          }
        }
        ++v5;
      }
      while (v5 != v3);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_147(_QWORD *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v3 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:](NSCKRecordZoneMetadata, "fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:", a1[4], a1[5], a2, &v16);
  v4 = v3;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v9, "zoneName"), "hasPrefix:", CFSTR("com.apple.coredata.cloudkit.share.")))
          {
            *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v9;
            v10 = (id)objc_msgSend(objc_alloc((Class)getCloudKitCKShareClass[0]()), "initWithRecordZoneID:", v9);
            v11 = a1[7];
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    v10 = v16;
    v11 = a1[9];
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) = v10;
  }

}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v3 = 9;
    else
      v3 = __ckLoggingOverride;
    v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Found %lu inserted objects to share."));
    objc_msgSend(*(id *)(a1 + 40), "count");
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
    if (objc_msgSend(*(id *)(a1 + 32), "assignManagedObjects:toCloudKitRecordZone:inPersistentStore:error:", *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "recordID"), "zoneID"), *(_QWORD *)(a1 + 48), &v23))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = *(void **)(a1 + 56);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v11, "containsObject:", objc_msgSend(v17, "objectID")) & 1) == 0)
            {
              v18 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v17);
              objc_msgSend(v11, "unionSet:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v14);
      }
      objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", objc_msgSend(v11, "allObjects"));

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = v23;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 72), "hasChanges")
    && (objc_msgSend(*(id *)(a1 + 72), "save:", &v23) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = v23;
  }
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSManagedObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  NSManagedObject *v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = a2;
  v52 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "recordID"), "zoneID"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), a2, (uint64_t)&v49);
  if (!v38)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = v49;
    goto LABEL_43;
  }
  v4 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 40), *(void **)(a1 + 32), v2, &v49);
  if (!v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = v49;
    goto LABEL_42;
  }
  v40 = v2;
  v5 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v6 = 9;
  else
    v6 = __ckLoggingOverride;
  v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Got zone and metadatas: %@\n%@"));
  _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_3");
  objc_autoreleasePoolPop(v5);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = *(id *)(a1 + 40);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v19 = (void *)objc_msgSend(v4, "objectForKey:", v18);
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);
        if (v19)
        {
          v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          if ((objc_msgSend((id)objc_msgSend(v20, "zoneID"), "isEqual:", objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "recordID"), "zoneID")) & 1) == 0)
          {
            objc_msgSend(v19, "setNeedsCloudDelete:", 0);
            objc_msgSend(v19, "setNeedsLocalDelete:", 0);
            objc_msgSend(v19, "setNeedsUpload:", 1);
            objc_msgSend(v19, "setCkRecordSystemFields:", 0);
            objc_msgSend(v19, "setEncodedRecord:", 0);
            v21 = (void *)objc_msgSend(v19, "recordZone");
            v22 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"), v40);
            objc_msgSend(v40, "assignObject:toPersistentStore:", v22, *(_QWORD *)(a1 + 32));
            -[NSManagedObject setRecordMetadata:](v22, "setRecordMetadata:", v19);
            -[NSManagedObject setMovedAt:](v22, "setMovedAt:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
            -[NSManagedObject setNeedsCloudDelete:](v22, "setNeedsCloudDelete:", 1);
            -[NSManagedObject setZoneName:](v22, "setZoneName:", objc_msgSend(v21, "ckRecordZoneName"));
            -[NSManagedObject setOwnerName:](v22, "setOwnerName:", objc_msgSend(v21, "ckOwnerName"));
            -[NSManagedObject setRecordName:](v22, "setRecordName:", objc_msgSend(v19, "ckRecordName"));
            objc_msgSend(v19, "setRecordZone:", v38);
            objc_msgSend(v37, "addObject:", v20);
          }

        }
        else
        {
          v23 = objc_msgSend(v40, "existingObjectWithID:error:", v18, &v49);
          if (!v23
            || (v24 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v23, 1, objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "recordID"), "zoneID"), 0, &v49)) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = v49;
            goto LABEL_23;
          }
          objc_msgSend(v24, "setNeedsUpload:", 1);
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_23:
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v2 = v40;
  if (*(_BYTE *)(v25 + 24))
  {
    v26 = *(_QWORD *)(a1 + 64);
    if (v26 && (v27 = *(_QWORD *)(v26 + 8)) != 0 && (v28 = *(_QWORD *)(v27 + 136)) != 0)
    {
      v29 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), &v49);
      if (v29)
      {
        -[NSManagedObject setEncodedShareData:](v38, "setEncodedShareData:", v29);
        -[NSManagedObject setNeedsShareUpdate:](v38, "setNeedsShareUpdate:", 1);
        v30 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E0C9AA60], v37, *(_QWORD *)(a1 + 32), v40, &v49);
        if (v30)
        {
          v31 = v30;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v42;
            v35 = MEMORY[0x1E0C9AAB0];
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v42 != v34)
                  objc_enumerationMutation(v31);
                objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "setNeedsDelete:", v35);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v33);
          }
          v2 = v40;
          if ((objc_msgSend(v40, "save:", &v49) & 1) != 0)
            goto LABEL_39;
        }
      }
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    else
    {
      v29 = 0;
    }
    *(_BYTE *)(v25 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = v49;
LABEL_39:

  }
LABEL_42:

LABEL_43:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    objc_msgSend(v2, "reset");
}

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_4(uint64_t a1, void *a2)
{
  char v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (objc_msgSend((id)objc_msgSend(a2, "storeIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "identifier")))
  {
    v4 = objc_msgSend(a2, "success");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if ((v4 & 1) == 0)
    {
      v5 = (void *)MEMORY[0x18D76B4E4]();
      v6 = __ckLoggingOverride != 0;
      v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to export for share (%lu): %@"));
      objc_msgSend(a2, "error");
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_4");
      objc_autoreleasePoolPop(v5);
      v14 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8])
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = (id)objc_msgSend(a2, "error");
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "requestFinished");
}

id __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_5(uint64_t *a1, void *a2)
{
  NSManagedObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  id v8;

  v8 = 0;
  v3 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(*(_QWORD *)(a1[6] + 8) + 40), a1[10], a1[4], a2, (uint64_t)&v8);
  if (!v3
    || ((v4 = a1[5]) == 0 || (v5 = *(_QWORD *)(v4 + 8)) == 0 ? (v6 = 0) : (v6 = *(_QWORD *)(v5 + 136)),
        result = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v6, (void *)-[NSManagedObject encodedShareData](v3, "encodedShareData"), *(char **)(*(_QWORD *)(a1[6] + 8) + 40), &v8), (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    result = v8;
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) = result;
  }
  return result;
}

- (void)applyActivityVoucher:(id)a3 toStores:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator", a3, a4, 0), "persistentStores");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mirroringDelegate"), "addActivityVoucher:", a3);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)expireActivityVoucher:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator", 0), "persistentStores");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "mirroringDelegate"), "expireActivityVoucher:", a3);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@");
    v3 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects");
    _NSCoreDataLog(17, v2, v4, v5, v6, v7, v8, v9, v3);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects");
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An operation left NSPersistentCloudKitContainer's metadata context dirty: %@");
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 32));
    v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@", buf, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_170(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@");
    v3 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects");
    _NSCoreDataLog(17, v2, v4, v5, v6, v7, v8, v9, v3);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects");
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An operation left NSPersistentCloudKitContainer's metadata context dirty: %@");
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 32));
    v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@", buf, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

@end
