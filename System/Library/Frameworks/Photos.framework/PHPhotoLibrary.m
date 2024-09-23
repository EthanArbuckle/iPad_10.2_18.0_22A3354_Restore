@implementation PHPhotoLibrary

- (id)librarySpecificFetchOptions
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_customLibrarySpecificFetchOptions)
    objc_msgSend(v3, "mergeWithFetchOptions:");
  objc_msgSend(v4, "setPhotoLibrary:", self);
  return v4;
}

- (id)managedObjectContextForCurrentQueueQoS
{
  void *v2;
  void *v3;

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLPhotoLibrary)userInitiatedQueuePhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyUserInitiatedQueuePhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)photoLibraryForCurrentQueueQoS
{
  void *v3;
  qos_class_t v4;

  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
  {
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = qos_class_self();
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PHPhotoLibrary mainQueuePhotoLibrary](self, "mainQueuePhotoLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 < QOS_CLASS_USER_INITIATED)
        -[PHPhotoLibrary backgroundQueuePhotoLibrary](self, "backgroundQueuePhotoLibrary");
      else
        -[PHPhotoLibrary userInitiatedQueuePhotoLibrary](self, "userInitiatedQueuePhotoLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)isPHPhotoLibraryForCMM
{
  return -[PHPhotoLibrary type](self, "type") == 1;
}

- (unsigned)type
{
  return self->_type;
}

- (void)registerFetchResult:(id)a3
{
  -[PHPhotoLibraryObserverRegistrar registerFetchResult:](self->_observerRegistrar, "registerFetchResult:", a3);
}

- (id)allowedEntities
{
  id v2;
  uint64_t *v3;

  v2 = (id)-[PHPhotoLibrary type](self, "type");
  if ((_DWORD)v2 == 1)
  {
    pl_dispatch_once();
    v3 = &allowedEntities_pl_once_object_80;
    goto LABEL_5;
  }
  if (!(_DWORD)v2)
  {
    pl_dispatch_once();
    v3 = &allowedEntities_pl_once_object_79;
LABEL_5:
    v2 = (id)*v3;
  }
  return v2;
}

+ (Class)classForFetchType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

+ (id)uniquedOID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "uniqueObjectIDCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    objc_msgSend(v5, "_verifyObjectIDIsTagged:", v6);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)uniquedOIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "uniqueObjectIDCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUniqueObjectIDCache uniquedOIDs:](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)uniqueObjectIDCache
{
  pl_dispatch_once();
  return (id)uniqueObjectIDCache_pl_once_object_78;
}

- (id)fetchDictionariesByPHClassForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideWithPHClass:(Class)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  unint64_t v29;
  BOOL v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  BOOL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v29 = a4;
    v30 = a5;
    v32 = v11;
    -[PHPhotoLibrary objectFetchingContextForCurrentQueueQoS](self, "objectFetchingContextForCurrentQueueQoS");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v31 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v18, "entity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v21 = a6;
          if (!a6)
          {
            objc_msgSend(v19, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = +[PHPhotoLibrary PHObjectClassForEntityName:](PHPhotoLibrary, "PHObjectClassForEntityName:", v22);

          }
          objc_msgSend(v12, "objectForKey:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = v23;
            objc_msgSend(v23, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v24, v21);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v15);
    }

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __98__PHPhotoLibrary_fetchDictionariesByPHClassForOIDs_propertyHint_includeTrash_overrideWithPHClass___block_invoke;
    v33[3] = &unk_1E35D99D0;
    v39 = v30;
    v38 = v29;
    v34 = v12;
    v35 = v28;
    v36 = v13;
    v11 = v32;
    v37 = v32;
    v25 = v28;
    v26 = v12;
    objc_msgSend(v25, "performBlockAndWait:", v33);

    v10 = v31;
  }

  return v11;
}

+ (Class)PHObjectClassForEntityName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "PHObjectClassesByEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (id)PHObjectClassesByEntityName
{
  if (PHObjectClassesByEntityName_onceToken != -1)
    dispatch_once(&PHObjectClassesByEntityName_onceToken, &__block_literal_global_277);
  return (id)PHObjectClassesByEntityName_nameToClass;
}

- (id)objectFetchingContextForCurrentQueueQoS
{
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PHPhotoLibrary mainQueueManagedObjectContext](self, "mainQueueManagedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHPhotoLibrary backgroundQueueObjectFetchingPhotoLibrary](self, "backgroundQueueObjectFetchingPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)mainQueueManagedObjectContext
{
  void *v2;
  void *v3;

  -[PHPhotoLibrary mainQueuePhotoLibrary](self, "mainQueuePhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLPhotoLibrary)mainQueuePhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyMainQueuePhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)bfa_fetchObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 overrideResultsWithClass:(Class)a5
{
  return -[PHPhotoLibrary fetchPHObjectsForOIDs:propertyHint:includeTrash:overrideResultsWithClass:](self, "fetchPHObjectsForOIDs:propertyHint:includeTrash:overrideResultsWithClass:", a3, a4, 1, a5);
}

- (id)fetchPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideResultsWithClass:(Class)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t j;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  _BOOL4 v29;
  id obj;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v6 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71788], "entity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "entity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isKindOfEntity:", v34);

        if (v17)
          v18 = v33;
        else
          v18 = v35;
        objc_msgSend(v18, "addObject:", v15);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v12);
  }

  v29 = v6;
  -[PHPhotoLibrary fetchDictionariesByPHClassForOIDs:propertyHint:includeTrash:overrideWithPHClass:](self, "fetchDictionariesByPHClassForOIDs:propertyHint:includeTrash:overrideWithPHClass:", v35, a4, v6, a6);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v36)
  {
    v32 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v37);
        v20 = *(objc_class **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v37, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v39;
          if (a6)
            v20 = a6;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v39 != v24)
                objc_enumerationMutation(v21);
              v26 = (void *)objc_msgSend([v20 alloc], "initWithFetchDictionary:propertyHint:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k), a4, self);
              objc_msgSend(v10, "addObject:", v26);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v23);
        }

      }
      v36 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v36);
  }
  if (objc_msgSend(v33, "count"))
  {
    -[PHPhotoLibrary _graphBasedPHObjectsForOIDs:propertyHint:includeTrash:](self, "_graphBasedPHObjectsForOIDs:propertyHint:includeTrash:", v33, 2, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v27);

  }
  return v10;
}

void __98__PHPhotoLibrary_fetchDictionariesByPHClassForOIDs_propertyHint_includeTrash_overrideWithPHClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v2)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0C97B48];
        objc_msgSend(v4, "managedEntityName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_BYTE *)(a1 + 72) && objc_msgSend(v4, "managedObjectSupportsTrashedState"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(trashedState) == %d"), 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0CB3528];
          v31[0] = v9;
          v31[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v13;
        }
        objc_msgSend(v8, "setPredicate:", v9);
        objc_msgSend(v4, "propertiesToFetchWithHint:", *(_QWORD *)(a1 + 64));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPropertiesToFetch:", v14);

        objc_msgSend(v8, "setResultType:", 2);
        v15 = *(void **)(a1 + 40);
        v22 = 0;
        objc_msgSend(v15, "executeFetchRequest:error:", v8, &v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v22;
        if (!v16)
        {
          PLPhotoKitGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138412546;
            v28 = v17;
            v29 = 2114;
            v30 = v19;
            _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "error: %@ while building fetch dictionaries from OIDs: %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v16, v4);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v2);
  }

}

+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3 suppressPrompt:(BOOL)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a1, "_photosAccessAllowedForAccessLevel:", a3);
  if (!v5)
    return 1;
  if (v5 == 4)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentAsyncPromptForLimitedLibraryPickerIfNeeded");

    }
    return 1;
  }
  return 0;
}

+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3
{
  return objc_msgSend(a1, "checkAuthorizationStatusForAPIAccessLevel:suppressPrompt:", a3, 0);
}

+ (int64_t)_photosAccessAllowedForAccessLevel:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = 1;
  else
    v6 = 7;
  v7 = objc_msgSend(v4, "photosAccessAllowedWithScope:", v6);

  return v7;
}

+ (PHAuthorizationStatus)authorizationStatusForAccessLevel:(PHAccessLevel)accessLevel
{
  unint64_t v3;

  v3 = objc_msgSend(a1, "_photosAccessAllowedForAccessLevel:", accessLevel);
  if (v3 > 4)
    return 0;
  else
    return qword_19944A9F0[v3];
}

- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PHPhotoLibrary *v10;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0D719C0];
  v7 = a3;
  objc_msgSend(v6, "sharedBundleController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openBundleAtLibraryURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PHPhotoLibrary initWithPhotoLibraryBundle:type:](self, "initWithPhotoLibraryBundle:type:", v9, v4);
  return v10;
}

- (CPLStatus)cplStatus
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PHPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
  {
    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    CPLStatusFromPathManager();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (CPLStatus *)v5;
}

- (PHPhotoLibrary)initWithPhotoLibraryBundle:(id)a3 type:(unsigned __int16)a4
{
  id v7;
  PHPhotoLibrary *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *transactionQueue;
  PHPerformChangesRequest *v11;
  PHPerformChangesRequest *performChangesRequest;
  uint64_t v13;
  NSHashTable *availabilityObservers;
  uint64_t v15;
  NSMutableDictionary *changeNotificationInfo;
  void *v17;
  uint64_t v18;
  NSURL *photoLibraryURL;
  _TtC6Photos27PHDatabaseStatisticsTracker *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _TtC6Photos27PHDatabaseStatisticsTracker *v25;
  uint64_t v26;
  PLLazyObject *lazyPhotoLibrary;
  id v28;
  id v29;
  id v30;
  _TtC6Photos27PHDatabaseStatisticsTracker *v31;
  uint64_t v32;
  PLLazyObject *lazyMainQueueConcurrencyPhotoLibrary;
  id v34;
  id v35;
  id v36;
  _TtC6Photos27PHDatabaseStatisticsTracker *v37;
  uint64_t v38;
  PLLazyObject *lazyMainQueuePhotoLibrary;
  id v40;
  id v41;
  id v42;
  _TtC6Photos27PHDatabaseStatisticsTracker *v43;
  uint64_t v44;
  PLLazyObject *lazyBackgroundQueuePhotoLibrary;
  id v46;
  id v47;
  id v48;
  _TtC6Photos27PHDatabaseStatisticsTracker *v49;
  uint64_t v50;
  PLLazyObject *lazyUserInitiatedQueuePhotoLibrary;
  id v52;
  id v53;
  id v54;
  _TtC6Photos27PHDatabaseStatisticsTracker *v55;
  uint64_t v56;
  PLLazyObject *lazyBackgroundQueueObjectFetchingPhotoLibrary;
  id v58;
  id v59;
  id v60;
  _TtC6Photos27PHDatabaseStatisticsTracker *v61;
  uint64_t v62;
  PLLazyObject *lazyGraphObjectFetchingPhotoLibrary;
  id v64;
  id v65;
  id v66;
  _TtC6Photos27PHDatabaseStatisticsTracker *v67;
  uint64_t v68;
  PLLazyObject *lazyChangeHandlingPhotoLibrary;
  id v70;
  id v71;
  uint64_t v72;
  PLLazyObject *lazyAlbumRootFolderObjectID;
  id v74;
  id v75;
  uint64_t v76;
  PLLazyObject *lazyProjectAlbumRootFolderObjectID;
  id v78;
  id v79;
  uint64_t v80;
  PLLazyObject *lazyAppPrivateData;
  id v82;
  id v83;
  uint64_t v84;
  PLLazyObject *lazyPhotoLibraryIdentifier;
  id v86;
  id v87;
  uint64_t v88;
  PLLazyObject *lazySearchIndex;
  dispatch_queue_t v90;
  OS_dispatch_queue *isolationQueue;
  NSObject *v92;
  uint64_t v93;
  PLLazyObject *lazyCacheMetricsCollectorClient;
  id v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  uint64_t v100;
  PLLazyObject *lazyCPLStatus;
  id v102;
  id v103;
  uint64_t v104;
  PLLazyObject *lazyIsReadyForAnalysis;
  id v106;
  id v107;
  uint64_t v108;
  PLLazyObject *lazyIsReadyForAnalysisQuickCheck;
  id v110;
  id v111;
  uint64_t v112;
  PLLazyObject *lazyIsReadyForAnalysisCPLInitialDownloadCompleted;
  uint64_t v114;
  PLCPLSettingsObserver *cplSettingsObserver;
  id v116;
  id v117;
  uint64_t v118;
  PLLazyObject *lazyMainScopeIdentifier;
  uint64_t v120;
  PFStateCaptureHandler *stateCaptureHandler;
  PHChangeHandlingDebugger *v122;
  PHChangeHandlingDebugger *changeHandlingDebugger;
  PHPhotoLibraryObserverRegistrar *v124;
  PLPhotoLibraryBundle *photoLibraryBundle;
  PHChangeHandlingDebugger *v126;
  void *v127;
  uint64_t v128;
  PHPhotoLibraryObserverRegistrar *observerRegistrar;
  void *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  uint64_t v134;
  _QWORD v136[4];
  id v137;
  _QWORD v138[4];
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  _QWORD v158[4];
  id v159;
  _TtC6Photos27PHDatabaseStatisticsTracker *v160;
  id v161;
  _QWORD v162[4];
  id v163;
  _TtC6Photos27PHDatabaseStatisticsTracker *v164;
  id v165;
  _QWORD v166[4];
  id v167;
  _TtC6Photos27PHDatabaseStatisticsTracker *v168;
  id v169;
  _QWORD v170[4];
  id v171;
  _TtC6Photos27PHDatabaseStatisticsTracker *v172;
  id v173;
  _QWORD v174[4];
  id v175;
  _TtC6Photos27PHDatabaseStatisticsTracker *v176;
  id v177;
  _QWORD v178[4];
  id v179;
  _TtC6Photos27PHDatabaseStatisticsTracker *v180;
  id v181;
  _QWORD v182[4];
  id v183;
  _TtC6Photos27PHDatabaseStatisticsTracker *v184;
  id v185;
  _QWORD v186[4];
  id v187;
  _TtC6Photos27PHDatabaseStatisticsTracker *v188;
  id v189;
  objc_super v190;
  _BYTE location[12];
  __int16 v192;
  PHPhotoLibrary *v193;
  __int16 v194;
  id v195;
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v190.receiver = self;
  v190.super_class = (Class)PHPhotoLibrary;
  v8 = -[PHPhotoLibrary init](&v190, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.PHPhotoLibrary.changes", 0);
    transactionQueue = v8->_transactionQueue;
    v8->_transactionQueue = (OS_dispatch_queue *)v9;

    v8->_type = a4;
    v11 = objc_alloc_init(PHPerformChangesRequest);
    performChangesRequest = v8->_performChangesRequest;
    v8->_performChangesRequest = v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    availabilityObservers = v8->_availabilityObservers;
    v8->_availabilityObservers = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v15 = objc_claimAutoreleasedReturnValue();
    changeNotificationInfo = v8->_changeNotificationInfo;
    v8->_changeNotificationInfo = (NSMutableDictionary *)v15;

    objc_msgSend(v7, "libraryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    photoLibraryURL = v8->_photoLibraryURL;
    v8->_photoLibraryURL = (NSURL *)v18;

    v8->_wellKnownPhotoLibraryIdentifier = objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v8->_photoLibraryURL);
    objc_storeStrong((id *)&v8->_photoLibraryBundle, a3);
    v20 = objc_alloc_init(_TtC6Photos27PHDatabaseStatisticsTracker);
    objc_storeStrong((id *)&v8->_databaseStatisticsTracker, v20);
    v21 = objc_initWeak((id *)location, v8);

    v22 = objc_alloc(MEMORY[0x1E0D73248]);
    v23 = MEMORY[0x1E0C809B0];
    v186[0] = MEMORY[0x1E0C809B0];
    v186[1] = 3221225472;
    v186[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke;
    v186[3] = &unk_1E35D97A0;
    objc_copyWeak(&v189, (id *)location);
    v24 = v7;
    v187 = v24;
    v25 = v20;
    v188 = v25;
    v26 = objc_msgSend(v22, "initWithRetriableBlock:", v186);

    objc_destroyWeak(&v189);
    objc_destroyWeak((id *)location);
    lazyPhotoLibrary = v8->_lazyPhotoLibrary;
    v8->_lazyPhotoLibrary = (PLLazyObject *)v26;

    v28 = objc_initWeak((id *)location, v8);
    v29 = objc_alloc(MEMORY[0x1E0D73248]);
    v182[0] = v23;
    v182[1] = 3221225472;
    v182[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2;
    v182[3] = &unk_1E35D97A0;
    objc_copyWeak(&v185, (id *)location);
    v30 = v24;
    v183 = v30;
    v31 = v25;
    v184 = v31;
    v32 = objc_msgSend(v29, "initWithRetriableBlock:", v182);

    objc_destroyWeak(&v185);
    objc_destroyWeak((id *)location);
    lazyMainQueueConcurrencyPhotoLibrary = v8->_lazyMainQueueConcurrencyPhotoLibrary;
    v8->_lazyMainQueueConcurrencyPhotoLibrary = (PLLazyObject *)v32;

    v34 = objc_initWeak((id *)location, v8);
    v35 = objc_alloc(MEMORY[0x1E0D73248]);
    v178[0] = v23;
    v178[1] = 3221225472;
    v178[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3;
    v178[3] = &unk_1E35D97A0;
    objc_copyWeak(&v181, (id *)location);
    v36 = v30;
    v179 = v36;
    v37 = v31;
    v180 = v37;
    v38 = objc_msgSend(v35, "initWithRetriableBlock:", v178);

    objc_destroyWeak(&v181);
    objc_destroyWeak((id *)location);
    lazyMainQueuePhotoLibrary = v8->_lazyMainQueuePhotoLibrary;
    v8->_lazyMainQueuePhotoLibrary = (PLLazyObject *)v38;

    v40 = objc_initWeak((id *)location, v8);
    v41 = objc_alloc(MEMORY[0x1E0D73248]);
    v174[0] = v23;
    v174[1] = 3221225472;
    v174[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4;
    v174[3] = &unk_1E35D97A0;
    objc_copyWeak(&v177, (id *)location);
    v42 = v36;
    v175 = v42;
    v43 = v37;
    v176 = v43;
    v44 = objc_msgSend(v41, "initWithRetriableBlock:", v174);

    objc_destroyWeak(&v177);
    objc_destroyWeak((id *)location);
    lazyBackgroundQueuePhotoLibrary = v8->_lazyBackgroundQueuePhotoLibrary;
    v8->_lazyBackgroundQueuePhotoLibrary = (PLLazyObject *)v44;

    v46 = objc_initWeak((id *)location, v8);
    v47 = objc_alloc(MEMORY[0x1E0D73248]);
    v170[0] = v23;
    v170[1] = 3221225472;
    v170[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5;
    v170[3] = &unk_1E35D97A0;
    objc_copyWeak(&v173, (id *)location);
    v48 = v42;
    v171 = v48;
    v49 = v43;
    v172 = v49;
    v50 = objc_msgSend(v47, "initWithRetriableBlock:", v170);

    objc_destroyWeak(&v173);
    objc_destroyWeak((id *)location);
    lazyUserInitiatedQueuePhotoLibrary = v8->_lazyUserInitiatedQueuePhotoLibrary;
    v8->_lazyUserInitiatedQueuePhotoLibrary = (PLLazyObject *)v50;

    v52 = objc_initWeak((id *)location, v8);
    v53 = objc_alloc(MEMORY[0x1E0D73248]);
    v166[0] = v23;
    v166[1] = 3221225472;
    v166[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_6;
    v166[3] = &unk_1E35D97A0;
    objc_copyWeak(&v169, (id *)location);
    v54 = v48;
    v167 = v54;
    v55 = v49;
    v168 = v55;
    v56 = objc_msgSend(v53, "initWithRetriableBlock:", v166);

    objc_destroyWeak(&v169);
    objc_destroyWeak((id *)location);
    lazyBackgroundQueueObjectFetchingPhotoLibrary = v8->_lazyBackgroundQueueObjectFetchingPhotoLibrary;
    v8->_lazyBackgroundQueueObjectFetchingPhotoLibrary = (PLLazyObject *)v56;

    v58 = objc_initWeak((id *)location, v8);
    v59 = objc_alloc(MEMORY[0x1E0D73248]);
    v162[0] = v23;
    v162[1] = 3221225472;
    v162[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_7;
    v162[3] = &unk_1E35D97A0;
    objc_copyWeak(&v165, (id *)location);
    v60 = v54;
    v163 = v60;
    v61 = v55;
    v164 = v61;
    v62 = objc_msgSend(v59, "initWithRetriableBlock:", v162);

    objc_destroyWeak(&v165);
    objc_destroyWeak((id *)location);
    lazyGraphObjectFetchingPhotoLibrary = v8->_lazyGraphObjectFetchingPhotoLibrary;
    v8->_lazyGraphObjectFetchingPhotoLibrary = (PLLazyObject *)v62;

    v64 = objc_initWeak((id *)location, v8);
    v65 = objc_alloc(MEMORY[0x1E0D73248]);
    v158[0] = v23;
    v158[1] = 3221225472;
    v158[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_8;
    v158[3] = &unk_1E35D97A0;
    objc_copyWeak(&v161, (id *)location);
    v66 = v60;
    v159 = v66;
    v67 = v61;
    v160 = v67;
    v68 = objc_msgSend(v65, "initWithRetriableBlock:", v158);

    objc_destroyWeak(&v161);
    objc_destroyWeak((id *)location);
    lazyChangeHandlingPhotoLibrary = v8->_lazyChangeHandlingPhotoLibrary;
    v8->_lazyChangeHandlingPhotoLibrary = (PLLazyObject *)v68;

    v70 = objc_initWeak((id *)location, v8);
    v71 = objc_alloc(MEMORY[0x1E0D73248]);
    v156[0] = v23;
    v156[1] = 3221225472;
    v156[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_9;
    v156[3] = &unk_1E35DDF28;
    objc_copyWeak(&v157, (id *)location);
    v72 = objc_msgSend(v71, "initWithBlock:", v156);
    objc_destroyWeak(&v157);
    objc_destroyWeak((id *)location);
    lazyAlbumRootFolderObjectID = v8->_lazyAlbumRootFolderObjectID;
    v8->_lazyAlbumRootFolderObjectID = (PLLazyObject *)v72;

    v74 = objc_initWeak((id *)location, v8);
    v75 = objc_alloc(MEMORY[0x1E0D73248]);
    v154[0] = v23;
    v154[1] = 3221225472;
    v154[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_10;
    v154[3] = &unk_1E35DDF28;
    objc_copyWeak(&v155, (id *)location);
    v76 = objc_msgSend(v75, "initWithBlock:", v154);
    objc_destroyWeak(&v155);
    objc_destroyWeak((id *)location);
    lazyProjectAlbumRootFolderObjectID = v8->_lazyProjectAlbumRootFolderObjectID;
    v8->_lazyProjectAlbumRootFolderObjectID = (PLLazyObject *)v76;

    v78 = objc_initWeak((id *)location, v8);
    v79 = objc_alloc(MEMORY[0x1E0D73248]);
    v152[0] = v23;
    v152[1] = 3221225472;
    v152[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_11;
    v152[3] = &unk_1E35DDF28;
    objc_copyWeak(&v153, (id *)location);
    v80 = objc_msgSend(v79, "initWithBlock:", v152);
    objc_destroyWeak(&v153);
    objc_destroyWeak((id *)location);
    lazyAppPrivateData = v8->_lazyAppPrivateData;
    v8->_lazyAppPrivateData = (PLLazyObject *)v80;

    v82 = objc_initWeak((id *)location, v8);
    v83 = objc_alloc(MEMORY[0x1E0D73248]);
    v150[0] = v23;
    v150[1] = 3221225472;
    v150[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_12;
    v150[3] = &unk_1E35DDF28;
    objc_copyWeak(&v151, (id *)location);
    v84 = objc_msgSend(v83, "initWithBlock:", v150);
    objc_destroyWeak(&v151);
    objc_destroyWeak((id *)location);
    lazyPhotoLibraryIdentifier = v8->_lazyPhotoLibraryIdentifier;
    v8->_lazyPhotoLibraryIdentifier = (PLLazyObject *)v84;

    v86 = objc_initWeak((id *)location, v8);
    v87 = objc_alloc(MEMORY[0x1E0D73248]);
    v148[0] = v23;
    v148[1] = 3221225472;
    v148[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_13;
    v148[3] = &unk_1E35DDF28;
    objc_copyWeak(&v149, (id *)location);
    v88 = objc_msgSend(v87, "initWithBlock:", v148);
    objc_destroyWeak(&v149);
    objc_destroyWeak((id *)location);
    lazySearchIndex = v8->_lazySearchIndex;
    v8->_lazySearchIndex = (PLLazyObject *)v88;

    v90 = dispatch_queue_create("com.apple.PHPhotoLibrary.isolation", 0);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v90;

    if (-[PHPhotoLibrary isSystemPhotoLibrary](v8, "isSystemPhotoLibrary") && (PLIsAssetsd() & 1) == 0)
    {
      v95 = objc_initWeak((id *)location, v8);

      v96 = objc_alloc(MEMORY[0x1E0D73248]);
      v146[0] = v23;
      v146[1] = 3221225472;
      v146[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_14;
      v146[3] = &unk_1E35DDF28;
      objc_copyWeak(&v147, (id *)location);
      v97 = objc_msgSend(v96, "initWithBlock:", v146);
      objc_destroyWeak(&v147);
      objc_destroyWeak((id *)location);
      lazyCacheMetricsCollectorClient = v8->_lazyCacheMetricsCollectorClient;
      v8->_lazyCacheMetricsCollectorClient = (PLLazyObject *)v97;
    }
    else
    {
      PLCacheMetricsCollectorGetLog();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_1991EC000, v92, OS_LOG_TYPE_DEFAULT, "skipping initializing cacheMetrics collection in PHPhotoLibrary: not using system library or initializing in assetsd", location, 2u);
      }

      v93 = objc_msgSend(objc_alloc(MEMORY[0x1E0D73248]), "initWithObject:", 0);
      lazyCacheMetricsCollectorClient = v8->_lazyCacheMetricsCollectorClient;
      v8->_lazyCacheMetricsCollectorClient = (PLLazyObject *)v93;
    }

    v98 = objc_initWeak((id *)location, v8);
    v99 = objc_alloc(MEMORY[0x1E0D73248]);
    v144[0] = v23;
    v144[1] = 3221225472;
    v144[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_169;
    v144[3] = &unk_1E35DDF28;
    objc_copyWeak(&v145, (id *)location);
    v100 = objc_msgSend(v99, "initWithRetriableBlock:", v144);
    objc_destroyWeak(&v145);
    objc_destroyWeak((id *)location);
    lazyCPLStatus = v8->_lazyCPLStatus;
    v8->_lazyCPLStatus = (PLLazyObject *)v100;

    v102 = objc_initWeak((id *)location, v8);
    v103 = objc_alloc(MEMORY[0x1E0D73248]);
    v142[0] = v23;
    v142[1] = 3221225472;
    v142[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2_170;
    v142[3] = &unk_1E35DDF28;
    objc_copyWeak(&v143, (id *)location);
    v104 = objc_msgSend(v103, "initWithRetriableBlock:", v142);
    objc_destroyWeak(&v143);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysis = v8->_lazyIsReadyForAnalysis;
    v8->_lazyIsReadyForAnalysis = (PLLazyObject *)v104;

    v106 = objc_initWeak((id *)location, v8);
    v107 = objc_alloc(MEMORY[0x1E0D73248]);
    v140[0] = v23;
    v140[1] = 3221225472;
    v140[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3_171;
    v140[3] = &unk_1E35DDF28;
    objc_copyWeak(&v141, (id *)location);
    v108 = objc_msgSend(v107, "initWithRetriableBlock:", v140);
    objc_destroyWeak(&v141);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysisQuickCheck = v8->_lazyIsReadyForAnalysisQuickCheck;
    v8->_lazyIsReadyForAnalysisQuickCheck = (PLLazyObject *)v108;

    v110 = objc_initWeak((id *)location, v8);
    v111 = objc_alloc(MEMORY[0x1E0D73248]);
    v138[0] = v23;
    v138[1] = 3221225472;
    v138[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4_172;
    v138[3] = &unk_1E35DDF28;
    objc_copyWeak(&v139, (id *)location);
    v112 = objc_msgSend(v111, "initWithRetriableBlock:", v138);
    objc_destroyWeak(&v139);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysisCPLInitialDownloadCompleted = v8->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted;
    v8->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted = (PLLazyObject *)v112;

    v114 = objc_msgSend(objc_alloc(MEMORY[0x1E0D715C8]), "initWithLibraryBundle:", v66);
    cplSettingsObserver = v8->_cplSettingsObserver;
    v8->_cplSettingsObserver = (PLCPLSettingsObserver *)v114;

    -[PLCPLSettingsObserver setDelegate:](v8->_cplSettingsObserver, "setDelegate:", v8);
    v116 = objc_initWeak((id *)location, v8);

    v117 = objc_alloc(MEMORY[0x1E0D73248]);
    v136[0] = v23;
    v136[1] = 3221225472;
    v136[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5_174;
    v136[3] = &unk_1E35DDF28;
    objc_copyWeak(&v137, (id *)location);
    v118 = objc_msgSend(v117, "initWithBlock:", v136);
    objc_destroyWeak(&v137);
    objc_destroyWeak((id *)location);
    lazyMainScopeIdentifier = v8->_lazyMainScopeIdentifier;
    v8->_lazyMainScopeIdentifier = (PLLazyObject *)v118;

    v120 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71088]), "initWithProvider:", v8);
    stateCaptureHandler = v8->_stateCaptureHandler;
    v8->_stateCaptureHandler = (PFStateCaptureHandler *)v120;

    v122 = objc_alloc_init(PHChangeHandlingDebugger);
    changeHandlingDebugger = v8->_changeHandlingDebugger;
    v8->_changeHandlingDebugger = v122;

    v124 = [PHPhotoLibraryObserverRegistrar alloc];
    photoLibraryBundle = v8->_photoLibraryBundle;
    v126 = v8->_changeHandlingDebugger;
    +[PHPhotoLibrary uniqueObjectIDCache](PHPhotoLibrary, "uniqueObjectIDCache");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = -[PHPhotoLibraryObserverRegistrar initWithLibraryBundle:changeHandlingDebugger:uniqueObjectIDCache:](v124, "initWithLibraryBundle:changeHandlingDebugger:uniqueObjectIDCache:", photoLibraryBundle, v126, v127);
    observerRegistrar = v8->_observerRegistrar;
    v8->_observerRegistrar = (PHPhotoLibraryObserverRegistrar *)v128;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addObserver:selector:name:object:", v8, sel_handleMergeNotification_, *MEMORY[0x1E0D71FA0], 0);

    if (-[PHPhotoLibrary isSystemPhotoLibrary](v8, "isSystemPhotoLibrary"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "addObserver:selector:name:object:", v8, sel_accountDidChange_, *MEMORY[0x1E0D71C28], v132);

    }
  }
  PLPhotosObjectLifecycleGetLog();
  v133 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
  {
    v134 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v134;
    v192 = 2048;
    v193 = v8;
    v194 = 2112;
    v195 = v7;
    _os_log_impl(&dword_1991EC000, v133, OS_LOG_TYPE_DEBUG, "%@ %p initWithPhotoLibraryBundle:%@", location, 0x20u);
  }

  return v8;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return -[PLCPLSettingsObserver isCloudPhotoLibraryEnabled](self->_cplSettingsObserver, "isCloudPhotoLibraryEnabled");
}

- (BOOL)isSystemPhotoLibrary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isSystemPhotoLibraryURL:", v4);

  return (char)v3;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", a3);
}

- (id)libraryID
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryBundle pathManager](self->_photoLibraryBundle, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isMultiLibraryModeEnabled
{
  return objc_msgSend(MEMORY[0x1E0D73280], "isMultiLibraryModeEnabled");
}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  dispatch_block_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id *v31;
  char v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  id v39;
  id v40;
  id obj;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__18234;
    v47 = __Block_byref_object_dispose__18235;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 216);
    v48 = v2;
    if (v2)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        PHErrorFromPLError(v2);
        **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_36:
      _Block_object_dispose(&v43, 8);

      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "assetsdClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id *)(v44 + 5);
    obj = (id)v44[5];
    v42 = 0;
    v6 = objc_msgSend(v4, "openPhotoLibraryDatabaseWithPostOpenProgress:error:", &v42, &obj);
    v7 = v42;
    v8 = v42;
    objc_storeStrong(v5, obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      || (objc_msgSend(MEMORY[0x1E0D73280], "ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:", objc_msgSend(*(id *)(a1 + 32), "wellKnownPhotoLibraryIdentifier")) & 1) != 0)
    {
LABEL_23:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend((id)v44[5], "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D74498]) & 1) != 0)
        {
          v24 = objc_msgSend((id)v44[5], "code") == 41013;

          if (v24)
          {
            if (*(_BYTE *)(a1 + 64))
            {
              v25 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_142);
              v26 = *(void **)(a1 + 32);
              v27 = *(_QWORD *)(a1 + 40);
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v35[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2_143;
              v35[3] = &unk_1E35D96E0;
              v37 = *(_QWORD *)(a1 + 48);
              v38 = &v43;
              v28 = v25;
              v36 = v28;
              v29 = (id)objc_msgSend(v26, "upgradePhotoLibraryUsingOptions:completion:", v27, v35);
              dispatch_block_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

            }
LABEL_31:
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              LOBYTE(v33) = 1;
            }
            else
            {
              v33 = *(_QWORD *)(a1 + 56);
              if (v33)
              {
                PHErrorFromPLError((void *)v44[5]);
                **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
                LOBYTE(v33) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              }
            }
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = v33;
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), (id)v44[5]);

            goto LABEL_36;
          }
        }
        else
        {

        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), v7);
        v30 = *(void **)(a1 + 32);
        v31 = (id *)(v44 + 5);
        v34 = (id)v44[5];
        v32 = objc_msgSend(v30, "_postOpenInitializationWithError:", &v34);
        objc_storeStrong(v31, v34);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v32;
      }
      goto LABEL_31;
    }
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
    v40 = 0;
    v10 = *MEMORY[0x1E0C99BB8];
    v39 = 0;
    v11 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v40, v10, &v39);
    v12 = v40;
    v13 = v39;
    if (v11)
    {
      v14 = objc_msgSend(v12, "unsignedIntegerValue");
      if (v14 >= objc_msgSend(MEMORY[0x1E0D731F8], "minimumAvailableBytesRequiredForLibraryOpen"))
      {
LABEL_22:

        goto LABEL_23;
      }
      PLPhotoKitGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
        *(_DWORD *)buf = 138412546;
        v54 = v16;
        v55 = 2112;
        v56 = v12;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Volume containing photo library %@ has insufficient free space %@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
      if (v17)
      {
        v51 = *MEMORY[0x1E0CB3308];
        v52 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3305, v18);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
        *(_DWORD *)buf = 138412546;
        v54 = v20;
        v55 = 2112;
        v56 = v13;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "getResourceValue for volume available capacity at %@ failed with error %@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      if (v13)
      {
        v49 = *MEMORY[0x1E0CB3388];
        v50 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v18);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v44[5];
    v44[5] = v21;

    goto LABEL_22;
  }
}

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  return self->_wellKnownPhotoLibraryIdentifier;
}

- (PLAssetsdClient)assetsdClient
{
  return (PLAssetsdClient *)-[PLPhotoLibraryBundle assetsdClient](self->_photoLibraryBundle, "assetsdClient");
}

- (BOOL)_postOpenInitializationWithError:(id *)a3
{
  void *v5;
  PLPhotoLibraryBundle *photoLibraryBundle;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCompletedPostOpenInitialization);
  }
  else if (a3)
  {
    photoLibraryBundle = self->_photoLibraryBundle;
    v12 = 0;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D719A8], "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PHPhotoLibrary _postOpenInitializationWithError:]", photoLibraryBundle, 0, &v12);
    v8 = v12;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3308]);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Creation of PLPhotoLibrary failed"), *MEMORY[0x1E0CB2938]);
    if (v8)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5 != 0;
}

- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  PHAuthorizationStatus v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *isolationQueue;
  id v16;
  char v17;
  _QWORD v19[5];
  id v20;
  __int128 *p_buf;
  id *v22;
  BOOL v23;
  _QWORD v24[4];
  NSObject *v25;
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PHPhotoLibrary wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier");
  v9 = +[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", 2);
  PLPhotoKitGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134349056;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary openAndWaitWithUpgrade: authorization status is %{public}td", (uint8_t *)&buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  if (v9 == PHAuthorizationStatusNotDetermined)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary openAndWaitWithUpgrade: PHAuthorizationStatusNotDetermined", (uint8_t *)&buf, 2u);
    }

    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke;
    v24[3] = &unk_1E35D96B8;
    v25 = v13;
    v14 = v13;
    +[PHPhotoLibrary requestAuthorizationForAccessLevel:handler:](PHPhotoLibrary, "requestAuthorizationForAccessLevel:handler:", 2, v24);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x2020000000;
  v28 = 0;
  isolationQueue = self->_isolationQueue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2;
  v19[3] = &unk_1E35D9708;
  p_buf = &buf;
  v22 = a5;
  v23 = a3;
  v19[4] = self;
  v20 = v8;
  v16 = v8;
  dispatch_sync(isolationQueue, v19);
  v17 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (void)registerChangeObserver:(id)observer
{
  id v4;
  PHAuthorizationStatus v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = observer;
  if (v4)
  {
    v5 = +[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", 2);
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary _addObservers:authorizationStatus:](self, "_addObservers:authorizationStatus:", v6, v5);

    if ((unint64_t)(v5 - 3) > 1)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __41__PHPhotoLibrary_registerChangeObserver___block_invoke;
      v9[3] = &unk_1E35D96B8;
      v9[4] = self;
      +[PHPhotoLibrary requestAuthorizationForAccessLevel:handler:](PHPhotoLibrary, "requestAuthorizationForAccessLevel:handler:", 2, v9);
    }
    else
    {
      -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        PLPhotoKitGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unexpected error, could not access photo library", buf, 2u);
        }

      }
    }
  }

}

- (void)_addObservers:(id)a3 authorizationStatus:(int64_t)a4
{
  -[PHPhotoLibraryObserverRegistrar addObservers:authorizationStatus:](self->_observerRegistrar, "addObservers:authorizationStatus:", a3, a4);
}

- (PLPhotoLibrary)photoLibrary
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary _lazyPhotoLibrary](self, "_lazyPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[PHPhotoLibrary debugDescription](self, "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "Unable to create PLPhotoLibrary for PHPhotoLibrary: %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return (PLPhotoLibrary *)v4;
}

- (id)_lazyPhotoLibrary
{
  PLLazyObject *v3;

  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
  {
    +[PHPhotoLibrary sharedLazyPhotoLibraryForCMM](PHPhotoLibrary, "sharedLazyPhotoLibraryForCMM");
    v3 = (PLLazyObject *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_lazyPhotoLibrary;
  }
  return v3;
}

- (id)pathManager
{
  return (id)-[PLPhotoLibraryBundle pathManager](self->_photoLibraryBundle, "pathManager");
}

+ (const)systemPhotoLibraryURLChangeNotificationName
{
  return (const char *)*MEMORY[0x1E0D74888];
}

void __34__PHPhotoLibrary_postOpenProgress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

void __37__PHPhotoLibrary_uniqueObjectIDCache__block_invoke()
{
  PHUniqueObjectIDCache *v0;
  void *v1;

  v0 = objc_alloc_init(PHUniqueObjectIDCache);
  v1 = (void *)uniqueObjectIDCache_pl_once_object_78;
  uniqueObjectIDCache_pl_once_object_78 = (uint64_t)v0;

}

void __37__PHPhotoLibrary__sharedPhotoLibrary__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PHPhotoLibrary initSharedLibrary]([PHPhotoLibrary alloc], "initSharedLibrary");
  v1 = (void *)sharedPhotoLibrary;
  sharedPhotoLibrary = (uint64_t)v0;

}

- (id)initSharedLibrary
{
  void *v3;
  PHPhotoLibrary *v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHPhotoLibrary initWithPhotoLibraryURL:type:](self, "initWithPhotoLibraryURL:type:", v3, 0);

  return v4;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryUserInitiatedQoS", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibrary", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryMainQueueQoS", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (PHPhotoLibrary)sharedPhotoLibrary
{
  objc_msgSend(MEMORY[0x1E0D73280], "assertSingleLibraryMode");
  return (PHPhotoLibrary *)objc_msgSend(a1, "_sharedPhotoLibrary");
}

- (NSProgress)postOpenProgress
{
  NSObject *isolationQueue;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[6];
  id v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18234;
  v18 = __Block_byref_object_dispose__18235;
  v19 = 0;
  isolationQueue = self->_isolationQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PHPhotoLibrary_postOpenProgress__block_invoke;
  block[3] = &unk_1E35DF920;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(isolationQueue, block);
  v5 = (void *)v15[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v12 = 0;
    -[PHPhotoLibrary openAndWaitWithUpgrade:error:](self, "openAndWaitWithUpgrade:error:", 0, &v12);
    v7 = v12;
    if (v7)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "failed to open photo library %@", buf, 0xCu);
      }

    }
    v9 = self->_isolationQueue;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __34__PHPhotoLibrary_postOpenProgress__block_invoke_151;
    v11[3] = &unk_1E35DF920;
    v11[4] = self;
    v11[5] = &v14;
    dispatch_sync(v9, v11);
    v6 = (id)v15[5];

  }
  _Block_object_dispose(&v14, 8);

  return (NSProgress *)v6;
}

- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4
{
  return -[PHPhotoLibrary openAndWaitWithUpgrade:options:error:](self, "openAndWaitWithUpgrade:options:error:", a3, 0, a4);
}

void __33__PHPhotoLibrary_allowedEntities__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71778], "entityName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v4, CFSTR("Album"), v1, CFSTR("FetchingAlbum"), CFSTR("CloudSharedAlbum"), CFSTR("CloudSharedAlbumInvitationRecord"), CFSTR("LegacyFaceAlbum"), CFSTR("PhotoStreamAlbum"), CFSTR("Folder"), CFSTR("Moment"), CFSTR("MomentList"), CFSTR("DetectedFace"), CFSTR("Person"), CFSTR("DetectedFaceGroup"), CFSTR("Memory"), CFSTR("FaceCrop"), CFSTR("PhotosHighlight"),
    CFSTR("GraphNode"),
    CFSTR("Suggestion"),
    CFSTR("ImportSession"),
    CFSTR("ProjectAlbum"),
    CFSTR("Keyword"),
    CFSTR("Question"),
    CFSTR("LibraryScope"),
    CFSTR("ShareParticipant"),
    CFSTR("CloudSharedComment"),
    0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedEntities_pl_once_object_79;
  allowedEntities_pl_once_object_79 = v2;

}

void __45__PHPhotoLibrary_PHObjectClassesByEntityName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[27];
  _QWORD v9[28];

  v9[27] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Asset");
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v0;
  v9[1] = objc_opt_class();
  v8[2] = CFSTR("Album");
  v9[2] = objc_opt_class();
  v8[3] = CFSTR("FetchingAlbum");
  v9[3] = objc_opt_class();
  v8[4] = CFSTR("CloudSharedAlbum");
  v9[4] = objc_opt_class();
  v8[5] = CFSTR("CloudSharedAlbumInvitationRecord");
  v9[5] = objc_opt_class();
  v8[6] = CFSTR("LegacyFaceAlbum");
  v9[6] = objc_opt_class();
  v8[7] = CFSTR("PhotoStreamAlbum");
  v9[7] = objc_opt_class();
  v8[8] = CFSTR("Folder");
  v9[8] = objc_opt_class();
  v8[9] = CFSTR("Moment");
  v9[9] = objc_opt_class();
  v8[10] = CFSTR("MomentList");
  v9[10] = objc_opt_class();
  v8[11] = CFSTR("DetectedFace");
  v9[11] = objc_opt_class();
  v8[12] = CFSTR("Person");
  v9[12] = objc_opt_class();
  v8[13] = CFSTR("DetectedFaceGroup");
  v9[13] = objc_opt_class();
  v8[14] = CFSTR("Memory");
  v9[14] = objc_opt_class();
  v8[15] = CFSTR("FaceCrop");
  v9[15] = objc_opt_class();
  v8[16] = CFSTR("PhotosHighlight");
  v9[16] = objc_opt_class();
  v8[17] = CFSTR("MomentShare");
  v9[17] = objc_opt_class();
  v8[18] = CFSTR("LibraryScope");
  v9[18] = objc_opt_class();
  v8[19] = CFSTR("ShareParticipant");
  v9[19] = objc_opt_class();
  v8[20] = CFSTR("CloudSharedComment");
  v9[20] = objc_opt_class();
  v8[21] = CFSTR("Suggestion");
  v9[21] = objc_opt_class();
  v8[22] = CFSTR("ImportSession");
  v9[22] = objc_opt_class();
  v8[23] = CFSTR("ProjectAlbum");
  v9[23] = objc_opt_class();
  v8[24] = CFSTR("Keyword");
  v9[24] = objc_opt_class();
  v8[25] = CFSTR("Question");
  v9[25] = objc_opt_class();
  v8[26] = CFSTR("DuplicateAlbum");
  v9[26] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 27);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v1, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedKeySetForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithSharedKeySet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v1);
  v7 = (void *)PHObjectClassesByEntityName_nameToClass;
  PHObjectClassesByEntityName_nameToClass = (uint64_t)v6;

}

- (BOOL)shouldMobileSlideShowLaunchWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  int v17;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ShouldMobileSlideShowLaunch", ", buf, 2u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D718E0], "shouldPromptUserForLibrarySchemaMismatch") & 1) == 0)
  {
    v16 = v8;
    v14 = v16;
    if (v9 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v15 = "Do not prompt";
    goto LABEL_12;
  }
  -[PHPhotoLibrary photoLibraryBundle](self, "photoLibraryBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedPersistentStoreCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v19 = (void *)MEMORY[0x1E0D71920];
    -[PHPhotoLibrary photoLibraryBundle](self, "photoLibraryBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v17 = objc_msgSend(v19, "currentModelVersionMatchesLibrarySchemaVersionWithPathManager:error:", v21, &v36);
    v14 = v36;

    if ((v17 & 1) == 0)
    {
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v14;
        _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "shouldMobileSlideShowLaunchWithError: %@", buf, 0xCu);
      }

      if (PLIsErrorEqualToCode())
      {
        PLBackendGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "Library requires upgrade. Calling openAndWaitWithUpgrade:YES", buf, 2u);
        }

        v35 = 0;
        v24 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](self, "openAndWaitWithUpgrade:error:", 1, &v35);
        v14 = v35;
        if (v24)
        {
          PLBackendGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEFAULT, "Library open (upgrade) succeeded, MobileSlideShow can proceed.", buf, 2u);
          }

          v26 = v8;
          if (v9 < 0xFFFFFFFFFFFFFFFELL)
          {
            v27 = v26;
            if (os_signpost_enabled(v26))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1991EC000, v27, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Library open (upgrade) succeeded", buf, 2u);
            }
          }
          LOBYTE(v17) = 1;
        }
        else
        {
          PLBackendGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v14;
            _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "Library upgrade failed with error %@", buf, 0xCu);
          }

          if (a3)
            *a3 = objc_retainAutorelease(v14);
          v33 = v8;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v34 = v33;
            if (os_signpost_enabled(v33))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1991EC000, v34, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Library upgrade failed", buf, 2u);
            }
          }
          LOBYTE(v17) = 0;
        }
LABEL_42:

        goto LABEL_14;
      }
      PHErrorFromPLError(v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (a3)
        *a3 = objc_retainAutorelease(v28);

    }
    v30 = v8;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v31 = v30;
      if (os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v17;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v31, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Result: %d", buf, 8u);
      }
    }
    goto LABEL_42;
  }
  v13 = v8;
  v14 = v13;
  if (v9 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13))
    goto LABEL_13;
  *(_WORD *)buf = 0;
  v15 = "Found shared PSC";
LABEL_12:
  _os_signpost_emit_with_name_impl(&dword_1991EC000, v14, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", v15, buf, 2u);
LABEL_13:
  LOBYTE(v17) = 1;
LABEL_14:

  return v17;
}

- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3
{
  return -[PHPhotoLibrary initWithPhotoLibraryURL:type:](self, "initWithPhotoLibraryURL:type:", a3, 0);
}

+ (void)enableMultiLibraryMode
{
  objc_msgSend(MEMORY[0x1E0D73280], "enableMultiLibraryMode");
}

+ (id)_sharedPhotoLibrary
{
  id v3;

  if (sharedPhotoLibraryOnceToken != -1)
    dispatch_once(&sharedPhotoLibraryOnceToken, &__block_literal_global_18627);
  if (!sharedPhotoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to create shared library"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return (id)sharedPhotoLibrary;
}

- (NSString)uuid
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoDirectoryWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)searchDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsdClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSearchDebugInformationForAssetUUID:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0D718C8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:", a3, v13, v14, v12, v11);

  return a3;
}

- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a3;
  if (-[PHPhotoLibrary wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") != 3
    && (PLIsInternalTool() & 1) == 0
    && (MEMORY[0x19AEBDFF0]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+MediaProcessing.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsInternalTool() || PLIsXcTest()"));

  }
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoKitClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:error:", v12, v11, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("PhotoKit client is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 4302, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v14 && a6)
      *a6 = objc_retainAutorelease(v19);

    v16 = 0;
  }

  return v16;
}

- (BOOL)processUniversalSearchJITForAssetLocalIdentifier:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (-[PHPhotoLibrary wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") != 3
    && (PLIsInternalTool() & 1) == 0
    && (MEMORY[0x19AEBDFF0]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+MediaProcessing.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsInternalTool() || PLIsXcTest()"));

  }
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoKitClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13 = objc_msgSend(v11, "processUniversalSearchJITForAssetUUID:processingTypes:error:", v12, a4, a5);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = CFSTR("PhotoKit client is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 4302, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v13 = 0;
  }

  return v13;
}

- (id)fetchAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:](PHMediaProcessingAlgorithmVersionProvider, "descriptionForVersionProvider:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218754;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2114;
    v29 = v14;
    v30 = 2048;
    v31 = a6;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "fetchAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);

  }
  *(float *)&v15 = a6;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:error:", a3, a4, v12, 0, a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_10;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "fetchError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = (unint64_t)v20;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v17, "fetchError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a7)
      *a7 = objc_retainAutorelease(v21);

LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (id)fetchUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:](PHMediaProcessingAlgorithmVersionProvider, "descriptionForVersionProvider:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218754;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2114;
    v29 = v14;
    v30 = 2048;
    v31 = a6;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "fetchUnprocessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);

  }
  *(float *)&v15 = a6;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, v12, 0, 0, a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_10;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "fetchError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = (unint64_t)v20;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v17, "fetchError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a7)
      *a7 = objc_retainAutorelease(v21);

LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (id)fetchProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:](PHMediaProcessingAlgorithmVersionProvider, "descriptionForVersionProvider:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218754;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2114;
    v29 = v14;
    v30 = 2048;
    v31 = a6;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "fetchProcessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);

  }
  *(float *)&v15 = a6;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, v12, 1, 0, a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_10;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "fetchError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = (unint64_t)v20;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v17, "fetchError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a7)
      *a7 = objc_retainAutorelease(v21);

LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (id)fetchProcessedAssetsBelowAnalysisStage:(signed __int16)a3 forTaskIDs:(id)a4 algorithmVersion:(id)a5 error:(id *)a6
{
  int v7;
  id v8;
  id v9;
  id v10;
  PHMediaProcessingAlgorithmVersionProvider *v11;
  PHMediaProcessingAlgorithmVersionProvider *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v7 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9)
  {
    v11 = -[PHMediaProcessingAlgorithmVersionProvider initWithProvider:]([PHMediaProcessingAlgorithmVersionProvider alloc], "initWithProvider:", v9);
  }
  else
  {
    +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions](PHMediaProcessingAlgorithmVersionProvider, "providerWithCurrentVersions");
    v11 = (PHMediaProcessingAlgorithmVersionProvider *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "unsignedIntegerValue");
        PLProcessingPredicateForTaskID();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v10, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  v19 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("computeSyncAttributes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %d"), CFSTR("computeSyncAttributes.localAnalysisStage"), v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "orPredicateWithSubpredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v23);
  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInternalPredicate:", v25);

  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (unint64_t)countOfUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  const __CFString *v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:](PHMediaProcessingAlgorithmVersionProvider, "descriptionForVersionProvider:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 2114;
    v32 = v14;
    v33 = 2048;
    v34 = a6;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "countOfUnprocessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", buf, 0x2Au);

  }
  *(float *)&v15 = a6;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, v12, 0, 0, a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShouldPrefetchCount:", 1);
  v26 = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFetchPropertySets:", v17);

  objc_msgSend(v16, "setSortDescriptors:", 0);
  if (!v16)
    goto LABEL_13;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fetchError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    PLPhotoKitGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "fetchError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = (unint64_t)v21;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", buf, 0xCu);

    }
    objc_msgSend(v18, "fetchError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a7)
      *a7 = objc_retainAutorelease(v22);

    v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_13:
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v24 = objc_msgSend(v18, "count");
LABEL_12:

LABEL_14:
  return v24;
}

- (unint64_t)countOfAllAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 sceneConfidenceThreshold:(float)a5 error:(id *)a6
{
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  const __CFString *v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2048;
    v29 = a5;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_INFO, "countOfAllAssetsForMediaProcessingTaskID:%tu priority:%tu confidence:%f", buf, 0x20u);
  }

  *(float *)&v12 = a5;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, 0, 0, 0, a6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldPrefetchCount:", 1);
  v23 = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFetchPropertySets:", v14);

  objc_msgSend(v13, "setSortDescriptors:", 0);
  if (!v13)
    goto LABEL_13;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "fetchError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = (unint64_t)v18;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", buf, 0xCu);

    }
    objc_msgSend(v15, "fetchError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a6)
      *a6 = objc_retainAutorelease(v19);

    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_13:
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v21 = objc_msgSend(v15, "count");
LABEL_12:

LABEL_14:
  return v21;
}

- (unint64_t)countOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  const __CFString *v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:](PHMediaProcessingAlgorithmVersionProvider, "descriptionForVersionProvider:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 2114;
    v32 = v14;
    v33 = 2048;
    v34 = a6;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "countOfProcessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", buf, 0x2Au);

  }
  *(float *)&v15 = a6;
  -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, v12, 1, 0, a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShouldPrefetchCount:", 1);
  v26 = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFetchPropertySets:", v17);

  objc_msgSend(v16, "setSortDescriptors:", 0);
  if (!v16)
    goto LABEL_13;
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fetchError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    PLPhotoKitGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "fetchError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = (unint64_t)v21;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", buf, 0xCu);

    }
    objc_msgSend(v18, "fetchError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a7)
      *a7 = objc_retainAutorelease(v22);

    v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_13:
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v24 = objc_msgSend(v18, "count");
LABEL_12:

LABEL_14:
  return v24;
}

- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 error:(id *)a8
{
  return -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, a5, a7, 1, a8);
}

- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 exactVersionMatch:(BOOL)a8 error:(id *)a9
{
  id v12;
  void *v13;
  PHMediaProcessingAlgorithmVersionProvider *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  if (-[PHPhotoLibrary _isValidTaskID:](self, "_isValidTaskID:", a3))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIncludeAssetSourceTypes:", 5);
    objc_msgSend(v13, "setIncludeAllBurstAssets:", -[PHPhotoLibrary _shouldIncludeAllBurstAssetsForTaskID:](self, "_shouldIncludeAllBurstAssetsForTaskID:", a3));
    objc_msgSend(v13, "setIncludeTrashedAssets:", -[PHPhotoLibrary _shouldIncludeTrashedAssetsForTaskID:](self, "_shouldIncludeTrashedAssetsForTaskID:", a3));
    objc_msgSend(v13, "setIncludeHiddenAssets:", -[PHPhotoLibrary _shouldIncludeHiddenAssetsForTaskID:](self, "_shouldIncludeHiddenAssetsForTaskID:", a3));
    objc_msgSend(v13, "setIncludeGuestAssets:", -[PHPhotoLibrary _shouldIncludeGuestAssetsForTaskID:](self, "_shouldIncludeGuestAssetsForTaskID:", a3));
    objc_msgSend(v13, "setIncludeOnlyAssetsAllowedForAnalysis:", -[PHPhotoLibrary _shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:](self, "_shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:", a3));
    if (v12)
      v14 = -[PHMediaProcessingAlgorithmVersionProvider initWithProvider:]([PHMediaProcessingAlgorithmVersionProvider alloc], "initWithProvider:", v12);
    else
      v14 = 0;
    PLInternalPredicateForMediaProcessingTaskID();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v23);

    -[PHPhotoLibrary _propertySetsForTaskID:](self, "_propertySetsForTaskID:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchPropertySets:", v24);

    -[PHPhotoLibrary _setSortDescriptors:forTaskID:](self, "_setSortDescriptors:forTaskID:", v13, a3);
    -[PHPhotoLibrary _setFetchLimit:forTaskID:](self, "_setFetchLimit:forTaskID:", v13, a3);

  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a3;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Unknown PHMediaProcessingTaskID (%tu)", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, *MEMORY[0x1E0CB2938]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("unknown taskID "), "stringByAppendingString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 8002, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a9)
      *a9 = objc_retainAutorelease(v21);

    v13 = 0;
  }

  return v13;
}

- (void)_setSortDescriptors:(id)a3 forTaskID:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3928];
  v6 = a3;
  if (a4 == 16)
  {
    objc_msgSend(v5, "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalSortDescriptors:", v8);
  }
  else
  {
    objc_msgSend(v5, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v8);
  }

}

