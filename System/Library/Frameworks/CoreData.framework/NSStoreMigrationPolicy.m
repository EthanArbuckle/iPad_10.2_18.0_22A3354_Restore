@implementation NSStoreMigrationPolicy

+ (id)migrationStoreOptionsFromStoreOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("NSPersistentStoreUbiquitousContentURLKey"), CFSTR("NSPersistentStoreUbiquitousContentNameKey"), CFSTR("NSMigratePersistentStoresAutomaticallyOption"), CFSTR("NSInferMappingModelAutomaticallyOption"), 0));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("NSCoreDataCoreSpotlightExporter"));
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentURLKey"))
    || objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), 0x1E1EF1310);
  }
  if (objc_msgSend((id)objc_msgSend(v4, "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "isNSDictionary"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v4, "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey")));
    v8[0] = CFSTR("NSPersistentHistoryTrackingEntitiesToExclude");
    v8[1] = CFSTR("NSPersistentHistoryTrackingEntitiesToInclude");
    objc_msgSend(v5, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));
    objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("NSPersistentHistoryTrackingKey"));
  }
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("NSPersistentStoreRemoveStoreOnCleanup"));
  v7[0] = CFSTR("NSPersistentCloudKitContainerOptionsKey");
  v7[1] = CFSTR("NSPersistentStoreMirroringOptionsKey");
  objc_msgSend(v4, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_coordinator = 0;
  self->_sourceURL = 0;

  self->_sourceConfiguration = 0;
  self->_destinationConfiguration = 0;

  self->_sourceMetadata = 0;
  self->_sourceOptions = 0;

  self->_sourceModel = 0;
  self->_mappingModel = 0;

  self->_destinationURL = 0;
  self->_destinationType = 0;

  self->_destinationOptions = 0;
  self->_migrationManager = 0;

  self->_resourceBundles = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStoreMigrationPolicy;
  -[NSStoreMigrationPolicy dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectModel)_sourceModelForVersionHashes:(uint64_t)a3 withMetadata:(void *)a4 inBundles:(void *)a5 outPaths:
{
  NSManagedObjectModel *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL v16;
  NSManagedObjectModelBundle *v17;
  NSManagedObjectModel *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSManagedObjectModel *v34;
  uint64_t v35;
  NSManagedObjectModel *v36;
  void *context;
  id obj;
  uint64_t v39;
  uint64_t v40;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    context = (void *)MEMORY[0x18D76B4E4]();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v40)
    {
      obj = a4;
      v8 = 0;
      v39 = *(_QWORD *)v48;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obj);
        if (v8)
          break;
        v10 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v9), "pathsForResourcesOfType:inDirectory:", CFSTR("mom"), 0), "arrayByAddingObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v9), "pathsForResourcesOfType:inDirectory:", CFSTR("momd"), 0));
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v44;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v44 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              if ((objc_msgSend(a5, "containsObject:", v15) & 1) == 0)
              {
                objc_msgSend(a5, "addObject:", v15);
                v42 = 0;
                if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v15, &v42))v16 = v42 == 0;
                else
                  v16 = 1;
                if (v16)
                {
                  v8 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0));
                }
                else
                {
                  v17 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v15);
                  v8 = -[NSManagedObjectModelBundle _modelForVersionHashes:](v17, "_modelForVersionHashes:", a2);
                  v18 = v8;

                }
                if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
                  _NSCoreDataLog(9, (uint64_t)CFSTR("_sourceModelForVersionHashes: testing model at path '%@'"), v19, v20, v21, v22, v23, v24, v15);
                v25 = -[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:](v8, "isConfiguration:compatibleWithStoreMetadata:", 0, a3);
                v26 = +[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]((uint64_t)_PFPersistentHistoryModel, v8);
                if (v25)
                {
                  if (v8)
                    v27 = v26;
                  else
                    v27 = 0;
                  if (v27 == 1)
                    *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
                  if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 1)
