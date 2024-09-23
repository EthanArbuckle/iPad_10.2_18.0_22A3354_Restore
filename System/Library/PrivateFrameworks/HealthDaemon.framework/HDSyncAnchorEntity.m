@implementation HDSyncAnchorEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForSyncStore:(uint64_t)a1
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
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "syncProvenance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("store"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "syncEpoch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("epoch"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D29840];
    v13[0] = v5;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29868], "falsePredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)databaseTable
{
  return CFSTR("sync_anchors");
}

+ (BOOL)prepareSyncAnchorsForEntityIdentifiers:(id)a3 store:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke;
  v18[3] = &unk_1E6CE7C58;
  v19 = v11;
  v20 = v12;
  v21 = v10;
  v22 = a1;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v13, a6, v18);

  return (char)a6;
}

uint64_t __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  HDSyncAnchorMap *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(HDSyncAnchorMap);
  if (+[HDSyncAnchorEntity _getAnchorsForProperty:anchorMap:store:profile:error:](*(_QWORD *)(a1 + 56), CFSTR("received"), v6, *(void **)(a1 + 32), *(void **)(a1 + 40), a3))
  {
    v31 = v5;
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", *(_QWORD *)(a1 + 48));
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke_2;
    v40[3] = &unk_1E6D006F8;
    v30 = v8;
    v41 = v30;
    v10 = v9;
    v42 = v10;
    -[HDSyncAnchorMap enumerateAnchorsAndEntityIdentifiersWithBlock:](v6, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v40);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          +[HDSyncAnchorEntity _predicateForSyncEntityIdentifier:syncStore:](*(_QWORD *)(a1 + 56), *(void **)(*((_QWORD *)&v36 + 1) + 8 * i), *(void **)(a1 + 32));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(*(id *)(a1 + 56), "deleteEntitiesInDatabase:predicate:error:", v7, v16, a3);

          if (!v17)
          {
            v26 = v11;
            v25 = 0;
            v18 = v26;
            v27 = v30;
            v5 = v31;
            goto LABEL_25;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v13)
          continue;
        break;
      }
    }
    v29 = v11;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          -[HDSyncAnchorMap anchorIfPresentForSyncEntityIdentifier:](v6, "anchorIfPresentForSyncEntityIdentifier:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24
            && !objc_msgSend(*(id *)(a1 + 56), "updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:", 0, 0, v23, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), a3))
          {
            v25 = 0;
            goto LABEL_24;
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        v25 = 1;
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v25 = 1;
    }
LABEL_24:
    v27 = v30;
    v5 = v31;
    v26 = v29;
LABEL_25:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (uint64_t)_getAnchorsForProperty:(void *)a3 anchorMap:(void *)a4 store:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_opt_self();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__getAnchorsForProperty_anchorMap_store_profile_error_, v14, CFSTR("HDSyncAnchorEntity.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v13, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke;
  v22[3] = &unk_1E6D0D7A0;
  v26 = v11;
  v27 = v14;
  v23 = v12;
  v24 = v10;
  v25 = v13;
  v16 = v11;
  v17 = v13;
  v18 = v12;
  v19 = objc_msgSend(v14, "performReadTransactionWithHealthDatabase:error:block:", v15, a6, v22);

  return v19;
}