- (void)_setFetchLimit:(id)a3 forTaskID:(unint64_t)a4
{
  if (a4 == 16)
    objc_msgSend(a3, "setFetchLimit:", 1000);
}

- (BOOL)_isValidTaskID:(unint64_t)a3
{
  return a3 - 1 < 0x12 || a3 == 0x7FFFFFFF;
}

- (BOOL)_shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:(unint64_t)a3
{
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 - 4 >= 0xF && a3 >= 3)
  {
    if (a3 == 3)
      return 1;
    if (a3 != 0x7FFFFFFF)
    {
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to NOT only allowed for analysis assets",
          (uint8_t *)&v7,
          0xCu);
      }

    }
  }
  return 0;
}

- (BOOL)_shouldIncludeGuestAssetsForTaskID:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x12)
  {
    if (a3 != 0x7FFFFFFF)
    {
      PLPhotoKitGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134217984;
        v7 = a3;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to include guest assets",
          (uint8_t *)&v6,
          0xCu);
      }

    }
    return 1;
  }
  if (((1 << a3) & 0x7FDF7) != 0)
    return 1;
  if (a3 == 3)
    return !-[PHPhotoLibrary isSystemPhotoLibrary](self, "isSystemPhotoLibrary");
  else
    return 0;
}

- (BOOL)_shouldIncludeAllBurstAssetsForTaskID:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x12)
  {
    if (a3 != 0x7FFFFFFF)
    {
      PLPhotoKitGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134217984;
        v7 = a3;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to include all burst assets",
          (uint8_t *)&v6,
          0xCu);
      }

    }
    return 1;
  }
  return ((1 << a3) & 0x2E9F3) != 0;
}

- (BOOL)_shouldIncludeTrashedAssetsForTaskID:(unint64_t)a3
{
  return ((a3 - 5) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_shouldIncludeHiddenAssetsForTaskID:(unint64_t)a3
{
  return a3 == 9;
}

- (id)_propertySetsForTaskID:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  const __CFString *v21;
  _QWORD v22[2];
  const __CFString *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[2];
  _QWORD v29[4];
  _QWORD v30[7];

  v30[5] = *MEMORY[0x1E0C80C00];
  v30[0] = CFSTR("PHAssetPropertySetCharacterRecognition");
  v30[1] = CFSTR("PHAssetPropertySetFaceWorker");
  v30[2] = CFSTR("PHAssetPropertySetMediaAnalysis");
  v30[3] = CFSTR("PHAssetPropertySetSceneAnalysis");
  v30[4] = CFSTR("PHAssetPropertySetVisualSearch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "addObject:", CFSTR("PHAssetPropertySetOriginalMetadata"));
  switch(a3)
  {
    case 1uLL:
    case 0x11uLL:
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v29[0] = CFSTR("PHAssetPropertySetMediaAnalysis");
      v29[1] = CFSTR("PHAssetPropertySetPhotoIris");
      v29[2] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v29[3] = CFSTR("PHAssetPropertySetSceneprint");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v7);

      if (-[PHPhotoLibrary wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") == 3)
        objc_msgSend(v6, "addObject:", CFSTR("PHAssetPropertySetCuration"));
      break;
    case 2uLL:
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v28[0] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v28[1] = CFSTR("PHAssetPropertySetIconicScore");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v28;
      goto LABEL_18;
    case 3uLL:
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v27 = CFSTR("PHAssetPropertySetFaceWorker");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v27;
      goto LABEL_16;
    case 4uLL:
      v25[0] = CFSTR("PHAssetPropertySetMediaAnalysis");
      v25[1] = CFSTR("PHAssetPropertySetPhotoIris");
      v25[2] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v25[3] = CFSTR("PHAssetPropertySetSceneprint");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v25;
      goto LABEL_11;
    case 5uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      break;
    case 6uLL:
      v24[0] = CFSTR("PHAssetPropertySetMediaAnalysis");
      v24[1] = CFSTR("PHAssetPropertySetPhotoIris");
      v24[2] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v24[3] = CFSTR("PHAssetPropertySetSceneprint");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v24;
LABEL_11:
      v10 = 4;
      goto LABEL_19;
    case 7uLL:
      goto LABEL_6;
    case 8uLL:
      v26 = CFSTR("PHAssetPropertySetFaceWorker");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v26;
      goto LABEL_16;
    case 9uLL:
      v23 = CFSTR("PHAssetPropertySetCloudLocalState");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v23;
      goto LABEL_16;
    case 0xAuLL:
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v22[0] = CFSTR("PHAssetPropertySetCharacterRecognition");
      v22[1] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v22;
      goto LABEL_18;
    case 0xBuLL:
      v21 = CFSTR("PHAssetPropertySetMediaAnalysis");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v21;
LABEL_16:
      v10 = 1;
      goto LABEL_19;
    case 0xCuLL:
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v20[0] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v20[1] = CFSTR("PHAssetPropertySetVisualSearch");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v20;
      goto LABEL_18;
    case 0x10uLL:
    case 0x12uLL:
      v19[0] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v19[1] = CFSTR("PHAssetPropertySetVisualSearch");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v19;
LABEL_18:
      v10 = 2;
LABEL_19:
      objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v11);

      break;
    default:
      if (a3 == 0x7FFFFFFF)
LABEL_6:
        objc_msgSend(v6, "addObjectsFromArray:", v5);
      break;
  }
  PLPhotoKitGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = 134218242;
    v16 = a3;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "PHMediaProcessingTaskID %tu using property sets:%{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v6, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)fetchFacesForMediaProcessingWithPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHPhotoLibrary _facesFetchOptionsForMediaProcessing](self, "_facesFetchOptionsForMediaProcessing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary _assetFetchOptionsForMediaProcessing](self, "_assetFetchOptionsForMediaProcessing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v26 = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("assetForFace"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v6;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("any %K in %@"), CFSTR("personForFace.personUUID"), v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    v34[0] = v12;
    v34[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setInternalPredicate:", v23);
    +[PHFace fetchFacesWithOptions:](PHFace, "fetchFacesWithOptions:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v27;
    v10 = v26;
  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Getting no object IDs when fetching assets on moment %@", buf, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (id)_baseFetchOptionsForMediaProcessing
{
  void *v2;

  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsIncrementalChangeDetails:", 0);
  return v2;
}

- (id)_facesFetchOptionsForMediaProcessing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary _baseFetchOptionsForMediaProcessing](self, "_baseFetchOptionsForMediaProcessing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("PHFacePropertySetIdentifier");
  v8[1] = CFSTR("PHFacePropertySetCore");
  v8[2] = CFSTR("PHFacePropertySetClustering");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E3657108);
  return v2;
}

- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoKitClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "_pl_map:", &__block_literal_global_2585);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:error:", a3, v13, a5, a6);

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = CFSTR("photokit client is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 4302, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a6)
      *a6 = objc_retainAutorelease(v17);

    v14 = 0;
  }

  return v14;
}

id __106__PHPhotoLibrary_MediaProcessing__resetStateForMediaProcessingTaskID_assetIdentifiers_resetOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", a2);
}

+ (BOOL)additionalCheckForProcessingNeededForAsset:(id)a3 taskID:(unint64_t)a4 priority:(unint64_t)a5
{
  return 1;
}

+ (id)mediaProcessingDeviceIndependentFacesSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetForFace.dateCreated"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetForFace.addedDate"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetForFace.filename"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("centerX"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("centerY"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)mediaProcessingFacesSortDescriptorsForGeneratingPersonModel
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetForFace.dateCreated"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sharingSuggestionWithRandomPick:(BOOL)a3 fallbackToRecentMoments:(BOOL)a4 needsNotification:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  NSObject *v46;
  _BYTE *v47;
  BOOL v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint8_t v52[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  void *v63;
  _QWORD v64[4];

  v40 = a5;
  v5 = a4;
  v6 = a3;
  v64[1] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d && state == %d"), 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  objc_msgSend(v8, "setFetchLimit:", 1);
  +[PHSuggestion fetchSuggestionsWithOptions:](PHSuggestion, "fetchSuggestionsWithOptions:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
    v14 = 0;
    if (objc_msgSend(v12, "count") || !v5)
      goto LABEL_36;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v16, "setMonth:", -240);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v16, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate >= %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("estimatedAssetCount > 8"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v21);
    -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPredicate:", v23);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSortDescriptors:", v24);

    objc_msgSend(v22, "setFetchLimit:", 6);
    +[PHAssetCollection fetchMomentsWithOptions:](PHAssetCollection, "fetchMomentsWithOptions:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "count"))
    {
      PLPhotoKitGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:"
                             "needsNotification:]";
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "%s Fail to add Suggestion (no moments found in the past 20 years)", buf, 0xCu);
      }
      v14 = 0;
      goto LABEL_34;
    }
    if (v6)
      objc_msgSend(v25, "objectAtIndex:", arc4random_uniform(objc_msgSend(v25, "count")));
    else
      objc_msgSend(v25, "firstObject");
    v28 = objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchKeyAssetsInAssetCollection:options:](PHAsset, "fetchKeyAssetsInAssetCollection:options:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v28, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      objc_msgSend(v38, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v60 = __Block_byref_object_copy__10671;
    v61 = __Block_byref_object_dispose__10672;
    v62 = 0;
    if (v30 && objc_msgSend(v38, "count"))
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke_21;
      v43[3] = &unk_1E35D7CD8;
      v44 = v30;
      v45 = v38;
      v48 = v40;
      v46 = v28;
      v47 = buf;
      v42 = 0;
      v31 = -[PHPhotoLibrary performChangesAndWait:error:](self, "performChangesAndWait:error:", v43, &v42);
      v41 = v42;

      if (v31)
      {
        -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
        v32 = objc_claimAutoreleasedReturnValue();
        v58 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v37, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
LABEL_33:

          _Block_object_dispose(buf, 8);
LABEL_34:

          v8 = v22;
LABEL_35:

          goto LABEL_36;
        }
        PLPhotoKitGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v52 = 136315650;
          v53 = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:needsNotification:]";
          v54 = 2112;
          v55 = v35;
          v56 = 2112;
          v57 = v41;
          _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_ERROR, "%s Added, but fail to find Suggestion by localIdentifier (%@): %@", v52, 0x20u);
        }

LABEL_32:
        v14 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      v41 = 0;
    }
    PLPhotoKitGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      v53 = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:needsNotification:]";
      v54 = 2112;
      v55 = v41;
      _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "%s Fail to add Suggestion: %@", v52, 0x16u);
    }
    goto LABEL_32;
  }
  if (v6)
    objc_msgSend(v12, "objectAtIndex:", arc4random_uniform(objc_msgSend(v12, "count")));
  else
    objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v40)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke;
    v50[3] = &unk_1E35DF110;
    v14 = v13;
    v51 = v14;
    v49 = 0;
    v26 = -[PHPhotoLibrary performChangesAndWait:error:](self, "performChangesAndWait:error:", v50, &v49);
    v15 = v49;
    if (!v26)
    {
      PLPhotoKitGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:"
                             "needsNotification:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "%s Fail to change Suggestion notification state: %@", buf, 0x16u);
      }

    }
    v21 = v51;
    goto LABEL_35;
  }
LABEL_36:

  return v14;
}

void __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke(uint64_t a1)
{
  id v1;

  +[PHSuggestionChangeRequest changeRequestForSuggestion:](PHSuggestionChangeRequest, "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNotificationState:", 1);

}

void __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke_21(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSuggestionChangeRequest creationRequestForSuggestionWithType:subtype:keyAssets:representativeAssets:creationDate:relevantUntilDate:version:](PHSuggestionChangeRequest, "creationRequestForSuggestionWithType:subtype:keyAssets:representativeAssets:creationDate:relevantUntilDate:version:", 1, 101, v2, v3, v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(*(id *)(a1 + 48), "localizedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v7);

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v5, "setNotificationState:", 1);
  objc_msgSend(v5, "markActive");
  objc_msgSend(v5, "placeholderForCreatedSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (BOOL)hasSyncProgressReturningImportOperations:(int *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  int *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PHPhotoLibrary_PHAdoptionUtilities__hasSyncProgressReturningImportOperations___block_invoke;
  v7[3] = &unk_1E35DE840;
  v5 = v4;
  v9 = &v11;
  v10 = a3;
  v8 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  LOBYTE(a3) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __80__PHPhotoLibrary_PHAdoptionUtilities__hasSyncProgressReturningImportOperations___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  int *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncProgressAlbumsIgnoreiTunes:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    v7 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "refreshObject:mergeChanges:", v9, 1);

        v11 = objc_msgSend(v9, "pendingItemsCount");
        if (v11)
          v7 |= objc_msgSend(v9, "pendingItemsType");
        v5 += v11;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v7 = 1;
  }
  v12 = *(int **)(a1 + 48);
  if (v12)
    *v12 = v7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5 != 0;

}

- (PHPhotoLibrary)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[PHPhotoLibrary init] unsupported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)initMomentShareLibrary
{
  void *v3;
  PHPhotoLibrary *v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHPhotoLibrary initWithPhotoLibraryURL:type:](self, "initWithPhotoLibraryURL:type:", v3, 1);

  return v4;
}

- (PHPhotoLibraryIdentifier)photoLibraryIdentifier
{
  return (PHPhotoLibraryIdentifier *)-[PLLazyObject objectValue](self->_lazyPhotoLibraryIdentifier, "objectValue");
}

- (BOOL)isCPLSyncablePhotoLibrary
{
  void *v4;
  char v5;

  if (-[PHPhotoLibrary isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
    return 1;
  -[PLCPLSettingsObserver settings](self->_cplSettingsObserver, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppLibrary");

  return v5;
}

- (BOOL)isReadOnlyCloudPhotoLibrary
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PHPhotoLibrary cplStatus](self, "cplStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "exitDeleteTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isKeepOriginalsEnabled
{
  void *v2;
  char v3;

  -[PLCPLSettingsObserver settings](self->_cplSettingsObserver, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeepOriginalsEnabled");

  return v3;
}

- (void)setKeepOriginalsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PLCPLSettingsObserver *cplSettingsObserver;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  cplSettingsObserver = self->_cplSettingsObserver;
  v8 = 0;
  v5 = -[PLCPLSettingsObserver setPrefetchMode:error:](cplSettingsObserver, "setPrefetchMode:error:", a3, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v10 = v3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Couldn't set keepOriginals to: %d, error: %@", buf, 0x12u);
    }

  }
}

- (id)_cachedCloudStatus
{
  PHPhotoLibraryCloudStatus *cachedCloudStatus;
  PHPhotoLibrary *v4;
  PHPhotoLibraryCloudStatus *v5;
  PHPhotoLibraryCloudStatus *v6;

  cachedCloudStatus = self->_cachedCloudStatus;
  v4 = self;
  v5 = cachedCloudStatus;
  objc_sync_enter(v4);
  v6 = self->_cachedCloudStatus;

  objc_sync_exit(v4);
  return v6;
}

- (void)_setCachedCloudStatus:(id)a3
{
  PHPhotoLibraryCloudStatus *v4;
  PHPhotoLibraryCloudStatus *cachedCloudStatus;
  PHPhotoLibrary *obj;

  v4 = (PHPhotoLibraryCloudStatus *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedCloudStatus = obj->_cachedCloudStatus;
  obj->_cachedCloudStatus = v4;

  objc_sync_exit(obj);
}

- (PHPhotoLibraryCloudStatus)cloudStatus
{
  PHPhotoLibraryCloudStatus *v3;
  void *v4;

  -[PHPhotoLibrary _cachedCloudStatus](self, "_cachedCloudStatus");
  v3 = (PHPhotoLibraryCloudStatus *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PHPhotoLibrary cplStatus](self, "cplStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PHPhotoLibraryCloudStatus initWithCPLStatus:]([PHPhotoLibraryCloudStatus alloc], "initWithCPLStatus:", v4);

  }
  return v3;
}

- (BOOL)isWalrusEnabled
{
  void *v2;
  char v3;

  -[PLLazyObject objectValue](self->_lazyCPLStatus, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWalrusEnabled");

  return v3;
}

- (void)getCPLConfigrationValueForClient:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = v6;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_7;
    v7 = (id *)MEMORY[0x1E0D11230];
  }
  else
  {
    v7 = (id *)MEMORY[0x1E0D11240];
  }
  v8 = *v7;
  v6 = v11;
  if (v8)
  {
    -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudInternalClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getCPLConfigrationValueForKey:completionHandler:", v8, v11);

LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
LABEL_7:
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v11, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (PHPhotoLibraryAppPrivateData)appPrivateData
{
  return (PHPhotoLibraryAppPrivateData *)-[PLLazyObject objectValue](self->_lazyAppPrivateData, "objectValue");
}

- (PLCacheMetricsCollectorClient)cacheMetricsCollector
{
  return (PLCacheMetricsCollectorClient *)-[PLLazyObject objectValue](self->_lazyCacheMetricsCollectorClient, "objectValue");
}

- (id)_initializeAppPrivateData
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D719A8];
  -[PHPhotoLibrary photoLibraryBundle](self, "photoLibraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "shouldTryFastPathWithLibraryBundle:", v5) & 1) == 0)
  {
    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return -[PHPhotoLibraryAppPrivateData initWithLibrary:]([PHPhotoLibraryAppPrivateData alloc], "initWithLibrary:", self);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 731, CFSTR("Library open required to be called before creating AppPrivateData"));
  }

  return -[PHPhotoLibraryAppPrivateData initWithLibrary:]([PHPhotoLibraryAppPrivateData alloc], "initWithLibrary:", self);
}

- (id)_initializePhotoLibraryIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  PHPhotoLibraryIdentifier *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  PHPhotoLibrary *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryManagementClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "photoLibraryIdentifierForPhotoLibraryURL:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v6)
  {
    v8 = -[PHPhotoLibraryIdentifier initWithPLLibraryIdentifier:]([PHPhotoLibraryIdentifier alloc], "initWithPLLibraryIdentifier:", v6);
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to retrieve library identifier for %@: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_initializeSearchIndex
{
  return -[PHSearchIndex initWithPhotoLibrary:]([PHSearchIndex alloc], "initWithPhotoLibrary:", self);
}

- (id)searchIndex
{
  return (id)-[PLLazyObject objectValue](self->_lazySearchIndex, "objectValue");
}

- (BOOL)createPhotoLibraryUsingOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "fileExistsAtPath:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB3308];
    -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3107, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v16 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v32);
  v14 = v32;

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v14, "domain");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v24 = objc_msgSend(v14, "code");

      if (v24 != 513)
      {
        v23 = 0;
        goto LABEL_11;
      }
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByDeletingLastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB2AA0]);

      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("You do not have permission to write to the selected folder"), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 5404, v12);
      v28 = objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v14 = (id)v28;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryManagementClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "plLibraryOptionsFromPHOptions:createOptions:", v6, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D72420]);

  v31 = v14;
  objc_msgSend(v18, "createManagedPhotoLibraryWithOptions:error:", v20, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;

  if (!v22)
  {
    v23 = 0;
    v14 = v12;
    goto LABEL_11;
  }
  v30 = v12;
  v23 = -[PHPhotoLibrary _postOpenInitializationWithError:](self, "_postOpenInitializationWithError:", &v30);
  v14 = v30;
LABEL_10:

LABEL_11:
  if (a4 && !v23)
  {
    PHErrorFromPLError(v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)upgradePhotoLibraryUsingOptions:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  dispatch_block_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PLPhotoLibraryBundle *v21;
  PLPhotoLibraryBundle *photoLibraryBundle;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  _QWORD v28[5];
  void (**v29)(id, _QWORD, void *);
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  void *v38;
  uint64_t v39;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  objc_msgSend((id)objc_opt_class(), "plLibraryOptionsFromPHOptions:createOptions:", v7, &v39);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v39 & 4) != 0)
  {
    v14 = atomic_load((unsigned __int8 *)&self->_isCompletedPostOpenInitialization);
    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 1051, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isCompletedPostOpenInitialization == NO"));

    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__18234;
    v37 = __Block_byref_object_dispose__18235;
    v38 = 0;
    v15 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_149);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_2;
    v30[3] = &unk_1E35D9750;
    v32 = &v33;
    v16 = v15;
    v31 = v16;
    objc_msgSend(v10, "upgradePhotoLibraryDatabaseWithOptions:completion:", v11, v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend((id)v34[5], "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D74498]))
    {
      v18 = objc_msgSend((id)v34[5], "code");

      if (v18 == 41020)
      {
        objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPhotoLibraryBundle libraryURL](self->_photoLibraryBundle, "libraryURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "replaceBundleForRebuildAtLibraryURL:", v20);
        v21 = (PLPhotoLibraryBundle *)objc_claimAutoreleasedReturnValue();
        photoLibraryBundle = self->_photoLibraryBundle;
        self->_photoLibraryBundle = v21;

        v23 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39 & 0xFFFFFFFFFFFFFFFBLL);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D72400]);

        -[PHPhotoLibrary upgradePhotoLibraryUsingOptions:completion:](self, "upgradePhotoLibraryUsingOptions:completion:", v23, v8);
        v25 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v25;
LABEL_10:

        _Block_object_dispose(&v33, 8);
        v13 = v38;
        goto LABEL_11;
      }
    }
    else
    {

    }
    PHErrorFromPLError((void *)v34[5]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v23);
    goto LABEL_10;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_3;
  v28[3] = &unk_1E35D9778;
  v28[4] = self;
  v29 = v8;
  objc_msgSend(v10, "upgradePhotoLibraryDatabaseWithOptions:completion:", v11, v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
LABEL_11:

  return v12;
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isOpened"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__PHPhotoLibrary_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke;
    v10[3] = &unk_1E35DF058;
    v11 = v6;
    objc_msgSend(v8, "resetFaceAnalysisWithResetLevel:completionHandler:", a3, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3109, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);

  }
}

- (BOOL)requestSandboxExtensionsIfNeededWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:error:", 0, &v9);
  v7 = v9;

  if ((v6 & 1) == 0 && a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (void)close
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3158, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary closeWithReason:](self, "closeWithReason:", v3);

}

- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3
{
  return -[PHPhotoLibrary initWithPLPhotoLibrary:type:](self, "initWithPLPhotoLibrary:type:", a3, 0);
}

- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  PHPhotoLibrary *v9;
  uint64_t v10;
  PLLazyObject *lazyPhotoLibrary;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHPhotoLibrary initWithPhotoLibraryURL:type:](self, "initWithPhotoLibraryURL:type:", v8, v4);

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D73248]), "initWithObject:", v6);
    lazyPhotoLibrary = v9->_lazyPhotoLibrary;
    v9->_lazyPhotoLibrary = (PLLazyObject *)v10;

  }
  return v9;
}

- (void)_invalidateEverythingWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  PHPhotoLibrary *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412802;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "%@ %p _invalidateEverythingWithReason:%@", (uint8_t *)&v8, 0x20u);
  }

  -[PHPhotoLibrary _stopWatchingForLibraryAvailability](self, "_stopWatchingForLibraryAvailability");
  -[PLLazyObject invalidate](self->_lazyAppPrivateData, "invalidate");
  -[PLLazyObject invalidate](self->_lazyCacheMetricsCollectorClient, "invalidate");
  -[PLLazyObject invalidate](self->_lazyPhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyMainQueueConcurrencyPhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyMainQueuePhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyBackgroundQueuePhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyUserInitiatedQueuePhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyBackgroundQueueObjectFetchingPhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyGraphObjectFetchingPhotoLibrary, "invalidate");
  -[PLLazyObject invalidate](self->_lazyChangeHandlingPhotoLibrary, "invalidate");
  -[PLLazyObject invalidateWithHandler:](self->_lazyCPLStatus, "invalidateWithHandler:", &__block_literal_global_185);
  -[PLLazyObject invalidate](self->_lazyIsReadyForAnalysis, "invalidate");
  -[PLLazyObject invalidate](self->_lazyIsReadyForAnalysisQuickCheck, "invalidate");
  -[PLLazyObject invalidate](self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted, "invalidate");
  -[PLLazyObject invalidate](self->_lazyMainScopeIdentifier, "invalidate");
  -[PLLazyObject invalidate](self->_lazySearchIndex, "invalidate");
  PLPhotosObjectLifecycleGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_opt_class();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "%@ %p finished _invalidateEverythingWithReason:%@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  PLPhotoLibraryBundle *photoLibraryBundle;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  PHPhotoLibrary *v11;
  __int16 v12;
  PLPhotoLibraryBundle *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    photoLibraryBundle = self->_photoLibraryBundle;
    *(_DWORD *)buf = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = photoLibraryBundle;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41024, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary closeWithReason:](self, "closeWithReason:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)PHPhotoLibrary;
  -[PHPhotoLibrary dealloc](&v7, sel_dealloc);
}

- (id)_initializeCPLStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[PHPhotoLibrary isCPLSyncablePhotoLibrary](self, "isCPLSyncablePhotoLibrary"))
    return 0;
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CPLStatusFromPathManager();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDelegate:", self);
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PHPhotoLibrary debugDescription](self, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unable to create PLPhotoLibrary instance for newCPLStatusWithPhotoLibrary: %@", (uint8_t *)&v10, 0xCu);

    }
    v6 = 0;
  }

  return v6;
}

- (id)_deriveMainScopeIdentifierFromCPLSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PLCPLSettingsObserver settings](self->_cplSettingsObserver, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deriveMainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)mainScopeIdentifier
{
  return (NSString *)-[PLLazyObject objectValue](self->_lazyMainScopeIdentifier, "objectValue");
}

- (void)statusDidChange:(id)a3
{
  id v4;
  void *v5;
  PHPhotoLibraryCloudStatus *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!self->_wellKnownPhotoLibraryIdentifier)
  {
    -[PHPhotoLibrary _cachedCloudStatus](self, "_cachedCloudStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PHPhotoLibraryCloudStatus initWithCPLStatus:]([PHPhotoLibraryCloudStatus alloc], "initWithCPLStatus:", v4);
    if (!-[PHPhotoLibraryCloudStatus isEqual:](v6, "isEqual:", v5))
    {
      -[PHPhotoLibrary _setCachedCloudStatus:](self, "_setCachedCloudStatus:", v6);
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __34__PHPhotoLibrary_statusDidChange___block_invoke;
      v7[3] = &unk_1E35DE1F8;
      objc_copyWeak(&v8, &location);
      -[PHPhotoLibrary _publishChangeToObserversIfAuthorized:](self, "_publishChangeToObserversIfAuthorized:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

  }
}

- (id)_initializeIsReadyForAnalysis
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudInternalClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyForAnalysis");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_initializeIsReadyForAnalysisQuickCheck
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudInternalClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyForAnalysisQuickCheck");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_initializeIsReadyForAnalysisCPLInitialDownloadCompleted
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudInternalClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyForAnalysisCPLInitialDownloadCompleted");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_resetCachedValues
{
  -[PLLazyObject resetObject](self->_lazyIsReadyForAnalysis, "resetObject");
  -[PLLazyObject resetObject](self->_lazyIsReadyForAnalysisQuickCheck, "resetObject");
  -[PLLazyObject resetObject](self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted, "resetObject");
  -[PLLazyObject resetObjectWithHandler:](self->_lazyCPLStatus, "resetObjectWithHandler:", &__block_literal_global_188);
}

- (void)accountDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v6)
    -[PHPhotoLibrary _resetCachedValues](self, "_resetCachedValues");
}

- (NSString)databaseUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (PLPhotoKitVariationCache)variationCache
{
  return (PLPhotoKitVariationCache *)-[PLPhotoLibraryBundle variationCache](self->_photoLibraryBundle, "variationCache");
}

- (id)pl_photoLibraryForCMM
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PHPhotoLibrary sharedLazyPhotoLibraryForCMM](PHPhotoLibrary, "sharedLazyPhotoLibraryForCMM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[PHPhotoLibrary debugDescription](self, "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "Unable to create CMM PLPhotoLibrary for PHPhotoLibrary: %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return v4;
}

- (id)managedObjectContext
{
  void *v2;
  void *v3;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLPhotoAnalysisServiceClient)photoAnalysisClient
{
  return (PLPhotoAnalysisServiceClient *)-[PLPhotoLibraryBundle photoAnalysisServiceClient](self->_photoLibraryBundle, "photoAnalysisServiceClient");
}

- (PLPhotoLibrary)mainQueueConcurrencyPhotoLibrary
{
  return (PLPhotoLibrary *)-[PLLazyObject objectValue](self->_lazyMainQueueConcurrencyPhotoLibrary, "objectValue");
}