LABEL_37:
                    _NSCoreDataLog(9, (uint64_t)CFSTR("  \t Choosing model at path '%@'"), v28, v29, v30, v31, v32, v33, v15);
LABEL_38:
                  v34 = v8;
                  goto LABEL_39;
                }
                if (v26)
                {
                  if (v8)
                    -[NSManagedObjectModel _traverseTombstonesAndMark:]((uint64_t)v8, 1);
                  if (-[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:](v8, "isConfiguration:compatibleWithStoreMetadata:", 0, a3))
                  {
                    if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
                      goto LABEL_37;
                    goto LABEL_38;
                  }
                }

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v12)
              continue;
            break;
          }
        }
        v8 = 0;
LABEL_39:
        if (++v9 == v40)
        {
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          v40 = v35;
          if (v35)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v36 = v8;
    objc_autoreleasePoolPop(context);
    return v8;
  }
  return result;
}

- (id)sourceModelForStoreAtURL:(id)a3 metadata:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSManagedObjectModel *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSDictionary *v38;
  NSManagedObjectModel *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t i;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  unint64_t v87;
  NSManagedObjectModelBundle *v88;
  NSManagedObjectModel *v89;
  NSManagedObjectModel *v90;
  void *v91;
  uint64_t v92;
  id v93;
  id *v94;
  char v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _QWORD v101[4];

  v101[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "objectForKey:");
  if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
    _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: Testing models searched via resourceBundles"), v10, v11, v12, v13, v14, v15, v92);
  v16 = -[NSStoreMigrationPolicy resourceBundles](self);
  v17 = v16;
  if (v16)
    v18 = (id)objc_msgSend(v16, "mutableCopy");
  else
    v18 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = v18;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v17, v20);
  if (!v21)
  {
    if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
      _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: Testing models searched via mainBundle"), v23, v24, v25, v26, v27, v28, v92);
    v29 = objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    if (!v29
      || (v30 = v29,
          objc_msgSend(v19, "addObject:", v29),
          v101[0] = v30,
          (v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1), v20)) == 0))
    {
      if (self)
        v31 = -[NSDictionary valueForKey:](self->_sourceMetadata, "valueForKey:", CFSTR("NSStoreType"));
      else
        v31 = 0;
      if (!objc_msgSend(v31, "isEqualToString:", CFSTR("SQLite")))
        goto LABEL_22;
      if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
        _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: Testing model cached in database file"), v32, v33, v34, v35, v36, v37, v92);
      v38 = self ? self->_sourceOptions : 0;
      v39 = +[NSSQLCore cachedModelForPersistentStoreWithURL:options:error:](NSSQLCore, "cachedModelForPersistentStoreWithURL:options:error:", a3, v38, 0);
      if (v39)
      {
        v21 = v39;
        if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 1)
        {
          v40 = objc_msgSend(a3, "path");
          _NSCoreDataLog(9, (uint64_t)CFSTR("  \t Choosing model from cache table in db at '%@'"), v41, v42, v43, v44, v45, v46, v40);
        }
      }
      else
      {
LABEL_22:
        if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
          _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: Testing models searched via allBundles"), v47, v48, v49, v50, v51, v52, v92);
        v53 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles");
        objc_msgSend(v19, "addObjectsFromArray:", v53);
        if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
          _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: allBundles is %@"), v54, v55, v56, v57, v58, v59, (uint64_t)v53);
        v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v53, v20);
        if (!v21)
        {
          if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
            _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: Testing models searched via allFrameworks"), v60, v61, v62, v63, v64, v65, v92);
          v66 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "allFrameworks");
          if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
            _NSCoreDataLog(9, (uint64_t)CFSTR("sourceModelForStoreAtURL: allFrameworks is %@"), v67, v68, v69, v70, v71, v72, (uint64_t)v66);
          objc_msgSend(v19, "addObjectsFromArray:", v66);
          v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v66, v20);
          if (!v21)
          {
            if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 2)
              _NSCoreDataLog(9, (uint64_t)CFSTR("Last ditch review of models with skewed hashing"), v73, v74, v75, v76, v77, v78, v92);
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            v79 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
            if (v79)
            {
              v80 = v79;
              v93 = a3;
              v94 = a5;
              v81 = *(_QWORD *)v97;
              v82 = 0x1E0CB3000uLL;
              while (2)
              {
                for (i = 0; i != v80; ++i)
                {
                  if (*(_QWORD *)v97 != v81)
                    objc_enumerationMutation(v20);
                  v84 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
                  v95 = 0;
                  if (objc_msgSend((id)objc_msgSend(*(id *)(v82 + 1568), "defaultManager"), "fileExistsAtPath:isDirectory:", v84, &v95))v85 = v95 == 0;
                  else
                    v85 = 1;
                  if (v85)
                  {
                    v21 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v84, 0));
                  }
                  else
                  {
                    v86 = v81;
                    v87 = v82;
                    v88 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v84);
                    v21 = -[NSManagedObjectModelBundle _modelForVersionHashes:inStyle:](v88, "_modelForVersionHashes:inStyle:", v9, 1);
                    v89 = v21;

                    v82 = v87;
                    v81 = v86;
                  }
                  if (-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)v21, 0, 1, a4))
                  {
                    v90 = v21;
                    self->_workingWithSkewedSource = 1;
                    v91 = (void *)-[NSDictionary mutableCopy](self->_sourceMetadata, "mutableCopy");
                    objc_msgSend(v91, "setValue:forKey:", -[NSManagedObjectModel entityVersionHashesByName](v21, "entityVersionHashesByName"), CFSTR("NSStoreModelVersionHashes"));
                    -[NSStoreMigrationPolicy setSourceMetadata:]((uint64_t)self, v91);

                    goto LABEL_50;
                  }

                }
                v80 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
                if (v80)
                  continue;
                break;
              }
              v21 = 0;