void __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  id v6;

  v6 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (!a3 && (v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

+ (id)_predicateForSyncEntityIdentifier:(void *)a3 syncStore:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  v7 = v5;
  objc_opt_self();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "entityIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("type"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(v7, "schemaIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("main");
    objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("schema"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  +[HDSyncAnchorEntity _predicateForSyncStore:](v6, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (int64_t)syncAnchorOfType:(int64_t)a3 entityIdentifier:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  int v23;
  int64_t v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  _HDSyncAnchorPropertyForType(a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = (void *)objc_opt_self();
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncAnchorForProperty_entityIdentifier_store_profile_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 1087, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifier != nil"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncAnchorForProperty_entityIdentifier_store_profile_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 1088, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

LABEL_3:
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__186;
  v38 = __Block_byref_object_dispose__186;
  v39 = 0;
  objc_msgSend(v17, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__HDSyncAnchorEntity__syncAnchorForProperty_entityIdentifier_store_profile_error___block_invoke;
  v28[3] = &unk_1E6D0D948;
  v33 = v18;
  v20 = v15;
  v29 = v20;
  v21 = v16;
  v30 = v21;
  v32 = &v34;
  v22 = v14;
  v31 = v22;
  v23 = objc_msgSend(v18, "performReadTransactionWithHealthDatabase:error:block:", v19, a7, v28);

  if (v23)
    v24 = objc_msgSend((id)v35[5], "longLongValue");
  else
    v24 = -1;

  _Block_object_dispose(&v34, 8);
  return v24;
}

+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 entityIdentifier:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  double Current;
  uint64_t v19;

  v15 = a8;
  v16 = a6;
  v17 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  _HDSyncAnchorUpdateOptionsForType(a4);
  LOBYTE(a7) = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:profile:error:](Current, (uint64_t)a1, a3, v19, a7, v17, v16, v15, (uint64_t)a9);

  return a7;
}

+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 profile:(uint64_t)a9 error:
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;

  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_opt_self();
  objc_msgSend(v18, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_profile_error___block_invoke;
  v25[3] = &unk_1E6D0D7C8;
  v28 = v19;
  v29 = a3;
  v30 = a1;
  v31 = a4;
  v32 = a5;
  v26 = v16;
  v27 = v17;
  v21 = v17;
  v22 = v16;
  v23 = objc_msgSend(v19, "performWriteTransactionWithHealthDatabase:error:block:", v20, a9, v25);

  return v23;
}

+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 store:(id)a5 updatePolicy:(int64_t)a6 resetInvalid:(BOOL)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  double Current;
  uint64_t v19;
  char v20;

  v15 = a8;
  v16 = a5;
  v17 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  _HDSyncAnchorUpdateOptionsForType(a4);
  v20 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](Current, (uint64_t)a1, v17, v16, v19, a6, a7, v15, (uint64_t)a9);

  return v20;
}

+ (uint64_t)_setAnchorsWithMap:(void *)a3 updateDate:(void *)a4 store:(uint64_t)a5 updateOptions:(uint64_t)a6 updatePolicy:(char)a7 resetInvalid:(void *)a8 profile:(uint64_t)a9 error:
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = (void *)objc_opt_self();
  objc_msgSend(v18, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __112__HDSyncAnchorEntity__setAnchorsWithMap_updateDate_store_updateOptions_updatePolicy_resetInvalid_profile_error___block_invoke;
  v25[3] = &unk_1E6D0D8D0;
  v26 = v17;
  v27 = v16;
  v32 = a7;
  v28 = v19;
  v29 = a1;
  v30 = a5;
  v31 = a6;
  v21 = v16;
  v22 = v17;
  v23 = objc_msgSend(v19, "performWriteTransactionWithHealthDatabase:error:block:", v20, a9, v25);

  return v23;
}

+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 updateDate:(id)a5 entityIdentifier:(id)a6 store:(id)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;

  v17 = a9;
  v18 = a7;
  v19 = a6;
  objc_msgSend(a5, "timeIntervalSinceReferenceDate");
  v21 = v20;
  _HDSyncAnchorUpdateOptionsForType(a4);
  LOBYTE(a8) = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:profile:error:](v21, (uint64_t)a1, a3, v22, a8, v19, v18, v17, (uint64_t)a10);

  return a8;
}

+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 updateDate:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 resetInvalid:(BOOL)a8 profile:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  char v23;

  v17 = a9;
  v18 = a6;
  v19 = a3;
  objc_msgSend(a5, "timeIntervalSinceReferenceDate");
  v21 = v20;
  _HDSyncAnchorUpdateOptionsForType(a4);
  v23 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](v21, (uint64_t)a1, v19, v18, v22, a7, a8, v17, (uint64_t)a10);

  return v23;
}

+ (BOOL)getSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  _HDSyncAnchorPropertyForType(a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = +[HDSyncAnchorEntity _getAnchorsForProperty:anchorMap:store:profile:error:]((uint64_t)a1, v15, v14, v13, v12, (uint64_t)a7);

  return (char)a7;
}

+ (BOOL)getMinimumSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 updatedSince:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  id v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v14, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke;
  v20[3] = &unk_1E6CE9208;
  v24 = a3;
  v25 = a1;
  v21 = v13;
  v22 = v14;
  v23 = v12;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  LOBYTE(a7) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v15, a7, v20);

  return (char)a7;
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = a2;
  _HDSyncAnchorPropertyForType(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSyncAnchorUpdateDatePropertyForType(*(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 64), "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT %@, %@, MIN(%@) FROM %@ sa1 WHERE EXISTS (SELECT * FROM %@ sa2 WHERE (sa1.%@ = sa2.%@) AND (sa1.%@ = sa2.%@) AND (sa2.%@ >= ?)) GROUP BY %@, %@"), CFSTR("schema"), CFSTR("type"), v7, v10, v11, CFSTR("store"), CFSTR("store"), CFSTR("epoch"), CFSTR("epoch"), v8, CFSTR("schema"), CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_2;
  v20[3] = &unk_1E6CE9508;
  v21 = *(id *)(a1 + 32);
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_3;
  v17[3] = &unk_1E6CE8D20;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v13, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v12, a3, v20, v17);

  return v15;
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("main")))
  {

    v3 = 0;
  }
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", v3, HDSQLiteColumnAsInt64());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSyncEntitiesByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", v4);

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "setAnchor:forSyncEntity:", HDSQLiteColumnAsInt64(), v7);

  return 1;
}

