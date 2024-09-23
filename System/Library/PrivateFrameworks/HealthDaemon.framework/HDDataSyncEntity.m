@implementation HDDataSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  if (a3 < 12)
  {
    v12 = v5;
    v13 = objc_opt_class();
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v12;
    v8 = 2;
  }
  else
  {
    v14 = v5;
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v14;
    v8 = 3;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableObjectCollection *v4;

  v3 = a3;
  v4 = -[HDCodableObjectCollection initWithData:]([HDCodableObjectCollection alloc], "initWithData:", v3);

  return v4;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDDataSyncUtilities insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", a3, a1, a4, a5, a6);
}

+ (id)objectsFromCodableObjectsInCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "codableObjectsFromObjectCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKDefaultObjectValidationConfigurationIgnoringAllOptions();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v15 = v4;
        v16 = v6;
        HKWithAutoreleasePool();
        v9 = v12;

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v6;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (Class)healthEntityClass
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)supportsDateBasedSharding
{
  return 1;
}

+ (id)_predicateForSyncSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D29848];
  objc_msgSend(a3, "syncPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedSyncProvenances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doesNotContainPredicateWithProperty:values:", CFSTR("data_provenances.sync_provenance"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "additionalPredicateForEnumeration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  end = a4.end;
  start = a4.start;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_msgSend(a1, "healthEntityClass");
  objc_msgSend(a1, "_predicateForSyncSession:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v16, "generateSyncObjectsForSession:syncEntityClass:predicate:syncAnchorRange:profile:messageHandler:error:", v15, a1, v17, start, end, v14, v13, a7);

  return (char)a7;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;

  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(a1, "healthEntityClass");
  objc_msgSend(a1, "_predicateForSyncSession:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v13, v11, v14, a6);
  return v15;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    v18 = 1;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v14);
      if (!objc_msgSend(a1, "_insertObjectsFromCodableObjectCollection:syncStore:profile:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19), v12, v13, a7, (_QWORD)v21))break;
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

uint64_t __58__HDDataSyncEntity_objectsFromCodableObjectsInCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 56), "_objectWithCodable:collection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_validateWithConfiguration:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      _HKInitializeLogging();
      v5 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v8 = 138412546;
        v9 = v6;
        v10 = 2114;
        v11 = v4;
        _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Codable object %@ failed validation: %{public}@", (uint8_t *)&v8, 0x16u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    }

  }
  return 1;
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v12 = a6;
  +[HDDataSyncEntity _pruningPredicateWithDate:profile:anchor:]((uint64_t)a1, a5, v12, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v19 = 0;
    objc_msgSend(v12, "dataManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = 0;
    v15 = objc_msgSend(v14, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", objc_msgSend(a1, "healthEntityClass"), v13, a4, &v19, 0, 0, v18, 0, a7);

    v16 = 0;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = &unk_1E6DFE948;
  }

  return v16;
}

+ (id)_pruningPredicateWithDate:(void *)a3 profile:(void *)a4 anchor:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_opt_self();
  objc_msgSend(v9, "_basePruningPredicateForDate:profile:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(v9, "_predicateForSyncSession:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compoundPredicateWithPredicate:otherPredicate:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      HDDataEntityPredicateForObjectsAfterAnchor((uint64_t)v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D29890];
      objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "compoundPredicateWithPredicate:otherPredicate:", v13, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)unitTest_pruningPredicateForDate:(id)a3 profile:(id)a4
{
  return +[HDDataSyncEntity _pruningPredicateWithDate:profile:anchor:]((uint64_t)a1, a3, a4, 0);
}

@end