- (PLPhotoLibrary)backgroundQueuePhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyBackgroundQueuePhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (PLPhotoLibrary)backgroundQueueObjectFetchingPhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyBackgroundQueueObjectFetchingPhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (PLPhotoLibrary)graphObjectFetchingPhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyGraphObjectFetchingPhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (PLPhotoLibrary)changeHandlingPhotoLibrary
{
  if (-[PHPhotoLibrary isPHPhotoLibraryForCMM](self, "isPHPhotoLibraryForCMM"))
    -[PHPhotoLibrary pl_photoLibraryForCMM](self, "pl_photoLibraryForCMM");
  else
    -[PLLazyObject objectValue](self->_lazyChangeHandlingPhotoLibrary, "objectValue");
  return (PLPhotoLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)unregisterFetchResult:(id)a3
{
  -[PHPhotoLibraryObserverRegistrar unregisterFetchResult:](self->_observerRegistrar, "unregisterFetchResult:", a3);
}

- (unint64_t)countOfFetchResultsRegisteredForChangeNotifications
{
  return -[PHPhotoLibraryObserverRegistrar countOfRegisteredFetchResults](self->_observerRegistrar, "countOfRegisteredFetchResults");
}

- (void)registerAvailabilityObserver:(id)observer
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = observer;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHPhotoLibrary_registerAvailabilityObserver___block_invoke;
  block[3] = &unk_1E35DF9E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)unregisterAvailabilityObserver:(id)observer
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = observer;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PHPhotoLibrary_unregisterAvailabilityObserver___block_invoke;
  block[3] = &unk_1E35DF9E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)_startWatchingForLibraryAvailability
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PHPhotoLibrary _startWatchingFileSystemVolumeForLibraryAvailability](self, "_startWatchingFileSystemVolumeForLibraryAvailability");
  -[PHPhotoLibrary _startObservingServiceConnectionInvalidated](self, "_startObservingServiceConnectionInvalidated");
  objc_initWeak(&location, self);
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PHPhotoLibrary__startWatchingForLibraryAvailability__block_invoke;
  v5[3] = &unk_1E35D9828;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "addPhotoLibraryUnavailabilityHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_handleLibraryBecameUnavailable:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    PHErrorFromPLError(v7);
    v12 = objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary _notifyAvailabilityObserversWithReason:](self, "_notifyAvailabilityObserversWithReason:", v12);
  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "unavailable library %@ does not match mine %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)_stopWatchingForLibraryAvailability
{
  -[PHPhotoLibrary _stopObservingServiceConnectionInvalidated](self, "_stopObservingServiceConnectionInvalidated");
  -[PHPhotoLibrary _stopWatchingFileSystemVolumeForLibraryAvailability](self, "_stopWatchingFileSystemVolumeForLibraryAvailability");
}

- (void)_startWatchingFileSystemVolumeForLibraryAvailability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  PHPhotoLibrary *v10;
  _QWORD v11[5];
  NSObject *v12;
  uint8_t buf[4];
  PHPhotoLibrary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_libraryFileSystemVolume)
  {
    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D71750], "sharedFileSystemVolumeManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "volumeForURL:context:", v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __70__PHPhotoLibrary__startWatchingFileSystemVolumeForLibraryAvailability__block_invoke;
        v11[3] = &unk_1E35DF9E8;
        v11[4] = self;
        v8 = v7;
        v12 = v8;
        objc_msgSend(v4, "performBlockAndWait:", v11);

      }
      else
      {
        PLPhotoKitGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
          v10 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v14 = v10;
          _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "No file system volume for URL %@", buf, 0xCu);

        }
        v8 = 0;
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "No managed object context for %@", buf, 0xCu);
      }
    }

  }
}

- (void)_stopWatchingFileSystemVolumeForLibraryAvailability
{
  PLFileSystemVolume *libraryFileSystemVolume;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  PLFileSystemVolume *v9;
  PLFileSystemVolume *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  libraryFileSystemVolume = self->_libraryFileSystemVolume;
  if (libraryFileSystemVolume)
  {
    -[PLFileSystemVolume managedObjectContext](libraryFileSystemVolume, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_6;
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Watched filesystem volume's MOC is nil.", buf, 2u);
    }

    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_6:
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "MOC for the watched file system volume is available", buf, 2u);
      }

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __69__PHPhotoLibrary__stopWatchingFileSystemVolumeForLibraryAvailability__block_invoke;
      v11[3] = &unk_1E35DF110;
      v11[4] = self;
      objc_msgSend(v4, "performBlockAndWait:", v11);
    }
    else
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "No MOC for the watched file system volume", buf, 2u);
      }

      v9 = self->_libraryFileSystemVolume;
      self->_libraryFileSystemVolume = 0;
      v10 = v9;

      NSStringFromSelector(sel_isOffline);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLFileSystemVolume removeObserver:forKeyPath:context:](v10, "removeObserver:forKeyPath:context:", self, v4, "PHPhotoLibraryFileSystemVolumeKVOContext");

    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  PLFileSystemVolume *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  PLFileSystemVolume *libraryFileSystemVolume;
  int v19;
  PLFileSystemVolume *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (PLFileSystemVolume *)a4;
  v12 = a5;
  if (a6 == "PHPhotoLibraryFileSystemVolumeKVOContext" && self->_libraryFileSystemVolume == v11)
  {
    if (-[PLFileSystemVolume faultingState](v11, "faultingState"))
    {
      PLPhotoKitGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v14 = "Ignoring isOffline state change for _libraryFileSystemVolume due to faultingState";
        v15 = v13;
        v16 = OS_LOG_TYPE_DEBUG;
        v17 = 2;
LABEL_9:
        _os_log_impl(&dword_1991EC000, v15, v16, v14, (uint8_t *)&v19, v17);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if (-[PLFileSystemVolume isOffline](self->_libraryFileSystemVolume, "isOffline"))
    {
      PLPhotoKitGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        libraryFileSystemVolume = self->_libraryFileSystemVolume;
        v19 = 134217984;
        v20 = libraryFileSystemVolume;
        v14 = "Unexpected: _libraryFileSystemVolume %p is offline";
        v15 = v13;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 12;
        goto LABEL_9;
      }
LABEL_10:

    }
  }

}

- (void)_startObservingServiceConnectionInvalidated
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleServiceConnectionClosed_, *MEMORY[0x1E0D73420], 0);

}

- (void)_stopObservingServiceConnectionInvalidated
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D73420], 0);

}

- (void)_handleServiceConnectionClosed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8[0] = *MEMORY[0x1E0CB3308];
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0CB2D68];
  v9[0] = v5;
  v9[1] = CFSTR("Connection to photos service has been invalidated");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3133, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary _notifyAvailabilityObserversWithReason:](self, "_notifyAvailabilityObserversWithReason:", v7);
}

- (BOOL)_setUnavailabilityReason:(id)a3
{
  id v5;
  PHPhotoLibrary *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 1697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = self;
  objc_sync_enter(v6);
  -[PHPhotoLibrary unavailabilityReason](v6, "unavailabilityReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "code");
    objc_msgSend(v5, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary setUnavailabilityReason:](v6, "setUnavailabilityReason:", v12);

  }
  objc_sync_exit(v6);

  return v7 == 0;
}

- (void)_notifyAvailabilityObserversWithReason:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *isolationQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PHPhotoLibrary _setUnavailabilityReason:](self, "_setUnavailabilityReason:", v4);
  PLPhotoKitGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PHPhotoLibrary unavailabilityReason](self, "unavailabilityReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Photo Library became unavailable because: %@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    isolationQueue = self->_isolationQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PHPhotoLibrary__notifyAvailabilityObserversWithReason___block_invoke;
    v10[3] = &unk_1E35D9850;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v4;
    dispatch_async(isolationQueue, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Ignoring additional unavailability reason received: %@", buf, 0xCu);
    }

  }
}

- (void)_onQueueNotifyAvailabilityObserversWithReason:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  PHPhotoLibrary *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PHPhotoLibrary availabilityObservers](self, "availabilityObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x19AEBEADC]();
        PLPhotosObjectLifecycleGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v21 = v12;
          v22 = 2048;
          v23 = self;
          v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "%@ %p notifying availability observer %@", buf, 0x20u);
        }

        objc_msgSend(v9, "photoLibraryDidBecomeUnavailable:", self);
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v6);
  }

  -[PHPhotoLibrary _invalidateEverythingWithReason:](self, "_invalidateEverythingWithReason:", v15);
  if (!+[PHPhotoLibrary isMultiLibraryModeEnabled](PHPhotoLibrary, "isMultiLibraryModeEnabled"))
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PHPhotoLibrary unavailabilityReason](self, "unavailabilityReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v14;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "Terminating single library mode PhotoKit client with reason: %@", buf, 0xCu);

    }
    exit(1);
  }

}

- (void)appPrivateDataWriteFailedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary _handleLibraryBecameUnavailable:reason:](self, "_handleLibraryBecameUnavailable:reason:", v5, v4);

}

- (void)unregisterChangeObserver:(id)observer
{
  if (observer)
    -[PHPhotoLibrary _removeObserver:](self, "_removeObserver:");
}

- (void)_removeObserver:(id)a3
{
  -[PHPhotoLibraryObserverRegistrar removeObserver:](self->_observerRegistrar, "removeObserver:", a3);
}

- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3
{
  -[PHPhotoLibraryObserverRegistrar setPostsPersistentHistoryChangedNotifications:](self->_observerRegistrar, "setPostsPersistentHistoryChangedNotifications:", a3);
}

- (BOOL)postsPersistentHistoryChangedNotifications
{
  return -[PHPhotoLibraryObserverRegistrar postsPersistentHistoryChangedNotifications](self->_observerRegistrar, "postsPersistentHistoryChangedNotifications");
}

- (void)_beginTransaction
{
  void *v4;

  if (-[PHPerformChangesRequest hasChangeRequests](self->_performChangesRequest, "hasChangeRequests"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 1797, CFSTR("Transaction is not clean"));

  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_transactionQueue, "PHPhotoLibrary_transactionPhotoLibrary", self, 0);
}

- (void)_commitTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  id v29;
  int64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 1803, CFSTR("cannot commit PhotoKit transactions from assetsd"));

  }
  -[PHPhotoLibrary _popChangesRequest](self, "_popChangesRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInstrumentation:", v10);
  v13 = v12;
  if (v10)
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "#####  Commit transaction:", buf, 2u);
    }

    objc_msgSend(v13, "inserts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      PLPhotoKitGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "inserts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "##### inserts: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v13, "updates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      PLPhotoKitGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "updates");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v22;
        _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEBUG, "##### updates: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v13, "deletes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      PLPhotoKitGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "deletes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "##### deletes: %@", buf, 0xCu);

      }
    }
  }

  v27 = objc_msgSend(v13, "hasChangeRequests");
  if (!v27)
  {
    v29 = 0;
LABEL_23:
    objc_msgSend(v9, "callTransactionCompletionHandler:withSuccess:error:", v11, v27 ^ 1u, v29);
    goto LABEL_24;
  }
  v36 = 0;
  v28 = -[PHPhotoLibrary _preflightRequest:withError:](self, "_preflightRequest:withError:", v13, &v36);
  v29 = v36;
  if (!v28)
  {
    -[PHPhotoLibrary _lazyPhotoLibrary](self, "_lazyPhotoLibrary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notifyChangesTransactionFailedWithLazyPhotoLibrary:error:", v31, v29);

    goto LABEL_23;
  }
  v30 = -[PHPhotoLibrary _initialRetryCountForChangesRequest:](self, "_initialRetryCountForChangesRequest:", v13);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __93__PHPhotoLibrary__commitTransactionOnExecutionContext_withInstrumentation_completionHandler___block_invoke;
  v33[3] = &unk_1E35D9878;
  v33[4] = self;
  v34 = v13;
  v35 = v11;
  -[PHPhotoLibrary _sendChangesRequest:onExecutionContext:withInstrumentation:remainingRetryCount:reply:](self, "_sendChangesRequest:onExecutionContext:withInstrumentation:remainingRetryCount:reply:", v34, v9, v10, v30, v33);

LABEL_24:
}

- (id)_popChangesRequest
{
  PHPerformChangesRequest *v3;
  PHPerformChangesRequest *v4;
  PHPerformChangesRequest *performChangesRequest;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  v3 = self->_performChangesRequest;
  v4 = objc_alloc_init(PHPerformChangesRequest);
  performChangesRequest = self->_performChangesRequest;
  self->_performChangesRequest = v4;

  return v3;
}

- (int64_t)_initialRetryCountForChangesRequest:(id)a3
{
  int64_t result;

  result = 0;
  if (objc_msgSend(a3, "accessLevel") == 1)
  {
    pl_dispatch_once();
    if ((PLIsScreenShotOrScreenRecordingClient_sIsScreenShotOrScreenRecordingClient & 1) != 0)
      return 1;
  }
  return result;
}

- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 remainingRetryCount:(int64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke;
  v20[3] = &unk_1E35D98C8;
  v20[4] = self;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = a6;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  -[PHPhotoLibrary _sendChangesRequest:onExecutionContext:withInstrumentation:reply:](self, "_sendChangesRequest:onExecutionContext:withInstrumentation:reply:", v19, v18, v17, v20);

}

- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 reply:(id)a6
{
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_msgSend(v10, "accessLevel");
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == 1)
    objc_msgSend(v15, "photoKitAddClient");
  else
    objc_msgSend(v15, "photoKitClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "clientName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  v20 = v18;
  if (v11)
  {
    PLPhotoKitGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v11[2] = os_signpost_id_generate(v21);
    v22 = v21;
    v23 = v22;
    v24 = v11[2];
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = v11[5];
      qos_class_self();
      PLStringFromQoSClass();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v25;
      v39 = 2114;
      v40 = v26;
      v41 = 2114;
      v42 = v20;
      v43 = 2114;
      v44 = v19;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PhotoKit request [client]", "PhotoKit changes: [%{public}@] Request sent at %{public}@ on %{public}@, %{public}@", buf, 0x2Au);

    }
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v11[5];
      qos_class_self();
      PLStringFromQoSClass();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v28;
      v39 = 2114;
      v40 = v29;
      v41 = 2114;
      v42 = v20;
      v43 = 2114;
      v44 = v19;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request sent at %{public}@ on %{public}@, %{public}@", buf, 0x2Au);

    }
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __83__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_reply___block_invoke;
  v33[3] = &unk_1E35D9878;
  v34 = v11;
  v35 = v19;
  v36 = v12;
  v30 = v12;
  v31 = v19;
  v32 = v11;
  objc_msgSend(v13, "sendChangesRequest:onClient:reply:", v31, v17, v33);

}

- (void)_endTransaction
{
  void *v4;

  if (-[PHPerformChangesRequest hasChangeRequests](self->_performChangesRequest, "hasChangeRequests"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 1917, CFSTR("Transaction is not clean"));

  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_transactionQueue, "PHPhotoLibrary_transactionPhotoLibrary", 0, 0);
}

- (void)_cancelTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5
{
  NSObject *transactionQueue;
  id v9;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  transactionQueue = self->_transactionQueue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(transactionQueue);
  -[PHPhotoLibrary _popChangesRequest](self, "_popChangesRequest");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)v10[5];
      qos_class_self();
      PLStringFromQoSClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v13;
      v32 = 2114;
      v33 = v14;
      v34 = 2114;
      v35 = v29;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request cancelled at %{public}@, %{public}@", buf, 0x20u);

    }
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "#####  Cancel transaction:", buf, 2u);
    }

    objc_msgSend(v29, "inserts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      PLPhotoKitGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v29, "inserts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v19;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "##### cancelled inserts: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v29, "updates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      PLPhotoKitGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v29, "updates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v23;
        _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEBUG, "##### cancelled updates: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v29, "deletes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      PLPhotoKitGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v29, "deletes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "##### cancelled deletes: %@", buf, 0xCu);

      }
    }
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callTransactionCompletionHandler:withSuccess:error:", v9, 0, v28);

}

- (void)_denyTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 authorizationStatus:(int64_t)a5 accessLevel:(int64_t)a6 completionHandler:(id)a7
{
  PHPhotoLibrary *v11;
  NSObject *transactionQueue;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  id v22;
  int64_t v23;
  void *v24;
  int64_t v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  PHPhotoLibrary *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v11 = self;
  v55 = *MEMORY[0x1E0C80C00];
  transactionQueue = self->_transactionQueue;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  dispatch_assert_queue_V2(transactionQueue);
  -[PHPhotoLibrary _popChangesRequest](v11, "_popChangesRequest");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v44 = v16;
  if (v14)
  {
    v17 = objc_msgSend(v16, "accessScopeOptionsRequiredForRequestedChanges");
    v18 = CFSTR("read/write");
    if (v17 == 1)
      v18 = CFSTR("add-only");
    v19 = v18;
    PLPhotoKitGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v11;
      v21 = v15;
      v22 = v13;
      v23 = a6;
      v24 = (void *)v14[5];
      v25 = a5;
      if ((unint64_t)(a5 - 1) > 3)
        v26 = CFSTR("not determined");
      else
        v26 = off_1E35D9C10[a5 - 1];
      v27 = v26;
      qos_class_self();
      PLStringFromQoSClass();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v24;
      v47 = 2114;
      v48 = v27;
      v49 = 2114;
      v50 = v19;
      v51 = 2114;
      v52 = v28;
      v53 = 2114;
      v54 = v44;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request denied with authorization status %{public}@ for access scope %{public}@ at %{public}@, %{public}@", buf, 0x34u);

      a6 = v23;
      a5 = v25;
      v13 = v22;
      v15 = v21;
      v11 = v43;
    }

    PLPhotoKitGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEBUG, "#####  Deny transaction:", buf, 2u);
    }

    objc_msgSend(v44, "inserts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      PLPhotoKitGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v44, "inserts");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v33;
        _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEBUG, "##### denied inserts: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v44, "updates", v43);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      PLPhotoKitGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v44, "updates");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v37;
        _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "##### denied updates: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v44, "deletes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39)
    {
      PLPhotoKitGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v44, "deletes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v41;
        _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_DEBUG, "##### denied deletes: %@", buf, 0xCu);

      }
    }

    v16 = v44;
  }

  -[PHPhotoLibrary _errorForAuthorizationStatus:accessLevel:](v11, "_errorForAuthorizationStatus:accessLevel:", a5, a6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "callTransactionCompletionHandler:withSuccess:error:", v13, 0, v42);

}

- (id)_errorForAuthorizationStatus:(int64_t)a3 accessLevel:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  +[PHPhotoLibrary requestAuthorizationForAccessLevel:handler:](PHPhotoLibrary, "requestAuthorizationForAccessLevel:handler:", a4, &__block_literal_global_207);
  switch(a3)
  {
    case 0:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = 5102;
      goto LABEL_5;
    case 1:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = 3310;
      goto LABEL_5;
    case 2:
    case 4:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = 3311;
LABEL_5:
      objc_msgSend(v5, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Photos Access denied (authorization status %ld)"), a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v7;
}

- (BOOL)_preflightRequest:(id)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  char v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = a3;
  objc_msgSend(v22, "requestSets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v34;
    v9 = 1;
    v23 = *(_QWORD *)v34;
    while (1)
    {
      v10 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        if (!v9)
        {
          v9 = 0;
          goto LABEL_27;
        }
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (!v13)
        {
          v9 = 1;
          goto LABEL_26;
        }
        v14 = v13;
        v15 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v28 = v7;
            v18 = objc_msgSend(v17, "prepareForServicePreflightCheck:", &v28);
            v19 = v28;

            if ((v18 & 1) == 0)
            {
              if (!a4)
              {
                v9 = 0;
                v7 = v19;
LABEL_25:
                v8 = v23;
                v6 = v24;
                goto LABEL_26;
              }
LABEL_23:
              v8 = v23;
              v6 = v24;
              v7 = objc_retainAutorelease(v19);
              v9 = 0;
              *a4 = v7;
              goto LABEL_26;
            }
            v27 = v19;
            v20 = objc_msgSend(v17, "prepareForPhotoLibraryCheck:error:", self, &v27);
            v7 = v27;

            if ((v20 & 1) == 0)
            {
              if (!a4)
              {
                v9 = 0;
                goto LABEL_25;
              }
              v19 = v7;
              goto LABEL_23;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          v9 = 1;
          v8 = v23;
          v6 = v24;
          if (v14)
            continue;
          break;
        }
LABEL_26:

LABEL_27:
        ++v10;
      }
      while (v10 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (!v6)
        goto LABEL_31;
    }
  }
  v7 = 0;
  v9 = 1;
LABEL_31:

  return v9;
}

- (void)performCancellableChanges:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performCancellableChanges:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:completionHandler:]((uint64_t)self, v7, v8, v6);

}

- (BOOL)performCancellableChangesAndWait:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performCancellableChangesAndWait:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PHPhotoLibrary _performCancellableChangesAndWait:withInstrumentation:error:]((uint64_t)self, v6, v7, (uint64_t)a4);

  return (char)a4;
}

- (void)performChanges:(dispatch_block_t)changeBlock completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;

  v6 = changeBlock;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PHPhotoLibrary_performChanges_completionHandler___block_invoke;
  aBlock[3] = &unk_1E35D98F0;
  v12 = v6;
  v7 = v6;
  v8 = completionHandler;
  v9 = _Block_copy(aBlock);
  +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performChanges:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:completionHandler:]((uint64_t)self, v9, v10, v8);

}

- (BOOL)performChangesAndWait:(dispatch_block_t)changeBlock error:(NSError *)error
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v6 = changeBlock;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PHPhotoLibrary_performChangesAndWait_error___block_invoke;
  aBlock[3] = &unk_1E35D98F0;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performChangesAndWait:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = -[PHPhotoLibrary _performCancellableChangesAndWait:withInstrumentation:error:]((uint64_t)self, v8, v9, (uint64_t)error);

  return (char)error;
}

- (void)assertTransaction
{
  PHPhotoLibrary *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  PHPhotoLibrary *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
    v2 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      if (v2 == self)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);

        return;
      }
      v10 = v2;
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[PHPhotoLibrary debugDescription](self, "debugDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHPhotoLibrary debugDescription](v10, "debugDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Wrong instance: (%@) used during perform transaction for (%@)", buf, 0x16u);

      }
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99768];
      v5 = CFSTR("Using wrong PHPhotoLibrary instance in perform transaction");
    }
    else
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99768];
      v5 = CFSTR("This method can only be called from inside of -[PHPhotoLibrary performChanges:completionHandler:] or -[PHPhotoLibrary performChangesAndWait:error:]");
    }
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "stringFromPHPhotoLibraryType:", -[PHPhotoLibrary type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> type:%@ path:%@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)recordInsertRequest:(id)a3
{
  id v5;
  void *v6;
  id *v7;

  v5 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2121, CFSTR("cannot be run from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[39], "recordInsertRequest:", v5);

}

- (void)recordUpdateRequest:(id)a3
{
  id v5;
  void *v6;
  id *v7;

  v5 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2128, CFSTR("cannot be run from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[39], "recordUpdateRequest:", v5);

}

- (void)recordDeleteRequest:(id)a3
{
  id v5;
  void *v6;
  id *v7;

  v5 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2135, CFSTR("cannot be run from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[39], "recordDeleteRequest:", v5);

}

- (void)recordOtherChangeRequest:(id)a3
{
  id v5;
  void *v6;
  id *v7;

  v5 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2142, CFSTR("cannot be run from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7[39], "recordOtherChangeRequest:", v5);

}

- (id)changeRequestForUUID:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2148, CFSTR("uuid is a required argument"));

  }
  -[PHPhotoLibrary assertTransaction](self, "assertTransaction");
  -[PHPerformChangesRequest changeRequestForUUID:](self->_performChangesRequest, "changeRequestForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setChangeRequest:(id)a3 forUUID:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v11 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2155, CFSTR("cannot be run from assetsd"));

    if (v7)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2156, CFSTR("uuid is a required argument"));

LABEL_3:
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2157, CFSTR("changeRequest is a required argument"));

  }
  -[PHPhotoLibrary assertTransaction](self, "assertTransaction");
  -[PHPerformChangesRequest setChangeRequest:forUUID:](self->_performChangesRequest, "setChangeRequest:forUUID:", v11, v7);

}

- (BOOL)_openApplicationOwnedFoldersIfNecessary
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PHPhotoLibrary__openApplicationOwnedFoldersIfNecessary__block_invoke;
  v5[3] = &unk_1E35DF920;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isApplicationOwnedFolderWithApplicationDataFolderIdentifier:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x403Eu >> a3);
}

- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3
{
  return -[PHPhotoLibrary urlForApplicationDataFolderIdentifier:error:](self, "urlForApplicationDataFolderIdentifier:error:", a3, 0);
}

- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("pathManager is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[PHPhotoLibrary urlForApplicationDataFolderIdentifier:error:]";
      v18 = 2112;
      v19 = (int64_t)v9;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "%{public}s: Failed to access path manager for application folder identifier. Error: %@", buf, 0x16u);
    }

    if (!a4)
      goto LABEL_8;
    goto LABEL_12;
  }
  if (-[PHPhotoLibrary _isApplicationOwnedFolderWithApplicationDataFolderIdentifier:](self, "_isApplicationOwnedFolderWithApplicationDataFolderIdentifier:", a3))
  {
    -[PHPhotoLibrary _openApplicationOwnedFoldersIfNecessary](self, "_openApplicationOwnedFoldersIfNecessary");
  }
  v15 = 0;
  -[PHPhotoLibrary _urlForApplicationDataFolderIdentifier:pathManager:error:](self, "_urlForApplicationDataFolderIdentifier:pathManager:error:", a3, v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v8)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "-[PHPhotoLibrary urlForApplicationDataFolderIdentifier:error:]";
      v18 = 2048;
      v19 = a3;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create directories for application folder identifier %td. Error: %@", buf, 0x20u);
    }

    if (!a4)
    {
LABEL_8:
      v8 = 0;
      goto LABEL_13;
    }
LABEL_12:
    v9 = objc_retainAutorelease(v9);
    v8 = 0;
    *a4 = v9;
  }
LABEL_13:

  return v8;
}