+ (BOOL)resetSyncAnchorsOfType:(int64_t)a3 store:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v10 = a4;
  objc_msgSend(a5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke;
  v14[3] = &unk_1E6CF5F78;
  v16 = a1;
  v17 = a3;
  v15 = v10;
  v12 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, a6, v14);

  return (char)a6;
}

BOOL __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSyncAnchorPropertyForType(*(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncAnchorEntity _predicateForSyncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke_2;
  v12[3] = &unk_1E6CE84C8;
  v13 = v6;
  v9 = v6;
  v10 = +[HDSQLiteEntity updateProperties:predicate:database:error:bindingHandler:](HDSyncAnchorEntity, "updateProperties:predicate:database:error:bindingHandler:", v7, v8, v5, a3, v12);

  return v10;
}

void __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke_2()
{
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)resetAllSyncAnchorsOfType:(int64_t)a3 syncProvenances:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSyncAnchorPropertyForType(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("store"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__HDSyncAnchorEntity_resetAllSyncAnchorsOfType_syncProvenances_transaction_error___block_invoke;
  v17[3] = &unk_1E6CE84C8;
  v18 = v12;
  v15 = v12;
  LOBYTE(a6) = +[HDSQLiteEntity updateProperties:predicate:database:error:bindingHandler:](HDSyncAnchorEntity, "updateProperties:predicate:database:error:bindingHandler:", v13, v14, v11, a6, v17);

  return (char)a6;
}

void __82__HDSyncAnchorEntity_resetAllSyncAnchorsOfType_syncProvenances_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)setAcknowledgedAnchorsWithMap:(id)a3 store:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 profile:(id)a7 error:(id *)a8
{
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  double Current;
  char v19;

  if (a5)
    v13 = 3;
  else
    v13 = 2;
  if (a5)
    v14 = 2;
  else
    v14 = 1;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v19 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](Current, (uint64_t)a1, v17, v16, v13, v14, a6, v15, (uint64_t)a8);

  return v19;
}

uint64_t __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  +[HDSyncAnchorEntity _predicateForSyncStore:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("schema");
  v14[1] = CFSTR("type");
  v14[2] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke_2;
  v11[3] = &unk_1E6CF5F50;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v9 = objc_msgSend(v7, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v6, v5, v8, a3, v11);

  return v9;
}

uint64_t __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  MEMORY[0x1BCCAB1D4](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("main")))
  {

    v5 = 0;
  }
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", v5, HDSQLiteColumnAsInt64());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allSyncEntitiesByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", v6);

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "setAnchor:forSyncEntity:", HDSQLiteColumnAsInt64(), v9);

  return 1;
}

+ (BOOL)resetSyncStore:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__HDSyncAnchorEntity_resetSyncStore_profile_error___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __51__HDSyncAnchorEntity_resetSyncStore_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncAnchorEntity _predicateForSyncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queryWithDatabase:predicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteAllEntitiesWithError:", a3);

  return 1;
}

+ (BOOL)enumerateSyncAnchorsForStoreID:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = a4;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC"), CFSTR("epoch"), CFSTR("schema"), CFSTR("type"), CFSTR("next"), CFSTR("acked"), CFSTR("frozen"), CFSTR("received"), CFSTR("validated"), CFSTR("expected"), v13, CFSTR("store"), CFSTR("epoch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke;
  v19[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a3;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke_2;
  v17[3] = &unk_1E6CE82B0;
  v18 = v10;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v14, a5, v19, v17);

  return (char)a5;
}

uint64_t __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  MEMORY[0x1BCCAB1D4](a2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("main")))
  {

    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = HDSQLiteColumnAsInt64();
  v6 = HDSQLiteColumnAsInt64();
  v7 = HDSQLiteColumnAsInt64();
  v8 = HDSQLiteColumnAsInt64();
  v9 = HDSQLiteColumnAsInt64();
  v10 = HDSQLiteColumnAsInt64();
  v11 = HDSQLiteColumnAsInt64();
  v12 = HDSQLiteColumnAsInt64();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, v3, v6, v7, v8, v9, v10, v11, v12);

  return 1;
}