LABEL_50:
              a3 = v93;
              a5 = v94;
            }
            else
            {
              v21 = 0;
            }
            if (a5 && !v21)
              *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134130, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't find model for source store"), CFSTR("reason"), a3, CFSTR("URL"), a4, CFSTR("metadata"), 0));
          }
        }
      }
    }
  }
  return v21;
}

- (_QWORD)resourceBundles
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[13];
    if (!result)
    {
      v2 = objc_msgSend((id)v1[4], "objectForKey:", CFSTR("NSPersistentStoreCoordinatorResourceBundlesForMigration"));
      v3 = MEMORY[0x1E0C9AA60];
      if (v2)
        v4 = (void *)v2;
      else
        v4 = (void *)MEMORY[0x1E0C9AA60];
      v5 = objc_msgSend((id)v1[4], "objectForKey:", CFSTR("_NSAutomaticMigrationResourceBundlesOption"));
      if (v5)
        v6 = v5;
      else
        v6 = v3;
      result = (id)objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
      v1[13] = result;
    }
  }
  return result;
}

- (uint64_t)setSourceMetadata:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 48), "isEqual:", a2);
    if ((result & 1) == 0)
    {

      result = a2;
      *(_QWORD *)(v3 + 48) = result;
    }
  }
  return result;
}

- (id)createMigrationManagerForSourceModel:(id)a3 destinationModel:(id)a4 error:(id *)a5
{
  objc_class *v8;
  NSMappingModel *v9;
  NSDictionary *v10;
  id v11;
  id v12;

  v8 = (objc_class *)objc_opt_class();
  if (BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v9 = self ? self->_mappingModel : 0;
    if (-[NSMappingModel _isInferredMappingModel]((uint64_t)v9))
    {
      v10 = +[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes");
      if (self)
        v11 = -[NSDictionary valueForKey:](self->_sourceMetadata, "valueForKey:", CFSTR("NSStoreType"));
      else
        v11 = 0;
      v12 = -[NSDictionary objectForKey:](v10, "objectForKey:", v11);
      if ((id)objc_opt_class() != v12)
      {
        if (!objc_msgSend(v12, "isNSValue"))
          return (id)objc_msgSend([v8 alloc], "initWithSourceModel:destinationModel:", a3, a4);
        v12 = (id)objc_msgSend(v12, "pointerValue");
      }
      if (v12)
      {
        objc_msgSend(v12, "migrationManagerClass");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "migrationManagerClass"), "_canMigrateWithMappingModel:", v9))v8 = (objc_class *)objc_msgSend(v12, "migrationManagerClass");
        }
      }
    }
  }
  return (id)objc_msgSend([v8 alloc], "initWithSourceModel:destinationModel:", a3, a4);
}