- (id)_urlForApplicationDataFolderIdentifier:(int64_t)a3 pathManager:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 2237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  switch(a3)
  {
    case 1:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v33 = 0;
      objc_msgSend(v9, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 4, 1, &v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;
      goto LABEL_20;
    case 2:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v32 = 0;
      objc_msgSend(v9, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 5, 1, &v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v32;
      goto LABEL_20;
    case 3:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v31 = 0;
      objc_msgSend(v9, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 6, 1, &v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v31;
      goto LABEL_20;
    case 4:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v30 = 0;
      objc_msgSend(v9, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 7, 1, &v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v30;
      goto LABEL_20;
    case 5:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v29 = 0;
      objc_msgSend(v9, "privateDirectoryWithSubType:createIfNeeded:error:", 0, 1, &v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v29;
      goto LABEL_20;
    case 6:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v28 = 0;
      objc_msgSend(v9, "photoDirectoryWithType:createIfNeeded:error:", 16, 1, &v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;
      goto LABEL_20;
    case 7:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v27 = 0;
      objc_msgSend(v9, "photoDirectoryWithType:createIfNeeded:error:", 15, 1, &v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v27;
      goto LABEL_20;
    case 8:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v26 = 0;
      objc_msgSend(v9, "photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:", 33, 1, CFSTR("ExternalEditSessions"), 1, &v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v26;
      goto LABEL_20;
    case 9:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v25 = 0;
      objc_msgSend(v9, "photoDirectoryWithType:createIfNeeded:error:", 17, 1, &v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v25;
      goto LABEL_20;
    case 10:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v24 = 0;
      objc_msgSend(v9, "photoDirectoryWithType:createIfNeeded:error:", 20, 1, &v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;
      goto LABEL_20;
    case 11:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v23 = 0;
      objc_msgSend(v9, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 3, 0, 1, &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;
      goto LABEL_20;
    case 12:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v22 = 0;
      objc_msgSend(v9, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 4, 0, 1, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
      goto LABEL_20;
    case 13:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v21 = 0;
      objc_msgSend(v9, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 1, &v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      goto LABEL_20;
    case 14:
      v10 = (void *)MEMORY[0x1E0C99E98];
      v20 = 0;
      objc_msgSend(v9, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 16, 1, &v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
LABEL_20:
      v15 = v12;
      goto LABEL_21;
    default:
      v34 = 0;
      v13 = objc_msgSend(v9, "validateCreationRequestWithError:", &v34);
      v14 = v34;
      v15 = v14;
      if (v13)
      {
        v10 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v9, "photoDirectoryWithType:", 28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_22;
LABEL_26:
        v17 = v16;
        goto LABEL_27;
      }
      v16 = 0;
      if (!v14)
        goto LABEL_26;
LABEL_22:
      v17 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
LABEL_27:

      return v17;
  }
}

- (id)queryForType:(id)a3 withIdentifiers:(id)a4 local:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v16, "length") >= 0x25)
        {
          objc_msgSend(v16, "substringToIndex:", 36);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v10, "addObject:", v17);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    if (v5)
      v19 = CFSTR("uuid IN (%@)");
    else
      v19 = CFSTR("cloudAssetGUID IN (%@)");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v8, v20, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)fetchPHObjectsForOIDs:(id)a3
{
  return -[PHPhotoLibrary fetchPHObjectsForOIDs:propertyHint:includeTrash:overrideResultsWithClass:](self, "fetchPHObjectsForOIDs:propertyHint:includeTrash:overrideResultsWithClass:", a3, 2, 1, 0);
}

- (id)_graphBasedPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  PHPhotoLibrary *v20;
  id v21;
  SEL v22;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary graphObjectFetchingPhotoLibrary](self, "graphObjectFetchingPhotoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PHPhotoLibrary__graphBasedPHObjectsForOIDs_propertyHint_includeTrash___block_invoke;
  v17[3] = &unk_1E35D99A8;
  v18 = v10;
  v19 = v7;
  v20 = self;
  v22 = a2;
  v11 = v8;
  v21 = v11;
  v12 = v7;
  v13 = v10;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  v14 = v21;
  v15 = v11;

  return v15;
}

- (id)fetchPropertiesByOID:(id)a3 propertyNamesByEntityName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v6, "count"))
  {
    v25 = v8;
    v26 = v7;
    -[PHPhotoLibrary objectFetchingContextForCurrentQueueQoS](self, "objectFetchingContextForCurrentQueueQoS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "entity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v18, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v19, v17);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__PHPhotoLibrary_fetchPropertiesByOID_propertyNamesByEntityName___block_invoke;
    v27[3] = &unk_1E35DEB10;
    v28 = v9;
    v7 = v26;
    v29 = v26;
    v30 = v24;
    v31 = v10;
    v8 = v25;
    v32 = v25;
    v20 = v24;
    v21 = v9;
    objc_msgSend(v20, "performBlockAndWait:", v27);

  }
  v22 = (void *)objc_msgSend(v8, "copy");

  return v22;
}

- (id)fetchedObjectsForOIDs:(id)a3 propertySetClass:(Class)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[152];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v5 = objc_msgSend(v36, "count");
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
  {
    v34 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v34, "setName:", CFSTR("objectID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setExpression:", v7);

    objc_msgSend(v34, "setExpressionResultType:", 2000);
    v59[0] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class propertiesToFetch](a4, "propertiesToFetch");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v6;
    v32 = v10;

    objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class entityName](a4, "entityName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[objc_class useNoIndexSelf](a4, "useNoIndexSelf"))
      v11 = CFSTR("noindex:(self) IN %@");
    else
      v11 = CFSTR("self IN %@");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v11, v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPredicate:", v12);

    objc_msgSend(v37, "setPropertiesToFetch:", v30);
    objc_msgSend(v37, "setResultType:", 2);
    objc_msgSend(v37, "setAllocationType:", 1);
    -[objc_class propertiesToSortBy](a4, "propertiesToSortBy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v14 = v35;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v54 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i), 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v18);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v15);
      }

      objc_msgSend(v37, "setSortDescriptors:", v13);
    }
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__18234;
    v51 = __Block_byref_object_dispose__18235;
    v52 = 0;
    if (-[objc_class useObjectFetchingContext](a4, "useObjectFetchingContext"))
      -[PHPhotoLibrary objectFetchingContextForCurrentQueueQoS](self, "objectFetchingContextForCurrentQueueQoS");
    else
      -[PHPhotoLibrary managedObjectContextForCurrentQueueQoS](self, "managedObjectContextForCurrentQueueQoS");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __57__PHPhotoLibrary_fetchedObjectsForOIDs_propertySetClass___block_invoke;
    v43[3] = &unk_1E35DEE50;
    v46 = &v47;
    v20 = v19;
    v44 = v20;
    v45 = v37;
    objc_msgSend(v20, "performBlockAndWait:", v43);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = (id)v48[5];
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v25, "valueAtIndex:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)objc_msgSend([a4 alloc], "initWithObjectID:knownKeysDictionary:photoLibrary:", v27, v25, self);
          objc_msgSend(v6, "addObject:", v28);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
      }
      while (v22);
    }

    _Block_object_dispose(&v47, 8);
  }

  return v6;
}

- (id)fetchPHObjectsForUUIDs:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  PHPhotoLibrary *v17;
  id v18;
  objc_class *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PHPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[PHPhotoLibrary PHObjectClassForEntityName:](PHPhotoLibrary, "PHObjectClassForEntityName:", v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PHPhotoLibrary_fetchPHObjectsForUUIDs_entityName___block_invoke;
    v13[3] = &unk_1E35D9A18;
    v14 = v7;
    v15 = v6;
    v16 = v9;
    v19 = v10;
    v17 = self;
    v18 = v8;
    v11 = v9;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
  return v8;
}

- (id)fetchUpdatedObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary fetchPHObjectsForOIDs:](self, "fetchPHObjectsForOIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCustomLibrarySpecificFetchOptions:(id)a3
{
  PHFetchOptions *v4;
  PHFetchOptions *customLibrarySpecificFetchOptions;

  v4 = (PHFetchOptions *)objc_msgSend(a3, "copy");
  customLibrarySpecificFetchOptions = self->_customLibrarySpecificFetchOptions;
  self->_customLibrarySpecificFetchOptions = v4;

}

- (NSManagedObjectID)albumRootFolderObjectID
{
  return (NSManagedObjectID *)-[PLLazyObject objectValue](self->_lazyAlbumRootFolderObjectID, "objectValue");
}

- (NSManagedObjectID)projectAlbumRootFolderObjectID
{
  return (NSManagedObjectID *)-[PLLazyObject objectValue](self->_lazyProjectAlbumRootFolderObjectID, "objectValue");
}

- (void)handleMergeNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location[5];
  id v25;
  PHPhotoLibrary *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  PHPhotoLibrary *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary _notifyPersistentChangeObservers](self, "_notifyPersistentChangeObservers");
  v17 = v4;
  objc_msgSend(v4, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D72EC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(MEMORY[0x1E0D718B0], "changeNotificationObjectIDMutationKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v7)
    {
      v8 = 0;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v21, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v12);
                +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v16);

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
            }
            while (v13);
            v8 = 1;
          }

          objc_msgSend(v20, "setObject:forKey:", v11, v10);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v7);

      if ((v8 & 1) == 0)
        goto LABEL_21;
      location[1] = (id)MEMORY[0x1E0C809B0];
      location[2] = (id)3221225472;
      location[3] = __42__PHPhotoLibrary_handleMergeNotification___block_invoke_2;
      location[4] = &unk_1E35DFAF8;
      v25 = v20;
      v26 = self;
      v27 = v21;
      pl_dispatch_sync();

      obj = v25;
    }

LABEL_21:
    goto LABEL_22;
  }
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __42__PHPhotoLibrary_handleMergeNotification___block_invoke;
  v39 = &unk_1E35DF110;
  v40 = self;
  pl_dispatch_sync();
LABEL_22:
  objc_initWeak(location, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __42__PHPhotoLibrary_handleMergeNotification___block_invoke_3;
  v22[3] = &unk_1E35DE1F8;
  objc_copyWeak(&v23, location);
  -[PHPhotoLibrary _publishChangeToObserversIfAuthorized:](self, "_publishChangeToObserversIfAuthorized:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)_publishChangeToObserversIfAuthorized:(id)a3
{
  PHPhotoLibraryObserverRegistrar *observerRegistrar;
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)(+[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", 2)- 3) <= 1)
  {
    observerRegistrar = self->_observerRegistrar;
    +[PHChange handlerQueue](PHChange, "handlerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibraryObserverRegistrar publishChangesToObserversOnQueue:withBlock:](observerRegistrar, "publishChangesToObserversOnQueue:withBlock:", v5, v6);

  }
}

- (void)_publishCloudStatusChange
{
  PHPhotoLibraryObserverRegistrar *observerRegistrar;
  void *v4;
  uint64_t v5;
  PHChange *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18234;
  v43 = __Block_byref_object_dispose__18235;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__18234;
  v37 = __Block_byref_object_dispose__18235;
  v38 = 0;
  observerRegistrar = self->_observerRegistrar;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __43__PHPhotoLibrary__publishCloudStatusChange__block_invoke;
  v32[3] = &unk_1E35D9AA0;
  v32[4] = &v39;
  v32[5] = &v33;
  -[PHPhotoLibraryObserverRegistrar getObserversWithBlock:](observerRegistrar, "getObserversWithBlock:", v32);
  -[PHPhotoLibrary _cachedCloudStatus](self, "_cachedCloudStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v40[5], "count");
  if (v5 + objc_msgSend((id)v34[5], "count"))
  {
    v6 = -[PHChange initWithCloudStatus:library:]([PHChange alloc], "initWithCloudStatus:library:", v4, self);
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend((id)v40[5], "count");
      v9 = objc_msgSend((id)v34[5], "count");
      -[PHChange _pl_prettyDescription](v6, "_pl_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v48 = v9 + v8;
      v49 = 2112;
      v50 = v10;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Publish cloud status change observer count: %lu, change: %@", buf, 0x16u);

    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = (id)v40[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x19AEBEADC]();
          objc_msgSend(v15, "photoLibraryDidChange:", v6);
          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
      }
      while (v12);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = (id)v34[5];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v45, 16);
    v19 = v18;
    if (v18)
    {
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x19AEBEADC](v18);
          objc_msgSend(v22, "photoLibraryDidChange:", v6, (_QWORD)v24);
          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v45, 16);
        v19 = v18;
      }
      while (v18);
    }

  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)_processPendingChanges
{
  PHPhotoLibraryObserverRegistrar *observerRegistrar;
  uint64_t v4;
  NSObject *isolationQueue;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  PHChange *v43;
  PHChange *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *log;
  uint64_t v55;
  uint64_t v56;
  os_signpost_id_t spid;
  _QWORD v58[4];
  id v59;
  PHPhotoLibrary *v60;
  uint64_t *v61;
  uint64_t *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD block[7];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _QWORD v81[7];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint8_t v100[128];
  uint8_t buf[4];
  PHPhotoLibrary *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  int v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__18234;
  v98 = __Block_byref_object_dispose__18235;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__18234;
  v92 = __Block_byref_object_dispose__18235;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__18234;
  v86 = __Block_byref_object_dispose__18235;
  v87 = 0;
  observerRegistrar = self->_observerRegistrar;
  v4 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke;
  v81[3] = &unk_1E35D9AC8;
  v81[4] = &v94;
  v81[5] = &v88;
  v81[6] = &v82;
  -[PHPhotoLibraryObserverRegistrar getObserversWithBlock:](observerRegistrar, "getObserversWithBlock:", v81);
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__18234;
  v79 = __Block_byref_object_dispose__18235;
  v80 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke_2;
  block[3] = &unk_1E35DF160;
  block[4] = self;
  block[5] = &v75;
  block[6] = &v71;
  dispatch_sync(isolationQueue, block);
  -[PHChangeHandlingDebugger beginProcessPendingChanges](self->_changeHandlingDebugger, "beginProcessPendingChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalObserversCount:", objc_msgSend((id)v95[5], "count"));
  objc_msgSend(v6, "setExternalObserversCount:", objc_msgSend((id)v89[5], "count"));
  objc_msgSend((id)v76[5], "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v55 = *MEMORY[0x1E0C97A18];
  objc_msgSend((id)v76[5], "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend((id)v76[5], "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v56 = objc_msgSend((id)v83[5], "count");
  objc_msgSend((id)v76[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D71E68]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  objc_msgSend((id)v76[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D72EB0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend((id)v76[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D71CF0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v6, "setInsertedCount:", v8);
  objc_msgSend(v6, "setUpdatedCount:", v10);
  objc_msgSend(v6, "setDeletedCount:", v12);
  objc_msgSend(v6, "setUnknownMergeEvent:", *((unsigned __int8 *)v72 + 24));
  objc_msgSend(v6, "setFetchResultCount:", v56);
  objc_msgSend(v6, "setLastTransactionNumber:", v14);
  objc_msgSend(v6, "setTransactionCount:", v16);
  objc_msgSend(v6, "setChangeCount:", v18);
  PLChangeHandlingGetLog();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v19);

  v20 = v19;
  v21 = v20;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v53 = v8;
    log = v21;
    qos_class_self();
    PLShortStringFromQoSClass();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend((id)v95[5], "count");
    v24 = objc_msgSend((id)v89[5], "count");
    if (*((_BYTE *)v72 + 24))
      v25 = 89;
    else
      v25 = 78;
    *(_DWORD *)buf = 134220546;
    v102 = self;
    v103 = 2112;
    v104 = (uint64_t)v22;
    v105 = 2048;
    v106 = v23;
    v107 = 2048;
    v108 = v24;
    v109 = 2048;
    v110 = v53;
    v111 = 2048;
    v112 = v10;
    v113 = 2048;
    v114 = v12;
    v115 = 1024;
    v116 = v25;
    v117 = 2048;
    v118 = v14;
    v119 = 2048;
    v120 = v16;
    v121 = 2048;
    v122 = v18;
    v21 = log;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ProcessPendingChanges", "%p: qos: %@, int: %tu, ext: %tu, ins: %tu, upd: %tu, del: %tu, unk: %c, tx#: %llu, tx cnt: %zd, ch cnt: %zd", buf, 0x6Cu);

  }
  v26 = v21;
  v27 = objc_msgSend((id)v95[5], "count");
  if (v27 + objc_msgSend((id)v89[5], "count") && (objc_msgSend((id)v76[5], "count") || *((_BYTE *)v72 + 24)))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", v53, log);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "BOOLForKey:", CFSTR("com.apple.PHPhotoLibrary.simulateEveryObjectChanged")))
    {
      v31 = *((_BYTE *)v72 + 24) == 0;

      if (!v31)
      {
LABEL_27:
        v43 = [PHChange alloc];
        v44 = -[PHChange initWithChangedIdentifiers:unknownMergeEvent:library:](v43, "initWithChangedIdentifiers:unknownMergeEvent:library:", v76[5], *((unsigned __int8 *)v72 + 24), self);
        PLPhotoKitGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v46 = objc_msgSend((id)v95[5], "count");
          v47 = objc_msgSend((id)v89[5], "count");
          v48 = objc_msgSend((id)v83[5], "count");
          -[PHChange _pl_prettyDescription](v44, "_pl_prettyDescription");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v102 = (PHPhotoLibrary *)(v47 + v46);
          v103 = 2048;
          v104 = v48;
          v105 = 2112;
          v106 = (uint64_t)v49;
          _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_DEBUG, "Handle merge notification observer count: %lu, result count: %lu, change: %@", buf, 0x20u);

        }
        -[PHPhotoLibrary changeHandlingPhotoLibrary](self, "changeHandlingPhotoLibrary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "managedObjectContext");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v83[5]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3254779904;
        v58[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke_389;
        v58[3] = &unk_1E35D5238;
        v59 = v6;
        v61 = &v94;
        v62 = &v88;
        v64 = spid;
        v65 = v56;
        v63 = v26;
        v60 = self;
        -[PHChange preloadChangeDetailsForFetchResults:inManagedObjectContext:handler:](v44, "preloadChangeDetailsForFetchResults:inManagedObjectContext:handler:", v52, v51, v58);

        goto LABEL_30;
      }
      v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v32 = (id)v83[5];
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v100, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v67 != v34)
              objc_enumerationMutation(v32);
            v36 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_msgSend(v36, "fetchedObjectIDsSet");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v36, "fetchedObjectIDsSet");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "unionSet:", v38);

            }
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v100, 16);
        }
        while (v33);
      }

      v39 = (void *)objc_msgSend((id)v76[5], "mutableCopy");
      v40 = (void *)objc_msgSend(v30, "copy");
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, v55);

      v41 = objc_msgSend(v39, "copy");
      v42 = (void *)v76[5];
      v76[5] = v41;

    }
    goto LABEL_27;
  }
  v28 = v26;
  v29 = v28;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, OS_SIGNPOST_INTERVAL_END, spid, "ProcessPendingChanges", "No changes", buf, 2u);
  }

  -[PHChangeHandlingDebugger endProcessPendingChanges](self->_changeHandlingDebugger, "endProcessPendingChanges");
LABEL_30:

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
}

- (BOOL)isSharedAlbumsEnabled
{
  return objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsEnabledForPhotoLibraryURL:", self->_photoLibraryURL);
}

- (id)fetchPersistentChangesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  PHPersistentChangeFetchOptions *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(PHPersistentChangeFetchOptions);
  -[PHPersistentChangeFetchOptions setMaximumChangeThreshold:](v7, "setMaximumChangeThreshold:", objc_msgSend(v6, "maximumChangeThreshold"));
  -[PHPersistentChangeFetchOptions setExcludesPrivateChanges:](v7, "setExcludesPrivateChanges:", 0);
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary _fetchPersistentChangesSinceToken:options:error:](self, "_fetchPersistentChangesSinceToken:options:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_fetchPersistentChangesSinceToken:(id)a3 options:(id)a4 error:(id *)a5
{
  return +[PHPersistentChangeFetchResult fetchResultWithToken:options:photoLibrary:error:](PHPersistentChangeFetchResult, "fetchResultWithToken:options:photoLibrary:error:", a3, a4, self, a5);
}

- (PHPersistentChangeToken)currentToken
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPhotoLibrary changeHandlingPhotoLibrary](self, "changeHandlingPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHPersistentChangeToken currentTokenForContext:](PHPersistentChangeToken, "currentTokenForContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPersistentChangeToken *)v4;
}

- (PHPersistentChangeFetchResult)fetchPersistentChangesSinceToken:(PHPersistentChangeToken *)token error:(NSError *)error
{
  PHPersistentChangeToken *v6;
  PHPersistentChangeFetchOptions *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v13;

  v6 = token;
  v7 = objc_alloc_init(PHPersistentChangeFetchOptions);
  -[PHPersistentChangeFetchOptions setMaximumChangeThreshold:](v7, "setMaximumChangeThreshold:", 100000);
  -[PHPersistentChangeFetchOptions setExcludesPrivateChanges:](v7, "setExcludesPrivateChanges:", 1);
  v13 = 0;
  -[PHPhotoLibrary _fetchPersistentChangesSinceToken:options:error:](self, "_fetchPersistentChangesSinceToken:options:error:", v6, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = error == 0;
  if (!v11)
    *error = (NSError *)objc_retainAutorelease(v9);

  return (PHPersistentChangeFetchResult *)v8;
}

- (void)_notifyPersistentChangeObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PHPhotoLibraryPersistentHistoryDidChangeNotification"), self);

}

- (BOOL)isReadyForAnalysis
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t v10[16];

  -[PLLazyObject objectValue](self->_lazyIsReadyForAnalysis, "objectValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    return 0;
  if (!-[PHPhotoLibrary photoAnalysisClientAllowed](self, "photoAnalysisClientAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.photoanalysisd"));

    if (v7)
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Reporting NO for isReadyForAnalysis to photoanalysisd because NoPhotoAnalysis flag is set", v10, 2u);
      }

      return 0;
    }
  }
  return 1;
}

- (BOOL)isReadyForAnalysis_FOR_UI_USE_ONLY
{
  void *v2;
  char v3;

  -[PLLazyObject objectValue](self->_lazyIsReadyForAnalysisQuickCheck, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isReadyForAnalysisCPLInitialDownloadCompleted
{
  void *v2;
  char v3;

  -[PLLazyObject objectValue](self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)countOfReferencedMediaWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countOfReferencedMediaWithCompletionHandler:", v4);

}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  PHPhotoLibrary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotoKitGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "Resetting limited library access for %{public}@ to %@", buf, 0x16u);
  }

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryInternalClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PHPhotoLibrary_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
  v12[3] = &unk_1E35DF058;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "resetLimitedLibraryAccessForApplication:completionHandler:", v6, v12);

}

- (id)limitedLibraryPredicateForApplication:(id)a3 fetchType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a3;
  objc_msgSend(v7, "predicateWithValue:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71840], "fetchFilterIdentifierForApplicationIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0D71840];
    objc_msgSend(v11, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[objc_class managedEntityName](+[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v6), "managedEntityName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateForEntityName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;

        v9 = v19;
      }

    }
  }

  return v9;
}

- (void)cloudQuotaResourceBytesUsedForMinVideoSize:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6;
  if (-[PHPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__18234;
    v27[4] = __Block_byref_object_dispose__18235;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__18234;
    v25[4] = __Block_byref_object_dispose__18235;
    v26 = 0;
    -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v9 = a3;
    else
      v9 = 31457280;
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke;
    v20[3] = &unk_1E35D9AF0;
    v11 = v8;
    v21 = v11;
    v22 = v25;
    v23 = v27;
    v24 = v9;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke_2;
    v16[3] = &unk_1E35D9B18;
    v17 = v7;
    v18 = v25;
    v19 = v27;
    objc_msgSend(v11, "performBlock:completionHandler:withPriority:", v20, v16, 1);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    v30[0] = CFSTR("API not available when iCPL is OFF");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3126, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v7)[2](v7, 0, 0, v14);

  }
}

- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 error:(id *)a4
{
  return -[PHPhotoLibrary cloudQuotaResourceBytesUsed:minVideoSize:error:](self, "cloudQuotaResourceBytesUsed:minVideoSize:error:", a3, 31457280, a4);
}

- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 minVideoSize:(unint64_t)a4 error:(id *)a5
{
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  if (a3)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__18234;
    v32 = __Block_byref_object_dispose__18235;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__18234;
    v26 = __Block_byref_object_dispose__18235;
    v27 = 0;
    v9 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__PHPhotoLibrary_cloudQuotaResourceBytesUsed_minVideoSize_error___block_invoke;
    v18[3] = &unk_1E35D9B40;
    v20 = &v28;
    v21 = &v22;
    v10 = v9;
    v19 = v10;
    -[PHPhotoLibrary cloudQuotaResourceBytesUsedForMinVideoSize:completion:](self, "cloudQuotaResourceBytesUsedForMinVideoSize:completion:", a4, v18);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    *a3 = objc_retainAutorelease((id)v29[5]);
    v11 = (void *)v23[5];
    v12 = v11;
    v13 = v12;
    if (v11 && a5)
      *a5 = objc_retainAutorelease(v12);

    v14 = v23[5] == 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 1, MEMORY[0x1E0C9AA70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    return 0;
  }
  return v14;
}

- (void)_callLegacyCompletionTarget:(id)a3 completionSelector:(SEL)a4 contextInfo:(void *)a5 withSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v10 = a7;
  objc_msgSend(MEMORY[0x1E0D715A0], "createWriteImageCompletionBlockWithImage:target:selector:contextInfo:", 0, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v14 = v11;
    v13 = v10;
    pl_dispatch_async();

  }
}

- (void)legacySaveImageDataToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E35DF110;
  v19 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E35D9B68;
  v14[4] = self;
  v15 = v11;
  v16 = a5;
  v17 = a6;
  v12 = v11;
  v13 = v10;
  -[PHPhotoLibrary performChanges:completionHandler:](self, "performChanges:completionHandler:", v18, v14);

}

- (void)legacySaveVideoToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary.m"), 3418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoPath != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v23[3] = &unk_1E35DF110;
  v24 = v13;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v18[3] = &unk_1E35D9B68;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v22 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v13;
  -[PHPhotoLibrary performChanges:completionHandler:](self, "performChanges:completionHandler:", v23, v18);

}

- (void)legacySaveImageToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E35DF110;
  v19 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E35D9B68;
  v14[4] = self;
  v15 = v11;
  v16 = a5;
  v17 = a6;
  v12 = v11;
  v13 = v10;
  -[PHPhotoLibrary performChanges:completionHandler:](self, "performChanges:completionHandler:", v18, v14);

}

- (void)legacySaveScreenshotToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E35DF110;
  v19 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E35D9B68;
  v14[4] = self;
  v15 = v11;
  v16 = a5;
  v17 = a6;
  v12 = v11;
  v13 = v10;
  -[PHPhotoLibrary performChanges:completionHandler:](self, "performChanges:completionHandler:", v18, v14);

}

- (int64_t)currentDatabaseStatistics
{
  return -[PHDatabaseStatisticsTracker currentByteCount](self->_databaseStatisticsTracker, "currentByteCount");
}

- (void)enableGatheringSqlStatements
{
  -[PHDatabaseStatisticsTracker enableGatheringSqlStatements](self->_databaseStatisticsTracker, "enableGatheringSqlStatements");
}

- (void)disableGatheringSqlStatements
{
  -[PHDatabaseStatisticsTracker disableGatheringSqlStatements](self->_databaseStatisticsTracker, "disableGatheringSqlStatements");
}

- (void)removeAllGatheredSqlStatements
{
  -[PHDatabaseStatisticsTracker removeAllSqlStatements](self->_databaseStatisticsTracker, "removeAllSqlStatements");
}

- (NSArray)gatheredSqlStatements
{
  return -[PHDatabaseStatisticsTracker sqlStatements](self->_databaseStatisticsTracker, "sqlStatements");
}

- (id)stateCaptureDictionary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  PHPhotoLibrary *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", self->_photoLibraryURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "STATEDUMP: State information for PHPhotoLibrary-%p at path %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_wellKnownPhotoLibraryIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("wellKnownPhotoLibraryIdentifier"));

  objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForFileURL:", self->_photoLibraryURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("photoLibraryURL"));

  -[PHChangeHandlingDebugger stateCaptureDictionary](self->_changeHandlingDebugger, "stateCaptureDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("changeHandling"));

  return v5;
}

- (NSError)unavailabilityReason
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (void)setUnavailabilityReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (PLPhotoLibrary)transactionPhotoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 296, 1);
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionQueue, a3);
}

- (PHPerformChangesRequest)performChangesRequest
{
  return self->_performChangesRequest;
}

- (void)setPerformChangesRequest:(id)a3
{
  objc_storeStrong((id *)&self->_performChangesRequest, a3);
}

- (NSMutableDictionary)changeNotificationInfo
{
  return self->_changeNotificationInfo;
}

- (void)setChangeNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_changeNotificationInfo, a3);
}

- (BOOL)unknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (NSHashTable)availabilityObservers
{
  return self->_availabilityObservers;
}

- (void)setAvailabilityObservers:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityObservers, a3);
}

- (PLPhotoLibraryBundle)photoLibraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 344, 1);
}

- (BOOL)clearsOIDCacheAfterFetchResultDealloc
{
  return self->_clearsOIDCacheAfterFetchResultDealloc;
}

- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3
{
  self->_clearsOIDCacheAfterFetchResultDealloc = a3;
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return self->_imageConversionServiceClient;
}

- (void)setImageConversionServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_imageConversionServiceClient, a3);
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return self->_videoConversionServiceClient;
}

- (void)setVideoConversionServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_photoLibraryBundle, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_availabilityObservers, 0);
  objc_storeStrong((id *)&self->_changeNotificationInfo, 0);
  objc_storeStrong((id *)&self->_performChangesRequest, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_transactionPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_unavailabilityReason, 0);
  objc_storeStrong((id *)&self->_cachedCloudStatus, 0);
  objc_storeStrong((id *)&self->_databaseStatisticsTracker, 0);
  objc_storeStrong((id *)&self->_changeHandlingDebugger, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_storeStrong((id *)&self->_customLibrarySpecificFetchOptions, 0);
  objc_storeStrong((id *)&self->_openError, 0);
  objc_storeStrong((id *)&self->_postOpenProgress, 0);
  objc_storeStrong((id *)&self->_libraryFileSystemVolume, 0);
  objc_storeStrong((id *)&self->_observerRegistrar, 0);
  objc_storeStrong((id *)&self->_lazySearchIndex, 0);
  objc_storeStrong((id *)&self->_lazyMainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_cplSettingsObserver, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysisQuickCheck, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysis, 0);
  objc_storeStrong((id *)&self->_lazyCPLStatus, 0);
  objc_storeStrong((id *)&self->_lazyCacheMetricsCollectorClient, 0);
  objc_storeStrong((id *)&self->_lazyPhotoLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_lazyProjectAlbumRootFolderObjectID, 0);
  objc_storeStrong((id *)&self->_lazyAlbumRootFolderObjectID, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyGraphObjectFetchingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyBackgroundQueueObjectFetchingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyUserInitiatedQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyBackgroundQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyMainQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyMainQueueConcurrencyPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyPhotoLibrary, 0);
}

id __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromScreenshotImage:](PHAssetCreationRequest, "creationRequestForAssetFromScreenshotImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callLegacyCompletionTarget:completionSelector:contextInfo:withSuccess:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a3);
}

id __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromImage:](PHAssetCreationRequest, "creationRequestForAssetFromImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callLegacyCompletionTarget:completionSelector:contextInfo:withSuccess:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a3);
}

id __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromVideoAtFileURL:](PHAssetCreationRequest, "creationRequestForAssetFromVideoAtFileURL:", *(_QWORD *)(a1 + 32));
}

void __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D715A0], "createWriteVideoCompletionBlockWithVideoPath:target:selector:contextInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9 = v5;
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    pl_dispatch_async();

  }
}

uint64_t __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  id v2;

  +[PHAssetCreationRequest creationRequestForAsset](PHAssetCreationRequest, "creationRequestForAsset");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addResourceWithType:data:options:", 1, *(_QWORD *)(a1 + 32), 0);

}

uint64_t __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callLegacyCompletionTarget:completionSelector:contextInfo:withSuccess:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a3);
}