uint64_t __106__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](*(double *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(void **)(a1 + 32), *(void **)(a1 + 40), a2, a3);
}

+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 transaction:(uint64_t)a9 error:
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  void *v34;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t *v63;
  _QWORD v64[5];
  _QWORD v65[4];
  _QWORD v66[3];
  _QWORD aBlock[6];
  _QWORD v68[4];
  __CFString *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  _QWORD v75[17];
  _QWORD v76[4];
  __CFString *v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[4];
  _QWORD v91[4];
  _QWORD v92[4];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  _QWORD v99[21];

  v99[19] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = objc_opt_self();
  if (a3 < 0)
  {
    v36 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HDSyncAnchorIsValid(anchor)"));

    v15 = v36;
  }
  if ((a4 & 0x3F) != 0)
  {
    if (v15)
      goto LABEL_5;
LABEL_16:
    v40 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifier != nil"));

    v15 = v40;
    if (v16)
      goto LABEL_6;
    goto LABEL_17;
  }
  v38 = v15;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options & HDSyncAnchorUpdateOptionsNext) || (options & HDSyncAnchorUpdateOptionsAcked) || (options & HDSyncAnchorUpdateOptionsReceived) || (options & HDSyncAnchorUpdateOptionsFrozen) || (options & HDSyncAnchorUpdateOptionsExpected) || (options & HDSyncAnchorUpdateOptionsValidated)"));

  v15 = v38;
  if (!v38)
    goto LABEL_16;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_17:
  v42 = v15;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v18, CFSTR("HDSyncAnchorEntity.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  v15 = v42;
LABEL_6:
  v48 = v15;
  objc_msgSend(v15, "schemaIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("main");
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  objc_msgSend(v17, "databaseForEntityClass:", objc_opt_class());
  v45 = a3;
  v46 = a4;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__186;
  v97 = __Block_byref_object_dispose__186;
  v98 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x2020000000;
  v92[3] = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v91[3] = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  v90[3] = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x2020000000;
  v89[3] = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v88[3] = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v85[3] = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v84[3] = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v82[3] = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  v24 = MEMORY[0x1E0C809B0];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke;
  v80[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v47 = (void *)v18;
  v80[4] = v18;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_2;
  v76[3] = &unk_1E6CE7C30;
  v25 = v22;
  v77 = v25;
  v26 = v48;
  v78 = v26;
  v27 = v16;
  v79 = v27;
  v75[0] = v24;
  v75[1] = 3221225472;
  v75[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_3;
  v75[3] = &unk_1E6D0D7F0;
  v75[4] = &v93;
  v75[5] = v92;
  v75[6] = v91;
  v75[7] = v90;
  v75[8] = v89;
  v75[9] = v88;
  v75[10] = v87;
  v75[11] = v86;
  v75[12] = v85;
  v75[13] = v84;
  v75[14] = v83;
  v75[15] = v82;
  v75[16] = v81;
  if ((objc_msgSend(v23, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error__lookupKey, a9, v80, v76, v75) & 1) != 0)
  {
    v28 = v17;
    if (v94[5])
    {
      aBlock[0] = v24;
      aBlock[1] = 3221225472;
      aBlock[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_6;
      aBlock[3] = &__block_descriptor_48_e8_q16__0q8l;
      aBlock[4] = a5;
      aBlock[5] = v45;
      v65[0] = v24;
      v65[1] = 3221225472;
      v65[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_7;
      v65[3] = &unk_1E6D0D880;
      v66[1] = v46;
      v29 = _Block_copy(aBlock);
      v66[0] = v29;
      *(double *)&v66[2] = a1;
      v64[0] = v24;
      v64[1] = 3221225472;
      v64[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_8;
      v64[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v64[4] = v47;
      v49[0] = v24;
      v49[1] = 3221225472;
      v49[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_9;
      v49[3] = &unk_1E6D0D8A8;
      v30 = _Block_copy(v65);
      v50 = v30;
      v51 = v92;
      v52 = v91;
      v53 = v90;
      v54 = v89;
      v55 = v88;
      v56 = v87;
      v57 = v86;
      v58 = v85;
      v59 = v84;
      v60 = v83;
      v61 = v82;
      v62 = v81;
      v63 = &v93;
      v31 = objc_msgSend(v23, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error__updateKey, a9, v64, v49, 0);

      v32 = (id *)v66;
    }
    else
    {
      v99[0] = CFSTR("next");
      v99[1] = CFSTR("next_updated_date");
      v99[2] = CFSTR("acked");
      v99[3] = CFSTR("acked_updated_date");
      v99[4] = CFSTR("frozen");
      v99[5] = CFSTR("frozen_updated_date");
      v99[6] = CFSTR("received");
      v99[7] = CFSTR("received_updated_date");
      v99[8] = CFSTR("expected");
      v99[9] = CFSTR("expected_updated_date");
      v99[10] = CFSTR("validated");
      v99[11] = CFSTR("validated_updated_date");
      v99[12] = CFSTR("schema");
      v99[13] = CFSTR("type");
      v99[14] = CFSTR("store");
      v99[15] = CFSTR("epoch");
      v99[16] = CFSTR("local_version");
      v99[17] = CFSTR("received_version");
      v99[18] = CFSTR("requested_version");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_4;
      v68[3] = &unk_1E6D0D838;
      v72 = v46;
      v73 = v45;
      v74 = a1;
      v69 = v25;
      v70 = v26;
      v71 = v27;
      objc_msgSend(v47, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v23, v29, a9, v68);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v94[5];
      v94[5] = v33;

      v31 = v94[5] != 0;
      v32 = (id *)&v69;
      v30 = v70;
    }

  }
  else
  {
    v31 = 0;
    v28 = v17;
  }

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v89, 8);
  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v92, 8);
  _Block_object_dispose(&v93, 8);

  return v31;
}

id __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT ROWID, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), CFSTR("next"), CFSTR("next_updated_date"), CFSTR("acked"), CFSTR("acked_updated_date"), CFSTR("frozen"), CFSTR("frozen_updated_date"), CFSTR("received"), CFSTR("received_updated_date"), CFSTR("expected"), CFSTR("expected_updated_date"), CFSTR("validated"), CFSTR("validated_updated_date"), v2, CFSTR("schema"), CFSTR("type"), CFSTR("store"),
    CFSTR("epoch"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  HDSyncAnchorEntity *v4;
  uint64_t v5;
  void *v6;

  v4 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncAnchorEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 2);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 4);
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[10] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 6);
  *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[12] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 8);
  *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[14] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 10);
  *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[16] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 12);
  return 0;
}