- (id)migrateStoreAtURL:(id)a3 withManager:(id)a4 metadata:(id)a5 options:(id)a6 error:(id *)a7
{
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (self)
  {
    v11 = (unsigned __int8 *)self;
    v12 = *((_QWORD *)self + 8);
    v13 = *((_QWORD *)self + 9);
    v14 = (void *)objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", *((_QWORD *)self + 4));
    v15 = v14;
    if (*((_QWORD *)v11 + 14))
    {
      v15 = (id)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v15, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSIgnorePersistentStoreVersioningOption"));
    }
    if (a4)
    {
      *((_DWORD *)a4 + 24) = *((_DWORD *)a4 + 24) & 0xFFFFFFF7 | (8 * v11[120]);
      v16 = (void *)*((_QWORD *)v11 + 16);
      v17 = (void *)*((_QWORD *)a4 + 9);
      if (v17 != v16)
      {

        *((_QWORD *)a4 + 9) = 0;
        *((_QWORD *)a4 + 9) = objc_msgSend(v16, "copy");
      }
      v18 = (void *)*((_QWORD *)v11 + 17);
      v19 = (void *)*((_QWORD *)a4 + 10);
      if (v19 != v18)
      {

        *((_QWORD *)a4 + 10) = 0;
        *((_QWORD *)a4 + 10) = objc_msgSend(v18, "copy");
      }
    }
    if (objc_msgSend(a4, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", a3, objc_msgSend(*((id *)v11 + 6), "valueForKey:", CFSTR("NSStoreType")), v15, *((_QWORD *)v11 + 7), v12, v13, objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", a6), a7))return (id)*((_QWORD *)v11 + 8);
    else
      return 0;
  }
  return self;
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
  +[NSMappingModel setMigrationDebugLevel:](NSMappingModel, "setMigrationDebugLevel:", *(_QWORD *)&a3);
}

- (_QWORD)setPersistentStoreCoordinator:(void *)a3 sourceURL:(void *)a4 configuration:(void *)a5 metadata:(void *)a6 options:
{
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (result)
  {
    v11 = result;
    v12 = (void *)result[1];
    if (v12 != a2)
    {

      result = a2;
      v11[1] = result;
    }
    v13 = (void *)v11[2];
    if (v13 != a3)
    {

      result = a3;
      v11[2] = result;
    }
    v14 = (void *)v11[3];
    if (v14 != a4)
    {

      result = a4;
      v11[3] = result;
    }
    v15 = (void *)v11[6];
    if (v15 != a5)
    {

      result = a5;
      v11[6] = result;
    }
    v16 = (void *)v11[4];
    if (v16 != a6)
    {

      result = a6;
      v11[4] = result;
    }
  }
  return result;
}

- (uint64_t)setMigrationManager:(uint64_t)a1
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 96), "isEqual:", a2);
  if ((result & 1) == 0)
  {

    result = a2;
    *(_QWORD *)(a1 + 96) = result;
  }
  return result;
}

