@implementation _PFPersistentHistoryModel

+ (unint64_t)_maxCountOfTombstonesInModel:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (a2)
    a2 = (_QWORD *)a2[5];
  v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(a2);
      v8 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * i));
      if (objc_msgSend(v8, "count", (_QWORD)v10) > v5)
        v5 = objc_msgSend(v8, "count");

    }
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

+ (id)_retainedTombstonesForEntity:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = objc_opt_self();
  v4 = (void *)MEMORY[0x18D76B4E4](v3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  while (1)
  {
    while (!a2)
      __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(0, v5);
    v6 = a2[20];
    __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(a2, v5);
    if (!v6)
      break;
    a2 = (_QWORD *)a2[20];
  }
  v7 = (id)objc_msgSend(v5, "array");

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)ancillaryModelNamespace
{
  return CFSTR("PersistentHistory");
}

+ (void)createModelsWithTombstoneCount:(uint64_t)a1 andOptions:(uint64_t)a2
{
  uint64_t v3;
  NSEntityDescription *v4;
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSEntityDescription *v13;
  void *v14;
  uint64_t v15;
  NSAttributeDescription *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSFetchIndexElementDescription *v21;
  NSFetchIndexDescription *v22;
  NSFetchIndexDescription *v23;
  NSFetchIndexElementDescription *v24;
  NSFetchIndexDescription *v25;
  NSFetchIndexDescription *v26;
  id v27;
  NSSQLModel *v28;
  uint64_t v29;
  void *v30;
  NSEntityDescription *v31;
  uint64_t v32;
  void *context;
  NSEntityDescription *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[2];
  NSFetchIndexElementDescription *v50;
  NSFetchIndexElementDescription *v51;
  _QWORD v52[11];
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  context = (void *)MEMORY[0x18D76B4E4](v3);
  if (!_historyModelCache)
    _historyModelCache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!_historySQLModelCache)
    _historySQLModelCache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(NSEntityDescription);
  v5 = objc_alloc_init(NSEntityDescription);
  v6 = objc_alloc_init(NSEntityDescription);
  v7 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("BUNDLEIDTS"));
  objc_msgSend(v7, "setDestinationEntity:", v6);
  v47 = v7;
  objc_msgSend(v7, "setMaxCount:", 1);
  v8 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("PROCESSIDTS"));
  objc_msgSend(v8, "setDestinationEntity:", v6);
  v46 = v8;
  objc_msgSend(v8, "setMaxCount:", 1);
  v9 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("CONTEXTNAMETS"));
  objc_msgSend(v9, "setDestinationEntity:", v6);
  v45 = v9;
  objc_msgSend(v9, "setMaxCount:", 1);
  v10 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("AUTHORTS"));
  objc_msgSend(v10, "setDestinationEntity:", v6);
  v44 = v10;
  objc_msgSend(v10, "setMaxCount:", 1);
  v11 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("NAME"), 700);
  -[NSEntityDescription setName:](v6, "setName:", CFSTR("TRANSACTIONSTRING"));
  v55[0] = v11;
  -[NSEntityDescription setProperties:](v6, "setProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1));
  v30 = v11;
  v53 = objc_msgSend(v11, "name");
  v54 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v31 = v6;
  -[NSEntityDescription setUniquenessConstraints:](v6, "setUniquenessConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1));
  v43 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("BUNDLEID"), 700);
  v42 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("PROCESSID"), 700);
  v41 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("CONTEXTNAME"), 700);
  v40 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("AUTHOR"), 700);
  v39 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("QUERYGEN"), 1000);
  v38 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("TIMESTAMP"), 500);
  v34 = v4;
  -[NSEntityDescription setName:](v4, "setName:", CFSTR("TRANSACTION"));
  v37 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("ENTITY"), 300);
  v36 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("ENTITYPK"), 300);
  v35 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("CHANGETYPE"), 100);
  v12 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("COLUMNS"), 1000);
  v13 = v5;
  -[NSEntityDescription setName:](v5, "setName:", CFSTR("CHANGE"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)a2);
  v32 = a2;
  if ((int)a2 >= 1)
  {
    v15 = 0;
    do
    {
      v16 = [NSAttributeDescription alloc];
      v17 = -[NSAttributeDescription _initWithName:type:](v16, "_initWithName:type:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("TOMBSTONE"), v15), 1000);
      objc_msgSend(v14, "addObject:", v17);

      ++v15;
    }
    while ((int)a2 != v15);
  }
  v18 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("CHANGES"));
  objc_msgSend(v18, "setDeleteRule:", 2);
  v19 = -[NSRelationshipDescription _initWithName:]([NSRelationshipDescription alloc], "_initWithName:", CFSTR("TRANSACTIONID"));
  objc_msgSend(v18, "setInverseRelationship:", v19);
  objc_msgSend(v18, "setDestinationEntity:", v5);
  objc_msgSend(v19, "setInverseRelationship:", v18);
  objc_msgSend(v19, "setDestinationEntity:", v34);
  objc_msgSend(v19, "setMaxCount:", 1);
  objc_msgSend(v19, "setMinCount:", 1);
  v52[0] = v43;
  v52[1] = v42;
  v52[2] = v41;
  v52[3] = v40;
  v52[4] = v47;
  v52[5] = v46;
  v52[6] = v45;
  v52[7] = v10;
  v52[8] = v38;
  v52[9] = v39;
  v52[10] = v18;
  -[NSEntityDescription setProperties:](v34, "setProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 11));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v37, v36, v35, v12, 0);
  objc_msgSend(v20, "addObjectsFromArray:", v14);
  objc_msgSend(v20, "addObject:", v19);
  -[NSEntityDescription setProperties:](v5, "setProperties:", v20);
  v21 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", v38, 0);
  v22 = [NSFetchIndexDescription alloc];
  v51 = v21;
  v23 = -[NSFetchIndexDescription initWithName:elements:](v22, "initWithName:elements:", CFSTR("TransactionTimestampIndex"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1));
  v24 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", v40, 0);
  v25 = [NSFetchIndexDescription alloc];
  v50 = v24;
  v26 = -[NSFetchIndexDescription initWithName:elements:](v25, "initWithName:elements:", CFSTR("TransactionAuthorIndex"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1));
  v49[0] = v26;
  v49[1] = v23;
  -[NSEntityDescription setIndexes:](v34, "setIndexes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2));

  -[NSEntityDescription _flattenProperties](v34, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v34, "_createCachesAndOptimizeState");
  -[NSEntityDescription _flattenProperties](v13, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v13, "_createCachesAndOptimizeState");
  -[NSEntityDescription _flattenProperties](v31, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v31, "_createCachesAndOptimizeState");
  v48[0] = v34;
  v48[1] = v13;
  v48[2] = v31;
  v27 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3));
  objc_msgSend(v27, "_setModelsReferenceIDOffset:", +[_PFPersistentHistoryModel ancillaryEntityOffset](_PFPersistentHistoryModel, "ancillaryEntityOffset"));
  objc_msgSend(v27, "_setIsEditable:", 0);
  v28 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v27, 0);
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
  objc_msgSend((id)_historyModelCache, "setObject:forKey:", v27, v29);
  objc_msgSend((id)_historySQLModelCache, "setObject:forKey:", v28, v29);

  objc_autoreleasePoolPop(context);
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16000;
}