void __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (**v5)(void *, _QWORD);
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_5;
  v6[3] = &__block_descriptor_64_e8_v16__0q8l;
  v4 = *(_QWORD *)(a1 + 64);
  v6[4] = *(_QWORD *)(a1 + 56);
  v6[5] = a2;
  v6[6] = v4;
  v6[7] = *(_QWORD *)(a1 + 72);
  v5 = (void (**)(void *, _QWORD))_Block_copy(v6);
  v5[2](v5, 0);
  v5[2](v5, 1);
  v5[2](v5, 2);
  v5[2](v5, 3);
  v5[2](v5, 4);
  v5[2](v5, 5);
  MEMORY[0x1BCCAB144](a2, CFSTR("schema"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("type"), objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  MEMORY[0x1BCCAB114](a2, CFSTR("store"), objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  MEMORY[0x1BCCAB114](a2, CFSTR("epoch"), objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
  MEMORY[0x1BCCAB114](a2, CFSTR("local_version"), 0);
  MEMORY[0x1BCCAB114](a2, CFSTR("received_version"), 0);
  MEMORY[0x1BCCAB120](a2, CFSTR("requested_version"));

}

void __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_5(_QWORD *a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  id v11;

  _HDSyncAnchorPropertyForType(a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _HDSyncAnchorUpdateDatePropertyForType(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  _HDSyncAnchorUpdateOptionsForType(a2);
  v7 = v6;
  v8 = a1[5];
  if ((v7 & v5) != 0)
  {
    MEMORY[0x1BCCAB114](v8, v11, a1[6]);
    v9 = a1[5];
    v10.n128_u64[0] = a1[7];
  }
  else
  {
    MEMORY[0x1BCCAB114](v8, v11, 0);
    v9 = a1[5];
    v10.n128_u64[0] = 0;
  }
  MEMORY[0x1BCCAB0F0](v9, v4, v10);

}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v2 == 2)
      return *(_QWORD *)(a1 + 40);
    if (v2 == 1)
    {
      if (*(_QWORD *)(a1 + 40) <= a2)
        return a2;
      else
        return *(_QWORD *)(a1 + 40);
    }
    return a2;
  }
  if (*(_QWORD *)(a1 + 40) >= a2)
    return a2;
  else
    return *(_QWORD *)(a1 + 40);
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_7(double *a1, sqlite3_stmt *a2, int a3, unint64_t a4, sqlite3_int64 a5, double a6)
{
  uint64_t v11;
  uint64_t v12;
  sqlite3_int64 v13;
  int v14;
  double v15;
  sqlite3_stmt *v16;

  v11 = *((_QWORD *)a1 + 5);
  _HDSyncAnchorUpdateOptionsForType(a4);
  if ((v12 & v11) != 0)
  {
    v13 = (*(uint64_t (**)(void))(*((_QWORD *)a1 + 4) + 16))();
    sqlite3_bind_int64(a2, a3, v13);
    v14 = a3 + 1;
    v15 = a1[6];
    v16 = a2;
  }
  else
  {
    sqlite3_bind_int64(a2, a3, a5);
    v14 = a3 + 1;
    v16 = a2;
    v15 = a6;
  }
  return sqlite3_bind_double(v16, v14, v15);
}

id __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ? WHERE ROWID = ?"), v2, CFSTR("next"), CFSTR("next_updated_date"), CFSTR("acked"), CFSTR("acked_updated_date"), CFSTR("frozen"), CFSTR("frozen_updated_date"), CFSTR("received"), CFSTR("received_updated_date"), CFSTR("expected"), CFSTR("expected_updated_date"), CFSTR("validated"), CFSTR("validated_updated_date"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_9(_QWORD *a1, sqlite3_stmt *a2)
{
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[6] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[8] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[10] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[12] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[14] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[16] + 8) + 24));
  return sqlite3_bind_int64(a2, 13, objc_msgSend(*(id *)(*(_QWORD *)(a1[17] + 8) + 40), "persistentID"));
}