+ (id)destinationURLForMigrationSourceURL:(id)a3 createDocumentReplacementDirectory:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  id result;
  uint64_t v11;

  v6 = a4;
  v8 = (void *)objc_msgSend(a3, "path");
  v9 = objc_msgSend(v8, "lastPathComponent");
  if (v6)
  {
    result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, a5);
    if (result)
      return (id)objc_msgSend(result, "URLByAppendingPathComponent:", v9);
  }
  else
  {
    v11 = objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(CFSTR("."), "stringByAppendingString:", v9), "stringByAppendingString:", CFSTR(".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3")));
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
  }
  return result;
}

- (uint64_t)_gatherDataAndPerformMigration:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  NSMappingModel *v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  char v42;
  NSMappingModel *v43;
  void *v44;
  char v45;
  id v46;
  void *v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE buf[12];
  __int16 v80;
  int v81;
  uint64_t v82;

  v2 = a1;
  v82 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v77 = 0;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v72 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Schema migration (policy)"), &v77);
    v4 = (void *)objc_msgSend(*(id *)(v2 + 8), "managedObjectModel");
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v74 != v7)
            objc_enumerationMutation(v4);
          v5 |= -[NSEntityDescription _hasAttributesWithExternalDataReferences](*(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v6);
    }
    v9 = (void *)objc_msgSend(*(id *)(v2 + 16), "path");
    v10 = (void *)objc_msgSend(v9, "pathExtension");
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", &stru_1E1EE23F0))
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stringByDeletingPathExtension"), "stringByAppendingString:", CFSTR("~")), "stringByAppendingPathExtension:", v11);
    else
      v12 = objc_msgSend(v9, "stringByAppendingString:", CFSTR("~"));
    v13 = v12;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((v5 & 1) != 0)
    {
      v15 = (void *)objc_msgSend((id)objc_msgSend(-[NSDictionary valueForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes"), "valueForKey:", objc_msgSend(*(id *)(v2 + 48), "valueForKey:", CFSTR("NSStoreType"))), "pointerValue"), "_figureOutWhereExternalReferencesEndedUpRelativeTo:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13));
      if (objc_msgSend(v14, "fileExistsAtPath:", objc_msgSend(v15, "path")))
      {
        if ((objc_msgSend(v14, "removeItemAtURL:error:", v15, 0) & 1) == 0)
        {
          if (!a2)
            goto LABEL_86;
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to delete file (backup external data references URL)"), CFSTR("reason"), v15, CFSTR("URL"), 0);
          v27 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v26);
          goto LABEL_28;
        }
      }
    }
    v16 = (void *)objc_msgSend((id)v2, "sourceModelForStoreAtURL:metadata:error:", *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 48), a2);
    objc_msgSend(v16, "_setIsEditable:", 0);
    v17 = objc_msgSend(*(id *)(v2 + 40), "isEqual:", v16);
    v18 = *(id *)(v2 + 40);
    if ((v17 & 1) == 0)
    {

      v18 = v16;
      *(_QWORD *)(v2 + 40) = v18;
    }
    if (!v18)
      goto LABEL_86;
    v19 = (void *)objc_msgSend(*(id *)(v2 + 8), "managedObjectModel");
    v20 = -[NSStoreMigrationPolicy resourceBundles]((_QWORD *)v2);
    v21 = (void *)objc_msgSend(*(id *)(v2 + 32), "objectForKey:", CFSTR("NSInferMappingModelAutomaticallyOption"));
    v22 = v21;
    if (v21
      && objc_msgSend(v21, "isNSString")
      && objc_msgSend(CFSTR("force"), "isEqualToString:", v22))
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      objc_msgSend(v20, "count");
      v23 = 0;
      v24 = 1;
    }
    else
    {
      v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, v20, v18, v19);
      if (v23)
        goto LABEL_49;
      if (objc_msgSend(v20, "count"))
      {
        v24 = 0;
        v23 = 0;
      }
      else
      {
        v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, v18, v19);
        v24 = 0;
      }
    }
    if (objc_msgSend(v22, "BOOLValue")
      && (*(_QWORD *)buf = 0,
          (v23 = +[NSMappingModel inferredMappingModelForSourceModel:destinationModel:error:](NSMappingModel, "inferredMappingModelForSourceModel:destinationModel:error:", v18, v19, buf)) == 0))
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't find or automatically infer mapping model for migration"), CFSTR("reason"), v18, CFSTR("sourceModel"), v19, CFSTR("destinationModel"), *(_QWORD *)buf, *MEMORY[0x1E0CB3388], 0);
      v28 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134140, v31);
    }
    else
    {
      v28 = 0;
      if (v23)
        goto LABEL_49;
    }
    if (objc_msgSend(v20, "count"))
      v29 = v24;
    else
      v29 = 1;
    if ((v29 & 1) != 0)
      v23 = 0;
    else
      v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, v18, v19);
    if (!((unint64_t)v23 | v28))
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't find mapping model for migration"), CFSTR("reason"), v18, CFSTR("sourceModel"), v19, CFSTR("destinationModel"), 0);
      v28 = objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134140, v33);
      goto LABEL_43;
    }
    if (!v23)
    {
LABEL_43:
      if (v28)
      {
        if (a2)
        {
          v23 = 0;
          *a2 = v28;
          goto LABEL_49;
        }
      }
      else
      {
        v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m");
        v41 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m";
          v80 = 1024;
          v81 = 524;
          _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v23 = 0;
    }
LABEL_49:
    v42 = objc_msgSend(*(id *)(v2 + 56), "isEqual:", v23);
    v43 = *(NSMappingModel **)(v2 + 56);
    if ((v42 & 1) == 0)
    {

      v43 = v23;
      *(_QWORD *)(v2 + 56) = v43;
    }
    if (!v43)
      goto LABEL_86;
    v44 = *(void **)(v2 + 32);
    v45 = objc_msgSend(*(id *)(v2 + 88), "isEqual:", v44);
    v46 = *(id *)(v2 + 88);
    if ((v45 & 1) == 0)
    {

      v46 = v44;
      *(_QWORD *)(v2 + 88) = v46;
    }
    if (!v46)
      goto LABEL_86;
    v47 = (void *)objc_msgSend(*(id *)(v2 + 48), "valueForKey:", CFSTR("NSStoreType"));
    v48 = objc_msgSend(*(id *)(v2 + 72), "isEqual:", v47);
    v49 = *(id *)(v2 + 72);
    if ((v48 & 1) == 0)
    {

      v49 = v47;
      *(_QWORD *)(v2 + 72) = v49;
    }
    if (!v49)
      goto LABEL_86;
    v50 = *(void **)(v2 + 24);
    if ((objc_msgSend(*(id *)(v2 + 80), "isEqual:", v50) & 1) == 0)
    {

      *(_QWORD *)(v2 + 80) = v50;
    }
    v51 = (void *)objc_msgSend((id)v2, "createMigrationManagerForSourceModel:destinationModel:error:", *(_QWORD *)(v2 + 40), objc_msgSend(*(id *)(v2 + 8), "managedObjectModel"), a2);
    objc_msgSend(v51, "setDestinationConfigurationForCloudKitValidation:", *(_QWORD *)(v2 + 136));
    -[NSStoreMigrationPolicy setMigrationManager:](v2, v51);
    if (!*(_QWORD *)(v2 + 96))
      goto LABEL_86;
    v52 = objc_msgSend((id)objc_opt_class(), "_canMigrateWithMappingModel:", *(_QWORD *)(v2 + 56));
    if ((v52 & 1) != 0)
    {
      v53 = *(void **)(v2 + 16);
      if (!v53)
        goto LABEL_86;
LABEL_68:
      if ((objc_msgSend(*(id *)(v2 + 64), "isEqual:", v53) & 1) == 0)
      {

        *(_QWORD *)(v2 + 64) = v53;
      }
      if ((v5 & 1) != 0)
        objc_msgSend((id)objc_msgSend(-[NSDictionary valueForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes"), "valueForKey:", *(_QWORD *)(v2 + 72)), "pointerValue"), "_figureOutWhereExternalReferencesEndedUpRelativeTo:", v53);
      v56 = (id)objc_msgSend(*(id *)(v2 + 88), "mutableCopy");
      objc_msgSend(v56, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreUnlinkDestroyOption"));
      objc_msgSend(v56, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreForceDestroyOption"));
      if ((v52 & 1) == 0
        && objc_msgSend((id)objc_msgSend(v53, "path"), "hasSuffix:", CFSTR(".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3")))
      {
        *(_QWORD *)buf = 0;
        if ((objc_msgSend(*(id *)(v2 + 8), "_destroyPersistentStoreAtURL:withType:options:error:", v53, *(_QWORD *)(v2 + 72), v56, buf) & 1) == 0)_NSCoreDataLog(1, (uint64_t)CFSTR("(migration) Failed to remove orphaned, partially migrated store file %@: %@"), v57, v58, v59, v60, v61, v62, (uint64_t)v53);
        objc_msgSend(*(id *)(v2 + 8), "removePersistentStore:error:", objc_msgSend(*(id *)(v2 + 8), "persistentStoreForURL:", v53), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend(v53, "path"), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-shm")), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-journal")), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-wal")), 0);
      }
      if (!objc_msgSend((id)v2, "migrateStoreAtURL:withManager:metadata:options:error:", *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 88), a2))
      {
        if ((objc_msgSend(*(id *)(v2 + 16), "isEqual:", v53) & 1) == 0
          && objc_msgSend((id)objc_msgSend(v53, "path"), "hasSuffix:", CFSTR(".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3")))
        {
          if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") < 1)
          {
            objc_msgSend(*(id *)(v2 + 8), "_destroyPersistentStoreAtURL:withType:options:error:", v53, *(_QWORD *)(v2 + 72), v56, 0);
            objc_msgSend(*(id *)(v2 + 8), "removePersistentStore:error:", objc_msgSend(*(id *)(v2 + 8), "persistentStoreForURL:", v53), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend(v53, "path"), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-shm")), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-journal")), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", CFSTR("-wal")), 0);
          }
          else
          {
            _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) leaving incompletely migrated store on disk after automatic migration failure. (%@)"), v65, v66, v67, v68, v69, v70, (uint64_t)v53);
          }
        }
        goto LABEL_86;
      }
      -[NSStoreMigrationPolicy setMigrationManager:](v2, 0);
      v63 = objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", *(_QWORD *)(v2 + 88));
      v64 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", *(_QWORD *)(v2 + 32)), "mutableCopy");
      objc_msgSend(v64, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSPersistentStoreUnlinkDestroyOption"));
      objc_msgSend(v64, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreForceDestroyOption"));
      if ((v52 & 1) != 0
        || (objc_msgSend(*(id *)(v2 + 8), "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", *(_QWORD *)(v2 + 16), v63, v53, v64, *(_QWORD *)(v2 + 72), a2) & 1) != 0)
      {
        v2 = objc_msgSend(*(id *)(v2 + 8), "addPersistentStoreWithType:configuration:URL:options:error:", *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 88), a2);
        goto LABEL_87;
      }
LABEL_86:
      v2 = 0;
      goto LABEL_87;
    }
    v53 = (void *)objc_msgSend((id)objc_opt_class(), "destinationURLForMigrationSourceURL:createDocumentReplacementDirectory:error:", *(_QWORD *)(v2 + 16), 0, a2);
    if (!v53)
      goto LABEL_86;
    if (!objc_msgSend(*(id *)(v2 + 16), "isEqual:", v53))
      goto LABEL_68;
    if (!a2)
      goto LABEL_86;
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v55 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Migration source and destination URLs must be different"), CFSTR("reason"), *(_QWORD *)(v2 + 16), CFSTR("sourceURL"), v53, CFSTR("destinationURL"), 0);
    v27 = objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v55);
LABEL_28:
    v2 = 0;
    *a2 = v27;
LABEL_87:
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v77, v72);
  }
  return v2;
}

@end