+ (unint64_t)ancillaryEntityCount
{
  return 3;
}

+ (id)newPersistentHistorySQLModelForSQLModel:(uint64_t)a1 options:(_QWORD *)a2
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  objc_opt_self();
  v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  os_unfair_lock_lock_with_options();
  if (!objc_msgSend((id)_historySQLModelCache, "objectForKey:", v4))
    +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]((uint64_t)_PFPersistentHistoryModel, v3);
  v5 = (id)objc_msgSend((id)_historySQLModelCache, "objectForKey:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
  return v5;
}

+ (id)newPersistentHistoryManagedObjectModelForSQLModel:(uint64_t)a1 options:(_QWORD *)a2
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v8;

  objc_opt_self();
  v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2);
  if (v3 >= 0x65)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersistentHistoryTrackingKey only supports a max of 100 tombstones per entity in the Model"), +[_PFPersistentHistoryModel _entitiesWithTooManyTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2));
    objc_exception_throw(v8);
  }
  v4 = v3;
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  os_unfair_lock_lock_with_options();
  if (!objc_msgSend((id)_historyModelCache, "objectForKey:", v5))
    +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]((uint64_t)_PFPersistentHistoryModel, v4);
  v6 = (id)objc_msgSend((id)_historyModelCache, "objectForKey:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
  return v6;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    objc_opt_self();
}

+ (void)_entitiesWithTooManyTombstonesInModel:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  id v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (a2)
    a2 = (_QWORD *)a2[5];
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a2);
        v8 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v8);
        v10 = objc_msgSend(v9, "count", (_QWORD)v12);
        if (v10 >= 0x65)
          objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10), objc_msgSend(v8, "name"));

      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v3;
}

+ (void)resetCaches
{
  objc_opt_self();
  os_unfair_lock_lock_with_options();

  _historySQLModelCache = 0;
  _historyModelCache = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
}

+ (void)_invalidateStaticCaches
{
  +[_PFPersistentHistoryModel resetCaches]();
}

+ (uint64_t)_hasTombstonesInUserInfo:(uint64_t)a1
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a2);
        v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes"));
        if (v7)
        {
          v8 = v7;
          if (objc_msgSend(v7, "isNSString"))
          {
            if (objc_msgSend(v8, "length"))
              return 1;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

+ (uint64_t)_tombstonesColumnsForEntity:(uint64_t)a1
{
  id v3;
  uint64_t v4;

  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (!a2)
    goto LABEL_3;
  while (*(_QWORD *)(a2 + 160))
  {
    do
    {
LABEL_3:
      __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
      a2 = objc_msgSend((id)a2, "rootEntity");
    }
    while (!a2);
  }
  __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
  v4 = objc_msgSend(v3, "array");

  return v4;
}

@end