uint64_t __95__PHPhotoLibrary__callLegacyCompletionTarget_completionSelector_contextInfo_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__PHPhotoLibrary_cloudQuotaResourceBytesUsed_minVideoSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v13 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id obj;
  _BYTE v64[128];
  _QWORD v65[5];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[7];

  v69[5] = *MEMORY[0x1E0C80C00];
  v50 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("trashedState"), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v57;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("master.cloudLocalState"), 3);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v69[1] = v55;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCplQuotaExclusions"), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v53;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == NO"), CFSTR("hidden"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v1;
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(%K) == %d) AND (%K != %d)"), CFSTR("playbackStyle"), 4, CFSTR("kind"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kindSubtype"), 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v4;
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "andPredicateWithSubpredicates:", v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D71808];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeLibraryScopeInManagedObjectContext:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v15;
  if (v15 && objc_msgSend(v15, "status") == 3)
  {
    v16 = (void *)MEMORY[0x1E0CB3528];
    v66[0] = v51;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v19;
  }
  v20 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchRequestWithEntityName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setPredicate:", v51);
  v65[0] = CFSTR("kind");
  v65[1] = CFSTR("kindSubtype");
  v65[2] = CFSTR("duplicateAssetVisibilityState");
  v65[3] = CFSTR("additionalAttributes.originalFilesize");
  v65[4] = CFSTR("duplicatePerceptualMatchingAlbum");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPropertiesToFetch:", v23);

  objc_msgSend(v22, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v25 + 40);
  v48 = v22;
  objc_msgSend(v24, "executeFetchRequest:error:", v22, &obj);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v25 + 40), obj);

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v56 = v26;
  v27 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v54 = 0;
    v58 = 0;
    v30 = *(_QWORD *)v60;
    while (1)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v60 != v30)
          objc_enumerationMutation(v56);
        v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalFilesize"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedIntegerValue");

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("duplicateAssetVisibilityState"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntegerValue");

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("kind"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "unsignedIntegerValue");

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "unsignedIntegerValue");

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("duplicatePerceptualMatchingAlbum"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36 > 1)
        {
          if (v36 != 2)
          {
            if (v36 != 100)
              goto LABEL_28;
LABEL_15:
            if (v41)
              v42 = v34;
            else
              v42 = 0;
            v58 += v42;
            goto LABEL_28;
          }
        }
        else if (v36)
        {
          if (v36 != 1)
            goto LABEL_28;
          goto LABEL_15;
        }
        if (v38 == 1)
        {
          if (v34 >= *(_QWORD *)(a1 + 56))
            v43 = v34;
          else
            v43 = 0;
          v54 += v43;
        }
        if (v40 == 10)
          v44 = v34;
        else
          v44 = 0;
        v29 += v44;
LABEL_28:

      }
      v28 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (!v28)
        goto LABEL_32;
    }
  }
  v29 = 0;
  v54 = 0;
  v58 = 0;
LABEL_32:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v54);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v45, CFSTR("PHCloudQuotaBytesUsedMediaTypeVideo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v29);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v46, CFSTR("PHCloudQuotaBytesUsedMediaTypeScreenshot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v58);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v47, CFSTR("PHCloudQuotaBytesUsedMediaTypeDuplicate"));

}

uint64_t __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) == 0, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __76__PHPhotoLibrary_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v8 = v5;
    if ((a2 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);

    v5 = v8;
  }

}

void __40__PHPhotoLibrary__processPendingChanges__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

uint64_t __40__PHPhotoLibrary__processPendingChanges__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1[4] + 320), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1[4] + 320), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 272);
  *(_BYTE *)(a1[4] + 272) = 0;
  return result;
}

void __40__PHPhotoLibrary__processPendingChanges__block_invoke_389(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(a1 + 32), "setDistributeInternalTimestamp:");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v9, "photoLibraryDidChange:", v3);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(a1 + 32), "setDistributeExternalTimestamp:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x19AEBEADC](v12);
        objc_msgSend(v16, "photoLibraryDidChange:", v3, (_QWORD)v22);
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      v13 = v12;
    }
    while (v12);
  }

  v18 = *(id *)(a1 + 64);
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 72);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v21 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    v31 = v21;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_END, v20, "ProcessPendingChanges", "fr cnt: %tu", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "endProcessPendingChanges");
}

void __43__PHPhotoLibrary__publishCloudStatusChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __42__PHPhotoLibrary_handleMergeNotification___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 272) = 1;
  return result;
}

void __42__PHPhotoLibrary_handleMergeNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id obj;
  id obja;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(MEMORY[0x1E0D718B0], "changeNotificationObjectIDMutationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v100 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "setObject:forKeyedSubscript:", v9, v7);
          }
          objc_msgSend(v9, "addObjectsFromArray:", v8);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = *MEMORY[0x1E0C97870];
  v13 = a1;
  v14 = (uint64_t *)MEMORY[0x1E0C97A18];
  v78 = v10;
  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v13 + 40) + 320), "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    v17 = *v14;
    objc_msgSend(*(id *)(*(_QWORD *)(v13 + 40) + 320), "objectForKeyedSubscript:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v96 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j);
          objc_msgSend(v15, "removeObject:", v24);
          objc_msgSend(v18, "removeObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      }
      while (v21);
    }

    v25 = v17;
  }
  else
  {
    v16 = v13;
    v25 = *MEMORY[0x1E0C97A18];
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v16 + 40) + 320), "objectForKeyedSubscript:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v16;
  v77 = v26;
  if (objc_msgSend(v26, "count"))
  {
    v82 = v25;
    objc_msgSend(*(id *)(*(_QWORD *)(v16 + 40) + 320), "objectForKeyedSubscript:", v25);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = 0;
      v32 = *(_QWORD *)v92;
      v33 = *MEMORY[0x1E0D72ED0];
      do
      {
        for (k = 0; k != v29; ++k)
        {
          v35 = v31;
          if (*(_QWORD *)v92 != v32)
            objc_enumerationMutation(v27);
          v36 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * k);
          objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "objectForKeyedSubscript:", v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "objectForKeyedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v30 = v37;

          }
          else
          {
            v30 = v37;
            objc_msgSend(v37, "objectForKeyedSubscript:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v39)
              objc_msgSend(obj, "removeObject:", v36);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      }
      while (v29);
    }
    else
    {
      v30 = 0;
      v31 = 0;
    }
    v81 = v30;

    v16 = v86;
    v25 = v82;
  }
  else
  {
    v81 = 0;
    v31 = 0;
  }
  objc_msgSend(*(id *)(v16 + 32), "objectForKeyedSubscript:", v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v16 + 40) + 320), "objectForKeyedSubscript:", v25);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    v42 = *MEMORY[0x1E0D72EC8];
    objc_msgSend(*(id *)(*(_QWORD *)(v16 + 40) + 320), "objectForKeyedSubscript:", *MEMORY[0x1E0D72EC8]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v80)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "setObject:forKeyedSubscript:");
    }
    if (!v31)
    {
      v43 = *MEMORY[0x1E0D72ED0];
      objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "objectForKeyedSubscript:", *MEMORY[0x1E0D72ED0]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "setObject:forKeyedSubscript:", v31, v43);
      }
    }
    objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", v42);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v81)
    {
      objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D72ED0]);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v76 = v40;
    obja = v40;
    v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v88;
      do
      {
        v47 = 0;
        v83 = v45;
        do
        {
          if (*(_QWORD *)v88 != v46)
            objc_enumerationMutation(obja);
          v48 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v47);
          if (objc_msgSend(v41, "containsObject:", v48))
          {
            objc_msgSend(v80, "objectForKeyedSubscript:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "unsignedLongLongValue");
            objc_msgSend(v79, "objectForKeyedSubscript:", v48);
            v51 = v46;
            v52 = v41;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "unsignedLongLongValue") | v50;

            objc_msgSend(v31, "objectForKeyedSubscript:", v48);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "unsignedLongLongValue");
            objc_msgSend(v81, "objectForKeyedSubscript:", v48);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "unsignedLongLongValue") | v56;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v54);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v59, v48);

            v60 = v58;
            v41 = v52;
            v46 = v51;
            v45 = v83;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v61, v48);

          }
          ++v47;
        }
        while (v45 != v47);
        v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
      }
      while (v45);
    }

    v40 = v76;
  }
  v62 = *MEMORY[0x1E0D71E68];
  objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D71E68]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "setObject:forKeyedSubscript:", v63, v62);

  v64 = *MEMORY[0x1E0D72EB0];
  objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "objectForKeyedSubscript:", *MEMORY[0x1E0D72EB0]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "integerValue");

  objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", v64);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v68 + v66);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "setObject:forKeyedSubscript:", v69, v64);

  v70 = *MEMORY[0x1E0D71CF0];
  objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "objectForKeyedSubscript:", *MEMORY[0x1E0D71CF0]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "integerValue");

  objc_msgSend(*(id *)(v86 + 48), "objectForKeyedSubscript:", v70);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v74 + v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v86 + 40) + 320), "setObject:forKeyedSubscript:", v75, v70);

}

void __42__PHPhotoLibrary_handleMergeNotification___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processPendingChanges");

}

void __33__PHPhotoLibrary_allowedEntities__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", CFSTR("Asset"), v3, CFSTR("MomentShare"), CFSTR("ShareParticipant"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)allowedEntities_pl_once_object_80;
  allowedEntities_pl_once_object_80 = v1;

}

void __52__PHPhotoLibrary_fetchPHObjectsForUUIDs_entityName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 72), "propertiesToFetchWithHint:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v4);

  objc_msgSend(v2, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithFetchDictionary:propertyHint:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), 2, *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __57__PHPhotoLibrary_fetchedObjectsForOIDs_propertySetClass___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (v5)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "error %@", buf, 0xCu);
    }

  }
}

void __65__PHPhotoLibrary_fetchPropertiesByOID_propertyNamesByEntityName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id obj;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *context;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v20, "setName:", CFSTR("self"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setExpression:", v2);

  objc_msgSend(v20, "setExpressionResultType:", 2000);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        context = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setResultType:", 2);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v24);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setPredicate:", v6);

          objc_msgSend(v5, "allObjects");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "arrayByAddingObject:", v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setPropertiesToFetch:", v8);

          v9 = *(void **)(a1 + 48);
          v31 = 0;
          objc_msgSend(v9, "executeFetchRequest:error:", v26, &v31);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v31;
          if (!v10)
          {
            PLPhotoKitGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              v38 = v23;
              v39 = 2114;
              v40 = v12;
              _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "error: %@ while building fetch dictionaries from OIDs: %{public}@", buf, 0x16u);
            }

          }
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v13 = v10;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("self"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v17, v18);

              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            }
            while (v14);
          }

        }
        objc_autoreleasePoolPop(context);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v22);
  }

}

void __72__PHPhotoLibrary__graphBasedPHObjectsForOIDs_propertyHint_includeTrash___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __objc2_class **v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  _BYTE v49[128];
  _QWORD v50[3];
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v1 = a1;
  v53 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v4 = objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, &v48);
  v5 = v48;

  if ((v4 & 1) != 0)
  {

    objc_msgSend(MEMORY[0x1E0D71788], "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = CFSTR("values");
    v50[1] = CFSTR("edgesIn");
    v50[2] = CFSTR("edgesOut");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v7);

    objc_msgSend(v6, "setResultType:", 0);
    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), *(_QWORD *)(v1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v8);

    v9 = *(void **)(v1 + 32);
    v47 = 0;
    v39 = v6;
    objc_msgSend(v9, "executeFetchRequest:error:", v6, &v47);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v47;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (!v12)
      goto LABEL_15;
    v13 = v12;
    v14 = 0x1E0D71000uLL;
    v15 = 0x1E0D71000uLL;
    v16 = *(_QWORD *)v44;
    v17 = off_1E35D3000;
    v40 = *(_QWORD *)v44;
    v41 = v11;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v11);
        v19 = (void *)objc_msgSend(*(id *)(v14 + 1936), "newNodeContainerWithNode:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v18));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = (objc_class *)v17[47];
LABEL_11:
          v21 = (void *)objc_msgSend([v20 alloc], "initWithNodeContainer:photoLibrary:", v19, *(_QWORD *)(v1 + 48));
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = (objc_class *)PHSearchEntity;
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(v1 + 64);
        v24 = *(_QWORD *)(v1 + 48);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = v1;
        v27 = v13;
        v28 = v15;
        v29 = v14;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v23;
        v17 = off_1E35D3000;
        v32 = v24;
        v11 = v41;
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("PHPhotoLibrary.m"), 2503, CFSTR("Unsupported node container type: %@"), v30);

        v14 = v29;
        v15 = v28;
        v13 = v27;
        v1 = v26;
        v16 = v40;

        v21 = 0;
LABEL_13:
        objc_msgSend(*(id *)(v1 + 56), "addObject:", v21);

        ++v18;
      }
      while (v13 != v18);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (!v13)
      {
LABEL_15:

        v33 = *(void **)(v1 + 32);
        v42 = 0;
        v34 = objc_msgSend(v33, "setQueryGenerationFromToken:error:", 0, &v42);
        v35 = v42;
        if (v34)
        {
          objc_msgSend(*(id *)(v1 + 32), "reset");
        }
        else
        {
          PLBackendGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v35;
            _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_ERROR, "Failed to un-pin moc from query generation with error: %@", buf, 0xCu);
          }

        }
        v36 = v38;
        v5 = v39;
        goto LABEL_23;
      }
    }
  }
  PLBackendGetLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v5;
    _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_FAULT, "Failed to pin moc to current generation with error: %@", buf, 0xCu);
  }
LABEL_23:

}

void __57__PHPhotoLibrary__openApplicationOwnedFoldersIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  char v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 208))
    v3 = 1;
  else
    v3 = *(_BYTE *)(v2 + 224) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetsdClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v5, "openApplicationOwnedFoldersWithError:", &v10);
    v7 = v10;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v8 = 1;
    }
    else
    {
      PLPhotoKitGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "failed to open application owned folders %@", buf, 0xCu);
      }

      v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = v8;

  }
}

uint64_t __46__PHPhotoLibrary_performChangesAndWait_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)_performCancellableChangesAndWait:(void *)a3 withInstrumentation:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__18234;
    v16 = __Block_byref_object_dispose__18235;
    v17 = 0;
    +[PHSynchronousPhotoLibraryExecutionContext synchronousExecutionContext](PHSynchronousPhotoLibraryExecutionContext, "synchronousExecutionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__PHPhotoLibrary__performCancellableChangesAndWait_withInstrumentation_error___block_invoke;
    v11[3] = &unk_1E35D9918;
    v11[4] = &v18;
    v11[5] = &v12;
    -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:onExecutionContext:completionHandler:](a1, v7, v8, v9, v11);

    -[PHPerformChangesInstrumentation endPerformChangesWithSuccess:error:]((uint64_t)v8, *((unsigned __int8 *)v19 + 24), (void *)v13[5]);
    if (*((_BYTE *)v19 + 24))
    {
      a4 = 1;
    }
    else if (a4)
    {
      *(_QWORD *)a4 = objc_retainAutorelease((id)v13[5]);
      a4 = *((_BYTE *)v19 + 24) != 0;
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

void __78__PHPhotoLibrary__performCancellableChangesAndWait_withInstrumentation_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 onExecutionContext:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 304);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__PHPhotoLibrary__performCancellableChanges_withInstrumentation_onExecutionContext_completionHandler___block_invoke;
  v18[3] = &unk_1E35D9940;
  v18[4] = a1;
  v14 = v9;
  v21 = v14;
  v15 = v11;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  v17 = v12;
  v22 = v17;
  objc_msgSend(v15, "dispatchOnQueue:block:", v13, v18);

}

uint64_t __102__PHPhotoLibrary__performCancellableChanges_withInstrumentation_onExecutionContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_beginTransaction");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "performChangesRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "determineAuthorizationStatusForChanges");

  if ((unint64_t)(v3 - 3) > 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "performChangesRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "accessScopeOptionsRequiredForRequestedChanges") == 1)
      v5 = 1;
    else
      v5 = 2;

    objc_msgSend(*(id *)(a1 + 32), "_denyTransactionOnExecutionContext:withInstrumentation:authorizationStatus:accessLevel:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, v5, *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_commitTransactionOnExecutionContext:withInstrumentation:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_endTransaction");
}

uint64_t __51__PHPhotoLibrary_performChanges_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = a2;
    +[PHAsynchronousPhotoLibraryExecutionContext asynchronousExecutionContext](PHAsynchronousPhotoLibraryExecutionContext, "asynchronousExecutionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PHPhotoLibrary__performCancellableChanges_withInstrumentation_completionHandler___block_invoke;
    v11[3] = &unk_1E35DBB00;
    v12 = v7;
    v13 = v8;
    -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:onExecutionContext:completionHandler:](a1, v9, v12, v10, v11);

  }
}

void __83__PHPhotoLibrary__performCancellableChanges_withInstrumentation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  -[PHPerformChangesInstrumentation endPerformChangesWithSuccess:error:](*(_QWORD *)(a1 + 32), a2, v6);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __83__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_reply___block_invoke(_QWORD *a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  v5 = (void *)a1[5];
  v7 = a3;
  v8 = v5;
  v23 = v7;
  if (v6)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(v6 + 40);
      qos_class_self();
      PLStringFromQoSClass();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      *(_DWORD *)buf = 138544386;
      v13 = CFSTR("NO");
      v25 = v10;
      v26 = 2114;
      if (a2)
        v13 = CFSTR("YES");
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      v30 = 2112;
      v31 = v23;
      v32 = 2114;
      v33 = v8;
      v14 = v13;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Reply received at %{public}@, success: %{public}@, error: %@, %{public}@", buf, 0x34u);

    }
    PLPhotoKitGetLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *(_QWORD *)(v6 + 16);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = *(_QWORD *)(v6 + 40);
      qos_class_self();
      PLStringFromQoSClass();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      *(_DWORD *)buf = 138544386;
      v21 = CFSTR("NO");
      v25 = v18;
      v26 = 2114;
      if (a2)
        v21 = CFSTR("YES");
      v27 = v19;
      v28 = 2114;
      v29 = v21;
      v30 = 2112;
      v31 = v23;
      v32 = 2114;
      v33 = v8;
      v22 = v21;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PhotoKit request [client]", "PhotoKit changes: [%{public}@] Reply received at %{public}@, success: %{public}@, error: %@, %{public}@", buf, 0x34u);

    }
    *(_QWORD *)(v6 + 16) = 0;

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  qos_class_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = v5;
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v11 = v7;
    goto LABEL_17;
  }
  v8 = PLIsErrorXPCConnectionInvalid();
  v9 = v6;
  v7 = v9;
  if (!v8)
    goto LABEL_16;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
  {
    v11 = v9;
  }
  else
  {
    v11 = v9;
    if (dyld_program_sdk_at_least())
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2938];
      v34[0] = *MEMORY[0x1E0CB3388];
      v34[1] = v13;
      v35[0] = v7;
      v35[1] = CFSTR("The requested change was interrupted and could not be completed, try again");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3301, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_FAULT, "PhotoKit XPC proxy is invalid. Dropping request on the floor and returning an error: %@ (underlying error %@)", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 72);
  }
  if (v10 < 1)
  {
    v7 = v11;
    goto LABEL_16;
  }
  PLPhotoKitGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = *(void **)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    v31 = v17;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "PhotoKit XPC proxy is invalid. Retry attempt: %zd", buf, 0xCu);
  }

  v18 = qos_class_self();
  dispatch_get_global_queue(v18, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke_206;
  v24[3] = &unk_1E35D98A0;
  v20 = *(void **)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v20;
  v26 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v23 = *(void **)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 72);
  v27 = v21;
  v29 = v22;
  v28 = v23;
  dispatch_async(v19, v24);

LABEL_17:
}

uint64_t __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendChangesRequest:onExecutionContext:withInstrumentation:remainingRetryCount:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) - 1, *(_QWORD *)(a1 + 64));
}

void __93__PHPhotoLibrary__commitTransactionOnExecutionContext_withInstrumentation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_lazyPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notifyChangesTransactionFailedWithLazyPhotoLibrary:error:", v5, v8);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  objc_msgSend(*(id *)(a1 + 40), "didSendChangesToServiceWithResult:", a2);
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photosAccessAllowedWithScope:", 7);

  if (PLPhotosAccessAllowed())
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "distributeChangesSinceLastCheckpoint");

}

uint64_t __41__PHPhotoLibrary_registerChangeObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObservers:authorizationStatus:", MEMORY[0x1E0C9AA60], a2);
}

void __57__PHPhotoLibrary__notifyAvailabilityObserversWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = WeakRetained;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%@ %p notifying availability observers", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend(WeakRetained, "_onQueueNotifyAvailabilityObserversWithReason:", *(_QWORD *)(a1 + 32));
}

void __69__PHPhotoLibrary__stopWatchingFileSystemVolumeForLibraryAvailability__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  NSStringFromSelector(sel_isOffline);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", v2, v4, "PHPhotoLibraryFileSystemVolumeKVOContext");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "unregisterWithVolumeManager");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = 0;

}

void __70__PHPhotoLibrary__startWatchingFileSystemVolumeForLibraryAvailability__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  NSStringFromSelector(sel_isOffline);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v4, 0, "PHPhotoLibraryFileSystemVolumeKVOContext");

}

void __54__PHPhotoLibrary__startWatchingForLibraryAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleLibraryBecameUnavailable:reason:", v6, v5);

}

void __49__PHPhotoLibrary_unregisterAvailabilityObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      objc_msgSend(*(id *)(a1 + 32), "_stopWatchingForLibraryAvailability");
  }
}

void __47__PHPhotoLibrary_registerAvailabilityObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "availabilityObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
      objc_msgSend(*(id *)(a1 + 32), "_startWatchingForLibraryAvailability");
  }
}

uint64_t __36__PHPhotoLibrary__resetCachedValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

void __34__PHPhotoLibrary_statusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_publishCloudStatusChange");

}

uint64_t __50__PHPhotoLibrary__invalidateEverythingWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v3;
    v6 = objc_alloc_init(MEMORY[0x1E0D719D0]);
    objc_msgSend(v6, "setAutomaticallyMergesContext:", 0);
    v12 = 0;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D71868], "newPhotoLibraryWithName:loadedFromBundle:options:error:", "PHPhotoLibraryMainQueueConcurrency", v4, v6, &v12);
    v8 = v12;
    if (v7)
    {
      objc_msgSend(v7, "managedObjectContext");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addManagedObjectContext:", v9);
    }
    else
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "libraryURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v14 = "PHPhotoLibraryMainQueueConcurrency";
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "failed to load main queue photo library %{public}s with url %@, %@", buf, 0x20u);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryBackgroundQueueQoS", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_6(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryBackgroundQueueObjectFetching", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_7(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryGraphObjectFetching", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_8(void **a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    newPhotoLibrary((uint64_t)"PHPhotoLibraryChangeHandling", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[PHQuery fetchRootFolderIDForAlbumKind:photoLibrary:](PHQuery, "fetchRootFolderIDForAlbumKind:photoLibrary:", 3999, WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[PHQuery fetchRootFolderIDForAlbumKind:photoLibrary:](PHQuery, "fetchRootFolderIDForAlbumKind:photoLibrary:", 3998, WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeAppPrivateData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializePhotoLibraryIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeSearchIndex");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D715E0]);
    objc_msgSend(WeakRetained, "assetsdClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithAssetsdClient:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_169(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeCPLStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2_170(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeIsReadyForAnalysis");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3_171(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeIsReadyForAnalysisQuickCheck");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4_172(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_initializeIsReadyForAnalysisCPLInitialDownloadCompleted");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5_174(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_deriveMainScopeIdentifierFromCPLSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __68__PHPhotoLibrary_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    PHErrorFromPLError(a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);

  }
}

void __34__PHPhotoLibrary_postOpenProgress__block_invoke_151(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

void __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a2;
  if (a3)
  {
    PHErrorFromPLError(a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), a2);
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    objc_msgSend(v8, "_postOpenInitializationWithError:", &v9);
    v7 = v9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2_143(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

+ (id)imagePickerPhotoLibrary
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18234;
  v8 = __Block_byref_object_dispose__18235;
  v9 = 0;
  PLRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

+ (BOOL)setImagePickerPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__18234;
  v13 = __Block_byref_object_dispose__18235;
  v14 = 0;
  v5 = a3;
  PLRunWithUnfairLock();
  v6 = (void *)v10[5];
  if (a4 && v6)
  {
    *a4 = objc_retainAutorelease(v6);
    v6 = (void *)v10[5];
  }
  v7 = v6 == 0;

  _Block_object_dispose(&v9, 8);
  return v7;
}

+ (id)sharedMomentSharePhotoLibrary
{
  id v3;

  if (sharedMomentSharePhotoLibrary_onceToken != -1)
    dispatch_once(&sharedMomentSharePhotoLibrary_onceToken, &__block_literal_global_108);
  if (!sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to create moment share shared library"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return (id)sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary;
}

+ (PHAuthorizationStatus)authorizationStatus
{
  void *v2;
  uint64_t v3;
  PHAuthorizationStatus v4;
  PHAuthorizationStatus result;

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "photosAccessAllowedWithScope:", 7);

  v4 = PHAuthorizationStatusNotDetermined;
  result = PHAuthorizationStatusAuthorized;
  switch(v3)
  {
    case 0:
      return 3;
    case 2:
      return 2;
    case 3:
      return 1;
    case 4:
      return result;
    default:
      return v4;
  }
}

+ (void)requestAuthorization:(void *)handler
{
  objc_msgSend(a1, "_requestAuthorizationForAccessLevel:supportsLimited:handler:", 2, 0, handler);
}

+ (void)requestAuthorizationForAccessLevel:(PHAccessLevel)accessLevel handler:(void *)handler
{
  objc_msgSend(a1, "_requestAuthorizationForAccessLevel:supportsLimited:handler:", accessLevel, 1, handler);
}

+ (void)_requestAuthorizationForAccessLevel:(int64_t)a3 supportsLimited:(BOOL)a4 handler:(id)a5
{
  id v8;
  PHAuthorizationStatus v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  PHAuthorizationStatus v16;
  id v17;
  BOOL v18;

  v8 = a5;
  v9 = +[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", a3);
  if (a3 == 1)
    v10 = 1;
  else
    v10 = 7;
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PHPhotoLibrary__requestAuthorizationForAccessLevel_supportsLimited_handler___block_invoke;
  v13[3] = &unk_1E35D9690;
  v14 = v8;
  v15 = a3;
  v18 = a4;
  v16 = v9;
  v17 = a1;
  v12 = v8;
  objc_msgSend(v11, "checkPhotosAccessAllowedWithScope:handler:", v10, v13);

}

+ (void)_forceUserInterfaceReload
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleUnknownMergeEvent");

}

+ (id)systemPhotoLibraryURL
{
  return (id)objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", a3);
}

+ (id)openPhotoLibraryWithWellKnownIdentifier:(int64_t)a3 error:(id *)a4
{
  PHPhotoLibrary *v7;
  void *v8;
  PHPhotoLibrary *v9;
  id v10;
  id v12;

  v7 = [PHPhotoLibrary alloc];
  objc_msgSend(a1, "wellKnownPhotoLibraryURLForIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHPhotoLibrary initWithPhotoLibraryURL:](v7, "initWithPhotoLibraryURL:", v8);

  v12 = 0;
  LODWORD(v8) = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v9, "openAndWaitWithUpgrade:error:", 1, &v12);
  v10 = v12;
  if ((_DWORD)v8)
  {
    objc_msgSend(a1, "enableMultiLibraryMode");
  }
  else
  {

    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

+ (void)unsafeShutdownLibraryWithPhotoLibraryURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLibraryBundleGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_FAULT, "Unsafe PHPhotoLibrary shutdown for URL: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleForLibraryURL:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46019, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shutdownBundle:reason:", v7, v8);

  }
}

+ (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4
{
  char v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0D73280], "setSystemLibraryURL:options:error:", a3, 0, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    PHErrorFromPLError(v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v8;

  }
  return v5;
}

+ (const)systemPhotoLibraryAvailableNotificationName
{
  return (const char *)*MEMORY[0x1E0D74880];
}

+ (BOOL)isPhotosApplicationInstalled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationIsInstalled:", CFSTR("com.apple.mobileslideshow"));

  return v3;
}

+ (id)plLibraryOptionsFromPHOptions:(id)a3 createOptions:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
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
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PHPhotoLibraryCreateOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHPhotoLibraryUpgradeOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    v11 = 0;
    for (i = 0; i != 64; ++i)
    {
      v13 = v10 & (1 << i);
      v14 = v11 | 4;
      if (v13 != 4)
        v14 = v11;
      if (v13 == 8)
        v11 |= 8uLL;
      else
        v11 = v14;
    }
    for (j = 0; j != 64; ++j)
    {
      v16 = v8 & (1 << j);
      v17 = v11 | 0x80;
      v18 = v11 | 0x100;
      if (v16 != 256)
        v18 = v11;
      if (v16 != 128)
        v17 = v18;
      v19 = v11 | 0x20;
      v20 = v11 | 0x40;
      if (v16 != 64)
        v20 = v11;
      if (v16 != 32)
        v19 = v20;
      if (v16 <= 127)
        v17 = v19;
      v21 = v11 | 0x10;
      v22 = v11 | 0x11;
      if (v16 != 17)
        v22 = v11;
      if (v16 != 16)
        v21 = v22;
      v23 = v11 | 1;
      v24 = v11 | 2;
      if (v16 != 2)
        v24 = v11;
      if (v16 != 1)
        v23 = v24;
      if (v16 <= 15)
        v21 = v23;
      if (v16 <= 31)
        v11 = v21;
      else
        v11 = v17;
    }
    if (v11)
    {
      if (a4)
        *a4 = v11;
      v25 = (id)objc_msgSend(v6, "mutableCopy");
      v29[0] = CFSTR("PHPhotoLibraryCreateOptions");
      v29[1] = CFSTR("PHPhotoLibraryUpgradeOptions");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObjectsForKeys:", v26);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D72400]);

    }
    else
    {
      v25 = v6;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)sharedLazyPhotoLibraryForCMM
{
  pl_dispatch_once();
  return (id)sharedLazyPhotoLibraryForCMM_pl_once_object_47;
}