uint64_t __112__HDSyncAnchorEntity__setAnchorsWithMap_updateDate_store_updateOptions_updatePolicy_resetInvalid_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "orderedSyncEntities", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
    goto LABEL_14;
  v8 = v7;
  v9 = *(_QWORD *)v20;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "syncEntityIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(*(id *)(a1 + 40), "anchorForSyncEntityClass:", v11);
      v14 = v13;
      if (*(_BYTE *)(a1 + 80))
      {
        v14 = v13 & ~(v13 >> 63);
      }
      else if (v13 < 0)
      {

        goto LABEL_10;
      }
      v15 = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](*(double *)(a1 + 56), *(_QWORD *)(a1 + 48), v14, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v12, *(void **)(a1 + 32), v5, a3);

      if (!v15)
      {
        v17 = 0;
        goto LABEL_16;
      }
LABEL_10:
      ++v10;
    }
    while (v8 != v10);
    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v8 = v16;
  }
  while (v16);
LABEL_14:
  v17 = 1;
LABEL_16:

  return v17;
}

+ (BOOL)resetNextAnchorsIfNeededForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v10 = a3;
  objc_msgSend(a4, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__HDSyncAnchorEntity_resetNextAnchorsIfNeededForStore_profile_minimumElapsedTime_error___block_invoke;
  v14[3] = &unk_1E6CF5F78;
  v15 = v10;
  v16 = a1;
  v17 = a5;
  v12 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, a6, v14);

  return (char)a6;
}

uint64_t __88__HDSyncAnchorEntity_resetNextAnchorsIfNeededForStore_profile_minimumElapsedTime_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CFAbsoluteTime Current;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  CFAbsoluteTime v18;
  uint64_t v19;
  _QWORD v20[5];

  v5 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error_, v10, CFSTR("HDSyncAnchorEntity.m"), 751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v20[4] = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke_2;
  v16[3] = &unk_1E6CE8518;
  v18 = Current;
  v19 = v7;
  v17 = v8;
  v12 = v8;
  v13 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error__updateKey, a3, v20, v16, 0);

  return v13;
}

id __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = %@ WHERE %@ < %@ AND %@ < ? AND %@ < ? AND %@ = ? AND %@ = ?"), v2, CFSTR("next"), CFSTR("acked"), CFSTR("acked"), CFSTR("next"), CFSTR("acked_updated_date"), CFSTR("next_updated_date"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (uint64_t)(*(double *)(a1 + 40) - *(double *)(a1 + 48)));
  sqlite3_bind_int64(a2, 2, (uint64_t)(*(double *)(a1 + 40) - *(double *)(a1 + 48)));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "syncProvenance"));
  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 32), "syncEpoch"));
}

id __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("local_version"), CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

id __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = %@, %@ = ?, %@ = %@, %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("local_version"), CFSTR("received"), CFSTR("validated"), CFSTR("received_updated_date"), CFSTR("expected"), CFSTR("validated"), CFSTR("expected_updated_date"), CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 64));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 56));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 7, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

id __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("local_version"), CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