+ (void)assertTransaction
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(a1, "photoLibraryForCurrentTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    objc_msgSend(v2, "assertTransaction");
  }
  else if ((PLIsAssetsd() & 1) == 0 && (objc_msgSend(MEMORY[0x1E0D73178], "inTransactionProxy") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This method can only be called from inside of -[PHPhotoLibrary performChanges:completionHandler:] or -[PHPhotoLibrary performChangesAndWait:error:]"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }

}

+ (id)stringFromPHPhotoLibraryType:(unsigned __int16)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("CMM");
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownType(%u)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("UserLibrary");
  }
  return v3;
}

+ (id)photoLibraryForCurrentTransaction
{
  return dispatch_get_specific("PHPhotoLibrary_transactionPhotoLibrary");
}

+ (int64_t)collectionListTypeForIdentifierCode:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  pl_dispatch_once();
  objc_msgSend((id)collectionListTypeForIdentifierCode___typeByCode, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;

  return v5;
}

+ (id)fetchTypeForLocalIdentifierCode:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = fetchTypeForLocalIdentifierCode__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&fetchTypeForLocalIdentifierCode__onceToken, &__block_literal_global_253);
  objc_msgSend((id)fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)PHObjectClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PHPhotoLibrary_PHObjectClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (PHObjectClasses_onceToken != -1)
    dispatch_once(&PHObjectClasses_onceToken, block);
  return (id)PHObjectClasses_classes;
}

+ (Class)PHObjectClassForOID:(id)a3
{
  void *v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;

  objc_msgSend(a3, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PHPhotoLibrary PHObjectClassForEntityName:](PHPhotoLibrary, "PHObjectClassForEntityName:", v4);

  v6 = v5;
  return v6;
}

+ (Class)PHObjectClassForObjectType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_effectiveRootEntity:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  v3 = a3;
  if (_effectiveRootEntity__onceToken != -1)
    dispatch_once(&_effectiveRootEntity__onceToken, &__block_literal_global_370);
  v4 = v3;
  v5 = _effectiveRootEntity__effectiveRootEntityNames;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    v8 = v4;
    while (1)
    {
      objc_msgSend(v8, "superentity");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v7 = (id)v9;

      v10 = (void *)_effectiveRootEntity__effectiveRootEntityNames;
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      v8 = v7;
      if (v12)
        goto LABEL_10;
    }
    v7 = v8;

    v4 = v7;
  }
LABEL_10:

  return v4;
}

+ (id)uniquedOIDsFromObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "uniqueObjectIDCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUniqueObjectIDCache uniquedOIDsFromObjects:](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)removeAllUniquedOIDs
{
  objc_msgSend(a1, "uniqueObjectIDCache");

}

+ (BOOL)_isInternalObserver:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)sharedContactStore
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sharedContactStore___sContactStore;
  if (!sharedContactStore___sContactStore)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = (void *)sharedContactStore___sContactStore;
    sharedContactStore___sContactStore = (uint64_t)v4;

    v3 = (void *)sharedContactStore___sContactStore;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

void __39__PHPhotoLibrary__effectiveRootEntity___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("Folder"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_effectiveRootEntity__effectiveRootEntityNames;
  _effectiveRootEntity__effectiveRootEntityNames = v0;

}

void __33__PHPhotoLibrary_PHObjectClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "PHObjectClassesByEntityName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingFunction:context:", _classNameCompare, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)PHObjectClasses_classes;
  PHObjectClasses_classes = v5;

}

void __50__PHPhotoLibrary_fetchTypeForLocalIdentifierCode___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];
  _QWORD v20[19];

  v20[17] = *MEMORY[0x1E0C80C00];
  +[PHAsset identifierCode](PHAsset, "identifierCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  v20[0] = CFSTR("PHAsset");
  +[PHCollectionList identifierCode](PHCollectionList, "identifierCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  v20[1] = CFSTR("PHCollectionList");
  +[PHMomentList identifierCode](PHMomentList, "identifierCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  v20[2] = CFSTR("PHMomentList");
  +[PHAssetCollection identifierCode](PHAssetCollection, "identifierCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  v20[3] = CFSTR("PHAssetCollection");
  +[PHMoment identifierCode](PHMoment, "identifierCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  v20[4] = CFSTR("PHMoment");
  +[PHPerson identifierCode](PHPerson, "identifierCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  v20[5] = CFSTR("PHPerson");
  +[PHFace identifierCode](PHFace, "identifierCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v12;
  v20[6] = CFSTR("PHFace");
  +[PHFaceGroup identifierCode](PHFaceGroup, "identifierCode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v0;
  v20[7] = CFSTR("PHFaceGroup");
  +[PHSocialGroup identifierCode](PHSocialGroup, "identifierCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v1;
  v20[8] = CFSTR("PHSocialGroup");
  +[PHMemory identifierCode](PHMemory, "identifierCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v2;
  v20[9] = CFSTR("PHMemory");
  +[PHPhotosHighlight identifierCode](PHPhotosHighlight, "identifierCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v3;
  v20[10] = CFSTR("PHPhotosHighlight");
  +[PHMomentShare identifierCode](PHMomentShare, "identifierCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v4;
  v20[11] = CFSTR("PHMomentShare");
  +[PHLibraryScope identifierCode](PHLibraryScope, "identifierCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v5;
  v20[12] = CFSTR("PHLibraryScope");
  +[PHShareParticipant identifierCode](PHShareParticipant, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v6;
  v20[13] = CFSTR("PHShareParticipant");
  +[PHSuggestion identifierCode](PHSuggestion, "identifierCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v7;
  v20[14] = CFSTR("PHSuggestion");
  +[PHImportSession identifierCode](PHImportSession, "identifierCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[15] = v8;
  v20[15] = CFSTR("PHImportSession");
  +[PHProject identifierCode](PHProject, "identifierCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[16] = v9;
  v20[16] = CFSTR("PHProject");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode;
  fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode = v10;

}

void __54__PHPhotoLibrary_collectionListTypeForIdentifierCode___block_invoke()
{
  void *v0;

  v0 = (void *)collectionListTypeForIdentifierCode___typeByCode;
  collectionListTypeForIdentifierCode___typeByCode = (uint64_t)&unk_1E3657888;

}

void __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v1 = *(void **)(a1 + 32);
  v2 = objc_initWeak(&location, v1);

  v3 = objc_alloc(MEMORY[0x1E0D73248]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke_2;
  v6[3] = &unk_1E35DDF28;
  objc_copyWeak(&v7, &location);
  v4 = objc_msgSend(v3, "initWithBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  v5 = (void *)sharedLazyPhotoLibraryForCMM_pl_once_object_47;
  sharedLazyPhotoLibraryForCMM_pl_once_object_47 = v4;

}

id __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke_2(uint64_t a1)
{
  void *WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openBundleAtLibraryURL:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    newPhotoLibrary((uint64_t)"CMM PLPhotoLibrary", v4, 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  }
  return WeakRetained;
}

uint64_t __78__PHPhotoLibrary__requestAuthorizationForAccessLevel_supportsLimited_handler___block_invoke(uint64_t a1)
{
  PHAuthorizationStatus v2;
  uint64_t result;
  uint64_t v5;
  BOOL v6;

  v2 = +[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (v2 == PHAuthorizationStatusLimited && *(_BYTE *)(a1 + 64) == 0)
      v5 = 3;
    else
      v5 = v2;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  v6 = (unint64_t)(v2 - 3) > 1 || *(_QWORD *)(a1 + 48) == v2;
  if (!v6 && *(_QWORD *)(a1 + 40) != 1)
    return objc_msgSend(*(id *)(a1 + 56), "_forceUserInterfaceReload");
  return result;
}

void __47__PHPhotoLibrary_sharedMomentSharePhotoLibrary__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PHPhotoLibrary initMomentShareLibrary]([PHPhotoLibrary alloc], "initMomentShareLibrary");
  v1 = (void *)sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary;
  sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary = (uint64_t)v0;

}

void __51__PHPhotoLibrary_setImagePickerPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibraryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PHPhotoLibrary isSystemPhotoLibraryURL:](PHPhotoLibrary, "isSystemPhotoLibraryURL:", v2);

  if (v3)
  {
    objc_storeStrong((id *)&imagePickerPhotoLibrary, *(id *)(a1 + 32));
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("The image picker photo library URL must match the system photo library URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __41__PHPhotoLibrary_imagePickerPhotoLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)imagePickerPhotoLibrary;
  if (!imagePickerPhotoLibrary)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sharedPhotoLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)imagePickerPhotoLibrary;
    imagePickerPhotoLibrary = v3;

    v2 = (void *)imagePickerPhotoLibrary;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2);
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  id v6;

  height = a3.height;
  width = a3.width;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryInternalClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWidgetTimelineGeneratedForDisplaySize:completionHandler:", &__block_literal_global_987, width, height);

}

void __68__PHPhotoLibrary_Widgets__setWidgetTimelineGeneratedForDisplaySize___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      v7 = "Widget timeline update date successfully persisted";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEBUG;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1991EC000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    v7 = "Widget timeline update date failed to persist: %@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }

}

- (id)sceneTaxonomyDetectorNodeSceneIDsFromSceneID:(unint64_t)a3 sceneTaxonomy:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (!v5)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "PFSceneTaxonomy is nil.";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 2;
LABEL_8:
      _os_log_impl(&dword_1991EC000, v10, v11, v9, buf, v12);
    }
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "nodeRefForExtendedSceneClassId:", a3))
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = v6;
      v9 = "Failed to find sceneID (%llu) in sceneTaxonomy: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", PFSceneTaxonomyNodeDetectorsCount());
  PFSceneTaxonomyNodeVisitDetectors();
  v8 = v7;
LABEL_10:

  return v7;
}

uint64_t __91__PHPhotoLibrary_PhotosFormat__sceneTaxonomyDetectorNodeSceneIDsFromSceneID_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a3 + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

- (id)migrationDate
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__18234;
  v13 = __Block_byref_object_dispose__18235;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PHPhotoLibrary_MigrationDate__migrationDate__block_invoke;
  v6[3] = &unk_1E35DF920;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __46__PHPhotoLibrary_MigrationDate__migrationDate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D718D8];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMigrationHistoryWithManagedObjectContext:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "migrationDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (void)setNeedsToRepairKeyCuratedAssetForMemories:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (setNeedsToRepairKeyCuratedAssetForMemories__onceToken != -1)
    dispatch_once(&setNeedsToRepairKeyCuratedAssetForMemories__onceToken, &__block_literal_global_968);
  v5 = setNeedsToRepairKeyCuratedAssetForMemories__repairQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke_2;
  v8[3] = &unk_1E35DF9E8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

}

void __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = (void *)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs;
    PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs = (uint64_t)v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v5;
  objc_msgSend(v5, "assetsdClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend((id)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend((id)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs, "addObject:", v11);
          PLPhotoKitGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v11;
            _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "repairing key asset for memory with uuid=%@", buf, 0xCu);
          }

          objc_msgSend(v19, "libraryInternalClient");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v15 = objc_msgSend(v13, "repairMemoriesWithUUIDs:error:", v14, &v20);
          v16 = v20;

          if ((v15 & 1) == 0)
          {
            PLPhotoKitGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v11;
              v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Error repairing key asset for memory with uuid=%@: %@", buf, 0x16u);
            }

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v8);
  }

}

void __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PHPhotoLibrary.memoryKeyCuratedAssetRepair", 0);
  v1 = (void *)setNeedsToRepairKeyCuratedAssetForMemories__repairQueue;
  setNeedsToRepairKeyCuratedAssetForMemories__repairQueue = (uint64_t)v0;

}

+ (void)assertRunningInExtension
{
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  if (assertRunningInExtension_onceToken != -1)
    dispatch_once(&assertRunningInExtension_onceToken, &__block_literal_global_976);
  if (!assertRunningInExtension_runningInExtension)
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_ERROR, "Error: API misuse. Calling API that is only allowed for extensions.", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("API misuse. Calling API that is only allowed for extensions."), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
}

+ (BOOL)hasSharedPhotoLibrary
{
  objc_msgSend(a1, "assertRunningInExtension");
  return sharedPhotoLibrary != 0;
}

+ (void)setSharedPhotoLibrary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "assertRunningInExtension");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PHPhotoLibrary_ProjectExtensions__setSharedPhotoLibrary___block_invoke;
  block[3] = &unk_1E35DF110;
  v10 = v4;
  v5 = sharedPhotoLibraryOnceToken;
  v6 = v4;
  v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&sharedPhotoLibraryOnceToken, block);
    v7 = v10;
  }

}

void __59__PHPhotoLibrary_ProjectExtensions__setSharedPhotoLibrary___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&sharedPhotoLibrary, *(id *)(a1 + 32));
}

void __61__PHPhotoLibrary_ProjectExtensions__assertRunningInExtension__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    assertRunningInExtension_runningInExtension = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("PlugInKit"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    assertRunningInExtension_runningInExtension = v2 != 0;

  }
}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  double result;

  objc_msgSend(MEMORY[0x1E0D113A0], "nextOverrideTimeIntervalForSystemBudgets:", a3);
  return result;
}

- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[PHPhotoLibrary _cloudInternalClient](self, "_cloudInternalClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCloudPhotoLibraryPauseState:reason:", v5, v4);

}

- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;

  v8 = a3;
  v10 = a6;
  v11 = a4;
  -[PHPhotoLibrary _cloudInternalClient](self, "_cloudInternalClient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:completionHandler:", v8, v11, a5, v10);

}

- (id)_cloudInternalClient
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)featureAvailabilityForFeature:(unint64_t)a3 readOptions:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v8 = a4;
  PLPhotoKitGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PHFeatureAvailability - featureAvailabilityForFeature", ", buf, 2u);
  }

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "globalValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "featureAvailability");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v17 = -[PHFeatureAvailability initForFeature:]([PHFeatureAvailability alloc], "initForFeature:", a3);
    goto LABEL_15;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71728]), "initWithDictionary:", v15);
  if (objc_msgSend(v8, "useJustInTimeGraphAvailability"))
  {
    -[PHPhotoLibrary _updateGraphAvailabilityInFeatureAvailability:forFeature:error:](self, "_updateGraphAvailabilityInFeatureAvailability:forFeature:error:", v16, a3, a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_11;
    v18 = -[PHFeatureAvailability initForFeature:]([PHFeatureAvailability alloc], "initForFeature:", a3);
  }
  else
  {
    v18 = -[PHFeatureAvailability initForFeature:withPLFeatureAvailability:]([PHFeatureAvailability alloc], "initForFeature:withPLFeatureAvailability:", a3, v16);
  }
  v17 = v18;
LABEL_11:
  v19 = v12;
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PHFeatureAvailability - featureAvailabilityForFeature", ", v22, 2u);
  }

LABEL_15:
  return v17;
}

- (id)_updateGraphAvailabilityInFeatureAvailability:(id)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PLPhotoKitGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PHFeatureAvailability - updateGraphAvailabilityInFeatureAvailability", ", (uint8_t *)&v24, 2u);
  }

  if (PLIsPhotoanalysisd())
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315138;
      v25 = "-[PHPhotoLibrary(FeatureAvailability) _updateGraphAvailabilityInFeatureAvailability:forFeature:error:]";
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "FeatureAvailability - %s called from PAD, using intpu FeatureAvailability as is", (uint8_t *)&v24, 0xCu);
    }

    v14 = -[PHFeatureAvailability initForFeature:withPLFeatureAvailability:]([PHFeatureAvailability alloc], "initForFeature:withPLFeatureAvailability:", a4, v8);
  }
  else
  {
    -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "requestGraphStatus:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "availability") == 2;
        objc_msgSend(MEMORY[0x1E0D71728], "availabilityFromFeatureAvailability:withGraphIsAvailable:", v8, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PHFeatureAvailability initForFeature:withPLFeatureAvailability:]([PHFeatureAvailability alloc], "initForFeature:withPLFeatureAvailability:", a4, v20);
        v21 = v12;
        v22 = v21;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          LOWORD(v24) = 0;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v22, OS_SIGNPOST_INTERVAL_END, v10, "PHFeatureAvailability - updateGraphAvailabilityInFeatureAvailability", ", (uint8_t *)&v24, 2u);
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Could not get PhotoAnalysis client."));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (NSDictionary)localIdentifierMappingsForCloudIdentifiers:(NSArray *)cloudIdentifiers
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  PHLocalIdentifierMapping *v21;
  PHCloudIdentifierLookup *v23;
  NSArray *obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = cloudIdentifiers;
  v23 = -[PHCloudIdentifierLookup initWithPhotoLibrary:]([PHCloudIdentifierLookup alloc], "initWithPhotoLibrary:", self);
  -[PHCloudIdentifierLookup lookupLocalIdentifiersForCloudIdentifiers:](v23, "lookupLocalIdentifiersForCloudIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v4, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v10, "localCloudIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = 3201;
LABEL_13:
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v17, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          v15 = 0;
          goto LABEL_15;
        }
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v19 = (void *)MEMORY[0x1E0CB35C8];
        if ((isKindOfClass & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = -1;
          goto LABEL_13;
        }
        v30 = CFSTR("PHLocalIdentifiersErrorKey");
        v31 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3202, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        v14 = 0;
LABEL_15:
        v21 = -[PHLocalIdentifierMapping initWithLocalIdentifier:error:]([PHLocalIdentifierMapping alloc], "initWithLocalIdentifier:error:", v14, v15);
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v10);

        objc_autoreleasePoolPop(v11);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  return (NSDictionary *)v25;
}

- (NSDictionary)cloudIdentifierMappingsForLocalIdentifiers:(NSArray *)localIdentifiers
{
  NSArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PHCloudIdentifierMapping *v15;
  PHCloudIdentifierLookup *v17;
  NSArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = localIdentifiers;
  v17 = -[PHCloudIdentifierLookup initWithPhotoLibrary:]([PHCloudIdentifierLookup alloc], "initWithPhotoLibrary:", self);
  -[PHCloudIdentifierLookup lookupCloudIdentifiersForLocalIdentifiers:](v17, "lookupCloudIdentifiersForLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3201, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v15 = -[PHCloudIdentifierMapping initWithCloudIdentifier:error:]([PHCloudIdentifierMapping alloc], "initWithCloudIdentifier:error:", v13, v14);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v11);

        objc_autoreleasePoolPop(v12);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v6;
}

- (NSArray)localIdentifiersForCloudIdentifiers:(NSArray *)cloudIdentifiers
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  PHCloudIdentifierLookup *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = cloudIdentifiers;
  v16 = -[PHCloudIdentifierLookup initWithPhotoLibrary:]([PHCloudIdentifierLookup alloc], "initWithPhotoLibrary:", self);
  -[PHCloudIdentifierLookup lookupLocalIdentifiersForCloudIdentifiers:](v16, "lookupLocalIdentifiersForCloudIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "localCloudIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_opt_class();
          v14 = &stru_1E35DFFF8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
        }
        else
        {
          v14 = &stru_1E35DFFF8;
        }
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (NSArray)cloudIdentifiersForLocalIdentifiers:(NSArray *)localIdentifiers
{
  NSArray *v4;
  PHCloudIdentifierLookup *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = localIdentifiers;
  v5 = -[PHCloudIdentifierLookup initWithPhotoLibrary:]([PHCloudIdentifierLookup alloc], "initWithPhotoLibrary:", self);
  -[PHCloudIdentifierLookup lookupCloudIdentifiersForLocalIdentifiers:](v5, "lookupCloudIdentifiersForLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[PHCloudIdentifier _notFoundIdentifier](PHCloudIdentifier, "_notFoundIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (id)bfa_tombstoneObjectForOID:(id)a3 uuid:(id)a4 propertyHint:(unint64_t)a5 overrideResultsWithClass:(Class)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!a6)
    a6 = +[PHPhotoLibrary PHObjectClassForOID:](PHPhotoLibrary, "PHObjectClassForOID:", v10);
  -[objc_class entityKeyForPropertyKey:](a6, "entityKeyForPropertyKey:", CFSTR("uuid"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = CFSTR("uuid");
  v15 = v14;

  v19[0] = CFSTR("objectID");
  v19[1] = CFSTR("deleted");
  v20[0] = v10;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = v15;
  v20[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend([a6 alloc], "initWithFetchDictionary:propertyHint:photoLibrary:", v16, a5, self);
  return v17;
}

- (BOOL)bfa_supportsPrivacyRestrictionsForOIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_8;
  -[PHPhotoLibrary photoLibraryBundle](self, "photoLibraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "connectionType");

  if (v6 != 1)
    goto LABEL_8;
  objc_opt_class();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  v9 = v8;

  objc_msgSend(v9, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    v14 = 1;
  else
LABEL_8:
    v14 = 0;

  return v14;
}

- (id)bfa_fetchUUIDsForRestrictedOIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoKitClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary objectFetchingContextForCurrentQueueQoS](self, "objectFetchingContextForCurrentQueueQoS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "getUUIDsForAssetObjectIDs:filterPredicate:context:error:", v4, 0, v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (!v8)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve UUIDs for missing fetch result object IDs %@", buf, 0xCu);
    }

  }
  return v8;
}

- (id)faceAnalysisProcessingCounts
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  v3 = objc_msgSend(MEMORY[0x1E0D718C8], "faceAnalysisTaskID");
  v4 = (void *)MEMORY[0x1E0D718C8];
  v8 = 0;
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryProgressDetail:forPhotoLibraryURL:andTaskID:", &v8, v5, v3);
  v6 = v8;

  return v6;
}

- (void)requestTotalProgressCountsForWorkerType:(signed __int16)a3 states:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v9;
  void (**v10)(id, void *, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v6 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v10)
  {
    if ((_DWORD)v6 != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+AssetAnalysis.m"), 86, CFSTR("Input worker type (%@) not supported, only %@ supported"), v16, &unk_1E36563B0);

    }
    -[PHPhotoLibrary faceAnalysisProcessingCounts](self, "faceAnalysisProcessingCounts");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = (void *)v11;
    else
      v12 = (void *)MEMORY[0x1E0C9AA70];
    PLShortDescriptionForWorkerType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14, 0);

  }
}

- (id)_assetOIDsForHighlight:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "kind");
  if (v9)
  {
    if (v9 != 3)
    {
      v19 = 0;
      goto LABEL_7;
    }
    v10 = CFSTR("dayGroupHighlightBeingAssets");
  }
  else
  {
    v10 = CFSTR("highlightBeingAssets");
  }
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("kind"), &unk_1E3657630);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyAllowedForAnalysisAssets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3528];
  v21[0] = v13;
  v21[1] = v14;
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v18);

  objc_msgSend(v8, "setResultType:", 1);
  objc_msgSend(v8, "setIncludesPropertyValues:", 0);
  objc_msgSend(v8, "setIncludesPendingChanges:", 0);
  objc_msgSend(v6, "executeFetchRequest:error:", v8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v19;
}

- (double)faceAnalysisProgressForHighlight:(id)a3
{
  double result;

  -[PHPhotoLibrary _analysisProgressForHighlight:fetchCountBlock:](self, "_analysisProgressForHighlight:fetchCountBlock:", a3, &__block_literal_global_39663);
  return result;
}

- (BOOL)petVIPModelExists
{
  dispatch_block_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  char v10;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v3 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_74);
  v4 = (void *)MEMORY[0x1E0D718C8];
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0D718C8], "petVIPModelType");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__PHPhotoLibrary_AssetAnalysis__petVIPModelExists__block_invoke_2;
  v13[3] = &unk_1E35DEAE8;
  v15 = &v16;
  v7 = v3;
  v14 = v7;
  objc_msgSend(v4, "requestVIPModelFilepathForPhotoLibraryURL:forModelType:andCompletionHandler:", v5, v6, v13);

  v8 = dispatch_time(0, 10000000000);
  if (dispatch_block_wait(v7, v8))
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Request to get pet VIP model filepath from VideoProcessing timed out", v12, 2u);
    }

  }
  v10 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)faceAnalysisProgressCounts
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D718C8];
  v11 = 0;
  -[PHPhotoLibrary photoLibraryURL](self, "photoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "queryProgressDetail:forPhotoLibraryURL:andTaskID:", &v11, v3, objc_msgSend(MEMORY[0x1E0D718C8], "faceAnalysisTaskID"));
  v5 = v11;

  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (v6)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v4;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to get face processing counts from VideoProcessing, status: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (double)_ratioOfAssetsAtOrAboveVersion:(signed __int16)a3 forKey:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_class();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_countOfAnalysisVersionsForKey:inLibrary:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v23 = v6;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");
        v13 += v19;
        if ((int)objc_msgSend(v17, "shortValue") >= v4)
          v20 = v19;
        else
          v20 = 0;
        v14 += v20;

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);

    if (v13)
      v21 = (double)v14 / (double)v13;
    else
      v21 = 0.0;
    v6 = v23;
  }
  else
  {

    v21 = 0.0;
  }

  return v21;
}

- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion:(signed __int16)a3
{
  double result;

  -[PHPhotoLibrary _ratioOfAssetsAtOrAboveVersion:forKey:](self, "_ratioOfAssetsAtOrAboveVersion:forKey:", a3, CFSTR("sceneAnalysisVersion"));
  return result;
}

- (int64_t)fetchCountOfAssetsWithAllowedForAnalysis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisWithNoindex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "_countOfAssetsWithPredicate:entityName:inLibrary:", v4, v5, v6);

  return v7;
}

- (int64_t)fetchCountOfVideosWithAllowedForAnalysis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  PLAssetKindPredicateForTaskID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyAllowedForAnalysisAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "_countOfAssetsWithPredicate:entityName:inLibrary:", v8, v9, v10);

  return v11;
}

- (int64_t)fetchCountOfAssetsWithScenesProcessed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "_countOfAssetsWithPredicate:entityName:inLibrary:", v4, v5, v6);

  return v7;
}

- (int64_t)fetchCountOfAssetsWithFacesProcessedToLatestVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestFaceVersionWithNoindex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "_countOfAssetsWithPredicate:entityName:inLibrary:", v4, v5, v6);

  return v7;
}

- (int64_t)fetchCountOfAssetsWithFacesProcessedToAnyVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:noindex:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "_countOfAssetsWithPredicate:entityName:inLibrary:", v4, v5, v6);

  return v7;
}

- (int64_t)fetchCountOfAssetsWithMediaAnalysisVideoProcessed
{
  void *v3;
  double v4;
  int64_t v5;

  +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions](PHMediaProcessingAlgorithmVersionProvider, "providerWithCurrentVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  v5 = -[PHPhotoLibrary countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:](self, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 1, 0, v3, 0, v4);

  return v5;
}

- (int64_t)fetchCountOfAssetsWithMediaAnalysisImageProcessed
{
  void *v3;
  double v4;
  int64_t v5;

  +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions](PHMediaProcessingAlgorithmVersionProvider, "providerWithCurrentVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  v5 = -[PHPhotoLibrary countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:](self, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 17, 0, v3, 0, v4);

  return v5;
}

- (double)ratioOfAssetsWithScenesProcessed
{
  double result;

  -[PHPhotoLibrary _ratioOfAssetsAtOrAboveVersion:forKey:](self, "_ratioOfAssetsAtOrAboveVersion:forKey:", (__int16)(*MEMORY[0x1E0D71F80] + 1), CFSTR("sceneAnalysisVersion"));
  return result;
}

- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion:(signed __int16)a3
{
  double result;

  -[PHPhotoLibrary _ratioOfAssetsAtOrAboveVersion:forKey:](self, "_ratioOfAssetsAtOrAboveVersion:forKey:", a3, CFSTR("faceAnalysisVersion"));
  return result;
}

- (double)ratioOfAssetsWithFacesProcessed
{
  double result;

  -[PHPhotoLibrary _ratioOfAssetsAtOrAboveVersion:forKey:](self, "_ratioOfAssetsAtOrAboveVersion:forKey:", (__int16)(*MEMORY[0x1E0D71F78] + 1), CFSTR("faceAnalysisVersion"));
  return result;
}