+ (BOOL)updateLocalVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  CFAbsoluteTime Current;
  id v34;
  id v35;
  __CFString *v36;
  char v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  int v44;
  NSObject *v45;
  int v46;
  int v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  __CFString *v53;
  id v54;
  id v55;
  __CFString *v56;
  void *v58;
  __CFString *v59;
  void *v60;
  id v61;
  id v62;
  __CFString *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v69;
  _QWORD v70[7];
  _QWORD v71[4];
  __CFString *v72;
  id v73;
  id v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  id (*v90)(uint64_t);
  void *v91;
  uint64_t v92;
  _BYTE buf[24];
  __int128 v94;
  id v95;
  id v96;
  CFAbsoluteTime v97;
  int v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncAnchorEntity.m"), 905, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v12, "schemaIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("main");
  if (v15)
    v17 = (__CFString *)v15;
  v18 = v17;

  objc_msgSend(v14, "databaseForEntityClass:", objc_opt_class());
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = -1;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = -1;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
  v75[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v75[4] = a1;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v71[3] = &unk_1E6CE7C30;
  v20 = v18;
  v72 = v20;
  v21 = v12;
  v73 = v21;
  v22 = v13;
  v74 = v22;
  v70[0] = v19;
  v70[1] = 3221225472;
  v70[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_3;
  v70[3] = &unk_1E6CF1808;
  v70[4] = &v84;
  v70[5] = &v80;
  v70[6] = &v76;
  if ((objc_msgSend(v69, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateLocalVersion_entityIdentifier_store_transaction_error__lookupKey, a7, v75, v71, v70) & 1) != 0)
  {
    v23 = *((_DWORD *)v85 + 6);
    if (v23 < 0)
    {
      v38 = v21;
      v66 = v22;
      v39 = v14;
      v40 = objc_opt_self();
      objc_msgSend(v38, "schemaIdentifier");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      v43 = CFSTR("main");
      if (v41)
        v43 = (__CFString *)v41;
      v63 = v43;

      objc_msgSend(v39, "databaseForEntityClass:", objc_opt_class());
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](0.0, v40, 0, 4, 1, v38, v66, v39, (uint64_t)a7);

      if (v44)
      {
        v88 = v19;
        v89 = 3221225472;
        v90 = __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
        v91 = &__block_descriptor_40_e15___NSString_8__0l;
        v92 = v40;
        *(_QWORD *)buf = v19;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
        *(_QWORD *)&v94 = &unk_1E6D0D8F8;
        LODWORD(v97) = a3;
        *((_QWORD *)&v94 + 1) = v63;
        v95 = v38;
        v96 = v66;
        v37 = objc_msgSend(v60, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_initializeLocalVersion_entityIdentifier_store_transaction_error__setInitialKey, a7, &v88, buf, 0);

      }
      else
      {
        v37 = 0;
      }

    }
    else if (v23 >= a3)
    {
      v37 = 1;
    }
    else if (v23 >= *((_DWORD *)v81 + 6))
    {
      _HKInitializeLogging();
      v45 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v46 = *((_DWORD *)v85 + 6);
        v47 = *((_DWORD *)v81 + 6);
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v46;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        LOWORD(v94) = 1024;
        *(_DWORD *)((char *)&v94 + 2) = v47;
        _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Local entity sync version change (%d -> %d); no anchor reset needed (highest received version: %d)",
          buf,
          0x1Eu);
      }
      v67 = v21;
      v61 = v22;
      v48 = v14;
      v49 = objc_opt_self();
      objc_msgSend(v67, "schemaIdentifier");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      v52 = CFSTR("main");
      if (v50)
        v52 = (__CFString *)v50;
      v53 = v52;

      objc_msgSend(v48, "databaseForEntityClass:", objc_opt_class());
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = v19;
      v89 = 3221225472;
      v90 = __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
      v91 = &__block_descriptor_40_e15___NSString_8__0l;
      v92 = v49;
      *(_QWORD *)buf = v19;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
      *(_QWORD *)&v94 = &unk_1E6D0D8F8;
      LODWORD(v97) = a3;
      *((_QWORD *)&v94 + 1) = v53;
      v95 = v67;
      v96 = v61;
      v54 = v61;
      v55 = v67;
      v56 = v53;
      v37 = objc_msgSend(v64, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error__updateKey, a7, &v88, buf, 0);

    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *((_DWORD *)v85 + 6);
        v26 = v77[3];
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v25;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        LOWORD(v94) = 2048;
        *(_QWORD *)((char *)&v94 + 2) = v26;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Local entity sync version change (%d -> %d); resetting received and expected anchors to %lld",
          buf,
          0x22u);
      }
      v27 = v21;
      v62 = v22;
      v28 = v14;
      v29 = objc_opt_self();
      objc_msgSend(v27, "schemaIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = CFSTR("main");
      if (v30)
        v32 = (__CFString *)v30;
      v59 = v32;

      objc_msgSend(v28, "databaseForEntityClass:", objc_opt_class());
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      Current = CFAbsoluteTimeGetCurrent();
      v88 = v19;
      v89 = 3221225472;
      v90 = __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
      v91 = &__block_descriptor_40_e15___NSString_8__0l;
      v92 = v29;
      *(_QWORD *)buf = v19;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
      *(_QWORD *)&v94 = &unk_1E6D0D920;
      v98 = a3;
      v97 = Current;
      *((_QWORD *)&v94 + 1) = v59;
      v95 = v27;
      v96 = v62;
      v34 = v62;
      v35 = v27;
      v36 = v59;
      v37 = objc_msgSend(v65, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error__updateKey, a7, &v88, buf, 0);

    }
  }
  else
  {
    v37 = 0;
  }

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  return v37;
}