- (double)ratioOfAssetsWithMediaAnalysisVideoProcessed
{
  double v2;
  unint64_t v4;

  LODWORD(v2) = 0;
  v4 = -[PHPhotoLibrary countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:](self, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", 1, 0, 0, v2);
  if (v4)
    return (double)(unint64_t)-[PHPhotoLibrary fetchCountOfAssetsWithMediaAnalysisVideoProcessed](self, "fetchCountOfAssetsWithMediaAnalysisVideoProcessed")/ (double)v4;
  else
    return 1.0;
}

- (double)ratioOfAssetsWithMediaAnalysisImageProcessed
{
  double v2;
  unint64_t v4;

  LODWORD(v2) = 0;
  v4 = -[PHPhotoLibrary countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:](self, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", 17, 0, 0, v2);
  if (v4)
    return (double)(unint64_t)-[PHPhotoLibrary fetchCountOfAssetsWithMediaAnalysisImageProcessed](self, "fetchCountOfAssetsWithMediaAnalysisImageProcessed")/ (double)v4;
  else
    return 1.0;
}

- (double)sceneAnalysisProgressForHighlight:(id)a3
{
  double result;

  -[PHPhotoLibrary _analysisProgressForHighlight:fetchCountBlock:](self, "_analysisProgressForHighlight:fetchCountBlock:", a3, &__block_literal_global_92_39649);
  return result;
}

- (double)_analysisProgressForHighlight:(id)a3 fetchCountBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  _QWORD v14[4];
  id v15;
  PHPhotoLibrary *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PHPhotoLibrary_AssetAnalysis___analysisProgressForHighlight_fetchCountBlock___block_invoke;
  v14[3] = &unk_1E35DEB80;
  v9 = v8;
  v15 = v9;
  v16 = self;
  v10 = v6;
  v17 = v10;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v9, "performBlockAndWait:", v14);
  v12 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (BOOL)photoAnalysisClientAllowed
{
  void *v4;
  void *v5;
  char v6;

  if (-[PHPhotoLibrary wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") == 3)
    return 0;
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "libraryCreateOptions");

  return (v6 & 1) == 0;
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelOperationsWithIdentifiers:reply:", v7, v6);

}

- (id)memoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestMemoryDebugInformationForMemoryWithLocalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)highlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestHighlightDebugInformationForHighlightWithLocalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)curationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestCurationDebugInformationForAssetLocalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)curationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)summaryCurationForHighlightForLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestSummaryCurationForHighlightLocalIdentifier:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)relatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestRelatedDebugInformationBetweenAssetForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:error:", v14, v13, v12, a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)relatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:error:", v14, v13, v12, a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)graphStatusDescription:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestGraphStatus:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "statusDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)graphStatisticsDescription:(id *)a3
{
  void *v4;
  void *v5;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestGraphStatisticsWithOptions:error:", MEMORY[0x1E0C9AA70], a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestHighlightEstimatesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestHighlightEstimatesWithReply:", v4);

}

- (id)exportGraphForPurpose:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestExportGraphForPurpose:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)invalidateTransientGraphCachesAndReturnError:(id *)a3
{
  void *v4;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "requestInvalidateTransientCaches:", a3);

  return (char)a3;
}

- (BOOL)invalidatePersistentGraphCachesAndReturnError:(id *)a3
{
  void *v4;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "requestInvalidatePersistentCaches:", a3);

  return (char)a3;
}

- (void)requestGraphRebuildProgressWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "requestGraphRebuildFractionCompletedWithReply:", v6);
  }
  else if (v6)
  {
    v6[2](v6, &unk_1E3657800, 0);
  }

}

- (void)requestGraphReadyNotificationWithCoalescingIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "notifyWhenGraphReadyWithCoalescingIdentifier:reply:", v9, v6);
  }
  else if (v6)
  {
    v6[2](v6, 1, 0);
  }

}

- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "requestHighlightEnrichmentWithOptions:error:", v6, a4);

  return (char)a4;
}

- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "requestHighlightCollectionEnrichmentWithOptions:error:", v6, a4);

  return (char)a4;
}

- (BOOL)requestAssetRevGeocodingWithError:(id *)a3
{
  void *v4;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "requestAssetRevGeocodingWithError:", a3);

  return (char)a3;
}

- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "requestAssetRevGeocodingForAssetLocalIdentifiers:withError:", v6, a4);

  return (char)a4;
}

- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "requestEnrichmentWithOptions:error:", v6, a4);

  return (char)a4;
}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "simulateMemoriesNotificationWithOptions:reply:", v9, v6);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestTextFeaturesForMomentLocalIdentifiers:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestRunPFLWithAttachments:recipeUserInfo:resultBlock:", v10, v9, v8);

}

- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestRunShadowEvaluationWithRecipe:models:trialDeploymentID:trialExperimentID:trialTreatmentID:resultBlock:", v19, v18, v17, v16, v15, v14);

}

- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestGenerateQuestionsWithOptions:reply:", v7, v6);

}

- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestSyndicationProcessingWithOptions:reply:", v7, v6);

}

- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestExternalAssetRelevanceProcessingWithReply:", v4);

}

- (void)requestSearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryInternalClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PHPhotoLibrary_AssetAnalysis__requestSearchIndexGraphUpdates_supportingData_withCompletion___block_invoke;
  v14[3] = &unk_1E35DF058;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "applySearchIndexGraphUpdates:supportingData:completionHandler:", v10, v9, v14);

}

- (id)sortedArrayOfPersonIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSortedArrayOfPersonLocalIdentifiers:withError:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestAllSocialGroupsForMemberLocalIdentifier:withOptions:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSocialGroupsOverlappingMemberLocalIdentifiers:withError:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)assetIdentifiersForPersonIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestAssetsForPersonLocalIdentifiers:withError:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)suggestedMePersonIdentifierWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestSuggestedMePersonIdentifierWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)personPromotionProcessingStatusForUserInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personPromoterStatus:", v4);

}

- (id)suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 minimumSuggestionFaceCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__39603;
    v26 = __Block_byref_object_dispose__39604;
    v27 = 0;
    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke;
    v16[3] = &unk_1E35DEC10;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    v21 = a6;
    v19 = v12;
    v20 = &v22;
    objc_msgSend(v13, "performBlockAndWait:", v16);

    v14 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:(id)a3 verifiedClusterSequenceNumbers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t v20[8];
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke;
  v21[3] = &unk_1E35DEB10;
  v21[4] = self;
  v22 = v6;
  v11 = v8;
  v23 = v11;
  v24 = v7;
  v12 = v9;
  v25 = v12;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v10, "performBlockAndWait:", v21);

  if (!objc_msgSend(v12, "count"))
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Prefiltering is not done since the current criteria filtered out all clusters.", v20, 2u);
    }

    v16 = v11;
    v12 = v16;
  }
  v17 = v25;
  v18 = v12;

  return v18;
}

- (BOOL)isFaceProcessingFinished
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  PLAssetAnalysisGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "IsFaceProcessingFinished", ", buf, 2u);
  }

  v7 = !-[PHPhotoLibrary countOfUnprocessedFaceCrops](self, "countOfUnprocessedFaceCrops")
    && !-[PHPhotoLibrary countOfUnclusteredFaces](self, "countOfUnclusteredFaces")
    && !-[PHPhotoLibrary countOfFaceCropsToBeGenerated](self, "countOfFaceCropsToBeGenerated");
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "IsFaceProcessingFinished", ", v11, 2u);
  }

  return v7;
}

- (id)faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__39603;
    v32 = __Block_byref_object_dispose__39604;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__39603;
    v26 = __Block_byref_object_dispose__39604;
    v27 = 0;
    -[PHPhotoLibrary photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x19AEBEADC]();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers_error___block_invoke;
    v16[3] = &unk_1E35DEEA0;
    v17 = v6;
    v12 = v10;
    v18 = v12;
    v19 = &v28;
    v20 = &v22;
    v21 = v8;
    objc_msgSend(v9, "performBlockAndWait:", v16);

    objc_autoreleasePoolPop(v11);
    v13 = (void *)v23[5];
    if (a4 && !v13)
    {
      *a4 = objc_retainAutorelease((id)v29[5]);
      v13 = (void *)v23[5];
    }
    v14 = v13;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (unint64_t)countOfUnprocessedFaceCrops
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  PLAssetAnalysisGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfUnprocessedFaceCrops", ", buf, 2u);
  }

  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldPrefetchCount:", 1);
  +[PHFaceCrop fetchFaceCropsNeedingFaceDetectionWithOptions:](PHFaceCrop, "fetchFaceCropsNeedingFaceDetectionWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = v6;
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_INTERVAL_END, v4, "CountOfUnprocessedFaceCrops", ", v13, 2u);
  }

  return v9;
}

- (unint64_t)countOfFaceCropsToBeGenerated
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PLAssetAnalysisGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfFaceCropsToBeGenerated", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v22 = 0;
  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PHPhotoLibrary_AssetAnalysis__countOfFaceCropsToBeGenerated__block_invoke;
  v16[3] = &unk_1E35DF920;
  v18 = buf;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v16);

  v11 = v6;
  v12 = v11;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    v13 = *((_QWORD *)v20 + 3);
    *(_DWORD *)v23 = 134217984;
    v24 = v13;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfFaceCropsToBeGenerated", "count: %ld", v23, 0xCu);
  }

  v14 = *((_QWORD *)v20 + 3);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (unint64_t)countOfDirtyFaceGroups
{
  return 0;
}

- (unint64_t)countOfClusteringEligibleFaces
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  PLAssetAnalysisGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfClusteringEligibleFaces", ", v14, 2u);
  }

  v7 = -[PHPhotoLibrary newClusteringEligibleFacesFetchOptions](self, "newClusteringEligibleFacesFetchOptions");
  objc_msgSend(v7, "setShouldPrefetchCount:", 1);
  v15[0] = CFSTR("PHFacePropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  +[PHFace fetchFacesWithOptions:](PHFace, "fetchFacesWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v6;
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfClusteringEligibleFaces", ", v14, 2u);
  }

  return v10;
}

- (unint64_t)countOfUnclusteredFaces
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  PLAssetAnalysisGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfUnclusteredFaces", ", v14, 2u);
  }

  v7 = -[PHPhotoLibrary newUnclusteredFacesFetchOptions](self, "newUnclusteredFacesFetchOptions");
  objc_msgSend(v7, "setShouldPrefetchCount:", 1);
  v15[0] = CFSTR("PHFacePropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  +[PHFace fetchFacesWithOptions:](PHFace, "fetchFacesWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v6;
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfUnclusteredFaces", ", v14, 2u);
  }

  return v10;
}

- (id)newClusteringEligibleFacesFetchOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D718C8], "currentFaceVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v5, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), v4, 0, 1, 2, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v6);

  return v5;
}

- (id)newFaceCropsToBeGeneratedFetchOptions
{
  void *v2;

  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeOnlyFacesNeedingFaceCrop:", 1);
  objc_msgSend(v2, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E3657678);
  return v2;
}

- (id)newUnclusteredFacesFetchOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718C8], "currentFaceVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[PHPhotoLibrary librarySpecificFetchOptions](self, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v5, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %d) AND (((%K = 0) AND (%K = 0) AND ((%K = %d) OR (%K = nil))) OR ((%K = %d) OR (%K = %d) OR (%K = %d)))"), CFSTR("faceAlgorithmVersion"), v4, CFSTR("hidden"), CFSTR("manual"), CFSTR("trainingType"), 0, CFSTR("trainingType"), CFSTR("trainingType"), 1, CFSTR("trainingType"), 2, CFSTR("trainingType"), 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("vuObservationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v10);

  objc_msgSend(v5, "setIncludedDetectionTypes:", &unk_1E3657690);
  return v5;
}

- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "requestGraphModelResultWithOptions:progress:reply:", v12, v8, v9);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)requestInsertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryInternalClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__PHPhotoLibrary_AssetAnalysis__requestInsertEmbeddings_modelType_assetUUID_withCompletion___block_invoke;
  v16[3] = &unk_1E35DF058;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "insertEmbeddings:modelType:assetUUID:completionHandler:", v12, a4, v11, v16);

}

- (void)requestDeleteEmbeddings:(id)a3 assetUUID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryInternalClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PHPhotoLibrary_AssetAnalysis__requestDeleteEmbeddings_assetUUID_withCompletion___block_invoke;
  v14[3] = &unk_1E35DF058;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "deleteEmbeddings:assetUUID:completionHandler:", v10, v9, v14);

}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a3;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoKitClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PHPhotoLibrary_AssetAnalysis__analyzeAssets_forFeature_withCompletion___block_invoke;
  v15[3] = &unk_1E35DEC68;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "analyzeAssets:forFeature:withCompletionHandler:", v9, a4, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoKitClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PHPhotoLibrary_AssetAnalysis__analyzeLibraryForFeature_withCompletion___block_invoke;
  v12[3] = &unk_1E35DEC68;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "analyzeLibraryForFeature:withCompletionHandler:", a3, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __73__PHPhotoLibrary_AssetAnalysis__analyzeLibraryForFeature_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __73__PHPhotoLibrary_AssetAnalysis__analyzeAssets_forFeature_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __82__PHPhotoLibrary_AssetAnalysis__requestDeleteEmbeddings_assetUUID_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Error requesting embedding deletions: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __92__PHPhotoLibrary_AssetAnalysis__requestInsertEmbeddings_modelType_assetUUID_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Error requesting embedding insertions: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __62__PHPhotoLibrary_AssetAnalysis__countOfFaceCropsToBeGenerated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D716C8], "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("faceCrop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("duration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("manual"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0 OR %K == 0"), CFSTR("centerX"), CFSTR("bodyCenterX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K != nil OR %K = %d"), CFSTR("rejectedPersonsNeedingFaceCrops"), CFSTR("confirmedFaceCropGenerationState"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v10);

  v11 = *(void **)(a1 + 32);
  v16 = 0;
  v12 = objc_msgSend(v11, "countForFetchRequest:error:", v2, &v16);
  v13 = v16;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "predicate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Error getting count of DetectedFace with predicate %@: %@", buf, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __99__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id obj;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D716C8], "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E3657660);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber in %@"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setFetchBatchSize:", 100);
  v4 = (void *)a1[5];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", a1[8]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "clusterSequenceNumber"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error fetching faces: %@", buf, 0xCu);
    }
  }

}

void __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  __int128 *p_buf;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 buf;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  const __CFString *v74;
  const __CFString *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "librarySpecificFetchOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMinimumUnverifiedFaceCount:", 1);
  +[PHFaceGroup fetchFaceGroupsForPerson:options:](PHFaceGroup, "fetchFaceGroupsForPerson:options:", *(_QWORD *)(a1 + 40), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "fetchedObjectIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pl_fetchObjectsWithIDs:", v33);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v66 != v37)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x19AEBEADC]();
        v7 = (void *)MEMORY[0x1E0C97B48];
        objc_msgSend(MEMORY[0x1E0D71940], "entityName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("associatedFaceGroup == %@ AND faceCount > 0"), v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPredicate:", v10);

        objc_msgSend(v9, "setResultType:", 0);
        objc_msgSend(v9, "setFetchLimit:", 1);
        objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
        v64 = 0;
        objc_msgSend(v3, "executeFetchRequest:error:", v9, &v64);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v64;
        objc_msgSend(v11, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          PLPhotoKitGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v12;
            _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Error fetching unverified person: %@", (uint8_t *)&buf, 0xCu);
          }

        }
        v15 = (void *)MEMORY[0x1E0C97B48];
        objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == NO AND %K >= 1"), CFSTR("faceGroup"), v5, CFSTR("manual"), CFSTR("clusterSequenceNumber"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPredicate:", v18);

        v75 = CFSTR("personForFace");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setRelationshipKeyPathsForPrefetching:", v19);

        v74 = CFSTR("clusterSequenceNumber");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPropertiesToFetch:", v20);

        objc_msgSend(v17, "setResultType:", 0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v70 = 0x3032000000;
        v71 = __Block_byref_object_copy__39603;
        v72 = __Block_byref_object_dispose__39604;
        objc_msgSend(v5, "keyFace");
        v73 = (id)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x2020000000;
        v59 = 0;
        v52 = 0;
        v53 = &v52;
        v54 = 0x2020000000;
        v55 = 0;
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke_139;
        v40[3] = &unk_1E35DEC38;
        v43 = &v60;
        p_buf = &buf;
        v41 = *(id *)(a1 + 40);
        v21 = v13;
        v42 = v21;
        v45 = &v48;
        v46 = &v56;
        v47 = &v52;
        v22 = (id)objc_msgSend(v3, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v17, 0, v40);
        v23 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61[3]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v24);

        v25 = v53[3];
        v26 = v49[3];
        if (!v25
          || (v27 = v57[3], v25 <= v27)
          && (v28 = v25 + v27 + v26, v28 > 7)
          && (float)((float)v26 / (float)v28) <= 0.8
          && v27 >= 5 * v25)
        {
          if (!v26)
          {
            v29 = *(void **)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61[3]);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v30);

          }
          v31 = *(void **)(a1 + 64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61[3]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v32);

        }
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&buf, 8);

        objc_autoreleasePoolPop(v6);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v38);
  }

}

void __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke_139(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;

  v4 = a2;
  v17 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v5 + 40);
    v6 = (id *)(v5 + 40);
    v7 = v8;
    if (v8)
    {
      v9 = objc_msgSend(v7, "isEqual:", v4);
      v4 = v17;
      if (!v9)
        goto LABEL_7;
    }
    else
    {
      objc_storeStrong(v6, a2);
      v4 = v17;
    }
    v10 = objc_msgSend(v4, "clusterSequenceNumber");
    v4 = v17;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  }
LABEL_7:
  objc_msgSend(v4, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 40);
  if (v14 && objc_msgSend(v14, "isEqual:", v11))
  {
    v15 = a1 + 64;
  }
  else
  {
    v16 = objc_msgSend(v12, "isEqualToString:", v13);
    v15 = a1 + 80;
    if (v16)
      v15 = a1 + 72;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24);

}

void __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(a1 + 40))
  {
    v9 = 0;
    v42 = 0;
    v13 = 0x1E0D71000;
    goto LABEL_12;
  }
  v4 = (void *)MEMORY[0x19AEBEADC]();
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber in %@"), *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v48 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v7, &v48);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v48;
  v11 = v10;
  if (!v9)
  {
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v11;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Error fetching faces: %@", buf, 0xCu);
    }
    v9 = 0;
    v13 = 0x1E0D71000uLL;
    goto LABEL_10;
  }

  objc_autoreleasePoolPop(v4);
  v4 = (void *)MEMORY[0x19AEBEADC]();
  v12 = (void *)MEMORY[0x1E0C97B48];
  v13 = 0x1E0D71000uLL;
  objc_msgSend(MEMORY[0x1E0D716D0], "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY detectedFaces in %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v15);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v47 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v7, &v47);
  v16 = objc_claimAutoreleasedReturnValue();
  v11 = v47;
  v42 = (void *)v16;
  if (!v16)
  {
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v11;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Error fetching face groups: %@", buf, 0xCu);
    }
LABEL_10:

    v42 = 0;
  }

  objc_autoreleasePoolPop(v4);
LABEL_12:
  v41 = (void *)v9;
  +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", *(_QWORD *)(a1 + 48));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71940], "personWithUUID:inManagedObjectContext:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rejectedFaces");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  if (v19)
  {
    v21 = (void *)MEMORY[0x19AEBEADC]();
    objc_msgSend(*(id *)(v13 + 1744), "fetchRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY detectedFaces in %@"), v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPredicate:", v23);

    objc_msgSend(v22, "setFetchBatchSize:", 100);
    v46 = 0;
    v24 = v20;
    objc_msgSend(v20, "executeFetchRequest:error:", v22, &v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v46;
    if (!v25)
    {
      PLPhotoKitGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v26;
        _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "Error fetching rejected face groups: %@", buf, 0xCu);
      }

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    v24 = v3;
    v25 = 0;
  }
  v28 = (void *)objc_msgSend(v42, "mutableCopy");
  objc_msgSend(v28, "removeObjectsInArray:", v25);
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v28, "count"))
  {
    v30 = (void *)MEMORY[0x19AEBEADC]();
    v31 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(MEMORY[0x1E0D71940], "entityName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchRequestWithEntityName:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("associatedFaceGroup IN %@ AND faceCount >= %ld"), v28, *(_QWORD *)(a1 + 72));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPredicate:", v34);

    objc_msgSend(v33, "setRelationshipKeyPathsForPrefetching:", &unk_1E3657648);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_110;
    v43[3] = &unk_1E35DEBA8;
    v44 = *(id *)(a1 + 56);
    v45 = v29;
    v35 = (id)objc_msgSend(v24, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v33, 0, v43);

    objc_autoreleasePoolPop(v30);
  }
  objc_msgSend(v29, "allValues");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortedArrayUsingComparator:", &__block_literal_global_124);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = v37;

}

void __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_110(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "member:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v15, "keyFace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject localIdentifierWithUUID:](PHFace, "localIdentifierWithUUID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("personIdentifier"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "faceCount"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("personFaceCount"));

        objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("confirmed"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "clusterSequenceNumber"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("faceCSN"));

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("faceIdentifier"));
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v15, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v14);

      }
    }
  }

}

uint64_t __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

void __94__PHPhotoLibrary_AssetAnalysis__requestSearchIndexGraphUpdates_supportingData_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Error requesting search index graph updates: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __79__PHPhotoLibrary_AssetAnalysis___analysisProgressForHighlight_fetchCountBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_assetOIDsForHighlight:withContext:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (double)(unint64_t)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v3 / (double)(unint64_t)objc_msgSend(v2, "count");
  }
  else
  {
    v4 = 1.0;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4;

}

uint64_t __67__PHPhotoLibrary_AssetAnalysis__sceneAnalysisProgressForHighlight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D71570];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v9;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  v17 = 0;
  v14 = objc_msgSend(v5, "countForFetchRequest:error:", v8, &v17);

  v15 = v17;
  return v14;
}

void __50__PHPhotoLibrary_AssetAnalysis__petVIPModelExists__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[NSObject fileExistsAtPath:](v7, "fileExistsAtPath:", v5);
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to get pet VIP model filepath from VideoProcessing: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PHPhotoLibrary_AssetAnalysis__faceAnalysisProgressForHighlight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1E0D71880];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@ AND %K != nil"), v6, CFSTR("faceAdjustmentVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v9);
  v12 = 0;
  v10 = objc_msgSend(v5, "countForFetchRequest:error:", v8, &v12);

  return v10;
}

+ (id)_countOfAnalysisVersionsForKey:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  v10 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v10, "setName:", CFSTR("count"));
  v11 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expressionForFunction:arguments:", CFSTR("count:"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExpression:", v14);

  objc_msgSend(v10, "setExpressionResultType:", 200);
  v34[0] = v5;
  v34[1] = CFSTR("allowedForAnalysis");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToGroupBy:", v15);

  v33[0] = v5;
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v16);

  objc_msgSend(MEMORY[0x1E0D71570], "predicateToIncludeOnlyAllowedForAnalysisWithNoindex:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHavingPredicate:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__PHPhotoLibrary_AssetAnalysis___countOfAnalysisVersionsForKey_inLibrary___block_invoke;
  v27[3] = &unk_1E35DEB10;
  v28 = v6;
  v29 = v9;
  v19 = v18;
  v30 = v19;
  v31 = v5;
  v32 = v10;
  v20 = v10;
  v21 = v5;
  v22 = v9;
  v23 = v6;
  objc_msgSend(v23, "performBlockAndWait:", v27);
  v24 = v32;
  v25 = v19;

  return v25;
}

+ (unint64_t)_countOfAssetsWithPredicate:(id)a3 entityName:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v7);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PHPhotoLibrary_AssetAnalysis___countOfAssetsWithPredicate_entityName_inLibrary___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v20 = &v21;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v7;
  v19 = v13;
  objc_msgSend(v11, "performBlockAndWait:", v16);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
    v14 = 0;
  else
    v14 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (BOOL)shouldDisplayMergeCandidates:(id)a3 forPerson:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v9 = 0;
  if (v8)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isVerified", (_QWORD)v15) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
        v9 += objc_msgSend(v12, "faceCount");
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v13 = (float)objc_msgSend(v6, "faceCount") * 0.1;
  if (v13 < 1.0)
    v13 = 1.0;
  if (v9 > (unint64_t)v13)
    LOBYTE(v8) = 1;

  return v8;
}

void __82__PHPhotoLibrary_AssetAnalysis___countOfAssetsWithPredicate_entityName_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &v8);
  v5 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Error getting count of assets with predicate %@: %@", buf, 0x16u);
    }

  }
}

void __74__PHPhotoLibrary_AssetAnalysis___countOfAnalysisVersionsForKey_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;

  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v5;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 64), "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v8);
      v5 = v16;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "_countOfAnalysisVersionsForKey: fetch error %@", buf, 0xCu);
    }
  }

}

- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestGraphInferencesSummaryWithDateInterval:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestGraphInferencesSummaryWithMomentLocalIdentifiers:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestGraphMomentLocalIdentifiersWithDateInterval:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v12[8];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestPersonalTraitsForHighlightsWithUUIDs:error:", v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "This SPI is disabled due to missing feature flag.", v12, 2u);
    }

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D68];
      v14[0] = CFSTR("This feature is not enabled.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3310, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v12[8];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestPersonalTraitsForAssetsWithUUIDs:error:", v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "This SPI is disabled due to missing feature flag.", v12, 2u);
    }

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D68];
      v14[0] = CFSTR("This feature is not enabled.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3310, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3
{
  void *v4;

  -[PHPhotoLibrary photoAnalysisClient](self, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "requestStartSharedLibrarySuggestionResultWithError:", a3);

  return (char)a3;
}

- (BOOL)internal_processIdenticalDuplicatesWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryInternalClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "processIdenticalDuplicatesWithProcessingType:error:", 7, a3);

  return (char)a3;
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  void *v2;
  void *v3;
  char v4;

  -[PHPhotoLibrary photoLibraryForCurrentQueueQoS](self, "photoLibraryForCurrentQueueQoS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInitialDuplicateDetectorProcessingCompleted");

  return v4;
}

- (BOOL)assetsArePendingForDuplicateMergeProcessingWithLocalIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidsFromLocalIdentifiers:](PHObject, "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkAssetsArePendingForDuplicateMergeProcessing:", v5);

  return v8;
}

- (void)mergeDuplicateAssetsWithLocalIdentifierGroupingContainer:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__onceToken != -1)
      dispatch_once(&mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__onceToken, &__block_literal_global_40965);
    v11 = v5;
    v12 = v6;
    pl_dispatch_async();

    v7 = v11;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("No identifiers specified for merge request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge processing failed with missing identifiers. Error: %@", buf, 0xCu);
    }

    if (v6)
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);
  }

}

- (BOOL)processDuplicateAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  id v23;
  void *v24;
  BOOL v25;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__40955;
  v39 = __Block_byref_object_dispose__40956;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidsFromLocalIdentifiers:](PHObject, "uuidsFromLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = dispatch_semaphore_create(0);
    -[PHPhotoLibrary assetsdClient](self, "assetsdClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryInternalClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__PHPhotoLibrary_DuplicateProcessing__processDuplicateAssetsWithLocalIdentifiers_error___block_invoke;
    v27[3] = &unk_1E35DEFB0;
    v29 = &v35;
    v30 = &v31;
    v12 = v9;
    v28 = v12;
    objc_msgSend(v11, "mergeDuplicateAssetUuidSelection:completionHandler:", v8, v27);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = v28;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_msgSend(v8, "count");
    v16 = CFSTR("Missing photolibrary");
    if (!v15)
      v16 = CFSTR("No identifiers specified");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ for merge request"), v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2938];
    v44[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v36[5];
    v36[5] = v19;

    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v21 = v36[5];
      *(_DWORD *)buf = 138412290;
      v42 = v21;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "Duplicate Merge processing failed with missing identifiers. Error: %@", buf, 0xCu);
    }
  }

  v22 = *((unsigned __int8 *)v32 + 24);
  v23 = (id)v36[5];
  v24 = v23;
  if (!v22 && a4)
    *a4 = objc_retainAutorelease(v23);

  v25 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

intptr_t __88__PHPhotoLibrary_DuplicateProcessing__processDuplicateAssetsWithLocalIdentifiers_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  PHErrorFromPLError(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __114__PHPhotoLibrary_DuplicateProcessing__mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if ((unint64_t)objc_msgSend(v2, "count") >= 0x1F5)
        {
          v9 = *(void **)(a1 + 40);
          v14 = v6;
          v10 = objc_msgSend(v9, "processDuplicateAssetsWithLocalIdentifiers:error:", v2, &v14);
          v11 = v14;

          objc_msgSend(v2, "removeAllObjects");
          if (!v10)
            goto LABEL_16;
          v6 = v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (objc_msgSend(v2, "count"))
  {
    v12 = *(void **)(a1 + 40);
    v13 = v6;
    objc_msgSend(v12, "processDuplicateAssetsWithLocalIdentifiers:error:", v2, &v13);
    v11 = v13;
    v3 = v6;
LABEL_16:

    v6 = v11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __114__PHPhotoLibrary_DuplicateProcessing__mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.duplicate", 0);
  v1 = (void *)mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__queue;
  mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__queue = (uint64_t)v0;

}

@end