id __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), CFSTR("local_version"), CFSTR("received_version"), CFSTR("validated"), v2, CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

uint64_t __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_3(_QWORD *a1)
{
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

+ (BOOL)updateReceivedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  __CFString *v23;
  char v24;
  void *v26;
  _QWORD v27[4];
  __CFString *v28;
  id v29;
  id v30;
  int v31;
  _QWORD v32[5];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncAnchorEntity.m"), 984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v13, "schemaIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("main");
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  objc_msgSend(v15, "databaseForEntityClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v32[4] = a1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v27[3] = &unk_1E6D0D8F8;
  v31 = a3;
  v28 = v19;
  v29 = v13;
  v30 = v14;
  v21 = v14;
  v22 = v13;
  v23 = v19;
  v24 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateReceivedVersion_entityIdentifier_store_transaction_error__updateKey, a7, v32, v27, 0);

  return v24;
}

id __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ < ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("received_version"), CFSTR("received_version"), CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

+ (BOOL)getRequestedVersion:(id *)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  id v23;
  id v24;
  char v25;
  char v26;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[4];
  __CFString *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncAnchorEntity.m"), 1016, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v13, "schemaIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("main");
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__186;
  v39 = __Block_byref_object_dispose__186;
  v40 = 0;
  objc_msgSend(v15, "databaseForEntityClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v34[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v34[4] = a1;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v30[3] = &unk_1E6CE7C30;
  v22 = v19;
  v31 = v22;
  v23 = v13;
  v32 = v23;
  v24 = v14;
  v33 = v24;
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_3;
  v29[3] = &unk_1E6CE8540;
  v29[4] = &v35;
  v25 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &getRequestedVersion_entityIdentifier_store_transaction_error__lookupKey, a7, v34, v30, v29);
  v26 = v25 ^ 1;
  if (!a3)
    v26 = 1;
  if ((v26 & 1) == 0)
    *a3 = objc_retainAutorelease((id)v36[5]);

  _Block_object_dispose(&v35, 8);
  return v25;
}

id __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), CFSTR("requested_version"), v2, CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

uint64_t __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)updateRequestedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  __CFString *v23;
  char v24;
  void *v26;
  _QWORD v27[4];
  __CFString *v28;
  id v29;
  id v30;
  int v31;
  _QWORD v32[5];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncAnchorEntity.m"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

  }
  objc_msgSend(v13, "schemaIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("main");
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  objc_msgSend(v15, "databaseForEntityClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v32[4] = a1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v27[3] = &unk_1E6D0D8F8;
  v31 = a3;
  v28 = v19;
  v29 = v13;
  v30 = v14;
  v21 = v14;
  v22 = v13;
  v23 = v19;
  v24 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateRequestedVersion_entityIdentifier_store_transaction_error__updateKey, a7, v32, v27, 0);

  return v24;
}

id __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("requested_version"), CFSTR("schema"), CFSTR("type"), CFSTR("store"), CFSTR("epoch"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 40), "entityIdentifier"));
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "syncProvenance"));
  return sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 48), "syncEpoch"));
}

uint64_t __82__HDSyncAnchorEntity__syncAnchorForProperty_entityIdentifier_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncAnchorEntity _predicateForSyncEntityIdentifier:syncStore:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32), *(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "propertyValueForAnyInDatabase:property:predicate:error:", v5, *(_QWORD *)(a1 + 48), v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E6DFE7B0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);

  return 1;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_94;
}

+ (id)uniquedColumns
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("store");
  v3[1] = CFSTR("epoch");
  v3[2] = CFSTR("type");
  v3[3] = CFSTR("schema");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
